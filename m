Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1942523E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:47:19 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRrp-0008ML-GJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYRom-0007T6-3A
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYRok-0003SH-2c
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633607045;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=t9wvEeF22l91oceSwbv3KrCRPbeLQ2Lzi+joq8DAdzk=;
 b=UjZgrpSB7+Pu78rkXDRqiIKzFoUQt22f1oCnm2WyPJc5f9r1qxo4OAfAIxJGqfWjaruVzU
 JoaV9U7pt+Pe03RiYpUvtx9OJvBPSfa6vTqUrjWn/uw95uD/6+qWUfyTXVG14UjDLQ2DZd
 Lwpwf4FMCEIKrwwsYh8VU495CcnlFno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-DVpsEzdRPVqyW1qdVoK-dg-1; Thu, 07 Oct 2021 07:44:03 -0400
X-MC-Unique: DVpsEzdRPVqyW1qdVoK-dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB6A1015DDF;
 Thu,  7 Oct 2021 11:44:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64AA660BF1;
 Thu,  7 Oct 2021 11:43:45 +0000 (UTC)
Date: Thu, 7 Oct 2021 12:43:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 04/25] include/block/block: split header into I/O
 and global state API
Message-ID: <YV7db8LeJfp0v775@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-5-eesposit@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 10:31:54AM -0400, Emanuele Giuseppe Esposito wrote:
> Similarly to the previous patch, split block.h
> in block-io.h and block-global-state.h
> 
> block-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.

This is nice from a code organization POV, but it doesn't do all
that much from a code reviewer / author POV as I doubt anyone
will remember which header file the respective APIs/structures/
constants are in, without having to look it up each time.

It would make life easier if we had distinct namning conventions
for APIs/struct/contsants in the respective headers.

eg instead of  "bdrv_" have "bdrv_state_" and "bdrv_io_" as
the two naming conventions for -global-state.h and -io.h
respectively, nad only use the bare 'bdrv_' for -common.h

Yes, this would be major code churn, but I think it'd make
the code clearer to understand which will be a win over the
long term.

NB, I'm not suggesting doing a rename as part of this patch
though. Any rename would have to be separate, and likely
split over many patches to make it manageable.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


