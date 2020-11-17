Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A42B6F59
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:52:29 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf71g-0006Za-VT
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6zg-0005Cz-6w
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:50:24 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6za-0003cX-OS
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:50:20 -0500
Received: by mail-pf1-x444.google.com with SMTP id b63so14394520pfg.12
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WxyqhQGraWVfI0vUQ1PNg0uYmVV4Me6jSaJ61Lqe8wU=;
 b=SEaCwh+atew5OQ+Di6J6ZMuzFXrrxuth6xlNAwWti+zc2KTc7yFooIy/eNQwsR/zqu
 7H+bcqefw6Fy3U3zwBARtc5EOGAeAsWbOtULhgOKs+nYX3aENutzhKstRZ80oyYDt+UK
 x8YZDWZ7fjrMeESvpwE86ybFNHoXKN9OwM9BK31U6H9u5QDTFPApHoGZo51KXHi7Avl8
 xgYIv03T+FNQY3X4REXOB7cw4gLBvRAZtoMCpgV8zn6qQbzdMt5oPw3gjgx8jR+isR31
 tVSmMDZixlCvtVpeLxUfyxHa8jNjHOtkAZ1Pxthg3y8/sMJoRbVZP4B0+RvlPJZbxUCL
 9Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WxyqhQGraWVfI0vUQ1PNg0uYmVV4Me6jSaJ61Lqe8wU=;
 b=QmBiyRxmFz0o6O16FEJ+TjeRTTP7x6XfR7AFCJzmfhFMH5hQpiD769IaIgpRkWROpD
 L9lFW2igcSkjWZrjW/Dc9OBL5pkGwLFZ7gdhD2jQp8oousFvS1u6AAW8rvkoYbOc8Q3t
 +QyObeOnBD/H+g/Rc3In5B3lhQCd3e0zdWmIAL3RsBADBtWkQESLKfwMxQQe/gd7ZGEv
 A5+6vwidZo65nJKXtWRFCEhDH3OHzvZOgitUhS+IIlU25TD1basUWZD0jSlJNPb2hobn
 s2UEKdTKDwTR9WU/KtLVAH6PpR/k2dqvY4shYxmh8JDEtdkInJrpU20+N/QT5CIdTb3B
 YG4w==
X-Gm-Message-State: AOAM532Hj8fN4eo1tbVdL4sy0TAqte5prdNxI0U+cn8Rn+9XC0dYwxHt
 XaJmTayfludgJJq0PgIrE6kIzGwnam7RHg==
X-Google-Smtp-Source: ABdhPJzkj7McjJtN3WUj1jSBrjYd6EUpK74TSlCIkd23QMcj7zwCk32dSXPM2IMNkn8+5+SQoXeQqg==
X-Received: by 2002:a62:870c:0:b029:18b:d345:70f3 with SMTP id
 i12-20020a62870c0000b029018bd34570f3mr975223pfe.30.1605642616283; 
 Tue, 17 Nov 2020 11:50:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d11sm23521526pfo.198.2020.11.17.11.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:50:15 -0800 (PST)
Subject: Re: [PATCH 12/15] target/arm: Factor out preserve-fp-state from
 full_vfp_access_check()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <840b9f0f-5d5f-d649-e5ec-86f136b58d94@linaro.org>
Date: Tue, 17 Nov 2020 11:50:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> Factor out the code which handles M-profile lazy FP state preservation
> from full_vfp_access_check(); accesses to the FPCXT_NS register are
> a special case which need to do just this part (corresponding in the
> pseudocode to the PreserveFPState() function), and not the full
> set of actions matching the pseudocode ExecuteFPCheck() which
> normal FP instructions need to do.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 45 ++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


