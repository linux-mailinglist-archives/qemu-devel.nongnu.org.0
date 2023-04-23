Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1010A6EBEB5
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:51:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXIl-0005QN-5o; Sun, 23 Apr 2023 06:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXIb-0005Cr-6h
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:50:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXIZ-0001Ti-Ig
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:50:28 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso15931765e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682247026; x=1684839026;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OHMLCnP2qSgbk8dC2YujUSAdxCMOF5nyakmToRBHWPI=;
 b=fC0hcaFSpRGseRDsoU1FtV0ZIaecE2iLO/cb0GITVHUs+AI8ZbZa25ajRAhgoR/GIL
 VFG8VAZrRQ5iqozT1xpJQbOccZeyyVXdTAP+Ou24joazB2deMZFKMdvwVGzZihN1q8Ux
 UpFqlR1Er/7yTK0bssv5CUYpcFw49HhjsWbhdO1jTk8V6vFzJhi0obgzR+/xGTkd/3K9
 jqf+Xmn+bErlud/9W1VSToVxkBOmNadBgXIWyGbgqlQMth74RKEYv/TAQFcamHC2Z15L
 7eWXOLX6p07r3Tc/ECdeAP+t9YOeEu11HikFqE0YD/dBtzE4o6XKRZfDYwLy+mI6yqoo
 9Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682247026; x=1684839026;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OHMLCnP2qSgbk8dC2YujUSAdxCMOF5nyakmToRBHWPI=;
 b=ZZNZDjbozFqT6T3K6TCRDSSWvDCuHtweI0KCKCll5yJrVXTaVViIG48vwuynZ8yPIv
 AIMSnfM013rQ2ioS6U4eZAHkb98egjsZqTiMFcdytSLIAsLJnS990syXo7WUI6Ry4OOW
 RktZrlluRr+kjGBUbH8OtNVL4Rv6Wecsq+AjLybSnx4H+FLarauvt+SKrsbuqj67XEIB
 TYRfmoSXsNJmLwbAjVYA6qmFrBDtKkZq8Jfq8MtEOXQuOZkUVeA+vksxDRRlTg9BvVqB
 W31vz9tIOciCG11eN4LKHzCw8JzA3sEvMiIs0wPhpI904ffF4zQKld+hVzc8ByFMfPj/
 hweQ==
X-Gm-Message-State: AAQBX9cuoOl0LTttALmqmefdZlz9arqQskwFt81S98oNnJO+DAo7amo4
 7+VNQm2XhuFguNItvG2oQaaujw==
X-Google-Smtp-Source: AKy350aD3xsY0xML8J+sMfY9glF2LMaZzch02CsRKWQFyVk+AYRz2nEwbf7Wtb+xSqKWvRx9A+zwKQ==
X-Received: by 2002:a5d:6702:0:b0:2f2:7e53:db65 with SMTP id
 o2-20020a5d6702000000b002f27e53db65mr7880999wru.7.1682247026108; 
 Sun, 23 Apr 2023 03:50:26 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002fb0c5a0458sm8378600wrq.91.2023.04.23.03.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 03:50:25 -0700 (PDT)
Message-ID: <4d744ee9-372b-c1f1-0d0f-be06b4b63c6f@linaro.org>
Date: Sun, 23 Apr 2023 11:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 04/11] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412121829.14452-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/12/23 13:18, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

