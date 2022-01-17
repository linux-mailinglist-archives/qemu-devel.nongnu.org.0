Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B44900B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:14:51 +0100 (CET)
Received: from localhost ([::1]:48710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JPu-0000e2-22
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:14:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNk-0006gh-Q4
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:37 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:26182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNi-0003Mf-MK
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:36 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20GNmbYE022754;
 Sun, 16 Jan 2022 20:12:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=xaHInSOS/q1CMpidgiagiNwsW+h503QSEfrAjl1YQfA=;
 b=QKeBE1f7vNiQGAOvmkvMn3JXuBGr0r0VognO6zk0zyeUoBMC+EW8eLD/PhZfvjJIrAaF
 laj2Q7MiDV3hf8hrMlZ8PQpoitYVUv0Wk10Ba2VQLr+YzNece3RMSXcn4wUbuMJpPzTH
 Nx1fzcvX0WoOtC6AwKiQHJFfloaKeJib+aHEA050N3ze/aEE0e3s7FHTjfzZqMhrQAlF
 /XBtxM8XvkspQ3pBZN3IfC+fga4UCNkzjzDoMzKhU2tlEwwRXCHNmVZ8ch1NFnueKN+2
 Bd7Sg5Hd/1suMXcExXv9KqyvelhpgF13byOaGivtIvrFipggwq0OEUeet7eI2KJxkvLl fA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dkvpbaewj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 20:12:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ais9IBrJ1qq1JQlVPL6WFwmVzmt6jzjyk73Jem7Fa1DSh+mr3/kC7O23SreSbHzOMWucn8czTxVBugan2HGeObFBfAodAP9PwprYrR97xkIzHhmIbqAww09Z6I9qQ8caJVIsqjNouRyXNkTENRhGXTUm2aUVQ5chS/XHYDaYbQvPi3bXmeeB/3mgAPTKD300uYWkadcYeSYV+Rb039ffnUNXsk5JsntzyavACmbsX1T4PtkUDf2bHWXTuBpezjWmRkD/eu0JcVLZdg+8Ldc+LfsymiCWkTLY9e4ImefgT8Z7AonPtOsUzbcFhjXQ2W2uktsuHKlMYp47k/sIG49G7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaHInSOS/q1CMpidgiagiNwsW+h503QSEfrAjl1YQfA=;
 b=cs6RkfVZVG2vkF2DdDPGmJV1jOtc0zT6WPOrT2Zq/VN4aEdF3LI/y4AUbv+dcMN/7rA/ya7M6gMZNsW5VNxwj2qemhFeixPZjzhp3ZqNPxuz6cLr/mJUE21pD3thW55SSU/7xsoFTS3zXJQtSPWK9tvd/GgfXi3H73COVDQ4R29ZGp+hNxyc58BRxfdR8YUqEHYYQSJmdicp+xwIaWuWNwT0UB/g4COnehFURgHYBpftY2QlQ2m/j58s9hxOvsctVX29rxqPRqMlZTnIbSOK2rSctaUljDAyKJsdlPXuxKSONYpiKjGWLhA/j+39ZGixk6LvqYfqlaMzBiF6wKLnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8018.namprd02.prod.outlook.com (2603:10b6:208:359::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 04:12:32 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 04:12:32 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v3 3/6] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Thread-Topic: [PATCH v3 3/6] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Thread-Index: AQHYC1hzNWc6tFSMPEOov58tcXyXPw==
Date: Mon, 17 Jan 2022 04:12:32 +0000
Message-ID: <20220117041050.19718-4-raphael.norwitz@nutanix.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f75b1840-699b-442d-f7ab-08d9d96f95c4
x-ms-traffictypediagnostic: BL3PR02MB8018:EE_
x-microsoft-antispam-prvs: <BL3PR02MB80188B46536179BC86FB69ECEA579@BL3PR02MB8018.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VjAhPR3Z5fYaIg6o9HWtusQ3FyiRezhCFyvQugaBluKT5ZfN4xOs7FUlxtL9EDyHDXPBaFrXMvRGMfGa2YWR/Lcoy7weef/JJRjhFYQJCeg60DCOvwMCjzPAADgMSK9+AYp023Dq4DbGavD86n0DwXUbFnb+IGD5gSLnB26He1Efa1iiIBAcC0xehI5BIkQd42qyT03bnxki5zHvm0hV3FzroTZ20IiEaMvfEImiP5dlZb8KyfXhtEkoEwr2w+kNx5rS/0Rp84ubMzRZ6NURIwO73T1GZ2/aj+q/mSBZKh8mnC7DWSg4x42sUorbNmdW/gExIQRJbEz/08UC71IFo8neb8l5ULEa4/DIe8TABMq8hYhv+txncJTa/YqeKYdMI345lACJyif+ertc/uxKGcrVgTUrb26XOadJqVVWop3ZhWzM4MU0cRat5Z0OTn5X7KII1eY6s0i/5KXQVlI+ehHCyJNLljTrhpM6lXllqQ9xPkOodJ6rxEJYK19fSzZJ4ij67YcD7YEOY9WP/NowQfJKdfh4zYcFk4ZS4+CJi1ldlu8VF+tAwTXMSze130pPhDjNAHBh0WG32L9Fb6t9L7FOYuQ8WyKMx5mr5TbXulv3buMe0t987x/IUPkvcUApRZQRLA8BH8j8w2AUPNcM+icr7955L2JikiPwABuQDohCIsMHOYF0TXXr6ydRS351RaxuEkF9K/WoMscyNbLMaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(66946007)(1076003)(316002)(71200400001)(64756008)(83380400001)(36756003)(8676002)(76116006)(66446008)(66556008)(6486002)(66476007)(86362001)(6506007)(8936002)(44832011)(2906002)(26005)(6512007)(5660300002)(4326008)(38070700005)(54906003)(122000001)(110136005)(186003)(2616005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ydnIHdPFcaQE+mYk2Md0dxhVoBhvxEu06XBi9Pa8MskzXurs0qCemkHv95?=
 =?iso-8859-1?Q?wOfX262wOaN9pOwl8WFe04xcdz/tm8iN7t47WEb2HBlHug81ByXhd03k0A?=
 =?iso-8859-1?Q?5sWtH9KK+lXrAujuToXXdmq2Ub3MixuZj6ZzfoH6VVmbib3UhytO4l0khl?=
 =?iso-8859-1?Q?skRbjMrMvtQNKt18eeGTtDk8YzU+8K6F1kNCg4wDSjQJnbaOw0a2KZ4icE?=
 =?iso-8859-1?Q?yHrhpObrNqR/x9ju1BCTb3arA+ojq4kRE6eE9X5cLvzWzDO7dxQSk4soM0?=
 =?iso-8859-1?Q?FoA1FPzheD0nG2p2A/dZb/f6mxI7eojYzQyyFQ5eE3qurDUwjR5UnK+R+x?=
 =?iso-8859-1?Q?rbpemxbEDtfVhWwcdcPdZjiKhYZe0ERvAAkESzyV6EumZ7F3aNcGEhsvCX?=
 =?iso-8859-1?Q?dLYkctx6Rp0E/yiGsOEjhcywsVVAC246lFKOMcqqoEyO1nOd6VdV6BxORm?=
 =?iso-8859-1?Q?9n0wUM3h2Nz4RPkyh67WDGMw4/NsS07u8UujrKquyTkYLaEQTJwlWrmnHj?=
 =?iso-8859-1?Q?2nmCTEeAHFUXezflmZ2MKtN9zRIeWeCe73h8kDcXCNrq4lguLYlCmIBde7?=
 =?iso-8859-1?Q?XDwYcyQoJjcGF49mgiklcsDsGa5QmvpBMCHrBWJNtXhflZXaYiarq+LBPK?=
 =?iso-8859-1?Q?jrybVmd2cVX4qn/FNwaheuvqNkJVOTjKA6yyjFY9eVLckD53tJ1k3+kNDx?=
 =?iso-8859-1?Q?Axv9j2vZIYv1S4EYGzUgxR0VXZltmmaNOGo/OVZOcuvfeHyNDMkKgQC5Jk?=
 =?iso-8859-1?Q?UEg/TAmAVklrOG3IE4nyXPaj7G/vGuz297cvBQIZL9QR8r60fLLNR7U8pn?=
 =?iso-8859-1?Q?R6OpORnXrGVwGB0fuD+T5nAwAJWwsOA73WUOD01DUG0SavA2PVM4qovaFe?=
 =?iso-8859-1?Q?6Bg0aO5DVaObjpxZoLVHIK/6HMy8tiegEyaKZMnrAkJHgv46i20CEscKmh?=
 =?iso-8859-1?Q?+VwHXjerf4d/XbR8gufHpo1PJgt/ZvWrtoToBg/+CNO6bUSX31tYEIUErf?=
 =?iso-8859-1?Q?I7/ZnbDo5MD+mE+mk3rGArjxiWjqOGFfhZLpe3qktlSF0TyHrP9PbpfhUQ?=
 =?iso-8859-1?Q?u4BqaWemlDAdlZwti3MAUvN5BpCZk8gEUOXZKlTX/IBcKJ8LbSrl5a8gsA?=
 =?iso-8859-1?Q?sbqI7lNZE+2cV2IF7bcz6dYn3+eFYQwleGZANulD0bJVPm0E9fqSOP2KzN?=
 =?iso-8859-1?Q?ZbavIEo/oZ+hZYSHENiFOhuUTJducb2XFGj3TkRkta0m5nB5eCl0xFChnN?=
 =?iso-8859-1?Q?94CKJRLQA4TaOLlfWX0FP1j0u953b0HA/ymt24SI9mCe4MNY8FGo3m5ytP?=
 =?iso-8859-1?Q?NxFYKrRRp/6RA09uhKVdK2P3lMAnIONe7BemvBml9u8c4UXnNXZlxAPBZ+?=
 =?iso-8859-1?Q?/FX4vDGsnLyppPRVyeHuBSNNv6jINjnh+U8L4fqbgLw+kzYHPLV7NGy+Ic?=
 =?iso-8859-1?Q?tyUCRRz2pMFIzuAk0taZKDr3/V0bpQA0yXskU+upnBF0jMRaI4gVzIalv3?=
 =?iso-8859-1?Q?Pn2Bf6cyKItF8yz87z/FaATOBeWO4CQ/vu3qXX/d9cvLLrzSBlV2+VLIQj?=
 =?iso-8859-1?Q?ds7eZkGYyzYewvqkiLphbToclZd/IxxwIhu/CFxKLm0Fvvpa+oiBrJlMYt?=
 =?iso-8859-1?Q?vkgjFz/5dnFbPVlKD2QUw4n5pYpOZVxSm60xrNfU2iZda7W0fqaSKjPI24?=
 =?iso-8859-1?Q?n70yhSBD5HFuu8Uy2gbIqmivp/eOvKJjjNcJxJE3MmNF/0mB+5eNNOFTPX?=
 =?iso-8859-1?Q?9SB8AThCTdY2TRsl+TA1Cjf98=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75b1840-699b-442d-f7ab-08d9d96f95c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 04:12:32.6634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXx6Ev6DKXfBO7faJOZapcdDabraKucw4lDQLWV50vX3bWUWF6J0YXvUi9eKDcwMVwJ5Uz000lJAp00q+Ucpt/alJ8k5zZIgVH37i8nHP0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8018
X-Proofpoint-ORIG-GUID: a3A4DmqyXo7wXNX2MNIqEHN1mxBS7YzD
X-Proofpoint-GUID: a3A4DmqyXo7wXNX2MNIqEHN1mxBS7YzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's avoid having to manually copy all elements. Copy only the ones
necessary to close the hole and perform the operation in-place without
a second array.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 30 +++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 1a8fc9d600..7dd8e918b4 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -811,10 +811,8 @@ static inline bool reg_equal(VuDevRegion *vudev_reg,
=20
 static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
-    int i, j;
-    bool found =3D false;
-    VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
     VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region =
=3D &m;
+    int i;
=20
     if (vmsg->fd_num !=3D 1) {
         vmsg_close_fds(vmsg);
@@ -841,28 +839,28 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     DPRINT("    mmap_offset      0x%016"PRIx64"\n",
            msg_region->mmap_offset);
=20
-    for (i =3D 0, j =3D 0; i < dev->nregions; i++) {
-        if (!reg_equal(&dev->regions[i], msg_region)) {
-            shadow_regions[j].gpa =3D dev->regions[i].gpa;
-            shadow_regions[j].size =3D dev->regions[i].size;
-            shadow_regions[j].qva =3D dev->regions[i].qva;
-            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_addr;
-            shadow_regions[j].mmap_offset =3D dev->regions[i].mmap_offset;
-            j++;
-        } else {
-            found =3D true;
+    for (i =3D 0; i < dev->nregions; i++) {
+        if (reg_equal(&dev->regions[i], msg_region)) {
             VuDevRegion *r =3D &dev->regions[i];
             void *m =3D (void *) (uintptr_t) r->mmap_addr;
=20
             if (m) {
                 munmap(m, r->size + r->mmap_offset);
             }
+
+            break;
         }
     }
=20
-    if (found) {
-        memcpy(dev->regions, shadow_regions,
-               sizeof(VuDevRegion) * VHOST_USER_MAX_RAM_SLOTS);
+    if (i < dev->nregions) {
+        /*
+         * Shift all affected entries by 1 to close the hole at index i an=
d
+         * zero out the last entry.
+         */
+        memmove(dev->regions + i, dev->regions + i + 1,
+               sizeof(VuDevRegion) * (dev->nregions - i - 1));
+        memset(dev->regions + dev->nregions - 1, 0,
+               sizeof(VuDevRegion));
         DPRINT("Successfully removed a region\n");
         dev->nregions--;
         vmsg_set_reply_u64(vmsg, 0);
--=20
2.20.1

