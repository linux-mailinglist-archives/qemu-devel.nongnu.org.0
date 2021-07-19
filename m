Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9373CD502
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:44:12 +0200 (CEST)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Sd1-0000UX-4I
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5Sc0-0008Eo-5y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5Sbw-0005TW-Pe
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626698582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+w7gBTTb8MtGQbAkpqZHdeVLocFBME+hkCLmL9kmCk=;
 b=WcagQi5VZXn8W7tfN72FXPGIx0UrWv5WmBfnXGGRNszWrqCc6OsuTkHtzFQ4VNv4UbwTnb
 vux6lPXSD2yP29ZokkL2BqxnHA00eYjguCfWE9TMGBQkaE9YmrisT5r6pleELtIEP8/O7/
 R4otc130X6om4C4rYgVk0DJQR/ivr10=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-pPclxiN7MPybuvTebV7xEA-1; Mon, 19 Jul 2021 08:43:01 -0400
X-MC-Unique: pPclxiN7MPybuvTebV7xEA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r18-20020adfce920000b029013bbfb19640so8682959wrn.17
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c+w7gBTTb8MtGQbAkpqZHdeVLocFBME+hkCLmL9kmCk=;
 b=J5sMQaGP9FWgW/VO9FxXjIXOlzHVXfvtvSf+w4n5g7Vu5BIlen2DhkZknIqGpAU7J8
 bOEBW/y/hhNbniWw6ObG0OLu3SJ0n5iJNsR0/hGWB4CwMykW3PDKnrf3brfhuUe/0IBo
 Cp6DAxhcmko9W2V9GNlDcbU5anxSzZ9mmyDFg16JfoZpJB3ofFe3CUfqX/QA9FikjlKF
 06QbopHf8vXsqDBEbB1Q0E9ymWq3BD7upMdUitRXW/8rcfcmkNrhPAW3QlLmIW0oGEMf
 VbAq9Bk8xwlwmEkVKZUzC5fIufL60huL1WEEXY4AS/twwMnQdA0RyRRvIUkUoKX8FfNE
 jqqw==
X-Gm-Message-State: AOAM532nem9rTlAcbCTRHY5HtbpAYpmaSNBqq2/uEOQhllwcq+l48Iko
 APGz2qHNPVtZnZxK0KE0PIYbjmMjyB45uko/3L7zAe4iKffYE0yF1Cwn4EQdKarL+6QmEKmShF6
 GsOiIIbSsWgdmPRY=
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr32448086wmp.122.1626698580232; 
 Mon, 19 Jul 2021 05:43:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDM9NboP0CiIz4i6Ugd+ZoyUnN8cdz6VkMFmY2ZzWFSQVyKKJFseQZ5rT1cSTaeS4YS1XBwA==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr32448066wmp.122.1626698580002; 
 Mon, 19 Jul 2021 05:43:00 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id u12sm20756610wrt.50.2021.07.19.05.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 05:42:59 -0700 (PDT)
Date: Mon, 19 Jul 2021 13:42:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: -only-migrate and the two different uses of migration blockers
 (was: spapr_events: Sure we may ignore migrate_add_blocker() failure?)
Message-ID: <YPVzURLf5qqwtYsZ@work-vm>
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
 <87sg0amuuz.fsf_-_@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87sg0amuuz.fsf_-_@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> We appear to use migration blockers in two ways:
> 
> (1) Prevent migration for an indefinite time, typically due to use of
> some feature that isn't compatible with migration.
> 
> (2) Delay migration for a short time.
> 
> Option -only-migrate is designed for (1).  It interferes with (2).
> 
> Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
> adds a migration blocker on realize, and deletes it on unrealize.  With
> -only-migrate, device realize fails.  Works as designed.
> 
> Example for (2): spapr_mce_req_event() makes an effort to prevent
> migration degrate the reporting of FWNMIs.  It adds a migration blocker
> when it receives one, and deletes it when it's done handling it.  This
> is a best effort; if migration is already in progress by the time FWNMI
> is received, we simply carry on, and that's okay.  However, option
> -only-migrate sabotages the best effort entirely.

That's interesting; it's the first time I've heard of anyone using it as
'best effort'.  I've always regarded blockers as blocking.

> While this isn't exactly terrible, it may be a weakness in our thinking
> and our infrastructure.  I'm bringing it up so the people in charge are
> aware :)

Thanks.

It almost feels like they need a way to temporarily hold off
'completion' of migratio - i.e. the phase where we stop the CPU and
write the device data;  mind you you'd also probably want it to stop
cold-migrates/snapshots?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


