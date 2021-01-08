Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB382EED77
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:33:35 +0100 (CET)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxlL3-0005Cj-NN
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlK0-0004kc-5b
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:32:28 -0500
Received: from mail-oln040092255099.outbound.protection.outlook.com
 ([40.92.255.99]:37484 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxlJx-0004d5-Ko
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:32:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph4FsoLh+HNuSQ3q7PHtqvUWnmmWvq/F48+5zp5sYXIdvH6d338bF4LT07ORzUYOk6khioj1mtr1TD2Jw6CebefrpCDVHeqDJEVUrsjrcm/LBmPpxKtdMXEZeaAdZa6ejX92F2ScykNY82+wh97MinOFsJmQ8lgL/KqqKhoFDIr8GWcoT9ziepp8B+j5UCFEYlYbnec4+Qlg8Knp8kGgddOIvN4a9ZYN9LeWuyqfJD5oV0TY1OXklmhTMu5V/DWcw0Swr+6MMU+tsYTc3YxFHoHQqKvj7yZrTs80LZYa9Rg22hcLvV8nweSm7HTS8ykfl4pEg85gUfAJBQLOphZg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXK3CKbkwUJVuUPzUKzkvtTA4dnUJYtWkWesIU/HkkY=;
 b=b6h//bx07FLij/oFCI4Q2va5GZayCKTh4493jiRZrrEIk3Y0URda4CER+rwYO1NbkkPFwenib5aWgOaU0MxaPL5TXOqZ+aOeEGoR3726dYRV8wM7eTyLIsKw9ph9fbrhNyDymbV4huoAxaMq0wjwPcS6ZsCM6Rwn9NBCfj7LvCS4E3WF0Tin08B3G6PzKSdLoD9bn4N/qO+1eUtbBAUHnTDzAj8UROJfoAZ7VaE6U/cBf1FQpD7sNO/RivoMiLnSzfFUv+XsYSq3Qdt+w9gd2szkbzdh7hzWcRtNl7r2qYmwnsdZv+FxCO42I5FDWYzsLTaItT26nkkXcwQoegsJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXK3CKbkwUJVuUPzUKzkvtTA4dnUJYtWkWesIU/HkkY=;
 b=TG0AsWjawRbvVv2F6Usur+I5fnQFxeK4RHpeYUZ4d1i8IcKFHErQ7KMfNEdV0NV4h+WkLshHsg0hcdf+763biqpkWr9OzJYTZoycw74irOoZQcBS0cnxyIlm5pLu3OEIlXHhoxbyeG/S/oEiJS0fSt1PH+rd8WKLrIQAwOwqUBCSNbdbBKDOPAJbsRd6nBuczv1v2F81UvNRhIPNInGVUQ9Ta7fWOAragXw9FSLWuAVXdJlrwZcJ9lpiv6zFnllSZGMHP6f+QI1Iyj8nXxMy8/6hxAxJoywYT9uaY0VxfsAncz+TZm1OAiotFeOAEIAYNDxFDFbt9gbYmDjigHhkiQ==
Received: from HK2APC01FT027.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::42) by
 HK2APC01HT186.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::297)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:32:15 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::46) by HK2APC01FT027.mail.protection.outlook.com
 (2a01:111:e400:7ebc::179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24 via Frontend
 Transport; Fri, 8 Jan 2021 06:32:15 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:58113F4F9A221870D51310C9D657746AB19A50733E78F465EFA8EBB5AF8CD5CB;
 UpperCasedChecksum:F201285D7744BF76AA0828C8656B8800BF7BFBD911BF0A995A10040971D5BD45;
 SizeAsReceived:7467; Count:45
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:32:14 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v6 0/7] fuzz: improve crash case minimization
Date: Fri,  8 Jan 2021 14:32:03 +0800
Message-ID: <MEAPR01MB349467055C8DBCB7743E4283FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [dDcTs2ypmDHt988u+ny5uY+E+OLLScByFX1I5UNFEVpW0htQiR0gWlh96QPyk8U8]
X-ClientProxiedBy: TYCPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:1::21) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108063203.16861-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:10c6:c22f:85d6:f9d) by
 TYCPR01CA0033.jpnprd01.prod.outlook.com (2603:1096:405:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:32:13 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6091d45a-b993-4d91-f4c0-08d8b39f232d
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNUOze3FI6XN1n/uGT+rrP37g4KA8Afldo98DV4aMBsBy6rGli4yycWkKn7oXpxWNPoY6JeW8/jgryfy+/D/4+wdSQNFjq9eFWUPg5uYsSanxYTRCfggWIXdyyy95vUNIZtJ4qcFhhCoCvCMlSguXw1l979sxu3bZtBFNTsMM6muelc3qZKb3Wme8VToCu3lkZGIaUdO+HFdRAFJ5HPa3ndSFjQDrdsvgZMdotEDR2xmTitqj8GhwU1P62TX8w+2RvdqAjIjyrNBsNQ0wSqgbw6vmwrHN0B2CzTQe5e6ScPSJPSSdY9X/jqbWBs7qvk5fVog7tCURzrOMV9ow/nURxf+houkrMVSpYWXtktcdcsD/C/iIHYSFUJIV+eX6kR3ms1qqpJzHVD0sIWYIUpJnfY6/OmqNF+foCTIOf70f/r1fco+w3dNEfAqumIbfH1f5A1OeYfQvpwC4doL/0BtnxiB4h75fPcvhTaC4aR+t/OO4neWglKhq9z1btBtb0np8G2E8huTtaGAzB1MwM7j3gAh/bsSjbVbYSlJgztFWLuJY+oEJfjsT4c3uLbCidXhRiSZ5izu+p/3NfhYVxOuPV27c7Tg3kCvong6JitoNd9/iGRfKHikUXBC9vTh0Nq4SCL+QeSlz+IwoC4PREDzmKLTsY6N1ZT4iqNkSwG8LGUTP90UrzQAorrB9iKraz6xH7mpUoaarsyIV8m57Ts9mJuib7PaNYBAFds=
X-MS-TrafficTypeDiagnostic: HK2APC01HT186:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0o1+LigS2Blfn7xeElnboXS8vVbNcwDf97n6TEJ5NYrGpoMkDdasFuuJtkpH69TDZCMs7M1qg6FLcazNWx605k7ume2G5wxcWuY+NHvK6JdqXkQ+4oHYyi6zGY+3G1CoalLFg4sf6We+xx6TToghIIQigXE9pZqnmKoDbULSVOkZQK/JHzzQm4f630yATWm62GKFnft4kIq2gnBRWG072kywQBlOAL+ChdwyInwgWdBpcqnXAW6BocQ639R6nMa6
X-MS-Exchange-AntiSpam-MessageData: PQGTX0qoNtnw1FarKNTlGNb/cdQQcmPghGCHnQGBDPXjgsaVUMqH6rAT5WpGH5HK3mby+RCdYx1q3I3VH95kju4Dv6LSjKXSxCIGoawxXMzVwAIO8xaBp8wC5uUPHGpsGdlauM2BnXLPE11nkGF60YhzwSkNFC+OybxUJgTkdFIOqNsP/ZLHuKJ2pg556XdcI+eElWz49n0LhFjInlSjbQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:32:14.3761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 6091d45a-b993-4d91-f4c0-08d8b39f232d
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT186
Received-SPF: pass client-ip=40.92.255.99; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend and refine the crash case minimization process.

Test input:
  Bug 1909261 full_reproducer
  6500 QTest instructions (write mostly)

Refined (-M1 minimization level) vs. Original version:
  real  38m31.942s  <-- real  532m57.192s
  user  28m18.188s  <-- user  89m0.536s
  sys   12m42.239s  <-- sys   50m33.074s
  2558 instructions <-- 2846 instructions

Test Enviroment:
  i7-8550U, 16GB LPDDR3, SSD 
  Ubuntu 20.04.1 5.4.0-58-generic x86_64
  Python 3.8.5

v6:
  Fix: add Reviewed-by and Tested-by tags

v5:
  Fix: send SIGKILL on timeout
  Fix: rename minimization functions

v4:
  Fix: messy diff in [PATCH v3 4/7]

v3:
  Fix: checkpatch.pl errors

v2: 
  New: [PATCH v2 1/7]
  New: [PATCH v2 2/7]
  New: [PATCH v2 4/7]
  New: [PATCH v2 6/7]
  New: [PATCH v2 7/7]
  Fix: [PATCH 2/4] split using binary approach
  Fix: [PATCH 3/4] typo in comments
  Discard: [PATCH 1/4] the hardcoded regex match for crash detection
  Discard: [PATCH 4/4] the delaying minimizer
  
Thanks for the suggestions from:
  Alexander Bulekov

Qiuhao Li (7):
  fuzz: accelerate non-crash detection
  fuzz: double the IOs to remove for every loop
  fuzz: split write operand using binary approach
  fuzz: remove IO commands iteratively
  fuzz: set bits in operand of write/out to zero
  fuzz: add minimization options
  fuzz: heuristic split write based on past IOs

 scripts/oss-fuzz/minimize_qtest_trace.py | 257 ++++++++++++++++++-----
 1 file changed, 210 insertions(+), 47 deletions(-)

-- 
2.25.1


