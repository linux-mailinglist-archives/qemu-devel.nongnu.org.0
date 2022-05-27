Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7521536409
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:26:57 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuavX-000182-AI
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nuas8-0006OC-Oa
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nuas5-0005dP-6R
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653661399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0kcu8PnbUEFVt+t6dQwjKXWNt7hFSxY/0OzR5NRQW0=;
 b=XRoNsSK0uv3xrKEbiaoVIEY3tq+79kw+6Unl5lST3mAGakeV2EHK5IzDyJ/5bRHgZSOyTD
 YRxF2YUwzmJ/OnfO+GCcs/TnIwAdYDGcFJrs3OJRaHtPFL+hjJlcye5eWiZ3A/dlRMfkmx
 J8wxDWLXV5zztQOTFhfV+9DO8aiOAuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-uPga2e9KMAm_BubPuQ4Xhw-1; Fri, 27 May 2022 10:23:15 -0400
X-MC-Unique: uPga2e9KMAm_BubPuQ4Xhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F157480088A;
 Fri, 27 May 2022 14:23:13 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61CDE40EC002;
 Fri, 27 May 2022 14:23:12 +0000 (UTC)
Date: Fri, 27 May 2022 09:23:10 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>
Subject: Re: [PATCH v3 06/10] block: Make 'bytes' param of
 bdrv_co_{pread,pwrite,preadv,pwritev}() an int64_t
Message-ID: <20220527142310.bhf4gbb4kc6rlxi2@redhat.com>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-7-afaria@redhat.com>
 <Yo9BkD5gNPSVwHgn@stefanha-x1.localdomain>
 <CAELaAXwmOZsJWsUW=aqSHBj_bh-c8mL22JvcX+4+CBKS4ZSsBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAELaAXwmOZsJWsUW=aqSHBj_bh-c8mL22JvcX+4+CBKS4ZSsBA@mail.gmail.com>
User-Agent: NeoMutt/20220429-77-e284d5
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 26, 2022 at 12:05:55PM +0100, Alberto Faria wrote:
> On Thu, May 26, 2022 at 10:00 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > Maybe let the existing bdrv_check_request32() call in bdrv_co_preadv()

in bdrv_co_preadv_part()

> > check this? It returns -EIO if bytes is too large.
> 
> I'd be okay with that. Does this warrant changing blk_co_pread() and
> blk_co_pwrite() as well?
> 
> Eric, what do you think?
>

Yes, reusing the existing function covers more cases with common error
messages.  All that matters is that we check for overflow before
trying to populate the qiov.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


