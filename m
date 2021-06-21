Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D249D3AF5B6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:56:46 +0200 (CEST)
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvP6D-0000mS-Uw
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lvP3w-00070x-TT
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lvP3v-0005s6-BT
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624301662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eie+weUkW1ESUf7Y95kweu4Dz5jMrJwOL8UIns2BAIU=;
 b=i1pvzlshmlw7NIQuo8PIKvxuBr97VdI3vTBxErQR3p8O4acRi/doCY4JbEHXvfCualOMiD
 Vk8awGMut+Ifav4CfRXnmDkv4UBpeY7qP85yZ3gnMl6PHZjtV1xw47/b+sEX9qMwJhXdyN
 lu2BZM+EX1TLy7N2grGy8YPKj+wiPbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-so-_ecjSM2q-K3k8IcYU9g-1; Mon, 21 Jun 2021 14:54:21 -0400
X-MC-Unique: so-_ecjSM2q-K3k8IcYU9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6331580430A;
 Mon, 21 Jun 2021 18:54:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-63.phx2.redhat.com [10.3.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC40460CA1;
 Mon, 21 Jun 2021 18:54:19 +0000 (UTC)
Date: Mon, 21 Jun 2021 13:54:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 5/6] block/nbd: Do not force-cap *pnum
Message-ID: <20210621185418.wv5yxce4tb37vb4d@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-6-mreitz@redhat.com>
 <5b106499-94fb-2af7-3766-bc337d3f21ae@virtuozzo.com>
 <4440bf3e-cf11-67eb-59de-887cb451a2e3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4440bf3e-cf11-67eb-59de-887cb451a2e3@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 11:50:02AM +0200, Max Reitz wrote:
> > I don't that this change is correct. In contrast with file-posix you
> > don't get extra information for free, you just make a larger request.
> > This means that server will have to do more work.
> 
> Oh, oops.  Seems I was blind in my rage to replace this MIN() pattern.
> 
> You’re absolutely right.  So this patch should be dropped.

I disagree - I think ths patch is still correct, as written, _because_
we use the REQ_ONE flag.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


