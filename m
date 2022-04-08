Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE94F8F7A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 09:24:27 +0200 (CEST)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nciyo-0005tz-AW
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 03:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nciol-0000vB-7E
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 03:14:03 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:47150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1ncioi-0004oS-Hs
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 03:14:02 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2385hDxL009873;
 Fri, 8 Apr 2022 00:13:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=/fgEiBc2jvQHWz/q7evZEt/0WVzghAAxKSbCeg2LVZ8=;
 b=DTiptkM5k6yJ1x2KUkjiHxkBMJXj+wUi7z2RmofHUL/nLJr2X2l0JIPT7FZn+sMU+4Xh
 qDUF+rU6VwzSV17n1sAEE0Pl01b0pJzaI6z2CwaXuJIs5qa878KpvuTdKWjggGIHODwt
 EfSl0PGFLKfZEOXbnSzLB/jTo24Izrwxr3MPlVsqcAvjuX3MPRXYsb84rHAAoZaCiPgv
 5sZXh4ggkg4wuHuvUkYn/PbG/Xm9WQvQtWO9vwXijLtrpC9EyBlgHlrleQpAKIE7K7vt
 O1q2yvhSma7ze+Wn1EYmVkyk0RqYkY4OhecjZfI67Nr9b2aqQTgnQiVS68bluSUlQXe8 zA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f6p1ymv7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 00:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdQe0y6XhWgB0dTLYUyNwJ9Gg/OqcA/e7c2H5Hz+aDLvrq5EhBYEMmry9EsYk1yGZ2aVLNlGCJilH4AbOZAImWeBH6ehVR11fXRK9BrOpFBZU5LYPyCYVE4rl83UFvSlh7V1m+sE9c5E2awG8IFy3tuI2l+M+ZFs6VMH009rWzrwGy/roazLlgPm+tnzg0RnSnrWhq+uYFbmUnEPO0Db5oBmFQ07hJyiN24MPTSszW/Hmc/VA05FQI8B40d321Y40oz7tWfvndxcHDr6gBRvjPL5lkajYinXdT69YxifXU0pFsyT25bjIlFFVj0+3vJV9il7nJiEcVSWo9KIoraudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fgEiBc2jvQHWz/q7evZEt/0WVzghAAxKSbCeg2LVZ8=;
 b=cp41t9NDRx8J65ShPPEktaBVD+YzgqrSBnqmAeu8zTPrUODEtVhJv0bbQFTdPlZqm3OtN6cQPbC1y28VdStRQRPHqzCkcw83HE4PCOVGYGK+l+RIaqRVMzcsRj/AiqfTSZNuNmEH/faOMZgMPeEH/m1sLC1bZBtJXXlY8jLyvTMX2phGVfSHMZjsSXYrB/6MKf6jV20WIR+N2NiWOXQzsYHjSY4p1PJ54XPJl0X9fAn02/InaFkbaOAPrbZ8NwgWB0aMXEkypglz8n+zM+4HG29l1hqdkk5HcXpXzGRxdSXyuOaG9SEANDNyH9SL9bMN7hRvyVWodqDAkMzOUn8oCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB3281.namprd02.prod.outlook.com (2603:10b6:405:6c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 07:13:52 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::df1:1d4d:e30c:55e6%3]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 07:13:52 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/2] Option to take screenshot with screendump as PNG
