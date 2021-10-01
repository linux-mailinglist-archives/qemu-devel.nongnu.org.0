Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B541EA2B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:54:17 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWFFA-0000jt-Jq
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWFDc-00085Y-7b
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:52:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWFDa-0006Di-Og
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:52:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id v25so3936255wra.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pMxVAulQL3BX/ibV7J034cNBBMoFb7MKAPOGLq89ONM=;
 b=vjEEtmdXDPEp6UtJfe8mMdSwSfJrJGfKce8n3k4hJ96OW86OBuj5eE+zFnpcKIFkYe
 3DHYsvPKzeXTgukNYkC/KBtEau3S9S7zs4uP/TGvg2eZF2NRY3y7lozNkitYz3+V0pdL
 flfmxWW/Mk7+BgCT1khtcA8WNBYlVBpKuMedrCkhHxrm8FmcOEZ3fvLGR/0lXZpolbIu
 zip76rHPzzh1MzmsbtUmrZfa1j7w4x9GqEBbd5ayC2rdGENLMfJki7sRD+cIvrgKwVT+
 HXjFpTd4gdiTMLwNWNvQKZHoVwe+8nHPeWEpzdUoY3KvdI4K8ppXAt+vzCn2Zwv3LOA8
 Tajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pMxVAulQL3BX/ibV7J034cNBBMoFb7MKAPOGLq89ONM=;
 b=T7Hx0el02U60Cvuk3l3nQQchC6i4WXGOxq8ntLAsT81ASBmbHE2jUZSedEqzQFuqPe
 fniNXYp4jotEP8ku/bnQo/jQ8Fldtn/V5X8mVK5qv1aN7Bb8jAtMnfRXCKQwXjeVC0rX
 l0/9JOEIgq4ru4UMlWLA81hKtKmyjLkZWnVTODjZR5sF9ke5Thlj5rtdMRvvzgtALTA3
 7UHC/gu7oqcv7ew7llDsUgMaxT9NrUX5EMCp0aer2GNX+HXWvgutR45gAHSxzzbKOoWr
 Pbr//4kSyT49n/V6Xja592v9XnIXLydsZnOEXaWP2Uk0Y2J7giBJV6ZtHbwZaG6epzIZ
 nAiQ==
X-Gm-Message-State: AOAM530aSa4K/UGA24I7LE3GdsjshstrI+ziukDU9HEzluuBCofzjg1r
 UTx3D4x02upsMx2VSt9CX41z5IK7rydibyKQCWg9Zw==
X-Google-Smtp-Source: ABdhPJwt3Kqqn0KazzKzZPQSmxjhnQe8hvqt46M6xxsdQzqwwtbeewBklb0FdSW5l/l8nrDtZdbSjCSmvdEWUIJ60A8=
X-Received: by 2002:adf:8b98:: with SMTP id o24mr2119222wra.302.1633081956032; 
 Fri, 01 Oct 2021 02:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
 <YVbYavVeV/OmYON6@redhat.com>
In-Reply-To: <YVbYavVeV/OmYON6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:51:42 +0100
Message-ID: <CAFEAcA-_6BYX-MZ6LL0c4xJcqyz_EbOWeBGbteMByvERFq4_Xg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 10:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
> > I agree in general, but (per the commit message here) our dtc
> > submodule is currently pointing at some random not-a-release
> > commit in upstream dtc. We should at least move forward to
> > whatever the next released dtc after that is, before we say
> > "no more dtc updates".
>
> Yep, if we want to fix it onto an official version tag, that's
> OK, just not jumping right to very latest version. We might want
> to move it backwards to better align with what we're targetting
> in the support

The reason for the last update to the dtc submodule was not
for any specific external API requirement, but in order to
get a change we needed to get it to build more cleanly when
building it as a submodule (QEMU commit 67953a379e). To
not regress that, we need upstream dtc commit 85e5d839847a.
The next published dtc release after that commit is v1.6.1,
which is what this submodule update patch proposes moving to.

-- PMM

