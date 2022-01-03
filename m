Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29057482FC7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 11:07:18 +0100 (CET)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4KFI-0005ZU-Q5
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 05:07:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4KD7-0004YN-IN
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4KD4-0001Gf-QI
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 05:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641204296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2l8NPNJ+FX/eLYB/TA3Cwkrx6+m1xAsDcvWcOMzhPM=;
 b=Og8i8P5uhKzI1kQ6ZBesbOS88/5TJKuyDowHfl2AQ/bOpiopshY8A0ZgsB6kaG24Q0R8jK
 cv8ydGDxD80Nxm0SDOkj2sHwveLH0cvi/K/L+T+mnDDY+3w7Y6I0Y2V/Wj8HTXd5KlIdwU
 OwRY5wKjdPhFznW6kPtuIsBHOic9j7U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-Z_PS6KU5MMSqMmGACoMAJQ-1; Mon, 03 Jan 2022 05:04:55 -0500
X-MC-Unique: Z_PS6KU5MMSqMmGACoMAJQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso10053380wra.18
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 02:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z2l8NPNJ+FX/eLYB/TA3Cwkrx6+m1xAsDcvWcOMzhPM=;
 b=0OppEm0AP29iaWN4/BctQmrtzGb/5YjcgatjRTOk7/eHlJCOkqD9n5vH5MAYJh9s2D
 8i1bpxSz+W/RjewlO/130taY5DgVJK/l8QTEW405Ani8hVWug2YIKxyJdT6jZ/1izof0
 JNvZyhgt4dzKG+EJUUfaMQkW7VRXCS1OeqiYNc74inwjwP5nCVXRQJEJ3nAAVjIerGBO
 9SjUyR/+X9O9Hip4ZxiDilRfWOoA8SS4CkIlnL6RDi9P2E5Dv6oWn7nSK19am3MYQwcz
 MvkU4u3mVlPV8qS0O4k4t+T7zY/aB4scaPdCvZ0Ztltrku9yxT7WoHwernaJ8MxND0Kw
 wddA==
X-Gm-Message-State: AOAM533V0FYZuZ6WB1fdIu9qwO1gIuQJWLgBgAXgUqtKeDVW6YdZFAbv
 d0iy12EMbuWiv8qpvhk6fZ23xSyT7uQWTAbPb9TFb3iQx65ayhO4XnIXNKSvisxuLFcIB7n2uwV
 xR0viF9BbVFDuPII=
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr37513849wrn.707.1641204293972; 
 Mon, 03 Jan 2022 02:04:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz31AuQ7jjMJKzKs+LjE9p8o8tkW3SZqBhG8kk1topBZ5EhPE3EA8D1AfK+MPgvNsM8wGQSXg==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr37513820wrn.707.1641204293662; 
 Mon, 03 Jan 2022 02:04:53 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id s22sm37288377wmc.1.2022.01.03.02.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 02:04:53 -0800 (PST)
Message-ID: <b1021bec-124c-6abb-694e-cc10d9c459f3@redhat.com>
Date: Mon, 3 Jan 2022 11:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 10/28] export/fuse: Pass default_permissions for mount
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210709125035.191321-1-kwolf@redhat.com>
 <20210709125035.191321-11-kwolf@redhat.com>
 <b1e1147b-1495-1b54-81cc-3a867c3f34bb@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <b1e1147b-1495-1b54-81cc-3a867c3f34bb@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.12.21 16:04, Vladimir Sementsov-Ogievskiy wrote:
> 09.07.2021 15:50, Kevin Wolf wrote:
>> From: Max Reitz <mreitz@redhat.com>
>>
>> We do not do any permission checks in fuse_open(), so let the kernel do
>> them.  We already let fuse_getattr() report the proper UNIX permissions,
>> so this should work the way we want.
>>
>> This causes a change in 308's reference output, because now opening a
>> non-writable export with O_RDWR fails already, instead of only actually
>> attempting to write to it.  (That is an improvement.)
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> Message-Id: <20210625142317.271673-2-mreitz@redhat.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   block/export/fuse.c        | 8 ++++++--
>>   tests/qemu-iotests/308     | 3 ++-
>>   tests/qemu-iotests/308.out | 2 +-
>>   3 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/block/export/fuse.c b/block/export/fuse.c
>> index 38f74c94da..d0b88e8f80 100644
>> --- a/block/export/fuse.c
>> +++ b/block/export/fuse.c
>> @@ -153,8 +153,12 @@ static int setup_fuse_export(FuseExport *exp, 
>> const char *mountpoint,
>>       struct fuse_args fuse_args;
>>       int ret;
>>   -    /* Needs to match what fuse_init() sets.  Only max_read must 
>> be supplied. */
>> -    mount_opts = g_strdup_printf("max_read=%zu", 
>> FUSE_MAX_BOUNCE_BYTES);
>> +    /*
>> +     * max_read needs to match what fuse_init() sets.
>> +     * max_write need not be supplied.
>> +     */
>> +    mount_opts = g_strdup_printf("max_read=%zu,default_permissions",
>> +                                 FUSE_MAX_BOUNCE_BYTES);
>>         fuse_argv[0] = ""; /* Dummy program name */
>>       fuse_argv[1] = "-o";
>> diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
>> index f122065d0f..11c28a75f2 100755
>> --- a/tests/qemu-iotests/308
>> +++ b/tests/qemu-iotests/308
>> @@ -215,7 +215,8 @@ echo '=== Writable export ==='
>>   fuse_export_add 'export-mp' "'mountpoint': '$EXT_MP', 'writable': 
>> true"
>>     # Check that writing to the read-only export fails
>> -$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" | _filter_qemu_io
>> +$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" 2>&1 \
>> +    | _filter_qemu_io | _filter_testdir | _filter_imgfmt
>>     # But here it should work
>>   $QEMU_IO -f raw -c 'write -P 42 1M 64k' "$EXT_MP" | _filter_qemu_io
>> diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
>> index 466e7e0267..0e9420645f 100644
>> --- a/tests/qemu-iotests/308.out
>> +++ b/tests/qemu-iotests/308.out
>> @@ -91,7 +91,7 @@ virtual size: 0 B (0 bytes)
>>                 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true
>>             } }
>>   {"return": {}}
>> -write failed: Permission denied
>> +qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 
>> 'TEST_DIR/t.IMGFMT': Permission denied
>>   wrote 65536/65536 bytes at offset 1048576
>>   64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>>   wrote 65536/65536 bytes at offset 1048576
>>
>
> Hi!
>
> 308 test fails for me now:
>
> 308   fail       [16:02:49] [16:02:53]   3.5s   (last: 3.7s) output 
> mismatch (see 308.out.bad)
> --- /work/src/qemu/master/tests/qemu-iotests/308.out
> +++ 308.out.bad
> @@ -91,7 +91,7 @@
>                'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true
>            } }
>  {"return": {}}
> -qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 
> 'TEST_DIR/t.IMGFMT': Permission denied
> +write failed: Permission denied
>  wrote 65536/65536 bytes at offset 1048576
>  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>  wrote 65536/65536 bytes at offset 1048576
> Failures: 308
> Failed 1 of 1 iotests
>
>
> And bisect points to exactly this commit.
>
> Should it somehow depend on environment?

I suspect that’s because you’re running the test as root? 
(CAP_DAC_OVERRIDE allows opening files even when the permissions don’t 
allow for it.  We already have similar cases in 118.)

Skipping the whole test for root would be quite harsh...  Since this is 
just about a single line, I think we can do something with .casenotrun.

Hanna


