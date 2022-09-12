Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168BE5B5FA8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 19:56:23 +0200 (CEST)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXnfS-0003Ai-7D
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 13:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1oXnVF-0002rj-2b
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:45:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1oXnVD-0000Uc-7h
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:45:48 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0073840952;
 Mon, 12 Sep 2022 20:45:35 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 21EEB255;
 Mon, 12 Sep 2022 20:45:35 +0300 (MSK)
Message-ID: <9489db8c-89d9-31fa-4f6a-baaa55fba824@msgid.tls.msk.ru>
Date: Mon, 12 Sep 2022 20:45:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
Content-Language: en-US
To: Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, mcascell@redhat.com, wxhusst@gmail.com
References: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -90
X-Spam_score: -9.1
X-Spam_bar: ---------
X-Spam_report: (-9.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping? This is from April this year, half a year ago.
Can this be applied or?

Marcel said it should wait a week or two, I think that's been done already.. ;)

Thanks,

/mjt

03.04.2022 12:52, Yuval Shaia wrote:
> Guest driver might execute HW commands when shared buffers are not yet
> allocated.
> This could happen on purpose (malicious guest) or because of some other
> guest/host address mapping error.
> We need to protect againts such case.
> 
> Fixes: CVE-2022-1050
> 
> Reported-by: Raven <wxhusst@gmail.com>
> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> ---
> v1 -> v2:
> 	* Commit message changes
> v2 -> v3:
> 	* Exclude cosmetic changes
> ---
>   hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> index da7ddfa548..89db963c46 100644
> --- a/hw/rdma/vmw/pvrdma_cmd.c
> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>   
>       dsr_info = &dev->dsr_info;
>   
> +    if (!dsr_info->dsr) {
> +            /* Buggy or malicious guest driver */
> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
> +            goto out;
> +    }
> +
>       if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>                         sizeof(struct cmd_handler)) {
>           rdma_error_report("Unsupported command");


