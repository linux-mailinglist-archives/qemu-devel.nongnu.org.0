Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C3903EE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 16:26:31 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hydBW-0005Ji-MT
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 10:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1hydAH-0004MN-Rv
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 10:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hydAF-0007Bl-N2
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 10:25:13 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:48046)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hydAF-00078K-3A; Fri, 16 Aug 2019 10:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=q4OFt1ViQM7uZdTCoT+88SdefNYSKbMzgGZZCAcfodw=; 
 b=A7UTXNaU6QQqf765HphxLq4cK7vj04f6rXZ2QdwQu47uRFVGMYoe1vEM5HWLcIf7FTBtdyPdM7Apos2HeAyibuusLdJ767eh8UtCCucFlLwFZ/0tiqFh40fSrWPeT2bk+vrX1kIrCMICEBcfHMTtksNewykbaRDi6BKFuW4S14OBs1yLz0Ww4+ovc0FCwhvbl0b17PAJXDsuHlVPOkS2Yv7ZcySvP2Mjlb1bniQMpR08sP76B+JZ/IxFxw08EutJK3QXqkcuwuZaw6L/YUHzyKe9u4sLVadvRaAXKN8hZ+Qws5EpPMzu9L3LRKrBh8bNDTSlBf4lAM5zTfguhfxtrw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hydA9-000634-KJ; Fri, 16 Aug 2019 16:25:05 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hydA9-0007sP-Hb; Fri, 16 Aug 2019 16:25:05 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <20190816140819.GD5014@localhost.localdomain>
References: <20190816121742.29607-1-berto@igalia.com>
 <20190816125921.GC5014@localhost.localdomain>
 <w51lfvti6fs.fsf@maestria.local.igalia.com>
 <20190816140819.GD5014@localhost.localdomain>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 16 Aug 2019 16:25:05 +0200
Message-ID: <w51imqxi3we.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH] qcow2: Fix the calculation of the maximum
 L2 cache size
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
Cc: Leonid Bloch <lbloch@janustech.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 16 Aug 2019 04:08:19 PM CEST, Kevin Wolf wrote:
>> And yes, the odd value on the 512KB row on that we discussed last month
>> is due to this same bug:
>> 
>> https://lists.gnu.org/archive/html/qemu-block/2019-07/msg00496.html
>
> Hm... And suddently it makes sense. :-)
>
> So I assume all of 512k/1024k/2048k actually perform better? Or is the
> effect neglegible for 1024k/2048k?

The 512K case is the only one that performs better, my test image was
too small (40 GB) for the other cases.

Berto

