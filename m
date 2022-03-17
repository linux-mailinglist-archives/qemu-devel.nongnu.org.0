Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1134DCCE2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:49:36 +0100 (CET)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUuFi-00060b-V0
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:49:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUuCS-0004m1-C1
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:46:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUuCM-00005j-Lk
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647539166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UGyHFeIO2EMqguvBy0oK0zssPtc4XlI5po61pvrX3YE=;
 b=GsUJPLf5/Qw5UydYkka0RIbDaiAMJ4U5XAA4inEkwaiigJWk2jAlTc6Vt15B6IykBj1aMF
 fDLpEdA8LX5yiBxTZbrctyBqQ49wv/mWGdUNyFELA53sf9iH1TXBvvSWyx3BsHrPIt28Sk
 dnK8YUYnXpHzF/Ki4pJ0Cl55sJ7iIx8=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-LmbJjOn7NCG4FwyrZIpYow-1; Thu, 17 Mar 2022 13:46:03 -0400
X-MC-Unique: LmbJjOn7NCG4FwyrZIpYow-1
Received: by mail-ua1-f69.google.com with SMTP id
 j16-20020ab01850000000b003517f6bb1easo2729405uag.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UGyHFeIO2EMqguvBy0oK0zssPtc4XlI5po61pvrX3YE=;
 b=WMnlQIGU2f261m1b5OoSz5MtE/feRnMXkl4fz8vyorQ8rv17T/499nlXM1SGcteXrk
 lBnfZmQVHUiu/agh1aXQduhnMRHAi/vD15O79zqthxAnQ5fsvVBt6El4UPccsrJEu1nx
 6eMuLjymtcmIGvc9ztUEzHpflNSQor434+6a7ERnTGLl5gblekmD0bw0ayldZpdWA3rr
 qM/xtBvgt09tbig03Vb3WZPSOVUJMKbJdAqYYklu2OQsE5009+lpm6ZFwCuDo2AE9Vih
 XOMorYMSmJluWrD4MOHDZrHCxEciLr+sAUXJk6NR3Yq9cMvYgwVuXu8AMfQx0l6z4/KU
 7h+g==
X-Gm-Message-State: AOAM530yx3YdcIh/ENOndSgNGhWA95OdNiaw4uyoptXE8JLf8rDsExBc
 8UalgNmVadVHR6WkApUjDEsCT7ssAuC2i/dm9lsagBIBYfhhJKxAL2Ta9Ym3BmRsKT+VzNLfMzo
 E/AxKlTVX6t4i6CanpD/OGd4v84wMZXA=
X-Received: by 2002:a05:6122:218b:b0:337:7e8d:9df7 with SMTP id
 j11-20020a056122218b00b003377e8d9df7mr2410322vkd.26.1647539162501; 
 Thu, 17 Mar 2022 10:46:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx00/LwO8WGl7sKe/pZmK6KvPMZeQLel43aY7v/MlS5lr1hO3JxJsbpYK0/u+W0A2+h4/Mrvbl4SKfvo2vJMZ8=
X-Received: by 2002:a05:6122:218b:b0:337:7e8d:9df7 with SMTP id
 j11-20020a056122218b00b003377e8d9df7mr2410316vkd.26.1647539162242; Thu, 17
 Mar 2022 10:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-15-jsnow@redhat.com>
 <38910bd4-7f8f-bdf4-29a0-f76f01d75ade@redhat.com>
 <CAFn=p-ab92NRL+E7RytaUo_1S1UB0_eq1EJLjfTGs2Sn_dqSuQ@mail.gmail.com>
In-Reply-To: <CAFn=p-ab92NRL+E7RytaUo_1S1UB0_eq1EJLjfTGs2Sn_dqSuQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 13:45:51 -0400
Message-ID: <CAFn=p-YXugb5Qz4VH8OvDMOtqjU=hS54oSo=hjRyn-i02v=dww@mail.gmail.com>
Subject: Re: [PATCH 14/14] iotests: make img_info_log() call qemu_img_log()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 1:00 PM John Snow <jsnow@redhat.com> wrote:
>
> On Thu, Mar 17, 2022 at 11:39 AM Hanna Reitz <hreitz@redhat.com> wrote:
> >
> > On 09.03.22 04:54, John Snow wrote:
> > > Add configurable filters to qemu_img_log(), and re-write img_info_log()
> > > to call into qemu_img_log() with a custom filter instead.
> > >
> > > After this patch, every last call to qemu_img() is now guaranteed to
> > > either have its return code checked for zero, OR have its output
> > > actually visibly logged somewhere.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   tests/qemu-iotests/iotests.py | 13 +++++++++----
> > >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> >  From my POV, this is a regression because before this patch (not this
> > series, though, admittedly), `img_info_log()` would throw an exception
> > on error, and with patch 12 being as it is, it will revert to its
> > pre-series behavior of not throwing an exception.  I prefer exceptions

Oh, actually... patch #12 does this:

-    output = qemu_img_pipe(*args)
+    output = qemu_img(*args, check=False).stdout

so I never actually toggled error checking on for this function at
all. This isn't a regression.

At a glance, img_info_log() calls fail as a matter of course in 242
and 266 and ... hm, I can't quite test 207, it doesn't work for me,
even before this series.

I didn't test *all* qemu_img calls yet either, but ... I'm going to
gently suggest that "converting logged calls to qemu_img() to be
checked calls" is "for another series" material.

--js

> > to failed reference output diffs, because an exception tells me which
> > call failed.
>
> Hm, yeah. I just need to figure out if *all* of the qemu_img_log()
> calls are safe to enforce the return code of zero on... or how many
> need work if I change the default behavior. Let me see what I can do.
>
> I suppose it's maybe a bit late to try and squeak any of this in for
> freeze, so I can roll everything back up into one big series again and
> send a new revision.


