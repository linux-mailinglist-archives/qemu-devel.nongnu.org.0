Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DF55BF8D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:41:42 +0200 (CEST)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66my-0004Sj-TC
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o662h-0000tP-CD
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o662d-0007V3-8e
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656402826;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=v/8q47oSeNfXZ7DPlEUrDmBFZ5+0fBNKQB/m2PGZOvk=;
 b=aDdn5GVF0Kwnh+HQrnsvmFl8eTH1MAi59h7Htjkh5wqrl9hfXtFI0ndQbooZtXf4nPv3y3
 IhUDTZpoYSvZaSILUEP4F6bzGuMtIg/wdpUN7eLSW0cFuapT5bwBnt80PkDFlvWIwiChty
 6EPwUSgxqxyS5cmMQLFX5c4JdMHP6qk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-j64HZ8KSM8yOtGv-btLyaA-1; Tue, 28 Jun 2022 03:53:44 -0400
X-MC-Unique: j64HZ8KSM8yOtGv-btLyaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E45EF801231
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:53:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06090C15D42;
 Tue, 28 Jun 2022 07:53:42 +0000 (UTC)
Date: Tue, 28 Jun 2022 08:53:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <YrqzhFAePnnEl8A8@redhat.com>
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628010908.390564-3-leobras@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> Some errors, like the lack of Scatter-Gather support by the network
> interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> zero-copy, which causes it to fall back to the default copying mechanism.

How common is this lack of SG support ? What NICs did you have that
were affected ?

> After each full dirty-bitmap scan there should be a zero-copy flush
> happening, which checks for errors each of the previous calls to
> sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> warn the user about it.
> 
> Since it happens once each full dirty-bitmap scan, even in worst case
> scenario it should not print a lot of warnings, and will allow tracking
> how many dirty-bitmap iterations were not able to use zero-copy send.

For long running migrations which are not converging, or converging
very slowly there could be 100's of passes.



> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 684c014c86..9c62aec84e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -624,6 +624,9 @@ int multifd_send_sync_main(QEMUFile *f)
>              if (ret < 0) {
>                  error_report_err(err);
>                  return -1;
> +            } else if (ret == 1) {
> +                warn_report("The network device is not able to use "
> +                            "zero-copy-send: copying is being used");
>              }
>          }
>      }
> -- 
> 2.36.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


