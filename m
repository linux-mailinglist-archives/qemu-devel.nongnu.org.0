Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF11FCA15
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 16:40:31 +0100 (CET)
Received: from localhost ([::1]:58856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVHEU-00062h-HM
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 10:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iVH7p-0000eO-V5
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:33:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iVH7o-0002F8-Vb
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:33:37 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:36447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iVH7o-0002Ex-K5; Thu, 14 Nov 2019 10:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=tdF+b9AMdBdriPn8GIUY71DGbLa8wN+gDht7fmUD/Mc=; 
 b=XO1P2M0vMdynENS+O0LzOlqT+hk3BUUwKyEeiUo5LOsTMLYiV4MR238VBUYZBpprZmxZLpxudzrO3XqyIVHIosYq7/aoRwgw09hBksxwq1drGJJD5qJ9YxqEiHiAlo81aoyg7Vi40T3wL+ZBP6nitM9WtxO0rdT3kc+0c0ubwEeEse1m21UGXTkzu0YHTSPYFjFwXIG8yXjPBnjbIIgck+CJ3A4UH2WQ7M/I8qfT16pQH0D5EJ7fTuv7jph4v9OULNR/tjiNRT02vGlp++fTsUYIWvj6FlFvCYB+fAmy7cpeILERSNlAx4wG3cBOhi0dGO7C4fZFFk8FOf7RLNGUBw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iVH7n-0005HB-8N; Thu, 14 Nov 2019 16:33:35 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iVH7n-0003fC-5b; Thu, 14 Nov 2019 16:33:35 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 16/26] qcow2: Add subcluster support to
 discard_in_l2_slice()
In-Reply-To: <814afb3a-c534-f7f9-2366-65c77756cce6@redhat.com>
References: <cover.1572125022.git.berto@igalia.com>
 <8a87fb9b6e73f06dfc1a8aa9f3c0b4c01f2c9fbd.1572125022.git.berto@igalia.com>
 <814afb3a-c534-f7f9-2366-65c77756cce6@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 14 Nov 2019 16:33:35 +0100
Message-ID: <w51sgmqeals.fsf@maestria.local.igalia.com>
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
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 04 Nov 2019 04:07:35 PM CET, Max Reitz wrote:
>>          /* First remove L2 entries */
>>          qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
>> -        if (!full_discard && s->qcow_version >= 3) {
>> +        if (has_subclusters(s)) {
>> +            set_l2_entry(s, l2_slice, l2_index + i, 0);
>> +            set_l2_bitmap(s, l2_slice, l2_index + i,
>> +                          full_discard ? 0 : QCOW_L2_BITMAP_ALL_ZEROES);
>
> But only for !full_discard, right?

Hence the conditional operator in my patch, maybe you didn't see it?

Berto

