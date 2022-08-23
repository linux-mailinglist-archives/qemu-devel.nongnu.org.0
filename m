Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB4F59E62A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:40:43 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQW1C-0000o5-Tv
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQVy2-00056k-3c
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:37:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQVy0-00022h-Dt
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:37:25 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NDO4pH000683;
 Tue, 23 Aug 2022 15:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=+ZX+Uz9KGeIQX6sYiOabY9lMWIVQLnWVOd0GMZ2Z53c=;
 b=RE7Ogkf1p/WR2J5zierrotjQG40eXbHMUWIomf//nce1D/C/s9XvksctFlq/xGCjwP/U
 m6VrSh0zSjIlnng55KvGpiclCFqjUObvWj1DEIgQQNXPA4CiKg3BSzCi9mbX0t93Wnyh
 jXUzPoSiSjkYLJWjxQKK1WwHPmbiBXi1WPb3wTVXLxcZFE7n7IVPj1SlSF+fOeMtgxSl
 IVQhTDU3zVqBL+U8vYgbb8vtRqYFXsKbp7GMLMkxJk8/U+s9IErxfTb45HxYT8dmJbDX
 areemwF/ONDb7mH3GYCi2INvhpZdieXdIUrHyxbDmM2c/M3XXs6mfskBu+q5vtbhx0Zb gg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j4vxj9ejh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 15:37:18 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 27NFbH1x022163; 
 Tue, 23 Aug 2022 15:37:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3j2rpku7jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 15:37:17 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27NFbH0w022158;
 Tue, 23 Aug 2022 15:37:17 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 27NFbHkf022157
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 15:37:17 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 8216C628; Tue, 23 Aug 2022 12:37:17 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: quic_mathbern@quicinc.com
Cc: alex.bennee@linaro.org, f4bug@amsat.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] gdbstub: only send stop-reply upon request
Date: Tue, 23 Aug 2022 12:37:17 -0300
Message-Id: <20220823153717.1199317-1-quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
References: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NjIGOiMcdRWanycYipUuBiKvhLYtFZJn
X-Proofpoint-ORIG-GUID: NjIGOiMcdRWanycYipUuBiKvhLYtFZJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_06,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=486 spamscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230063
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 32, 2022 at 1:39 PM Matheus Tavares Bernardino wrote:
>
> ---
>  gdbstub.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)

Please ignore this patch. This version is broken, I'm working on a new
one. Sorry for the noise.

