Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B899F62C13B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJd8-0001Id-SW; Wed, 16 Nov 2022 09:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovJd7-0001Gc-E6
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovJd5-0007FR-MW
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668609787;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CkVHQD5ArvE9ZiP3gAAWBrgCvhGWMRcc9+xnvLgcboU=;
 b=dhTEWHKUQU8NazP0kX9dKrh0epteERFaYGdpzYw/mXJ8JIyywI5q6uudnYMoYeQpqu/M4M
 XQao792IrmFKcdGKTZBA+BDyXQJj28uAUeil5DWaO8Mak6d27KiZXCYeGZFX8AZdHYkTQg
 cznUe9A7YtU1gEa1h/R51doNNf7KQNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-kSKFlPvLNRi2Ra9WRTKOGA-1; Wed, 16 Nov 2022 09:43:05 -0500
X-MC-Unique: kSKFlPvLNRi2Ra9WRTKOGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F0B9858282;
 Wed, 16 Nov 2022 14:43:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8B3E40C835A;
 Wed, 16 Nov 2022 14:42:56 +0000 (UTC)
Date: Wed, 16 Nov 2022 14:42:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: bakulinm@ispras.ru
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, philmd@redhat.com,
 crosa@redhat.com, wainersm@redhat.com, bleal@redhat.com
Subject: Re: [PATCH] tests/avocado: using several workers while testing
Message-ID: <Y3T26+ZNRsd7ELbB@redhat.com>
References: <Y3TuYPX/RFLgbLRC@redhat.com>
 <166860649008.1258000.17066080427505400235.stgit@pasha-ThinkPad-X280>
 <99df713da53c1f8b726a1fdb63c8473f@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99df713da53c1f8b726a1fdb63c8473f@ispras.ru>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Wed, Nov 16, 2022 at 02:37:43PM +0000, bakulinm@ispras.ru wrote:
> Valid point, thank you.
> 
> I can see three options what to do:
> e1) Ignore older version of make and assume that 4.2 or newer is used
> (4.1 is in Ubuntu 18.04 that is no longer supported as a build platform
> as I was told; 20.04 has 4.2). In this case make provides number of
> jobs in $MAKEFLAGS and this makes getting it trivial. In case of an
> older make only two options will be available: (default) single-threaded,
> and using all cores.

> Which one should I choose?

Ignore older make. Ubuntu 18.04 is not a platform we target anymore,
so we shouldn't be writing compat code for handling it, and in any
case degrading to single threaded or all-cores is fine fallback IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


