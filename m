Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CA5A8406
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 19:12:04 +0200 (CEST)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTRFy-0006YX-Pg
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 13:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTRE5-00052L-J1
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 13:10:05 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTRE3-0000i5-HP
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 13:10:05 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so12054834wme.1
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=pKlU/vD9u5EnFDevRM9wfXhSNbkGJIZPYZ8Gvv90l+c=;
 b=M4Mc19htt+3ABuXDvVaB72yLNr6g2Q8ilVjHy0wbtIDgaaOO1G3emvSMRdHLoFaUwC
 BUVE9xK4I+RbVUTmEkO16232npLC4GoWTLgeJBu5pEoJu6+HJoXybRU3jkRpC085/prL
 EQJUo1DH/Yr8/Gi42/lIVOqjBvvpGx4eNrkpHLeV4rpe189s4Z87DGRQ/Qotqu0uyG7h
 52uo0UAgBUuGtO9MMrWT298nAWu2KDWu9hjiCkJC6cTIlSdhVgNzrhXQQ+B/wLLGn/BM
 4tMzQjU9GmKqLthXtvIdyU0h0JmjkcY6Uvhq3ITgmm0fhC9pmVKIYmZ+4f4A651icMd0
 ZFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=pKlU/vD9u5EnFDevRM9wfXhSNbkGJIZPYZ8Gvv90l+c=;
 b=FiNn3ORWlYOJeXs0TdwlZIwPaMAIt9XuvH+CKf8T8UrVUNocZoRIiL2j6rGOE6cntG
 QFzj6mIw69LAYZ2mSBzOsx5tRiMCFXTKdox2i4DkqNORq8znJIWeFKCORIfeVrCFcXA4
 RFIHhbPbRo40uDULa34A+HIYL/sjeBuDJ0oEIuYfvccfEsyTZMwduKUbJTKB/WOraUQm
 PVPcPebJt+5pwFQGmNV/BhkUvM5JMfUcRXcI9B2DLfYnI1lbxamvS6iyGRvoDAua75na
 v5cdkVDN15lhsxOxbxE2EQSDdN0vpK1w5oTxf9apjbwEoSorOEyRSYNmi7Y+DkWeCuzZ
 S9hQ==
X-Gm-Message-State: ACgBeo2p6hUfI6gn9mbRcMnhQFzXLsgMez7XydOmKZ3SCBlEa1GvkrR8
 TU4A/VzrPC9h0POM0NLVY53hQQ==
X-Google-Smtp-Source: AA6agR44snuHjeSpmM1bJj5y69SoPGAooV9o+MAYeqqek1XphRCHg6r0++t/xFreGhRsKf6PfZTOZg==
X-Received: by 2002:a05:600c:4e04:b0:3a5:a34e:ae81 with SMTP id
 b4-20020a05600c4e0400b003a5a34eae81mr2571707wmq.147.1661965801460; 
 Wed, 31 Aug 2022 10:10:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6805000000b0021e8d205705sm12183526wru.51.2022.08.31.10.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 10:10:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E73621FFB7;
 Wed, 31 Aug 2022 18:09:59 +0100 (BST)
References: <87a67kphih.fsf@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Mark Burton <mburton@qti.qualcomm.com>, "Edgar  E. Iglesias"
 <edgar.iglesias@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, David
 Gibson <david@gibson.dropbear.id.au>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Luc Michel
 <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>, Alessandro Di
 Federico <ale@rev.ng>
Subject: Re: Any interest in a QEMU emulation BoF at KVM Forum?
Date: Wed, 31 Aug 2022 18:08:22 +0100
In-reply-to: <87a67kphih.fsf@linaro.org>
Message-ID: <87wnaonxug.fsf@linaro.org>
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

qemu-devel keeps bouncing the message so replying with a cut down CC list.

> Hi,
>
> Given our slowly growing range of TCG emulations and the evident
> interest in keeping up with modern processor architectures is it worth
> having an emulation focused BoF at the up-coming KVM Forum?
>
> Some potential topics for discussion I could think of might include:
>
>  * Progress towards heterogeneous vCPU emulation
>
>  We've been making slow progress in removing assumptions from the
>  various front-ends about their global nature and adding accel:TCG
>  abstractions and support for the translator loop. We can already have
>  CPUs from the same architecture family in a model. What else do we need
>  to do so we can have those funky ARM+RiscV+Tricore heterogeneous
>  models? Is it library or something else?
>
>  * External Device Models
>
>  I know this is a contentious topic given the potential for GPL
>  end-runs. However there are also good arguments for enabling the
>  testing of open source designs without having forcing the
>  implementation of a separate C model to test software. For example if
>  we hypothetically modelled a Pi Pico would it make sense to model the
>  PIO in C if we could just compile the Verilog for it into a SystemC
>  model? Would a plethora of closed device models be the inevitable
>  consequence of such an approach? Would it matter if we just
>  concentrated on supporting useful open source solutions?
>
>  * Dynamic Machine Models
>
>  While we try and avoid modelling bespoke virtual HW in QEMU
>  (virt/goldfish not withstanding ;-) there is obviously a desire in the
>  EDA space to allow such experimentation. Is this something we can
>  provide so aspiring HW engineers can experiment with system
>  architectures without having to form QEMU and learn QOM. There have
>  been suggestions about consuming device trees or maybe translating to
>  QMP calls and adding support for wiring devices together. Given the
>  number of forks that exist is this something that could be better
>  supported upstream without degenerating into messy hacks?
>
>  * A sense of time
>
>  Currently we have the fairly limited support for -icount in QEMU. At
>  the same time we have no desire to start expanding frontends with
>  the details cost models required for a more realistic sense of time to
>  be presented. One suggestion is to expand the TCG plugin interface to
>  allow for the plugin to control time allowing as much or little logic
>  to be pushed there as we like and freeing up frontends from ever having
>  to consider it.
>
> Are any of these topics of interest? Are there any other emulation
> topics people would like to discuss?


--=20
Alex Benn=C3=A9e

