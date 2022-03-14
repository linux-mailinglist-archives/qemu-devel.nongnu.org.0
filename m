Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D785C4D7DA0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 09:34:35 +0100 (CET)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTg9y-0000u1-Ad
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 04:34:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1nTg6Y-0008BX-3V; Mon, 14 Mar 2022 04:31:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1nTg6W-00079y-1Y; Mon, 14 Mar 2022 04:31:01 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22E5IsCu002945; 
 Mon, 14 Mar 2022 08:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OFf240hc9LhWg5KuFCmZ70yva6Mpa/oCgSrApJrI7Ok=;
 b=pkLsMSKPxTc51HlO2HHJkVqpKydU6HxqLy7aKm6D7fBQGeWFlv+Sr5t25AXJSbimZ/R0
 lvr/xgMnON+bBEQqMldsbt4PhC56wW6XfuBRSTuzk027jB4rfRKhRHcSr/Ye5CDr7D5C
 BEgZQsfdPg/xJW+1cD3cUDfmefdNv/jWRazkr8HZJi9aLGwD5oB+EVtFgGgTpoFDxeo5
 BvOPhemV75FsMPy4E5pgNgRtxBotyBcBS9uViCVa37DTJPIc5yKmeruxWoUdSG8pQeIl
 GjZ87owBqnku/VJT2RRfK+71rZWtUDIkelLbWbfNfUpAtKNyxXg7Zr+dzIYHIyKWMg+v sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3es50w5mff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 08:30:55 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22E8SHoQ009132;
 Mon, 14 Mar 2022 08:30:54 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3es50w5met-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 08:30:54 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22E8R9n4023488;
 Mon, 14 Mar 2022 08:30:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3erjshkp4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 08:30:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22E8UobY25362916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 08:30:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 259DF11C050;
 Mon, 14 Mar 2022 08:30:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B22A811C05C;
 Mon, 14 Mar 2022 08:30:49 +0000 (GMT)
Received: from [9.171.33.132] (unknown [9.171.33.132])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 08:30:49 +0000 (GMT)
Message-ID: <a97d0416-111a-4b03-c787-b51facea4a3c@de.ibm.com>
Date: Mon, 14 Mar 2022 09:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-4-iii@linux.ibm.com>
 <46cd7fbe-c96e-71b5-a648-da0fce0d2f8d@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <46cd7fbe-c96e-71b5-a648-da0fce0d2f8d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iqMWa1BOOz9_yWupMO7gXK39bTNofycL
X-Proofpoint-GUID: 6LLPzLAMVfQcVDV4Lty4n_OPnri5jHmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_02,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=747
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203140054
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 11.03.22 um 21:32 schrieb Richard Henderson:
> On 3/11/22 10:49, Ilya Leoshkevich wrote:
>> +    size_t length = 0x100000006;
>> +    unsigned char *buf;
>> +    int i;
>> +
>> +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
>> +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>> +    assert(buf != MAP_FAILED);
> 
> I'm thinking exit success here, as such a large allocation may well fail depending on the host.

What about using MAP_NORESERVE ?



