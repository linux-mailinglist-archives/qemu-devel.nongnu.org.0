Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F5696221
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtFl-0003dS-7Z; Tue, 14 Feb 2023 06:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRtFi-0003bz-Tn
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:13:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRtFh-0000h0-6p
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373215;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXwFBj/HzR52PAvN0xAEj0S7WcnTt/PF3jT+h9SB2i8=;
 b=R5bi2R4AxLGHbUQVlZXDn8UihAHeAEGv99+yvQYRhHfFZiZ+jQlNmQLvrHrDrLjUTsZok9
 3+ZrhWnpswba/OF3/Icya/KPG5fMiQH4umHmXj/KolB13tqn3Z78Bs5gL5ys8Z5Z0ojCPZ
 pKnizeFi4/ytaJ3t2k0shNUOL0B2fkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-OHbd2uiOPNauZAPKillnPg-1; Tue, 14 Feb 2023 06:13:31 -0500
X-MC-Unique: OHbd2uiOPNauZAPKillnPg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 366E985CCE0;
 Tue, 14 Feb 2023 11:13:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BACA492B03;
 Tue, 14 Feb 2023 11:13:29 +0000 (UTC)
Date: Tue, 14 Feb 2023 11:13:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 philmd@linaro.org, den-plotnikov@yandex-team.ru,
 antonkuchin@yandex-team.ru,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Message-ID: <Y+ts1vBvI+IEH//K@redhat.com>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bklwoce9.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Tue, Feb 14, 2023 at 09:54:22AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> >> The device field is redundant, because QOM path always include device
> >> ID when this ID exist.
> >
> > The flipside to that view is that applications configuring QEMU are
> > specifying the device ID for -device (CLI) / device_add (QMP) and
> > not the QOM path. IOW, the device ID is the more interesting field
> > than QOM path, so feels like the wrong one to be dropping.
> 
> QOM path is a reliable way to identify a device.  Device ID isn't:
> devices need not have one.  Therefore, dropping the QOM path would be
> wrong.
> 
> > Is there any real benefit to dropping this ? 
> 
> The device ID is a trap for the unwary: relying on it is fine until you
> run into a scenario where you have to deal with devices lacking IDs.

When a mgmt app is configuring QEMU though, it does it exclusively
with device ID values. If I add a device "-device foo,id=dev0",
and then later hot-unplug it "device_del dev0", it is pretty
reasonable to then expect that the DEVICE_DELETED even will then
include the ID value the app has been using elsewhere.

If the mgmt app is using IDs everywhere when dealing with a device,
then trap effectively doesn't exist for their usage scenario.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


