Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47424B888D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 14:09:40 +0100 (CET)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKK3v-0005N1-Jy
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 08:09:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKK17-0003tE-Cm; Wed, 16 Feb 2022 08:06:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKK15-0006RX-6C; Wed, 16 Feb 2022 08:06:45 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GBmA8p024170; 
 Wed, 16 Feb 2022 13:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=aHx6M+eBJfeXkRCorf2vmNru2ZWZZ4cbjiPzMGkOhUs=;
 b=kPTl2PlYTWPPX5rXzSTLNCIVt79Z0uYdRwRFC8CrJKI3sOUwxatPz0bbNDkc4RSAMO4K
 lYBS8r4RdsoRbwoPJTgpymbgJ8cEpY3CT/5zEHu+o4Bo1KiPN6kicXczi82HXz9CMSP2
 vw0/u+J5fhN7pJDHoEmnYwvDvF1DaT4kQBrql77y+TwYwrNhivkz4BRc7M7yOR/8sPKY
 JZ7FauWAlhBLQ17tMibjqisFHZokkwdONJ4c6Fto1uAob1CjM0tIYJDn3oz3kdr/5XwF
 TsE3iX7w3gQAuGsoysxtXVESjVoIofrgnHsO17689+EhOmfLPEaWkU9MUVUFgvK6hTdb yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e90q5t0cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:06:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GCQOKS004261;
 Wed, 16 Feb 2022 13:06:34 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e90q5t0bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:06:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GCvsT4008101;
 Wed, 16 Feb 2022 13:06:33 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3e64hcjv22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 13:06:33 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GD6VWC47317480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 13:06:31 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CBB4AC06E;
 Wed, 16 Feb 2022 13:06:31 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4992FAC06F;
 Wed, 16 Feb 2022 13:06:30 +0000 (GMT)
Received: from localhost (unknown [9.211.144.50])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Feb 2022 13:06:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 26/27] target/ppc: cpu_init: Move check_pow and QOM
 macros to a header
In-Reply-To: <YgxpuvVtY3Roy9Pr@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-27-farosas@linux.ibm.com> <YgxpuvVtY3Roy9Pr@yekko>
Date: Wed, 16 Feb 2022 10:06:26 -0300
Message-ID: <87czjnx8od.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: txDjv__TIPMn8XWldHLjmcK2kz8X9Dun
X-Proofpoint-GUID: 89Zxgy0UJReUSh-kz0XMUd4ph2tHKdVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_06,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160076
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Tue, Feb 15, 2022 at 06:41:47PM -0300, Fabiano Rosas wrote:
>> These will need to be accessed from other files once we move the CPUs
>> code to separate files.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  target/ppc/cpu.h      | 57 +++++++++++++++++++++++++++++++++++++++++++
>>  target/ppc/cpu_init.c | 55 -----------------------------------------
>>  2 files changed, 57 insertions(+), 55 deletions(-)
>> 
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 6a06a7f533..ba0739c43b 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -2733,4 +2733,61 @@ void dump_mmu(CPUPPCState *env);
>>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
>>  void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
>>  uint32_t ppc_get_vscr(CPUPPCState *env);
>> +
>> +/*****************************************************************************/
>> +/* Power management enable checks                                            */
>> +static inline int check_pow_none(CPUPPCState *env)
>> +{
>> +    return 0;
>> +}
>> +
>> +static inline int check_pow_nocheck(CPUPPCState *env)
>> +{
>> +    return 1;
>> +}
>> +
>> +static inline int check_pow_hid0(CPUPPCState *env)
>
> I'm a little nervous about moving this to a more exposed location.  By
> definition the HID register is implementation dependent, and we can
> see immediately below that not all things use the same interpretation
> of it in practice.  So at the very least it seems like it has a bad
> name to be exposed more widely.  It also seems like it might better
> belong next to the code for the cpus that actually use this version.

Good point. Since these are quite simple it might be best to duplicate
them when doing the split between the families. I'm doing the same for
vscr_init.


