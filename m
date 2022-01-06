Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA05486612
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:30:43 +0100 (CET)
Received: from localhost ([::1]:58568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Tmq-0004uF-O4
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:30:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5Tka-00028H-HP
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:28:20 -0500
Received: from [2a00:1450:4864:20::534] (port=38650
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5TkZ-0004j2-4j
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:28:20 -0500
Received: by mail-ed1-x534.google.com with SMTP id bm14so10082349edb.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=L9OAyM1qDVhcceHajGLlGPtiur1iq7tUEkYlylxLblE=;
 b=O2pXG0e5eXKiONhZYwgkNydc665/Ce2Eyn3EfTWVu3mTNTzerEFCrLUkmd4g8b0jo1
 SvYfVcFzG6OAT+y4V3neZPJnXP1VnVdvzoco6IE9I9ang0UEti01TpmBUpcSRre+Udam
 buFH1bevqrgHhdNK7Ol6El47aFowurEy+oAgpXWvgdze9/VvnGeP+iIvXKM+9PWiBcaz
 JTpAzc6tZ5B3iTSrFosq7yMRP5B4pDjbaXcFD4Vf+SjOge0xZT9kulXPsANg1BrksUnb
 M6n/+lsv+sWW8yTObPF6kcKO5Ravz/eiDKBlo9A0Ch5YsXmhC+wch2KuzMNsXmJ1HFLH
 4tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=L9OAyM1qDVhcceHajGLlGPtiur1iq7tUEkYlylxLblE=;
 b=miGSRzNQ9jPxWEbgvD8jzSy77U+xeoy1ZL3SzTdeaMvLIObgNoNLerpzmsQiFvnyYc
 PZRIE1VF2Qph++BRQzQtnJQw0d/nd60f40wFuZ3ztdJPqNeghmZEE9cm1Kgc4wKGipAT
 iLukHkwI1nFupo8Q1B4115SiFybF6dsDc5Rvb3NrxjZoP5acNyrF6WqbjC5AhUk8pjpc
 m1UYt5Bn/zl/ztiIScfn5p14vi3slGcQhjgkAmS6vM7t9iNtadl7X1WDVEZ9al3qMawc
 hgIUPmVpnIn16ppMgWnlQLnKIjo5tFxy549ZcpBwZUJlOocBtRB54IfpWpyrPa1qiqYY
 HAGQ==
X-Gm-Message-State: AOAM532pKvAWFdL9emKvKljXXkVo3oPsKTmMKpSMj3hWMN55Wqlj+4og
 nuZkRM8QSMxJp/EIYj7sZwGuRg==
X-Google-Smtp-Source: ABdhPJzzDCAKFRyVpVG/jPZi2O9WohIyVTTw+7jQiCh9tjcYiopCYJWK3gqvuUsPLicTr4T/m0F2vw==
X-Received: by 2002:aa7:ccc7:: with SMTP id y7mr3584524edt.96.1641479297499;
 Thu, 06 Jan 2022 06:28:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c19sm777157ede.62.2022.01.06.06.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 06:28:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F19C91FFB7;
 Thu,  6 Jan 2022 14:28:15 +0000 (GMT)
References: <20211215084958.185214-1-thuth@redhat.com>
 <88fff234-b5c1-16e5-58ab-c3b9bc19e3b9@vivier.eu>
 <99120e18-eb22-e04c-7768-8f7491757569@vivier.eu>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Date: Thu, 06 Jan 2022 14:27:23 +0000
In-reply-to: <99120e18-eb22-e04c-7768-8f7491757569@vivier.eu>
Message-ID: <87ee5lhrb4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 20/12/2021 =C3=A0 17:01, Laurent Vivier a =C3=A9crit=C2=A0:
>> Le 15/12/2021 =C3=A0 09:49, Thomas Huth a =C3=A9crit=C2=A0:
<snip>
>>>
>> Applied to my linux-user-for-7.0 branch.
>
> I've removed the patch from my series as Alex has added it to his testing=
/next branch.
> As it modifies the gitlab CI and the dockerfiles, I think it better
> fits in his branch.

Sorry I missed you'd already queued it - but ACK it will come through my
tree ;-)

--=20
Alex Benn=C3=A9e

