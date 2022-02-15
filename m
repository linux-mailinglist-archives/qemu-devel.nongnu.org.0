Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2BC4B63CA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 07:57:08 +0100 (CET)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJrlr-0005ns-5D
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 01:57:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nJrhc-0004pm-Iz
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 01:52:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nJrhZ-0000vn-Tc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 01:52:43 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21F5ux9U006472; 
 Tue, 15 Feb 2022 06:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Q/rc1yaNUqyBdUu4Cc2XhkjTZlUd0knbeAbaTJFbfrw=;
 b=K4KqENeLPc9QrrIvTqVF6gL8qCMXDeS8FL7+ya3baeKE66xMwN5ofFHwhgW5O3GN4LEd
 z++gB4k012Kpy1xr1oj8E09V9QrnecvExVOyx9s1/is8jw8eAhpHKlXeRahgul58ixD9
 ptedDs4ysV5YYVb09X9E2pSRoOhVN07QkaNToPGxgydEUiNJQesSoN6s8nP+Nb7K5DDD
 zgoSTcjDF9uEchYA+/1KhT0DeZcFNONSXrQfQvZIMUMo+b/zFq/AFAU4D3Cvon5/U9Fn
 l/HpW9WrhSMrYcXoJ1MaFuC5RVMEUsclPzPS2WmW7V/i8TxYHMUWETac/oOUNIi87IhT Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e85efae6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:52:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21F6S0Bn003202;
 Tue, 15 Feb 2022 06:52:37 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e85efae62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:52:37 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21F6q6YJ019774;
 Tue, 15 Feb 2022 06:52:36 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3e64hahf21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 06:52:36 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21F6qZbs41877968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 06:52:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCF0A124058;
 Tue, 15 Feb 2022 06:52:35 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A444124055;
 Tue, 15 Feb 2022 06:52:27 +0000 (GMT)
Received: from [9.160.23.162] (unknown [9.160.23.162])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 06:52:26 +0000 (GMT)
Message-ID: <96450f57-c01e-55a9-2700-8e4e8e36b14b@linux.ibm.com>
Date: Tue, 15 Feb 2022 08:52:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20211220104224.143961-1-dovmurik@linux.ibm.com>
 <YdSLJG3GRSf88G11@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YdSLJG3GRSf88G11@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Q_Pc8u_yKmQVFoi8oPAHQQQGtnY71Io
X-Proofpoint-ORIG-GUID: 5wLksiVtQlBRKyfDxAK_e7cfIJSJ7cnE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_02,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150037
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/01/2022 20:00, Daniel P. Berrangé wrote:
> On Mon, Dec 20, 2021 at 10:42:24AM +0000, Dov Murik wrote:
>> Add a section explaining how the Guest Owner should calculate the
>> expected guest launch measurement for SEV and SEV-ES.
>>
>> Also update the name and link to the SEV API Spec document.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>>
>> ---
>>
>> v2:
>> - Explain that firmware must be built without NVRAM store.
>> ---
>>  docs/amd-memory-encryption.txt | 52 +++++++++++++++++++++++++++++++---
>>  1 file changed, 48 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 

Paolo,

Can you please add this to your queue?

Original patch v2:
https://lore.kernel.org/qemu-devel/20211220104224.143961-1-dovmurik@linux.ibm.com/

Thanks,
Dov

