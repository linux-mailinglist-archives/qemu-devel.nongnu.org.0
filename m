Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB093484BB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:41:40 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCBy-0002yI-Ps
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPC9t-0001Zl-4m; Wed, 24 Mar 2021 18:39:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10278
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPC9n-0002gq-Cj; Wed, 24 Mar 2021 18:39:23 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OMYNeZ014420; Wed, 24 Mar 2021 18:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=vtKqDNfB+rVRnRoeNHUUIQembx0tbE3nWK2bRIKHNGk=;
 b=JLuuTyFkn2l1saFEEEMgjlGUc8gIej1yCFiL5gAnc5T85pM3KCYC2zJUUtvnLRphmVaH
 Xj2zK4punFkyOui0QnNIWl9cnWic9BbMB3klEuSfM6boBg4Kjzq8UrmEfPsGMUeKeK1e
 mQHlgoQiJfWSCs2D24qTLSUbZTu85z/+reQEKnOcGVg/UAViRSUEMdBg9Lji/kLX05JD
 kSS9FViTbrEzp8gvAlBcmGL5LO3w5rM60FhflkDW74eC7ZkO6sKiR0Yp6NQBhr5s7zxh
 nzoIIyq7USOGEXlkzAW7/hjP/MZ7gCngR6gGKCKIklSD34xozLloLRJw2kPejkqW/cUd 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37g8m0h87h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:07 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12OMYe0E014840;
 Wed, 24 Mar 2021 18:39:07 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37g8m0h877-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:07 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OMbbln030609;
 Wed, 24 Mar 2021 22:39:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 37d9aksche-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 22:39:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OMd5AR26018270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 22:39:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AD3DC6059;
 Wed, 24 Mar 2021 22:39:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1921FC605F;
 Wed, 24 Mar 2021 22:39:03 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.133.239])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 22:39:02 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/3] aspeed: HACE hash Scatter-Gather support 
Date: Wed, 24 Mar 2021 19:38:43 -0300
Message-Id: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=711 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240161
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for scatter-gather sha256 and sha512 operations
on Aspeed's HACE (Hash And Crypto Engine) to the Aspeed model. These
operations are supported on AST2600 series of machines.

 -Klaus



