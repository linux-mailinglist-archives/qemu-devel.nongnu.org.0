Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0755EAA6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 19:12:22 +0200 (CEST)
Received: from localhost ([::1]:33652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ElB-00086S-H3
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 13:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o6Ehh-0005oK-Jf
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 13:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o6EhY-0006IP-HP
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 13:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656436114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WRU/eQxx0DrjUfem/aiEAuCL3raDfQ9phdAFeaRwQE=;
 b=PhhCikBnOIVfnau/UPkXbusSg+66hZym3M1oQw1jHYeJo6lYdYjUuvpMH/BCSf5mpRQxmC
 nF9snIrAGPRLYS1B17WJM2ItV2oVuMFZbweyGVvWtzBwmM9h+K93BaZPkFSR3DraGiE1V+
 fxs9PPNskpObQVU9fFXl75DQbdm7RRs=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-6dcqc4dOMUC035bG6W1-SQ-1; Tue, 28 Jun 2022 13:08:31 -0400
X-MC-Unique: 6dcqc4dOMUC035bG6W1-SQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 a3-20020ab06843000000b00379a4968539so5508505uas.14
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 10:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+WRU/eQxx0DrjUfem/aiEAuCL3raDfQ9phdAFeaRwQE=;
 b=WwzHg57leOUjXiFHPvlk7GqL48enHKAbC6bgZjcsESagyLtT4SIa2f2YSJpU/s7Puj
 gQw0j8PXsjx6Hsueb5RmN+vTAZgu5S2TKQpcsq4EjyNV2dAUEffmK/nQS7L8Le4bOhk7
 rnTmGNcal1855AycqhpRT8wKyiMBlDl70YJP22cKeylZePJhMcwpWHV28PNveSDpHumh
 wesk7/YDLB4PEDr/uPYcWfIfQwbhnCI5NlFVtFkPaPM2GNuEc1JdqzJATAlT5krzhQIh
 M3JWMdyUNE9YRbiNLOFM/rcLlZ90A4ZtSN5ZAUJZUKjdWnJWsqC8NoVjUlCUIiCgo62Q
 NdxA==
X-Gm-Message-State: AJIora/fJSvLmMxC69nodkqQz9Fumox7IF4/Ds9nFaHpPUHxrRK5RaRv
 Q1MT1E1pHIuSypqlz2Rl2q5me2BMyiHU/l+6riLPumgUYw3hO+Bx9tX89WwB9ZQtcyhpg9oXynW
 ATi1HPRe6IwPm045AuJ5WoQrBCq7Iyds=
X-Received: by 2002:a1f:45cc:0:b0:36c:130:c686 with SMTP id
 s195-20020a1f45cc000000b0036c0130c686mr2007301vka.35.1656436107036; 
 Tue, 28 Jun 2022 10:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uVleRZKAXKbZNqyDvkxoUx3QWiIrRomlAwjRt/5BrxrVVU4siG8Qwzc3fEdKoTNueVBAG7N/iRdoLrYDbkbFM=
X-Received: by 2002:a1f:45cc:0:b0:36c:130:c686 with SMTP id
 s195-20020a1f45cc000000b0036c0130c686mr2006728vka.35.1656436100435; Tue, 28
 Jun 2022 10:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220628134939.680174-1-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 28 Jun 2022 13:08:15 -0400
Message-ID: <CAFn=p-Y0O0MgL91jhiV1uRq1q6oL3g4bfDJ58Ws7NiWu_RBLYA@mail.gmail.com>
Subject: Re: [PATCH 0/2] python/qemu/machine: fix potential hang in QMP accept
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 28, 2022 at 9:49 AM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> As reported earlier by Richard Henderson ("virgl avocado hang" thread), a=
vocado
> tests may hang when QEMU exits before the QMP connection is established.
>
> My proposal to fix the problem here is to do both accept() and wait()
> concurrently by turning some code async. Obviously, there is much larger
> work to be done to turn more code into async and avoid _sync() wrappers, =
but
> I do not intend to tackle that.
>
> Please comment/review
>

This has been on my list, it's been a problem for a while. If this
series doesn't regress anything, I'm happy to take it. It'd be nice to
get a proper "idiomatic" asyncio Machine class, but that can wait. I
just got back from a vacation trip, please harass me in a few days if
I haven't cleared this off my to-do list.

Thanks,

--js

> Marc-Andr=C3=A9 Lureau (2):
>   python/qemu/machine: replace subprocess.Popen with asyncio
>   python/qemu/machine: accept QMP connection asynchronously
>
>  python/qemu/machine/machine.py | 58 ++++++++++++++++++++++++----------
>  python/qemu/qmp/legacy.py      | 10 ++++++
>  2 files changed, 51 insertions(+), 17 deletions(-)
>
> --
> 2.37.0.rc0
>


