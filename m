Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711663750E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 10:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy8RC-0001ek-5z; Thu, 24 Nov 2022 04:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oy8R9-0001aw-76
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 04:22:27 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oy8R1-0001At-CJ
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 04:22:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v1so1526935wrt.11
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 01:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwbjAja91/aXN2y6kKDQ/w4/jVwClLj2t+y8pev6LH4=;
 b=uuHoQhzL5R1aMT+IDcLVnIAfo3QhMCrw6E6OD0Bu0vw100bf8y9Fqw3JH2PciXpFQa
 7ktPKES1XYyMNOBD6GGdGY/ovrHhhS3UAPEZwiQvgVshzUUV4LYwz2k+2Dibm6kA1KAa
 +VeMc6rZpDyyyAuK8xiQU+AQ49zPAy9xlIzkPtOGZRC9IhBCDU1JaLVoYT6dP/zCsDN6
 8A6HNAjmo8iHp8n/8KhWELLu1ac/geLDbhTcsn5JaoB2rYkSrM17usi54r+wunO6gmi1
 6zyg9u9gXzxbBB+EJke1kZxE31OEadmAi7WZ5eUzon4NCGylYMaSAt5y9/c1QYTDmKce
 RXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pwbjAja91/aXN2y6kKDQ/w4/jVwClLj2t+y8pev6LH4=;
 b=OYqrgHt98df+PWKeDeT57hgzAGwJqxdku+hONhzuvLq0PD3Ujv1rSw1EgFxY6IdSEY
 xBRnYnCz9GCrGe/inR0Y9EtdW/whiJTVPAZ0Gyxd+9uWoSBNx2BNqBbrRLf2tfDTrvo1
 f0eHJmCCOpUnVxOIJ5yWnb5bJLdfWsK3qWCPJPFH+c0LT9Nh9uFPHikLXqvmbKvegnmg
 56Qhc+2vBy36KVdzUSyP2SZIsx7+v174PGFpSdiM8omHgWY4bnQ0RN1beBJGUOnWdQXf
 JjzKM5ao+ybfUGdjGq3BV6Dzh0LXcMIKYa/eDYwgR3wsljHlN6nRv4URRp3n/d3BpFZT
 fRcA==
X-Gm-Message-State: ANoB5pmzYqSbFzxfYeHwyerLq7XvtdbfaFtwcqRJ7mvM+Z/Tu8l+11vq
 zcH47eFHwqGzF2WtzoLf+DkVFA==
X-Google-Smtp-Source: AA0mqf6fEL9HgTE1Iya1T4m5+DXP67MTEJGmKsz6gQsok+I92Hr17hIU6fqURjyUDLnVl6MGgDZy2w==
X-Received: by 2002:a05:6000:1d84:b0:236:5022:c705 with SMTP id
 bk4-20020a0560001d8400b002365022c705mr18808391wrb.466.1669281737548; 
 Thu, 24 Nov 2022 01:22:17 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c3b1800b003cf47556f21sm5811131wms.2.2022.11.24.01.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 01:22:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 060FD1FFB7;
 Thu, 24 Nov 2022 09:22:16 +0000 (GMT)
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
 <87bkoxbqtd.fsf@linaro.org>
 <20221123110755-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Date: Thu, 24 Nov 2022 09:21:15 +0000
In-reply-to: <20221123110755-mutt-send-email-mst@kernel.org>
Message-ID: <877czkbtbs.fsf@linaro.org>
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Nov 23, 2022 at 04:03:49PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Benn=C3=A9e wrote:
>> >> Hi,
>> >>=20
>> >> This hopefully fixes the problems with VirtIO migration caused by the
>> >> previous refactoring of virtio_device_started(). That introduced a
>> >> different order of checking which didn't give the VM state primacy but
>> >> wasn't noticed as we don't properly exercise VirtIO device migration
>> >> and caused issues when dev->started wasn't checked in the core code.
>> >> The introduction of virtio_device_should_start() split the overloaded
>> >> function up but the broken order still remained. The series finally
>> >> fixes that by restoring the original semantics but with the cleaned up
>> >> functions.
>> >>=20
>> >> I've added more documentation to the various structures involved as
>> >> well as the functions. There is still some inconsistencies in the
>> >> VirtIO code between different devices but I think that can be looked
>> >> at over the 8.0 cycle.
>> >
>> >
>> > Thanks a lot! Did you try this with gitlab CI? A patch similar to your
>> > 2/2 broke it previously ...
>>=20
>> Looking into it now - so far hasn't broken locally but I guess there is
>> something different about the CI.
>
>
> yes - pls push to gitlab, create pipeline e.g. with QEMU_CI set to 2
>
> Or with QEMU_CI set to 1 and then run fedora container and then
> clang-system manually.

I'm having trouble re-creating the failures in CI locally on my boxen. I
have triggered a bug on s390 but that looks like a pre-existing problem
with VRING_SET_ENDIAN being triggered for the vhost-user-gpio tests. I
think that is a limitation of the test harness.

Will keep looking.

>
>> >
>> >> Alex Benn=C3=A9e (2):
>> >>   include/hw: attempt to document VirtIO feature variables
>> >>   include/hw: VM state takes precedence in virtio_device_should_start
>> >>=20
>> >>  include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
>> >>  include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++----=
--
>> >>  2 files changed, 59 insertions(+), 9 deletions(-)
>> >>=20
>> >> --=20
>> >> 2.34.1
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

