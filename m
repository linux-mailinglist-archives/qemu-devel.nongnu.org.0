Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9566B862C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 00:39:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbrkX-0007Fi-Ft; Mon, 13 Mar 2023 19:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42916f15d=Dmitry.Fomichev@wdc.com>)
 id 1pbrkL-0007D3-8H; Mon, 13 Mar 2023 19:38:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42916f15d=Dmitry.Fomichev@wdc.com>)
 id 1pbrkI-0003R1-OP; Mon, 13 Mar 2023 19:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678750706; x=1710286706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SAQApgUyylIOIt7XJ3g8Lb71f0gUHTAr8aNCdIIHdeE=;
 b=prxa2VX77TBRGgjVs/JnNIdLJl/wN7NGO3GvE7hvkyutXjY+fGNHTSgq
 /ZBamPNx0Ns+1ASZOzNNxL0BSi+5FNwXN1L0kYwRRbrMnn1z2nmEq+m64
 sUKCj9No0WQorul8H5OL812Q8NITgkglT5YkjJtTaytbQ9nQiKG283qHr
 Osp+pACE7dp1n6gN0ZkT7u6jsv32JIcJkI/Enr7Mq5+wXlKsVz/aQlyGO
 nzNwuYywrGrksLcQWQtaQ+b9qddhKH2tG7zU/2EvTn8lrnriXs3zFr0X9
 YY7FQzLZe6tWfbxyn/Dd1AKJZaGXTqb6tAI041Tf/GhudkQJ+2b/Tj8Av A==;
X-IronPort-AV: E=Sophos;i="5.98,258,1673884800"; d="scan'208";a="225332257"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 07:38:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uove4T8U0XT0gOrqP+KH2P5IcIAbWS516HroBckLTLmNwf1mj9TT1RqWREj9sdyTF1IotZmjTbqozTAbXnp3fCGW4xGa0czsl9GULZLhA7o9WhFMeooIFX3/SP3dUn7orEscmxbhecbmhDeiiBgpRqObSnY8OAHum2nWbPDBGHPypYmvQVaPc9uaE3Jr+U5vj0+8QDnPhJHg5R8jhePycUz/sYp4wJXi+7k3ujBaeF4uoKMzmLM3OyZndgzTC+jKiHgh4m3uSMdZ6w4gXXQ2jNyAjpwrvIv1U8wGnhL8B5RyevwuFYoFUj/nZ6A+i3r6S5MIszWkTDw53H216HQZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAQApgUyylIOIt7XJ3g8Lb71f0gUHTAr8aNCdIIHdeE=;
 b=CiYKqPJTN/VkuJC85cb4K04i80KcESjmO+1QaNf0i+3nBI8EMbctULbKHfrxAwvY4JdeI8ro5xLuf3H6xg53mrZT+EZLVy7aZToWqiwCYtfUWY7dm8tIjzjmm3tNPC/vWC6tnIhSGeaLN1eGFcuESNyxgbS04tUQ9WhZQ0bsFG2/7Yzxje9OTL4D5e3TEZFkdz1GdInB6Lg9Vyq4o9MrW/5p/D2Rd10vaJ5z/Td3RuIVxLzclcwVLWngUI29o6ndkGsjDcjwB1xzdVBYuFDTVxfPL/4f0gku54KtZh6qYzUqL/FXl1wvsoUIBY81n6oysaagonsEC5xF7r3AXS4r4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAQApgUyylIOIt7XJ3g8Lb71f0gUHTAr8aNCdIIHdeE=;
 b=pJf1UhONNKyn0tfTchaXAYz+IrfjFdYpZK2MQf7kYgSm+mc304j/2L7nMbr7i1gj+rxL236+YYD5Limh6vb4XQsPy4a+msLcnVzu5GGJTl0pm+QhIcpG+/K6EIrD7sn7/AsP2izy5QEpnvTIxM6DaM4ym/rfANEPnwoDS3DTC4g=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by DM8PR04MB8103.namprd04.prod.outlook.com (2603:10b6:8:2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 23:38:10 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::9171:c66e:ce90:6c24]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::9171:c66e:ce90:6c24%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 23:38:10 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "philmd@linaro.org" <philmd@linaro.org>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>, 
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "damien.lemoal@opensource.wdc.com"
 <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v16 1/8] include: add zoned device structs
Thread-Topic: [PATCH v16 1/8] include: add zoned device structs
Thread-Index: AQHZUzp6RlWvnyiaC0WAbgoJa44TQa75Y0eA
Date: Mon, 13 Mar 2023 23:38:09 +0000
Message-ID: <a35a2229c8453235ce12f71a8e6bf13a90e00c90.camel@wdc.com>
References: <20230310102403.61347-1-faithilikerun@gmail.com>
 <20230310102403.61347-2-faithilikerun@gmail.com>
