Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44833F0D5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:03:46 +0100 (CET)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVpx-0004Ku-2w
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMVoX-0003tB-0Q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMVoU-0000CM-BO
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615986132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bpu6IJDxTASRB6GUkyPlf4ZHGHP7GwP/Q9eavCVSZIM=;
 b=P+UV5kS0klr+JPm9SwhTvfcfc7K7tsHD/s1hyXskyaxDYt7X/wVZtaeAFpRrs6wdgeyUwF
 3OF3Y+Wpa9LpZUqR/LRqxr8OsYyWzBVKsz4dsbILOc7CFbyWuJYHOLuSAnfZsEdzhHWDyW
 NpJbtUASozqfWkhNmdBF5RrXkyr4viw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-EST9DZWqMzefmsZ5jhaeqQ-1; Wed, 17 Mar 2021 09:02:08 -0400
X-MC-Unique: EST9DZWqMzefmsZ5jhaeqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3894A10866A5;
 Wed, 17 Mar 2021 13:02:07 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE6655D9DE;
 Wed, 17 Mar 2021 13:02:06 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] utils: Use fixed-point arithmetic in qemu_strtosz
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210315155835.1970210-1-richard.henderson@linaro.org>
 <20210315155835.1970210-2-richard.henderson@linaro.org>
 <6ebe24d3-5424-5958-7ffb-80c90a020e18@redhat.com>
 <762b8658-f16f-5d64-2a6e-0a69b2fbeccf@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6aa20801-f310-9755-1b29-e40c303428a3@redhat.com>
Date: Wed, 17 Mar 2021 08:02:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <762b8658-f16f-5d64-2a6e-0a69b2fbeccf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 6:16 AM, Eric Blake wrote:
> On 3/17/21 2:09 AM, Thomas Huth wrote:
>> On 15/03/2021 16.58, Richard Henderson wrote:
>>> Once we've parsed the fractional value, extract it into an integral
>>> 64-bit fraction.  Perform the scaling with integer arithemetic, and
>>> simplify the overflow detection.
>>
>> I've put this patch in my local branch, but I'm still getting a failure
>> in the cutils test, this time in the Cirrus-CI with the MinGW build:
>>
>>  https://cirrus-ci.com/task/5413753530351616?command=test#L543
>>
>> Is it related or is this a different bug?
> 
> ERROR test-cutils - Bail out!
> ERROR:../tests/unit/test-cutils.c:2233:test_qemu_strtosz_trailing:
> assertion failed (res == 0): (1024 == 0)
> 
> That's testing behavior on:
> 
>     str = "0x";
>     err = qemu_strtosz(str, &endptr, &res);
> 
> which should parse as "0" with a suffix of 'x'.  It is an independent
> issue (unrelated to the rounding issues fixed in rth's patch), and
> rather appears to be a bug in mingw's libc for strtoull although I have
> not actually set up an environment to test that assumption yet.

Confirmed:
$ cat foo.c
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main(void)
{
    unsigned long u;
    const char *str = "0x";
    char *end;
    errno = 0;
    u = strtoul(str, &end, 10);
    printf("%lu %s %d\n", u, end, errno);
    errno = 0;
    u = strtoul(str, &end, 16);
    printf("%lu %s %d\n", u, end, errno);

    str = "0xq";
    errno = 0;
    u = strtoul(str, &end, 10);
    printf("%lu %s %d\n", u, end, errno);
    errno = 0;
    u = strtoul(str, &end, 16);
    printf("%lu %s %d\n", u, end, errno);
    return 0;
}
$ gcc -o foo-linux -Wall foo.c
$ x86_64-w64-mingw32-gcc -o foo-mingw -Wall foo.c
$ ./foo-linux
0 x 0
0 x 0
0 xq 0
0 xq 0
$ wine ./foo-mingw 2>/dev/null
0 x 0
0 0x 0
0 xq 0
0 0xq 0

Mingw has a bug (and therefore so do all our qemu_strto* functions) when
parsing "0xgarbage" with a base of 0 or 16, in that it fails to advance
past the leading '0' (which is a valid parse).  Patch coming up.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


