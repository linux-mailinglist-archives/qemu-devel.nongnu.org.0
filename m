Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E683FEFDC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:08:35 +0200 (CEST)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoKP-0007FQ-VJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLoJG-0006Vn-S1
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLoJD-0001uX-UG
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630595238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzFC7E0scrErxsummefD5a/ODmGZPeMbIcuaikFLTq0=;
 b=ZOqLwXuO4siCVFpeNq/d9Kc/23XILqI8wHpBldFH5Va5T4Jko2dJT4EW+cI4BJD6B6vo3f
 ATOHFr+TCMZlJv0iad+LzcdsN/1uGLaoI1jMwl82Y8K2YbNo7ERSbFpQDbykSQUd49dXx9
 qBvvIMEC+lfbCGVVT2eo2uwIEvRJOlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-v77wfMt7MK-uwqx0VcmSNA-1; Thu, 02 Sep 2021 11:07:11 -0400
X-MC-Unique: v77wfMt7MK-uwqx0VcmSNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83AB1DF8A3
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 15:07:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 234845D9DC;
 Thu,  2 Sep 2021 15:06:46 +0000 (UTC)
Date: Thu, 2 Sep 2021 16:06:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YTDohPo+srXco0pI@redhat.com>
References: <YSa7H3wGUHgccCrU@t490s> <YScPg0cYYGxxTz+b@xz-m1.local>
 <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s> <YTDXPB/t22lzRS/H@redhat.com>
 <YTDd31TI0fW83ND2@t490s>
MIME-Version: 1.0
In-Reply-To: <YTDd31TI0fW83ND2@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 10:21:19AM -0400, Peter Xu wrote:
> Hi, Dan,
> 
> On Thu, Sep 02, 2021 at 02:53:00PM +0100, Daniel P. Berrangé wrote:
> > The correct ordering of devices/backends is generally pretty obvious
> > for libvirt to determine. Most of the problems we've had related to
> > ordering are on the QEMU side, because the ARGV given to QEMU made
> > correct sense if parsed left-to-right, but QEMU didn't actually process
> > them in that order. We've patched QEMU to hack around its inability to
> > honour the CLI order repeatedly.
> 
> Is there a pointer to the problem?

The biggest problem was with -object, where some objects need to be
created before chardevs and some created after chardevs.
See object_create_early() method in softmmu/vl.c for the gross
hardcoded hacks


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


