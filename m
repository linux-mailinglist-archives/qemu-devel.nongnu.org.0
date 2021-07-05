Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580693BB9FA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:14:51 +0200 (CEST)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kgk-0001BV-Dj
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0820d93ee4=harrison.marcks@ncr.com>)
 id 1m0KfS-0008Cd-Tv
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:13:30 -0400
Received: from mx0a-00209e01.pphosted.com ([148.163.148.55]:23280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0820d93ee4=harrison.marcks@ncr.com>)
 id 1m0KfM-0005pp-5W
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:13:29 -0400
Received: from pps.filterd (m0131214.ppops.net [127.0.0.1])
 by mx0b-00209e01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1659CVs3013475; Mon, 5 Jul 2021 05:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ncr.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pod1119;
 bh=EfrpS/9YBLRq56TPaLPSj2XrdwWIHGo8Y1gHJbKdMkQ=;
 b=f1m1r7L5RZe8Si9OhZNPX2DdXcA19BXYEQxxw5tGtbY0xJ7h+x2VZHeTclLZvikjzuWz
 ar90qkHGdZhU8eDbWxNXSI68a1hwARgjdH312DeXbxUWom8PH5xEjr4yHyp+xYKZ0dGS
 o9eYCn+MhLq49wItlAaTaD8+7rVQ5VTGCLoZrxo0vsOERECKe+fZJXdigOEQN4pVyCY6
 RTHuvTJqdZHUvrL06NojPfrsqYbUw7qoAvyO/0YWbgKtRf84FvB4ddU523bT+cAjDFz6
 T/oQyIV/xBWnEOeWtaBAOKHPANQ7g1L1cmuVfQVqbvTJRBzM6cE/AhsIv3Xcjg9rTpR/ Sw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0b-00209e01.pphosted.com with ESMTP id 39jgnkq0w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 05:13:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3QqtqeuYzCf4HCc++yar7vsmmLzEiPoFBlJbeZpIEc8R0KOTWaH4iII469jM0kmJ1SNDrAYhe9KNjxVrNmDdhLUko//H09GxV+anxkx08qqpTBkvwliPSl7gSTfhvCzEAVmKKIKji8J0wQhu86Kz+/hb0u/925hw8TWgzs5q/7y6a/9Qp+2WYhN2qbYqdY+KyUJrzBlNdMn7o4bl8Bs1G6PBvDULJw95dep07B7KUTM3BVjW+ZWse0meyTz0YYN49vGXIA90d4fo4MTAQUnJKYIUKwEXXJ5fi6lwcgf+62QmkitgC2C/JVfg4Wrz85jpWGoi2eIW32kmy74TFtLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfrpS/9YBLRq56TPaLPSj2XrdwWIHGo8Y1gHJbKdMkQ=;
 b=Z2uJRAZ1GZRJUVeDu3ylzUkPom3Z8t5fxIXbwr6c+Ttr2g2Y6O4WEX2M34HfnZg2xsgO0mLs9uQdXRicVLRjRuHiQ7Ibtfr3N4bLfBgP0X1A765xDgyKWCD6+yb5ElcdbAGU0G3gUZU6QxgQlwxTpXUzjwQazNWw/9s4vMGsz6SJIxy74o0Ne713moIXEom582OCLsTFi4JKA5MPFeLFa19Y2AhsKqfV6PVTg+RBkhnHYZpWq8Mnh3Y82y34vwRIFfwwHw/vZt2gEMQ6cnqkcu0jV1434hK27IALwfxtm0oCKLMwzGDWDJR1ykTl2FSIFrvqaf3PiMbWrga0ZiggDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ncr.com; dmarc=pass action=none header.from=ncr.com; dkim=pass
 header.d=ncr.com; arc=none
