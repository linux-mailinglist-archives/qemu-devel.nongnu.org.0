Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88342A13A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:35:52 +0200 (CEST)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maECN-0001Gh-LV
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maE4T-0004bU-2Y
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:27:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maE4R-0002qg-8p
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634030858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=377yCBR6iG/uRTZlvr2K9qUTikP9zY6a0sVRbqydcdU=;
 b=PE2KZsojGFvFEOTzEANoR7LBe3ES1eHOQJdxcl0gsjwkwqtqFXmtLZGt4Es8t5r2pCvTrM
 JD+ZCpz74Pl4Rwdk4fqrNxVb8BJxcY/t3AdmcBXOC9kOQTEinT4yxBb4aeR8YrQ5yheGvu
 qHuitAsWyuQoP+63c0lnh0gUB3FVaaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-g359PAj0PVuHk15n0UPCNw-1; Tue, 12 Oct 2021 05:27:35 -0400
X-MC-Unique: g359PAj0PVuHk15n0UPCNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F1C9CC622;
 Tue, 12 Oct 2021 09:27:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D84CF69C9E;
 Tue, 12 Oct 2021 09:27:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79061113865F; Tue, 12 Oct 2021 11:27:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
 <87r1eh4j0f.fsf@dusky.pond.sub.org>
 <87r1eguxgi.fsf@dusky.pond.sub.org>
 <91f2fb28-fd4d-f7ad-13d1-61c7ba16ae3c@proxmox.com>
 <87eea9wrcf.fsf@dusky.pond.sub.org>
 <871r67b0yr.fsf@dusky.pond.sub.org>
Date: Tue, 12 Oct 2021 11:27:26 +0200
In-Reply-To: <871r67b0yr.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 02 Sep 2021 14:45:16 +0200")
Message-ID: <87v922bnk1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan, any thoughts on this?

Markus Armbruster <armbru@redhat.com> writes:

> I've thought a bit more.
>
> A monitor can serve a series of clients.
>
> Back when all of the monitor ran in the main thread, we completely
> finished serving the current client before we started serving the next
> one (I think).  In other words, sessions did not overlap.
>
> Since we moved parts of the monitor to the monitor I/O thread (merge
> commit 4bdc24fa018), sessions can overlap, and this causes issues, as
> you demonstrated.
>
> Possible fixes:
>
> 1. Go back to "don't overlap" with suitable synchronization.
>
>    I'm afraid this won't cut it, because exec-oob would have wait in
>    line behind reconnect.
>
>    It currently waits for other reasons, but that feels fixable.  Going
>    back to "don't overlap" would make it unfixable.
>
> 2. Make the lingering session not affect / be affected by the new
>    session's state
>
>    This is what your patch tries.  Every access of session state needs
>    to be guarded like
>
>         if (conn_nr_before == qatomic_read(&mon->connection_nr)) {
>             access session state
>         } else {
>             ???
>         }
>
>    Issues:
>
>    * We have to find and guard all existing accesses.  That's work.
>
>    * We have to guard all future accesses.  More work, and easy to
>      forget, which makes this fix rather brittle.
>
>    * The fix is spread over many places.
>
>    * We may run into cases where the ??? part gets complicated.
>      Consider file descriptors.  The command in flight will have its
>      monitor_get_fd() fail after disconnect.  Probably okay, because it
>      can also fail for other reasons.  But we might run into cases where
>      the ??? part creates new failure modes for us to handle.
>
> 3. Per-session state
>
>    Move per-session state from monitor state into a separate object.
>
>    Use reference counts to keep this object alive until both threads are
>    done with the session.
>
>    Monitor I/O thread executes monitor core and the out-of-band
>    commands; its stops using the old session on disconnect, and starts
>    using the new session on connect.
>
>    Main thread executes in-band commands, and these use the session that
>    submitted them.
>
>    Do I make sense, or should I explain my idea in more detail?


