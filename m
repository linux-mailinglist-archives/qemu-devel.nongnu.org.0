Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E6F7A24
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 18:45:33 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUDkq-0007TD-Cz
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 12:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liam.r.girdwood@linux.intel.com>) id 1iUBlJ-0002qo-Ey
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.r.girdwood@linux.intel.com>) id 1iUBlI-0005q8-D6
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:37:53 -0500
Received: from mga02.intel.com ([134.134.136.20]:62639)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.r.girdwood@linux.intel.com>)
 id 1iUBlI-0004dD-3W
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:37:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 07:36:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="215709477"
Received: from jlahtine-desk.ger.corp.intel.com ([10.252.20.50])
 by orsmga002.jf.intel.com with ESMTP; 11 Nov 2019 07:36:39 -0800
Message-ID: <c8a6b6f35664ce036c2a48ec41eab97b0f40704d.camel@linux.intel.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: David Stevens <stevensd@chromium.org>, Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 11 Nov 2019 15:36:38 +0000
In-Reply-To: <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <CAD=HUj41r8wHZ2-By8tLftkoqC5r_Bw=pr=zX2aZ7GTs1ESWhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
X-Mailman-Approved-At: Mon, 11 Nov 2019 12:43:55 -0500
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
Cc: geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
 Alex Lau <alexlau@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Alexandre Courbot <acourbot@chromium.org>, qemu-devel@nongnu.org,
 Tomasz Figa <tfiga@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Dylan Reid <dgreid@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Morozov <dmitry.morozov@opensynergy.com>,
 Pawel Osciak <posciak@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2019-11-11 at 12:04 +0900, David Stevens wrote:
> Having a centralized buffer allocator device is one way to deal with
> sharing buffers, since it gives a definitive buffer identifier that
> can be used by all drivers/devices to refer to the buffer. That being
> said, I think the device as proposed is insufficient, as such a
> centralized buffer allocator should probably be responsible for
> allocating all shared buffers, not just linear guest ram buffers.

This would work for audio. I need to be able to :-

1) Allocate buffers on guests that I can pass as SG physical pages to
DMA engine (via privileged VM driver) for audio data. Can be any memory
as long as it's DMA-able.

2) Export hardware mailbox memory (in a real device PCI BAR) as RO to
each guest to give guests low latency information on each audio stream.
To support use cases like voice calls, gaming, system notifications and
general audio processing.

Liam


