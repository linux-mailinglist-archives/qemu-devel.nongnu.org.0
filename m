Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA139D179
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 22:36:50 +0200 (CEST)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpzVp-00052x-Ji
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 16:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpzV0-0004Be-TR; Sun, 06 Jun 2021 16:35:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:18109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpzUy-0007Px-4g; Sun, 06 Jun 2021 16:35:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 35FCC7457ED;
 Sun,  6 Jun 2021 22:35:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 12E35745709; Sun,  6 Jun 2021 22:35:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 116C97456B4;
 Sun,  6 Jun 2021 22:35:53 +0200 (CEST)
Date: Sun, 6 Jun 2021 22:35:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/5] ppc/pegasos2: Introduce Pegasos2MachineState
 structure
In-Reply-To: <0ac0e981-ca13-f70e-aa89-c051030cbe21@amsat.org>
Message-ID: <8bf1712-ac4-5a99-3698-e935a676c455@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <7ef9d2058fab88cc83c54e0482eeae8e275f0069.1622994395.git.balaton@eik.bme.hu>
 <0ac0e981-ca13-f70e-aa89-c051030cbe21@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1037482681-1623011753=:46874"
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1037482681-1623011753=:46874
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 6 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/6/21 5:46 PM, BALATON Zoltan wrote:
>> Add own machine state structure which will be used to store state
>> needed for firmware emulation.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/ppc/pegasos2.c | 50 +++++++++++++++++++++++++++++++++++------------
>>  1 file changed, 37 insertions(+), 13 deletions(-)
>
>> +struct Pegasos2MachineState {
>> +    MachineState parent_obj;
>> +    PowerPCCPU *cpu;
>> +    DeviceState *mv;
>> +};
>> +
>>  static void pegasos2_cpu_reset(void *opaque)
>>  {
>>      PowerPCCPU *cpu = opaque;
>> @@ -51,9 +60,9 @@ static void pegasos2_cpu_reset(void *opaque)
>>
>>  static void pegasos2_init(MachineState *machine)
>>  {
>> -    PowerPCCPU *cpu = NULL;
>> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
>> +    CPUPPCState *env;
>>      MemoryRegion *rom = g_new(MemoryRegion, 1);
>
> It would be nice to have the 'rom' variable also in the machine state.
> Can be done later...

I've only moved vars to the new machine state that will be needed outside 
of the init method for VOF and rom isn't so that's kept local. It could be 
put there for consistency but not really needed so I've left it here.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks. By the way, even though this series allows loading Linux and 
MorphOS without the board ROM I'd prefer to keep the test using the ROM as 
implemented in your series because that excercies the emulation more than 
booting without ROM as the firmware inits more devices and uses more 
facilities that VOF mostly bypasses so for a test the board firmware is 
more complete.

Regards,
BALATON Zoltan
--3866299591-1037482681-1623011753=:46874--

