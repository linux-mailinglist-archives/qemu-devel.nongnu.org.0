Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1AB2B3D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 07:44:39 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keYFh-00072c-Qc
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 01:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1keYE3-00068z-Bj
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 01:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1keYDz-0006Dm-Ot
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 01:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605508969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MCAFL6AN+aQXOh4ElNUwG5MPfCTqzbV738jDqk4vLMc=;
 b=d7BJy3IrebitBZGWnrKFkDtDbogMrWX6N4u3C/WvJUhp6fxMzM7mhb+ROZugFVfATSD8U8
 V0ghB005jPBrg8oIDJDO11Uk0cxKdRfYpwU+B1RtLx0VVqq1At9UCdi7WJyXT9ANo26NXB
 Y9X/4xQTrD0vaamXiwFm9kQKk7qInEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-V_LcebjTNAG3RuJyAkElkw-1; Mon, 16 Nov 2020 01:42:47 -0500
X-MC-Unique: V_LcebjTNAG3RuJyAkElkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB9E1802B7A;
 Mon, 16 Nov 2020 06:42:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F7425D9D2;
 Mon, 16 Nov 2020 06:42:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9801911358BA; Mon, 16 Nov 2020 07:42:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v2] json: Fix a memleak in parse_pair()
References: <20201113145525.85151-1-alex.chen@huawei.com>
 <7412CDE03601674DA8197E2EBD8937E83BA6762C@dggemm511-mbs.china.huawei.com>
Date: Mon, 16 Nov 2020 07:42:43 +0100
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83BA6762C@dggemm511-mbs.china.huawei.com>
 (Chenqun's message of "Sat, 14 Nov 2020 09:08:20 +0000")
Message-ID: <87eektkdjw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 01:42:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Chenqun (kuhn)" <kuhn.chenqun@huawei.com> writes:

>> -----Original Message-----
>> From: Chenzhendong (alex)
>> Sent: Friday, November 13, 2020 10:55 PM
>> To: armbru@redhat.com
>> Cc: Chenzhendong (alex) <alex.chen@huawei.com>; qemu-devel@nongnu.org;
>> qemu-trivial@nongnu.org; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
>> Chenqun (kuhn) <kuhn.chenqun@huawei.com>
>> Subject: [PATCH v2] json: Fix a memleak in parse_pair()
>> 
>> In qobject_type(), NULL is returned when the 'QObject' returned from
>> parse_value() is not of QString type, and this 'QObject' memory will leaked.
>> So we need to first cache the 'QObject' returned from parse_value(), and finally
>> free 'QObject' memory at the end of the function.
>> Also, we add a testcast about invalid dict key.
>> 
>> The memleak stack is as follows:
>> Direct leak of 32 byte(s) in 1 object(s) allocated from:
>>     #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34fb)
>>     #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
>>     #2 0xaaab3557d9f7 in qnum_from_int
>> /Images/source_org/qemu_master/qemu/qobject/qnum.c:25
>>     #3 0xaaab35584d23 in parse_literal
>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:511
>>     #4 0xaaab35584d23 in parse_value
>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:554
>>     #5 0xaaab35583d77 in parse_pair
>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:270
>>     #6 0xaaab355845db in parse_object
>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:327
>>     #7 0xaaab355845db in parse_value
>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:546
>>     #8 0xaaab35585b1b in json_parser_parse
>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:580
>>     #9 0xaaab35583703 in json_message_process_token
>> /Images/source_org/qemu_master/qemu/qobject/json-streamer.c:92
>>     #10 0xaaab355ddccf in json_lexer_feed_char
>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:313
>>     #11 0xaaab355de0eb in json_lexer_feed
>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:350
>>     #12 0xaaab354aff67 in tcp_chr_read
>> /Images/source_org/qemu_master/qemu/chardev/char-socket.c:525
>>     #13 0xfffe4ae429db in g_main_context_dispatch
>> (/lib64/libglib-2.0.so.0+0x529db)
>>     #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
>>     #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530df)
>>     #16 0xaaab34d70bff in iothread_run
>> /Images/source_org/qemu_master/qemu/iothread.c:82
>>     #17 0xaaab3559d71b in qemu_thread_start
>> /Images/source_org/qemu_master/qemu/util/qemu-thread-posix.c:519
>> 
>> Fixes: 532fb5328473 ("qapi: Make more of qobject_to()")
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qobject/json-parser.c | 12 ++++++------
>>  tests/check-qjson.c   |  9 +++++++++
>>  2 files changed, 15 insertions(+), 6 deletions(-)
>> 
>> diff --git a/qobject/json-parser.c b/qobject/json-parser.c index
>> d083810d37..c0f521b56b 100644
>> --- a/qobject/json-parser.c
>> +++ b/qobject/json-parser.c
>> @@ -257,8 +257,9 @@ static JSONToken
>> *parser_context_peek_token(JSONParserContext *ctxt)
>>   */
>>  static int parse_pair(JSONParserContext *ctxt, QDict *dict)  {
>> +    QObject *key_obj = NULL;
>> +    QString *key;
>>      QObject *value;
>> -    QString *key = NULL;
>>      JSONToken *peek, *token;
>> 
>>      peek = parser_context_peek_token(ctxt); @@ -267,7 +268,8 @@ static
>> int parse_pair(JSONParserContext *ctxt, QDict *dict)
>>          goto out;
>>      }
>> 
>> -    key = qobject_to(QString, parse_value(ctxt));
>> +    key_obj = parse_value(ctxt);
>> +    key = qobject_to(QString, key_obj);
>>      if (!key) {
>>          parse_error(ctxt, peek, "key is not a string in object");
>>          goto out;
>> @@ -297,13 +299,11 @@ static int parse_pair(JSONParserContext *ctxt,
>> QDict *dict)
>> 
>>      qdict_put_obj(dict, qstring_get_str(key), value);
>> 
>> -    qobject_unref(key);
>> -
>> +    qobject_unref(key_obj);
>>      return 0;
>> 
>>  out:
>> -    qobject_unref(key);
>> -
>> +    qobject_unref(key_obj);
>>      return -1;
>>  }
>> 
>
> Hi Alex,
>   Perhaps it would be more appropriate to provide the testcase as a separate patch which from Markus.

I appreciate your consideration.  Since both fix and test case are
simple, and we need to hurry to have a chance at getting this into 5.2,
and the part of the work deserving credit the most is finding and
analyzing the bug, I'd like to take the patch as is.

Queued, thanks!


