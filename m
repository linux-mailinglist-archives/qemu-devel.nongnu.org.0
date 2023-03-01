Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514026A76EA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXV6h-0002Kn-W1; Wed, 01 Mar 2023 17:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pXV6g-0002FG-1W
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pXV6e-0006gV-4B
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677710366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVcfXOHo5vohESTcT30vWZKo8h1iWZ7PSIKsssAFGmU=;
 b=Mkp2igNXC7ErkoFTM0D1SwYqg+MhvDUYGAZX0XdgwErZIrrfla6TaNnjAUxEDSG/sevSfr
 CJyKqhGVoWJqOdo6IPgTC5PlVGMsTo4OPzGYVdTNwE1fkOnZs4kkOwsa4/b2il2BTyb2DF
 pYZHBpwCKfT6rHyEO/X6yJtWY0Calzo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-sZUzpjzPOJex6ExsHDfdjA-1; Wed, 01 Mar 2023 17:39:25 -0500
X-MC-Unique: sZUzpjzPOJex6ExsHDfdjA-1
Received: by mail-il1-f199.google.com with SMTP id
 y14-20020a92c74e000000b003157134a9fbso8740151ilp.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 14:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVcfXOHo5vohESTcT30vWZKo8h1iWZ7PSIKsssAFGmU=;
 b=2kwTeU0Zq0NKLPugFp8IVh+pW6ork1Vp+zu9WkapskjpBl6GI4t0pAAsh2tqJHzrXh
 DmxOZQM5BchJg2bm6MBHQr3JoAEjalJTgWTl/f36W+59yyZEhKs8UFkiVEZKjesFZnTq
 /za/Ag8286QcZSM4sB76ieuEHPgp8/QcdoSXw30YqpbcNDZ4dKzZE0tlVZhEwcO8biJ4
 xUxASoqNaLk1kZE7kKLnQiSvWWPX+AhGNYQWXLsV3qpynvl2fq+DHM42I3D6ik3U61Td
 5r0ldXum7Bg8qsvnlt2slRm+dKJpRnyQbjPxKBWLuKShnQ9xjdIUH38V1o1Cdm46EblK
 LlMA==
X-Gm-Message-State: AO0yUKX4n4Bcmzc+7L383VNKn+4vzsufMSxSRxPZKHXMWBAoYq2ycHgi
 x29KZA6G45fgP7wGiYEaFZCcBegnnI4yH62/9btwSvBt7TzBIQ9q5ocsIe1GlMKB0Kkt7dAEMTr
 j9DOq1v+qkM+Kqo0=
X-Received: by 2002:a5e:df09:0:b0:745:a99c:af1 with SMTP id
 f9-20020a5edf09000000b00745a99c0af1mr5295835ioq.6.1677710364948; 
 Wed, 01 Mar 2023 14:39:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/cQyuejDFmy+Af8to8A7aLJgkVwJlD9MYsQoYXCHjuPSFqUhN+8uyd6p5xccfOgTg5ORQvAA==
X-Received: by 2002:a5e:df09:0:b0:745:a99c:af1 with SMTP id
 f9-20020a5edf09000000b00745a99c0af1mr5295808ioq.6.1677710364703; 
 Wed, 01 Mar 2023 14:39:24 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u12-20020a92d1cc000000b00313f1b861b7sm3912843ilg.51.2023.03.01.14.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 14:39:24 -0800 (PST)
Date: Wed, 1 Mar 2023 15:39:17 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <20230301153917.243792b8.alex.williamson@redhat.com>
In-Reply-To: <Y/+/0z/MEkKuLNgk@nvidia.com>
References: <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
 <20230227091444.6a6e93cd.alex.williamson@redhat.com>
 <Y/znqJvtxtUEmsHi@nvidia.com>
 <20230227104308.14077d8a.alex.williamson@redhat.com>
 <b142b581-65c3-285d-bc68-fabc8d5ab0b7@nvidia.com>
 <20230301125559.613c85e9.alex.williamson@redhat.com>
 <Y/+/0z/MEkKuLNgk@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 1 Mar 2023 17:12:51 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Mar 01, 2023 at 12:55:59PM -0700, Alex Williamson wrote:
> 
> > So it seems like what we need here is both a preface buffer size and a
> > target device latency.  The QEMU pre-copy algorithm should factor both
> > the remaining data size and the device latency into deciding when to
> > transition to stop-copy, thereby allowing the device to feed actually
> > relevant data into the algorithm rather than dictate its behavior.  
> 
> I don't know that we can realistically estimate startup latency,
> especially have the sender estimate latency on the receiver..

Knowing that the target device is compatible with the source is a point
towards making an educated guess.

> I feel like trying to overlap the device start up with the STOP phase
> is an unnecessary optimization? How do you see it benifits?

If we can't guarantee that there's some time difference between sending
initial bytes immediately at the end of pre-copy vs immediately at the
beginning of stop-copy, does that mean any handling of initial bytes is
an unnecessary optimization?

I'm imagining that completing initial bytes triggers some
initialization sequence in the target host driver which runs in
parallel to the remaining data stream, so in practice, even if sent at
the beginning of stop-copy, the target device gets a head start.

> I've been thinking of this from the perspective that we should always
> ensure device startup is completed, it is time that has to be paid,
> why pay it during STOP?

Creating a policy for QEMU to send initial bytes in a given phase
doesn't ensure startup is complete.  There's no guaranteed time
difference between sending that data and the beginning of stop-copy.

QEMU is trying to achieve a downtime goal, where it estimates network
bandwidth to get a data size threshold, and then polls devices for
remaining data.  That downtime goal might exceed the startup latency of
the target device anyway, where it's then the operators choice to pay
that time in stop-copy, or stalled on the target.

But if we actually want to ensure startup of the target is complete,
then drivers should be able to return both data size and estimated time
for the target device to initialize.  That time estimate should be
updated by the driver based on if/when initial_bytes is drained.  The
decision whether to continue iterating pre-copy would then be based on
both the maximum remaining device startup time and the calculated time
based on remaining data size.

I think this provides a better guarantee than anything based simply on
transferring a given chunk of data in a specific phase of the process.
Thoughts?  Thanks,

Alex


