Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870713F9CE4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 18:53:14 +0200 (CEST)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJf6P-0003k3-Ke
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 12:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mJf43-0002Kb-DX
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:50:48 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:49568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mJf40-0006Oj-EY
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:50:47 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17RFpP61006291;
 Fri, 27 Aug 2021 09:50:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=f3Kwpyo03YMiiV7q/BoojQVsRJZabb97uysPy/GQqd0=;
 b=ii0lamc4pPsnREXm//n0fqm0kk5Wx+pE87Ygn/UFz1/tYdr/6JA9uafhZFzH9g2kkwXL
 0DgoEIBzY2HONmlnI16R7KDNSAv76wrK0PeCeWfiWLqyNTj8SOdVMvn6uZltVOOBUGL+
 YTNv8HQ3MZL3ho7YBZi9yYcqpt7SoT3Mc3il3jD6gHuAYHVEpE+bn0+KzD65QVLt/cHW
 hAxpHq5lTwpIrGfOD8pRK1cfq59d6tLT4rz3sXGsF3i05FRDEyx+Lrml3xNTEPd1Qn2N
 2Y4CPWQIwRcMUAS1o7T6zZdaBdh1YG67ON0eEHBkfWi2270GHAWdBUfXRlMfan/gyQGa bQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44] (may be
 forged)) by mx0a-002c1b01.pphosted.com with ESMTP id 3apusf8xnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 09:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apSlwlsmB1y9Z0DvbZTfGMSPSegv6s76r4t5NMagAqMcurSmq+NEQIZ29R3sQ4zH3GZX9RJoMKzh6EZsxviDZPJVDzwtrjBIi7DuXDufUmvBDAG+RWOULOnhG0v3r0BarWDA19eJWYPEU3P4k8Rui53iBcNqjdtvaNKFIySZLsXBFzspmXL72lERqVpQFvbVcP5nbxa3qU72nhXGjB4vvwL2k5t9fHyFoJeqa6WPqnIv1eReDCk68GLzB3E9BKg72eS2/oR4J3YA/9Q9976CzPJOBij2XdX39BfPGellOCcfCQHky94tuc1wTHrdnE/Eq7s+Iti46e7hj+krtSxZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3Kwpyo03YMiiV7q/BoojQVsRJZabb97uysPy/GQqd0=;
 b=NUM4CYoI/vRPNqs3x9DoDUWQ4Wqz0QcaWDbeys7a8CCHQUY9JuXtUb4oFGZcJ4tsMYSQiY/PaC+bxYozF8q6Vvvq7JWHVD58q8zd3BRKY4w5e52L6Bbyp7If31tWlxizGn8BO8Bre192pGCMdiLNonlKUFnrQ3Mkxe5QTEqvf0u1QmHQc8CWnG6G4CcIr6SIAQW0YCtVm8x891rz7VjPqEL0CeCxSfCvN6qqoCOxaitfMNOoyW59mKSwM2wTsoU2kDoS/chCnLLaqQ3UODWr77OqMGpM9IHzjgevzQb/yYJjriXPP2DLmRlqd14s5/clHEZn+azoJE54mrJxVQmGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM6PR02MB4539.namprd02.prod.outlook.com (2603:10b6:5:2d::12) by
 DM5PR02MB3717.namprd02.prod.outlook.com (2603:10b6:4:af::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Fri, 27 Aug 2021 16:50:36 +0000
Received: from DM6PR02MB4539.namprd02.prod.outlook.com
 ([fe80::84d9:8819:4e4d:e73d]) by DM6PR02MB4539.namprd02.prod.outlook.com
 ([fe80::84d9:8819:4e4d:e73d%5]) with mapi id 15.20.4457.020; Fri, 27 Aug 2021
 16:50:35 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "mst@redhat.com" <mst@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: [PATCH 1/2] storage-daemon: add opt to print when initialized
Thread-Topic: [PATCH 1/2] storage-daemon: add opt to print when initialized
Thread-Index: AQHXm2Oo61Tm7fDuAkWMts24tps1Kg==
Date: Fri, 27 Aug 2021 16:50:35 +0000
Message-ID: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e54cba8a-4e76-42d1-97c1-08d9697acadb
x-ms-traffictypediagnostic: DM5PR02MB3717:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB3717073824C2ADC1577ED9D7EAC89@DM5PR02MB3717.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zTTJYAX7n6Ju6EQLyLx7ju/QLXrMDhn9lVdCRa/VsOEVDIvotezYSBOQhjWrro34eXV9Oaj+Vww6bBgaIkvXcKdCKGibm0GFH2AgDiy+AN98sKVMGJDEUka1559C1i4HV5c+q5+tBdlQO+ruQCi33UKkua/yyljHUU1+HCIT0KmcZI8+0dIggTB4+GJgi9Z452RHftLKqZU53AgOm+272y0d6hLdQuI6JvKC1zsxhe29nmpIvxuYK452FCxIq1Blc54LMzQe4YtP/EEO+47wEiUzcRo9RFvZXB7RYb3MJifJ3NS7yXr0TkCzcxn95QVpbA2Lcbszb9t+ivESBqI7yLymAFyjMxlMVprkP3bB0sk+GCow+LoUCNRJVFu33WN8h78ZW9qGfO2WIGAXydIA3cCq335TLkPXHIW4Ut7PfM4PNd1cs4iOczykVHNJguj95UB4vIsK/ZYont1FoNl8w0mE4D1jgZZEpLCiUcATYcCb33wQYbx8ouOqmOhcG9ug7kZitGekmxG33moju1bv42AXiWK7qrcdMLHLWuSUHvQt0gaxw6g8n40vWMGULAxQki+/4jro3dDt+j1RTDXzNKPuqxyehCygjz8mj48PRusuDcRY1FUjZGTdG4KMH74Nu+z7+d/Vi95F8HyJ7Admnv/06Evm4cSQlQthZWzEQ9n7KfgWOkJJsFqjk0c7OqGaJuGYS/QHsii8ALRVgQNa7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB4539.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(39860400002)(366004)(346002)(122000001)(71200400001)(110136005)(64756008)(36756003)(6512007)(66476007)(4326008)(38100700002)(66556008)(26005)(8676002)(107886003)(83380400001)(44832011)(316002)(91956017)(2616005)(478600001)(6506007)(66446008)(38070700005)(66946007)(8936002)(6486002)(86362001)(5660300002)(76116006)(2906002)(186003)(1076003)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NbihPPl4OjUIDra8Sv2aqCMDLSK/IONedijDVszu+rGvUa8H9nAcn+C+nG?=
 =?iso-8859-1?Q?yH6j9whcFyv7u/jhKgUXXb0V3vGdFb+efMbfcRFIWgBf341VLrztbbqKRR?=
 =?iso-8859-1?Q?7f/SXvX9Wst61J/qBK2Mz2i518Vp0d5I7rimZANyu/RNGQM60jT1mlF9lJ?=
 =?iso-8859-1?Q?+0Xh4wT1xfqQUasgZ8fMvaUZTd0L92gFXeln6aV6rf+SjkUCcgwj/yx8Or?=
 =?iso-8859-1?Q?AYA2XM+zry3VL/dYXxyrUopFAZ/682C7ULkkC3z+XHZ0UQSucGWybYNjMR?=
 =?iso-8859-1?Q?f3p1+I0ym54UFc5gd6j5y699tliswT4AzXIQx7PB2A/lKbu0LWtYuFUznn?=
 =?iso-8859-1?Q?LB6UKd5G4ci2TttLtzH98QXvYxBWlKRRfSm67lEozFh85b+g1oTZMrr21D?=
 =?iso-8859-1?Q?8oZGSFZRPfoKGmLCNaMT0H6u+CnD5HZe6f5CsA2cVAduiOusT7SkltCYXW?=
 =?iso-8859-1?Q?CBaq9rV27oOCtIltUTya+ju3j2Cqqo1JAUVozAbHr+dh3OusJdlNgAFj+I?=
 =?iso-8859-1?Q?uiC61ecwTVc17+MrXJwvjedUWewPBG/Wxm4jgWs/fdO5/LaEDY8MbjNWCi?=
 =?iso-8859-1?Q?DSmntULst53boT8ZReQ2a1g2L/UVAkcjM/oXCc4dndAeH/hbC0+Tqb5A94?=
 =?iso-8859-1?Q?ArDk4Gyev51lRByvBPSoAg0GhvhjvgyacwCzw1GqkZAYJrLkm6qCAqsiZA?=
 =?iso-8859-1?Q?YUUtG1G/+UAcU6AlrUge7yGsQwhP1RyxTeoAr2/ttAGcxdpub0MEaRaKF8?=
 =?iso-8859-1?Q?WgOdOfoGEwl9jyJ63jvorUDu5+EttxM1T3UpMY++A7p+/rPpohxuaKxV9v?=
 =?iso-8859-1?Q?ZNcQulxjf+qfmEDprtv0HAOkepovmzAM+gtdIrtMIUhUGuZJ2nquTT4hgj?=
 =?iso-8859-1?Q?hCT5O5Oc2iFhbhkGIfsk0gBUxXNE90NMFZvVdkHsYJXtQhQvTrEF59kUg2?=
 =?iso-8859-1?Q?LML+umMM+JWeKb+02QHlQrAG7v9e8POg35erDhLS2tp5cjuOrv1UPw8LwY?=
 =?iso-8859-1?Q?hWNU7VS4Ct7nDnNBxFwyGeUApMnHS0RIpSHrCLMvjBluhuf/B3w4bTjF2Q?=
 =?iso-8859-1?Q?BhnKIg5T5Q11RkzcQe8dd35X0cVc66YTRnzpD4uIA73GaER47L/51P2yUn?=
 =?iso-8859-1?Q?F5pP0n7xsyP5wRtsZPZMKZxkm1Y8r0Ljgc4aXVq4ssBLIDHYkZpCMc7j8x?=
 =?iso-8859-1?Q?kRPEVRsRwZdON2xWfeitrj+akh1YS84AWxct54K3NYDp6rhEg//n8kiOAt?=
 =?iso-8859-1?Q?Go+ebfef9T1GIerpA/2R3LHrZfd/BBS3yQCvk0RjH9s37XAWKU3oBs8Qg2?=
 =?iso-8859-1?Q?oIxwFzlbQ3fuvvH1hKkJddcSu3lIPgu5LRTNj6FdnCXpAuNX3VflYwowH/?=
 =?iso-8859-1?Q?Hb8UbvWyqdrkx1q+zFThzAeR/S1s8VHg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4539.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54cba8a-4e76-42d1-97c1-08d9697acadb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 16:50:35.9331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BbFTY4c8FEQe4BE1VSSogSeA15ag0tXuQa6CttiTS9sPGIA8gtpR/DF3KgPRb4TcgVhMwhh5AhkoAI+ra/77TKK5sXBUWHidRu/AwE4/Uog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3717
X-Proofpoint-ORIG-GUID: u2Clyb1sMcA_isyJhOYyhbZkCVLjUy54
X-Proofpoint-GUID: u2Clyb1sMcA_isyJhOYyhbZkCVLjUy54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-27_05,2021-08-26_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change adds a command line option to print a line to standard out
when the storage daemon has completed initialization and is ready to
serve client connections.

This option will be used to resolve a hang in the vhost-user-blk-test.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 storage-daemon/qemu-storage-daemon.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-sto=
rage-daemon.c
index fc8b150629..c4f76d1564 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -61,6 +61,9 @@
=20
 static const char *pid_file;
 static volatile bool exit_requested =3D false;
+static bool print_setup;
+
+const char *init_msg =3D "Block exports setup\n";
=20
 void qemu_system_killed(int signal, pid_t pid)
 {
@@ -82,6 +85,7 @@ static void help(void)
 "  -T, --trace [[enable=3D]<pattern>][,events=3D<file>][,file=3D<file>]\n"
 "                         specify tracing options\n"
 "  -V, --version          output version information and exit\n"
+"  -P, --printset         print to stdout once server is fully initialized=
\n"
 "\n"
 "  --blockdev [driver=3D]<driver>[,node-name=3D<N>][,discard=3Dignore|unma=
p]\n"
 "             [,cache.direct=3Don|off][,cache.no-flush=3Don|off]\n"
@@ -174,6 +178,7 @@ static void process_options(int argc, char *argv[])
         {"nbd-server", required_argument, NULL, OPTION_NBD_SERVER},
         {"object", required_argument, NULL, OPTION_OBJECT},
         {"pidfile", required_argument, NULL, OPTION_PIDFILE},
+        {"printset", no_argument, NULL, 'P'},
         {"trace", required_argument, NULL, 'T'},
         {"version", no_argument, NULL, 'V'},
         {0, 0, 0, 0}
@@ -195,6 +200,9 @@ static void process_options(int argc, char *argv[])
             trace_opt_parse(optarg);
             trace_init_file();
             break;
+        case 'P':
+            print_setup =3D true;
+            break;
         case 'V':
             printf("qemu-storage-daemon version "
                    QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
@@ -310,6 +318,7 @@ static void pid_file_init(void)
=20
 int main(int argc, char *argv[])
 {
+    int err;
 #ifdef CONFIG_POSIX
     signal(SIGPIPE, SIG_IGN);
 #endif
@@ -341,6 +350,18 @@ int main(int argc, char *argv[])
      */
     pid_file_init();
=20
+    /*
+     * If requested to pipe output once exports are initialized, print to
+     * stdout.
+     */
+    if (print_setup) {
+        err =3D write(1, init_msg, strlen(init_msg));
+        if (err =3D=3D -1) {
+            fprintf(stderr, "Write to pipe failed: %m\n");
+            return -1;
+        }
+    }
+
     while (!exit_requested) {
         main_loop_wait(false);
     }
--=20
2.20.1

