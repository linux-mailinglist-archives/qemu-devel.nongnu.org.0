Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FF31652D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:27:31 +0100 (CET)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9neX-0000ap-C9
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9nZy-0005Il-2U
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:22:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9nZt-00082O-Mh
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612956157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVzi/OzAztI8eA/n62VEaKBtggWWiM/hB5FrsKf++HA=;
 b=IqhZOsQYYUZ/BslAYANM9raIkv9GGq29UhD7beQ/ADkMrnohRorxDfTHR8l3Lqi3TIJGg9
 /Z3myUruD/qcoPukvXMufZcQY2bmYtNacjaE5F/NmUB1BIuLiMzqPXWE7nfthSYX/t19md
 EMj+XtJDv5rBIGdJV2STSBEpQB3J+VM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-uyZnEiX3Moib6XnQRHWZbw-1; Wed, 10 Feb 2021 06:22:33 -0500
X-MC-Unique: uyZnEiX3Moib6XnQRHWZbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89C56195D563;
 Wed, 10 Feb 2021 11:22:31 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB38F1346F;
 Wed, 10 Feb 2021 11:22:27 +0000 (UTC)
Date: Wed, 10 Feb 2021 11:22:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
Message-ID: <20210210112219.GF1240644@redhat.com>
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
 <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
 <efffe227-472d-698d-d8f7-cc0bbd1800c0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <efffe227-472d-698d-d8f7-cc0bbd1800c0@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 12:15:45PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/10/21 12:12 PM, Philippe Mathieu-Daudé wrote:
> > Hi Bin,
> > 
> > On 2/10/21 11:23 AM, Bin Meng wrote:
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> >> Current QEMU HEAD nvme.c does not compile:
> >>
> >>   hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
> >>          ^
> >>   hw/block/nvme.c:3150:14: note: ‘result’ was declared here
> >>      uint32_t result;
> >>               ^
> > 
> > Why isn't this catched by our CI? What is your host OS? Fedora 33?
> 
> Just noticed v1 and Peter's explanation:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03528.html
> 
> Can you amend "default GCC 5.4 on a Ubuntu 16.04 host" information
> please?

Well Ubuntu 16.04 hasn't been considered a supported build target for
QEMU for a year now.

https://qemu.readthedocs.io/en/latest/system/build-platforms.html#linux-os-macos-freebsd-netbsd-openbsd

  "The project aims to support the most recent major version 
   at all times. Support for the previous major version will 
   be dropped 2 years after the new major version is released
   or when the vendor itself drops support, whichever comes 
   first."

IOW, we only aim for QEMU to be buildable on Ubuntu LTS 20.04 and 18.04
at this point in time.  16.04 is explicitly dropped and we will increasingly
introduce incompatibilities with it.

While this specific patch is simple, trying to keep QEMU git master
working on 16.04 is not a goal, so I'd really suggest upgrading to
a newer Ubuntu version at the soonest opportunity.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


