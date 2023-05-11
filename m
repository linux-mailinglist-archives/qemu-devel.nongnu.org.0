Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B86FF907
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:57:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxAX6-0003fF-LH; Thu, 11 May 2023 13:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pxAX4-0003eb-G6
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:56:50 -0400
Received: from mailout1.w2.samsung.com ([211.189.100.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pxAX2-0004oc-D7
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:56:50 -0400
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
 20230511175641usoutp0115b0398b6311cb3f8d1764bcd781afba~eKHbkE1Ug3207532075usoutp01t;
 Thu, 11 May 2023 17:56:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
 20230511175641usoutp0115b0398b6311cb3f8d1764bcd781afba~eKHbkE1Ug3207532075usoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683827801;
 bh=rrRNzEbBk7uXDE33KzAgh30FBvL7mfwQ8R1WbLoX2TE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=aV0Xja4YAqBtsAbaxz/EEkhx4NAkqQ/hIlHLDOSuVCKRz3R7Mjmv05LChGpEDr2jk
 p09Ru0gfXDrvI6+fyZ253rCfpsBMLRJVQunn1+j7UnwdyZqIwJeZfCuJ+LD50m3aIg
 33QzDIqGNKJuEVrvB30h2rCjYXYo7uWSU4rTkZfQ=
Received: from ussmges3new.samsung.com (u112.gpu85.samsung.co.kr
 [203.254.195.112]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230511175641uscas1p2eab43508b4af278d55ba49d239334370~eKHbbSDIm2261722617uscas1p23;
 Thu, 11 May 2023 17:56:41 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges3new.samsung.com (USCPEMTA) with SMTP id A9.93.20392.95C2D546; Thu,
 11 May 2023 13:56:41 -0400 (EDT)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230511175641uscas1p2e2dd6a5b681f73870e33869af0247c06~eKHbIicN61951019510uscas1p2c;
 Thu, 11 May 2023 17:56:41 +0000 (GMT)
X-AuditID: cbfec370-81ffe70000024fa8-f7-645d2c59408f
Received: from SSI-EX3.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 5B.AE.44215.95C2D546; Thu,
 11 May 2023 13:56:41 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX3.ssi.samsung.com (105.128.2.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Thu, 11 May 2023 10:56:40 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Thu,
 11 May 2023 10:56:40 -0700
From: Fan Ni <fan.ni@samsung.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, "dan.j.williams@intel.com"
 <dan.j.williams@intel.com>, Adam Manzanares <a.manzanares@samsung.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>, "nmtadam.samsung@gmail.com"
 <nmtadam.samsung@gmail.com>, "nifan@outlook.com" <nifan@outlook.com>, Fan Ni
 <fan.ni@samsung.com>
Subject: [RFC 1/7] hw/cxl/cxl-mailbox-utils: Add dc_event_log_size field to
 output payload of identify memory device command
Thread-Topic: [RFC 1/7] hw/cxl/cxl-mailbox-utils: Add dc_event_log_size
 field to output payload of identify memory device command
Thread-Index: AQHZhDHwaEF1ZZLYJUyUWkAyoCZzdw==
Date: Thu, 11 May 2023 17:56:40 +0000
Message-ID: <20230511175609.2091136-2-fan.ni@samsung.com>
In-Reply-To: <20230511175609.2091136-1-fan.ni@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.25.1
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsWy7djX87qROrEpBt3/lCy6z29gtJg+9QKj
 xeqbaxgtGpoesVi07H7PZLH/6XMWi1ULr7FZnJ91isXi+cTnTBZLlzxitjjeu4PFgdvjwuQJ
 rB6LG1w9ds66y+7RcuQtkLfnJZPHxo//2T2eXNvM5LH59Qtmj6mz6z0+b5IL4IrisklJzcks
 Sy3St0vgylj0YCVLwSXeiiez1rE2MPZydzFyckgImEis+LCfpYuRi0NIYCWjxJdL8xghnFYm
 iffT9zHCVLVtPs8GkVjLKPFw2hQo5xOjxK+3F1ghnGWMEn8X3mUDaWETUJTY17UdzBYRMJY4
 dngJM0gRs8BbFomPa96wgCSEBeokVk9aA7ZdRKCZUaJh4mWoDj2JXz/vghWxCKhKnLuxA+wQ
 XgFLideLmsBqOAWsJDY0n2ACsRkFxCS+n1oDZjMLiEvcejKfCeJwQYlFs/cwQ9hiEv92PWSD
 sOUlJv+YAWUrStz//pIdoldP4sbUKWwQtrbEsoWvmSH2CkqcnPmEBaJeUuLgihtgR0sITOaU
 +PnpIDtEwkXi0qqjUEOlJf7eXQZ0BAeQnSyx6iMXRDhHYv6SLVBzrCUW/lnPNIFRZRaSs2ch
 OWMWkjNmITljASPLKkbx0uLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMAUd/rf4YIdjLdufdQ7
 xMjEwXiIUYKDWUmE9+2S6BQh3pTEyqrUovz4otKc1OJDjNIcLErivIa2J5OFBNITS1KzU1ML
 UotgskwcnFINTFNWZ1a/Xap++KuCWPevysNzrt26Kfpj7paZa+Zt+XI2ufR11xk9BT/nvWze
 my/8WjTZfHP/xgvzXmwP2XFrWk7OPBffi1dffmVZzvs662NnVPOi9xe05Kts1j9o62i42syq
 FrPT78jPqIJFESLOS/ZwreRQvtB90lZhV+C8a6HMmiWvO09Jlry2ehXiYJ55weTEy9unyuxb
 FTbk/iz1+6q+/4PdWrGEGQyy82Y+0v5t4rA9UPhw6UqdSL39x12zC/d9c5vZtVTzc+mWmYUc
 UZaTNi2t/58m9d8h41T3gtcdkhz9DHLv2RM7NmziZZN8PyHo4l2ZabdKVM8tUr1076u4i/7/
 rWFTp85YNP/KpEf8SizFGYmGWsxFxYkAP26LqOADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWS2cA0STdSJzbF4EQnj0X3+Q2MFtOnXmC0
 WH1zDaNFQ9MjFouW3e+ZLPY/fc5isWrhNTaL87NOsVg8n/icyWLpkkfMFsd7d7A4cHtcmDyB
 1WNxg6vHzll32T1ajrwF8va8ZPLY+PE/u8eTa5uZPDa/fsHsMXV2vcfnTXIBXFFcNimpOZll
 qUX6dglcGYserGQpuMRb8WTWOtYGxl7uLkZODgkBE4m2zefZuhi5OIQEVjNKzN17lBHC+cQo
 8efnRWYIZxmjxObJXYwgLWwCihL7urazgdgiAsYSxw4vYQaxmQVes0h8uwg2VligTmL1pDUs
 IM0iAs2MEms2b2eHaNCT+PXzLguIzSKgKnHuxg6wobwClhKvFzWBDRUCsj/+3AlWzylgJbGh
 +QQTiM0oICbx/dQaJohl4hK3nsxngvhBQGLJnvPMELaoxMvH/1ghbHmJyT9msEHYihL3v79k
 h+jVk7gxdQobhK0tsWzha2aIGwQlTs58wgJRLylxcMUNlgmMErOQrJuFpH0WkvZZSNoXMLKs
 YhQvLS7OTa8oNspLLdcrTswtLs1L10vOz93ECEwOp/8djt7BePvWR71DjEwcjIcYJTiYlUR4
 3y6JThHiTUmsrEotyo8vKs1JLT7EKM3BoiTO+zJqYryQQHpiSWp2ampBahFMlomDU6qBKU3z
 77QVps+7Ld5dfTNX/3jHxRcfjy87uvA919LZpSdrzAJ/GXfEr8vNCr24jGHO/4naGjFxWgL5
 fhVtfr0uDpHiGzTfuJ2a83VasuyKNVuuckVvyNvsXJ/1n60prDCw4NOaODGHJZYx6/sFjsmn
 2b351bk5O2uZYl0Cd/e7Q03Z083nep+P42e/dv9i1UtVPYdl5gUTtuRY9gbMfRVXZPE+JlRx
 i8oUpzPtH92Ud8XyFSd8n9wj0vC78I7UAZm9U+OX3liof3Taia1Fp2Yxyx0QKNVS0py+PzeW
 /Zv21ZqVkjIvePQNZL85vtVcHHbzWYH27by85x2rTtY+rlx2pMJ4voexmNa+ABnpjMg7SizF
 GYmGWsxFxYkAF8AQj30DAAA=
X-CMS-MailID: 20230511175641uscas1p2e2dd6a5b681f73870e33869af0247c06
CMS-TYPE: 301P
X-CMS-RootMailID: 20230511175641uscas1p2e2dd6a5b681f73870e33869af0247c06
References: <20230511175609.2091136-1-fan.ni@samsung.com>
 <CGME20230511175641uscas1p2e2dd6a5b681f73870e33869af0247c06@uscas1p2.samsung.com>
Received-SPF: pass client-ip=211.189.100.11; envelope-from=fan.ni@samsung.com;
 helo=mailout1.w2.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Fan Ni <nifan@outlook.com>

Based on CXL spec 3.0 Table 8-94 (Identify Memory Device Output
Payload), dynamic capacity event log size should be part of
output of the Identify command.
Add dc_event_log_size to the output payload for the host to get the info.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
 hw/cxl/cxl-mailbox-utils.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 9f8e6722d7..7ff4fbdf22 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -21,6 +21,8 @@
 #include "sysemu/hostmem.h"
=20
 #define CXL_CAPACITY_MULTIPLIER   (256 * MiB)
+/* Experimental value: dynamic capacity event log size */
+#define CXL_DC_EVENT_LOG_SIZE 8
=20
 /*
  * How to add a new command, example. The command set FOO, with cmd BAR.
@@ -519,8 +521,9 @@ static CXLRetCode cmd_identify_memory_device(struct cxl=
_cmd *cmd,
         uint16_t inject_poison_limit;
         uint8_t poison_caps;
         uint8_t qos_telemetry_caps;
+		uint16_t dc_event_log_size;
     } QEMU_PACKED *id;
-    QEMU_BUILD_BUG_ON(sizeof(*id) !=3D 0x43);
+    QEMU_BUILD_BUG_ON(sizeof(*id) !=3D 0x45);
=20
     CXLType3Dev *ct3d =3D container_of(cxl_dstate, CXLType3Dev, cxl_dstate=
);
     CXLType3Class *cvc =3D CXL_TYPE3_GET_CLASS(ct3d);
@@ -543,6 +546,7 @@ static CXLRetCode cmd_identify_memory_device(struct cxl=
_cmd *cmd,
     st24_le_p(id->poison_list_max_mer, 256);
     /* No limit - so limited by main poison record limit */
     stw_le_p(&id->inject_poison_limit, 0);
+	stw_le_p(&id->dc_event_log_size, CXL_DC_EVENT_LOG_SIZE);
=20
     *len =3D sizeof(*id);
     return CXL_MBOX_SUCCESS;
--=20
2.25.1

