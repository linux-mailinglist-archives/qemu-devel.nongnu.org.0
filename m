Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8AE6CDBC0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:14:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phWXz-0003sK-8F; Wed, 29 Mar 2023 10:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phWXx-0003qf-G1
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phWXv-00036Y-BP
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680099182;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+NOoL+vvM0CsAifaYlrbWjSuJMDbomlaQkGj5eyki4=;
 b=O9a235JjIAnU7eQ4+ONRx7mQ9U5HJPKsoIUqcp4PbXGsBXc1UbeXF2kocS9q8WAgZgWbN8
 pF6aWiVdwWJUwLmFrLocrC2uq49kXIB5Ga08VqU+6kH9N6V3nvAhLPcIAkHo4yn+k2jzAP
 cKdvnSff93T9l9pp9d8C77R0WJpQzkQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-MF0hklOrOf2_OC7awH6Jrg-1; Wed, 29 Mar 2023 10:13:00 -0400
X-MC-Unique: MF0hklOrOf2_OC7awH6Jrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66223381459A;
 Wed, 29 Mar 2023 14:13:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98559202701F;
 Wed, 29 Mar 2023 14:12:59 +0000 (UTC)
Date: Wed, 29 Mar 2023 15:12:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andreas Schwab <schwab@suse.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] linux-user: preserve incoming order of environment
 variables in the target
Message-ID: <ZCRHaFl2QyyUzC7m@redhat.com>
References: <mvmy1nfslvi.fsf@suse.de> <ZCREaEiPyzYogkFj@redhat.com>
 <mvmtty3slfo.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mvmtty3slfo.fsf@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Mar 29, 2023 at 04:04:43PM +0200, Andreas Schwab wrote:
> On Mär 29 2023, Daniel P. Berrangé wrote:
> 
> > On Wed, Mar 29, 2023 at 03:55:13PM +0200, Andreas Schwab wrote:
> >> Do not reverse the order of environment variables in the target environ
> >> array relative to the incoming environ order.  Some testsuites depend on a
> >> specific order, even though it is not defined by any standard.
> >> 
> >> Signed-off-by: Andreas Schwab <schwab@suse.de>
> >> ---
> >>  linux-user/main.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >
> > bsd-user/main.c appears to have an identical code pattern that
> > will need the same fix
> 
> Yes, but I cannot test it, so I like to let someone else produce the
> patch.

The code in this case is 100% identical, so I think it is
reasonable to expect that patch to cover both of them
regardless.

In terms of testing we don't require the contributors to test
all platform combinations affected. Our FreeBSD CI jobs will
test the build of bsd-user.

If so desired though, any contributor can easily test BSD changes
too via our VM infra. eg  "make vm-build-freebsd" (see make vm-help
for further options)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


