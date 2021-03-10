Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55E3343E9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:58:24 +0100 (CET)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2AB-0007Qy-3v
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK27d-0005x9-QV
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK27b-0005OR-K9
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFI13qtyIIJ3VL18GUKybEDlIBVFRfay7hnWOjCt5nw=;
 b=FOXG8LNlYl/YlxNd1m1M6Wp33Cs5aohqpiIc1gjOz3h3b3WWZDEsCfspp8j6HyGaLZ2C+c
 89iwX312E3KZwEZ80/hIy9UXG1IctqrxJWGCdzUKoZSgKDwBGlw617VUEXWhxPMFAt3Kmp
 Hy8LLFO5Fv6/nc7sZwLdjeckDywJQKs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-117WjNjgNfqQfe5yYvRTbA-1; Wed, 10 Mar 2021 11:55:39 -0500
X-MC-Unique: 117WjNjgNfqQfe5yYvRTbA-1
Received: by mail-wr1-f71.google.com with SMTP id g5so8200043wrd.22
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JFI13qtyIIJ3VL18GUKybEDlIBVFRfay7hnWOjCt5nw=;
 b=CVzfYJ2b+GMfUVq6+1YOn4dqf64qAsO/fwVcSG1u/OXZwuPW+mPkXQSR6xixXm4cKD
 nz/i6etb26DB9M+oT7fPp6AQks42tDdcUjiHDIzzoN7JnhICgAlllm60wFLjHkdUA5Ql
 HKkihr9OXHiUpAdO8Nq0VjittAWuBlfF83vx1nzWRDK2ZPFcjs6E2Blz+Xl0g6x3w+DX
 nBYFhXyfl/4AlwB9l59WwwjRaOvXsM5qmPE/w8eKr+zlovZ5gj8ncIdgKu8btE8/m5Sx
 AalkkaCf0ihW2TA6QBF0U7YjfINfTojj0e0hR1cUCBSK+NelpFI0xd16ZRbsZ3GI7dSq
 J/Ag==
X-Gm-Message-State: AOAM530QfGanhKm2oVTmBPTK5cJdQQN2KFSKIndDG8jc94Kep25/t2Kw
 Guq0FfvYorrm7PWyE1TZVsEcfIhql9/M5zbD9L3QpQqwzrcPivO+BK5EqA2K+7ZyYbMS4J3AOFf
 SfQoOzFAMfqjRPz8=
X-Received: by 2002:a1c:17:: with SMTP id 23mr4299260wma.6.1615395338328;
 Wed, 10 Mar 2021 08:55:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmoNcNxRILJDlXGvyeg4oF9QbgbT5JISqP3KnqFqPi/8LL0g+dd2u73Pcyxz2cQ9bro7O7ww==
X-Received: by 2002:a1c:17:: with SMTP id 23mr4299238wma.6.1615395338091;
 Wed, 10 Mar 2021 08:55:38 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id o14sm28525896wri.48.2021.03.10.08.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:55:37 -0800 (PST)
Date: Wed, 10 Mar 2021 17:55:35 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 6/7] net/eth: Read ip6_ext_hdr_routing buffer before
 accessing it
Message-ID: <20210310165535.7pf6u3ddxcwkwgxj@steredhat>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310160135.1148272-7-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 05:01:34PM +0100, Philippe Mathieu-Daudé wrote:
>We can't know the caller read enough data in the memory pointed
>by ext_hdr to cast it as a ip6_ext_hdr_routing.
>Declare rt_hdr on the stack and fill it again from the iovec.
>
>Since we already checked there is enough data in the iovec buffer,
>simply add an assert() call to consume the bytes_read variable.
>
>This fix a 2 bytes buffer overrun in eth_parse_ipv6_hdr() reported
>by QEMU fuzzer:
>
>  $ cat << EOF | ./qemu-system-i386 -M pc-q35-5.0 \
>    -accel qtest -monitor none \
>    -serial none -nographic -qtest stdio
>  outl 0xcf8 0x80001010
>  outl 0xcfc 0xe1020000
>  outl 0xcf8 0x80001004
>  outw 0xcfc 0x7
>  write 0x25 0x1 0x86
>  write 0x26 0x1 0xdd
>  write 0x4f 0x1 0x2b
>  write 0xe1020030 0x4 0x190002e1
>  write 0xe102003a 0x2 0x0807
>  write 0xe1020048 0x4 0x12077cdd
>  write 0xe1020400 0x4 0xba077cdd
>  write 0xe1020420 0x4 0x190002e1
>  write 0xe1020428 0x4 0x3509d807
>  write 0xe1020438 0x1 0xe2
>  EOF
>  =================================================================
>  ==2859770==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
>  READ of size 1 at 0x7ffdef904902 thread T0
>      #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
>      #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
>      #2 0x561cef7de639 in net_tx_pkt_parse_headers hw/net/net_tx_pkt.c:228:14
>      #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
>      #4 0x561ceec29f22 in e1000e_process_tx_desc hw/net/e1000e_core.c:730:29
>      #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
>      #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
>      #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
>      #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5
>
>  Address 0x7ffdef904902 is located in stack of thread T0 at offset 34 in frame
>      #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486
>
>    This frame has 1 object(s):
>      [32, 34) 'ext_hdr' (line 487) <== Memory access at offset 34 overflows this variable
>  HINT: this may be a false positive if your program uses some custom stack unwind mechanism, swapcontext or vfork
>        (longjmp and C++ exceptions *are* supported)
>  SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in _eth_get_rss_ex_dst_addr
>  Shadow bytes around the buggy address:
>    0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>  =>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df18930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df18940: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df18950: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df18960: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    0x10003df18970: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  Shadow byte legend (one shadow byte represents 8 application bytes):
>    Addressable:           00
>    Partially addressable: 01 02 03 04 05 06 07
>    Stack left redzone:      f1
>    Stack right redzone:     f3
>  ==2859770==ABORTING
>
>Add the corresponding qtest case with the fuzzer reproducer.
>
>FWIW GCC 11 similarly reported:
>
>  net/eth.c: In function 'eth_parse_ipv6_hdr':
>  net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>    410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>        |          ~~~~~^~~~~~~
>  net/eth.c:485:24: note: while referencing 'ext_hdr'
>    485 |     struct ip6_ext_hdr ext_hdr;
>        |                        ^~~~~~~
>  net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>    410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>        |                                 ~~~~~^~~~~~~~~
>  net/eth.c:485:24: note: while referencing 'ext_hdr'
>    485 |     struct ip6_ext_hdr ext_hdr;
>        |                        ^~~~~~~
>
>Cc: qemu-stable@nongnu.org
>Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
>Reported-by: Alexander Bulekov <alxndr@bu.edu>
>Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c                      | 10 +++++--
> tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
> MAINTAINERS                    |  1 +
> tests/qtest/meson.build        |  1 +
> 4 files changed, 62 insertions(+), 3 deletions(-)
> create mode 100644 tests/qtest/fuzz-e1000e-test.c

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


