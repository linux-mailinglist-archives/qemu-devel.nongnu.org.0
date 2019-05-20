Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC2233BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 14:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hShGx-0008OY-ET
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 08:20:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hShFB-0007no-3j
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:18:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hShFA-00077J-AQ
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:18:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46531)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hShFA-000773-4u
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:18:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05A0B87638;
	Mon, 20 May 2019 12:18:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C52AD10027C3;
	Mon, 20 May 2019 12:18:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A9B5D11AB5; Mon, 20 May 2019 14:18:03 +0200 (CEST)
Date: Mon, 20 May 2019 14:18:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190520121803.gip6dk6xksfkquu7@sirius.home.kraxel.org>
References: <20190510104633.9428-1-kraxel@redhat.com>
	<20190510104633.9428-11-kraxel@redhat.com>
	<40966599-9a55-8078-bc49-e2597ce5d498@redhat.com>
	<20190520052615.ty2bpmxdoajjqvk6@sirius.home.kraxel.org>
	<84415abd-3066-90db-e10d-51f756aa6767@redhat.com>
	<94272c6c-c12a-5411-4981-332bdb37631b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94272c6c-c12a-5411-4981-332bdb37631b@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 20 May 2019 12:18:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 10/13] tests/vm: freebsd autoinstall,
 using serial console
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
	Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org,
	Kamil Rytarowski <kamil@netbsd.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I'd vote to keep the current approach to overwrite "freebsd.img". It's a
> > "cache" directory - if you want to have something persisten, Philippe, I
> > think you should simply copy your image to a different location instead.
> 
> My concern came when thinking about bisecting:

/me tricked make with "touch ~/.cache/qemu-vm/images/${name}.img" to
avoid image rebuilds while bisecting.

A bit hacky, but I think better than building fragile infrastructure
for rare usecases ...

cheers,
  Gerd


