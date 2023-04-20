Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477496E92B2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:30:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppSTt-00037V-VK; Thu, 20 Apr 2023 07:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppSTr-00036w-NI
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppSTp-0006TM-No
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681990175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=witFortVks2TnanPpCPeq/ZqQrnr0OUGSDRUtQqUWhY=;
 b=U3xVAKmt7GD5cjolI2zHcUauBZImFBfcishNM2dLcWrXGzrJfLeU0QKwDNGd8q8cM8vheu
 G96usdYdU9HB1KBGsnkR41bFfkrYgW1UDi8M2YfMnuTvWdk3IPPob4la4dxgd2kMNKByJ2
 DqWiVfLOU5O8texc3oozUAjavXrK+tE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-e-fcw63HMQaNv5oKw5Tlxg-1; Thu, 20 Apr 2023 07:29:33 -0400
X-MC-Unique: e-fcw63HMQaNv5oKw5Tlxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 hg24-20020a05600c539800b003f066c0b044so2020108wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 04:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681990172; x=1684582172;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=witFortVks2TnanPpCPeq/ZqQrnr0OUGSDRUtQqUWhY=;
 b=kZhSLWzF1vxBffujrlqjPx1mysjx7tfXU7QLul6thZlSH3Sie8732hUHclczLa+ArS
 3oraNYS+xRQIIlJ/98Fy43Whdv9AjtRfU+dntdOyu4kseaW5YjFo0KTedD8+bW1xHGNs
 tzF6pETnzfX4c9sgu72d/bXK7jmUkt1GyXooRI+0mxRhvTophEHeuEJjgnEf50ewlSSs
 aMT3cqNaz4p+zYkPioGkVPTh2TONwVYNpNJPjT8Kwt+m77P7b8gu++5yIJCo2gsAZ5po
 wGrIaG9Cwl/ZuYzmU0UsxeqyhUZJnDoxzgTlSZ+W07zrYFSHl5g7qyjtZ1YIbSowrAMx
 VnDA==
X-Gm-Message-State: AAQBX9cVsCpHeJZonBcYVMuzTppi+gy/fKIWv2xa73VWe4a5koZjb3lD
 52R9DqLd7gaSxDie/YOW7JDsnSdQWs0Ndk2hI9/zSVfULiPATpuv5c7Nxbud7/hJN/pitJDqO6g
 68XlzRnus9VYZ1wg=
X-Received: by 2002:a05:600c:2046:b0:3f1:6942:e024 with SMTP id
 p6-20020a05600c204600b003f16942e024mr1097951wmg.27.1681990172565; 
 Thu, 20 Apr 2023 04:29:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bUGlGmeXhKxr2cHGCruyTGfnlpFwK6Yp+j/uBQs5e+x5t70CK2K8D5lTewwp4d/Ep5GfbmoQ==
X-Received: by 2002:a05:600c:2046:b0:3f1:6942:e024 with SMTP id
 p6-20020a05600c204600b003f16942e024mr1097939wmg.27.1681990172176; 
 Thu, 20 Apr 2023 04:29:32 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003f17848673fsm1740720wml.27.2023.04.20.04.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 04:29:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "you.chen" <you.chen@intel.com>,  qemu-devel@nongnu.org,  "dennis . wu"
 <dennis.wu@intel.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 2/2] migration: add support for qatzip compression
 when doing live migration
In-Reply-To: <87r0siabbo.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 17 Apr 2023 15:27:07 +0200")
References: <20230417083935.415782-1-you.chen@intel.com>
 <20230417083935.415782-3-you.chen@intel.com>
 <87r0siabbo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 13:29:30 +0200
