Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962E13593A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 13:32:26 +0100 (CET)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipWzA-0000Qm-Rl
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 07:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1ipWxV-0007wK-Oj
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 07:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1ipWxU-0004Aa-JU
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 07:30:41 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:60502)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1ipWxT-000417-RF; Thu, 09 Jan 2020 07:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=TLFzwgFK3HIhNEGwPP8fQKt3sd1WXxycke16ZeDkLDI=; 
 b=OjCULiV7kLJz8u+sAbVz93TDy1HwM0kG0EQkCSB+l25zTwghylPiF1tcRA3k2oWW1cgX3v3ZcJBbSldf26xvIeNR+7QxBUGwXYT4GTHl7uXtVxIQ7u7STeY1n5jWUxnMQNMc41NyWOetThDHrjHCuwIL+Uv0BCmDmp+w0Q7bTZ6RCJQwBXZGzbDNhis3OhKwjMNPeW85P3GAPZHtC9WBo53JyYVq6sX1L5fJGZCn8TMnAQg/GpUDeMVdddpgTeXiRm9kr5BQIB+bGSvS3xiwV2JnGEZ2HMXQ8jFkoKMHVmicovExVdiXPGtIpJgPXeVG3I1V++k3sWBD+jfpw0UzUQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1ipWxQ-0006ry-N2; Thu, 09 Jan 2020 13:30:36 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1ipWxQ-0001kO-7K; Thu, 09 Jan 2020 13:30:36 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/3] qcow2: Use BDRV_SECTOR_SIZE instead of the hardcoded
 value
In-Reply-To: <20200109121900.GF9504@linux.fritz.box>
References: <cover.1578505678.git.berto@igalia.com>
 <f6dcb0d7b17cddb475e3a018a5b802490c7bc21d.1578505678.git.berto@igalia.com>
 <20200109121900.GF9504@linux.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 09 Jan 2020 13:30:36 +0100
Message-ID: <w51a76wbymr.fsf@maestria.local.igalia.com>
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 09 Jan 2020 01:19:00 PM CET, Kevin Wolf wrote:
>> diff --git a/block/qcow2.c b/block/qcow2.c
>> index e8ce966f7f..6427c75409 100644
>> --- a/block/qcow2.c
>> +++ b/block/qcow2.c
>> @@ -2175,7 +2175,7 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
>>                                            offset, bytes, qiov, qiov_offset);
>>  
>>      case QCOW2_CLUSTER_NORMAL:
>> -        if ((file_cluster_offset & 511) != 0) {
>> +        if ((file_cluster_offset % BDRV_SECTOR_SIZE) != 0) {
>>              return -EIO;
>>          }
>
> Hm, unrelated to your change, but why do we test for 512 byte
> alignment here? file_cluster_offset should certainly be cluster
> aligned for normal clusters. And if the check fails, that's actually
> an image corruption and not just an I/O error. Am I missing something?

I actually suspect that this is just an old, obsolete check that we have
kept during these years. file_cluster_offset should be not just sector
aligned but also cluster aligned if I'm not wrong, and if not then
qcow2_alloc_cluster_offset() and qcow2_get_cluster_offset() should
return an error.

I can simply remove that check, or replace it with an assertion.

Berto

