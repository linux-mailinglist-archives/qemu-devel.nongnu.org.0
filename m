Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA516CA547
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:11:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmc1-0004tq-2d; Mon, 27 Mar 2023 09:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgmbx-0004tQ-Om
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:10:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgmbv-0000my-1B
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:10:09 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RD58r3015540; Mon, 27 Mar 2023 13:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=V8I/3bA96alGW8kyWWYBhkFvB9NutjULEZ1w/WYHPvc=;
 b=S7iSC5HNZo+50qsD9Z10rDv7H3/7ge6SfeiRFZ9gdMGtK7cNrlIzWfkkHa3kbLa41uNz
 EtpxfREy/+ZeLJdtXZjWMAY+xuFmhla2SBu9xcfRf1Swhjm2FaaF7yQs4cBpXlyXDuYb
 lRclfEkixJT7+vlnMBUVJUKk8lDWl8Z9r1v9nNuxBHyhobA6qRpM7YdMFNOYfyjnwNji
 vS7tGFiivcCEUCf+VFz0GBD+y6fCNRN2H/oRMDuh+quqxaDKB6KCKp65r3OERbDft+Wl
 0juJkJbb7HW4cvs7Us6UZTX57aZtJuanGkjOPZivRo1gpWe+XTM3EC1h+Z5SbZvNzLTf 6Q== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaqdsav4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:09:58 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RA2HCA029113;
 Mon, 27 Mar 2023 13:09:57 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk6x3t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:09:57 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RD9uHw38732402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 13:09:56 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CEAD5805C;
 Mon, 27 Mar 2023 13:09:56 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCA695805A;
 Mon, 27 Mar 2023 13:09:55 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 13:09:55 +0000 (GMT)
Message-ID: <1133a564-008a-b107-aa0b-02eab3b01c29@linux.ibm.com>
Date: Mon, 27 Mar 2023 09:09:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, andrew@aj.id.au, clg@kaod.org
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
 <2ef78250-dfe6-688f-eb27-9af97ce593e7@linux.ibm.com>
 <2acc460f-95de-fa22-a9b1-f02e198147b0@linux.ibm.com>
In-Reply-To: <2acc460f-95de-fa22-a9b1-f02e198147b0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dlk2OfbaP2ZllaSMdd2BygBu4ImfsLC7
X-Proofpoint-ORIG-GUID: Dlk2OfbaP2ZllaSMdd2BygBu4ImfsLC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 3/27/23 08:31, Stefan Berger wrote:
> 
> 
> On 3/27/23 07:11, Stefan Berger wrote:
>>
>>
> 
>>> We get this message when booting from a kernel:
>>>
>>> [    0.582699] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
>>> [    0.586361] tpm tpm0: A TPM error (256) occurred attempting the self test
>>> [    0.586623] tpm tpm0: starting up the TPM manually
>>>
>>> Do we understand why the error appears?
>>
>> The firmware did not initialize the TPM 2.
>>
> 
>>> However on a clean boot into the TPM, the u-boot tpm commands fail:
>>>
>>> ast# tpm info
>>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [closed]
>>> ast# tpINTERRUPT>
>>
>> Is this normal output? Is it an indication of some sort of IRQ?
>>
>>> ast# tpm init
>>> ast# tpm info
>>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [open]
>>> ast# tpm pcr_read 0 0x81000000
>>> Error: 256
> 
> If this is an error from the TPM 2 , then the 256 error code is the same as reported by Linux above:
> 
> $ tssreturncode 0x100
> TPM_RC_INITIALIZE - TPM not initialized by TPM2_Startup or already initialized
> 
> 
> I will try to reproduce this today. u-boot should have a sent TPM2_Startup as part of 'tpm init' command above or even before on its own.

One needs to do this here:

ast# tpm2 startup TPM2_SU_CLEAR
ast# tpm2 pcr_read 0 0x81000000
PCR #0 content (332 known updates):
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

    Stefan

