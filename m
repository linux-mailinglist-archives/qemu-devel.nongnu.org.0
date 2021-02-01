Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF230B0E0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:54:41 +0100 (CET)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fHU-00060A-3F
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6fGD-00055w-16
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:53:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6fG4-0003qm-Sj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612209191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3jMvAejVeJ5JN5fcmUSz0aSBAUCCwr+63hOBx2c5Pgs=;
 b=dk8HSsDgGNMidaDI+kfZH8zcS4M7dq6dNWDSzCBClO4bUlOsWivdL7B1r3HvoFskSdYgz2
 Fbh67sYWy4qdtqqFwSwsQ7NF+LLRMKqIlY+6RUFGgp4aE/pTgevocaHYSIPDLXwIdPJD0g
 gQI6BUPsa+oAT/Y9PT1Ttlsn9kVRpB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-JqaaYKIIO-qDsfu00Mg5UA-1; Mon, 01 Feb 2021 14:52:37 -0500
X-MC-Unique: JqaaYKIIO-qDsfu00Mg5UA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BEA3801817;
 Mon,  1 Feb 2021 19:52:36 +0000 (UTC)
Received: from work-vm (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F09B85C1A1;
 Mon,  1 Feb 2021 19:52:31 +0000 (UTC)
Date: Mon, 1 Feb 2021 19:52:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Add restart_syscall to the seccomp whitelist
Message-ID: <20210201195229.GJ3300@work-vm>
References: <20210201193305.136390-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210201193305.136390-1-groug@kaod.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> This is how linux restarts some system calls after SIGSTOP/SIGCONT.
> This is needed to avoid virtiofsd termination when resuming execution
> under GDB for example.

Ah!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> 
> This has passed Travis and gitlab CI without errors.
> 
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index a60d7da4b4e2..da03e97d35e4 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -88,6 +88,7 @@ static const int syscall_whitelist[] = {
>      SCMP_SYS(renameat),
>      SCMP_SYS(renameat2),
>      SCMP_SYS(removexattr),
> +    SCMP_SYS(restart_syscall),
>      SCMP_SYS(rt_sigaction),
>      SCMP_SYS(rt_sigprocmask),
>      SCMP_SYS(rt_sigreturn),
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


