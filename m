Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D664EBA3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:56:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AEV-0006br-Ln; Fri, 16 Dec 2022 07:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AET-0006bi-PX
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:54:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AER-0004sX-Mm
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671195270;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYtQ8QdY6koiNfAx+55IabgAezcHGkkzI/iNBF8ArGE=;
 b=VliJAwjKU134FYuCmEqRN/dcV9MgxdME5Kz1u7vphFbT5Ro/fboCai4b/HzObz1J7ntIqA
 FBzCppU9vtQ6DgxHR5L/hiK7McNic6sfJX+eAseNc0sKf0aR7KU7yg2yP1RZgVYTr2wk5+
 c8pULYKXjOr6ZJka6Gb0oIL/3H0kICU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-ZvUqsy6eM5WMUweAwlIUeA-1; Fri, 16 Dec 2022 07:54:28 -0500
X-MC-Unique: ZvUqsy6eM5WMUweAwlIUeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87BD3281DE77;
 Fri, 16 Dec 2022 12:54:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0A0F2026D68;
 Fri, 16 Dec 2022 12:54:27 +0000 (UTC)
Date: Fri, 16 Dec 2022 12:54:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: jejb@linux.ibm.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Message-ID: <Y5xqgK8UXe28VZQ2@redhat.com>
References: <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Fri, Dec 16, 2022 at 07:28:59AM -0500, Stefan Berger wrote:
> 
> 
> On 12/16/22 05:27, Daniel P. Berrangé wrote:
> > On Thu, Dec 15, 2022 at 03:53:43PM -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 12/15/22 15:30, James Bottomley wrote:
> > > > On Thu, 2022-12-15 at 15:22 -0500, Stefan Berger wrote:
> > > > > On 12/15/22 15:07, James Bottomley wrote:
> > > > [...]
> > > > > > don't really have much interest in the migration use case, but I
> > > > > > knew it should work like the passthrough case, so that's what I
> > > > > > tested.
> > > > > 
> > > > > I think your device needs to block migrations since it doesn't handle
> > > > > all migration scenarios correctly.
> > > > 
> > > > Passthrough doesn't block migrations either, presumably because it can
> > > > also be made to work if you know what you're doing.  I might not be
> > > 
> > > Don't compare it to passthrough, compare it to swtpm. It should
> > > have at least the same features as swtpm or be better, otherwise
> > > I don't see why we need to have the backend device in the upstream
> > > repo.
> > 
> > James has explained multiple times that mssim is a beneficial
> > thing to support, given that it is the reference implementation
> > of TPM2. Requiring the same or greater features than swtpm is
> > an unreasonable thing to demand.
> 
> Nevertheless it needs documentation and has to handle migration
> scenarios either via a blocker or it has to handle them all
> correctly. Since it's supposed to be a TPM running remote you
> had asked for TLS support iirc.

If the mssim implmentation doesn't provide TLS itself, then I don't
consider that a blocker on the QEMU side, merely a nice-to-have.

With swtpm the control channel is being used to load and store state
during the migration dance. This makes the use of an external process
largely transparent to the user, since QEMU handles all the state
save/load as part of its migration data stream.

With mssim there is state save/load co-ordination with QEMU. Instead
whomever/whatever is managing the mssim instance, is responsible for
ensuring it is running with the correct state at the time QEMU does
a vmstate load. If doing a live migration this co-ordination is trivial
if you just use the same mssim instance for both src/dst to connect to.

If doing save/store to disk, the user needs to be able to save the mssim
state and load it again later. If doing snapshots and reverting to old
snapshots, then again whomever manages mssim needs to be keeping saved
TPM state corresponding to each QEMU snapshot saved, and picking the
right one when restoring to old snapshots.

QEMU exposes enough functionality to enable a mgmt app / admin user to
achieve all of this.

This is not as seemlessly integrated with swtpm is, but it is still
technically posssible todo the right thing with migration from QEMU's
POV. Whether or not the app/person managing mssim instance actually
does the right thing in practice is not a concern of QEMU. I don't
see a need for a migration blocker here.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


