Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8911E2D29B8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 12:25:45 +0100 (CET)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmb7m-0002aN-3n
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 06:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmb60-00023a-7O; Tue, 08 Dec 2020 06:23:52 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:25736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmb5x-0000OD-JJ; Tue, 08 Dec 2020 06:23:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 02FFA746558;
 Tue,  8 Dec 2020 12:23:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CBDDC746557; Tue,  8 Dec 2020 12:23:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CAD8C746383;
 Tue,  8 Dec 2020 12:23:43 +0100 (CET)
Date: Tue, 8 Dec 2020 12:23:43 +0100 (CET)
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v11] spapr: Implement Open Firmware client interface
In-Reply-To: <8ebff33c-8eba-17b4-b3ac-e5ba7bd2b8f9@ozlabs.ru>
Message-ID: <384f5d48-7c3d-40d7-1d6-fc64d960303a@eik.bme.hu>
References: <20201207073327.33367-1-aik@ozlabs.ru>
 <14ffa53d-30cf-2f5f-d7e-90774bfe8eed@eik.bme.hu>
 <8ebff33c-8eba-17b4-b3ac-e5ba7bd2b8f9@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-119515438-1607426623=:47735"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-119515438-1607426623=:47735
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 8 Dec 2020, Alexey Kardashevskiy wrote:
> On 07/12/2020 22:48, BALATON Zoltan wrote:
>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>> index 2e89e36cfbdc..048bf49592aa 100644
>>> --- a/include/hw/ppc/spapr.h
>>> +++ b/include/hw/ppc/spapr.h
>>> @@ -175,6 +175,13 @@ struct SpaprMachineState {
>>>     long kernel_size;
>>>     bool kernel_le;
>>>     uint64_t kernel_addr;
>>> +    bool vof; /* Virtual Open Firmware */
>>> +    uint32_t rtas_base;
>>> +    GArray *claimed; /* array of SpaprOfClaimed */
>>> +    uint64_t claimed_base;
>>> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
>>> +    uint32_t of_instance_last;
>>> +    char *bootargs;
>> 
>> Are these really state for vof so is it better to place them in a separate 
>> of_state struct instead of adding to the machine state? I'm not interested 
>> in spapr but interested in using vof as a replacement firmware for other 
>> machines so clear separation of what is spapr specific and what is vof 
>> specific would help me (and maybe also other reviewers to tell how much 
>> impact this really has on spapr which seems to be a concern of Greg).
>
> This is a very good point, I'll separate VOF from the rest, may be even at 
> QOM level. I was also thinking of adding a pseries-vof machine type but this 
> is probably an overkill.
>
> Out of curiosity - how are you going to use this VOF anyway, for what machine 
> type?

https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

It is basically working now, can boot MorphOS (and also AmigaOS but that 
has no display driver for VGA so can't be seen such as some Linux versions 
for the machine too which have the same problem) but to be able to 
upstream it I'll need to clean it up and have some firmware to avoid 
needing a non-distributable ROM image. VOF might be the simplest way for 
this to just get the Amiga like bootloaders and Linux start which only 
need some CI fuctions.

Regards,
BALATON Zoltan
--3866299591-119515438-1607426623=:47735--

