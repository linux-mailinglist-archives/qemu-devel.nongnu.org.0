Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D53598EE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:12:50 +0200 (CEST)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnC5-0005ov-4g
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUnAE-0004Xa-U5
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:10:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUnAC-00036m-HW
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617959451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/9hGXWJ7KFkguhDzh5LTLx4/htiJaLWguW3u3xMDBw=;
 b=G+K9JYvfaf6m0eQRHVJ20Egblftj+t8ytYKzP+mH5+zrY4xB67RUusn7M8/gblz4d9Gdh6
 KjfQlmZRrLTxQ9u27n70F5Dx5eriLdmqS+BY+eSY3YP3rThIYfmuf5PaCifOrO/AhLaXM6
 LhK8f87Qxr4GhYbOtzdYQ//ugWYHUcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-QiIY9jvYNzKqle-feAYBoQ-1; Fri, 09 Apr 2021 05:10:49 -0400
X-MC-Unique: QiIY9jvYNzKqle-feAYBoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20AC218B9F49
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 09:10:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-36.ams2.redhat.com [10.36.115.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 306CF5B4BF;
 Fri,  9 Apr 2021 09:10:43 +0000 (UTC)
Date: Fri, 9 Apr 2021 10:10:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH 3/5] migration: Add cleanup hook for inwards migration
Message-ID: <YHAaEdP3y56u7AmC@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <20210408191159.133644-4-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408191159.133644-4-dgilbert@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: quintela@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 08:11:57PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add a cleanup hook for incoming migration that gets called
> at the end as a way for a transport to allow cleanup.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/migration.c | 3 +++
>  migration/migration.h | 4 ++++
>  2 files changed, 7 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


