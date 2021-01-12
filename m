Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867902F233D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:09:03 +0100 (CET)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7F8-00075M-K1
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Cn-0005iG-62
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:06:37 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Cl-0004U7-Jx
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:06:36 -0500
Received: by mail-pg1-x536.google.com with SMTP id 15so228881pgx.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n5FZap7gAE9g9CaJLrmxs5NNKN4tivOtO8uV3BqCazA=;
 b=oUDSGYbqwvbd/AGuVhBI5b9EHnBFmXCLv/Zm9FcJqO9sF9enE1f4kQXEM5YhlWeaHL
 pRku1S/YZGTPwgB8PiyRoJ2aCNavkAaexP0Ft9nXn//bYNl6mDMB5F9WXu1IA1c6lQK/
 /8Kq9hoTiC6Umt5Qicgz4c5k8nM2j3MwhRGi7JIm6l7MhjTeRk0UUrmd8EBVNAccpqp5
 hbcey7p1yEBRxPhsIoTdJ3y/yRJbsufPq3eNEhkK2ndsOJEGRx3r/TWEC+7VHwG5S1L/
 0cPtLL1onsUgtxxWpgwpMlUk1u4HPnP+lB62gZaryx2FvQ0wHgquH32QBTnX5Avw/qZ6
 N+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n5FZap7gAE9g9CaJLrmxs5NNKN4tivOtO8uV3BqCazA=;
 b=MpuJTF9Ord3qH4BeGX+LNeNkcULUZtBOHsVmiEUGUJeTUeSNukLZHYZ5EWSEOpaOlI
 Ui9bbouWW6lomY52F/t6DB9p3eiblhs8Re42oCzRIQt6fJq8C2hYGeQl3bNw8tOVjhtv
 FpKedhFUkUl+jf/kHMYbEaqEXxnq1uIuxWtwnfLerkZj/YZ6lsmRpWANiu78k5+7TFlW
 bEAlR2AQeU3CiThAJVtvTKwRCrmn1JdQ0suYCRiBZgQwq62obXXslQoZbASe3d097R9+
 GvtD3HwjdfH4wOfG3dANEKdpVfJdNeHc+owRx+Ue+iECzg7MoxWmaLHv1IudQmlWW72P
 D5mg==
X-Gm-Message-State: AOAM533a/7SP/Vypbxp/ASrs+ELNJu9wtqzmYNopSIARbLiV8lUONzNI
 3Zo8DR3cdd0HLYCI7YslCPeWvlm/sF30tg==
X-Google-Smtp-Source: ABdhPJxQbq2YrRsU+AaOOMlbRu23EY6lnoju/rb8ECuAxHp8YpqMzc1RDBbiuA381gmVVmlpRzhWwQ==
X-Received: by 2002:a63:1c1d:: with SMTP id c29mr1953624pgc.94.1610409993979; 
 Mon, 11 Jan 2021 16:06:33 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 22sm603390pjw.19.2021.01.11.16.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:06:33 -0800 (PST)
Subject: Re: [PATCH 12/18] target/arm: translate NS bit in page-walks
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-12-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2c3a883-145d-0d82-f644-33b3d63e5ef0@linaro.org>
Date: Mon, 11 Jan 2021 14:06:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-12-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

