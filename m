Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9CC64C5A9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 10:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5NrW-0003sv-8q; Wed, 14 Dec 2022 04:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p5NrP-0003qW-P8
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:15:31 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p5NrM-0000XF-Ci
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671009328; x=1702545328;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=cKQxHTnRT0K3dgCwRDIL3XG64zWTKjXT939wEe9g6Mo=;
 b=ihXvcArm341PzTJB/zhCuZ2vYS1FG23GJmFbW1km2SVYWVJzTP+R6X7E
 0ebJhqfI8Ub+MmS4Nacmb0ua0yY4dyNMhP1NTcDdU8OJIqtzsqEK9n1kv
 J7GD2oMltzBtkXcr5+5ZuXC8H/ZLXk7RvoNz8iipUD32IM3qREJoduPy7
 NZKtICHKMt0fK+kjdIhCQjgbgG3vDJzQSX0b5pODm4/mYfSRJ2FRc2hLg
 6hFRvqDpajIUOdmCDC00pPBNE3VjfFZEBUDVi1Z7UiSIgjpBhkf6dAJ0f
 xbe8Eq+0sG9I07EHzZog7vub1ORYTV98FCauXnvh9ql40VKad8QEt1LB1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="298703475"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
 d="scan'208,217";a="298703475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 01:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="599155649"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
 d="scan'208,217";a="599155649"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 14 Dec 2022 01:15:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 14 Dec 2022 01:15:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 14 Dec 2022 01:15:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 14 Dec 2022 01:15:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrAQ1rVPBnAiuSMCgtwS5gUqCLyg52hEkGJPGzGDiIYRoWnaCoE7kX0zDJT7xAeIqO6/tfa4Ym7YZYT2Xdjc8wBAlaPpdCmsy0wmlg5lTQYLCe9Y74lBYLFydUO50ZQhT79ek2AXGUUnrEk1Zhlwuzchl5jQQHRKENQ0glcDPNYOrwzbzcW1i5XhWn07Fmf7FHW5/DYHhgIJqdkMjTEkH4e/kz4YzkKjVbmHPcEZKuWUJD0lHl+9vgjeIrkWznYk9YSJ5LYBjEwpaI957qgUOdebwSYj955AC0/U6JxAm8jfUc2LqWZvTaw9PNC1B5cwNSVinjnfutkRTgNUuotE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IgoJ5J5t/YDG2+pEp/bRGEZqNXNTNfubKMvpwoGSQI=;
 b=Hzx4LPIb8kg7c5Ji/MCAvuMjswimteAkS32AEEWLKcHs8mV+Xb6mluuL4etIm5iSLM+TUpCSqpu7U9/75oy9Ljpb/p33ztBvBzThd5SKIBrK9s8xKgGfpkxiHXeaG2X16mmc0s8LLHbrIpOK+X/AezWbz1ljsAy9E4kXXY97aitKUdkn9EHT8XjCmHCC91ealUKXWm6LeCLThC4ZPhxv1QgZkT+RxBoz8cCBCYdwB8rrINFBVsBYU30FyZ/UVMlyLYCraziLNAXbvVy5kJgEOoAE0bMYnFF9K4fOzqsrckMRezmyaSDHavGyxT8UIeS/lDBpN/eddLt9ajeTE5kWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 09:15:15 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 09:15:14 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: Thomas Huth <thuth@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkLtcw/di6dL/H4TWa/2VV8k407Tw==
