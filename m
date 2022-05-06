Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54351CDFC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 04:10:26 +0200 (CEST)
Received: from localhost ([::1]:36572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmnQG-0001qf-VF
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 22:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1nmnP5-0000xA-Iz; Thu, 05 May 2022 22:09:11 -0400
Received: from esa10.fujitsucc.c3s2.iphmx.com ([68.232.159.247]:41910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1nmnP3-0006Be-GT; Thu, 05 May 2022 22:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1651802949; x=1683338949;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fKQ7oQVDL+pMkkCYVZATy1LwcwxNvI9ptM/3zNkoR4E=;
 b=AO2xHKxtRTMBehkla1SQMnz1hvKq/ZCBnGUwq3uwYzZoS6SHS6opgIJI
 Db9PGd4woI/YxBHBVzaA2Y/4OOwaftleKmZUXEuT8ypJl5I9csXSec3/b
 9SRVvgUhFYZxIms5f6f76c57eZLilTZDCq15q7r/nqGxzNxZAIxkY82Vk
 f6vaTZGADkrtyw/bVCU6VxaLIFHROjW38Op1vzxaaFd7I25c+TkGfdNna
 lyBEdtYlt+L3WOdY2NkM0NPSfe0F7R2VJrXyheFuUAd9a906A4EKwCQoT
 KNS15GI8sMvvPVKSw7CKxkNcUwpg0oFZfn/T9amf30ZhhxUOqx9KFnKe9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="55338967"
X-IronPort-AV: E=Sophos;i="5.91,203,1647270000"; d="scan'208";a="55338967"
Received: from mail-os0jpn01lp2113.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.113])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 11:09:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyDZkJqNfFyKruTQMjPHWadd8swf7VGONHk5yFE28hZuIc3sc+HDCWAfhTmHaIbw0eI+O0zqCHv1lCHvJAkFuQLgIdAktX2ExV8Ax0tSwdG9C9q2k1D75W8hmPh4sHZB83TP41oMoQByVlEMFqxZ7rCNF6GyoQe5gRkINEyWAwWcR1efzeIvMkEbI9fxFvh7nWyEvDIDgpcPtswDd3o/MVsaTyzJqnl3mMspgN0n13GMT+Gfp9dV/0CVRNi10KUEHSV36APn7RrcoO2thaTx9PAjwbzW8QEouziV1sCNEBOjt78mIrbrGBumeTyalKOCsBCCaIvy4Dq0PFxHSYKr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKQ7oQVDL+pMkkCYVZATy1LwcwxNvI9ptM/3zNkoR4E=;
 b=JaMbVz9FFyrmC2tpkvSYptcducK8AREifMVoXqU/UPbBhVAiCI/tz+++ac3yd6LOZ8FD7cVfJEepHBE02bL5YykSC0GBNIlZYxVkZa00yhYmNq6ILXh1ZtWywXUtsYujd7oFI758q5u7rzpycf8RZrU3Ag1Rcwu6HGDCksKhP4w786BTMBij+3IszUCPslys+N30+BSepebrUe6EORbexaVUkAjFLGJRjq7ghd5SEDTkU43+ZeKoAWerHGw2wDjg0TosZqDdXcRccnF4y1MJ/V3SsG3m2E6l9+MS9olhnIl/d/H/tK0XhsvbMBbhnrlGuKdq0G5VE2NhPdIvIjj2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKQ7oQVDL+pMkkCYVZATy1LwcwxNvI9ptM/3zNkoR4E=;
 b=DJRGDCT6AbF6Om6tVyqHj6KsXXi+1Dsejvoc6UXr8Vm3oZZkye/7yJXU37Q9Za8wwzln1kWdgQ02XJQFhy7uAod5zuJ6RaYVBB89NSefmxM9x8uJDFn1v+C6y9PFOutLd05Wv3gdX/NSR14a5pgpq1XcbsHQ0nQ7vVL169iPo9k=
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com (2603:1096:604:107::13)
 by OSBPR01MB2823.jpnprd01.prod.outlook.com (2603:1096:604:1a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 02:09:01 +0000
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::2112:8b9f:fbeb:367f]) by OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::2112:8b9f:fbeb:367f%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 02:09:01 +0000
From: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] docs: Correct the default thread-pool-size
Thread-Topic: [PATCH] docs: Correct the default thread-pool-size
Thread-Index: AQHYTu3i/2SNjuhH9EapQkf/Uwifj6zvVdyAgBO0IACADjSoAA==
Date: Fri, 6 May 2022 02:09:01 +0000
Message-ID: <aac992d8-4485-f5a6-e266-798884953a37@fujitsu.com>
References: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
 <YlgRRcgIbbE+ZKb7@redhat.com>
 <d6c4a49b-4547-8b65-02c6-9d3f72d611af@fujitsu.com>
