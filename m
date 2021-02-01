Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E9230A2D8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:48:44 +0100 (CET)
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Twx-0003vy-A0
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6Tvp-0003TW-5T
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6Tvj-0000YL-IA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612165645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8v9I77SujejEdj45XMNMdCB6Bm4pFS4pdZsi9bzUhRA=;
 b=XiyA+N+W+Zx9UWXRV7NGA06vct+FQtUbMWEMb3zqZ0sDTzgXgh853EquSutXhqbh/xSaKr
 nCsbWzPNNVJh9fpeErqGqT5fuXrCYBvgd+NFHm182BlqHcrQL6TzI5ySz5x9WHLs6SaeWO
 ygcegwzyacDArklqjBDi5jimg7BUeKo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-k05D1txmOBiTth7gXB-N3Q-1; Mon, 01 Feb 2021 02:47:24 -0500
X-MC-Unique: k05D1txmOBiTth7gXB-N3Q-1
Received: by mail-wr1-f72.google.com with SMTP id s15so9949229wrt.14
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 23:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8v9I77SujejEdj45XMNMdCB6Bm4pFS4pdZsi9bzUhRA=;
 b=lps5OtjyaXj2rNBQiXwi0n4ryWJF1exfnX2Nn5YW93p9VnQvtCd2i1xz5/3pCFeqEP
 /v5ZGSavNNiW5ytf2C1cjsjpAplZX8oy96CjhauNR75nyYCoU/2Kxis4/V0tzqMPwPRe
 leAHXMHVinUlQnsVJWo08L1FNVj97KJRyDifUjHsIgSISTlucrkJkC70QSTiCnVybjER
 olXI2dkeCfxBe4SiXo4Xs+bB2zMBGno8rmD/IcyZXnoSs5iKXYozINqZPPHs5P+rh/ja
 3DFFisdDwNPc+j2kX6CyTKuzcYdS0JmN4sztWv6KBRB4b1UxoYw/Ed6pW/7LXthNeMJR
 FuCA==
X-Gm-Message-State: AOAM530Cbmdn0p/I8hunvFHQrtcWG5OPjm2ch2GbE/GV1BOPSCwFR4J0
 kJhZ6e5MM4lnEwz2vclG9gVmOOc4A6pGkTjO3L6QRoYtziU8qYBjJ7LG579GoIEWtRI54sdkGyJ
 yCHfC0idZUe3O9F0=
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr16523771wrv.71.1612165642546; 
 Sun, 31 Jan 2021 23:47:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcY8ycvwPpR/GRJEMJa9sqTAl0X60w0UM7jmICIU4ByS0g0beNkQFKlCXVOj1NTEGl8F1ZCg==
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr16523763wrv.71.1612165642336; 
 Sun, 31 Jan 2021 23:47:22 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id 17sm19433844wmk.48.2021.01.31.23.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 23:47:21 -0800 (PST)
Subject: Re: [Bug 1913923] [NEW] assert issue locates in
 hw/net/vmxnet3.c:1793:vmxnet3_io_bar1_write: code should not be reach
To: Bug 1913923 <1913923@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161206734828.14645.4906468177399180805.malonedeb@wampee.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <664441c3-4d69-1526-7fae-8c445940f3d6@redhat.com>
Date: Mon, 1 Feb 2021 08:47:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161206734828.14645.4906468177399180805.malonedeb@wampee.canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Dmitry Fleytman

