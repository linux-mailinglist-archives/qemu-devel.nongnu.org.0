Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE1375A12
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:18:58 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leiaP-0003eq-GV
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leiNM-0005mN-FC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leiMx-0003Aw-Oy
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620324301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lp5JRsM8rj5SsoVynS7SniJLyycB4xfIUNTe+gqZQuI=;
 b=MFJiPasL7Q8Uj/yqyPlLyomTcupaZOijyAYL4Mhb8TaTlwXB8xiTlHt6x66qvP9MtZaaKX
 wKmvEHhAslVIUZsR+sZeJ96XyFT1ergdQcrgACmRxZHSGol/LCWtQ9znKVOCuQwpc5BCCk
 gxZGzbwVxhFdk5dNO+d7QzNko3x9UTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-kD8_ZCQgOlKLn6Azcfl39w-1; Thu, 06 May 2021 14:04:58 -0400
X-MC-Unique: kD8_ZCQgOlKLn6Azcfl39w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 635988015F7;
 Thu,  6 May 2021 18:04:57 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A2662BFF1;
 Thu,  6 May 2021 18:04:42 +0000 (UTC)
Date: Thu, 6 May 2021 19:04:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v5 00/10] numa/exec/migration: Fix resizing RAM blocks
 while migrating
Message-ID: <YJQvt4BLqyqna6MH@work-vm>
References: <20210429112708.12291-1-david@redhat.com>
 <20210506175740.upqfqneqyqurfb2g@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210506175740.upqfqneqyqurfb2g@habkost.net>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eduardo Habkost (ehabkost@redhat.com) wrote:
> On Thu, Apr 29, 2021 at 01:26:58PM +0200, David Hildenbrand wrote:
> > v4 has been floating around for a while. Let's see if we can find someone
> > to merge this; or at least give some more feedback ... all patches have
> > at least one RB.
> 
> Acked-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> David Gilbert: I assume this should go through your tree?

Yep, I'm going to cook a migration pull next week.

Dave

> -- 
> Eduardo
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


