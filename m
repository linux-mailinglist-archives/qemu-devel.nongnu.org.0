Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD730F5E5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:13:39 +0100 (CET)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gKA-0006O0-EA
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7gFG-00020N-3D
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7gFE-00052C-Bm
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612451311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EX+gyJoZP9dVenuwQBTTJ598isiZHTRq5xd7rrtqsYE=;
 b=iJTMw2nc0fXZPKSbt4d/Z0i6IIpTIUf87i+wV6h44w7kkgRjFH4VV0Mr6+e4WPbFaErF75
 0DJuHHaFYO4iIoFRtIAM2ydv4bWN2Px6DZglVWSspRaIkYMcCYcSPycbJ3GZXtGA1yxJci
 6x37PBVfla9uSqy/uASw4o742VH7/9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-GkrR2fNINTWWSa1Gre_9XA-1; Thu, 04 Feb 2021 10:08:29 -0500
X-MC-Unique: GkrR2fNINTWWSa1Gre_9XA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ECA8107ACF7
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 15:08:28 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 215621010F53;
 Thu,  4 Feb 2021 15:08:25 +0000 (UTC)
Date: Thu, 4 Feb 2021 15:08:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 0/4] migration: Fixes and cleanups aroung
 migrate-set-parameters
Message-ID: <20210204150817.GD24147@work-vm>
References: <20210202141734.2488076-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202141734.2488076-1-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> v2:
> * Rebased
> * PATCH 1 dropped.  Fixes a crash bug.  Daniel asked me to modify the
>   fix.  Unfortunately, I don't understand this anymore, and don't have
>   the time & energy to start over.
> * PATCH 4 dropped.  Plugs a hole in input validation.  David pointed
>   asked me to additionally fix an error message, but I don't quite
>   understand what he wants.
> 
> We can discuss what to do about the dropped patches, but I don't want
> to hold the remainder of the series any longer just for that.

Queued (with double . removed)

> 
> Markus Armbruster (4):
>   migration: Fix migrate-set-parameters argument validation
>   migration: Clean up signed vs. unsigned XBZRLE cache-size
>   migration: Fix cache_init()'s "Failed to allocate" error messages
>   migration: Fix a few absurdly defective error messages
> 
>  qapi/migration.json    | 32 ++++++++++++++++----------------
>  migration/migration.h  |  2 +-
>  migration/page_cache.h |  2 +-
>  migration/ram.h        |  2 +-
>  migration/migration.c  | 27 +++++++++++++--------------
>  migration/page_cache.c |  8 +++-----
>  migration/ram.c        |  2 +-
>  monitor/hmp-cmds.c     | 24 ++++++++++++------------
>  8 files changed, 48 insertions(+), 51 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


