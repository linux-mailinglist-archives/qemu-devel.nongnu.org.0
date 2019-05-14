Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3711CDBF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 19:15:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQb1u-0007qJ-Om
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 13:15:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQazS-0006JZ-BP
	for qemu-devel@nongnu.org; Tue, 14 May 2019 13:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQazR-0002rN-Hb
	for qemu-devel@nongnu.org; Tue, 14 May 2019 13:13:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64963)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQazR-0002qL-CM
	for qemu-devel@nongnu.org; Tue, 14 May 2019 13:13:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D36D306E171
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 17:13:20 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C14E3608B9;
	Tue, 14 May 2019 17:13:16 +0000 (UTC)
Date: Tue, 14 May 2019 18:13:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190514171313.GR2753@work-vm>
References: <20190510185620.15757-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510185620.15757-1-ehabkost@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 14 May 2019 17:13:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] monitor: Call mon_get_cpu() only once at
 hmp_gva2gpa()
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eduardo Habkost (ehabkost@redhat.com) wrote:
> hmp_gva2gpa() calls mon_get_cpu() twice, which is unnecessary.
> Not an actual bug, but this is reported as a defect by Coverity
> Scan (CID 1401346).
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

I'm going to sneak this onto the end of a migration pull I'm just
cooking.

Queued.

> ---
>  monitor.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/monitor.c b/monitor.c
> index bb48997913..6428eb3b7e 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1685,8 +1685,7 @@ static void hmp_gva2gpa(Monitor *mon, const QDict *qdict)
>          return;
>      }
>  
> -    gpa  = cpu_get_phys_page_attrs_debug(mon_get_cpu(),
> -                                         addr & TARGET_PAGE_MASK, &attrs);
> +    gpa  = cpu_get_phys_page_attrs_debug(cs, addr & TARGET_PAGE_MASK, &attrs);
>      if (gpa == -1) {
>          monitor_printf(mon, "Unmapped\n");
>      } else {
> -- 
> 2.18.0.rc1.1.g3f1ff2140
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

