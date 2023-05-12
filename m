Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A870030C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 10:56:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxOZB-0006Pz-Ak; Fri, 12 May 2023 04:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxOZA-0006Pq-41
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:55:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxOZ8-0006l6-Jf
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:55:55 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f42c865535so41145385e9.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683881747; x=1686473747;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsZwZbKQVjW+U53iJsH2OZwNL/ASV1M7eyzdTCoADWs=;
 b=paeeD7HHMlHvY/L7fWcJ1uzf9U67BnjYFpxBTcFiK18Z5dJc0f209eqzgJC0O4qoaC
 m/WPq8b/nJZ2m+pSBptWtNwa1BKOtdPJIVzOETwLqA0qItnUcSF3uRcFzF5f6Srlv2Np
 +9r4w0ZVBnU4DuMdjpy6lLa4+MjH1Rx/bKg6vYTNXyp/rU9u/SisI7bn+8uLsNiw2+08
 +DMiryNbLl9W/H9DzWJ2Xdw8vKiLXNONUXQR4AYdr7ZrCNskykDCPHbQtq+Xd7bsw0il
 JChbUG9OocMwFkkNOOqNeryeVb3voz6Ntrj/cpGqKcwSpdqWpRTc5SNoPoBjW3nHxPwV
 m0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683881747; x=1686473747;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DsZwZbKQVjW+U53iJsH2OZwNL/ASV1M7eyzdTCoADWs=;
 b=Diyc4gKEmQm5lUpTCvp9DYnMGzhpp+4hFmJowhWXShKs84TN47N1rvm9ZHopPEyymW
 EREG2xtuznx/u1H0LkR9geagsVhlYfkaOL8yH9rmJ9Vjbv9h5tK3evs0SI7QPFJONGXX
 iodHzriPNWBJmgzUt7e518v5J0T89mAzBgAHt5gNpsPKmhNKgr3wTrp/AA1g+3VmYzb+
 h/ruVp0FY+ULvdk1iYT+4SzGpT9ErKRP4xu0rMXwWsJGZ4IGetiWgzf5tKFSx/E2Dt3l
 VbGrKcGHqV49NuJyj4SRmSHWNiwEOsVEVjjm9wVU46dSuRaLpIW7y65gUgE4YXyctEGt
 RHJQ==
X-Gm-Message-State: AC+VfDzyH2c8+wj6IC3I7k1voxMEm7Rfe4AufRYn2ytba9t9G9IPy8mJ
 U2eFRtfFd7Wh4S5GB8J6yY6dA1VJm0Q0wNSCFwybxw==
X-Google-Smtp-Source: ACHHUZ4ctAK/hHgxRet2rI+5MRTumeKiuFqobbnAOgQasoaHN8FIpl/oK174SnWlrhc0I6Z9rJuPHw==
X-Received: by 2002:adf:e948:0:b0:2f6:ca0d:ec1c with SMTP id
 m8-20020adfe948000000b002f6ca0dec1cmr16363041wrn.10.1683881747610; 
 Fri, 12 May 2023 01:55:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a5d5959000000b00307d58b3da9sm1920623wri.25.2023.05.12.01.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 01:55:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC3231FFBB;
 Fri, 12 May 2023 09:55:46 +0100 (BST)
References: <20211004071203.2092017-1-kchamart@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, =?utf-8?Q?Daniel_P=2E_Berr?=
 =?utf-8?Q?ang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] docs: build-system: rename "default-configs" to "configs"
Date: Fri, 12 May 2023 09:55:34 +0100
In-reply-to: <20211004071203.2092017-1-kchamart@redhat.com>
Message-ID: <87h6six71p.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Kashyap Chamarthy <kchamart@redhat.com> writes:

> Commit 812b31d3f9 (configs: rename default-configs to configs and
> reorganise, 2021-07-07) did the rename.
>
> Reflect that update also in the documentation.

Thanks for fixing this up.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

