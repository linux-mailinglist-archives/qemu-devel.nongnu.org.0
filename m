Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF657B60E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:02:26 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8PI-0007we-JJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE8Bg-0003oU-F8
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:48:20 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:45160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE8Bc-000515-Uq
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:48:18 -0400
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 17BEC2E1FED;
 Wed, 20 Jul 2022 14:48:10 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3OSjKNlrjS-m8PGSLwx; Wed, 20 Jul 2022 11:48:09 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658317689; bh=VOQhr/gGInTB1/MFRDqWAt7h1XCD2zQGlVRQU+AIcVw=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=NgnG9kSrfo+Y3fwsr+QdB2R3Q2naW2zKgqKFfDnESdWY9PY5aYndVcZ1nKg2D2Rag
 Tsg0cbhGQ0Bzp9xFnYf5xBX7y2526SLXtPhEP2OSTzK6QOzhgVadhLYcYbiwoIQ+yM
 oR4lx5hyiLMtgyr/maTkcBuP0o+FFnVcGu92YXNU=
Authentication-Results: vla5-d6d5ce7a4718.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Wed, 20 Jul 2022 14:48:07 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <Ytfrd9L88d16Fynr@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <YtfhWgayuGKNVjGq@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtfhWgayuGKNVjGq@redhat.com>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 12:04:58PM +0100, Daniel P. Berrangé wrote:
> On Wed, Jul 20, 2022 at 02:00:16PM +0300, Roman Kagan wrote:
> > On Wed, Jul 20, 2022 at 11:44:26AM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote:
> > > > It's possible to create non-working configurations by attaching a device
> > > > to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> > > > specifying a slot number other that zero, e.g.:
> > > 
> > > What do you mean by 'non-working' in this case.  The guest OS boots
> > > OK, but I indeed don't see the device in the guest, but IIUC it was
> > > said that was just because Linux doesn't scan for a non-zero slot.
> > 
> > Right.  I don't remember if it was Linux or firmware or both but indeed
> > at least Linux guests don't see devices if attached to a PCIe slot at
> > addr != 0.  (Which is kinda natural for a thing called "slot", isn't it?)
> 
> If a configuration is a permissible per the hardware design / spec, then
> QEMU should generally allow it.  We don't want to constrain host side
> configs based on the current limitations of guest OS whose behaviour can
> change over time, or where a different guest OS may have a different POV.

OK I'll try to find out if PCIe slot devices may allow addresses
different from zero.  If anybody can advise on this that would be much
appreciated.

Thanks,
Roman.

