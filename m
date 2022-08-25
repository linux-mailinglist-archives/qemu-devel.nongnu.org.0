Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BC15A14EB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:57:36 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREIZ-0007ka-Oe
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaitanyak@nvidia.com>)
 id 1oR8rt-00046m-Dx; Thu, 25 Aug 2022 05:09:43 -0400
Received: from mail-dm3nam02on2061e.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::61e]:40672
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaitanyak@nvidia.com>)
 id 1oR8rj-00053J-3j; Thu, 25 Aug 2022 05:09:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKlwdRYH1wfafirt24uKaJ8Qy6i+Y4ugm/4exn9yz5/fb1YAad/1pSKZmcnX3uxsdWPRn8So5VtgZ67K2mCl4G0LDIQFn1TuBu5lZ57PWz2mUeIc2AH6XWidstEiryxzrTogw+5ehdZYY69F5JLTaRNt91R4tRUqEfO+KzoA1rFblwGkx3/qb7Fhvuw8xUhFEFXjOxlMQhaxQXYyw2AZfXmyzAl/0vQ1MFq7bvqa2DoWzsVyG/KwsgYuUCCvRqR4DTds57dXtbS1SfPASpg+iXmxnWpKG9hHzyuHk5BYzebgHBBL31LvU9JqwPGodLBOf8jFQ5ryPow0zF2W69BP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bdYokw5CnqinZ2a/l+veRbSyoeUwq7NEFI+Asc8IC4=;
 b=UJBhaoCrSthMgJ7uVgdZe1AwEntJcIqkrjQ5SZpqbKDn0QcZGJbFCaGh5HoEvE1PhRhqSuITYoUqbrPa4zdfRqdwAgai71fyEIPyXxXiPQJRqIu9nftDQA/hvjDIcy2UvowdlF4IPRrh51XD5TJRc5CimXCtla2+mXhrc/4E3SSEuSKdaxkDErchcwrqPAkr4oomgfdSRtAdkd1Ezn7dcQMDNjVqAQfy39J7lnKLafUwaYrnQVGrci0ofxAYzyybZHZ6DG4O2BxG3Kj+tEOCkgcVQK5GzUKpx5BwTmUTdwzBTW7W3kD4T7x+ZKoa8DRFj0T11mM8pk3qrKHfw/txzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bdYokw5CnqinZ2a/l+veRbSyoeUwq7NEFI+Asc8IC4=;
 b=t5/QD3onSRZZyUymm3uursyBlx1NkP3cAuJJ8BCNdCDjDO0pcy5bFRQWUfKNtuBPT3l05QHXRLu6hOkOith7v9zSl68qEaDNJcZJ+QTRAduCQNT8byByMdwdTHZBktSNQ7LQvBLs77DXVlcJWj+kywPbVetr+vFthp5FcAXQdpc035xnZri3ZVCT9OPL9nQWDrCL95L3dtNAvmz8ISoNv8o9rv1/pH/0dYSKr0r2vmmblRArXk0mBkfY3UCooHSxPrHFW0qQ6M+BsuMHUbRA4nql1SXvHwyuH44Adpo2csjaBK+YPmzVtAR1IydFWVaWlBy0NODKKrPgW/13xD70Qw==
