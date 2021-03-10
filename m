Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134B3343E2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:57:03 +0100 (CET)
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK28s-0006Oj-H2
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK1OW-0003nn-OQ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK1OU-0006lg-UT
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+Csusx3xhJjfy/PEm2ywep6oc4tfFjzlLIYF6gayF8=;
 b=bZECQ4JyJrI98k57VIbFjPi6ZdkeXl9/1SNC/Zy8nNyA8HC6K2icYtBxGE0/cHfFcUGcDv
 16Z7Pog546e6VSNhdOayR9idR31v0WlJLeSvP6gcYLk1KhdqE98GJUNmQVTUuBWLKb+Ae3
 gfP/6C6Vdq+PvCBdaYPC9DY+6rEa+2Y=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-JI6BFskIN4q2H1Ksn2oVgw-1; Wed, 10 Mar 2021 11:09:04 -0500
X-MC-Unique: JI6BFskIN4q2H1Ksn2oVgw-1
Received: by mail-vs1-f70.google.com with SMTP id 2so5099275vsq.20
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+Csusx3xhJjfy/PEm2ywep6oc4tfFjzlLIYF6gayF8=;
 b=nZodXa97JI87ZWip8ga7gE3UCIIbewwA5xGhFp3/g0W5HGVaMGyQuvsspZeHBmjxnG
 /EZezD/QlUoXQnNXjGGOqYDoVwK/wTxnEpt2tQc7gH3PrDCBillrPl64zTGy9XdvvW0x
 U7sSu8/yDG6jMnVR1cp9oFAqU4djC6O8pRbhStSnc3kGL8hgNEUuxdKzOA9QUG++PEDQ
 I/kchLetVJAv/WptfDzjszWeFDOZpcfKdldTsgS7UOCD8BlxXCX+DfPJmZKJXfG2lm31
 iu2G/+moQRPe/G6k/pOKAKkXry+LK9rH3e2nvd7UbPrDLFzihiptblhWbzv9NUW85mho
 tS8Q==
X-Gm-Message-State: AOAM532V9LQu57poLS6VhFgxvMlbg+OoW5XyY6IO8Ym6h4K6kvPljDJ+
 ALhVhPoOI50suhsK1ms3e/kVE5P1o4ZuOdEwqA9urtXv8TPO8icwmINSkfEebc2ELEbRbf50P/9
 bfIO2p0sCJMhDZGuXipnAfrJpVEVtjUE=
X-Received: by 2002:a67:8702:: with SMTP id j2mr1812126vsd.50.1615392543982;
 Wed, 10 Mar 2021 08:09:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFfJpN9T8p8HC4ZSNkAyhFU1WShvZIUBEOLjAd82onPu2Hb84xX4BVY+VhLP6aG3i55JWTVcqvv9Ha7di8Dn8=
X-Received: by 2002:a67:8702:: with SMTP id j2mr1812085vsd.50.1615392543680;
 Wed, 10 Mar 2021 08:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20210310094936.1318317-1-thuth@redhat.com>
 <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
 <7c6e59fd-913f-31ff-ae33-49186f9ddde1@redhat.com>
In-Reply-To: <7c6e59fd-913f-31ff-ae33-49186f9ddde1@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 13:08:37 -0300
Message-ID: <CAKJDGDbd6sZ0swGju-rCv9Lf-ADU3Tg1zeDxO-nfgpVxoONb-Q@mail.gmail.com>
Subject: Re: [PATCH] tests: Fix broken "make check-speed"
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 1:04 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 10/03/21 16:49, Willian Rampazzo wrote:
> > On Wed, Mar 10, 2021 at 6:51 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> When running "make check-speed", currently nothing happens. This is
> >> because the redirection to "bench-speed" is not working as expected
> >> (since the bench-speed rule in the generated Makefile.mtest filters
> >> for "bench-speed" and "bench" in the MAKECMDGOALS variable).
> >> Fix it by calling "make bench-speed" instead of using a dependency.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>   tests/Makefile.include | 5 +++--
> >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > Tested-by: Willian Rampazzo <willianr@redhat.com>
> >
>
> I don't object to the patch, but if no one has noticed in 6 months
> perhaps the target can go (replaced by "make bench"/"make bench-speed").
>

I was also thinking about it. If the target was not working and no one
complained, maybe remove it is just fine, so, +1 here for
removing/renaming.

> Paolo
>


