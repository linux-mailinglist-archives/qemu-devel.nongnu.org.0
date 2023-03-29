Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE226CF0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:09:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZIR-00083d-Ii; Wed, 29 Mar 2023 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phZIH-00083C-3m
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:09:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phZIE-0005OP-Vf
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:09:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id r29so16466664wra.13
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680109740;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rek2raNJL4c9ekpCXtCSVgK6Uw98/m+KLWday93AYlI=;
 b=bDk4z2ET1q89GwGpsBn9+3BAkLvwQSHyBGlwxTbqbWKgsw9w7F5Feob7QSH7vKts05
 2mZbuAp1yNZXv8MzxAoe4R60fg+Cypp90mL8QGArw+C8GZe8/0ajY5kMOkHZaAQvkeEK
 x6aVq7Q7DpHH8D54axDZhF58UFpKvhONo69VUKyccM2PTF4pFM4u6/dEpFLXAbBSHbAj
 EnmG006aCA2VXhjXeLplwv+riRdfkFAcnAaZjred9oPAiwd4DKthlVrIcmhCqn0wXpCu
 0mpfM95aILVHkYlDVvBR+I0Noc7OMjQpHDOpqNBM7Eot1TYUdU0o8Yt2Ox34pim0/Qx6
 ltCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680109740;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rek2raNJL4c9ekpCXtCSVgK6Uw98/m+KLWday93AYlI=;
 b=5PayfXlls2B08BiJ0kBI98zjaAvu05f3AK0LzvBX8A8sX4RLd2EGs/8sOEb/fTSL91
 wr7CGtDABmMYhEiIWijy1LMN3XxHVqkcsapv2bhU58/Qt38Nx4vWFeWLp3UyVERrRYld
 xH9UKVB67bVnf3wu1p+JNKQ/Dyynxc1CregYmmd8Ul/CTbokor6vnuYDYxYpyoq4wEq9
 +rRtS38oHl/UYQgny65Ru3tc44XtRAQABLJQYveB3VVahq947PFa7tqLE8QLnov1v2Dg
 yb0v/TXIMgh60LzAMspXNx7W9VQONGaCarEuYvA7l8JjS+NV+9ONEI4oObmkyERCFsY8
 ShMQ==
X-Gm-Message-State: AAQBX9cC7qj9o4VaMAzUCnq4bPjqKzCz2e4BwG0gQJ99STpappeAY1Dv
 dsdekzLL5DGNTdj0kAHhFXY61w==
X-Google-Smtp-Source: AKy350YdLqJFEaYKiuIbXevM+ik4R07G0VOUIcHxS24bu62J78lrUUhm7/SwVkzA7vZ2Keo2cQkcVw==
X-Received: by 2002:a5d:4f05:0:b0:2cf:e74f:2957 with SMTP id
 c5-20020a5d4f05000000b002cfe74f2957mr15819340wru.33.1680109740053; 
 Wed, 29 Mar 2023 10:09:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d4889000000b002c559843748sm30620942wrq.10.2023.03.29.10.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:08:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 692EA1FFB7;
 Wed, 29 Mar 2023 18:08:59 +0100 (BST)
References: <20230329124601.822209-1-berrange@redhat.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Reinoud
 Zandijk <reinoud@netbsd.org>, Warner Losh <imp@bsdimp.com>, Ryo ONODERA
 <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>
Subject: Re: [PATCH] tests/vm: use the default system python for NetBSD
Date: Wed, 29 Mar 2023 18:08:54 +0100
In-reply-to: <20230329124601.822209-1-berrange@redhat.com>
Message-ID: <87355nqyc4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Currently our NetBSD VM recipe requests instal of the python37 package
> and explicitly tells QEMU to use that version of python. Since the
> NetBSD base ISO was updated to version 9.3 though, the default system
> python version is 3.9 which is sufficiently new for QEMU to rely on.
> Rather than requesting an older python, just test against the default
> system python which is what most users will have.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Queued to for-8.0/more-misc-fixes, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

