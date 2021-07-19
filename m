Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10A3CD2EE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:02:00 +0200 (CEST)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5R28-0008Ga-1M
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5R0g-0007Np-7F
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5R0c-0004tL-Kf
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626692425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=08BvBxLIaxiUR3omLleB2t7dyWsRVnCPJ6f9ZdEwXco=;
 b=IQUsw4dGXr3VDVMT847k2gXay3NBnkfERxfkHaehvF9Kkz5jIkgwykhCE4l50CHKV0mgsZ
 HGnBt6ImUdLt2W/wdcy1Ch/B3Kzyva/PJawS+mYk86iYph4n/GauoNm75qMbT3+MeLF4vH
 OwAh3S4NUXkFsX301oWsGQ5Ql2nbm4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-bqlHDojuPaqeNS1aaeX4PA-1; Mon, 19 Jul 2021 07:00:24 -0400
X-MC-Unique: bqlHDojuPaqeNS1aaeX4PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEC4380292B;
 Mon, 19 Jul 2021 11:00:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67CC11009962;
 Mon, 19 Jul 2021 11:00:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E49C111326B9; Mon, 19 Jul 2021 13:00:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: -only-migrate and the two different uses of migration blockers
 (was: spapr_events: Sure we may ignore migrate_add_blocker() failure?)
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
Date: Mon, 19 Jul 2021 13:00:20 +0200
In-Reply-To: <875yx6oabe.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Mon, 19 Jul 2021 12:41:09 +0200")
Message-ID: <87sg0amuuz.fsf_-_@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We appear to use migration blockers in two ways:

(1) Prevent migration for an indefinite time, typically due to use of
some feature that isn't compatible with migration.

(2) Delay migration for a short time.

Option -only-migrate is designed for (1).  It interferes with (2).

Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
adds a migration blocker on realize, and deletes it on unrealize.  With
-only-migrate, device realize fails.  Works as designed.

Example for (2): spapr_mce_req_event() makes an effort to prevent
migration degrate the reporting of FWNMIs.  It adds a migration blocker
when it receives one, and deletes it when it's done handling it.  This
is a best effort; if migration is already in progress by the time FWNMI
is received, we simply carry on, and that's okay.  However, option
-only-migrate sabotages the best effort entirely.

While this isn't exactly terrible, it may be a weakness in our thinking
and our infrastructure.  I'm bringing it up so the people in charge are
aware :)


