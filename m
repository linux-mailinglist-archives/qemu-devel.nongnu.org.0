Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DA3FDD42
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:46:15 +0200 (CEST)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQZC-0000X3-RC
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mLQWK-00064T-12; Wed, 01 Sep 2021 09:43:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54852
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mLQWI-0001e6-An; Wed, 01 Sep 2021 09:43:15 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181DWw93183950; Wed, 1 Sep 2021 09:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IvStlSQiTy14GlVhJPGbWijK/sDx0kbrwFojz7cH+pE=;
 b=cnur7glN5mZGFFJxsPDbeGZpwjGXIwiM2znkujOElCOSiXAMVLsniXK7RFTkDPgetcct
 ivu/2k//9bO7z7DD+P5Rj1KEQYHcpH+JNKTA0tNySSKaJd+l9ufN728vc3SSDnH4IhNZ
 nxt1Jq6XKPMnluygKoeYPukoPuntcjVz/ZhdEdXOFiaHgMNCRA6LqVS0fcPnj57IzpZZ
 Yau1vw+OhEqLsCZxAG3pm0N3TvzxFfD2KRJd1UClUrmg3lHqKjX1kmzee97l+WlO+kzE
 +gsJs97UG6DVYo0sYRWSpfOY/f/WJBdvU0ekufkFTJ4/kln1SzSA4n9h+IOqdmZHM5qS aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at9522vjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 09:43:09 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181DX6r4184745;
 Wed, 1 Sep 2021 09:43:08 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at9522vj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 09:43:08 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181DbiA4017011;
 Wed, 1 Sep 2021 13:43:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3aqcscrk2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 13:43:08 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181Dh6OG15270332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 13:43:06 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EB7F136053;
 Wed,  1 Sep 2021 13:43:06 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93D1C136059;
 Wed,  1 Sep 2021 13:43:05 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com (unknown
 [9.163.9.54])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 13:43:05 +0000 (GMT)
Subject: Re: [PATCH] s390x: Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210901125800.611183-1-thuth@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <c45a3dd6-13ce-94af-38c7-7e0a0701ccb0@linux.ibm.com>
Date: Wed, 1 Sep 2021 09:43:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210901125800.611183-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2HHY-xvVzuqdE0CrG_p7OH4gzsFyzgLk
X-Proofpoint-ORIG-GUID: 4-NZ9dlt845RLbV0nKyZA39q3CxIPQbP
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010081
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.029,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 8:58 AM, Thomas Huth wrote:
> The PAGE_SIZE macro is causing trouble on Alpine Linux since it
> clashes with a macro from a system header there. We already have
> the TARGET_PAGE_SIZE, TARGET_PAGE_MASK and TARGET_PAGE_BITS macros
> in QEMU anyway, so let's simply replace the PAGE_SIZE, PAGE_MASK
> and PAGE_SHIFT macro with their TARGET_* counterparts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/572
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Code looks good, also took it for a quick sanity test with s390x kvm 
host against vfio-pci and virtio-pci, works as expected.  Thanks Thomas!

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

