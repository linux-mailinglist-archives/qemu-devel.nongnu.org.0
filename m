Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97133D4E1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:31:43 +0100 (CET)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9nS-0002HG-Rd
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9le-0001Ke-2m
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9lc-00039q-EA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615901387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ap3WxuXcugkMYb1PNBEzm7/WvgfUIjj3UmloGu9AM0o=;
 b=gptT2jCS34h7Ht7RN+gQZ31K5xYaFxv48ril4gORTw0ZQPy5v2nMgW9L3sIoZ3930plj70
 UX2Gm8xM4WEmLSbMx71EhOr/FtF0fFRFUinDcNxKuhCU3HU1W6O0IRMQrq1M5a+u9Td4Ji
 HahTKSGPQupNUA0VsXwfDdAa959iy5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-JPi0tLHwMgyFHHR8W6DUfQ-1; Tue, 16 Mar 2021 09:29:45 -0400
X-MC-Unique: JPi0tLHwMgyFHHR8W6DUfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60B06108BD08;
 Tue, 16 Mar 2021 13:29:44 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA0445D747;
 Tue, 16 Mar 2021 13:29:43 +0000 (UTC)
Subject: Re: [PATCH 2/9] block: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-3-ma.mandourr@gmail.com>
 <d74ef980-ad9b-8a97-0bc8-1ecc60a28c65@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a63652b6-c466-6fd4-125d-7967ba50a820@redhat.com>
Date: Tue, 16 Mar 2021 08:29:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d74ef980-ad9b-8a97-0bc8-1ecc60a28c65@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:CURL" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 4:23 AM, Vladimir Sementsov-Ogievskiy wrote:
> 11.03.2021 06:15, Mahmoud Mandour wrote:
>> Replaced various qemu_mutex_lock/qemu_mutex_unlock calls with
>> lock guard macros (QEMU_LOCK_GUARD() and WITH_QEMU_LOCK_GUARD).
>> This slightly simplifies the code by eliminating calls to
>> qemu_mutex_unlock and eliminates goto paths.
>>
>> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>> ---
>>   block/curl.c |  13 ++--
>>   block/nbd.c  | 188 ++++++++++++++++++++++++---------------------------
> 
> Better would be make two separate patches I think.

Given the imminent approach of soft freeze, and the fact that this does
not add a feature, I'm debating whether this one patch warrants an
immediate pull request through my NBD tree, or if it should be split
first, or if we just defer it to 6.1 (it shouldn't affect correctness,
just a maintenance cleanup).

In case some other maintainer wants to push this series through for 6.0
(rather than waiting for each maintainer to pick up one patch at a
time), feel free to add:

Acked-by: Eric Blake <eblake@redhat.com>


> For nbd.c we mostly change simple critical sections
> 
> qemu_mutex_lock()
> ...
> qemu_mutex_unlock()
> 
> into
> 
> WITH_QEMU_LOCK_GUARD() {
> ...
> }
> 
> And don't eliminate any gotos.. Hmm. On the first sight increasing
> nesting of the code doesn't make it more beautiful.
> But I understand that context-manager concept is safer than calling
> unlock() by hand, and with nested block the critical section becomes
> more obvious. So, with fixed over-80 lines:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


