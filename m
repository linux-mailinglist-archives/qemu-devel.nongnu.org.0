Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014561F5852
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:50:57 +0200 (CEST)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj30B-0007U0-Nq
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jj2yO-0006Ri-Cb
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:49:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25535
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jj2yM-0002oZ-UZ
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591804141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QS7LQOJ0sinqPq2qZ20ZFJ6Ee7GUjyYhLkAuap82+2k=;
 b=fEbdxyWA1XU+BH3+GIfvcvDmun3F7jhsDwIXKeQTmBCkeMIA6zjCmQ4PWIczIYPjiR1IZQ
 J3B5q0j58s1kuGdmvKZ+bP8MpBdecIr99OpadOrRo/YM1KDGZC+pcsRnyJsES5mTCElX74
 8kgetv32xNNgPqVL2RnpXbkjrD2GJcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-T2jIxRmDPXWhpVX2Y4IxIg-1; Wed, 10 Jun 2020 11:48:54 -0400
X-MC-Unique: T2jIxRmDPXWhpVX2Y4IxIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 841D3800053;
 Wed, 10 Jun 2020 15:48:53 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A292A5D9D3;
 Wed, 10 Jun 2020 15:48:52 +0000 (UTC)
Subject: Re: Clarification regarding new qemu-img convert --target-is-zero flag
To: David Edmondson <dme@dme.org>, Sam Eiderman <sameid@google.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <CAFr6bU=LjeW5_eGtwL38cher2TM52skohuANNXN9EpO+mA-z8Q@mail.gmail.com>
 <m2imfz877v.fsf@dme.org>
 <CAFr6bUk5LrEL8BPXYkNOqj_jsbxHBfbj_NYryUjszMtG89L+2w@mail.gmail.com>
 <20200610140620.GE6947@linux.fritz.box>
 <CAFr6bU=aD=AXnoR-qSdQtQC690FYFqFsDRHHGxdUDkTh2ho1cA@mail.gmail.com>
 <CAFr6bUksp1Nm4nL69na5WDj6A5iXzwcc4K3=JNnyP4xZ+HKJHA@mail.gmail.com>
 <m2bllr7wrg.fsf@dme.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <999a1a74-d082-bcdb-e3f9-6c44b2526433@redhat.com>
Date: Wed, 10 Jun 2020 10:48:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <m2bllr7wrg.fsf@dme.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Tony Zhang <tzz@google.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/20 10:42 AM, David Edmondson wrote:
> On Wednesday, 2020-06-10 at 18:29:33 +03, Sam Eiderman wrote:
> 
>> Excuse me,
>>
>> Vladimir already pointed out in the first comment that it will skip
>> writing real zeroes later.
> 
> Right. That's why you want something like "--no-need-to-zero-initialise"
> (the name keeps getting longer!), which would still write zeroes to the
> blocks that should contain zeroes, as opposed to writing zeroes to
> prepare the device.

Or maybe something like:

qemu-img convert --skip-unallocated

which says that a pre-zeroing pass may be attempted, but it if fails, 
only the explicit zeroes need to be written rather than zeroes for all 
unallocated areas in the source (so the resulting image will NOT be an 
identical copy if there were any unallocated areas, but that the user is 
okay with that).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


