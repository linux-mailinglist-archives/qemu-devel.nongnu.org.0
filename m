Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA054C6F41
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:24:03 +0100 (CET)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgwU-0000Mn-A9
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:24:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOgav-0000ku-E4
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:01:46 -0500
Received: from [2a00:1450:4864:20::32c] (port=46878
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOgat-0006Rv-6b
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:01:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so6083890wmp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 06:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cVl3lFhFU63ClowqOs1BntBxNI+771gdS/ZiUoBFipc=;
 b=p90q/C5NSsBPVaFHWh5tA3JwXOJvILyyzgQmEFML0JtfNKLOaglRjXDAJprbV3x2hY
 6MhroIV+p/qKMS0mdYXv7JMCHVd7C5ibbFv3vFuw9jyCPc0wDTwCLMuCjW0jwfVRSJb4
 GgcqHhODBpEhqr7Te50KqUK6+19I0/y6xQL/dciKTtHUhOEtwZqrePyjBMOZoUBy1lmY
 bm878nn/Y3LJopFf7lSEEo7Azoj+vQv46t9ZHVuqVShYGnmgMq31eJfHhP9uVvprESaN
 OLgDklorvl08F26ZCOJVXAHoHaSJuXoeEt3EwOSaoqfomXkLQ3My3+gEr5i3DMoxLe4y
 9lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cVl3lFhFU63ClowqOs1BntBxNI+771gdS/ZiUoBFipc=;
 b=hSkpUdDEpYM/lhy0E1WqC+GLUFBSZi+CDXZE1GULutcjwO5TNF/COVZwpFN8Ar6Txb
 UXcgr987s/94EMrEFCtT6rnEPsx3nDRKBk9/6C1GnfL34SWNtGHk/4NaCsF9JwsGBIta
 H6yKylPE9SRVXVlnPbgPt1WZ11ICG9eNkKessOY48HffsIxFNeWmwu00qcfLW6bJWYBD
 95ZAAeuZqKLhHwQKjVbeiF/kKSBFELa3UaaQ6UJdD93pC5XRi9h3YlGnq+Z2HZVhpYly
 J0qMdeqLdN72W7VAzCVVKcYlE0FbpOkaN61zmE53Mmj5uu2CJ/edE6zrY7DJBzXx9vjG
 eZwg==
X-Gm-Message-State: AOAM531X/Fu6yG8uvUriG3Nv+HUkTYTamcPQiVxWK1PUErERylIVyhYT
 0t7ksIx3dN6a87zYL+8780umUQ==
X-Google-Smtp-Source: ABdhPJz+moObY3YZR9OzS6WJrSK12tfGphXZShDBdZqx8CMof00zpp4Lv8GVwFRlRlkxCrf8VasI9w==
X-Received: by 2002:a1c:6a18:0:b0:380:dec5:7f05 with SMTP id
 f24-20020a1c6a18000000b00380dec57f05mr13799971wmc.129.1646056901521; 
 Mon, 28 Feb 2022 06:01:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s3-20020adfbc03000000b001e4b0e4a7fdsm10935542wrg.93.2022.02.28.06.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 06:01:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F8681FFB7;
 Mon, 28 Feb 2022 14:01:39 +0000 (GMT)
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-4-crosa@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 3/9] Avocado migration test: adapt to "utils.network"
 API namespace change
Date: Mon, 28 Feb 2022 14:01:32 +0000
In-reply-to: <20220225210156.2032055-4-crosa@redhat.com>
Message-ID: <87v8wzm6nw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

> Since Avocado 94.0[1], the "avocado.utils.network" dropped a lot of
> previously deprecated API names, having the new names into a finer
> grained structure.
>
> This simply uses the new API names for the network port utility
> module.
>
> [1] - https://avocado-framework.readthedocs.io/en/latest/releases/94_0.ht=
ml#utility-apis
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

