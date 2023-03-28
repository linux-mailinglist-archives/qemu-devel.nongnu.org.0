Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B66CC144
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:43:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9ap-0005bk-7y; Tue, 28 Mar 2023 09:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph9am-0005bb-Fm
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:42:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph9ak-0007ij-3m
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:42:27 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SChX01016364; Tue, 28 Mar 2023 13:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TojTMUD+GkPosespZ0CR6QRFgt8ZvGQEF01Pyh1dg1E=;
 b=WKwITE0tEneAe0G/AoRjF+NKyJ5E3e0OeT4JXAc2lQVbk4W1o5HtQyT9aa78dTBXUPA7
 MpJc5MVk0YV7CDEs5MuEG57V+T5wY7/Itd0GVUrdsskqMvOk+dsCRxiKC6oR/5LOL3dm
 ZAiOXFCZX/VrAnv3pDJn0KsSvz2z4x3cKh1SS/1NpfRfiwLdRrA34VUNV42HdZAgmaUr
 6yTB0rvJx1jEo6zhGjPvU/GmKguC2onEBk60UMQQ+Y8nVq50Uz1fGuZDhkFIBs9nE52a
 gYdsktp6Qc9d+1dUCc8rF7yyYcJy8or0GvWDV1i8E9LYvs0aWbKLhSd6GB7x0HvUvYdm Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm0g9htr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:42:19 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SCigAT021232;
 Tue, 28 Mar 2023 13:42:17 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm0g9htk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:42:16 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SDEgO3032017;
 Tue, 28 Mar 2023 13:42:05 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3phrk78wwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 13:42:05 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SDg4dx29033062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 13:42:04 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EEAC5805A;
 Tue, 28 Mar 2023 13:42:04 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2CDD58054;
 Tue, 28 Mar 2023 13:42:03 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 13:42:03 +0000 (GMT)
Message-ID: <1959f97f-73ea-1b1f-b05a-4d2a41692e6c@linux.ibm.com>
Date: Tue, 28 Mar 2023 09:42:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/avocado/aspeed: Add TPM TIS I2C test
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, ninad@linux.ibm.com
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
References: <20230328120844.190914-1-joel@jms.id.au>
 <1c6543c5-e924-b0f3-4f4e-5654a8aa9d29@kaod.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <1c6543c5-e924-b0f3-4f4e-5654a8aa9d29@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: thUfbmo_-Rv51bqb7duJ92qfOe2UrHdb
X-Proofpoint-ORIG-GUID: csYXrt0s18oyHjY1SWG-TqjvZ_dQ9xAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=841 bulkscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280107
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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



On 3/28/23 09:21, Cédric Le Goater wrote:
> On 3/28/23 14:08, Joel Stanley wrote:
>> Add a new buildroot image based test that attaches a TPM emulator to the
>> I2C bus and checks for a known PCR0 value for the image that was booted.
>>
>> Note that this does not tear down swtpm process when qemu execution fails.
>> The swtpm process will exit when qemu exits if a connection has been
>> made, but if the test errors before connection then the swtpm process
>> will still be around.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> 
> Stefan,
> 
> Could you please take this patch through the TPM queue with the other
> TPM TIS I2C patches ?

Yes.

    Stefan

