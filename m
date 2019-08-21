Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF99972B5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 08:43:09 +0200 (CEST)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0KKq-0001d5-Jk
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 02:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0KK5-0001DI-AO
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 02:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0KK4-0000DC-0T
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 02:42:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0KK3-0000C7-RC
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 02:42:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B6D23C050DEC;
 Wed, 21 Aug 2019 06:42:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8658F1001B14;
 Wed, 21 Aug 2019 06:42:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 54CCE16E1A; Wed, 21 Aug 2019 08:42:08 +0200 (CEST)
Date: Wed, 21 Aug 2019 08:42:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190821064208.eckikvttpdc3zjmd@sirius.home.kraxel.org>
References: <fccac7fa-888e-6ac5-458d-688808f3b282@redhat.com>
 <699eee57-3009-4160-a9a2-1070f92b9c20@redhat.com>
 <cc0b5a77-8bc4-070b-31e4-f29d5a174eb8@redhat.com>
 <7f6e8a5c-8262-ae39-333a-e8f18b3174f0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6e8a5c-8262-ae39-333a-e8f18b3174f0@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 21 Aug 2019 06:42:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Regression with floppy drive controller
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Alex <coderain@sdf.org>,
 seabios@seabios.org, QEMU Developers <qemu-devel@nongnu.org>,
 Nikolay Nikolov <nickysn@users.sourceforge.net>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Using the default QEMU config, we build SeaBIOS to use the TSC timer:
> 
> builds/seabios-128k/.config:CONFIG_TSC_TIMER=y
> builds/seabios-256k/.config:CONFIG_TSC_TIMER=y

> Do we need a cpu with TSC support to run SeaBIOS?

Hmm.  seabios uses pmtimer if available.  isapc has no pmtimer though,
so it uses TSC instead.

> So we should use '-cpu Conroe' or '-cpu core2duo' minimum?

-cpu Conroe for -M isapc is kida silly though ...

Maybe we should simply build seabios with CONFIG_TSC_TIMER=n ?

Using the TSC in a virtual machine is problematic anyway, the
calibration can be _way_ off on a loaded host, this is why seabios
prefers the (fixed frequency) pmtimer. 

cheers,
  Gerd


