Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA6692181
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUuP-0008Oe-2s; Fri, 10 Feb 2023 10:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQUuL-0008ON-SW
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQUuK-0006zf-2k
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676041307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUDTRnOjRBxl9FSOdRSQiu1irjWNilsFRVZvVsOsr88=;
 b=U5YG96Dzn+R0ctu+NJISjBdV7el3hlmichZXWGaDjny4dlpOAEuT5hKuaM3HFxHQ53YWBh
 SNz7FjECjnIMxYAF0FTVXvgKl0jPTnty+dO9717dCUrK7i3p4ehh1lkGZOEKl9y93PrPDd
 5V/Lt7SSa0BKnze9HQPGTkuPWYAXmQs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-cbYhUFnWOJahbI0M4lraWA-1; Fri, 10 Feb 2023 10:01:45 -0500
X-MC-Unique: cbYhUFnWOJahbI0M4lraWA-1
Received: by mail-qk1-f197.google.com with SMTP id
 a6-20020a05620a102600b00729952b4c73so3390148qkk.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676041305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUDTRnOjRBxl9FSOdRSQiu1irjWNilsFRVZvVsOsr88=;
 b=uYy+81TRzY29XvhPARpxMokDfXc4Cvn9SPGbPvYSA4VV+Z21+Y0aFIWj8JnTrHzY5N
 icGUm88D2e8TgsZSIw+n2qqPgzxwfUpectZbQc00o5FLrh8zkBd75R+Lnj+AhTf3n6FW
 RCYJu1/2HPyFGCzm+auTSW9rQmK8lG/iN0xPzGQBcZDUFqh0Qzk3iY36LpHtw2DMZVyv
 POLdmRSU4SvwkPnH976iE39vzAgFkpUqRFpptxXI8154o126B95egUzvChl9yRzc2GqM
 MYNlaS9wAU4bC7UL61ZCDevO1ZmPLcoW0iRoFFHi/JhV5sZaMkPxewqfQek9gTIxYBrl
 nNig==
X-Gm-Message-State: AO0yUKWojwVuFPKa1HDYCtFuuaw02g3FwRrw6kykNO5Rr8rNMjRhix2V
 Jm8L61WxjGiChCUDlKfYU6oBjHRci8Dwja24ztP5IvZY4nMAKp3c7Hu/AhpMVFaFie625uJaD52
 Cr2o5bYJz6WfM2CY=
X-Received: by 2002:a05:622a:1744:b0:3b8:5dfe:c3dc with SMTP id
 l4-20020a05622a174400b003b85dfec3dcmr30248677qtk.3.1676041305053; 
 Fri, 10 Feb 2023 07:01:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZfZU+Aey8GeSU17UZHaTHT6LEqeJe0Ubrkihz3enwtJnfKas7YNoqmv+FL3FKLU+bc7Xl0g==
X-Received: by 2002:a05:622a:1744:b0:3b8:5dfe:c3dc with SMTP id
 l4-20020a05622a174400b003b85dfec3dcmr30248634qtk.3.1676041304745; 
 Fri, 10 Feb 2023 07:01:44 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 b20-20020ac86794000000b003b2957fb45bsm3520885qtp.8.2023.02.10.07.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 07:01:44 -0800 (PST)
Date: Fri, 10 Feb 2023 10:01:42 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Subject: Re: [PULL 01/30] migration: Fix migration crash when target psize
 larger than host
Message-ID: <Y+ZcVkhRr8rYU6Az@x1n>
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-2-quintela@redhat.com>
 <0dd85902-0071-a915-2655-8aff8d0074d1@msgid.tls.msk.ru>
 <87ilg9iutl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ilg9iutl.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Feb 10, 2023 at 01:11:34PM +0100, Juan Quintela wrote:
> Michael Tokarev <mjt@tls.msk.ru> wrote:
> > 07.02.2023 03:56, Juan Quintela wrote:
> >> From: Peter Xu <peterx@redhat.com>
> >> Commit d9e474ea56 overlooked the case where the target psize is even
> >> larger
> >> than the host psize.  One example is Alpha has 8K page size and migration
> >> will start to crash the source QEMU when running Alpha migration on x86.
> >> Fix it by detecting that case and set host start/end just to cover
> >> the
> >> single page to be migrated.
> >
> > FWIW, commit in question, which is d9e474ea56, has been applied after the
> > last released version to date, which is 7.2.0.  So I guess this change is
> > not applicable to -stable.
> 
> I think it should.
> 
> This is a bug that can happen when your host page is smaller than the
> guest size.
> 
> And has been that way for a long time.
> Once told that, people don't migrate alpha guests a lot, but it can also
> happens with funny combinations of large pages.
> 
> Peter Xu knows more about this.

Thanks, Juan.

I think Michael was correct that d9e474ea56 is only merged after our most
recent release (which is v7.2.0).  So it doesn't need to have stable copied
(aka, it doesn't need to be applied to any QEMU's stable tree).

Juan, could you help drop the "cc: stable" line if the pull is going to
have a new version?

Side note: I think in the case where we have wrongly have the cc:stable it
shouldn't hurt either, because when the stable tree tries to pick it up
it'll find it doesn't apply at all, then a downstream-only patch will be
needed, then we'll also figure all things out, just later.

Thanks,

-- 
Peter Xu


