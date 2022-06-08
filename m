Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B325435D1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:02:23 +0200 (CEST)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxCP-0007MT-WB
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyx4L-0005b7-33
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:54:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyx48-0005vc-AK
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:54:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d14so19713282wra.10
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iVtiOdaKjafVEyacpEkBqFavYcdkpd7dpC/c7Zk9t0U=;
 b=RQFipqeLnb1ubVBQQDeGrOhk5qF6xz4psYcx/LHO4Js8cZwIIhk8w+mthtCSIHrwA3
 FMP5iwjGNYcWNSEReebNnhL0wS+tuPFi/AKf+enmuP/OAho+2u8JgfsfwY1odqUrVTcS
 CUkXVWBtzwiWCh0RBJpMegOIrYxO//YiKRRF4/8EsD7TmrSHSzCZwc54fOe6DsD4ihOa
 Z3NrPpNaLo1xWr+92hQFy94CHvSPE/5BE5pBtLj+9n+G2tW16h+k98jD8/OdoQ+LFNSR
 o/ICu4iWFBZ9wdG2i6zgqnlG7d6inaqsV7R+nVk7fItoEDxkO2srmO+icxZnnKOuOZ+l
 RbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iVtiOdaKjafVEyacpEkBqFavYcdkpd7dpC/c7Zk9t0U=;
 b=iYqiGUhZVSPOdsz6pnKxvY496dYbaSZlbOnUbzoHDmammehBd1UgCQc4HM/1WVCLX0
 S2t4HDdmJwX8fxeoIjEgxAelGXPXTcc8tCFdCXFpUzeroXYoV17RxZDTEfAz5i2DZxw4
 TW3ccOGC3fDNHSqINU34MNZNc5dq1NQBt8iy8HldKuT8ti0yezNcPcnceJOukmDk5kvA
 7Q1Lme4v0JlOOvcDa8f+Tc/A2x5TmKgz7cp9ux2ZLtY7ODcF9UCFOfJC0e7O/RKP+HY0
 m6K/BqY2bqKIwXmZvCTNNUy9wA/cDacJOb7w+E0pLJGorgpgp69fS1s9lTrDIHQWJepI
 oAag==
X-Gm-Message-State: AOAM5306aiwzE41i2dCOc3DATI7mXIzf38rW/s25lUoqKmCg3cDlDKjF
 s6yAzfCg49UVa+sSMuAzAAyyxo2v5TSv6w==
X-Google-Smtp-Source: ABdhPJwxuBMnW7PLaFno/LAo6SAOw/34xIG2vfpOOZ5EmXrNtGYLwaljcya/WsaiN0R55H+lnb9dUQ==
X-Received: by 2002:adf:ef91:0:b0:218:4e7c:cbbe with SMTP id
 d17-20020adfef91000000b002184e7ccbbemr10444287wro.710.1654700024411; 
 Wed, 08 Jun 2022 07:53:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d474a000000b002184a3a3641sm6469679wrs.100.2022.06.08.07.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:53:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8CD11FFB7;
 Wed,  8 Jun 2022 15:53:42 +0100 (BST)
References: <20220608135727.1341946-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH untested] tests/tcg: disable xtensa-linux-user again
Date: Wed, 08 Jun 2022 15:53:37 +0100
In-reply-to: <20220608135727.1341946-1-pbonzini@redhat.com>
Message-ID: <87mtentde1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> The move from tests/tcg/configure.sh started enabling the container image
> for xtensa-linux-user, which fails because the compiler does not have
> the full set of headers.  The cause is the "xtensa*-softmmu)" case
> in tests/tcg/configure.sh which became just "xtensa*)" in the new
> probe_target_compiler shell function.  Look out for xtensa*-linux-user
> and do not configure it.
>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

