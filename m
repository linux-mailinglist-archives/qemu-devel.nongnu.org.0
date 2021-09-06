Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA1401C94
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:45:11 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEvv-0006Hx-2T
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErT-0000MB-DL
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:40:35 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:12744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErR-0006m5-Mv
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:40:35 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 186DeICk002946
 for <qemu-devel@nongnu.org>; Mon, 6 Sep 2021 06:40:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=8HaapvhSkjDoB5ZM7qj2CnTsEqiDe//himovvdjBXcg=;
 b=l4XUFEUl9UL0NiEJRI3RK6kuGSx9JVAslVmSA3YyTb97notzHFXHiLuR3lVauumavRLW
 37xDiBJL+bTwgUIoCFhDxZR3C6OjUU5ZoGXeje+clc5Oz7qZjByhHtFOqffarYTgdS+9
 su/wEP7gDzVrAce9MeqQ0xUJMgGGsak3y1o= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3avrj5gm4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:40:32 -0700
Received: from intmgw001.46.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 06:40:25 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 025A41ACBBD9; Mon,  6 Sep 2021 06:40:23 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <f4bug@amsat.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 0/1] hw/arm/aspeed: Initialize AST2600 UART clock selection
 registers
Date: Mon, 6 Sep 2021 06:40:22 -0700
Message-ID: <20210906134023.3711031-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: _qtJ06hNx3msmDG-SPdlbo_TxVqxWvcP
X-Proofpoint-ORIG-GUID: _qtJ06hNx3msmDG-SPdlbo_TxVqxWvcP
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_06:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=727
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060087
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=888312a924=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

After fixing some commit log issues in another patch:

https://lore.kernel.org/qemu-devel/2F2F44C6-4817-4D58-A7A0-496446AC77AF@fb.=
com/

I noticed that I had similar issues in another patch I submitted:

https://lore.kernel.org/qemu-devel/20210831142502.279485-1-pdel@fb.com/

So I'm resubmitting this patch with the URL in the commit description
changed to a permalink using a commit hash and removing the test
instructions that I had at the end.

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Initialize AST2600 UART clock selection registers

 hw/misc/aspeed_scu.c | 4 ++++
 1 file changed, 4 insertions(+)

--=20
2.30.2


