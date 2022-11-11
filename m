Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073CF625264
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZz-0000qf-Tf; Thu, 10 Nov 2022 23:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZx-0000o1-2J
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:45 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZv-0001f4-Av
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:44 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N9pv004974; Thu, 10 Nov 2022 20:23:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=SXt4gl9FGVsN8kbuRE4IqSPgVdcZ+ICXN2rhjTe/dE0=;
 b=YYHEzrCDA3HyoQH0jfJkKZvmfyTYxduS50+K+CrmE+jICGmU6SUBemKDfD0OrQIGHy8Q
 qCX+Qf13ZYniaL2uZM36iszaf63t0Yf+dzlhwAIJ3Kdaer+7QDxgFuqyWma/lMMk+TdY
 QQttZ/UPIj4YbcalxOy60jPnfEHfhqFwxhGWj3jq9NrAgIeOTowFAHmGrsGy6EiX3xw7
 RByju2a3auubWEnNFsdjhnDm1luytzBN69Tr7Qs8rFYl285qUOs+8G+B6dunHof5HGIZ
 GZNluB2Gopm+paGLNn5euP2wWeQNHducn7EfU+GH6Rjr924ijUoFLwHojDJWHzA+OpXt RQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu2OjQiHDG5rnL6tYko+m641R07xWlb8c7KZcC94oIuJJWLX5+OnP7OwquvRWN8bXFsP0h1huF4uGH+Qdfo44ogb0foetvT7SpSpD9xY1F0yJSRhryZqamYhLfLSdl3G5azxRd0QVV8HrqOcC8XUSl0H2M6VJpZ6eLD2VnnjnypotHXDDMF15mnZnh77wZdC5CnCnDRZ6mAj+Mi/gA18nLlQiiO2ggy0zZyAT8/kQzDTqXWpoFTPzQ5ulPos+Xm6bFrsfBYIQZ4PyNxVbCHufeNXyAa9LfVHCE5hjMDYX5NQuhO901fUyKsgR8Uvp7b+f8JsCkWQ2lHO2EczwtZDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXt4gl9FGVsN8kbuRE4IqSPgVdcZ+ICXN2rhjTe/dE0=;
 b=AL98cAjQRLdo21Ft1s6uxoeHN768rZy+Dj9g4qvYAnXjrETRhH3GzdqGDTH/DK0ypHUgi3fcSCenRjpSMPMtmPxH6vAnlI3f45ZC1TXy7h4qiLbeOOOmd5Vw8TfR+dcRNSg7OtSK6GYyofR8i9nug9QBrRNgBS+M8tLDl/sJRS3V2OjFMPtEAIfkBSl/RElUIM6zjV3KMLrruOki+j5NQVHDH/7noVeiiQFRSPYfecnV21LHpkKxCC3P56l3opg9WVuDllLiY3ms6SZsNiec3aq+D/qK5xdBSDt3+tF/Z4mZ8ZWs8XnIxIWhpNzgiLEprGkPNYbHQ2J5vHMNG3z/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:27 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:27 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 19/19] meson.build: Turn on virtfs for Windows
