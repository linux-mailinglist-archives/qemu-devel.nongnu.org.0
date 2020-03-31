Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B9198E37
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 10:23:45 +0200 (CEST)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJCBU-0003le-7O
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 04:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jJCA2-0003I4-8E
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jJCA1-0000vv-6Y
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:22:14 -0400
Received: from 16.mo1.mail-out.ovh.net ([178.33.104.224]:56227)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jJCA1-0000uv-19
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:22:13 -0400
Received: from player778.ha.ovh.net (unknown [10.110.171.40])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id F24FC1B97DA
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 10:22:10 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 5BA4710F811C8;
 Tue, 31 Mar 2020 08:22:04 +0000 (UTC)
Subject: Re: [PATCH 6/7] target/ppc: Extend ppc_radix64_check_prot() with a
 'partition_scoped' bool
To: Greg Kurz <groug@kaod.org>
References: <20200330094946.24678-1-clg@kaod.org>
 <20200330094946.24678-7-clg@kaod.org> <20200330190149.784a8e11@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <96009e21-d750-1f4a-2662-584381545f8f@kaod.org>
Date: Tue, 31 Mar 2020 10:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330190149.784a8e11@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 18280673838476856216
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeijedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.104.224
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
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/20 7:01 PM, Greg Kurz wrote:
> On Mon, 30 Mar 2020 11:49:45 +0200
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
>> This prepares ground for partition-scoped Radix translation.
>>
>> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  target/ppc/mmu-radix64.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>> index 136498111f60..3ae29ed90d49 100644
>> --- a/target/ppc/mmu-radix64.c
>> +++ b/target/ppc/mmu-radix64.c
>> @@ -105,7 +105,8 @@ static void ppc_radix64_raise_si(PowerPCCPU *cpu, =
int rwx, vaddr eaddr,
>> =20
>> =20
>>  static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t=
 pte,
>> -                                   int *fault_cause, int *prot)
>> +                                   int *fault_cause, int *prot,
>> +                                   bool partition_scoped)
>>  {
>>      CPUPPCState *env =3D &cpu->env;
>>      const int need_prot[] =3D { PAGE_READ, PAGE_WRITE, PAGE_EXEC };
>> @@ -121,11 +122,11 @@ static bool ppc_radix64_check_prot(PowerPCCPU *c=
pu, int rwx, uint64_t pte,
>>      }
>> =20
>>      /* Determine permissions allowed by Encoded Access Authority */
>> -    if ((pte & R_PTE_EAA_PRIV) && msr_pr) { /* Insufficient Privilege=
 */
>> +    if (!partition_scoped && (pte & R_PTE_EAA_PRIV) && msr_pr) {
>>          *prot =3D 0;
>> -    } else if (msr_pr || (pte & R_PTE_EAA_PRIV)) {
>> +    } else if (msr_pr || (pte & R_PTE_EAA_PRIV) || partition_scoped) =
{
>>          *prot =3D ppc_radix64_get_prot_eaa(pte);
>> -    } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) */
>> +    } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) && !partition_scop=
ed */
>>          *prot =3D ppc_radix64_get_prot_eaa(pte);
>>          *prot &=3D ppc_radix64_get_prot_amr(cpu); /* Least combined p=
ermissions */
>>      }
>> @@ -266,7 +267,7 @@ static int ppc_radix64_process_scoped_xlate(PowerP=
CCPU *cpu, int rwx,
>>                                  g_raddr, g_page_size, &fault_cause, &=
pte_addr);
>> =20
>>      if (!(pte & R_PTE_VALID) ||
>> -        ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, g_prot)) =
{
>> +        ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, g_prot, 0=
)) {
>=20
> Maybe pass false since ppc_radix64_check_prot() expects a bool ?

Sure,

> Apart from that,
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks,

C.


