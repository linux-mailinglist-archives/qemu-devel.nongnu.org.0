Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD41A36AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 17:13:19 +0200 (CEST)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMYrl-0007wB-KZ
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 11:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jMYqe-0007CC-ED
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 11:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jMYqc-0002aR-7U
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 11:12:07 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:56825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jMYqb-0002Z6-01; Thu, 09 Apr 2020 11:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=fBz7JtONV3WO3ToqHThALYurpsu6im6HMHXdEibpOJg=; 
 b=CgwQBdMJ+y+SDs6Wl2JmZuQM07/RfR/HMTPyoZxgwvI0V/Xu0i0/E2Dna5XxscPFl48zwE3pPvtoHoZYoDIuMiuRGYERTBF5moGSEIHBCAvesPd6tgmfhYYXuPt+Remm5P4iWbyjFweerZrFKnX4dxoNUpIw05QRs5AZ1kjweacgdSKoEQ7uQMrnAzaFqVb3WxhbxdUKjhoAXZzrLpRTxV3uejnZQCOlqaCJXv3Qkan8ohksp+79gGJwHQsLf1IDQfi8WZzrqly1D22zZeSJBiI5TRzBDO2XVeuPwLQmAUCVeB2WuYj/+Wj79GBeqVFQMJYTQN68Bv/OoOieomN43Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jMYqW-0003S3-OH; Thu, 09 Apr 2020 17:12:00 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jMYqW-0000Bl-EP; Thu, 09 Apr 2020 17:12:00 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 03/30] qcow2: Add calculate_l2_meta()
In-Reply-To: <6a3a60be-9d15-5005-d492-f350f1a150aa@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <627da7ad090c0b166f3d0294312d956fcddc5a2a.1584468723.git.berto@igalia.com>
 <6a3a60be-9d15-5005-d492-f350f1a150aa@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 09 Apr 2020 17:12:00 +0200
Message-ID: <w515ze83d8f.fsf@maestria.local.igalia.com>
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

On Thu 09 Apr 2020 10:30:13 AM CEST, Vladimir Sementsov-Ogievskiy wrote:
>> +static void calculate_l2_meta(BlockDriverState *bs,
>> +                              uint64_t host_cluster_offset,
>> +                              uint64_t guest_offset, unsigned bytes,
>> +                              QCowL2Meta **m, bool keep_old)
>> +{
>> +    BDRVQcow2State *s = bs->opaque;
>> +    unsigned cow_start_from = 0;
>> +    unsigned cow_start_to = offset_into_cluster(s, guest_offset);
>> +    unsigned cow_end_from = cow_start_to + bytes;
>> +    unsigned cow_end_to = ROUND_UP(cow_end_from, s->cluster_size);
>> +    unsigned nb_clusters = size_to_clusters(s, cow_end_from);
>> +    QCowL2Meta *old_m = *m;
>> +
>> +    *m = g_malloc0(sizeof(**m));
>> +    **m = (QCowL2Meta) {
>> +        .next           = old_m,
>> +
>> +        .alloc_offset   = host_cluster_offset,
>> +        .offset         = start_of_cluster(s, guest_offset),
>> +        .nb_clusters    = nb_clusters,
>> +
>> +        .keep_old_clusters = keep_old,
>> +
>> +        .cow_start = {
>> +            .offset     = cow_start_from,
>> +            .nb_bytes   = cow_start_to - cow_start_from,
>> +        },
>> +        .cow_end = {
>> +            .offset     = cow_end_from,
>
> Hmm. So, you make it equal to requested_bytes from handle_alloc().

No, requested_bytes from handle_alloc is:

   requested_bytes = *bytes + offset_into_cluster(s, guest_offset);

But *bytes is later modified before calling calculate_l2_meta():

   *bytes = MIN(*bytes, nb_bytes - offset_into_cluster(s, guest_offset));

More details here:

   https://lists.gnu.org/archive/html/qemu-block/2019-10/msg01808.html

Berto

