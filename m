Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AA3C3CD0
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 15:24:59 +0200 (CEST)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ZS6-0000RN-8g
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 09:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ZQy-0007u3-Dw
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 09:23:48 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ZQv-0007bJ-Ji
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 09:23:48 -0400
Received: by mail-pf1-x429.google.com with SMTP id y4so13534096pfi.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/gPujoKZLCK+/fKsjDc+V/H+4xOGSc8qGMFwVNDWeHI=;
 b=U6guVmSR3GMoA6XrwL3/o+OBCs58Wb+3BurOanpICyNTMfxETgTrHLblJzPvzENW/U
 erVEWQgi9S/t3/yo9BIEPZy3Y5Il+CCQTIVg8EI5b/BZtK+VE5B4MaZPpUM/8fRQynOQ
 xHfSX5fcR3IKWPSMJoVdsBfqqhcYUk1wGsa3HdOK1E8Zg+jy+QM+ui80Y0ZANBuRYMGt
 YA8x6SGCBpq2niomCfIoTm6Mj6i6uGYQp0mtDC6hiMIb2976h9nQMJtOuUCAAoyvh2u9
 689XHLAvkJrNmd2O+q0iFBAXJiClBSc7FA6+qImjdsv3+1hra/iWWfyA3n1TzWu3BRHZ
 gJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/gPujoKZLCK+/fKsjDc+V/H+4xOGSc8qGMFwVNDWeHI=;
 b=UqkiYpummx2omPgrEez0JrhCp7xpVxX6jy3p103x2SN+pBSePVgCBLqjZxISGm84qv
 juhWFKNAZWImpOsp12SfaEfV0Bfh8VGaYpRGDqYAfyFSZpoZKfyRjwCzCk5KLugj3Mem
 H9y9NTR1VXckHpERoF1UYz+8nko8VwuhYKDmbSr00Yrl7UNobjKAen3QnvlJ04dBKSBz
 to+x8qBp568Q+rsoC5OjxDeCb8KZgKxrqpBQk5MMXGVCRmvIEFMynRVTA2/VCDQhOY1k
 6S8bsqgOOCcftfaJ7t3/qt4K2ZAMQsmdPiBmXiBhazGV1fHoVuatFoUP7Vrr94pnlHWf
 cuZw==
X-Gm-Message-State: AOAM5300aMA3L7ge/c3S8VOZ3tlmuC2/ai/yRgHd54BuKfHCKqdzALQY
 bMETA39J6atjLDge2TtkFcZWBA==
X-Google-Smtp-Source: ABdhPJzZJK/BCQH8wi+7PLqsHUWQ7g2kAXH1O1o28hVeX/naUxcuVaAZXvNi/7Y5UAPh2PWOqQ51NA==
X-Received: by 2002:aa7:8003:0:b029:2eb:2f8f:a320 with SMTP id
 j3-20020aa780030000b02902eb2f8fa320mr48718224pfi.70.1626009823639; 
 Sun, 11 Jul 2021 06:23:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm12486641pff.74.2021.07.11.06.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 06:23:43 -0700 (PDT)
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
To: Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <20210711120854.andcppzuxo6ztykd@Rk>
 <CAFEAcA9tF7pU1uEC06tppkKCL7m+5OYWm8T5MO_qF4P2P_UuOQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d21e1a9e-1df4-4fce-d6de-e7a15131b684@linaro.org>
Date: Sun, 11 Jul 2021 06:23:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9tF7pU1uEC06tppkKCL7m+5OYWm8T5MO_qF4P2P_UuOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.631,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 5:16 AM, Peter Maydell wrote:
> On Sun, 11 Jul 2021 at 13:10, Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Hi Peter,
>>
>> On Sat, Jul 10, 2021 at 02:30:36PM +0100, Peter Maydell wrote:
>>> I've noticed recently that intermittently 'make check' will hang on
>>> my aarch32 test system (really an aarch64 box with an aarch32 chroot).
>>
>> I have a newbie question. How do you do an aarch32 chroot on an aarch64
>> box? At least, this issue seems to be not reproducible on an aarch64 box
>> directly. I specifically ran the qos-test for 5 consecutive times and
>> each time the test could finish successfully,
> 
> Your aarch64 host CPU needs to support aarch32 at EL0 (some
> AArch64 CPUs are pure-64 bit these days). The host kernel needs
> to implement the 32-bit compat layer. It probably also needs to be
> built for 4K pages (which mostly means "not RedHat"). Then you can
> set up the 32-bit chroot however you'd normally set up a chroot
> (for Debian you can do this with debootstrap; other distros will vary;
> schroot is also a bit nicer than raw chroot IMHO.)

If you do have a kernel built with 64k pages ("RedHat"), but you do have a host cpu that 
supports aarch32 at EL1 and EL0, then you can run aarch32 under KVM.

The command-line I use is

../run/bin/qemu-system-aarch64 -m 4096 -smp 8 -nographic \
   -M virt -cpu host,aarch64=off --accel kvm \
   -kernel vmlinuz-4.19.0-16-armmp-lpae \
   -initrd initrd.img-4.19.0-16-armmp-lpae \
   -append 'console=ttyAMA0 root=/dev/vda2' \
   -drive if=none,file=hda.q,format=qcow2,id=hd,discard=on \
   -device virtio-blk-device,drive=hd \
   -netdev tap,id=tap0,br=virbr0,helper=/usr/libexec/qemu-bridge-helper \
   -device virtio-net-device,netdev=tap0

I believe that I had to perform the install under tcg because I couldn't find the right 
magic to boot off the debian cdrom with kvm.


r~

