Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B286493B71
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 14:50:54 +0100 (CET)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nABMT-0005TI-2Z
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 08:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nAAV4-0006Zk-Ah; Wed, 19 Jan 2022 07:55:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nAAUe-0000eV-8V; Wed, 19 Jan 2022 07:55:18 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JBT5fk006202; 
 Wed, 19 Jan 2022 12:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=N8YlwDDWY12lnu2XZ5Wmyo8R8WYPcZ3jdYFowkRG+N4=;
 b=B0KsifwlaqZl3WEXz0OLcsc70fuZuBeczC57wu0zYwP1aP6ox52pSrhESRjxzHQppLhH
 GUXqo1Kt/aPXIvom0epdOBr58lXoX6K9FOydsJ7m9s5jAc9m82HkXFp4d0Hf9vTTnGfv
 10zWy1I8vuo0F89X4JG+OAlz0SkgPm2bo0wBL4wVImPO2twyq+tKyABi9f9PMyLPqGVy
 B5uXUb8T/vfsdF5lDZgASwsv8VRbvXMxFtMNFDMArRLyqYlsUmJSNT4LIXzKgMCTFm4a
 MKhaKZ3BtXuKHY71fsDTcBOWJcEoxeXo4bi7JzfLzMm3PgAN48Ga21XAroiOfwmWTy87 rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dpht2hksn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 12:54:47 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20JCb1FU009752;
 Wed, 19 Jan 2022 12:54:46 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dpht2hksb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 12:54:46 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20JCr7kW018547;
 Wed, 19 Jan 2022 12:54:45 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3dknwafcvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 12:54:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20JCsi4L30147056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 12:54:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 033567805E;
 Wed, 19 Jan 2022 12:54:44 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49A8178064;
 Wed, 19 Jan 2022 12:54:43 +0000 (GMT)
Received: from localhost (unknown [9.211.99.176])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Jan 2022 12:54:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 13/14] target/ppc: 405: Program exception cleanup
In-Reply-To: <YeesfOoE9OYXBgUx@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-14-farosas@linux.ibm.com> <YeesfOoE9OYXBgUx@yekko>
Date: Wed, 19 Jan 2022 09:54:41 -0300
Message-ID: <87fspjx4vi.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sEIYnfrOCtc_qUyra_6RO4mRY3XpEvcb
X-Proofpoint-ORIG-GUID: HL8iNFCdaJhIQFITaTQVqozt_XQvS0s5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_07,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=923 lowpriorityscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201190072
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Tue, Jan 18, 2022 at 03:44:47PM -0300, Fabiano Rosas wrote:
>> The 405 Program Interrupt does not set SRR1 with any diagnostic bits,
>> just a clean copy of the MSR.
>> 
>> We're using the BookE Exception Syndrome Register which is different
>> from the 405.
>
> Hrm.  We really do want to set the 40x ESR bits here, though.

Well I wrote the code and nothing changed so I dropped it. Not sure if
we are even raising these properly in the translation code. I'll take
another look.

