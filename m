Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082F68C91C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:08:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9dn-0004Gv-AC; Mon, 06 Feb 2023 17:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pP9dj-0004FT-Bi
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pP9dg-000767-Ta
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675721222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5wMtsgV6vyewMyBjGJHU1FDbq5GY5+mhF+tVthRl5k=;
 b=G+f0/T3nnF9dQEB+VcnpmhIlmOS7dpwYrAhjYjTlK779Rf5v0oi+daM2m2mEMnz/Wj98pN
 06ThpDqQ6cpPiGxzaNmfxM9KxA4kLxWCacEKhOtzVB6wnAlAMKt9aviwOTPazWmz2wKfMU
 ePp3lXrL+00NKUnPqzUZ06V5Uk0dKHc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-02hLDy8yOVG8_xyPcCbfCQ-1; Mon, 06 Feb 2023 17:07:01 -0500
X-MC-Unique: 02hLDy8yOVG8_xyPcCbfCQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 c16-20020ac85190000000b003b841d1118aso7416810qtn.17
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5wMtsgV6vyewMyBjGJHU1FDbq5GY5+mhF+tVthRl5k=;
 b=2Q2Wxfbpmwn1agAdzV89eP7IAFzbC/Wv2c8klxncjxikTiNh6Oyai68nRjay9NYVvx
 pe5OAHiYEo8GoLW59pdL5NzJpaMcjbtnJcrOp9D7jy7NJ/jEltPxU9iWaYYI4CTu9U4n
 BRXXDuFa+zixYgeAeQXUREd1QG6e9bLO/jJ8gWXJe4SRg+PE2tt1ekPtvKHkymo+Xku7
 Z8zw1xlnq3jYUwtAEKgDi2Fd2HLM/kMyU7Lc67jySyJuTyURkGnJlXO4Q8jaogvbE9s2
 ulKFYpxdB/9e2ZVBvDk5BHhZ2kZye/10ItXaigdYOQDJhMCerqYWhbKeEiVzmkjNQZDO
 cKJw==
X-Gm-Message-State: AO0yUKXwIGjr3Olda58wEOEEYedX4BfsjG7If+zLVuHMDrq6DfhFYleg
 zzZrKF04NM+gfs1LQ/P/yGH0l4+Q6Hv4N/i+TFCkD31kI9Q7cPmifcLqZ2ACt3aZd8Rvf77NK7U
 Tq80OKn3HJJTm4is=
X-Received: by 2002:a05:622a:1d5:b0:3b6:309e:dfe1 with SMTP id
 t21-20020a05622a01d500b003b6309edfe1mr2036231qtw.3.1675721220685; 
 Mon, 06 Feb 2023 14:07:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9dloMO6m+1gAEOOFlDMVgukZCgOzOPp0UAA+sFZwNBNZWx6WkPRtyKcL4fbagckBwYioNfuw==
X-Received: by 2002:a05:622a:1d5:b0:3b6:309e:dfe1 with SMTP id
 t21-20020a05622a01d500b003b6309edfe1mr2036183qtw.3.1675721220427; 
 Mon, 06 Feb 2023 14:07:00 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 b1-20020ac87fc1000000b003b9ba2cf068sm8193936qtk.56.2023.02.06.14.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 14:06:59 -0800 (PST)
Date: Mon, 6 Feb 2023 17:06:57 -0500
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org
Subject: Re: [PULL 00/26] Next patches
Message-ID: <Y+F6AT6l5yVAYmTy@x1n>
References: <20230202160640.2300-1-quintela@redhat.com>
 <CAFEAcA-dvzgGWxoXYkD-1Vv8k4oajPQVU+nypX5pKSN=iS+BqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-dvzgGWxoXYkD-1Vv8k4oajPQVU+nypX5pKSN=iS+BqQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Feb 04, 2023 at 10:19:34AM +0000, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 16:07, Juan Quintela <quintela@redhat.com> wrote:
> >
> > The following changes since commit deabea6e88f7c4c3c12a36ee30051c6209561165:
> >
> >   Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-02-02 10:10:07 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request
> >
> > for you to fetch changes up to 5ee6d3d1eeccd85aa2a835e82b8d9e1b4f7441e1:
> >
> >   migration: check magic value for deciding the mapping of channels (2023-02-02 17:04:16 +0100)
> >
> > ----------------------------------------------------------------
> > Migration PULL request, new try
> 
> Fails to build on anything that isn't Linux:
> 
> In file included from ../migration/postcopy-ram.c:40:
> /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/include/qemu/userfaultfd.h:18:10:
> fatal error: 'linux/userfaultfd.h' file not found

Oops, my fault.

Juan, please feel free to drop patch "util/userfaultfd: Add uffd_open()".
I'll respin with the whole set.

-- 
Peter Xu


