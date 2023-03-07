Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48BA6AD531
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 04:00:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXS-0000YM-Mc; Mon, 06 Mar 2023 21:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXN-0000Uk-6o
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:49 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXK-0005nk-HM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:48 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3271QsDp031375; Tue, 7 Mar 2023 02:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6SG8VAfILbF/GCIicFPIULznQVXIkCmuYxoRZIisxdw=;
 b=moTwQkPqoGjhIwFU+8UaXXHEk7HltCJ3BV2dlJzkS3VEorXJWDF4X5hegeszf2gdTUhe
 +aVH/xqARhjZZddPcws7kJQtqbmOOV85wKcBCAgOWrQf6op5g+41KZeEYecqXE3DHWRE
 k5YPG8D9k2wf1GDod1yhqgaM6mD0TSbjMDBs0pZkS5a/bu4kUxdufvNJxNXIaQ9n3IL7
 GpSJhG0DyciLNT7Bt1i3VSMP3Ls5wEnhQqvgxQg9/UeTR2uzbdnm18PcF+nzXDsUwPRW
 cCsjDQn9ypS53yS1odGJibgqry6idWKnXUXAk1IMEeyKRK+fD6Tu7yJ4nFYYZzEgRo90 Pg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5ukn0694-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:34 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272v8MQ021115; 
 Tue, 7 Mar 2023 02:58:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3p4ffd3r7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272wVOT022240;
 Tue, 7 Mar 2023 02:58:32 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3272wVxH022233
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id D77E8A77; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
Date: Mon,  6 Mar 2023 18:58:24 -0800
Message-Id: <20230307025828.1612809-11-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307025828.1612809-1-tsimpson@quicinc.com>
References: <20230307025828.1612809-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RjhrJSS79AXmjFZx8dzeHzAfXGCvoAwF
X-Proofpoint-GUID: RjhrJSS79AXmjFZx8dzeHzAfXGCvoAwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=883 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070025
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

TWFkZSBwb3NzaWJsZSBieSBuZXcgdG9vbGNoYWluIGNvbnRhaW5lcgoKU2lnbmVkLW9mZi1ieTog
VGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQW50b24g
Sm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50
YXJnZXQgfCAxMyArKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxl
LnRhcmdldCBiL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldAppbmRleCAxOGU2YTU5
NjllLi4wZDgyZGZhNzZlIDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50
YXJnZXQKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0CkBAIC0xLDUgKzEs
NSBAQAogIyMKLSMjICBDb3B5cmlnaHQoYykgMjAxOS0yMDIyIFF1YWxjb21tIElubm92YXRpb24g
Q2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjIyAgQ29weXJpZ2h0KGMpIDIwMTkt
MjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVk
LgogIyMKICMjICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogIyMgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CkBAIC00NSw2ICs0NSwxMCBA
QCBIRVhfVEVTVFMgKz0gZnBzdHVmZgogSEVYX1RFU1RTICs9IG92ZXJmbG93CiBIRVhfVEVTVFMg
Kz0gc2lnbmFsX2NvbnRleHQKIEhFWF9URVNUUyArPSByZWdfbXV0CitIRVhfVEVTVFMgKz0gdmVj
dG9yX2FkZF9pbnQKK0hFWF9URVNUUyArPSBzY2F0dGVyX2dhdGhlcgorSEVYX1RFU1RTICs9IGh2
eF9taXNjCitIRVhfVEVTVFMgKz0gaHZ4X2hpc3RvZ3JhbQogCiBIRVhfVEVTVFMgKz0gdGVzdF9h
YnMKIEhFWF9URVNUUyArPSB0ZXN0X2JpdGNudApAQCAtNzgsMyArODIsMTAgQEAgVEVTVFMgKz0g
JChIRVhfVEVTVFMpCiB1c3I6IHVzci5jCiAJJChDQykgJChDRkxBR1MpIC1tdjY3dCAtTzIgLVdu
by1pbmxpbmUtYXNtIC1Xbm8tZXhwYW5zaW9uLXRvLWRlZmluZWQgJDwgLW8gJEAgJChMREZMQUdT
KQogCitzY2F0dGVyX2dhdGhlcjogQ0ZMQUdTICs9IC1taHZ4Cit2ZWN0b3JfYWRkX2ludDogQ0ZM
QUdTICs9IC1taHZ4IC1mdmVjdG9yaXplCitodnhfbWlzYzogQ0ZMQUdTICs9IC1taHZ4Citodnhf
aGlzdG9ncmFtOiBDRkxBR1MgKz0gLW1odnggLVduby1nbnUtZm9sZGluZy1jb25zdGFudAorCito
dnhfaGlzdG9ncmFtOiBodnhfaGlzdG9ncmFtLmMgaHZ4X2hpc3RvZ3JhbV9yb3cuUworCSQoQ0Mp
ICQoQ0ZMQUdTKSAkKENST1NTX0NDX0dVRVNUX0NGTEFHUykgJF4gLW8gJEAgJChMREZMQUdTKQot
LSAKMi4yNS4xCgo=

