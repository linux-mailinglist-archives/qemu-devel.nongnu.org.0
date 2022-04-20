Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA90508687
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:04:03 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh87u-0008Ev-Gq
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh83v-0005qs-Dg
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:59:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh83t-0002Gx-EC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650452392;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3bOwrlf+FngerK2Cs3kwuRJCZZ0Rp2hijrhZvjHVT6M=;
 b=jStUN6cvuuEn/j4cVMdohD3kr+iV5EDxu9z/zkoE2CEVYA5s+DK1u44LMztvhVkEphDj/V
 I4sewKgTRA1+IsMV/SbrvWQlNFVZC0nKEa8EYNNEVgs9lw0zy9YwLU440QQ10q/JWpks0d
 orvJjWAW8mx6gPnC8lVxhDTuNuFsBBg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-avXOS848OsOpYp-x0WSCSQ-1; Wed, 20 Apr 2022 06:59:48 -0400
X-MC-Unique: avXOS848OsOpYp-x0WSCSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F03A3C025B1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 10:59:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 513A0145B989;
 Wed, 20 Apr 2022 10:59:47 +0000 (UTC)
Date: Wed, 20 Apr 2022 11:59:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 09/19] migration: Postcopy preemption preparation on
 channel creation
Message-ID: <Yl/noOm7E3a9PVjc@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-10-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331150857.74406-10-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:47AM -0400, Peter Xu wrote:
> Create a new socket for postcopy to be prepared to send postcopy requested
> pages via this specific channel, so as to not get blocked by precopy pages.
> 
> A new thread is also created on dest qemu to receive data from this new channel
> based on the ram_load_postcopy() routine.
> 
> The ram_load_postcopy(POSTCOPY) branch and the thread has not started to
> function, and that'll be done in follow up patches.
> 
> Cleanup the new sockets on both src/dst QEMUs, meanwhile look after the new
> thread too to make sure it'll be recycled properly.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c    | 62 +++++++++++++++++++++++----
>  migration/migration.h    |  8 ++++
>  migration/postcopy-ram.c | 92 ++++++++++++++++++++++++++++++++++++++--
>  migration/postcopy-ram.h | 10 +++++
>  migration/ram.c          | 25 ++++++++---
>  migration/ram.h          |  4 +-
>  migration/savevm.c       | 20 ++++-----
>  migration/socket.c       | 22 +++++++++-
>  migration/socket.h       |  1 +
>  migration/trace-events   |  5 ++-
>  10 files changed, 218 insertions(+), 31 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


