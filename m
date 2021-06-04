Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9862C39BFA3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:32:16 +0200 (CEST)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEcB-00058c-8N
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpEax-00042N-8Z
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpEar-0006P3-76
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622831451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O1kZdVethSQd8w4HypkAbNjfuR9lRl1iSiIggPwdb74=;
 b=h6WhLdhDBuSYR2PrFrlV2hF+oaIx6giOwXXwenNJWvQnS8RdjGm67Kv60I7D/CXsmX9wUD
 sJ26J7dNRLkb7wGIvTC94OWDxcgEFzuJdTFOikwT4yfFBU/uvP6WHZ1Y6GlNxNPMwojTIx
 S5MWJfbgIfpEr1M5zxjlhdwFAPIhkUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-ewtyJ_4hPnmzB5vP0m_LTw-1; Fri, 04 Jun 2021 14:30:48 -0400
X-MC-Unique: ewtyJ_4hPnmzB5vP0m_LTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D193D107ACF5;
 Fri,  4 Jun 2021 18:30:45 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B79AA60D06;
 Fri,  4 Jun 2021 18:30:32 +0000 (UTC)
Date: Fri, 4 Jun 2021 13:30:31 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 00/11] 64bit block-layer: part II
Message-ID: <20210604183031.kvwotfxtxmlkq32m@redhat.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, integration@gluster.org,
 Alberto Garcia <berto@igalia.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 qemu-block@nongnu.org, Jason Dillaman <dillaman@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, Liu Yuan <namei.unix@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 10:49:50AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v5: rebase on master, fix block comments style and over-80 line.
> 01: s/{}/()/ in subject, so that email not to be mangled.

Don't worry too much about that; if it happens again on v6, I can
manually fix the commit on my side or else pull the commit directly
from your repo (if you provide a link) rather than via 'git am'
through the mailing list.

> 
> part II aims to update block drivers to int64_t.
> 
> I remind that main aim of this update of the whole block-layer to 64bit
> is to implement 64bit write-zeroes NBD request.
> 
> Vladimir Sementsov-Ogievskiy (11):

I got through patches 1-6 in your v4 posting (our mails crossed), so
I'll assume those are similar, and resume my review with patch 7 in
this posting.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


