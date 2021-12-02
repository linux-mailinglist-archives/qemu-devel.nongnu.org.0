Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FE466755
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 16:57:14 +0100 (CET)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msoSO-0002jV-P1
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 10:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1msoPg-0000wD-KO; Thu, 02 Dec 2021 10:54:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47406
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1msoPe-0008BW-QT; Thu, 02 Dec 2021 10:54:24 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2FrhsI025009; 
 Thu, 2 Dec 2021 15:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iEWWZZZ2KjGnWlrU4KZaxEYJaQLhzTpTHnRu3eytbC0=;
 b=YN8t5VjLSmP94du5UsSZunc0b6lzoJJt7f2gU7uQ+OmQZHi4VJnMP3Vj8HzFiC/erb8H
 4/HTgtkMTN52yMd4fxMd95gKfhq4RwFHg9IKCvz8sQ382byBPLqw7oEp6qJ8WqQV957a
 klwKe2/C70GFKBPd+2A6B8m3IOkKMZzMtb2VWBDNBzNABFTD4fHOE+LgYWRFzK6jYfOa
 SWa9knSwpvpiTBba2wfLY+zTt0WL8iYK0hdOeCX9qPZtZJmlPQXKVahsGCzBDIePr0rI
 XZYXLbGuW/9uMcAK3KazAloonXn17BcCmo1NoHEM73C/oeDa/7JPHmPKmq2pDnZIgeo0 Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq16h8095-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 15:54:21 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2FsK54025988;
 Thu, 2 Dec 2021 15:54:20 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq16h808w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 15:54:20 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2FrOjM001602;
 Thu, 2 Dec 2021 15:54:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3cnne37wy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 15:54:19 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2FsICt57671980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 15:54:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64A46C605A;
 Thu,  2 Dec 2021 15:54:18 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6770C6059;
 Thu,  2 Dec 2021 15:54:17 +0000 (GMT)
Received: from [9.65.67.243] (unknown [9.65.67.243])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 15:54:17 +0000 (GMT)
Message-ID: <a3379233-8787-5ac1-3750-b4566eb6b169@linux.ibm.com>
Date: Thu, 2 Dec 2021 10:54:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] s390: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20211117152303.627969-1-walling@linux.ibm.com>
 <6befad1c-af14-8fe6-e3a6-a022b053f1c1@linux.ibm.com>
 <776ef06a-525a-6aaa-fe7c-b99c91c6b7fe@redhat.com>
From: Collin Walling <walling@linux.ibm.com>
In-Reply-To: <776ef06a-525a-6aaa-fe7c-b99c91c6b7fe@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: llNB1orVNQE9lfgBuhhESFcdHHBR3jSw
X-Proofpoint-GUID: 6psPtclZogmNUw-fS-YqhbJLIUXk5vL7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_09,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=956 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020102
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: borntraeger@de.ibm.com, cohuck@redhat.com, frankja@linux.ibm.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 04:23, Thomas Huth wrote:
> On 01/12/2021 19.45, Collin Walling wrote:
>> Polite ping. I may have missed if this patch was picked already. Thanks!
> 
> I've already queued it to my s390x-next branch:
> 
>  https://gitlab.com/thuth/qemu/-/commits/s390x-next/
> 
> It just came in very late for 6.2, and it didn't seem too critical to
> me, so I didn't sent a separate pull request for this one. Thus it will
> get merged once the hard freeze period of QEMU is over.
> 
>  Thomas
> 

Apologies, I missed this. My mail filters are sometimes messed up and I
didn't see this thread. All is good :)

-- 
Regards,
Collin

Stay safe and stay healthy

