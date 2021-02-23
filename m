Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155932293A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:07:47 +0100 (CET)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVXe-0004xy-J0
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVWL-0003z0-IG
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:06:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVWI-0003qd-MR
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614078379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2uXLYRMAC2N+h9kAD8pfV9fUyGeI2cgipHmeM2c180=;
 b=M5coQiO3jYiIsWG6iDh3I40xfEjhBlDDnRACIV/Jr2AWOkfVEvag2zZ1vBsdhxRqbIDakf
 9NVZ6LwkD7APhWkt8DfUQHB6J7LEM3u+wVBPN8fv+WA8VV5+jg0oZA4qY+8RDHWYaXPgKE
 PV/wpvkz4WJw5pmAgefDdrT0myQ9axY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-sHlVzaD7MeWDaKrUet9Aiw-1; Tue, 23 Feb 2021 06:06:15 -0500
X-MC-Unique: sHlVzaD7MeWDaKrUet9Aiw-1
Received: by mail-wr1-f69.google.com with SMTP id e11so7097525wro.19
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L2uXLYRMAC2N+h9kAD8pfV9fUyGeI2cgipHmeM2c180=;
 b=snLbgjkHWOMKbLb0zo8kKpsqAmZKNWdFdo1EjcntR2a8+vQhReXyDsRvGkIaK0gHRd
 PY6lGFktV93siABgGxdXBfhKZ+V8Y4msJOWGFk5E0s7ICz+lp160W6dlX/nKym/EewgL
 bbBMEJQQqxK/nfOQki4h5BzB2/Rg8sq0g2A8mL4mUZlhURSFiPM25THG2PRQh08LrbVf
 N8OFik8V+YmeWLpfsLcU9W7XDP0MiGjvv/av09u6F6Ql97dKnQiU3xonB1PT3okgSbpe
 B5tbGIH/mqWh9u2PTERIM/jISnl5gctlEH+ES+lfn1amecIDk+P67j2Fk20vogY2kZ+M
 fNtA==
X-Gm-Message-State: AOAM5334WdfWB409q4zbfajTKj213JbVclK7OW7Mzp4BXjjZUAFt09WR
 0RxCn/yPJPTXr+MSPmYzVMFTN4umbeggeRxUinukF337hqeC/9kEXl4Yp4WA+z0n1VcS72hdLRz
 5ReLkD/DNxU+U89Y=
X-Received: by 2002:a1c:4386:: with SMTP id
 q128mr24585506wma.184.1614078374618; 
 Tue, 23 Feb 2021 03:06:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFNnn5tL8zrWQO3aKAGyevuVl2LVYTAiPGSNAi/xnNdGq5NAMB8bx22Gv/th3PA6dU5e8iug==
X-Received: by 2002:a1c:4386:: with SMTP id
 q128mr24585461wma.184.1614078374346; 
 Tue, 23 Feb 2021 03:06:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l4sm31596613wrt.42.2021.02.23.03.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:06:13 -0800 (PST)
Subject: Re: [PATCH v2 00/12] block/export: vhost-user-blk server tests and
 input validation
To: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20210215104120.GE7226@merkur.fritz.box>
 <CAFEAcA-Urs8JYHmAC1mbtbSNWhTsKyer=8i9zdSpnsa2eH4i2Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a0b89aef-e3a7-cfcb-5ca1-1fb83f2a42e7@redhat.com>
Date: Tue, 23 Feb 2021 12:06:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Urs8JYHmAC1mbtbSNWhTsKyer=8i9zdSpnsa2eH4i2Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 11:38 PM, Peter Maydell wrote:
> On Mon, 15 Feb 2021 at 10:41, Kevin Wolf <kwolf@redhat.com> wrote:
>>
>> Am 07.12.2020 um 18:20 hat Stefan Hajnoczi geschrieben:
>>> v2:
>>>  * Add abrt handler that terminates qemu-storage-daemon to
>>>    vhost-user-blk-test. No more orphaned processes on test failure. [Peter]
>>>  * Fix sector number calculation in vhost-user-blk-server.c
>>>  * Introduce VIRTIO_BLK_SECTOR_BITS/SIZE to make code clearer [Max]
>>>  * Fix vhost-user-blk-server.c blk_size double byteswap
>>>  * Fix vhost-user-blk blkcfg->num_queues endianness [Peter]
>>>  * Squashed cleanups into Coiby vhost-user-blk-test commit so the code is
>>>    easier to review
>>>
>>> The vhost-user-blk server test was already in Michael Tsirkin's recent vhost
>>> pull request, but was dropped because it exposed vhost-user regressions
>>> (b7c1bd9d7848 and the Based-on tag below). Now that the vhost-user regressions
>>> are fixed we can re-introduce the test case.
>>>
>>> This series adds missing input validation that led to a Coverity report. The
>>> virtio-blk read, write, discard, and write zeroes commands need to check
>>> sector/byte ranges and other inputs. This solves the issue Peter Maydell raised
>>> in "[PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid potential
>>> integer overflow".
>>>
>>> Merging just the input validation patches would be possible too, but I prefer
>>> to merge the corresponding tests so the code is exercised by the CI.
>>
>> Is this series still open? I don't see it in master.
> 
> The Coverity issue is still unfixed, at any rate...

Copying Coverity report here:

CID 1435956 Unintentional integer overflow

In vu_blk_discard_write_zeroes: An integer overflow occurs, with the
result converted to a wider integer type (CWE-190)

 61 static int coroutine_fn
 62 vu_blk_discard_write_zeroes(BlockBackend *blk, struct iovec *iov,
 63                             uint32_t iovcnt, uint32_t type)
 64 {
 65     struct virtio_blk_discard_write_zeroes desc;
 66     ssize_t size = iov_to_buf(iov, iovcnt, 0, &desc, sizeof(desc));
 67     if (unlikely(size != sizeof(desc))) {
 68         error_report("Invalid size %zd, expect %zu", size,
sizeof(desc));
 69         return -EINVAL;
 70     }
 71
 72     uint64_t range[2] = { le64_to_cpu(desc.sector) << 9,

CID 1435956 (#1 of 1): Unintentional integer overflow
(OVERFLOW_BEFORE_WIDEN)
overflow_before_widen: Potentially overflowing expression
le32_to_cpu(desc.num_sectors) << 9 with type uint32_t (32 bits,
unsigned) is evaluated using 32-bit arithmetic, and then used in a
context that expects an expression of type uint64_t (64 bits, unsigned).

 73                           le32_to_cpu(desc.num_sectors) << 9 };


