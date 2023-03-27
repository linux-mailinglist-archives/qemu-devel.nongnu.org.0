Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489276CA428
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:32:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgm1M-0004QC-C4; Mon, 27 Mar 2023 08:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgm1I-0004Pp-7L
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:32:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgm1G-00036A-AW
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:32:15 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RC4AUY012286; Mon, 27 Mar 2023 12:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pV7Xo+6+FKa7kwkxD6guhDxvuAPNYDCdqyQ+Hy2fExY=;
 b=EJrgcVgHYmKYbaHq1FzC+MmXzmCH1TaCuZfgpeE23mr3XXtel/bEdKa2zh2lKFn/BFk5
 Xf9pwbO+ik9tpqu3RS/voKd83VXtVjNsWVAHVacGIS68lX9DsOuX1pw8olgztPYrtMFL
 NNtFugdGClmVJVXcKFsqmfZtY/RjAt51t0S0aMsTO97oSiEBjvXVLDYvlV0CEsbM9rn1
 1TIkeup0eEaRNFJY1vj6DRnz0FKW5QL0zr0QbeLPZTUYFS9lGUFIVbPPlA4qSnfQ+x0g
 qaKXiPpaDb7wgj5JxdVil00vYPO+8vhHEFqEJXyLYVs2wJ1vkkdBehfvuoouE+7RLBu1 NQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb1afxc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:31:58 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32R9qDnZ005784;
 Mon, 27 Mar 2023 12:31:57 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6u5xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:31:57 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RCVu9R34800248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 12:31:56 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21FEB5805B;
 Mon, 27 Mar 2023 12:31:56 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 986E458055;
 Mon, 27 Mar 2023 12:31:55 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 12:31:55 +0000 (GMT)
Message-ID: <2acc460f-95de-fa22-a9b1-f02e198147b0@linux.ibm.com>
Date: Mon, 27 Mar 2023 08:31:55 -0400
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
In-Reply-To: <2ef78250-dfe6-688f-eb27-9af97ce593e7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 52zRet6kYfLNJkP84Y3IopSnX209cniV
X-Proofpoint-GUID: 52zRet6kYfLNJkP84Y3IopSnX209cniV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270098
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



On 3/27/23 07:11, Stefan Berger wrote:
> 
> 

>> We get this message when booting from a kernel:
>>
>> [    0.582699] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
>> [    0.586361] tpm tpm0: A TPM error (256) occurred attempting the self test
>> [    0.586623] tpm tpm0: starting up the TPM manually
>>
>> Do we understand why the error appears?
> 
> The firmware did not initialize the TPM 2.
> 

>> However on a clean boot into the TPM, the u-boot tpm commands fail:
>>
>> ast# tpm info
>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [closed]
>> ast# tpINTERRUPT>
> 
> Is this normal output? Is it an indication of some sort of IRQ?
> 
>> ast# tpm init
>> ast# tpm info
>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [open]
>> ast# tpm pcr_read 0 0x81000000
>> Error: 256

If this is an error from the TPM 2 , then the 256 error code is the same as reported by Linux above:

$ tssreturncode 0x100
TPM_RC_INITIALIZE - TPM not initialized by TPM2_Startup or already initialized


I will try to reproduce this today. u-boot should have a sent TPM2_Startup as part of 'tpm init' command above or even before on its own.

     Stefan

