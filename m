Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE0623E32
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot3Q7-0003mu-RX; Thu, 10 Nov 2022 04:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ot3Q5-0003ml-5n
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:00:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ot3Q3-00028T-9D
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668070817;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=F6UYlNQiyHGtEPDHyD3ecewrIcYjfL8Gw2XvrS0QCq0=;
 b=A+P0wUfS90YKsF28kz6e5HlAttN+zhVyKqBfgO7rmNNLe41/p2Sow31zvx499XFuzDiBEJ
 kgtYgfNVRvBpmqfusNRiNDKI1OxSCA83UsETq0D6Sjqo42dINPPELofbZ8Y2EdmDwOHb2k
 AXAHnRW3fMVCy53TMvSUFaYA/YbCRec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-YzV_v9uMMLycLDF_kg2pVA-1; Thu, 10 Nov 2022 04:00:14 -0500
X-MC-Unique: YzV_v9uMMLycLDF_kg2pVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37D57185A79C;
 Thu, 10 Nov 2022 09:00:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 270D0141511F;
 Thu, 10 Nov 2022 09:00:12 +0000 (UTC)
Date: Thu, 10 Nov 2022 09:00:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Tom Stellard <tstellar@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] Use a more portable way to enable target specific
 functions
Message-ID: <Y2y9l7R1x+Tw1ii6@redhat.com>
References: <20221109220307.226283-1-tstellar@redhat.com>
 <43f92886-cb13-3f80-a307-9bb1d9515413@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43f92886-cb13-3f80-a307-9bb1d9515413@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

On Thu, Nov 10, 2022 at 02:43:28PM +1100, Richard Henderson wrote:
> On 11/10/22 09:03, Tom Stellard wrote:
> > This adds function attributes for avx2, sse2, etc. specialized
> > functions.  These attributes are supported by both clang and gcc and
> > are necessary in order to build the code with clang.  The existing gcc
> > specific pragmas were left in place due to a comment in
> > utils/bufferiszero.c which mentions the pragmas are needed before headers
> > to work around a bug in gcc <= 4.8.
> 
> GCC 4.8 is now below our minimum, surely.
> We should be able to simply replace the pragma with the attribute.

We mandate at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)

> 
> 
> r~
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


