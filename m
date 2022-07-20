Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65C57B4F7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:03:02 +0200 (CEST)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE7To-0005X8-2B
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE7RP-0003vF-Ak
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:00:31 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:47910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oE7RL-00051o-Du
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:00:30 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 2D4E62E0E7D;
 Wed, 20 Jul 2022 14:00:19 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wpMt44tDjY-0HOqPnGh; Wed, 20 Jul 2022 11:00:18 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658314818; bh=XpmszliWJ7NkCnisG0QAFiXK30JqkpU2JJcQIKKtPHI=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=kawogI+JbtaXmsN8VhRLGuhk9vhTitJcQc5naXrfYJiov7KubcYBqFqYlyUxIQfGl
 xFvkjlQ6pTTfEpStvERnw7gbY/Ww0oH75JpdD3b6DM+DEPUzUupRMXx3nvQxMPwPI4
 jvkUcLY9JkW7A2KW/pKMwEXzVBzBrsmDZm0WuFo4=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Wed, 20 Jul 2022 14:00:16 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <YtfgQN+BQ8Egn0ha@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ytfcivbtj8+JnLfz@redhat.com>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 20, 2022 at 11:44:26AM +0100, Daniel P. Berrangé wrote:
> On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote:
> > It's possible to create non-working configurations by attaching a device
> > to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> > specifying a slot number other that zero, e.g.:
> > 
> >     -device pcie-root-port,id=s0,... \
> >     -device virtio-blk-pci,bus=s0,addr=4,...
> > 
> > Make QEMU reject such configurations and only allow addr=0 on the
> > secondary bus of a PCIe slot.
> 
> What do you mean by 'non-working' in this case.  The guest OS boots
> OK, but I indeed don't see the device in the guest, but IIUC it was
> said that was just because Linux doesn't scan for a non-zero slot.

Right.  I don't remember if it was Linux or firmware or both but indeed
at least Linux guests don't see devices if attached to a PCIe slot at
addr != 0.  (Which is kinda natural for a thing called "slot", isn't it?)

> That wouldn't be a broken config from QEMU's POV though, merely a
> guest OS limitation ?

Strictly speaking it wouldn't, indeed.  But we've had created such a
configuration (due to a bug in our management layer) and spent
non-negligible time trying to figure out why the attached device didn't
appear in the guest.  So I thought it made sense to reject a
configuration which is known to confuse guests.  Doesn't it?

Thanks,
Roman.

