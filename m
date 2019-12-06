Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186E1154D3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:05:13 +0100 (CET)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idG6R-0004yZ-JC
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1idEzo-0001iz-Mv
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:54:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1idEzn-0007Kh-Gc
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:54:16 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:55579)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1idEzk-0006hA-78; Fri, 06 Dec 2019 09:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=k6q+2o4+lM6yctv77wzTQ0J5WUB8aHRa+UMT/ybXOiw=; 
 b=ds428P5iAf5JuR5BwQ5xjqrbfgKWxUS+yUsLZGC3CxOFUWqxphXyEUVhSjEcF4Zv2/97ukKeonaPevtlEQewa4WBZXNxHGBjUdyy4vmPFtsEXqB3RDIYDVT2rRwRY1NEjmYnZktCDRiK62b1c54Vl6rxtBycxmYjX+bT8La4d+N6IyVxweEVR7dUC719n6IRRdEWC9HQYUFiPIVG6h2DyukekVTJ28a9h1GIx+dpaFC9U9LVxfdgLUdIeQoPV0ShLHz6n64nAfXNXPGcZwnbFttHG5bJwJ37CzhziQitqih3Sxa+JIEhYvhYfDn9P5ZbL/JzOqV0mW3UMYET1EfELA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1idEDY-0006X9-KH; Fri, 06 Dec 2019 15:04:24 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1idEDY-0006z0-HR; Fri, 06 Dec 2019 15:04:24 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH for-5.0 v2 02/23] blockdev: Allow resizing everywhere
In-Reply-To: <20191111160216.197086-3-mreitz@redhat.com>
References: <20191111160216.197086-1-mreitz@redhat.com>
 <20191111160216.197086-3-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 06 Dec 2019 15:04:24 +0100
Message-ID: <w51pnh1czyv.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 11 Nov 2019 05:01:55 PM CET, Max Reitz wrote:
> @@ -3177,11 +3177,6 @@ void qmp_block_resize(bool has_device, const char *device,
>      aio_context = bdrv_get_aio_context(bs);
>      aio_context_acquire(aio_context);
>  
> -    if (!bdrv_is_first_non_filter(bs)) {
> -        error_setg(errp, QERR_FEATURE_DISABLED, "resize");
> -        goto out;
> -    }
> -

What happens with this case now?

https://lists.gnu.org/archive/html/qemu-block/2019-11/msg00793.html

Berto

