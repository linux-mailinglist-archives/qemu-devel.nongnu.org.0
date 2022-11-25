Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4063857C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 09:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyULB-0003TA-H9; Fri, 25 Nov 2022 03:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oyUL7-0003T1-Hc
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 03:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oyUL4-0002jv-Nk
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 03:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669365935;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1cqJ9gWK0myxxYvStIxwTt4D/0edltAkWzvNdlUSYI=;
 b=BIEGVNGbwHIEU81083DZOYA1CXNJQfBAdcqmOltyzhtDyxjweReQNiUJS+gkWJRa/+Iwea
 RVjrjj2FYcH6amO/NaXTw0GubTc2mhfXOnjbreFmXWVegygcRdjXvxOiWvclfKGjEO9wKw
 iKNx7/CM7Rdhcz0G9pRUcQT0KxoIN60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-8zO8xY1qPEyvW6SdJw94Kw-1; Fri, 25 Nov 2022 03:45:33 -0500
X-MC-Unique: 8zO8xY1qPEyvW6SdJw94Kw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B2AB185A794
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 08:45:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D59E477F55;
 Fri, 25 Nov 2022 08:45:32 +0000 (UTC)
Date: Fri, 25 Nov 2022 08:45:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Fix unlink error and memory
 leaks
Message-ID: <Y4CAp19HSRRieZug@redhat.com>
References: <20221125083054.117504-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125083054.117504-1-thuth@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Nov 25, 2022 at 09:30:54AM +0100, Thomas Huth wrote:
> When running the migration test compiled with Clang from Fedora 37
> and sanitizers enabled, there is an error complaining about unlink():
> 
>  ../tests/qtest/migration-test.c:1072:12: runtime error: null pointer
>   passed as argument 1, which is declared to never be null
>  /usr/include/unistd.h:858:48: note: nonnull attribute specified here
>  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
>   ../tests/qtest/migration-test.c:1072:12 in
>  (test program exited with status code 1)
>  TAP parsing error: Too few tests run (expected 33, got 20)
> 
> The data->clientcert and data->clientkey pointers can indeed be unset
> in some tests, so we have to check them before calling unlink() with
> those.
> 
> While we're at it, I also noticed that the code is only freeing
> some but not all of the allocated strings in this function, and
> indeed, valgrind is also complaining about memory leaks here.
> So let's call g_free() on all allocated strings to avoid leaking
> memory here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/migration-test.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


