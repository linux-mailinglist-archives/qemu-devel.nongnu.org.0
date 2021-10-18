Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79790431437
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:11:59 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPcc-0006Ay-JE
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mcPa1-0004bp-N5; Mon, 18 Oct 2021 06:09:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mcPZy-0007Rw-GP; Mon, 18 Oct 2021 06:09:17 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I7Sdjx020511; 
 Mon, 18 Oct 2021 06:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CVR8+kQ2F3LYwHXY1A+BqQKE8XkX5yeo6KVKH2B59uU=;
 b=knykwbUZfNmBTGM6dQrAhJ5EushCRqduzziN8+5ZIrg9fqeR3fFpcNkXsNYSbdU91xI2
 wDAclq1lff0fGvd0CkmrzFC7BI5SaRC2A4ZSvBWSLGlsMkqjfOob/NbqA63wftnGrtew
 gfh0m/wGkiKm/qMN8+SqHu03wG167QwaSnHf5bdk9OzeqfOB8gDp4TaSBnWtW4wIKm8n
 tf7GwXGWwjsxxZ11zXQ3rN0HG4N2nBfnSNoi2fUWxxjr1U4JtoF3VjX3kLW2Qvd3sAXS
 mN/SoZ2xaph5oziHQ5erhKlZ/x63+/gp6hHQdDQ0vwLS6bcy1Sb/4MJRrdf1GzLnXKZ6 kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs1cw6whf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 06:09:03 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19IA06tK006875;
 Mon, 18 Oct 2021 06:09:02 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs1cw6wge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 06:09:02 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IA7khK031512;
 Mon, 18 Oct 2021 10:09:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bqpc9ct7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 10:09:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19IA8vow57934212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 10:08:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F212AE061;
 Mon, 18 Oct 2021 10:08:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17669AE056;
 Mon, 18 Oct 2021 10:08:57 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.63.168])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 10:08:57 +0000 (GMT)
Subject: regression on s390: was Re: [PULL 37/40] monitor: Tidy up
 find_device_state()
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu block <qemu-block@nongnu.org>
References: <20211013090728.309365-1-pbonzini@redhat.com>
 <20211013090728.309365-38-pbonzini@redhat.com>
 <3d80dc6b-66bd-34f7-8285-48c0647d6238@de.ibm.com>
 <c01b47a1-43e2-71b7-1cdd-9a1d0f685eb3@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <056a0299-f6f8-9e59-8d2e-db7413210f75@de.ibm.com>
Date: Mon, 18 Oct 2021 12:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c01b47a1-43e2-71b7-1cdd-9a1d0f685eb3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eUNtMkz4vjVR0OL2txwCZ13858YfSvqu
X-Proofpoint-ORIG-GUID: cs-DrUfQg75qe25B4bXsyx3yrgeaAe8Y
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110180062
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 15.10.21 um 21:15 schrieb Richard Henderson:
> On 10/15/21 4:08 AM, Christian Borntraeger wrote:
>>
>> Am 13.10.21 um 11:07 schrieb Paolo Bonzini:
>>> From: Markus Armbruster <armbru@redhat.com>
>>>
>>> Commit 6287d827d4 "monitor: allow device_del to accept QOM paths"
>>> extended find_device_state() to accept QOM paths in addition to qdev
>>> IDs.  This added a checked conversion to TYPE_DEVICE at the end, which
>>> duplicates the check done for the qdev ID case earlier, except it sets
>>> a *different* error: GenericError "ID is not a hotpluggable device"
>>> when passed a QOM path, and DeviceNotFound "Device 'ID' not found"
>>> when passed a qdev ID.  Fortunately, the latter won't happen as long
>>> as we add only devices to /machine/peripheral/.
>>>
>>> Earlier, commit b6cc36abb2 "qdev: device_del: Search for to be
>>> unplugged device in 'peripheral' container" rewrote the lookup by qdev
>>> ID to use QOM instead of qdev_find_recursive(), so it can handle
>>> buss-less devices.  It does so by constructing an absolute QOM path.
>>> Works, but object_resolve_path_component() is easier.  Switching to it
>>> also gets rid of the unclean duplication described above.
>>>
>>> While there, avoid converting to TYPE_DEVICE twice, first to check
>>> whether it's possible, and then for real.
>>
>> This one broke qemu iotest 280 on s390:
>>
>>
>> 280   fail       [13:06:19] [13:06:19]   0.3s   (last: 0.3s)  output mismatch (see 280.out.bad)
>> --- /home/cborntra/REPOS/qemu/tests/qemu-iotests/280.out
>> +++ 280.out.bad
>> @@ -37,14 +37,14 @@
>>   === Resume the VM and simulate a write request ===
>>   {"execute": "cont", "arguments": {}}
>>   {"return": {}}
>> -{"return": ""}
>> +{"return": "Error: Device 'vda/virtio-backend' not found\r\n"}
> 
> Hmm, this test doesn't seem to have been attempted during staging:
> 
>    https://gitlab.com/qemu-project/qemu/-/jobs/1681194907
> 
> Is there something extra that needs to be installed on s390x.ci.qemu.org to have this test run?
> 


No idea. Peter owns the machine. This is one thing to do.
The 2nd thing to do is to fix the regression. Does anyone have an idea what is broken?