Date: Fri,  8 Apr 2022 07:13:33 +0000
Message-Id: <20220408071336.99839-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1907f56e-0948-40ce-d869-08da192f561f
X-MS-TrafficTypeDiagnostic: BN6PR02MB3281:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB328116BA08FDE372C7F1A2B699E99@BN6PR02MB3281.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iUO7WvSevLy2sZn7TigiYqHu8UmYpaXF4x72bd9f+o+WjEzbGuahMWFwT+fZyKJsJt/Kkoc6/k9QligyhWu+Gc7JD+H9rhBIAkWv377S75hWvdZ33MairVoHDyTn/Wmw1Wg38ZSdlBE+mCZpa3QCvIgKiM9sRO2QMRbukXnDQOMGCZBBVzWlfB1IDSLo8ByiK6IJnXLnqEavn8ahMCx8Y4zzNZgUaD9tlaxbrubXM2q4Laz/npB8ZNnUADeBZMDHnZLr0BKJJBf0nSbzkxsN0RqUMpszGkYDJhaiggJ4hz9R4+yKQOK4vTBJBu5faMpZAjfWPYMPIAcF4hbT3OqOZVYs8qrLXTj8CmkZgt8V38ugNF7X/t6CEI9I4YXVVCC6XXKuNG0XT6UTk/W/YLjrAW+4gko6h3Zgdflie5eDEDuYxSclUoFcb1AeURxzscQcTYU3FxCqeH6Oi3dPHYf1UX1eJTFyWUKie2uQWNMbQ5fuCidS8mvYTmz1VT/u2oWc/jXOu793Q1IamLw8u8OyzzVNqr2U5TBGbjtcUI7x/HWOh0fkIwIzkNdi8u3PS0qwT4/r32KE/rvja9VDYGkKNShbktPnAzEtu6LuQ6VkUvsatO3JqU/0mVaJMgC08IuZk3lDGrsTpDX8AmF8O44AZKU3w+Vfnttp6be753OFuN82cf5oXsAs9Fs51GaDEVHYKvZ6+phg3N2zUxV+dwBNPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(316002)(1076003)(66946007)(66556008)(66476007)(38350700002)(38100700002)(8676002)(4326008)(36756003)(6486002)(2906002)(6506007)(44832011)(6512007)(7416002)(508600001)(86362001)(52116002)(6666004)(5660300002)(2616005)(107886003)(83380400001)(8936002)(26005)(186003)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFdFT05mRnVaZ0pFeDgwV3JES0VQd1I2MTJCeFd2NWxXTHMrenRneDAxTTZL?=
 =?utf-8?B?QjVhUVl4djRXWko1ck1XRjh4dHZvSzV6WkQ5ZTY0L3JudU1HdkgrQTM4Y3NZ?=
 =?utf-8?B?dTUzNW51a2hzQ1BZbTlKZU8rVkNLSjlmWGtDM2hoaGNBT1F3OHQ1R2xVUzJZ?=
 =?utf-8?B?ZTFGNFNwWjlyY1BzN1hjUThibVlMek5lZEF2TVZpakxwL1UwNWlQMzhZSFQx?=
 =?utf-8?B?R2V5eDhBbjAxcFBucDNWMksxaWgvbytVTElzUnpxanNFcXJlK05ZcnVad0dI?=
 =?utf-8?B?by9VOHl0WUM3ZXdGZlNRUXlESTBjZVpCTjdaUVNJOHBNdTRqM1M2cE1QSXU1?=
 =?utf-8?B?eVRLU1M3UThBOC9aVUM5Ykc4TFVoR1prU0R2b0pCRXIzZ29iYUUzNjRRS0wz?=
 =?utf-8?B?amFsMzlTZ05yTlNCQWxOZEZpZnNaSU5rbWhnNlF0R3Q0YzdKWGNzclNFdVZL?=
 =?utf-8?B?ZExPRXBkVjZVRmpnU29zQk0vaTJLN09UMnByQzRFOUtSejBucWtxdGJTNUF3?=
 =?utf-8?B?eDVaYVVpSVpBNmJlbFVySk1QWEtQaUg4VGo4M1hOSHY5OW5ybEI4YUlzTVdN?=
 =?utf-8?B?UGxiNHJMai9pTWZYcGMrL2hqODEyaHVTRHBVVlpieFVrN2NVU1NQa2Z2REUz?=
 =?utf-8?B?UE96cUVCRTBMclA4K0dtY1YwZHFkSFR3SFh0VW9OaldSK3R3QWRqdXNMTyts?=
 =?utf-8?B?Um5QY0YrQytDTFhTaDdIcnlEeXNrNUZBMytnWmpPbDFBSmc0KzROZzBqY0xv?=
 =?utf-8?B?Uk5jeGpZbkZiNDNwZUlkNkhVeEJsd2pxRDRGbUE0SzFUck0rcE9UU1VzN1h3?=
 =?utf-8?B?VXdSc0dLZW9TY2tiYmtaR1FxSFcwYUY4bWNKZkpBdmJvUTEzOGRNemV4OUtp?=
 =?utf-8?B?dldkaFhqemFoczhGamJZZEt6R2pXaHBIVE00SWFlMDZuRU1Lc29xa21sTjJD?=
 =?utf-8?B?TDM2eklFWElNcjBpV2dhRk5kWVNLM2hUUkJjanJHUVh6N0ZBNW9zK2V0aHBW?=
 =?utf-8?B?ZXBzYVlRbmRsUC9EZS9vaFJaa09MczZoWlc1Ky9EM1NtblhINWRQdDFqWG9Y?=
 =?utf-8?B?M0hVMTFETnUzekNlMjFjVnV3R252Vk9hbUozcjBuVGJvSGZ1ZThaUjBlTXNn?=
 =?utf-8?B?dDNVUGwyK2FSeFN5KzcycVdnbkkySlFxVEVNaWx3bTJGS0JRejVOZE4xM1Y4?=
 =?utf-8?B?SVYxQ0wwMDd0bUVqempWUjFsR0x2SlF5blo5SzFsY1kzL0o4UUc5WTNmYlVC?=
 =?utf-8?B?TFllRTVSMTNBRUVVQXAwK0RmSmVZOVZic3pFTTdJdjBiQ2RwWm9BdmhxbHFI?=
 =?utf-8?B?VXhzUy9heDhkS0JHSnFhK21GT294QkMyaWdTSURuVFdrenNKZzFSUXZvTXBZ?=
 =?utf-8?B?UmtPakdTVDBjYUphN0FwK0NCbm8rTlJoUUYrVWZvcTlmRWNVWVpxMW5abVBu?=
 =?utf-8?B?ZjlxbEpGMVBzbXN2NjhCRm5YYXoxek9sNGdYei90cXd3YzJOVlc5cTVlelF3?=
 =?utf-8?B?WUZ4V0U4ZWdKZlhZaHo5ZFg2N0dzL3JqNzAza2k4RmtCYTFkMmFsZlQvbG5O?=
 =?utf-8?B?SFlxMGV3NllUbVNOdTQ5Q0tycmRiMGZYRE0zS0JKQS9STHI5ZU9Bb1Uwc2Rl?=
 =?utf-8?B?VUtHdmJESERKOTY5TlNzdmRIb1VHdUJlaHRnZnFuZ3F6cFRPMlB4SnVZaVIz?=
 =?utf-8?B?NUhiWFoyS3gzRjFQRmUwSmh0SHFvRDdJckxmTk5kYVVNT0diTmlkZkIzVWVT?=
 =?utf-8?B?K3ZBdVBqNVNVRFdPUVN3cm9RTUgvZmJEUitzUmsra3RVM2JoOHJUTWJlZklR?=
 =?utf-8?B?WjRRd1NPR291NkJBbi9nNFlpQWRyOUh6dlBWa1BXcU91ZXpKM0hYMGRhZVFW?=
 =?utf-8?B?aG5Wc2Q5UmN2aFhqN3VRZkdFZjVQWlE1OFlIbGhuWUhzMDRoQy9tRHkxQnVN?=
 =?utf-8?B?RnM3ZXh4QytHWUREUUFMeEtMQUxwRDlvTmNSV1JRRGRoR2NYYklEdVhQQm0z?=
 =?utf-8?B?NFBxTzVvSE55SnZaaTZuOEdoa3ZBZGIvdUlNSUJIcnZ1VWFuanl4cENkWjlM?=
 =?utf-8?B?MDJteG44bWxaQ3B2WW5rRG1NVFlFeWRFc3FhUjJwYno5QUZYcFZYUzQrOTFi?=
 =?utf-8?B?NHVyT29xUldvNjN4NVVFWEFQU1E1QzlockpReHBidVZRbDdCTmZXY1BZMy9U?=
 =?utf-8?B?dlNlTVpNNm8xNzBzeis2aXo5bGZQSlFwN2NhSVFUTnlML2FpL0lMLzFoRS9P?=
 =?utf-8?B?MVd0dGdzWTd0QWh5ZnIxRkx2REpiUWFvWC9kT0xUQ3RLaFRCZlBsK1dNY1dJ?=
 =?utf-8?B?Q1gxN1I4enZOQzZsMGlkbUJmOXNocER5eC9ZdVc0dTdoMlFoZjZtRzhKaVVw?=
 =?utf-8?Q?NKBG5nP16D9uHC5k=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1907f56e-0948-40ce-d869-08da192f561f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 07:13:52.7150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kLSGRb4j+jSU2D++alofQhXNqETjkFPjgKzD8s7/D0IaK2er9cPSOMK7l9HlkWuFHn1Zf5ukYt55UsB6ztddghb28P/khE0OE4EpeqLYAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3281
