Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208D369072A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 12:24:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ52S-00066x-Ed; Thu, 09 Feb 2023 06:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pQ52P-0005y8-Gs
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pQ52N-0001Kv-FF
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675941861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/DpsDwzBjdQHZ3OTDAK3xLtrHgr2l1HQtQkuNm6AiJQ=;
 b=XiLpAkqEGFMlhPj5IDL9Wr7DUBS0H3rpe2KtU8ngwZujycT8bCxFpdv8kV0H7ontN9lOc5
 BEwWMwhNDWTwvew9b4dQKJ1d8dyJO70qB2BCRqSonl7sslNnL+9L3uCmX8IHb8l8WW/FIY
 6H9uNKseYMw4p2fJcGeP3MXDsw6eClI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-bq4YztcVPQGUtcAlC1xz1A-1; Thu, 09 Feb 2023 06:24:20 -0500
X-MC-Unique: bq4YztcVPQGUtcAlC1xz1A-1
Received: by mail-qv1-f70.google.com with SMTP id
 98-20020a0c806b000000b0056c2797aa8bso882169qva.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 03:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/DpsDwzBjdQHZ3OTDAK3xLtrHgr2l1HQtQkuNm6AiJQ=;
 b=lQuw84AqZP6PliNAczkyq9DO4S8WYQIuBA+0V6QDg6ieafciqF03LNGQLE4fRYLkq3
 L4qfilK/Uf85HlJE7tPV9m7RdmGdXVvSScE0qO/tDbAS9rqISZGk+hVn8ByfgujX9gU1
 v874ya5yX0zc2mHLY+h8NkASN/7ntF5kK49LFyT/nEzHXEGsNR/ZnTAPaIfORKAnYgng
 9R+An3y6zjbikaeixmqp7/mEVco9T3XnqBoNYcGbZbtZHDzQJkI1DWpIN+DH6iKkDcYg
 9B5ByWeXgx4RwWWkJcHYjd2SzUftuidW8wktm0PfLu/vIuDjWbkNv+tt1K6mPj7CAOHK
 o8Jw==
X-Gm-Message-State: AO0yUKWRSjNjVtFBGoeAoVHcqjECA9hPA/SdgGAB7CGKMJgqRKRP+Bfw
 x/Lc5uLQ75rrInGXaTTQ0TxzArovzRNIkufBOLxnp6HRGkuR960+BuW6XVpYwn/ckL+dTZDjolF
 ztcKN+yhtJKZn05w=
X-Received: by 2002:ad4:5ece:0:b0:537:67d7:3c28 with SMTP id
 jm14-20020ad45ece000000b0053767d73c28mr19534896qvb.11.1675941859872; 
 Thu, 09 Feb 2023 03:24:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZzKr8SOZ8OLEeE0Av9ciOYgNASzDLrvJrrVl72YHofdn80yCTLzMFAqMGRosfFyn8Pa22BA==
X-Received: by 2002:ad4:5ece:0:b0:537:67d7:3c28 with SMTP id
 jm14-20020ad45ece000000b0053767d73c28mr19534869qvb.11.1675941859567; 
 Thu, 09 Feb 2023 03:24:19 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ae9ed14000000b00720ae160601sm1155144qkg.22.2023.02.09.03.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 03:24:19 -0800 (PST)
Message-ID: <5239d7f8-15ac-9922-13b6-14a8bc0dff45@redhat.com>
Date: Thu, 9 Feb 2023 12:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: rainier-bmc machine dumping core with latest qemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ninad Palsule <ninad@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
References: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
 <0853197a-6bf9-cd11-180c-7f110e32a812@linaro.org>
Content-Language: de-CH
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <0853197a-6bf9-cd11-180c-7f110e32a812@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adding Kevin too.

I can't reproduce your issue. I tried the exact steps showed in your
mail, both with BLD_VERSION=20230205025034 (not anymore latest compose)
and BLD_VERSION=20230209025037 (currently latest), and the VM boots till
the login screen.

