Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA21385E2
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jan 2020 11:41:01 +0100 (CET)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqag0-0003Vu-EL
	for lists+qemu-devel@lfdr.de; Sun, 12 Jan 2020 05:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iqaf4-0002zu-JX
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 05:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iqaf1-00079I-DL
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 05:40:00 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31973
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iqaf1-00071w-4g
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 05:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578825597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=w9lbNcTZo+TYs3ubmDHLFtITOcTMBr4WFC6v/7hM16A=;
 b=SS583huR2UwlT/JV/QR+vnkQMaAq/cW13qVXbepPT4YOWTETtqVbpgnOm+ONXMhu2lXyVF
 S7jbR6tlVVKMjE7qEYPWYUUqPTWbpeW123gg+jaxTvFfediaBCJ5wsuRX20gWjP9vS+z/Y
 jUUeLRNeq2tVa5XWRviYgEOFZEqOwEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-L8ncB9uTNxm3qzQMTJodhw-1; Sun, 12 Jan 2020 05:39:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FB5ADB60;
 Sun, 12 Jan 2020 10:39:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-70.ams2.redhat.com [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA0D76A846;
 Sun, 12 Jan 2020 10:39:53 +0000 (UTC)
Subject: Re: [PATCH V2] vhost-user-test: fix a memory leak
From: Thomas Huth <thuth@redhat.com>
To: pannengyuan@huawei.com, lvivier@redhat.com, pbonzini@redhat.com
References: <1576805214-2508-1-git-send-email-pannengyuan@huawei.com>
 <072970b5-b7cc-ad71-d3e4-933e888b7093@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3312978e-2bff-091a-b618-d9183b8c7252@redhat.com>
Date: Sun, 12 Jan 2020 11:39:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <072970b5-b7cc-ad71-d3e4-933e888b7093@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: L8ncB9uTNxm3qzQMTJodhw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2020 15.07, Thomas Huth wrote:
> On 20/12/2019 02.26, pannengyuan@huawei.com wrote:
>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>
>> Spotted by ASAN.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>> Changes V2 to V1:
>> - use a "goto cleanup", instead of duplicating the "free" functions.
>> - free "dest_cmdline" at the end.
>> ---
>>  tests/vhost-user-test.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
>> index 91ea373..dcb8617 100644
>> --- a/tests/vhost-user-test.c
>> +++ b/tests/vhost-user-test.c
>> @@ -717,7 +717,7 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
>>      guint64 size;
>>  
>>      if (!wait_for_fds(s)) {
>> -        return;
>> +        goto cleanup;
>>      }
>>  
>>      size = get_log_size(s);
>> @@ -776,8 +776,11 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
>>      g_source_unref(source);
>>  
>>      qtest_quit(to);
>> +
>> + cleanup:
>>      test_server_free(dest);
>>      g_free(uri);
>> +    g_string_free(dest_cmdline, true);
>>  }
>>  
>>  static void wait_for_rings_started(TestServer *s, size_t count)
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> ... and picked up to my qtest-next tree.

... and now I had to unqueue the patch again. It is reproducibly causing
one of the gitlab CI pipelines to fail with a timeout, e.g.:

 https://gitlab.com/huth/qemu/-/jobs/400101552

Not sure what is going on here, though, there is no obvious error
message in the output... this needs some more investigation... do you
have a gitlab account and could have a look?

 Thomas


