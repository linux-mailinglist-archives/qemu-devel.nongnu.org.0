Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1B688759
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 20:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNevI-0000Lg-Ny; Thu, 02 Feb 2023 14:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNev9-0000IY-7N
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:06:55 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNev5-0005yR-65
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Reply-To:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
 Content-Type:Sender:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xlH4OGptTP2BS60wdFy61SBaJw5J3/ovqqkAhNllMF4=; b=k1NhCoThe2USsJnV1DzPOk6wEL
 TuWdpHMeJHcywvRuq0NQ06RdsCOjlsf3WCcwcFjpokUpInXLe+tPVc9qwv1avw9jpsVn/PUlnEO/3
 IVX+AeczqrYSOTK8b8COApIzYowGS155ydgtrgVF/apKTJUvpJb7Tk7RCnm8PyLaBYCg=;
Content-Type: multipart/alternative;
 boundary="------------G9vLsEmGtiZL0UwEP9OYkqCZ"
Message-ID: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
Date: Thu, 2 Feb 2023 20:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: ASan reports use-after-free when running munmap-pthread
To: qemu-devel@nongnu.org
Content-Language: en-US
Cc: "ale@rev.ng" <ale@rev.ng>, iii@linux.ibm.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Organization: rev.ng
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------G9vLsEmGtiZL0UwEP9OYkqCZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I was running check-tcg with ASan enabled on master, and ran into
the following use-after-free. There appears to be a race between
jump cache invalidation and thread destruction (?)

I thought I'd post here since I noticed some previous discussion on the
topic, and I'm not sure myself what a proper fix would look like.

Tested on arm/aarch64/x86_64-linux-user.

Here's a snippet of the ASan output:
=================================================================
==187529==ERROR: AddressSanitizer: heap-use-after-free on address 
0x62d000f433b0 at pc 0x55cfefe00246 bp 0x7f4725f400b0 sp 0x7f4725f400a0
READ of size 8 at 0x62d000f433b0 thread T2
     #0 0x55cfefe00245 in tb_jmp_cache_inval_tb 
/home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:861
     #1 0x55cfefe00245 in do_tb_phys_invalidate 
/home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:900
     #2 0x55cfefe0088a in tb_phys_invalidate__locked 
/home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:916
     #3 0x55cfefe0088a in tb_invalidate_phys_range 
/home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:1000
     #4 0x55cfefe7ecf9 in target_munmap 
/home/aj/git/qemu-upstream/build/../linux-user/mmap.c:766
     #5 0x55cfefea5815 in do_syscall1 
/home/aj/git/qemu-upstream/build/../linux-user/syscall.c:10105
     #6 0x55cfefe9c950 in do_syscall 
/home/aj/git/qemu-upstream/build/../linux-user/syscall.c:13329
     #7 0x55cfefb97255 in cpu_loop 
../linux-user/x86_64/../i386/cpu_loop.c:233
     #8 0x55cfefec7af4 in clone_func 
/home/aj/git/qemu-upstream/build/../linux-user/syscall.c:6633
     #9 0x7f4726bbb8fc  (/usr/lib/libc.so.6+0x868fc)
     #10 0x7f4726c3da5f  (/usr/lib/libc.so.6+0x108a5f)

0x62d000f433b0 is located 28592 bytes inside of 32768-byte region 
[0x62d000f3c400,0x62d000f44400)
freed by thread T387 here:
     #0 0x7f47270be672 in __interceptor_free 
/usr/src/debug/gcc/libsanitizer/asan/asan_malloc_linux.cpp:52
     #1 0x55cfefd071b8 in cpu_exec_unrealizefn 
/home/aj/git/qemu-upstream/build/../cpu.c:180
     #2 0x55cfefeea287 in property_set_bool 
/home/aj/git/qemu-upstream/build/../qom/object.c:2285
     #3 0x55cfefee603b in object_property_set 
/home/aj/git/qemu-upstream/build/../qom/object.c:1420
     #4 0x55cfefeef21c in object_property_set_qobject 
/home/aj/git/qemu-upstream/build/../qom/qom-qobject.c:28

previously allocated by thread T0 here:
     #0 0x7f47270bf411 in __interceptor_calloc 
/usr/src/debug/gcc/libsanitizer/asan/asan_malloc_linux.cpp:77
     #1 0x7f4726e77681 in g_malloc0 (/usr/lib/libglib-2.0.so.0+0x53681)
     #2 0x55cfefed7cfe in device_set_realized 
/home/aj/git/qemu-upstream/build/../hw/core/qdev.c:510
     #3 0x55cfefeea287 in property_set_bool 
/home/aj/git/qemu-upstream/build/../qom/object.c:2285
     #4 0x55cfefee603b in object_property_set 
