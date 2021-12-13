Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA4A472BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:59:46 +0100 (CET)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjzd-0003tJ-53
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjwn-00016K-Vg
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:56:49 -0500
Received: from [2a00:1450:4864:20::330] (port=56011
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjwg-0005fJ-3P
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:56:49 -0500
Received: by mail-wm1-x330.google.com with SMTP id p18so11683854wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eY2gNvZ9LMEp9aNLP76ZaLaqPxyQNttLzcjAj5OM944=;
 b=TykV81wZ0TZL2IfaxRsSmU25BkBsGl28EaqD5jAlpB2XTPtb7u1kigDZKHdDrNl1R8
 Cwn55e/ou+W1CUNK4X1BH5bUHZsEmqb0xE75g7ZVgT1cbjgswmZcwMroMLbAsD6wnJ3/
 HYAQHeHLC2BfRuahxNTm2BEkj9rHvjq9EnZ9VHWbjKpvZWQ8zAEWCj41rpfateK2Q4zL
 sK4qqvsCP/A2y6M6k2VRHSTEmXwE3uAd2grCffIK7EjAboB2oisxbbAhVcgJE8LxEixC
 IMCn0hPtSxez6ba+j7Yxbz8+/I43Mf7kUwAFe0wVVpA05hXHVboEBtKk1FhtB9Tm8LoK
 weOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eY2gNvZ9LMEp9aNLP76ZaLaqPxyQNttLzcjAj5OM944=;
 b=5ls9kB1so1U7L5GXeqTXJu5hWyO787+D+hdIlfdiFg2+4CRGevvIbT7/VAlSAgOOs3
 Ev5Ao094CzI+0rzf295KIcofqBftfCiXhFHAAhpDjw5iOCWp2iMJkk01Da0qgQGH6erK
 iEp2ma508cxB9Kbg4VN3CsglGwUai/uVLDH4bdnBZG3Kl7J66LEtN8PQbtsCRQGh8+kG
 DZGBL1R3F9N0QmijFjmbxD49iIEsHfrgeHHCzvKze2bcR1n1MIHyP4YhsaV8imbhtYX6
 yJnu65Qqn7wvopJCrqdUkzA78WO/GPrK7n1Wo8r/lFtkOiLRUhW2NnEtCHt8eL9atbao
 5pqw==
X-Gm-Message-State: AOAM532Ezg3CYo4uOfpUj7XuniWWWVHfEtl8Wp37ila8G0LVy2KdzhU1
 eYHdBJqDQog1A9SgVv3yL8b2vw==
X-Google-Smtp-Source: ABdhPJxXPsEBuQlfmd6ciapy+DKCYVcGBbT5fzcjd1UQXHQXGrrPSUZ+tj5mbaIKzSj9RzBrQz5RAw==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr35749112wmq.176.1639396596792; 
 Mon, 13 Dec 2021 03:56:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e3sm10840630wrp.8.2021.12.13.03.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:56:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 789FD1FF96;
 Mon, 13 Dec 2021 11:56:35 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-11-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
Date: Mon, 13 Dec 2021 11:56:30 +0000
In-reply-to: <20211211191135.1764649-11-peter.maydell@linaro.org>
Message-ID: <87y24olnv0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently the ITS code that reads and writes DTEs uses open-coded
> shift-and-mask to assemble the various fields into the 64-bit DTE
> word.  The names of the macros used for mask and shift values are
> also somewhat inconsistent, and don't follow our usual convention
> that a MASK macro should specify the bits in their place in the word.
> Replace all these with use of the FIELD macro.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

