Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471863EAE5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:15:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ehj-0004Hp-0X; Thu, 01 Dec 2022 03:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0ehd-0004He-SF
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0ehb-0000QP-O0
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669882429;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TrU/eeQAA81R8qd08m+623kWUllHyaZUi7oHODKo/00=;
 b=Z9+B+xJz/NgGA7HMVSQde6Y6kLBqPdIfBhUQ5qSh8oyopKDcl5nOKojsvD5bwz0EvChREK
 2FfZ2kXiwJxLwdFLg3bsRSOIWktPrz86l0tw3XEO3ixhSMN9J6KD0oyTNgMuD+JpfwbQR0
 cQNTiCnVhbeO2LQ7+XJPBoKFDkFjqNA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-8quHnhfSOsmf0gT4q7LrZQ-1; Thu, 01 Dec 2022 03:13:48 -0500
X-MC-Unique: 8quHnhfSOsmf0gT4q7LrZQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18686811E7A
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 08:13:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD594492B04;
 Thu,  1 Dec 2022 08:13:46 +0000 (UTC)
Date: Thu, 1 Dec 2022 08:13:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH 1/9] ui: Check numeric part of expire_password argument
 @time properly
Message-ID: <Y4hiNjdS9iqZGB9O@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201061311.3619052-2-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 07:13:03AM +0100, Markus Armbruster wrote:
> When argument @time isn't 'now' or 'never', we parse it as an integer,
> optionally prefixed with '+'.  If parsing fails, we silently assume
> zero.  Report an error and fail instead.
> 
> While there, use qemu_strtou64() instead of strtoull() so
> checkpatch.pl won't complain.
> 
> Aside: encoding numbers in strings is bad QMP practice.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/qmp-cmds.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


