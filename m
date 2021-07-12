Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA33C657A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:31:58 +0200 (CEST)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33Wu-00005R-MH
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m33Uq-0007d3-H1; Mon, 12 Jul 2021 17:29:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26036
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m33Uo-0005Ov-KV; Mon, 12 Jul 2021 17:29:48 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CL4POI127386; Mon, 12 Jul 2021 17:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QCXCbrSWm5NxP0UpGojCet75JV4M3SKtDwHUcWv9abY=;
 b=MQZlS+1Y0wEODnocCZL5g3o5gi32CN1AVqV/ey1d8UQnXvx6GYAYLeodoOIHJVGuqbbx
 vFDxgyR7Yvw5UiKgSKKGJ1lGmMUmxCUcNzlxDea6Cxm6yTAe3a9r47KANP0fLkqbCGRD
 cQQv5uG3rtERUpzE6QBa6N1DlumB586fbjtpSR4ACEgMNEamKjOuLVurRCr5xuY5tQps
 Q8a2GgAoZ5r1TWvn8Fgm2PQazLhBQQF8t7EsmmjUObHE7D9h00Lj8Fbnl7yist+i+hqt
 MLT8Ee4g+InJErDOIM7kX400129/dFjv6FxtRm+MC3bXBbHFF0KkoHq2MTC7XCREoOSG WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qrmdmj95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 17:29:43 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CLKaoZ190130;
 Mon, 12 Jul 2021 17:29:43 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qrmdmj8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 17:29:43 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CLReCi007699;
 Mon, 12 Jul 2021 21:29:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 39q36arjkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 21:29:42 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CLTe4w16449906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 21:29:40 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF2E26E05D;
 Mon, 12 Jul 2021 21:29:40 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12F216E050;
 Mon, 12 Jul 2021 21:29:39 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 21:29:39 +0000 (GMT)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 12 Jul 2021 17:29:39 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Organization: IBM
In-Reply-To: <8f4dddf0-51ae-4bcf-1a33-a8fdd6cc7054@vivier.eu>
References: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
 <8f4dddf0-51ae-4bcf-1a33-a8fdd6cc7054@vivier.eu>
Message-ID: <164fbc7d882876098a9d8f0899fce1d3@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FXvYpO_QiU7VYMVFIQnL-HnrIPBbFQds
X-Proofpoint-GUID: brJ_ZocB80LJinlLZeJ1Uq7s_uzZPYXo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_11:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120146
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-07-12 4:02 pm, Laurent Vivier wrote:
> Le 09/07/2021 à 18:04, Jonathan Albrecht a écrit :
>> qemu-s390x signals with SIGILL on compare-and-trap instructions. This
>> breaks OpenJDK which expects SIGFPE in its implementation of implicit
>> exceptions.
>> 
>> This patch depends on [PATCH v6 0/2] target/s390x: Fix SIGILL and 
>> SIGFPE
>> psw.addr reporting
>> https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/
>> 
>> Based-on: 20210705210434.45824-1-iii@linux.ibm.com
>> 
>> 
> 
> Series applied to my linux-user-for-6.1 branch.
> 

Thanks Laurent, I see this series has been applied to 
https://github.com/vivier/qemu/commits/linux-user-for-6.1 but the 
following series that this is based on also needs to be applied:

https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/

Did some local testing and looks like missing that series caused 
https://app.travis-ci.com/github/vivier/qemu/jobs/523853464 to fail.

Oh, just saw Ilya's email that the test patch has not been reviewed. 
Hopefully that can happen so they can both make it in.

Thanks,

Jon

