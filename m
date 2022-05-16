Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E925282C0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:01:00 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYTD-0007DI-Tv
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nqY5Z-0006GU-MF; Mon, 16 May 2022 06:36:34 -0400
Received: from mail-bn8nam11on20614.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::614]:13472
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nqY5W-0005E2-Ic; Mon, 16 May 2022 06:36:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pbe0UnbLVeenL4v6lOr46lrKn6yFjhj1DUcfUTym8Rzt8UBNaD0otg4zQnfq1g9BcrFhPBuAyrh84xI7GV7C2pxnkHkhzAY/QbWJq8qJGNy8ciovVxAjCzqmWHTqdReRJQuOnqu+QLTgpDSGN6YuQFFlA1rEWPY0NdedPo2CJ9zwk2xeXJRm4H9p5VSp5aCHyBP1TzpNJwNDX63tz14JcPi7HLHUYOW+r66PfwBE2HzWiRa+dxoow7vSPVTFt+aI/Bs1biYt60/kwkAdqUpVVUWTu4NWYrpOzkERD5FSCoNSU0+QCeKkr02kzEShnYK30WU3TWFphckFIPS1s0GPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6fEpHSL5qtglrqnm4JzeRbrFwq0yfmlhboKmLdGIeA=;
 b=Y3KlG1L/EZwWPK274El20LNvo3MGaDuUG5zHNEm4BtGfoykhXgsu4521eYPSo+GbFpJyjpsT+9T22yftOJ7TOxYdFgpqTadGIzuurjQ4AoOFm1OOti7FNYajpq0L2VVy7ij08O3l/SKTmHcRLLWGX4XoLW7OZC9FgQ3DwpRRPm+11Iqxdpfl4j4+rMxIQaUYzuGQ63cBeeZVEvRh5x7Qdo712+ZmSuJMfWZPWCRE5eNeIcLXBHkJ5fObgnv1pNWviWXpuORF3dcp/tDq7czOF9Gh9P0Q9hOYMi2Rdbm3UfrCn6tmw3RC+hb2VEvfQqCBCUx3jwirOZMyFRM0dnewgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6fEpHSL5qtglrqnm4JzeRbrFwq0yfmlhboKmLdGIeA=;
 b=RQt7gM9fFhkcLzsrNfKqw7D7QWmKJGbVKGGEfVUy6BKMXp/x6BjR21bR25O5AlNEcUD15Dz04LXIA4bvnvmXkFc9LCuPmImZZR9JyoNASALEGlXWZL/qKa2cBxgaf8b1+L9BftAmjvpw37ngvWCOoZzlxNDB0B95SElG82rTm38=
Received: from BY5PR02MB6354.namprd02.prod.outlook.com (2603:10b6:a03:1fd::12)
 by BN8PR02MB5858.namprd02.prod.outlook.com (2603:10b6:408:bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 10:36:26 +0000
Received: from BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::4840:6c2:8dd7:947f]) by BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::4840:6c2:8dd7:947f%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 10:36:23 +0000
From: Frederic Konrad <fkonrad@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "alistair@alistair23.me"
 <alistair@alistair23.me>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Sai
 Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 "fkonrad@amd.com" <fkonrad@amd.com>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>
Subject: RE: [PATCH v1 2/4] xlnx_dp: Introduce a vblank signal
Thread-Topic: [PATCH v1 2/4] xlnx_dp: Introduce a vblank signal
Thread-Index: AQHYXwJMc+k7a4F28Um7KBhRgce3la0hWHUAgAAFOdA=
Date: Mon, 16 May 2022 10:36:23 +0000
Message-ID: <BY5PR02MB635470A06CB87A0288FE5AC4CCCF9@BY5PR02MB6354.namprd02.prod.outlook.com>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
 <20220503152545.1100386-3-fkonrad@xilinx.com>
 <CAFEAcA-x+7Gm9Jo9oPdcXZ0DpeT=PmfXogxZkjVZC_SL3gHNGg@mail.gmail.com>
