Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56F358358
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:33:52 +0200 (CEST)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUTr5-0004aS-1y
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUTpn-000401-3Z; Thu, 08 Apr 2021 08:32:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lUTpd-00075k-Us; Thu, 08 Apr 2021 08:32:30 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138C2sHl038961; Thu, 8 Apr 2021 08:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=o9grGSYv6YAO73mOG6gMt3MPRZ7xGRcvvDsjXhp8GzQ=;
 b=jIzpJ7We1avjYaL3YeGrOCOpAel7EOkEanB72wCQ/ar0OkGp7gDoSg6ELkhWbQszsZ9d
 Ss3TYpBo0nomJl0d1rCevrwq9j/xoQAF9Js3mUTcO/aW0UkXJRdJwMY2hc5YhaIgook6
 jP/YHQTvl1UuVvLzYfZt51NOU2bGjIfg7gGfv/nE723hatjAuilcMJY1Ojl1gdBhc2v1
 OirgvkP9WRKgki0Mv4HAAZ2T3hrIprZR2LEB3LsJgQc6jjdtJmwVGnx/hy81u76i/pEk
 c+aV4sxOvtsZ/16Snewl5Bn0DPJswHhGKYRLThVSOTP622Z5NBDaL8L1w9OIYv6Tq3EG gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xtdm89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 08:32:17 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 138C2r7j038867;
 Thu, 8 Apr 2021 08:32:17 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xtdm7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 08:32:17 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138CDHZD025731;
 Thu, 8 Apr 2021 12:32:15 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 37rvbsguq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 12:32:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138CWCdh58851758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 12:32:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 572EB52057;
 Thu,  8 Apr 2021 12:32:12 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.156.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DA36652052;
 Thu,  8 Apr 2021 12:32:11 +0000 (GMT)
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210407194711.459176c3.pasic@linux.ibm.com>
 <20210408110232.2bf02df4.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <6fe2743d-c800-d743-fe01-ea10bed90e9a@linux.ibm.com>
Date: Thu, 8 Apr 2021 14:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408110232.2bf02df4.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XrBMa_XVqZqSqGZC8lF4kDwlB7ZLZWkM
X-Proofpoint-ORIG-GUID: D0gduyl73khot_Vm_Fdet9ueM4ybmgFB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, mst@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/8/21 11:02 AM, Cornelia Huck wrote:
> On Wed, 7 Apr 2021 19:47:11 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> So this begs the question, do we need this fixed for old releases as well?
>>
>> My answer is yes we do. Conny what do you think?
> 
> What do you mean with "old releases"? The dstream rework was in 2.11,
> and I doubt that anyone is using anything older, or a downstream
> release that is based on pre-2.11.
> 
> If you mean "include in stable", then yes, we can do that; if we want
> the commit in 6.0, I need the final version soon.
> 
> 

OK, are you OK with the two change propositions I sent?

1) let the 3270 decide for internal errors (-EIO) but return the error 
for CSS errors in handle_payload_3270_write()

2) for senseid, always ask CSS to update the residual count
but only erase the senseid if the write succeeded


-- 
Pierre Morel
IBM Lab Boeblingen

