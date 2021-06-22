Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E73AFF38
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:26:19 +0200 (CEST)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbjf-0004bE-0U
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lvbiq-0003l5-Ln
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lvbio-0007Eb-Qu
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624350324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swSM3Qph1sL3g8nBslY/rzPPQNkRYLBuoMByq79a+yg=;
 b=eSIxpZ7GdTbvwqkrJ5kg3oWsAq27PsJLomoydV7AslcPd02LUgzc/1jCEmfMqfGU92zXiX
 NACPpDuSi80relKrZuK3v46I5b/Hv17ACcr84OqtzaI3UQGk9lS3X4fXxZ1hInqLQ0q8Wm
 U23AW9jcPUmA/bfmpMOCp7rcGtZZvqA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-jlbUKpVbM0uSwXyMRiGuKQ-1; Tue, 22 Jun 2021 04:25:22 -0400
X-MC-Unique: jlbUKpVbM0uSwXyMRiGuKQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v8-20020a0564023488b0290393873961f6so9078993edc.17
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=qCKyGhtx2WIHEWwfJHEHJs8B5GQfdVCWlhdzWLZ8+2I=;
 b=eSAq0DotjDzB+VR3YzhaZwb/mQtkJ448GlzuSdi2/1nHJFjw8Ymb/QARL4Lj5+jSy2
 rbKsu9Kf4lrxBwAjSoBWS5wMGMqbtB2zOhbIeFBD87X8ATwWhMsSRV8OU711WZLXYY7j
 WRwwLQ62rGWHISeUmE1eYn6E9Rsd/X0i/+mPqyv8UPeJG6L1LjVWlyco69AQ9Byh6tZv
 PL6a0i/PpeJOr6UP2og0P7FNq/BRJxOLfuPNb5JzVw+QWsF1H0Jw47PXBJw2i+TX4by3
 87NtxEatb06KLR1tkXKmR+25SNpZYke/Me74G8loMNP/Px+D97rRNjA2F0P7uu67xN2F
 VKtw==
X-Gm-Message-State: AOAM533j1I19YioOptBVkX9ZpQ+RBoFcynCv593yn7ILiPmz5jUUiWmx
 soIOw7xoTlnxEeTO0KWVhBKT7L2toWW7kdPnpBDLYOoyF5ZO0HWfM7g7heFk8HXxTvWeWInuvRc
 jn5FNy1NjFBNQD/c=
X-Received: by 2002:a17:906:5d11:: with SMTP id
 g17mr2637655ejt.537.1624350321270; 
 Tue, 22 Jun 2021 01:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVZn9+gxL7phTkGRybIi/e8hcgXf40DSz8gP8tt6rJblE50BWOL+Dk45vyyM8BQRJnuLF9Rw==
X-Received: by 2002:a17:906:5d11:: with SMTP id
 g17mr2637625ejt.537.1624350320745; 
 Tue, 22 Jun 2021 01:25:20 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id a1sm863767edt.16.2021.06.22.01.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:25:20 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 9C77818071E; Tue, 22 Jun 2021 10:25:19 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Jason Wang <jasowang@redhat.com>, Yuri Benditovich
 <yuri.benditovich@daynix.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
In-Reply-To: <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com>
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
 <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Jun 2021 10:25:19 +0200
Message-ID: <87o8byqpao.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=toke@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Wang <jasowang@redhat.com> writes:

> =E5=9C=A8 2021/6/22 =E4=B8=8A=E5=8D=8811:29, Yuri Benditovich =E5=86=99=
=E9=81=93:
>> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03, Andrew Melnichenko =E5=86=
=99=E9=81=93:
>>>> Hi Jason,
>>>> I've checked "kernel.unprivileged_bpf_disabled=3D0" on Fedora,  Ubuntu=
,
>>>> and Debian - no need permissions to update BPF maps.
>>>
>>> How about RHEL :) ?
>> If I'm not mistaken, the RHEL releases do not use modern kernels yet
>> (for BPF we need 5.8+).
>> So this will be (probably) relevant for RHEL 9. Please correct me if I'm=
 wrong.
>
> Adding Toke for more ideas on this.

Ignore the kernel version number; we backport all of BPF to RHEL,
basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.

However, we completely disable unprivileged BPF on RHEL kernels. Also,
there's upstream commit:
08389d888287 ("bpf: Add kconfig knob for disabling unpriv bpf by default")

which adds a new value of '2' to the unprivileged_bpf_disable sysctl. I
believe this may end up being the default on Fedora as well.

So any design relying on unprivileged BPF is likely to break; I'd
suggest you look into how you can get this to work with CAP_BPF :)

-Toke


