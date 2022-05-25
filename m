Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D25336EB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 08:50:45 +0200 (CEST)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntkqy-0003uq-5p
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 02:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntkk8-0001AT-Rc
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:43:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntkk6-0005xo-Ob
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:43:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id f21so26005918ejh.11
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 23:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SSXy3OfWReYoNf6zA0WH6gOUS1eqBgV8GsP1jSrZoxE=;
 b=HokauaDLYOBqynA+9s+mkzFX3WN2MSmfqdIfVoGv9L7bY/UHpsmvBUnzt1XWzG7xbU
 HydkJyAd82LqVNUsY9at2czVMJxf75fHteYFs/Ebk/essE/uidUQR8HNmPbDNG6P2qTc
 rEFOB12/K7BZqbIQXJonXiIeqYGkEX/KBd3os/0OB0PsxcxFEK00f8Umez+3pcybbKYO
 RJ6AYOTViwoJg/qEplYNCBFw9ycpsvs77Fdyxg4mYoQQkuJbnpAH9jn80woCL+QILpVI
 /NnBuG8akZ041pnr+lA+Zp3+YnhoLLSmdkAqkXQlIN7WqwaZo1Xz9JOmG5l265ghzxm3
 XEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SSXy3OfWReYoNf6zA0WH6gOUS1eqBgV8GsP1jSrZoxE=;
 b=qh/2qG0KGytKKRWG/1nylUjgvWiPhSUR0CMMPBVIKs5xLjjBeP27JqT0zk57ziLvYU
 fKZGtUb2ECdjFkFbYOJ/9iRPBP1E3HbsOtK+XQbb7FmfGm/9d0JrOdDyzx8Ms4Sg/CcT
 Btlt1vaSKEMjqPiZJbi44YGvhfYeIqtgmKuabo7qsYMyuaHp9KJ1HmuZg3ien5LmN+bz
 CjjJ9tFzPszoG5yDvrax273l/mIST6h9BnowIq6SrJ1fz3MlHYz2FtfMNbyS+iCgyzK1
 gVrTskTa7fTGhgkDZ20Zfb8VxrwELY06KWtfSQr8f49l6fYL1gEJ5Wttigtkm8gi/Fzo
 vRCA==
X-Gm-Message-State: AOAM530nJW+8hy6MeFWT+tkK4IltpUeiotljeUwXaDpbHQ/rru8XXj5D
 32/h1WzBovdZTnP725GWYAmS3HzE6UMjDg==
X-Google-Smtp-Source: ABdhPJyp1CM3RQMpCr6H+wggMkjSpB3D71R/bR3MrOvCCm+0yLpSLTv7gX0ZVFKg79ca1MkXJNPBng==
X-Received: by 2002:a17:907:1b0c:b0:6fe:25bf:b3e5 with SMTP id
 mp12-20020a1709071b0c00b006fe25bfb3e5mr27797124ejc.689.1653461015224; 
 Tue, 24 May 2022 23:43:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 3-20020a170906100300b006f3ef214dcdsm7865740ejm.51.2022.05.24.23.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 23:43:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B47C81FFB7;
 Wed, 25 May 2022 07:43:33 +0100 (BST)
References: <24c61f36e23339cb1ab80b41e906ea60a0d67d2a.camel@suse.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Claudio Fontana
 <Claudio.Fontana@suse.com>
Subject: Re: Problem running qos-test when building with gcc12 and LTO
Date: Wed, 25 May 2022 07:41:31 +0100
In-reply-to: <24c61f36e23339cb1ab80b41e906ea60a0d67d2a.camel@suse.com>
Message-ID: <87v8tu5cyy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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


Dario Faggioli <dfaggioli@suse.com> writes:

> [[PGP Signed Part:Undecided]]
> On Mon, 2022-05-23 at 19:19 +0000, Dario Faggioli wrote:
>> As soon as I get rid of _both_ "-flto=3Dauto" _and_ "--enable-lto", the
>> above tests seem to work fine.
>>=20
>> When they fail, they fail immediately, while creating the graph, like
>> this:
>>=20
>> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_IMG=3D./qemu-img G_TEST_DBUS_DAEMON=3D../tests/dbus-vmstate-
>> daemon.sh QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-
>> storage-daemon QTEST_QEMU_BINARY=3D./qemu-system-x86_64
>> ./tests/qtest/qos-test --tap -k
>> # random seed: R02S90d4b61102dd94459f986c2367d6d375
>> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-
>> 28822.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-
>> 28822.qmp,id=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -
>> machine none -accel qtest
>> QOSStack: full stack, cannot pushAborted
>>=20
> Ok, apparently, v6.2.0 works (with GCC 12 and LTO), while as said
> v7.0.0 doesn't.
>
> Therefore, I run a bisect, and it pointed at:
>
> 8dcb404bff6d9147765d7dd3e9c8493372186420
> tests/qtest: enable more vhost-user tests by default
>
> I've also confirmed that on v7.0.0 with 8dcb404bff6d914 reverted, the
> test actually works.
>
> As far as downstream packaging is concerned, I'll revert it locally.
> But I'd be happy to help figuring our what is actually going wrong.
>
> I'll try to dig further. Any idea/suggestion anyone has, feel free.
> :-)

Sounds like there are still memory corruption/not initialised issues
that are affected by moving things around.

Does it still trigger errors with my latest virtio cleanup series (which
adds more tests to qos-test):

  Subject: [PATCH  v2 00/15] virtio-gpio and various virtio cleanups
  Date: Tue, 24 May 2022 16:40:41 +0100
  Message-Id: <20220524154056.2896913-1-alex.bennee@linaro.org>


>
> Thanks and Regards


--=20
Alex Benn=C3=A9e

