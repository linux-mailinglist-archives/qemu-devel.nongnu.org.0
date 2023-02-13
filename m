Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AF6952FD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 22:26:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRgKI-00044T-R0; Mon, 13 Feb 2023 16:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRgKF-0003ui-Dx
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRgKC-0004gr-3x
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676323523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B5l5mXUBLjCuA2UxIkB2LG3H7rLYvWZupjlYKPi16KQ=;
 b=WgfB7qMuVJ2E9FTXh5Uj3YuWqO41Lbx2MYiSAshUngrbMGX+lLaORU8+P744W2+Lsp8qpu
 qx1+/+6sKExfUM14iSzGS/3aDthLaGb8/lqLqfDSTUb5/PtyjilZNNgUgrzOW0E7Mh88kh
 yHMgD4Ciwl3skzSHknS3+zDqvEESv84=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-r73ORCorNiisO2sLj5jR4Q-1; Mon, 13 Feb 2023 16:25:22 -0500
X-MC-Unique: r73ORCorNiisO2sLj5jR4Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 c16-20020ac85190000000b003b841d1118aso8204900qtn.17
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 13:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5l5mXUBLjCuA2UxIkB2LG3H7rLYvWZupjlYKPi16KQ=;
 b=KU6JjA7n6aI9a3Lz7JCq1OXx0oyayyzfPd+t5Ouxdf+Y75L84lC+vm9VJ4GH1tsgOm
 4GoPZhEJ8l6xNeC6s2Zfq/el99B+uwmHlXJfV7yEPR0mfyiQrKakDK0XUpT1XJKjY/8L
 +nZnRwuezgNoN24PNhMyTIOUa/RlwX0yashU8u1F/m8djdm6P/e+gIKL4BGhy4e7NEjV
 55nCs8fZu6bwUEVXPGXwUjiUHM9jg9pMEFv7vp865YHt5n+OcJYp0S0hD//nbxhwDS2A
 MU/2LpkzdFgpaZF0plFYoOQjnfRtBV/O/NWR09vJ22GjCsa5EoNK3PiK8ZtrnuqrnB3F
 pliQ==
X-Gm-Message-State: AO0yUKUOPi+kf1EsP7jGpdp5NAaynyTDz6tkc/PaJew3vW7KaEAQpifg
 3+IB/dwiJvmY4in3thjqS1E3TjIAdsa9KP1mWVMJpnMVgxh3pKLkyFLf8inHMmqC5PhVn4gQSR3
 IJMoZsz9r5S1GAiNJG567
X-Received: by 2002:ac8:5fd2:0:b0:3b8:6d5a:3457 with SMTP id
 k18-20020ac85fd2000000b003b86d5a3457mr53076660qta.6.1676323521118; 
 Mon, 13 Feb 2023 13:25:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9V7cpwlyyGINRYz1jqRM8BHeasch17gNe6CH0ZOzST0XEpF2p26ESY5whCXg2y32xULQPUdg==
X-Received: by 2002:ac8:5fd2:0:b0:3b8:6d5a:3457 with SMTP id
 k18-20020ac85fd2000000b003b86d5a3457mr53076623qta.6.1676323520782; 
 Mon, 13 Feb 2023 13:25:20 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 i185-20020a3786c2000000b006fa4ac86bfbsm10422211qkd.55.2023.02.13.13.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 13:25:19 -0800 (PST)
Date: Mon, 13 Feb 2023 16:25:18 -0500
From: Peter Xu <peterx@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, philmd@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Message-ID: <Y+qqvqW/K8yJWrTm@x1n>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com>
 <Y+pM+H1PvTUUHrhx@x1n>
 <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
 <Y+piDukOkeg+xs9G@x1n>
 <0d85fc1d-4c97-5874-d49c-03ac3c265e2f@eik.bme.hu>
 <Y+pwnar8b17Mu0u4@x1n>
 <d3ebfc88-8b03-cfb7-bc4f-9952521b3ba8@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d3ebfc88-8b03-cfb7-bc4f-9952521b3ba8@eik.bme.hu>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Mon, Feb 13, 2023 at 07:34:55PM +0100, BALATON Zoltan wrote:
