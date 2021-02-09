Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC49315216
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:53:46 +0100 (CET)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UOf-0006xp-OT
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9UMP-000452-2H
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:51:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9UMK-0004wa-C7
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612882277;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hdnaq/RfX8NNYdWi1HE45nvRzF938LCti9KQAyhIyOo=;
 b=PrbJDkVHs0dWtqlW64NpylWC3h7ijv3m7g1gu5j2KxYBPNAOge2Ol1TuVbQ4usloMuX64C
 tri/bVsuAF9sBkZuR8KQrvYM5oL9mUb23PBsFuejdm2R7DJ3KxDgGrHEyXJAjd/FJsQX+4
 /32jY4E7YU6jXyPihmoZSueyWCGo70M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-hte23L7UP3uTUpVvXrFewA-1; Tue, 09 Feb 2021 09:51:13 -0500
X-MC-Unique: hte23L7UP3uTUpVvXrFewA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDF326D4E0;
 Tue,  9 Feb 2021 14:51:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76B8070471;
 Tue,  9 Feb 2021 14:51:08 +0000 (UTC)
Date: Tue, 9 Feb 2021 14:51:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
Message-ID: <20210209145105.GP1166421@redhat.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210209093201-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210209093201-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, Yuri Benditovich <yuri.benditovich@daynix.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin wrote:
> On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
> > This set of patches introduces graceful switch from tap-vhost to
> > tap-no-vhost depending on guest features. Before that the features
> > that vhost does not support were silently cleared in get_features.
> > This creates potential problem of migration from the machine where
> > some of virtio-net features are supported by the vhost kernel to the
> > machine where they are not supported (packed ring as an example).
> 
> I still worry that adding new features will silently disable vhost for people.
> Can we limit the change to when a VM is migrated in?

Some management applications expect bi-directional live migration to
work, so taking specific actions on incoming migration only feels
dangerous. 

IMHO if the features we're adding cannot be expected to exist in
host kernels in general, then the feature should defualt to off
and require explicit user config to enable.

Downstream distros which can guarantee newer kernels can flip the
default in their custom machine types if they desire.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


