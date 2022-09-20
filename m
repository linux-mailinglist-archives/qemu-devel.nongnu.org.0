Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B85BF102
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:22:52 +0200 (CEST)
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamZm-0005BV-UI
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaieF-0005y9-GU
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 15:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oaieD-0003p2-Oi
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 15:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663701069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STWTe4U3NJ5zuO1xRAteJIbAx83AiGgkwojLzNH47eU=;
 b=i6kBwrlPJYGkpKdN8BbfXbBrCpqMYoIXKQjuObqYrNjWVkB6Mc8CquPOGd9Abq0QF2Y3KR
 gh/MP7oz9Ry9UQso5ygUm2yvTVP7fvCbSEGrTYhaQVI6ylgplnG9lQ2EllV6lEtUQFtxrY
 HoSOVnDnM0IGS9eoc2t+r8Q81duwgp4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-bkKH2481Mo2TDe17XJ3e-g-1; Tue, 20 Sep 2022 15:11:05 -0400
X-MC-Unique: bkKH2481Mo2TDe17XJ3e-g-1
Received: by mail-ed1-f72.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so2535991eda.19
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 12:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=STWTe4U3NJ5zuO1xRAteJIbAx83AiGgkwojLzNH47eU=;
 b=SZ/JcxjoaZ5SsvsHO0uxt0eJQnxMAW04fJBxR5W+YtqIyNp9wO4kNXjrtxu9vWJDEj
 UmSlDYvOngWMML4Kci7PFuLLCKnvD5lftBmHq8gPnf2u8S5Jt/cu1pQwnhiCs1Iqllmw
 yentMLTX4lBonxZvMfWGuPVCrDTgZrG4PmDXcFqhNqF2wEf62OuZDAWiH6zmW1zMKVxX
 ceZ/IZLyWuaD0OG9H/RWUPusW2GHmSAoxE3dTTCnFbjkg46MSu1Q0tGvt62OZo57d251
 GusfRX63qh30uNVYBIp/aCootTlzZBSh17CkO3fjH/Y9EEsmMAJ/l/9xzUR920672CXp
 nuWQ==
X-Gm-Message-State: ACrzQf3xVGjNRf1aW4GMaHAjvuoGK0/n3YfCQWaZkRNTEnd+hOJTHXQh
 vJub2trL19JJJKlk8/IdF5EfqLL/g2/5/rBXUsFoWRUyShITBajOTe+38lu8fvTvviTXwyy4b+D
 YwYA/deJJSxPsaFA=
X-Received: by 2002:a17:907:9807:b0:781:feee:f87c with SMTP id
 ji7-20020a170907980700b00781feeef87cmr650793ejc.101.1663701064109; 
 Tue, 20 Sep 2022 12:11:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6IzV1EY8/SaAL9ArsLqwAPD1Qh2n9F/CsH3YMD7pybfaPTqFZhkSmWOUzBeCgHDk3SDOkM7Q==
X-Received: by 2002:a17:907:9807:b0:781:feee:f87c with SMTP id
 ji7-20020a170907980700b00781feeef87cmr650780ejc.101.1663701063828; 
 Tue, 20 Sep 2022 12:11:03 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 o3-20020a170906768300b0073ddff7e432sm328500ejm.14.2022.09.20.12.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:11:03 -0700 (PDT)
Date: Tue, 20 Sep 2022 15:10:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 slp@redhat.com, marcandre.lureau@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
Message-ID: <20220920150943-mutt-send-email-mst@kernel.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <87czbvzu9e.fsf@linaro.org> <YyibNC4CbniKUTmi@fedora>
 <8735cm9t6j.fsf@linaro.org>
 <CAJSP0QXN4Sn6rXpZ3rEiPHGQqpgx2bOMX_t0byx+0icBhMNinA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QXN4Sn6rXpZ3rEiPHGQqpgx2bOMX_t0byx+0icBhMNinA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, Sep 20, 2022 at 02:25:48PM -0400, Stefan Hajnoczi wrote:
> On Tue, 20 Sept 2022 at 10:18, Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> >
> > Stefan Hajnoczi <stefanha@redhat.com> writes:
> >
> > > [[PGP Signed Part:Undecided]]
> > > On Fri, Sep 16, 2022 at 07:51:40AM +0100, Alex Bennée wrote:
> > >>
> > >> Alex Bennée <alex.bennee@linaro.org> writes:
> > >>
> > >> > Hi,
> > >> >
> > >> > This is an update to the previous series which fixes the last few
> > >> > niggling CI failures I was seeing.
> > >> >
> > >> >    Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cleanups
> > >> >    Date: Tue, 26 Jul 2022 20:21:29 +0100
> > >> >    Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>
> > >> >
> > >> > The CI failures were tricky to track down because they didn't occur
> > >> > locally but after patching to dump backtraces they all seem to involve
> > >> > updates to virtio_set_status() as the machine was torn down. I think
> > >> > patch that switches all users to use virtio_device_started() along
> > >> > with consistent checking of vhost_dev->started stops this from
> > >> > happening. The clean-up seems worthwhile in reducing boilerplate
> > >> > anyway.
> > >> >
> > >> > The following patches still need review:
> > >> >
> > >> >   - tests/qtest: enable tests for virtio-gpio
> > >> >   - tests/qtest: add a get_features op to vhost-user-test
> > >> >   - tests/qtest: implement stub for VHOST_USER_GET_CONFIG
> > >> >   - tests/qtest: add assert to catch bad features
> > >> >   - tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
> > >> >   - tests/qtest: catch unhandled vhost-user messages
> > >> >   - tests/qtest: use qos_printf instead of g_test_message
> > >> >   - tests/qtest: pass stdout/stderr down to subtests
> > >> >   - hw/virtio: move vhd->started check into helper and add FIXME
> > >> >   - hw/virtio: move vm_running check to virtio_device_started
> > >> >   - hw/virtio: add some vhost-user trace events
> > >> >   - hw/virtio: log potentially buggy guest drivers
> > >> >   - hw/virtio: fix some coding style issues
> > >> >   - include/hw: document vhost_dev feature life-cycle
> > >> >   - include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
> > >> >   - hw/virtio: fix vhost_user_read tracepoint
> > >> >   - hw/virtio: handle un-configured shutdown in virtio-pci
> > >> >   - hw/virtio: gracefully handle unset vhost_dev vdev
> > >> >   - hw/virtio: incorporate backend features in features
> > >> <snip>
> > >>
> > >> Ping?
> > >
> > > Who are you pinging?
> > >
> > > Only qemu-devel is on To and there are a bunch of people on Cc.
> >
> > Well I guess MST is the maintainer for the sub-system but I was hoping
> > other virtio contributors had some sort of view. The process of
> > up-streaming a simple vhost-user stub has flushed out all sorts of
> > stuff.
> 
> Okay, moving MST to To in case it helps get his attention.
> 
> Thanks,
> Stefan

thanks, it's in my queue, just pulling in backlog that built up
during the forum.

-- 
MST


