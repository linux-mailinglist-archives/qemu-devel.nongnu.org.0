Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E218B4C6D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:53:08 +0100 (CET)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOfWV-00010Q-C7
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOfHm-0005ji-1N
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:37:56 -0500
Received: from [2a00:1450:4864:20::52d] (port=46831
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOfHj-0008Op-3u
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:37:53 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s1so17342622edd.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 04:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6FEGq4j75IivLShXq0lqWk8sUcVkbwmxTPsYLPi2iW4=;
 b=Vc4ILwcVd4poP7PgmmAbAn8NlJgW3EDDp4Ce8fcFOzDfJADwj+wl8ZHinDxPCIONvQ
 pWenziaw6kjE4bU5aPXSbFT7jjUF/W+Z2LPbYKVlE9vsnifwEvFxBBbCZ8NQDZe31qi4
 yvVRf2FB4ZVg7I1VqM7JZfKcOAkC/pEO38DfcRglhMbMQPiBw/KGbpQrMtjTGgjA5hwF
 wdpennafE3ZrR0vf/bmmsiSzM5Xl52fUvRqZ6TNO1EVcQnkoWviUIa+dA3YkLhaVb/+g
 6bvGxrB/mkeAA2TqKl7d/4ukCScw9a92JIGeXH9wVvuHClniWh62kR9iY+sWzuMJCBBm
 x2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6FEGq4j75IivLShXq0lqWk8sUcVkbwmxTPsYLPi2iW4=;
 b=2ug3aY8Z8XH8tVJDr2C+DLYhJ+WtxZ7Or7vOjqJu7KPX8rEloiT9qFRaMj7psAAz0D
 JNIoMgNEy5em+oBc3lxme+ExXZXgakY0qGWhgZ3UriLqM//P5sCNQ0QNl01jksBu19hL
 3GxqILpb+81i1U7tsFgjH+l3buI3ojXmQzspY75mRxhAjcfRGYxqWGug8CQkGnrfMLY2
 SgZ98gYlOk7BJ+WcmS0yTOpUnoXuu/BjJcJ7L3r7xQff5ogpFguBGSJ7IVEP5/zXB6Md
 FcsAH0LiNHJOnHaQNvu1bHcy1tGdEC4Vx0ZGyox49pfVAyc5FeopUEiL+h14DfPo6B0d
 m9bg==
X-Gm-Message-State: AOAM531PDl34nUShARnkq3lXD+ZfMos0usGXTCuDQduPm/WURmRx8XMz
 RXXYJUEQye6PxQopJ1beAMDBEg==
X-Google-Smtp-Source: ABdhPJyA7zTttT3B85nGEBwaImGXbbbmh/WnJsKGr/O1u8ETC3jZ7sirEH6SfML2OG/qPO9w2FDKZg==
X-Received: by 2002:a05:6402:2694:b0:411:f0b1:7f90 with SMTP id
 w20-20020a056402269400b00411f0b17f90mr19679384edd.398.1646051868903; 
 Mon, 28 Feb 2022 04:37:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 gb25-20020a170907961900b006ce423d43e1sm4352335ejc.13.2022.02.28.04.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 04:37:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F35321FFB7;
 Mon, 28 Feb 2022 12:37:46 +0000 (GMT)
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-3-crosa@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 2/9] Avocado tests: use logging namespace that is
 preserved in test logs
Date: Mon, 28 Feb 2022 12:37:40 +0000
In-reply-to: <20220225210156.2032055-3-crosa@redhat.com>
Message-ID: <874k4jnp45.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> Since Avocado 92.0[1], there's no universal preservation of logged
> content via Python's "logging" APIs into the test log files.  This
> changes were motivated by the fact that doing so is intrusive as it
> touches on Python's root logger.
>
> Test writers are now expected to use "avocado." as a namespace prefix
> for everything that Avocado should collect/preserve, and other
> prefixes for logged content that should be handled differently.
>
> [1] - https://avocado-framework.readthedocs.io/en/94.0/releases/92_0.html=
#users-test-writers
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

