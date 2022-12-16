Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37E64EC86
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:02:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BHU-0007ZA-Ud; Fri, 16 Dec 2022 09:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p6BHS-0007Ys-8A
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:01:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p6BHP-0001Qg-SW
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:01:42 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGDjSAo003464
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=T+pli0Hp09T9YL8eTfMFbAeCSrXVr1wi/F1MGsvKGB8=;
 b=JO4AkBdtv4AHOG4UMResl3cahQGMe97c6AI0zj+OBtAG3Y1uNK3zgbNyJXoTKfB5CSfG
 7rCj+LvIHASSSQMf+4dvec8UjyqR/cT2MDhAuoskE0TLtuCPylaFDJuDr4mMje2QKvlP
 uH8N8F36pIdFPnbM222dKgslIQQhGrNNcbrObySmLpYCWenIJ8AuPumAEyZHVGBNqnaB
 S9SM44PLK0ckEZqo55eGY74FQTHUZTyAd6zXvpgsL455/H1ykJEz10T+qn+0cCT141ps
 ZVnwTUxhYp1kVCfxX57eQaKPax3uJD8A8ipp9YC07b3XoPhDjs7vkEwLkJTYYAD2BSmu Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgsud0amj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:01:38 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGDnUx4017124
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:01:37 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgsud0agc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 14:01:37 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGCB1pl030922;
 Fri, 16 Dec 2022 14:01:26 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3meyqktcty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 14:01:26 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BGE1PM96161112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Dec 2022 14:01:25 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E7455805A;
 Fri, 16 Dec 2022 14:01:25 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C965958056;
 Fri, 16 Dec 2022 14:01:24 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 16 Dec 2022 14:01:24 +0000 (GMT)
Message-ID: <60d8abdc-50db-53dd-4321-cdc765d15a1a@linux.ibm.com>
Date: Fri, 16 Dec 2022 09:01:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <158a33b6850db9ef18b240834e06665d7f9e4825.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <158a33b6850db9ef18b240834e06665d7f9e4825.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ImmU2NnZ0J_MCiigtJhld0p8R1tgqvok
X-Proofpoint-ORIG-GUID: HB9zVsUsqMY68LGR6ezY0LO0eJQhXpIe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_09,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/16/22 08:53, James Bottomley wrote:
> On Fri, 2022-12-16 at 08:32 -0500, Stefan Berger wrote:
>> On 12/16/22 07:54, Daniel P. Berrangé wrote:
>>> On Fri, Dec 16, 2022 at 07:28:59AM -0500, Stefan Berger wrote:
> [...]
>>>> Nevertheless it needs documentation and has to handle migration
>>>> scenarios either via a blocker or it has to handle them all
>>>> correctly. Since it's supposed to be a TPM running remote you
>>>> had asked for TLS support iirc.
>>>
>>> If the mssim implmentation doesn't provide TLS itself, then I don't
>>> consider that a blocker on the QEMU side, merely a nice-to-have.
>>>
>>> With swtpm the control channel is being used to load and store
>>> state during the migration dance. This makes the use of an external
>>> process largely transparent to the user, since QEMU handles all the
>>> state save/load as part of its migration data stream.
>>>
>>> With mssim there is state save/load co-ordination with QEMU.
>>> Instead whomever/whatever is managing the mssim instance, is
>>> responsible for ensuring it is running with the correct state at
>>> the time QEMU does a vmstate load. If doing a live migration this
>>> co-ordination is trivial if you just use the same mssim instance
>>> for both src/dst to connect to.
>>>
>>> If doing save/store to disk, the user needs to be able to save the
>>> mssim state and load it again later. If doing snapshots and
>>> reverting to old
>>
>> There is no way for storing and loading the *volatile state* of the
>> mssim device.
> 
> Well, yes there is, it saves internal TPM state to an NVChip file:
> 
> https://github.com/microsoft/ms-tpm-20-ref/blob/main/TPMCmd/Platform/src/NVMem.c
> 
> However, if I were running this as a service, I'd condition saving and
> restoring state on a connection protocol, which would mean QEMU
> wouldn't have to worry about it.  The simplest approach, of course, is
> just to keep the service running even when the VM is suspended so the
> state is kept internally.
> 
>>> snapshots, then again whomever manages mssim needs to be keeping
>>> saved TPM state corresponding to each QEMU snapshot saved, and
>>> picking the right one when restoring to old snapshots.
>>
>> This doesn't work.
> 
> I already told you I tested this and it does work.  I'll actually add
> the migration state check to the power on/off path because I need that
> for testing S3 anyway.


Please document how this needs to be done.
> 
>> Either way, if it's possible it can be documented and shown how this
>> works.
> 
> I could do a blog post, but I really don't think you want this in
> official documentation because that creates support expectations.

We have documentation for passthrough and tpm_emulator. If you don't want to add documentation for it to QEMU then please add the driver in as 'unsupported'.

diff --git a/MAINTAINERS b/MAINTAINERS
index 1729c0901c..32fa2eb282 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3017,6 +3017,7 @@ F: include/hw/acpi/tpm.h
  F: include/sysemu/tpm*
  F: qapi/tpm.json
  F: backends/tpm/
+X: backends/tpm/tpm_mssim.*
  F: tests/qtest/*tpm*
  T: git https://github.com/stefanberger/qemu-tpm.git tpm-next

    Stefan


