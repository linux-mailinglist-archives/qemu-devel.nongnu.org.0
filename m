Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3AD6CAF4D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 21:58:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgsyV-0000oS-LQ; Mon, 27 Mar 2023 15:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgsyT-0000dM-2G
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:57:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgsyR-0001cN-F8
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:57:48 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RJC9c3028314; Mon, 27 Mar 2023 19:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TqRIUlfnJIuTqykBGRYdW0kkZHcPwcwiUOEFHnnOlYg=;
 b=NwTtcs4QoylwZXncbFiJXG391/oyLOIILCBzN4IjqxDTIL7aZTKhmg03c/82P7wkBklf
 XUzekPlt7p3M5+Sabl7iQv1dVpebq+3BN4C+rnK0oi2coDFwdkY8yXIkkSRXfAxB/95w
 GyWHIR0PGp2xBbT7cVAarkevA6rpCTSR9cQWGTg6i+4faOIvU7vnmwBMHsrKtiyCT4Kh
 Bxe2zhw+WFW/kdhzoxtRrf17XsRBAba2oUuzT7IyKymiK1RhGv0oX3Io7zut0KVuKNbc
 uPtFu/ogufab0l4GvCRFhNPzx9iEGYsALjYwpB/OWowa17W5dMQEXPB72LC2RrmJiH86 Sw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkh3bh2y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 19:57:37 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RHMgMm032032;
 Mon, 27 Mar 2023 19:57:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3phrk74w73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 19:57:35 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RJvYBx54591826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 19:57:34 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 561405805A;
 Mon, 27 Mar 2023 19:57:34 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 014055803F;
 Mon, 27 Mar 2023 19:57:34 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 19:57:33 +0000 (GMT)
Message-ID: <be0e380e-c033-7e14-c760-b13101130d0d@linux.ibm.com>
Date: Mon, 27 Mar 2023 15:57:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 2/3] tpm: Extend common APIs to support TPM TIS I2C
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230327183350.4060507-1-ninad@linux.ibm.com>
 <20230327183350.4060507-3-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230327183350.4060507-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aUHHT-m36qE35zViBEjk-MHSaQmP9YTN
X-Proofpoint-ORIG-GUID: aUHHT-m36qE35zViBEjk-MHSaQmP9YTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=708 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270160
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



On 3/27/23 14:33, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices.
> 
> This commit includes changes for the common code.
> - Added support for the new checksum registers which are required for
>    the I2C support. The checksum calculation is handled in the qemu
>    common code.
> - Added wrapper function for read and write data so that I2C code can
>    call it without MMIO interface.
> 
> The TPM TIS I2C spec describes in the table in section "Interface Locality
> Usage per Register" that the TPM_INT_ENABLE and TPM_INT_STATUS registers
> must be writable for any locality even if the locality is not the active
> locality. Therefore, remove the checks whether the writing locality is the
> active locality for these registers.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>

