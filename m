Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722A7002FA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 10:51:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxOTu-000595-6G; Fri, 12 May 2023 04:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxOTr-00058c-Uq
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:50:27 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxOTq-0005nN-6a
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:50:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so6469206f8f.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 01:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683881424; x=1686473424;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rEXGD4ZTdVa3kxLo30KBNl3diQGF4x9ej3JLa59IIwQ=;
 b=Rmn8OdUGVIhHStA8MItRsCOPDFVRdSsqY0MpMrxCqp3mO0QYwBoChwLTkeFzkMRFIA
 UkENvkQGjII2fxqF3BXdr8sD3FLpad5EjiTdHuzrkl3+R2lI+cZPhFYbDOgU9r5Lzpgv
 cO+sdzZpFCAJg5jO3a46eL+np7j+6uK3jqXE8DwKEQzWpm6KEYnVrp2BjxGOBDeRF63L
 Jaxkfa7FBkPLaWngFJ4Z9w3AMmyXZ46CwbVXH8BtMk6cFVhy3ZwbJZWSWbQY81UZG4ys
 TA9GrarNi1GNw1qdwTfl33JBpLg4EAE9wCpFrZYaBkDIyEEFvVjaMAJiRyZZ/4Mt0KXE
 f6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683881424; x=1686473424;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rEXGD4ZTdVa3kxLo30KBNl3diQGF4x9ej3JLa59IIwQ=;
 b=e6CxsMz1jhh+S1ZPQMdwskjzrCeCFnvCE2dBytJoRLftxgpz11k5k8WF6ZQ9rC4XBo
 EOCXWxu3v4mFHFk6eVKjWTCq896Ut7Z0M5Hg7nZ+MtBWsYDuf5Gs/srZwDQ0bmzto01m
 0S3P8KH3g4+c9UnBJWgJgLjSJQqINVCY0f4Ogq1pyhBI8aWHlH63QtlNfhSe9FIwmX8A
 hqOYTEcUt5szGw5xCL58cOxI72A6UTGwDKj9/csJndWV9UiXk6/ldFySxXsVb7Kemei/
 8heEuswW1bajSZhn//sPzzU87BsZKvrv4GfVaLL7uSQeHS4QmkQauEMek1DakApk9fm4
 cd5g==
X-Gm-Message-State: AC+VfDxFr0GFlHiroofbcMifW5PoV+2u77XjgURnlRjZneLwMWjxQo9i
 P1GTvZ1eGqE25uXo4OXt1eGhEg==
X-Google-Smtp-Source: ACHHUZ5MQsf0C6RKKTtRKrTMpGDAS/ivCYeT0sxw1TvQEbEBIjlMqFUjXCh59PwjkDu4q74rPnYXZw==
X-Received: by 2002:adf:eece:0:b0:307:88ba:c999 with SMTP id
 a14-20020adfeece000000b0030788bac999mr14001857wrp.62.1683881424312; 
 Fri, 12 May 2023 01:50:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm22836789wrq.82.2023.05.12.01.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 01:50:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 539D71FFBB;
 Fri, 12 May 2023 09:50:23 +0100 (BST)
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <87wn259n4g.fsf@linaro.org>
 <1b2aae6d-ebce-65a9-0cda-84bf0fcc8b1e@intel.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v11 00/14] TCG code quality tracking
Date: Fri, 12 May 2023 09:42:22 +0100
In-reply-to: <1b2aae6d-ebce-65a9-0cda-84bf0fcc8b1e@intel.com>
Message-ID: <87lehux7ao.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


"Wu, Fei" <fei2.wu@intel.com> writes:

> On 4/22/2023 12:42 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Fei Wu <fei2.wu@intel.com> writes:
>>=20
>>> This patch series were done by Vanderson and Alex originally in 2019, I
>>> (Fei Wu) rebased them on latest upstream from:
>>>     https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>> and send out this review per Alex's request, I will continue to address
>>> any future review comments here. As it's been a very long time and there
>>> are lots of conflicts during rebase, it's my fault if I introduce any
>>> problems during the process.
>>=20
>> Hi Fei,
>>=20
>> Thanks for picking this up. I can confirm that this applies cleanly to
>> master and I have kicked the tyres and things still seem to work. I'm
>> not sure if I can provide much review on code I wrote but a few things
>> to point out:
>>=20
> Hi Alex,
>
> There are several new files added, should I put your name as their
> maintainer? Also, should I signed-off these patches or not, definitely
> the original signed-offs will be kept.

I assume they would just become part of the accel/tcg stuff rather than
be maintained as a separate subsystem.

For sign-offs you should keep the original authors and add your own.
Each s-o-b is a statement by the person working with the code that they
are "legally okay to contribute this and happy for it to go into QEMU".
So it is totally normal for work that goes through several trees before
being merged to have multiple sign-offs. When the maintainer creates
their pull request they will add theirs as well.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

