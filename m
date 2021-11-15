Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC54515F4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 22:02:01 +0100 (CET)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmj72-00007M-In
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 16:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmj4b-0007aM-OX
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmj4Y-00079L-T1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637009966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyxlz/iVHj8cTsslJ5NsEb1Z2oiFt/mtBa0vcagBudQ=;
 b=BYxUd15eFvgFtAi8XFEfBdzok2EnokTn6TMxdx7yUZ6QDOZH5s61iqNkITTbZc/vUu5WWe
 gaodaoahapclEmmXQ0ORtO4vS39gHZB/daZ+hOzUO9m7JhvdauhUavpiarmcZ38vjyl0J3
 fRFo31F/7sK+giDaEwyGXBjTtxoUl0k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-HcgeDBiIMbaF5FX7r43X4Q-1; Mon, 15 Nov 2021 15:59:22 -0500
X-MC-Unique: HcgeDBiIMbaF5FX7r43X4Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso3998909wrj.12
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uyxlz/iVHj8cTsslJ5NsEb1Z2oiFt/mtBa0vcagBudQ=;
 b=nYMtqDHdpEq4GmYNjHaIXX4cFJibMn4DOFqtrCKFXWgex0R8lzDRqHW1l7TmkTVlRI
 ZtIbipR5n5Z7p+hhopmYGuIhZpo7zPVMXXk2ZD+6aeADJ5pAfDUqBErsHTuE3a2yN/B1
 O+n4/vdr4cuijW0xlaQj56FGFTRWevFCWQk3hM6NtXGvnLwkiMr5DGFzFJHfOucXNcDG
 m20dqsQ4ii0W92daMuwwUiKrlTwrXp2xOUacBZtbpC9sYHHxK4MYD0Ggy6C+WRj46Qp5
 /734VKM3fucs8ZPcyPLGfeGynUM3rU+gtF6m7GRH7VSsIzhaPE9nENvWKRInWPelD7l8
 vtsw==
X-Gm-Message-State: AOAM533zVMaqBG1ClwRFROFvIZYHSrs8kihjmTbn8Tjq2FqWIqSFFqS6
 HREB2gxzYYt/Czs/AhpryOFyv6IwbaxqEN+FQeywQjbzFaJZU6LMM1PQCZFe2XFjCVSZhWnAbcm
 vhHu7Cw0eTTNgYLA=
X-Received: by 2002:adf:cd02:: with SMTP id w2mr2429197wrm.269.1637009960458; 
 Mon, 15 Nov 2021 12:59:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy75okP1X8q+xmcHKs0sOM930p9Csl4jdLBJOvQv4w+dAkGIy6i2TdPq/rwiDoIpXnsKsRcQQ==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr2429166wrm.269.1637009960214; 
 Mon, 15 Nov 2021 12:59:20 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id ay21sm402177wmb.7.2021.11.15.12.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 12:59:19 -0800 (PST)
Message-ID: <3de465a4-73ec-99b6-6bdc-7c030817b9e0@redhat.com>
Date: Mon, 15 Nov 2021 21:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 00/13] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20211115145409.176785-1-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211115145409.176785-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Kevin,

On 11/15/21 15:53, Kevin Wolf wrote:
> The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:
> 
>   Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)
> 
> are available in the Git repository at:
> 
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 7461272c5f6032436ef9032c091c0118539483e4:
> 
>   softmmu/qdev-monitor: fix use-after-free in qdev_set_id() (2021-11-15 15:49:46 +0100)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Fixes to image streaming job and block layer reconfiguration to make
>   iotest 030 pass again
> - docs: Deprecate incorrectly typed device_add arguments
> - file-posix: Fix alignment after reopen changing O_DIRECT
> 
> ----------------------------------------------------------------
> Hanna Reitz (10):
>       stream: Traverse graph after modification
>       block: Manipulate children list in .attach/.detach
>       block: Unite remove_empty_child and child_free
>       block: Drop detached child from ignore list
>       block: Pass BdrvChild ** to replace_child_noperm
>       block: Restructure remove_file_or_backing_child()
>       transactions: Invoke clean() after everything else
>       block: Let replace_child_tran keep indirect pointer
>       block: Let replace_child_noperm free children
>       iotests/030: Unthrottle parallel jobs in reverse
> 
> Kevin Wolf (2):
>       docs: Deprecate incorrectly typed device_add arguments
>       file-posix: Fix alignment after reopen changing O_DIRECT
> 
> Stefan Hajnoczi (1):
>       softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
> 
>  docs/about/deprecated.rst   |  14 +++
>  include/qemu/transactions.h |   3 +
>  block.c                     | 233 +++++++++++++++++++++++++++++++++-----------
>  block/file-posix.c          |  20 +++-
>  block/stream.c              |   7 +-
>  softmmu/qdev-monitor.c      |   2 +-
>  util/transactions.c         |   8 +-
>  tests/qemu-iotests/030      |  11 ++-
>  tests/qemu-iotests/142      |  22 +++++
>  tests/qemu-iotests/142.out  |  15 +++
>  10 files changed, 269 insertions(+), 66 deletions(-)

Looking at current /staging I noticed iotest#142 failed,
build-tcg-disabled job:

+++ 142.out.bad
@@ -750,6 +750,7 @@
 --- Alignment after changing O_DIRECT ---
+qemu-io: Cannot get 'write' permission without 'resize': Image size is
not a multiple of request alignment
 read 42/42 bytes at offset 42
 42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 42/42 bytes at offset 42

https://gitlab.com/qemu-project/qemu/-/jobs/1784955950#L2794


