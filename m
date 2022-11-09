Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCC7622C90
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 14:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oslFk-00005u-Fn; Wed, 09 Nov 2022 08:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1oslEy-0008Uu-9N; Wed, 09 Nov 2022 08:35:41 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1oslEw-0007OZ-GV; Wed, 09 Nov 2022 08:35:40 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9DAJNf020507; Wed, 9 Nov 2022 13:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=3CwR3CmIxi/nw8ww4F3PlESKbzSMqfEJpqReeT/hmco=;
 b=aqn3LWP3H+8Mwa8mjZuO5jrNv1remnGbXLdMqlJavo66+HgIwYNFBjOyytuD5Qz2ATIK
 aO+zVcb5LgBIQv9Bf/wXeNv2IQQ/7RTIagKBq1Z66056MiOxOz3sNNvL9qBT88uritY8
 dt8pa2XpwrIqEir2xv81ft3SUu0P1UxMTpJEU6TLRa02hR3UYFzHnuQ6yCNp9nbVmgJw
 zf+tMq2KrEghhvGpEhUblcZWK3v/DcSffSmYFsvvxhWb8NoV9YnENRIwzkZNlThgj283
 hDsOngoVwQshfpFYmB6aJ/rKQTmrecXhoA0zP9YAQfUXt22AmSswKtEDbyVaKXq/yFEI UA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kr656970t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 13:35:34 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A9DZYUJ006441
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Nov 2022 13:35:34 GMT
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 9 Nov 2022
 05:35:32 -0800
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Leif Lindholm
 <LeifLindholmquic_llindhol@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Subject: [RFC PATCH 0/1] hw/arm: use -cpu max by default on sbsa-ref
Date: Wed, 9 Nov 2022 13:35:24 +0000
Message-ID: <20221109133525.762667-1-quic_llindhol@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UJdQaLCcJFUnD5axGeJt97lMNuEFhqIh
X-Proofpoint-GUID: UJdQaLCcJFUnD5axGeJt97lMNuEFhqIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=533 spamscore=0 mlxscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090103
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Leif Lindholm <Leif Lindholm quic_llindhol@quicinc.com>

We have mainly (well, as will become clear, in fact "exclusively") been using
sbsa-ref with the "max" CPU. But sbsa-ref was created with a default CPU of
Cortex-A57, which we have not updated along the way.

However, the "max" cpu has seen a bug where Linux boot fails around UEFI
ExitBootServices. Marcin Juszkiewicz has found the cause for that, but that
requires a patch to TF-A. (Has that been submitted upstream?)

Turns out that due to a change in upstream TF-A last year, all supported cpus
other than "max" fail to even boot UEFI fully, due to the top-level (TF-A)
Makefile defaulting to enabling the maximum ARM architectural version
(currently 8.6), in combination with not verifying all features at runtime
using the ID registers.

Since the *point* of sbsa-ref is to serve as a continuously evolving platform
tracking (with some obvious lag) the evolution of the ARM architecture and the
SystemReady specifications, I don't really want to restrict the enabled
feature set in TF-A to the Cortex-A57 one.

My preferred course of action would be to change the default cpu to max -
maybe even dropping support for other cpus. I would then step the version
field that was added to the DT. *But* this would break existing boots with
old TF-A that can currently boot Linux.

I did contemplate weaving this into the platform versioning, but truth is
I'm not convinced that would help ... and it would delay getting the
reworked memory map out.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>

Leif Lindholm (1):
  hw/arm: use -cpu max by default for sbsa-ref

 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.30.2


