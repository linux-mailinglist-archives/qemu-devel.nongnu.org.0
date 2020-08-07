Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C323F25E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 19:59:50 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k46ei-0006jv-Od
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 13:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k46ds-0006KB-E2
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 13:58:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41332
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k46dp-0003qg-F1
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 13:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596823131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNM1GLmjg/YQwpEtnjBsWfLXAxyUpilOZEHm+BLfMdU=;
 b=OEJ1KeGZztG4g/AZdTRilFwUelSJ7yTEfr4zjE+5Uk9QYqBsYZF9rMg/pNpUZ+tOXNrsSu
 mwZxk6YJnigwpQJAFt1jhT7a4XUfeX9G8mPn1JWMBSQtipkuH7nqCw1fxQfwDYZ2j53YkM
 Y1YTTO1UHElfOxakjiibl1D/mZ30jcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-qSL9iY3pMo2__-LxiV9kpA-1; Fri, 07 Aug 2020 13:58:49 -0400
X-MC-Unique: qSL9iY3pMo2__-LxiV9kpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 086898064DE
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 17:58:49 +0000 (UTC)
Received: from work-vm (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E070D5D9CA;
 Fri,  7 Aug 2020 17:58:41 +0000 (UTC)
Date: Fri, 7 Aug 2020 18:58:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v2 5/5] virtiofsd: Skip setup_capabilities() in
 sandbox=NONE mode
Message-ID: <20200807175839.GK2780@work-vm>
References: <20200730194736.173994-1-vgoyal@redhat.com>
 <20200730194736.173994-6-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200730194736.173994-6-vgoyal@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 04:00:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: berrange@redhat.com, vromanso@redhat.com, dwalsh@redhat.com,
 qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> setup_capabilites() tries to give some of the required capabilities
> to act as a full fledged file server in priviliged mode. In unpriviliged
> mode we can't get those capabilities and setup_capabilities() will fail.
> 
> So don't setup capabilities when sandbox=NONE.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index a6fa816b6c..1a0b24cbf2 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3030,7 +3030,8 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
>      }
>  
>      setup_seccomp(enable_syslog);
> -    setup_capabilities(g_strdup(lo->modcaps));
> +    if (lo->sandbox != SANDBOX_NONE)
> +       setup_capabilities(g_strdup(lo->modcaps));
>  }

I'd rather keep capabilities and sandboxing separate.
Since I already added modcaps=  how about just letting that
take a varient as  '-o modcaps=keep'

Dave

>  /* Set the maximum number of open file descriptors */
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


