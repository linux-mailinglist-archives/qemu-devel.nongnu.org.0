Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366A69F10A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:12:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUl9r-0007oP-NA; Wed, 22 Feb 2023 04:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pUl9p-0007o4-9u
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:11:25 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pUl9n-0003yJ-A1
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:11:25 -0500
Received: by mail-ed1-x531.google.com with SMTP id ck15so28728559edb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAh1m59pmtieaGKZz/jOfZ8/5CasnPSzZdYvvegbpfI=;
 b=kVxkvwn3Oed7FBtM7ss0rk0GN5hSi8TMS/OzqqYLqUp2zSfWS3vm118heNi+gDU/5C
 SWQqyhtlixEQzPLOk4WGZ90UjreP5YqaT9clR5eZBi2HKlhQ21/AFblUqcKxILUJxeRS
 LngHqUsOVpBHCw3XPLv2mtEfSV0J2euxnXAUTQ4kvTThBMtibUP+FUGsRsvjktnFbeEf
 WooZsirE5W7kmFOslcMqsXXE26zYxHrWL2mVLHAJyAKR0RoLVWo2dqowDvfEYCHKr0wj
 PLUEc59g4sM4/upZ3gjHmN2Seq2nEGc5gub0L+w5JNsVYCRelTHNQCZRHTcszpGwcdeA
 vYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAh1m59pmtieaGKZz/jOfZ8/5CasnPSzZdYvvegbpfI=;
 b=vFuA3JvV5oqzEs7shSavEwSByCx+cLSL5dZl+/bYfWeHysdHZMDiu21sSkwXv8AtAL
 f1YkqcVU7ivAHTh2Wo2yuz1yfmp7Y1o1KbJQuUEr+4HZy6ry7g8veTUk6v4pPVF587/+
 o/bJ44xgVkoGul+ixFj9/ceGnY0rCB+j7bSPegwYFUQ8ODWmKo+iEUk5ct5Wce+IvOLs
 WX1gPSjEWrN6cFdBNg3vEz9VGy5MU6X2oTetmSVTVrYVqrI3Zk5pv7sm9LM5aDF0SzfN
 YgtPEO/FHUUUtGdrk/6VPWr5HUzk0PBw/VaE+/Ky3pUsq6NcaDcJL2DTi1t4+/ojzYLl
 Mwtg==
X-Gm-Message-State: AO0yUKWU4/0RxrJ1KdD5pWTRcb9vFo4Qv9wAq43mktpPi+FODcT4D2n4
 eVvTovBbGXSDu2jDYTS2DJ5pouqrU6I=
X-Google-Smtp-Source: AK7set+bLeA24x2srKx5assPorecsADhu4WFllPxbTRRDQcTpBGHXtyQGXr8HO89Dnv0jchrbwMHOw==
X-Received: by 2002:a17:907:ea2:b0:88d:33fe:3306 with SMTP id
 ho34-20020a1709070ea200b0088d33fe3306mr20626378ejc.31.1677057080739; 
 Wed, 22 Feb 2023 01:11:20 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee001c45576075939c6f.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:1c45:5760:7593:9c6f])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a170906501700b008b10d5b092csm8098849ejj.119.2023.02.22.01.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:11:20 -0800 (PST)
Date: Wed, 22 Feb 2023 09:11:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <87h6w7694t.fsf@linaro.org>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
Message-ID: <45EE5F9E-B9B8-4DA4-809E-A95FC618E7BE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 30=2E Januar 2023 20:45:47 UTC schrieb "Alex Benn=C3=A9e" <alex=2Ebenne=
e@linaro=2Eorg>:
>
>Daniel P=2E Berrang=C3=A9 <berrange@redhat=2Ecom> writes:
>
>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat=2Ecom> wrote:
>>> >
>>> > Testing 32-bit host OS support takes a lot of precious time during t=
he QEMU
>>> > contiguous integration tests, and considering that many OS vendors s=
topped
>>> > shipping 32-bit variants of their OS distributions and most hardware=
 from
>>> > the past >10 years is capable of 64-bit
>>>=20
>>> True for x86, not necessarily true for other architectures=2E
>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>> I'm not entirely sure about whether we're yet at a point where
>>> I'd want to deprecate-and-drop 32-bit arm host support=2E
>>
>> Do we have a feeling on which aspects of 32-bit cause us the support
>> burden ? The boring stuff like compiler errors from mismatched integer
>> sizes is mostly quick & easy to detect simply through a cross compile=
=2E
>>
>> I vaguely recall someone mentioned problems with atomic ops in the past=
,
>> or was it 128-bit ints, caused implications for the codebase ?
>
>Atomic operations on > TARGET_BIT_SIZE and cputlb when
>TCG_OVERSIZED_GUEST is set=2E Also the core TCG code and a bunch of the
>backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>throughout=2E

Are there any plans or ideas to support 128 bit architectures such as CHER=
I in the future? There is already a QEMU fork implementing CHERI for RISC V=
 [1]=2E Also ARM has developed an experimental hardware implementation of C=
HERI within the Morello project where Linaro is involved as well, although =
the QEMU implementation is performed by the University of Cambridge [2]=2E

I'm asking because once we deeply bake in the assumption that host size >=
=3D guest size then adding such architectures will become much harder=2E

Best regards,
Bernhard

[1] https://github=2Ecom/CTSRD-CHERI/qemu
[2] https://git=2Emorello-project=2Eorg/university-of-cambridge/mirrors/qe=
mu/-/tree/qemu-morello-rebased

>
>>
>> With regards,
>> Daniel
>
>

