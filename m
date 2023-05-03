Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34AE6F5E00
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 20:34:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHHl-0007Yj-UW; Wed, 03 May 2023 14:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puHHj-0007XX-TH
 for qemu-devel@nongnu.org; Wed, 03 May 2023 14:33:03 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puHHi-0000g3-0U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 14:33:03 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so9744680a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683138780; x=1685730780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7HPnytuNr2tTl/GqvQTToDLhcLLgMbXFPrdQg6Ojybw=;
 b=MFLbub58dPc9NKR90AB/sEh2260o1RKuuap6Ha3xOjiRynr8xn97i3mAFNhjFaZTFu
 ld4lhG7WettebZ2LBvk4y1qO2kd+PefOfjUgqKD+FeOPgZ3aZIYgOHVQmkkr1p4OHfK/
 A0UF5Yr618w9HPaNiS/SRnWcT7jRrCA9/spWB7rB9DMwTvE2De14dOMT/q0jkR9EmEQo
 H5z3sDEo0ERqWnRkyIXBFdzaNzsfpzpmSvLZ48pN1dftUAzqCQdrLftJlPfB0Qyql800
 +5lR5DcGyEZmaZXi/XzrwR1BlBi8G1UfIGaa4b5PX+KBYRE7zONiOjZIj+PrLU/7Yg3l
 avCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683138780; x=1685730780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7HPnytuNr2tTl/GqvQTToDLhcLLgMbXFPrdQg6Ojybw=;
 b=X31pZX7fpQ347UZf13SeWWhkef5qUevy5TTG7KwFFfMIETB5rYs8uraHIMwWH9u2Lb
 qlFTpwnQUyaLTJUB9SrBaWoYocI76y3ofGZGn4ytkPTTqgQE2C+DKSiedpKdcsRNKaPG
 zR9W1I6KBxIoN3R4udrGvjfFKZ/ZXqvHFK8QmBs88mWj0+YvTRg5wE4JqIpl+A/qCHn5
 nIJhqbceO/8A99OLFkBfAM02UGBvJOgnFB0pqewadHcQkrJzuAq9ayah3hhDSZ1S/9vf
 e/Um2/F7179dro+riA2SlgpaFtRbk3snPqOi7cvwM+X0/SOOygTt/8RTZCfAPMyowBJ9
 0mNw==
X-Gm-Message-State: AC+VfDzvg3CLmUb9pUB//2guATut0I8ymEOEx1KR4ngPlVsVrLoYO8xw
 rsVrwFH9vRu2Z1y1RmMDOxaVP3VDlXVeTVKGKui6QQ==
X-Google-Smtp-Source: ACHHUZ5s7h/c5A0PtXntSGXjorpj0baJSPHTvsdXxqvcb457iHeabpO+RRkLPMuBaCTKEdcnCz9wP2v7SHw34UIEduM=
X-Received: by 2002:aa7:d343:0:b0:504:8a2b:b3c7 with SMTP id
 m3-20020aa7d343000000b005048a2bb3c7mr2695328edr.11.1683138780347; Wed, 03 May
 2023 11:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
In-Reply-To: <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 May 2023 19:32:45 +0100
Message-ID: <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 18:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/3/23 17:35, Alex Benn=C3=A9e wrote:
> >> You should select a device only if you cannot even start
> >> the machine without --nodefaults.
> >
> > Which is the case here right? We could skip tests that explicitly
> > instantiate a device but these are tests failing with default devices
> > the machine tries to instantiate.
>
> I'm sorry, I meant "select" directives are needed if you cannot even
> start the machine *with* --nodefaults.
>
> Devices that are added *without* --nodefaults should use "imply"
> directives instead, as is already the case.

Do we really want to build a QEMU that then barfs unless
you pass -nodefaults, though ? That doesn't seem very useful.
Something somewhere ought to be saying "if you want the
virt board then you almost certainly want these". Or
alternatively we should fall back to "don't create a
network device we don't have", maybe ?

-- PMM

