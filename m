Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92A57B513
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:07:01 +0200 (CEST)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE7Xg-0007UI-7T
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE7W0-0005tf-JA
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE7Vx-0005ng-8Y
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658315112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrGB2GYqPrFqmCIqeCqe2CtZ0UQ1ZDy47874LHaFdKo=;
 b=hy5FgGuYkgcVaPoqmWD5FcKsbotCMigpCUV/NJQZPmaX6xbbtaWXqVh4hzZOjECfETIg01
 SExOfxLJRDr/sDkcO/SujMN3/y/tNq5FIhme6ZS1RFYMrLpMnckwMxoqg77b9TLboUeWtF
 OIG0EWLi6CWJPhKqoOgD49jjyjrRZJ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-UkM0ikq3PPW8kkRKPWB_0Q-1; Wed, 20 Jul 2022 07:05:02 -0400
X-MC-Unique: UkM0ikq3PPW8kkRKPWB_0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85C24185A7B2;
 Wed, 20 Jul 2022 11:05:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF83FC15D67;
 Wed, 20 Jul 2022 11:05:00 +0000 (UTC)
Date: Wed, 20 Jul 2022 12:04:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <YtfhWgayuGKNVjGq@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtfgQN+BQ8Egn0ha@rvkaganb>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 02:00:16PM +0300, Roman Kagan wrote:
> On Wed, Jul 20, 2022 at 11:44:26AM +0100, Daniel P. Berrangé wrote:
> > On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote:
> > > It's possible to create non-working configurations by attaching a device
> > > to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> > > specifying a slot number other that zero, e.g.:
> > > 
> > >     -device pcie-root-port,id=s0,... \
> > >     -device virtio-blk-pci,bus=s0,addr=4,...
> > > 
> > > Make QEMU reject such configurations and only allow addr=0 on the
> > > secondary bus of a PCIe slot.
> > 
> > What do you mean by 'non-working' in this case.  The guest OS boots
> > OK, but I indeed don't see the device in the guest, but IIUC it was
> > said that was just because Linux doesn't scan for a non-zero slot.
> 
> Right.  I don't remember if it was Linux or firmware or both but indeed
> at least Linux guests don't see devices if attached to a PCIe slot at
> addr != 0.  (Which is kinda natural for a thing called "slot", isn't it?)

I vaguely recall there was an option to tell linux to scan all slots,
not just slot 0, not sure if that's applicable here.

> 
> > That wouldn't be a broken config from QEMU's POV though, merely a
> > guest OS limitation ?
> 
> Strictly speaking it wouldn't, indeed.  But we've had created such a
> configuration (due to a bug in our management layer) and spent
> non-negligible time trying to figure out why the attached device didn't
> appear in the guest.  So I thought it made sense to reject a
> configuration which is known to confuse guests.  Doesn't it?

If a configuration is a permissible per the hardware design / spec, then
QEMU should generally allow it.  We don't want to constrain host side
configs based on the current limitations of guest OS whose behaviour can
change over time, or where a different guest OS may have a different POV.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


