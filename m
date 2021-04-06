Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F557355A2B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:18:43 +0200 (CEST)
Received: from localhost ([::1]:53736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpLe-0008TL-7z
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTpId-00073V-RH
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTpIK-0007wf-TW
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617729312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M7/HMXjKbi+UNbOOr1ak/5lYejf/Q+IKeGsEj/CcN0k=;
 b=JkHXIjiPqY5EN+4rAuduIV39p0EyPZDdiBjpM2JL+05612ZObDEiLzYR11Kon6UOBK/9s8
 WBV0Yn3Cztw73SuNV8roVQAYcj/E0gMNMsB8EpHQeCzsx/IrSD7WGPwHtZ23cz4gjsTRu1
 Cd79vsBNO7X31k5m9ItrccMdSmntrNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-Zei4WE3sPnSAYECrNkIsrQ-1; Tue, 06 Apr 2021 13:15:09 -0400
X-MC-Unique: Zei4WE3sPnSAYECrNkIsrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AFE3CC625;
 Tue,  6 Apr 2021 17:15:07 +0000 (UTC)
Received: from work-vm (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7711860C4A;
 Tue,  6 Apr 2021 17:15:01 +0000 (UTC)
Date: Tue, 6 Apr 2021 18:14:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v4 0/2] Some modification about ram_save_host_page()
Message-ID: <YGyXEhvSxW32uywG@work-vm>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
 <7e722b03-c6d4-4246-bcb6-d8393fa07a49@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7e722b03-c6d4-4246-bcb6-d8393fa07a49@huawei.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
> Kindly ping,
> 
> Hi David Alan Gilbert,
> Will this series be picked up soon, or is there any other work for me to do?

You don't need to do anything, but it did miss the cutoff for soft
freeze; since it's an optimisation not a fix; it's still on my list so
it'll go in just as soon as 6.1 opens up.

Dave

> Best Regards,
> Kunkun Jiang
> 
> On 2021/3/16 20:57, Kunkun Jiang wrote:
> > Hi all,
> > 
> > This series include patches as below:
> > Patch 1:
> > - reduce unnecessary rate limiting in ram_save_host_page()
> > 
> > Patch 2:
> > - optimized ram_save_host_page() by using migration_bitmap_find_dirty() to find
> > dirty pages
> > 
> > History:
> > 
> > v3 -> v4:
> > - Remove the modification to ram_save_host_page() comment [Peter Xu]
> > - Remove the renaming of tmppages
> > 
> > v2 -> v3:
> > - Reduce unnecessary rate limiting if nothing is sent in the current iteration [David Edmondson]
> > - Invert the body of the loop in ram_save_host_page() [David Edmondson]
> > 
> > v1 -> v2:
> > - Modify ram_save_host_page() comment [David Edmondson]
> > - Remove 'goto' [David Edmondson]
> > 
> > Kunkun Jiang (2):
> >    migration/ram: Reduce unnecessary rate limiting
> >    migration/ram: Optimize ram_save_host_page()
> > 
> >   migration/ram.c | 34 +++++++++++++++++++---------------
> >   1 file changed, 19 insertions(+), 15 deletions(-)
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


