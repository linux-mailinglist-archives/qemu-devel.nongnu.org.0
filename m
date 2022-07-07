Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0E56A6F5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:30:58 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TSz-00043E-4S
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o9TQe-0002qv-Jc
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:28:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o9TQc-0007zN-NO
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:28:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q9so26833770wrd.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=a8r1pfKBSywaim0blc+VTC6ZyvJlag2b0//ZLr+m1ok=;
 b=WahM/iHTnRADm9DuOvsS58E+Wfe3tAa8MrU3qg40XZ6oGdGVHR3BFt1cp7vmN0IlGm
 bnNyl/W1VZqfjwMj5jJvRVz9F6Y14P/BKjBlOMXuXJaGd9EY4DW/+P4IygvLqnYjTShU
 2bIC91OjnRKzIPos1rm5x8UuUDHTBFR4Sl+/D6ZnHZXeiNP+Jh/q/PkniAOb/Q1/A3pf
 kSDGCDr5ErbXfAPq/nm01KF9YLxbzRUZ5NyH5iZWTguwzHESQLlG7GrnqFHfBjn93BsV
 1nzrReIevpgMJak0nkYHIr8weMZ/Kz/NzoY1meyObYpRm8988xVAfBBIo2LXXhzG2hnx
 RVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=a8r1pfKBSywaim0blc+VTC6ZyvJlag2b0//ZLr+m1ok=;
 b=VCQgGuU2IsN8faM2WVjMw3oWYXpQfk3/mv8zWvDHnapTgLbBxsL/JfA5DdA60wFrF2
 f9entE0Kd3FktQHyZFDluHnPYQ7by/ChANj+VGmIknteUKOpe00A6Mi1nMkSflnlkV8G
 kjD0BkWr5U91wXfGAEck+dzDCaEWK2A25aaHbyt8eMORo4A32NwJweXUYUHNS+aVKwzc
 OqqReMMOchDr255mAJ8E8WEz7OyDSBsNGydl9LT8mYnO9c57igvf8Iv9G89d1p/e8b0x
 gZ81Zyx+rqZjGZzo1i8yZY0qbWVf88omTM1Q1bEFo4u2vP43jQqJzHcYHFBZK2RWGhLA
 5y4g==
X-Gm-Message-State: AJIora9wohj7B3UQzksF3Ojmp1CBZrj/x+9ArFKJOhpldmZe3C5cFSIY
 THuRD/j/Um+u+iABf6zemMlG9A==
X-Google-Smtp-Source: AGRyM1vuG3xjEEuw4aEWxkd40G8HfJ/Tn7UZv/HZl3DHylgWiN1VyXXM8wzqIZwlz5y/q+9Dop/3mA==
X-Received: by 2002:a05:6000:1c13:b0:21d:6964:fcca with SMTP id
 ba19-20020a0560001c1300b0021d6964fccamr21348046wrb.663.1657207708354; 
 Thu, 07 Jul 2022 08:28:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 j2-20020adfff82000000b0021a56cda047sm882893wrr.60.2022.07.07.08.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 08:28:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46A3E1FFB7;
 Thu,  7 Jul 2022 16:28:00 +0100 (BST)
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <Yo5V19zE82hWFuSJ@stefanha-x1.localdomain> <87fsjdjayh.fsf@linaro.org>
 <CAJSP0QVDEKn9MHu431q8Qdy+z73MSoGR5DCRMir9xEndZZqnQA@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel
 <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH v2 00/15] virtio-gpio and various virtio cleanups
