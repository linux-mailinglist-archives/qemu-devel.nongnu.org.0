Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF532830B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:07:53 +0100 (CET)
Received: from localhost ([::1]:58688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGl5M-0005ov-Ol
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGl4b-0005M0-Hs
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGl4Y-0001ps-Gc
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614614821;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbyFDJEDdQ/7KjVU6x/2FKWXcstShEThs+7DuTD1W9s=;
 b=bViX4PJNsqhBaoquYaqlVTkLCD6e+e3EocXcRvkqKvFMNGYdfGcCaV2CoIyi9JZqwMJaGl
 wBO3gaERcgc4hswiWJH6i3UAh8nfBheoc+qmkhtNHET20jAJ1SYKWf62Rp9eMdxFevfEDQ
 k+5RjAfxqaeagZkfWJTSztgBnP5r/lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-XI13_YTPOZ67mk5VRZ81Fw-1; Mon, 01 Mar 2021 11:06:58 -0500
X-MC-Unique: XI13_YTPOZ67mk5VRZ81Fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28819107ACE3;
 Mon,  1 Mar 2021 16:06:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 248B810013D7;
 Mon,  1 Mar 2021 16:06:50 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:06:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] docs: show how to spawn qemu-storage-daemon with fd
 passing
Message-ID: <YD0RF+PJwLRv2ULo@redhat.com>
References: <20210301153159.35660-1-stefanha@redhat.com>
 <YD0LQ3fDG6t2VRG4@redhat.com>
 <5b86b310-8e3b-8bb6-365c-a73b0f2843be@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5b86b310-8e3b-8bb6-365c-a73b0f2843be@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 09:49:21AM -0600, Eric Blake wrote:
> On 3/1/21 9:41 AM, Daniel P. Berrangé wrote:
> > On Mon, Mar 01, 2021 at 03:31:59PM +0000, Stefan Hajnoczi wrote:
> >> The QMP monitor, NBD server, and vhost-user-blk export all support file
> >> descriptor passing. This is a useful technique because it allows the
> >> parent process to spawn and wait for qemu-storage-daemon without busy
> >> waiting, which may delay startup due to arbitrary sleep() calls.
> >>
> >> This Python example is inspired by the test case written for libnbd by
> >> Richard W.M. Jones <rjones@redhat.com>:
> >> https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314ba75c1cbe07a04543
> >>
> >> Thanks to Daniel P. Berrangé <berrange@redhat.com> for suggestions on
> >> how to get this working. Now let's document it!
> >>
> 
> >> +  sock_path = '/tmp/qmp-{}.sock'.format(os.getpid())
> > 
> > Example code inevitably gets cut+paste into real world apps, and this
> > example is a tmpfile CVE flaw. At least put it in $CWD instead.
> 
> Except $CWD may be too long for a sock file name to be created.
> Creating the sock in a securely-created subdirectory of /tmp is more
> reliable.

$XDG_RUNTIME_DIR then, which is /run/user/$UID, so safely per user on all
modern OS.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


