Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F140BF96
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 08:18:18 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQOFL-0000GC-CC
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 02:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQOCp-0007J9-3G
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 02:15:39 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQOCn-0004Im-BJ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 02:15:38 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso3844270wme.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 23:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZEq44c40tycow7waXkmvWW8wWPbMIiY3si7F9pV7PV8=;
 b=tHXB9CUfLkuvRKwK4crbU0Vj0s+7Nd8L3Q6Thzz7P2Cf7nfoWipWjTDNtftJjZ04K/
 z/3kQvwePrrx25yk+N9K6q7TDBn/vgESFJDjMRWZHO87+T+G4voX0RxwS49nitwfzY+i
 nh56Ld+thZUz8tbmy/NahRGf5+zezObouDErluA0X49TWUTtqBO/hMOIJ+gVxcHLPWPu
 wD6PaYNTSnEiDutzpd/vS82T+pbxZexQFifrWFdIHpJ/XzbF+u63Ik6hWfSgEeHkZ/1W
 43G5LRWNVWrzNeXiOL/8BLckwgeHppqqUmsj6v2MVAv35vLtiB4U8iTGyznATyt2O1kG
 SRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZEq44c40tycow7waXkmvWW8wWPbMIiY3si7F9pV7PV8=;
 b=M0QpVlsOnFr5qzFueLa1uPe9wCJ72QMgAaqJIGe5ipjQdg49Lp+MGWnPxKYfGTw+ce
 uRZe4cjoqLy5lhIjm/Tl1chopcL5jyXsJtltj0LRf4jqu32VuylyeTkxEeVjzzRJmaqP
 UL/psdAcWIEL2CWw4Zo+Nzfc++xTl+QV84JM0iT3Pd0oC91DoSeMFGwdPx3JULyUxZjQ
 rVstaNqfnUSpp5isU0kzESyMVgZNc42VDfj1W8cN1Iw/wgGxHsdahYvZAJB26y7rQ7S2
 Ur23XbOaLORei03JItK2LLPGBWf3dV3J5ums9eEysW/XjPGp7KvsDJw5yGZ1NNV9wPNb
 X9ig==
X-Gm-Message-State: AOAM5338XG1mKRBBH43jkHVgVwSzEnL2orZbBhKxY/Vz8H3rUveEPiQ1
 vNBLVoSiQ1rd//SVPM3t/emFkA==
X-Google-Smtp-Source: ABdhPJztsF8grOGn/HcxE0vefcaUKKHe2b5nLNJDPISW4NkcceulimOtVapAYpjAJeiYPyGUxs5qNA==
X-Received: by 2002:a1c:acc2:: with SMTP id v185mr2540447wme.71.1631686535627; 
 Tue, 14 Sep 2021 23:15:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p6sm12111814wrq.47.2021.09.14.23.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 23:15:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE7EB1FF96;
 Wed, 15 Sep 2021 07:15:32 +0100 (BST)
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/2] gitlab-ci: Add riscv64 cross builds
Date: Wed, 15 Sep 2021 07:15:18 +0100
In-reply-to: <20210914185830.1378771-1-richard.henderson@linaro.org>
Message-ID: <87zgsetldn.fsf@linaro.org>
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
Cc: willianr@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The only tcg host that does not have build coverage is riscv64.
> Filling this hole will help with tcg reorgs I have in the works.
>
> Thanks to Alex for help debugging the docker image creation.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

