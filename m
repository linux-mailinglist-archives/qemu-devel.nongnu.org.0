Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1F3D99B8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 01:48:04 +0200 (CEST)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8tHO-0007M9-Od
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 19:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m8tE7-0006G2-6p; Wed, 28 Jul 2021 19:44:39 -0400
Received: from esa5.fujitsucc.c3s2.iphmx.com ([68.232.159.76]:40288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m8tE4-0001b3-6v; Wed, 28 Jul 2021 19:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627515876; x=1659051876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0qGhqb/pY/2Y5EgTm2k/w9Spg4daTVLoVwMYiSG2PEQ=;
 b=Xv8sJQaBtrg4S9xiUHIWJBgK0WQ++vBvHjxfU2w7oW2oB0GT2iZs2vza
 HvW/oSvDo/AbvqZryFyWz2ZhUWJ7OmXys6PM/RRbXOo9W5egWE2xUKWXo
 xYO4l5mG2LzFoO+QpfGNmdtbioLsYovLe2j4NjKtI+sJA6sJl+4P8ynCD
 vp9cdf3DMk43lnyF0oq7ll2VArlvy6XSzFmhvxngRHCCnqkFW54BL4gxP
 y50+g1OjrQuET9+4wlw8gKbHlLBDDMJPAw3avMtaQp3d4q6+7A27SVyY1
 G86up5U69PjGRJp1tidkv0UCoNEE/DY6oolLFueDg4r+78IBqtuLp2G9R w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="35765766"
X-IronPort-AV: E=Sophos;i="5.84,276,1620658800"; d="scan'208";a="35765766"
Received: from mail-pu1apc01lp2057.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 08:44:30 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ojo44IFtCxGcsaIJxDB93sdd6AR0smyaIUiz47Pv4TxOvfbab7ZEVVUPYpuzaWdm3Fu1HfjzAsGeR91KTXv4tjNG/67no2M6tJm5bjD32WPibaMyqvQ4qIy6Jcm52TDZbFxwWdyHtQg9ZzOREXxH/2Dt52g7soOOSjgcbnghs8Fl7tHCVVA13jUx/xTOTvJjVI4S0OOLPxG2nlux9youJC9/Snuo88FgE1Ma7udCgL+xe4KwJc66svh+EPOBi2y+bQVCY5NnuW7PBwEw2i/8cdU1qZ39jKHB5PUYM401g9ump4BW55PQtuTcz5QerXTy5OQfc5t2+Sm78DVFunV2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qGhqb/pY/2Y5EgTm2k/w9Spg4daTVLoVwMYiSG2PEQ=;
 b=J4ER0H3RVFNX8JBp/UZtj3qyq4LUu25+3upTdRe19mPUMHdB//WvUyPxj+C5xv1YxxU9wcyX+EoDxxYzvJaEsMKY5YnlcV80AKOqk/HR7vufa8kEcYvf+6LmhhYAemr79RZaVf7eYlCk7hMdHhn9Z3c6b7l4qjPq2rZ6BoYf+RvgHAFhSu2K5QbQ7HM5eobqiKqHI/QP/C/Rqhe0HzcXjVNg1vZ/asRP+m+rbQGrVpWu+/b2A7jgOhZ+nfWXvnaKaNKL4G8rXCinfWlfZrMZdgRH42IH5w02HDZMPSi1NhCFC2Pqq30j5rIPH0aKJhGjs5k9ub0q5x2OMtk/J6MltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qGhqb/pY/2Y5EgTm2k/w9Spg4daTVLoVwMYiSG2PEQ=;
 b=Hj1OxKEtePrc+6zAkExM/PT8XVv1LfCLlHe7/E69SetKCQEDB2re+gHIi74AZBzHYKzHW3SWA2i9iA6Mz7oZgV37fJUGyaDi9Ub7QpFV2gUCi+BK9KyZ2H1K8Wuhvgyp7XRi4Q4saqeTSapz3GoZ4zDdvggWIOcXOVrZHDg9AAM=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TY2PR01MB3916.jpnprd01.prod.outlook.com (2603:1096:404:e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 23:44:27 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4373.021; Wed, 28 Jul 2021
 23:44:26 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH v2] This is a test mail
Thread-Topic: [PATCH v2] This is a test mail
Thread-Index: AQHXgfchhDu0sJ7xaEysUeLESXxCSqtVBp+AgAQIgYA=
Date: Wed, 28 Jul 2021 23:44:26 +0000
Message-ID: <TYCPR01MB616021B2E87B70F902E199DCE9EA9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA8dJ_=zroP1vuXA2Lndq=ahTjQ8N=jXSzUDvBmw-QQmUA@mail.gmail.com>
In-Reply-To: <CAFEAcA8dJ_=zroP1vuXA2Lndq=ahTjQ8N=jXSzUDvBmw-QQmUA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ODA1MWY4ZDQtYzk5Ni00ZjlkLTlkZjYtNTRiNzliM2Y3?=
 =?utf-8?B?YjMzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wNy0yOFQyMzozNzoyOVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55d9ec0e-7e3d-4b8c-9354-08d95221a2e4
x-ms-traffictypediagnostic: TY2PR01MB3916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3916318B54145E3F44BB1A87E9EA9@TY2PR01MB3916.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ophqudMdPYN8hgiFQyDhJvs4LUwrR30Xy4fUWGknqydsUOQVNGlznQ5jE8roLOG8rqEIX3/KHwY4YPA6ApsZ5XS9BkITUhiXRornh06n17Bp/r8douZmbmBPA8Ro3RffalSp6OYWG7fNDii/BndaaoUrCjFZFFzMa6T6csuv/ZBaj3KIjX20OU5qwwVsPtwbN8pY2CDhsDGjloGgG6JTpDy8ssO69alTycAi9GwWf7uKu5Yrzacz2gMfelxh8lG+KMz7aKO4kNa0Gzjyzc6rdPxIp/v8sXDLnnSltfhLVum87Wm4LAjZURt4AFqq25P6XxRlz+fw3+qt9ZiSHxZtcfgmNsM8sNhLPMCMo0ZYLenBuuC/BNSY7Lvak13maKwFcWoXe1ERSmxtPPcnJ/JMDvqlx0CXbCIGowu/CNpqkEjRLRJQ+hEk8Ds3r9VZVNfe+oUFdR3q7DMPvVdaWzyHw+/GLoMM2h35C9bvDopwYDo4sDPBI3IA87LFnQ1/Mcajbu6OBaB/5oyrQFkXjaunkZp9kG/KXYjsLceqzY1RN2rlCa4IeNeWkQzwF3FHIgX4N98EtNx4ukUY/URRb0i9q6PYl5bZ5eFtoN9urLUDuhaK5KvhLabkmrtYQdeyKQM6zZVHSu0XqCnoQJXgbJ8mh9YEXbABAfdfdpyJ8G1vVjRnvuxD87HHYS52fyn+V7cFI19NS0W7eN/zalXMLGDnWZ1WHiWrTkc6z12297GSLhhv/EWQlJZCUcIeShhKuRxiA2ephArtt1RQUcKWfnzaR2wEqwwZqUPHz0bzt3Xzltk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(52536014)(66476007)(55016002)(316002)(66446008)(107886003)(8676002)(71200400001)(8936002)(66556008)(64756008)(966005)(66946007)(76116006)(86362001)(53546011)(7696005)(54906003)(26005)(186003)(83380400001)(33656002)(4326008)(9686003)(5660300002)(2906002)(478600001)(6506007)(85182001)(38100700002)(122000001)(6916009)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEtJUlpIbWsrb29rUmpjU0RFWHlpSVpYUFNCQktjNlQ0c2JZV2g5cE5EKytF?=
 =?utf-8?B?dGZxL2JobUU5ejRtMjdPdGpkaUFnK2NGTXFpaFIzbTl4ZlRQOWplcVpjRHRk?=
 =?utf-8?B?aWJKT0IyUHo2UUtTbE96SktrVGJTYXd0OGdsNk5zR2hoQVQ0eHNzMTR1K2Jm?=
 =?utf-8?B?SFpSYUQyMWJ4S2YzYW9PTjF0cVVCYVIxVkFjZ1dOSXBiRFBHVldSa2tlakxY?=
 =?utf-8?B?U0U0aXBEU1pMZit6bnlhL21RejBNTjFWQmJyTGNNanlpcjlDVUNsdm9rbFFj?=
 =?utf-8?B?Y2ExN0N5NG1QRlduUkI1MWNqWXdQVTNUL3N4UTJ4VG1GaHFBQWJ3R3U2Y1Ur?=
 =?utf-8?B?UWsxYzVQNzg2bEl1Rjd5K3hzMWs0Q2FWb1R3cHVQRGRRWmlOTThIais1czNu?=
 =?utf-8?B?WDMrR01EYjd0Q011dGt1dzJLczlEand4Sm1qYTlIaFA0Z3RMaldPb3JqTVBM?=
 =?utf-8?B?dU1JYkxTVUZmai9icTN6YlI2NVluTm1EQmxkYmRjMGNvTy8wcm51MVpJaHVX?=
 =?utf-8?B?ZkJiVEpSYlhRUjFXVjV5WHJoM0cxY2pjZi8wUy9zVTNLM2NTMytjaGxMVGhw?=
 =?utf-8?B?citKS20rK0lSSTg0dWZzeDIxZlN5eVhDZEhRbU1lS0VKbXBBVnpxNElvREVM?=
 =?utf-8?B?UndrWTFrTCtIZTJ1NGRLZjk5YXZsZVBXODNHbW9xY0NIYktzaXpDVHFUWW1t?=
 =?utf-8?B?K05DVnpxVU4zYUdGd3FkVUFmOXZXeUgwempCL1NhUU4wYUpST1V0cWNUZy8r?=
 =?utf-8?B?REo5bldjZkNta1JRdllTVG9tc2c1WENoOUdoY0ZheTVrMWFqSWpqQXA2NytK?=
 =?utf-8?B?QTZIS0RIVkFCb2dYYVFwdEtodnlIT2I1RlEveXdGckxpcUtzVFVreXlIQzc0?=
 =?utf-8?B?cG9iQjZCY1pVbHErQllibzF6SFRDMEp2MTVPb0Zsd0xkNGx6TEwrU2lzQndm?=
 =?utf-8?B?TVRQMmNYL20ydGIzd2VQbkIwdU42aFo5bjZPRTJEdlFzVnVrZGtPdXFHeHZi?=
 =?utf-8?B?VTg4RlRnanBBakpsMlphNXZZUnFsTXlRREpITnpWQWg5VHp0ZjUvTUdjVU0z?=
 =?utf-8?B?YUlWVWVlRFZGMStndG43MWJCZHA1blJVbWtpVzMyM29hNFdqM3hUaHA1UE54?=
 =?utf-8?B?THBXenovV2poNzJCZnBMOWg2ZnpFU1IrSldyMlpST2VCeHVWM2dDRzVaUmla?=
 =?utf-8?B?UlJHbUFib0hoUENiUVZoTG9hNHRQenFScXI1elppdENuZFgvK1lkSXcybENJ?=
 =?utf-8?B?V2U0MGtkSzh0YlVFYlpySURGVllFeGFtdGUyajZwMGJ6R2VPUkFlWXhYSUlq?=
 =?utf-8?B?THA5amNaYkcyN0N4L3ZqQlMrYlZMTDB6aG1pNmhpY0hxZTB5aWFsaGpMeklL?=
 =?utf-8?B?Ukp6YVhTOVg1a0pLZzk1NWRTVUpXQzc3MU5aQlpVZ1I5VnhKbmFlTkVnbi8w?=
 =?utf-8?B?alI1ZGRrazRHQUp4YkViUS9RZi9zOGdrcHRFcDNUemtCdUJoeU9sdHpPUVdI?=
 =?utf-8?B?MVIyQURldEEzWFZtWndabXI2VFNNYnhNU0pLNmNjVlh4R0ZxRlpxaklKQyt4?=
 =?utf-8?B?TDZ1M1dqOFYxYUYxaGdXa1BSb01ZYTFvVkMzUUtrZk9rajhCS3RqL1NoUm16?=
 =?utf-8?B?ZTBMY0R1OXJOT0NMYllmYTB5N2cvbmtXOCtPK3RQUnY4dmpibU9RdDhQamd3?=
 =?utf-8?B?U0tEbnJESzdvZks1d3IvSmZmUkd5YmZ6VWx6MitIRElIdWJyQ3l2b3NZcmNK?=
 =?utf-8?Q?3qojLVSa9N8WDqvPySuHyTqYrPDj0x8KfXcDbyr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d9ec0e-7e3d-4b8c-9354-08d95221a2e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 23:44:26.9116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDe6TzMj8g4FAeuQlZiWSQQq3r0R2E+yc5EofxUki59DZNrEIh7ETOMlDAmZhEnBvhGxei36QOSOkRfqRZB9tQuOzq3rxr19saYmKmUTJ/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3916
Received-SPF: pass client-ip=68.232.159.76;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa5.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGV0ZXIuDQoNCj4gVGhlc2Ugb25lcyBzZWVtIHRvIGhhdmUgcmVhY2hlZCBib3RoIHFlbXUt
ZGV2ZWwgYW5kIHFlbXUtZGV2ZWwgXG8vDQo+IA0KPiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJj
aGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wNy9tc2cwNjM1NS5odG1sDQo+IGh0dHBzOi8vbGlz
dHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1hcm0vMjAyMS0wNy9tc2cwMDM5MS5odG1sDQoN
ClRoYW5rIHlvdSBmb3IgY29udGFjdGluZyB1cy4NClNpbmNlIG91ciBlbWFpbCBzZWVtcyB0byBo
YXZlIHN1Y2Nlc3NmdWxseSBtYWRlIHRoZSBsaXN0LCANCkkgd291bGQgbGlrZSB0byBjcmVhdGUg
YW5kIHBvc3QgVjIgb2YgdGhlIHBhdGNoIHNlcmllcyANCiggaHR0cHM6Ly9saXN0cy5ub25nbnUu
b3JnL2FyY2hpdmUvaHRtbC9xZW11LWFybS8yMDIxLTA3L21zZzAwMzIyLmh0bWwgKSANCnRoYXQg
eW91IGNvbW1lbnRlZCBvbiB0aGUgb3RoZXIgZGF5LiANCg0KQmVzdCByZWdhcmRzLg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDI2LCAyMDIxIDc6MDIgUE0N
Cj4gVG86IElzaGlpLCBTaHV1aWNoaXJvdQ0KPiBDYzogcWVtdS1hcm0gPHFlbXUtYXJtQG5vbmdu
dS5vcmc+OyBRRU1VIERldmVsb3BlcnMNCj4gPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2Ml0gVGhpcyBpcyBhIHRlc3QgbWFpbA0KPiANCj4gT24gTW9uLCAy
NiBKdWwgMjAyMSBhdCAwOToyMSwgU2h1dWljaGlyb3UgSXNoaWkgPGlzaGlpLnNodXVpY2hpckBm
dWppdHN1LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIGlzIGEgdGVzdCBtYWlsIHRvIGNo
ZWNrIHRoZSBiZWhhdmlvciBvZiBteSBtYWlsIGJlY2F1c2UgaXQgaXMgbm90DQo+ID4gbGlzdGVk
IGluIHRoZSBNTCBvZiBxZW11LWRldmVsLg0KPiA+IEkgbWF5IHNlbmQgc2V2ZXJhbCB0ZXN0IG1h
aWxzLg0KPiA+DQo+ID4gSSBhcG9sb2dpemUgYW5kIHRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5j
ZS4NCj4gDQo+IFRoZXNlIG9uZXMgc2VlbSB0byBoYXZlIHJlYWNoZWQgYm90aCBxZW11LWRldmVs
IGFuZCBxZW11LWRldmVsIFxvLw0KPiANCj4gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUv
aHRtbC9xZW11LWRldmVsLzIwMjEtMDcvbXNnMDYzNTUuaHRtbA0KPiBodHRwczovL2xpc3RzLmdu
dS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtYXJtLzIwMjEtMDcvbXNnMDAzOTEuaHRtbA0KPiANCj4g
LS0gUE1NDQo=

