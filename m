Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A76A391E1E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:27:51 +0200 (CEST)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxJu-0000bv-5H
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llxBU-0006x9-UF
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llxBR-0002OO-B0
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622049540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+AFTuPCoBFpwBNn5Reg3hcyVRiaaZxD8xS54IvBCFE=;
 b=RdeBLUJF1Hbc/QsBjO9UI7eAf69FiTkeh/ZeCCPSTBW19YSIaERfrVDTPHLCASv2yr49Pa
 mV/zVDcvBICWriNK/aftSd0G+G9SgqsdPE/GS7L6QRGDhFrKSLXG20bSNK/8DYU3d6/p2n
 NMXLi2t9GUP+/5vPe2I07/7EdMLY5Hc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-dKratNoFOcmr0Bi1aKB4Ng-1; Wed, 26 May 2021 13:18:58 -0400
X-MC-Unique: dKratNoFOcmr0Bi1aKB4Ng-1
Received: by mail-wr1-f70.google.com with SMTP id
 f16-20020a5d50d00000b0290114238aa727so627572wrt.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P+AFTuPCoBFpwBNn5Reg3hcyVRiaaZxD8xS54IvBCFE=;
 b=kNNPBdXu7Ct3fwMVXybJWEqmEcrSCQcHU1yTprNqfdsXC/PAEs11X5b+EPjYrNhKtG
 4y87WITs7f0MhsvVE5yX8yX85UNX8ACDv+7oy5EfD4HYBCoTvz7oSUeGJxseIdHpa0Dr
 r0YtppfgRE7BgLukb1Q1L1JVbJaTOYJq0g6U2kfanBJe4J0/vcfz4i41vQcWdTaFpg6D
 i4Z2o1XVthBrsjLXztFDgaC+enBR2naRzGz55EN2CrgXsr0ueNXG9r/EHVjs8/I+EBsd
 RoQFFIma4F6eE+xTnpgR0uEnL8KU0ujcWdsQLU4gfTRGUv9nFw/wIXwKiRdKXrj3Wwq2
 paiw==
X-Gm-Message-State: AOAM533W02o/VIg2o/8ulSvGoO561Yr7cHGuYVuqqVp8CsvIKEWu/FVZ
 TpP1ot2KB5YEk2Js4mWOH/tXuyVjcJCQvIWxW0fjBdNq2RGbTw8KWCtwUYBl+FZNCi0v+Jvp8VG
 WoFon9sWvpQfox2Y=
X-Received: by 2002:adf:cc81:: with SMTP id p1mr33185077wrj.175.1622049536974; 
 Wed, 26 May 2021 10:18:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5/Vd+3ra4CJtPHXq+UMv5DEoIL9WEKtGFL0U9UxAL8vZqSZsi6/TTNf7rZZw6bMcBN6w06Q==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr33185051wrj.175.1622049536711; 
 Wed, 26 May 2021 10:18:56 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 c4sm21395420wrx.77.2021.05.26.10.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:18:56 -0700 (PDT)
Subject: Re: [PATCH v4 00/15] qemu_iotests: improve debugging options
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <a19cb269-2845-e219-ab20-7fe7a0389896@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <3b2e7701-b386-972b-bb0a-d560fd8b8cde@redhat.com>
Date: Wed, 26 May 2021 19:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a19cb269-2845-e219-ab20-7fe7a0389896@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/05/2021 13:32, Vladimir Sementsov-Ogievskiy wrote:
> 20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
>> This series adds the option to attach gdbserver and valgrind
>> to the QEMU binary running in qemu_iotests.
>> It also allows to redirect QEMU binaries output of the python tests
>> to the stdout, instead of a log file.
>>
>> Patches 1-6 introduce the -gdb option to both python and bash tests,
> 
> Could you describe how to use it?
> 
> I often have to debug qemu iotests with gdb, and can say the following:
> 
> 1. Test runs different qemu binaries (not only qemu, but also qemu-nbd, 
> qemu-img, qemu-io)
> 
> 2. Test can run qemu binaries several times, or even in parallel.
> 
> So, with a new option, how will I choice, which qemu (or qemu-nbd, etc) 
> process I want to be attached to gdb?
> 
> Currently, I do the following: I recompile with  "sleep(15);" at the 
> place where I want to attach, and start the test. During the sleep, I 
> find the needed process in "ps aux" output and start "gdb -p PID".. 
> Sometimes there may be troubles if the place where I inserted the sleep 
> is triggered on another code path.
> 
> So, with new option, can my workflow be improved or not?

