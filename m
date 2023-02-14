Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B85E696225
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtGV-0004Bm-9N; Tue, 14 Feb 2023 06:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRtGS-000490-1v
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:14:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRtGQ-0000p7-E1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373261;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0t73WoejjRtjvFnvBJ75/pnm4kAN1KlPaj75+3UFD0=;
 b=K2u3rfVPegeavvV71flrrvkeY3mgKNd2Q6HwOHrluLEKiY3bbxZVgJn3jsO8A5faY+rGeJ
 42I92kQs6KqK4GPWBXyVyqILdSKstg7JqsBwjIvsQUdP8VTceWlaH6JJJX8EofNrksnvmk
 rMmrEr9bY3DGy8tkzT0TARaHs5itDi0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-IdnOnruZMZqYENdgaWb29w-1; Tue, 14 Feb 2023 06:14:19 -0500
X-MC-Unique: IdnOnruZMZqYENdgaWb29w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D41BC3C0252A;
 Tue, 14 Feb 2023 11:14:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C22462026D4B;
 Tue, 14 Feb 2023 11:14:16 +0000 (UTC)
Date: Tue, 14 Feb 2023 11:14:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, eduardo@habkost.net,
 antonkuchin@yandex-team.ru, philmd@linaro.org, mst@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 den-plotnikov@yandex-team.ru, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, eblake@redhat.com
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Message-ID: <Y+ttBkTvDv1T7qi1@redhat.com>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+tTgpoz/o0nDu9r@angien.pipo.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+tTgpoz/o0nDu9r@angien.pipo.sk>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Tue, Feb 14, 2023 at 10:25:22AM +0100, Peter Krempa wrote:
> On Tue, Feb 14, 2023 at 09:54:22 +0100, Markus Armbruster wrote:
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> > 
> > > On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > >> The device field is redundant, because QOM path always include device
> > >> ID when this ID exist.
> > >
> > > The flipside to that view is that applications configuring QEMU are
> > > specifying the device ID for -device (CLI) / device_add (QMP) and
> > > not the QOM path. IOW, the device ID is the more interesting field
> > > than QOM path, so feels like the wrong one to be dropping.
> > 
> > QOM path is a reliable way to identify a device.  Device ID isn't:
> > devices need not have one.  Therefore, dropping the QOM path would be
> > wrong.
> > 
> > > Is there any real benefit to dropping this ? 
> > 
> > The device ID is a trap for the unwary: relying on it is fine until you
> > run into a scenario where you have to deal with devices lacking IDs.
> 
> Note that libvirt's code is still using the 'device' bit rather than QOM
> path and the fix might not be entirely trivial although should not be
> too hard.

What's the documented way to construct a QOM path, given only an ID  as
input ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


