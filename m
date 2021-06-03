Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F339A3AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:50:12 +0200 (CEST)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loofj-00075p-A1
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looeA-0005nq-Nw
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:48:34 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looe8-0005WD-SF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:48:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 t16-20020a05600c1990b02901a0d45ff03aso2520952wmq.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=n8FObHRCrnZgf7om3WWszRl3fWBjGGtsX634Dc24zY4=;
 b=SAFx41fyvopKtK8RMSIOzH33Oxfn6g8+Jr2SANlE1JEGHlmQNOlPsWhY/0zBZTmC8l
 GSD1uOpHLRqhorA4yVqFgGAHPTit8mYS2wuquYzCYqmVbkCtTpqkgFOpIJBNuP7C0kMp
 vHT8Mtc6AFqetYpmzplzFwOLKkkSSp6pVgL5cKUoK84Bb0ZdozlTBIz9apUW84z8ca3B
 q6tqo15ASBBh5lTgwdNd8TLNbrUEKyMReIEAbaXwaCy5bjq3hxxGmCLmQMuuKbB2iOlx
 Me0oLypf3P693s9aRqBke0Cjzltz/DEl/b0Jey8yib6U2F37HQdB/NHkwX2lTL7vSZ79
 3AUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=n8FObHRCrnZgf7om3WWszRl3fWBjGGtsX634Dc24zY4=;
 b=IEsqc+8a2LUKbXJ1rPxXnLfL9jpvyZ0Ke5Z4MEHFgd7mCYk1eSdNerN5/4tF5LmZb4
 op8IiJARWBJw+Nit7T7wWUxWvHlm8COs8BHS1EZ6naHUyZOcIfnjDbVjFo386MzaIeBM
 Zwxicwgoeey0kBAE6w+CLhUWV7XQ8Nyb4+ANHKT6L6HdEJ5uMnS6lojgiqJbycwGaD/L
 6K39i8q5vGiwhtdBMUybq09PksGX1Nqeslt6+Q5lO7nxL8Tk/NoBzSVIyOatoG5Ah+IU
 B2NinxwGXRjgQ/birxgMu9AW34D/Jc1F7lJPlGe7gPk7ZazD2/q9X29akiMlRj2IglYI
 Gzcg==
X-Gm-Message-State: AOAM533pIEXGaCq9ZoEA5jPFeEOpUjkaiB4smiiVqtzwmw2zHpq8pVji
 oTSiwHEPYPtynWki5nhR0eREnw==
X-Google-Smtp-Source: ABdhPJyemr+vp97XDZiuBgvuEPgjYV3HqvIsrdwHLHQ7BpGLgo2tGUdzBXaaR/R+lIp/N8RZ0PAETw==
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr10904313wmq.112.1622731710962; 
 Thu, 03 Jun 2021 07:48:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm3955946wrb.77.2021.06.03.07.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:48:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E63AE1FF7E;
 Thu,  3 Jun 2021 15:48:28 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-27-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 26/28] softfloat: Convert modrem operations to
 FloatParts
Date: Thu, 03 Jun 2021 15:48:22 +0100
In-reply-to: <20210525150706.294968-27-richard.henderson@linaro.org>
Message-ID: <878s3r80n7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_modrem.  This was the last use of a lot
> of the legacy infrastructure, so remove it as required.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

