Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150D3B76F6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:11:30 +0200 (CEST)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHGi-0003CD-8N
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0814b5e089=harrison.marcks@ncr.com>)
 id 1lyG08-0007HZ-SU
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:16 -0400
Received: from mx0b-00209e01.pphosted.com ([148.163.152.55]:20782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0814b5e089=harrison.marcks@ncr.com>)
 id 1lyG05-00033A-N5
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:16 -0400
Received: from pps.filterd (m0184430.ppops.net [127.0.0.1])
 by mx0b-00209e01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TFbW7l006385; Tue, 29 Jun 2021 11:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ncr.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pod1119; bh=Bz9MmBWbhQCVKN0TBKbdnbjlNGU/WoqcOJPf4wxeJNQ=;
 b=Ouomli53B/rgobLUlxV1mQykjfUfUS9QFd3ml48I+9vqyjexn455fkS5AAQyC/7H0NAU
 4gwf02nxdb16L65JUw9b6eF2GSNBdrV8HXXXzrctaJMy7jNi6ZMWl/lVFg7cgFW/R0Z5
 VppNx0sM3OhNUQFZMYg0mSBk4QPjlSAHUxMKTGWVgfCZKd6wozj/HuZaAhhfKjqI7YO7
 1UjLd5NqcS8p136ZM1CkbThJBW8z+KI7Y81KuIgTd33tgCzODkTWGVHghXruNX6WwRTF
 qHgKz+DZOybpCHBGuscQzgDZyKRs0NglfBPx6QmzHJFANREDBkSHgCs2Jy+WmI76I+V/ eg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0b-00209e01.pphosted.com with ESMTP id 39eh4q2b9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 11:50:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtVKvly9IOUYC2uo+hcnFTmN6/+mQpwRWdsB10/SIxsVP+B0qzP/zCu66ro48x4zIacQDtrPHTx52Dtk9okZ4bzttG08ayPpNgJEO4k/kTlLvMjTCE4G3SKvW4MbQOWaVBPTGp481nUHUIxjaw+GD4L5o1CsVxnl/T/9YSNFQrkINo2jvtxUXFfocmYnrqeIOilRa7oUaRcc5yxSJJgYH9F9Z9WYxSMqPEb+e4IHWjlJfdxcXELiUBFn00q4XWd9Vl885TJtrcRunI/YOnV1WTZbZjctNOKLdilVYylSlEbt2cHEZCISl4PCCbkon0AEPSpzuyniMaM0T9EtLdAdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz9MmBWbhQCVKN0TBKbdnbjlNGU/WoqcOJPf4wxeJNQ=;
 b=jqwsxQqf2lzCBp0PJpptr+YXfDYDS/Ufdy0uax8A9MCRmT/XZ8voQYLVGq4EhPqcejLPs7Mkw1gIw0UP2xHWDU9w8Gm1OjbOQtjhnpE7M1VZf6iulnAnnIg3fQJ8PrdAREO2oGKW/1UICpU7J2syg9HQ0ahR6cCWw2HO25SzNNjLxxFgpDT5ZbxGSjgCuVkB0gTa9q39i2ZgeRSarra+Jo5sv5F5Ir3hWryDDeUvBgqQbApMjYVdNknMuEzwv7J+dq6nBgQwNK3xNJLofmw9rtifURrAfQgQcI5w2qc1R9REL8vE474/sHLlkD4YL+yBXrLP6OiZzCf8dDPayr0aNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ncr.com; dmarc=pass action=none header.from=ncr.com; dkim=pass
 header.d=ncr.com; arc=none
