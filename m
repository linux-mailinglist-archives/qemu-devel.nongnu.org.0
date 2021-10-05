Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497F74224BD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:12:47 +0200 (CEST)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiNJ-0001ib-UW
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXiKR-0000KY-OC
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXiKO-0005yf-9o
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633432182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdu7jcWfynoVqeNkrrPUINou7x/RGAd/VGpDUJ+fUVk=;
 b=FuuH82J8aCHRDiuaAO7hrH3rOSRCgOYHvQg2GGkQb/P902DActhYm6rqkVna83V54HDNsQ
 TvxMVNPSGqqBavYRYUQxBuZP6p90tY+5kuBZb62OZ8pl1vvLSdHyDHpdJCmDIOFZ43kbK2
 Advm0SuyxF8LEhr6Y9ALKFS/7Dhh0hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-2CcXLkuINZirIdpoVtVdmg-1; Tue, 05 Oct 2021 07:09:40 -0400
X-MC-Unique: 2CcXLkuINZirIdpoVtVdmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9ED9801E72;
 Tue,  5 Oct 2021 11:09:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9072610013C1;
 Tue,  5 Oct 2021 11:09:26 +0000 (UTC)
Date: Tue, 5 Oct 2021 13:09:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH 06/11] qdev: Add Error parameter to qdev_set_id()
Message-ID: <YVwyZLoZhf73dlTb@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-7-kwolf@redhat.com>
 <7b9afc35-af95-ad21-6296-7e112ada9c87@virtuozzo.com>
 <90412958-721b-4ae8-0177-3ae6af8394af@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <90412958-721b-4ae8-0177-3ae6af8394af@greensocs.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 pkrempa@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.2021 um 12:33 hat Damien Hedde geschrieben:
> Hi Kevin,
> 
> I proposed a very similar patch in our rfc series because we needed some of
> the cleaning you do here.
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05679.html
> I've added a bit of doc for the function, feel free to take it if you want.

Thanks, I'm replacing my patch with yours for v2.

Kevin


