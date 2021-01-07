Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A02D2ECC61
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 10:11:36 +0100 (CET)
Received: from localhost ([::1]:46872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxRKR-00080Y-L8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 04:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxRJL-0007Kj-M5
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxRJI-0004X9-Gy
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610010622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpB8i2CgsKUTPILX0jBAjJ0j+pcrq41lee75uZSNQgQ=;
 b=KN+Y0+6mssP9ailgWmuvJ4r5fblYqff7VQi7YDO0cygKdi1O+B/BX2ocTjF6PPXHhmb45v
 dFxGHFXWm1lLrj0F81D2W0hbsCF+oTD0MH4aWydkcCG7fDJ3fXpeLOb6ZJJvRAHutl7CwN
 4c2itGAOxIqQQbDScSTGOFU2X6pFrYI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-_5ybchfOPaCBxieqNwoLjw-1; Thu, 07 Jan 2021 04:10:20 -0500
X-MC-Unique: _5ybchfOPaCBxieqNwoLjw-1
Received: by mail-wr1-f69.google.com with SMTP id b8so2372683wrv.14
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 01:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpB8i2CgsKUTPILX0jBAjJ0j+pcrq41lee75uZSNQgQ=;
 b=A5XdTWbkBi/uJn5VjxyiDXqqKWeA7zPhDNTLWlZnLePJtpmsQAhzAV8inXjUlFZpWw
 deaxDR0mQ+LtwdY6GBjBsiWX5GeprFqiofzXNTu36FihZs+v1uP7B5LBy9ZFfaxkpYq4
 Er7oJtAQCE2KpDkWbs4HpcmSyFvnNSxEyWR1/jOnVct4s7Zqh0nM7bw4Z+Aq8mYMrdDE
 Pbql0HP3DZW8X0gRaf+l1NBW/ZB2xeFexQsHucv4PENBSWz680sDE7ZjcOV6C/lvrkyY
 bxae+Ckpo5XkZtPz7eNud2MjWDxaTXgEG3VCvWn77BbWdslcplvE4EdUv0+xr0KBfeqr
 DzNw==
X-Gm-Message-State: AOAM5323plMIYUXgcZS43GEX0kpvXmT9i5w+MFlmfg/7n1RPqdVu8yAD
 JAP1nye0BantuZXkj1gVkJ6gStEU4fBqlWGAT7LMUbjcbs/K1ogKQstE3KFNpycYia/GdqZ9eho
 nZECvH4cu4PSTav8=
X-Received: by 2002:adf:fd05:: with SMTP id e5mr8029666wrr.225.1610010618897; 
 Thu, 07 Jan 2021 01:10:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8Tobll8cvv2w+4+Y74sCTscmclFeLAAG2TCAS85lKWPEgfSzzx6SnStretMYzX+fvdH8iIw==
X-Received: by 2002:adf:fd05:: with SMTP id e5mr8029648wrr.225.1610010618729; 
 Thu, 07 Jan 2021 01:10:18 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id p15sm6814837wrt.15.2021.01.07.01.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 01:10:18 -0800 (PST)
Subject: Re: [Bug 1910505] [NEW] atomic failure linking with
 --enable-sanitizers on 32-bit Linux hosts
To: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <161000881348.18330.2540162310564338256.malonedeb@gac.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <88bee064-f323-366a-7931-dc4bc40057e3@redhat.com>
Date: Thu, 7 Jan 2021 10:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161000881348.18330.2540162310564338256.malonedeb@gac.canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing atomic team and qemu-block@ for "qemu/stats64.h".

On 1/7/21 9:40 AM, Philippe Mathieu-Daudé wrote:
> Public bug reported:
> 
> As of commit 50536341b47, using --enable-sanitizers on 32-bit Linux host:
> - displays various warnings
> - fails linking
> 
> Using Ubuntu 18.04 (release 20201211.1) and Clang10 on i386:
> 
> [139/675] Compiling C object softmmu.fa.p/softmmu_icount.c.o
> In file included from ../softmmu/icount.c:31:
> In file included from include/exec/exec-all.h:23:
> In file included from ../target/mips/cpu.h:4:
> In file included from ../target/mips/cpu-qom.h:23:
> In file included from include/hw/core/cpu.h:23:
> In file included from include/hw/qdev-core.h:5:
> In file included from include/qemu/bitmap.h:16:
> In file included from include/qemu/bitops.h:17:
> include/qemu/atomic.h:463:12: warning: misaligned atomic operation may
> incur significant performance penalty [-Watomic-alignment]
>     return qatomic_read__nocheck(ptr);
>            ^
> include/qemu/atomic.h:129:5: note: expanded from macro
> 'qatomic_read__nocheck'
>     __atomic_load_n(ptr, __ATOMIC_RELAXED)
>     ^
> include/qemu/atomic.h:473:5: warning: misaligned atomic operation may
> incur significant performance penalty [-Watomic-alignment]
>     qatomic_set__nocheck(ptr, val);
>     ^
> include/qemu/atomic.h:138:5: note: expanded from macro
> 'qatomic_set__nocheck'
>     __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
>     ^
> 2 warnings generated.
> [...]
> 
> [850/2216] Linking target tests/test-hbitmap
> FAILED: tests/test-hbitmap
> clang  -o tests/test-hbitmap tests/test-hbitmap.p/test-hbitmap.c.o
> tests/test-hbitmap.p/iothread.c.o -Wl,--as-needed -Wl,--no-undefined
> -pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa
> libio.fa -Wl,--no-whole-archive -Wl,--warn-common -fsanitize=undefined
> -fsanitize=address -Wl,-z,relro -Wl,-z,now -m32 -ggdb
> -fstack-protector-strong -Wl,--start-group libqemuutil.a
> subprojects/libvhost-user/libvhost-user-glib.a
> subprojects/libvhost-user/libvhost-user.a libblock.fa libcrypto.fa
> libauthz.fa libqom.fa libio.fa @block.syms -lgio-2.0 -lgobject-2.0
> -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -pthread -lutil -lgnutls
> -lm -lgthread-2.0 -lglib-2.0 /usr/lib/i386-linux-gnu/libglib-2.0.so
> -liscsi -lgthread-2.0 -lglib-2.0 -laio -lcurl
> /usr/lib/i386-linux-gnu/libz.so -lrbd -lrados -lnettle -lgnutls
> -Wl,--end-group
> libblock.fa(block_io.c.o): In function `stat64_max':
> include/qemu/stats64.h:58: undefined reference to `__atomic_load_8'
> include/qemu/stats64.h:60: undefined reference to
> `__atomic_compare_exchange_8'
> libblock.fa(block_qapi.c.o): In function `stat64_get':
> include/qemu/stats64.h:40: undefined reference to `__atomic_load_8'
> libqemuutil.a(util_qsp.c.o): In function `qatomic_set_u64':
> include/qemu/atomic.h:478: undefined reference to `__atomic_store_8'
> libqemuutil.a(util_qsp.c.o): In function `qatomic_read_u64':
> include/qemu/atomic.h:468: undefined reference to `__atomic_load_8'
> clang: error: linker command failed with exit code 1 (use -v to see
> invocation)
> 
> Issue previously reported on the list here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg770128.html
> 
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
> 


