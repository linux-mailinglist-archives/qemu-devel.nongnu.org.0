Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8C3A688C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:55:15 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsn3a-0001Ht-Es
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsn1g-0006iI-0n
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsn1Y-0004Yu-6J
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623678786;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lsHRSJ+gL3+riZRpmb2xmKtu18EhuCxeI7YCQMWv5Fw=;
 b=at7+OtQ100NM4FMb2tAl+kCl1ilgA9q5YiK30H+MwtOWfB63xgTfE9gWYYm3R231yQXM2l
 lcPtCFRrFDsZOFsNzd0nsQr0U+4moukZTobVhkfpw4DRtZMDKrhAVIk3n4cT0EhEoD2sJB
 QniOm0M8sayJgEkN6+vxZm2XNgf0ViY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-dM18bJGfPduB8htcpq1VKQ-1; Mon, 14 Jun 2021 09:52:53 -0400
X-MC-Unique: dM18bJGfPduB8htcpq1VKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A20612D0;
 Mon, 14 Jun 2021 13:52:51 +0000 (UTC)
Received: from redhat.com (ovpn-115-55.ams2.redhat.com [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B86665D6DC;
 Mon, 14 Jun 2021 13:52:33 +0000 (UTC)
Date: Mon, 14 Jun 2021 14:52:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 17/18] modules: check arch and block load on mismatch
Message-ID: <YMdfHmsY6+cXKkyV@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-18-kraxel@redhat.com>
 <YMIHDKEGQWKtwEU5@redhat.com>
 <20210610125721.b27j6raf4h3qujt3@sirius.home.kraxel.org>
 <YMIOQNXkOoFekp8p@redhat.com>
 <20210610140354.egrgtwa5r5yxei3f@sirius.home.kraxel.org>
 <b3d35127-6ef3-2e2e-0341-a0076a499559@suse.de>
 <20210614134453.sgbezze6z223n4rk@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210614134453.sgbezze6z223n4rk@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 03:44:53PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > We can do both.  The file is generated and installed as part of the
> > > build/install process, and it can be simply used as-is even if some of
> > > the modules are missing.
> > > 
> > > It's also possible to update the modinfo.json file in postinstall /
> > > postuninstall by simply running qemu-modinfo, so only the modules
> > > actually installed are listed there.
> > 
> > I fail to see why that extra complication is needed at all.
> > 
> > Why don't we just build the modules for the targets we intend to build,
> > and install them as .so files in a target arch directory?
> 
> There is more meta-data we need for modules:  Which QOM types are
> implemented by which module (for on-demand loading), dependencies
> between modules and also which command line options (aka QemuOpts)
> are handled by which modules.
> 
> Possibly more in the future, maybe we'll support modules registering
> monitor commands dynamically some day (like usb-host implementing
> "info usbhost" or tcg implementing "info jit" + "info opcount") and
> we'd like store that information in the module database too.
> 
> If we have such a module database anyway it IMHO makes alot of sense
> to simply store the target arch there too instead of using something
> else.
> 
> > What problem is the json solving?
> 
> Well, the goal is to store meta-data about modules, in a way which:
> 
>   (a) Doesn't require manually maintained lists.  This is what we have
>       right now (arrays in utils/module.c).  Works ok-ish for a small
>       number of modules, but becomes increasingly problematic with the
>       growing number of modules.
>   (b) Doesn't require opening each individual module on each qemu run
>       to get the information.
> 
> I'm not particularly attached to using json for that, it is just that
> we already have infrastructure to parse/serialize structs from/to json
> because we need that for qapi anyway.

If we can generate json, we could generate .c code which has all the
data statically declared and just link it in to QEMU. If we don't need
ability to update the metadata post-build then it would be equivalent
functionally.  If we need to be able to update the metadata to precisely
matcch the set of installed modules though, then a separate json file
looks best.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


