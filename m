Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A3452D27
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:51:17 +0100 (CET)
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuBO-0006rJ-GE
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:51:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmu9y-0005ew-JF
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmu9u-0003lr-Pw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637052581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rd2DwpRU7DeqnZrV+NsHC64BgAkROOJjjpWbQr2zH58=;
 b=Jc+7uHdrvrVUeN0XHp4AzZyKZV5qgmyNkrq5KcI8tJDdnh54V8vkXTeXP1RcVUCRD0oYAq
 GLzfMhnSBe/2GAZe3Ojyoa6VWAKAXMH+Xswn0IzGBqVL6xCkaUnkMxm/NKG7ivGJhaTvdu
 4UmC8fzgkQ4in2Eh4JWPiqPHrE8buEo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-qaSYxb1VPX-63JBFpua2Uw-1; Tue, 16 Nov 2021 03:49:39 -0500
X-MC-Unique: qaSYxb1VPX-63JBFpua2Uw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so7048208wmj.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 00:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rd2DwpRU7DeqnZrV+NsHC64BgAkROOJjjpWbQr2zH58=;
 b=gSC+0cVNlm1nGZCQuS5ipP9Tbw3xqPU6cRG2p6tELNQosrE0R7L4q0omQ75xcHDrLX
 riwMIELIoInzw3pFR5nEQvtwKxkas4ZDhIfsu5iPTt/7VNtuTjpC/+IFkRKq926t3NTP
 S1W4sBNbUQESJ6oePDgbAhKrNAt8bnlAqhtlrsuDvt8oCTeym3V0gl7HbU/4O6qj/B+z
 rJ1wuTfuUU+tIaQrbaDdM1DYK/vsCKrJ5KaNpaWHJTPqF7u0w4udGrkSUp40uo7Oj669
 wGLic6sCeilOZ5lCjkQQZAzaeldWiEXUanARurguczXMXm3xCh3hA8w1KZs0PuQsHc15
 w+1g==
X-Gm-Message-State: AOAM532mNNfLmSWzpHDEjTdXS/Ddr6iythS5hWBtqU5ADYv1Lq4x3eXG
 qMDXOi2lQ/TtghJggMFpWDVyIXObwkCDpaKgnUivSZ7yCIBAaVItbARzMCZyLj2Z0SMFKpCosfv
 TcblPxULSG87Z0mg=
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr7178006wrs.136.1637052577469; 
 Tue, 16 Nov 2021 00:49:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU3fH7RTIsfa8YXZR07BLGaergEPEatBaisOU/oPRf5JLnxooVkWLBHwlhYqa4dZJmfuBAzw==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr7177979wrs.136.1637052577268; 
 Tue, 16 Nov 2021 00:49:37 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l2sm1881781wmq.42.2021.11.16.00.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:49:36 -0800 (PST)
Message-ID: <835486b4-4dd8-6d73-e94d-936d02961471@redhat.com>
Date: Tue, 16 Nov 2021 09:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 00/13] Block layer patches
To: Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20211115145409.176785-1-kwolf@redhat.com>
 <1c9b8d2f-7e93-b0d3-bccb-1fcb43b5bb0a@linaro.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <1c9b8d2f-7e93-b0d3-bccb-1fcb43b5bb0a@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15.11.21 21:55, Richard Henderson wrote:
> On 11/15/21 3:53 PM, Kevin Wolf wrote:
>> The following changes since commit 
>> 42f6c9179be4401974dd3a75ee72defd16b5092d:
>>
>>    Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu 
>> into staging (2021-11-12 12:28:25 +0100)
>>
>> are available in the Git repository at:
>>
>>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
>>
>> for you to fetch changes up to 7461272c5f6032436ef9032c091c0118539483e4:
>>
>>    softmmu/qdev-monitor: fix use-after-free in qdev_set_id() 
>> (2021-11-15 15:49:46 +0100)
>>
>> ----------------------------------------------------------------
>> Block layer patches
>>
>> - Fixes to image streaming job and block layer reconfiguration to make
>>    iotest 030 pass again
>> - docs: Deprecate incorrectly typed device_add arguments
>> - file-posix: Fix alignment after reopen changing O_DIRECT
>>
>> ----------------------------------------------------------------
>> Hanna Reitz (10):
>>        stream: Traverse graph after modification
>>        block: Manipulate children list in .attach/.detach
>>        block: Unite remove_empty_child and child_free
>>        block: Drop detached child from ignore list
>>        block: Pass BdrvChild ** to replace_child_noperm
>>        block: Restructure remove_file_or_backing_child()
>>        transactions: Invoke clean() after everything else
>>        block: Let replace_child_tran keep indirect pointer
>>        block: Let replace_child_noperm free children
>>        iotests/030: Unthrottle parallel jobs in reverse
>>
>> Kevin Wolf (2):
>>        docs: Deprecate incorrectly typed device_add arguments
>>        file-posix: Fix alignment after reopen changing O_DIRECT
>>
>> Stefan Hajnoczi (1):
>>        softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
>>
>>   docs/about/deprecated.rst   |  14 +++
>>   include/qemu/transactions.h |   3 +
>>   block.c                     | 233 
>> +++++++++++++++++++++++++++++++++-----------
>>   block/file-posix.c          |  20 +++-
>>   block/stream.c              |   7 +-
>>   softmmu/qdev-monitor.c      |   2 +-
>>   util/transactions.c         |   8 +-
>>   tests/qemu-iotests/030      |  11 ++-
>>   tests/qemu-iotests/142      |  22 +++++
>>   tests/qemu-iotests/142.out  |  15 +++
>>   10 files changed, 269 insertions(+), 66 deletions(-)
>
> This is failing iotest 142 for build-tcg-disabled.
> I did retry, in case it was transitory.
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1784955950

Thanks, seems like a problem that appears on block devices with sector 
sizes greater than 512 bytes.  Since Kevin is on PTO, I’ll (try to) fix 
the test and send a v2.

Hanna


