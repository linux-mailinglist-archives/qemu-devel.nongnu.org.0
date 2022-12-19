Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B4650E8D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:23:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Hxy-0007DD-0j; Mon, 19 Dec 2022 10:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7Hxu-0007CW-O1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:22:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7Hxp-0002WS-Kj
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:22:06 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJFBZg3005722
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=Bf+WRwD5dlZCzafvZuaiaSm3hxHYLMIS2rzlIvrwCHg=;
 b=b1I8sTEdivYN7Jc8Q53lUzmIEsGHQgoAOcGkU1ib7ofXtBDnjYgZr7f9sv51RD48/Sj/
 lMJjMIIrL8isCNkHChR6mvBIRBqCHi89hChHZgHz0GaekFz4vxbsYGFfrRhSPOlvfA3b
 Vud0FI8nGDSA0nf03z0BHRc6vp0BMa5YDpe4np3yINNOpLTULo80jjK4E85djAclvXr5
 iGqIkT51kl24Rg14/lbNgH3lAIhOspevub/TKNgY/dZQEtXgRl21qY6z8ScVO/Z6+1Fz
 xM9kSFvRCZjxSJwO58fKFUpGuodWxgteBAmf/rWDJMQWr005sWJyjjn3mFSVdpXWE9kh Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjtcn8etv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:21:50 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJFDG6J024037
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:21:50 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjtcn8etg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 15:21:50 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJEwmet032663;
 Mon, 19 Dec 2022 15:21:49 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3mh6yyhp5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 15:21:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJFLlqv15925566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 15:21:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AAF97805E;
 Mon, 19 Dec 2022 16:43:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B796E7805C;
 Mon, 19 Dec 2022 16:43:35 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.33.74])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 16:43:35 +0000 (GMT)
Message-ID: <9798dca3264b0df2af7cd40d845d9f932af5f5db.camel@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] tpm: add mssim backend
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Mon, 19 Dec 2022 10:21:45 -0500
In-Reply-To: <bf7aa576-b4b0-5054-915e-7933bf1abac8@linux.ibm.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
 <bf7aa576-b4b0-5054-915e-7933bf1abac8@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pgl4uBcxi7yXGUN_XQNYC7RINgLPd9fz
X-Proofpoint-ORIG-GUID: yfARj2fH61PXm60jAK3u2kvuQvrXYOIS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=838 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190134
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2022-12-19 at 10:16 -0500, Stefan Berger wrote:
> 
> 
> On 12/19/22 08:13, James Bottomley wrote:
> > From: James Bottomley <James.Bottomley@HansenPartnership.com>
> > 
> > The requested feedback was to convert the tpmdev handler to being
> > json
> > based, which requires rethreading all the backends.  The good news
> > is
> > this reduced quite a bit of code (especially as I converted it to
> > error_fatal handling as well, which removes the return status
> > threading).  The bad news is I can't test any of the conversions.
> > swtpm still isn't building on opensuse and, apparently, passthrough
> > doesn't like my native TPM because it doesn't allow cancellation.
> 
> For passthrough you can use /dev/null in place of the cancel file.
> Libvirt does that also:
> 
> https://github.com/stefanberger/libvirt-tpm/blob/master/src/util/virtpm.c#L88

OK, so passthrough works with the visitor conversion.  If /dev/null is
the default for no cancel path, the backend shouldn't really beat the
end user up about not specifying it if it can't find the cancel path
for the chosen host TPM.

James


