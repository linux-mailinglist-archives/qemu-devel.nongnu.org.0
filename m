Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2366004A1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 03:00:01 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okEU4-0007Po-Hb
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 21:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEP0-000848-VW; Sun, 16 Oct 2022 20:54:49 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:46951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEOp-0004FM-Jp; Sun, 16 Oct 2022 20:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665968075; x=1697504075;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6I1CI832FRkO5caqhncdZgAOwZbw0nQ4dbgclApb8DM=;
 b=e4uCl6s8oa8UFQVFewLLhgvPQYum3rZ1ya/UXigdOE9wOPECjhxc6m7f
 CSQFtGKyL4jezZR1p0sne2L9wams0K/Ox0SLZP4F7HH5l5dFiCRt5/UO7
 nqlonqeBNhWjeIGnjHhfAb15XYFCsLoa3Vsks45UYHLLKUoX5/LPMza7E
 UAO+Yb+S2ZnBWKi/UNrz2a6tbOMZLDUy6of5GtO+wlYtK0u+ivWV2H5P1
 pqMWRZAJxkqN/rr1c1ZwIzz/rLZqkI1P223JXA5BPjszcXlAlcJFpb4An
 ogOWS+uy1SQL+VBx/8HOIzQv8Iyl5bDZ/IDnVwNj0cXU9f0DRkppEmoFT A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="219123195"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 08:54:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMGfl6ZbyDcMRiTzfc8wCLDdgob8rQPSPIeIotOL0i6O6Km64T9ytLAwP4mruvqt93KrgPZpDkBo4i9CNfEaYh1LkVVT69QzZUdmY5o5eXDf7GJfnlwrX/GZSLCaAZiQuEEfNYmThO7aRXKxeMIwyBDVE+IuJ/ynzyNe7s4ve5tQEXg6nlnfIfHVnEkxCqsDNlLdTisW/PvKpLXES0lafSdLZ/GIv3ELkMVpb2qweWm3pWdOKs6NVotMPeq8GT2GjP8EvsuEVpBq7QTKVP9E1LWquAZTWa9f8VORq4mi3Q+JwkM3xS1AJ0D6E5gua4U5MTjzvTbEg7fKUb6b1iZyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6I1CI832FRkO5caqhncdZgAOwZbw0nQ4dbgclApb8DM=;
 b=WJt7psC5DEmE9u+SgiiKBxdCcGtxFlcuv58VT041Yx3mO9PnnNqIvcPCaRCQZFM+yq4aEn28F7dg8SA7dFfySWtPWzI9VJTKKd+1S2d08ok2rrKt70WOE7Cjl4SgRGxU9TGDM/efBl7pI9SCPZnffbMP0ID9XeAIA/tkh+aapWKDCGIlh3BkIrd7MX1qJvGe9KIUASKMOucWMcjQ3efr2DChuAxW3K998eOPwWBrUOs3BEaIwtRazD2IF8/DXFBkwXvTWpWnmOQIbXGLTAFI9/GT4As28oXQTp6Qp5A2QNmBc5mJ+pdeFC5HmxNOzDY/mYlM45/TNecqMkuADZGZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I1CI832FRkO5caqhncdZgAOwZbw0nQ4dbgclApb8DM=;
 b=vpgobunRO9ZdZaQcJXJtPHC3O2bH8JjWwYALQyNNQ7o4obJiROnL5AgH7Bi6iA7nh1FX4KUT2oBNF2gFJMnMPQbMOQwA1FzuTOU+gC6Xp54AJkwu8LlcKUmDAE6/SMu81ruqkUGttkKj5RV5Ai/qCDdPONQjNofcltnxSXmMkV0=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by SJ0PR04MB7472.namprd04.prod.outlook.com (2603:10b6:a03:294::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 00:54:29 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 00:54:29 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "armbru@redhat.com" <armbru@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "eblake@redhat.com"
 <eblake@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v12 7/7] docs/zoned-storage: add zoned device documentation
Thread-Topic: [PATCH v12 7/7] docs/zoned-storage: add zoned device
 documentation
