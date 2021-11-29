Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50861460EA0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 06:38:56 +0100 (CET)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrZNO-0005dl-VM
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 00:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mrZM6-0004y4-2I
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 00:37:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:8731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mrZM2-0001T1-VH
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 00:37:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="259810580"
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; d="scan'208";a="259810580"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2021 21:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; d="scan'208";a="458312124"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 28 Nov 2021 21:37:19 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 28 Nov 2021 21:37:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 28 Nov 2021 21:37:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 28 Nov 2021 21:37:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeCDDO1urWru5AJbUoSBPEu17j0oZDKmwO3b8P8ayDJ0UJC2dFu3p15yTJVaP0Q8tHbV5DiE0fF/Fby3ZGAf3DszejpA3NELbGmiF8zXoOBl8tAEbKhh8KTXqFYX3KMlJgfItoS+/2GiKQeX/ou0t2Gdz26fvzkDEMM5/hzHbJH2d3SqdDpf/4Oz+0tAUR8Bw/xxzbDSb5piSzFL6cmwlaVLvomeeBL6Q+f4tyvp/WhCW7RNnFDBhqkjbIBJM1bwkBHgevHhh2vphpOzROQl3b5eb4RKjkkyNExA3mu15TDQMi7uMQ+qZEaHJuDO7Audwhy/mgMr4zeZ2kBwfcvYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5PLYtPCSyP14NFWWZD+E6nsqwGqbf06oHbS9VjRIo8=;
 b=BcoNWu+XeNj38SWV6WujJw5Z6Cpx7kazb8vCEQXG5o+iSpX5r9uFudIYx8nHJ7O6jpX6xcanHUJlz1CcBya/JObjMvu3pHwdYG6Nf/PdzzySFr5RV8dEenSkdVWwAF8nCk1zgLtUdeYQBLlYHxb4FihGzIrvhdbqFWZ43NCzRsZdPBHWvZ9Hoves+lAKJue9DhWcKOOlH6UVyNsJewSOivRnh7hkEeWqJDXE6tog7XM8XEqD+HA80n4uML/rbWs/aoH2OqsNqbs9S7oBqPErkt3l5HDSBsOUZwDPjmT1eS8pYxPGELdLYrLvzVjsKSx6LdCjJOjcWYKzR+neQovyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5PLYtPCSyP14NFWWZD+E6nsqwGqbf06oHbS9VjRIo8=;
 b=Z1H57BMN0JuDnhFr3PBkyq89OQklWDAnLYI0x8Jom9u7VoSYJ1OmOXV2frxkFX2vX5/BlYlGnUlwK9PIa3vm0IuDLShlKznOnTNbe1YMBgRxQuwN6+E/pTKQ7injRCiffNN9uTHeY1yNq4VQZ3PW50jpfmKQpMCGRP3OaLfXlmg=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 05:37:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c%8]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 05:37:14 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Topic: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Index: AQHX4PkO8vWA/pLrmUq8Xu2sJLwMqKwST9sAgAFIEoCAABCYAIAAEYxwgAALIICAABebQIAF33gAgAATcACAAAycAIAAHFlA
Date: Mon, 29 Nov 2021 05:37:14 +0000
Message-ID: <PH0PR11MB56583E8151EA6E451371A4DCC3669@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8RfrbwXEB2fcJv@xz-m1.local>
 <PH0PR11MB5658E15F420BCBAD2AA58E23C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8pi2ty2Z8wjt9u@xz-m1.local>
 <PH0PR11MB5658CC570A4E5B88CA3464A9C3659@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YaQqjEwDVUGurPD7@xz-m1.local>
 <CACGkMEuz1qyp88igffJM+jQv5DUEnsu2yVmPwW45c8Qxo9hvGg@mail.gmail.com>
 <YaRFbvwR5Q2U6J3H@xz-m1.local>
