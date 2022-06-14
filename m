Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBA54A776
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 05:17:19 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0x3O-0001XE-8O
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 23:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o0x1C-0008WH-ON
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 23:15:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o0x19-0001aa-E8
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 23:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655176498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vBRp170GG+3luQnzkOwwFsi63L+vR7qJpXLX/HenwXA=;
 b=ONqQseHc/cIz6y8PeSC3fp2cra542hHZH3pGhIPhqvBuNE+Rd1K/sj7aLUgwEwPUOYDp73
 lYKIXQswQ4TfFQMtT16bhfU34hGoDTR5kl0acOXk2ZpVFwdmZflALTKgJYmBBfEma9mtVq
 GrDv27C/Xg36vcC8kfXxoYuSsjcIsJg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-6oRYX4NrO_aEjiA9uP1FgQ-1; Mon, 13 Jun 2022 23:14:56 -0400
X-MC-Unique: 6oRYX4NrO_aEjiA9uP1FgQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 x8-20020a056402414800b0042d8498f50aso5220449eda.23
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 20:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBRp170GG+3luQnzkOwwFsi63L+vR7qJpXLX/HenwXA=;
 b=5hDhIieSn9L6I06FFR+4W78S3mAlWM6Ft1QshWstqnyL0WsAAt5Lk8D3XM3yMw4IpE
 QHd+1Qv7l1zaQbEKtpugvy+eNbb6R0TYGenrNfuHq3kq7klaoPdrXWUtwOwOKEv9ectp
 wn6od4hd8ocSbiz9zLHHgxNi/qqjx5AX6YEe3kSRwJtnt0HdwTQp7Eb8JDH8rs46TOJ9
 x1dJS5r0Dja3nC3OL4g779/2rdV9WGPGwXl02XtRc8PmXmLEYJCAN0neiF1pvLvKfAUv
 +8Tm3mCNuXxnUvNQY7WCHBiSREGvMFTnVycJ702+vnFoV/VjXmsXIUmQLRah1HCKIlX6
 xyig==
X-Gm-Message-State: AOAM530Wu4eyiZ8eu9k9MoAgoqEIfQmPpl6ve/0lRSYg6O5ADzeMNPlg
 exE2ncp/LKwhwJuixroFQSbXtWQZpwfWeTWzt1+vL3TJxc82SjTwYfTYPKm794hHNmj9+3mcKmX
 ahlq+PxN1o5qZs0CUcECrNl66PmBUl6A=
X-Received: by 2002:a17:907:1c91:b0:711:c834:754c with SMTP id
 nb17-20020a1709071c9100b00711c834754cmr2392558ejc.85.1655176495741; 
 Mon, 13 Jun 2022 20:14:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEYujGyu69ltM1VJ1DNB/XK/NJTsh5lKkn9S1jdL0SptKd5G7iqHW5leeh5IWRXnvJ6LEVYWzKsCdWD7L/crs=
X-Received: by 2002:a17:907:1c91:b0:711:c834:754c with SMTP id
 nb17-20020a1709071c9100b00711c834754cmr2392530ejc.85.1655176495461; Mon, 13
 Jun 2022 20:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <YpdwcHu7I8dGDimt@xz-m1.local>
 <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
 <YqCK1UBLjXzo+nm7@xz-m1.local>
 <CAJ6HWG4UwU+em4pgk+uBLNZRx1jBThzYWXXp-nZg3EVLjuHVHQ@mail.gmail.com>
 <YqEFMXnMb8FlhvRe@xz-m1.local>
 <CAJ6HWG6gC1zb71MjTT1HbVnBHpNSbFN1hrRDoW2UBjvM3QhXXw@mail.gmail.com>
 <Yqe/4mhJ7DkaJTED@xz-m1.local>
