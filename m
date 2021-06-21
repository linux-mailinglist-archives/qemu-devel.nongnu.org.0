Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE32E3AE524
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:43:59 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFXD-00052k-1h
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvFVd-0003ar-Vr
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:42:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvFVc-00087Z-89
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624264939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lgdKXU68P2RsDaMAjR8PcZemgtAGZgWZ2IhfI9hnHpE=;
 b=XNL6r4m7XYanuBthll6D3I6WT9Bso8nKS5DpsrNTIl0D7RRa8/qJEaecV+7VVPA4TYCKhu
 j5GSgzGP1+ReURGV9UKkNuyjYyYJFcpxadzwLu5XrUHcrI0XWxpQL7mbPZk78dnjB7+ezu
 t97z5GNYoXkg7lhQL5PnucYv/iGlADo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-A0CpM7lbPEuktUMcbISw2A-1; Mon, 21 Jun 2021 04:42:17 -0400
X-MC-Unique: A0CpM7lbPEuktUMcbISw2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C9729F945;
 Mon, 21 Jun 2021 08:42:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21DD25D9F0;
 Mon, 21 Jun 2021 08:42:15 +0000 (UTC)
Date: Mon, 21 Jun 2021 09:42:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 0/2] tcg: Fixes for temp_allocate_frame
Message-ID: <YNBQ5QgdPuHE/lFH@redhat.com>
References: <20210619045700.46907-1-richard.henderson@linaro.org>
 <8b50c14a-5db2-977a-faab-1778f42bfaa6@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <8b50c14a-5db2-977a-faab-1778f42bfaa6@weilnetz.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 19, 2021 at 10:16:55AM +0200, Stefan Weil wrote:
> Am 19.06.21 um 06:56 schrieb Richard Henderson:
> 
> > Stefan, I think this will resolve #367 for you -- please test.
> 
> 
> Tested-by: Stefan Weil <sw@weilnetz.de>
> 
> 
> Thank you, yes, it seems to resolve that issue.
> 
> I had to make two additional changes for building on Windows:
> 
> - Downgrade to support glib 2.54 (that's the version provided by Cygwin for
> mingw-w64). Daniel, could we go back from 2.56 to 2.54?

2.55.1 introduced support for autoptr with GSList/GList and we have already
started using this functionality, so it isn't a clean downgrade.

I'm pretty surprised cygwin would be on 2.54, as that is almost a 3 year
old release at this point in time. What's their timeframe for actually
pulling in a new release ? 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


