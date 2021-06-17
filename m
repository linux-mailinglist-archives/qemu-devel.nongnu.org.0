Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7267D3AB4C0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:28:36 +0200 (CEST)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lts4R-0001GW-G8
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ltrx3-0002Do-Do; Thu, 17 Jun 2021 09:20:57 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ltrx1-00052z-EO; Thu, 17 Jun 2021 09:20:57 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC0492199A;
 Thu, 17 Jun 2021 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623936051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swt/vOb8X1lEgIpDRd7npyQSYrM83IMTWLg9ngnHqQQ=;
 b=UcdME7Xu4AjzfytxYbS1fOi/9HGShdaD7weGuUKYE/oLdhqqBGWri1g2MwsoQrGJ9mTfs1
 rj2VKOhEGJEhggeEVYD2ElinvYCNPVWsMzgvxpJJaDsqWdOOELhOQkiwbj++hAxH6mU389
 YSGzRUR1oITSR0iK8wqyJ2m4ddtpPTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623936051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swt/vOb8X1lEgIpDRd7npyQSYrM83IMTWLg9ngnHqQQ=;
 b=e4+NfbbLSXHy69UNzmfiNfYTuaefgCiCmMNPRgv7Re7KNgFV6yfBEplahOxg0Wwma2zX0U
 wQ+ci+r4HfYIxuCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9ACC3118DD;
 Thu, 17 Jun 2021 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623936051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swt/vOb8X1lEgIpDRd7npyQSYrM83IMTWLg9ngnHqQQ=;
 b=UcdME7Xu4AjzfytxYbS1fOi/9HGShdaD7weGuUKYE/oLdhqqBGWri1g2MwsoQrGJ9mTfs1
 rj2VKOhEGJEhggeEVYD2ElinvYCNPVWsMzgvxpJJaDsqWdOOELhOQkiwbj++hAxH6mU389
 YSGzRUR1oITSR0iK8wqyJ2m4ddtpPTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623936051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swt/vOb8X1lEgIpDRd7npyQSYrM83IMTWLg9ngnHqQQ=;
 b=e4+NfbbLSXHy69UNzmfiNfYTuaefgCiCmMNPRgv7Re7KNgFV6yfBEplahOxg0Wwma2zX0U
 wQ+ci+r4HfYIxuCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id i2E7JDNMy2DCQAAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 17 Jun 2021 13:20:51 +0000
Subject: Re: [PATCH v3 35/44] target/arm: Implmement MVE VRSHL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-36-peter.maydell@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <54fdcf6b-2498-feaa-f977-f86c567c8dd1@suse.de>
Date: Thu, 17 Jun 2021 15:20:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210617121628.20116-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.254,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, typo in the Subject: "Implmement MVE VRSHL"

Claudio

On 6/17/21 2:16 PM, Peter Maydell wrote:
> Implement the MVE VRSHL insn (vector form).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-mve.h    | 8 ++++++++
>  target/arm/mve.decode      | 3 +++
>  target/arm/mve_helper.c    | 4 ++++
>  target/arm/translate-mve.c | 2 ++
>  4 files changed, 17 insertions(+)
> 
> diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
> index 56b3e8591ad..b7e2243a19a 100644
> --- a/target/arm/helper-mve.h
> +++ b/target/arm/helper-mve.h
> @@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>  DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>  DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>  
> +DEF_HELPER_FLAGS_4(mve_vrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +
> +DEF_HELPER_FLAGS_4(mve_vrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +DEF_HELPER_FLAGS_4(mve_vrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> +
>  DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>  DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
>  DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
> diff --git a/target/arm/mve.decode b/target/arm/mve.decode
> index ebf156b46b5..c30fb2c1536 100644
> --- a/target/arm/mve.decode
> +++ b/target/arm/mve.decode
> @@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
>  VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
>  VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
>  
> +VRSHL_S          111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
> +VRSHL_U          111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
> +
>  VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
>  VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
>  
> diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
> index 5da1899f3d8..cd6b963849c 100644
> --- a/target/arm/mve_helper.c
> +++ b/target/arm/mve_helper.c
> @@ -538,9 +538,13 @@ DO_2OP_U(vhsubu, do_vhsub_u)
>  
>  #define DO_VSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
>  #define DO_VSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
> +#define DO_VRSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
> +#define DO_VRSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
>  
>  DO_2OP_S(vshls, DO_VSHLS)
>  DO_2OP_U(vshlu, DO_VSHLU)
> +DO_2OP_S(vrshls, DO_VRSHLS)
> +DO_2OP_U(vrshlu, DO_VRSHLU)
>  
>  static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
>  {
> diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
> index 487ac3185c6..d75cc377fee 100644
> --- a/target/arm/translate-mve.c
> +++ b/target/arm/translate-mve.c
> @@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
>  DO_2OP(VQSUB_U, vqsubu)
>  DO_2OP(VSHL_S, vshls)
>  DO_2OP(VSHL_U, vshlu)
> +DO_2OP(VRSHL_S, vrshls)
> +DO_2OP(VRSHL_U, vrshlu)
>  DO_2OP(VQSHL_S, vqshls)
>  DO_2OP(VQSHL_U, vqshlu)
>  DO_2OP(VQRSHL_S, vqrshls)
> 


