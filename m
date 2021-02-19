Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8731F69C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:37:05 +0100 (CET)
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2Dg-0005dT-2y
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD2CU-0005D6-3i
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD2CQ-0003Pw-Nz
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613727344;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2hHtMHAdW4jmq4cmfY5XTkniC9n8xuU8oVFAaVqcv4=;
 b=apByw1G/RxyAT8A+y8f6tfl3+QB6Y2U4Us0wQSNrRcYwPmnVUjAtr2wZqgVtRVIpewVU/1
 vNLGTNyogGcSILu4qweu+Z2xa+2MX0oCNxcu541FDzohMSm9LqN2Zfr9eNDq5knzCYBngC
 ErB7yfScpZbDN3UqeretvwigGXWMM7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-Ry-81WYLNOe_tfb1ruVEEA-1; Fri, 19 Feb 2021 04:35:37 -0500
X-MC-Unique: Ry-81WYLNOe_tfb1ruVEEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B907210082F6;
 Fri, 19 Feb 2021 09:35:36 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7AB0627DC;
 Fri, 19 Feb 2021 09:35:31 +0000 (UTC)
Date: Fri, 19 Feb 2021 09:35:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
Message-ID: <YC+GYaEq0RyK6+a1@redhat.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210209093201-mutt-send-email-mst@kernel.org>
 <20210209145105.GP1166421@redhat.com>
 <20210209095553-mutt-send-email-mst@kernel.org>
 <0890bb17-9677-ff1d-bd08-c9be791e1c81@redhat.com>
 <YC4056X5BJLPCECM@redhat.com>
 <CAOEp5Od4hkJx1J4jLGk7=o2GBkEX=PCqFNcZNeGdSMQtSDJ08Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5Od4hkJx1J4jLGk7=o2GBkEX=PCqFNcZNeGdSMQtSDJ08Q@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Yan Vugenfirer <yan@daynix.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 09:55:25PM +0200, Yuri Benditovich wrote:
> On Thu, Feb 18, 2021 at 11:35 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Wed, Feb 10, 2021 at 02:19:59PM +0800, Jason Wang wrote:
> > >
> > > On 2021/2/9 下午11:04, Michael S. Tsirkin wrote:
> > > > On Tue, Feb 09, 2021 at 02:51:05PM +0000, Daniel P. Berrangé wrote:
> > > > > On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin wrote:
> > > > > > On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
> > > > > > > This set of patches introduces graceful switch from tap-vhost to
> > > > > > > tap-no-vhost depending on guest features. Before that the
> > features
> > > > > > > that vhost does not support were silently cleared in
> > get_features.
> > > > > > > This creates potential problem of migration from the machine
> > where
> > > > > > > some of virtio-net features are supported by the vhost kernel to
> > the
> > > > > > > machine where they are not supported (packed ring as an example).
> > > > > > I still worry that adding new features will silently disable vhost
> > for people.
> > > > > > Can we limit the change to when a VM is migrated in?
> > > > > Some management applications expect bi-directional live migration to
> > > > > work, so taking specific actions on incoming migration only feels
> > > > > dangerous.
> > > > Could you be more specific?
> > > >
> > > > Bi-directional migration is currently broken
> > > > when migrating new kernel->old kernel.
> > > >
> > > > This seems to be the motivation for this patch, though I wish
> > > > it was spelled out more explicitly.
> > > >
> > > > People don't complain much, but I'm fine with fixing that
> > > > with a userspace fallback.
> > > >
> > > >
> > > > I'd rather not force the fallback on others though: vhost is generally
> > > > specified explicitly by user while features are generally set
> > > > automatically, so this patch will make us override what user specified,
> > > > not nice.
> > > >
> > > >
> > > > > IMHO if the features we're adding cannot be expected to exist in
> > > > > host kernels in general, then the feature should defualt to off
> > > > > and require explicit user config to enable.
> > > > > Downstream distros which can guarantee newer kernels can flip the
> > > > > default in their custom machine types if they desire.
> > > > >
> > > > > Regards,
> > > > > Daniel
> > > > Unfortunately that will basically mean we are stuck with no new
> > features
> > > > for years. We did what this patch is trying to change for years now, in
> > > > particular KVM also seems to happily disable CPU features not supported
> > > > by kernel so I wonder why we can't keep doing it, with tweaks for some
> > > > corner cases.
> > >
> > >
> > > It's probably not the corner case.
> > >
> > > So my understanding is when a feature is turned on via command line, it
> > > should not be cleared silently otherwise we may break migration for sure.
> > >
> > > E.g when packed=on is specified, we should disable vhost instead of
> > clear it
> > > from the device.
> >
> > If something is explicitly turned on by the user, they expect that feature
> > to be honoured, or an error to be raised.
> >
> > If something is not explicitly turned on by the user, the behaviour wrt the
> > default should be stable for any given machine type version.
> >
> > IOW, if you disable vhost by default when packed=on is set, then you can't
> > later switch to letting vhost be enabled with packed=on, unless you tie
> > that change to a new machine type.
> >
> > If the user has explicitly said  packed=on *and* vhost=on, then should
> > must honour that, or raise an error if the combination is unsupportable.
> > Silently disabling vhost, then vhost=on is not ok.
> >
> 
> If I'm not mistaken:
> Inside qemu there is no possibility to determine whether the user
> explicitly turned vhost on.
> For qemu the vhost is off by default but libvirt creates a new profile with
> vhost on.

Yes, libvirt will always attempt to enable vhost if it is present on te
host with /dev/vhost-net, except where the user explicitly told us not
to.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


