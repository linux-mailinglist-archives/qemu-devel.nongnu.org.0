Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F770118C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:49:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxac2-0002e0-0y; Fri, 12 May 2023 17:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabs-0002co-GE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabo-00065o-1l
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:32 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CLf9Ox002474; Fri, 12 May 2023 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=E4zNT0iMlgsKyg6MGMP9NvqXb5TtVWSHTMSiglGzIKs=;
 b=ll0SVSRzSpm+6gkHxk9dbrDC5foeI/uw6xyZfYQfkZcB4tfQqQmnExOu/v7UG3LuoT2N
 g0twZFmXrHuPYCc61g6SsQeeAheWFtk1Z/6VWMkdfqU9QSiqSrzgH5zeQNFy+G9pdO+J
 Q+4s2iI/OJiRsYMT5rvCnjYNwWAYil58lTPVeVQ5bcNgL7bhaUD5J6uo+gTZDDO8ToZ2
 eOhh/8EaZEbE5pXHosVirVNhqVAJ6O6Oi7gHblp1G5D+sc2rW6jU4PAyfg+dY82wqJTY
 K0Bw/eDHhI2/4SfnmXIQelRQbZ2HxMkxubbmoZkNR6C2A2kjFdiQBjB9Ql1ZHHiadlJC vw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhayt2j8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:25 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLlOge010041; 
 Fri, 12 May 2023 21:47:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3qh5rq7uau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLlN5s009974;
 Fri, 12 May 2023 21:47:24 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 34CLlNqm010006
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 43E546DF; Fri, 12 May 2023 14:47:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 38/44] Remove test_vshuff from hvx_misc tests
Date: Fri, 12 May 2023 14:47:00 -0700
Message-Id: <20230512214706.946068-39-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: qWL-CdSU9y8e8ufkTJzc6hDPdV99hubT
X-Proofpoint-GUID: qWL-CdSU9y8e8ufkTJzc6hDPdV99hubT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=830
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120183
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

