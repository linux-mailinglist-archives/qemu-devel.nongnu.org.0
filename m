Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F154A249
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 00:54:54 +0200 (CEST)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0sxR-0000aL-0r
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 18:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o0sw7-0008An-GF
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 18:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o0sw4-0006zd-TI
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 18:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655160807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ddIMlyW8LEUpKNNPaNURWftKhQA/RpODV4ROCtDiAqM=;
 b=GUhsACnecmquWzfPr+XTudH4H1YRO53BR0Ce3+9Ikn8nemz5p4gc/bigxZt75inMGeQUb/
 CLD3LWBZYCdVCxBDNwMJV7w712xNGgcAO0CAmyTLagDSEgiWkX1jtBRwAp+5zzaoYYZfxr
 hIHmkYs9N1o/zuwEr0p0PUZ3x2pExFY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-67-exixpM2WuA4vclq6hwQ-1; Mon, 13 Jun 2022 18:53:26 -0400
X-MC-Unique: 67-exixpM2WuA4vclq6hwQ-1
Received: by mail-il1-f200.google.com with SMTP id
 e4-20020a056e020b2400b002d5509de6f3so5500215ilu.6
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 15:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ddIMlyW8LEUpKNNPaNURWftKhQA/RpODV4ROCtDiAqM=;
 b=frsESBR6U6Xs3PDE1cAQojWz/X0VDNEULuF7CPxfaxBKOGOcLyEOlIiJzd+tzLCqTr
 3Unm0txnRFW803UiHPdNxSU21Oha3mjXWD5YPDonsl9iQP5ftMB4rBA0qGqYTjKOxrxj
 8VIDxht39d6VNXVkBOOoIsut9m2QdDwqTSyFFSBGS+upBuyBkXwkz16tWL6+Qq08BzBC
 O4BJW3N5Dgx45zTuvqw0Qz76dwUdebN9h7ZT/WNsMT4VyttmNbO5VcO2UO3pCfT/kOHo
 cZujcXa8Pl+YipyOr6Zj7Okc4/lHAdJhJ8n/yV4RjuUmzXVR2XTPIIFConPHiYSvfHd/
 aRCA==
X-Gm-Message-State: AOAM533aOAXpapCNzx9TyV7V3wHmvLBckSRIHWU1ni/20oNOYsdWfRNf
 Yrs9gFWimLQ2DqOLgeQdECsUYD6fBpJF4ZeQ3hoTyMs9NcGmvpDgkWdseo8KK+nsVnxBcB/6x/W
 sVCuW0rHdITOh/5Q=
X-Received: by 2002:a05:6638:13cc:b0:331:7c5e:6124 with SMTP id
 i12-20020a05663813cc00b003317c5e6124mr1111683jaj.83.1655160805977; 
 Mon, 13 Jun 2022 15:53:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXstBVeyTEoLZeSVRBTSTeTpx0afdiyVVS3ZhFnYgsbvwu5KQMrxffG/QQCJQFTC68DSK3bA==
X-Received: by 2002:a05:6638:13cc:b0:331:7c5e:6124 with SMTP id
 i12-20020a05663813cc00b003317c5e6124mr1111659jaj.83.1655160805745; 
 Mon, 13 Jun 2022 15:53:25 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a05663802a500b0032e2d3cc08csm4076240jaq.132.2022.06.13.15.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 15:53:25 -0700 (PDT)
Date: Mon, 13 Jun 2022 18:53:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
Message-ID: <Yqe/4mhJ7DkaJTED@xz-m1.local>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <YpdwcHu7I8dGDimt@xz-m1.local>
 <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
 <YqCK1UBLjXzo+nm7@xz-m1.local>
 <CAJ6HWG4UwU+em4pgk+uBLNZRx1jBThzYWXXp-nZg3EVLjuHVHQ@mail.gmail.com>
 <YqEFMXnMb8FlhvRe@xz-m1.local>
 <CAJ6HWG6gC1zb71MjTT1HbVnBHpNSbFN1hrRDoW2UBjvM3QhXXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG6gC1zb71MjTT1HbVnBHpNSbFN1hrRDoW2UBjvM3QhXXw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Mon, Jun 13, 2022 at 05:58:44PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter,
> 
> On Wed, Jun 8, 2022 at 5:23 PM Peter Xu <peterx@redhat.com> wrote:
> [...]
> > > In a previous iteration of the patchset, it was made clear that it's
> > > desirable to detect when the kernel falls back to copying mechanism,
> > > so the user of 'QIOChannelSocket' can switch to copying and avoid the
> > > overhead. This was done by the return value of flush(), which is 1 if
> > > that occurs.
> >
> > Two questions..
> >
> >   1) When that happens, will MSG_ERRQUEUE keeps working just like zerocopy
> >      is functional?
> 
> I am not sure about what exactly you meant by 'like zerocopy is
> funcional', but the
> idea is that reading from MSG_ERRQUEUE should return a msg for each sendmsg
> syscall with MSG_ZEROCOPY that previously happened. This does not depend on
> the outcome (like falling back to the copying mechanism).
> btw, most of those messages may be batched to reduce overhead.
> 
> At some point, zero-copy may fail, and fall back to copying, so in
> those messages
> an error code SO_EE_CODE_ZEROCOPY_COPIED can be seen. Having only
> those messages in a flush will trigger the returning of 1 from the
> flush function.

Ah I think I missed the "reset ret==0 when !SO_EE_CODE_ZEROCOPY_COPIED"
path..  Sorry.

> 
> >
> >      If the answer is yes, I don't see how ret=1 will ever be
> >      returned.. because we'll also go into the same loop in
> >      qio_channel_socket_flush() anyway.
> 
> 
> We set ret to 1 at function entry and then for each message in the MSG_ERRQUEUE,
> we test if it has error code different than SO_EE_CODE_ZEROCOPY_COPIED.
> If it ever have a different error code, we set ret=0.
> 
> So, in our previous example, if we have a net device not supporting
> the 'Scatter-Gather'
> feature (NETIF_F_SG), every error message will be
> SO_EE_CODE_ZEROCOPY_COPIED, and it will return 1.
> 
> 
> >
> >      If the answer is no, then since we'll have non-zero zero_copy_queued,
> >      will the loop in qio_channel_socket_flush() go into a dead one?  How
> >      could it return?
> 
> No, because it will go through all packets sent with MSG_ZEROCOPY, including the
> ones that fell back to copying, so the counter should be fine. If any
> code disables
> zero-copy, it will both stop sending stuff wil MSG_ZEROCOPY and flushing, so it
> should be fine.
> 
> >
> >   2) Even if we have the correct ret=1 returned when that happens, which
> >      caller is detecting that ret==1 and warn the admin?
> >
> 
> No caller is using that right now.
> It's supposed to be a QIOChannel interface feature, and any user/implementation
> could use that information to warn if zero-copy is not being used, fall back to
> copying directly (to avoid overhead of testing zero-copy) or even use
> it to cancel the
> sending if wanted.
> 
> It was a suggestion of Daniel on top of [PATCH v5 1/6] IIRC.

OK the detection makes sense, thanks for the details.

Then now I'm wondering whether we should have warned the admin already if
zero-copy send is not fully enabled in live migration.  Should we add a
error_report_once() somewhere for the ret==1 already?  After all the user
specify zero_copy_send=true explicitly.  Did I miss something again?

Thanks,

-- 
Peter Xu


