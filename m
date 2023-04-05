Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0AC6D7F59
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:25:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk44y-0000DS-8N; Wed, 05 Apr 2023 10:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_acaggian@quicinc.com>)
 id 1pk44v-0000Ck-Ek
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:25:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_acaggian@quicinc.com>)
 id 1pk44t-0008Ud-ON
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:25:37 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 335CQCIQ002777; Wed, 5 Apr 2023 14:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oDR34/a9ORNUcYybJAo04Xp1+Bb/UnsFlNhvkWuf6BU=;
 b=co4r8djNywSP1KLy43yFtiUqUaMuxncOMHR/vCa5+00ad+XWEjcvCA7aAF9PtE1VXPzQ
 p/MM0d7fvYpTETdhI+Ut+OFQMVkjRQr3nublBnu5b5+82Pa7v+JTa9pUa/EAa2su2a5H
 Fc4K5jvH/p0VNkE/kSi5A4Dvh8wyiEMn3KyMokaRNndrqX2euGI0aHvOIICpbkACTTVf
 7AuSTbuHHhbOUU4GviqyUfF7ZGI6fQeHIS74yzMrc16VbzMg86FUoRWrlRcaAGt6WiKN
 LUokT91/EGfEbpPzkLCgNTQNzv9obgGvYYVycK9sRctWiewoT05ZIUa+x9X0xiffh8A7 Mw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ps8h08aka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 14:25:32 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335EPVKI002246
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 14:25:31 GMT
Received: from [10.111.143.157] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 5 Apr 2023
 07:25:30 -0700
Message-ID: <f72d5432-9300-dfcb-d6b5-0902d67601c6@quicinc.com>
Date: Wed, 5 Apr 2023 16:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 1/1] memory: Address space map listener
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230405125756.63290-1-quic_acaggian@quicinc.com>
 <20230405125756.63290-2-quic_acaggian@quicinc.com>
 <81993f24-41fd-d52d-baa0-0328d414cf20@redhat.com>
From: Antonio Caggiano <quic_acaggian@quicinc.com>
In-Reply-To: <81993f24-41fd-d52d-baa0-0328d414cf20@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mu9o1H3X6-VnYGZh_ust0jFeja15eLoB
X-Proofpoint-ORIG-GUID: mu9o1H3X6-VnYGZh_ust0jFeja15eLoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_09,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=538 phishscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050131
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_acaggian@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Hi David,

On 05/04/23 15:23, David Hildenbrand wrote:
> On 05.04.23 14:57, Antonio Caggiano wrote:
>> Introduce a MemoryListener callback for address space map events.
>>
> 
> Why?
> 

Please, have a look at the cover letter "[PATCH RFC 0/1] MemoryListener 
address_space_map callback" with a detail explanation of the issue and 
the reason behind this. While I think it solves the issue for my use 
case, it might not be the best or even the right solution for it.

Cheers,
Antonio