In-Reply-To: <YaRFbvwR5Q2U6J3H@xz-m1.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a1c7d9b-8eb8-47b1-617d-08d9b2fa4ca8
x-ms-traffictypediagnostic: PH0PR11MB5611:
x-microsoft-antispam-prvs: <PH0PR11MB5611BB460616AD9A2824D7D5C3669@PH0PR11MB5611.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: toqMcayToJI0DmtkJ14jTcBHnTustPO9YcCqOagJNMwz3BbT0xzdJzuY5OuJv1O41JEcfp5XEOy6w566Pv4dFKmSif34Y9dmypdNAD8Pyu/DlSWTgTzQ+80/VBTZUpZTGll85CqkFOYg22zLxhgnlAPl18/qpGJkG49dnttMqOQ7tTtafXckSUHVfqN/UOY4qDhdbzaoaeTPxMmavj8ZKTpw2vaaXe2b6MyyvO/SR/yO02JD/uBdquznghPtsRYD2I6nXbi3pdmNta9ZdSrq8boNwxk/BQPc3oAnqDLb05iC4KXXdc0Tk4HVTJPpF3kDHCTomVdCS3iuligkkKAsbN/ghJbB8IBipsJXdKkYKc4y6I593P8ulvrvD2t3pPxoDsTBbxnfJkAZb49fcchEduuQY7ScDnuU7cfkW+kRkoFzioyHwowgMFUrmzqcTdTnPU69TlXCeRLvhlwrlI7MsbNEiXOx45gIkqqEjyeWwKOxNpCX7dxGrwJqRkeNL2ni4AmHKIHoqoOwuxlqFY1gRaOp6LjNN8a+roCnbsGYKfi756tA/qcJIk5PcqpTMwY+LDCcGztX8vtiXmgJzQY9R1VIkPZDomqxt7s5P1fGAS6zqGcd/UZdVq32KIGwz4CDKk++s87pdeGlym7gPusBj6+F6WZbYkmqNibuSmh/DgE5041DyRqyeFEsSqhnkP8MIr/M1qNuUM0ipGvF8zOl6xEKfcDzdfZnDuLAR7SJu4E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9686003)(8676002)(8936002)(66446008)(71200400001)(55016003)(508600001)(38070700005)(4326008)(66476007)(66946007)(64756008)(66556008)(52536014)(86362001)(82960400001)(110136005)(54906003)(6506007)(26005)(122000001)(2906002)(33656002)(83380400001)(186003)(5660300002)(7696005)(38100700002)(76116006)(316002)(9126006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFo5RWE4RXpERXcweWpxb2JCQ2ZyTWQ1emtHOHJJRUQwdm5KdmNxYmR3ZGRK?=
 =?utf-8?B?ZGpYMWVhaDY0ckFSaWdYbm01Vk4vUGF4ZGNLZDgzeEI1MlFaeUJTN0plR2Nm?=
 =?utf-8?B?V1hsY2JjazhMWC9UVXcyUm8vWm5CYjhkNExMTWs2Zzc1V010MzJuSWtyUFVI?=
 =?utf-8?B?bGZ4WXJFTnU1SlFMZENKdUtCbCsxYnlFVWJ1QWQvcVphSGttaU9WUHlFRFJw?=
 =?utf-8?B?aUdXTDJUdS9kU1ZnQjJHeFZ3bG5ia1pQM2JiK3RIMllsVlpGWjRxUjNycDNy?=
 =?utf-8?B?ODFxTEtpZlJncDlBdUxnZVc4OUM4MGR3Wlo2RnUrUUhVU1VSb21TaWk0VUNB?=
 =?utf-8?B?VXB0UExTcWd0Y0F1Mnk1K1FML0dJWFRaV0hlMHRHUGlja1MrTDFuRm1UUzZ4?=
 =?utf-8?B?MXZsMSsvTHc4NVJPa2hrWEV2M1BYd0UwaG1XU2R4TlhuMlVxNVhuUUgyUG5P?=
 =?utf-8?B?S0JpWmpXMlBFMW1jTjVZSUZraGpkdUw2czFNOHhGUEF2QUpEbUlPM0ZCTW9h?=
 =?utf-8?B?NDdKZFY5N3I1bkpvV0N1VlpzNzRuNGRIY3dpNHE4SDVhWWsyZGcwYU1jTHJJ?=
 =?utf-8?B?TTl1NHE3aWFrekNKUUZuZm5Rc21KeUlyUmFvRFE1NWw2MjVFZ005WnJpQW56?=
 =?utf-8?B?SXBQQkpZSmg4T0p1UkdRR3VFajFLWjNXalhSYkRCcWI2T2F3UHJWMFViRGIz?=
 =?utf-8?B?RXhSNVhZcytkbFM5TWk5L1VRN3d6eHVjUkFFb0RBb3d0eEtJeTJHRlQwNUxp?=
 =?utf-8?B?cUY3WDhibkZpY0FySjA0aWFSNUNDYTdaY0puc2VxK2QxMDdPTHdydFZteURR?=
 =?utf-8?B?Qm05ZGxFbi93dnFCTllWZWx4MnhESTByVmlPWkdkTXhJbGRpQnFPV0FaWWVn?=
 =?utf-8?B?akNUTHd1QXZNeWFZUDBkZFZvcGdKaWRFbVhWOTl6L1FQZUJXZitOKzV5bFo3?=
 =?utf-8?B?Q0hpa2tKY0QrT0x0OEdJSzY2Ymx0THcxOTI5R0V1QTVUNHliY2RESXdyQ0lC?=
 =?utf-8?B?WUYzbklpWWV1Zk5TM1M3SklpMVF4eUQydjBzeXA0WFh1M3IxYStoZUEvTDdN?=
 =?utf-8?B?MEpBYnZzSk9TUjFFM0pwUmFsaFZMaUEvUTYvQmZSck5uSG1EbHBqN0J6dUZj?=
 =?utf-8?B?cmRqNkpGL3IvWEFWNVpCRDhqd2hXbUdWREh5blBWQmRqeDJrSWpQd0l2U05M?=
 =?utf-8?B?aXZNWElTdWpwNnhEQWxoVXpBb0dCaHQxdWVscWpCZHdhSGJQb1ZocUo0ay93?=
 =?utf-8?B?OGkweHNzVHJBdmhNQUdCeXVmUmNOVjVXaGdaWHNscjRnVVRNdXB6ck1jSGxu?=
 =?utf-8?B?QTREblFKQVg5aDhabk92ejR4Wll6cm90c1FXRWozZGpnT0o4UGJrWEJSYzRZ?=
 =?utf-8?B?bk1VZ25hV0JFZUYxUSsrU2M0cjhpNzhna2s3QnhsVHlaQjR4NzllakdVRE5G?=
 =?utf-8?B?SWFMYVdNYTc2d2FGQWxHVGF5RS8yK0hTYlRnenRZamxYRlA3VzJoSkEwbG0v?=
 =?utf-8?B?WjJ2d3RtdXBxN0NHbHZuTnArYU5EK0p2QWNaSDVIcHgyTDZpSnpRTkp5RDM0?=
 =?utf-8?B?RmZaM2ZnSTVqSndscHl6QlJSc0ZqejgyM2RXWGx6VXR2S1BhKzRLSm1rQjA5?=
 =?utf-8?B?SWFIWUpmK20rekY4S0djNDBkYW9vTmRDVU1YRjBucmJuY1dWaU9MMldERVNZ?=
 =?utf-8?B?d0pTNmVDRzkxR292bjQ3aTNWQllRdVhZakplUE1tc0JiemtubFpzR0N4L3lj?=
 =?utf-8?B?UWlTYmNJVzJyTWs4K09Xb3AwN2kvV01QeWVMbmJiYjBUQ1Q4SXIyQnE0bHFZ?=
 =?utf-8?B?clY5VElaNVpCVlRjeXpTMTBHMUQ3Y1BmZ3VkR2hDTFB5Y1B0bUNUdHhCUDFp?=
 =?utf-8?B?ampLTUhRT0RXZTlqWHk4S1IxM053QTF0aENPaU5QdjlLU3lTNXhTMTBxUWN5?=
 =?utf-8?B?THlrdDVRYXdGN3lyVVBMSHYxeU1PeEh1ZHFtYjRjTGpZMkJFbWlXWmFyQkFw?=
 =?utf-8?B?L21OdlhmNTlsdEozR3BDMnRreldxY3ltTGkzc0FkazBscmN4Wk5rcGYyWlZa?=
 =?utf-8?B?ekFMWFRpNldrMko2Tit6UTJvQWtKVDNFZzQ3MWdqd3BodTBEbDI3K3Q1NWZN?=
 =?utf-8?B?RlhocjNRU2paV2ZnVno5dGVHcyt6dGcvcThyalJLYWxTckZZVk41ZHR6VWRS?=
 =?utf-8?Q?1MrwE7L2X2VpPNmweWuvDKU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1c7d9b-8eb8-47b1-617d-08d9b2fa4ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 05:37:14.5754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxsWiMhQTBRQqhUtoe8rwgAkkY1VNVN1k5x2CEJks/K2hdThSrY7u47BsEkn8gUbcNT1gtC7cZiNtLvRJkBL/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yi.l.liu@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92
ZW1iZXIgMjksIDIwMjEgMTE6MTQgQU0NCj4gDQo+IE9uIE1vbiwgTm92IDI5LCAyMDIxIGF0IDEw
OjI4OjQyQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6DQo+ID4NCj4gPiBBbmQgaW4gdGhlIGZ1
dHVyZSwgaXQgY291bGQgYmUgZXZlbiBtb3JlIHRyb3VibGVzb21lLGUuZyB0aGVyZSdzIG9uZQ0K
PiA+IGRheSB3ZSBmb3VuZCBhbm90aGVyIGJpdCB0aGF0IG5lZWRzIG5vdCB0byBiZSBjaGVja2Vk
LiBNYXliZSB3ZSBzaG91bGQNCj4gPiBldmVuIHJlbW92ZSBhbGwgdGhlIHJzdmQgYml0cyBjaGVj
a3M/DQo+IA0KPiBXaGVuIGEgcmVhbCBoYXJkd2FyZSBzZWVzIGFueSBvZiB0aGUgcmVzZXJ2ZWQg
Yml0cyBzZXQsIGl0J2xsIGJhaWwgb3V0IGFuZA0KPiByYWlzZSBhbiBlcnJvciwgcmlnaHQ/DQoN
CkkgdGhpbmsgc28uIHZ0ZCBzcGVjIGhhcyBkZWZpbmVkIE5vbi16ZXJvIHJlc2VydmVkIGZpZWxk
IGVycm9yIGNvZGUgYWdhaW5zdA0KYWxsIHRoZSB0cmFuc2xhdGlvbiBzdHJ1Y3R1cmVzIChyb290
L2NvbnRleHQvcGFzaWQgZGlyL3Bhc2lkIHRhYmxlL3BhZ2UgdGFibGUpDQpmb3IgaXQuIEFuZCBp
dCBtYWtlcyBzZW5zZSBzaW5jZSBhbnkgc3VjaCBlcnJvciBpbmRpY2F0ZXMgYSBwb3RlbnRpYWwN
Cm1pc3VuZGVyc3RhbmRpbmcgb24gdGhlIHNwZWMuDQoNCj4gSWYgdGhhdCdzIHRoZSBjYXNlLCBJ
J20gd29uZGVyaW5nIHdoZXRoZXIgd2Ugc2hvdWxkIGFsd2F5cyBmb2xsb3cgdGhlDQo+IGhhcmR3
YXJlIGJlaGF2aW9yIGFzIGFuIGVtdWxhdG9yLg0KDQpJIHRoaW5rIHNvLiBhbmQgY3VycmVudCB2
aXJ0dWFsIEludGVsIElPTU1VIGRvZXMgYSBnb29kIGpvYiB0byBkZXRlY3QgdGhlDQpTTlAgc2V0
dGluZy46KQ0KDQo+IE5vdyBJJ20gdHJ5aW5nIHRvIHJlbWVtYmVyIG5vcm1hbGx5IGhvdyBhIHNw
ZWMgY291bGQgcmUtdXNlIGEgYml0IHRoYXQgd2FzDQo+IHVzZWQgdG8gYmUgcmVzZXJ2ZWQ6IHNo
b3VsZCB0aGUgaGFyZHdhcmUgYnVtcHMgdGhlIHZlcnNpb24gb2YgdGhlIHZlcnNpb24gcmVnIGlu
IHNvDQo+IHRoYXQgc29mdHdhcmVzIHdpbGwga25vdyB3aGF0IHRvIGV4cGVjdD8NCg0KZGVmaW5p
bmcgYSBuZXcgY2FwYWJpbGl0eSBiaXQgaXMgYWxzbyBhIHdheSBmb3IgaXQuIE5ldyBzb2Z0d2Fy
ZSB3aWxsIHByb2JlIHRoZQ0KY2FwYWJpbGl0eSBiaXQgYW5kIHRoZW4gcHJvZ3JhbSB0aGUgYml0
IHdoaWNoIHdhcyByZXNlcnZlZCBidXQgbm93IHJlZGVmaW5lZC4NCk9sZCBzb2Z0d2FyZSBkb2Vz
buKAmXQgaGF2ZSBhbnkgaWRlYSBvbiB0aGUgbmV3IGNhcGFiaWxpdHkgYml0LCBzbyBpdCB3aWxs
IG5vdA0KcHJvZ3JhbSB0aGUgcmVzZXJ2ZWQgYml0Lg0KDQo+IFNvIEknbSB0aGlua2luZyB3aGV0
aGVyIHRoZSBlbXVsYXRvciBjb2RlIGNhbiBpZGVudGlmeSB0aGUgdmVyc2lvbiBidW1wIGJ5DQo+
ICJzY2FsYWJsZSBtb2RlIGVuYWJsZWQiLCBpZiBzbyB3ZSBrbm93IHNvbWUgcmVzdmVkIGJpdHMg
YXJlICJpZ25vcmVkIiBub3csDQo+IGFuZCBJSVVDIHRoYXQncyBtb3N0bHkgdGhlIG9yaWdpbmFs
IHByb3Bvc2FsIHRvIGFkZCBhIHF1aXJrIHdoZW4gc2NhbGFibGUgbW9kZQ0KPiBpbiB2dGRfaW5p
dCgpLg0KDQpkbyB5b3UgbWVhbiB0aGUgc3BlYyB2ZXJzaW9uIG9yPw0KDQo+IEJ1dCBhZ2Fpbiwg
SSByZWFsbHkgdGhpbmsgaXQgc2hvdWxkIGJlIHRoZSBzcGVjIG93bmVyIHdobyBzaG91bGQgaGF2
ZQ0KPiBjb25zaWRlcmVkIGFsbCB0aGVzZS4uDQoNCnllcywgc3BlYyBvd25lciBzaG91bGQgY29u
c2lkZXIgaXQuDQoNCj4gZS5nLiBleHBsaWNpdGx5IGRvY3VtZW50ICJ0aGlzIGJpdCB3YXMgdXNl
ZCB0byByZXNlcnZlZCwNCj4gYnV0IHdoZW4gc2NhbGFibGUgbW9kZSBlbmFibGVkIGl0J3MgaWdu
b3JlZCBhbmQgcHJvZ3JhbW1hYmxlIGJ5IHRoZSBndWVzdA0KPiBkcml2ZXIiLCBvciBzb21ldGhp
bmcgbGlrZSB0aGF0Lg0KDQp0aGVyZSBpcyBhIGdvb2QgZXhhbXBsZSBmb3IgeW91ciBhYm92ZSBz
ZW50ZW5jZS4gSXQncyB0aGUgcm9vdCB0YWJsZSBlbnRyeQ0KYW5kIHRoZSBzY2FsYWJsZSBtb2Rl
IHJvb3QgdGFibGUgZW50cnkuIEluIGxlZ2FjeSBtb2RlLCB0aGUgaGlnaCA2NCBiaXRzIG9mDQpy
b290IHRhYmxlIGVudHJ5IGFyZSBhbGwgcmVzZXJ2ZWQuIEluIHNjYWxhYmxlIG1vZGUsIHNvbWUg
b2YgdGhlIGhpZ2ggNjQgYml0cw0KYXJlIHVzZWQuIEkgdGhpbmsgd2UgaGF2ZSBkZWZpbmVkIHNj
YWxhYmxlIG1vZGUgcmVzZXJ2ZWQgYml0cyBtYWNybyBpbiB0aGUNCmVtdWxhdG9yIGNvZGUuDQoN
CkJ1dCByZWdhcmRzIHRvIG1pbm9yIGNoYW5nZXMgd2l0aGluIGEgd29ya2luZyBtb2RlLCBpdCBt
YXkgYmUgbW9yZSBjb21tb24gdG8NCmRlZmluZSBhIGNhcGFiaWxpdHkgYml0IHdoZW4gYSByZXNl
cnZlZCBiaXQgaXMgcmUtdXNlZC4NCg0KUmVnYXJkcywNCllpIExpdQ0K

