Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A882C1B7E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 08:38:10 +0200 (CEST)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEpJw-0002nW-GV
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 02:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iEpIU-00026a-0y
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 02:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iEpIR-00080E-Cn
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 02:36:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iEpIR-0007ze-7O
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 02:36:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2B7A18C426C;
 Mon, 30 Sep 2019 06:36:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ADA05C219;
 Mon, 30 Sep 2019 06:36:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B508716E05; Mon, 30 Sep 2019 08:36:31 +0200 (CEST)
Date: Mon, 30 Sep 2019 08:36:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Subject: Re: [PATCH v4 21/24] paaudio: channel-map option
Message-ID: <20190930063631.64lhsey62dwlnyrz@sirius.home.kraxel.org>
References: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
 <8f650662fd6cc50baaede260581aeb560eed44fb.1568927990.git.DirtY.iCE.hu@gmail.com>
 <87o8zbma1m.fsf@dusky.pond.sub.org>
 <55ea6ac9-9651-e322-fd84-22b4bedb3a93@gmail.com>
 <87impgy3hw.fsf@dusky.pond.sub.org>
 <20190925141331.kjxraaw3ijzkbiq4@sirius.home.kraxel.org>
 <a32c555d-9315-7c3d-e7be-d196ad3dd0b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a32c555d-9315-7c3d-e7be-d196ad3dd0b1@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 30 Sep 2019 06:36:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> vs surround-50).  IIRC I originally added this feature because USB audio and
> pulseaudio didn't agree about the order of channels, for example in 5.1 pa
> defaults to left,right,rear-left,rear-right,front-center,lfe while USB audio
> expects left,right,center,lfe,rear-left,rear-right order. You can't specify
> this with the well-known names.

Shouldn't backend and frontend be able to negotiate a channel map
without user invention?

Initially, with only usb-audio supporting 5.1/7.1 we can simply declare
the usb-audio channel map as the one which is used.  When other devices
are added some day (hda-surround?) we might need a ctl function so the
frontend can set the channel map (similar to the way volume is handled
today).

cheers,
  Gerd


