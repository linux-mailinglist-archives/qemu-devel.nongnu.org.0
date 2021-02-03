Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3F30D307
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 06:27:11 +0100 (CET)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ah4-0001Od-6p
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 00:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <utkarsh.tripathi@nutanix.com>)
 id 1l7Af6-0000mH-RP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 00:25:08 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:50242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <utkarsh.tripathi@nutanix.com>)
 id 1l7Af1-0003Yp-Qb
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 00:25:07 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1135LkN1009515; Tue, 2 Feb 2021 21:24:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=gqYPVeOZkYSCvP6OzKkqRGP/rePQzwZO07uJSFGqXlg=;
 b=lq4GCEtd5X/D9qjo0TpXU/eJKyKGS4RavYtvD3wiJICWtOOzdqVLkovIpDYhqDOj4bZy
 Pf3luRK4wBSeNYAxO36kux2K6JsFXHcJj2zQlaXvOqA7ANaDaIlsSA92ME6gjOioVviD
 OPFDwr7SYzMUXfNEYncTM84PakLFFOwiGAGFhy8fH+vM77Go2t4joLwLoYUZMXyLUjen
 aKa6XQEm0vKNCM4XbCaO9PvrJpOxnQJ9mqvwL6tVvpUyjaGDHkr3PznGhloCrHgjaJDX
 WD/sRRvxlx1vnokF0Q9vEsrzIL5tq/ZMldYwsJE7s0Nboq4/0bujMB2FveyTUBJkJq7F Ag== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0a-002c1b01.pphosted.com with ESMTP id 36d4nxrhr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 21:24:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kpp1Ikzr1TffQFW1ZzuDF/J4anIcetN84B9VjfJku2traXOZuqokXfgwpDMHodd40vR2oE3FGuJyYkTKTmHMZyMk8K9FJ+WtKAPo+rIHyWGbM/67TqMC2qzJjBTXB9D6J0fy1u1eojb1MxTGdK6iLF4s0G/vOPhaSvCktqCwE6H5KYl6xkEdG1U2fwgmUuXmJa8/Nlsbx6/dmpx2lexDCxETfSjlFbA+HVurtDmwTXkPFZjLTXhNJ07IMNgAmZtVwXCaq8toWTDPad6aEODixh+8C53bg7pvM4zXobVbYrC/6Anrq9fjb8fPNGnyDgb686ZbaG0M0LqqgINxAbsN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqYPVeOZkYSCvP6OzKkqRGP/rePQzwZO07uJSFGqXlg=;
 b=ZmubwbgP8LzNuXWsQjWrEHIKeTVk2B4pov5GapL7T7kb3o0S10IcMu92KMnZ5LccUYDGjKoQmcysTf5xMgw4B+//CvQ9J8l/nxBb2hgVbhiu+6Yc6PiWHdMS8HL/FghxVrRfDGyd1LYc+I3SgQGvb4d6xZpZs4D22RyB/H5vpkplk3MMKX9eHG1r7LgZlgS5qqHFuIg8qcT4q+tCslspEJ03u3p9kRf+ek80qDrlx5W2eLFqlXUCyG9ESM2AzhbHUzG9IqYSrVwH2h2ds0WEJaayimztIqQlpUSSS9ccoifCJk28x+FAABaFJ8yarQtXkQfd9Suq8VxRIA1ZP9XOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW4PR02MB7268.namprd02.prod.outlook.com (2603:10b6:303:78::24)
 by MWHPR02MB3247.namprd02.prod.outlook.com (2603:10b6:301:66::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 3 Feb
 2021 05:24:56 +0000
Received: from MW4PR02MB7268.namprd02.prod.outlook.com
 ([fe80::640f:91f2:9df1:500d]) by MW4PR02MB7268.namprd02.prod.outlook.com
 ([fe80::640f:91f2:9df1:500d%5]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 05:24:56 +0000
From: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] cpu-throttle: Remove timer_mod() from cpu_throttle_set()
Thread-Topic: [PATCH] cpu-throttle: Remove timer_mod() from cpu_throttle_set()
Thread-Index: AQHW33a9yL7T0vMDPUmxUCBRtxBkH6pGGobN
Date: Wed, 3 Feb 2021 05:24:56 +0000
Message-ID: <MW4PR02MB726836E1124C3CCE6784880D83B49@MW4PR02MB7268.namprd02.prod.outlook.com>
References: <1609420384-119407-1-git-send-email-utkarsh.tripathi@nutanix.com>
In-Reply-To: <1609420384-119407-1-git-send-email-utkarsh.tripathi@nutanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [2405:201:6002:8a:8503:f062:5504:6c45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8ebfb55-2de5-4598-a2b2-08d8c8040ae8
x-ms-traffictypediagnostic: MWHPR02MB3247:
x-microsoft-antispam-prvs: <MWHPR02MB324738EACDA2172292BF713783B49@MWHPR02MB3247.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S4XN+ec9tP970FklwcG20xtjBMGPIVINGIg0e7bKAHyMFozQVlsPpvWkaWr0pxTqrucSeLSujyp5de+0he0YzF2bemMaS1+pnPQ5p5X1ulgpswuk5BP6g+44JaRjyWI+3qhFq4jhSMzulQ7I6WwUbTFWn2l+iFqxm5alH3cjTAiQ9jaPEWocmy6k7aMX19AiN51dOA4o21o9hTkfI7UC5VErOcRiw16TQcWd33DKdpFhrGO5vF5rf43lQ9ZGwaAx9w/wqqNG5BCb1S5vcLlXcKOLJSwSj+GX3yWT+e0YNDwoI/G1JzFzZBrLW67MRSxvf7bl6+lhmTbQ5v3Dt3x+146qeARzbiXvcMJRJdPp7Q6EEYtDsBXh/k2S71xzkZDjaKYMjbZPN/95mnvmJsxDwSshmBjZgdwlac1wqpdlW1fFSZo4pAR9uJZ3ul7Hpt/gAfC7BliD3Ky0hOgXJ5BbaXyXMrDkQgGfI36a0IZ0EfbI2nM1bZWqzUXtVnAeQwrtOqhhUwEtcK1q21EZk2SpSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7268.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(376002)(346002)(136003)(66476007)(71200400001)(316002)(6916009)(66556008)(66946007)(86362001)(44832011)(186003)(83380400001)(9686003)(76116006)(91956017)(2906002)(8676002)(478600001)(4326008)(53546011)(33656002)(7696005)(8936002)(52536014)(64756008)(66446008)(5660300002)(6506007)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kpD9zdRyuDzsvUfoHABIZCAKOfe9ncoxYtr9X6cfVfJ/wpsS9mfGhjcLiQCs?=
 =?us-ascii?Q?zpbU+lxJavJYM8pIQt70tuV4hVLvxQ0Muo7u5577Ley3kFTp3q3huFVbbrVB?=
 =?us-ascii?Q?1Hb6/PAsjpaH6/5KOoveu8JlM17lQELr/w6GnoNhNMBV36+HhB6YqwvnVeQx?=
 =?us-ascii?Q?hSeibha9MV4A7iAMUb89EYd9w+ViZ03Ylyukf8p2QBoktbLbWTUf4bUbpmgI?=
 =?us-ascii?Q?zB1lFk2dOZJreiKl65nSCf2CmH048rBr7B+/lv3LwV0lYhXNsjc1Si9s8M5N?=
 =?us-ascii?Q?/R/Bp3+qltku1mKECR+o2o1Y0469QSvb6SHOLkhf191174dBjBCEOs2i0hiY?=
 =?us-ascii?Q?/iAYVVXT3aLXBF65aDci9Slg/8p733x5vhntbwiJuq5xli6LIJk9gv3qFFqm?=
 =?us-ascii?Q?LRWHC/w7XzCwYQ7tlXYLpzDMkSvtUOOue1Ura5ZLzkDTxrkhzsgpV7V8AnkN?=
 =?us-ascii?Q?Q/Beho1JOSi4CNKxtFFm6NUBK2dN9N8Wdw7O+njpsKchIs/H7ZkbpS+HHCMZ?=
 =?us-ascii?Q?cufipUL7TBF9Q4LGnOou3xx4UvLM8Ro1BH9+Zj5BpOm+zA2gC9hzrNO8vIca?=
 =?us-ascii?Q?7Y9S8huERcERK0/KE1uavVJwuNPMKTjCk+vdkAGJ28O3/RfTr0vsvK+fnlnu?=
 =?us-ascii?Q?b7jDm435fflwqFZU0TyAVDHOw1kMWE3kPUhQzJ43o1zF7WVFieqJufkNKM8l?=
 =?us-ascii?Q?3YnzJ9L9znD3Tuw6795ZzZRgmx7sb5TfkIYh3InRiXtHONX3oY7JOqKJVsyd?=
 =?us-ascii?Q?kqL1y5PWsOZkYzPGr2lx01ny8DEwceCDIWlWZBVY37o2BpJyyyZIu73wjsA6?=
 =?us-ascii?Q?Vs+mZVx6gkoG4UduPt5cngelljpBg7BiXBNmNZHzIdOBD2231mISGKvqNqRG?=
 =?us-ascii?Q?Z5v8Sl3mQCSRtU74dr1tggYbRF0OV15lW18XFgolUdWAvFvcrWPmhFsOf4fG?=
 =?us-ascii?Q?ZwVoxVTDdzWJyAoGGQCCTmVZ4KndFqvPJ/qERsYAPUWrHb2qg0zZofoQcsaV?=
 =?us-ascii?Q?EwTLzz8ZrRkBjQmI4lTtJ+/FBiq9aapyVXtkSJQlnpV3bTg/tXT4z+IybaHg?=
 =?us-ascii?Q?F8gkTkCBlIOOwQq5t34e7oXaBrUfvjUIOflE3ma6kRkQ8gg3Sr0pnO15lI5R?=
 =?us-ascii?Q?cBUxGnC0emA38nghG81iE5a0RAB35dMkGw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MW4PR02MB726836E1124C3CCE6784880D83B49MW4PR02MB7268namp_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7268.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ebfb55-2de5-4598-a2b2-08d8c8040ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 05:24:56.0541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MjcLWveDnd+ASxdyGNIVmyx0WomphcUyjhP+2pcRv6zXfYfS3pPHdOBTh5mSBjOtJhaoygD0DyK4T49dpokpKPSPJmpkSn6WX9S9pepxylE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3247
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=utkarsh.tripathi@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_MW4PR02MB726836E1124C3CCE6784880D83B49MW4PR02MB7268namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

PING

From: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
Date: Thursday, 31 December 2020 at 6:43 PM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>, Paolo Bonzini <pbonzin=
i@redhat.com>
Subject: [PATCH] cpu-throttle: Remove timer_mod() from cpu_throttle_set()
During migrations, after each iteration, cpu_throttle_set() is called,
which irrespective of input, re-arms the timer according to value of
new_throttle_pct. This causes cpu_throttle_thread() to be delayed in
getting scheduled and consqeuntly lets guest run for more time than what
the throttle value should allow. This leads to spikes in guest throughput
at high cpu-throttle percentage whenever cpu_throttle_set() is called.

A solution would be not to modify the timer immediately in
cpu_throttle_set(), instead, only modify throttle_percentage so that the
throttle would automatically adjust to the required percentage when
cpu_throttle_timer_tick() is invoked.

Manually tested the patch using following configuration:

Guest:
Centos7 (3.10.0-123.el7.x86_64)
Total Memory - 64GB , CPUs - 16
Tool used - stress (1.0.4)
Workload - stress --vm 32 --vm-bytes 1G --vm-keep

Migration Parameters:
Network Bandwidth - 500MBPS
cpu-throttle-initial - 99

Results:
With timer_mod(): fails to converge, continues indefinitely
Without timer_mod(): converges in 249 sec

Signed-off-by: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
---
 softmmu/cpu-throttle.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
index 2ec4b8e..8c2144a 100644
--- a/softmmu/cpu-throttle.c
+++ b/softmmu/cpu-throttle.c
@@ -90,14 +90,21 @@ static void cpu_throttle_timer_tick(void *opaque)

 void cpu_throttle_set(int new_throttle_pct)
 {
+    /*
+     * boolean to store whether throttle is already active or not,
+     * before modifying throttle_percentage
+     */
+    bool throttle_active =3D cpu_throttle_active();
+
     /* Ensure throttle percentage is within valid range */
     new_throttle_pct =3D MIN(new_throttle_pct, CPU_THROTTLE_PCT_MAX);
     new_throttle_pct =3D MAX(new_throttle_pct, CPU_THROTTLE_PCT_MIN);

     qatomic_set(&throttle_percentage, new_throttle_pct);

-    timer_mod(throttle_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL_RT) +
-                                       CPU_THROTTLE_TIMESLICE_NS);
+    if (!throttle_active) {
+        cpu_throttle_timer_tick(NULL);
+    }
 }

 void cpu_throttle_stop(void)
--
1.8.3.1

--_000_MW4PR02MB726836E1124C3CCE6784880D83B49MW4PR02MB7268namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">PING<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Utkarsh Tripathi &l=
t;utkarsh.tripathi@nutanix.com&gt;<br>
<b>Date: </b>Thursday, 31 December 2020 at 6:43 PM<br>
<b>To: </b>qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc: </b>Utkarsh Tripathi &lt;utkarsh.tripathi@nutanix.com&gt;, Paolo Bon=
zini &lt;pbonzini@redhat.com&gt;<br>
<b>Subject: </b>[PATCH] cpu-throttle: Remove timer_mod() from cpu_throttle_=
set()<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">During migrations, af=
ter each iteration, cpu_throttle_set() is called,<br>
which irrespective of input, re-arms the timer according to value of<br>
new_throttle_pct. This causes cpu_throttle_thread() to be delayed in<br>
getting scheduled and consqeuntly lets guest run for more time than what<br=
>
the throttle value should allow. This leads to spikes in guest throughput<b=
r>
at high cpu-throttle percentage whenever cpu_throttle_set() is called.<br>
<br>
A solution would be not to modify the timer immediately in<br>
cpu_throttle_set(), instead, only modify throttle_percentage so that the<br=
>
throttle would automatically adjust to the required percentage when<br>
cpu_throttle_timer_tick() is invoked.<br>
<br>
Manually tested the patch using following configuration:<br>
<br>
Guest:<br>
Centos7 (3.10.0-123.el7.x86_64)<br>
Total Memory - 64GB , CPUs - 16<br>
Tool used - stress (1.0.4)<br>
Workload - stress --vm 32 --vm-bytes 1G --vm-keep<br>
<br>
Migration Parameters:<br>
Network Bandwidth - 500MBPS<br>
cpu-throttle-initial - 99<br>
<br>
Results:<br>
With timer_mod(): fails to converge, continues indefinitely<br>
Without timer_mod(): converges in 249 sec<br>
<br>
Signed-off-by: Utkarsh Tripathi &lt;utkarsh.tripathi@nutanix.com&gt;<br>
---<br>
&nbsp;softmmu/cpu-throttle.c | 11 +++++++++--<br>
&nbsp;1 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c<br>
index 2ec4b8e..8c2144a 100644<br>
--- a/softmmu/cpu-throttle.c<br>
+++ b/softmmu/cpu-throttle.c<br>
@@ -90,14 +90,21 @@ static void cpu_throttle_timer_tick(void *opaque)<br>
&nbsp;<br>
&nbsp;void cpu_throttle_set(int new_throttle_pct)<br>
&nbsp;{<br>
+&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp; * boolean to store whether throttle is already ac=
tive or not,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; * before modifying throttle_percentage<br>
+&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp; bool throttle_active =3D cpu_throttle_active();<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* Ensure throttle percentage is within valid rang=
e */<br>
&nbsp;&nbsp;&nbsp;&nbsp; new_throttle_pct =3D MIN(new_throttle_pct, CPU_THR=
OTTLE_PCT_MAX);<br>
&nbsp;&nbsp;&nbsp;&nbsp; new_throttle_pct =3D MAX(new_throttle_pct, CPU_THR=
OTTLE_PCT_MIN);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; qatomic_set(&amp;throttle_percentage, new_throttle=
_pct);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; timer_mod(throttle_timer, qemu_clock_get_ns(QEMU_CLOCK_=
VIRTUAL_RT) +<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; CPU_THROTTLE_TIMESLICE_NS);<br>
+&nbsp;&nbsp;&nbsp; if (!throttle_active) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_throttle_timer_tick(NULL);<=
br>
+&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;void cpu_throttle_stop(void)<br>
-- <br>
1.8.3.1<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_MW4PR02MB726836E1124C3CCE6784880D83B49MW4PR02MB7268namp_--