In-Reply-To: <d6c4a49b-4547-8b65-02c6-9d3f72d611af@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f560e4ff-6d80-46bb-71da-08da2f05632f
x-ms-traffictypediagnostic: OSBPR01MB2823:EE_
x-microsoft-antispam-prvs: <OSBPR01MB2823FFC11D92DB65C30F73D69BC59@OSBPR01MB2823.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p+TbgmrxRIYNXYiWySNGhOK1qDrTnTQ/TSv47ai2hVfmv+QTLRGFnyBqcsDT0l6HyEkkJnUi9v125mUDVUu5iNDS4Z2BVmckdhvZ8GtaoC/gmNkT2/x5XUIbCSNQpJJ//5Wv3JDs51wGJVpeUtn5j4TgOHuERveCTjt1anyc76Q8pn9ezDUh1WUYpMoT8IyOGvijc7L/a4gmLz19CkbBvy4tQ0u0xSh1oDPjyEwlGfC+8oAoeLGvM3W8+NTCHvsyb1ovjnHuHkXtkOdDStp6g56xR3U0lSVwfE9AgikAxgiINN1YJQZijoPf4ckLHUMc6O9vMMuPsBrwv361PvPWpEi0EcgKdcECL5zX9kAd2QV3C/O7HPNVe+s/KQa7EejM5RfLC8z4hzIFX6iIG3Vri3kusAInrFIpniBGIbxKlH0288wjAP4lIuJ1+pBjeyg2D/SnqKp9BQfTjtY0GX1kx5ACx8QtDhEJXYG65r/gNHr+/NSpaNHDXPSgRJaGHB9zah5On4oCoKPKh073BDFgIHBRCZTQnUYjL/MtkCDLMvG7koWUK0SR7X+3OSEZkPG9zArSKp0eUNzbXRVtHQ8SnjR9PZmUSD+9EwJ8/t2PN5XAlFqdoMqpUQepDkzODXS5WeB4LQmRWx9BTQyMFDxr05TafomF6pzYUGM2luR5GFTb96J0WnqRQhZlGKeo16DEcJtXzgcpGlRfDbWdnYTuNbyDt9FltDdx+1JqBiGA2nmwJYf51GZGLlvtFD3qE8hz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6481.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(38070700005)(83380400001)(82960400001)(38100700002)(186003)(5660300002)(2906002)(8936002)(31686004)(36756003)(85182001)(76116006)(66946007)(110136005)(66556008)(91956017)(66446008)(6506007)(31696002)(8676002)(4326008)(66476007)(64756008)(53546011)(2616005)(316002)(6512007)(26005)(6486002)(508600001)(86362001)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm1sUGF1N1VaNm91eFp2bnAwRFRZQ3pGLzdvZnA4VnlzMndwSG1FdnFSdzdO?=
 =?utf-8?B?YjFOSjZqR2lOYkdKNjllSkVnT1d3Y1Y1UGk3MytoRTczeG5QaGg1VGgwcnBU?=
 =?utf-8?B?R3FSV2c4Mkg4djhZVml4VW1uRnVoenJreU1HazVkRjEwa2crcm10cWpjTlFG?=
 =?utf-8?B?Z1FMZlA3YStwWUJQeUpLSC9QZ3ZRS1h1Y1ZwL0x2VGZhSmR0bTFWYjIvM1dI?=
 =?utf-8?B?dHlUb2RmaHd3azZEOFI3dC9aOUVxS2grZU5TQmcyaTlVV2huS1NNTEJTRGFM?=
 =?utf-8?B?WkV5NW5CQmFWNy9lN2wwcW9OVVFMWGlESkdzRWNYbkNsdTFlR2JjR00zSStx?=
 =?utf-8?B?RU16RWJFSEZ3NmdJdWhwRERNQ0lhVzBVMlVQYmY4TVV4TnRRTGxIZmU2cGtV?=
 =?utf-8?B?UjdYT2lTSlU1U0ljQk9UcGJwNFA3WTB3SVpUZ0pzVXpDS3NTcUs4clQzWSsv?=
 =?utf-8?B?SVdCVm9yMDVsc3dRNHNFQ1haRjJGL28wOG8xUXhRekhSeHBuUTJ2LzVwTGRP?=
 =?utf-8?B?QS9mQ1lFTGdFWWpvNHJBbmsxZkZhWmh5WDVRL0hvRTdlWEtOUTFVa1RsS3hm?=
 =?utf-8?B?S0NsZXpsNXV2VFIvbE0xTEpIczhqRkRrcEFFQ3c2dm5XbzBXbkUvNHUxQmxS?=
 =?utf-8?B?dUtTY20vRlhWVG5UeWErSDNJTlFGNk1rUDNTMkhLbWlKUUJkZ3Z1cmFDZ0U5?=
 =?utf-8?B?VXBRdVpJSUlaS2xlSXlhTVJrN1B2QWp3eXZqSzFzdWhsWEVsUVJEbjkvNUl1?=
 =?utf-8?B?R2FKYzc3OGR2ZWxObEFsb25YekRBSUlEZUpxMEFWMlk5TlMzWS8wODYrRjFI?=
 =?utf-8?B?V1QzVUZkanY3aW12eUtnMGppZ3dHOEpSUEtCVWlvWHdiS25pQnhxaWJsSTds?=
 =?utf-8?B?UGZwMjdrNitTaFY1WXBQMGdLTEhGQk8xM2pnNzZwNkVFc1plTHhLUzhQQWE3?=
 =?utf-8?B?b0psTERLRC9sN1MrZW83QlhhYWhESnoyK3ltUGJhVUdwVVNSMHA2VW9iU1BE?=
 =?utf-8?B?YWpnOURtN2VxeGFWZFk1ZGUxeW41VXhkZjhNRGcraWZ4VnZzcEM4WXltWXI5?=
 =?utf-8?B?UElPR3BFNk1rYlAwZm9SUWVwbm5GbTA2TVExZXZJZjB4bDBqai9GMjZFd3J0?=
 =?utf-8?B?MUswK3Y1eXM3ZXZtc2JUVGVlck84UjVSc3gwSHh5L25EOFBhU3p3cEVZUkts?=
 =?utf-8?B?ckZEeTRwclJSMVRjMDZIcXhQZEVCM1A5SEcxZkR0VXdJRnl5dFpqNktDd0tT?=
 =?utf-8?B?WlFLem9WL2Y4TFQwVEc3OVFsbHMrbU5jWVplSzQ1VUxtKzYyVEJVYVN6VC91?=
 =?utf-8?B?NUNPdEpPZmhmbldRWDBHdzdMY1laQjczZVRWT1FaUVppY0NqME80WHBUYkZQ?=
 =?utf-8?B?T0tSamw2UVUvclJSTHdQOTlIcUt5dFpha1doN0hKWHVHUTFya0FNNDZTUkxW?=
 =?utf-8?B?dGhLOVZDOEZzWTRpdmRnNkJGcm9MU0gzeXpSVFA3ak55aSs1OEFZVi9xK200?=
 =?utf-8?B?QUd2MW9aQ3FrWlFhbEJmSC9ub1pSai9MNi9mUG9tZDFNVkg4dmdPSHNxcTI2?=
 =?utf-8?B?MS9ReXB6eHc4bUR3bWpJVThYRWhIYm9hRW1STVBIN0RHVzRhTHFxdnQ2NUla?=
 =?utf-8?B?UjBDT3hUNjJCcXpKaWk5anlRWnFmampvaENubzBsUHcrSTVZekpmZFFScEs3?=
 =?utf-8?B?TDBLdlV1TEJJNXo1RlFya05hM3JDcStETG1HQUt1UWRBSmNoLzNnSzNTNURR?=
 =?utf-8?B?RUwxWStZRDdJa2xZT3ppRE1tZExQSVk2c2JwNzdseE56aE1WZE9wcGRUREg4?=
 =?utf-8?B?RnZOQm1nemVjNUxzUnVJK2o1bXVuVzFxV09VS0JvTS8zeW5oellxRXlsSzVW?=
 =?utf-8?B?MDJYS3ZtWnVuM2ZidkN1UHgybXpBVVMrd09CeGNyOW1IZEZYK1cvb0JFSGY3?=
 =?utf-8?B?SE85NGFJNW1EUWV6cWswRktwWkRlbzRRclBhUGpBcmh6SXkwS05ZV0pJWTZJ?=
 =?utf-8?B?SC95c2p2dzUra2I2OHgwQXUvcmdWR0dhNDFWQzVVZ2NDZGVMcEZXVmV6MytT?=
 =?utf-8?B?dnZ3eHVzYW1tQ1kyL0pYZkpJRlM5RHdkRjFnWDJOQmQ1TkpPdVNMVzZTV0hB?=
 =?utf-8?B?UHJ5NFg3Z053VXpzakVaSS9DUktCSXMrZHNGM2FsejlUTXJvcjdHV3ZtWE56?=
 =?utf-8?B?SytNYzFZUkxKRVg2NGVNMTc5ZWJOTzRPV2pDdG1MRUJWSUplVzBjcmM4cVA1?=
 =?utf-8?B?ZWtkWVZqRkFqR0FkbzRDMlZhQzJJWGo3V1gxNmFmR1RCeTZOaHVEMWlrYjBx?=
 =?utf-8?B?RU9QR1JBRThpdUZaUkRQUEdKczBoLzlYektKaWROVHdPaHVacUdmVFBFL1Zq?=
 =?utf-8?Q?O2+zuFeGu8pEUd0I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FCDDC4E31C1F34C82387D8225E87D90@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6481.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f560e4ff-6d80-46bb-71da-08da2f05632f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 02:09:01.1273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFQMcSHehZ0TcY6CL8zoHWna1Tmn2vMoWsfsgNIZT368citW1Z/rvB5v147R/mqWjGVOJlHlFyDvSJDS80SwCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2823
