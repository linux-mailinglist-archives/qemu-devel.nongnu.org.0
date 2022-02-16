Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DAD4B8B56
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 15:23:05 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLCx-0002F0-Ea
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 09:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKLBk-0001Rg-AV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:21:48 -0500
Received: from [2a00:1450:4864:20::333] (port=54811
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKLBh-0003vQ-MM
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:21:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id c192so1303909wma.4
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Qt5bCon32ap6AL7De2RZ1yqGgV6kqwnrvK9gx7jPfHY=;
 b=DZbl/YcACLWRfpoShXB8OD/eqK1CTNpYKGOiSFyyzT+IhGhym5D1mgxQpNQ6DaAr9R
 qfz/3ODGMEAfrrkwrn7fkXEClOD7eDAIfGK2d17S/+28OxMAVuaNIgUlIA6TWe2tD/qb
 XftWrF3rwRfc9O50TiA1b3z/wM+Jvt0OFEaez8dNF0DExTJXnbRZzeKO/fK68BJNr5w0
 n4saCJhsj4dpXJblgJQzlJ/CBJ0MtEKhOgz2tlm/NqKzamUYISclRKmy/jAE6pquhDXf
 +0bYN7BgLQ72ZAPGxs2D2MAv59tSLb0BqdSrRDTBkQqnU3T7T+fPjMdwk56gWdxOjbAE
 JnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Qt5bCon32ap6AL7De2RZ1yqGgV6kqwnrvK9gx7jPfHY=;
 b=JXDzPg2cfOGs0wWmUwe2EstVAs4kuYIsnKpd/RoJIkeSAjODmMxA0KgdX+zgHQrSYZ
 JLNnJWdO+lH5zW7Gyw25qPF7t+2UtlSTte+2MMuIVxgwRsGIz4+bk1zEgSZeTVukva12
 B5jOAy3kllFH9/qfJDNJu9tQ+xCyqJeaQDVlc5BR44Zq80weMxZfoM6xLdZ+vC0MiD0s
 DX9r5e6soVuUiTjnGJxD17o3mP3egzmpgZVIYoUqHPgEBkDOm+v0MVwT4Oqni3/V+MFU
 2D8TZav7/Cejsmw3yYXyVhoxO9iQ/ue86E1/uZ7bbUVLKNtCWRuUNoYhZgFSaM8r4KHo
 v8EQ==
X-Gm-Message-State: AOAM533JWOJyug1HZRiChr6P5DRZ3ooJ8/dD30tObPSWiCtvMICi7wqQ
 9VjpuawrkSYWG2GIMOY/c3q0Mg==
X-Google-Smtp-Source: ABdhPJxWAim2IHmN+85AN30PWlqOq10UtnLj36Rx+Zjg5z4HDpaXlyYiFuKqPxc20qLZ3F3fmwGG0w==
X-Received: by 2002:a1c:7712:0:b0:37c:9455:b3fa with SMTP id
 t18-20020a1c7712000000b0037c9455b3famr1909293wmi.188.1645021303996; 
 Wed, 16 Feb 2022 06:21:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d6sm35473763wrs.85.2022.02.16.06.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 06:21:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6527A20329;
 Wed, 16 Feb 2022 14:21:41 +0000 (GMT)
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
 <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Date: Wed, 16 Feb 2022 14:19:01 +0000
In-reply-to: <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
Message-ID: <871r02dh8q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: farman@linux.ibm.com, qemu-devel@nongnu.org, cohuck@redhat.com,
 richard.henderson@linaro.org, thuth@redhat.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Hildenbrand <david@redhat.com> writes:

> On 15.02.22 21:27, David Miller wrote:
>> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
>> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
>> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
>>=20
>> Signed-off-by: David Miller <dmiller423@gmail.com>
>> ---
>>   tests/tcg/s390x/Makefile.target |  2 +-
>>   tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
>>   tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
>>   tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
>>   4 files changed, 130 insertions(+), 1 deletion(-)
>>   create mode 100644 tests/tcg/s390x/mie3-compl.c
>>   create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
>>   create mode 100644 tests/tcg/s390x/mie3-sel.c
>>=20
>> diff --git a/tests/tcg/s390x/Makefile.target=20
>> b/tests/tcg/s390x/Makefile.target
>> index 1a7238b4eb..16b9d45307 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -1,6 +1,6 @@
>>   S390X_SRC=3D$(SRC_PATH)/tests/tcg/s390x
>>   VPATH+=3D$(S390X_SRC)
>> -CFLAGS+=3D-march=3DzEC12 -m64
>> +CFLAGS+=3D-march=3Dz15 -m64
>
> Unfortunately, this makes our docker builds unhappy -- fail. I assume the
> compiler in the container is outdated.
>
> $ make run-tcg-tests-s390x-linux-user=20
> changing dir to build for make "run-tcg-tests-s390x-linux-user"...
> make[1]: Entering directory '/home/dhildenb/git/qemu/build'
>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley=
-softfloat-3 dtc capstone slirp
>   BUILD   debian10
>   BUILD   debian-s390x-cross
>   BUILD   TCG tests for s390x-linux-user
>   CHECK   debian10
>   CHECK   debian-s390x-cross
>   BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
> s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=3Dz15'
> s390x-linux-gnu-gcc: note: valid arguments to '-march=3D' are: arch10
> arch11 arch12 arch3 arch5 arch6 arch7 arch8 arch9 g5 g6 native z10 z13
> z14 z196 z9-109 z9-ec z900 z990 zEC12; did you mean 'z10'?
>
> Maybe debian11 could, work.
>
> @Thomas do you have any idea if we could get this to work with
> '-march=3Dz15' or should we work around that by manually encoding
> the relevant instructions instead?

Yeah you'll need to update the docker container. The way it works is we
always assume the docker based compilers have the compiler features
needed to test something. tests/tcg/configure.sh does feature tests for
compilers which are detected on the host filesystem (e.g. do we support
SVE).

My last testing/next post:

  Subject: [PATCH  v1 00/11] testing/next (docker, lcitool, ci, tcg)
  Date: Fri, 11 Feb 2022 16:02:58 +0000
  Message-Id: <20220211160309.335014-1-alex.bennee@linaro.org>

converted the aarch64 container to debian11 with lci-tool. You should be
able to do the same with the s390x one.

--=20
Alex Benn=C3=A9e

