Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8905A94BC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:35:17 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThXY-0002cQ-UW
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTgzO-0006I3-3y
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 05:59:58 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTgzM-0006ZD-BC
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 05:59:57 -0400
Received: by mail-ed1-x535.google.com with SMTP id b16so21844928edd.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=nvD4aRDQJAjdOxLES8HbccNTaNpGuTEtIxEpRvBCWjQ=;
 b=gYm54WPtK27F78khXnbkyWO2FLRz0unBk3TfoSAOsmj6/VVpW8E1M7sBG+ay74ul2m
 GIjwr4NmNdBuGu41Ez5Llz9YLFnchQTVCk8zdLLh6CRgXHHhe+FFWFfLTFt7ADPLQGKx
 xzUPxZWDW5r3P27F6D1Bp5LZro1tUVikKqaOyz2B7fLYlOL9RZf3BAcLv5T89mhf1Z6s
 xHzUcXQ9koQJgzGA/01T/YieYMUt+feWu6RMz/FKRQDyb73+uBiTM3w+loBV6H7NFwhK
 bNSF6MBJiMgmDdYRtnsY+BL9msvbrc9kxkXS/bQ8guAgfpREY8MCkeGWI6XeOkAAppyg
 anBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=nvD4aRDQJAjdOxLES8HbccNTaNpGuTEtIxEpRvBCWjQ=;
 b=7+Z9j90GteJJmaRkvxyvX3xmGno3CbY5r+Hr2Bt4Qc9hk/fUS//w83ru17zOXD01YI
 8ikwaV6siWSYhLb3+l5SlYqu6cGYrAgIXmnBEm13lbwWsQw5f68NMGJMmc1YUjStN7so
 214sX2408EdV2LWLzqSdwmP+2hSbpIeXUklPRJNZh7mb8+sG9Tkl/HQ13a+Xzp+nOOlo
 06EXP1CmelmLeNnzylDawpJSkcjfdUKWU998U3CSE8HVSqAMz/Vhoi9nD/xAZOA6VRCU
 s+uaPzn0zVUHHoV4/fRbt+w+YkV9t88I7kT5A2sina6vQqB4vQaKjPyrX12qvlkxSpc7
 oedQ==
X-Gm-Message-State: ACgBeo3j2PPJ5uYFNJ7sR//6ehjJYVy+eCrXzExMl+8vVJ3SpwOqcwS7
 cIKUJyK9Faua5k+1YZVTR6x5hw==
X-Google-Smtp-Source: AA6agR74nlqExCr7L/CVmBZQeW7lnjCEgSU/ernJId7H8P2kXq6lVozekwwwnNGfoxDXyJaaHAhkeA==
X-Received: by 2002:a50:ee06:0:b0:449:e6:52f with SMTP id
 g6-20020a50ee06000000b0044900e6052fmr7338130eds.267.1662026394671; 
 Thu, 01 Sep 2022 02:59:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a1709061dcc00b0073dc8d0eabesm8343404ejh.15.2022.09.01.02.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 02:59:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A3B51FFB7;
 Thu,  1 Sep 2022 10:59:53 +0100 (BST)
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-16-alex.bennee@linaro.org>
 <a2211678-6d66-4cc0-35c2-ac2fd7d27c9a@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v1 15/25] Deprecate 32 bit big-endian MIPS
Date: Thu, 01 Sep 2022 10:57:32 +0100
In-reply-to: <a2211678-6d66-4cc0-35c2-ac2fd7d27c9a@redhat.com>
Message-ID: <87fshbo1nq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> On 26/08/2022 19.21, Alex Benn=C3=A9e wrote:
<snip>
>> -   * - MIPS
>> +   * - MIPS (LE only)
>
> I'd replace "LE" with "little endian" - not everybody might know that
> abbreviation.
<snip>
>> +'''''''''''''''''''
>> +
>> +A Debian 10 ("Buster") moved into LTS the big endian 32 bit version of
>
> s/A Debian/As Debian/

Fixed.

>> +MIPS moved out of support making it hard to maintain our
>> +cross-compilation CI tests of the architecture. As we no longer have
>> +CI coverage support may bitrot away before the deprecation process
>> +completes. The little endian variants of MIPS (both 32 and 64 bit) are
>> +still a supported host architecture.
>> +
>>   QEMU API (QAPI) events
>>   ----------------------
> ...
>> diff --git a/tests/docker/dockerfiles/debian-mips-cross.docker
>> b/tests/docker/dockerfiles/debian-mips-cross.docker
>> index 26c154014d..75943619df 100644
>> --- a/tests/docker/dockerfiles/debian-mips-cross.docker
>> +++ b/tests/docker/dockerfiles/debian-mips-cross.docker
>> @@ -1,32 +1,14 @@
>>   #
>> -# Docker mips cross-compiler target
>> +# Docker cross-compiler target
>
> Why did you remove the "mips" here?

You may notice most of the flattened cross compiler docker images are
basically the same save the last two lines. I ended up just copy pasting
the preamble as I went along. I could restore if you like.

>
>  Thomas


--=20
Alex Benn=C3=A9e

