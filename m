Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F132B430C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:43:03 +0100 (CET)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecuU-00079C-EI
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kectc-0006iI-6K
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:42:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kecta-0004v3-3h
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605526924;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJtkWemkGZqctRIYrBl8wHCoWl4uqgM7kcWh3eyBlCI=;
 b=LOtviOZQAJi4hIrtPz0Yd0TfuuaBFp+0sk0poJ1JTv2gQadHCSinp5ReqB/t8swzSJ3riv
 zpiaoCYlRArhqD+HHFMqNFH1xMmybNxvSh/WRY0S4OUnmT6wjq4thTs36OGIi+3tkgWj8U
 d6RenAn8ME3pGakC8kCz/LFus8LE7+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-abhuaWHzO6eegW7PiBvnrw-1; Mon, 16 Nov 2020 06:41:49 -0500
X-MC-Unique: abhuaWHzO6eegW7PiBvnrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C09BE5F9C0;
 Mon, 16 Nov 2020 11:41:47 +0000 (UTC)
Received: from redhat.com (ovpn-114-241.ams2.redhat.com [10.36.114.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F57E5D9CC;
 Mon, 16 Nov 2020 11:41:27 +0000 (UTC)
Date: Mon, 16 Nov 2020 11:41:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116114125.GE104771@redhat.com>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
 <20201116111524.GD96297@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201116111524.GD96297@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 11:15:24AM +0000, Stefan Hajnoczi wrote:
> On Wed, Nov 11, 2020 at 03:48:50PM +0000, Daniel P. Berrangé wrote:
> > On Wed, Nov 11, 2020 at 02:36:15PM +0000, Stefan Hajnoczi wrote:
> > > On Tue, Nov 10, 2020 at 12:12:31PM +0100, Paolo Bonzini wrote:
> > > > On 10/11/20 10:53, Stefan Hajnoczi wrote:
> > > Yes, the current syntax supports sparse ranges and multiple ranges.
> > > 
> > > The trade-off is that a tool cannot validate inputs beforehand. You need
> > > to instantiate the device to see if it accepts your inputs. This is not
> > > great for management tools because they cannot select a destination
> > > device if they don't know which exact values are supported.
> > > 
> > > Daniel Berrange raised this requirement in a previous revision, so I
> > > wonder what his thoughts are?
> > 
> > In terms of validation I can't help but feel the whole proposal is
> > really very complicated.
> > 
> > In validating QEMU migration compatibility we merely compare the
> > versioned machine type.
> 
> Thinking more about this, maybe the big picture is:
> 
> Today the managment tool controls the variables in the migration (the
> device configuration). It has knowledge of the VMM, can set a machine
> type, apply a device configuration on top, and then migrate safely.
> 
> VFIO changes this model because VMMs and management tools do not have
> knowledge of specific device implementations. The device implementation
> is a new source of variables in the migration and the management tool no
> longer has the full picture.

This is not all that different from what we have today. eg QEMU exposes
several 100 devices impls, each with countless properties. Mgmt tools
like libvirt, or OpenStack/oVirt above don't support all these device
impls, nor do they support all the properties.

IOW, in many cases no configuration is exposed for many of the device
tunables, mgmt tools just rely on the machine type defaults for the
majority of them, and only do tuning for a relatively small subset.

So the machine type acts as a simplifying layer for the mgmt app,
enabling them to safely ignore majority of tunables, and only focus
on the small number of tunables they actually care about changing
or setting.

> I'm trying to define a standard interface for exposing migration
> compatibility information from device implementations to management
> tools, and a general algorithm that management tools can use without
> knowledge of specific device implementations.

For a given type of device I expect there would be some core set of
config parameters that would have to be common to any impl, plus
some set of config params that are specific to just one impl.

If the mgmt app only cares about the core set of config params, then
we should ensure that they can do migration compatibility checks without
needing to care about all the extra irrelevant config params.

If apps want to use some parameters that are custom to specific dev
impls, then they'll have to have logic to expose those params, and
also logic to validate them on migration - if they are frontend ABI
sensitive config parameters, as opposed to backend only.

> It is possible to simplify the problem, but we'll lose freedom. For
> example, hard coding knowledge of the device implementation into the
> management tool eliminates the need for a general migration checking
> algorithm. Or we might be able to simplify it by explicitly not
> supporting cross-device implementation migration (although that would
> place stricter rules on what a new version of an existing device can
> change in order to preserve migration compatibility).

Is migrating between 2 different vendors' impls of the same core
device spec really a thing that's needed ? 

> I have doubts that these trade-offs can be made without losing support
> for use cases that are necessary.

From my POV, the key goal is that it should be possible to migrate
between two hosts without needing to check every single possible
config parameter that the device supports. It should only be neccessary
to check the parameters that are actually changed from their default
values. Then there just needs to be some simple string parameter that
encodes a particular set of devices, akin to the versioned machine
type.

Applications that want to migration between cross-vendor device impls
could opt-in to checking every single little parameter, but most can
just stick with a much simplified view where they only have to check
the parameters that they've actually overriden/exposed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


