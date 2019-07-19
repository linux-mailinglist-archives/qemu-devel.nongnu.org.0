Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE5C6EAB1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 20:33:34 +0200 (CEST)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoXhD-00089X-GZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 14:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoXgm-0007pm-8a
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 14:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoXga-000434-Ro
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 14:32:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoXgX-0003wB-AE
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 14:32:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A67303082120;
 Fri, 19 Jul 2019 18:32:39 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B075A5B6A5;
 Fri, 19 Jul 2019 18:32:38 +0000 (UTC)
Date: Fri, 19 Jul 2019 19:32:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719183236.GN3000@work-vm>
References: <20190719071129.11880-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719071129.11880-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 19 Jul 2019 18:32:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: use migration_in_postcopy() to
 check POSTCOPY_ACTIVE
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

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> Use common helper function to check the state.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 3036221ee8..0e73e759ca 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3140,7 +3140,7 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
>  
>      CHECK_ERROR_STATE();
>  
> -    if (migrate_get_current()->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
> +    if (migration_in_postcopy()) {
>          rcu_read_unlock();
>          return RAM_SAVE_CONTROL_NOT_SUPP;
>      }
> @@ -3775,7 +3775,7 @@ static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
>  
>      CHECK_ERROR_STATE();
>  
> -    if (migrate_get_current()->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
> +    if (migration_in_postcopy()) {
>          rcu_read_unlock();
>          return 0;
>      }
> @@ -3810,7 +3810,7 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>  
>      CHECK_ERROR_STATE();
>  
> -    if (migrate_get_current()->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
> +    if (migration_in_postcopy()) {
>          rcu_read_unlock();
>          return 0;
>      }
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

