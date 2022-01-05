Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620014852BA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:39:07 +0100 (CET)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55ZH-0004EK-ER
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n55W3-0002SB-0D
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:35:43 -0500
Received: from [2a00:1450:4864:20::431] (port=40663
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n55W1-0000LA-BS
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:35:42 -0500
Received: by mail-wr1-x431.google.com with SMTP id l10so1340622wrh.7
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 04:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WVt+iOm/bEWj6sWC2fRYGab8NEn8jMqjrHxQKxtPbrY=;
 b=dIuc8T4MwkhlU5hHXoNUbWVcRkpKSamxe7AKrNgE6p1SBLwKW03GFY0ADPbHEGaoHB
 qqQJAvShf8YB9TT18FrnUIVgCroXbQzb71zes0iiEP9y304ZheRJKSyxOoSXjz/8r0nu
 SDhsHm/Yj/+8D0PmsjDT4CrHMWHBpn1Lx4XQkqCTyhnhjjzh9ayC5u7EZcuAOi66VWNK
 etXtBLtV6WRttvyCd1LXyHERK3v9yOGStJkTrjw7vLcrFTpqUz+NPhcme9d9hQgl1MtS
 aTfWvS0WLTxjz9sIlLMv9KImG9FqUUIjxbMxC8rxBjD6oKv+b6LbjlfafaIdi6v1rwkl
 povg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WVt+iOm/bEWj6sWC2fRYGab8NEn8jMqjrHxQKxtPbrY=;
 b=BGinsn9JnfFVNTVRivTAML1PBpfHCQKYNfrLln+zgnADd6jCH9G+kBwSBMtfZtOib9
 fcT145DWhOSiqEeHpHArK9a2UCBqz/X5Ezf+/Sn/gKm5V5x5vYayOBiEKNvRF835gqcx
 RsSdNSTeaear2bGXqEd/a0WxxL5pHyboiKHCroqhvLSSZ6T7b4X3N+v8ihtX0KlAgcSA
 t4TrIwpQYcd1fb5dnRzxXzvyDjJcVlROUM+C+wvY2fl6tKe0HxMpNMTM+SS3wFIgovuh
 /J5Ky7Zox//S21q4ScYV6ye3Esg9fHpUrvrLu6a8/yqtIyme1w5HQhR7R/O6WCMCHJ/b
 m9fw==
X-Gm-Message-State: AOAM531nVYQD/gCoXHTHsvqx4KnsM4vL9vT583e7mkPklVu/RVkOxPH5
 RIeozvIkGMEjCNqPvc3ekLEi6i0etSc6/g==
X-Google-Smtp-Source: ABdhPJznCM9X2rmcDP+Uv4TugFPHfHbTKrh8r3Mn5xxNAOtbaIhlwC45HZ5YaVA4nroKqMJZ8qRtjA==
X-Received: by 2002:adf:f051:: with SMTP id t17mr45945293wro.192.1641386138755; 
 Wed, 05 Jan 2022 04:35:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f10sm2649733wmq.16.2022.01.05.04.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 04:35:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A7EE91FFB7;
 Wed,  5 Jan 2022 12:35:36 +0000 (GMT)
References: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] docs/sphinx: fix compatibility with sphinx < 1.8
Date: Wed, 05 Jan 2022 12:35:12 +0000
In-reply-to: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
Message-ID: <87lezujr6v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> SphinxDirective was added with sphinx 1.8 (2018-09-13).
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Queued to testing/next (as I need it for Thomas's API updates), thanks.


--=20
Alex Benn=C3=A9e

