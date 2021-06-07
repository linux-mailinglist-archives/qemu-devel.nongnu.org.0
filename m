Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6239DFF9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:07:13 +0200 (CEST)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGqO-0001Kr-2u
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqGp2-0000CQ-7q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqGp0-0004dy-88
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623078345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3DyOzf/C00VRIGFukQ/pHctD+X8KGYjy+nJItPolnR4=;
 b=B75uUBEpbfUFovPmmqzUyWFx7lWNVFBbo22B557jaIZcaRtjdWEgMtzBseaYn+AxcobxD4
 su9/UsNtLLsMQiYFzcRyGyQScjaMEA0eZmQUTsj9iS4dAsOMvQuA6+3z90JIA4pZ9nHAfi
 fmoqZrySSxApNDE8RUT+0XY9XhvPzOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-OcFm_R5OMyGme8DFAQgszw-1; Mon, 07 Jun 2021 11:05:43 -0400
X-MC-Unique: OcFm_R5OMyGme8DFAQgszw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25002801106;
 Mon,  7 Jun 2021 15:05:41 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A52C5D9C0;
 Mon,  7 Jun 2021 15:05:36 +0000 (UTC)
Date: Mon, 7 Jun 2021 10:05:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 09/11] block: make BlockLimits::max_pdiscard 64bit
Message-ID: <20210607150534.ualdyymx5vdaelge@redhat.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
 <20210505075001.45041-10-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210505075001.45041-10-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 10:49:59AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are going to support 64 bit discard requests. Now update the
> limit variable. It's absolutely safe. The variable is set in some
> drivers, and used in bdrv_co_pdiscard().
> 
> Update also max_pdiscard variable in bdrv_co_pdiscard(), so that
> bdrv_co_pdiscard() is now prepared to 64bit requests. The remaining

s/to/for/

> logic including num, offset and bytes variables is already
> supporting 64bit requests.
> 
> So the only thing that prevents 64 bit requests is limiting
> max_pdiscard variable to INT_MAX in bdrv_co_pdiscard().
> We'll drop this limitation after updating all block drivers.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h | 11 ++++++-----
>  block/io.c                |  3 ++-
>  2 files changed, 8 insertions(+), 6 deletions(-)
>

Deceptively simple for what it entails, but I agree that we are safe.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