RnJvbTogTWFyY28gTGllYmVsIDxxdWljX21saWViZWxAcXVpY2luYy5jb20+Cgp0ZXN0X3ZzaHVm
ZiBjaGVja3MgdGhhdCB0aGUgdnNodWZmIGluc3RydWN0aW9uIHdvcmtzIGNvcnJlY3RseSB3aGVu
CmJvdGggdmVjdG9yIHJlZ2lzdGVycyBhcmUgdGhlIHNhbWUuIFVzaW5nIHZzaHVmZiBpbiB0aGlz
IHdheSBpcwp1bmRlZmluZWQgYW5kIHdpbGwgYmUgcmVqZWN0ZWQgYnkgdGhlIGNvbXBpbGVyIGlu
IGEgZnV0dXJlIHZlcnNpb24gb2YKdGhlIHRvb2xjaGFpbi4KClNpZ25lZC1vZmYtYnk6IE1hcmNv
IExpZWJlbCA8cXVpY19tbGllYmVsQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQnJpYW4gQ2Fp
biA8YmNhaW5AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+ClRlc3RlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5j
b20+Ck1lc3NhZ2UtSWQ6IDwyMDIzMDUwOTE4NDIzMS4yNDY3NjI2LTEtcXVpY19tbGllYmVsQHF1
aWNpbmMuY29tPgotLS0KIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMgfCA0NSAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jIGIvdGVzdHMv
dGNnL2hleGFnb24vaHZ4X21pc2MuYwppbmRleCBjODlmZTAyNTNkLi4wOWRlYzhkN2ExIDEwMDY0
NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jCisrKyBiL3Rlc3RzL3RjZy9oZXhh
Z29uL2h2eF9taXNjLmMKQEAgLTM0Miw0OSArMzQyLDYgQEAgc3RhdGljIHZvaWQgdGVzdF92c3Vi
dXdzYXRfZHYodm9pZCkKICAgICBjaGVja19vdXRwdXRfdyhfX0xJTkVfXywgMik7CiB9CiAKLXN0
YXRpYyB2b2lkIHRlc3RfdnNodWZmKHZvaWQpCi17Ci0gICAgLyogVGVzdCB0aGF0IHZzaHVmZiB3
b3JrcyB3aGVuIHRoZSB0d28gb3BlcmFuZHMgYXJlIHRoZSBzYW1lIHJlZ2lzdGVyICovCi0gICAg
Y29uc3QgdWludDMyX3Qgc3BsYXQgPSAweDA4OWJlNTVjOwotICAgIGNvbnN0IHVpbnQzMl90IHNo
dWZmID0gMHg0NTRmYTkyNjsKLSAgICBNTVZlY3RvciB2MCwgdjE7Ci0KLSAgICBtZW1zZXQoZXhw
ZWN0LCAweDEyLCBzaXplb2YoTU1WZWN0b3IpKTsKLSAgICBtZW1zZXQob3V0cHV0LCAweDM0LCBz
aXplb2YoTU1WZWN0b3IpKTsKLQotICAgIGFzbSB2b2xhdGlsZSgidjI1ID0gdnNwbGF0KCUwKVxu
XHQiCi0gICAgICAgICAgICAgICAgICJ2c2h1ZmYodjI1LCB2MjUsICUxKVxuXHQiCi0gICAgICAg
ICAgICAgICAgICJ2bWVtKCUyICsgIzApID0gdjI1XG5cdCIKLSAgICAgICAgICAgICAgICAgOiAv
KiBubyBvdXRwdXRzICovCi0gICAgICAgICAgICAgICAgIDogInIiKHNwbGF0KSwgInIiKHNodWZm
KSwgInIiKG91dHB1dCkKLSAgICAgICAgICAgICAgICAgOiAidjI1IiwgIm1lbW9yeSIpOwotCi0g
ICAgLyoKLSAgICAgKiBUaGUgc2VtYW50aWNzIG9mIEhleGFnb24gYXJlIHRoZSBvcGVyYW5kcyBh
cmUgcGFzcy1ieS12YWx1ZSwgc28gY3JlYXRlCi0gICAgICogdHdvIGNvcGllcyBvZiB0aGUgdnNw
bGF0IHJlc3VsdC4KLSAgICAgKi8KLSAgICBmb3IgKGludCBpID0gMDsgaSA8IE1BWF9WRUNfU0la
RV9CWVRFUyAvIDQ7IGkrKykgewotICAgICAgICB2MC51d1tpXSA9IHNwbGF0OwotICAgICAgICB2
MS51d1tpXSA9IHNwbGF0OwotICAgIH0KLSAgICAvKiBEbyB0aGUgdnNodWZmIG9wZXJhdGlvbiAq
LwotICAgIGZvciAoaW50IG9mZnNldCA9IDE7IG9mZnNldCA8IE1BWF9WRUNfU0laRV9CWVRFUzsg
b2Zmc2V0IDw8PSAxKSB7Ci0gICAgICAgIGlmIChzaHVmZiAmIG9mZnNldCkgewotICAgICAgICAg
ICAgZm9yIChpbnQgayA9IDA7IGsgPCBNQVhfVkVDX1NJWkVfQllURVM7IGsrKykgewotICAgICAg
ICAgICAgICAgIGlmICghKGsgJiBvZmZzZXQpKSB7Ci0gICAgICAgICAgICAgICAgICAgIHVpbnQ4
X3QgdG1wID0gdjAudWJba107Ci0gICAgICAgICAgICAgICAgICAgIHYwLnViW2tdID0gdjEudWJb
ayArIG9mZnNldF07Ci0gICAgICAgICAgICAgICAgICAgIHYxLnViW2sgKyBvZmZzZXRdID0gdG1w
OwotICAgICAgICAgICAgICAgIH0KLSAgICAgICAgICAgIH0KLSAgICAgICAgfQotICAgIH0KLSAg
ICAvKiBQdXQgdGhlIHJlc3VsdCBpbiB0aGUgZXhwZWN0IGJ1ZmZlciBmb3IgdmVyaWZpY2F0aW9u
ICovCi0gICAgZXhwZWN0WzBdID0gdjE7Ci0KLSAgICBjaGVja19vdXRwdXRfYihfX0xJTkVfXywg
MSk7Ci19Ci0KIHN0YXRpYyB2b2lkIHRlc3RfbG9hZF90bXBfcHJlZGljYXRlZCh2b2lkKQogewog
ICAgIHZvaWQgKnAwID0gYnVmZmVyMDsKQEAgLTUwOCw4ICs0NjUsNiBAQCBpbnQgbWFpbigpCiAg
ICAgdGVzdF92YWRkdXdzYXQoKTsKICAgICB0ZXN0X3ZzdWJ1d3NhdF9kdigpOwogCi0gICAgdGVz
dF92c2h1ZmYoKTsKLQogICAgIHRlc3RfbG9hZF90bXBfcHJlZGljYXRlZCgpOwogICAgIHRlc3Rf
bG9hZF9jdXJfcHJlZGljYXRlZCgpOwogCi0tIAoyLjI1LjEKCg==

