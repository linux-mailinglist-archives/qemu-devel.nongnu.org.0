Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A608442542F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:35:35 +0200 (CEST)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTYc-0001hU-Dg
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYTIM-00071a-1j
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYTII-0003P1-CJ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633612721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=It+UCJbNpqu1LmT4vmeZJUvoIrlWJ2AQrbACO0Z2i5I=;
 b=iC4FY9gxjUUK9tro4MxClVP6TCRyfg4VM4632lpzIwSxxjh/mz+CMrc2w9isnc3pQyQxM6
 xq1bT8mSfFbwmFqpewAs6c5yaou9/aR6xShBefr1t85xAr1I9yh3MemLZ2DSfM4rPfyTOl
 AAKv7oHK9MLIWgi2HWMqnMo6iKgPDkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-9iG3EJ5dO7a8u5rdxI_C3A-1; Thu, 07 Oct 2021 09:18:33 -0400
X-MC-Unique: 9iG3EJ5dO7a8u5rdxI_C3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E0D01054FA8;
 Thu,  7 Oct 2021 13:18:32 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A6A026573;
 Thu,  7 Oct 2021 13:18:31 +0000 (UTC)
Date: Thu, 7 Oct 2021 08:18:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v2 04/25] include/block/block: split header into I/O
 and global state API
Message-ID: <20211007131829.ty3scn2snpwpovah@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-5-eesposit@redhat.com>
 <YV6+8+NiBO8uG/GC@stefanha-x1.localdomain>
 <76bbb291-d9bf-ad5e-a4a7-93ee80c281ca@redhat.com>
 <b3e5840b-0508-ac20-5dbf-32c5c1a29b28@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b3e5840b-0508-ac20-5dbf-32c5c1a29b28@redhat.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 01:51:33PM +0200, Paolo Bonzini wrote:
> On 07/10/21 12:54, Emanuele Giuseppe Esposito wrote:
> > > 
> > > > +int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> > > > +                      int64_t bytes, int64_t *pnum, int64_t *map,
> > > > +                      BlockDriverState **file);
> > > 
> > > This function just called bdrv_block_status_above(), which is in the I/O
> > > API. I think it's safe to move this to the I/O API or else
> > > bdrv_block_status_above() shouldn't be there :).
> > > 
> > 
> > It *seems* that while bdrv_block_status_above() is an I/O, probably
> > running in some coroutine (from here its internal qemu_in_coroutine
> > check), bdrv_block_status might be called from the main loop (or
> > alternatively the function is never invoked in the tests, so the
> > assertion never triggered).
> > 
> > Maybe bdrv_block_status_above is one of the few functions that are both
> > I/O and Main loop? I put it in I/O as it can't have the assertion.
> 
> No, they are both I/O.  Callers of bdrv_block_status are hw/nvme and
> qemu-img.c; while the latter can be either (it does not have iothreads),
> hw/nvme is definitely I/O.

nbd/server.c also uses bdrv_block_status_above as part of its I/O path
to serve NBD_CMD_BLOCK_STATUS.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


