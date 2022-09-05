Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55B5AD2A2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:38:41 +0200 (CEST)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBN9-0004lw-Ab
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVArv-0007sF-Dy
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:06:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAro-0007hd-QD
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:06:22 -0400
Received: by mail-wr1-x429.google.com with SMTP id e13so11104441wrm.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=D24FtzLesAGjGq5RiA2aRFqDcFtYWmWKctQeUviWwIw=;
 b=WG0wNb7Egb0LFlQqUp2Js8L46i22IePece8+ndVY6PTpMw6WUKSYOM1FQHdGyN7iIR
 1ke3jX1L3q2jj+0S0N3QBpbX4i05FmKDI/CtlwsfiSz5ketRjHnb9Ez16wCinGJ1iVvo
 5aisg/8N8icxoTaK5gEv1Zlfdk3QSIlTCoaUPCwHTDvCXfzV18SZv6iyQox1uUSL/0VN
 JrpILVEj9qsGKDaTb0FKbi8aU0Or/Ct7c04Ud5yl8uJDirmjhs+MHoqtP40i6y9CFAQe
 IB/5Lf48Ulb31GjtNpeB/tzqG6fYtRpKEhniCKj5m3A0cgk+4aKQ+WtcDz4zS1Gufnqt
 bpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=D24FtzLesAGjGq5RiA2aRFqDcFtYWmWKctQeUviWwIw=;
 b=KrqPLkFIaAgKPCgBoLy94vEbK/NhMS9FTRBbPr6Dm+JfXzPKpRYXKOzxMzbA64ztmt
 mqU/PCNchMEx31TLNJYL7VfmWvgd6GSubuakgUNOl5iFEvddmj3D85jX3Fc5GDdpk99v
 B/LqtLnfPtKEV7SD6Q1gN4J3EJJb+pL2rANyii9NVrIlmCpMhFEuPxYRa3VJ8XPlv/KE
 tevnJXpLV0iTe6GqNnPiIyMHIRi2/7r/dHwPAOhxF6KxAaIEdc35Vh4pRIFg9K2EbEN8
 M8YvyWZl6LrS1e8KyYJwp+US0mtlnCsH2Mq/1uof7v2KkdL2PHR/a2dFkQKIwW92F71y
 g2OA==
X-Gm-Message-State: ACgBeo0KELiISYqvCS2Km2rBAcfoujSDWxoesbpvyBY9vPm0OC0BokKK
 +qpVyFPtDGzMMj0qn4qbiWnZ1Q==
X-Google-Smtp-Source: AA6agR6VspV3VbSBPKI9WPt1iH/2qAN+sWkigugI5TDaxtWEaItM+6Il4KQUnTDTrlxhMaq5ZjYzPQ==
X-Received: by 2002:a5d:47a9:0:b0:226:e849:4373 with SMTP id
 9-20020a5d47a9000000b00226e8494373mr15780909wrb.57.1662379574447; 
 Mon, 05 Sep 2022 05:06:14 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b003a5a5069107sm17327806wmq.24.2022.09.05.05.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 05:06:13 -0700 (PDT)
Message-ID: <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
Date: Mon, 5 Sep 2022 13:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel: print an error message and exit if plugin not
 loaded
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220905101332.1986-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905101332.1986-1-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/5/22 11:13, Claudio Fontana wrote:
> If module_load_one, module_load_file fail for any reason
> (permissions, plugin not installed, ...), we need to provide some notification
> to the user to understand that this is happening; otherwise the errors
> reported on initialization will make no sense to the user.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   accel/accel-softmmu.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> index 67276e4f52..807708ee86 100644
> --- a/accel/accel-softmmu.c
> +++ b/accel/accel-softmmu.c
> @@ -66,15 +66,21 @@ void accel_init_ops_interfaces(AccelClass *ac)
>   {
>       const char *ac_name;
>       char *ops_name;
> +    ObjectClass *oc;
>       AccelOpsClass *ops;
>   
>       ac_name = object_class_get_name(OBJECT_CLASS(ac));
>       g_assert(ac_name != NULL);
>   
>       ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
> -    ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
> +    oc = module_object_class_by_name(ops_name);
> +    if (!oc) {
> +        error_report("fatal: could not find module object of type \"%s\", "
> +                     "plugin might not be loaded correctly", ops_name);
> +        exit(EXIT_FAILURE);
> +    }

The change is correct, in that we certainly cannot continue without the accelerator loaded.

But I'm very disappointed that the module interface does not use Error, so you have no 
choice but to use an extremely vague message here.  I would much prefer to plumb down an 
error parameter so that here one could simply pass &error_fatal.


r~

