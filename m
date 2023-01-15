Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35366B462
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 23:52:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHBq0-0007xz-5m; Sun, 15 Jan 2023 17:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHBpw-0007xf-BA
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 17:50:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHBpu-00070A-2Z
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 17:50:47 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso1108626wms.3
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 14:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s74WJFS6EuF5fVqX9oalXUOnC6Ui21sboUsP1OvwxeQ=;
 b=SyXycqOl7qkbL9X+8CLtKrBgFql+SKseWldUW5SmIJzKGpFS1anBX7dQun/zYpKW+W
 xF2NnkKnIduWIAxkveid5sIlQLvV69AVEea8jQ9maQ8vSrwyaS7zEoqtUJFvPAaac8Dm
 q3FgQCMVldpSOCmKmXFK17ipdOGsXFZ9PgL7zHGjJUkvIi3lTRGPHnOA1/k0xX47tztI
 x5ZVnkvS6T3MmyaUdKjlU84Gd/Uyv+/9s+TjzWpH5zjCLcpy8W246KWea6hurNEox1ra
 plBPN1kx0QJFZDyGqoK/gJAuGRg02HL/NbSTz7Te6YdJ/gaxQ22COToQ+8dXm1mws72u
 pELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s74WJFS6EuF5fVqX9oalXUOnC6Ui21sboUsP1OvwxeQ=;
 b=C3g2jWRsz3VoX32rG/zRVd+FbzTEIojI+zXeP1bkrNACSPbXJTSKwvi4z3F88OXj90
 0dCNPqLhzmnY/jSvEjHjyQ6hZsSuanQOaprA3qtzEevyQWc5lo7Ct0z77XE3tHPqhvic
 cb1AaIFymc+RkAb2Hu2bzurRkKcn/QLv57geG/xzYvEVqEZZAWRpcxEtmcrJ97DNzpTF
 S4KPIb9+FovyDsQzDOQb3ctOpLjtiYR1fmvxisoiFV7BoX/Qd9iAPZtwEAqLUXm1qnXA
 +ubKPsvET5U5rrCUPOuwmSCkD/Ps4JqBmhfMRckFkVA/mYl89qz6bwSDkhksO2bJ1XaP
 lvkA==
X-Gm-Message-State: AFqh2kpRPXg7VQrO3BYO3jQhY+NWocYXurtI2TKwQoNYpKlG1xx2UYa5
 3UcJiTwueAcqe/DCjMc/BYmnkQ==
X-Google-Smtp-Source: AMrXdXuGVi4fq5GI27i490uJ7Z3Wsd0VBhQiEB6rF14xC7E6DG7ZlMjrJsAAfaMcGHrvJvoHA2MVvA==
X-Received: by 2002:a05:600c:4349:b0:3da:f665:5b6b with SMTP id
 r9-20020a05600c434900b003daf6655b6bmr3396697wme.25.1673823043125; 
 Sun, 15 Jan 2023 14:50:43 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm28754146wms.1.2023.01.15.14.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 14:50:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BF161FFB7;
 Sun, 15 Jan 2023 22:50:41 +0000 (GMT)
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-2-fcagnin@quarkslab.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
Date: Sun, 15 Jan 2023 22:50:17 +0000
In-reply-to: <20230114161302.94595-2-fcagnin@quarkslab.com>
Message-ID: <871qnvcszj.fsf@linaro.org>
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


francesco.cagnin@gmail.com writes:

> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl' and updating meson to compile
> 'hyp_gdbstub.c', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>


Haven't I reviewed this already? Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

