Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464037A3BA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:32:15 +0200 (CEST)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOkQ-0001dj-0H
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOW5-00041I-TU
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOVy-0002g7-TT
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620724637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vpiMnPLYSVWHN3mXou1FFiyljf3PCOASSkAV98n2gzM=;
 b=BFTNqrJXjFvi/3hjAWs8X4RJaNTLbjUW2susi35Ke5IiOMySHM8CZSjGNDqqAJkCZvLhAc
 sO+MDc70DQTQDVUJ0xrD3Il8SNgXUHVWq1FOwh9N0wlIP+a2HYFNHJzqvGCrheMsLv+OVX
 AywfR9BuqWUbfHFJT1x9CGlMiDDE548=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-QaUJe9vGOzKBnjQlPNk_Zw-1; Tue, 11 May 2021 05:17:15 -0400
X-MC-Unique: QaUJe9vGOzKBnjQlPNk_Zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33000107ACE3;
 Tue, 11 May 2021 09:17:14 +0000 (UTC)
Received: from work-vm (ovpn-113-51.ams2.redhat.com [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A63C96267D;
 Tue, 11 May 2021 09:17:09 +0000 (UTC)
Date: Tue, 11 May 2021 10:17:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v4 0/2] Some modification about ram_save_host_page()
Message-ID: <YJpLk7oeBf6RLeqO@work-vm>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210316125716.1243-1-jiangkunkun@huawei.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> Hi all,

Queued; sorry for the delay

> This series include patches as below:
> Patch 1:
> - reduce unnecessary rate limiting in ram_save_host_page()
> 
> Patch 2:
> - optimized ram_save_host_page() by using migration_bitmap_find_dirty() to find
> dirty pages
> 
> History:
> 
> v3 -> v4:
> - Remove the modification to ram_save_host_page() comment [Peter Xu]
> - Remove the renaming of tmppages 
> 
> v2 -> v3:
> - Reduce unnecessary rate limiting if nothing is sent in the current iteration [David Edmondson]
> - Invert the body of the loop in ram_save_host_page() [David Edmondson]
> 
> v1 -> v2:
> - Modify ram_save_host_page() comment [David Edmondson]
> - Remove 'goto' [David Edmondson]
> 
> Kunkun Jiang (2):
>   migration/ram: Reduce unnecessary rate limiting
>   migration/ram: Optimize ram_save_host_page()
> 
>  migration/ram.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> -- 
> 2.23.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


