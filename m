Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B22D447
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 05:32:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVpK6-00085K-Jb
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 23:32:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hVpIS-0007HV-Ez
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hVpIQ-0006IG-Ru
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:30:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hVpIQ-0005xw-MW
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:30:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 635513092656;
	Wed, 29 May 2019 03:30:28 +0000 (UTC)
Received: from xz-x1 (ovpn-12-42.pek2.redhat.com [10.72.12.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 252FD1972A;
	Wed, 29 May 2019 03:30:24 +0000 (UTC)
Date: Wed, 29 May 2019 11:30:21 +0800
From: Peter Xu <peterx@redhat.com>
To: Yury Kotov <yury-kotov@yandex-team.ru>
Message-ID: <20190529033021.GF22773@xz-x1>
References: <20190528091633.12246-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528091633.12246-1-yury-kotov@yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 29 May 2019 03:30:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/2] Deferred incoming migration through
 fd
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 28, 2019 at 12:16:31PM +0300, Yury Kotov wrote:
> Hi,
> 
> V2:
> * Revert odd changes in migrate()
> * Add short description for socket_send_fds()
>   and remove ifdef WIN32 as it's not needed
> 
> This series is a continuation of the previous two:
> * migration: Fix handling fd protocol
> * Add 'inline-fd:' protocol for migration
> 
> It's about such use case:
> 1. Target VM: exec ...,-incoming defer
> 2. Target VM: getfd("fd-mig")
> 3. Target VM: migrate-incoming("fd:"fd-mig")
> 4. Source VM: getfd("fd-mig")
> 5. Source VM: migrate("fd-mig")
> 
> Currently, it's not possible to do the step 3, because for incoming migration
> "fd:" protocol expects an integer, not the name of fd.

Reviewed-by: Peter Xu <peterx@redhat.com>

I gave a quick shot on the new test - it runs well.

-- 
Peter Xu

