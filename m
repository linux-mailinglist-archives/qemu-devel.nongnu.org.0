Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290886864A0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:46:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAIU-0006B2-TC; Wed, 01 Feb 2023 05:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIS-0006AT-Q6
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIR-0001tL-8n
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n13so5267739wmr.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=w5L4Ug4xrpgZEUtTq/XzsAMGrL7LLYfe1cDRkZ0lChLaI+vIfD43ugYbluQIU1cHa2
 5S2u+jujC0KBOke2fR1GSrnCa/sH9FWYy3S2hLaQWvKuOMCkGtAtFxlimeG9iAKa095I
 DH9CB+fk6SzJarHHbC4SCskGY5NuJqp6pnXHiONW/UWhRkmXeLfHFym4x8reIJRuIBok
 P5PgCUwZ3MU55jJjk3tjtj5Jak0iq3/RWZk6YgkiEInpr6CA5MSpNI8xshzZW9dyvv76
 qGhRwbHKG7NYTQFtqPDP96ZOR8KtpK5pIlSsqQAMeaLkCSka2gNq98xNr5bAxtk08DmE
 sc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=6E1AmZSuezrtnyXmtdo6tKlELbjaEA9b/XGW3HoBNZGz4mH36knuDXl1ttzfx8AFgt
 8r33wv5OX12bZuusO2l7NbZFF2DSd9OmeyuFGMdD5zucFP0CeL8Amt8Hs6Db8eHp4vhc
 LHGwmA4TFBCP9sRFZMradI+sO3KfmumLDL3CP0oi2Gd+plTg6/ViP2G01y4KRbVWzct/
 2W2EVV8MHKlBP8I/tbKzqaWOPREtwGAHI7YQJ7LptgYuLqIL1uUCRr6VQtUil45PBwKb
 UyxFSN7Jz9+Ez071e+OSoxHX6mvsx/qoJBoHuM2ncIqoM7vl8WcpJ100Vpd9MXNCwAJ9
 LUjw==
X-Gm-Message-State: AO0yUKU9+6moNNKKJq09KoTrGUmQFfPxL23JSkmOhSf1gikpcpjsM/e6
 OBBvvG+RRaO+Pd1EhEFtnsoFqw==
X-Google-Smtp-Source: AK7set/XUCutzmpWAx95xW3KGGxt3HE2ztbjAhgyLF8GTv/Vyq5V44tYW83O4ZgUk8uuZSMQyLfSJg==
X-Received: by 2002:a05:600c:1c88:b0:3dc:1687:9ba2 with SMTP id
 k8-20020a05600c1c8800b003dc16879ba2mr1523059wms.35.1675247093908; 
 Wed, 01 Feb 2023 02:24:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c071500b003da28dfdedcsm1319243wmn.5.2023.02.01.02.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:24:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26DF11FFB7;
 Wed,  1 Feb 2023 10:24:53 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <c9c0f70c68d9fb37eb8cd397bf89a92a31c84ba0.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 6/9] Updated the FSF address in file
 tests/unit/rcutorture.c
Date: Wed, 01 Feb 2023 10:24:49 +0000
In-reply-to: <c9c0f70c68d9fb37eb8cd397bf89a92a31c84ba0.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <875yclsmx6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