Date: Thu, 07 Jul 2022 16:20:18 +0100
In-reply-to: <CAJSP0QVDEKn9MHu431q8Qdy+z73MSoGR5DCRMir9xEndZZqnQA@mail.gmail.com>
Message-ID: <87zghlhri7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Thu, 7 Jul 2022 at 14:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>
>> > [[PGP Signed Part:Undecided]]
>> > On Tue, May 24, 2022 at 04:40:41PM +0100, Alex Benn=C3=A9e wrote:
>> >> Hi,
>> >>
>> >> This series ostensibly adds virtio-user-gpio stubs to the build for
>> >> use with an external vhost-user daemon. We've been testing it with our
>> >> rust daemons from:
>> >>
>> >>   https://github.com/rust-vmm/vhost-device
>> >>
>> >> Getting the test enabled took some doing most likely because the need
>> >> for CONFIG support exercised additional paths in the code that were
>> >> not used for the simpler virtio-net tests. As a result the series has
>> >> a number of cleanup and documentation patches.
>> >>
>> >> The final thing that needed fixing was the ensuring that
>> >> VHOST_USER_F_PROTOCOL_FEATURES didn't get squashed in the negotiation
>> >> process. This was the hardest thing to track down as we store the
>> >> feature bits in several places variously as:
>> >>
>> >>   in VirtIODevice as:
>> >>     uint64_t guest_features;
>> >>     uint64_t host_features;
>> >>     uint64_t backend_features;
>> >
>> > None of these know about VHOST_USER_F_PROTOCOL_FEATURES and vhost-user=
's
>> > unfiltered feature bits should never be passed to VirtIODevice.
>> >
>> >>
>> >>  in vhost_dev as:
>> >>     uint64_t features;
>> >>     uint64_t acked_features;
>> >>     uint64_t backend_features;
>> >
>> > I don't think these should know about VHOST_USER_F_PROTOCOL_FEATURES
>> > either. AFAIK vhost_dev deals with VIRTIO feature bits, not raw
>> > vhost-user GET_FEATURES.
>>
>> So where does VHOST_USER_F_PROTOCOL_FEATURES get set before it's set
>> with the VHOST_USER_SET_FEATURES message? Currently it's fed via:
>>
>>     uint64_t features =3D vhost_dev->acked_features;
>>
>> in vhost_dev_set_features() which does apply a few extra bits
>> (VHOST_F_LOG_ALL/VIRTIO_F_IOMMU_PLATFORM). Maybe it should be adding
>> VHOST_USER_F_PROTOCOL_FEATURES here? How should it be signalled by the
>> vhost-user backend that this should be done? Overload the function?
>
> A modern vhost-user server replies to VHOST_USER_GET_FEATURES with
> VHOST_USER_F_PROTOCOL_FEATURES set. That's when the vhost-user client
> encounters this bit.
>
> The vhost-user client should then filter out
> VHOST_USER_F_PROTOCOL_FEATURES because it belongs to the vhost-user
> protocol and isn't a real VIRTIO feature bit. The client uses the
> filtered VIRTIO feature bits and it now knows whether the vhost-user
> server supports the VHOST_USER_GET_PROTOCOL_FEATURES and
> VHOST_USER_SET_PROTOCOL_FEATURES messages.
>
> I think vhost_user_set_features() should set
> VHOST_USER_F_PROTOCOL_FEATURES if the server returned it from
> VHOST_USER_GET_FEATURES. At the moment vhost_user_backend_init()
> stores VHOST_USER_F_PROTOCOL_FEATURES in struct
> vhost_dev->backend_features, which only seems to be used by vhost-net
> code.

I can clean-up the documentation for this. I wonder if the VirtIODevice
backend_features is a duplication that should be removed?

> The other vhost-user devices set acked_features =3D guest_features and
> ignore backend_features. As a result I guess they don't set
> VHOST_USER_F_PROTOCOL_FEATURES in the VHOST_USER_SET_FEATURES message.
> Most vhost-user servers probably don't care and still respond to
> VHOST_USER_GET_PROTOCOL_FEATURES and VHOST_USER_SET_PROTOCOL_FEATURES
> messages (although the vhost-user protocol spec mentions other
> protocol differences when VHOST_USER_F_PROTOCOL_FEATURES is not
> negotiated).
>
> Does this match what you've found? The code is a maze so I may have
> gotten something wrong.

I think so. As you say it's a bit of a maze and hopefully we can more
clearly document when and where things are and how they should be used.
The various virtio devices have grown organically so there are
inconsistencies that need ironing out.=20

> In general I think hw/virtio/vhost-user.c
> should be responsible for VHOST_USER_F_PROTOCOL_FEATURES and no other
> part of the QEMU codebase should ever see the bit since it's a
> vhost-user protocol detail and not part of VIRTIO or even a common
> part of vhost.

OK I'll see what I can cook up.

>
> Stefan


--=20
Alex Benn=C3=A9e

