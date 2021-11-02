Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A644348F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:27:46 +0100 (CET)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxZZ-0004y4-Aa
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhxYL-00048k-NO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhxYH-0004X6-GO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635873984;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=atUMK1w8SF8C2uNJ9v5UNZ/vZlWrgwcRBLQ0G9h0oDo=;
 b=Xl04+HIgXxtDAcBKjFQeA9MWHK8AgND3JBBlbna7IyQtEmvyi7qO8/eric46WHCGMoNiaf
 0IZasirZ2f+Dmt5qNZcD9X3THD3yGFil92/1LQ0G9XKFk4Gi01HDKR2IDeiAzGqnNJl75d
 S2VQRzpI/5Vu2J9Aj3eKihipUmvsA3Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-M1f104NBPUuD6zuB2LdcGg-1; Tue, 02 Nov 2021 13:26:22 -0400
X-MC-Unique: M1f104NBPUuD6zuB2LdcGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m13-20020a05600c3b0d00b00332f48bef41so1122776wms.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=atUMK1w8SF8C2uNJ9v5UNZ/vZlWrgwcRBLQ0G9h0oDo=;
 b=2UE3sqrRAE6YVoW0wiV9peD45kJitJV+YFPok+LjRSpNnukxXgwvlKvxYMm1+KMhcO
 2uqjJHabRN4gexS5WGR3kCxJ1+E42TMgTPE2qtec7d4fP+6g7nN4R+yAfCgVSvnBoYK0
 U994Q0DMNFMjFwxhTsNR6Ccxin44kQxBRc72uvKWKkxDDJSwxBLK+r5HKu7m3lvZxlbP
 wA4LlwJVDz/xNjV2XuPFSW1fAdRCoxSP4Wv/9aNMHXhmpVYWiiYQT1e74wsY8U6Tgsly
 7gGjH8vyuR87VJRao3X1QAZ0csDDMWhlhkrM/P0EE4GCMtcZY2h00BCPkMktC2PSwBpR
 eQSQ==
X-Gm-Message-State: AOAM531ygb4j2EjyXnQ2QYtRXbSsIhi+aL7AObCKs1F8Bc9Vifdu3SEm
 mrlZ/fwwv7b3ytuPgLHfXWwuRI3mNDOqqBltPVb07lxEx9p1nyzA/tC+/QEXlpVCUWMSsM0cwjO
 J+uxnfiuTiWW6fSo=
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr8693553wmj.84.1635873981615; 
 Tue, 02 Nov 2021 10:26:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyY6JepLkCDuCe/rJjvqQzCniAs8MRsaWkP66BZgjrhrRfxKkPnAjrBgTgIcr/QTW9nQq2Gg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr8693524wmj.84.1635873981355; 
 Tue, 02 Nov 2021 10:26:21 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id g2sm17233937wrq.62.2021.11.02.10.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 10:26:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
In-Reply-To: <20211102130811-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 2 Nov 2021 13:08:25 -0400")
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
 <20211102110043-mutt-send-email-mst@kernel.org>
 <5139c0a8-6aa0-48df-f353-84a15ffc4dd1@redhat.com>
 <20211102130811-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 18:26:19 +0100
Message-ID: <87v91afozo.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Nov 02, 2021 at 06:06:51PM +0100, Laurent Vivier wrote:
>> On 02/11/2021 16:04, Michael S. Tsirkin wrote:
>> > On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
>> > > As the guest OS is paused, we will never receive the unplug event
>> > > from the kernel and the migration cannot continue.
>> > > 
>> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> > 
>> > Well ... what if user previously did
>> > 
>> > pause
>> > start migration
>> > unpause
>> > 
>> > we are breaking it now for no good reason.
>> > 
>> > Further, how about
>> > 
>> > start migration
>> > pause
>> > 
>> > are we going to break this too? by failing pause?
>> > 
>> > 
>> 
>> TL;DR: This patch only prevents to migrate a VFIO device as failover allows
>> to start a migration with a VFIO device plugged in.
>> 
>> Long Story:
>> 
>> * before this patch:
>> 
>> - pause and start migration and unpause-> fails if we unpause too late
>> because we migrate a VFIO device, works otherwise
>
>
> confused about this one. can you explain pls?

Pause the guest.
Start migration.

     if (migration_in_setup(s) && !should_be_hidden) {
        if (failover_unplug_primary(n, dev)) {
             vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
             qapi_event_send_unplug_primary(dev->id);

We send the unplug request, but the guest is paused.

             qatomic_set(&n->failover_primary_hidden, true);

callbacks, callbacks, callbacks.

        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
               qemu_savevm_state_guest_unplug_pending()) {
            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
        }

And we are not able to get out of that loop, because we never get to the
point where the guest send the unplug command.

So, the only other thing that I can think of is putting one timeout
there, but how much?  That is a good question.

Later, Juan.


