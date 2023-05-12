Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E47011A0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:53:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxacX-0002w1-It; Fri, 12 May 2023 17:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxac6-0002hk-4D
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabo-00064h-SW
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:45 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CEE3mq002250; Fri, 12 May 2023 21:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dvpLHlTbyxvms4Vv5aompRO/RFTctvhwKSAD9MAsE/Y=;
 b=fNjWg/EqEXXFPfZL9ijAGy32HDuN9akC++gHqrj0jKcEBZvCHyG6D+F20Lk+bYC/Iph/
 OuJExRXQJIihOCrmCU+4ZgDMgKZo8/vXG1Fwt4krH2szZKm1KyemejloyORvWmxqZZqF
 /PDjDSwtnkjRsyFT2XCXBct6Suq6tBr993+AaoJik+vC22lON8UxmOrWeIPUc3AYoDno
 1TqyzzeXorQaGShwVg+Clr8RKUGzs7rg5XzDN8VOhvK2CYEmpvS6ADOrPYEgD3pHdLjG
 10c+CHIB+degGTRNgeb6UKNF4lkMW/hek1Lrcu4LYSLiA3OeuNxi+JpiAxsVYJAJDQF9 1w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhes22619-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLlNGb009986; 
 Fri, 12 May 2023 21:47:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3qh5rq7ua4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLlN5q009974;
 Fri, 12 May 2023 21:47:23 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 34CLlMMr009971
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id EB08B6A9; Fri, 12 May 2023 14:47:21 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 10/44] meson.build Add CONFIG_HEXAGON_IDEF_PARSER
Date: Fri, 12 May 2023 14:46:32 -0700
Message-Id: <20230512214706.946068-11-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512214706.946068-1-tsimpson@quicinc.com>
References: <20230512214706.946068-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: w_s5ewF7UgW5mYWhmTHARhs2aWAA5MCY
X-Proofpoint-GUID: w_s5ewF7UgW5mYWhmTHARhs2aWAA5MCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=630 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120183
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
cHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpNZXNzYWdlLUlkOiA8MjAyMzA0MjcyMzAwMTIuMzgwMDMy
Ny0yLXRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIG1lc29uLmJ1aWxkIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29u
LmJ1aWxkCmluZGV4IGQzY2Y0ODk2MGIuLmIzNjEyNGZkYzQgMTAwNjQ0Ci0tLSBhL21lc29uLmJ1
aWxkCisrKyBiL21lc29uLmJ1aWxkCkBAIC0xODY2LDYgKzE4NjYsNyBAQCBlbmRpZgogY29uZmln
X2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19HVEsnLCBndGsuZm91bmQoKSkKIGNvbmZpZ19ob3N0X2Rh
dGEuc2V0KCdDT05GSUdfVlRFJywgdnRlLmZvdW5kKCkpCiBjb25maWdfaG9zdF9kYXRhLnNldCgn
Q09ORklHX0dUS19DTElQQk9BUkQnLCBoYXZlX2d0a19jbGlwYm9hcmQpCitjb25maWdfaG9zdF9k
YXRhLnNldCgnQ09ORklHX0hFWEFHT05fSURFRl9QQVJTRVInLCBnZXRfb3B0aW9uKCdoZXhhZ29u
X2lkZWZfcGFyc2VyJykpCiBjb25maWdfaG9zdF9kYXRhLnNldCgnQ09ORklHX0xJQkFUVFInLCBo
YXZlX29sZF9saWJhdHRyKQogY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19MSUJDQVBfTkcn
LCBsaWJjYXBfbmcuZm91bmQoKSkKIGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdDT05GSUdfRUJQRics
IGxpYmJwZi5mb3VuZCgpKQotLSAKMi4yNS4xCgo=