Received: from PH0PR15MB4480.namprd15.prod.outlook.com (2603:10b6:510:86::20)
 by PH0PR15MB4429.namprd15.prod.outlook.com (2603:10b6:510:81::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 15:50:05 +0000
Received: from PH0PR15MB4480.namprd15.prod.outlook.com
 ([fe80::552:9c2e:468b:b174]) by PH0PR15MB4480.namprd15.prod.outlook.com
 ([fe80::552:9c2e:468b:b174%7]) with mapi id 15.20.4287.022; Tue, 29 Jun 2021
 15:50:05 +0000
From: "Marcks, Harrison" <Harrison.Marcks@ncr.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "berrange@redhat.com" <berrange@redhat.com>, "Marcks, Harrison"
 <Harrison.Marcks@ncr.com>
Subject: [PATCH] crypto tls session: GNUTLS internal buffer is now cleared of
 stale data
Thread-Topic: [PATCH] crypto tls session: GNUTLS internal buffer is now
 cleared of stale data
Thread-Index: Adds/Klex1nS8SMCQH60Coa+YAF4cQ==
Date: Tue, 29 Jun 2021 15:50:04 +0000
Message-ID: <PH0PR15MB448020F90D7E38336344FF92F3029@PH0PR15MB4480.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dc233488-06c6-4c2b-96ac-e256c4376f84_Enabled=true;
 MSIP_Label_dc233488-06c6-4c2b-96ac-e256c4376f84_SetDate=2021-06-29T15:36:36Z; 
 MSIP_Label_dc233488-06c6-4c2b-96ac-e256c4376f84_Method=Standard;
 MSIP_Label_dc233488-06c6-4c2b-96ac-e256c4376f84_Name=dc233488-06c6-4c2b-96ac-e256c4376f84;
 MSIP_Label_dc233488-06c6-4c2b-96ac-e256c4376f84_SiteId=ae4df1f7-611e-444f-897e-f964e1205171;
 MSIP_Label_dc233488-06c6-4c2b-96ac-e256c4376f84_ActionId=34e00ff7-f41a-4c2b-bc61-7dd48bd36b33;
 MSIP_Label_dc233488-06c6-4c2b-96ac-e256c4376f84_ContentBits=0
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=ncr.com;
x-originating-ip: [2.126.94.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a865b58-7111-4bcd-ec9d-08d93b159054
x-ms-traffictypediagnostic: PH0PR15MB4429:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR15MB4429F6CBB145068568F95896F3029@PH0PR15MB4429.namprd15.prod.outlook.com>
x-from-ncr-tenant: Processed
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q/mfrOOGzc9PF9B74zGbK/PmI3PVHmBOrYiQtgSLRjvrgug+ApB82B8mgCPjAx7aKHPlfFgFYjHmF+SIMXzU76iOeNq4qaG/Q0LYu9iQJWnZPNDrmcId3Zal7dfeDpj+VwQKvN++fQP+R/CGQUG1oxp5ubdYhzDYryArRnt+xysrH2/ts5G2Mnnn9mOrP/J+eT10172I317I6SUR7ZLh/2VEILXIIYkboMBjcZUsVaMDrmfo5GQ8GTPT0GNXYqOZ0mZ+eV6n+UzVmzHk1pFqs0M3hy7CR2KIUxliyXTr4Bus/VpkkONsYI9DQpsDkSpAgIvendrmaYdp9wOq1Ft6+OIQqE6fuRucaeUcHfLSBR2rc7KfeBFkfU86pIAVZ5Svc4XWjk0lligFrWFyfIuNHu8MM7sgBw9YYSVESGQhDpbcJuDE1e9K0ncaIcc/Sd7awWiMlSk40AFgCKLHCtwlYfkXZrI8HHDSOdKr9KyqADbjn4OryuxiGOgolgB/lbyPdnyASnxIQXVn6hvBgg2bvibqEqKSaJVVVMczocLP/ufyFw+9iXnYDtV+TsDrWB/sxrjZQmEP0gmGGU4dlx82Mw5Sd97n9vP+xotVVD1mMRRwXRgvWlRuimFgi/gEMvri7IFyNeg5tFjpk7qgWHqgLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR15MB4480.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(186003)(83380400001)(52536014)(9686003)(7696005)(8676002)(6506007)(55016002)(71200400001)(53546011)(5660300002)(54906003)(122000001)(38100700002)(26005)(76116006)(66476007)(478600001)(6916009)(316002)(8936002)(33656002)(66446008)(64756008)(66556008)(2906002)(66946007)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PorzDePlEuebxG6lER0RFgIR8qeGFSbzNh6ozet5TJBHwDjSjqPjIWa6Q5mF?=
 =?us-ascii?Q?bv3Fz74efa67l/S55eraXLmDx3IRQbch8T8tMv3yl16P0IY0RUtvIRBRkd8N?=
 =?us-ascii?Q?uHtyZOm1jYaAzvw2hv5Ips5h1RrVUK3GWGu7JuYvGCuMjl3vPJj5hbDlu3w2?=
 =?us-ascii?Q?a52AErHlERWC9W1PcscQwjkKWG2NrQ5wSDyVQTuDFxFLDKZ2P9VdNoPO8FDw?=
 =?us-ascii?Q?K8GNB2ONTNuvOIceYHd1yeIh70AyhkCt6+Su/7WYpVZ0B7z0Ptwqm/Z5XH/x?=
 =?us-ascii?Q?cQtwDLWj+Gj8plXySA8k96cKUZ5GviHbCkcagTiP4Qf5+tSdlIueoVqIs2Gh?=
 =?us-ascii?Q?rrsexnGhidW/C9eLfwwyEn9qPk7AIL+AXNB7r06LA40e6B/JZe8bwEsC7RI7?=
 =?us-ascii?Q?ugGX8pe47I7YhhoTz7Eb13QTZAYRi8XPQJH5PXNTR/1lEkc2Kw1IDssStsG9?=
 =?us-ascii?Q?pexaQEFi3fFNos6VPEYIPgA7O+F7skKm+2lyfH53Rotq5ovxl6JCUu/i/b43?=
 =?us-ascii?Q?gLr4M8W9XjRgiqGizjaIXyo4PMrGIRfhuBNz+W800387KcXSnifOU/8RD3cB?=
 =?us-ascii?Q?8WwdB62YdIZ1ORbkMFAj2BPEGUQKJQyZRNjvKz6iRbllOf8euzocIb8Ratv5?=
 =?us-ascii?Q?8URu1Jt6nkpaTSc+X6HQWYLeAdXo87/eGYbsKqTCgAmMdwFCCps4Z+zQ3lhT?=
 =?us-ascii?Q?P4prS73FMWbQTVb0SUtwmaIg2L5Avdmn9Gli8GcdJkECD1/JhefuIhj+YxBj?=
 =?us-ascii?Q?goFSvsDMNITEa21joCMxtr+lgGqiiTDZvlcVVLB462Dd0jyHxmYImQO+i5Po?=
 =?us-ascii?Q?v0isIOe59QhcWV5G6wmTTOiGwc54IBBvZLNKSqBBtK5BMUyVevJLq0LFFQm4?=
 =?us-ascii?Q?a32t7kzfMBEfQ/ucJTKNnlvj/s47QRjbl97lR+30ItHrirnJeiV3kkW/JJdi?=
 =?us-ascii?Q?pLKSTvPd5pwfUZfd5Bw0WQf/XpYTYUsWWqJPCzzU2MOSNUOOyaVST/jZbf6t?=
 =?us-ascii?Q?Wez/bbbZ9hOA7b9uQioyzaZTOkIuodA6sMe0PkKTTXpG5B35QClP51dZrOeq?=
 =?us-ascii?Q?4U8FB671HbPjS3k2G27d+olCoso6ITOd4eTap1ZZv6Q9sUKgDfizQthZ6avN?=
 =?us-ascii?Q?otV0sCt56JuJjKIOd0Jgt16TODsz+V039GRSI4gV1Fwp6zkHZM+6hiPqkigS?=
 =?us-ascii?Q?+3L5eoGH3JDVlsLdHPDpEgOd/H7fLnwzFu/xegfHm8HePqL97fXfsIVDe33B?=
 =?us-ascii?Q?fa6mWcrziACdeYwxkmCF/d3dyPUO3tpNWsL18FfzuefK18pgxK79BYJEtN2v?=
 =?us-ascii?Q?7I4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ncr.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR15MB4480.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a865b58-7111-4bcd-ec9d-08d93b159054
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 15:50:05.0178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ae4df1f7-611e-444f-897e-f964e1205171
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9v2k3CXJa1xnnardxqSDlQadydwjVzwiIB9sGj39cNpgrh0gk0m/Jadt+6aGOZXK5PNwTAYtTuZcudONX42tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4429
X-Proofpoint-ORIG-GUID: D2gdDVs0n5a9YZlFFzCOYtPNmlX9Ei1_
X-Proofpoint-GUID: D2gdDVs0n5a9YZlFFzCOYtPNmlX9Ei1_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_07:2021-06-29,
 2021-06-29 signatures=0
Received-SPF: pass client-ip=148.163.152.55;
 envelope-from=prvs=0814b5e089=harrison.marcks@ncr.com;
 helo=mx0b-00209e01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 13:09:56 -0400
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

From 7a95cd3f827be55153e7e457caa89351c48f247d Mon Sep 17 00:00:00 2001
From: harrison marcks <harrison.marcks@ncr.com>
Date: Tue, 29 Jun 2021 16:50:00 +0100
Subject: [PATCH] crypto tls session: GNUTLS internal buffer is now cleared =
of
 stale data

QEMU Serial devices only request up their "ITL" level. As the GNUTLS is
not a socket proper, if the data on the line exceeds this level then QEMU
won't go back and look for it. The fix adds a watch on the tls channel
that uses an internal gnutls function to check pending records. Then
changes the condition in the tls-channel watch to read from the buffer
again (if there are indeed records still pending)

Signed-off-by: harrison marcks <harrison.marcks@ncr.com>
---
 crypto/tlssession.c         | 18 ++++++++
 crypto/trace-events         |  1 +
 include/crypto/tlssession.h | 28 ++++++++++++
 include/io/channel-tls.h    |  2 +
 io/channel-tls.c            | 89 ++++++++++++++++++++++++++++++++++++-
 io/trace-events             |  7 +++
 6 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index 33203e8ca7..94bd464516 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -457,6 +457,24 @@ qcrypto_tls_session_write(QCryptoTLSSession *session,
 }
=20
=20
+QCryptoTLSSessionRecordStatus
+qcrypto_tls_session_read_check_buffer(QCryptoTLSSession *session)
+{
+    QCryptoTLSSessionRecordStatus status =3D QCRYPTO_TLS_RECORD_EMPTY;
+
+    if (gnutls_record_check_pending(session->handle) > 0) {
+        status =3D QCRYPTO_TLS_RECORDS_PENDING;
+    }
+
+    trace_qcrypto_tls_session_read_check_buffer(
+                                        session
+                                        , status
+                                        , gnutls_record_check_pending(sess=
ion->handle)
+                                        );
+    return status;
+}
+
+
 ssize_t
 qcrypto_tls_session_read(QCryptoTLSSession *session,
                          char *buf,
diff --git a/crypto/trace-events b/crypto/trace-events
index 9e594d30e8..d47edf4050 100644
--- a/crypto/trace-events
+++ b/crypto/trace-events
@@ -21,3 +21,4 @@ qcrypto_tls_creds_x509_load_cert_list(void *creds, const =
char *file) "TLS creds
 # tlssession.c
 qcrypto_tls_session_new(void *session, void *creds, const char *hostname, =
const char *authzid, int endpoint) "TLS session new session=3D%p creds=3D%p=
 hostname=3D%s authzid=3D%s endpoint=3D%d"
 qcrypto_tls_session_check_creds(void *session, const char *status) "TLS se=
ssion check creds session=3D%p status=3D%s"
+qcrypto_tls_session_read_check_buffer(void* session, int status, long reco=
rdsN) "TLS session buffer check session=3D%p status=3D%d records pending=3D=
%ld"
diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index 15b9cef086..4108271d62 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -321,4 +321,32 @@ int qcrypto_tls_session_get_key_size(QCryptoTLSSession=
 *sess,
  */
 char *qcrypto_tls_session_get_peer_name(QCryptoTLSSession *sess);
=20
+/**
+ * QCryptoTLSSessionRecordStatus:
+ * enum definitions for telling outside functions whether
+ * there are "records"/bytes waiting to be read in GNUTLS.
+ *
+ * QCRYPTO_TLS_RECORD_NULL is an empty/init state
+ *
+ */
+typedef enum {
+    QCRYPTO_TLS_RECORD_NULL, /* empty state */
+    QCRYPTO_TLS_RECORD_EMPTY,
+    QCRYPTO_TLS_RECORDS_PENDING
+} QCryptoTLSSessionRecordStatus;
+
+/**
+ * qcrypto_tls_session_read_check_buffer:
+ * @session: the TLS session object
+ *
+ * checks the internal GNUTLS buffer for the remaining bytes and
+ * returns one of:
+ *      QCRYPTO_TLS_RECORD_EMPTY - No pending bytes
+ *      QCRYPTO_TLS_RECORDS_PENDING - pending bytes
+ *
+ * Returns: QCryptoTLSSessionRecordStatus
+ */
+QCryptoTLSSessionRecordStatus
+qcrypto_tls_session_read_check_buffer(QCryptoTLSSession *session);
+
 #endif /* QCRYPTO_TLSSESSION_H */
diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
index fdbdf12feb..401fe786a2 100644
--- a/include/io/channel-tls.h
+++ b/include/io/channel-tls.h
@@ -29,6 +29,7 @@
 #define QIO_CHANNEL_TLS(obj)                                     \
     OBJECT_CHECK(QIOChannelTLS, (obj), TYPE_QIO_CHANNEL_TLS)
=20
+typedef struct QIOChannelTLSSource QIOChannelTLSSource;
 typedef struct QIOChannelTLS QIOChannelTLS;
=20
 /**
@@ -49,6 +50,7 @@ struct QIOChannelTLS {
     QIOChannel *master;
     QCryptoTLSSession *session;
     QIOChannelShutdown shutdown;
+    QIOChannelTLSSource *source;
 };
=20
 /**
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 7ec8ceff2f..77b80f2bf8 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -24,6 +24,12 @@
 #include "io/channel-tls.h"
 #include "trace.h"
=20
+struct QIOChannelTLSSource {
+    GSource parent;
+    GIOCondition condition;
+    QIOChannelTLS *tioc;
+};
+
=20
 static ssize_t qio_channel_tls_write_handler(const char *buf,
                                              size_t len,
@@ -269,6 +275,10 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
         ssize_t ret =3D qcrypto_tls_session_read(tioc->session,
                                                iov[i].iov_base,
                                                iov[i].iov_len);
+        trace_qio_channel_tls_readv_iov_len(tioc->session
+                                            , iov[i].iov_base
+                                            , iov[i].iov_len);
+
         if (ret < 0) {
             if (errno =3D=3D EAGAIN) {
                 if (got) {
@@ -290,6 +300,15 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
             break;
         }
     }
+
+    if (qcrypto_tls_session_read_check_buffer(tioc->session)
+        =3D=3D QCRYPTO_TLS_RECORDS_PENDING) {
+        tioc->source->condition |=3D G_IO_IN;
+        trace_qio_channel_tls_readv_extra_records(tioc->session
+                                                , tioc->source->condition
+                                                , got);
+    }
+
     return got;
 }
=20
@@ -385,12 +404,80 @@ static void qio_channel_tls_set_aio_fd_handler(QIOCha=
nnel *ioc,
     qio_channel_set_aio_fd_handler(tioc->master, ctx, io_read, io_write, o=
paque);
 }
=20
+static gboolean
+qio_channel_tls_source_check(GSource *source);
+
+static gboolean
+qio_channel_tls_source_prepare(GSource *source,
+                                gint *timeout)
+{
+    *timeout =3D -1;
+    trace_qio_channel_tls_source_prepare(source, *timeout);
+    return qio_channel_tls_source_check(source);
+}
+
+static gboolean
+qio_channel_tls_source_check(GSource *source)
+{
+    QIOChannelTLSSource *tsource =3D (QIOChannelTLSSource *)source;
+    trace_qio_channel_tls_source_check(tsource->condition);
+    return (G_IO_IN | G_IO_OUT) & tsource->condition;
+}
+
+static gboolean
+qio_channel_tls_source_dispatch(GSource *source,
+                                   GSourceFunc callback,
+                                   gpointer user_data)
+{
+    QIOChannelFunc func =3D (QIOChannelFunc)callback;
+    QIOChannelTLSSource *tsource =3D (QIOChannelTLSSource *)source;
+    trace_qio_channel_tls_source_dispatch(tsource->tioc
+                            , tsource->condition
+                            , func);
+
+    return (*func)(QIO_CHANNEL(tsource->tioc),
+                   ((G_IO_IN | G_IO_OUT) & tsource->condition),
+                   user_data);
+}
+
+static void
+qio_channel_tls_source_finalize(GSource *source)
+{
+    QIOChannelTLSSource *tsource =3D (QIOChannelTLSSource *)source;
+    trace_qio_channel_tls_source_finalize(tsource, tsource->tioc);
+
+    object_unref(OBJECT(tsource->tioc));
+}
+
+GSourceFuncs qio_channel_tls_source_funcs =3D {
+    qio_channel_tls_source_prepare,
+    qio_channel_tls_source_check,
+    qio_channel_tls_source_dispatch,
+    qio_channel_tls_source_finalize
+};
+
+
 static GSource *qio_channel_tls_create_watch(QIOChannel *ioc,
                                              GIOCondition condition)
 {
     QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(ioc);
=20
-    return qio_channel_create_watch(tioc->master, condition);
+    QIOChannelTLSSource *tsource;
+    GSource *source;
+
+    source =3D g_source_new(&qio_channel_tls_source_funcs,
+                          sizeof(QIOChannelTLSSource));
+    tsource =3D (QIOChannelTLSSource *)source;
+
+    tsource->tioc =3D tioc;
+    tioc->source =3D tsource;
+    object_ref(OBJECT(tioc));
+
+    tsource->condition =3D condition;
+    trace_qio_channel_tls_create_watch(tsource
+                                        , tioc
+                                        , condition);
+    return source;
 }
=20
 QCryptoTLSSession *
diff --git a/io/trace-events b/io/trace-events
index d7bc70b966..2f82c15e68 100644
--- a/io/trace-events
+++ b/io/trace-events
@@ -42,6 +42,13 @@ qio_channel_tls_handshake_fail(void *ioc) "TLS handshake=
 fail ioc=3D%p"
 qio_channel_tls_handshake_complete(void *ioc) "TLS handshake complete ioc=
=3D%p"
 qio_channel_tls_credentials_allow(void *ioc) "TLS credentials allow ioc=3D=
%p"
 qio_channel_tls_credentials_deny(void *ioc) "TLS credentials deny ioc=3D%p=
"
+qio_channel_tls_source_prepare(void *source, int timeout) "TLS source=3D%p=
 prepare timeout=3D%d"
+qio_channel_tls_source_check(int condition) "TLS source condition=3D%d"
+qio_channel_tls_source_dispatch(void* channel_p, int condition, void* func=
) "TLS dispatch source=3D%p condition=3D%d callback func=3D%p"
+qio_channel_tls_source_finalize(void* source_p, void* channel_p) "TLS sour=
ce finalize source=3D%p ioc=3D%p"
+qio_channel_tls_create_watch(void* tsource, void* tioc, int condition) "TL=
S create watch source=3D%p channel=3D%p condition=3D%d"
+qio_channel_tls_readv_extra_records(void* session_p, int condition, long g=
ot) "TLS readv extra recs session=3D%p condition=3D%d got=3D%ld"
+qio_channel_tls_readv_iov_len(void* session_p, void* iov_base, long iov_le=
n) "TLS readv iov len session=3D%p iov_base=3D%p iov_len=3D%ld"
=20
 # channel-websock.c
 qio_channel_websock_new_server(void *ioc, void *master) "Websock new clien=
t ioc=3D%p master=3D%p"
--=20
2.17.1


