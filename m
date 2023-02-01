Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661B686465
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAIi-0006D4-ON; Wed, 01 Feb 2023 05:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIg-0006CO-Bg
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:25:10 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIe-00024l-Tk
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:25:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso1003361wmq.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKelXlTvg7PFnZiFd/GH2jZXxuq2ysuy7rbTT3HjiAs=;
 b=F9fSRyKVsl2s4ZQLS6hVKuSRveLcQIKZQJ0DsqHhTIXDsBHXqXnOnOhLTrhmkkrP++
 9/jT2/iL7UcVOTyyZKamxLrWJeBzGPy3FG3loCWghef24k+Sz6IfQZZDAYvb0VIIOkbY
 NsR6bWi4JAl9mbn/sntM7UYzqlnu5+6QkOEuzkSa1u9c1genUaIiKpqfxOhVn4A+hKgs
 QJLICuanDUp10np9t4snJelQlBxYvjS6uJUOG8Yo9G8QhKV5lqI+dVvEjpuovD8xd6Pa
 99odcda1meO3D88FzoqYcow+1i7sKarDUB36qkhKBcq+dSC1O4/Xyq9Y+Kxf54n3Izle
 xCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sKelXlTvg7PFnZiFd/GH2jZXxuq2ysuy7rbTT3HjiAs=;
 b=kfI+V4GrQDClZKCpJcnZTERH86k5m+qmMZZ9A39MRcUwtWqwDctaep/dnL6qmoFfdp
 zhl//KQDvhbGOqhkAe2cVqTGvpCuSrBlktGHRVwEUexb1aj/F2Yy61FbgNVsUNBF3wr8
 GJhh6r/79vT1YIz5g7QIhGiogYvRRuQShf2U7RR65wi6nkUJobA76l+mKHpdtjG4Jo32
 xxJfjvqF3DIHuTMzgULa5uUG0VlCdO9OiSEqJ7af/BG5QeO8iDMceGnGdcFHvEuKeumj
 RjyiKUvcF4fL764HSDBvzv0n/jFh6zbPGdcHsBRPCP8DXBjt8eP7jUVD7mTIV0yKBCUy
 eIsA==
X-Gm-Message-State: AO0yUKW37JldqIx+Sn/c0/6UMnL1yz+dF/heTGbrqUwvFqi3qnJGYUXk
 /WYOEbdrqcgm2fX2/eMakVIN6g==
X-Google-Smtp-Source: AK7set9gG7g0GF6GW9ghbHyFXMUTnEOZjZwUlte7idfJ2lNR5CZlDR/AVZfFM5Ch2+z2eK/mXWEZxw==
X-Received: by 2002:a05:600c:5127:b0:3db:254e:59a9 with SMTP id
 o39-20020a05600c512700b003db254e59a9mr1492398wms.15.1675247106556; 
 Wed, 01 Feb 2023 02:25:06 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm1279978wme.10.2023.02.01.02.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:25:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B69ED1FFB7;
 Wed,  1 Feb 2023 10:25:05 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <58bb1e1b7c97931620cd21de0b71d9893b66fae7.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 7/9] Updated the FSF address in file util/uri.c
Date: Wed, 01 Feb 2023 10:24:57 +0000
In-reply-to: <58bb1e1b7c97931620cd21de0b71d9893b66fae7.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <871qn9smwu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

