Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E126D086C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:37:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phtO7-0006WV-FM; Thu, 30 Mar 2023 10:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1phtO0-0006WF-Ac
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1phtNy-0004W3-9I
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680186976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJr7Ds6VIR/HZLpqJpGop87bZ3AxaRuD9q3+I0WpRjM=;
 b=Rp8v/h6zxBkTe94HNG/DYNXut5PRgxIrlFbzMzTTrRt5zKE7NMkgpFqnfmaJHg3pHXGV1U
 yIBwAtdWUOqFrvnFGvt87xW4KSZSLtQRJzvWSXhJfFfrBG+XgHZqG4TUkixTWFsTlve+f3
 Jpq82UiacOPUrb6aNRwmkpTaof4PXd8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-J4YkBB6wOT6zF1j3G-qP_A-1; Thu, 30 Mar 2023 10:36:14 -0400
X-MC-Unique: J4YkBB6wOT6zF1j3G-qP_A-1
Received: by mail-qk1-f199.google.com with SMTP id
 c80-20020ae9ed53000000b007468c560e1bso9034077qkg.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186974; x=1682778974;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BJr7Ds6VIR/HZLpqJpGop87bZ3AxaRuD9q3+I0WpRjM=;
 b=To5Zy7UiBaj9fQAlXBhKglnuQ68EbkLsdEyPeWZmO4JJ/ZdnV2UaIe/ChV0DWzwyWq
 Ez0OeQvX2CEkjGKgUI/DaBAPRNVeOFCcELUwFi5oM/wQZGIVYazvGBHvKCpSRjvbtK/l
 4ppnGSA7tuPKyyMxghNxSG9inyhdTlN+b0qKi4bQQjGl4QE/CzHu2P30dgMOiYnDn4dF
 gOfZJI6Um5h/7GfUkJCSP5MdgxIdVavQR5Kzvw4mFVGFU7gSvW5DTMuo8LpMfFtNMCn1
 52J31Bbag+tlTCQdEFxfAG8G3VsLsJHFpUcrTZv/zI67VjIHtpz4XokF8PGHSl3Y9Hbl
 +HFQ==
X-Gm-Message-State: AAQBX9cNiD99rSPwqRCxK3sM4aq32KI3IWoJd15ZzsaSfrdL9U2c1NPx
 59YtsuuLfUFlkY7ljwuiWzubTRDXKnJUctU0UTu21ex8ANEIAX/OCF/J/r6khYdpgjGk/zW8TaB
 9qI5aIXxyExMXxws=
X-Received: by 2002:ac8:5712:0:b0:3e3:8f8c:b92f with SMTP id
 18-20020ac85712000000b003e38f8cb92fmr3525401qtw.5.1680186973783; 
 Thu, 30 Mar 2023 07:36:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350YmB5+ZolD/hR9ZFLaNLIlLedtEsttEsE1dIUNwBG3rE5M8nrMT6b9VVsQ8ojTzH7HJJteL8Q==
X-Received: by 2002:ac8:5712:0:b0:3e3:8f8c:b92f with SMTP id
 18-20020ac85712000000b003e38f8cb92fmr3525371qtw.5.1680186973522; 
 Thu, 30 Mar 2023 07:36:13 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 137-20020a37058f000000b0074688f55beesm14114434qkf.108.2023.03.30.07.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:36:12 -0700 (PDT)
Date: Thu, 30 Mar 2023 10:36:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
Message-ID: <ZCWeWy3Yluda1VbF@x1n>
References: <20230327161518.2385074-1-leobras@redhat.com>
 <ZCWanp5hITk4HImX@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCWanp5hITk4HImX@redhat.com>
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

On Thu, Mar 30, 2023 at 03:20:14PM +0100, Daniel P. Berrangé wrote:
> On Mon, Mar 27, 2023 at 01:15:18PM -0300, Leonardo Bras wrote:
> > Since the introduction of multifd, it's possible to perform a multifd
> > migration and finish it using postcopy.
> > 
> > A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
> > a successful use of this migration scenario, and now it should be
> > working on most cases.
> > 
> > But since there is not enough testing/support nor any reported users for
> > this scenario, we should disable this combination before it may cause any
> > problems for users.
> 
> Clearly we don't have enough testing, but multifd+postcopy looks
> like a clearly useful scenario that we should be supporting.
> 
> Every post-copy starts with at least one pre-copy iteration, and
> using multifd for that will be important for big VMs where single
> threaded pre-copy is going to be CPU bound. The greater amount we
> can transfer in the pre-copy phase, the less page faults / latency
> spikes postcopy is going to see.

If we're using 1-round precopy + postcopy approach, the amount of memory
will be the same which is the guest mem size.

Multifd will make the round shorter so more chance of getting less
re-dirtied pages during the iteration, but that effect is limited.  E.g.:

  - For a very idle guest, finishing 1st round in 1min or 3min may not
    bring a large difference because most of the pages will be constant
    anyway, or

  - For a very busy guest, probably similar amount of pages will be dirtied
    no matter in 1min / 3min.  Multifd will bring a benefit here, but
    busier the guest smaller the effect.

> 
> In terms of migration usage, my personal recommendation to mgmt
> apps would be that they should always enable the post-copy feature
> when starting a migration. Even if they expect to try to get it to
> complete using exclusively pre-copy in the common case, its useful
> to have post-copy capability flag enabled, as a get out of jail
> free card. ie if migration ends up getting stuck in non-convergance,
> or they have a sudden need to urgently complete the migration it is
> good to be able to flip to post-copy mode.

I fully agree.

It should not need to be enabled only if not capable, e.g., the dest host
may not have privilege to initiate the userfaultfd (since QEMU postcopy
requires kernel fault traps, so it's very likely).

The recent introduction of /dev/userfaultfd should make it even less likely
to happen, it'll still require (1) admin adjusted permissions of the
devnode and qemu ownership so qemu is in the white list, and (2) kernel
needs to be new enough to have /dev/userfaultfd.

> 
> I'd suggest that we instead add a multifd+postcopy test case to
> migration-test.c and tackle any bugs it exposes. By blocking it
> unconditionally we ensure no one will exercise it to expose any
> further bugs.

That's doable.  But then we'd better also figure out how to identify the
below two use cases of both features enabled:

  a. Enable multifd in precopy only, then switch to postcopy (currently
  mostly working but buggy; I think Juan can provide more information here,
  at least we need to rework multifd flush when switching, and test and
  test over to make sure there's nothing else missing).

  b. Enable multifd in both precopy and postcopy phase (currently
  definitely not supported)

So that mgmt app will be aware whether multifd will be enabled in postcopy
or not.  Currently we can't identify it.

I assume we can say by default "mutlifd+postcopy" means a) above, but we
need to document it, and when b) is wanted and implemented someday, we'll
need some other flag/cap for it.

-- 
Peter Xu


