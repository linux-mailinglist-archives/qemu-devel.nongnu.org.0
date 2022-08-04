Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADDF589CCD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:37:29 +0200 (CEST)
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJb2V-0005C4-El
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJawZ-0007lf-1G
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJawW-0005ax-4R
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659619875;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NZ14lMKUaKBxQcyS0C+9gvh4C3UE7LLL5hxrs4YzDVI=;
 b=hbw1/6c47yn/bUYRJKvZcfPJKnchRHtTbI+EuFZ/pCkX/RPslG3tNcJiOWfx+WT+f4JW0d
 DW7eUPAVVbvRTJ6gPebkKsclolevbORhJimVlrpyQEfofsurYzAl92TtMveu3GwiH0+eKN
 VXZAplBcFeYXvcgOUgT+FyRKV31l6eQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-Y6z0oVExN2eB7ZDwabf_CQ-1; Thu, 04 Aug 2022 09:31:12 -0400
X-MC-Unique: Y6z0oVExN2eB7ZDwabf_CQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9D1280EE22;
 Thu,  4 Aug 2022 13:31:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1BB40CF8EA;
 Thu,  4 Aug 2022 13:31:09 +0000 (UTC)
Date: Thu, 4 Aug 2022 14:31:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pc: add property for Linux setup_data seed
Message-ID: <YuvKGrUsSAzQEzfL@redhat.com>
References: <20220804131320.395015-1-pbonzini@redhat.com>
 <YuvHu3NW592rGFXz@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YuvHu3NW592rGFXz@zx2c4.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 03:20:59PM +0200, Jason A. Donenfeld wrote:
> On Thu, Aug 04, 2022 at 03:13:20PM +0200, Paolo Bonzini wrote:
> > Using a property makes it possible to use the normal compat property
> > mechanism instead of ad hoc code; it avoids parameter proliferation
> > in x86_load_linux; and allows shipping the code even if it is
> > disabled by default.
> 
> Strong NACK from me here.
> 
> If this kind of thing is off by default, it's as good as useless. Indeed
> it shouldn't even be a knob at all. Don't do this.

You're misunderstanding the patch. This remains on by default for
 the 7.1 machine type.

The patch is merely exposing a knob so that users can override the
built-in default if they need to. Imagine if we had shipped this
existing code before today's bugs were discovered.  The knob
proposed her would allow users to turn off the broken pieces.
This is a good thing.

> Rather, let's fix the bug. The code as-is -- going back to the 2016 DTB
> addition -- is problematic and needs to be fixed. So let's fix that.
> Trying to cover up the problem with a default-off knob just ensures this
> stuff will never be made to work right.

It isn't covering up the problem, just providing a workaround
option, should another bug be discovered after release. We
still need to fix current discussed problems of course.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


