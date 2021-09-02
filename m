Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81213FE83A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 06:01:59 +0200 (CEST)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdvK-0000Lb-0m
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 00:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mLdtK-0007on-IC; Wed, 01 Sep 2021 23:59:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58544
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mLdtI-0004ou-UD; Wed, 01 Sep 2021 23:59:54 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1823YH6j083252; Wed, 1 Sep 2021 23:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=P3x8qRg12EutrLbJnmhXDR9YbTBhEcsq2/2+9LHCKy4=;
 b=Jl+UxZgxrumksktD6ciAdwi8GT8ByVncaczUb0Fggn1i26Ojhchghi7D3Q7AmfFjXs4D
 1lKkG2MuDXhA4Cx3FXYnmwk+HDMuUHX9TBEuXxIVk5gne/2I/8o/9h4ZM1msvnI/mmoz
 RV6irE+tp0KmVMyXVzlOnyNksrvV/w1gCTPSqxS5CKP1GsxrUzSvfHrpyEhaK+HxzddC
 4WgXmq5Zd4DgWGbe5uXKHUCFsSyU4UuOkjFQgJEzAxJzRpVd7bQOm669bCwVqyAcCFbk
 8p9Jh+qBMMc3y99ifqV4Ktl2oXyBCUKk3CX2+2DBvh2idB+chALN6pNzUobeI/9hgLzn Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3atprjgdu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 23:59:49 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1823vHVr170803;
 Wed, 1 Sep 2021 23:59:49 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3atprjgdtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 23:59:49 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1823ulmI030150;
 Thu, 2 Sep 2021 03:59:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3atdxcca9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 03:59:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1823thd949414544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Sep 2021 03:55:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6355211C052;
 Thu,  2 Sep 2021 03:59:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC8D711C04C;
 Thu,  2 Sep 2021 03:59:43 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.76.20])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  2 Sep 2021 03:59:43 +0000 (GMT)
Date: Thu, 2 Sep 2021 05:59:41 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] s390x: Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK
Message-ID: <20210902055941.62b59594.pasic@linux.ibm.com>
In-Reply-To: <20210901125800.611183-1-thuth@redhat.com>
References: <20210901125800.611183-1-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ClNnfbT2jwnayy28Y_nh2m84EiWSsIOs
X-Proofpoint-GUID: 97D_V09YlJNlam7zS8Fk_DqLGFRLGCEs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-02_01:2021-09-01,
 2021-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109020020
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  1 Sep 2021 14:58:00 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The PAGE_SIZE macro is causing trouble on Alpine Linux since it
> clashes with a macro from a system header there. We already have
> the TARGET_PAGE_SIZE, TARGET_PAGE_MASK and TARGET_PAGE_BITS macros
> in QEMU anyway, so let's simply replace the PAGE_SIZE, PAGE_MASK
> and PAGE_SHIFT macro with their TARGET_* counterparts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/572
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

