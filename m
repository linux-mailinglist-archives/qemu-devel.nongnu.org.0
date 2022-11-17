Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4362DBEF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 13:50:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oveKQ-0005VU-Je; Thu, 17 Nov 2022 07:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oveKK-0005Uc-8i
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oveKI-0007oy-K7
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668689346;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SOMRD+u0F6y3B8+Y8cqOvzN3Oi/P17JwkeGdIg7jU/k=;
 b=JWHiZPhBG/PAUTIZTgknMhhS0YZlEY9ApE7AUIr3s5Rgk6lrTSSfQuP1TA40lpxenbGen/
 BNX02GooIPbqOX6E2NELQxC0Esqk2fN++XVvraoy4szYQHYLaxDbFbT3Bby0OBhv2EwNdQ
 hRjTYgyM+lY9+t/GZPYwcjmP0Ha2etk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-i4s8SFQRNzeW-w3weyNXkw-1; Thu, 17 Nov 2022 07:49:04 -0500
X-MC-Unique: i4s8SFQRNzeW-w3weyNXkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CE8229DD992;
 Thu, 17 Nov 2022 12:49:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 558B918EB4;
 Thu, 17 Nov 2022 12:49:02 +0000 (UTC)
Date: Thu, 17 Nov 2022 12:48:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <ORO@il.ibm.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Danny Harnik <DANNYH@il.ibm.com>, "idryomov@gmail.com" <idryomov@gmail.com>
Subject: Re: [PATCH v3] block/rbd: Add support for layered encryption
Message-ID: <Y3YtuDXUxdQhq73r@redhat.com>
References: <20221115122527.2896476-1-oro@il.ibm.com>
 <Y3PQj/MBztn8SobQ@redhat.com>
 <MN2PR15MB34886DD5A9D0F5D64A248AA08A079@MN2PR15MB3488.namprd15.prod.outlook.com>
 <Y3S6OGqGFovAyRWw@redhat.com> <Y3TGO6AEAAOux8FH@redhat.com>
 <MN2PR15MB3488DA644C772F708108977E8A069@MN2PR15MB3488.namprd15.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR15MB3488DA644C772F708108977E8A069@MN2PR15MB3488.namprd15.prod.outlook.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Thu, Nov 17, 2022 at 12:42:04PM +0000, Or Ozeri wrote:
> 
> 
> > -----Original Message-----
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > Sent: 16 November 2022 13:15
> > To: Or Ozeri <ORO@il.ibm.com>; qemu-devel@nongnu.org; qemu-
> > block@nongnu.org; Danny Harnik <DANNYH@il.ibm.com>;
> > idryomov@gmail.com
> > Subject: [EXTERNAL] Re: [PATCH v3] block/rbd: Add support for layered
> > encryption
> > 
> > On Wed, Nov 16, 2022 at 10:23:52AM +0000, Daniel P. Berrangé wrote:
> > 
> > So with that precedent I guess it is ok to add 'luks-any'.
> > 
> 
> So is it OK to leave the "luks-any" changes to this commit?
> If not, is it ok to split this to 2 commits, in the same "patch-series"?

It is conceptually separate from the layered encryption so
should be a separate commit, in a series.

> BTW is there a possibility this will actually make it to 7.2?

QEMU is in freeze now, which means we only take bug fixes, not
new features, until 8.0 opens up after release. It is fine to
send patches, as the maintainer can queue them until the tree
opens.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