> On Mon, 13 Feb 2023, Peter Xu wrote:
> > On Mon, Feb 13, 2023 at 05:34:04PM +0100, BALATON Zoltan wrote:
> > > On Mon, 13 Feb 2023, Peter Xu wrote:
> > > > On Mon, Feb 13, 2023 at 03:47:42PM +0100, BALATON Zoltan wrote:
> > > > > On Mon, 13 Feb 2023, Peter Xu wrote:
> > > > > > On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
> > > > > > > On 07/02/2023 17.33, BALATON Zoltan wrote:
> > > > > > > > On Tue, 31 Jan 2023, BALATON Zoltan wrote:
> > > > > > > > > On Thu, 19 Jan 2023, BALATON Zoltan wrote:
> > > > > > > > > > Currently -d guest_errors enables logging of different invalid actions
> > > > > > > > > > by the guest such as misusing hardware, accessing missing features or
> > > > > > > > > > invalid memory areas. The memory access logging can be quite verbose
> > > > > > > > > > which obscures the other messages enabled by this debug switch so
> > > > > > > > > > separate it by adding a new -d memaccess option to make it possible to
> > > > > > > > > > control it independently of other guest error logs.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > > > > > > > 
> > > > > > > > > Ping? Could somebody review and pick it up please?
> > > > > > > > 
> > > > > > > > Ping?
> > > > > > > 
> > > > > > > Patch makes sense to me and looks fine, so:
> > > > > > > 
> > > > > > > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > > > > > > 
> > > > > > > ... I think this should go via one of the "Memory API" maintainers branches?
> > > > > > > Paolo? Peter? David?
> > > > > > 
> > > > > > Paolo normally does the pull, I assume that'll still be the case.  The
> > > > > > patch looks good to me if Phil's comment will be addressed on merging with
> > > > > > the old mask, which makes sense to me:
> > > > > 
> > > > > Keeping the old mask kind of defies the purpose. I've tried to explain that
> > > > > in the commit message but now that two of you did not get it maybe that
> > > > > message needs to be clarified instead?
> > > > 
> > > > I think it's clear enough.  My fault to not read carefully into the
> > > > message, sorry.
> > > > 
> > > > However, could you explain why a memory_region_access_valid() failure
> > > > shouldn't belong to LOG_GUEST_ERROR?
> > > > 
> > > > commit e54eba1986f6c4bac2951e7f90a849cd842e25e4
> > > > Author: Peter Maydell <peter.maydell@linaro.org>
> > > > Date:   Thu Oct 18 14:11:35 2012 +0100
> > > > 
> > > >    qemu-log: Add new log category for guest bugs
> > > > 
> > > >    Add a new category for device models to log guest behaviour
> > > >    which is likely to be a guest bug of some kind (accessing
> > > >    nonexistent registers, reading 32 bit wide registers with
> > > >    a byte access, etc). Making this its own log category allows
> > > >    those who care (mostly guest OS authors) to see the complaints
> > > >    without bothering most users.
> > > > 
> > > > Such an illegal memory access is definitely a suitable candidate of guest
> > > > misbehave to me.
> > > 
> > > Problem is that a lot of machines have unimplemented hardware that are valid
> > > on real machine but we don't model them so running guests which access these
> > > generate constant flow of unassigned memory access log which obscures the
> > > actual guest_errors when an modelled device is accessed in unexpected ways.
> > > For an example you can try booting MorphOS on mac99,via=pmu as described
> > > here: http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
> > > (or the pegasos2 command too). We could add dummy registers to silence these
> > > but I think it's better to either implement it correctly or leave it
> > > unimplemented so we don't hide errors by the dummy implementation.
> > > 
> > > > Not to mention Phil always have a good point that you may be violating
> > > > others using guest_error already so what they wanted to capture can
> > > > misterious going away without noticing, even if it may service your goal.
> > > > IOW it's a slight ABI and I think we ned justification to break it.
> > > 
> > > Probably this should be documented in changelog or do we need depracation
> > > for a debug option meant for developers mostly? I did not think so. Also I
> > > can't think of other way to solve this without changing what guest_erorrs do
> > > unless we change the name of that flag as well. Also not that when this was
> > > originally added it did not contain mem access logs as those were controlled
> > > by a define in memory.c until Philippe changed it and added them to
> > > guest_errors. So in a way I want the previous functionality back.
> > 
> > I see, thanks.
> > 
> > Indeed it's only a debug option, so I don't know whether the abi needs the
> > attention here.
> > 
> > I quickly looked at all the masks and afaict this is really a special and
> > very useful one that if I'm a cloud provider I can run some script trying
> > to capture those violations using this bit to identify suspecious guests.
> > 
> > So I think it would still be great to not break it if possible, IMHO.
> > 
> > Since currently I don't see an immediate limitation of having qemu log mask
> > being a single bit for each of the entry, one way to satisfy your need (and
> > also keep the old behavior, iiuc), is to make guest_errors a sugar syntax
> > to cover 2 bits.  It shouldn't be complicated at all, I assume:
> > 
> > +/* This covers the generic guest errors besides memory violations */
> > #define LOG_GUEST_ERROR    (1 << 11)
> > 
> > +/*
> > + * This covers the guest errors on memory violations; see LOG_GUEST_ERROR
> > + * for generic guest errors.
> > + */
> > +#define LOG_GUEST_ERROR_MEM      (1 << 21)
> > +#define LOG_GUEST_ERROR_ALL      (LOG_GUEST_ERROR | LOG_GUEST_ERROR_MEM)
> > 
> > -    { LOG_GUEST_ERROR, "guest_errors",
> > +    { LOG_GUEST_ERROR_ALL, "guest_errors",
> > 
> > Then somehow squashed with your changes.  It'll make "guest_errors" not
> > exactly matching the name of LOG_* but I think it may not be a big concern.
> 
> I'm not sure I understand this. So -d memaccess would give me the unassigned
> logs, that's fine and -d guest_errors are both LOG_GUEST_ERROR and memaccess
> like currently but what option would give me just the guest_Errors before
> mem access started to use this flag too? (I could not locate the commit that
> changed this but I remember previously the unassigned mem logs were enabled
> with a define in memory.c.) Do we need another -d option for just the guest
> errors then? What should that be called?

I forgot to add those two definitions into qemu_log_items just now.  It can
be defined as:

  - "guest_errors_common" for !mem errors
  - "guest_errors_mem" for mem errors
  - "guest_errors" for mem+!mem (compatible to the old code)

With the two lines added:

-    { LOG_GUEST_ERROR, "guest_errors",
+    { LOG_GUEST_ERROR_ALL, "guest_errors",
       "log when the guest OS does something invalid (eg accessing a\n"
       "non-existent register)" },
+    { LOG_GUEST_ERROR, "guest_errors_common", "..." },
+    { LOG_GUEST_ERROR_MEM, "guest_errors_mem", "..." },

I saw that Phil revoked his concern, I don't have a strong opinion
personally, assuming Phil knows better on that since he modified the memory
loggings before.  If all are happy with this, please proceed with either
way.

Thanks,

-- 
Peter Xu


