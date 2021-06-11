Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B23A4B20
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:18:01 +0200 (CEST)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqPY-0000Tj-2i
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lrqOg-0008F8-BV
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:17:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lrqOb-00044p-Sr
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623453420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PuIiLGSBpQQOQKdKmIUSRNosXQrOCuNp4mRR7+neFcg=;
 b=JCLo0yif0XGgCH06CHRsiWhkaFzu1LP3hRmTkKRYVk5aD4GJrKADKBAJcv2Br6DO6DsXNT
 UzG/QO2rwSQsNKYYADZxEIv0rOeD2YMo3sg+nQxefvhTvt4i8B6wZ0YmB28LTASWBNJ8S6
 Tc3NDQjAK88a6rmnkAHQLizprH35zf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-lwYvvvRqORCpEB3Z3Mfsdw-1; Fri, 11 Jun 2021 19:16:58 -0400
X-MC-Unique: lwYvvvRqORCpEB3Z3Mfsdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF483635F;
 Fri, 11 Jun 2021 23:16:57 +0000 (UTC)
Received: from [10.10.112.226] (ovpn-112-226.rdu2.redhat.com [10.10.112.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBD5F5D6AC;
 Fri, 11 Jun 2021 23:16:52 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Snow <jsnow@redhat.com>
Subject: [RFC] EventListener design for Python Async QMP library
Message-ID: <5f3204f0-3fa4-61de-e1b0-4d21e3874db0@redhat.com>
Date: Fri, 11 Jun 2021 19:16:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Niteesh G. S." <niteesh.gs@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all: I am continuing work on my asyncio-based QMP library for Python, 
which adds support for OOB executions, multiple simultaneous pending 
executions, and truly asynchronous event handling.

The library is what will fundamentally power the new qmp-shell that 
Niteesh is working on for his GSoC project this summer.

I would like to solicit feedback on one component of the design in 
particular: An interface I call the EventListener, which is an API 
designed to allow multiple concurrent coroutines to safely wait for and 
consume QMP events.

I have a document explaining their use on my GitLab fork. At the bottom 
of the document is a list of my own complaints about my design. If you'd 
like to take a peek at what I am cooking up and would like to offer 
feedback, now would be a pretty good time to do it before we get too far 
into development for the new qmp-shell.

The document is here: https://gitlab.com/jsnow/qemu/-/snippets/2133449

Any feedback, thoughts, etc are appreciated.

Thanks,
--js


Oh, and: The full library (Warning, with outdated docs, no tests, and 
quite a few TODO/FIXMEs scattered about) is here:

https://gitlab.com/jsnow/qemu/-/tree/python-async-qmp-aqmp/python/qemu/aqmp

But it's not in a state to ask for critique on the entire architecture 
just yet, there are still a few more suggestions from Stefan to 
implement from the last time I did so.


