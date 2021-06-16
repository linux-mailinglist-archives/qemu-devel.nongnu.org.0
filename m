Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FD3A9E16
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:50:30 +0200 (CEST)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWs9-0002e6-AI
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ltWqG-00089X-Aw
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:48:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25066
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ltWqE-00005K-5D
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:48:31 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GEXwDQ102509; Wed, 16 Jun 2021 10:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CAbvqRdp89Y7jE9OKXaq1uKMkcHFitnOeJYRIM+wydA=;
 b=BaNx0EayLfK2RhLCoXb9B2vAR7rkboLK53gqMaL9GnL6c7kgdUESr6GarRr9HAtZG3ST
 ctQkG+ys280UFjVuIBG+zjjg4V8tiyPK+v21IeDam1ptoHP8YF+lhX1nMUccbhPLN32K
 lmdweQTiqLgssz8307gUrOXEkjOZpxdEEnDc9KOl6cwedfr3JW6RjAUSQIaKyxMvkx7M
 d7P0KFIlIPfVpxm4aWy1t+gYSmQJ+5yR9hTC2tZc9m1nyCAoDAnIQ0BV4aET4Nzqehna
 MTNVFf5Omes4NvgMUKl3sg6QdE2d6o09nBKD7uZFZtvYfQpN2filrct948LJ9AWctdj6 FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 397jgdtghg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 10:48:27 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GEYwbg109779;
 Wed, 16 Jun 2021 10:48:26 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 397jgdtghc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 10:48:26 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GElMk2012572;
 Wed, 16 Jun 2021 14:48:26 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 3954gkchms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 14:48:26 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15GEmPmY23331322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 14:48:25 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DBA22805A;
 Wed, 16 Jun 2021 14:48:25 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 802992805E;
 Wed, 16 Jun 2021 14:48:25 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 14:48:25 +0000 (GMT)
Subject: Re: [PULL v1 0/5] Merge tpm 2021/06/15 v1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
 <84e73f5d-df78-fa4b-4469-09f859ffe4bf@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <0af69f79-18ec-d65a-b949-5331fc3793b2@linux.ibm.com>
Date: Wed, 16 Jun 2021 10:48:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <84e73f5d-df78-fa4b-4469-09f859ffe4bf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QOb2CPVdv2HWUvl7mMybItKdVmEhdKE3
X-Proofpoint-ORIG-GUID: GdjZ3iM4N4ggOeVZx-m7zzFE1UbLf-cr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/16/21 10:38 AM, Philippe Mathieu-Daudé wrote:
> On 6/15/21 5:21 PM, Stefan Berger wrote:
>> Hello!
>>
>> The patches in this PR eliminate all TPM related code if CONFIG_TPM is
>> not set, thus reducing code size.
>>
>> Regards,
>>     Stefan
> Thank you Stefan for this quick pull request :)

Yes, thanks for your repost, which made things easier :-)

   Stefan

>
> Phil.
>

