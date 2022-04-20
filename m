Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC49508648
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:47:52 +0200 (CEST)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7sF-0006uo-63
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh7oJ-0004VE-4J
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh7oG-0008Od-Sx
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650451424;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyIbIhzO0BOOrJ6tt4DcSIkFzZtpWutXPHkXREqiAJI=;
 b=fM4k/UCIZ8EScTyQlYHv6ssCNIfCr7bQUAn1NJSe3Vu2jgsg+7nK0STMTDYE02jEr89ZOQ
 ARSb6GfBY9dZWtszetGIYEcmwfs3KWImTcdbrr/3aT+NiWJEXhGl1LNX0QTB1QIqTSzQUn
 zNjOE/QdAnQ/2VSD7OUBJSEDO8tARwI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-ujm_dAWhMm2HHfVmtIokSg-1; Wed, 20 Apr 2022 06:43:43 -0400
X-MC-Unique: ujm_dAWhMm2HHfVmtIokSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB1AD381A824
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 10:43:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D3B740D1B9B;
 Wed, 20 Apr 2022 10:43:36 +0000 (UTC)
Date: Wed, 20 Apr 2022 11:43:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 06/19] migration: Move channel setup out of
 postcopy_try_recover()
Message-ID: <Yl/j0xEzelkGlkkA@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-7-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331150857.74406-7-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:44AM -0400, Peter Xu wrote:
> We used to use postcopy_try_recover() to replace migration_incoming_setup() to
> setup incoming channels.  That's fine for the old world, but in the new world
> there can be more than one channels that need setup.  Better move the channel
> setup out of it so that postcopy_try_recover() only handles the last phase of
> switching to the recovery phase.
> 
> To do that in migration_fd_process_incoming(), move the postcopy_try_recover()
> call to be after migration_incoming_setup(), which will setup the channels.
> While in migration_ioc_process_incoming(), postpone the recover() routine right
> before we'll jump into migration_incoming_process().
> 
> A side benefit is we don't need to pass in QEMUFile* to postcopy_try_recover()
> anymore.  Remove it.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


