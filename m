Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7241D771
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 12:15:42 +0200 (CEST)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVt6L-0004VL-KJ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 06:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVt46-00036n-AE
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:13:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVt44-0008Tu-1T
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:13:22 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U91KSX014794; 
 Thu, 30 Sep 2021 06:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oPhe8pw/HmiSbQrcJjAXEJ579aeAoRNDMLPsgKbbmNI=;
 b=L5Xd4S3jWB+csqHfQuncw5c2Aq/HLo9oIQJEoibnzZhjFDQS+awHQo2Z3HZ2T95Xza1n
 iVxFlXOjv0Qyesrar/vkB0FIn+Q0PMCRLQKGxZx88fOoz64Hc5pEdJ6Bq0HqfoZgjPiX
 +sE8Tx5WmfFEBTzxz2sZRs25MQuxncGklw/SoBMrTT9tg2q/REFbxzEKBPGw+qRy3pbp
 Zu2HpHkS3ReY+xLEVmbpplIyAS5stmp+W+Px8Bl9pH0ub/QBTm9qDzppaTHxxIrQS9P3
 lzAAWVO+6/bBixns05l+AwRY43qiuHjoMMD5dOjMDlQB0zZfh3vM/0bt2n2yuBBa80c0 WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bda80hmqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 06:13:14 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18U91KTc014804;
 Thu, 30 Sep 2021 06:13:14 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bda80hmqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 06:13:14 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18UA7EHs023078;
 Thu, 30 Sep 2021 10:13:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3ba00ehj1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 10:13:12 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18UADBvS17432854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 10:13:11 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1790C6059;
 Thu, 30 Sep 2021 10:13:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8DCEC6057;
 Thu, 30 Sep 2021 10:13:06 +0000 (GMT)
Received: from [9.65.215.111] (unknown [9.65.215.111])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 10:13:06 +0000 (GMT)
Subject: Re: [PATCH v4 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <20210930054915.13252-2-dovmurik@linux.ibm.com> <YVV2GoXCv6BT4fgf@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <6d78a64c-4687-2435-09ae-3808d555e9d4@linux.ibm.com>
Date: Thu, 30 Sep 2021 13:13:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVV2GoXCv6BT4fgf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CdMT0CehSxjuqKlZct56BNF_SQiQe-0o
X-Proofpoint-ORIG-GUID: NH1FkNKtFlj7vZtH6onVRIpUJbtjy7md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109300063
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 30/09/2021 11:32, Daniel P. Berrangé wrote:
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 

Thanks!

-Dov

