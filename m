Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67CA64D914
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 10:53:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5kjX-0001Fj-EK; Thu, 15 Dec 2022 04:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5kjV-0001EE-SM
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:40:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5kjT-0003uI-Vx
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671097251;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T56j3PhLBWEdYwD+xkpLL8grjnpBlAROeBi86VUg9mA=;
 b=g72Pq3adDCmMEuNNgfFx8/Q+mbN+I2J7OaypDTajOhZ3iA7N8Qjn/c80ilmeLCPPWJ9rKd
 ffOwO2dMRZWHuxvr83cgjQrhMTnFjq6PvxnSul378kx9BAKhHF7b63grlMzlHi1XpkXvDO
 CGsvl/HTGcaTjAx8hmmf249Ijb5YB24=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-S8Zy2jHiN1SOj6vensFyKQ-1; Thu, 15 Dec 2022 04:40:47 -0500
X-MC-Unique: S8Zy2jHiN1SOj6vensFyKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32C5A85C6E6;
 Thu, 15 Dec 2022 09:40:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D48CC2026D68;
 Thu, 15 Dec 2022 09:40:45 +0000 (UTC)
Date: Thu, 15 Dec 2022 09:40:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/5] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y5rrmRyhRjEiHtAe@redhat.com>
References: <20221213213850.1481858-1-peterx@redhat.com>
 <20221213213850.1481858-2-peterx@redhat.com>
 <Y5mT4V3iYlcH56/H@redhat.com> <Y5pAiFv/JHQvgxha@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5pAiFv/JHQvgxha@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Wed, Dec 14, 2022 at 04:30:48PM -0500, Peter Xu wrote:
> On Wed, Dec 14, 2022 at 09:14:09AM +0000, Daniel P. Berrangé wrote:
> > On Tue, Dec 13, 2022 at 04:38:46PM -0500, Peter Xu wrote:
> > > From: "manish.mishra" <manish.mishra@nutanix.com>
> > > 
> > > MSG_PEEK reads from the peek of channel, The data is treated as
> > > unread and the next read shall still return this data. This
> > > support is currently added only for socket class. Extra parameter
> > > 'flags' is added to io_readv calls to pass extra read flags like
> > > MSG_PEEK.
> > > 
> > > Reviewed-by: Daniel P. Berrang?? <berrange@redhat.co
> > > Suggested-by: Daniel P. Berrang?? <berrange@redhat.com
> > 
> > The last letter of my name has been mangled - whatever tools used
> > to pull in manish's patches seem to not be UTF-8 clean.
> > 
> > Also the email addr isn't terminated, but that was pre-existing
> > in manish's previous posting.
> 
> I'll fix at least the latter in my next post, sorry.
> 
> For the 1st one - I am still looking at what went wrong.
> 
> Here from the web interfaces it all looks good (besides the wrong
> ending..), e.g. on lore or patchew:
> 
> https://lore.kernel.org/all/20221213213850.1481858-2-peterx@redhat.com/
> https://patchew.org/QEMU/20221213213850.1481858-1-peterx@redhat.com/20221213213850.1481858-2-peterx@redhat.com/
> 
> It also looks good with e.g. Gmail webclient.
> 
> Then I digged into the email headers and I found that comparing to Manish's
> original message, the patches I posted has one more line of "Content-type":
> 
>   Content-Type: text/plain; charset="utf-8"
>   Content-type: text/plain
>   https://patchew.org/QEMU/20221213213850.1481858-2-peterx@redhat.com/mbox
> 
> While Manish's patch only has one line:
> 
>   Content-Type: text/plain; charset="utf-8"
>   https://patchew.org/QEMU/20221123172735.25181-2-manish.mishra@nutanix.com/mbox

Don't trust what is shown by patchew, as that's been through many
hops.

The copy I receieved came directly to me via CC, so didn't hit mailman,
nor patchew, and that *only* has  "Content-type: text/plain".  So the
extra Content-type line with utf8 must have been added either by
mailman or patchew.

So it probably looks like a config problem in the tool you use to send
the patches originally.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


