Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D794B68D406
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPL9E-0000Sp-8b; Tue, 07 Feb 2023 05:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1pPL9B-0000SJ-Mv
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1pPL99-0006Av-Cm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675765458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ep59omg7XPDvU5cqAhe2vkhiB3lKdlJefi1wdWZ76RI=;
 b=IRwFQclnTisz8XjjIC4rl7btMd0oIfznj6kqN0mnzpdBDwG2pl825aaOQccpwfV5ppHwlX
 qB50TpWhCkSH5F1VeA+PnT7btVYD0Jw/RtMGN+ktxFexcPQaYfxPe+LsoZ7KiGoj0QeFJw
 Mcj/ck76cOGYoQd6qlDKZA1QNcIkYI8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-WSeY4T5lPNerJQcbJPE8pg-1; Tue, 07 Feb 2023 05:24:17 -0500
X-MC-Unique: WSeY4T5lPNerJQcbJPE8pg-1
Received: by mail-ej1-f70.google.com with SMTP id
 gz8-20020a170907a04800b0087bd94a505fso10791101ejc.16
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 02:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ep59omg7XPDvU5cqAhe2vkhiB3lKdlJefi1wdWZ76RI=;
 b=RKYAfZHMWjWa3F9pfCAHc/EHrF+GJChXfBrFPB3lUb318YCRHCiEEUlVYRmuP3s+yk
 JYawlKIIaC4BDDkSnHYcTzS3/daOkI6GHwLbNZQC36WFRKZ0WBugd/w7tttmGnxwOZEU
 erYCAOehjIEOIz1e6UdYDUf2i+28a0oWA12DEbmM6/f+szRP9lzwQlh0ZrZpzDCkq2Kq
 94fB0Wr0wwRhhbupntry78GzCK2MVW2/YQT47ib/vM87mBGUlZPDd0dNp8Uj+EJNOit+
 F5NyCznslKdakoFNis30TvFAfixBW+ULkzgcO2fsBfqmUPBSzf7XZl3FIkQ2dKJuatZu
 MdIw==
X-Gm-Message-State: AO0yUKXNm5ZeZQnxesY6gFtn/LHCxEeDBPi511HPmkPvLbSybj6LNyqq
 KcDEJoDXjw8QX2wOpZJ4V2hnG90Fl3O8kWYhOVcn7/sVv8qGA7tejWwoWGZQUtCHuK0FHgxKqCZ
 onjbPYdZydgoAdoljAjqwza+80D59JZo=
X-Received: by 2002:a50:c31e:0:b0:4aa:a4f4:1df with SMTP id
 a30-20020a50c31e000000b004aaa4f401dfmr690601edb.78.1675765455913; 
 Tue, 07 Feb 2023 02:24:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/9PribleoazHLYXrivRQOEzMkLB4yrN7FfYcSZZNFVXlwVoj7qT65td0QqRJXWhbFWFaV8JLdbeEtFpLIRAnI=
X-Received: by 2002:a50:c31e:0:b0:4aa:a4f4:1df with SMTP id
 a30-20020a50c31e000000b004aaa4f401dfmr690599edb.78.1675765455758; Tue, 07 Feb
 2023 02:24:15 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CAELaAXysa3M-TPbLMCVCwpt40iqhXpF7PCan_i6SzY_YMafXrg@mail.gmail.com>
 <CAJSP0QWLdbNqyrGnhRB3AqMpH0xYFK6+=TpWrrytQzn9MGD2zA@mail.gmail.com>
In-Reply-To: <CAJSP0QWLdbNqyrGnhRB3AqMpH0xYFK6+=TpWrrytQzn9MGD2zA@mail.gmail.com>
From: Alberto Faria <afaria@redhat.com>
Date: Tue, 7 Feb 2023 10:23:39 +0000
Message-ID: <CAELaAXwAF1QSyfFEzqBFJk69VZN9cEC=H=hHh6kvndFm9p0f6w@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Feb 6, 2023 at 9:22 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> Great that you're interesting, Alberto! Both sound feasible. I would
> like to co-mentor the zoned storage project or can at least commit to
> being available to help because zoned storage is currently on my mind
> anyway :).

Perfect, I'll have time to co-mentor one project, but probably not
two, so let's leave the NVMe driver project aside for now. If anyone
wants to take that one over, though, go for it.

> Do you want to write up one or both of them using the project template
> below? You can use the other project ideas as a reference for how much
> detail to include: https://wiki.qemu.org/Google_Summer_of_Code_2023

I feel like this is closer to a 175 hour project than a 350 hour one,
but I'm not entirely sure.

  === Zoned device support for libblkio ===

   '''Summary:''' Add support for zoned block devices to the libblkio library.

   Zoned block devices are special kinds of disks that are split into several
   regions called zones, where each zone may only be written
sequentially and data
   can't be updated without resetting the entire zone.

   libblkio is a library that provides an API for efficiently accessing block
   devices using modern high-performance block I/O interfaces like
Linux io_uring.

   The goal is to extend libblkio so users can use it to access zoned devices
   properly. This will require adding support for more request types, expanding
   its API to expose additional metadata about the device, and making the
   appropriate changes to each libblkio "driver".

   This is important for QEMU since it will soon support zoned devices too and
   several of its BlockDrivers rely on libblkio. In particular, this
project would
   enable QEMU to access zoned vhost-user-blk and vhost-vdpa-blk devices.

   '''Links:'''
   * https://zonedstorage.io/
   * https://libblkio.gitlab.io/libblkio/
   * https://gitlab.com/libblkio/libblkio/-/issues/44

   '''Details:'''
   * Project size: 175 hours
   * Skill level: intermediate
   * Language: Rust, C
   * Mentor: Alberto Faria <afaria@redhat.com>, Stefan Hajnoczi
<stefanha@gmail.com>
   * Suggested by: Alberto Faria <afaria@redhat.com>

Alberto


