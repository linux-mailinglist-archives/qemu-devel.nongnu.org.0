Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE699348462
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:13:04 +0100 (CET)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPBkN-0005AD-Gu
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBj8-0004h0-Eb
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:11:46 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:42923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBj7-0007VE-0R
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:11:46 -0400
Received: by mail-oi1-x232.google.com with SMTP id n140so48024oig.9
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lqyCd4w1H9gXmgfl2qyMu5uY2M5pgPXyVeHCosffA24=;
 b=PxuwxQr7HzRj8zucC/CksNMbYmo3Zc2+HmyHALB703zfsgSTC7yAOvocjXhOkL3fRe
 GzsYC6NudE2HKC/jdwYkPCwF0xPdETF/OactwFGHTHxR1fv5LR51onKUUb74vCw1sm7N
 tm0aoZgMLBR1RA3uvtcHEcDLlaMAK37HQH1nPKd6hGd1uhl+94IpSMrxFq77MV5Y6pqR
 8Std1sjK8i9+75EmW8JJltJ68Tn5XC9B7NawPZdKIlokqLaaUo1A8b6mkNnpvB2k/X+U
 ty+32g1YfIyJt22+HjwBar+YnT231DOkhbwIGvhV4HoncEIfsPcvYZASz+Lm+2Wdfn09
 3emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lqyCd4w1H9gXmgfl2qyMu5uY2M5pgPXyVeHCosffA24=;
 b=HiqqXD2RFSfeEIKNyC18mZXKSqtFEPhhZ1m6M0++uH5gNv3sd0Zn26oezIWCwxy8I7
 JfP7kyVE6DdkqKIjpFHO02cF6K8x1bIkOMJTBeaSI2eo3GO+UNOR1OMJK7gFcAkN1GjL
 bjLpMxCUrhCpWEAbITf9Gf44cWZC7i/k5XyhFoUmPvenb4evb+B/TKg6jvQKbG4AYI5C
 c0K6iHgahw0DC9E14MKPxl/e9i+vRHvlOH7Fr9zFhcsz8WJlq+0IOV4g4WciE1JX++F3
 doprKyHyLxXBaaWn63wfPLT3O+r4AcI05osxOXspkVZDj0zP6+lbTxN4+M0Cfsr45nCW
 iK3g==
X-Gm-Message-State: AOAM530xDB9cXqDlIZRtqXpU14OXT7Ku+RZfcM/sJC4jZqyCqjhGrS2A
 NkOmF9PSFVsYsBSPVsSlhzTnUg==
X-Google-Smtp-Source: ABdhPJx/Fut1+yPZ+GNobwp8OyV+mLPqIkIc/an+AEwdIJ2hcxLZ71647dBSQza+iHY+8GqVzXYZWA==
X-Received: by 2002:a05:6808:2d2:: with SMTP id
 a18mr3965285oid.152.1616623903763; 
 Wed, 24 Mar 2021 15:11:43 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id w16sm879369otq.15.2021.03.24.15.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:11:43 -0700 (PDT)
Subject: Re: [RFC v11 25/55] target/arm: move aarch64_sync_32_to_64 (and vv)
 to cpu code
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-18-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4c55fc0-d60e-a884-c69e-f3b3639caf42@linaro.org>
Date: Wed, 24 Mar 2021 16:11:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-18-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> +
> +
> +

Watch the excessive whitespace.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

