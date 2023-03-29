Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6BE6CF0AB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:09:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZHg-0007kn-65; Wed, 29 Mar 2023 13:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phZHc-0007jp-9U
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:08:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phZHa-00059c-Px
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:08:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e18so16492549wra.9
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680109700;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UQQMiHQCNCAQw6ed1M7x/nW/8fpp+ROfrnEF1xMS3M=;
 b=p3aJO8oHLnoq1XfXwxwUHYKowjbcblmfJU3CuA1FFJYOGTDMW+sXekmOiL65tk2j7F
 nHceSwr6zfSMdKj3pS2EWp+RSlJ5eLcbi2dsZ2Qo66tISrhrdPyfdEnnhK45e2sa4qSC
 +4JWSzDHjEX6U/BgTN/IpqVNrr3TFe2RM+FaA0ox3/8fGrj6aq+qa7wwiMYFdD9EySvm
 1G8y17ZaiN7qk2Fso/Q0ZmjNRalmcSOoGepZxjJaH87q9QfYVxmkOWSPnPaUHwEso5Hq
 PZNwR6kJuCrLr56Zc68oxNVECDqDQpeiKA2eI/lnZnAX74tgOJMbtaT3laYdPZnFK9yx
 IB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680109700;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/UQQMiHQCNCAQw6ed1M7x/nW/8fpp+ROfrnEF1xMS3M=;
 b=z+73I8ReiPQMxyL/8n9Mm17zRijCIh+KBA/yP7u6lJsCcld/7Ux3dUy5G/9zPxKbOQ
 9whJ50K6wo0WAwK4OJpf7kJZ6610Yfa1SgE6uKE78HmzEvYoWEfagQD+gGpCdNoVTQSy
 aciZ7362wImR8ovj8Bv7OQaRtqg+u0fZbYhduVdCLKW/YapWFFHeU7KpvEuMxcteach7
 NsMhmAQ62W0KEnXciL/E2W+Hm8vNoqOMaUIjK8mFiJ0/tG4IhWyfnaVgBh9cTIO7V2bm
 +RFteGXaQGqxgqffpe2cnV1sBcthi42LFnIji0vMWiYjuykLz2RF8L4LbMCMOQm6r7iG
 gpRw==
X-Gm-Message-State: AAQBX9dtXa8vPZRabccrPuegdtRRRbJP3+X0pk5O2qvl1x3LiZOTL/Bj
 z/jCZCCAxRC5gkEhVGPOfvOJJQ==
X-Google-Smtp-Source: AKy350bsTQmShOwzGp+qJL5khpQIHQRjO/PqD63kMs8hg2tRemH3WMQilY1QIlJCDGdpC9S4Nwr8Rg==
X-Received: by 2002:a5d:66cd:0:b0:2d1:5698:3f70 with SMTP id
 k13-20020a5d66cd000000b002d156983f70mr2360723wrw.29.1680109700607; 
 Wed, 29 Mar 2023 10:08:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a5d4dcb000000b002cfe3f842c8sm30387797wru.56.2023.03.29.10.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:08:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED4C81FFB7;
 Wed, 29 Mar 2023 18:08:19 +0100 (BST)
References: <20230329124539.822022-1-berrange@redhat.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>
Subject: Re: [PATCH for 8.0] tests/qemu-iotests: explicitly invoke 'check'
 via 'python'
Date: Wed, 29 Mar 2023 18:08:14 +0100
In-reply-to: <20230329124539.822022-1-berrange@redhat.com>
Message-ID: <877cuzqyd8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

> The 'check' script will use "#!/usr/bin/env python3" by default
> to locate python, but this doesn't work in distros which lack a
> bare 'python3' binary like NetBSD.
>
> We need to explicitly invoke 'check' by referring to the 'python'
> variable in meson, which resolves to the detected python binary
> that QEMU intends to use.
>
> This fixes a regression introduced by
>
>   commit 51ab5f8bd795d8980351f8531e54995ff9e6d163
>   Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>   Date:   Wed Mar 15 17:43:23 2023 +0000
>
>     iotests: register each I/O test separately with meson
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Queued to for-8.0/more-misc-fixes, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

