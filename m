Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B233F56C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:26:39 +0100 (CET)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZ0I-0004z2-AX
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMYZz-0000rL-Hg
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMYZx-0004Hl-6n
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615996762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdNpFd2oH5cIQMeTtqATMLbaxbn3/k5IR+f4n527Q+I=;
 b=OvAeF9ZUmrGxrLqVa3Z3PEailVRdUfEFyGiSq9Jaaj0c0eW5CdIgqN8pL95KEjVEesXyzH
 OYVIpLY7/P2pDWv6rfKGXFv4cmVCRLqzai71ig07gDWmbxu7yGmPW855NoUk2lFLB/QDqf
 wCNWAT1/ckM9+JdVV+IPNUXPofAsFUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-c93wPVNsOKOOz_iRRdyDCA-1; Wed, 17 Mar 2021 11:59:18 -0400
X-MC-Unique: c93wPVNsOKOOz_iRRdyDCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43BE710CE790;
 Wed, 17 Mar 2021 15:59:17 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-112.ams2.redhat.com
 [10.36.113.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E37365D6A1;
 Wed, 17 Mar 2021 15:59:14 +0000 (UTC)
Subject: Re: [RFC PATCH 5/8] qtest/libqos: Restrict CPU I/O instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-6-f4bug@amsat.org>
 <b1dc01eb-0090-e47e-2731-c1920d9cda42@redhat.com>
 <66630c68-d8ff-45ca-24e6-bbef1fc566ee@linaro.org>
 <235ffc43-288b-85aa-29f9-8f23e596674b@amsat.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b5d2af4c-9288-91cd-5352-4ef1dff18742@redhat.com>
Date: Wed, 17 Mar 2021 16:59:13 +0100
MIME-Version: 1.0
In-Reply-To: <235ffc43-288b-85aa-29f9-8f23e596674b@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/16/21 16:55, Philippe Mathieu-Daudé wrote:
> Hi Richard and Laszlo,
> 
> On 3/16/21 4:43 PM, Richard Henderson wrote:
>> On 3/16/21 9:37 AM, Laszlo Ersek wrote:
>>> (+Peter, comment below)
>>>
>>> On 03/15/21 00:29, Philippe Mathieu-Daudé wrote:
>>>> Restrict CPU I/O instructions to architectures providing
>>>> I/O bus.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>   tests/qtest/libqos/fw_cfg.h | 3 +++
>>>>   tests/qtest/libqos/fw_cfg.c | 2 ++
>>>>   2 files changed, 5 insertions(+)
>>>>
>>>> diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
>>>> index c6a7cf8cf05..3bfb6d6d55b 100644
>>>> --- a/tests/qtest/libqos/fw_cfg.h
>>>> +++ b/tests/qtest/libqos/fw_cfg.h
>>>> @@ -36,6 +36,8 @@ size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char
>>>> *filename,
>>>>     QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
>>>>   void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
>>>> +
>>>> +#ifdef TARGET_HAS_IOPORT
>>>>   QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
>>>>   void io_fw_cfg_uninit(QFWCFG *fw_cfg);
>>>>   @@ -48,6 +50,7 @@ static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>>   {
>>>>       io_fw_cfg_uninit(fw_cfg);
>>>>   }
>>>> +#endif /* TARGET_HAS_IOPORT */
>>>>     G_DEFINE_AUTOPTR_CLEANUP_FUNC(QFWCFG, mm_fw_cfg_uninit)
>>>>   diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
>>>> index 6b8e1babe51..db2b83f5212 100644
>>>> --- a/tests/qtest/libqos/fw_cfg.c
>>>> +++ b/tests/qtest/libqos/fw_cfg.c
>>>> @@ -131,6 +131,7 @@ void mm_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>>       g_free(fw_cfg);
>>>>   }
>>>>   +#ifdef TARGET_HAS_IOPORT
>>>>   static void io_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
>>>>   {
>>>>       qtest_outw(fw_cfg->qts, fw_cfg->base, key);
>>>> @@ -162,3 +163,4 @@ void io_fw_cfg_uninit(QFWCFG *fw_cfg)
>>>>   {
>>>>       g_free(fw_cfg);
>>>>   }
>>>> +#endif /* TARGET_HAS_IOPORT */
>>>>
>>>
>>> I'm not sure the macro name is ideal; the PCI host on aarch64/"virt"
>>> emulates IO Ports (it's possible to allocate PCI IO resources on
>>> "virt"). From patch#3, TARGET_HAS_IOPORT does not seem to extend to
>>> arm64.
>>
>> Correct, aarch64 has memory-mapped pci io resources, they are not on a
>> separate ioport address space as for x86 and avr.
> 
> I first wrote TARGET_CPU_HAS_IOPORT but realized architecture
> and CPU are linked, so I elided _CPU_.
> 
> What I'd like to clear from the QTest API is the idea that the CPU has
> direct access to the I/O bus via I/O specific instructions.
> 
> Any machine able to use a host <-> PCI bus chipset is able to access
> the I/O function from the PCI bus.
> 
> The fact that on X86 the first PCI function is wired to the same I/O
> bus than the CPU is a machine implementation detail.
> 
> When accessing PCI I/O ressources on Aarch64, you don't have to use
> dedicated I/O instructions.
> 
> Anyway for now Thomas discarded this series, as QTest is a generic API,
> and we never had to worry about mixing address spaces so far, so not in
> a hurry to clean this (although it would be useful to change address
> space to access DMA or secure-CPU-view from QTest).

If this is about an "IO Bus" or "IO instructions", then we should call
the macro TARGET_HAS_IO_BUS or "TARGET_ISA_HAS_IO" (or
"TARGET_HAS_IO_INSNS"), or something like those. My only confusion was
about the "IO Port" expression in the macro name; the idea is OK from my
perspective otherwise.

Thanks
Laszlo


