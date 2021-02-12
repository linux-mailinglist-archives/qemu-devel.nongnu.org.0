Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05FA319B84
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 09:55:13 +0100 (CET)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUEL-0004np-0N
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 03:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAUCJ-0003VN-JJ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:53:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAUCI-0000I1-3B
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 03:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613119985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQDpo2KZ3yr5K/lyeeg/tFc8G36uGm0OKKDHmOwTPp0=;
 b=YnY7mbGXyBQv2nMGbj1+jb+KSR8p70/BN1XZvRJsHfPVmKp7X3OkfbsUKJD4LNvl6IUOUi
 Nn0U/N7l8ehDO4lmJP4TMFMXiv0g5PAp2drKDluaEX3EEVO7o8tLVqTZGYMwD9juQSKW4h
 xUVG/kgqBST3GquvARqbb0kP3gye6Xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-hl0a5w8KMRCLGfNsXFFFjA-1; Fri, 12 Feb 2021 03:53:03 -0500
X-MC-Unique: hl0a5w8KMRCLGfNsXFFFjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5206BC280;
 Fri, 12 Feb 2021 08:53:02 +0000 (UTC)
Received: from [10.36.114.178] (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC7AE100AE2B;
 Fri, 12 Feb 2021 08:52:53 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
Date: Fri, 12 Feb 2021 09:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210212030621.GF157159@xz-x1>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.02.21 04:06, Peter Xu wrote:
> On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
>> The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
> 
> I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
> I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the

Yes, some distros seem to enable init_on_alloc instead. Looking at the 
introducing commit 6471384af2a6 ("mm: security: introduce 
init_on_alloc=1 and init_on_free=1 boot options") there are security use 
cases and it might become important with memory tagging.

Note that in Linux, there was also the option to poison pages with 0, 
removed via f289041ed4cf ("mm, page_poison: remove 
CONFIG_PAGE_POISONING_ZERO"), available in some kernels that supported 
free page reporting.

It got removed and use cases got told to use init_on_free.

> impact should be small, I think.  I thought about it, but indeed I didn't see a
> good way to fix this if without fixing the zero page copy for live snapshot.

We should really document this (unexpected) behavior of snapshotting. 
Otherwise, the next feature comes around that relies on pages that were 
discarded to remain zeroed (I even have one in mind ;) ) and forgets to 
disable snapshots.

-- 
Thanks,

David / dhildenb