/home/aj/git/qemu-upstream/build/../qom/object.c:1420
     #5 0x55cfefeef21c in object_property_set_qobject 
/home/aj/git/qemu-upstream/build/../qom/qom-qobject.c:28

-- 
Anton Johansson,
rev.ng Labs Srl.

--------------G9vLsEmGtiZL0UwEP9OYkqCZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div dir="ltr">
      <div>
        <p>Hi,<br>
          <br>
          I was running check-tcg with ASan enabled on master, and ran
          into<br>
          the following use-after-free. There appears to be a race
          between<br>
          jump cache invalidation and thread destruction (?)<br>
          <br>
          I thought I'd post here since I noticed some previous
          discussion on the <br>
          topic, and I'm not sure myself what a proper fix would look
          like.<br>
          <br>
          Tested on arm/aarch64/x86_64-linux-user.<br>
        </p>
        <p>Here's a snippet of the ASan output:<br>
          <span style="font-family:monospace">=================================================================<br>
            ==187529==ERROR: AddressSanitizer: heap-use-after-free on
            address 0x62d000f433b0 at pc 0x55cfefe00246 bp
            0x7f4725f400b0 sp 0x7f4725f400a0<br>
            READ of size 8 at 0x62d000f433b0 thread T2<br>
                #0 0x55cfefe00245 in tb_jmp_cache_inval_tb
            /home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:861<br>
                #1 0x55cfefe00245 in do_tb_phys_invalidate
            /home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:900<br>
                #2 0x55cfefe0088a in tb_phys_invalidate__locked
            /home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:916<br>
                #3 0x55cfefe0088a in tb_invalidate_phys_range
            /home/aj/git/qemu-upstream/build/../accel/tcg/tb-maint.c:1000<br>
                #4 0x55cfefe7ecf9 in target_munmap
            /home/aj/git/qemu-upstream/build/../linux-user/mmap.c:766<br>
                #5 0x55cfefea5815 in do_syscall1
            /home/aj/git/qemu-upstream/build/../linux-user/syscall.c:10105<br>
                #6 0x55cfefe9c950 in do_syscall
            /home/aj/git/qemu-upstream/build/../linux-user/syscall.c:13329<br>
                #7 0x55cfefb97255 in cpu_loop
            ../linux-user/x86_64/../i386/cpu_loop.c:233<br>
                #8 0x55cfefec7af4 in clone_func
            /home/aj/git/qemu-upstream/build/../linux-user/syscall.c:6633<br>
                #9 0x7f4726bbb8fc  (/usr/lib/libc.so.6+0x868fc)<br>
                #10 0x7f4726c3da5f  (/usr/lib/libc.so.6+0x108a5f)<br>
            <br>
            0x62d000f433b0 is located 28592 bytes inside of 32768-byte
            region [0x62d000f3c400,0x62d000f44400)<br>
            freed by thread T387 here:<br>
                #0 0x7f47270be672 in __interceptor_free
            /usr/src/debug/gcc/libsanitizer/asan/asan_malloc_linux.cpp:52<br>
                #1 0x55cfefd071b8 in cpu_exec_unrealizefn
            /home/aj/git/qemu-upstream/build/../cpu.c:180<br>
                #2 0x55cfefeea287 in property_set_bool
            /home/aj/git/qemu-upstream/build/../qom/object.c:2285<br>
                #3 0x55cfefee603b in object_property_set
            /home/aj/git/qemu-upstream/build/../qom/object.c:1420<br>
                #4 0x55cfefeef21c in object_property_set_qobject
            /home/aj/git/qemu-upstream/build/../qom/qom-qobject.c:28<br>
            <br>
            previously allocated by thread T0 here:<br>
                #0 0x7f47270bf411 in __interceptor_calloc
            /usr/src/debug/gcc/libsanitizer/asan/asan_malloc_linux.cpp:77<br>
                #1 0x7f4726e77681 in g_malloc0
            (/usr/lib/libglib-2.0.so.0+0x53681)<br>
                #2 0x55cfefed7cfe in device_set_realized
            /home/aj/git/qemu-upstream/build/../hw/core/qdev.c:510<br>
                #3 0x55cfefeea287 in property_set_bool
            /home/aj/git/qemu-upstream/build/../qom/object.c:2285<br>
                #4 0x55cfefee603b in object_property_set
            /home/aj/git/qemu-upstream/build/../qom/object.c:1420<br>
                #5 0x55cfefeef21c in object_property_set_qobject
            /home/aj/git/qemu-upstream/build/../qom/qom-qobject.c:28</span></p>
      </div>
    </div>
    <pre class="moz-signature" cols="72">-- 
Anton Johansson,
rev.ng Labs Srl.</pre>
  </body>
</html>

--------------G9vLsEmGtiZL0UwEP9OYkqCZ--

