Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B75606D61
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 04:03:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhNZ-00046F-4N
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:03:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olhMp-00042u-4J
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1olhMi-00040b-Ig; Thu, 20 Oct 2022 22:02:28 -0400
Received: from forward503o.mail.yandex.net ([2a02:6b8:0:1a2d::613])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1olhMg-0004eT-KW; Thu, 20 Oct 2022 22:02:28 -0400
Received: from iva2-0a73a57cc944.qloud-c.yandex.net
 (iva2-0a73a57cc944.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:6985:0:640:a73:a57c])
 by forward503o.mail.yandex.net (Yandex) with ESMTP id 2BAED5C4211;
 Fri, 21 Oct 2022 05:02:14 +0300 (MSK)
Received: by iva2-0a73a57cc944.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 1KrHBvAx8X-2CTKEcrU; Fri, 21 Oct 2022 05:02:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phystech.edu; s=mail;
 t=1666317734; bh=oCFR5B7SdOBNbg1BLpcG/K8dQ/tdtqQfwdbdBQrkxdM=;
 h=Cc:References:Date:Message-ID:In-Reply-To:From:To:Subject;
 b=Y16l8l0d44WZbc/DnbG/tqjyTGP4lLE63Jec5eayCcpETSI8qg/ptCBsg4w9Y7XxU
 PMOfPOa5S1Ae3MinZlMaRbL945yzu8B6XhmmW1VMoJZcHPxs67sVM1mrO9OmpnvOcC
 dsFpVJQwIisphXvvq0R/9lpVBBs8BAqK7ru2U9yE=
Authentication-Results: iva2-0a73a57cc944.qloud-c.yandex.net;
 dkim=pass header.i=@phystech.edu
Subject: Re: [PATCH RESEND] elf2dmp: free memory in failure
To: luzhipeng <luzhipeng@cestc.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221007020128.760-1-luzhipeng@cestc.cn>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Viktor Prutyanov <viktor.prutyanov@redhat.com>
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Message-ID: <226f401e-b147-a44e-6264-182d5858151d@phystech.edu>
Date: Fri, 21 Oct 2022 05:02:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221007020128.760-1-luzhipeng@cestc.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::613;
 envelope-from=viktor.prutyanov@phystech.edu; helo=forward503o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/7/22 5:01 AM, luzhipeng wrote:
> From: lu zhipeng <luzhipeng@cestc.cn>
> 
> The 'kdgb' is allocating memory in get_kdbg(), but it is not freed in
> error path. So fix that.
> 
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
> ---
>   contrib/elf2dmp/main.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index b9fc6d230c..d77b8f98f7 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -125,6 +125,7 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb,
>   
>       if (va_space_rw(vs, KdDebuggerDataBlock, kdbg, kdbg_hdr.Size, 0)) {
>           eprintf("Failed to extract entire KDBG\n");
> +        free(kdbg);
>           return NULL;
>       }
>   
> 

I suppose Philippe's R-b should be on this version of the patch, not 
previous one. Also I'm not sure if this patch should go through Paolo's 
branch or QEMU Trivial.

Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>