Thread-Index: AQHY4W7gBjYLsh7T9UygMDQgAivJ764RwyeA
Date: Mon, 17 Oct 2022 00:54:29 +0000
Message-ID: <681c331581ed18b2dc7d8460dd62c5cef474afce.camel@wdc.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-8-faithilikerun@gmail.com>
In-Reply-To: <20221016145110.171262-8-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|SJ0PR04MB7472:EE_
x-ms-office365-filtering-correlation-id: 43d1a495-d51d-42a8-3110-08daafda25c7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7SQTfGV35HCNEH+E/JTIqJfS8tj1ne/YwrQjTZMSp9leIrKPWhWRWNG+rsaiY4LW4zMChVc2LerjXtIhyEzDslqqeI/RMH2ps0Bn8Uritw7p62xhNfLftyXiihsfFxHGRObLuvWhq9aHMOF88avCM+2r98z43xxDfrUgJPAjZ54QLdmQPHyhDxoXt2SdOaOi+1SrfWbNhT5kpSNX0n43cYSoqCUuPugmi7IbFxY13xRLzMmuhpa1PKfiwRyBUP3WMW0X2HWB+ddeFf78uYLuGNyHCQmK2QyZwIITfdVaMI4Ew5IJghhSxYXfuosKuDiJscasBFd1ODvsgbCSaIGgmgN0RrMCRAS1jiRLD3bhHLV2u2/22jJJLHlmjz9jnGKANh4A+rYvCE3N16BnRpUUwcliP5EO5ylqWfTN0n4LnzrThqqZEzJmfBi5UIFf+95DXUVE3SyeVq4XoMiNu5iNJn7/dkqIz4V+iaAKXlmsSa6dd0Jfiv+wNcsH3zO6IawB7qrWzXwc7iQ07e83ssINuGFuPj1KCjQLX14Z+LjIxcGXtyuUM1lTEySwlWCuinZNskEATyVE3ZWnEBECd9ufV/6tq7SnDdyWMgpIVA6WiC7L3e6ixi/du4UvsMawc8E8U42WgqazedVpuETZjStueJAz8tCSoIB0QCHgo0fCuOw6et21/3BGXXdZEkc9zBmAcOa2YXIZrwCkix4pwJZoIWrJEEiqkJVrVUceNKLmC+cp8imeCIrguyv15DHNj3Sqf7jW2XRbf9lnr+T1H+z5MDPnnHFj1gp9TIaioc1zrbo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(38100700002)(6486002)(478600001)(71200400001)(38070700005)(122000001)(82960400001)(4001150100001)(2616005)(186003)(316002)(8676002)(4326008)(54906003)(64756008)(66446008)(66946007)(66556008)(66476007)(110136005)(76116006)(91956017)(6506007)(5660300002)(36756003)(26005)(41300700001)(6512007)(8936002)(7416002)(86362001)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RC9KUkN6bEhkcHRZL3FiUTJsQjh6YlZkL2ZOek5menFkcEpYbkZ0MDBzMWJV?=
 =?utf-8?B?aDN6MUNZNTAvK2NVUkxtcFY3bWdVSW5rSVF0ckhLL1BERnF5VC9jVWJaNnNX?=
 =?utf-8?B?K0htcHBmalhYSkhXUnR0UDE3aFVBdWhLUzI4NzlnUXJsRy9sbUh4bEVteXhZ?=
 =?utf-8?B?cmQ5WFk1Y1hSd3VRcDQzbjNJanRVUGpHcEVRLzZEZjM0YnE2M2UrWlRuS0R3?=
 =?utf-8?B?bzhaMlQ2aVZMcjZsWVFXY2F1SlJET3owRlBjV3VNRUJPdEtVUk1uTzdBa2Zk?=
 =?utf-8?B?U0dsQlhmRGRVMEN6cTFpbDlZS1Q4cWRmYUw5bllzLzExNVpXT2w2R3Vkc3JX?=
 =?utf-8?B?dmhtN2lpbU1UWHE5K1dDeGlIZlpjei9tYnNpamdyZGFiNUFFVlNNQTBCMVc4?=
 =?utf-8?B?V2NNOFdYa29FM3k1SXZ0REg3RmJxZDg2eHBPeHpPdkc0M0w5L2xIMGgwT2x2?=
 =?utf-8?B?MC9wdDdhaGFnNTZhaHg3ako1akUyWmNDSzg1c3d6eDdFZmNWVnRhdVNjaUZP?=
 =?utf-8?B?RjRLQkFEUGF1Zyt4Y2RKcUEwWWo1TDlScUw0WHM3aExiNi93dnhQMHNRc1Q5?=
 =?utf-8?B?alc2V0lmYzE5b2NZNmQ4d3RJZTBITDgwU0NpMFBRV1oxVVlNL0x2Smk1TGJo?=
 =?utf-8?B?OHlWUmNuQmc2ZzE0bGVlb0RNREUxb0I4UDNqdmhsYkFoN2RDS0lTbGQzd1k2?=
 =?utf-8?B?T3NnWUJTZFNBVUNPKzhvc2xYRmlYdHV5L0crRzBFaEp2MWdDQWpJblJuUjJr?=
 =?utf-8?B?azBETTRsbnd4b2I3TGk3ZmFDZklEUnVCSkgxN05yTHhkSzZOSkhUc0QvSDVX?=
 =?utf-8?B?RG1zWk1WMnJ1RCs2N3MxTEh0SXJBSDNBQkRZSXdwZ0kyUmJFclFsWElXK1Vh?=
 =?utf-8?B?Zmx2WnlSOEFFQzlhNHRuWjRxQXdXc1NVRFZIa1ZBOURaZU1PaGxhQjdMS0pr?=
 =?utf-8?B?WFVMQllReEt4RWpiRU5OV1ZVZXZucE9MU3NGME1xV0FiNGcwZDRENFFlQlhM?=
 =?utf-8?B?SzVpYTYrODAycHpEeTlTQ1p3UGZmTU1nRmErcGhBYzZYWXBhNGNsdmcrTG1B?=
 =?utf-8?B?cmp1dVJZT296clBaSU54c1duSUd4OWg1ZGJCRjFya2hkNUJsdk1OYzJKVDFQ?=
 =?utf-8?B?cFF1eDZRZEJtYUVLK1VsWmNYVkswNVVXZUNFYkVNTU1pN2sxU21xS0NPaXd4?=
 =?utf-8?B?WENZakpLbnpvLytiUExZWkFRT0JjVXFCb3ZhNzRuYlZNWGdjVXJETUVhalU5?=
 =?utf-8?B?ejBCUkt2ZWpqUlg3OW0xbUVEWGRXMENwaU5OTlZXS0doTkkrZC8waEtYNFpm?=
 =?utf-8?B?cXhoMTNyc3AxMTAzd2pqajJncmExMFNNbjVSejl4SzlvMEJzazZQTnFmbzkw?=
 =?utf-8?B?aVRJeFZKSWkrKzI3YmoxcjNacVdMWU83UDJZcUhDVnQrMy9NbHdZWEVPVjBy?=
 =?utf-8?B?dEhRZmI2QzZTNENVZjdlcXdLTEJDM0lMVDhvWXBpQnhLeStTUGsvVHlVSGhw?=
 =?utf-8?B?ZTZYM2pObStZYm9SRFV2L3B1WHVVck9sVW1HY2N2aW1ZN2U2QTBGM25FU0tY?=
 =?utf-8?B?UnBNMGo3dW90Z2ZGZFNRUlZoWGdMYTYyKy9iLzJKdWFzbXdwRWJKVUZJc1pz?=
 =?utf-8?B?WTFJb09MV29EZjBwR2FiQWpRV29XZnFOdUxDWFlHa2RIbGp0UVlMODFSaCs2?=
 =?utf-8?B?Uy85UldKWTk4RmNENDhVYUs2dkJpeTBCNmxxWlNPSVAvMldhSC9KWFpOY0FM?=
 =?utf-8?B?TytJMktPdVNyQlRiMC9nMkllZ0MwUC9tbVQxSSt3dFFEcXNEZ3NCM1dYNzFa?=
 =?utf-8?B?enhUVHpseFg1ckdyNG1sU3RodGIya09XU0RsaUZ3N2FvZFIyamttcktKbWdy?=
 =?utf-8?B?SEpmR25MajhtcEsyTDUwbzJBMVo2V2tycHM5QUlmemtvZC8vWEtMbVQ4Y3RG?=
 =?utf-8?B?ZW52ckdaUjRIVURpWndQOGpJYVkyVFlITGNrMU5tUGc1alN3bUZlNU1YcDVa?=
 =?utf-8?B?S1lodmZ0clpTUlY1QnJtOEQ4VEFUbGVjSU9ZcUlSMkxUK3AyRFo2cU5DRUNs?=
 =?utf-8?B?RVhyQnl4dU1FM1ZXVkxnMjc3RjhsQlk0bjd3VHVPUU0wVm50bk91NDhzRDRa?=
 =?utf-8?B?QUhZS3RLZFBMR2N5SlAydE0yZ1hVNXhsRjJmWTRRcWV4MXZza1ovVTZXUTBu?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E0B4ABC314E4B458DD5B9A22822B4D5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d1a495-d51d-42a8-3110-08daafda25c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 00:54:29.7732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtfGZY/GcqAWw/NRjOe/wBWfyST64rNjjJjNHnCW0Y9/HDWwEwA4PcsDmkFYP2JBHwlPUZrIhCF2SKDArmWyWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7472
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=282f36034=Dmitry.Fomichev@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gU3VuLCAyMDIyLTEwLTE2IGF0IDIyOjUxICswODAwLCBTYW0gTGkgd3JvdGU6DQo+IEFkZCB0
aGUgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgem9uZWQgZGV2aWNlIHN1cHBvcnQgdG8gdmlydGlv
LWJsaw0KPiBlbXVsYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gTGkgPGZhaXRoaWxp
a2VydW5AZ21haWwuY29tPg0KPiBSZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5o
YUByZWRoYXQuY29tPg0KPiBSZXZpZXdlZC1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1v
YWxAb3BlbnNvdXJjZS53ZGMuY29tPg0KPiAtLS0NCj4gwqBkb2NzL2RldmVsL3pvbmVkLXN0b3Jh
Z2UucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiDCoGRvY3Mvc3lzdGVtL3FlbXUtYmxvY2stZHJpdmVycy5yc3QuaW5jIHzCoCA2ICsrKysN
Cj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgZG9jcy9kZXZlbC96b25lZC1zdG9yYWdlLnJzdA0KPiANCj4gZGlmZiAtLWdpdCBhL2Rv
Y3MvZGV2ZWwvem9uZWQtc3RvcmFnZS5yc3QgYi9kb2NzL2RldmVsL3pvbmVkLXN0b3JhZ2UucnN0
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmNmMTY5ZDAyOWIN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kb2NzL2RldmVsL3pvbmVkLXN0b3JhZ2UucnN0DQo+
IEBAIC0wLDAgKzEsNDMgQEANCj4gKz09PT09PT09PT09PT0NCj4gK3pvbmVkLXN0b3JhZ2UNCj4g
Kz09PT09PT09PT09PT0NCj4gKw0KPiArWm9uZWQgQmxvY2sgRGV2aWNlcyAoWkJEcykgZGl2aWRl
IHRoZSBMQkEgc3BhY2UgaW50byBibG9jayByZWdpb25zIGNhbGxlZA0KPiB6b25lcw0KPiArdGhh
dCBhcmUgbGFyZ2VyIHRoYW4gdGhlIExCQSBzaXplLiBUaGV5IGNhbiBvbmx5IGFsbG93IHNlcXVl
bnRpYWwgd3JpdGVzLA0KPiB3aGljaA0KPiArY2FuIHJlZHVjZSB3cml0ZSBhbXBsaWZpY2F0aW9u
IGluIFNTRHMsIGFuZCBwb3RlbnRpYWxseSBsZWFkIHRvIGhpZ2hlcg0KPiArdGhyb3VnaHB1dCBh
bmQgaW5jcmVhc2VkIGNhcGFjaXR5LiBNb3JlIGRldGFpbHMgYWJvdXQgWkJEcyBjYW4gYmUgZm91
bmQgYXQ6DQo+ICsNCj4gK2h0dHBzOi8vem9uZWRzdG9yYWdlLmlvL2RvY3MvaW50cm9kdWN0aW9u
L3pvbmVkLXN0b3JhZ2UNCj4gKw0KPiArMS4gQmxvY2sgbGF5ZXIgQVBJcyBmb3Igem9uZWQgc3Rv
cmFnZQ0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArUUVNVSBi
bG9jayBsYXllciBoYXMgdGhyZWUgem9uZWQgc3RvcmFnZSBtb2RlbDoNCg0KcmVwbGFjZSBpdCB3
aXRoDQoNCitRRU1VIGJsb2NrIGxheWVyIHN1cHBvcnRzIHRocmVlIHpvbmVkIHN0b3JhZ2UgbW9k
ZWxzOg0KDQo/IHdpdGggdGhpcyBuaXQsDQoNClJldmlld2VkLWJ5OiBEbWl0cnkgRm9taWNoZXYg
PGRtaXRyeS5mb21pY2hldkB3ZGMuY29tPg0KDQo+ICstIEJMS19aX0hNOiBUaGUgaG9zdC1tYW5h
Z2VkIHpvbmVkIG1vZGVsIG9ubHkgYWxsb3dzIHNlcXVlbnRpYWwgd3JpdGVzIGFjY2Vzcw0KPiAr
dG8gem9uZXMuIEl0IHN1cHBvcnRzIFpCRC1zcGVjaWZpYyBJL08gY29tbWFuZHMgdGhhdCBjYW4g
YmUgdXNlZCBieSBhIGhvc3QgdG8NCj4gK21hbmFnZSB0aGUgem9uZXMgb2YgYSBkZXZpY2UuDQo+
ICstIEJMS19aX0hBOiBUaGUgaG9zdC1hd2FyZSB6b25lZCBtb2RlbCBhbGxvd3MgcmFuZG9tIHdy
aXRlIG9wZXJhdGlvbnMgaW4NCj4gK3pvbmVzLCBtYWtpbmcgaXQgYmFja3dhcmQgY29tcGF0aWJs
ZSB3aXRoIHJlZ3VsYXIgYmxvY2sgZGV2aWNlcy4NCj4gKy0gQkxLX1pfTk9ORTogVGhlIG5vbi16
b25lZCBtb2RlbCBoYXMgbm8gem9uZXMgc3VwcG9ydC4gSXQgaW5jbHVkZXMgYm90aA0KPiArcmVn
dWxhciBhbmQgZHJpdmUtbWFuYWdlZCBaQkQgZGV2aWNlcy4gWkJELXNwZWNpZmljIEkvTyBjb21t
YW5kcyBhcmUgbm90DQo+ICtzdXBwb3J0ZWQuDQo+ICsNCj4gK1RoZSBibG9jayBkZXZpY2UgaW5m
b3JtYXRpb24gcmVzaWRlcyBpbnNpZGUgQmxvY2tEcml2ZXJTdGF0ZS4gUUVNVSB1c2VzDQo+ICtC
bG9ja0xpbWl0cyBzdHJ1Y3QoQmxvY2tEcml2ZXJTdGF0ZTo6YmwpIHRoYXQgaXMgY29udGludW91
c2x5IGFjY2Vzc2VkIGJ5IHRoZQ0KPiArYmxvY2sgbGF5ZXIgd2hpbGUgcHJvY2Vzc2luZyBJL08g
cmVxdWVzdHMuIEEgQmxvY2tCYWNrZW5kIGhhcyBhIHJvb3QgcG9pbnRlcg0KPiB0bw0KPiArYSBC
bG9ja0RyaXZlclN0YXRlIGdyYXBoKGZvciBleGFtcGxlLCByYXcgZm9ybWF0IG9uIHRvcCBvZiBm
aWxlLXBvc2l4KS4gVGhlDQo+ICt6b25lZCBzdG9yYWdlIGluZm9ybWF0aW9uIGNhbiBiZSBwcm9w
YWdhdGVkIGZyb20gdGhlIGxlYWYgQmxvY2tEcml2ZXJTdGF0ZSBhbGwNCj4gK3RoZSB3YXkgdXAg
dG8gdGhlIEJsb2NrQmFja2VuZC4gSWYgdGhlIHpvbmVkIHN0b3JhZ2UgbW9kZWwgaW4gZmlsZS1w
b3NpeCBpcw0KPiArc2V0IHRvIEJMS19aX0hNLCB0aGVuIGJsb2NrIGRyaXZlcnMgd2lsbCBkZWNs
YXJlIHN1cHBvcnQgZm9yIHpvbmVkIGhvc3QNCj4gZGV2aWNlLg0KPiArDQo+ICtUaGUgYmxvY2sg
bGF5ZXIgQVBJcyBzdXBwb3J0IGNvbW1hbmRzIG5lZWRlZCBmb3Igem9uZWQgc3RvcmFnZSBkZXZp
Y2VzLA0KPiAraW5jbHVkaW5nIHJlcG9ydCB6b25lcywgZm91ciB6b25lIG9wZXJhdGlvbnMsIGFu
ZCB6b25lIGFwcGVuZC4NCj4gKw0KPiArMi4gRW11bGF0aW5nIHpvbmVkIHN0b3JhZ2UgY29udHJv
bGxlcnMNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICtXaGVu
IHRoZSBCbG9ja0JhY2tlbmQncyBCbG9ja0xpbWl0cyBtb2RlbCByZXBvcnRzIGEgem9uZWQgc3Rv
cmFnZSBkZXZpY2UsDQo+IHVzZXJzDQo+ICtsaWtlIHRoZSB2aXJ0aW8tYmxrIGVtdWxhdGlvbiBv
ciB0aGUgcWVtdS1pby1jbWRzLmMgdXRpbGl0eSBjYW4gdXNlIGJsb2NrDQo+IGxheWVyDQo+ICtB
UElzIGZvciB6b25lZCBzdG9yYWdlIGVtdWxhdGlvbiBvciB0ZXN0aW5nLg0KPiArDQo+ICtGb3Ig
ZXhhbXBsZSwgdG8gdGVzdCB6b25lX3JlcG9ydCBvbiBhIG51bGxfYmxrIGRldmljZSB1c2luZyBx
ZW11LWlvIGlzOg0KPiArJCBwYXRoL3RvL3FlbXUtaW8gLS1pbWFnZS1vcHRzIC1uDQo+IGRyaXZl
cj16b25lZF9ob3N0X2RldmljZSxmaWxlbmFtZT0vZGV2L251bGxiMA0KPiArLWMgInpycCBvZmZz
ZXQgbnJfem9uZXMiDQo+IGRpZmYgLS1naXQgYS9kb2NzL3N5c3RlbS9xZW11LWJsb2NrLWRyaXZl
cnMucnN0LmluYyBiL2RvY3Mvc3lzdGVtL3FlbXUtYmxvY2stDQo+IGRyaXZlcnMucnN0LmluYw0K
PiBpbmRleCBkZmU1ZDIyOTNkLi4wYjk3MjI3ZmQ5IDEwMDY0NA0KPiAtLS0gYS9kb2NzL3N5c3Rl
bS9xZW11LWJsb2NrLWRyaXZlcnMucnN0LmluYw0KPiArKysgYi9kb2NzL3N5c3RlbS9xZW11LWJs
b2NrLWRyaXZlcnMucnN0LmluYw0KPiBAQCAtNDMwLDYgKzQzMCwxMiBAQCBIYXJkIGRpc2tzDQo+
IMKgwqAgeW91IG1heSBjb3JydXB0IHlvdXIgaG9zdCBkYXRhICh1c2UgdGhlIGBgLXNuYXBzaG90
YGAgY29tbWFuZA0KPiDCoMKgIGxpbmUgb3B0aW9uIG9yIG1vZGlmeSB0aGUgZGV2aWNlIHBlcm1p
c3Npb25zIGFjY29yZGluZ2x5KS4NCj4gwqANCj4gK1pvbmVkIGJsb2NrIGRldmljZXMNCj4gK8Kg
IFpvbmVkIGJsb2NrIGRldmljZXMgY2FuIGJlIHBhc3NlZCB0aHJvdWdoIHRvIHRoZSBndWVzdCBp
ZiB0aGUgZW11bGF0ZWQNCj4gc3RvcmFnZQ0KPiArwqAgY29udHJvbGxlciBzdXBwb3J0cyB6b25l
ZCBzdG9yYWdlLiBVc2UgYGAtLWJsb2NrZGV2IHpvbmVkX2hvc3RfZGV2aWNlLA0KPiArwqAgbm9k
ZS1uYW1lPWRyaXZlMCxmaWxlbmFtZT0vZGV2L251bGxiMGBgIHRvIHBhc3MgdGhyb3VnaCBgYC9k
ZXYvbnVsbGIwYGANCj4gK8KgIGFzIGBgZHJpdmUwYGAuDQo+ICsNCj4gwqBXaW5kb3dzDQo+IMKg
Xl5eXl5eXg0KPiDCoA0KDQo=

