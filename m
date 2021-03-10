Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029693338E7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:36:52 +0100 (CET)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvGu-00041y-1O
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJvFc-0002qO-SH
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:35:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJvFT-0001xs-AG
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615368922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Imr+gHTgpkhAAlzvDUwJu9pcFlTphdWrY0+YyKfrvTg=;
 b=BAzNMx3RIDgBxZ8oNFU6xevZXKacUfdVgZ7RhsxSF4qCak5TogYPnASZbAQQHTZdd3IKN5
 /M8aa4Pw/jOj7VKgPvxTmLk0r4nbgmfI8mD0pnsu/inN9SLPh/Gldnc8WP4MX46jgmPRR7
 gGtiGlQVoGhYvO0WMLCFAsvLD2anoaA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-jdqdPPf_OdeU_dMJgywv7g-1; Wed, 10 Mar 2021 04:35:19 -0500
X-MC-Unique: jdqdPPf_OdeU_dMJgywv7g-1
Received: by mail-wr1-f70.google.com with SMTP id e13so7718327wrg.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 01:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Imr+gHTgpkhAAlzvDUwJu9pcFlTphdWrY0+YyKfrvTg=;
 b=W9XX5c7Ld0RtOVfhbUVRAnUPuxRxoo2+RVCiVKQYcrHA1PzRBefFV+uSfjBMQvD1Db
 b+ZVxU+v5554gi6pIcJEIhi72xF5Hh9IzEt/Qrdl6PLDA4T32diWvEdgrIBATcUl1YoX
 cIIuzbHqh1JLjhBRhvxd698pDjtFe6Yip+qP66Ra3kPclPiKL6TvCSnEXi/jUrBX7uKa
 xSKzOIR+YCqSliX3mAa5OTLZuly3Nm6drpaVQ4vxXaghMJ7OU6yfutPJLbTu46Tb145P
 ED+PCDfUerzTqMsVo9imQ4w2h84FFKa7WpWBWqDvkbuoK+Zl7+KAW31O7hRJ/82wKbED
 /PGA==
X-Gm-Message-State: AOAM530ubz5tZ7mrvFUnI8gf8pNHFx6SU7fYcIQI0Ku5TVp3JFrKmqc5
 ZgmEU/aU1m5bkvHa4yxPFc15vPmvQOKp/jBsMK8mRADyruQ3bhKT6MysaGtqVfSiJ4pAv1ys3WM
 iF0TMK/3oxGR/MhU=
X-Received: by 2002:adf:fbce:: with SMTP id d14mr2475855wrs.44.1615368917933; 
 Wed, 10 Mar 2021 01:35:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxVrVgsJcrs8TeKpKlu8xruithInHLe5fC3Z5UK+qC4XTiDReKwGnnkfzWar/Nntg4uGvGMA==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr2475817wrs.44.1615368917536; 
 Wed, 10 Mar 2021 01:35:17 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id x11sm8184567wmi.3.2021.03.10.01.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 01:35:17 -0800 (PST)
Date: Wed, 10 Mar 2021 10:35:15 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 4/6] net/eth: Check rt_hdr size before casting to
 ip6_ext_hdr
Message-ID: <20210310093515.rdbilg6zd7j5oauu@steredhat>
References: <20210309182709.810955-1-philmd@redhat.com>
 <20210309182709.810955-5-philmd@redhat.com>
 <20210310090501.baq6kzw6lfsmaujs@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210310090501.baq6kzw6lfsmaujs@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 10:05:01AM +0100, Stefano Garzarella wrote:
