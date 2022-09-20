Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8025BF238
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:35:43 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaniH-0000I1-GO
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oake4-0000Vt-FX
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 17:19:10 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oake1-00031Y-KQ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 17:19:07 -0400
Received: by mail-ej1-x62d.google.com with SMTP id r18so9204310eja.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=7q8+gdcavLqfc9o+O76ixePtOmnPXDjLsYaMgstOOws=;
 b=xU8WwToHZNC3zk9gM38Mk1PD1DExNQ0EaXzhTGwmxNWZIs9jETZQz/tJuGzBAScwcL
 3NlVdP0fMsoel95Mlv2Ia/misGWuvjuknr5yMvdDzA1o7VavSmVqOxfpWH3kupCclLwy
 Rzh1wH4vu1DdCtsLxelF5t8Jsb14Ww2aWynxQZb9K7dKcX258KBNh6m2+yrsfo6SEhXU
 0UcRVWVftUNSTn8hNfHt37BLIZyCvmrcbnxF2lPY9rU4669qb4r2erlV1rpHg3GM0uTh
 DekgSDRTBOOb4zADlIZUYQ82y8qxcYrj9vBHQhsaS6KNAtp5K8a7ohlGmHap1Wa7hjsD
 WtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=7q8+gdcavLqfc9o+O76ixePtOmnPXDjLsYaMgstOOws=;
 b=dMk4pqeoldJ5+XVEY6nE0nEZu3RCrCBzJ8LhtqRJEev2SRlxmaCLrdIejZIYh3sRZv
 O9V2O2MiyqGVmHak2TCKb713MnPfXI3CMEGm6bCPfXJGCppGqHmizT5sFwEDkQmL2JY7
 8qOVJ/n+rE0L2N7QjnsfKOEMixe1h+dabki5zyaUmcNIEa9HBE3Ww2x78tLBCgfgFjrG
 aDmqFaq9ShNsuMyAn250MBxVRVCaLCWDq7iXnRd2oMKXTeLflcKmvJ1lhn9qn4JPz/0y
 ZtTRzc5hdI7IN3yx2w8GS5ccZG/JhRDIZdE0ZnsydUYtepcQDuo1vXPPul/nsuPP4HfL
 R8IQ==
X-Gm-Message-State: ACrzQf14Xvi6DsAUBHX0Pz2EnDrOOTt0czxQHwThVZdm8+y/caBI9laW
 8qidsReLNdys99xLr8XwGjYRug==
X-Google-Smtp-Source: AMsMyM6MdL11ZUmd7yu3eos8kpX37jL3Fsjhaw7aAfe/OFUplDluJ4nrzHrdRfxoYouffEA+qWe5Rg==
X-Received: by 2002:a17:906:1350:b0:77f:76a7:a0f with SMTP id
 x16-20020a170906135000b0077f76a70a0fmr18169730ejb.503.1663708744158; 
 Tue, 20 Sep 2022 14:19:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 jt2-20020a170906dfc200b007417041fb2bsm385662ejc.116.2022.09.20.14.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 14:19:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B18741FFB7;
 Tue, 20 Sep 2022 22:19:02 +0100 (BST)
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <87czbvzu9e.fsf@linaro.org> <YyibNC4CbniKUTmi@fedora>
 <8735cm9t6j.fsf@linaro.org>
 <CAJSP0QXN4Sn6rXpZ3rEiPHGQqpgx2bOMX_t0byx+0icBhMNinA@mail.gmail.com>
 <20220920150943-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org, slp@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
Date: Tue, 20 Sep 2022 22:18:49 +0100
In-reply-to: <20220920150943-mutt-send-email-mst@kernel.org>
Message-ID: <87h711922h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Sep 20, 2022 at 02:25:48PM -0400, Stefan Hajnoczi wrote:
>> On Tue, 20 Sept 2022 at 10:18, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >
>> >
>> > Stefan Hajnoczi <stefanha@redhat.com> writes:
>> >
>> > > [[PGP Signed Part:Undecided]]
>> > > On Fri, Sep 16, 2022 at 07:51:40AM +0100, Alex Benn=C3=A9e wrote:
>> > >>
>> > >> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>> > >>
>> > >> > Hi,
>> > >> >
>> > >> > This is an update to the previous series which fixes the last few
>> > >> > niggling CI failures I was seeing.
>> > >> >
>> > >> >    Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virt=
io cleanups
>> > >> >    Date: Tue, 26 Jul 2022 20:21:29 +0100
>> > >> >    Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>
>> > >> >
>> > >> > The CI failures were tricky to track down because they didn't occ=
ur
>> > >> > locally but after patching to dump backtraces they all seem to in=
volve
>> > >> > updates to virtio_set_status() as the machine was torn down. I th=
ink
>> > >> > patch that switches all users to use virtio_device_started() along
>> > >> > with consistent checking of vhost_dev->started stops this from
>> > >> > happening. The clean-up seems worthwhile in reducing boilerplate
>> > >> > anyway.
>> > >> >
>> > >> > The following patches still need review:
>> > >> >
>> > >> >   - tests/qtest: enable tests for virtio-gpio
>> > >> >   - tests/qtest: add a get_features op to vhost-user-test
>> > >> >   - tests/qtest: implement stub for VHOST_USER_GET_CONFIG
>> > >> >   - tests/qtest: add assert to catch bad features
>> > >> >   - tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
>> > >> >   - tests/qtest: catch unhandled vhost-user messages
>> > >> >   - tests/qtest: use qos_printf instead of g_test_message
>> > >> >   - tests/qtest: pass stdout/stderr down to subtests
>> > >> >   - hw/virtio: move vhd->started check into helper and add FIXME
>> > >> >   - hw/virtio: move vm_running check to virtio_device_started
>> > >> >   - hw/virtio: add some vhost-user trace events
>> > >> >   - hw/virtio: log potentially buggy guest drivers
>> > >> >   - hw/virtio: fix some coding style issues
>> > >> >   - include/hw: document vhost_dev feature life-cycle
>> > >> >   - include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
>> > >> >   - hw/virtio: fix vhost_user_read tracepoint
>> > >> >   - hw/virtio: handle un-configured shutdown in virtio-pci
>> > >> >   - hw/virtio: gracefully handle unset vhost_dev vdev
>> > >> >   - hw/virtio: incorporate backend features in features
>> > >> <snip>
>> > >>
>> > >> Ping?
>> > >
>> > > Who are you pinging?
>> > >
>> > > Only qemu-devel is on To and there are a bunch of people on Cc.
>> >
>> > Well I guess MST is the maintainer for the sub-system but I was hoping
>> > other virtio contributors had some sort of view. The process of
>> > up-streaming a simple vhost-user stub has flushed out all sorts of
>> > stuff.
>>=20
>> Okay, moving MST to To in case it helps get his attention.
>>=20
>> Thanks,
>> Stefan
>
> thanks, it's in my queue, just pulling in backlog that built up
> during the forum.

Thanks, doing the same myself ;-)

--=20
Alex Benn=C3=A9e

