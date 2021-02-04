Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9230F002
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:56:25 +0100 (CET)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bNA-0001I5-Dl
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bJu-0007is-29
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:53:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bJs-0005nT-8u
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432379;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9tAkjk8CKXBxsCTpiJSWlNw5mbiJ+c2doexbNrv4YKQ=;
 b=UInIQPcWPcG5KwEXq4fybkG+QUWiiCriMN4DBfH2wLRCIh5ahDUspchQRwIYTjVYHc3ayQ
 llq1rcFZhsBKHnF4tLzrTho0zl22A9/WqBCkQXGq5MRjnBEybdANMyGsTaIv2FK/Ei4T0z
 LCWi4FNOTxmkeghBwiWyXPSxPUSgPrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-VdxhkDBlOU-rwhcRtBEQSw-1; Thu, 04 Feb 2021 04:52:44 -0500
X-MC-Unique: VdxhkDBlOU-rwhcRtBEQSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 055696D51E;
 Thu,  4 Feb 2021 09:52:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-169.ams2.redhat.com [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D50D60CA0;
 Thu,  4 Feb 2021 09:51:48 +0000 (UTC)
Date: Thu, 4 Feb 2021 09:51:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH v21 00/20] Initial support for multi-process Qemu
Message-ID: <20210204095145.GC549438@redhat.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
 <20210203161150.GA241524@stefanha-x1.localdomain>
 <20210203200205.GA29182@flaka>
MIME-Version: 1.0
In-Reply-To: <20210203200205.GA29182@flaka>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, quintela@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, thanos.makatos@nutanix.com,
 kwolf@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 12:02:05PM -0800, Elena Ufimtseva wrote:
> On Wed, Feb 03, 2021 at 04:11:50PM +0000, Stefan Hajnoczi wrote:
> > On Fri, Jan 29, 2021 at 11:46:01AM -0500, Jagannathan Raman wrote:
> > > This is the v21 of the patchset. This version has the following changes:
> > 
> > The docs/multi-process.rst file caused Sphinx to fail with "document
> > isn't included in any toctree". I moved it into the system emulator
> > documentation to resolve this. The new path is
> > docs/system/multi-process.rst.
> >
> 
> Hi Stefan
> 
> Ah, we did not --enable-docs and .travis.yml also disables them.
> Will include into the tests we do for submission.

FWIW if you're relying on travis for testing before submission that's
something you'll want to change real soon. Travis has discontinued its
free service and turned it into a one time free trial. So all QEMU
primary CI is moving to GitLab CI now and we'll be deleting remaining
travis CI jobs any day now.  All you need todo is have a fork of the
main qemu repo on gitlab, and when you push to your forkk the CI
pipeline will run in GitLab.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


