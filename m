Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F02B9DA4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:29:21 +0100 (CET)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsQa-0005Fc-9R
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kfrzJ-0006pd-3N
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kfrzD-0005iR-4e
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605823261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6L6pR27Ce4wDH9D2otfL3iy0uc4XgtSaMJQMlndCJtg=;
 b=RfsRb3Xo046VgdiceyJhi6qaXspZhMVDDRs7rd7OaY9HP7eiNrjlgfZDV4puhtwZrkgdM1
 2cjVLA9kkO97Ex5Zsu2RPim3P5ftALkCNKz/ETNgVHQaTTSkBwWtcG9fWp9Ntm1/hjOGY6
 kTdDZmzcj64P+jdqnRYnUP858jbCYMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-4IkfnylMOTGkLz5uBQPB1w-1; Thu, 19 Nov 2020 17:00:58 -0500
X-MC-Unique: 4IkfnylMOTGkLz5uBQPB1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0AA107ACE3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 22:00:57 +0000 (UTC)
Received: from [10.10.119.92] (ovpn-119-92.rdu2.redhat.com [10.10.119.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBCDF10016F6;
 Thu, 19 Nov 2020 22:00:56 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Snow <jsnow@redhat.com>
Subject: python asyncio QMP library (AQMP)
Message-ID: <9f12471f-cd8e-26b4-becb-cf0e69ecf8b0@redhat.com>
Date: Thu, 19 Nov 2020 17:00:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been doodling a new Asyncio-based QMP library that might fix some 
of the problems[1][2] with our older, non-async QMP library and provide 
a better basis for a proper distributable python package for people to 
write their own toy scripts to control QEMU.

It's a very early prototype, but I think I have the basics down and 
working now. I figured I would float my extremely early copy of it in 
case interested parties wanted to take a peek. (Or just to formally 
announce that "Hey, I'm working on this!")

https://gitlab.com/jsnow/aqmp/-/tree/devel

The design uses two independent coroutines in the bottom half, a reader 
and a writer. execute() works something like this:

                        +---------+
      +---------------- |execute()| <----------+
      |                 +---------+            |
      |                                        |
-----------------------------------------------------------
      v                                        |
+----+----+    +-----------+           +------+-------+
|Mailboxes|    |Event Queue|           |Outbound Queue|
+----+----+    +------+----+           +------+-------+
      |                |                       ^
      v                v                       |
   +--+----------------+---+       +-----------+-----------+
   | Reader Task/Coroutine |       | Writer Task/Coroutine |
   +-----------+-----------+       +-----------+-----------+
               |                               ^
               v                               |
         +-----+------+                  +-----+------+
         |StreamReader|                  |StreamWriter|
         +------------+                  +------------+


Execute deposits a message in the outbound queue; the writer issues it 
to the server. Execute goes to sleep waiting for mail in its inbox. The 
reader awakens upon new data available in the stream, the new data is 
placed in the mailbox, which awakens the caller.

The Reader/Writer are each executed by _task_runner, which ensures that 
any error that occurs in the BH will create a disconnection Task that 
will quiesce everything in the bottom half.

Any pending execute actions will be cancelled by the disconnection task; 
and will raise "DisconnectedError" to the caller.

Upon learning of a disconnection event, the client code responsible for 
managing the overall state of the connection can call disconnect(), 
which will raise any exceptions that occurred in the bottom halves that 
caused the unscheduled disconnect. From there, the client can decide to 
reconnect or abort, depending.


classes and things of interest:

aqmp.py - Mailbox: Simple data structure pairing an asyncio.Event with a 
Message. This is done to allow the disconnect task to wake up any 
waiting clients even if no message arrived. Python's asyncio.Queue does 
not offer a cancel primitive, so this approximates it.

aqmp.py - AQMP: The core of the loop logic is written here; the 
public-facing methods are connect(), disconnect(), execute() and 
execute_obj(), with a "make_execute_msg" class method available for 
creating Messages that can be executed later.

message.py - Message: This class comprises a JSON Object as read off the 
wire; putting it in a class like this allows me to write stricter type 
guarantees and offer _serialize/_deserialize class methods.

models.py - This module offers strictly typed and validated 
deserializations of core QMP structures that are not (generally) defined 
by the QAPI schema; i.e., it offers types, de/serialization, and 
validation for things such as "Greeting", "SuccessResponse", 
"AsynchronousEvent", etc.


What's left to do?

- Work on Exception naming and hierarchy,
   more helpful/pretty display of errors.
- Expand the event handling system to be more useful (Maybe?)
- Add QGA support
- Re-add socket creation support (Presently, it relies on the socket 
being created already.)
- Documentation, tests, etc.


Might be nice:

- Look into creating a "Server" variant to be used for testing the 
library, or even other clients.
- Look into synchronous wrappers that offer thread-safe primitives that 
can be used from traditional, synchronous contexts. (preventing "async 
creep".)


Long term goal:

- Get it merged in-tree; replace the legacy QMP module over time.

- Create an auto-generated SDK layer based on our QAPI schema that adds 
a library of type-safe commands, responses, and events that uses this 
QAPI-agnostic QMP library as its core.

- Add my "JobRunner" patches from earlier this year as a full-fledged 
jobs API that is designed to make running long-running tasks very 
trivial from a python console / qmp-shell.


--js


[1] qmp-shell is not capable of displaying events as they arrive 
asynchronously very well.
[2] Our use of non-blocking sockets and socket timeouts in qmp.py relies 
quite a bit on undefined behavior that thankfully has not broken yet.


