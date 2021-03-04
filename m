Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E732D51F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:19:23 +0100 (CET)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHooz-00033B-UA
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHooA-0002cd-PJ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:18:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHoo7-00023P-2A
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614867505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrQHmqkj379yXGkWwI6BwUwL1O4qPAsJ7/OYeYwaiYc=;
 b=C2otv0BZlT5UKqN87ogLEiIU1cxuqHAbNOg8PjZCS0fQU3/gyeGzkjP2QYbsBFfZE9mJ49
 lKvIA3Wpw5wkNqWmpjD8yy6PxRjjCOy6Olvfnq+iCO5+3N/9nodfvWxZTAJAz5ZDuMVi/7
 4RcgETDs3hn6ViMuiL54y1RGu9iRgdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-gDKhtyd_P7qn53UU57K9JA-1; Thu, 04 Mar 2021 09:18:21 -0500
X-MC-Unique: gDKhtyd_P7qn53UU57K9JA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8292A57;
 Thu,  4 Mar 2021 14:18:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF82C226E9;
 Thu,  4 Mar 2021 14:18:15 +0000 (UTC)
Date: Thu, 4 Mar 2021 14:18:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] docker: Base Fedora MinGW cross containers on the base
 Fedora image
Message-ID: <YEDsJUKudKJvZA7K@redhat.com>
References: <20210303124222.1485332-1-philmd@redhat.com>
 <YD+FJarhR1yTWI0G@redhat.com>
 <138832dc-9340-2a9f-1dc8-b20cc0637c5e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <138832dc-9340-2a9f-1dc8-b20cc0637c5e@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 03:00:04PM +0100, Philippe Mathieu-Daudé wrote:
> On 3/3/21 1:46 PM, Daniel P. Berrangé wrote:
> > On Wed, Mar 03, 2021 at 01:42:22PM +0100, Philippe Mathieu-Daudé wrote:
> >> The only difference between fedora-winXX-cross.docker and
> >> fedora.docker is the specific QEMU_CONFIGURE_OPTS environment
> >> variable. All the rest can be inherited from the generic Fedora
> >> image.
> > 
> > This is relying on the base Fedora image already having the
> > mingw packages installed. My series to automate creation of
> > the container dockerfiles removes those entirely, so we have
> > strictly separate native and mingw images for Fedora:
> > 
> >   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03123.html
> 
> I'm a bit confused. So instead of having one single big image,
> you prefer to have multiple ones.
> 
> I stopped using the fedora-winXX-cross because they lacks ccache,
> and the "big" fedora image contains the mingwXX toolchains.
> 
> I'll wait you respin your series and test the new created containers
> to see if they fit my needs.

ccache will be present in any of the containers I auto-generate for
QEMU using lcitool, as I agree its a very useful part o fthe toolchain.
So when i convert the winXXX-cross containers, they'll gain ccache
(and alot of other missing mingw pieces)


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


