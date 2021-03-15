Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0562A33C274
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:49:51 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqPe-0006hz-0f
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqKH-0003C6-5s
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqKC-00033P-V6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615826645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFph29dTqtdYZrazgoTKv7S/+f13OL8EeR6lq7JIiR4=;
 b=CUg1Hcaz6uE5TwZqeC33U0Z6ywrniVegbWK/xFmplgKX6mAZUDqa3tD/veik9VMgNDfNRq
 3lnoDmrhQpAj1olo5UjNugRSF7Zm2V2yb9FZuwhI8SJkSeJoXgTQNRWiwXkFzhLMB5c1vF
 i6sL22hnDXBnXGwWqC+LrY4atxdsEBg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431--FGlc_WEODSr2lZjYUApgQ-1; Mon, 15 Mar 2021 12:44:04 -0400
X-MC-Unique: -FGlc_WEODSr2lZjYUApgQ-1
Received: by mail-wr1-f72.google.com with SMTP id x9so15211271wro.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PFph29dTqtdYZrazgoTKv7S/+f13OL8EeR6lq7JIiR4=;
 b=sJN910e6A8qRRgCZxxkKPraI3q2+gra/0nq7vEa1cZbvuekivzjrup67Wi6RpAMx5r
 BTSBj6iP9myF9ZrImq0d0WqvOJQ2Iw7Wl7TgUm/SazsP/7G2hQxIYw5bovClIxJ7Xd3M
 YD5TIG8+EeX24CXbXpj4DKxrfF3bE2pMlUCWom1rv8ChVsapcsDp6WLIH1OY8oWZ8/K7
 3c5mKdMNBw23ZdSpmsHybcN2RTySWyqOJUMIle2qOe1pH/4wGpiVe6NhyViLdZzgW1Qc
 OfFTO0XJcYQtV/1K9V4GZrG73OKRzzSEnU11ekE3ndMFRWVXVZ93Yb/CIwIIxqoOadM+
 0M7w==
X-Gm-Message-State: AOAM531yCyuDwA7h6slE1W32ZZZethvnk0gf7wZzEbTmBj9Q5p0D1hhT
 RHY4+RDS8zSPN3JZ5NA/VLEtUPxpx/vy9ZsvmTQNkgRy9Xd5T/K8oHiq5hQCQ7RFRdQeyTFw/H9
 DDXEcDg844s4/e2fMYGyQjkw4uHmU/bGAqzGgaW5Gn3bDeUXX/GY/i35NVMBEAvdh
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr552141wmf.47.1615826642482; 
 Mon, 15 Mar 2021 09:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwkZ6y/hKzyito5vbkI8IlDR4uAvceDUF0MJCsawM8UmYRy4y6wU9aAIw+GpgvcIo9tHC1Qw==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr552119wmf.47.1615826642252; 
 Mon, 15 Mar 2021 09:44:02 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v13sm22154988wrt.45.2021.03.15.09.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 09:44:01 -0700 (PDT)
Subject: Re: [PULL 13/18] hw/core: implement a guest-loader to support static
 hypervisor guests
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <20210308135104.24903-14-alex.bennee@linaro.org>
 <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
Date: Mon, 15 Mar 2021 17:44:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 5:16 PM, Christian Borntraeger wrote:
> 
> 
> On 08.03.21 14:50, Alex Bennée wrote:
>> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
>> their initial guest somewhere in memory and pass the information to it
>> via platform data. The guest-loader is modelled after the generic
>> loader for exactly this sort of purpose:
>>
>>    $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>>      -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>>      -device
>> guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro
>> console=hvc0 earlyprintk=xen" \
>>      -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20210303173642.3805-5-alex.bennee@linaro.org>
>>
> 
> This now results in
> 
>     /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function
> `loader_insert_platform_data':
>     build/../hw/core/guest-loader.c:56: undefined reference to
> `qemu_fdt_add_subnode'
>     /usr/bin/ld: build/../hw/core/guest-loader.c:57: undefined reference
> to `qemu_fdt_setprop'
>     /usr/bin/ld: build/../hw/core/guest-loader.c:61: undefined reference
> to `qemu_fdt_setprop_string_array'
>     /usr/bin/ld: build/../hw/core/guest-loader.c:68: undefined reference
> to `qemu_fdt_setprop_string'
>     /usr/bin/ld: build/../hw/core/guest-loader.c:74: undefined reference
> to `qemu_fdt_setprop_string_array'
>     collect2: error: ld returned 1 exit status
>     ninja: build stopped: subcommand failed.
> 
> when building s390-softmmu on s390 with  --disable-fdt, which was in my
> build script.
>

Oops. Quick fix:

-- >8 --
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 9cd72edf513..5827996206e 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -37,7 +37,7 @@
   'clock-vmstate.c',
 ))

-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
+softmmu_ss.add(when: ['CONFIG_TCG', fdt], if_true: files('guest-loader.c'))

 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',

---

But better is a Kconfig entry to be able to deselect this
device.


