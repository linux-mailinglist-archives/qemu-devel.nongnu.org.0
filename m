Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A160292D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:14:20 +0200 (CEST)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjc2-0001ht-Oi
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjPe-00074m-5U
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjPY-0000fO-3h
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666087281;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJPJ6Sa1U9FOBexfMFAQop/geIOTRkwgxV37fIP4yyY=;
 b=hgV/cM7cS5ET5FARhpeslAuw6H2bF1lxrVuOPnddYPHvpNyVSw5ucl97DXo3YXRy1Hq2Uf
 a5QhvPencAc9FmulLYxMowPlr2gZRNv7xmHv3RN1lPdcCEJF/jWw/4zWK1jwb9ZaYXjlea
 ZPJhFRk0KSlejgRzRx2Dvf4JCZmZOZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-Hql4EmYDMl2XySXuQNmsHQ-1; Tue, 18 Oct 2022 06:01:15 -0400
X-MC-Unique: Hql4EmYDMl2XySXuQNmsHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BD153806703;
 Tue, 18 Oct 2022 10:01:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9CD220290A2;
 Tue, 18 Oct 2022 10:01:13 +0000 (UTC)
Date: Tue, 18 Oct 2022 11:01:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v2 02/11] migration: Add support for 'file:' uri for
 incoming migration
Message-ID: <Y055ZjFq0XT+c4SK@redhat.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-3-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010133408.3214433-3-nborisov@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 10, 2022 at 04:33:59PM +0300, Nikolay Borisov wrote:
> This is a counterpart to the 'file:' uri support for source migration,
> now a file can also serve as the source of an incoming migration.

As with the prvious patch, can we add a reminder:

  Unlike other migration protocol backends, the 'file' protocol cannot
  honour non-blocking mode. POSIX file/block storage will always report
  ready to read/write, regardless of how slow the underlying storage
  will be at servicing the request.

  For incoming migration this limitation may result in the main event
  loop not being fully responsive while loading the VM state. This
  won't impact the VM since it is not running at this phase, however,
  it may impact management applications.

> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/file.c      | 15 +++++++++++++++
>  migration/file.h      |  1 +
>  migration/migration.c |  2 ++
>  3 files changed, 18 insertions(+)


> diff --git a/migration/migration.c b/migration/migration.c
> index 8813b78b9a6b..140b0f1a54bd 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -506,6 +506,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>          exec_start_incoming_migration(p, errp);
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_incoming_migration(p, errp);
> +    } else if (strstart(uri, "file:", &p)) {
> +	file_start_incoming_migration(p, errp);

A <tab> crept in there by mistake.

>      } else {
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }

With the above fixed

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


