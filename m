Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967EF3F081D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 17:34:53 +0200 (CEST)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGNae-0003Hv-Ku
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 11:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mGNYE-0000mw-7G
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:32:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mGNYC-0003q6-KC
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:32:22 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IF6GXG196546; Wed, 18 Aug 2021 11:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eCRrdaGsRdvPUi7IeqepGp/ywWUw5F51O1+63GkhWAA=;
 b=PuR6Mlm5pM8GyjDoNKEpU/3zFdhmGj8y4VoFadXSVsvwOTWi2M2vE5IakO2Cp4TM/4DJ
 42qIAXFqnvob8Bc3SiHB3Wjn7zN+Qvgu+FGifZdHJmpICdvKcRsdhK9RLNzS5Ccm9lbN
 cqanSFR8Tns13yWd/WLRTT/41QZLwqLTvX4W3foBwsTqaAnS34348uR/Sj0XWJsTpYS1
 WHg3IFym5Gpp/DcCY3ySqtXFhl0ZI9NqYxiBN+u/8kL8uqVpfAm0mU8sETwx4PL+rUaW
 gm+jJ9NSMynq1yWRw8F30H7pO2VMu4QqWI0I+o67cyvqaWD6OGIKgib914SGty1PErK/ aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcdxstt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 11:32:17 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17IF6Q4A001075;
 Wed, 18 Aug 2021 11:32:16 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcdxstse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 11:32:16 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IFCN1J018306;
 Wed, 18 Aug 2021 15:32:15 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3ae5fdu45e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 15:32:15 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IFWEFe40436158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 15:32:14 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D2B411207E;
 Wed, 18 Aug 2021 15:32:14 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86BE511206E;
 Wed, 18 Aug 2021 15:32:13 +0000 (GMT)
Received: from Tobins-MacBook-Pro-2.local (unknown [9.77.128.89])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Aug 2021 15:32:13 +0000 (GMT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Steve Rutherford <srutherford@google.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Message-ID: <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
Date: Wed, 18 Aug 2021 11:32:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HMlJOmVklu8maihlgMmo1RpAyLTE7Xx1
X-Proofpoint-GUID: 01YqbAMFYi8XhmRsCgn69YUyl21qpsBE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_05:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108180095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=tobin@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, richard.henderson@linaro.org, jejb@linux.ibm.com,
 tobin@ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com, frankeh@us.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 6:04 PM, Steve Rutherford wrote:
> On Tue, Aug 17, 2021 at 1:50 PM Tobin Feldman-Fitzthum
> <tobin@linux.ibm.com> wrote:
>> This is essentially what we do in our prototype, although we have an
>> even simpler approach. We have a 1:1 mapping that maps an address to
>> itself with the cbit set. During Migration QEMU asks the migration
>> handler to import/export encrypted pages and provides the GPA for said
>> page. Since the migration handler only exports/imports encrypted pages,
>> we can have the cbit set for every page in our mapping. We can still use
>> OVMF functions with these mappings because they are on encrypted pages.
>> The MH does need to use a few shared pages (to communicate with QEMU,
>> for instance), so we have another mapping without the cbit that is at a
>> large offset.
>>
>> I think this is basically equivalent to what you suggest. As you point
>> out above, this approach does require that any page that will be
>> exported/imported by the MH is mapped in the guest. Is this a bad
>> assumption? The VMSA for SEV-ES is one example of a region that is
>> encrypted but not mapped in the guest (the PSP handles it directly). We
>> have been planning to map the VMSA into the guest to support migration
>> with SEV-ES (along with other changes).
> Ahh, It sounds like you are looking into sidestepping the existing
> AMD-SP flows for migration. I assume the idea is to spin up a VM on
> the target side, and have the two VMs attest to each other. How do the
> two sides know if the other is legitimate? I take it that the source
> is directing the LAUNCH flows?

Yeah we don't use PSP migration flows at all. We don't need to send the 
MH code from the source to the target because the MH lives in firmware, 
which is common between the two. We start the target like a normal VM 
rather than waiting for an incoming migration. The plan is to treat the 
target like a normal VM for attestation as well. The guest owner will 
attest the target VM just like they would any other VM that is started 
on their behalf. Secret injection can be used to establish a shared key 
for the source and target.

-Tobin

>
> --Steve
>

