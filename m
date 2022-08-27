Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32BD5A365D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 11:37:50 +0200 (CEST)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRsGD-0004Pp-Jf
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 05:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRsBM-00026n-9n
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 05:32:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRsBK-0001wG-HE
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 05:32:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id n17so4406594wrm.4
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=0bWUzbwQhkoiGH+ZRJnV8jEUd95/Ag0MxDHQib51R/k=;
 b=PFzA1Kd8qyeLgiYV2jpn/s+zngm/EZb0NPypgK+CZJr29rwCHsnHYC+DeF975THz1E
 3YYRXJGVUNKDT5x4y/FaCPe+UjheOpluXdzF85VSvSHrbYc3cKKJALRykMaCpGGc8XLS
 nbg7gZMvBBDYaBogMdHXQq4/PFjSJQGiStHpId+r1sWxblQhDwpoj2rX4/x+J5YMoZC6
 +UhfDPUrQ3MUFufKlkatgPux+m3Vg4mawyplc2Fyt4qe+kgnkkmmiA929S68sd7+PA9z
 FqnQNvIgsveQ+kKI8dqjIjQKFTSzOzSLbjKUY0y+KGmvw1Tyb4KCUF+qh9DdzLxl+5Sn
 NDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=0bWUzbwQhkoiGH+ZRJnV8jEUd95/Ag0MxDHQib51R/k=;
 b=kMXWojUN4y0saCvLhzGvrwjMJuAaPVNwQiwlKxaPstnohBwBf+T5cngwbHB04LNVi9
 GJBu2+vg6gMCmYJZo8HNipG8W1QSOJQgg1Y/D9ujHZAsel8gGROMiUf3PZr27f5iD3pt
 YaWtelH4ATYKd+SoNIi3bdrqO6YHAggyKBZLiahREfLR3iar/tOqhpiEZZx/NZWoJBTm
 LhUWAnJ49rus7Fsu5eMg+3oQVCZM/owQrqnveYfNZCp6yyny1WnYQODPdeycxUnC+oEu
 y92PRgywGXdhbhWsLTdbMYc/jjRE48OZcxhCzOlgEC42gaRsUbDE7ZEGP86cYf+bI0UZ
 bKsA==
X-Gm-Message-State: ACgBeo1t5Gw9MwEPe706XUO/AmcXvke5RPQne6NqfZjbnF9XjKtjlIkl
 BgCb/uJNC/f1GSlQ7hAY3J5Axg==
X-Google-Smtp-Source: AA6agR4l7dXfBNujRXrEN0KHA+iLYI81YMUoc9Vzm9Z0OV/v/gzb79qreIyHWyYILjKa7bab9KgTtQ==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr1690719wrb.466.1661592764378; 
 Sat, 27 Aug 2022 02:32:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b003a5c244fc13sm2282024wmb.2.2022.08.27.02.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 02:32:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3E981FFB7;
 Sat, 27 Aug 2022 10:32:42 +0100 (BST)
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-23-alex.bennee@linaro.org>
 <56e39641-b520-de94-1968-2ba41a58e846@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v1 22/25] tests/docker: update and flatten debian-toolchain
Date: Sat, 27 Aug 2022 10:32:22 +0100
In-reply-to: <56e39641-b520-de94-1968-2ba41a58e846@redhat.com>
Message-ID: <87edx2owud.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
>> Update to the latest stable Debian. While we are at it flatten into a
>> single dockerfile as we do not need anything from the base image to
>> build the toolchain. This is used to build both the nios and
>> microblaze toolchains.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/docker/Makefile.include                    | 4 ----
>>   tests/docker/dockerfiles/debian-toolchain.docker | 5 +++--
>>   2 files changed, 3 insertions(+), 6 deletions(-)
>
> I was a little bit surprised that we do not expose these containers in
> the gitlab-CI (and thus that there are no modifications to the yml
> files here), but seems like we're fine.

Only because the toolchain containers are built and uploaded by hand
because they take so long.

>
> Reviewed-by: Thomas Huth <thuth@redhat.com>


--=20
Alex Benn=C3=A9e

