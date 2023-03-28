Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791E6CC903
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:19:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCxs-0005Xd-3U; Tue, 28 Mar 2023 13:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1phCxk-0005X5-I1
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:18:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1phCxg-0005Nx-Rq
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:18:24 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SHHavX005244; Tue, 28 Mar 2023 17:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=735XA1ZAb3Zp2U/qjX7lJR3H6OsX7t1qg0TAa2FB2Dk=;
 b=MHjmgFP+xMUbR/9cm6s1Rg9YQj1iEemo/XvHg8Zl2hys7WVJV7x+65dbHaCJz/U3CW5J
 Zme5Tcsq3Tz2UhgPbs64lz20lZDkw7ovBbj2zVjq8hvvTMfthgqIE+RTyhwTucOUL9ug
 /eGjLOYJZ9Tigox8lCru8E8QMYrQWlG01lpY3+XRo15uqoJbeA3mhusFLPLBj6LNEogx
 e3NhsmzWiBpHhwaTMOnNoYnJ3+j/emGu3+AQHupN1sj8j2c44RnWIBpj3UQRSnoWLpNj
 6j4YjfmJp5qzxSeZZhNjWbOYNoOlnhnaSInkebRZKWfrRUJgMmRpIfXAeO2ooL70uaYR 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm4gur08k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:17:55 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SHHtsB006436;
 Tue, 28 Mar 2023 17:17:55 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm4gur086-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:17:55 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SG1AlN005806;
 Tue, 28 Mar 2023 17:17:54 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk71wmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:17:54 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SHHrMx46400072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 17:17:53 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CB5358067;
 Tue, 28 Mar 2023 17:17:53 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7A5E5806F;
 Tue, 28 Mar 2023 17:17:52 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 17:17:52 +0000 (GMT)
Message-ID: <ae7bb551-b2c3-0215-d337-44c8402c7ec7@linux.ibm.com>
Date: Tue, 28 Mar 2023 13:17:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] qtest: Add functions for accessing devices on
 Aspeed I2C controller
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au
References: <20230328135121.3661711-1-stefanb@linux.ibm.com>
 <20230328135121.3661711-2-stefanb@linux.ibm.com>
 <601fa241-1b5e-067c-f7b5-7cdd4feaa13f@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <601fa241-1b5e-067c-f7b5-7cdd4feaa13f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BP22eVGh6CQKGTyONG5xhjA8ZdaWqXcJ
X-Proofpoint-GUID: yo5eWibGGrJ6RSdb_vamd6zrIthwGn5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 mlxlogscore=855
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280133
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



On 3/28/23 11:05, Thomas Huth wrote:
> On 28/03/2023 15.51, Stefan Berger wrote:

>> +
>> +void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
>> +                       uint8_t reg, uint8_t v)
>> +{
>> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
>> +}
> 
> For helper functions like this, I'd recommend to not use libqtest-single.h and rather pass in a QTestState* as parameter to use qtest_writel() and qtest_readl() instead. That will make the code future-proof in case someone wants to use these function for migration-related tests later.

Done.

> 
>   Thomas
> 

