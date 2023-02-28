Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FB6A5994
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:58:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWzYK-0006VG-SM; Tue, 28 Feb 2023 07:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWzYI-0006Rh-Ja
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWzYH-0006Hz-1T
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677589072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrZz5vjK96PHjtkb2ZySVRltNS6f09nHElI6XrzIFTU=;
 b=h5uejDkY2Gcpmy5ZISGCa7iI6SF8DiJ6QLGoqXom4z4dpFDpxqgaOCH23HzqgVfv3PfkdM
 HbCUkVyDQshzN0clp+AcWIsqAx2YeBeroZmtJOgbsMPMLded7Jrr+LHgpVBsWRNiL77HBk
 d2kH+zQVL68K9ktUAV5473tPa10EGJo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-WYVgkg82NzuZkE832iC9BQ-1; Tue, 28 Feb 2023 07:57:48 -0500
X-MC-Unique: WYVgkg82NzuZkE832iC9BQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l5-20020a5d6745000000b002c91cb49949so1501344wrw.14
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677589068;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JrZz5vjK96PHjtkb2ZySVRltNS6f09nHElI6XrzIFTU=;
 b=uMEZerwoc51eGuiTmZA7LF5f3Kjkz/m5yRDkxoBii1bljEhZxc3bIeeUBdqSrl9xq+
 rWx/2QtLtayGuPvoCmnIltA1clM238gJo1C9Ya2980CN2GlZoLop7DHeub+seE1Gdbl0
 IU1bMWhv1pCzL2Jli+UM0aDY/u1Qn9rkDLblatDEVUwRtfgEMmbghBKEmFvH0Zd4jgug
 oBdtz46GACUlzbHzsnDhH+YioJ27noTgfqZpm+N/RjJFMYHOK9XGr1suYFxK09E19xlq
 CseH3HzdZ+fCMnS5/FSi3PJiX6+/uefxbZVeozp8USJWa3WtGJpW1uHRlphx6XChc+qz
 3dnQ==
X-Gm-Message-State: AO0yUKXYl/rCiUCFjGA8wW6aqd06vQdXEk7HFJERSh+VRmKoZy5AACvq
 xyOuqlItvAFzsbnPfCyZ+daZjhqzdEEEcoZ0kT1gU2KXYH2zQAMcv7ysvBhCZAEdedyfVyce9Nj
 1k/uPSuL7mlApFuM=
X-Received: by 2002:a05:600c:a694:b0:3dc:4b87:a570 with SMTP id
 ip20-20020a05600ca69400b003dc4b87a570mr2374698wmb.35.1677589067806; 
 Tue, 28 Feb 2023 04:57:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/9VJDQ/TLLEzufQsGB3OA/moncvvmwRPdZChJOLKQvjf5H/yo7A45AgLrp9mCMwGeniuLVIg==
X-Received: by 2002:a05:600c:a694:b0:3dc:4b87:a570 with SMTP id
 ip20-20020a05600ca69400b003dc4b87a570mr2374679wmb.35.1677589067485; 
 Tue, 28 Feb 2023 04:57:47 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b003e1f6e18c95sm16624936wmb.21.2023.02.28.04.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:57:46 -0800 (PST)
Date: Tue, 28 Feb 2023 07:57:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH] hw/timer/hpet: Fix expiration time overflow
Message-ID: <20230228075717-mutt-send-email-mst@kernel.org>
References: <20230130135001.76841-1-akihiko.odaki@daynix.com>
 <73c73f7a-f182-7892-162f-daa9f39be45a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73c73f7a-f182-7892-162f-daa9f39be45a@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 30, 2023 at 11:55:18PM +0100, Philippe Mathieu-Daudé wrote:
> On 30/1/23 14:50, Akihiko Odaki wrote:
> > The expiration time provided for timer_mod() can overflow if a
> > ridiculously large value is set to the comparator register. The
> > resulting value can represent a past time after rounded, forcing the
> > timer to fire immediately. If the timer is configured as periodic, it
> > will rearm the timer again, and form an endless loop.
> > 
> > Check if the expiration value will overflow, and if it will, stop the
> > timer instead of rearming the timer with the overflowed time.
> > 
> > This bug was found by Alexander Bulekov when fuzzing igb, a new
> > network device emulation:
> > https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> > 
> > The fixed test case is:
> > fuzz/crash_2d7036941dcda1ad4380bb8a9174ed0c949bcefd
> > 
> > Fixes: 16b29ae180 ("Add HPET emulation to qemu (Beth Kon)")
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> >   hw/timer/hpet.c | 19 +++++++++++++------
> >   1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> > index 9520471be2..3657d5f463 100644
> > --- a/hw/timer/hpet.c
> > +++ b/hw/timer/hpet.c
> > @@ -352,6 +352,16 @@ static const VMStateDescription vmstate_hpet = {
> >       }
> >   };
> > +static void arm(HPETTimer *t, uint64_t ticks)
> 
> Could we rename as hpet_[re]arm() similarly to this file's other helpers?

Akihiko Odaki, I expect there will be a new version of this?

> > +{
> > +    if (ticks < ns_to_ticks(INT64_MAX / 2)) {
> > +        timer_mod(t->qemu_timer,
> > +                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ticks_to_ns(ticks));
> > +    } else {
> > +        timer_del(t->qemu_timer);
> > +    }
> > +}


