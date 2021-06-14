Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74663A6853
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:46:47 +0200 (CEST)
Received: from localhost ([::1]:39824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsmvO-0001Ab-Ei
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lsmu1-0000DR-RR
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lsmty-0000Yw-Hd
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623678310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1eo4rsGHTbXXlLroSpE8MytA+wdQSr8A6ExsnU2OCm4=;
 b=EKwek8+sWXyo7KEOkWd4t9lWoBC4uWeHnK/UklgCHhnFCC/ZYtJ40OJ1Hi6awR8LJ9/UaO
 nEanQdImklU6Gg0oknaIvuQTqucwVGMjs04rlA/NLWh8ZL6oJi59D8P+aA4zYCka1klyNi
 5GJLSP2xpnsFeAc7NJ6yJohhFuBSyKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-d13xCUIDO-Gnjvr_LAy5Vw-1; Mon, 14 Jun 2021 09:45:08 -0400
X-MC-Unique: d13xCUIDO-Gnjvr_LAy5Vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C16988015D0;
 Mon, 14 Jun 2021 13:45:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C99C160C0F;
 Mon, 14 Jun 2021 13:44:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1CD0318000B2; Mon, 14 Jun 2021 15:44:53 +0200 (CEST)
Date: Mon, 14 Jun 2021 15:44:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 17/18] modules: check arch and block load on mismatch
Message-ID: <20210614134453.sgbezze6z223n4rk@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-18-kraxel@redhat.com>
 <YMIHDKEGQWKtwEU5@redhat.com>
 <20210610125721.b27j6raf4h3qujt3@sirius.home.kraxel.org>
 <YMIOQNXkOoFekp8p@redhat.com>
 <20210610140354.egrgtwa5r5yxei3f@sirius.home.kraxel.org>
 <b3d35127-6ef3-2e2e-0341-a0076a499559@suse.de>
MIME-Version: 1.0
In-Reply-To: <b3d35127-6ef3-2e2e-0341-a0076a499559@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > We can do both.  The file is generated and installed as part of the
> > build/install process, and it can be simply used as-is even if some of
> > the modules are missing.
> > 
> > It's also possible to update the modinfo.json file in postinstall /
> > postuninstall by simply running qemu-modinfo, so only the modules
> > actually installed are listed there.
> 
> I fail to see why that extra complication is needed at all.
> 
> Why don't we just build the modules for the targets we intend to build,
> and install them as .so files in a target arch directory?

There is more meta-data we need for modules:  Which QOM types are
implemented by which module (for on-demand loading), dependencies
between modules and also which command line options (aka QemuOpts)
are handled by which modules.

Possibly more in the future, maybe we'll support modules registering
monitor commands dynamically some day (like usb-host implementing
"info usbhost" or tcg implementing "info jit" + "info opcount") and
we'd like store that information in the module database too.

If we have such a module database anyway it IMHO makes alot of sense
to simply store the target arch there too instead of using something
else.

> What problem is the json solving?

Well, the goal is to store meta-data about modules, in a way which:

  (a) Doesn't require manually maintained lists.  This is what we have
      right now (arrays in utils/module.c).  Works ok-ish for a small
      number of modules, but becomes increasingly problematic with the
      growing number of modules.
  (b) Doesn't require opening each individual module on each qemu run
      to get the information.

I'm not particularly attached to using json for that, it is just that
we already have infrastructure to parse/serialize structs from/to json
because we need that for qapi anyway.

take care,
  Gerd


