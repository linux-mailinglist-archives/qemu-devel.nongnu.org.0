Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A171A7AF5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 14:39:37 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOKqm-0004An-Pu
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 08:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jOKpz-0003Vl-3f
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:38:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jOKpy-00046C-68
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 08:38:46 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:54385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jOKpx-00044a-Tr; Tue, 14 Apr 2020 08:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=or0xyjR9cYueGSh8tQKMgeE5501BVb+ZA82BgdOHggw=; 
 b=G6/13IrbE7u7FE3RF+NiLfMYuMAIS/4iekIj9GtHuzgXXriTpjyCjIuU0k0/lO7cOiPuJRX4G//kIJ5Y7YTRJu45DHflUwPeq2qIQRNRUxjh2lXEIPp8gUzF8wRU3na9Xf2EvzBukIK2TOp/T6BLOmiXLPjQuwmxSzxzhBJqR+Eyxd/1KAXJyuQOuSzcDjbKc3jbgMsGlgjrsQ/VZaZ4Tba8sVolD1C+G/XPL2gil9YTk/hwIXjQCU6D+pKGzSBcgpKPwh8Gi8k5qfbxjbHKSWc14f7o9jNWNsTQZ4XIZpFSeEU6rZ70IByPTGtAM97BDPY151mGApOhEgB5B6wtXw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jOKpv-00059I-KV; Tue, 14 Apr 2020 14:38:43 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jOKpv-0003HG-9J; Tue, 14 Apr 2020 14:38:43 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 14/30] qcow2: Add cluster type parameter to
 qcow2_get_host_offset()
In-Reply-To: <ec5d4b90-b491-4173-a080-7e607a7b9f82@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <348c0b057802b5b35eefe3dc7cc8ef2964024ed5.1584468723.git.berto@igalia.com>
 <ec5d4b90-b491-4173-a080-7e607a7b9f82@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 14 Apr 2020 14:38:43 +0200
Message-ID: <w51sgh65jjg.fsf@maestria.local.igalia.com>
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

On Tue 14 Apr 2020 02:30:30 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
>> -        ret = qcow2_get_host_offset(bs, offset, &nr, &off);
>> -        if (ret != QCOW2_CLUSTER_UNALLOCATED &&
>> -            ret != QCOW2_CLUSTER_ZERO_PLAIN &&
>> -            ret != QCOW2_CLUSTER_ZERO_ALLOC) {
>> +        ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type);
>
> pre-patch, but probably better to return original errno on
> qcow2_get_host_offset failure, instead of masking it.

Yeah, I think you're right. I can take care of that on a separate patch.

Berto