Message-ID: <874jpazt9h.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> "you.chen" <you.chen@intel.com> writes:
>
>> Add config and logics to use qatzip for page compression, in order
>> to support qatzip compression better, we collect multipe pages
>> together to do qatzip compression for best performance.
>> And we use compile option CONFIG_QATZIP to determine whether should qatzip related code be compiled or not.
>>
>> Co-developed-by: dennis.wu <dennis.wu@intel.com>
>> Signed-off-by: you.chen <you.chen@intel.com>
>
> [...]
>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index c84fa10e86..6459927c7a 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -644,6 +644,8 @@
>>  #                  no compression, 1 means the best compression speed, and 9 means best
>>  #                  compression ratio which will consume more CPU.
>>  #
>> +# @compress-with-qat: compress with qat on and off. (Since 8.1)
>> +#
>>  # @compress-threads: Set compression thread count to be used in live migration,
>>  #                    the compression thread count is an integer between 1 and 255.
>>  #
>> @@ -784,7 +786,7 @@
>>  { 'enum': 'MigrationParameter',
>>    'data': ['announce-initial', 'announce-max',
>>             'announce-rounds', 'announce-step',
>> -           'compress-level', 'compress-threads', 'decompress-threads',
>> +           'compress-level', 'compress-with-qat', 'compress-threads', 'decompress-threads',
>>             'compress-wait-thread', 'throttle-trigger-threshold',
>>             'cpu-throttle-initial', 'cpu-throttle-increment',
>>             'cpu-throttle-tailslow',
>> @@ -815,6 +817,8 @@
>>  #
>>  # @compress-level: compression level
>>  #
>> +# @compress-with-qat: compression with qat (Since 8.1)
>> +#
>>  # @compress-threads: compression thread count
>>  #
>>  # @compress-wait-thread: Controls behavior when all compression threads are
>> @@ -954,6 +958,7 @@
>>              '*announce-rounds': 'size',
>>              '*announce-step': 'size',
>>              '*compress-level': 'uint8',
>> +            '*compress-with-qat': 'bool',
>>              '*compress-threads': 'uint8',
>>              '*compress-wait-thread': 'bool',
>>              '*decompress-threads': 'uint8',
>> @@ -1152,6 +1157,7 @@
>>              '*announce-rounds': 'size',
>>              '*announce-step': 'size',
>>              '*compress-level': 'uint8',
>> +            '*compress-with-qat': 'bool',
>>              '*compress-threads': 'uint8',
>>              '*compress-wait-thread': 'bool',
>>              '*decompress-threads': 'uint8',
>
> We already have MigrationCapability compress
>
>     # @compress: Use multiple compression threads to accelerate live migration.
>     #            This feature can help to reduce the migration traffic, by sending
>     #            compressed pages. Please note that if compress and xbzrle are both
>     #            on, compress only takes effect in the ram bulk stage, after that,
>     #            it will be disabled and only xbzrle takes effect, this can help to
>     #            minimize migration traffic. The feature is disabled by default.
>     #            (since 2.4 )

I had the patch to deprecate it on 8.1.
And now colo is using it.  Sniff.

> and xbzrle
>
>     # @xbzrle: Migration supports xbzrle (Xor Based Zero Run Length Encoding).
>     #          This feature allows us to minimize migration traffic for certain work
>     #          loads, by sending compressed difference of the pages
>     #

Diferent can of worms, but I agree with you.

> and MigrationParameters / MigrateSetParameters multifd-compression
>
>     # @multifd-compression: Which compression method to use.
>     #                       Defaults to none. (Since 5.0)
>     #
>     # @multifd-zlib-level: Set the compression level to be used in live
>     #                      migration, the compression level is an integer between 0
>     #                      and 9, where 0 means no compression, 1 means the best
>     #                      compression speed, and 9 means best compression ratio which
>     #                      will consume more CPU.
>     #                      Defaults to 1. (Since 5.0)
>     #
>     # @multifd-zstd-level: Set the compression level to be used in live
>     #                      migration, the compression level is an integer between 0
>     #                      and 20, where 0 means no compression, 1 means the best
>     #                      compression speed, and 20 means best compression ratio which
>     #                      will consume more CPU.
>     #                      Defaults to 1. (Since 5.0)
>
> where multifd-compression is
>
>     ##
>     # @MultiFDCompression:
>     #
>     # An enumeration of multifd compression methods.
>     #
>     # @none: no compression.
>     # @zlib: use zlib compression method.
>     # @zstd: use zstd compression method.
>     #
>     # Since: 5.0
>     ##

I think it belongs here as another compression method.

Later, Juan.

> How does this all fit together?  It feels like a bunch of featured piled
> onto each other, then shaken well.  Or am I confused?
>
> I could use an abstract description of compression in migration.

compression -> old code, uses threads and compress a page at a time
               (i.e. takes more time to copy the code to the thread that
               what we got in return). Data is copied several times.

xbzrle: use a cache of already sent pages and sent the difference.
        Not really very useful execpt if you are migrating over data
        centers.  Here you trade memory and cpu consumption on the host
        for less network bandwidth used.
        Current cache size default is a joke, but that is a complete
        different can of worms.

multifd compression: it is much better (I know that I am the author, but
                     the whole reason to create it was to address the
                     shortcuts of the old compression code).
                     highlights:
                     - compress 64 pages at at time, so get much better
                       compression ratios.
                     - for each channel, it never resets the compression
                       during migration, that means that it compress
                       much better.  For the few things that I know
                       about compression, new methods are based heavily
                       in dictionaries, so you need long sessions to get
                       best effectivity.
                     - it minimizes the number of copies.  zstd, no
                       copies at all.  zlib -> it makes one copy because
                       hardware implmentations (s390x I am looking at
                       you) make two passes through the data in some
                       cases.

I plan to add xbzre in the near future to multifd compression so I can
also deprecate it,

But someone will appears that really needs it O:-)

Later, Juan.


