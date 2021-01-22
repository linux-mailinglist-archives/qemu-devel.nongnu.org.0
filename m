Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0D300846
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:10:09 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2z0i-00078h-8n
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2yzD-0005td-9T
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2yzB-0002KR-4M
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611331712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OkBBkCpaXxbk/G+b9p/dx0U8T9TVjVpVHVJ+h/Ipi8=;
 b=F4WN4QakDVG646n2yYP7kxQ4WL+uuPGH3lY/3tXV1UYa+bqn9YQOwk/9oV+f6fO9yW5zGG
 R2aAjvm/EVzP937drEudgT7guvSZfYavAbW40ShQLvTbIkhgeCASXStp6bNH8274032AIU
 qIdDZDIIM1OZN7X6V9cOvbR6zgDH4CU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-_Efp-iUQOUmPHiGV4KfmQQ-1; Fri, 22 Jan 2021 11:08:28 -0500
X-MC-Unique: _Efp-iUQOUmPHiGV4KfmQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C70480A5C9;
 Fri, 22 Jan 2021 16:08:27 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3989C5C5E0;
 Fri, 22 Jan 2021 16:08:24 +0000 (UTC)
Subject: Re: [PATCH v7 00/11] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <c4bdbd03-7a03-3bf2-3f6e-c8c85dd9897c@redhat.com>
 <20210122112745.GB15866@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a078a98f-5251-c702-30d3-6fd037c6e5b7@redhat.com>
Date: Fri, 22 Jan 2021 10:08:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122112745.GB15866@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 5:27 AM, Kevin Wolf wrote:
> Am 20.01.2021 um 21:52 hat Eric Blake geschrieben:
>> On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> These series has 3 goals:
>>>
>>>  - get rid of group file (to forget about rebase and in-list conflicts)
>>>  - introduce human-readable names for tests
>>>  - rewrite check into python
>>>
>>> v7:
>>>   - fix wording and grammar
>>>   - satisfy python linters
>>>   - move argv interfaces all into one in new check script
>>>   - support '-n' == '--dry-run' option
>>>   - update check-block to run check with correct PYTHON
>>
>> I'd really like a second reviewer on 7-11, but I'm queueing 1-6 on my
>> NBD tree now.
> 
> Oh, you already sent a pull request? Having 6 in without the rest is not
> a good state. We now have the group info duplicated and one of them is
> ignored, but will become the meaningful copy later. We need to be
> careful to not let them diverge now.
> 
> I hope the rest is fine so we can switch over quickly, otherwise I'd
> prefer to revert 6 and redo it from the then current state when we merge
> the whole series.

Yeah, I probably jumped the gun there.  If we don't have v8 in good
working shape soon, I'm happy to send a temporary revert pull request
for patch 6 - let's shoot for late Monday as the cut-off point where I
will act if the revert is needed.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