Received: from BL0PR12MB4659.namprd12.prod.outlook.com (2603:10b6:207:1d::33)
 by BYAPR12MB2677.namprd12.prod.outlook.com (2603:10b6:a03:69::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Thu, 25 Aug
 2022 09:04:23 +0000
Received: from BL0PR12MB4659.namprd12.prod.outlook.com
 ([fe80::e033:3f08:d8d6:1882]) by BL0PR12MB4659.namprd12.prod.outlook.com
 ([fe80::e033:3f08:d8d6:1882%7]) with mapi id 15.20.5525.019; Thu, 25 Aug 2022
 09:04:23 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "fam@euphon.net" <fam@euphon.net>, Martin Oliveira
 <Martin.Oliveira@eideticom.com>, "f4bug@amsat.org" <f4bug@amsat.org>, Stephen
 Bates <stephen@eideticom.com>, Alex Williamson <alex.williamson@redhat.com>
Subject: Re: EBUSY when using NVMe Block Driver with multiple devices in the
 same IOMMU group
Thread-Topic: EBUSY when using NVMe Block Driver with multiple devices in the
 same IOMMU group
Thread-Index: AQHYtz2bvx1iEuwnEE2WORQNbfNNOa2+TLaAgAEIJYA=
Date: Thu, 25 Aug 2022 09:04:23 +0000
Message-ID: <694c521e-c963-c037-5a38-4ec74267df46@nvidia.com>
References: <DM6PR19MB4248C040D8E12FAF3CD9D615E4709@DM6PR19MB4248.namprd19.prod.outlook.com>
 <YwZdg/nExYoDNRR/@fedora>
In-Reply-To: <YwZdg/nExYoDNRR/@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa5a32b9-2f69-481b-496d-08da8678cdf2
x-ms-traffictypediagnostic: BYAPR12MB2677:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DE8nrygt3Y+GmrjV1czxD3gsw93iqhMdM2LA5oJUIgIIZWp3iozoUcN+MADhT3JwvRi93GZ1xP2IxnSJ+3ObVFjQNJrPj4gEOhzVh1c2thMKafPRY9dpDzfOkZms//zJEAaN2JeDiwAPT2CvHfBlwd5KfvmfttUVNfmrRtPx38Pzpt8mkaQfuhQe2W4e2GsJRLJaEL+b//jRYkbrRh4fnkI0OF33hHakRAb0PhxC0cOTN/8H34kqaSIf+ucWFWQL4j9oBC3zg5zQqhuZLYY8SYvEyQjo68ceiI7wsascvOeUpBzAih1f6Das6Latdu4Na3DdKwudhMpzJWqbroxWOR1G9+bis9+lJRiA3yPj5iioS1MviuUtaMsi4hzsaBJf6ckDkp+0ERd1jweohUIZbGA62khjjLi+4hB92hEC3EmubXkp1X6KcMtDl7FhB0+yTz5k1g+ada4lRNYmPKQyQUgRfrbvqHgAtVtV39IlavajKaJJLBL0XMwJbYrtLWHoiphXi/v/erjRCCnBlwGPHQhK+c43NQEbj5XhD4Xbsh0hh5UjoqqptFxWjQzGUblNXkZzFdYoreStmDphuvkfX8q16xOnjG7ggy6FGbxvmBLyJaK3gHkVmzeeCwMY8FBDKPwylq1vQJWePHZ0/M8Dgq6kgy5+qhmgQGXGEtKfRrLTVQtyQWJ4taoz27KHa9HBB86+S9xDPKYJDnL/TfPsL4+WP2S1D3qYzc5UhCL013jgu4Ark8nS3Y9k3LTKldFv10DN6bFZIoZM34UVx/Cn7fBxkKcXdiNAP7ZqLn4gAUhDCrW6M4rQhkym9Ddn/HCSvtCvATOKcIyiNOkPShkYTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(41300700001)(316002)(478600001)(71200400001)(186003)(83380400001)(6486002)(2906002)(5660300002)(4744005)(8936002)(2616005)(66556008)(54906003)(66446008)(6916009)(66476007)(4326008)(64756008)(6512007)(8676002)(6506007)(66946007)(91956017)(122000001)(38100700002)(31696002)(31686004)(86362001)(38070700005)(36756003)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGc0Y243dUxYL1ZKdmNJUXQvRk1Ra2h2UEI4SGo5VlN2K0hKQ3E1TXdUNkJR?=
 =?utf-8?B?TTNCM2JQQTRXUDdMbERCTXI0UVc4eW83RGdjUlYwMGVJOXFRWWhqSXRDTUVX?=
 =?utf-8?B?S2xPbkxCVmtYREZGT0taKzhKY2NhN3Q2R0pxbTRiTVA1VEN6aEZ5TG9GcnZT?=
 =?utf-8?B?WU1jeW5OdmFHYkdDNis5V2JWVWZ4YUpEYkdycWV5TDQzaStJU3ZlVWNVUGwx?=
 =?utf-8?B?cVhjdXJnN0w4UDliZnQ1MDZNZUlzUkxZUUZsQTBpY1VRcjYwSjd1VkY2OWVl?=
 =?utf-8?B?THpaS2ZaRnNzZDJkUHRBeFpRenRzc2thYnhHWnkrWklITGZpV1RIT1diRmVF?=
 =?utf-8?B?M0NmNEY0VjEyeDJRVjc4RUZleUxyaFMvbE9aUG0xbllOZS9aVk4wWDBSeVpP?=
 =?utf-8?B?Yy9aeFF0ZjJOZVo1ejFvUnpvRERnd0YxWkhTWDdDQUNsdDZFSmdmZ1Nud3ZZ?=
 =?utf-8?B?TVZPeVpPTFltSzk3R0QyMXplclZDeHBjMEtsbGpQSGRacllpNlRwMVIzbUNT?=
 =?utf-8?B?djM3cTd1WkRJY0VQaUwwS0J2VmFFMW5lK290T0ZQWExlL1BNOTROckh3eU42?=
 =?utf-8?B?eXc4Witmbk8rOEZnNVEyMEtlbGVMb292TVBLZUJtNllHTXFzeXNRNXBJQ3Nq?=
 =?utf-8?B?K0dGc0ptaFFUV2VkU3lWeXAyeUpzV2NtOE5MaXhic04zdTlUK1NkR2svVUZN?=
 =?utf-8?B?Z3FVaC9lLzd5UUZpUjRpVlZHTVJqQllyVVV5NnU3TU5xM1N1UjF0a0NqN1Q2?=
 =?utf-8?B?akRYYjhTUzB0QzdSdmowL3dwNGM0VDJmVkkrZVRBVW5sclhGN1c2cmUxSXla?=
 =?utf-8?B?UktLa3FWU0pFZDIzYkg4dGpjMlAzN243c2NUVTNMcEFHdS9HN0g2V0kyZzcr?=
 =?utf-8?B?dDZQUEVOdUJFSkdacHliZExxWEkvaTZIWTkwcnVVTzhhaUk3bHpSeFpUREN1?=
 =?utf-8?B?WFQ5Qjl2U2ZSWGpvejNxSnhCVEFQWDlMUmZZUHlUZGdIdFRDSzhPOGZIQUhO?=
 =?utf-8?B?YUxkK05xMDFCelI4RW9tQURCN29VbTVkb2xZOHNiTjFmREpxNURleUI5dGw4?=
 =?utf-8?B?eWNqMkRVVGpaSGpzSUNPK1hiSGtyVDZXYWZjbWNqRTY0eG9Ed0YxWkkzSUQz?=
 =?utf-8?B?bTZVd1NZc2c5N2dPaUQxa3RqcHgraDZPeTJ2WHpTR0tscHIwVXIxWno2c245?=
 =?utf-8?B?TE4wWWszNHYrQ0k3U1cwSFRaQmt1REZwRm1PWjQ5Yk80eFp5RjNadHlqQ3hD?=
 =?utf-8?B?MjU1dFptVi80a3d5aHN6azYxMXFWM201YTArOHdOY0g0enBMNlZnTXRFV1Vl?=
 =?utf-8?B?b1N1alJ4VGtQbklIaGczYmtsSUNLMDJnRURnMTNOcmVuTTZxbHE0SHBsbFhx?=
 =?utf-8?B?Q1pxazFtckJaaVU5Y0JibmZqTjBncmlLQU9veDFxTSt0UlIwK3NOczBGV1Vt?=
 =?utf-8?B?cmJDbUZ3Snh6Y1ZhN3drYXpXOVp4bzZlYkpHK3RYL0g4d3JBWE9kZTRpSlpP?=
 =?utf-8?B?cHAvMFc1Q3Ixbys3OWtxbitsKzBSV1ppYWEzOTFGbDEyblVYaER1SnFkMmZx?=
 =?utf-8?B?cGxxZmhpaDA1ZzY4WXg2SU5EUTBwVjFJeWlCWGRBSzA2WW9xaEJsQWppMXkz?=
 =?utf-8?B?b3BUWlh5K2tWUk5PM1p5TXZkMm9SNjJvWkg5dGNaOXN2ZTZnVzlwL3VoTEhN?=
 =?utf-8?B?am9WWVZhMWlCMTZSQVpTSzdpaEdyUkFvVEd1MzVhcnZ6VnVIK256azRSQVhE?=
 =?utf-8?B?QVo1M2lVczF0Wmp3aWJVb1FjWGozNk9STHF0NkV3WnlzczJQUVp4czhlSi9V?=
 =?utf-8?B?NWlWdndQR00yOGdRbXk3MGpvUmlIc1lJNkp6UjBNcmpiQnE4NTRHVVJHbHla?=
 =?utf-8?B?UFhZY1NrSlpIQ2dLN21KRGQzY0pyRVEzRkxmTlFKWkZvZWFrd0VoMFJTc1po?=
 =?utf-8?B?bVpxNEVmSENyT1RIQ3hOSVlMMUNCUWRsQkxaTUxIeDdEdU9NaTZVS0NGRWZ5?=
 =?utf-8?B?c2VZd0hiR29RRUhtVmJTWGdldXp1R290czFIQnNJalV4dlNCN25UWWFGZ2Z5?=
 =?utf-8?B?R1JjQ0VpdUhHMmZqcXpUdnNmdGFpY3h0Q3VMWFRSQzRzUDBpSE03bFhtQnhw?=
 =?utf-8?B?RitvOEd0MFRlWitLTGNGL01rRnBkZzdGVm04NkFRSEI5TEZmdkdjMnVsNWda?=
 =?utf-8?Q?5ylKjbIdwKZRDlF/bmPfeoG3EBxCKLS9tggKsN784diA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7132D07B46C9434C80358E28A926A4BA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5a32b9-2f69-481b-496d-08da8678cdf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 09:04:23.5439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zofnRVjgD2bZsGTMje00nexnNS2dW1DpVEHrFBgUG4RHtyQGuCu/UkhmnixDu1LNkQtiL0dNr7xt9mn6aMNV8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2677
Received-SPF: softfail client-ip=2a01:111:f400:7e83::61e;
 envelope-from=chaitanyak@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Aug 2022 10:38:29 -0400
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

DQo+IEZpcnN0LCBtdWx0aXBsZSBRRU1VIGluc3RhbmNlcyBjYW5ub3QgYWNjZXNzIG52bWU6Ly8g
ZGV2aWNlcyBzaGFyaW5nIHRoZQ0KPiBzYW1lIElPTU1VIGdyb3VwLiBJIGRvbid0IHRoaW5rIHRo
aXMgd2lsbCBldmVyIGJlIHBvc3NpYmxlIGJlY2F1c2UgaXQNCj4gb3BlbnMgYSBiYWNrZG9vciBh
cm91bmQgcHJvY2VzcyBtZW1vcnkgaXNvbGF0aW9uLg0KPiANCj4gSG93ZXZlciwgYSBzaW5nbGUg
UUVNVSAob3IgcWVtdS1zdG9yYWdlLWRhZW1vbikgaW5zdGFuY2Ugc2hvdWxkIGJlIGFibGUNCj4g
dG8gYWNjZXNzIG11bHRpcGxlIG52bWU6Ly8gZGV2aWNlcyBpbiB0aGUgc2FtZSBJT01NVSBncm91
cC4NCj4gVW5mb3J0dW5hdGVseSB0aGUgY29kZSBjdXJyZW50bHkgZG9lc24ndCBzdXBwb3J0IHRo
YXQuDQo+IHV0aWwvdmZpby1oZWxwZXJzLmM6cWVtdV92ZmlvX2luaXRfcGNpKCkgaGFzIG5vIGxv
Z2ljIGZvciBzaGFyaW5nDQo+IGdyb3Vwcy9jb250YWluZXJzLiBPcGVuaW5nIHRoZSBncm91cCBm
YWlscyB3aXRoIEVCVVNZIGJlY2F1c2UgdGhlIGtlcm5lbA0KPiBvbmx5IGFsbG93cyB0aGUgZmls
ZSB0byBiZSBvcGVuZWQgb25jZSBhdCBhbnkgZ2l2ZW4gdGltZS4NCj4gDQo+IEl0J3MgcG9zc2li
bGUgdG8gZXh0ZW5kIHRoZSB1dGlsL3ZmaW8taGVscGVycy5jIGNvZGUgdG8gcmV1c2UgVkZJTw0K
PiBncm91cHMgKGFuZCBzaGFyZSBWRklPIGNvbnRhaW5lcnMpLCBidXQgSSdtIG5vdCBhd2FyZSBv
ZiBhbnlvbmUgd2hvIGlzDQo+IGN1cnJlbnRseSB3b3JraW5nIG9uIHRoYXQuDQo+IA0KPiBTdGVm
YW4NCg0KVGhhbmtzIGEgbG90IGZvciBkZXRhaWxlZCBleHBsYW5hdGlvbiwgaXQgaXMgcmVhbGx5
IGhlbHBmdWwuDQoNCi1jaw0KDQoNCg==

