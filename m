Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00201C7DE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 13:37:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQVkE-0000UJ-2Y
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 07:37:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQVaA-0001YU-8R
	for qemu-devel@nongnu.org; Tue, 14 May 2019 07:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQVa9-0005pG-41
	for qemu-devel@nongnu.org; Tue, 14 May 2019 07:26:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8180)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQVa8-0005oZ-UU
	for qemu-devel@nongnu.org; Tue, 14 May 2019 07:26:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E934D3082B40;
	Tue, 14 May 2019 11:26:51 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DA84608BB;
	Tue, 14 May 2019 11:26:50 +0000 (UTC)
Date: Tue, 14 May 2019 12:26:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190514112648.GC8632@work-vm>
References: <20190327013130.26259-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327013130.26259-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 14 May 2019 11:26:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: not necessary to check ops again
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> During each iteration, se->ops is checked before each loop. So it is not
> necessary to check it again and simplify the following check a little.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Queued

> ---
>  migration/savevm.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 1415001d1c..5f0ca7fac2 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1157,15 +1157,13 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
>          if (!se->ops || !se->ops->save_live_iterate) {
>              continue;
>          }
> -        if (se->ops && se->ops->is_active) {
> -            if (!se->ops->is_active(se->opaque)) {
> -                continue;
> -            }
> +        if (se->ops->is_active &&
> +            !se->ops->is_active(se->opaque)) {
> +            continue;
>          }
> -        if (se->ops && se->ops->is_active_iterate) {
> -            if (!se->ops->is_active_iterate(se->opaque)) {
> -                continue;
> -            }
> +        if (se->ops->is_active_iterate &&
> +            !se->ops->is_active_iterate(se->opaque)) {
> +            continue;
>          }
>          /*
>           * In the postcopy phase, any device that doesn't know how to
> -- 
> 2.19.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