Talking with Kevin it looks like handle_aiocb_write_zeroes() should not
use bdrv_getlength() but rather raw_co_getlength().
Could you try replacing it in block/file-posix.c line 1741 and rebuild
and see if it works?

Thank you,
Emanuele

Am 08/02/2023 um 15:56 schrieb Philippe Mathieu-Daudé:
> Cc'ing Emanuele.
> 
> On 8/2/23 15:26, Ninad Palsule wrote:
>> Hello,
>>
>> I am hitting core dump while running qemu with rainier-bmc machine. I
>> started
>> hitting it after I rebased to latest qemu from master.
>> Can someone please help?
>>
>> /home/abc/dev/qemu/build/qemu-system-arm -M rainier-bmc -nographic \
>>    -kernel
>> ./fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin \
>>    -dtb
>> ./aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb \
>>    -initrd
>> ./obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz \
>>    -drive
>> file=./obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2,if=sd,index=2 \
>>    -append 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a'
>>
>>
>>
>> [  OK  ] Started Journal Service.
>>           Starting Flush Journal to Persistent Storage...
>> [   45.873184] systemd-journald[156]: Received client request to flush
>> runtime journal.
>> [   45.932231] systemd-journald[156]: File
>> /var/log/journal/97cd620eaa284caf980533438c7355c4/system.journal
>> corrupted or uncleanly shut down, renaming and replacing.
>> qemu-system-arm: /home/abc/dev/qemu/block/block-gen.h:43:
>> bdrv_poll_co: Assertion `qemu_get_current_aio_context() ==
>> qemu_get_aio_context()' failed.
>>
>> Thread 3 "qemu-system-arm" received signal SIGABRT, Aborted.
>> [Switching to Thread 0x7ffff6896640 (LWP 3898452)]
>> __pthread_kill_implementation (no_tid=0, signo=6,
>> threadid=140737329587776) at ./nptl/pthread_kill.c:44
>> 44  ./nptl/pthread_kill.c: No such file or directory.
>>
>>
>> #6  0x00007ffff77e8e96 in __GI___assert_fail
>>      (assertion=assertion@entry=0x55555603e798
>> "qemu_get_current_aio_context() ==
>> qemu_get_aio_context()", file=file@entry=0x5555560aef28
>> "/home/abc/dev/qemu/block/block-gen.h", line=line@entry=43,
>> function=function@entry=0x5555560af080 <__PRETTY_FUNCTION__.9>
>> "bdrv_poll_co") at ./assert/assert.c:101
>> #7  0x0000555555da91f9 in bdrv_poll_co (s=0x7ffff68957f0) at
>> /home/abc/dev/qemu/block/block-gen.h:43
>> #8  bdrv_poll_co (s=0x7ffff68957f0) at
>> /home/abc/dev/qemu/block/block-gen.h:38
>> #9  bdrv_getlength (bs=<optimized out>) at block/block-gen.c:310
>> #10 0x0000555555e3558e in handle_aiocb_write_zeroes
>> (opaque=0x7fff419965f0) at ../block/file-posix.c:1741
>> #11 0x0000555555ef80fd in worker_thread
>> (opaque=opaque@entry=0x5555569e2300) at ../util/thread-pool.c:110
>> #12 0x0000555555ee3901 in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:505
>> #13 0x00007ffff7843b43 in start_thread (arg=<optimized out>) at
>> ./nptl/pthread_create.c:442
>> #14 0x00007ffff78d5a00 in clone3 () at
>> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
>>
>> (gdb) p qemu_aio_context
>> $1 = (AioContext *) 0x5555568b13d0
>>
>> ---------------------------------------
>>
>>
>> Reproduction steps:
>>
>> 1. Clone and build qemu from https://github.com/qemu/qemu
>> 2. Download following eBMC images
>>
>> BLD_VERSION=20230205025034
>> LINUX_VERSION="6.0.19+git0+67c9407e1f"
>> wget
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz
>>
>> wget
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb
>>
>> wget
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin
>>
>> wget
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2
>> qemu-img resize
>> obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2 16G
>>
>> 3. Run the qemu command as show at the start
>>
>>
>>
> 


