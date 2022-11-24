Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E26C6379BF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 14:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyC2M-0001bQ-27; Thu, 24 Nov 2022 08:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyC26-0001Zx-RB
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:12:55 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyC24-0005XH-9D
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:12:50 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bs21so2433528wrb.4
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 05:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgocY3iRpESw7lRawIRDdq+AkYu9JHqi8hNHBRBw818=;
 b=cGepRezWAqHoRz9ch7DasMA8eMjxDkUZi902Nb7+PHPJlIZmQleZMhUSs8bqqLoOD8
 IQWhOCgspwJWs4vJKIJAUIOO1Lal6HF2vF+QMCPCOl9JrNqG2cismwjvTi2G/QdjbPqn
 v+CjfcJiD1nRn6NXJL7Ac97iji25HSNNvRFqGSeS0wdFKKu1e+6HGFnoN6sozFSLJFDI
 nHW0538o88KdhiK7+h5RosR20HAXCg7y3zFXAoeeKz205pOChJ1xbGIVyQVMVbx5n2j1
 0at9Cu9zxObUI2Z/K/C8lTMGdh8XKggxWZlZ/VJdFJnQFhWAFmMowWC7SAZGSAzL3nSq
 utfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kgocY3iRpESw7lRawIRDdq+AkYu9JHqi8hNHBRBw818=;
 b=4JwJh2hA0srN8xLXefCgVstpgN6dQ1wgy3W5a22XOOxsBxHnQfVChRlbpz1zIdfp+F
 wxCS3Y3SDOrN3GPv19hw5MoR61S292C5sE32SptT62kepjR3dBlfpJicGU/5EIgDYt+Y
 yOEch4EKZuqZIw1utDK8qR8UaH3gFQmkmUX/9BRLSpVLADs7Ma83aY+ed+Mc4VrmYgDM
 UpPLWWQwmf5yPgJUke/R7dYM3Qxg04lsDhvcwXTzoDWIBQf3YLkTGt0R5mNs+sYFGcc5
 W4/3rzRAm1VAaYAHZP6FvCuNfsz3fcPf0KRqApF3LI6L5AKhwEbyIHRGpl6FrsfdnSQ0
 K7/w==
X-Gm-Message-State: ANoB5pkQ+I78U0KFJ2Bl5VEPZMr/AOvJ2ItVMUjTXqzw9vCPA0+wOK87
 vrvN/f/JHDt6B7UsL0Sqlu/6TQ==
X-Google-Smtp-Source: AA0mqf4XBTlsWTz/zSKKhDCv/wO0KV0kGNfIg2ZrQxIQZ6/57HahU3XEo/hPZ3DH7OR2OPMBUKFWQg==
X-Received: by 2002:a05:6000:181:b0:241:c6f9:3e5a with SMTP id
 p1-20020a056000018100b00241c6f93e5amr11006169wrx.157.1669295566654; 
 Thu, 24 Nov 2022 05:12:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bh23-20020a05600c3d1700b003cfa80443a0sm1790519wmb.35.2022.11.24.05.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 05:12:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63AA01FFB7;
 Thu, 24 Nov 2022 13:12:45 +0000 (GMT)
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
 <87bkoxbqtd.fsf@linaro.org>
 <20221123110755-mutt-send-email-mst@kernel.org>
 <877czkbtbs.fsf@linaro.org>
 <20221124055230-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Date: Thu, 24 Nov 2022 13:11:44 +0000
In-reply-to: <20221124055230-mutt-send-email-mst@kernel.org>
Message-ID: <8735a8binm.fsf@linaro.org>
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

> On Thu, Nov 24, 2022 at 09:21:15AM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Wed, Nov 23, 2022 at 04:03:49PM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >>=20
>> >> > On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Benn=C3=A9e wrote:
>> >> >> Hi,
>> >> >>=20
>> >> >> This hopefully fixes the problems with VirtIO migration caused by =
the
>> >> >> previous refactoring of virtio_device_started(). That introduced a
>> >> >> different order of checking which didn't give the VM state primacy=
 but
>> >> >> wasn't noticed as we don't properly exercise VirtIO device migrati=
on
>> >> >> and caused issues when dev->started wasn't checked in the core cod=
e.
>> >> >> The introduction of virtio_device_should_start() split the overloa=
ded
>> >> >> function up but the broken order still remained. The series finally
>> >> >> fixes that by restoring the original semantics but with the cleane=
d up
>> >> >> functions.
>> >> >>=20
>> >> >> I've added more documentation to the various structures involved as
>> >> >> well as the functions. There is still some inconsistencies in the
>> >> >> VirtIO code between different devices but I think that can be look=
ed
>> >> >> at over the 8.0 cycle.
>> >> >
>> >> >
>> >> > Thanks a lot! Did you try this with gitlab CI? A patch similar to y=
our
>> >> > 2/2 broke it previously ...
>> >>=20
>> >> Looking into it now - so far hasn't broken locally but I guess there =
is
>> >> something different about the CI.
>> >
>> >
>> > yes - pls push to gitlab, create pipeline e.g. with QEMU_CI set to 2
>> >
>> > Or with QEMU_CI set to 1 and then run fedora container and then
>> > clang-system manually.
>>=20
>> I'm having trouble re-creating the failures in CI locally on my boxen. I
>> have triggered a bug on s390 but that looks like a pre-existing problem
>> with VRING_SET_ENDIAN being triggered for the vhost-user-gpio tests. I
>> think that is a limitation of the test harness.
>>=20
>> Will keep looking.
>
> Why not just trigger it on gitlab CI - it's very repeatable there?

I've got a fix for gpio and am running it through CI now:

  https://gitlab.com/stsquad/qemu/-/pipelines/704285944

My main concern is I had to do something no other vhost-user device does
and I'm not sure if thats down to misunderstanding or the other devices
just getting lucky.

--=20
Alex Benn=C3=A9e