Date: Wed, 14 Dec 2022 09:15:14 +0000
Message-ID: <DM6PR11MB4090F9D06DC171C4B9C7D97587E09@DM6PR11MB4090.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|MW5PR11MB5762:EE_
x-ms-office365-filtering-correlation-id: 4216a7a6-19e0-4068-219e-08daddb3b5ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HReKr/CKwlEfYNzS/P+3kqgF3xQtK69BcB4n56NR2qawknJNZTBozzsBJ2wZ6i7hr5HYzNoIU8nY+zOsUrpA4NdgVx7o8JSMWQvOPtB85NXPkgYoI4eyDP3upLYLDXB0k+5Tp5p8iAPefUYs4mS51xoJ8S3i2H+WUwHz4+fhjXYwmUfGxTnKdndOs2QMzejpf8Rbt9eqZWT7yx2akcbmFzEk9ocvIUa0YV7m8RuWgdTdAOXVyWB8ch9AixEfD9Nw4aNtKxU4x8HhF9UKe3AG1MV5uGDeRVuL9fjo5Hej3Z6/kN5qNXzMeN5AIYIHS+5JvZzcNI1rVEb08+0sMBOQgtpWQpWgpqFgAq3syON5NK4W4LLtiNo+fMiaqS7JVouScajRRFm4rE2l1BgxxWbQ1N1I6Hdpns4kTDM0MOHCp3AFiDAwwTzqd51LDr33SPSIOcuLSJP7cNKRP5cqADLNF0t3SRU2Gmsor2j1w+v1d5BC1ejwelLtcSm/8XhpXQAXMjJc7QTdg6zkKWuocaYdnnn9gGBpmTLcHxhJVnhLaeM33RA/W426OqRuB5tfmBloxBHFQzvcwCND7q7uZaue/AtTpyjcsvKL7yFOxX/GTOFWWG2uqcFba2Ip0RMa5xRlXOnwlJrJYi5K1DC7FHEkESc9GF+i8u8AdXoHzB5P74Tmd/ViTFig00Mz5GoDqfnQGgCNUzU4iIM0a/GMSJqXjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199015)(122000001)(38070700005)(38100700002)(82960400001)(33656002)(316002)(86362001)(478600001)(71200400001)(6916009)(8936002)(52536014)(66476007)(64756008)(2906002)(66446008)(76116006)(66556008)(5660300002)(41300700001)(66946007)(4326008)(8676002)(83380400001)(7696005)(6506007)(9686003)(55016003)(186003)(53546011)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4KwRlCdkPk9p8nVU11y7fyxVYw7ymohicYmelMVPz4HXblE4NwFekOUgQmjt?=
 =?us-ascii?Q?XhPsicvMfiRkDJE9YN5Fox7CyOWF5L+dTT9W38/ZgnAYxmLNevREjHdB4Vzd?=
 =?us-ascii?Q?7jbLPgigr8rXQTEcMzTKWeSSUkdie7VfgclCDJZvSCxzCtr0rECibPPwC7oO?=
 =?us-ascii?Q?hL224a8hE07KmJSftgIXdqw1LdqcHSLKROxvXP+8XRCT8tVmxvacxQfXXCVh?=
 =?us-ascii?Q?1Ray13P8Wa5TSgdpRH9gbmEL8XGBIRwWsQ7EqvcYkVSfYvS/pa4wC86C44s4?=
 =?us-ascii?Q?cwbBcfOoemMVbhjHiK5Whsvjd4RlgbYek9ltd2eVYQUqJHas/olRrQePbfaZ?=
 =?us-ascii?Q?YNCTmlToLulQqk9clRnVQc0XLj8ClmVd+ixvDMRyyCuS5SRKwDNEv55mGPfF?=
 =?us-ascii?Q?yPiJUZtDI66BoPUzK99lA2DnmDgcCSdhw1WDHSfWgyfLLG/vhwW2YUFePgIb?=
 =?us-ascii?Q?3cONolswWU0EXHX0RXs2ceMYTg41pgwxFUhYyO4QnjwUBiwYNC3zFMrpPLDM?=
 =?us-ascii?Q?6lwEeTlsbKuPRCKMsUMx/GG089f7I1KpcOE9vnkaMspLdDSm2qckcr5syk0a?=
 =?us-ascii?Q?AtcbZwvqOSGm6zsVIGmPr9adiULbwkIZW61WpzbP/ywyCtDei0pIWq1U1PQE?=
 =?us-ascii?Q?3YSle6AmTAVy3oiqMYLIcxWNi2dpcGZ8KKjEZO/30HzIVHitmbVbVjybBLNH?=
 =?us-ascii?Q?9rETxrnjjhc3CP2a13rgsWm9ySlEwQzUoWlr1Bd4PbGYYX/MYlEGkU0F/LUH?=
 =?us-ascii?Q?JefWxGCpt1gKVgC1mYNnMA33LXwFihGUEiR+RhunLzPNbyfN+DTnQ49obj3Q?=
 =?us-ascii?Q?V49qCd1QkKbFLUmPB0vcVrIK6IPdEeYbVzGgalcjp4ikT/Qd/R0UheNCJ+tq?=
 =?us-ascii?Q?MX8kYWtPfDfnf2ZtcGAZH8gZBMzCTFCjfSlOhpv3Qxc2sKaaGHYR/rNEI4lu?=
 =?us-ascii?Q?jEKSiC4qZRmNo5koB/DBSUGgOC6jKakqo9QodHjBvdwFX+RXOaicdcgND/pc?=
 =?us-ascii?Q?/XKcuYiJSGbWhv463giyBP8U1rlDgIfYBxMTJ+SNPdeHdLn1IVJQGMPIzbNR?=
 =?us-ascii?Q?9Hsh6rt+/fPIgLsJWpLgXJcmrn+iAb4z1MAl654zrCQvl5g6OHS+M8dCEYZU?=
 =?us-ascii?Q?Mhwb2XXUlMnqysoRuv5IAW/gTu/rml2GIVUq0buIjLdyl/y1qqrqHaZYVZof?=
 =?us-ascii?Q?7XBHkMUEZeRLsHGJdNk2EucClD4kt4KYRIE9BDbbpA5VtrAuJFOF7QtGm3j8?=
 =?us-ascii?Q?GC7/Nf//3PhJVpniNmg5EUL38bFpxGs8rIqdmpT7UW+romX/yBkUqZxakyzi?=
 =?us-ascii?Q?nv16UlmMNEAaTYY4OwF20Xoz/G5I6+jU24tiyWRSEBtP8h+veQslAZ2VnInq?=
 =?us-ascii?Q?bHy7nJepqUGSN0xNzYvUEJkN3utGANX/11TX8mhOXjtqETVnFCKGVhiDMWHz?=
 =?us-ascii?Q?7n2lGclAHmPiAXJun87fxUEr2LIdVYhOfPOt4SbWuQxAP/r0YwXVeX5Xe9R6?=
 =?us-ascii?Q?1/TRPm6AIjMLr3v6mLTX9U1/6MGh2HBvKdulTpOQuCCUsL6JRFLYTev/QQ0+?=
 =?us-ascii?Q?9UpnNHDUagO+3RNm9dyLJCRJ7qyN2uN+1r23xYSl?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB4090F9D06DC171C4B9C7D97587E09DM6PR11MB4090namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4216a7a6-19e0-4068-219e-08daddb3b5ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 09:15:14.6822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeqYaRgpnQPhrKlDzBRQfVxdu/qsyjt05+VzYZlSGvo0itADVTeLCk7zrvRFPz9XTFXjuCTiwzevw8r4MVXJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=wenchao.wang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

