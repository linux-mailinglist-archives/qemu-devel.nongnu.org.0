Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF76EFA69
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:55:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkI2-0002qC-Ka; Wed, 26 Apr 2023 14:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prkHz-0002pu-RN
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prkHx-0007tV-Of
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682535288;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sNKYQxoiHNqK1ffHGbHd4z6CUMgv/rz6XXi3RXkILXg=;
 b=FmsJszM0KBVt3Y8Hv9Vmvso6z77As/PJb+OoQ+kLbEX0VOMHZd+4jVIy59VcrhoEIyHKX1
 C7lZPOYBcwnihHqc9RtJgF6thp8V1K/KJA4Z+Q+467f6rR5U8N5z+SRcA9f7eVoWOk9+IL
 2DgflnbB75FPozF+O6XPEO0Bfu8tpDc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-vVba56XGMHmu5B3kW52Vaw-1; Wed, 26 Apr 2023 14:54:17 -0400
X-MC-Unique: vVba56XGMHmu5B3kW52Vaw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f175a24fd1so42225985e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 11:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682535245; x=1685127245;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNKYQxoiHNqK1ffHGbHd4z6CUMgv/rz6XXi3RXkILXg=;
 b=eXSIbyK20TuYOSsKXHdIokTCEHZCGRYaFjqJL0StkQg4k9LYtLI9hIF2pCmRO5T0Zs
 4cR5vNeI7iafkgr06Pau7ONpurani8Rn5qqahFTb5ilbECMGOfhuogXAkeBQP6IAGijA
 PPZmdYg8J/Att8eHqvZD6Kwga4N2hVEvh7wsmPxSI9x5NBL/EjiW/yS55bROFDX2WCzX
 sDOAJwPcolNxK4jh0UC+WtrvJ/fXEXLBStsgD7281XTHAClmoAdCl316UY/AwdtwCZ43
 NnSevnYSR2ruX4YE0J0qVQ9XRDH+lIKE/3ddUNin5eA8VT1Nk0oGIpb1W1C8y5MkRG0Z
 F3hA==
X-Gm-Message-State: AAQBX9cPeUB/ZJekGEs3L6AkBbSlA0bXdXNviHXEdM9TETFQJhl45FmY
 6fneLT0vaj9Ot8XPZplBXYeByrYCW/tOJv1tioICx6ATiWaRgV/vr0hvb4T+4DLFq/VzYRADfH2
 oplvsBODE5e7vW2I=
X-Received: by 2002:a7b:c441:0:b0:3f0:7e56:82a4 with SMTP id
 l1-20020a7bc441000000b003f07e5682a4mr14276856wmi.18.1682535245056; 
 Wed, 26 Apr 2023 11:54:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350bO7PZiA5bcHEGj6t3H9f1jLffIYTQax8hB5pSjRW3raz/GLdRWQJWRjqAyV4ammQFQXpxrqA==
X-Received: by 2002:a7b:c441:0:b0:3f0:7e56:82a4 with SMTP id
 l1-20020a7bc441000000b003f07e5682a4mr14276845wmi.18.1682535244666; 
 Wed, 26 Apr 2023 11:54:04 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 iz14-20020a05600c554e00b003f175954e71sm22270258wmb.32.2023.04.26.11.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 11:54:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 0/2] vmstate-static-checker: Fix VMS_ARRAY comparisons
In-Reply-To: <ZElvWffplx+1vNH1@x1n> (Peter Xu's message of "Wed, 26 Apr 2023
 14:37:13 -0400")
References: <20230425180544.1815888-1-peterx@redhat.com>
 <87354mfvnz.fsf@secure.mitica> <ZElvWffplx+1vNH1@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 20:54:02 +0200
Message-ID: <87mt2ueaph.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Wed, Apr 26, 2023 at 06:36:00PM +0200, Juan Quintela wrote:
>> Peter Xu <peterx@redhat.com> wrote:
>> > I'm doing some machine type checks to make sure nothing breaks for
>> > 7.2<->8.0.  Along the way I found one false negative report on e1000e using
>> > the static checker, turns out to be an issue in the checker itself.
>> >
>> > The problem is the checker doesn't take VMS_ARRAY into account when
>> > comparing with UNUSED, hence the total size is wrongly calculated.
>> >
>> > Fix that first in qemu by start dumping size of array as "num", then teach
>> > the checker for that.
>> >
>> > NOTE: the patchset will change both behaviors for either -dump-vmstate on
>> > QEMU or the checker, however both patches will be compatible even with old
>> > QEMU dumps or even old vmstate-checker script.  That's not extremely
>> > important, IMHO, but still worth mentioning.
>> >
>> > Thanks,
>> >
>> > Peter Xu (2):
>> >   migration/vmstate-dump: Dump array size too as "num"
>> >   vmstate-static-checker: Recognize "num" field
>> >
>> >  migration/savevm.c                |  3 +++
>> >  scripts/vmstate-static-checker.py | 13 ++++++++++---
>> >  2 files changed, 13 insertions(+), 3 deletions(-)
>> 
>> Hi
>> 
>> once that you are working with the static checker.
>> 
>> Could we just run two checks in make check:
>> 
>> - qemu-<whatever> -M <previous-version> against the one from previous
>>   version, and see that they match.
>> - qemu-<whatever> -M <latests> against the one from previous version
>>   And we save the diffs each time that we add something incompatible and
>>   fix it on source.
>
> Normally we don't have "latest machine" but only "previous"?  Checking
> "previous" would be enough, right?  E.g. currently we're at 8.1 dev window,
> so we check against 8.0 with whatever new thing coming.

$ qemu-8.0.0 -M pc-q35-8.0.0 > dump-8.0.0-q35

We generate that dump-8.0-q35 on the tree.
We will change that once that we release 8.1, until then that is latests.

This qemu upstream is whatever is in HEAD

$ qemu-upstream -M pc-q35-8.0.0 > dump-8.0.0-upstream-q35

diff dump-8.0.0-q35 dump-8.0.0-upstream-q35

And it should be empty.

$ qemu-upstream -M pc-q35-8.1.0 > dump-8.1.0-upstream-q35

diff dump-8.0.0-q35 dump-8.1.0-upstream-q35

Each time that we find a difference, we know that we have to create a
property for that to make pc-q35-8.0.0 working.  We save that "hunk"
somehow.

Where I have put diff, we can have something more intelligent that is
able to compare json output and have into account that differences that
we already know that exist.

>> I will start with x86_64.  And once that we have it running, the other
>> architectures that care about version compatibility can add to it.
>> 
>> What do you think?
>
> It sounds a good idea to have some way to check compat bits in unit tests.
> I'm just not sure whether it's easy to integrate to make check: the
> comparision requires building two qemu binaries; one normally with an old
> tag that I built manually.

No. Single binary.  For the old binary we just have saved its output on
the tree.

> For the static checker itself, it normally also needs some intervention
> from human, e.g., it doesn't understand things like field_exists() so it
> can report "warnings" only which can be false negative even with ARRAY
> issue fixed.

This is why I mean that I want the "diff" to be a bit more intelligent
and "record" the things that we tell them that are correct.

> But ideally e.g. in a CI env we can always keep an old version qemu binary
> ready for each arch to be tested, then verify forward+backward migration
> with that old machine type with whatever patch applied on top.  One trick
> here is we need to make sure the test cmdline contains the device/anything
> that got changed by the patch.  It may not always be the case.

I will start with the default machine devices.
Once the mechanism is done, we can wonder with more configurations.

I will start small and then go from there.

Later, Juan.


