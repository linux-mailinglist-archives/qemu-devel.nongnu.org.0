Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF73817F0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 13:13:23 +0200 (CEST)
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huava-000204-KN
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 07:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52805)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1huaul-0001a9-9u
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 07:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1huauk-0001R6-Az
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 07:12:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29065)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1huauk-0001Qn-5h
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 07:12:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E278C30014C6;
 Mon,  5 Aug 2019 11:12:28 +0000 (UTC)
Received: from work-vm (ovpn-117-168.ams2.redhat.com [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBA7660166;
 Mon,  5 Aug 2019 11:12:27 +0000 (UTC)
Date: Mon, 5 Aug 2019 12:12:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190805111225.GJ13734@work-vm>
References: <20190805002847.3284-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805002847.3284-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 05 Aug 2019 11:12:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] hmp: Remove migration capabilities from
 "info migrate"
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> With the growth of migration capabilities, it is not proper to display
> them in "info migrate". Users are recommended to use "info
> migrate_capabiltiies" to list them.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ---
> v2:
>   * remove capabilities from "info migrate"
> ---
>  monitor/hmp-cmds.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 99ceb0846b..05a09987da 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -220,24 +220,13 @@ static char *SocketAddress_to_str(SocketAddress *addr)
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> -    MigrationCapabilityStatusList *caps, *cap;
> +    MigrationCapabilityStatusList *caps;
>  
>      info = qmp_query_migrate(NULL);
>      caps = qmp_query_migrate_capabilities(NULL);

Why keep 'caps' and query them? Can't this go as well?

Dave

>      migration_global_dump(mon);
>  
> -    /* do not display parameters during setup */
> -    if (info->has_status && caps) {
> -        monitor_printf(mon, "capabilities: ");
> -        for (cap = caps; cap; cap = cap->next) {
> -            monitor_printf(mon, "%s: %s ",
> -                           MigrationCapability_str(cap->value->capability),
> -                           cap->value->state ? "on" : "off");
> -        }
> -        monitor_printf(mon, "\n");
> -    }
> -
>      if (info->has_status) {
>          monitor_printf(mon, "Migration status: %s",
>                         MigrationStatus_str(info->status));
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

