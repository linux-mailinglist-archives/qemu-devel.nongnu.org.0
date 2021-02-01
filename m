Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB7630A9B1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 15:26:20 +0100 (CET)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6a9j-0006Tj-RZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 09:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6a8F-0005a6-Ob
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:24:47 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6a8D-0002qr-Si
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:24:47 -0500
Received: by mail-wm1-x32a.google.com with SMTP id u14so12798743wml.4
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 06:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4gTXdW75aH4D2/F0ICjrPm5vOz4FLspPmIIbb3r6M8U=;
 b=kt4xTTH6VaHMW+2BMhkixf4mStNTs39FXH5QHtU7/ufX/wSYJRQ1+n5Sc+99zOD0JN
 8SaiFG019Sfwe89s2hFzUjts14gASZcoAa29VUwJaYhhiuYP2adEMHYFi6CvcAUjFNYr
 p6VxlkzNC/KeQwl1mr3IfwU2KcfDhvehEackz4QefR+ayAjXTikcMARITuvwe2tSP2Mp
 4w7wSUUqQsAUFS/EGHniQSsAr2J8Ffz/D/Gvl+I86Z/cvoZLfkPA2RFD2vtbjo0juU5Y
 7IKCDeCpl9Vz1Nvq+RccH/C8i7efU7ffbgpNONSWitseAfGTOzue9imJwPIf+YDu02Jq
 kqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4gTXdW75aH4D2/F0ICjrPm5vOz4FLspPmIIbb3r6M8U=;
 b=FvCdCVClX/EuS8tPoq213B1X5bsDr6qUhYotOIjh/se7FKWm/856rmSnH7GcjPfsih
 DFH1uyd5/8qUx5xzE4woK1K8dPFXesZCP4AYw7/zAtaj+9C1wqlnmFy8uYuZP+97hKv4
 7fM7pGl2nvl+0vX3xhlynuFIEkCGYLDVgVjq57ybnEeBxV5zFhfBKztoD7w6CeW35LNP
 c5m27Zj6lLagqKpqg3AK6B8MY5mmJeMKk9j1ZzdyoZ9D0//JuNiI3Ayb8W4rDqdUNpWo
 f4fVb7JYPeqn/Nyg0VOEqnwcMWjf+wdKAxCZwQCBGcc3RCg1gsC26H3fs3A9wuVFCRzG
 Datg==
X-Gm-Message-State: AOAM533kgdOE3QQU79cuQCMl2GG5LTnQ5kqoJSXgLfws4Gngsnkxfcki
 EU3hS0FHDM3bQ8ykK/56gnK1Aw==
X-Google-Smtp-Source: ABdhPJyYv8aFFQ4gfjVvOyQWHJwJRsZMOrBM20ihXfN0Z9WewsJhGGp8VbQBx5Tyqw1KYlHi+wPFGA==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr15395402wmd.9.1612189484122; 
 Mon, 01 Feb 2021 06:24:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x81sm22365716wmg.40.2021.02.01.06.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 06:24:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E49071FF7E;
 Mon,  1 Feb 2021 14:24:41 +0000 (GMT)
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
 <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
Date: Mon, 01 Feb 2021 13:50:26 +0000
In-reply-to: <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
Message-ID: <87tuqvvpau.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, mreitz@redhat.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 28.01.2021 18:28, John Snow wrote:
>> On 1/28/21 10:09 AM, Markus Armbruster wrote:
>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>
>>>> I'm developing Qemu backup for several years, and finally new backup
>>>> architecture, including block-copy generic engine and backup-top filter
>>>> landed upstream, great thanks to reviewers and especially to
>>>> Max Reitz!
<snip>
>> Great!
>>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>
>
> Thanks!
>
> Could someone pull it?
>
> I don't have any signed PGP key for now, to send pull requests :\
> Interesting, could I get one while sitting in Moscow?

Hmm this does point somewhat to a hole in our maintainer process that has
previously relied on semi-regular physical meet-up for key signing
purposes. It might be some time before we return to a new normal. Are
there any other maintainers in Moscow that you could safely meet for a
socially distanced key-signing?

--=20
Alex Benn=C3=A9e

