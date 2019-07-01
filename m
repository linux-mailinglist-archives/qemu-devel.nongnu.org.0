Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94966174D5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 11:16:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOIgr-0004lC-Bf
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 05:16:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hOIfl-0004Ps-Ij
	for qemu-devel@nongnu.org; Wed, 08 May 2019 05:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hOIfj-0006Mm-Jd
	for qemu-devel@nongnu.org; Wed, 08 May 2019 05:15:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hOIfh-000673-Qw
	for qemu-devel@nongnu.org; Wed, 08 May 2019 05:15:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F98A37E88;
	Wed,  8 May 2019 09:15:22 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF56B1A267;
	Wed,  8 May 2019 09:15:21 +0000 (UTC)
Date: Wed, 8 May 2019 10:15:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: S KH <sgh8183@gmail.com>
Message-ID: <20190508091519.GD32552@redhat.com>
References: <CAE519-=VsRtsLhd9T-RWSV-29yGz_0Zp7-TdMfXKcrV1wN0GWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE519-=VsRtsLhd9T-RWSV-29yGz_0Zp7-TdMfXKcrV1wN0GWg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 08 May 2019 09:15:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Question in QEMU : The result of printf does not
 appear in the qemu VM's log.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 08, 2019 at 10:51:00AM +0900, S KH wrote:
> Hello.
> 
> I'am student studying QEMU hypervisor and SPICE.
> 
> In order to find out the calling order of functions in QEMU source, I input
> and compiled 'printf ("% s \ n", __ func__) "into source.

If using  printf() output is buffered so may not appear immediately in
the logs. For debugging it is best to use  g_printerr("%s\n", __func__)
which gets sent to stderr which is unbuffered so will appear immediately.

Of course the other possib8lity is that the code where you put ehe
printf statements is not being invoked by the tests you're trying.
 
> And when I run the VM and open 'domain_name.log' in '/ var / log / libvirt
> / qemu', I see that no output from printf is displayed.

The log file libvirt creates will capture both stdout & stderr.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

