Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6828B4426FF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 07:10:02 +0100 (CET)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhmzh-00023S-J9
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 02:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhmyV-0001CC-Gd; Tue, 02 Nov 2021 02:08:47 -0400
Received: from mail-bn8nam12on2073.outbound.protection.outlook.com
 ([40.107.237.73]:31904 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhmyR-0006FQ-Rc; Tue, 02 Nov 2021 02:08:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJZbGgnPNSyQ616mjlLwnVUC0ELd9XC7jeiAhjEVpKb3Annuwi9P1AxO1frXLb9/+dtjNULurCtPZFhxIaPcClS3H19O7I9XmZw/cM7W8Lx7ageEae4e/ld7RnbN6gGaNrE3gypDwyQiDIHE775VItm56X9jlZtw0JDOQvJm7v64sLVRZVlgNAQ1iNkWnlXnPpf+spKORzJLyOSHnl+CoE+iOHyxviPTD6eAQYpn5iNf9qDEFF4p+OjxCKfV7k6NhqkY28rabWTnfYKBdx+RK9ImPBzU6ihjcz0SR4O06JQPkbQbPIRankLGvulOL/RhD83DtZNYNYuAQ11qhNzBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2Y++ni1i9tqtCTEXFEh6II1yvEEcfoAWQeQ5jUYKt8=;
 b=lfClFFtEh73ZTs9sUhA+Z73SUO1P/VaP6yq9vTHe6TfA2gHMFjWhUwI8t+R1JihOFzIqnlR4ZLZ5qXxI6qG85FjKPa5St2lSYxOpt0siWcogwR1uzdHNZ4riJVcP4JV39MDhDz9EhrxLoiSbvKnxAHRyR34b8nauEZA07J355QiDqs7YxCXUHeqJoJRP35N7TvFuG6CdLfX2xvGQe7qzV1I4Q0T4IAaec7V6Zxc6ZScVhLUqeOwN53Msc9Dbnvb2mS3RC0kWy3oviFusH3N7tlZZmLFxgDn+1HaFi/glWqPEqU5uEVXEunjk0CPgEBSE7NMgaghfHhItS1PNl7jQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2Y++ni1i9tqtCTEXFEh6II1yvEEcfoAWQeQ5jUYKt8=;
 b=iL1KxtQlJvfgMgU0tz/oPpx0cZJZtfPy7IAWmf37Qi4crLXmMu5MNYV+QUUhxnFcEYWPRY8U1gQbHuF7qebfgNiucqDwACJAaQ+/dDc8dlsnXZ+DdZtw6Ry+Rspn1B/yETTKOFNOp0KIEFRfckKUeSw8gaYn9C9AV0nnR382uJy6OExYvf9YZsHMSrPpd4spPdbq5uJ/3KD09bkXpIPZHyYosBPhOwR1RAOxKXrRyIAf+zqxuQ0XGJf18VObmpRelCjJdNZ+O0OfCFpEKFUessGb4GF+sP/wEbTtEuA47ojvN8Z/AhP3XjSVcrTnpeUqYlImt4hgmWMwNJEkU2Qy8g==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 06:08:39 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 06:08:39 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Topic: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Index: AQHXzvvqdEwO0IQ5t0iKSU5G4bcqHKvvKsUAgACXagA=
Date: Tue, 2 Nov 2021 06:08:39 +0000
Message-ID: <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
 <20211101170506-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211101170506-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d4b4f24-1d4f-4a61-2ba0-08d99dc73724
x-ms-traffictypediagnostic: DM4PR12MB5296:
x-microsoft-antispam-prvs: <DM4PR12MB52967C1A59A0D60D2D83DBC0A18B9@DM4PR12MB5296.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:238;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: od5JhLy24ealAU8/B7ghWp+xyFuzDrQ+ZGosedrgNCQ7zm4k5TIBRzHSe8hbAjREY8HZF2cuvsBhT3fO216slD0SBSKtM8f/hEV358TSQfCqgYRaAWf0ktsVsCu4hnsdf1o+hkWH6QoYOCj+dtBQSh4sUdf88pKuO16+BhUkKvqsbvkD7m9YUGVb1CFC82s4yQKBOWfffh4xAjluZqwi0WdCpVJSu0Co/WloCgXcE5ZZoIhAyWU1wyoblDtr9DQQ2xGpYBI6W/FByq0gQZJKRdCzRU6uEUfgALn29BzsxK1qlc5mDYvZwAb+LTr6hi9qVwkyZhBWqgdhtTkE448KtykWyqusnIDTHqbnDmLvqYlpPI+l3601aH1Drq32dHqGnmOp+pNjQGnC/dF9fUlT4IvL0S+dVd+FQQgR4MI7tSJ7hFaiwKarKYmXVTBiNDvAu4JmYyYhN5aS6CsRkqfKec6sR6FZ4eiaReDWTbf/qk/ZjRedyW56ZmQ5iQ5looM0kwVakR6DW7Z5H3R/AGH+nFwrSrcka/w51hF+9ZX5ZeFgzv3AFuS1hOpxm4PAWEyrlJbNglujsMX3s8Lnzoi2TrMrWoWlq/a57S6wuCpWeOkV3OD3ghnmKqX5/NJ+L62aHphscud89quBqkWiXT+uOV0lNEHqw4wVnxQYxznW1pg7DYifGrPZbZGTbLgS0AqQRhJx4sb7YuIKDMLkEpfRHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(2906002)(71200400001)(64756008)(36756003)(66556008)(91956017)(38100700002)(186003)(26005)(76116006)(508600001)(8676002)(38070700005)(6916009)(122000001)(5660300002)(66446008)(86362001)(8936002)(4326008)(6506007)(6512007)(83380400001)(316002)(6486002)(2616005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHhxTjNJTHo2NVRvMXdsOG1TKzVROWs0WUNGNlI0WU5sMzdTQ2V1aVVYM2pT?=
 =?utf-8?B?ZDB0ZnloMEczS0RXQ0Z2blluOEtOdzN3NE5DTlJuZXdJSDBxMENZak96TWZB?=
 =?utf-8?B?NXhqN3A1c2V1V2hGNTlEYkNVZ21kQmIvc3M1S2tsOEZHb3pmZDVkeHVWVWh3?=
 =?utf-8?B?SGx6NUxNR0x2RFhCZlc5U3ZuekxPa2xBTDlxeEducHF1YS9WUUJ1TFhZbURk?=
 =?utf-8?B?Tjk2cGRLSUVGZFJ5TTlWWUVXWjV1ZW5KOTdPSTRhZ1ZQSUdoSjdtWXNUVUtS?=
 =?utf-8?B?TFR4NDFNR05zRE1panhiOVBMdHJWQlhvRmg5YXpxRjV1Vkxhdm5la092b1FE?=
 =?utf-8?B?TTZRZUtxemNwR3lGT2ptUVRqVGtiaS9TM1FWNU55bStPSlBWMHg2USs4SFE2?=
 =?utf-8?B?NVcrRGV1aG1mRXhxZ0d4eHNqMkZmamFYTHZKd2N3dXNoZEhET29YT1YyQUR0?=
 =?utf-8?B?Qi9ET1Rvakg0a2EvKytOdVoxV2RvVStEdyt3UVk4SDY1MDN0VVhrV2Rwais3?=
 =?utf-8?B?WitMS1FEc3hkelRic2FnY3cwanJVTzR4b1g4R2lJOGhwNlhFbVFZWnp3Y2JI?=
 =?utf-8?B?VkFBOE9SN29CMFNGLzV4T29iVnBkWkF1MzcxY2hlV3I2L09lSC9PQmRkL3NQ?=
 =?utf-8?B?bkVqanNRWTZCUW1wMDhEUjlxVXlLUk4zL1ZWWkk4SEV2ZlprOE1jSzlLaEhD?=
 =?utf-8?B?TUp4R3RFaXY0Tjh3Sm1ZL1pleXB6N0tTaVRFZStSTTFJUjJqdWFTT2tqQzc5?=
 =?utf-8?B?cmdtYXlXb090RUdwRGsxVEFYc1AvQ0FORUJhU0R0V2IyZVZLMndMS2p4enQx?=
 =?utf-8?B?MnViQVExVytJQkJ0UkhZM3Vja2pJUVpCVFEveE10ZWhiUDd6dDg1R0JxSEp5?=
 =?utf-8?B?V2pBd2JWREEvdk1RYnB3NU9senBKandqdGRmNjVwS2JuWWVxcHJFSElTVU1M?=
 =?utf-8?B?QUREYlVNRkE2WFUwYnpvTmR0K3IzRGlyS0hLS3hlNkVTRHVYZVR2ZDE2emdI?=
 =?utf-8?B?VDNxV0xhKzljZWIyc1ZGb1M3akREU3A5TmJ5SDFWWHY5a3lTS1BpZGpMazVv?=
 =?utf-8?B?Z3huN2pqV2l6L1FOTFBwRnc2M1lHaXpZOTAzVHl4SkxQZ2UyL3c2VU5HYkxu?=
 =?utf-8?B?VkkvbUt1UGRvc2VDUkxQandwNjc2MDBNbWxvL2xEL3lFOFdyNjBSUnN0K3k2?=
 =?utf-8?B?NEg3cFUrc2dPVDVYdmRPd2lUSGtYMVZCa0U2MFFCMnh2TFFvd2FzbnVCaHM4?=
 =?utf-8?B?MXA1SEtSV2tDMGJBSEtRekN1Q2tWNXRXY1VKMXl2RE5VTDBBVjhjWkJObkhJ?=
 =?utf-8?B?WkRnNHNpVW9HM085SGZaTnU3OFFxRHkxMi9YR1BnUWE3VXNVRGhGSWtnWkxv?=
 =?utf-8?B?ZUxaMnNBcTZ1ZHBHV2tGZzVvZll5MWU5MmtOTUtCbHRVRWtlWHcwNmt4ZDU3?=
 =?utf-8?B?ankwZUFtTTBmM0MwL0NJMHBpUmxTTVBjeXIvY2ZibDU1M3YzMVNjZkUweVp0?=
 =?utf-8?B?cDJqUUlzOG5xeCt0d0JQQXJ0d3pkTTZHV3V4SlBteWpmRmpOa1E3SUozN2tn?=
 =?utf-8?B?Z1gyN2p6alBiRk1SQk13ZHAzOWR4SjMwWkQ3dHBCanN0ZUZaNXY4T3lobnU4?=
 =?utf-8?B?dnpWWXhLaW5xV3grN2EvUGhUenYxNjJKK3hzZXNqK2JwZm8yN2hKWnNDUlEr?=
 =?utf-8?B?VEgyYVdFTmZ1YlFxL0xQc0tkc3pGdzQ2NWkvaFBJZ3I3UnRSSHBiVTM5dzhQ?=
 =?utf-8?B?TCtxamNUVUNrNWVmL0ZwcG1MOFJzTm9YQ3BhMjRyeHFDdU1wOGQzc1JsR3N1?=
 =?utf-8?B?czhzdXF0amlLazFkaWpMWUdLWDFWVmpBNzQ4L0g2R1Z1RmRxRjBDdmh5L3lR?=
 =?utf-8?B?cnJ0ZHRwc3lWSzZaUnpOWUtoTDBQT1RHeWhaMTNPRUR2bUw3blV2UHRYZ3lY?=
 =?utf-8?B?U3JIai9XclM1UWZpSDlZYm43UXF0VEwxd2s1WHM1UDcxN1phV1NRSHgxdy8z?=
 =?utf-8?B?cEJ3UlZaV3dnYi9jbkxISThxclg5TWFRdWZGRW9UWWJKNUM3dVNTZkI4Nlh0?=
 =?utf-8?B?YmMzS0puaVpuTFAyTFpScHliYy92RmhwemlrNCtmdmRCZTdSakdyMTQ4Q1Vh?=
 =?utf-8?B?Y3J6VlliNFJsb0U4cUZIV1lTcExXN3lWV29FSXFRY0lOT0FmQm5maW5reTRM?=
 =?utf-8?Q?ygcsQsmfjbWpItfx6w4NKkmUyYZUh/d8SutH6G61jQmm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <355269FBCC88A741AA6FCC27E332706B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4b4f24-1d4f-4a61-2ba0-08d99dc73724
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 06:08:39.7969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Fy/BJQ7p386c3wo1ZzoHyF22IQAVd/wvnVtLHPLCAXZHUeFXBlavHj2bLqII0/tBBpJ5QopZVpw1HiwG8xOFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5296
Received-SPF: softfail client-ip=40.107.237.73;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

T24gTW9uLCAyMDIxLTExLTAxIGF0IDE3OjA2IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIE1vbiwgTm92IDAxLCAyMDIxIGF0IDA0OjM4OjEyUE0gKzA4MDAsIFh1ZW1pbmcg
TGkgd3JvdGU6DQo+ID4gV2hlbiB2aG9zdC11c2VyIHZkcGEgY2xpZW50IHN1c3BlbmQsIGJhY2tl
bmQgbWF5IGNsb3NlIGFsbCByZXNvdXJjZXMsDQo+ID4gVlEgbm90aWZpZXIgbW1hcCBhZGRyZXNz
IGJlY29tZSBpbnZhbGlkLCByZXN0b3JlIE1SIHdoaWNoIGNvbnRhaW5zDQo+ID4gdGhlIGludmFs
aWQgYWRkcmVzcyBpcyB3cm9uZy4gdmRwYSBjbGllbnQgd2lsbCBzZXQgVlEgbm90aWZpZXIgYWZ0
ZXINCj4gPiByZWNvbm5lY3QuDQo+ID4gDQo+ID4gVGhpcyBwYXRjaCByZW1vdmVzIFZRIG5vdGlm
aWVyIHJlc3RvcmUgYW5kIHJlbGF0ZWQgZmxhZ3MgdG8gYXZvaWQgcmV1c2luZw0KPiA+IGludmFs
aWQgYWRkcmVzcy4NCj4gPiANCj4gPiBGaXhlczogNDQ4NjY1MjFiZDZlICgidmhvc3QtdXNlcjog
c3VwcG9ydCByZWdpc3RlcmluZyBleHRlcm5hbCBob3N0IG5vdGlmaWVycyIpDQo+ID4gQ2M6IHFl
bXUtc3RhYmxlQG5vbmdudS5vcmcNCj4gPiBDYzogWXV3ZWkgWmhhbmcgPHpoYW5neXV3ZWkuOTE0
OUBieXRlZGFuY2UuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1ZW1pbmcgTGkgPHh1ZW1pbmds
QG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4gIGh3L3ZpcnRpby92aG9zdC11c2VyLmMgICAgICAg
ICB8IDE5ICstLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgaW5jbHVkZS9ody92aXJ0aW8vdmhvc3Qt
dXNlci5oIHwgIDEgLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxOSBk
ZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zob3N0LXVzZXIu
YyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiBpbmRleCBiZjZlNTAyMjNjLi5jNjcxNzE5
ZTliIDEwMDY0NA0KPiA+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiArKysgYi9o
dy92aXJ0aW8vdmhvc3QtdXNlci5jDQo+ID4gQEAgLTExNDMsMTkgKzExNDMsNiBAQCBzdGF0aWMg
aW50IHZob3N0X3VzZXJfc2V0X3ZyaW5nX251bShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4g
ICAgICByZXR1cm4gdmhvc3Rfc2V0X3ZyaW5nKGRldiwgVkhPU1RfVVNFUl9TRVRfVlJJTkdfTlVN
LCByaW5nKTsNCj4gPiAgfQ0KPiA+ICANCj4gPiAtc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0
X25vdGlmaWVyX3Jlc3RvcmUoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcXVldWVfaWR4KQ0KPiA+IC17
DQo+ID4gLSAgICBzdHJ1Y3Qgdmhvc3RfdXNlciAqdSA9IGRldi0+b3BhcXVlOw0KPiA+IC0gICAg
Vmhvc3RVc2VySG9zdE5vdGlmaWVyICpuID0gJnUtPnVzZXItPm5vdGlmaWVyW3F1ZXVlX2lkeF07
DQo+ID4gLSAgICBWaXJ0SU9EZXZpY2UgKnZkZXYgPSBkZXYtPnZkZXY7DQo+ID4gLQ0KPiA+IC0g
ICAgaWYgKG4tPmFkZHIgJiYgIW4tPnNldCkgew0KPiA+IC0gICAgICAgIHZpcnRpb19xdWV1ZV9z
ZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgdHJ1ZSk7DQo+ID4g
LSAgICAgICAgbi0+c2V0ID0gdHJ1ZTsNCj4gPiAtICAgIH0NCj4gPiAtfQ0KPiA+IC0NCj4gPiAg
c3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShzdHJ1Y3Qgdmhvc3Rf
ZGV2ICpkZXYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IHF1ZXVlX2lkeCkNCj4gPiAgew0KPiA+IEBAIC0xMTYzLDE3ICsxMTUwLDE0IEBAIHN0
YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUoc3RydWN0IHZob3N0X2Rl
diAqZGV2LA0KPiA+ICAgICAgVmhvc3RVc2VySG9zdE5vdGlmaWVyICpuID0gJnUtPnVzZXItPm5v
dGlmaWVyW3F1ZXVlX2lkeF07DQo+ID4gICAgICBWaXJ0SU9EZXZpY2UgKnZkZXYgPSBkZXYtPnZk
ZXY7DQo+ID4gIA0KPiA+IC0gICAgaWYgKG4tPmFkZHIgJiYgbi0+c2V0KSB7DQo+ID4gKyAgICBp
ZiAobi0+YWRkcikgew0KPiA+ICAgICAgICAgIHZpcnRpb19xdWV1ZV9zZXRfaG9zdF9ub3RpZmll
cl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFsc2UpOw0KPiA+IC0gICAgICAgIG4tPnNl
dCA9IGZhbHNlOw0KPiA+ICAgICAgfQ0KPiA+ICB9DQo+ID4gDQo+IA0KPiBTbyBvbiB2cSBzdG9w
IHdlIHN0aWxsIHJlbW92ZSB0aGUgbm90aWZpZXIuLi4NCj4gICANCj4gPiAgc3RhdGljIGludCB2
aG9zdF91c2VyX3NldF92cmluZ19iYXNlKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aG9zdF92cmluZ19zdGF0
ZSAqcmluZykNCj4gPiAgew0KPiA+IC0gICAgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3Jlc3Rv
cmUoZGV2LCByaW5nLT5pbmRleCk7DQo+ID4gLQ0KPiA+ICAgICAgcmV0dXJuIHZob3N0X3NldF92
cmluZyhkZXYsIFZIT1NUX1VTRVJfU0VUX1ZSSU5HX0JBU0UsIHJpbmcpOw0KPiA+ICB9DQo+ID4g
IA0KPiANCj4gYnV0IG9uIHZxIHN0YXJ0IHdlIGRvIG5vdCByZWluc3RhdGUgaXQ/IERvZXMgdGhp
cyBub3QgbWVhbiB0aGF0DQo+IG5vdGlmaWVycyB3b24ndCB3b3JrIGFmdGVyIHN0b3AgdGhlbiBz
dGFydD8NCg0KDQpZZXMsIGJhY2tlbmQgaW5pdGlhbGx5IHdvcmsgdy9vIGhvc3Qgbm90aWZpZXIs
IHJlcXVlc3QgVk0gZHJpdmVyIHRvDQppbnN0YWxsIG5vdGlmaWVyIGlmIG5lZWRlZCAtIGNhbGwg
dGhpcyBmdW5jdGlvbiB0aHJvdWdoIHNsYXZlIHNvY2tldC4NCg0KPiANCj4gDQo+ID4gQEAgLTE1
MzgsNyArMTUyMiw2IEBAIHN0YXRpYyBpbnQgdmhvc3RfdXNlcl9zbGF2ZV9oYW5kbGVfdnJpbmdf
aG9zdF9ub3RpZmllcihzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gICAgICB9DQo+ID4gIA0K
PiA+ICAgICAgbi0+YWRkciA9IGFkZHI7DQo+ID4gLSAgICBuLT5zZXQgPSB0cnVlOw0KPiA+ICAN
Cj4gPiAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcv
dmlydGlvL3Zob3N0LXVzZXIuaCBiL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIuaA0KPiA+
IGluZGV4IGE5YWJjYTMyODguLmY2MDEyYjIwNzggMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9o
dy92aXJ0aW8vdmhvc3QtdXNlci5oDQo+ID4gKysrIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3Qt
dXNlci5oDQo+ID4gQEAgLTE0LDcgKzE0LDYgQEANCj4gPiAgdHlwZWRlZiBzdHJ1Y3QgVmhvc3RV
c2VySG9zdE5vdGlmaWVyIHsNCj4gPiAgICAgIE1lbW9yeVJlZ2lvbiBtcjsNCj4gPiAgICAgIHZv
aWQgKmFkZHI7DQo+ID4gLSAgICBib29sIHNldDsNCj4gPiAgfSBWaG9zdFVzZXJIb3N0Tm90aWZp
ZXI7DQo+ID4gIA0KPiA+ICB0eXBlZGVmIHN0cnVjdCBWaG9zdFVzZXJTdGF0ZSB7DQo+ID4gLS0g
DQo+ID4gMi4zMy4wDQo+IA0KDQo=

