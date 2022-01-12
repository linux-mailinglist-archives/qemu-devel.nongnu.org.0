Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30F48C9FB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:41:08 +0100 (CET)
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hcR-0001ce-8K
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 id 1n7hGT-0002St-2c
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:18:25 -0500
Received: from smtp01.stuvus.uni-stuttgart.de ([129.69.139.72]:41144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 id 1n7hGH-0006Jk-PZ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=stuvus.uni-stuttgart.de; s=20200828.smtp01; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcRu7FojRWTNXtKiFm4Pu19KnNsiQKZkESkvqs4+2kM=; b=hsBXdP2QbWeNNPDyIWBmCPUwx
 ujzdcQ/giu/rFaVdFYJd2uqyHusZ9X99KsRAR741j4MM/EORNJF+bWAv2rMSzGP8SzH1d4Hx6XPOh
 +fIWPYZR6bYHgew9n/KNb2cn64jNDsuAF1czj83ps7gw1jUbiJXWWI7cYTmLea1SlXogYVaSYeIkX
 aIHrehC7GWunw8Zi1itVm+0CAwjQ35wqfsTk1RxgNGEwW9/iWuG1J3Z2ti/Ch+aqnXUUaRI4+HErB
 MrrrQrUFlpyXICI1JvPDEZyT174C+xbmevDRlg8mi4HaPanM1zGDxxNF1hflMeaUDT8WNzsiDjzba
 Ivuc/9Brw==;
X-Spam-Bar: ------
X-Spam-Score: -6.4
Received: from [10.53.214.160] by smtp01.stuvus.uni-stuttgart.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (envelope-from <sebastian.hasler@stuvus.uni-stuttgart.de>)
 ; Wed, 12 Jan 2022 18:18:09 +0100
Message-ID: <d2f48cc3-b539-eb4d-bb4d-96f915a51f80@stuvus.uni-stuttgart.de>
Date: Wed, 12 Jan 2022 18:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] virtiofsd: Do not support blocking flock
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220111181043.435915-1-sebastian.hasler@stuvus.uni-stuttgart.de>
From: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
In-Reply-To: <20220111181043.435915-1-sebastian.hasler@stuvus.uni-stuttgart.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=129.69.139.72;
 envelope-from=sebastian.hasler@stuvus.uni-stuttgart.de;
 helo=smtp01.stuvus.uni-stuttgart.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/01/2022 19:10, Sebastian Hasler wrote:
> With the current implementation, blocking flock can lead to
> deadlock. Thus, it's better to return EOPNOTSUPP if a user attempts
> to perform a blocking flock request.
>
> Signed-off-by: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
> ---
>   tools/virtiofsd/passthrough_ll.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 64b5b4fbb1..f3cc307f6d 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2442,6 +2442,12 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
>       int res;
>       (void)ino;
>   
> +    if (!(op & LOCK_NB)) {
> +        /* Blocking flock is not supported */
> +        fuse_reply_err(req, EOPNOTSUPP);
> +        return;
> +    }
> +
>       res = flock(lo_fi_fd(req, fi), op);
>   
>       fuse_reply_err(req, res == -1 ? errno : 0);

I tested this patch by cherry-picking it on v6.1.0 and using it with 
Kata Containers 2.3.0. The bash code

     exec 42>/lock/flock
     flock -w 120 42

outputs

     flock: 42: Operation not supported

while the bash code

     exec 42>/lock/flock
     flock --nonblock 42

still works. So it works as intended.

-- 
Sebastian Hasler

stuvus – Studierendenvertretung Universität Stuttgart