>On Tue, Mar 09, 2021 at 07:27:07PM +0100, Philippe Mathieu-Daudé wrote:
>>Do not cast our ip6_ext_hdr pointer to ip6_ext_hdr_routing if there
>>isn't enough data in the buffer for a such structure.
>>
>>This fix a 2 bytes buffer overrun in eth_parse_ipv6_hdr() reported
>>by QEMU fuzzer:
>>
>> $ cat << EOF | ./qemu-system-i386 -M pc-q35-5.0 \
>>   -accel qtest -monitor none \
>>   -serial none -nographic -qtest stdio
>> outl 0xcf8 0x80001010
>> outl 0xcfc 0xe1020000
>> outl 0xcf8 0x80001004
>> outw 0xcfc 0x7
>> write 0x25 0x1 0x86
>> write 0x26 0x1 0xdd
>> write 0x4f 0x1 0x2b
>> write 0xe1020030 0x4 0x190002e1
>> write 0xe102003a 0x2 0x0807
>> write 0xe1020048 0x4 0x12077cdd
>> write 0xe1020400 0x4 0xba077cdd
>> write 0xe1020420 0x4 0x190002e1
>> write 0xe1020428 0x4 0x3509d807
>> write 0xe1020438 0x1 0xe2
>> EOF
>> =================================================================
>> ==2859770==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
>> READ of size 1 at 0x7ffdef904902 thread T0
>>     #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
>>     #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
>>     #2 0x561cef7de639 in net_tx_pkt_parse_headers hw/net/net_tx_pkt.c:228:14
>>     #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
>>     #4 0x561ceec29f22 in e1000e_process_tx_desc hw/net/e1000e_core.c:730:29
>>     #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
>>     #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
>>     #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
>>     #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5
>>
>> Address 0x7ffdef904902 is located in stack of thread T0 at offset 34 in frame
>>     #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486
>>
>>   This frame has 1 object(s):
>>     [32, 34) 'ext_hdr' (line 487) <== Memory access at offset 34 overflows this variable
>> HINT: this may be a false positive if your program uses some custom stack unwind mechanism, swapcontext or vfork
>>       (longjmp and C++ exceptions *are* supported)
>> SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in _eth_get_rss_ex_dst_addr
>> Shadow bytes around the buggy address:
>>   0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>> =>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df18930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df18940: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df18950: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df18960: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   0x10003df18970: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> Shadow byte legend (one shadow byte represents 8 application bytes):
>>   Addressable:           00
>>   Partially addressable: 01 02 03 04 05 06 07
>>   Stack left redzone:      f1
>>   Stack right redzone:     f3
>> ==2859770==ABORTING
>>
>>Add the corresponding qtest case with the fuzzer reproducer.
>>
>>FWIW GCC 11 similarly reported:
>>
>> net/eth.c: In function 'eth_parse_ipv6_hdr':
>> net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>>   410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>       |          ~~~~~^~~~~~~
>> net/eth.c:485:24: note: while referencing 'ext_hdr'
>>   485 |     struct ip6_ext_hdr ext_hdr;
>>       |                        ^~~~~~~
>> net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>>   410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>       |                                 ~~~~~^~~~~~~~~
>> net/eth.c:485:24: note: while referencing 'ext_hdr'
>>   485 |     struct ip6_ext_hdr ext_hdr;
>>       |                        ^~~~~~~
>>
>>Cc: qemu-stable@nongnu.org
>>Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
>>Reported-by: Alexander Bulekov <alxndr@bu.edu>
>>Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>>Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
>>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>---
>>net/eth.c                      |  7 ++++-
>>tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>>MAINTAINERS                    |  1 +
>>tests/qtest/meson.build        |  1 +
>>4 files changed, 61 insertions(+), 1 deletion(-)
>>create mode 100644 tests/qtest/fuzz-e1000e-test.c
>>
>>diff --git a/net/eth.c b/net/eth.c
>>index 77af2b673bb..f0c8dfe8df7 100644
>>--- a/net/eth.c
>>+++ b/net/eth.c
>>@@ -406,7 +406,12 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>>                        struct in6_address *dst_addr)
>>{
>>    size_t input_size = iov_size(pkt, pkt_frags);
>>-    struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
>>+    struct ip6_ext_hdr_routing *rthdr;
>>+
>>+    if (input_size < ext_hdr_offset + sizeof(*rthdr)) {
>>+        return false;
>>+    }
>>+    rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
>
>Also if we check 'input_size', I think this cast keeps having the 2 
>bytes buffer overrun issue since 'ext_hdr' contains only the first 2 
>bytes.
>I think we can remove the 'input_size' check and we should fix in this 
>way:
>
>    struct ip6_ext_hdr_routing rthdr;
>
>    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset, &rthdr,
>                            sizeof(rthdr);
>    if (bytes_read < sizeof(rthdr)) {
>        return false;
>    }
>

Just saw that was what you had done in v3 :-)

I think we need to call iov_to_buf 2 times, once to read rthdr and once 
to read dst_addr.

Thanks,
Stefano


