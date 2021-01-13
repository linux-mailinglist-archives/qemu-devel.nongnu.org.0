Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D749A2F4415
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 06:48:29 +0100 (CET)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzZ1A-0004vS-H9
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 00:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kzYzX-0004C4-M1; Wed, 13 Jan 2021 00:46:47 -0500
Received: from relay68.bu.edu ([128.197.228.73]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kzYzV-0004kq-K8; Wed, 13 Jan 2021 00:46:46 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10D5jk1O031372
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 13 Jan 2021 00:45:49 -0500
Date: Wed, 13 Jan 2021 00:45:46 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Subject: Re: [PATCH] hw/scsi/megasas: check for NULL frame in
 megasas_command_cancelled()
Message-ID: <20210113054546.mbbx2kvoxwwlqdxe@mozz.bu.edu>
References: <20201224175441.67538-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224175441.67538-1-mcascell@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cwmyung@snu.ac.kr, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 hare@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like one reported by OSS-Fuzz:
Here's a reproducer

cat << EOF | ./qemu-system-i386 -qtest stdio -display none \
-machine q35,accel=qtest -m 512M  -nodefaults \
-device megasas -device scsi-cd,drive=null0 \
-blockdev driver=null-co,read-zeroes=on,node-name=null0 
outl 0xcf8 0x80000801
outl 0xcfc 0x15000000
outl 0xcf8 0x80000817
outl 0xcfc 0x1e0000
write 0x40 0x1 0x01
write 0x47 0x1 0x03
write 0x50 0x1 0x12
write 0x55 0x1 0x10
write 0x6a 0x1 0x20
write 0x70 0x1 0x10
write 0x7b 0x1 0x10
write 0x7f 0x1 0x10
write 0x86 0x1 0x10
write 0x8b 0x1 0x10
outb 0x1e40 0x40
write 0x1a 0x1 0x0
write 0x6a000f 0x1 0x0
outb 0x1e40 0x0
outl 0x1e40 0x0
write 0x6f1 0x1 0x00
write 0x6f9 0x1 0x00
write 0x6fd 0x1 0x01
write 0x701 0x1 0x00
write 0x705 0x1 0x06
write 0x730 0x1 0x00
write 0x738 0x1 0x00
write 0x73c 0x1 0x01
write 0x740 0x1 0x00
write 0x744 0x1 0x06
write 0x75c 0x1 0x00
write 0x760 0x1 0x01
write 0x76f 0x1 0x00
write 0x770 0x1 0x20
write 0x77c 0x1 0x20
write 0x780 0x1 0x00
write 0x79b 0x1 0x00
write 0x79f 0x1 0x01
write 0x7ae 0x1 0x00
write 0x7af 0x1 0x20
write 0x7bb 0x1 0x20
write 0x7bf 0x1 0x00
write 0x7cf 0x1 0x10
write 0x7db 0x1 0x00
write 0x7df 0x1 0x20
write 0x7ee 0x1 0x20
write 0x7ef 0x1 0x06
write 0x7fb 0x1 0x10
write 0x7ff 0x1 0x00
outb 0x1e40 0x0
outl 0x1e1f 0x40000200
EOF

-Alex

On 201224 1854, Mauro Matteo Cascella wrote:
> Ensure that 'cmd->frame' is not NULL before accessing the 'header' field.
> This check prevents a potential NULL pointer dereference issue.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1910346
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> ---
>  hw/scsi/megasas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 1a5fc5857d..77510e120c 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -1893,7 +1893,7 @@ static void megasas_command_cancelled(SCSIRequest *req)
>  {
>      MegasasCmd *cmd = req->hba_private;
>  
> -    if (!cmd) {
> +    if (!cmd || !cmd->frame) {
>          return;
>      }
>      cmd->frame->header.cmd_status = MFI_STAT_SCSI_IO_FAILED;
> -- 
> 2.29.2
> 
> 

