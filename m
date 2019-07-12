Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5F66ABE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 12:09:50 +0200 (CEST)
Received: from localhost ([::1]:47910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlsUv-0007MW-8A
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 06:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hlsUi-0006wE-L8
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hlsUh-0000e7-DM
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:09:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50880)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hlsUh-0000bx-7w
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:09:35 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26904308AA11;
 Fri, 12 Jul 2019 10:09:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 923D51001B12;
 Fri, 12 Jul 2019 10:09:30 +0000 (UTC)
Date: Fri, 12 Jul 2019 11:09:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190712100927.GL5068@redhat.com>
References: <20190710202219.25939-1-brijesh.singh@amd.com>
 <20190710202219.25939-9-brijesh.singh@amd.com>
 <20190712100022.GC2730@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190712100022.GC2730@work-vm>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 12 Jul 2019 10:09:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 08/13] misc.json: add
 migrate-set-sev-info command
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
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 12, 2019 at 11:00:22AM +0100, Dr. David Alan Gilbert wrote:
> * Singh, Brijesh (brijesh.singh@amd.com) wrote:
> > The command can be used by the hypervisor to specify the target Platform
> > Diffie-Hellman key (PDH) and certificate chain before starting the SEV
> > guest migration. The values passed through the command will be used while
> > creating the outgoing encryption context.
> > 
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> 
> I'm wondering if it would make sense to have these as migration
> parameters rather than using a new command.
> You could just use string parameters.
> (cc'ing Eric and Daniel for interface suggestions)

Either option would be fine from libvirt's POV I believe. On balance it is
probably slightly easier to deal with migration parameters, since libvirt
already has code for setting many such params.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

