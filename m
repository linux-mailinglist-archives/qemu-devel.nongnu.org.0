Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1C70121F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 00:18:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxb4s-0007Hf-Mw; Fri, 12 May 2023 18:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxb4q-0007HJ-Gc
 for qemu-devel@nongnu.org; Fri, 12 May 2023 18:17:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxb4o-0003fW-Te
 for qemu-devel@nongnu.org; Fri, 12 May 2023 18:17:28 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CK7uZA017411; Fri, 12 May 2023 22:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/qcLDSx03TPCgxTeAROkG9AHDeO9kIbsymIX/6xPIYA=;
 b=RNfZ4IDHOl2g9VITiN6Vtsm0tQDh90eCSEa6kzCMVVLZSFP3ObQoLgKjbmiOKa9JAENV
 MQ5c5eIkpF+cu5eGQ+0OYhcP/7Nkms5kKGjhJjFpLuTL4fd66KAKCxXpR/jb3fudi5h4
 YavZg//fEzPhaSP4WNdaJf7IVijsW7r7wGzeub21xBl4TlMiuhfiJBWM/BTuv8cMjhqS
 Ypp0jR/tBhCOEL5mk9NC278SktqfTR6pZXKN/zX51d58TYnFaxlI2Wr05+lZkZalSV2L
 tazgPdtwWzSBctm5x0/SDvHtbGh0VpnHpB8DWvonSZ34diMPpzKOXKlNP60kzh5Yckvp sQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhj9s1s3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:17:24 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CMFlSm001498; 
 Fri, 12 May 2023 22:17:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3qh5sk7yaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:17:23 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CMBeg9029895;
 Fri, 12 May 2023 22:17:23 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 34CMHMRY003592
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:17:22 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 5E102691; Fri, 12 May 2023 15:17:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 44/44] Hexagon (linux-user/hexagon): handle breakpoints
Date: Fri, 12 May 2023 14:47:06 -0700
Message-Id: <20230512214706.946068-45-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: il3WLIhqNyNK2ezgwfrFqY6h4E1JOI84
X-Proofpoint-GUID: il3WLIhqNyNK2ezgwfrFqY6h4E1JOI84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=579 mlxscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120186
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

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5j
b20+CgpUaGlzIGVuYWJsZXMgTExEQiB0byB3b3JrIHdpdGggaGV4YWdvbiBsaW51eC11c2VyIG1v
ZGUgdGhyb3VnaCB0aGUgR0RCCnJlbW90ZSBwcm90b2NvbC4KCkhlbHBlZC1ieTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IE1h
dGhldXMgVGF2YXJlcyBCZXJuYXJkaW5vIDxxdWljX21hdGhiZXJuQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+
ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVz
c2FnZS1JZDogPGMyODdhMTI5ZGNiZTdkOTc0ZDhiNzYwOGU4NjcyZDM0YTNjOTFjMDQuMTY4MzIx
NDM3NS5naXQucXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4KLS0tCiBsaW51eC11c2VyL2hleGFn
b24vY3B1X2xvb3AuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGludXgtdXNlci9oZXhhZ29uL2NwdV9sb29wLmMgYi9saW51eC11c2VyL2hl
eGFnb24vY3B1X2xvb3AuYwppbmRleCBiODRlMjViZjcxLi43ZjE0OTllZDI4IDEwMDY0NAotLS0g
YS9saW51eC11c2VyL2hleGFnb24vY3B1X2xvb3AuYworKysgYi9saW51eC11c2VyL2hleGFnb24v
Y3B1X2xvb3AuYwpAQCAtNjMsNiArNjMsOSBAQCB2b2lkIGNwdV9sb29wKENQVUhleGFnb25TdGF0
ZSAqZW52KQogICAgICAgICBjYXNlIEVYQ1BfQVRPTUlDOgogICAgICAgICAgICAgY3B1X2V4ZWNf
c3RlcF9hdG9taWMoY3MpOwogICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIGNhc2UgRVhDUF9E
RUJVRzoKKyAgICAgICAgICAgIGZvcmNlX3NpZ19mYXVsdChUQVJHRVRfU0lHVFJBUCwgVEFSR0VU
X1RSQVBfQlJLUFQsIDApOworICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIGRlZmF1bHQ6CiAg
ICAgICAgICAgICBFWENQX0RVTVAoZW52LCAiXG5xZW11OiB1bmhhbmRsZWQgQ1BVIGV4Y2VwdGlv
biAlI3ggLSBhYm9ydGluZ1xuIiwKICAgICAgICAgICAgICAgICAgICAgIHRyYXBucik7Ci0tIAoy
LjI1LjEKCg==