X-Proofpoint-ORIG-GUID: abCso0OBxBWtIj2a1ObW3HQOny64RF_U
X-Proofpoint-GUID: abCso0OBxBWtIj2a1ObW3HQOny64RF_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_02,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to add PNG support using libpng to screendump method.
Currently screendump only supports PPM format, which is uncompressed.

PATCH 1 phases out CONFIG_VNC_PNG parameter and replaces it with CONFIG_PNG
which detects libpng support.

PATCH 2 contains core logic for PNG creation from pixman using libpng. HMP
command equivalent is also implemented in this patch.

v4->v5
 - Modified format as a flag based optional parameter in HMP.

v3->v4
 - Added condition to check for libpng only in PNG option is allowed

v2->v3
 - HMP implementation fixes for png.
 - Used enum for image format.
 - Fixed description and updated QEMU support version.

v1->v2:
 - Removed repeated alpha conversion operation.
 - Modified logic to mirror png conversion in vnc-enc-tight.c file.
 - Added a new CONFIG_PNG parameter for libpng support.
 - Changed input format to enum instead of string.
 - Improved error handling.

Kshitij Suri (2):
  Replacing CONFIG_VNC_PNG with CONFIG_PNG
  Added parameter to take screenshot with screendump as PNG

 hmp-commands.hx    |  11 ++---
 meson.build        |  12 +++---
 meson_options.txt  |   4 +-
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 ui/vnc-enc-tight.c |  18 ++++----
 ui/vnc.c           |   4 +-
 ui/vnc.h           |   2 +-
 9 files changed, 157 insertions(+), 31 deletions(-)

-- 
2.22.3


