Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4F611AE1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:29:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooV1o-0002va-IO; Fri, 28 Oct 2022 15:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV1m-0002mx-Ks
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:28:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV1k-0004jB-R0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:28:26 -0400
Received: by mail-pl1-x630.google.com with SMTP id u6so5657428plq.12
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=43HqjDcW4Y9+D9beCSxxYnuGYKUhsXDu59g0h68ZvDg=;
 b=pZw0I47gDtXNStZMhHqzIVSaz9YHyO7Ku7cpU5RPSEmKEf0GNfcP5TQXhVGu4QgRqc
 vVJ6CxUtStTUKrP8U22loU4Kbl32UVuJsZFwisi47eEzBvfP4mQI4iCq9gGlmaCO+uZu
 cM/NS5rU1IZ63UmuiBxSSdpPUyJr4oJjoHrxVLc+tIWADbY2qxNocMSvAXR8KTPyx8+3
 GnamiByYzSBoX7S14WJB8V8Xuj/vLQOZ6Zoj+7FM7mGf2p4/Lef+Qc9d2XXeIHmmqFF3
 D4TQt1+N5rCxJxUpBceRuGfvvClZ8u4DzK0pwQvqfEbAOiXBweJGcs8KHS3NPpYOFKm8
 4oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=43HqjDcW4Y9+D9beCSxxYnuGYKUhsXDu59g0h68ZvDg=;
 b=d7ab/o5eJHd18iKGDxsHaducG/oYn8p8iVOsbKasqNa3zpiEF4pMu1g1aZStq7Umb1
 uuBhgBjjLXpFQdknBJcYYrSMgTgulB95ogcBRTCJAjUPGti0qmdWBK2nNvvynyhCmxci
 4d4tyxWjGzvhQwTObzWKPlwbgo5COXTWGSbk5oeaQJruq9A6UkTk+8JIm56/jKQPnzK+
 iZsT7nrdMZnz45M3aUq3M181b+RBGvHdkDyF2k8idtn1G4T0tE+C/Q5fo984KehJobcA
 bZUyt5NydRdOYYIQC8zCtnn/9j6wPgq514vcVCSF13Lf34vePXXpBifECyGQ8xa+0kp0
 wY4w==
X-Gm-Message-State: ACrzQf1IrKk9cbFORYgMX7/onV7stTsZhWGc9mWbnYJKpkPWFDUGmVhV
 wHZzuZYzIjMi8GpkIVJRVQteEA==
X-Google-Smtp-Source: AMsMyM4F+3D+Kdr4gp7tWJqaeuZWDZ9/ucoUkhw2Y9Q4t1xyTB00bX6HP1ZzxMPVfENNR6HqiUT58g==
X-Received: by 2002:a17:902:c40a:b0:186:ba20:76fa with SMTP id
 k10-20020a170902c40a00b00186ba2076famr537210plk.55.1666985303206; 
 Fri, 28 Oct 2022 12:28:23 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 65-20020a620544000000b0056203db46ffsm3267558pff.172.2022.10.28.12.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:28:22 -0700 (PDT)
Message-ID: <f28c1d8f-d30d-fc24-ce4e-88aba776abe2@linaro.org>
Date: Sat, 29 Oct 2022 06:28:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>
Cc: qemu-devel@nongnu.org
References: <20221028072145.1593205-1-uwu@icenowy.me>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028072145.1593205-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 18:21, Icenowy Zheng wrote:
> When registering helpers via FFI for TCI, the inner loop that iterates
> parameters of the helper reuses (and thus pollutes) the same variable
> used by the outer loop that iterates all helpers, thus made some helpers
> unregistered.
> 
> Fix this logic error by using a dedicated temporary variable for the
> inner loop.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>   tcg/tcg.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 612a12f58f..adfaf61a32 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -619,6 +619,7 @@ static void tcg_context_init(unsigned max_cpus)
>           gpointer hash = (gpointer)(uintptr_t)typemask;
>           ffi_status status;
>           int nargs;
> +        int j;
>   
>           if (g_hash_table_lookup(ffi_table, hash)) {
>               continue;
> @@ -634,9 +635,9 @@ static void tcg_context_init(unsigned max_cpus)
>   
>           if (nargs != 0) {
>               ca->cif.arg_types = ca->args;
> -            for (i = 0; i < nargs; ++i) {
> -                int typecode = extract32(typemask, (i + 1) * 3, 3);
> -                ca->args[i] = typecode_to_ffi[typecode];
> +            for (j = 0; j < nargs; ++j) {
> +                int typecode = extract32(typemask, (j + 1) * 3, 3);
> +                ca->args[j] = typecode_to_ffi[typecode];

Oh my.  I'm surprised any test cases at all worked.
Queued to tcg-next, with the declaration of j moved to the loop itself:

	for (int j = 0; j < nargs; ++j)


r~


