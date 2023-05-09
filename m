Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A855A6FC527
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 13:40:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwLgx-000398-JN; Tue, 09 May 2023 07:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwLgt-00038g-5t
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:39:35 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwLgr-0001Ti-8g
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:39:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3078c092056so2023491f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683632371; x=1686224371;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rARTuEDLmGFICGAYuQKc50jHSttlE+cUw6tbbQAYke0=;
 b=g1tSN+GL37Ez80PRpdKeRrK51v2fXA7c8iNtcOF9sbOV1gYaPA72yneKRRVxc38BHH
 mTAbY+aa9RtXmx0hSytQRRgIJ/Ode3cpffLNNud1a+D6Vcu1C1UnVaTzkJQqzO+1gA9d
 kkmngDOFXaFwGkNvFdvr2uucVCSIpX0RiUCAL0i2QQ/gdH3K65OslvsDgpMzOJOXwZtY
 KNowz75pgrMQfe0u1eiFpJr5WWEEhw024zOM830G4zU0eG2tR7kSqvxnAB2rpLuPiHW9
 Y7FEZLkwkrxtF2mOgU5Vm8CXK6nWp2/QBd0GnWQ5PpDTsy9SbTlfps94S6CDNO1tWJca
 HITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683632371; x=1686224371;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rARTuEDLmGFICGAYuQKc50jHSttlE+cUw6tbbQAYke0=;
 b=e/zPFbE7cm4zZ/w73kbbNxwVB41sh5gxFiEGrFG6UJW9bXJPzs3v6ebXAPdpFqZNrQ
 c/9ef55dqudSbV1RONWRospZ6ZA5tKI579fix/Dkuiakjgra8JLY2NBtdP6n28LC1rEN
 Mrd1LZ3R50v8dXmAB87LawguqQpb1inwR9oziUZP0NcDZUb+PFJZ00dexj9O1j0bHZnY
 AZtZL/G2jgs0Flhpad8c/Pz28xRnEy0zuvLt4qTc2zzjYY7axIEJFDlIhKV2js0bX8cd
 4tm6tLO4QmoC08Jyay6E7eVCXK06ybT7p95G2OQqpitWoNlpJg4ZNxuwdPDQ6rgq0i3U
 sCFA==
X-Gm-Message-State: AC+VfDy0Tomy096dCIa6xGcJqa0HK5xDX/Edt7w2kOwiquvsLzl3DGs/
 iNLawlW2hfKDPRRc+7wGm7+EeA==
X-Google-Smtp-Source: ACHHUZ7ECH6pxLJ8Vhz+Nh3XJUMMKrFSWZsbEhA4IuD45LQymB3bfKoQefHmoH5GNCCd1p8Xf8VWyA==
X-Received: by 2002:adf:ee84:0:b0:306:b48:3fc4 with SMTP id
 b4-20020adfee84000000b003060b483fc4mr9325080wro.31.1683632371029; 
 Tue, 09 May 2023 04:39:31 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm19634231wmk.35.2023.05.09.04.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 04:39:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 288D41FFBB;
 Tue,  9 May 2023 12:39:30 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
 <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
 <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
 <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier
 <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John
 Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal
 <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, =?utf-8?Q?Marc-And?=
 =?utf-8?Q?r=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Date: Tue, 09 May 2023 12:37:15 +0100
In-reply-to: <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com>
Message-ID: <878rdxbuoe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/9/23 12:00, Peter Maydell wrote:
>> On Tue, 9 May 2023 at 10:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> On 5/9/23 11:27, Peter Maydell wrote:
>>>> On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>> --without-default-devices is not about choosing to not build
>>>>> some devices; it is about making non-selected devices opt-in
>>>>> rather than opt-out.
>>>>
>>>> Hmm, so it's basically "the person doing the configuration needs
>>>> to know what they're doing, the Kconfig system will give them
>>>> no hints about what devices might or might not be needed to
>>>> make machine type M functional" ?
>>>
>>> It depends on what you mean by functional.  I would say you do get what
>>> is needed to have a functional machine, but not what is needed to have a
>>> useful machine.
>> If you need to pass '-nodefaults' to get the thing to start up at
>> all, that seems to be stretching the definition of "functional"
>> to me.
>
> Then, an accurate description that uses "functional" in that sense
> could be as follows:
>
> The Kconfig system will include any devices and subsystems that are
> mandatory for a given machine type, and will flag any configuration
> conflicts. However, the person doing the configuration still needs to
> know which devices are needed (on top of the mandatory ones) to obtain
> a functional guest, and Kconfig will not provide any hints in this
> respect.

So I thought that was the model I was following in adding devices but it
seems I don't understand the no-defaults behaviour. What is the
difference between a device that is added in the machine.c that makes it
required or expendable with -nodefaults?

>
> Paolo


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

