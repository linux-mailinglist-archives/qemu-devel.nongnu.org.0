Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC53FDDA0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:04:44 +0200 (CEST)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQr5-0006DA-Q7
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mLQpY-0005Se-VQ; Wed, 01 Sep 2021 10:03:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36632
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mLQpW-0006uz-UM; Wed, 01 Sep 2021 10:03:08 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181DXwh6061677; Wed, 1 Sep 2021 10:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=d3zgEztCZV1gydJQHfQ3gNqn2ZDIwVMPhGt6TFp2Zyw=;
 b=n54PpOsLlwDl3dxl5pvwVLVl6VuU10zjN+LYJoiAiazzRKdCduIrEwBu6pS4dxJXxvMT
 eXpfL0aMo+lAbCofrxJsZF9GJQA0naCIY3jDf/VWrtgYxH0B3nvU0ifP+f/gpwaxWjo7
 Mik9se0JlHcRNvhTC8VUoOsgWlUhCm1DeH065LBXdsswUMMPXpuGAIuJw3Nc51zJnNRf
 RoqS3sM5bvCs8svxJovftzVB8ugsVGh1ser2qR7kTSPK7u5Jk96a9uM9v6FZHpjAfdVz
 7+E2UnkOh/JsjgyV5/xQefg0PGpcsXFkgkp4jjiFCC/mhMZGiNKtbG1sGREu575d8rPp lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at7ctxesx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 10:03:00 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181DY2tu062065;
 Wed, 1 Sep 2021 10:02:59 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at7ctxerq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 10:02:59 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181DlrRb020100;
 Wed, 1 Sep 2021 14:02:57 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3astd1gw08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 14:02:55 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181E0nWq46792968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 14:00:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EC836A067;
 Wed,  1 Sep 2021 14:00:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D77176A058;
 Wed,  1 Sep 2021 14:00:47 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.140.37])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 14:00:47 +0000 (GMT)
Message-ID: <3bbafaf60bc36472dfc53cddb17c96b04bb4bc7d.camel@linux.ibm.com>
Subject: Re: [PATCH] s390x: Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Matthew Rosato
 <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
Date: Wed, 01 Sep 2021 10:00:46 -0400
In-Reply-To: <20210901125800.611183-1-thuth@redhat.com>
References: <20210901125800.611183-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V4-4DmMZY6rvYfBkQ1xXFWAXxlqCf3Tk
X-Proofpoint-GUID: K1r1unOVGuuerFAJH68P3WfHAIYcy6gL
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010081
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-09-01 at 14:58 +0200, Thomas Huth wrote:
> The PAGE_SIZE macro is causing trouble on Alpine Linux since it
> clashes with a macro from a system header there. We already have
> the TARGET_PAGE_SIZE, TARGET_PAGE_MASK and TARGET_PAGE_BITS macros
> in QEMU anyway, so let's simply replace the PAGE_SIZE, PAGE_MASK
> and PAGE_SHIFT macro with their TARGET_* counterparts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/572
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>


