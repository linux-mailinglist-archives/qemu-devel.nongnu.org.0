Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2093E1431
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 13:54:31 +0200 (CEST)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBbxF-0003RH-Lp
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 07:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBbwG-0002Rf-8W
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:53:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBbwE-0003yS-BK
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:53:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso3503408wmp.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Fx/ip629G3JcdEZe/NDfggW0mEX0XHwXTn1B/b8mOE4=;
 b=VEWKI2lMUoT9Tq5CwM+SGweGQuEIlILVNWQPF8G/GSb7Ka1dedCH0w3YnyWjwV5tcg
 nKjAoDvblfKNaPJ/fx7+LCxZ3UOk2E6+Bgu9y0fLcAqPKMobpBaLJY3wl3nuYcKIRt+o
 5oWSUfZrfqhSNNQ50SUsgiZrhM9SRY7nw6kywREY3Mp5PjkQ6+xq8I06FUQ+KEYhbzWm
 vOAPtDtwYENbY9Z3MTbZ1LZADoNvmx+onxfCEGUsMI5sbXe2qWNNcaAwjE3SbUYEN00C
 z4Qm6g/Kgx6bA1ol9PTx5/UUzpWWnrrRsmo/L04MxjeaL2q2ABIEgRBb4JjatUkp4v0j
 vG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Fx/ip629G3JcdEZe/NDfggW0mEX0XHwXTn1B/b8mOE4=;
 b=g9v06MkpJxEcm8IdwmqNvIRK7mLK7R3phklFuN0EufaOaG8jqAfT38sm3NhCV2IxF9
 0vPxRFRwgoCa8aC1PfrvavSrHVX4n7lFx/Y/DjV46nQY4i5uupDzsVDCFG9JzkAstlXU
 5jX/Xo4HuuL6viNLVuYAjekMGIM6HgN786sRDi1NtUMOuzJIZWuqbwJW6uhUdpMh6+7H
 jYmMkVIsmsMEoA663NioattAbY9hZLMECogbo87UneJlSA55FqtB2N+JZ1Np0Wh96dTd
 ERBIzkp+hYI+Q2R1JzEb3jQ7s720tzPDVpBSmw8fmF1VYZv7rNpRMVwWekeEnNeiWHr+
 q0Qw==
X-Gm-Message-State: AOAM530HUZM+NC/XbNg0uWHzIs5Sut2Ll664jT2TeluXBn4K59R+hHrL
 WxNw2RVqxhd0KBFae6kYkJYTHQ==
X-Google-Smtp-Source: ABdhPJztp/41xbZhetXXEOQEEXIfvWbDrRh5KcM/Lj+f0lXDr1d0ygqzhzeQpZlVeOL7W5RYjaKtcA==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr4446219wmc.183.1628164404233; 
 Thu, 05 Aug 2021 04:53:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g16sm6962222wro.63.2021.08.05.04.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:53:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9B781FF96;
 Thu,  5 Aug 2021 12:53:22 +0100 (BST)
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-2-jsnow@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/6] docs/devel: create "Community & Governance" subsection
Date: Thu, 05 Aug 2021 12:53:17 +0100
In-reply-to: <20210804005621.1577302-2-jsnow@redhat.com>
Message-ID: <87lf5gkszx.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Plonk the Code of Conduct and Conflict Resolution Policy guides into a
> new "Community & Governance" subsection.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

