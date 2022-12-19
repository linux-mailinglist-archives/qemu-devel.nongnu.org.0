Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF1651134
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jw8-0005kf-M6; Mon, 19 Dec 2022 12:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Jw6-0005jM-JP
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:28:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Jw5-0004AW-4D
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:28:22 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so5981846wml.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=663V90AgS/UuRMrfak+4J+HaRFrOB9P3n7PoW+0bJAU=;
 b=nn/TW/c1x25s3rSF5r2Vmgr1QR51cjOwKDUl+53dZ1wTI/pxwdWszR499H57S2KGQd
 JNo7Q/x51ZYXNjcezSdyYwBA3KwqmsuC1GBNU689MW8e7C0YPIhiUSKbtUYO6GsioKxN
 gNmsbdmZfmVzvUQtAAq/t+jcA8iAb1arSvNPITGAMWaI2K2L+ECzKZ4iekNonalCG7Pn
 RXYhH/Ama3MKRXbW8PAWSPAhEjK9//USabAQ6M1n/WbhKmzYkiMt1bMZbIAFBoZ3AGR3
 QbuSeVRbji2S8Rhs9mWkZK5Cn3IqFuACbNjnJXrjZRuIimNFSkAtd+Bi1vQ6TPo0O21H
 +ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=663V90AgS/UuRMrfak+4J+HaRFrOB9P3n7PoW+0bJAU=;
 b=IowNbMBOMFPGvtKkRkNqm5j93ByLLZ3RLZHD+qkdxQXBa4lyxHLegLebKuxhna3rpV
 EOoDqom6MG4VwuE2CHWIwl+RAfvaWC9br7PaYs5Dhoqwbsw24R+HC7D0d6h+G+vSIfL0
 FDXHdTJqptpV1H1nqRGCNV3T4JNjJg8PqoG8ughlVyS330BCgVo8DyxyyCXcyOrdIwk7
 DT+hUk1oVnldrYGSre47yk3SHaycS+/u4ikllpxNmTpWNtH2UaQR6VTMG0A0IT4MlK+q
 2CXhfvAVYrJq5JDHHrJJVhwVIWTNrQt1oY3fuA7bw6b4ek9LUToAwBuuD2xSACtBchn1
 aIzg==
X-Gm-Message-State: ANoB5plESuA7KjyGJa/MLeSKht8jB9CYWoM1m/62jYJUJ7xab8d+l7Pz
 HPGvBHnnb3JxTpGXJRUz/22spQ==
X-Google-Smtp-Source: AA0mqf45sFj7DGFMlBO1A2HHXN7sX8k2Drj1v0KUBFU0JBS0vRrwTZrRy/UZLlNIRQJQNqRUVTd6ww==
X-Received: by 2002:a05:600c:502c:b0:3cf:900c:de6b with SMTP id
 n44-20020a05600c502c00b003cf900cde6bmr32734728wmr.15.1671470898955; 
 Mon, 19 Dec 2022 09:28:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v32-20020a05600c4da000b003d359aa353csm2965576wmp.45.2022.12.19.09.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:28:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CD631FFB7;
 Mon, 19 Dec 2022 17:28:18 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-21-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 20/27] tcg: Vary the allocation size for TCGOp
Date: Mon, 19 Dec 2022 17:28:11 +0000
In-reply-to: <20221213212541.1820840-21-richard.henderson@linaro.org>
Message-ID: <874jtrjob1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> We have been allocating a worst case number of arguments
> to support calls.  Instead, allow the size to vary.
> By default leave space for 4 args, to maximize reuse,
> but allow calls to increase the number of args to 32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

