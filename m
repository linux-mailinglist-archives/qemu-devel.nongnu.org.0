Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6903650BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:42:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7FPN-0007kE-Qo; Mon, 19 Dec 2022 07:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7FPK-0007gS-HM
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:38:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7FPI-0001Jp-42
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:38:14 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJCKfdP000980
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 12:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/rApdOR+1G/tZvBiAHAN/w0H5JCD8L3COFpHUCCfAuc=;
 b=XzxH2XObpmcqcCN1wfF3EJ2QEe2k6wpnI4evOXExTUv58PVt4QaPMZ40OMHcSvv5WUjc
 sCwhDyxrdCXlA2dkcOnwGd6rS7T9nej/JhsrVzNOpkvWQ7k8fg6OU9BkWjrvSO6ZNNYL
 YZSjcjrYrcskSC30PBSllpHF1Ag13zn8vhbMPUpa3h7vmukrXYin142Vtx35iEeDd/Zx
 yLiQRNC9EnxUD7EE2yzjj5xKCiyZbxRDLI8PiIaZEZaHnljTc5uESW/VVkN5Q+XAgNXa
 rylpNDk0uvAQPR47KIh6HdvedC68vwrj/5xHWoIfzlRz0LIJP1yun2fBiq2UyN2IWxEJ YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjqvmgc65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 12:38:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJCaxbv015625
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 12:38:09 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjqvmgc4q-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 12:38:09 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ9BQ1X007421;
 Mon, 19 Dec 2022 11:49:39 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mh6yxd2tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 11:49:39 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJBncx349283366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 11:49:38 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE58958054;
 Mon, 19 Dec 2022 11:49:38 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2542F5805F;
 Mon, 19 Dec 2022 11:49:38 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 11:49:38 +0000 (GMT)
Message-ID: <9b808690-2f7a-cbd8-497a-fca63c7fc91d@linux.ibm.com>
Date: Mon, 19 Dec 2022 06:49:37 -0500
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NmAVsK68PfPUIzAI0cJKMGi3yZtRqQhF
X-Proofpoint-ORIG-GUID: E7wOu3TQfZnF5aXbz8CAqMJFPyvHi9iD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190110
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

> 
> I could do a blog post, but I really don't think you want this in
> official documentation because that creates support expectations.

We get support expectations if we don't mention it as not being supported. So, since this driver is not supported the documentation for QEMU should state something along the lines of 'this driver is for experimental or testing purposes and is otherwise unsupported.' That's fair to the user and maintainer. Nevertheless, if the documentation (or as a matter of fact the code) was to claim that VM / TPM state migration scenarios, such as VM snapshotting, are working then users should be able to ask someone 'how' this can be done with the mssim protocol **today**. Since I cannot answer that question you may need to find a way for how to address this concern.

Regards,
    Stefan