Received-SPF: pass client-ip=68.232.159.247;
 envelope-from=liuyd.fnst@fujitsu.com; helo=esa10.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

R2VudGx5IHBpbmcNCg0KDQpPbiA0LzI3LzIyIDk6MTIgQU0sIGxpdXlkLmZuc3RAZnVqaXRzdS5j
b20gd3JvdGU6DQo+IFsrY2MgcWVtdS10cml2aWFsXQ0KPg0KPiBPbiA0LzE0LzIyIDg6MTkgUE0s
IFZpdmVrIEdveWFsIHdyb3RlOg0KPj4gT24gV2VkLCBBcHIgMTMsIDIwMjIgYXQgMTI6MjA6NTRQ
TSArMDgwMCwgTGl1IFlpZGluZyB3cm90ZToNCj4+PiBSZWZlciB0byAyNmVjMTkwOTY0IHZpcnRp
b2ZzZDogRG8gbm90IHVzZSBhIHRocmVhZCBwb29sIGJ5IGRlZmF1bHQNCj4+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+PiBMb29rcyBn
b29kLiBPdXIgZGVmYXVsdCB1c2VkIHRvIGJlIC0tdGhyZWFkLXBvb2wtc2l6ZT02NC4gQnV0IHdl
IGNoYW5nZWQNCj4+IGl0IHRvIHVzaW5nIG5vIHRocmVhZCBwb29sIGJlY2F1c2Ugb24gbG93ZXIg
ZW5kIG9mIHdvcmtsb2FkcyBpdCBwZXJmb3JtZWQNCj4+IGJldHRlci4gV2hlbiBtdWx0aXBsZSB0
aHJlYWRzIGFyZSBkb2luZyBwYXJhbGxlbCBJL08gdGhlbiwgdGhyZWFkIHBvb2wNCj4+IGhlbHBz
LiBTbyBwZW9wbGUgd2hvIHdhbnQgdG8gZG8gbG90cyBvZiBwYXJhbGxlbCBJL08gc2hvdWxkIG1h
bnVhbGx5DQo+PiBlbmFibGUgdGhyZWFkIHBvb2wuDQo+Pg0KPj4gQWNrZWQtYnk6IFZpdmVrIEdv
eWFsIDx2Z295YWxAcmVkaGF0LmNvbT4NCj4+DQo+PiBWaXZlaw0KPj4+IC0tLQ0KPj4+ICAgIGRv
Y3MvdG9vbHMvdmlydGlvZnNkLnJzdCB8IDIgKy0NCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kb2NzL3Rv
b2xzL3ZpcnRpb2ZzZC5yc3QgYi9kb2NzL3Rvb2xzL3ZpcnRpb2ZzZC5yc3QNCj4+PiBpbmRleCAw
YzA1NjAyMDNjLi4zM2ZlZDA4YzZmIDEwMDY0NA0KPj4+IC0tLSBhL2RvY3MvdG9vbHMvdmlydGlv
ZnNkLnJzdA0KPj4+ICsrKyBiL2RvY3MvdG9vbHMvdmlydGlvZnNkLnJzdA0KPj4+IEBAIC0xMjcs
NyArMTI3LDcgQEAgT3B0aW9ucw0KPj4+ICAgIC4uIG9wdGlvbjo6IC0tdGhyZWFkLXBvb2wtc2l6
ZT1OVU0NCj4+PiAgICANCj4+PiAgICAgIFJlc3RyaWN0IHRoZSBudW1iZXIgb2Ygd29ya2VyIHRo
cmVhZHMgcGVyIHJlcXVlc3QgcXVldWUgdG8gTlVNLiAgVGhlIGRlZmF1bHQNCj4+PiAtICBpcyA2
NC4NCj4+PiArICBpcyAwLg0KPj4+ICAgIA0KPj4+ICAgIC4uIG9wdGlvbjo6IC0tY2FjaGU9bm9u
ZXxhdXRvfGFsd2F5cw0KPj4+ICAgIA0KPj4+IC0tIA0KPj4+IDIuMzEuMQ0KPj4+DQo+Pj4NCj4+
Pg0KPj4+DQotLSANCkJlc3QgUmVnYXJkcy4NCllpZGluZyBMaXUNCg==

