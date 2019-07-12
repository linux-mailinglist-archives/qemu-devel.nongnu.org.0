Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BD666A7C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 11:51:23 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlsD4-0005Y2-Br
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 05:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49148)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hlsCs-00058w-Cm
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 05:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hlsCr-0005bi-B2
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 05:51:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36732)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hlsCr-0005bM-57
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 05:51:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 45C3D59465;
 Fri, 12 Jul 2019 09:51:08 +0000 (UTC)
Received: from work-vm (ovpn-117-214.ams2.redhat.com [10.36.117.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1852D5D756;
 Fri, 12 Jul 2019 09:51:06 +0000 (UTC)
Date: Fri, 12 Jul 2019 10:51:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Singh, Brijesh" <brijesh.singh@amd.com>
Message-ID: <20190712095104.GB2730@work-vm>
References: <20190710202219.25939-1-brijesh.singh@amd.com>
 <20190710202219.25939-8-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710202219.25939-8-brijesh.singh@amd.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 12 Jul 2019 09:51:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 07/13] target/i386: sev: do not create
 launch context for an incoming guest
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Singh, Brijesh (brijesh.singh@amd.com) wrote:
> The LAUNCH_START is used for creating an encryption context to encrypt
> newly created guest, for an incoming guest the RECEIVE_START should be
> used.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/sev.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 6dbdc3cdf1..49baf8fef0 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -789,10 +789,16 @@ sev_guest_init(const char *id)
>          goto err;
>      }
>  
> -    ret = sev_launch_start(s);
> -    if (ret) {
> -        error_report("%s: failed to create encryption context", __func__);
> -        goto err;
> +    /*
> +     * The LAUNCH context is used for new guest, if its an incoming guest
> +     * then RECEIVE context will be created after the connection is established.
> +     */
> +    if (!runstate_check(RUN_STATE_INMIGRATE)) {
> +        ret = sev_launch_start(s);
> +        if (ret) {
> +            error_report("%s: failed to create encryption context", __func__);
> +            goto err;
> +        }
>      }
>  
>      ram_block_notifier_add(&sev_ram_notifier);
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

