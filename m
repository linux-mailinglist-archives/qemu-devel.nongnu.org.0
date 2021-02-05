Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8E310D92
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:05:06 +0100 (CET)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83bV-0000az-2h
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l83Zd-0007cl-9S; Fri, 05 Feb 2021 11:03:09 -0500
Received: from relay68.bu.edu ([128.197.228.73]:56509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l83Za-0003XF-Tv; Fri, 05 Feb 2021 11:03:08 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 115G2Aas018445
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 5 Feb 2021 11:02:13 -0500
Date: Fri, 5 Feb 2021 11:02:10 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/scsi/scsi-disk: Fix out of bounds access in
 mode_sense_page()
Message-ID: <20210205160145.kyqggrsmsll2ymwh@mozz.bu.edu>
References: <20210204225041.1822673-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204225041.1822673-1-philmd@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210204 2350, Philippe Mathieu-Daudé wrote:
> Per the "SCSI Commands Reference Manual" (Rev. J) chapter 5.3
> "Mode parameters" and table 359 "Mode page codes and subpage
> codes", the last page code is 0x3f. When using it as array index,
> the array must have 0x40 elements. Replace the magic 0x3f value
> by its definition and increase the size of the mode_sense_valid[]
> to avoid an out of bound access (reproducer available in [Buglink]):
> 
>   hw/scsi/scsi-disk.c:1104:10: runtime error: index 63 out of bounds for type 'const int [63]'
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/scsi/scsi-disk.c:1104:10 in
>   =================================================================
>   ==1813911==ERROR: AddressSanitizer: global-buffer-overflow
>   READ of size 4 at 0x5624b84aff1c thread T0
>       #0 0x5624b63004b3 in mode_sense_page hw/scsi/scsi-disk.c:1104:10
>       #1 0x5624b630f798 in scsi_disk_check_mode_select hw/scsi/scsi-disk.c:1447:11
>       #2 0x5624b630efb8 in mode_select_pages hw/scsi/scsi-disk.c:1515:17
>       #3 0x5624b630988e in scsi_disk_emulate_mode_select hw/scsi/scsi-disk.c:1570:13
>       #4 0x5624b62f08e7 in scsi_disk_emulate_write_data hw/scsi/scsi-disk.c:1861:9
>       #5 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
>       #6 0x5624b62b2d4c in scsi_req_data hw/scsi/scsi-bus.c:1427:5
>       #7 0x5624b62f05f6 in scsi_disk_emulate_write_data hw/scsi/scsi-disk.c:1853:9
>       #8 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
>       #9 0x5624b63e47ed in megasas_enqueue_req hw/scsi/megasas.c:1660:9
>       #10 0x5624b63b9cfa in megasas_handle_scsi hw/scsi/megasas.c:1735:5
>       #11 0x5624b63acf91 in megasas_handle_frame hw/scsi/megasas.c:1974:24
>       #12 0x5624b63aa200 in megasas_mmio_write hw/scsi/megasas.c:2131:9
>       #13 0x5624b63ebed3 in megasas_port_write hw/scsi/megasas.c:2182:5
>       #14 0x5624b6f43568 in memory_region_write_accessor softmmu/memory.c:491:5
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: OSS-Fuzz
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914638
> Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
> v2: Mention reproducer link
> ---
>  hw/scsi/scsi-disk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index ed52fcd49ff..93aec483e88 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1089,7 +1089,7 @@ static int scsi_emulate_mechanism_status(SCSIDiskState *s, uint8_t *outbuf)
>  static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
>                             int page_control)
>  {
> -    static const int mode_sense_valid[0x3f] = {
> +    static const int mode_sense_valid[MODE_PAGE_ALLS + 1] = {
>          [MODE_PAGE_HD_GEOMETRY]            = (1 << TYPE_DISK),
>          [MODE_PAGE_FLEXIBLE_DISK_GEOMETRY] = (1 << TYPE_DISK),
>          [MODE_PAGE_CACHING]                = (1 << TYPE_DISK) | (1 << TYPE_ROM),
> -- 
> 2.26.2
> 