In-Reply-To: <20230310102403.61347-2-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|DM8PR04MB8103:EE_
x-ms-office365-filtering-correlation-id: 8449bb09-c30a-458c-d305-08db241c0131
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CbTPgsFf2HdFAqd0NSfhphrqfu+o74tO3jnOBSqrqEISmZbzdAdHNVq9AZt9Dv8ZwUcWZriENaipzLT2qnZrzUFRLW4yBqpAVeyn2wtSF7G3EswvrT3QnMYIIl9T/lDQKboxRg1V1wdl2mmJJRZwgPChCrvTBhfQNEL9XKKNHXdgrH3wX31H95GGIx19fTufc2AsLouEsx6XHQdn75DwC2IoALX7y5Xw1iUBkeOaiXDb7pZserP6wHGtnNoB1GjS4HZyX3n/009GwxSnAS1o4/XJTMzf0JAlAXlvFS7JlBjQRXuND6F3ZjTSgfky7QKTQgmw0GzdReGrUOVmA9YIjsGL52jsdtr1LYv4BdtlWFZ1OmMgwkbaHBmsfjhqRcCaKzws5JqphVn0sGXZDoaiBlhtmwCXMVZdSqSz9MC8DHkAJgejkdYJCd+dpy7x85PsztyyO/PqdqrQb8GoGn8d0+5qvCUn5fh5gITuQ8p02xuF+RzwhZ5FFH9NWVyBjMi9ONB0rc3uZ7dBJbO0Jonn9/RVkLrNGbkjOEvbwiaDyJngWv0BJNhBKEMnYd9KFB1Tc/Eag0SXloN/jKNgUfbAZJbSbDkKj1zy3QsMWNaOxoh+zAOhpJljR44Llfb2mbsqPufvY1tsioLsBjHl5M/9UA1GZl9IHszTVhdWvV5B63K5hmBZYNxnlOIefiDlw+CTf6sfwfoegYhCu9qCvD+raQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(82960400001)(71200400001)(2906002)(41300700001)(8676002)(76116006)(66446008)(66476007)(4326008)(64756008)(66556008)(36756003)(316002)(478600001)(86362001)(54906003)(66946007)(110136005)(122000001)(38100700002)(6486002)(38070700005)(5660300002)(26005)(6506007)(6512007)(2616005)(186003)(7416002)(8936002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cklIOEhIUDdtcS8yMzRQVHFOQ09RTytMZjl4WE1Pcmd2dENmK0VFK3dyOFVw?=
 =?utf-8?B?OVB5ZytuMmlOeEFNOU5SRWlZdy9sUzV1d2dzTC9kVFh3RzN0eTE0c0k2SWVj?=
 =?utf-8?B?U0FDUUtmYVB2QUROMVNKOERxOE03UUM4Yy9DbEF2enk5ZCtYRlVIalQzU3Vt?=
 =?utf-8?B?Qys0b1JuTVcwcmE2QzN5ekhySXRWL2ZURkhFVzgyMHRYanRrWUNQOHlqSzNG?=
 =?utf-8?B?aW9IbHptdTQyeVBmRDk0NkdrLzRKdW54Nmx2cjR1N3BGSWp3NkVPZkNLdTlL?=
 =?utf-8?B?T1VxeDM5dnZRSEg3OWh3bGFFM284VlV5cDh4bytYdU9FSDg1aDczTUVuZkh6?=
 =?utf-8?B?TGpib2wxTitMVXpiNi92cE5YNXF0VDdHR3dsNlBuSExvWTg5MVNLTUFHeTRB?=
 =?utf-8?B?QitCOWxsV1o2YWt3cGVXNTArK3hlK09pbFFmQ1E0K0RrK0srUFJlZ0JTcDNU?=
 =?utf-8?B?ai9icjBFM1FtVnlBN2hHMVdINFF0bFFjM0N4bFdzZmg4N0JzTmt6YkR5NDQr?=
 =?utf-8?B?clNZR25uNFRYcEJ5ZVNEMWdjWUZqUkhjZ3RPVEhDU3FBS0QrMm5jMzlqRmtQ?=
 =?utf-8?B?KzZ2cW4ybGhIUGR4SzBld1RrZkYzMmNCQVc2OFlidGN2ZlZUMmhxcmlmQnh4?=
 =?utf-8?B?clJwbWlmdDJjUmVRSWtGNWtlQ2hQTnRqSlVWTElReE9obHUzNzA2UEUvcUU0?=
 =?utf-8?B?Z1BjSUVqb3dWNU50WU9XU2xiWStaODU4c0pRbWdXYXB4SVNLMytDQWhReUpD?=
 =?utf-8?B?MWZ6LzNNZ3c2MDZyQ3RXUTlFSVZGU0ZXcUFIL00wQVFoSFczQnVlOVo1KzJp?=
 =?utf-8?B?cHdaVmZnSzYyTnNJbGVrd20yNFM4TVhaa1o4ZEFjNDByRVlTOTIweEt4NlF2?=
 =?utf-8?B?NjZIdjdsb0tPVnhvOHRJbnpZVlRDQUtkTWRROFV3YXpBLzh2bDladE1Pa2Ni?=
 =?utf-8?B?a092aE1wYkh2Uk1ycllMdzdSb2hEZGdSdkt3TGY1RlVRaFBtV0p4eEFHZmd0?=
 =?utf-8?B?RVdGckprMWprYXdwMmU1Z1FKNXE3VFIwZmVIN1dUdUtUVVdEQ1ltbFFPWmx4?=
 =?utf-8?B?Q0FWd2VRbUNWSDhoMUxhME1tWlNncmc1bkphaVliRGpwZ0xBSG45UUtZU0tU?=
 =?utf-8?B?ZStsK2NBc2pGRm1zZFlPZW1pbzMxc3JsZW5KODAxN3M2eFlCNWUwR1AzYnd6?=
 =?utf-8?B?a3IwY1pkSTNRR1FnbmxCVENSbDJlanU3NHJnQUFqeXl2OUhudTdRWlVHUHNU?=
 =?utf-8?B?allKUDg1Q3BsZ2NvbEVkYTNpMjM3RE03WXYzQlNVVjV3ZmRWVU9HVXRFTlhK?=
 =?utf-8?B?SHZnQUgyNTJRT0xUYUtYWjZsYVBWVE4vMWpnYmZ0clZGK2xTV1J2bks3OVY1?=
 =?utf-8?B?YjNDeVZrWmdoQis3akl1TmhER3dtTWxTS1ZIb3J0VjNGaXlRamIwMTB6eVpU?=
 =?utf-8?B?cVRISnZwTGJubm9Weng5L1hJNWtwNWFxTlJJdWh5NDM2VHR0NjI3MXFLMm9k?=
 =?utf-8?B?WXYwU3huSE5teFUza0xzQ3c2WXAwUW1YejRUSUxXY2xNL2RzOVVCeHpCYVBD?=
 =?utf-8?B?NUF4S1RKMDY1VFhtNVgxaXNJRU1BWDFaVTFLNkFVbTNZSDRGU3NVbTNkZGJT?=
 =?utf-8?B?NnBOV0pPbUJJZG1Wa3dSTmlCdzI3MjlhcXdsMjY0akpOYWIzTnNlZGhTVmhj?=
 =?utf-8?B?SjArR09tTmFNRWV5bEh2R0Fuc1FrREZaZEN6MWN4c3ZpQml0SUx3bTNlNVRE?=
 =?utf-8?B?aWF0dEQrc0cva09zck41VmdwdW44K2VoMmFGU0RJOHE0SGRTa01wV3ZubU1R?=
 =?utf-8?B?L1NBR2FYWjY1ditoR2NFSVF0M3JVNjl4WmJZOVZNa0p3N1lQb1liUVNIdzRm?=
 =?utf-8?B?TEVoTWVvWUhxd1gzdi9WUFhrbkxKc0ZLenV0b1hzWWNhK2s3aEpGYlFRdC9j?=
 =?utf-8?B?blFGQlRrelJqeEVMWlBJVVFlWitaV3V0NHNPZkRuSi9NSmFSbTNlYTc0SFQ4?=
 =?utf-8?B?M3ErRVNPWVR3MmxkR0U1UGRhZFlrTVBjajFqMHI4SkIzdzdCTjhYaE1PVGl4?=
 =?utf-8?B?aW9kbFd5dGFYSnNpYjdOV1N5Uk5tWmJ3Zk03UTRQd3JldlZNODF0VXVGWklX?=
 =?utf-8?B?UDBGQndGamZVREpUeTY1ZDVSVXRMS1RGcW85ODBMMzVxL3BTQzFmNDNDRFBt?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF47353DA8252D499290A4E1C443AA86@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: siHng3QOHmhdteq9O/U/4eFvQADgGgkRyDpFeHv8NTNEI5NUjSp7mtAbTv49HSGsf8eeu4L3TSMwKYtbzyPTbNwX0lp5amvmSTPTNxE+fu3vLmPhqTIDElI6cQKc+ZQ+WlMnqp+sWxlgiRg/4984TucMNgSt7Tznw3G9hH/pzEYsSpjYBk196i092hxrfHB+HuypXQeof4nIbzWtEdV9X0ui8CyYYOP2k4updGwkI3xiGPBWExRpXzSbH2J7TRh+P0gyOwzweCZkPGv7xDpE1/96K9/BTs6btJFM6LO6RrMN68//lD9o+wvu13a2ggT14gQt0AprxvF3FecV7B6Jh1f7ki4wWWLYz6en3djlvipxUQl/UguZDXaHq3CNn1FMxPQUUQoSFIy8MophIvCXGh/Qp9QRuqsO1cBieqjo//Q5oQKu3QIL1RpKmkwTtWouN34MWpAH48bIYajTG7vZJbRhsjMyZ+QZvZW72psKb9A0+ugmA+/1WaaTy7Qhkq/gZhkmi7phprVpus0FCsQSuj1Ys0n1/3vlRY408u/NMyAZBDCtLspkCirV3Cre7VK6OayrjkzPiLpX9OSx7NdobEXB3Rl+kHGgZaBSlLEihwFU564v2R1IGvK7AA33YaIEFVv9PJ2VzoDZzCuuwJ86oFCfQL+D9FOYnIJyq9+NlOGvs63sVOZt3VxcByeZ64v5vkdiW6Ohx1LZOQtNaXXfibEJpo9T2DLMyGPnBwy33DXpzng2BBtix5vIwXELAgx1Tz3Bu+v1KChM255SWgoq1g6UU+YghSXsTfiLlwOW3I0Pac2/wy114TE6JJkgYEgxewdTYlAWbrQEUc9iHGv0zCEkTf+RCHpnIfJQM6juBo89RVuwK60YIQiHghajDreFcg57Wxta6q4xqON3+Bv+dQ==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8449bb09-c30a-458c-d305-08db241c0131
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 23:38:10.0158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nB7IlvaQiJt0qWZi33L/LGLdldP1Goofad9tvpd6QiJj5rny9+Jn5srHwGRiVPgqmZpQpcSI7AytjpPaD/osJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8103
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=42916f15d=Dmitry.Fomichev@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

T24gRnJpLCAyMDIzLTAzLTEwIGF0IDE4OjIzICswODAwLCBTYW0gTGkgd3JvdGU6DQo+IFNpZ25l
ZC1vZmYtYnk6IFNhbSBMaSA8ZmFpdGhpbGlrZXJ1bkBnbWFpbC5jb20+DQo+IFJldmlld2VkLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBE
YW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEBvcGVuc291cmNlLndkYy5jb20+DQo+IFJldmll
d2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4NCg0KTG9va3MgZ29vZCB0byBt
ZS4NCg0KUmV2aWV3ZWQtYnk6IERtaXRyeSBGb21pY2hldiA8ZG1pdHJ5LmZvbWljaGV2QHdkYy5j
b20+DQoNCj4gLS0tDQo+IMKgaW5jbHVkZS9ibG9jay9ibG9jay1jb21tb24uaCB8IDQzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0MyBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ibG9jay9ibG9jay1jb21t
b24uaCBiL2luY2x1ZGUvYmxvY2svYmxvY2stY29tbW9uLmgNCj4gaW5kZXggYjUxMjJlZjhhYi4u
MTU3NmZjZjJlZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9ibG9jay9ibG9jay1jb21tb24uaA0K
PiArKysgYi9pbmNsdWRlL2Jsb2NrL2Jsb2NrLWNvbW1vbi5oDQo+IEBAIC03NSw2ICs3NSw0OSBA
QCB0eXBlZGVmIHN0cnVjdCBCbG9ja0RyaXZlciBCbG9ja0RyaXZlcjsNCj4gwqB0eXBlZGVmIHN0
cnVjdCBCZHJ2Q2hpbGQgQmRydkNoaWxkOw0KPiDCoHR5cGVkZWYgc3RydWN0IEJkcnZDaGlsZENs
YXNzIEJkcnZDaGlsZENsYXNzOw0KPiDCoA0KPiArdHlwZWRlZiBlbnVtIEJsb2NrWm9uZU9wIHsN
Cj4gK8KgwqDCoCBCTEtfWk9fT1BFTiwNCj4gK8KgwqDCoCBCTEtfWk9fQ0xPU0UsDQo+ICvCoMKg
wqAgQkxLX1pPX0ZJTklTSCwNCj4gK8KgwqDCoCBCTEtfWk9fUkVTRVQsDQo+ICt9IEJsb2NrWm9u
ZU9wOw0KPiArDQo+ICt0eXBlZGVmIGVudW0gQmxvY2tab25lTW9kZWwgew0KPiArwqDCoMKgIEJM
S19aX05PTkUgPSAweDAsIC8qIFJlZ3VsYXIgYmxvY2sgZGV2aWNlICovDQo+ICvCoMKgwqAgQkxL
X1pfSE0gPSAweDEsIC8qIEhvc3QtbWFuYWdlZCB6b25lZCBibG9jayBkZXZpY2UgKi8NCj4gK8Kg
wqDCoCBCTEtfWl9IQSA9IDB4MiwgLyogSG9zdC1hd2FyZSB6b25lZCBibG9jayBkZXZpY2UgKi8N
Cj4gK30gQmxvY2tab25lTW9kZWw7DQo+ICsNCj4gK3R5cGVkZWYgZW51bSBCbG9ja1pvbmVTdGF0
ZSB7DQo+ICvCoMKgwqAgQkxLX1pTX05PVF9XUCA9IDB4MCwNCj4gK8KgwqDCoCBCTEtfWlNfRU1Q
VFkgPSAweDEsDQo+ICvCoMKgwqAgQkxLX1pTX0lPUEVOID0gMHgyLA0KPiArwqDCoMKgIEJMS19a
U19FT1BFTiA9IDB4MywNCj4gK8KgwqDCoCBCTEtfWlNfQ0xPU0VEID0gMHg0LA0KPiArwqDCoMKg
IEJMS19aU19SRE9OTFkgPSAweEQsDQo+ICvCoMKgwqAgQkxLX1pTX0ZVTEwgPSAweEUsDQo+ICvC
oMKgwqAgQkxLX1pTX09GRkxJTkUgPSAweEYsDQo+ICt9IEJsb2NrWm9uZVN0YXRlOw0KPiArDQo+
ICt0eXBlZGVmIGVudW0gQmxvY2tab25lVHlwZSB7DQo+ICvCoMKgwqAgQkxLX1pUX0NPTlYgPSAw
eDEsIC8qIENvbnZlbnRpb25hbCByYW5kb20gd3JpdGVzIHN1cHBvcnRlZCAqLw0KPiArwqDCoMKg
IEJMS19aVF9TV1IgPSAweDIsIC8qIFNlcXVlbnRpYWwgd3JpdGVzIHJlcXVpcmVkICovDQo+ICvC
oMKgwqAgQkxLX1pUX1NXUCA9IDB4MywgLyogU2VxdWVudGlhbCB3cml0ZXMgcHJlZmVycmVkICov
DQo+ICt9IEJsb2NrWm9uZVR5cGU7DQo+ICsNCj4gKy8qDQo+ICsgKiBab25lIGRlc2NyaXB0b3Ig
ZGF0YSBzdHJ1Y3R1cmUuDQo+ICsgKiBQcm92aWRlcyBpbmZvcm1hdGlvbiBvbiBhIHpvbmUgd2l0
aCBhbGwgcG9zaXRpb24gYW5kIHNpemUgdmFsdWVzIGluIGJ5dGVzLg0KPiArICovDQo+ICt0eXBl
ZGVmIHN0cnVjdCBCbG9ja1pvbmVEZXNjcmlwdG9yIHsNCj4gK8KgwqDCoCB1aW50NjRfdCBzdGFy
dDsNCj4gK8KgwqDCoCB1aW50NjRfdCBsZW5ndGg7DQo+ICvCoMKgwqAgdWludDY0X3QgY2FwOw0K
PiArwqDCoMKgIHVpbnQ2NF90IHdwOw0KPiArwqDCoMKgIEJsb2NrWm9uZVR5cGUgdHlwZTsNCj4g
K8KgwqDCoCBCbG9ja1pvbmVTdGF0ZSBzdGF0ZTsNCj4gK30gQmxvY2tab25lRGVzY3JpcHRvcjsN
Cj4gKw0KPiDCoHR5cGVkZWYgc3RydWN0IEJsb2NrRHJpdmVySW5mbyB7DQo+IMKgwqDCoMKgIC8q
IGluIGJ5dGVzLCAwIGlmIGlycmVsZXZhbnQgKi8NCj4gwqDCoMKgwqAgaW50IGNsdXN0ZXJfc2l6
ZTsNCg0K