In-Reply-To: <CAFEAcA-x+7Gm9Jo9oPdcXZ0DpeT=PmfXogxZkjVZC_SL3gHNGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72f3c1d4-0dfa-4a25-23a7-08da3727ec7a
x-ms-traffictypediagnostic: BN8PR02MB5858:EE_
x-microsoft-antispam-prvs: <BN8PR02MB58582D6C7708BAF312293536CCCF9@BN8PR02MB5858.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MnEO3gMWzN2IGnR/2SePxfb2vhSFQKZRURsVAemPkt1GcVVQXmH4GCdkvw4gVNADLgtJ01zg31xn3lPeLINRk56yunTk5liLJZT3V4+BPR7EpyGFQVNTGfkstFd9IBIOqXbfndatreE0vtLkYxIIDA+6wD6c9GrSRib+YdtjZskDutzQ9w0g2fTbd88vIxzk7s6Z+v4zDyku8ygGg2i6I3zSpKaX33P55MCw/nJD4oiPQR9gzbP+nwiTvlWKV/ZpfwZNKrUCThqBx+l0Ugjdas5DcaFWrMGh+vC+LP+GIiSn274TxNfg79/7zFi3nSBbHCimcDwVYRp/jOTEsQlZzemoRdI8Y+d6tc9+TjXGAWCPhsk3/xLO1wvFW33BxoYMBSQIzXJVhX6ozW67t6uJcQaJnIJGO2/MOss5KPQelMADTviIg/N5U/SnSVE1jywA7P5wYILzM4oTYZbnTPNgWzksDfzoQXtOv8kCP2PnXBe6qjR/LUr1XWChmjfkO9qp3ZAEhvJtKskHzEKuP/49zV3XJVuCnp1x5/qCnPFOmQs/CIpnxhRsfk9IeKxVfYxsIiCG2oR8Gd7LAMNI1WIqWdr8LAIIpYa8UqajcZTJ0IqvpMq+xUMCJJoneUOc+ok1DelwBmTHVLV3nHq7QRJ1f9pdQithPuINmv1Pj4wm3HiSeTFEnNjCo5/hpaAnRVcQeLtJQKDjteaTQPFnSVpSiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6354.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(8676002)(122000001)(33656002)(2906002)(71200400001)(4326008)(38100700002)(66476007)(66556008)(86362001)(76116006)(66946007)(5660300002)(186003)(8936002)(508600001)(38070700005)(66446008)(55016003)(53546011)(83380400001)(316002)(26005)(9686003)(54906003)(6916009)(52536014)(107886003)(7696005)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXF2TXNNOWowR2FxQi9JRDhhaEVEcVgvcTY2VEhDcnlyMGZ6RWdJQjBSM1JP?=
 =?utf-8?B?VmlMTXR1TVFKeFNxTGlzZ1JTZDZsT2I2cnhsVm8zc3JmYjhtNVVQek96ZG9X?=
 =?utf-8?B?Nm5RZ1pBdEFueEc2ZXJYNEYvczN0eUk0RUJTWGhSMWJsSWNjM003ZjhlZW5n?=
 =?utf-8?B?ckZuaUM0UW83dkpHaUYwbUlkOGtINGNDb00zVkhhenRSbVFKTVYwMFM0SlFH?=
 =?utf-8?B?STVzQUV5MHdqK0FRMjFuS1ArRURxVzVwbytoRXlwdHJyZ1Mra3dpY0ZEUDdK?=
 =?utf-8?B?dk1pa3NiVEN1WnBadUpnOGR1SU0wWjNoQkJIWHM1MSs2Z1BxWnozcWNHRmt2?=
 =?utf-8?B?Kzd5aFFqVmZIUTc1VGdPQ0V2aGxIOHVMTGNldFhrWmlEWHBicjA1SWdRK1hC?=
 =?utf-8?B?Q25RY2tlVkxCQW4zMVhZa1I3N2RhNHpoWkVFQ3RRNkhPNkphTm1KeFpMRzFh?=
 =?utf-8?B?MmhMZ0Z6azdqRElFc3hCYVBJdkZVZzRVMElROHR4Sm5pYnpiRUVzcng3Wmxz?=
 =?utf-8?B?NDFCTlJyOGx1V2lmV1cvNnU5N3p1Z1JJd2NjWEF3Z2M5dC9pdlVVMWd2cVdm?=
 =?utf-8?B?Z3hEZnNtNFk0NWlFVHhvcXduK3BOZUN2T2xnYVhUSnRXTWcxOU45aGFyWG1s?=
 =?utf-8?B?QVdVL25jbm5YTFFRZ2V0dFdvKzU4RUpJVnZuZkFPaWZtYnFqVlZRUVBtVDA5?=
 =?utf-8?B?Qzh6S2VmWEZYN3RUdklmalpTcHJza21TOGV0cnBsd215aHFsdU54VzkrTTBR?=
 =?utf-8?B?YnFLSEk2ZlNYM29DRWxqdCtzejRUOFVFcWl2RmpWbTZuL2MvK2xjODU2Qkc3?=
 =?utf-8?B?eFhlOWFkQy9JZzRPS0kxbUY3c1MyblEwdWMwWUJhNmNoZ0VlZTJkMU5EU2lQ?=
 =?utf-8?B?N1lqS3QrZHFaczdGcGN5L0pBZ0JwL2hNS3BFTXVPNkVXWEU1WWRMeHppM3VL?=
 =?utf-8?B?enFKMGgrd0wvWGZWS1FGRVkvalk1NjFrQ3AzSG9YMXQrSGZTVUpEeDdZR3A5?=
 =?utf-8?B?dTlxeThDdzI2QkRqNnIvTm15Y1A3ZERZV29sUXBDVm05Wjd6MlhUUjV2ekxZ?=
 =?utf-8?B?cXQ5a3dwZnVFOUxCRXpsZlBHOGVveGJST2wrRE4zZjNTLzdRVHh2QmdxSENS?=
 =?utf-8?B?b3VheEpUckNQSVh6WTg4M2piRnYrQS9KQll4Z0dmeEVFQkxFeWNCYzQrQlR5?=
 =?utf-8?B?SFc3dDZvOFhzK01tbW85VVpJMzdwSlNvdXVSNjZ5dFdxZnNqbTExWGQwUmJh?=
 =?utf-8?B?ZjFVeklvbmFFSS9IUWNzcStjekNqUzVpNEQyQ1pUQjFPVzFaU1A2WXRHM25L?=
 =?utf-8?B?U0tsWUsxTXp5MFcxZU5rK2JTdDYwRjZXQUFIT1ZrT2Z1eVp1dHpvVjlaQWww?=
 =?utf-8?B?R0tiRWc4cngrdndPcG5qczA5YUZjU29UelB3R0R2WkxWZkhlNHhUREYwMUMw?=
 =?utf-8?B?TzRNcC9wdFZqb3pMUnBoK2xhSUI3YzFvRWdzU2tsMjNpOUs1T0J3VEs1d09T?=
 =?utf-8?B?TlZ0Yi9GWmhmc1JGRlBhVU95ZTVLQnpFT3dmQ0lMOUZjdFZoSUJhWGZUSTd4?=
 =?utf-8?B?UklhZTMvOHEzdXdwbTJBY1lhVHNOUHZHbHFFTmFIc09hZWtFZkRUeXBhMjZi?=
 =?utf-8?B?Y0h5bkEvZnhhdzBoS1hoeWdFQVFMd2RVRDhHWnFMeDRJcXhPNmtLQVU1dDh6?=
 =?utf-8?B?ZVk3RmdrdEQ0M2ttK0hDeTFpR2hWRmtVdDdMdzZyL05CTk1janVPNzJUUkRY?=
 =?utf-8?B?RDM5NGUzOVZrTURQZm5ubnB1U2pqMzRZTUVWS29sZ2ZHSS8xRVErNUpucUdG?=
 =?utf-8?B?WmJOSUY2TDNtSzJVUHhWOEVEaGJURERTZUN2ZTBUMU1oZlBjamIwTnhhcUwv?=
 =?utf-8?B?V3d0b3ZhL2JVcmV1V0ZyRXdDSks2L2xMd1lTNEZNWDBrNUFyN0ZNWHdlRllX?=
 =?utf-8?B?RFNOR2dqUHNnRzJxaWNPSXBDSTBCazUzUXlBR044U3ZFOTFKYUhvSDZwcXRI?=
 =?utf-8?B?U241WFNpWlJqc1lWZGcwdU5IUXZSbUNLa2dpVWF0MG9uOEhaRGMrcE5PemNv?=
 =?utf-8?B?amg3MzNISXR2cmJkNGwrTk1vRDl3cU5XazRmc2JDeHhtQllDaWVPMmt5VVBM?=
 =?utf-8?B?dTlIcTlpOWhaTlB5SFJ1V2prbjAvMzNLaFlmc2lDWEw5NXg1KzVVdUFDKzJ4?=
 =?utf-8?B?TEZtREk2cDVRRGN0eTF5ZmkxZGdvSkJncUNEVW1xV0tyWjNsSmpwM212SnNl?=
 =?utf-8?B?QUl0cnlzVG1nSnJ4NXQ5Y3ltc1lVamhUYlR6OFRFeS9tZTJIamVaQjNIdmQz?=
 =?utf-8?B?QmhVK2Jkem9ZQnM0WVVWMmdTdFdYSVV3bzFEVUNvaGtYdHE3ZDQ4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6354.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f3c1d4-0dfa-4a25-23a7-08da3727ec7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 10:36:23.6557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otCF0fly5ZHEHz0xJD9hWDJwfFDE+vTo9LaNOVKktYi2tFnpTa7lmXthI1zI0hEQgqNN3ESWBgxOtQd8QoOOfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5858
