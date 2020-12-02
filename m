Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1988E2CBB42
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:10:52 +0100 (CET)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQ25-0000Yi-EZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkPTe-00024e-Jx
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:35:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkPTa-00016W-3i
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606905308;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6FNw8ZXMvzG4FYYN9Eqyd5K4oozoHU9dG0QGcyXlz4=;
 b=PL8J1ZPmsJaz0QLr0BnHLtKPeuu13u2f4fJPEkpTxmzv6OlMR5PAzJ9s/c1Oki1XrgvDWz
 XIfUNIClL/mowDUretw8ThEGt8to1xFHsvRUmxU+j3yE0fXJO4agTkv3jKEQwS2l7BjEWF
 Nd+GZ9xa94EuE5UDD0J0TTRvNm7CCiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-fuavLcUpNlObnP0ObXRrNA-1; Wed, 02 Dec 2020 05:35:07 -0500
X-MC-Unique: fuavLcUpNlObnP0ObXRrNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB681074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 10:35:06 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA49C60BFA;
 Wed,  2 Dec 2020 10:35:01 +0000 (UTC)
Date: Wed, 2 Dec 2020 10:34:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201202103457.GB2360260@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
 <20201202050918-mutt-send-email-mst@kernel.org>
 <20201202102718.GA2360260@redhat.com>
 <20201202053111-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201202053111-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 05:31:50AM -0500, Michael S. Tsirkin wrote:
> On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. BerrangÃ© wrote:
> > On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> > > > If we have a paused guest, it can't unplug the network VF device, so
> > > > we wait there forever.  Just change the code to give one error on that
> > > > case.
> > > > 
> > > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > 
> > > It's certainly possible but it's management that created
> > > this situation after all - why do we bother to enforce
> > > a policy? It is possible that management will unpause immediately
> > > afterwards and everything will proceed smoothly.
> > > 
> > > Yes migration will not happen until guest is
> > > unpaused but the same it true of e.g. a guest that is stuck
> > > because of a bug.
> > 
> > That's pretty different behaviour from how migration normally handles
> > a paused guest, which is that it is guaranteed to complete the migration
> > in as short a time as network bandwidth allows.
> > 
> > Just ignoring the situation I think will lead to surprise apps / admins,
> > because the person/entity invoking the migration is not likely to have
> > checked wether this particular guest uses net failover or not before
> > invoking - they'll just be expecting a paused migration to run fast and
> > be guaranteed to complete.
>
> Okay I guess. But then shouldn't we handle the reverse situation too:
> pausing guest after migration started but before device was
> unplugged?

Yeah we likely want todo something there.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


