Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44836E54EF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 01:03:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poXre-0001pi-0H; Mon, 17 Apr 2023 19:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <satyeshwar.singh@intel.com>)
 id 1poXrZ-0001pE-AZ
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 19:02:21 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <satyeshwar.singh@intel.com>)
 id 1poXrV-0003Sw-0K
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 19:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681772537; x=1713308537;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=GDS02XrzZjDPLMQVPcWuhrJXPzBYmyiNr9dsQHx/lAI=;
 b=If3VVmqFieQSCgaPTnV0othFmGNSIAHALYlkQNTsHvf6+9FKtZvnzMEp
 HLXDH2ZC7WC0+cKhEO7NlJuYrTRZRenC/sgCCEEONUmD6n05c8l8LZ1IB
 kVyV9mTnkn4/FAnZ3v9/2fVzcvKWQuUjmTWrvrPQvHUcqlh84TCwKrcv6
 rzVyrOEe7JagEBTewb/JSnxt57lVEsxJoICuKOF6SFvCXc0wJvHlGc3s4
 5nCTU/42GgsszwnRA4cKB/t3GtO5NqUyyTuVyBCggPocIDC4/iGLvi4su
 N3qL0qXmkwm3UJly5+I3MSf9iodaTu5dchayp75RxGizhHqHZnqpxgZfS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325366164"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="325366164"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 16:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="937028703"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="937028703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2023 16:02:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 16:02:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 16:02:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 16:02:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 16:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKQank5iQLv/36Az3MOOdtk8MXjrTraI836Vy497SGZm/2gzjEwvZL6r29PThWHOvqWTznAgfbK2NSDtlXZiv0GxoIZN8gY1gpEHrZJB1MepvX8Da/Du0tzCh93fH0Bz3rVefohe1rNDTmtWsIUS4aXvzLlwqfzAR1TxacUX0rNqjJ7W+swd3Wa42nMBm5Tnjo1Ukqi7giIin9QcXL7ScTRWUJigJtuvx1XvY9lT7y+8sDm79kso++R2VUGlR8ARn3IHBivNAcwOM9tITuRi8h+1su8m0BzFCs79EC8qWlG+vMK75tO2ux2voDqe/g26RJeBFZE8wiP7Qv5B51XzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9eF/HKoaaHVsjXGSwD1noLYQBlUpgoAA4tjfs3VH8c=;
 b=QWyNRFpMO0Ty5omNekn37XL2h07yjlYr0LWudA+QuGDaa76eDbFaCgXvMaujqY9QbdKOKmmFMBclmJtbXXyCqD4pV7pQwiMJbEne6nqHf49OtGEOpkXK044mbtS7u7A18kJlwARKNcyw8VoynDxIJ71nxXLjHQJXfLBkn9qMiDl7wwD4lFGb4sUupDmANX5Cj+Yg1MhmbGo2+agSb0K0olyjxyZaC/8mDHyaGg2tYJT5F4GesEOFmzdVZXGUZxA/31LUIPAri2Q6cwfASU28PsH8yjWzAEvTKZzgWjS+CSgYMMbxwaLM9O7kA8x6o4rNeqlxnSCb3EwVfMh9eJrQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 23:02:00 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::3b02:a1f2:7877:7824]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::3b02:a1f2:7877:7824%9]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 23:02:00 +0000
