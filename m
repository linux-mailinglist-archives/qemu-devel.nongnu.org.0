Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D5B1CC38
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 17:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQZeq-0002MK-BR
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 11:48:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQZcp-0001j3-KV
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQZcn-0007mB-Jn
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:45:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQZcj-0007im-Uq
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:45:51 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E0687E437;
	Tue, 14 May 2019 15:45:44 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A838100203C;
	Tue, 14 May 2019 15:45:43 +0000 (UTC)
Date: Tue, 14 May 2019 16:45:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190514154540.GM2753@work-vm>
References: <20190424004700.12766-1-richardw.yang@linux.intel.com>
	<20190424004700.12766-4-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190424004700.12766-4-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 15:45:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/4] migration/savevm: load_header before
 load_setup
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
> In migration_thread() and qemu_savevm_state(), we savevm_state in
> following sequence:
> 
>     qemu_savevm_state_header(f);
>     qemu_savevm_state_setup(f);
> 
> Then it would be more proper to loadvm_state in the save sequence.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Yes, OK, I think that makes sense; the loadvm_state_setup
and savevm_state_setup are actually quite different in what they do,
however it does make sense to do the loadvm_state_setup after
we have the configuration loaded, because then potentially it means
we can alter the setup.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


> ---
>  migration/savevm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 6c61056cde..a80ae83663 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2427,10 +2427,6 @@ int qemu_loadvm_state(QEMUFile *f)
>          return -ENOTSUP;
>      }
>  
> -    if (qemu_loadvm_state_setup(f) != 0) {
> -        return -EINVAL;
> -    }
> -
>      if (migrate_get_current()->send_configuration) {
>          if (qemu_get_byte(f) != QEMU_VM_CONFIGURATION) {
>              error_report("Configuration section missing");
> @@ -2445,6 +2441,10 @@ int qemu_loadvm_state(QEMUFile *f)
>          }
>      }
>  
> +    if (qemu_loadvm_state_setup(f) != 0) {
> +        return -EINVAL;
> +    }
> +
>      cpu_synchronize_all_pre_loadvm();
>  
>      ret = qemu_loadvm_state_main(f, mis);
> -- 
> 2.19.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

