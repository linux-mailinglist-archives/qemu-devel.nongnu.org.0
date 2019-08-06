Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BAC82FA7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 12:24:08 +0200 (CEST)
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huwdT-0000IT-AQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 06:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42095)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1huwcv-0008B7-9k
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 06:23:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1huwcu-0008SQ-8l
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 06:23:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58362)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1huwcu-0008S8-3Z
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 06:23:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5753D30EA1A7;
 Tue,  6 Aug 2019 10:23:31 +0000 (UTC)
Received: from work-vm (ovpn-117-206.ams2.redhat.com [10.36.117.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4285C1B5;
 Tue,  6 Aug 2019 10:23:30 +0000 (UTC)
Date: Tue, 6 Aug 2019 11:23:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190806102328.GE3066@work-vm>
References: <20190806003645.8426-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806003645.8426-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 06 Aug 2019 10:23:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] hmp: Remove migration capabilities from
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> ---
> v3:
>   * remove un-used variable caps
> v2:
>   * remove capabilities from "info migrate"
> ---
>  monitor/hmp-cmds.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 5ca3ebe942..35788c0645 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -220,24 +220,11 @@ static char *SocketAddress_to_str(SocketAddress *addr)
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> -    MigrationCapabilityStatusList *caps, *cap;
>  
>      info = qmp_query_migrate(NULL);
> -    caps = qmp_query_migrate_capabilities(NULL);
>  
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
> @@ -370,7 +357,6 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>          monitor_printf(mon, "]\n");
>      }
>      qapi_free_MigrationInfo(info);
> -    qapi_free_MigrationCapabilityStatusList(caps);
>  }
>  
>  void hmp_info_migrate_capabilities(Monitor *mon, const QDict *qdict)
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

