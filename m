Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882E1D39F9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 20:53:25 +0200 (CEST)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZIyx-0000um-E7
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 14:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jZIxK-0007lS-W8
 for qemu-devel@nongnu.org; Thu, 14 May 2020 14:51:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49107
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jZIxJ-0008Ad-AY
 for qemu-devel@nongnu.org; Thu, 14 May 2020 14:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589482300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCThSPBm0aT5KCz//yueDFnjSkCt9bFMz5kaqg+EcdM=;
 b=dYs5voa230L1gR64Iuhc3+FiaFoODeDybsULZY1GLEepQ5ROs27WUJJikmL3PleH4ZiMNC
 Qyfj+OZGMmTxon38jpfgXVAbIDahgU8gVabkCnX6JFMnWrHVfnDOs5rdu3QooxEMIj+/62
 onYj1Tb36xUZNX2dxudV40R8fz2Xfhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-B6bRTS3GNeq81ipT7Q3O2A-1; Thu, 14 May 2020 14:51:36 -0400
X-MC-Unique: B6bRTS3GNeq81ipT7Q3O2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4876687308E;
 Thu, 14 May 2020 18:51:35 +0000 (UTC)
Received: from [10.3.116.145] (ovpn-116-145.phx2.redhat.com [10.3.116.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2077A600E5;
 Thu, 14 May 2020 18:51:31 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] block: Mark commit and mirror as filter drivers
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20191219085106.22309-1-vsementsov@virtuozzo.com>
 <20191219085106.22309-2-vsementsov@virtuozzo.com>
 <87b5063b-73f2-e89c-5d28-8aaf59ed6fc9@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7bd1a887-bcfd-dbc3-a336-9d69738d639e@redhat.com>
Date: Thu, 14 May 2020 13:51:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87b5063b-73f2-e89c-5d28-8aaf59ed6fc9@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:35:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: fam@euphon.net, kwolf@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, stefanha@redhat.com,
 den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/20 1:23 PM, Eric Blake wrote:
> On 12/19/19 2:51 AM, Vladimir Sementsov-Ogievskiy wrote:
>> From: Max Reitz <mreitz@redhat.com>
>>
>> The commit and mirror block nodes are filters, so they should be marked
>> as such.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>     [squash comment fix from another Max's patch and adjust commit msg]
>> ---
>>   include/block/block_int.h | 8 +++++---
>>   block/commit.c            | 2 ++
>>   block/mirror.c            | 2 ++
>>   3 files changed, 9 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

It looks like this patch has been updated and is now on Kevin's block 
branch:
https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg03271.html


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


