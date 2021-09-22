Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C9414768
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:12:12 +0200 (CEST)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0Ad-0000Cj-0n
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mT09B-0007n2-Ib; Wed, 22 Sep 2021 07:10:44 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mT096-0005XZ-Pg; Wed, 22 Sep 2021 07:10:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5092E748F56;
 Wed, 22 Sep 2021 13:10:32 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1D9B8748F52; Wed, 22 Sep 2021 13:10:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1C4FB748F4C;
 Wed, 22 Sep 2021 13:10:32 +0200 (CEST)
Date: Wed, 22 Sep 2021 13:10:32 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
In-Reply-To: <95ebb46a-6e2f-d7b0-c8c6-11eac162c9a1@gmail.com>
Message-ID: <c7d4066-5f3-d52-413d-ae58c7d536da@eik.bme.hu>
References: <20210921194347.52347-1-danielhb413@gmail.com>
 <20210922102625.43c89e1f@bahia.huguette>
 <e58f3fce-b1b5-1e90-10a1-3a76169e3940@eik.bme.hu>
 <95ebb46a-6e2f-d7b0-c8c6-11eac162c9a1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-422008590-1632309032=:99955"
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-422008590-1632309032=:99955
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 22 Sep 2021, Daniel Henrique Barboza wrote:
> On 9/22/21 06:51, BALATON Zoltan wrote:
>> On Wed, 22 Sep 2021, Greg Kurz wrote:
>>> On Tue, 21 Sep 2021 16:43:47 -0300
>>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>> 
>>>> This patch has a handful of modifications for the recent added
>>>> FORM2 support:
>>>> 
>>>> - there is no particular reason for both 'lookup_index_table' and
>>>> 'distance_table' to be allocated in the heap, since their sizes are
>>>> known right at the start of the function. Use static allocation in
>>>> them to spare a couple of g_new0() calls;
>>>> 
>>>> - to not allocate more than the necessary size in 'distance_table'. At
>>>> this moment the array is oversized due to allocating uint32_t for all
>>>> elements, when most of them fits in an uint8_t;
>>>> 
>>>> - create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
>>>> distance value.
>>>> 
>>> 
>>> Not needed. A notion of minimal distance, which is obviously
>>> synonymous to local, already exists in the "sysemu/numa.h"
>>> header :
>>> 
>>> #define NUMA_DISTANCE_MIN         10
>>> 
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>  hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
>>>>  1 file changed, 19 insertions(+), 16 deletions(-)
>>>> 
>>>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>>>> index 58d5dc7084..039a0439c6 100644
>>>> --- a/hw/ppc/spapr_numa.c
>>>> +++ b/hw/ppc/spapr_numa.c
>>>> @@ -19,6 +19,9 @@
>>>>  /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>>>>  #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
>>>> 
>>>> +/* Macro to avoid hardcoding the local distance value */
>>>> +#define NUMA_LOCAL_DISTANCE         10
>>>> +
>>>>  /*
>>>>   * Retrieves max_dist_ref_points of the current NUMA affinity.
>>>>   */
>>>> @@ -500,17 +503,21 @@ static void 
>>>> spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>>      MachineState *ms = MACHINE(spapr);
>>>>      NodeInfo *numa_info = ms->numa_state->nodes;
>>>>      int nb_numa_nodes = ms->numa_state->num_nodes;
>>>> +    /* Lookup index table has an extra uint32_t with its length */
>>>> +    uint32_t lookup_index_table[nb_numa_nodes + 1];
>>>>      int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
>>>> -    g_autofree uint32_t *lookup_index_table = NULL;
>>>> -    g_autofree uint32_t *distance_table = NULL;
>>>> -    int src, dst, i, distance_table_size;
>>>> -    uint8_t *node_distances;
>>>> +    /*
>>>> +     * Distance table is an uint8_t array with a leading uint32_t
>>>> +     * containing its length.
>>>> +     */
>>>> +    uint8_t distance_table[distance_table_entries + 4];
>>>> +    uint32_t *distance_table_length;
>>>> +    int src, dst, i;
>>>> 
>>>>      /*
>>>>       * ibm,numa-lookup-index-table: array with length and a
>>>>       * list of NUMA ids present in the guest.
>>>>       */
>>>> -    lookup_index_table = g_new0(uint32_t, nb_numa_nodes + 1);
>>>>      lookup_index_table[0] = cpu_to_be32(nb_numa_nodes);
>>>> 
>>>>      for (i = 0; i < nb_numa_nodes; i++) {
>>>> @@ -518,8 +525,7 @@ static void 
>>>> spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>>      }
>>>> 
>>>>      _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
>>>> -                     lookup_index_table,
>>>> -                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
>>>> +                     lookup_index_table, sizeof(lookup_index_table)));
>>>> 
>>>>      /*
>>>>       * ibm,numa-distance-table: contains all node distances. First
>>>> @@ -531,11 +537,10 @@ static void 
>>>> spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>>       * array because NUMA ids can be sparse (node 0 is the first,
>>>>       * node 8 is the second ...).
>>>>       */
>>>> -    distance_table = g_new0(uint32_t, distance_table_entries + 1);
>>>> -    distance_table[0] = cpu_to_be32(distance_table_entries);
>>>> +    distance_table_length = (uint32_t *)distance_table;
>>>> +    distance_table_length[0] = cpu_to_be32(distance_table_entries);
>>>> 
>>>> -    node_distances = (uint8_t *)&distance_table[1];
>>>> -    i = 0;
>>>> +    i = 4;
>>>> 
>>> 
>>> A comment reminding why we're doing that wouldn't hurt, e.g.
>>> 
>>> /* Skip the array size (uint32_t) */
>> 
>> Then maybe instead of (or in addition to) a comment you could write 
>> sizeof(uint32_t) or sizeof(distance_rable[0]) instead of constant 4 to make 
>> this more explicit.
>
> distance_table is an uint8_t array. sizeof(distance_table[0]) would return 1.

Yes, sorry I was looking at uint32_t *distance_table_length; instead of 
the array definition.

> Doing i = sizeof(uint32_t) demands the reader to realize "this works because 
> it is
> skipping an uint32_t in an uint8_t array and sizeof(uint8_t) is 1".
>
> I think it's clearer to just be explicit in the comment:
>
>
> /* First 4 uint8_t contains the uint32_t array length */

That explains it better (although a bit confusing, if you need the length 
why don't you have a struct with the length and the array instead of 
sroring it in the array when that's a different type, unless this is some 
data structure defined that way, I don't know what this is all about). But 
I don't really care, adding this comment is fine.

Regards,
BALATON Zoltan
--3866299591-422008590-1632309032=:99955--

