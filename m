Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85524E232
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 22:39:25 +0200 (CEST)
Received: from localhost ([::1]:58986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9Doq-0007LY-3y
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 16:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k9Do9-0006vA-Vt
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 16:38:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29455
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k9Do8-00084k-GF
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 16:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598042319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQ29nr2NZ7yl0z015XEpEwWqMI43y6nayUcevSiKBeQ=;
 b=XhGAbSfc3rjAsnQv/73WEDGyjJy2Clu6WjRYFh0RK66NvWZR7qIlbxYxLb5s0dCQ9cTCY2
 ZetOULE22cdPSd7Dquv79x2h+svBzuO6cHnqNfhhIZ0O87qK7QF++uOJdJiQoWVwU/98K9
 OMGv2j8HQh/cjhjfLegHC3emHjAUzNY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-NHjFuWGXPmqt9tzRrBfDnw-1; Fri, 21 Aug 2020 16:38:37 -0400
X-MC-Unique: NHjFuWGXPmqt9tzRrBfDnw-1
Received: by mail-wr1-f72.google.com with SMTP id w1so949199wro.4
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 13:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AhIVYJBExen2c5ujrsCnkkiYv9wMvu6E9WvF2PpjLt4=;
 b=uE8aYivOtidjYn1ObJqDJXg3FJSPjXxTdh7N9ZkVqmKJdbJ58y5FXCR70kI+QkSL+M
 SfQE7Pt2E/xKk9DW0hgOaqBRUn6AFtZol2xDM1Ge3IRvxqEnmuM7JMvYG0HcrgQlXCzY
 ObJrsO+a10dkbw1vGZJdqkV7dMf6e0MP4zBa5dzsDwGXGHXJAwNq9nsEuw0KnOl6s8Gt
 Lp9XhU3JK1AACT0pDipk++QbIJalbfGy1olGxi/w0G5TUULiZJsuXkJ2YAYgMi7m5LLC
 Ei1Myl2OyhQI3ctLb4/iC5jkwLzLMBBZ+GtOE/vjBpK5eg1mlf8WscAD23CZPAXCZdbo
 0C9w==
X-Gm-Message-State: AOAM531sCtVuId0HHDESE5cmrKpYNPvP+RFndlLkiKhcZP2Q7Vo35ofB
 xK9Iwa4fQ1JO8tCLJdK4kTYw2lDAlB+BjDuijFK8OPb9g2Da9dwDsnwIWW3Q/M4Jz9UIRepcz42
 O5bEPlh8MLaVPNtw=
X-Received: by 2002:a5d:66c7:: with SMTP id k7mr4101788wrw.290.1598042316457; 
 Fri, 21 Aug 2020 13:38:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBbUs7y1mMgDOvZC7tIQEQ3r5oV/sDKDTBne2c6iGY5zsGQIRpWApCAGlQCgEuPU5oYi66/g==
X-Received: by 2002:a5d:66c7:: with SMTP id k7mr4101776wrw.290.1598042316246; 
 Fri, 21 Aug 2020 13:38:36 -0700 (PDT)
Received: from steredhat (host-79-33-191-244.retail.telecomitalia.it.
 [79.33.191.244])
 by smtp.gmail.com with ESMTPSA id t3sm6451777wrx.5.2020.08.21.13.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 13:38:35 -0700 (PDT)
Date: Fri, 21 Aug 2020 22:38:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/docker: add liburing-devel to the Fedora image
Message-ID: <20200821203833.h2lcbu763kzu42p4@steredhat>
References: <20200821165458.100591-1-sgarzare@redhat.com>
 <e5fdb193-952a-2bed-a1c7-4eb8bb0bbff7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e5fdb193-952a-2bed-a1c7-4eb8bb0bbff7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 07:55:02PM +0200, Philippe Mathieu-Daudé wrote:
> On 8/21/20 6:54 PM, Stefano Garzarella wrote:
> > Install liburing-devel dependencies to get better coverage on
> > io-uring stuff (block/io_uring.c and util/fdmon-io_uring.c).
> > 
> > Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  tests/docker/dockerfiles/fedora.docker | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> > index 70b6186bd3..9650d324fa 100644
> > --- a/tests/docker/dockerfiles/fedora.docker
> > +++ b/tests/docker/dockerfiles/fedora.docker
> > @@ -38,6 +38,7 @@ ENV PACKAGES \
> >      libssh-devel \
> >      libubsan \
> >      libudev-devel \
> > +    liburing-devel \
> >      libusbx-devel \
> >      libxml2-devel \
> >      libzstd-devel \
> > 
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> ../util/fdmon-io_uring.c:106:17: error: address argument to atomic
> operation must be a pointer to _Atomic type ('unsigned int *' invalid)
>     old_flags = atomic_fetch_or(&node->flags, FDMON_IO_URING_PENDING |
> flags);
>                 ^               ~~~~~~~~~~~~
> /usr/lib64/clang/10.0.0/include/stdatomic.h:138:42: note: expanded from
> macro 'atomic_fetch_or'
> #define atomic_fetch_or(object, operand) __c11_atomic_fetch_or(object,
> operand, __ATOMIC_SEQ_CST)
>                                          ^                     ~~~~~~
> ../util/fdmon-io_uring.c:130:14: error: address argument to atomic
> operation must be a pointer to _Atomic type ('unsigned int *' invalid)
>     *flags = atomic_fetch_and(&node->flags, ~(FDMON_IO_URING_PENDING |
>              ^                ~~~~~~~~~~~~

mmm, I'll try to fix this issue!

> 
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Thanks,
Stefano