In-Reply-To: <Yqe/4mhJ7DkaJTED@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Tue, 14 Jun 2022 00:14:44 -0300
Message-ID: <CAJ6HWG5_qfYRu1gbYyamsDfAsbrrjmBG7rwL6cKXaEs3MQPD9Q@mail.gmail.com>
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Jun 13, 2022 at 7:53 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jun 13, 2022 at 05:58:44PM -0300, Leonardo Bras Soares Passos wrote:
> > Hello Peter,
> >
> > On Wed, Jun 8, 2022 at 5:23 PM Peter Xu <peterx@redhat.com> wrote:
> > [...]
> > > > In a previous iteration of the patchset, it was made clear that it's
> > > > desirable to detect when the kernel falls back to copying mechanism,
> > > > so the user of 'QIOChannelSocket' can switch to copying and avoid the
> > > > overhead. This was done by the return value of flush(), which is 1 if
> > > > that occurs.
> > >
> > > Two questions..
> > >
> > >   1) When that happens, will MSG_ERRQUEUE keeps working just like zerocopy
> > >      is functional?
> >
> > I am not sure about what exactly you meant by 'like zerocopy is
> > funcional', but the
> > idea is that reading from MSG_ERRQUEUE should return a msg for each sendmsg
> > syscall with MSG_ZEROCOPY that previously happened. This does not depend on
> > the outcome (like falling back to the copying mechanism).
> > btw, most of those messages may be batched to reduce overhead.
> >
> > At some point, zero-copy may fail, and fall back to copying, so in
> > those messages
> > an error code SO_EE_CODE_ZEROCOPY_COPIED can be seen. Having only
> > those messages in a flush will trigger the returning of 1 from the
> > flush function.
>
> Ah I think I missed the "reset ret==0 when !SO_EE_CODE_ZEROCOPY_COPIED"
> path..  Sorry.
>
> >
> > >
> > >      If the answer is yes, I don't see how ret=1 will ever be
> > >      returned.. because we'll also go into the same loop in
> > >      qio_channel_socket_flush() anyway.
> >
> >
> > We set ret to 1 at function entry and then for each message in the MSG_ERRQUEUE,
> > we test if it has error code different than SO_EE_CODE_ZEROCOPY_COPIED.
> > If it ever have a different error code, we set ret=0.
> >
> > So, in our previous example, if we have a net device not supporting
> > the 'Scatter-Gather'
> > feature (NETIF_F_SG), every error message will be
> > SO_EE_CODE_ZEROCOPY_COPIED, and it will return 1.
> >
> >
> > >
> > >      If the answer is no, then since we'll have non-zero zero_copy_queued,
> > >      will the loop in qio_channel_socket_flush() go into a dead one?  How
> > >      could it return?
> >
> > No, because it will go through all packets sent with MSG_ZEROCOPY, including the
> > ones that fell back to copying, so the counter should be fine. If any
> > code disables
> > zero-copy, it will both stop sending stuff wil MSG_ZEROCOPY and flushing, so it
> > should be fine.
> >
> > >
> > >   2) Even if we have the correct ret=1 returned when that happens, which
> > >      caller is detecting that ret==1 and warn the admin?
> > >
> >
> > No caller is using that right now.
> > It's supposed to be a QIOChannel interface feature, and any user/implementation
> > could use that information to warn if zero-copy is not being used, fall back to
> > copying directly (to avoid overhead of testing zero-copy) or even use
> > it to cancel the
> > sending if wanted.
> >
> > It was a suggestion of Daniel on top of [PATCH v5 1/6] IIRC.
>
> OK the detection makes sense, thanks for the details.
>
> Then now I'm wondering whether we should have warned the admin already if
> zero-copy send is not fully enabled in live migration.  Should we add a
> error_report_once() somewhere for the ret==1 already?  After all the user
> specify zero_copy_send=true explicitly.  Did I miss something again?
>

You are correct, I think warning the user is the valid thing to have here.
At the end of the first iteration, where the first flush happens,  I
think it's too late to
fail the migration, since a huge lot of the data has already been sent.

Best regards,
Leo


