Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D34D764E
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 16:20:26 +0100 (CET)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTQ1B-0003vc-IH
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 11:20:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTPzl-0002lw-0y; Sun, 13 Mar 2022 11:18:57 -0400
Received: from [2a00:1450:4864:20::32f] (port=54862
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTPzj-00032w-7b; Sun, 13 Mar 2022 11:18:56 -0400
Received: by mail-wm1-x32f.google.com with SMTP id r64so194988wmr.4;
 Sun, 13 Mar 2022 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1+SJBNUyj3jJZjSCBuNAgCSmt+VFGxXbGY6oE4tuiak=;
 b=UqOUGeqO0gp/OO5wx6W5Kh1iyftjvtTvymSVQyYad4FJpJ0d5NQV4TEGvo1grYV0nt
 eFA8usK8o2LnXRE0AhCZ86OqYbwD0Q0r2G+bdsTBtuEqvFH+UkFIAdibvkPDmx8sqQp1
 wRRgLdqYs21OiH5iaZf0P3AXn0QK0GPAft01VgW5g/+7p0VlA7Uir0twpUcHDnDilzeu
 UWeHlW2GyE2P1tZt3lPyZ9t0vGUlc5qvj8y47L3nO92+AqTEj8buQpnjlfQuYWvlGNyT
 KUTLCXL6ugDxlB9X6tsgJfwl55PkOkVX61Ycx9526oUa+oEYWbpfVyGLlZrdqqMv2CuB
 RXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1+SJBNUyj3jJZjSCBuNAgCSmt+VFGxXbGY6oE4tuiak=;
 b=YdKnr1Ygd3LsRiSn3RZCCfqx3HtJhIJ4+p1Yh9qZzUdPqFw1TQRkES+LP3ABbVqLhu
 Yxq09O+yHCFemZjoss2ncjW1CbRV+icRjpEMwZ0d/yZ13ejf2jph7PngQXOrFOub+Dtb
 oG0BUcisKh5CBo4gywJ1bYAeQ8WUtRHg3xwQJvDRWYw66XMAjY/dYm1AWtW8hYlBcyi4
 18njU9+03sRXW6xEMCjyNzfT6hD3tHZtgHlQRKvs9DCQJtgGs4/8xyoJ16uD94T5i4jB
 kNTYk6Ergt4PWqLz2bXJLycPh6xgYewbeBDABzLeFmjgniY8G5kdmp6WSr2E1sGxrE7a
 QMzQ==
X-Gm-Message-State: AOAM5311Mm144qHDSsSvom6Leh9oVuA3rTFjYMY6vYk9YGUAwN0vmWHN
 jYESDRkkdCn5kLpSNXfakHA=
X-Google-Smtp-Source: ABdhPJwXj8raSmLK3G9eW5T2NiuO3HEE4sFcnm9yD0YyocBT92BwT9FcGdOFgENsaBg9ZQcnVEFA+A==
X-Received: by 2002:a1c:4489:0:b0:389:8b0f:9a67 with SMTP id
 r131-20020a1c4489000000b003898b0f9a67mr14552996wma.40.1647184732869; 
 Sun, 13 Mar 2022 08:18:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 p125-20020a1c2983000000b00389cc36a3bfsm14881763wmp.6.2022.03.13.08.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 08:18:52 -0700 (PDT)
Message-ID: <1b458cc0-08a0-578d-83f3-90d5d94bd245@redhat.com>
Date: Sun, 13 Mar 2022 16:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/35] stackless coroutine backend
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
 <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
 <a8997433-dfe6-58f7-d5ca-e0ec3e12b7f1@redhat.com>
 <YisWGCF9oIkr5yeB@stefanha-x1.localdomain>
 <a92b23e8-e545-a43d-7283-6c6d215a10f8@redhat.com>
 <Yis9wszzwwu2CGmZ@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yis9wszzwwu2CGmZ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/22 13:17, Daniel P. Berrangé wrote:
>> Only files that define or use a coroutine_fn (which includes callers of
>> qemu_coroutine_create) would have to be compiled as C++.
> Unless I'm misunderstanding what you mean, "define a coroutine_fn"
> is a very large number of functions/files
> 
>    $ git grep coroutine_fn | wc -l
>    806
>    $ git grep -l coroutine_fn | wc -l
>    132
> 
> Dominated by the block layer of course, but tentacles spreading
> out into alot of other code.

The main other user is 9pfs, then there is:

hw/remote/message.c
io/channel.c
job.c
migration/savevm.c
monitor/hmp-cmds.c
monitor/monitor-internal.h
monitor/qmp.c
nbd/client-connection.c
nbd/client.c
nbd/server.c
net/colo-compare.c
net/filter-mirror.c
scsi/pr-manager.c
scsi/qemu-pr-helper.c
ui/console.c
util/vhost-user-server.c

> Feels like identifying all callers would be tedious/unpleasant enough,
> that practically speaking we would have to just compile all of QEMU
> as C++.

Yes, it's a large amount of code, but it's relatively self-contained. 
In io/ for example only three functions would have to become C++ 
(qio_channel_readv_full_all_eof, qio_channel_writev_full_all, 
qio_channel_yield), and it's easy to move them to a separate file 
io/channel-coroutine.cc.

Likewise for e.g. util/async.c or util/thread-pool.c (one function each).

The block layer would almost entirely move to C++, that's for sure.  The 
monitor would be a bit more in the middle, but hardware emulation can 
remain 100% C.

I haven't gotten the thing to compile or run yet, and I'm not sure how 
much time I'll have this week, but the change for test-coroutine.c to 
run should be in the ballpark of this:

  include/qemu/coroutine.h                                 |  26
  tests/unit/meson.build                                   |   6
  tests/unit/{test-coroutine.c => test-coroutine.cc}       | 106
  util/meson.build                                         |   4
  util/{qemu-coroutine-lock.c => qemu-coroutine-lock.cc}   |  65
  util/{qemu-coroutine-sleep.c => qemu-coroutine-sleep.cc} |  10

where the changes are for a good part mechanical: switching from "x 
coroutine_fn" to CoroutineFn<x> entirely so, while adding co_await in 
front of coroutine calls is half mechanical.  For non-void functions, 
the compiler can identify all callers (because the old type "int" is not 
compatible with the new type CoroutineFn<int>).  For void function one 
could use warn_unused_result.

The question is what is easier to maintain, stack switching code that is 
becoming less and less portable (status quo with SafeStack, CET and the 
TLS issues that Stefan has worked on), a mixed C/C++ codebase (C++ 
coroutines), a custom source-to-source translator (this series).  The 
third might be more fun, but it would be quite a large enterprise and 
the C++ compiler writers have already done the work.

A part of the changes is common in both cases, since you cannot have 
code that can run both inside or outside a coroutine.

Paolo