--_000_DM6PR11MB4090F9D06DC171C4B9C7D97587E09DM6PR11MB4090namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

As HAXM v7.8.0 is released and it added XCR0 support, it needs this patch t=
o add corresponding support into HAX user space of QEMU. I have pushed this=
 merge request before and Philippe has reviewed it and he thought the chang=
e is correct. If no one else raises any other opinion, could you help to me=
rge this patch for HAX? We have verified the patched QEMU and it can launch=
 all guest OSes. Thanks for your support.


Best Regards,
Wenchao


---------------------------------



From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Sep 17 00:00:00 2001

From: Wenchao Wang <wenchao.wang@intel.com<mailto:wenchao.wang@intel.com>>

Date: Fri, 25 Nov 2022 18:37:34 +0800

Subject: [PATCH] target/i386/hax: Add XCR0 support



Introduce extended control register XCR0 to support XSAVE feature set.



Note: This change requires at least HAXM v7.8.0 to support.



Reviewed-by: Hang Yuan <hang.yuan@intel.com<mailto:hang.yuan@intel.com>>

Signed-off-by: Wenchao Wang <wenchao.wang@intel.com<mailto:wenchao.wang@int=
el.com>>

---

target/i386/hax/hax-interface.h | 2 ++

1 file changed, 2 insertions(+)



diff --git a/target/i386/hax/hax-interface.h b/target/i386/hax/hax-interfac=
e.h index 537ae084e9..1d13bb2380 100644

--- a/target/i386/hax/hax-interface.h

+++ b/target/i386/hax/hax-interface.h

@@ -201,6 +201,8 @@ struct vcpu_state_t {

     uint64_t _cr3;

     uint64_t _cr4;



+    uint64_t _xcr0;

+

     uint64_t _dr0;

     uint64_t _dr1;

     uint64_t _dr2;

--

2.17.1


--_000_DM6PR11MB4090F9D06DC171C4B9C7D97587E09DM6PR11MB4090namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, Thomas,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As HAXM v7.8.0 is released and it added XCR0 support=
, it needs this patch to add corresponding support into HAX user space of Q=
EMU. I have pushed this merge request before and Philippe has reviewed it a=
nd he thought the change is correct.
 If no one else raises any other opinion, could you help to merge this patc=
h for HAX? We have verified the patched QEMU and it can launch all guest OS=
es. Thanks for your support.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Wenchao<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">---------------------------------<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">From b1789f2523d06798b8883664bfa9a9df797bfccf Mon=
 Sep 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoPlainText">From: Wenchao Wang &lt;<a href=3D"mailto:wenchao.=
wang@intel.com">wenchao.wang@intel.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">Date: Fri, 25 Nov 2022 18:37:34 +0800<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">Subject: [PATCH] target/i386/hax: Add XCR0 suppor=
t<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Introduce extended control register XCR0 to suppo=
rt XSAVE feature set.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Note: This change requires at least HAXM v7.8.0 t=
o support.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Reviewed-by: Hang Yuan &lt;<a href=3D"mailto:hang=
.yuan@intel.com">hang.yuan@intel.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">Signed-off-by: Wenchao Wang &lt;<a href=3D"mailto=
:wenchao.wang@intel.com">wenchao.wang@intel.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">---<o:p></o:p></p>
<p class=3D"MsoPlainText">target/i386/hax/hax-interface.h | 2 ++<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">1 file changed, 2 insertions(+)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">diff --git a/target/i386/hax/hax-interface.h b/ta=
rget/i386/hax/hax-interface.h index 537ae084e9..1d13bb2380 100644<o:p></o:p=
></p>
<p class=3D"MsoPlainText">--- a/target/i386/hax/hax-interface.h<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">+++ b/target/i386/hax/hax-interface.h<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">@@ -201,6 +201,8 @@ struct vcpu_state_t {<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _cr3;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _cr4;<o:p></o:p=
></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">+&nbsp;&nbsp;&nbsp; uint64_t _xcr0;<o:p></o:p></p=
>
<p class=3D"MsoPlainText">+<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _dr0;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _dr1;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _dr2;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">--<o:p></o:p></p>
<p class=3D"MsoPlainText">2.17.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB4090F9D06DC171C4B9C7D97587E09DM6PR11MB4090namp_--

