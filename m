Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6EB6F6B26
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:29:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY40-0001PV-OY; Thu, 04 May 2023 08:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puY3w-0001PG-HE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:27:56 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puY3u-0002pH-Po
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:27:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21C0920A77;
 Thu,  4 May 2023 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683203273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l19bKpbu8rElxtnV8nw339I4HfosoM365Tl3Du5nHO0=;
 b=PjNyI+S8QaS570RpyP2vJa4JMEztLIJAohYcL+PzQQgkEJF9HjIu2oMqC22A6XNuL6GqWS
 Y7+CrC59my5BBTWWHYDxmozHsiXeTw4CnrhX1SQrkxzRJ4a0O9cZ0rh8Q6KzHZNnp8y3Tb
 E2qNsHphtXTNfhAIbkIW8opLn8NCWm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683203273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l19bKpbu8rElxtnV8nw339I4HfosoM365Tl3Du5nHO0=;
 b=50X6PE48/GiuEHXDGqfGMI3mU72iU/FER1CWB/kbkDK1NzvaCRo+H+Kufbjp7bWDW0xJTF
 PivdaSSY7ct5LrAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2628133F7;
 Thu,  4 May 2023 12:27:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QkqjGsikU2RVPQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 04 May 2023 12:27:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PULL 11/35] arm/Kconfig: Do not build TCG-only boards on a
 KVM-only build
In-Reply-To: <b5d0ea65-0485-382b-f59a-84a5596b63a2@redhat.com>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
 <20230502121459.2422303-12-peter.maydell@linaro.org>
 <b5d0ea65-0485-382b-f59a-84a5596b63a2@redhat.com>
Date: Thu, 04 May 2023 09:27:50 -0300
Message-ID: <87bkj0cmd5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thomas Huth <thuth@redhat.com> writes:

> On 02/05/2023 14.14, Peter Maydell wrote:
>> From: Fabiano Rosas <farosas@suse.de>
>> 
>> Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
>> statements in Kconfig. That way they won't be selected when
>> CONFIG_TCG=n.
>> 
>> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
>> keep the two default.mak files not empty and keep aarch64-default.mak
>> including arm-default.mak. That way we don't surprise anyone that's
>> used to altering these files.
>> 
>> With this change we can start building with --disable-tcg.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-id: 20230426180013.14814-12-farosas@suse.de
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   configs/devices/aarch64-softmmu/default.mak |  4 --
>>   configs/devices/arm-softmmu/default.mak     | 37 ------------------
>>   hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
>>   3 files changed, 41 insertions(+), 42 deletions(-)
>> 
>> diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
>> index cf43ac8da11..70e05a197dc 100644
>> --- a/configs/devices/aarch64-softmmu/default.mak
>> +++ b/configs/devices/aarch64-softmmu/default.mak
>> @@ -2,7 +2,3 @@
>>   
>>   # We support all the 32 bit boards so need all their config
>>   include ../arm-softmmu/default.mak
>> -
>> -CONFIG_XLNX_ZYNQMP_ARM=y
>> -CONFIG_XLNX_VERSAL=y
>> -CONFIG_SBSA_REF=y
>> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
>> index cb3e5aea657..647fbce88d3 100644
>> --- a/configs/devices/arm-softmmu/default.mak
>> +++ b/configs/devices/arm-softmmu/default.mak
>> @@ -4,40 +4,3 @@
>>   # CONFIG_TEST_DEVICES=n
>>   
>>   CONFIG_ARM_VIRT=y
>> -CONFIG_CUBIEBOARD=y
>> -CONFIG_EXYNOS4=y
>> -CONFIG_HIGHBANK=y
>> -CONFIG_INTEGRATOR=y
>> -CONFIG_FSL_IMX31=y
>> -CONFIG_MUSICPAL=y
>> -CONFIG_MUSCA=y
>> -CONFIG_CHEETAH=y
>> -CONFIG_SX1=y
>> -CONFIG_NSERIES=y
>> -CONFIG_STELLARIS=y
>> -CONFIG_STM32VLDISCOVERY=y
>> -CONFIG_REALVIEW=y
>> -CONFIG_VERSATILE=y
>> -CONFIG_VEXPRESS=y
>> -CONFIG_ZYNQ=y
>> -CONFIG_MAINSTONE=y
>> -CONFIG_GUMSTIX=y
>> -CONFIG_SPITZ=y
>> -CONFIG_TOSA=y
>> -CONFIG_Z2=y
>> -CONFIG_NPCM7XX=y
>> -CONFIG_COLLIE=y
>> -CONFIG_ASPEED_SOC=y
>> -CONFIG_NETDUINO2=y
>> -CONFIG_NETDUINOPLUS2=y
>> -CONFIG_OLIMEX_STM32_H405=y
>> -CONFIG_MPS2=y
>> -CONFIG_RASPI=y
>> -CONFIG_DIGIC=y
>> -CONFIG_SABRELITE=y
>> -CONFIG_EMCRAFT_SF2=y
>> -CONFIG_MICROBIT=y
>> -CONFIG_FSL_IMX25=y
>> -CONFIG_FSL_IMX7=y
>> -CONFIG_FSL_IMX6UL=y
>> -CONFIG_ALLWINNER_H3=y
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 87c1a29c912..2d7c4579559 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -35,20 +35,24 @@ config ARM_VIRT
>>   
>>   config CHEETAH
>>       bool
>> +    default y if TCG && ARM
>>       select OMAP
>>       select TSC210X
>>   
>>   config CUBIEBOARD
>>       bool
>> +    default y if TCG && ARM
>>       select ALLWINNER_A10
> ...
>
>   Hi!
>
> Sorry for not noticing this earlier, but I have to say that I really dislike 
> this change, since it very much changes the way we did our machine 
> configuration so far.
> Until now, you could simply go to configs/devices/*-softmmu/*.mak and only 
> select the machines you wanted to have with "...=y" and delete everything 
> else. Now you have to know *all* the machines that you do *not* want to have 
> in your build and disable them with "...=n" in that file. That's quite ugly, 
> especially for the arm target that has so many machines. (ok, you could also 
> do a "--without-default-devices" configuration to get rid of the machines, 
> but that also disables all other kind of devices that you then have to 
> specify manually).
>

Would leaving the CONFIGs as 'n', but commented out in the .mak files be
of any help? If I understand your use case, you were probably just
deleting the CONFIG=y for the boards you don't want. So now you'd be
uncommenting the CONFIG=n instead.

Alternatively, we could revert the .mak part of this change, convert
default.mak into tcg.mak and kvm.mak, and use those transparently
depending on whether --disable-tcg is present in the configure line.

But there's probably a better way still that I'm not seeing here, let's
see what others think.


