Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6DA4AFA13
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:34:48 +0100 (CET)
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrnj-0000Tg-8N
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHrds-0003rC-Jy
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHrdn-0000ZY-Vz
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644431070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8qxSsy9Rkh2SyYl19wWE6ouIIv4cjuLy3FbNJhslyU=;
 b=IJwM3dPSowt6Xr+RO/o6M7SPRVZdRyZJ8ypSxS0xF1a7mXwrRD/8yD6CYO1Zc1n7dsOV74
 K9qmEnDcTjACBKxV84MMBeVvMrb727IdyQbkz5fpQTlNqm5e3GkfT6jsvTpapXmsoYkcQi
 EHhPJEld/HW5TaAKGUDqLe5fRD1ols4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-1bndsEl6N5CEoTULVRdRsA-1; Wed, 09 Feb 2022 13:24:22 -0500
X-MC-Unique: 1bndsEl6N5CEoTULVRdRsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60C65192CC43;
 Wed,  9 Feb 2022 18:24:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7387D4B5;
 Wed,  9 Feb 2022 18:23:00 +0000 (UTC)
Date: Wed, 9 Feb 2022 18:22:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 1/3] ui/vnc: refactor arrays of addresses to
 SocketAddressList
Message-ID: <YgQGgZA9r6FcuWOy@redhat.com>
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
 <20220118160909.2502374-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20220118160909.2502374-2-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: bleal@redhat.com, armbru@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, crosa@redhat.com,
 marcandre.lureau@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 05:09:07PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Let's use SocketAddressList instead of dynamic arrays.
> Benefits:
>  - Automatic cleanup: don't need specific freeing function and drop
>    some gotos.
>  - Less indirection: no triple asterix anymore!
>  - Prepare for the following commit, which will reuse new interface of
>    vnc_display_listen().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/vnc.c | 129 ++++++++++++++++++++++---------------------------------
>  1 file changed, 51 insertions(+), 78 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


