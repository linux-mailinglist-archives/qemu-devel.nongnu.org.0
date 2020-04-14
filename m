Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0661A7AE3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 14:35:20 +0200 (CEST)
Received: from localhost ([::1]:59772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOKmd-0000lY-OV
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 08:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jOKlK-0008HT-VR
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jOKlJ-0001bv-UQ
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:33:58 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:43686)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jOKlJ-0001bR-DY; Tue, 14 Apr 2020 08:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=woZ74ZHuqjXIPXGAXK3DrAT2/QKm7IJRkZ0y6rGxAYQ=; 
 b=qL0uUcFPL67aweIRioRCxHrqamCf/8Bj90eRp8q4Ge3CtvR+HTUfvmUzE9N69YtIhQATdkwiZL9sDC+Erj3331kuu5gfHROmV9/wOlROLNnLIrwqCpSnNCcqKSFo9aOezm1/7Qg3RFihWtQH5dUkVXL06J79vG7xm5S48vgs2kXHJux4keT+O9C9PTPOzyfJU/C4Rj63iUIGc0ac8B1SIEHmEYe7ZjvNaQWLdP7qjdSAYrHfS/FWHMMv2hnae52mhdFkpt8soPYZkhK+SSOmWC3vyVeIUdZti+bv9rRa+B+a+4gsH1D+yB2HU1bZrdcIHCiXP0HSTJGh02xfOySikA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jOKlG-0004cZ-Kl; Tue, 14 Apr 2020 14:33:54 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jOKlG-000323-B1; Tue, 14 Apr 2020 14:33:54 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/30] qcow2: Add l2_entry_size()
In-Reply-To: <9695a347-b490-12b2-8a01-09ad8bdb8eb9@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <fd0f93353a218ff4518f34ebdbca05c2fc0f1085.1584468723.git.berto@igalia.com>
 <58d1fa17-91ea-9f8d-c39a-4141783d1234@virtuozzo.com>
 <w51y2qy5kd6.fsf@maestria.local.igalia.com>
 <9695a347-b490-12b2-8a01-09ad8bdb8eb9@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 14 Apr 2020 14:33:54 +0200
Message-ID: <w51v9m25jrh.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 14 Apr 2020 02:29:13 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
>>> Hmm. How to avoid it? Maybe, at least, refactor the code, to drop all
>>> sizeof(uint64_t), converting them to L2_ENTRY_SIZE, L1_ENTRY_SIZE,
>>> REFTABLE_ENTRY_SIZE etc?
>> 
>> That wouldn't be a bad thing I guess but, again, for a separate patch or
>> series.
>> 
>>> And all occurrences of pure '8' (not many of them exist)
>> 
>> I think most/all nowadays only refer to the number of bits per byte.
>> 
>> Maybe there's a couple that still need to be fixed, but we have been
>> removing a lot of numeric literals from the qcow2 code (see for example
>> b6c246942b, 3afea40243 or a35f87f50d).
>> 
>
>
> git grep '\<8\>' block/qcow2*
>
> shows at least
>
> qcow2-cluster.c:            s->l1_table_offset + 8 * l1_start_index, bufsize, false);
> qcow2-cluster.c:                           s->l1_table_offset + 8 * l1_start_index,

I see, worth replacing with L1_ENTRY_SIZE as you suggest. I can take of
writing the patches if you want.

Berto

