Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0761B7C99
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 19:23:18 +0200 (CEST)
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS22n-00021Y-8L
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 13:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jS21W-0001A9-4m
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 13:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jS21U-0002hA-Td
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 13:21:57 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:33035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jS21U-0002Fr-0O; Fri, 24 Apr 2020 13:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Cx1Zpq9FEvOUOdhUVFMMIUOsBY7ZAMQu5HSDdJdQvgo=; 
 b=RjI9Qf7QfTqdT8l2Z1sFTLdk3t1Wmv7p642vlcADPoZ25NrbBg0jD0jxHUJti5VPupJFCDw9HDm/3UwXodzz+SEyoTt9H9qNGKZR54uI1yiny9g4KiWBDLybq3/vbf7aYOwGMbuGRgJu1trSHcrmix4cF6ql1SumT4SljILr0BtimtFx24rk9pNCHGnvzZKqEhLX1ZMp/d2ZPfydGRgY2xQ3IUd/c4XYQCs6oijhd0UMq5gNN3odQU0oT+UQVFdXI9XXbd6WqAee+DKE6hCJEVZ6S+yLX62ZEjx4UnxcP28hhILr8ny84BNd+M7VOj5Ny2HFGZhRq+pd321u+o78Cw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jS21O-0003aX-0x; Fri, 24 Apr 2020 19:21:50 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jS21N-0002iq-Nw; Fri, 24 Apr 2020 19:21:49 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 24/30] qcow2: Clear the L2 bitmap when allocating a
 compressed cluster
In-Reply-To: <1606ecb5-98ea-fefb-bb98-2ecda1d65f5c@redhat.com>
References: <cover.1584468723.git.berto@igalia.com>
 <6d596d82ed62615a8565b661691a06bfaf32237e.1584468723.git.berto@igalia.com>
 <w51r1wcn7eu.fsf@maestria.local.igalia.com>
 <1606ecb5-98ea-fefb-bb98-2ecda1d65f5c@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 24 Apr 2020 19:21:49 +0200
Message-ID: <w51o8rgn6j6.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 13:02:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 24 Apr 2020 07:11:08 PM CEST, Eric Blake <eblake@redhat.com> wrote:
>> 'write -c 0 64k' followed by 'write -z 16k 16k' would not need to do any
>> copy on write. The compressed data would remain untouched on disk but
>> some of the subclusters would have the 'all zeroes' bit set, exactly
>> like what happens with normal clusters.
>
> It's a special case that avoids COW for write zeroes, but not for
> anything else. The moment you write any data (whether to the
> zero-above-compressed or the regular compressed portion), the entire
> cluster has to be rewritten.

That's right but you can still write zeroes without having to rewrite
anything, and read back the zeroes without having to decompress the
data.

> at the same time, I can see where you're coming from in stating that
> if it makes management of extended L2 easier to allow zero subclusters
> on top of a compressed cluster, then there's no reason to forbid it.

I'm not sure if it makes it easier. Some operations are definitely going
to be easier but maybe we have to add and handle _ZERO_COMPRESSED in
addition to _ZERO_PLAIN and _ZERO_ALLOC (the same for unallocated
subclusters). Or maybe replace QCow2SubclusterType with something
else. I need to evaluate that.

Berto

