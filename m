Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045134A366
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:50:40 +0100 (CET)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPiAx-0004By-Pc
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPi9l-0003ll-2J
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPi9i-0004o0-VS
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616748562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7g2KbZlOf5ji3wujwVoNmDWn+7J0h2M5N7Kfy7BA/I=;
 b=gyFBTbCg1C8IB5104FrqOK/o+WOW1ZLpz8G5WK43QK+vSjFkAzY+CSO8ys0CnNyXZuRi+A
 /tz8eCBRQz76x7NoIpARVqt3L3+x4vtaCD7IOlNxMHiJwvyqogyVgB9GRL7lFU1pmRdqu0
 I2ZK4h0VTHdnj898Jl6YmleOe3FcY4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-KTXQQAXuML-Vh4M4-THkFQ-1; Fri, 26 Mar 2021 04:49:19 -0400
X-MC-Unique: KTXQQAXuML-Vh4M4-THkFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2F9683DEE0;
 Fri, 26 Mar 2021 08:48:59 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-10.pek2.redhat.com
 [10.72.13.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC9EB1002388;
 Fri, 26 Mar 2021 08:48:56 +0000 (UTC)
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: BALATON Zoltan <balaton@eik.bme.hu>, Howard Spoelstra <hsp.cat7@gmail.com>
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
 <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
 <c63a699d-9419-5a87-269b-476ef0a5b587@eik.bme.hu>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6271eee3-d1fa-2a54-48a6-51f4aa592642@redhat.com>
Date: Fri, 26 Mar 2021 16:48:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c63a699d-9419-5a87-269b-476ef0a5b587@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------E4B48315CB86D1685BB31C42"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------E4B48315CB86D1685BB31C42
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2021/3/26 下午4:21, BALATON Zoltan 写道:
> On Fri, 26 Mar 2021, Howard Spoelstra wrote:
>> On Fri, Mar 26, 2021 at 2:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> Hi Howard,
>>>
>>> On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell 
>>> <peter.maydell@linaro.org> wrote:
>>>>
>>>> (adding the relevant people to the cc list)
>>>>
>>>> On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com> 
>>>> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> When running qemu-system-ppc with Mac OS guest, the guest crashes 
>>>>> when
>>>>> using a tap network connection. Openvpn 2.4.9-I601-win10 is installed
>>>>> with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
>>>>> with the default ethernet connection. It gets activated when I start
>>>>> qemu.
>>>>>
>>>>> To reproduce, compile qemu-system-ppc from current source and run:
>>>>>
>>>>> qemu-system-ppc.exe ^
>>>>> -L pc-bios ^
>>>>> -M mac99 ^
>>>>> -m 128 ^
>>>>> -sdl -serial stdio ^
>>>>> -boot c ^
>>>>> -drive file=C:\Mac-disks\9.2.img,format=raw,media=disk ^
>>>>> -device sungem,netdev=network01 -netdev 
>>>>> tap,ifname=TapQemu,id=network01
>>>>>
>>>>> I bisected to the commit below. Thanks for looking into this.
>>>
>>> Thanks for reporting.
>>>
>>> Can you please provide some further information:
>>>
>>> 1. Does "-net user" work on Windows?
>>> 2. If running QEMU under Linux, does "-net tap" or "-net user" work?
>>>
>>> Regards,
>>> Bin
>>
>> Hello Bin,
>>
>> Thanks for getting back to me. I forgot to mention that reverting the
>> above patch restores functionality. And that other applications using
>> the same tap device work correctly.
>> In answer to your questions:
>>
>> 1. Yes, slirp works on Windows 10 with this setup.
>> 2. Yes, in Linux both tap and slirp work.
>>
>> My Windows build is done with a fully up to date msys2 installation.
>>
>> I tried to debug in Windows:
>> (gdb) run
>> Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bios
>> -M mac99 -m 128 -sdl -serial stdio -boot c -drive
>> "file=C:\Mac-disks\9.2-usb-pci-ddk.img,format=raw,media=disk" -device
>> "sungem,netdev=network01" -netdev "tap,ifname=TapQemu,id=network01" -S
>> [New Thread 13304.0x1f00]
>> [New Thread 13304.0x2f84]
>> [New Thread 13304.0x3524]
>> [New Thread 13304.0x2b8c]
>> [New Thread 13304.0x368c]
>> [New Thread 13304.0x3668]
>> [New Thread 13304.0xf4c]
>> [New Thread 13304.0x49c]
>> [New Thread 13304.0x1d4c]
>> [New Thread 13304.0x7fc]
>> [Thread 13304.0x7fc exited with code 0]
>> [New Thread 13304.0x357c]
>> [New Thread 13304.0x7c0]
>> [New Thread 13304.0x3564]
>> [New Thread 13304.0x26f4]
>> [New Thread 13304.0x2f68]
>>
>> Program received signal SIGSEGV, Segmentation fault.
>> 0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
>> (gdb) bt
>> #0  0x00007ffb9edea991 in ?? () from 
>> c:\qemu-master-msys2\libglib-2.0-0.dll
>> #1  0x000800000480bf50 in ?? ()
>> Backtrace stopped: previous frame inner to this frame (corrupt stack?)
>> (gdb)
>>
>> Even before I could attach to the process.
>
> If you run QEMU under gdb you don't have to attach to it but to get a 
> meaningful backtrace you should configure and compile QEMU with 
> --enable-debug (this will make it run slower so not recommended 
> normally but for debugging that would be needed). If the stack is 
> really corrupted then you may not get a useful backtrace or it may be 
> a problem with gdb on Windows. I've found that gdb on Windows works 
> for simple things but could give bad results for more complex stuff. 
> WinDbg may be better but it's harder to use (needs some registry 
> change I think to enable core dumps then you could open and analyze 
> core dumps with it or it should be able to run command directly but I 
> don't know how that works).
>
> Another idea: maybe you could check other threads in gdb. Not sure if 
> that would reveal anything but may worth a try. I think the commands 
> you need are "info threads" and "apply all bt" or something similar.
>
> Regards,
> BALATON Zoltan
>

It looks to me the patch tires to recycle a temporary buffer to tap thread.

Please try to attached fix to see it if works.

Thanks


--------------E4B48315CB86D1685BB31C42
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="0001-tap-win32-correctly-recycle-buffers.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tap-win32-correctly-recycle-buffers.patch"

RnJvbSBiZGQ3YjRiN2UxMzI2NGYzMGQ0YWJiYzZmMGYzMmM4YWY5MzVmZjE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgpEYXRl
OiBGcmksIDI2IE1hciAyMDIxIDE2OjQ2OjQzICswODAwClN1YmplY3Q6IFtQQVRDSF0gdGFwLXdp
bjMyOiBjb3JyZWN0bHkgcmVjeWNsZSBidWZmZXJzCgpDb21taXQgOTY5ZTUwYjYxYTI4ICgibmV0
OiBQYWQgc2hvcnQgZnJhbWVzIHRvIG1pbmltdW0gc2l6ZSBiZWZvcmUKc2VuZGluZyBmcm9tIFNM
aVJQL1RBUCIpIHRyaWVzIHRvIHBhZCBmcmFtZXMgYnV0IHRyeSB0byByZWN5bGUgdGhlCmxvY2Fs
IGFycmF5IHRoYXQgaXMgdXNlZCBmb3IgcGFkZGluZyB0byB0YXAgdGhyZWFkLiBUaGlzIHBhdGNo
IGZpeGVzCnRoaXMgYnkgcmVjeWxpbmcgdGhlIG9yaWdpbmFsIGJ1ZmZlci4KCkZpeGVzOiA5Njll
NTBiNjFhMjggKCJuZXQ6IFBhZCBzaG9ydCBmcmFtZXMgdG8gbWluaW11bSBzaXplIGJlZm9yZSBz
ZW5kaW5nIGZyb20gU0xpUlAvVEFQIikKU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KLS0tCiBuZXQvdGFwLXdpbjMyLmMgfCA2ICsrKystLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9uZXQv
dGFwLXdpbjMyLmMgYi9uZXQvdGFwLXdpbjMyLmMKaW5kZXggZDdjMmE4NzU5Yy4uOTVkYWNiZDE3
MSAxMDA2NDQKLS0tIGEvbmV0L3RhcC13aW4zMi5jCisrKyBiL25ldC90YXAtd2luMzIuYwpAQCAt
Njg2LDcgKzY4Niw3IEBAIHN0YXRpYyBzc2l6ZV90IHRhcF9yZWNlaXZlKE5ldENsaWVudFN0YXRl
ICpuYywgY29uc3QgdWludDhfdCAqYnVmLCBzaXplX3Qgc2l6ZSkKIHN0YXRpYyB2b2lkIHRhcF93
aW4zMl9zZW5kKHZvaWQgKm9wYXF1ZSkKIHsKICAgICBUQVBTdGF0ZSAqcyA9IG9wYXF1ZTsKLSAg
ICB1aW50OF90ICpidWY7CisgICAgdWludDhfdCAqYnVmLCBvcmlnX2J1ZjsKICAgICBpbnQgbWF4
X3NpemUgPSA0MDk2OwogICAgIGludCBzaXplOwogICAgIHVpbnQ4X3QgbWluX3BrdFtFVEhfWkxF
Tl07CkBAIC02OTQsNiArNjk0LDggQEAgc3RhdGljIHZvaWQgdGFwX3dpbjMyX3NlbmQodm9pZCAq
b3BhcXVlKQogCiAgICAgc2l6ZSA9IHRhcF93aW4zMl9yZWFkKHMtPmhhbmRsZSwgJmJ1ZiwgbWF4
X3NpemUpOwogICAgIGlmIChzaXplID4gMCkgeworICAgICAgICBvcmlnX2J1ZiA9IGJ1ZjsKKwog
ICAgICAgICBpZiAoIXMtPm5jLnBlZXItPmRvX25vdF9wYWQpIHsKICAgICAgICAgICAgIGlmIChl
dGhfcGFkX3Nob3J0X2ZyYW1lKG1pbl9wa3QsICZtaW5fcGt0c3osIGJ1Ziwgc2l6ZSkpIHsKICAg
ICAgICAgICAgICAgICBidWYgPSBtaW5fcGt0OwpAQCAtNzAyLDcgKzcwNCw3IEBAIHN0YXRpYyB2
b2lkIHRhcF93aW4zMl9zZW5kKHZvaWQgKm9wYXF1ZSkKICAgICAgICAgfQogCiAgICAgICAgIHFl
bXVfc2VuZF9wYWNrZXQoJnMtPm5jLCBidWYsIHNpemUpOwotICAgICAgICB0YXBfd2luMzJfZnJl
ZV9idWZmZXIocy0+aGFuZGxlLCBidWYpOworICAgICAgICB0YXBfd2luMzJfZnJlZV9idWZmZXIo
cy0+aGFuZGxlLCBvcmlnX2J1Zik7CiAgICAgfQogfQogCi0tIAoyLjI0LjMgKEFwcGxlIEdpdC0x
MjgpCgo=
--------------E4B48315CB86D1685BB31C42--


