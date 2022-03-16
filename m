Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD034DB1D1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:46:33 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTyy-00064G-N0
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:46:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUThH-0004LI-FY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUThF-0004mj-LA
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZC7G6AJDV2FZQS3DCTZOZRK0y7+mf4m3fLbuWOiH0EY=;
 b=YpILD2rIuaA/aFHAUW7QGPNZBJ5GMY3k5pllp8qTRs69/jx5//CyiozE76DvonHX3kqETH
 ys9992E9QVmQ1YUgcF7opH4y1BGiFOA9x3LyAdA+RTMMmTuSVkvwHbVzQ0vLKEmYaG1V0m
 uxG0DyefuM2OlY7n7dMGlm3z4zv6C0g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-inew46_2MSqgwGwcPx9WBA-1; Wed, 16 Mar 2022 09:28:12 -0400
X-MC-Unique: inew46_2MSqgwGwcPx9WBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 f9-20020a5d58e9000000b001f0247e5e96so562070wrd.15
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZC7G6AJDV2FZQS3DCTZOZRK0y7+mf4m3fLbuWOiH0EY=;
 b=fyyVoq5IlU8KTK8uREpWbGjXJfO3nQ52ujB40pSYpCE1YY9sIwvh+4iAQ2Tzcbo46O
 FwYQ3JNp+/GbvOCtGC22vXis6x5Yi0c1KflHBZHQUtr5Od9tzLx67B4FTeiKJO70YdXf
 kkcnW4o1xyIfTLIZBEl1OFmWhdpB1AUVmGUhqLKBKrbx/pP7yxyU8I1iTgUUYw3iKbJW
 nJZIX/hfBZchhqqOyHu6AYhtWlU+Yb+f2FP3V7Od4kiJn0Ia+mZJd415tr/1B6GTazVU
 WVCSkXdb99Hvsg7FJtaPiKOnvsN2/tacCF5F9Si9mlNuBzdL/jHI5mGknv5VOfHK97rw
 BnqQ==
X-Gm-Message-State: AOAM533kna0v2FfYABtsgpe3ImjK4lIBHyuXyaFuYmS+Fde2iaxWi+nc
 s3Ex5QvqecWQ8xpvV5z5YGTQ1RZHYxMoGL6yeJmnCUJuJ87d429x9RBUOyBc44EO8O3QLt5cTYr
 ihvhJykbgxNDsfH4=
X-Received: by 2002:a5d:6244:0:b0:1e7:686d:41e7 with SMTP id
 m4-20020a5d6244000000b001e7686d41e7mr23735533wrv.491.1647437290681; 
 Wed, 16 Mar 2022 06:28:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhkthpk8CALWRyrP6UeSAiyc5PyjeBcZW4vlkIsrNdk9/MSR23usQzwXkariPWi5l9c/S4aw==
X-Received: by 2002:a5d:6244:0:b0:1e7:686d:41e7 with SMTP id
 m4-20020a5d6244000000b001e7686d41e7mr23735511wrv.491.1647437290396; 
 Wed, 16 Mar 2022 06:28:10 -0700 (PDT)