Unfortunately not, unless you want to debug a qemu_system binary.
The usage should be clear in the doc patches of this series (please 
check them too if you haven't done already), but the idea is to just 
wrap gdb around every qemu binary usage.

If you apply these patches together with Paolo's "qemu-iotests: quality 
of life improvements", you will get something much better, where you can 
choose which test function to run under gdb.

If I recall correctly, you should be able to do something like:
check -gdb -- ../../../tests/qemu-iotests/055 TestCompressedToQcow2

Still, if the test function has multiple qemu binary invocations or in 
parallel, you gdb will be applied to all of them. I don't think 
test/debug granularity can be reduced any further, at least not so easily.

Thank you,
Emanuele

> 
>> 7-10 extend the already existing -valgrind flag to work also on
>> python tests, and patch 11 introduces -p to enable logging to stdout.
>>
>> In particular, patches 1,5,10 focus on extending the QMP socket timers
>> when using gdb/valgrind, otherwise the python tests will fail due to
>> delays in the QMP responses.
>>
>> This series is tested on the previous serie
>> "qemu-iotests: quality of life improvements"
>> but independent from it, so it can be applied separately.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>> v4:
>> * Rename environment variable from GDB_QEMU to GDB_OPTIONS
>> * This time test 297 (pylint) passes [Max]
>> * Refactor the qmp_timer field in machine.py, and add a new
>>    parameter in machine.py and subclasses constructor [John]
>> * Add additional check in patch 4 to cover the case where
>>    GDB_OPTIONS is empty
>>
>> Emanuele Giuseppe Esposito (15):
>>    python: qemu: add timer parameter for qmp.accept socket
>>    python: qemu: pass the wrapper field from QEMUQtestmachine to
>>      QEMUMachine
>>    docs/devel/testing: add debug section to the QEMU iotests chapter
>>    qemu-iotests: add option to attach gdbserver
>>    qemu-iotests: delay QMP socket timers
>>    qemu_iotests: insert gdbserver command line as wrapper for qemu binary
>>    qemu-iotests: add gdbserver option to script tests too
>>    docs/devel/testing: add -gdb option to the debugging section of QEMU
>>      iotests
>>    qemu-iotests: extend the check script to support valgrind for python
>>      tests
>>    qemu-iotests: extent QMP socket timeout when using valgrind
>>    qemu-iotests: allow valgrind to read/delete the generated log file
>>    qemu-iotests: insert valgrind command line as wrapper for qemu binary
>>    docs/devel/testing: add -valgrind option to the debug section of QEMU
>>      iotests
>>    qemu-iotests: add option to show qemu binary logs on stdout
>>    docs/devel/testing: add -p option to the debug section of QEMU iotests
>>
>>   docs/devel/testing.rst        | 30 +++++++++++++++++++
>>   python/qemu/machine.py        |  7 +++--
>>   python/qemu/qtest.py          |  9 ++++--
>>   tests/qemu-iotests/check      | 15 +++++++---
>>   tests/qemu-iotests/common.rc  |  8 ++++-
>>   tests/qemu-iotests/iotests.py | 56 +++++++++++++++++++++++++++++++----
>>   tests/qemu-iotests/testenv.py | 25 ++++++++++++++--
>>   7 files changed, 132 insertions(+), 18 deletions(-)
>>
> 
> 


