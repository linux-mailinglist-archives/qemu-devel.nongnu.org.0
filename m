Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27AE3DF082
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:39:42 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAva1-0001wP-Vj
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvXM-0007oZ-GS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvXK-00014e-OT
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l2wzNkx2nDT9NJ2WqA7BaPAs742Z6+EpGesiBZjcWFY=;
 b=YkNFZ7W7br9lOFHTvVO7AG8wwlKkRibpZ0zX3HmwBMMdk7C3F9L9KGRcSufI6PaAexy9qQ
 BlhDWFkqYrdPzUWifftfsEYsztDqu4noow0p5tJ9CAry1efA7gNRU/pUSU9BZ+bIvHw78R
 AA3GEaQ6jUc9tWQwB5iAfvcKBG6ACQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-qZhLSR2qNmuD2094IZ_BmQ-1; Tue, 03 Aug 2021 10:36:50 -0400
X-MC-Unique: qZhLSR2qNmuD2094IZ_BmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7553FC7403;
 Tue,  3 Aug 2021 14:36:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2B7010016F7;
 Tue,  3 Aug 2021 14:36:47 +0000 (UTC)
Date: Tue, 3 Aug 2021 16:36:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel
Message-ID: <YQlUfi3aql6naWMi@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210726144613.954844-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
> Hi,
> 
> v1 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00705.html
> 
> Changes in v2:
> - Added patch 2 (as suggested by Vladimir)
> - Patch 4 (ex. 3): Rebase conflicts because of patch 2
> - Patch 5 (ex. 4):
>   - Rebase conflicts because of patch 2
>   - Do not use job_cancel_requested() to determine how a soft-cancelled
>     job should be completed: A soft-cancelled job should end with
>     COMPLETED, not CANCELLED, and so job_is_cancelled() is the
>     appropriate condition there.

Patches 1-4, preferably with the unrelated hunk split out from 3:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


