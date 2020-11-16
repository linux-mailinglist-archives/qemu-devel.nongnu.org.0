Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F02B5212
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:12:39 +0100 (CET)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekre-0007zF-Et
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1kekkg-0007qq-8a; Mon, 16 Nov 2020 15:05:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1kekkb-0004H5-4k; Mon, 16 Nov 2020 15:05:25 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGK3ASp193848; Mon, 16 Nov 2020 15:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lJA+AnT/l241lTjBCfyBEQuQBdKCm1lzeY8dCbALNGY=;
 b=sAXt9KPJSpNgRDXKIlxDRgZ2tGr1s439jPKy0ImJBGFMwjmNrpKjJlKXCmVqsQwPTQkt
 bhSxjGB9tF2w8Wc9GZoe85BjFktuC83QWKub2yGJOUMigM2PO0THaF43E6uOAfRojvnl
 /z5RV/foRZPv9dyXM4TCYDvroXYK8Lvw1ZIqrvpKG8mTQ0qyVr7zkDQ21Kvh1AsUr2Bi
 OrAeAUT+3pY76Elm3n/02F4HSoaP6obfslkDOVDWGcoD/EuIbaaRQIjOskuMhOAM0liZ
 jhWN2FmDqEJUWQB/WAkZ4c9uJJgvr5D8s4KljGkOsEVH21j0eFFCTPAAm0GN4U/yTu3l Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ux91aw3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 15:05:17 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AGK3IeN194371;
 Mon, 16 Nov 2020 15:05:17 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ux91aw3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 15:05:17 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AGJqVAx026780;
 Mon, 16 Nov 2020 20:05:16 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 34uttr2d91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 20:05:16 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AGK5FJw16122344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 20:05:15 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06ACDB205F;
 Mon, 16 Nov 2020 20:05:15 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D56DBB2066;
 Mon, 16 Nov 2020 20:05:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.168.118])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Nov 2020 20:05:14 +0000 (GMT)
Subject: Re: [PATCH v3] s390/kvm: fix diag318 propagation and reset
 functionality
To: Cornelia Huck <cohuck@redhat.com>
References: <20201113221022.257054-1-walling@linux.ibm.com>
 <20201116131241.29a13126.cohuck@redhat.com>
From: Collin Walling <walling@linux.ibm.com>
Message-ID: <0e47b7bd-f6ca-0e57-3a71-57560acbc669@linux.ibm.com>
Date: Mon, 16 Nov 2020 15:05:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201116131241.29a13126.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_10:2020-11-13,
 2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:29:39
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 7:12 AM, Cornelia Huck wrote:
> On Fri, 13 Nov 2020 17:10:22 -0500
> Collin Walling <walling@linux.ibm.com> wrote:
> 
> [please remember to put qemu-devel on cc: as well]
> 
>> The Control Program Name Code (CPNC) portion of the diag318
>> info must be set within the SIE block of each VCPU in the
>> configuration. The handler will iterate through each VCPU
>> and dirty the diag318_info reg to be synced with KVM on a
>> subsequent sync_regs call.
>>
>> Additionally, the diag318 info resets must be handled via
>> userspace. As such, QEMU will reset this value for each
>> VCPU during a modified clear, load normal, and load clear
>> reset event.
>>
>> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>> ---
>>
>> Changelog:
>>
>>         v3:
>>         - moved loop outside of switch block
>>         - added kvm_s390_set_diag318 function, called by
>>             do_cpu_function (this is so other archs do
>>             not complain)
>>
>>         v2:
>>         - added Fixes tag
>>         - added CPU feat check in do_cpu function
>>
>> ---
>>  hw/s390x/s390-virtio-ccw.c |  4 ++++
>>  target/s390x/cpu.c         |  7 +++++++
>>  target/s390x/cpu.h         |  1 +
>>  target/s390x/kvm-stub.c    |  4 ++++
>>  target/s390x/kvm.c         | 22 +++++++++++++++++-----
>>  target/s390x/kvm_s390x.h   |  1 +
>>  6 files changed, 34 insertions(+), 5 deletions(-)
> 
> Thanks, queued to s390-fixes.
> 
> I plan to send a pull request tomorrow.
> 
> 

Much appreciated.

-- 
Regards,
Collin

Stay safe and stay healthy

