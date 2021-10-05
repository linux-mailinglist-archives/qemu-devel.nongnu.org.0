Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA64226E8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:37:46 +0200 (CEST)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjhZ-0005kn-82
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXjfq-0003m7-Rt
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXjfl-000898-W4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633437352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ScFMAWFso1WPvSDp1yQAoPu30GKQRk29RIeda4Rhl9U=;
 b=bNmb9yEbY+5KK/KTOsNsT3TD0xt26yj2C1s9mQ+AvQlnQpjs4H5xrMsA1gnfAO0vIK9qr4
 59KlCIQHLaBwIhu5BRFduaCuGDet78LKl9bcs/3O5vkJcPgBoauna76dv1ge0kLlnq8EZz
 5d7l+QAiFjU3L8zSan3/t1HMdD6zTtU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-XzJ9XiDhPzCZ631F4bv-8w-1; Tue, 05 Oct 2021 08:35:49 -0400
X-MC-Unique: XzJ9XiDhPzCZ631F4bv-8w-1
Received: by mail-wr1-f69.google.com with SMTP id
 n18-20020adff092000000b001609d9081d4so2698724wro.18
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 05:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ScFMAWFso1WPvSDp1yQAoPu30GKQRk29RIeda4Rhl9U=;
 b=KEZBLtYZOwCI+2weLF2NQaYfABOHOlQ4+e7plZTIX2ppbOKoq9gRIx25X7r02irhPZ
 QjfYi/aSgnhOoFIGSG4K/NrmA9MzHUaIpp+HK83ZqtKFyi+dAwRRXFCwBWjr8UE7ljIK
 O/Vp4XydZDSro+BNswQ+bTMBYElFjAXGtPoGjCg+ysswR2bDVVomxUK1e2rclWbjVQe/
 lR7VP25NhjoLXcnge3gi2XE4xWuiEbDaalsVtKy/NAWBn1hDfE7KWlUHFpgtlbLGEEU1
 DeWUbMzTsfSLvkRpvqb/ZvRIZgbMeTDvez/+EKgql3aMAJ6vVFeHhUZGs3ahewrhXRLv
 ifqg==
X-Gm-Message-State: AOAM531lwjIu6SCK5jjjp6pIHp4p30SwYxBUUuP1Sf3XVdFzNiSMouBX
 cvhZwGGGf+bgBHyq8xqmwx85rVxrObsqM/5RICtfMz7ZZjyLVUVMR8xePZ7dvo6Upu6RMXWq5EE
 yshZJWZhSUgddmzI=
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr10299401wra.109.1633437347938; 
 Tue, 05 Oct 2021 05:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx665y8hHsrIJlpZJCND0CyEv70CFtirWlrPLpH/vCcQIl13MgzvKrzPUmmhp9HBLegkWytbA==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr10299367wra.109.1633437347717; 
 Tue, 05 Oct 2021 05:35:47 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id p6sm13010905wrj.95.2021.10.05.05.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 05:35:47 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
Date: Tue, 5 Oct 2021 14:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/2021 14.17, BALATON Zoltan wrote:
> On Tue, 5 Oct 2021, Thomas Huth wrote:
>> On 05/10/2021 10.07, Thomas Huth wrote:
>>> On 05/10/2021 10.05, Alexey Kardashevskiy wrote:
>> [...]
>>>> What is so special about taihu?
>>>
>>> taihu is the other 405 board defined in hw/ppc/ppc405_boards.c (which I 
>>> suggested to deprecate now)
>>
>> I've now also played with the u-boot sources a little bit, and with some 
>> bit of tweaking, it's indeed possible to compile the old taihu board 
>> there. However, it does not really work with QEMU anymore, it immediately 
>> triggers an assert():
>>
>> $ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio
>> **
>> ERROR:accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion failed: 
>> (qemu_mutex_iothread_locked())
>> Aborted (core dumped)
> 
> Maybe it's similar to this: 2025fc6766ab25501e0041c564c44bb0f7389774 The 
> helper_load_dcr() and helper_store_dcr() in target/ppc/timebase_helper.c 
> seem to lock/unlock the iothread but I'm not sure if that's necessary. Also 
> not sure why this does not happen with 460ex but that maybe uses different 
> code.

It's rather the other way round, the locking is missing here instead. I can 
get the serial output with the current QEMU when I add the following patch 
(not sure whether that's the right spot, though):

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index f5d012f860..bb57f1c9ed 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -336,6 +336,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
  {
      PowerPCCPU *cpu = env_archcpu(env);

+    qemu_mutex_lock_iothread();
+
      switch ((val >> 28) & 0x3) {
      case 0x0:
          /* No action */
@@ -353,6 +355,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
          ppc40x_system_reset(cpu);
          break;
      }
+
+    qemu_mutex_unlock_iothread();
  }

  /* PowerPC 40x internal IRQ controller */


>> Going back to QEMU v2.3.0, I can see at least a little bit of output, but 
>> it then also triggers an assert() during DRAM initialization:
>>
>> $ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio
>>
>> Reset PowerPC core
>>
>> U-Boot 2014.10-rc2-00123-g461be2f96e-dirty (Oct 05 2021 - 10:02:56)
>>
>> CPU:   AMCC PowerPC 405EP Rev. B at 770 MHz (PLB=256 OPB=128 EBC=128)
>>       I2C boot EEPROM disabled
>>       Internal PCI arbiter enabled
>>       16 KiB I-Cache 16 KiB D-Cache
>> Board: Taihu - AMCC PPC405EP Evaluation Board
>> I2C:   ready
>> DRAM:  qemu-system-ppc: memory.c:1693: memory_region_del_subregion: 
>> Assertion `subregion->container == mr' failed.
>> Aborted (core dumped)
>>
>> Not sure if this ever worked in QEMU, maybe in the early 0.15 time, but 
>> that version of QEMU also does not compile easily anymore on modern 
>> systems. So I'm afraid, getting this into a workable shape again will take 
>> a lot of time. At least I'll stop my efforts here now.
> 
> Do you have this u-boot binary somewhere just for others who want to try it?

FWIW:
http://people.redhat.com/~thuth/data/u-boot-taihu.bin

  Thomas


