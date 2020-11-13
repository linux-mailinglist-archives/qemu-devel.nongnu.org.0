Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF42B1A68
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:59:38 +0100 (CET)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXjt-0006Dv-9x
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXhU-00056R-1y
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:57:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXhS-0007Go-E2
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605268625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnoeBVGpH9GJKvjM60twESj0xuw0/K8BmYEW2UzcWgg=;
 b=dMsrf6s8LgpePWIDbGuW7riM5c5rXh1wmdtNUvv7A6QTKroRv486MW/tNJrPBWsvPF3Ep1
 QQ+5ZXjkuPwDfYpNdn0yp/OYf55mu3pT+aat6n0oR/CkF9S8NkaOel99vkepveJuf/H1Tv
 MXSyW3+/F7imVWD0mM83uRWUjDL1wtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-lal3macyOLqVLiyRReNpCQ-1; Fri, 13 Nov 2020 06:57:03 -0500
X-MC-Unique: lal3macyOLqVLiyRReNpCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C25E8106B817
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 11:57:02 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0D3510013C0;
 Fri, 13 Nov 2020 11:57:01 +0000 (UTC)
Date: Fri, 13 Nov 2020 11:56:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/6] migration: Fixes and cleanups aroung
 migrate-set-parameters
Message-ID: <20201113115658.GH3251@work-vm>
References: <20201113065236.2644169-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113065236.2644169-1-armbru@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Not sure about 5.2.  The bugs aren't recent regressions.

Lets leave it till 5.3

> Markus Armbruster (6):
>   migration: Fix and clean up around @tls-authz
>   migration: Fix migrate-set-parameters argument validation
>   migration: Clean up signed vs. unsigned XBZRLE cache-size
>   migration: Check xbzrle-cache-size more carefully
>   migration: Fix cache_init()'s "Failed to allocate" error messages
>   migration: Fix a few absurdly defective error messages
> 
>  qapi/migration.json    | 34 ++++++++++++++++----------------
>  migration/migration.h  |  2 +-
>  migration/page_cache.h |  2 +-
>  migration/ram.h        |  2 +-
>  migration/migration.c  | 44 ++++++++++++++++++++++++++----------------
>  migration/page_cache.c | 23 +++++++---------------
>  migration/ram.c        |  9 +--------
>  monitor/hmp-cmds.c     | 26 ++++++++++++-------------
>  8 files changed, 68 insertions(+), 74 deletions(-)
> 
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