Date: Fri, 11 Nov 2022 12:22:25 +0800
Message-Id: <20221111042225.1115931-20-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042225.1115931-1-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: d92f442d-93da-43bf-be87-08dac39c7ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPVREbHM9+tD5WWa1ZPV6yX6F9gQoVK8+2CJrxitxTV+DBoc9RHtIimXT1K45OpgBuVu/ncEF7wHfNejfmXLgl5G0THx7cYO2gkt3/z+gYCUppfCBLiBjyq1diFg03WZJBvRW5evbURWPzB+UeInlJ4SP5CTcwyeSRRsWMR1UeUwIhuIhckdG2ZKJbtZU4ws5sc0iyjCzRVtaZ7Uro4aRvprxB5T40Fg7LNst+t2oezK1kYt19oYzCV8kILLVlKJW6yNYdNPMBR3HoMIYzvT67kUSgGG6uy/rShuPP6wzbBvuQ+VNE1tXDunw5sBu7RhdnPVSSAU+Ik5vd3vl3oDhyWbctJxKiA4H5Acy2emhuEir6mDPNA1PuZtyKbUcMhkzcK5q1oxJY8b26ZbkRVJ9dtbJvWbLxDxO1JMDBzMdDwiC5qfHziHwtQ7oCSFzB6pyz5f6AFbmQM4jpGTLyjCCNjJlZuvEPhDnseLR/AiTJYOIYV4DEs5AlQOihg+X+GaSEi13Xdgwb3Ic/pWQWW+X4X1Nxh4saTSy114NImdawEAl70nHgUWbsQ+OmhAP1vWs1tsa1B15+ECI+i5QrE/j3Bg+5K1X0/X/egsvotkvdjJGy4A9syb59RvGQo/N631erNTTcth+bL3GzZK3s2UFTurUf83fU+i41eJkDVTKPbs+1RciZfhRlWnjXiP3sFxBmEVXRDwlVaAREcFrdDRtPc8jbB+3oOrBYyykjtHZGtVK5LwUJSR/O+21g92W+jn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4hifVZgAiWRiPbneWXHMtEQ+UXF1ZmfphO+pawoj98FYpJeW3i59ry+Xdtzg?=
 =?us-ascii?Q?VxYdu+cNsig+2z2aea4vCUmplUijIYaUKnHvnWGDVmd3D6qemGrDPOykxJro?=
 =?us-ascii?Q?WG2lcErI05Q3/uhZAvjt5WLnu47qAsD0i/LbJbPg+S16mT5iV9tblX1DK64F?=
 =?us-ascii?Q?av3Rr8Duu4Kc08q7RiHrkLZ9/LvD6K6FW+a4SpCY+q/zhjIHCOy5K9ITAUGl?=
 =?us-ascii?Q?DnCmT6u+uwpCU8EGzdsiWp1rSPIceUZsPDVkrqBKyIyhAI5zG1DbLXGDGT9z?=
 =?us-ascii?Q?a8Mc85CLTqo4sCiyUxTyUg7WIkAmW/p4B/4NXHADx6OuKA7cxFL23SYY3ThM?=
 =?us-ascii?Q?PEH4uZkpCvgF6Lk4KxbJxLA4dWuZlzeZ09QNxbVzF49xNionN8/23+HLTwSF?=
 =?us-ascii?Q?24KzbwWlPQHTYuJsYcq8+iEykUhr6bL1585dEi7ZrLfo/M7h1ipPI3G6ih2f?=
 =?us-ascii?Q?9E2K+L9G1Fx4kf+HRJiKmIcOf4gq/Bn0bsQYK4e0Qo/pTWTzPA3gZyMwhAOA?=
 =?us-ascii?Q?YgTDkPpf0CfoQwmTQ4M+4sWwj2N9o/i8QhECDef8YeOByd2s4c6sp9+0/6uI?=
 =?us-ascii?Q?bA9oQUnHZkqENW08Mvp1h/N+5ZASOhZEYvGsZ/8oJuoyCBlCpIrDf5ojc+yC?=
 =?us-ascii?Q?+WjfHkeb138GDqCblrCcpjiKiYX1Qx6jPj7VKR+fEUKtz0U/FqIAlMDnx9Mb?=
 =?us-ascii?Q?jf9Pdww4gWrF/72Ko6lNXV6aMq3JaF5pKgpW5fe9+9dkZBu40ZkP6/lXwArr?=
 =?us-ascii?Q?VRkabj1ulZfRyjPPUOwknMF7lgqKWt74f32EIjBdxBbGXq2Y0NnN9FrfB4qK?=
 =?us-ascii?Q?Sy+rbNl7XcLUROLRnNkLyx7dsGM4Re1SkV2AJye0Q3td4GGG/BEEm3QTxEQn?=
 =?us-ascii?Q?8pQHVfqB77HcArj34LcQ/ybxZsnAsrLfYYC21yhmyBNNfZsSL9z0Ke2OcLCK?=
 =?us-ascii?Q?E5y4sSc6RpGHFntFDi0tD81xGy7cACvCLNLbugN3H7i7XTOvmt2d9PdoD9Is?=
 =?us-ascii?Q?zU7Gf5fnINFmItg8UuuCkQH73nT9rT3Fs6nMOzJD1Me3iQjbLIf4Nr3lwiee?=
 =?us-ascii?Q?nFbk06RTe1jTInzzlg1vrDB/ca25/71B1byqiZqznCUWC+J8LleAo5wpXNDq?=
 =?us-ascii?Q?Xr+LQVNDhUnfZRnUUpGmjJDQD9YUfWoCmpN+uv8wlpAPUe9w0O97ImjiyFFk?=
 =?us-ascii?Q?IU3Nx7wwcQIqOCC8xOU4mbT7gSAe51UQPUgYi53+9fnZWGv5lnHSk5cTCc6Z?=
 =?us-ascii?Q?+ke3X8fo3lgB+paQWMlisV0MSJAh/9vI0QJJ7wCdj7224nKXwMKKCs13pVj+?=
 =?us-ascii?Q?uKaI0qFSR4IkW5HGKT6CqnAIkO4UE370TtwHdsvQn1RVu4o2H7yCrYjcs8oT?=
 =?us-ascii?Q?Pat4t5zUGAH01qSD6rHWMAGUx95osK3ZdsrT4BHmqNY2mhelsjaVKGk8MCAM?=
 =?us-ascii?Q?nBssQX34C14+bZL8kd3g0DeIjTwqQmizA1zn23d3NslnxElkXMAg6zXHfRu/?=
 =?us-ascii?Q?LgSA9d3GTymNiCP+unT1/SoXA/UDfIPGI05S8hvv52QhEDsoj7gwQ+Xv66Tv?=
 =?us-ascii?Q?ErKRy3w3xTSz6zxGdBjZiUeWlo0LXpmJNsuLGBKJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92f442d-93da-43bf-be87-08dac39c7ad6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:27.1117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+Z+FzNOzets0KdmocrW/jA6DC1lWaFbxQ7+I9ypiJOEAhUqHL06mIteuV5sqQNY0N9EfIOr49Om9nNG0Il3vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: NQ3ci6uRpbGqnRmhm8nRY_KUBMXE58ox
