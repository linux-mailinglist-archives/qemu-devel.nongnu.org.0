Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3504EDF6D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:12:18 +0200 (CEST)
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyLJ-0004v5-87
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:12:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyKF-00044r-Uf
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:11:12 -0400
Received: from [2607:f8b0:4864:20::32a] (port=37672
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyKE-0003Xq-5D
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:11:11 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso335266otp.4
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DcfqG/gln9tY5y2j4H8URUQPi1A2/qOC2YaaI1JFCUA=;
 b=x5yMfYgbNpzdyYIvlZqvCyW6lED8PQiNtQ81s+WgJ7uhhuJYcUz3c2w7n3/TWvvEtk
 ZhIED+W9eFfxyD6oZRyBap0cuHtjORnFjrTKqi8uqgpojNS840BTwV2Z+X3esLGCzdAo
 FHSnMMB+s69EqOd7pXLd26vANLwJZzWj5ySOj3e/p17rwOUIIETJ3iaqI8148nxXRHLz
 il/Q7wFugyIcTv2eFSiamuksjb07GxuD8K765srIG3u31vBimWpuO8e9l5fNdlGY+ggV
 pan7I2vjEFf003s5WuC2jsgdPWbQ21O0ya1HfJwZYAJHALAOEv1UnE5AZkk6lCm5DbsY
 ys6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DcfqG/gln9tY5y2j4H8URUQPi1A2/qOC2YaaI1JFCUA=;
 b=1R45D6MbmufyObZ0cjqEycsSWIKzVmdHxdQ1eIoLqLJJKdMb3ix7ufqmjhNVmnEAVO
 993Z6hzDeRVTmSMsA/0riFR50XB2CBfbZaCCVM1bBgwKe4lPGg0SQDZVohPW7Sf5iLfp
 OThrPV3Q9OBVSUmvqz9f3PoKV5Upv3KxEBmF2Q1FnU3aJlMn9oKRfe2nZAQrNOdtwAfL
 E9K9nNqq//GFRrS5ath+6d0pLMgjAyn/jFZlt27Gxh8sCNk9r8pLo2PbBRXv3ztfXHvD
 Z0/Xt4F1KNxBQh2pmK0UWyBvOGZYnJtWz2RWqzJHDWlCe4zKqPbqIub0TspYKRmHdtBc
 qxMQ==
X-Gm-Message-State: AOAM530k5I+8aVg6EGLHGTDtgYNuX+JYG02pdr+yuWzcvYRwoh/GKSSQ
 ETBXEthdWYUhK41dDbhE64f2Uw==
X-Google-Smtp-Source: ABdhPJwf2qUvhWXnY31rm7F59x1yox3Fd9FkBmFLiOrvJO5HQtAGVoY/TxBknecMW8bpt5Ti3YSsVQ==
X-Received: by 2002:a9d:6047:0:b0:5b2:4003:cfcb with SMTP id
 v7-20020a9d6047000000b005b24003cfcbmr5930390otj.59.1648746669128; 
 Thu, 31 Mar 2022 10:11:09 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 y66-20020a9d22c8000000b005c943ff75dbsm33923ota.7.2022.03.31.10.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 10:11:08 -0700 (PDT)
Message-ID: <abf7bd5b-33f3-eea2-5d37-d551ad9ca815@linaro.org>
Date: Thu, 31 Mar 2022 11:11:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] target/arm: Don't use DISAS_NORETURN in STXP
 !HAVE_CMPXCHG128 codegen
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220331150858.96348-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220331150858.96348-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 09:08, Peter Maydell wrote:
> In gen_store_exclusive(), if the host does not have a cmpxchg128
> primitive then we generate bad code for STXP for storing two 64-bit
> values.  We generate a call to the exit_atomic helper, which never
> returns, and set is_jmp to DISAS_NORETURN.  However, this is
> forgetting that we have already emitted a brcond that jumps over this
> call for the case where we don't hold the exclusive.  The effect is
> that we don't generate any code to end the TB for the
> exclusive-not-held execution path, which falls into the "exit with
> TB_EXIT_REQUESTED" code that gen_tb_end() emits.  This then causes an
> assert at runtime when cpu_loop_exec_tb() sees an EXIT_REQUESTED TB
> return that wasn't for an interrupt or icount.
> 
> In particular, you can hit this case when using the clang sanitizers
> and trying to run the xlnx-versal-virt acceptance test in 'make
> check-acceptance'.  This bug was masked until commit 848126d11e93ff
> ("meson: move int128 checks from configure") because we used to set
> CONFIG_CMPXCHG128=1 and avoid the buggy codepath, but after that we
> do not.
> 
> Fix the bug by not setting is_jmp.  The code after the exit_atomic
> call up to the fail_label is dead, but TCG is smart enough to
> eliminate it.  We do need to set 'tmp' to some valid value, though
> (in the same way the exit_atomic-using code in tcg/tcg-op.c does).
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/953
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a64.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

