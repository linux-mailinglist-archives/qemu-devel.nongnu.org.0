Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034ED691C63
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:11:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQMD-0007Lc-10; Fri, 10 Feb 2023 05:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQLt-0007JW-Of
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQLr-0000q4-VG
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676023794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vm2NCGewBhTv8mNSBbpE7M3DaYqj50515t0oVSluZQ8=;
 b=dOvvoaIGHp5GY2fWox52JzDBPt3uika9kFI9sTHoUReol4fgFo4SGoKWY8kmJ8051j4Qjq
 mp1p72fOjS7FUDv9eIyjhXsmgV7Qohifw/STL5jnI4Jgc8isUio8ziNU9qK56EeXl0tjf6
 SBgj7FIb/SSXv1pDjM9RgqWKI5xUsuA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-uPMcDnLdOdy18CiaIslUOQ-1; Fri, 10 Feb 2023 05:09:51 -0500
X-MC-Unique: uPMcDnLdOdy18CiaIslUOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A6F180D0E0;
 Fri, 10 Feb 2023 10:09:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF9FB2166B2A;
 Fri, 10 Feb 2023 10:09:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACE5421E6A1F; Fri, 10 Feb 2023 11:09:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  eblake@redhat.com,  eduardo@habkost.net,
 berrange@redhat.com,  pbonzini@redhat.com,  marcel.apfelbaum@gmail.com,
 mst@redhat.com,  den-plotnikov@yandex-team.ru
Subject: Re: [PATCH v3 15/15] qapi: introduce query-hotplug command
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-16-vsementsov@yandex-team.ru>
Date: Fri, 10 Feb 2023 11:09:49 +0100
In-Reply-To: <20230209200808.869275-16-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 9 Feb 2023 23:08:08 +0300")
Message-ID: <87k00pvnki.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> Add a command that returns same information like HOTPLUG_STATE event.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Events and queries commonly come paired: management applications want
the event so they don't have to poll, and they want the query so they
can resynchronize after a disconnect.  Adding an event without a query
should make reviewers ask why no query.

You add the event in PATCH 13, and the query now.  I'd add them both in
a single patch.  Matter of taste.  If you keep them separate, please
have the first patch mention the second will follow shortly, to help
reviewers.


