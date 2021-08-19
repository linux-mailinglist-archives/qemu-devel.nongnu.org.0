Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D5B3F1608
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:18:40 +0200 (CEST)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGeC7-0006CW-QJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGeAR-0002ZP-2R
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:16:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGeAP-0000pg-5z
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:16:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id v4so7918588wro.12
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JzoVLBkLSJDFXGb03l932QPO7Iayiezr3OG3qYJG6bk=;
 b=dRXvVI1OO4voY0wnYwdtIhqCSUkc+nRuk7+UHhlumDNgNVdd5fHXR8bkeSmgx5tsAh
 S935gELzZ/8bdQ0s+YxffTSV9Wr2/THB5Iw+mE7nQdMIHEfKXsauwxOubOOJrZNA78GP
 9A0xIMJ4w/E9WCEEJIDR22fuR/SW0rf3i9iB2lURux48STr2QExKN2MWkcYWX3baU2kk
 WcsbTN+RyhAlWTnr5AAnF7RjzdH3g+EFOCpuaGHzevD6JzextJYsWdgAvau3m/e0Ikrv
 k2K084A+wRUOKy5+oxTwzREO2uEeZPKfenBNOUQFlp6+LmpSaBsvVhWtps6haN6HJL/j
 tpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JzoVLBkLSJDFXGb03l932QPO7Iayiezr3OG3qYJG6bk=;
 b=TEWfz0D+qPrlHFk8NIjDIbCKLPdgxk/H+bA3tzzD96WrXq+MfhU1aZ8dVMJu9db2cn
 umVav4t46q2xPKQVve17dinlCKywkXZnPDuo7o52el0+j+Dii0UO41CL7P/zNDTqWpgL
 pJeubzD7TGG2v58zDNnycCgR8Ko8K8S+7fmuEuAPcJiv1Efaj1QLk2O4trOB9G5VUxGD
 chMdRr5fjyoTcKhrqE9R0hCXUZFzkyayuxcpsJpG6kB9YHP5RtujXzW8Pnks19zH0tYz
 lv5xIKzuuhcFh3sqm3clx+EW/kGVHJJmj71NDYYFu46P5gIbEP+6alFX0ge1tfEG6j/P
 7GOQ==
X-Gm-Message-State: AOAM533w84G7og2DXG61JHgfu7Zu/kJ2cQPr1ZGTnB743cpJdnAK8Wtj
 pV3F1xzof9EM6sii1moigUw=
X-Google-Smtp-Source: ABdhPJy8yv1tQeBK1p/4gLj/99L4/8IYdbeWc4+0e6N7YPIHJ3O4CukUHdonmY5G2w8ChaSePAuj7A==
X-Received: by 2002:a5d:4ad2:: with SMTP id y18mr2563417wrs.110.1629364611446; 
 Thu, 19 Aug 2021 02:16:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o14sm1936352wms.2.2021.08.19.02.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 02:16:50 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] target/mips: Replace GET_LMASK() macro by
 get_lmask(32) function
To: qemu-devel@nongnu.org
References: <20210818215517.2560994-1-f4bug@amsat.org>
 <20210818215517.2560994-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <966df565-3b23-536d-3a78-4624c0046eec@amsat.org>
Date: Thu, 19 Aug 2021 11:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818215517.2560994-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:55 PM, Philippe Mathieu-Daudé wrote:
> The target endianess information is stored in the BigEndian
> bit of the Config0 register in CP0.
> 
> Replace the GET_LMASK() macro by an inlined get_lmask() function,
> passing CPUMIPSState and the word size as argument.
> 
> We can remove one use of the TARGET_WORDS_BIGENDIAN definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/ldst_helper.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
> index 8d1dfea6766..c48a2818681 100644
> --- a/target/mips/tcg/ldst_helper.c
> +++ b/target/mips/tcg/ldst_helper.c
> @@ -57,30 +57,39 @@ static inline bool cpu_is_bigendian(CPUMIPSState *env)
>      return extract32(env->CP0_Config0, CP0C0_BE, 1);
>  }
>  
> -#ifdef TARGET_WORDS_BIGENDIAN
> -#define GET_LMASK(v) ((v) & 3)
> -#else
> -#define GET_LMASK(v) (((v) & 3) ^ 3)
> -#endif
> +static inline target_ulong get_lmask(CPUMIPSState *env,
> +                                     target_ulong value, unsigned bits)
> +{
> +    unsigned mask = (bits / BITS_PER_BYTE) - 1;
> +
> +    value &= mask;
> +
> +    if (cpu_is_bigendian(env)) {

Obviously:

       if (!cpu_is_bigendian(env)) {

> +        value ^= mask;
> +    }
> +
> +    return value;
> +}
>  
>  void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
>                  int mem_idx)
>  {
> +    target_ulong lmask = get_lmask(env, arg2, 32);
>      int dir = cpu_is_bigendian(env) ? 1 : -1;
>  
>      cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
>  
> -    if (GET_LMASK(arg2) <= 2) {
> +    if (lmask <= 2) {
>          cpu_stb_mmuidx_ra(env, arg2 + 1 * dir, (uint8_t)(arg1 >> 16),
>                            mem_idx, GETPC());
>      }
>  
> -    if (GET_LMASK(arg2) <= 1) {
> +    if (lmask <= 1) {
>          cpu_stb_mmuidx_ra(env, arg2 + 2 * dir, (uint8_t)(arg1 >> 8),
>                            mem_idx, GETPC());
>      }
>  
> -    if (GET_LMASK(arg2) == 0) {
> +    if (lmask == 0) {
>          cpu_stb_mmuidx_ra(env, arg2 + 3 * dir, (uint8_t)arg1,
>                            mem_idx, GETPC());
>      }
> @@ -89,21 +98,22 @@ void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
>  void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
>                  int mem_idx)
>  {
> +    target_ulong lmask = get_lmask(env, arg2, 32);
>      int dir = cpu_is_bigendian(env) ? 1 : -1;
>  
>      cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
>  
> -    if (GET_LMASK(arg2) >= 1) {
> +    if (lmask >= 1) {
>          cpu_stb_mmuidx_ra(env, arg2 - 1 * dir, (uint8_t)(arg1 >> 8),
>                            mem_idx, GETPC());
>      }
>  
> -    if (GET_LMASK(arg2) >= 2) {
> +    if (lmask >= 2) {
>          cpu_stb_mmuidx_ra(env, arg2 - 2 * dir, (uint8_t)(arg1 >> 16),
>                            mem_idx, GETPC());
>      }
>  
> -    if (GET_LMASK(arg2) == 3) {
> +    if (lmask == 3) {
>          cpu_stb_mmuidx_ra(env, arg2 - 3 * dir, (uint8_t)(arg1 >> 24),
>                            mem_idx, GETPC());
>      }
> 

