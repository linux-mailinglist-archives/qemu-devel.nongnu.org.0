Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9675811DE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:24:39 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIg0-000683-Rv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGIcA-0002nO-01
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGIbt-00034z-IP
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658834420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kyod1YhPVA6hFLT3wWK6GRnmF1fV4wX6UIvJH8GMJA4=;
 b=QoImiIL38xzqFaQYGRLGwt27VotLEOi3OuGcQ7tz7kSNlRbmsM5NrFTt+14ces2ARrRyAe
 vDSNL+YJSMgjHhzJdxuK+6dJ+vFrBlzo36IW0u43uqUJzP3wQyl6nKiBAzg0wr1kkrbJw9
 XNZ5yQYP8Kfr18gVPAlyYAhBrLmZUyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-0avfY0veNWuW2IsTHX4eFQ-1; Tue, 26 Jul 2022 07:20:15 -0400
X-MC-Unique: 0avfY0veNWuW2IsTHX4eFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 093A685A585;
 Tue, 26 Jul 2022 11:20:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D811121314;
 Tue, 26 Jul 2022 11:20:13 +0000 (UTC)
Date: Tue, 26 Jul 2022 12:20:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 3/7] multifd: adding multi-interface support for
 multifd on destination side
Message-ID: <Yt/N629r3EpOLrHG@redhat.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-4-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721195620.123837-4-het.gala@nutanix.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 21, 2022 at 07:56:16PM +0000, Het Gala wrote:
> i) Modified the format of qemu monitor command: 'migrate-incoming' by adding
>    a list, each element in the list to open socket listeners with a given
>    number of multifd channels.
> 
> ii) Qemu starts with -incoming flag defer and -multi-fd-incoming defer to
>     allow the modified 'migrate-incoming' command to be used.
> 
> iii) Format for -multi-fd-incoming flag as a comma separated string has been
>      added with each substring containing listener socket address and number
>      of sockets to open.
> 
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>


> diff --git a/qemu-options.hx b/qemu-options.hx
> index 79e00916a1..5555f0d2fd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4479,6 +4479,24 @@ SRST
>      to issuing the migrate\_incoming to allow the migration to begin.
>  ERST
>  
> +DEF("multi-fd-incoming", HAS_ARG, QEMU_OPTION_multi_fd_incoming, \
> +    "-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
> +    "-multi-fd-incoming defer\n" \
> +    "                wait for the URI to be specified via\n" \
> +    "                multi_fd_migrate_incoming\n",
> +    QEMU_ARCH_ALL)
> +SRST
> +``-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]``
> +    Prepare for multi-fd incoming migration, with multi-fd listening sockets
> +    on that connection. Default number of multi-fd channels is 2.
> +
> +``-multi-fd-incoming defer``
> +    Wait for the URI to be specified via multi_fd_migrate\_incoming. The
> +    monitor can be used to change settings (such as migration parameters)
> +    prior to issuing the multi_fd_migrate\_incoming to allow the migration
> +    to begin.
> +ERST

We should not be adding any new -multi-fd-incoming CLI parameter at all.
The CLI is so unsuitable for any complex configuration param and this
is a prime example. 

If anything we should fully deprecate anything that is not '-incoming defer'
such that we become 100% QMP/QAPI based for incoming migration config.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


