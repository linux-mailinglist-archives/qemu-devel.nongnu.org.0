Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B552532F14
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:37:27 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXXC-0007Ly-A2
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWja-0002Ww-D7
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:46:12 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWjY-0006CB-27
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:46:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id j28so23545368eda.13
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sIbaY8ZKt1Z7HL5Scv272Yrd5GAJzQ+u1B+IktUW/Tw=;
 b=MHUDtgebx2pSsxKLs5gwbI2JVMqVrjP4KSSgGWseoBRb4xbeHsifMlkVaTifQyW2Zk
 UYZ7aU6zc0W4gjv9a9hGOzRiDk7yT+ucrRbwEaO45Mm5i/1Y/m30x6tWaNU6mgzhsGqU
 CapRApVxcQnCP2wsJWDP9kYZwuVoW5PgqGOGEul/b+ncIdgDV/E2IYMazXIfhnfvpifA
 AuqzQnn0Qg2ASU793722sf2/ahM0ITLw3ZFC08lKyoJgciY4aLnHhZ8Q9zpQFRdbHTwy
 SCugTY6tKOaPY/f9NUXK4hgvYMcTHFTdiF+3QwLR5kcyV45BrVeYshkjF038WNPkuRgq
 EYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sIbaY8ZKt1Z7HL5Scv272Yrd5GAJzQ+u1B+IktUW/Tw=;
 b=jGPeJfahm5gaTmKF7WZhiy4vaPGYjnzqQ2OEEBkJz/Z9tPFcTIOHoyAai4DLrA7vht
 lsvETU6SW5/Y9zAI/DGiYCnJJkTFwdDN9tK9RPhnrLbHjVBf/8qjmyARRVsdN8FQwh//
 dD954oFc1ky+Pye8dC3H8ujhekwptVEoaI5PnQjYiyF/LB7tvDS+/kDv+039lOvKR/0b
 4kqSSttRN09U6FWNUnJR5zhSpZ0Xu4ZzAA+GPdAQXiZ/Yp/KNVZ8VCD1b0vtMGl4jZ7g
 +OPqiHQqm9ruPj2m8kLBqd1fWzeceWUfTOw615bJhMVl8k904yZOtcZgJSLDKLvDTJK/
 IOMw==
X-Gm-Message-State: AOAM532PuVZir9qOs64oTlOvhG0h9Ns1Lptplqw1hH6Zb2X7C78bPQEQ
 9mGIWeFdqwd5I/i1pYodDS/qTg==
X-Google-Smtp-Source: ABdhPJwc3Dyn5vh0V1l0ThTWqfiL+IUWpdSQbh237QyY1CmQ0ijvyDQSCeHrgd8evdcg2LwygBTmQQ==
X-Received: by 2002:a05:6402:31e5:b0:42a:b724:c567 with SMTP id
 dy5-20020a05640231e500b0042ab724c567mr29469935edb.347.1653407165449; 
 Tue, 24 May 2022 08:46:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 jp10-20020a170906f74a00b006feec47dae9sm2012420ejb.157.2022.05.24.08.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:46:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EA241FFBA;
 Tue, 24 May 2022 16:46:04 +0100 (BST)
References: <20220524093141.91012-1-thuth@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH] .gitlab-ci.d/container-cross: Fix RISC-V container
 dependencies / stages
Date: Tue, 24 May 2022 16:45:58 +0100
In-reply-to: <20220524093141.91012-1-thuth@redhat.com>
Message-ID: <87czg36iis.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The "riscv64-debian-cross-container" job does not depend on any other
> container job from the first stage, so we can move it to the first
> stage, too.
>
> The "riscv64-debian-test-cross-container" job needs the debian11
> container, so we should add a proper "needs:" statement here.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

