Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC86608F1
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:52:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDucM-0008Rr-TV; Fri, 06 Jan 2023 16:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDucK-0008Rh-PX
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:51:12 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDucJ-0001DG-9e
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:51:12 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so6560157pjg.5
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VGHn6S6/6DF3plONs2iI0PIDu9iYaIke/scDDsekcvU=;
 b=iirQBcf4NENqUubqgK49zKEs5uNE58Ns7hM3XukdXNOIJwDoApe4faStIDpT2CeS+R
 aNJSDmOlFdin5z7phZsYOXpZOoymKhnJ7ABaQelNBhjp2P6LL2T53VMo3FZLvzlsb5mu
 E95Wd+1l07L6aSkvCTNY/OSeqCAPro3nakz6RwelXNZK7j+sHS2lQdKbeyK2X+CuBDXu
 1EXS0cG19CycWabQJji0jJRnF1+JJUBYGMWWUh8D0tYjpQh+Rc9p/VJeXyYU3fEsXxrw
 e+wWUexOkul/L+NppXUCrKuQGWVRtYEtOGP68kH7GeUXl7niPFilpX/D6MbgJIWM8ETL
 tESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VGHn6S6/6DF3plONs2iI0PIDu9iYaIke/scDDsekcvU=;
 b=d0MYXQQn1PzN6pN+PXpT4y+gyz/4juftIAQ+rSPrVdO/yMmRLFFL9HUh+K+s9g4W7O
 zalMYGBo4F1x5rLwvcr1ah3YDkvoSHAwqVPbsjCc2ZD3qNI2VxEnwQbeilPajplDWwK+
 NMo0LYf7IZprweoPfmKD5N0/t1VTS6AiWJwUA43swjbererfWstY1YwO2W8oL87FZTGE
 hREj885Majil3M/EQNwP1QxdhExxhOfwWkbxGwAmWAe0LKdaUhOUw+LE6tNhhoyMbmET
 sRtYSi7mDVefawhS2hlkokigrvyDkG5wooaAftTIIjFPAKO0oVPFhVtpwVYn9lmnwRAP
 Pvaw==
X-Gm-Message-State: AFqh2kreGdNPJPcAxASbq2HluTvDMTZcaSEF2kmtEe4kwI0PfVwEqKjD
 KeMGuWclf++KnVMddX7OMdAq8A==
X-Google-Smtp-Source: AMrXdXvLaEVxzs9Uf/jG41/fhk838WegtMVLYszIyODaZnus8nK71cvB+PVKilYQwQz2fuLqVOOwcQ==
X-Received: by 2002:a05:6a20:4995:b0:aa:7eab:25a5 with SMTP id
 fs21-20020a056a20499500b000aa7eab25a5mr63546239pzb.34.1673041869643; 
 Fri, 06 Jan 2023 13:51:09 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 qe12-20020a17090b4f8c00b00218fba260e2sm3166649pjb.43.2023.01.06.13.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 13:51:09 -0800 (PST)
Message-ID: <30d07d27-4e33-b892-6da7-fd955a012055@linaro.org>
Date: Fri, 6 Jan 2023 13:51:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/21] gdbstub: move chunk of softmmu functionality to
 own file
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/5/23 08:43, Alex Bennée wrote:
> @@ -60,8 +67,6 @@ typedef struct GDBState {
>       int signal;
>   #ifdef CONFIG_USER_ONLY
>       GDBUserState user;
> -#else
> -    GDBSystemState system;

In patch 6 you nested this variable, and now you're undoing that.
Get this placed properly to start, as I suggested, to reduce churn.


r~