Received: from [192.168.42.76] (tmo-065-170.customers.d1-online.com.
 [80.187.65.170]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d548c000000b001f1f99e7792sm1611088wrv.111.2022.03.16.06.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:28:09 -0700 (PDT)
Message-ID: <617011dd-6d19-cb2d-c98d-747e1821d545@redhat.com>
Date: Wed, 16 Mar 2022 14:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
 <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:blkverify" <qemu-block@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiri Pirko <jiri@resnulli.us>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2022 14.16, Philippe Mathieu-Daudé wrote:
> On 16/3/22 10:52, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> One less qemu-specific macro. It also helps to make some headers/units
>> only depend on glib, and thus moved in standalone projects eventually.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   audio/audio.h                           |  4 +--
>>   block/qcow2.h                           |  2 +-
>>   bsd-user/qemu.h                         |  2 +-
>>   hw/display/qxl.h                        |  2 +-
>>   hw/net/rocker/rocker.h                  |  2 +-
>>   hw/xen/xen_pt.h                         |  2 +-
>>   include/chardev/char-fe.h               |  2 +-
>>   include/disas/dis-asm.h                 |  2 +-
>>   include/hw/acpi/aml-build.h             | 12 +++----
>>   include/hw/core/cpu.h                   |  2 +-
>>   include/hw/hw.h                         |  2 +-
>>   include/hw/virtio/virtio.h              |  2 +-
>>   include/hw/xen/xen-bus-helper.h         |  4 +--
>>   include/hw/xen/xen-bus.h                |  4 +--
>>   include/hw/xen/xen_common.h             |  2 +-
>>   include/hw/xen/xen_pvdev.h              |  2 +-
>>   include/monitor/monitor.h               |  4 +--
>>   include/qapi/error.h                    | 20 ++++++------
>>   include/qapi/qmp/qjson.h                |  8 ++---
>>   include/qemu/buffer.h                   |  2 +-
>>   include/qemu/compiler.h                 | 11 ++-----
>>   include/qemu/error-report.h             | 24 +++++++-------
>>   include/qemu/log-for-trace.h            |  2 +-
>>   include/qemu/log.h                      |  2 +-
>>   include/qemu/qemu-print.h               |  8 ++---
>>   include/qemu/readline.h                 |  2 +-
>>   qga/guest-agent-core.h                  |  2 +-
>>   qga/vss-win32/requester.h               |  2 +-
>>   scripts/cocci-macro-file.h              |  2 +-
>>   tests/qtest/libqos/libqtest.h           | 42 ++++++++++++-------------
>>   tests/qtest/libqtest-single.h           |  2 +-
>>   tests/qtest/migration-helpers.h         |  6 ++--
>>   audio/alsaaudio.c                       |  4 +--
>>   audio/dsoundaudio.c                     |  4 +--
>>   audio/ossaudio.c                        |  4 +--
>>   audio/paaudio.c                         |  2 +-
>>   audio/sdlaudio.c                        |  2 +-
>>   block/blkverify.c                       |  2 +-
>>   block/ssh.c                             |  4 +--
>>   fsdev/9p-marshal.c                      |  2 +-
>>   fsdev/virtfs-proxy-helper.c             |  2 +-
>>   hw/9pfs/9p.c                            |  2 +-
>>   hw/acpi/aml-build.c                     |  4 +--
>>   hw/mips/fuloong2e.c                     |  2 +-
>>   hw/mips/malta.c                         |  2 +-
>>   hw/net/rtl8139.c                        |  2 +-
>>   hw/virtio/virtio.c                      |  2 +-
>>   io/channel-websock.c                    |  2 +-
>>   monitor/hmp.c                           |  4 +--
>>   nbd/server.c                            | 10 +++---
>>   qemu-img.c                              |  4 +--
>>   qemu-io.c                               |  2 +-
>>   qobject/json-parser.c                   |  2 +-
>>   softmmu/qtest.c                         |  4 +--
>>   tests/qtest/libqtest.c                  |  2 +-
>>   tests/unit/test-qobject-input-visitor.c |  4 +--
>>   audio/coreaudio.m                       |  4 +--
>>   scripts/checkpatch.pl                   |  2 +-
>>   58 files changed, 130 insertions(+), 137 deletions(-)
> 
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index 3baa5e3790f7..f2bd050e3b9a 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -79,19 +79,12 @@
>>   #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
>>                                      sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>> -#if defined(__clang__)
>> -/* clang doesn't support gnu_printf, so use printf. */
>> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
>> -#else
>> -/* Use gnu_printf (qemu uses standard format strings). */
>> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
>> -# if defined(_WIN32)
>> +#if !defined(__clang__) && defined(_WIN32)
>>   /*
>>    * Map __printf__ to __gnu_printf__ because we want standard format 
>> strings even
>>    * when MinGW or GLib include files use __printf__.
>>    */
>> -#  define __printf__ __gnu_printf__
>> -# endif
>> +# define __printf__ __gnu_printf__
>>   #endif
> 
> Can we also poison GCC_FMT_ATTR? Maybe split in 2 patches, 1 converting
> and another removing unused & poisoning?

I don't think that poisoning is required here since this macro is not used 
in "#ifdef" statements - so the compiler will complain to you if you still 
try to use it after the removal.

  Thomas