Received: from PH0PR15MB4480.namprd15.prod.outlook.com (2603:10b6:510:86::20)
 by PH0PR15MB4831.namprd15.prod.outlook.com (2603:10b6:510:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Mon, 5 Jul
 2021 09:13:18 +0000
Received: from PH0PR15MB4480.namprd15.prod.outlook.com
 ([fe80::552:9c2e:468b:b174]) by PH0PR15MB4480.namprd15.prod.outlook.com
 ([fe80::552:9c2e:468b:b174%7]) with mapi id 15.20.4287.022; Mon, 5 Jul 2021
 09:13:18 +0000
From: "Marcks, Harrison" <Harrison.Marcks@ncr.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "berrange@redhat.com" <berrange@redhat.com>
Subject: RE: [PATCH] crypto tls session: GNUTLS internal buffer is now cleared
 of stale data
Thread-Topic: [PATCH] crypto tls session: GNUTLS internal buffer is now
 cleared of stale data
Thread-Index: Adds/Klex1nS8SMCQH60Coa+YAF4cQEgS7aQ
Date: Mon, 5 Jul 2021 09:13:18 +0000
Message-ID: <PH0PR15MB44806A19D54387A8AB39644EF31C9@PH0PR15MB4480.namprd15.prod.outlook.com>
References: <PH0PR15MB448020F90D7E38336344FF92F3029@PH0PR15MB4480.namprd15.prod.outlook.com>
In-Reply-To: <PH0PR15MB448020F90D7E38336344FF92F3029@PH0PR15MB4480.namprd15.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: a43e3087-044e-4ea9-8240-08d93f952135
x-ms-traffictypediagnostic: PH0PR15MB4831:
x-microsoft-antispam-prvs: <PH0PR15MB483136ED3E30D44C5C0404D7F31C9@PH0PR15MB4831.namprd15.prod.outlook.com>
x-from-ncr-tenant: Processed
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: enOyHyB0xPtqZiwD7f61RZUhdtomf+LrAH68hAgLGzQ78HpE3+WQS5INKCgXKbidsnEL8sN61dQh1jdgpEa/MpSnzFcH8eL+N9zoCwj5m+0BzhBi9I/qVtB3LodIHMwCAePUpn0YVsROo17GTilevqLm4KC/9WUKB51lVxHb3DHu2EP4lfRGVOi5sdQGAtJ3pNyuJfFpFQIjnKAETnjPKDjZ5MfGGb/gKFfFruSXO7ce4fxoZ67jUY7QhIvyyGyDhTVNkOf7YYKHk4Z5nXn7Wl1twUtXMcSrgorLLynyURHKVJyNSb1wz1JpAOrqZHrLDRf5L+kgW8MymgIp0nLD2D1s1Xod2j/VjfteitfQoQPOhUrBhoVzQCldYsbGVYnwDhhRlw1VdmbW5qsfWBSQOvdIjKK5YE9/0k5T4eVAhaoGxHnm5HN4vAFSKIOTCZM4oIxWvsCPqu2wlB/2wuH9T2AA7zQZfxxCmfz9eEgGHqL3OBJ8ckLiGDgryX32yRteZ5fPmVYb3fkEKY9rVrrX3d4v8spG2XYUaz33IFBoJ3WnEWVBK3gEUCQ8LLed9OlMHQ5FyVP4FNM66+E2wO2G4Z43VjNlWfR7WMKMJoZZBqR/6X+F6ctjKBPW3Kq0sqHDZCP6ola23KPxnJD/lG+ES+wmHiukblYS+sMFTA8jp4JEA/f0mKFaEn+oxXQpwn6XbxNHXr2NrFtj7khyhpirphnD7vAsd/sjndLlVchgg/Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR15MB4480.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(66556008)(4326008)(8936002)(186003)(53546011)(5660300002)(38100700002)(66446008)(76116006)(83380400001)(66946007)(8676002)(6506007)(122000001)(64756008)(966005)(66476007)(71200400001)(6916009)(26005)(2906002)(52536014)(55016002)(478600001)(33656002)(316002)(86362001)(9686003)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ozpX8M9EiJe9BuMR13t+f2sJEEcYon/p/ZQUpN3DWaWnGOMLBauMk+RZ/p5K?=
 =?us-ascii?Q?OglbY4NM97yNRRzpOUw7tgrmOIiS22Bqi0Btfm9SR/+uv/rWEk8KkB3PDOtG?=
 =?us-ascii?Q?1KnYWBgrEwDdDlnRxrtUEuXNSxl1DV0sIZGTHCvcd3hJ4PyAlIPLQu1cLqGj?=
 =?us-ascii?Q?Pb6mvOeNH9qgJSb5UQ1Y6IMO7BQj3f9ON3BIkh3ZuEeXc8NYGevZpJgKx5+g?=
 =?us-ascii?Q?SSZNjXR5lZp4uZpyMATsEdgs75MPKRgak/gPL6/Ynkkg6Yz7Ab8yqviFX1V3?=
 =?us-ascii?Q?HV4aR8bfCxB3r/5kzMCubH+1o5mknzQo3ZfrjQ2OWV9B4Ha+tRC3habJFDVq?=
 =?us-ascii?Q?VLN463twyQLbD2LmlnqpI4Aq25O2JX45v9Yqg5kVGjdXQyUQ1JbsLdSrjkGX?=
 =?us-ascii?Q?GhEGU5iWvyPD9XO5/IePqL5lHC+/9sKDxBmHeZ0NvCbDCP3sZVeqAGNN9QoF?=
 =?us-ascii?Q?sbBdIvA1KJMbUgeyLse4VNAr1YBJGAiV5vPvCjExtT/2UyfUX6RD1GMLgd4B?=
 =?us-ascii?Q?8YL0XhXFleh5hugVjVGbeLjzcB2LBy/RNUeqPU7XInM3SmqDad1DTocqDEyr?=
 =?us-ascii?Q?rM7AzB/8okZstgMAI2NATtfxGk5e8iip6fYGVYyW6iJ9SnmMF960RpbAq/Y5?=
 =?us-ascii?Q?1eUeIS76cjp1r6T9bVISrqZdnnUKLqQ3LHgLQIQKnOXOvOlJDehvXzUMeld4?=
 =?us-ascii?Q?PP/MJUYpf6ABvma5wXp7N8CJsQlumE3apgK16w51AFRhDdZhCWvA1q/RLVeA?=
 =?us-ascii?Q?mGU3/tTM60rIjL4YZP27l8tkz6dmFm6NJtr8k4WS2JBSvJzsRz0ojkdu99o7?=
 =?us-ascii?Q?jNt96PnWnc4Uu3S1jHDZRqlarQy0Nsky0K6pkOz7w190REGlHtTi+7wNmqcK?=
 =?us-ascii?Q?gKqMg7t3iyuOM5TkkM1kTali5XsorD1A7XcYe/CxUUdAxJzyl6+Sltm4eMeU?=
 =?us-ascii?Q?42keySC3FOZxy7HdCLL3Xsv13qqSSlO9Kq198lfm/g3wwWbhKKiClIlULr5n?=
 =?us-ascii?Q?fibZlRnu8wyksxm9w6HFOes7I2/IEnnJ5pB3ttQsA7Ym26zcZpBVlw9qmC41?=
 =?us-ascii?Q?vDkFYUcBBWxzZSchmkzwLzB87BnjpYqvZ5l0tT9xAWJZj9KXsD9KeVoNqa/Z?=
 =?us-ascii?Q?loWls1NlNX9YqSbZSNoygryrvWyKnPYeuBRM2BlAfkpduj1kATX0kmXQ96vw?=
 =?us-ascii?Q?M/5iP1IjBfmfl/knb94rIobkK9DuU0bRKkLyIOE+Z4QI4TwW7uEV5qCTI+ix?=
 =?us-ascii?Q?w1cnZUlnDcd/fRHyLv+12UCgqO145Fc7b8HveX+MJwhQmgvYh24kTPtYGJx7?=
 =?us-ascii?Q?UzE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ncr.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR15MB4480.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43e3087-044e-4ea9-8240-08d93f952135
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 09:13:18.8073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ae4df1f7-611e-444f-897e-f964e1205171
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqb/0SwyVHYQDRVXV/J6YwEE9ksyuiIKgMn236/bY+UnpsPe90YqMtAduOiXfeVg0+N/LyKnqon8nYKqGgjd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4831
X-Proofpoint-GUID: -mK6FwZS2mlq5zHCMtQfi1scUmdzz_Bf
X-Proofpoint-ORIG-GUID: -mK6FwZS2mlq5zHCMtQfi1scUmdzz_Bf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_04:2021-07-02,
 2021-07-05 signatures=0
Received-SPF: pass client-ip=148.163.148.55;
 envelope-from=prvs=0820d93ee4=harrison.marcks@ncr.com;
 helo=mx0a-00209e01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

ping
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg07713.html

-----Original Message-----
From: Marcks, Harrison <Harrison.Marcks@ncr.com>=20
Sent: 29 June 2021 16:50
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com; Marcks, Harrison <Harrison.Marcks@ncr.com>
Subject: [PATCH] crypto tls session: GNUTLS internal buffer is now cleared =
of stale data

From 7a95cd3f827be55153e7e457caa89351c48f247d Mon Sep 17 00:00:00 2001
From: harrison marcks <harrison.marcks@ncr.com>
Date: Tue, 29 Jun 2021 16:50:00 +0100
Subject: [PATCH] crypto tls session: GNUTLS internal buffer is now cleared =
of  stale data

QEMU Serial devices only request up their "ITL" level. As the GNUTLS is not=
 a socket proper, if the data on the line exceeds this level then QEMU won'=
t go back and look for it. The fix adds a watch on the tls channel that use=
s an internal gnutls function to check pending records. Then changes the co=
ndition in the tls-channel watch to read from the buffer again (if there ar=
e indeed records still pending)

Signed-off-by: harrison marcks <harrison.marcks@ncr.com>
---
 crypto/tlssession.c         | 18 ++++++++
 crypto/trace-events         |  1 +
 include/crypto/tlssession.h | 28 ++++++++++++
 include/io/channel-tls.h    |  2 +
 io/channel-tls.c            | 89 ++++++++++++++++++++++++++++++++++++-
 io/trace-events             |  7 +++
 6 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/crypto/tlssession.c b/crypto/tlssession.c index 33203e8ca7..94=
bd464516 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -457,6 +457,24 @@ qcrypto_tls_session_write(QCryptoTLSSession *session, =
 }
=20
=20
+QCryptoTLSSessionRecordStatus
+qcrypto_tls_session_read_check_buffer(QCryptoTLSSession *session) {
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
diff --git a/crypto/trace-events b/crypto/trace-events index 9e594d30e8..d4=
7edf4050 100644
--- a/crypto/trace-events
+++ b/crypto/trace-events
@@ -21,3 +21,4 @@ qcrypto_tls_creds_x509_load_cert_list(void *creds, const =
char *file) "TLS creds  # tlssession.c  qcrypto_tls_session_new(void *sessi=
on, void *creds, const char *hostname, const char *authzid, int endpoint) "=
TLS session new session=3D%p creds=3D%p hostname=3D%s authzid=3D%s endpoint=
=3D%d"
 qcrypto_tls_session_check_creds(void *session, const char *status) "TLS se=
ssion check creds session=3D%p status=3D%s"
+qcrypto_tls_session_read_check_buffer(void* session, int status, long reco=
rdsN) "TLS session buffer check session=3D%p status=3D%d records pending=3D=
%ld"
diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h inde=
x 15b9cef086..4108271d62 100644
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
+ * Returns: QCryptoTLSSessionRecordStatus  */=20
+QCryptoTLSSessionRecordStatus=20
+qcrypto_tls_session_read_check_buffer(QCryptoTLSSession *session);
+
 #endif /* QCRYPTO_TLSSESSION_H */
diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h index fdbd=
f12feb..401fe786a2 100644
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
diff --git a/io/channel-tls.c b/io/channel-tls.c index 7ec8ceff2f..77b80f2b=
f8 100644
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
                                              size_t len, @@ -269,6 +275,10=
 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
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
paque);  }
=20
+static gboolean
+qio_channel_tls_source_check(GSource *source);
+
+static gboolean
+qio_channel_tls_source_prepare(GSource *source,
+                                gint *timeout) {
+    *timeout =3D -1;
+    trace_qio_channel_tls_source_prepare(source, *timeout);
+    return qio_channel_tls_source_check(source);
+}
+
+static gboolean
+qio_channel_tls_source_check(GSource *source) {
+    QIOChannelTLSSource *tsource =3D (QIOChannelTLSSource *)source;
+    trace_qio_channel_tls_source_check(tsource->condition);
+    return (G_IO_IN | G_IO_OUT) & tsource->condition; }
+
+static gboolean
+qio_channel_tls_source_dispatch(GSource *source,
+                                   GSourceFunc callback,
+                                   gpointer user_data) {
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
+qio_channel_tls_source_finalize(GSource *source) {
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
                                              GIOCondition condition)  {
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
diff --git a/io/trace-events b/io/trace-events index d7bc70b966..2f82c15e68=
 100644
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
--
2.17.1


