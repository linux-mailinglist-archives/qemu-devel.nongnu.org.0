Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614951CA2A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 16:21:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQYJ6-0006Ps-Ji
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 10:21:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQYEm-0002QI-5R
	for qemu-devel@nongnu.org; Tue, 14 May 2019 10:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQY0S-0002A6-OL
	for qemu-devel@nongnu.org; Tue, 14 May 2019 10:02:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQY0S-00029m-J5
	for qemu-devel@nongnu.org; Tue, 14 May 2019 10:02:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE0283088DBE
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 14:02:11 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B98F15D735;
	Tue, 14 May 2019 14:01:38 +0000 (UTC)
Date: Tue, 14 May 2019 15:01:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Message-ID: <20190514140135.GB9618@work-vm>
References: <b991a4d0e6c4253bc08b2794c6084be55fc72e1d.1554851834.git.crobinso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b991a4d0e6c4253bc08b2794c6084be55fc72e1d.1554851834.git.crobinso@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 14 May 2019 14:02:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: savevm: fix error code with
 migration blockers
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Cole Robinson (crobinso@redhat.com) wrote:
> The only caller that checks the error code is looking for != 0,
> so returning false is incorrect.
> 
> Fixes: 5aaac467938 "migration: savevm: consult migration blockers"
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>

Queued

> ---
>  migration/savevm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 34bcad3807..a3dae4cf02 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2544,7 +2544,7 @@ int save_snapshot(const char *name, Error **errp)
>      AioContext *aio_context;
>  
>      if (migration_is_blocked(errp)) {
> -        return false;
> +        return ret;
>      }
>  
>      if (!replay_can_snapshot()) {
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

