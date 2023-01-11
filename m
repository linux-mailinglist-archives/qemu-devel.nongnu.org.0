Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1BF66590B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:30:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFYMl-0000gY-3S; Wed, 11 Jan 2023 05:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFYMi-0000g7-5p
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFYMg-0006F2-Gv
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673432989;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24dQpGB/zj5ldZzXBlRRqmcJseRfP84GZpCxESBGsfA=;
 b=hJ8azaKYh74nhHssMXVKQ8ucun6aMKD1uKuKHAbOVSj/S3WYcawdBmFsUzaR+4GMvO36hm
 BBLh1GKh9zJ6pQOtUxA4NzaJR3w6xwuDMfdr0xQYo/pehxapW3Nmu6S2QpS1+K1pTt/RzS
 XTDVapACLimlggXHGIK9ywhW+eMcLuI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-8u8tJYzJP_WtyvjvCaaYJw-1; Wed, 11 Jan 2023 05:29:46 -0500
X-MC-Unique: 8u8tJYzJP_WtyvjvCaaYJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A1353C1014C;
 Wed, 11 Jan 2023 10:29:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AD87C15BA0;
 Wed, 11 Jan 2023 10:29:44 +0000 (UTC)
Date: Wed, 11 Jan 2023 10:29:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH 0/4] qom: Introduce object_class_property_deprecate()
Message-ID: <Y76PlQWd0PCvC7RS@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
 <Y71h8JAqYxeB2hPe@redhat.com>
 <53028cf2-0028-b810-348f-b17df33a8149@linaro.org>
 <Y76IdVNKyIBAZLrl@redhat.com>
 <9a3d8a73-9d41-8cb6-e271-7753347f238d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a3d8a73-9d41-8cb6-e271-7753347f238d@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jan 11, 2023 at 11:08:05AM +0100, Philippe Mathieu-Daudé wrote:
> On 11/1/23 10:59, Daniel P. Berrangé wrote:
> > On Wed, Jan 11, 2023 at 10:55:47AM +0100, Philippe Mathieu-Daudé wrote:
> > > On 10/1/23 14:02, Kevin Wolf wrote:
> > > > Am 09.01.2023 um 23:54 hat Philippe Mathieu-Daudé geschrieben:
> > > > > Hi,
> > > > > 
> > > > > There will always be a need to deprecate things. Here I'm
> > > > > tackling the QOM (class) properties, since they can be set
> > > > > from some CLI options (-object -device -global ...).
> > > > > 
> > > > > As an experiment, we add object_class_property_deprecate()
> > > > > to register a class property as deprecated (since some version),
> > > > > then we deprecate the TYPE_PFLASH_CFI02 'width' property, and
> > > > > finally as a bonus we emit a warning when the deprecation period
> > > > > is over, as a reminder. (For that we introduce few 'versions'
> > > > > helpers).
> > > > 
> > > > The last part means that increasing the version number (i.e. the commit
> > > > that opens the development tree for the next release) can change the
> > > > output, and this is turn can break test cases.
> > > > 
> > > > If we are happy to introduce breakage with a version number change that
> > > > will require future commits to open the development tree less trivial
> > > > than they are today because they need to fix the breakage, too, why not
> > > > make it a build error instead of a different warning message at runtime?
> > > 
> > > To avoid build breakages, maybe it is clever is to store the deprecation
> > > version in ObjectPropertyInfo and let QAPI inspection scripts enumerate
> > > / report deprecated features?
> > 
> > I don't think we want the version information in the code nor
> > introspectable at all.
> > 
> > We want applications to only apply logic based off features that are
> > actually available, not predicted future versions where something may
> > or may not be removed. This is why we exposed only a plain 'deprecated'
> > boolean field in QAPI schema for other deprecations.  This is just a
> > warning to be ready for something to change in future. If an application
> > has not been updated they are fine to carry on using the deprecated
> > feature. If an application has been updated, they should probe for
> > existance of the new feature and use that if available, in preference
> > to the deprecated feature. There's no reason for an application to
> > consider version numbers.
> 
> Right, but "applications" can also be developer scripts right? Not
> only user / sysadmin.
> 
> In particular, some HMP commands are only useful for developers, and
> they are implemented over QMP -> QAPI. So we already expose extra
> developer information via QAPI.

Sure, but I still don't think we should expose any version info there.
A deprecated feature isn't gone until it is gone. In the deprecations
doc we only mention the release where it is first deprecated, don't
explicitly state when it will be removed. The 2 cycle timeframe is
a minimum, not an exact removal date, so it would be misleading to
claim we'll remove things in exactly 2 cycles.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


