Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23F53B914
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:42:59 +0200 (CEST)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwkAE-0000Hz-JK
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nwjmy-0008C8-Ty; Thu, 02 Jun 2022 08:19:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nwjmw-0008FX-Rd; Thu, 02 Jun 2022 08:18:56 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252BQY1x012895;
 Thu, 2 Jun 2022 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=kEeTfL7uhj9IfI3eVAxIzF+k1KiQlK3R/R+k424l4+0=;
 b=gbQM12Ed5wHME5dcAJ9Hq0oM0cSMjzMe3qHnOY9R6fb4PkgP27B8XyuaV8FxrpYnWWPA
 sPGe35mUM5ytzJm5OudiBEJeG2Sxnfd3KaypBXfITP6ky587W5O3S1WDvn129wECACrX
 CBdIzphb3kGKVUqVimiK05q8k/kIUvt7qyjnF6aIeGwBIJ7uVm4PPSvNNrxAwQUBQiLX
 F3CvchtxwotJrExZQ3V8TX6WrVN6If/BPlaqI/h1h8nCVk5dOAx2rYJ6yCN3DZ+jVPs4
 ZqDaCBe/KrYAU/7H8YhBBL4FdEMsxlG1nmqzwPEhj+vwSTjDNY1ebzoG+uIaNxFPLvpO SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevb9rxre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:18:43 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252Bj9lD016146;
 Thu, 2 Jun 2022 12:18:42 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevb9rxr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:18:42 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252C61v2022867;
 Thu, 2 Jun 2022 12:18:41 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3gcxt5sxyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:18:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252CIeBc24969542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 12:18:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A74BAC05B;
 Thu,  2 Jun 2022 12:18:40 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9284AC060;
 Thu,  2 Jun 2022 12:18:38 +0000 (GMT)
Received: from [9.160.111.240] (unknown [9.160.111.240])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jun 2022 12:18:38 +0000 (GMT)
Message-ID: <1bdda03b-c18d-3acc-2a16-cda695559896@linux.ibm.com>
Date: Thu, 2 Jun 2022 09:18:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, mopsfelder@gmail.com,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
 <20220601103825.498c378f@bahia>
 <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
 <28d5e774-c097-99ee-356c-2aa59602f181@gmail.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <28d5e774-c097-99ee-356c-2aa59602f181@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 77OD5wnsWufyAHK8holviMA5_FgITxYg
X-Proofpoint-ORIG-GUID: EoeD8zSgPQvXkMxAkOrJ1jByDQ81uxhU
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_02,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020052
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: muriloo@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Daniel.

On 6/1/22 06:59, Daniel Henrique Barboza wrote:
>
>
> On 6/1/22 06:25, Thomas Huth wrote:
>> On 01/06/2022 10.38, Greg Kurz wrote:
>>> On Wed, 1 Jun 2022 09:27:31 +0200
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
>>>>> Update max alias to power10 so users can take advantage of a more
>>>>> recent CPU model when '-cpu max' is provided.
>> ...
>>> We already have the concept of default CPU for the spapr
>>> machine types, that is usually popped up to the newer
>>> CPU model that is going to be supported in production.
>>> This goes with a bump of the machine type version as
>>> well for the sake of migration. This seems a lot more
>>> reliable than the "max" thingy IMHO.
>>>
>>> Unless there's a very important use case I'm missing,
>>> I'd rather kill the thing instead of trying to resurrect
>>> it.
>>
>> It's about making ppc similar to other architectures, which
>> have "-cpu max" as well, see:
>>
>>   https://gitlab.com/qemu-project/qemu/-/issues/1038
>>
>> It would be nice to get something similar on ppc.
>
>
> I agree that it's preferable to fix it.
>
> This is how I would implement -cpu max today:
>
> pseries (default ppc64 machine):
>   - kvm: equal to -cpu host
>   - tcg: the latest IBM chip available (POWER10 today)
>
> powernv8: POWER8E
> powernv9: POWER9
> powernv10: POWER10
>
> pseries requires more work because the -cpu max varies with the host CPU
> when running with KVM.
>
> About the implementation, for the bug fix it's fine to just hardcode the alias
> for each machine-CPU pair. In the long run I would add more code to make -cpu max
> always point to the current default CPU of the chosen machine by default, with
> each machine overwriting it if needed. This would prevent this alias to be
> deprecated over time because we forgot to change it after adding new CPUs.

I agree with using the default CPU type of the machine as the selected
CPU for "-cpu max".

Anyone disagree?

> For qemu-system-ppc the default machine seems to be g3beige and its default
> CPU is PowerPC 750. I would set -cpu max to this CPU in this case. Matter of
> fact I would attempt to set -cpu max = default cpu for all 32 bits CPUs for
> simplicity. This is also outside of gitlab 1038 as well since the bug isn't
> mentioning 32 bit machines, hence can be done later.
>
>
> Thanks,
>
> Daniel

Cheeers!

--
Murilo