X-Proofpoint-GUID: NQ3ci6uRpbGqnRmhm8nRY_KUBMXE58ox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=678 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Guohuai Shi <guohuai.shi@windriver.com>

Enable virtfs configuration option for Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v1)

 meson.build         | 10 +++++-----
 fsdev/meson.build   |  1 +
 hw/9pfs/meson.build |  8 +++++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index cf3e517e56..4b386556c0 100644
--- a/meson.build
+++ b/meson.build
@@ -1739,16 +1739,16 @@ dbus_display = get_option('dbus_display') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-    .require(targetos == 'linux' or targetos == 'darwin',
-             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
-    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
+    .require(targetos == 'linux' or targetos == 'darwin' or targetos == 'windows',
+             error_message: 'virtio-9p (virtfs) requires Linux or macOS or Windows') \
+    .require(targetos == 'linux' or targetos == 'windows' or cc.has_function('pthread_fchdir_np'),
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
+    .require(targetos == 'darwin' or targetos == 'windows' or (libattr.found() and libcap_ng.found()),
              error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and targetos != 'windows' and have_virtfs and have_tools
 
 if get_option('block_drv_ro_whitelist') == ''
   config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
diff --git a/fsdev/meson.build b/fsdev/meson.build
index b632b66348..2aad081aef 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,6 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_WIN32', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..aaa50e71f7 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -2,7 +2,6 @@ fs_ss = ss.source_set()
 fs_ss.add(files(
   '9p-local.c',
   '9p-posix-acl.c',
-  '9p-proxy.c',
   '9p-synth.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
@@ -13,8 +12,11 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
-fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
-fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-proxy.c',
+                                               '9p-util-linux.c'))
+fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-proxy.c',
+                                                '9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_WIN32', if_true: files('9p-util-win32.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.25.1