From: "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Subject: [PATCH 1/1] ui/gtk: Added a no-input mode
Thread-Topic: [PATCH 1/1] ui/gtk: Added a no-input mode
Thread-Index: AdlxgI6fDzEaZqo1SiyCN4rHDqCPiA==
Date: Mon, 17 Apr 2023 23:02:00 +0000
Message-ID: <MW3PR11MB46848D06ADD48751C810EE769F9C9@MW3PR11MB4684.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4684:EE_|DM8PR11MB5670:EE_
x-ms-office365-filtering-correlation-id: 6f36693b-a6af-4bbb-e5bf-08db3f97c05c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q6iLlNqcd44TkjKy7cDgj2jSq32nvhO2pCgeSh/C4wcpWYYld2Mr0ijo3ZD0zidlCuGNvYWRnWmJerD5wuoZ/JrE0q9LnJEqyEZ7W9k2AuWKtrywJXNBKPKCA/IjjEEtmADoaQJYXyVXSPu7qhAkdBEha5mmhmJJqVdjToUyrvDq7G/saGWBIntbsYuhXkOW2hGlQ5EyUcx9aqzzKg1V010I9KmkvZpWkoIz1T3bZ6u8aP58IedDMu4ulFsxUF8S5AuSz1f7das0dQZbEEzkwLpfZY6IOc6bklqOsUBnf93ekvHj4pQbtxAyNZflxC+V3Lyuz1nFimqibl9HStE6vh+fY2K69TcOUekFcDgbfVzIv0UvzRejtzG+yKPyBE7YuQGGNw7rIIenBLZ4QPKJ6RcRcmBQeDEJYoqyrxm2HGraVuzjWBtNBFwfkzgl8fksbs7v2/B3IADt0gm3FZLPww70UFE309nVIN9V7GUVHNAxV820ReVLdWXekhfLn9REb9BN6G4eNh6V9vo/lflQJvWjTGMP6pz4TjGMi2ej9DDMvoI/VpOqtVC/t/GWZAFCfJvLOILVi4249ctcLGdtRpoMIrOywF2jzkHgK9uXNhq1wIC7pVt6UQdHwg1fZhAf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(7696005)(478600001)(86362001)(55016003)(71200400001)(26005)(83380400001)(33656002)(9686003)(6506007)(82960400001)(186003)(38070700005)(38100700002)(122000001)(64756008)(76116006)(66556008)(66946007)(66476007)(316002)(66446008)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(52536014)(41300700001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?O+rUBK6PXWySvzM5vQcHWiQNQiYww54Lv6WBqgeLNayXGrS+VANHdYi8vE?=
 =?iso-8859-1?Q?hfwqAo/FAqsNqL/xnav9baTirtdsEs8VGqrLpZ2XO+VxpoaLikcNaw1gH3?=
 =?iso-8859-1?Q?THd0cumPyZUFoThW7tdIlxL5P1U5qLmavF+ChyVFdxar9APGbkGrRmS4Nv?=
 =?iso-8859-1?Q?buVmOvehR9+S6GDThJTA3gi7e2olOUxFVamfYyPOfELMIEipO6OOruJs1b?=
 =?iso-8859-1?Q?+Y5iWBTwV2ASd1LjDeMRRmTu54YG1Ld6bJRltcOG+hJIbrGMYRexQnUhyg?=
 =?iso-8859-1?Q?peNh2SPpvr5Q0d1AHnSrXn/MZxXMtSvRZG2MiapH13MF5xH2MC45KsQOjQ?=
 =?iso-8859-1?Q?DgeGxusYawm5dH2tbJ9A/1gAdx32wTQKstNtNWyyCH176JV54/O+fcxiX0?=
 =?iso-8859-1?Q?31photr2TdEEdVH3GlTQknnHEQ6vDp5EPbTR1wdGI2SOSkP3B4dGtdlsbO?=
 =?iso-8859-1?Q?Wqx+t1JC0KaXLUmPcBxMZ4feWKIAmt9XwlSbyLe4rbO0QuBduudsrA5sIA?=
 =?iso-8859-1?Q?7okPNsZA3IPW7MjOz3L4AslvyQlaeRznQF1pTTPL4fUl2+ae9/vO1XT8MJ?=
 =?iso-8859-1?Q?Qtb3UetxPiyarQFRsTtKuMCvrlbsCpfzVbmWPQtZYaBUR5PXguE9cu+gtT?=
 =?iso-8859-1?Q?hrkaDdDQw5yVLy1+baaRfiVWkeY8UnLgzdaf3elP3RbkH4M8H9O9zPUtH2?=
 =?iso-8859-1?Q?h0FpCaES8azZPUFXyLw/6KInpQtY1t4T2L2DTFTPQxkyqommDNSJre7TtS?=
 =?iso-8859-1?Q?g+N5CZS0REVl1N8BJqzooiklfia98a0t8UCEPnlhsP46e6kZ14+vQXLhRn?=
 =?iso-8859-1?Q?VzYlb6/O0TO6BcEEWiXdYJs/WvbX93qL3lvE/7c0uqB4zM7Ce/MEiis9XY?=
 =?iso-8859-1?Q?/ElPweXTkDGnw+6tMrgU8CBI9pVDlVWKcZ4qoBlZPi6K7famIaKRMomYOF?=
 =?iso-8859-1?Q?0UeJhip0O4CwLFg38jLavq5WGg+eMYAPlRQtasS3UIR6957B31m7olN6aC?=
 =?iso-8859-1?Q?R/TRUmpsHGGVdbrDJ65lpxezWzzQT37+FTXWbY2g90s1s0mWEu4c06ZyCZ?=
 =?iso-8859-1?Q?TFxiUAjXRpn/opLKJlTg5URNEmc8CAgADxHwvYRgl1MHSXzEDOl/PJ4McP?=
 =?iso-8859-1?Q?3sPdSE0KWW8r9EiZ70mXI3gJdUBOm3ZpYF0sbfrZeOG+XTDrs7ojWrwMql?=
 =?iso-8859-1?Q?Uhqo+IPxszriJo6u/TYGCQODYOzwqCTY0l861yHy5NWyc2mQNfd3xW+Tc/?=
 =?iso-8859-1?Q?Fzih44l7V5awY/KitLgR7XPQ0XxpZZpLun4CA3sqF32dJOQ/pCXv0cqUCy?=
 =?iso-8859-1?Q?GzW3+1KxKhQ5YyCdcUfqpitmxOnPjHrGhIEqh4Z67ZCH4UDAdRyUSDNzn8?=
 =?iso-8859-1?Q?j5aH7PNgnhfa/+B+jxWF7efbURlSwswLbP7iD6iU86DdBzH1lLM3yxrojw?=
 =?iso-8859-1?Q?ZFIi0U7TqhlE5n8Vs9qCXr4dbDCclwckTZsD/kzln94V2XNcVVvIDFdLpE?=
 =?iso-8859-1?Q?CGQIGtrfnkNEy2er9JZoNVONuv8aS1wQjz+5jFNj4w9plpEHdlAcPsRNoT?=
 =?iso-8859-1?Q?gGKOshIGyVxh4F9sx2odUrWEg73vmp/XklcPrOQo9QvMjcB4bt73Jei62O?=
 =?iso-8859-1?Q?UTaQoCfF4tNvqU0MTn4J5UMp/vVPymON988IVtgiHnou26uvhGggIlJQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f36693b-a6af-4bbb-e5bf-08db3f97c05c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 23:02:00.2840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6NAOfMBvyAT1zd+jR1ycEUibvFy4jmfk7vspK/vKBps8StWjhOlKRj7NIUMTeR9W+x3MS6+BIFVpX4A7IiP9ZAYKVDOJEL3asW3sWy2wln4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5670
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=satyeshwar.singh@intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In a multi-seat scenario where multiple keyboards and mice are connected
to the host but some are dedicated for the guests only (through pass
through mode) and some are only for the host, there is a strong use case
where a customer does not want a HID device connected to the host to be
able to control the guest.
In such a scenario, neither should we bind any input events to Qemu UI,
nor should we show menu options like "Grab on Hover" or "Grab Input".
This patch adds a GTK command line option called "no-input".
It can be set like this:
  gtk,no-input=3Doff/on

If set to off or completely left out, it will default to normal
operation where host HID devices can control the guests. However, if
turned on, then host HID devices will not be able to control the guest
windows.

Signed-off-by: Satyeshwar Singh <satyeshwar.singh@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
---
 qapi/ui.json    |  5 ++++-
 qemu-options.hx |  4 +++-
 ui/gtk.c        | 39 +++++++++++++++++++++++++++------------
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 98322342f7..cd3ef4678e 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1214,6 +1214,8 @@
 #               Since 7.1
 # @show-menubar: Display the main window menubar. Defaults to "on".
 #                Since 8.0
+# @no-input: Don't let host's HID devices control the guest. Defaults to "=
off".
+#                Since 8.0
 #
 # Since: 2.12
 ##
@@ -1221,7 +1223,8 @@
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool',
                 '*show-tabs'     : 'bool',
-                '*show-menubar'  : 'bool'  } }
+                '*show-menubar'  : 'bool',
+                '*no-input'      : 'bool'  } }
=20
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..a678f66c5d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1977,7 +1977,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=3Don|off][,gl=3Don|off][,grab-on-hover=3Don=
|off]\n"
     "            [,show-tabs=3Don|off][,show-cursor=3Don|off][,window-clos=