On 1/31/21 5:29 AM, Gaoning Pan wrote:
> Public bug reported:
> 
> Hello,
> 
> I found an assertion failure in hw/net/vmxnet3.c:1793
> 
> This was found in latest version 5.2.0.
> 
> my reproduced is as follows:
> 
> 
> cat << EOF | ./qemu-system-x86_64 \
> -device vmxnet3 \
> -display none -nodefaults -qtest stdio 
> outl 0xcf8 0x80001014
> outl 0xcfc 0xf0001000
> outl 0xcf8 0x80001018
> outl 0xcf8 0x80001004
> outw 0xcfc 0x7
> writel 0x5c000 0xbabefee1
> writel 0x5c028 0x5d000
> writel 0x5c03c 0x01010101
> writel 0x5d038 0xe0000000 
> writel 0xf0001038 1
> EOF
> 
> 
> Backtrace is as follows:
> #0  0x00007f6f641a5f47 in __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
> #1  0x00007f6f641a78b1 in __GI_abort () at abort.c:79
> #2  0x00007f6f67922315 in g_assertion_message () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> #3  0x00007f6f6792237a in g_assertion_message_expr () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> #4  0x000055edcaec96af in vmxnet3_io_bar1_write (opaque=0x628000004100, addr=56, val=1, size=4) at ../hw/net/vmxnet3.c:1793
> #5  0x000055edcbd294c6 in memory_region_write_accessor (mr=0x628000006b00, addr=56, value=0x7fffd52ba848, size=4, shift=0, mask=4294967295, attrs=...) at ../softmmu/memory.c:491
> #6  0x000055edcbd299be in access_with_adjusted_size (addr=56, value=0x7fffd52ba848, size=4, access_size_min=4, access_size_max=4, access_fn=0x55edcbd2918c <memory_region_write_accessor>, mr=0x628000006b00, attrs=...) at ../softmmu/memory.c:552
> #7  0x000055edcbd35ef2 in memory_region_dispatch_write (mr=0x628000006b00, addr=56, data=1, op=MO_32, attrs=...) at ../softmmu/memory.c:1501
> #8  0x000055edcba1e554 in flatview_write_continue (fv=0x6060000619a0, addr=4026535992, attrs=..., ptr=0x7fffd52bae80, len=4, addr1=56, l=4, mr=0x628000006b00) at ../softmmu/physmem.c:2759
> #9  0x000055edcba1e8c5 in flatview_write (fv=0x6060000619a0, addr=4026535992, attrs=..., buf=0x7fffd52bae80, len=4) at ../softmmu/physmem.c:2799
> #10 0x000055edcba1f391 in address_space_write (as=0x608000002620, addr=4026535992, attrs=..., buf=0x7fffd52bae80, len=4) at ../softmmu/physmem.c:2891
> #11 0x000055edcbaff8d3 in qtest_process_command (chr=0x55edd03ff4a0 <qtest_chr>, words=0x60300007f450) at ../softmmu/qtest.c:534
> #12 0x000055edcbb04aa1 in qtest_process_inbuf (chr=0x55edd03ff4a0 <qtest_chr>, inbuf=0x61900000fd00) at ../softmmu/qtest.c:797
> #13 0x000055edcbb04bcc in qtest_read (opaque=0x55edd03ff4a0 <qtest_chr>, buf=0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefee1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe0000"..., size=225) at ../softmmu/qtest.c:809
> #14 0x000055edcbe73742 in qemu_chr_be_write_impl (s=0x60f000002110, buf=0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefee1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe0000"..., len=225) at ../chardev/char.c:201
> #15 0x000055edcbe73820 in qemu_chr_be_write (s=0x60f000002110, buf=0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefee1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe0000"..., len=225) at ../chardev/char.c:213
> #16 0x000055edcbe9188e in fd_chr_read (chan=0x608000002520, cond=(G_IO_IN | G_IO_HUP), opaque=0x60f000002110) at ../chardev/char-fd.c:68
> #17 0x000055edcbe2379d in qio_channel_fd_source_dispatch (source=0x60c000025c00, callback=0x55edcbe915ac <fd_chr_read>, user_data=0x60f000002110) at ../io/channel-watch.c:84
> #18 0x00007f6f678fb285 in g_main_context_dispatch () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> #19 0x000055edcc50b503 in glib_pollfds_poll () at ../util/main-loop.c:221
> #20 0x000055edcc50b68b in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:244
> #21 0x000055edcc50b9a5 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
> #22 0x000055edcbd8805b in qemu_main_loop () at ../softmmu/vl.c:1678
> #23 0x000055edcab67e69 in main (argc=8, argv=0x7fffd52bd1d8, envp=0x7fffd52bd220) at ../softmmu/main.c:50
> #24 0x00007f6f64188b97 in __libc_start_main (main=0x55edcab67e2a <main>, argc=8, argv=0x7fffd52bd1d8, init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7fffd52bd1c8) at ../csu/libc-start.c:310
> #25 0x000055edcab67d4a in _start ()


