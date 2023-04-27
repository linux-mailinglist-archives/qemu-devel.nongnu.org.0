Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4706F0EB2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:06:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAbS-0001np-DJ; Thu, 27 Apr 2023 19:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAbD-0001l8-Dq
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb3-0001Ke-Nt
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:26 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMwBmD006113; Thu, 27 Apr 2023 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Tln5Z8rgrKabzydfokTlrySbRE3+BDvbctQ2deTzFL0=;
 b=XvPonubeNykkFYyjUtBWjI8LfeB/DySoJpy1idGxgko/V+AgnIXsbM9X0kL1CAHKK6tJ
 vwLx8khnONHcImCCHVYmbxE2H1FrNtgwVZUy+Yo52OlQQ6Ka2mR9ACjHADBgp31yAVQE
 343BJrzSfR3WbfaNha9QdYAUUDlH//vFDHOnLtq3MKqeDmGnKREIYoDct6x1VyHf20ck
 uRSt0p2MvKfzoZTNB1iTdqx1eZFIGcBeKGrIGC6FQZDCEhs5qpxOnCxLbHZIsqN9NWX+
 M844PJUpCCtVO5tu2lGh7BjB+A8tLyE2hqOsRrtcRnNENy5/ejd/KD5AmwZTPgb+Svno wg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7j4etda0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0E0V015010; 
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3q48nmj7kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0Eu2014994;
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 33RN0Dx3014982
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id B51684FB; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 01/21] meson.build Add CONFIG_HEXAGON_IDEF_PARSER
Date: Thu, 27 Apr 2023 15:59:52 -0700
Message-Id: <20230427230012.3800327-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DBKkTwQHXOHGPTps-KiuXLpBzSuGpMeR
X-Proofpoint-GUID: DBKkTwQHXOHGPTps-KiuXLpBzSuGpMeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=716 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270202
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RW5hYmxlIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uIGRlcGVuZGluZyBvbiB3aGV0aGVyIGlkZWYt
cGFyc2VyCmlzIGNvbmZpZ3VyZWQKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2lt
cHNvbkBxdWljaW5jLmNvbT4KLS0tCiBtZXNvbi5idWlsZCB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZApp
bmRleCBjNDRkMDVhMTNmLi5kNGU0MzhiMDMzIDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysg
Yi9tZXNvbi5idWlsZApAQCAtMTg1OSw2ICsxODU5LDcgQEAgZW5kaWYKIGNvbmZpZ19ob3N0X2Rh
dGEuc2V0KCdDT05GSUdfR1RLJywgZ3RrLmZvdW5kKCkpCiBjb25maWdfaG9zdF9kYXRhLnNldCgn
Q09ORklHX1ZURScsIHZ0ZS5mb3VuZCgpKQogY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19H
VEtfQ0xJUEJPQVJEJywgaGF2ZV9ndGtfY2xpcGJvYXJkKQorY29uZmlnX2hvc3RfZGF0YS5zZXQo
J0NPTkZJR19IRVhBR09OX0lERUZfUEFSU0VSJywgZ2V0X29wdGlvbignaGV4YWdvbl9pZGVmX3Bh
cnNlcicpKQogY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19MSUJBVFRSJywgaGF2ZV9vbGRf
bGliYXR0cikKIGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdDT05GSUdfTElCQ0FQX05HJywgbGliY2Fw
X25nLmZvdW5kKCkpCiBjb25maWdfaG9zdF9kYXRhLnNldCgnQ09ORklHX0VCUEYnLCBsaWJicGYu
Zm91bmQoKSkKLS0gCjIuMjUuMQoK