e=3Don|off]\n"
-    "            [,show-menubar=3Don|off]\n"
+    "            [,show-menubar=3Don|off][,no-input=3Don|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=3D<display>[,<optargs>]\n"
@@ -2072,6 +2072,8 @@ SRST
=20
         ``show-menubar=3Don|off`` : Display the main window menubar, defau=
lts to "on"
=20
+        ``no-input=3Don|off`` : Don't let host's HID devices control the g=
uest
+
     ``curses[,charset=3D<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
diff --git a/ui/gtk.c b/ui/gtk.c
index f16e0f8dee..e58f71358c 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1967,6 +1967,20 @@ static void gd_connect_vc_gfx_signals(VirtualConsole=
 *vc)
                          G_CALLBACK(gd_resize_event), vc);
     }
 #endif
+    if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
+        g_signal_connect(vc->gfx.drawing_area, "configure-event",
+                         G_CALLBACK(gd_configure), vc);
+    }
+
+    /*
+     * Don't configure input events if the user has provided an option
+     * for no-input, instead opting for passthrough HID devices to control=
 the
+     * guest.
+     */
+    if (vc->s->opts->u.gtk.has_no_input && vc->s->opts->u.gtk.no_input ) {
+        return;
+    }
+
     if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
         g_signal_connect(vc->gfx.drawing_area, "event",
                          G_CALLBACK(gd_event), vc);
