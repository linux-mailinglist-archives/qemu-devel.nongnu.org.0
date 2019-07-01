Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BC84C6E1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 07:47:53 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdpvL-0004H6-6T
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 01:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hdpqQ-0003lt-Gy
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 01:42:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hdpqP-00057C-9r
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 01:42:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hdpqH-0004nu-Ha; Thu, 20 Jun 2019 01:42:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BD873001A66;
 Thu, 20 Jun 2019 05:42:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A97B45DA5B;
 Thu, 20 Jun 2019 05:42:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7557B16E19; Thu, 20 Jun 2019 07:42:24 +0200 (CEST)
Date: Thu, 20 Jun 2019 07:42:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Eiderman <shmuel.eiderman@oracle.com>
Message-ID: <20190620054224.hfspxgorpd6mjxca@sirius.home.kraxel.org>
References: <20190619092352.23583-1-shmuel.eiderman@oracle.com>
 <20190619092352.23583-5-shmuel.eiderman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619092352.23583-5-shmuel.eiderman@oracle.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 20 Jun 2019 05:42:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [SeaBIOS] [PATCH v3 4/4] geometry: Apply LCHS
 values for boot devices
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, arbel.moshe@oracle.com,
 seabios@seabios.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kevin@koconnor.net, liran.alon@oracle.com, karl.heubaum@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +static int
> +overriden_lchs_supplied(struct drive_s *drive)
> +{
> +    return drive->lchs.cylinder || drive->lchs.head || drive->lchs.sector;
> +}

> +    case TRANSLATION_MACHINE:

Hmm, why this name?  Doesn't look intuitive to me.

> +        desc = "overriden";

I'd name that "host-supplied" or "fw-cfg".

> +        cylinders = drive->lchs.cylinder;
> +        heads = drive->lchs.head;
> +        if (heads > 255)
> +            heads = 255;

I suggest to move these sanity checks to overriden_lchs_supplied(), then
ignore the override altogether when heads or sectors is out of range
instead of trying to fixup things.

The other patches look all sane to me.

cheers,
  Gerd


