Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143D2CD546
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:17:54 +0100 (CET)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknYX-00032u-9B
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kknXP-0002Yb-Fc
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kknXM-0004wP-JX
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606997799;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bxYYgHgg0XtLsCg9fWS+ePrcErrism2Dmqtwuo2d014=;
 b=W1CnAHIbMTvjtN0bShB/DNzLBhZK5LpKP93a3TVOO1aptlgKukFzZ8hTxz/cQbIxpo/wrH
 8XJG9CnYpEzQfEwEcnFH56fVsnh/jqyUHcn5+uofp9rWU/fkDNaScAxnTEivO7xBEYhZpH
 Ks86JaJFLgpPg+8bAqGZxK5H9C/lPTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-XQMr27HbPAOKXyIlljeGoQ-1; Thu, 03 Dec 2020 07:16:35 -0500
X-MC-Unique: XQMr27HbPAOKXyIlljeGoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C45D18797DD
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 12:16:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3B1E19C46;
 Thu,  3 Dec 2020 12:16:29 +0000 (UTC)
Date: Thu, 3 Dec 2020 12:16:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201203121624.GG2952498@redhat.com>
References: <20201202105515.GD2360260@redhat.com>
 <20201202061641-mutt-send-email-mst@kernel.org>
 <20201202112639.GE2360260@redhat.com>
 <20201202063656-mutt-send-email-mst@kernel.org>
 <20201202120121.GF2360260@redhat.com>
 <20201203061907-mutt-send-email-mst@kernel.org>
 <20201203113253.GD2952498@redhat.com>
 <20201203063452-mutt-send-email-mst@kernel.org>
 <20201203114341.GB2919@work-vm>
 <20201203070339-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201203070339-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 07:11:17AM -0500, Michael S. Tsirkin wrote:
> On Thu, Dec 03, 2020 at 11:43:41AM +0000, Dr. David Alan Gilbert wrote:
> > Another way to solve this would be to remove the unplugging from the
> > migration layer and leave it as a problem for the management layer to do
> > the unplug.
> 
> Daniel described the problem with modular management tools which expect
> pausing or slowing down guest to cause migration to converge.
> 
> Point is, it actually *will* make it converge but only if you
> pause it after unplug.
> 
> As it is, these tools fundamentally can not handle failover
> requiring guest cooperation. Moving code between layers won't help.
> Introducing failure modes as this patch does won't help either
> especially since Daniel wrote there are countless tools like this.
> We just break them all but have no resources to fix them,
> this does not help at all.
> 
> We can just leave the situation as is.
> 
> Or if we do want to be nice to these tools, how about we
> unpause the guest until unplug, then pause it again?
> This actually addresses the problem instead of
> shifting the blame, does it not?

This is a very bad idea because it changes the execution status of the
guest behind the apps/admins back, and that cannot be assumed to be a
safe thing todo.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