@@ -1989,8 +2003,6 @@ static void gd_connect_vc_gfx_signals(VirtualConsole =
*vc)
                          G_CALLBACK(gd_focus_in_event), vc);
         g_signal_connect(vc->gfx.drawing_area, "focus-out-event",
                          G_CALLBACK(gd_focus_out_event), vc);
-        g_signal_connect(vc->gfx.drawing_area, "configure-event",
-                         G_CALLBACK(gd_configure), vc);
         g_signal_connect(vc->gfx.drawing_area, "grab-broken-event",
                          G_CALLBACK(gd_grab_broken_event), vc);
     } else {
@@ -2228,18 +2240,21 @@ static GtkWidget *gd_create_menu_view(GtkDisplaySta=
te *s, DisplayOptions *opts)
     s->zoom_fit_item =3D gtk_check_menu_item_new_with_mnemonic(_("Zoom To =
_Fit"));
     gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->zoom_fit_item);
=20
-    separator =3D gtk_separator_menu_item_new();
-    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
=20
-    s->grab_on_hover_item =3D gtk_check_menu_item_new_with_mnemonic(_("Gra=
b On _Hover"));
-    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_on_hover_item=
);
+    if (!s->opts->u.gtk.has_no_input || !s->opts->u.gtk.no_input ) {
+       separator =3D gtk_separator_menu_item_new();
+       gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
=20
-    s->grab_item =3D gtk_check_menu_item_new_with_mnemonic(_("_Grab Input"=
));
-    gtk_menu_item_set_accel_path(GTK_MENU_ITEM(s->grab_item),
-                                 "<QEMU>/View/Grab Input");
-    gtk_accel_map_add_entry("<QEMU>/View/Grab Input", GDK_KEY_g,
-                            HOTKEY_MODIFIERS);
-    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_item);
+       s->grab_on_hover_item =3D gtk_check_menu_item_new_with_mnemonic(_("=
Grab On _Hover"));
+       gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_on_hover_i=
tem);
+
+       s->grab_item =3D gtk_check_menu_item_new_with_mnemonic(_("_Grab Inp=
ut"));
+       gtk_menu_item_set_accel_path(GTK_MENU_ITEM(s->grab_item),
+                                    "<QEMU>/View/Grab Input");
+       gtk_accel_map_add_entry("<QEMU>/View/Grab Input", GDK_KEY_g,
+                               HOTKEY_MODIFIERS);
+       gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_item);
+    }
=20
     separator =3D gtk_separator_menu_item_new();
     gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
--=20
2.33.1


