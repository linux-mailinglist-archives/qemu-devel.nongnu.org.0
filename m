Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE7623F65
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4R6-0002Oc-PP; Thu, 10 Nov 2022 05:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ot4R3-0002OF-Qe
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:05:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ot4R1-0004Y7-TE
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668074723;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lF/g+Q6YWL6nd5o1iF9ARYMzfPToen/Bov8npDn2S8=;
 b=QovOgDojrnuIRjkGA4GPXRtBWpDg2vTh4VMgHBBjPFKjykuNZh15umIJ2IXbBiaVfxllY8
 rMowbjNLuodbc7BK4w4jAGOATn/pN1gSutrP3qLipi6Go6zhTlAz37GpKSJewm1AkTP/tf
 hHPgn/B7LRTG8BK0biz4q8GK803n4OM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-_GXYJR-zOYKTAXIFMA8fVg-1; Thu, 10 Nov 2022 05:05:21 -0500
X-MC-Unique: _GXYJR-zOYKTAXIFMA8fVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73427800B30;
 Thu, 10 Nov 2022 10:05:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA431415114;
 Thu, 10 Nov 2022 10:05:20 +0000 (UTC)
Date: Thu, 10 Nov 2022 10:05:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
Message-ID: <Y2zM3RvoD9IXyMKF@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
 <87wn83jr54.fsf@pond.sub.org>
 <cee224a9-b107-9bf1-66d5-b631d5a88345@redhat.com>
 <208d1191-6852-c74c-2a06-d65a6a657f4d@linaro.org>
 <0b29d9e3-9ce2-633c-1d73-cb5b0b9105ee@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b29d9e3-9ce2-633c-1d73-cb5b0b9105ee@redhat.com>
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

On Thu, Nov 10, 2022 at 10:57:27AM +0100, Thomas Huth wrote:
> On 10/11/2022 10.49, Philippe Mathieu-Daudé wrote:
> > On 10/11/22 09:35, Thomas Huth wrote:
> > > On 10/11/2022 06.49, Markus Armbruster wrote:
> > > > Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> > > > 
> > > > > On 9/11/22 18:37, Thomas Huth wrote:
> > > > > > If configuring with "--disable-system --disable-user --enable-guest-agent"
> > > > > > the linking currently fails with:
> > > > > > 
> > > > > > qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
> > > > > > build/../../home/thuth/devel/qemu/qga/commands.c:70:
> > > > > > undefined reference to `qmp_command_name'
> > 
> > > > > > Let's make sure that we also compile and link the required files if
> > > > > > the system emulators have not been enabled.
> > > > > > 
> > > > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > > 
> > > > I wonder for how long this has been broken.
> > > > 
> > > > Should we add such a configuration to CI?
> > > 
> > > Some month ago, I'd say: Sure! ... but considering that gitlab now
> > > limits the available CI minutes and that apparently nobody really
> > > cares about this configuration (otherwise someone would have
> > > complained about this earlier), I think it's not that important to
> > > have a separate CI test for this configuration.
> > 
> > We could eventually add a job restricted to qemu-project CI (not in
> > forks).
> 
> The problem is: Who's going to create such jobs? Someone needs to write the
> yaml stuff and test it first. And at least I pretty much lost motivation to
> work on new yaml stuff, since this burns my private CI minutes (which I
> rather need for my maintainer duties instead).

Top tip: if you're working on GitLab CI changes, create a separate
QEMU fork in a different namespace for your adhoc testing, separate
from your normal maintainer work.

CI minutes are limited per namespace, ie group or user account, and
AFAIK, there is no limit on the number of groups you can create.

eg, create a group called /thuth-ci, and fork QEMU into that and
you've doubled the number of CI minutes available, so you can afford
to mess around with CI changes and not risk ability to do your other
normal work.

Now of course this ability to create many groups can be abused and
I expect GitLab would take a dim view of such abuse. So I would only
use this creation of extra groups for this very specific use case of
needing to battle test CI YAML changes.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