Received-SPF: pass client-ip=2a01:111:f400:7eae::614;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiAxNiBNYXkgMjAyMiAxMDo1Nw0KPiBU
bzogRnJlZGVyaWMgS29ucmFkIDxma29ucmFkQHhpbGlueC5jb20+DQo+IENjOiBxZW11LWRldmVs
QG5vbmdudS5vcmc7IGFsaXN0YWlyQGFsaXN0YWlyMjMubWU7DQo+IGVkZ2FyLmlnbGVzaWFzQGdt
YWlsLmNvbTsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgU2FpIFBhdmFuIEJvZGR1DQo+IDxzYWlwYXZh
QHhpbGlueC5jb20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlueC5jb20+Ow0KPiBma29u
cmFkQGFtZC5jb207IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbnguY29tPjsgRWRnYXIg
SWdsZXNpYXMNCj4gPGVkZ2FyaUB4aWxpbnguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYx
IDIvNF0geGxueF9kcDogSW50cm9kdWNlIGEgdmJsYW5rIHNpZ25hbA0KPiANCj4gT24gVHVlLCAz
IE1heSAyMDIyIGF0IDE2OjI3LCA8ZnJlZGVyaWMua29ucmFkQHhpbGlueC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gRnJvbTogU2FpIFBhdmFuIEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNv
bT4NCj4gPg0KPiA+IEFkZCBhIHBlcmlvZGljIHRpbWVyIHdoaWNoIHJhaXNlcyB2YmxhbmsgYXQg
YSBmcmVxdWVuY3kgb2YgMzBIei4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhaSBQYXZhbiBC
b2RkdSA8c2FpcGF2YUB4aWxpbnguY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEUuIEln
bGVzaWFzIDxlZGdhci5pZ2xlc2lhc0B4aWxpbnguY29tPg0KPiA+IENoYW5nZXMgYnkgZmtvbnJh
ZDoNCj4gPiAgIC0gU3dpdGNoZWQgdG8gdHJhbnNhY3Rpb24tYmFzZWQgcHRpbWVyIEFQSS4NCj4g
PiAgIC0gQWRkZWQgdGhlIERQX0lOVF9WQkxOS19TVEFSVCBtYWNyby4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBGcmVkZXJpYyBLb25yYWQgPGZrb25yYWRAYW1kLmNvbT4NCj4gPiAtLS0NCj4gDQo+IA0K
PiA+IEBAIC0xMzA5LDYgKzEzMjMsMTAgQEAgc3RhdGljIHZvaWQgeGxueF9kcF9yZWFsaXplKERl
dmljZVN0YXRlICpkZXYsDQo+IEVycm9yICoqZXJycCkNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZhcyk7DQo+ID4gICAgICBBVURfc2V0X3ZvbHVtZV9v
dXQocy0+YW1peGVyX291dHB1dF9zdHJlYW0sIDAsIDI1NSwgMjU1KTsNCj4gPiAgICAgIHhsbnhf
ZHBfYXVkaW9fYWN0aXZhdGUocyk7DQo+ID4gKyAgICBzLT52YmxhbmsgPSBwdGltZXJfaW5pdCh2
YmxhbmtfaGl0LCBzLCBQVElNRVJfUE9MSUNZX0RFRkFVTFQpOw0KPiA+ICsgICAgcHRpbWVyX3Ry
YW5zYWN0aW9uX2JlZ2luKHMtPnZibGFuayk7DQo+ID4gKyAgICBwdGltZXJfc2V0X2ZyZXEocy0+
dmJsYW5rLCAzMCk7DQo+ID4gKyAgICBwdGltZXJfdHJhbnNhY3Rpb25fY29tbWl0KHMtPnZibGFu
ayk7DQo+IA0KPiBUaGUgcHRpbWVyIGRvY3VtZW50YXRpb24gKGluIGluY2x1ZGUvaHcvcHRpbWVy
LmgpIHNheXMNCj4gICogVGhlIGRlZmF1bHQgcHRpbWVyIHBvbGljeSByZXRhaW5zIGJhY2t3YXJk
IGNvbXBhdGliaWxpdHkgd2l0aCB0aGUgbGVnYWN5DQo+ICAqIHRpbWVycy4gQ3VzdG9tIHBvbGlj
aWVzIGFyZSBhZGp1c3RpbmcgdGhlIGRlZmF1bHQgb25lLiBDb25zaWRlciBwcm92aWRpbmcNCj4g
ICogYSBjb3JyZWN0IHBvbGljeSBmb3IgeW91ciB0aW1lci4NCj4gDQo+IGFuZCBnb2VzIG9uIHRv
IGRlc2NyaWJlIHZhcmlvdXMgd2VpcmQgYmVoYXZpb3VycyBvZiB0aGUgZGVmYXVsdA0KPiBwb2xp
Y3kuIFlvdSBhbG1vc3QgY2VydGFpbmx5IGRvbid0IHdhbnQgdG8gdXNlIFBUSU1FUl9QT0xJQ1lf
REVGQVVMVA0KPiBmb3IgYSBuZXcgdGltZXIgLS0gaW5zdGVhZCBmaWd1cmUgb3V0IHRoZSBiZWhh
dmlvdXIgeW91IGFjdHVhbGx5DQo+IHdhbnQgYW5kIHNwZWNpZnkgdGhlIGFwcHJvcHJpYXRlIGZs
YWdzLg0KDQpIaSBQZXRlciwNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KDQpZZXMsIEkg
dGhpbmssIEkgY2FuIGp1c3QgdXNlIENPTlRJTlVPVVNfVFJJR0dFUiBhbmQgTk9fSU1NRURJQVRF
X1RSSUdHRVINCmluc3RlYWQgb2YgZm9yY2luZyB0aGUgZGVjcmVtZW50ZXIgLyByZWxvYWQgdmFs
dWUgdG8gMS4gIFdvdWxkIHRoYXQgYmUgY2xlYW5lcj8NCg0KVGhhbmtzLA0KRnJlZA0KDQo+IA0K
PiB0aGFua3MNCj4gLS0gUE1NDQo=

