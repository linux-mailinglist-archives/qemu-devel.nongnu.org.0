Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C322A69A2FE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 01:40:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSomC-0007Mg-24; Thu, 16 Feb 2023 19:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSom9-0007MF-HF
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 19:38:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSom2-0001ZS-2Z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 19:38:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so3153481wms.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 16:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jKoG3CFBufX1Ftw0q6YJkqmJ6agMGlJr/x63nDitmT8=;
 b=DlqtgJUJMgR08UxbuSD3zKjuMWquWKv7zhOWKvGfadAr/wx5sseBKPevIUe+1UQ629
 Is1QATk5WfmG6oyggFncoIwgbWC+9c5BCC70I9MgwhAm1Ingup7Pu87GoZhuOCb6cqVe
 L5Dd7SYbNENbsf95Zg9H3a4dufYwgTxAa6kQtseJLiye/AQn52NR+EtuxetNuwwFV1il
 xTL5k8ynVPBT0DP/WG7KtyRVQxeTpFqFFWhOY20En9wCy+LLyvCHvlxixyQMgNMhXXx1
 rrwF3al9z2SZUL3Qsi1LYcSql+nAGyWSGqWKz3jkghS8Y0sgocAc6i71tl4mCE4QHYcj
 LM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jKoG3CFBufX1Ftw0q6YJkqmJ6agMGlJr/x63nDitmT8=;
 b=Yb6KSzF7fym+Lp6o0DRvTb2UeOUI436L3Czvzw5a4IPxzJi4GTLcduzubiea3l33TS
 kh8tAtSQ2cZPX4uUZIp+GEdPRR4h9vcJGqb60cVg6+1La0qbELNtWLfR4yuQV9Zd8Xlx
 BCmmziXXZW1s/5tiHP1GL/zRS0lWjK5sfwEFiE4hVDtSxb9TfSE4+ZecMaBLQeRpP8VB
 ZG352RPonX+nB0V+57i9qWMSWfZxtPs8mvN1wO0ZM7q5CNmwUgWJNBEjHR/9aZA7AB4v
 Hn6CeAGUMbnjV3cQhG+1M9939v+QipuBuIA0S+cr48+HqB5FtTcxy3ZfC1QHbVFLOkbi
 3E+A==
X-Gm-Message-State: AO0yUKV1WJ2jOIjN4RVlUj4Yjbiew9dmxCFlfo5dK7YdFm9wq1CuPfJx
 3pyDd8UfzhvRHPw2A2np3+hSHw==
X-Google-Smtp-Source: AK7set8LAOA6ShBNWrKOSGi8iDAsWFSLDWLmi/TjgXwhuC6TX+7ruqU+jSA0COUFvlo5SCletIFMPw==
X-Received: by 2002:a05:600c:4f93:b0:3dd:1bd3:4f6d with SMTP id
 n19-20020a05600c4f9300b003dd1bd34f6dmr5917357wmq.32.1676594326554; 
 Thu, 16 Feb 2023 16:38:46 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c024400b003e01493b136sm6812374wmj.43.2023.02.16.16.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 16:38:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE24E1FFB7;
 Fri, 17 Feb 2023 00:38:45 +0000 (GMT)
References: <20230216233353.13944-1-imp@bsdimp.com>
 <20230216233353.13944-3-imp@bsdimp.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 02/11] build: Don't specify -no-pie for --static
 user-mode programs
Date: Fri, 17 Feb 2023 00:38:24 +0000
In-reply-to: <20230216233353.13944-3-imp@bsdimp.com>
Message-ID: <87pma96s8a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Warner Losh <imp@bsdimp.com> writes:

> When building with clang, -no-pie gives a warning on every single build,
> so remove it.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

