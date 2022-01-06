Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD9486963
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 19:09:10 +0100 (CET)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5XCG-0008UH-Me
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 13:09:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n5XB8-0007nT-FI
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:07:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n5XB5-00061n-6q
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:07:57 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206HqTuB011784; 
 Thu, 6 Jan 2022 18:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gBb9xKfzw7vUO4vNhxK5kIm82B1lF1VSEZ+qY1b6Nvs=;
 b=hbKwm++KfrhM/P+gCuwQyrh/sB41PBxVTMNMzTOgNUD0EH8W5saicC3vHhB32TeLvN3Q
 ANuXbGjGHNDE0oJPPw0RlIw+x7IJAFUtKGde6541WzlYmeIgl1iVIh6E7DH6sengA+yU
 3TBddJYIG8fMnyEniG0Ld0MnYHAs1P8NBAa4Cf7GxSOVh0VDVfJHO09B0cskJG6wkI/A
 +xQFpAg2ozlEocjlBXi0FMSAorvAHVgsj0rhuJXCntlUUa/fEo4dZKf//IVZFjDEuuJf
 PPZCm08B4DcRxojYzf6lsSFpsus1DZTrVwQBQj6sWBMb6EzQbASAg7OHUOsk7lRfHxP5 tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de576g8tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 18:07:51 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206Hrejk013904;
 Thu, 6 Jan 2022 18:07:50 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de576g8sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 18:07:50 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206I39fm030681;
 Thu, 6 Jan 2022 18:07:49 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3de4xf0nr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 18:07:49 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206I7m1B32702942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 18:07:48 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21503136084;
 Thu,  6 Jan 2022 18:07:48 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54FC1136104;
 Thu,  6 Jan 2022 18:07:47 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 18:07:47 +0000 (GMT)
Message-ID: <c5c979cb-a1f5-c9f1-d3a0-db7e3a289899@linux.ibm.com>
Date: Thu, 6 Jan 2022 13:07:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 2/3] acpi: tpm: Add missing device identification
 objects
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-3-stefanb@linux.ibm.com>
 <20220106093636.7fc7755f@redhat.com>
 <6096f301-4c39-e39c-eb5f-9f7d22ba1260@linux.ibm.com>
 <20220106085502-mutt-send-email-mst@kernel.org>
 <bc4b7631-6bf5-ce30-8710-48f0369f688c@linux.ibm.com>
 <20220106175547.6b5b8639@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220106175547.6b5b8639@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dUFHLI-KzUo1tVjXsrLpBCTlcoe5Rfph
X-Proofpoint-ORIG-GUID: C-ok2s6yjnjTDCmWISDtFRmhKRDNZXOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_07,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060120
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 11:55, Igor Mammedov wrote:
> On Thu, 6 Jan 2022 09:01:36 -0500
> Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>> On 1/6/22 08:56, Michael S. Tsirkin wrote:
>>> On Thu, Jan 06, 2022 at 08:53:00AM -0500, Stefan Berger wrote:
>>>> On 1/6/22 03:36, Igor Mammedov wrote:
>>>>> On Tue,  4 Jan 2022 12:58:05 -0500
>>>>> Stefan Berger <stefanb@linux.ibm.com> wrote:
>>>>>   
>>>>>> Add missing TPM device identification objects _STR and _UID. They will
>>>>>> appear as files 'description' and 'uid' under Linux sysfs.
>>>>>>
>>>>>> Following inspection of sysfs entries for hardware TPMs we chose
>>>>>> uid '1'.
>>>>> My guess would be that buy default (in case of missing UID), OSPM
>>>>> will start enumerate from 0. So I think 0 is more safer choice
>>>>> when it comes to compatibility.
>>>>>
>>>>> Can you smoke test TPM with Windows, and check if adding UID doesn't
>>>>> break anything if VM actually uses TMP (though I'm not sure how to
>>>>> check it on Windows, maybe install Windows 11 without this patch
>>>>> and then see if it still boots pre-installed VM and nothing is broken
>>>>> after this patch)?
>>>>>   
>>>> I smoke tested it with the posted patches applied to v6.2.0 and started 3
>>>> VMs with it:
>>>>
>>>> - Linux shows uid = 1 and the description "TPM 2.0 Device" in sysfs
>>>>
>>>> - Win 10 and Win 11 tpm.msc tool are both showing that the TPM is 'ready for
>>>> use'
>>>>
>>>>       Stefan
>>>>   
>>> Just to make sure, what Igor was concerned about is issues like
>>> we had with e.g. network devices, when changing UID makes
>>> windows think it's a new device and lose configuration
>>> created on old qemu on boot with a new qemu.
>>> Not sure what can be configured with a TPM device though ...
>> The VMs were all created on an old qemu and booted into the patched
>> qemu. They hadn't seen the new ACPI entries before, for sure not when
>> they were installed.
> In that case I would not bother with compat machinery
>
> (my stance on APCI and compat knobs haven't changed and it
> is avoid it if possible, sometimes that backfires but overall
> keeps code simpler, otherwise it would be unreadable mess
> (it's already complex enough))
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
Another test I did was to remove the TPM 2, boot the win 10 and 11 VMs 
ran tpm.msc (no TPM there), shut them down, added the TPM 2 and ran 
tpm.msc again. Same result: TPM is 'ready for use'.

