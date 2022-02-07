Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C24AC06D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:04:43 +0100 (CET)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH4dG-0007fC-BO
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:04:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nH4ON-0005Bf-KP; Mon, 07 Feb 2022 08:49:19 -0500
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com
 ([40.107.237.52]:14912 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nH4OL-00075F-Dq; Mon, 07 Feb 2022 08:49:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlNjZndaLF9DEnHqA/FChU2yCmz3Fzge+zJlDw/8MQJo3ORSKy3+y7xm+hZ68v9Aef4akadVRj7ktWDFX4jpOUgu5asvBGfCKnsjrkgF1Q7AydLTTMKyHrvL/d451H9rj+lXCyKz+3Jk0wbKNMdjaqYJs9Sq3rH/wgCHA2U8J/Xj6xkRcRSGzAm/+/fIamA/AUBov+as+Jge2arb0zqBDEUztfUkyXPIsG9AvKtH2P2izLFvRXJoWqvNb+eAZuQzh4jDLhhH+PkWLMfkvZZKgf+qCtqJXZqf8yZeboowcgsJLHdLfLSopWIlpQOAK+PfydjvJAJDopRYQLYO4k00aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLJ3iRWJSV8fAo/P1Krk0fbdSvgM+nYgRD8z0czF+Jg=;
 b=i/OzCvsx8GtZX/7NBeNie6Y1TGNuaMOvdUB3vuEipzKO7scW5Ah+Y+VVAaof1Yz6gWsBgfMQhs60VhoML8gjgwNQJWr7hO/F1SDnALwKAwqP2d3LTMDGYRnx3h3lWrWzzvkPfdFEvmXnQWQN3SF9KHHSx3vjER/Wz5zMEDadnN+rrzYfEIcbFzJZMqiAzPt7sAmqvc65yW39o10jLPrln0sM/L/z+DiTDLjODZw7h07wsxrAUUnJZK/c4XPlpyr775JtKB7DjrOO4MdSUBc/8roD1dlIMHP3i43caeGLAuZmuk6cRcYBB8c21tOYDz7q1hq/vyZY3wqbm49TEye2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLJ3iRWJSV8fAo/P1Krk0fbdSvgM+nYgRD8z0czF+Jg=;
 b=gkoRGhJaqw43uudqAfKg4IWRqzFTskY46GU4PzWVeOvxmr660u7R/QKR8TaU4y1mKE3vtdo03xu9uEiZ2hduRyZF6zWmyXFn1/PkDTXIWt00BqqXYHhQ1QaY9bnHKVd4pqCZH3j+BhTXDkdawyIIFz0oIgZJrD2trUetFp+L+qIx9Osrpyt2ePvnl3NlYNSoDZcNZxTeJ9k3UE3hXXgng+QG5GztIy/SJUF1v/ZQXjdozTSCkPIdwBzGM5L52ZpsW4ui7A5qRKe+Bz+vDChqARV3hWg0hKvzntRovlsIcQ76sjP8+nAld8uqL524BBYLNlcvuJQOU0URhHlrCgBHkw==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39d::14)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 13:49:13 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::ec0e:dc76:ac43:20de]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::ec0e:dc76:ac43:20de%5]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 13:49:13 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>,
 "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Topic: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Index: AQHXzvvqdEwO0IQ5t0iKSU5G4bcqHKvvKsUAgACXagCAAAtOAIACGFGAgABfmQCAbag2AIAj+SOAgARiM4A=
Date: Mon, 7 Feb 2022 13:49:13 +0000
Message-ID: <57bae4400b1d9fe5c80dec7156e36a1b4ad2b471.camel@nvidia.com>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
 <20211101170506-mutt-send-email-mst@kernel.org>
 <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
 <20211102024742-mutt-send-email-mst@kernel.org>
 <87c14dc604e49b2ae85e9dcf1de4e813106fad6b.camel@nvidia.com>
 <20211103162840-mutt-send-email-mst@kernel.org>
 <84ad13760fbd1857b91e49ee6af5a8b516c35b15.camel@nvidia.com>
 <20220204072503-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220204072503-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f54d6835-df97-4c14-3f22-08d9ea40a02e
x-ms-traffictypediagnostic: MW3PR12MB4457:EE_
x-microsoft-antispam-prvs: <MW3PR12MB44574534C02119005AF48C47A12C9@MW3PR12MB4457.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yDSV3TyQf1U1Rw8vG71F9F4CH5VQ/fG7Z3m9wUqn+anFuwdVVgID934IflJ/nYE1J5XL+JQSyyUTqqVyuNeDnlsNM+MvDIwg3wTxpgvBl/sibNVbWxTVHke5I+guyjs39UI4aYn6W7QMstHQra4LtqHSlEUKOcLcprXy+aQIlWXpe37aZJy6qafLvjUKOFs7jVKonblFWEZNOz38JNkPa5FdkkbBT/hXadTWNbSv1cnug0y1I3JRUhWxxJNIU7Em+c/r+F1FIPFPZ092JdDunNbCS7MwVSqcAwiRj5UIpEQl/lJjCZynw6ZZcy2gROlPkGICL8dVc+x0uu4GR+kme3fvkKxpiplqaKsah096tpGqD9v1YutSaX0M5LQPB5szCICuqh/ccsLxGedobL+3NTE4EUup9DyJp3ItDC2X0FZFRjSawwHB533ywPUpsSXrjMEMLty+SVZQrg8ahGKfdDbvSvQi/Xemn8jgqAjk82GSKKKqMbpUUzpAF5NwYd17zRfrK6uuQLF6a6DRbNfKDUjc4pdjGmQQTK5ZlE+ZujVEQj1kUfoLSU563lrrC379HOkQB+Nt7mgMe43n6PUhI9IKlQoNI9PidVjqR+1TR/U5weJD214tbLGjqYb0VsFPpJgCvnsshIZifhpY3w24grQmlFy6Ah/08nyBvRt2XwWf9emKD2B77Xj15xHzPNSh5R/+slGJ9k75/XSmciuwHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(66556008)(8936002)(4326008)(66476007)(66446008)(64756008)(83380400001)(508600001)(8676002)(36756003)(91956017)(6486002)(26005)(38100700002)(38070700005)(86362001)(122000001)(6512007)(5660300002)(6506007)(76116006)(186003)(66946007)(54906003)(316002)(71200400001)(6916009)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHBsVnpxNUloY2FJa2N5dktYeS92azJUb2ltVjhhTmtIc0hhekxTektOLzla?=
 =?utf-8?B?UWhyc0lnZndtY2IyU2VidlFnVmNLRC9VS0JDWk9RaDk2T01LeEZadmgzTi9S?=
 =?utf-8?B?YnBsSjRIS3VUUWZLRkV5cmsybHFGbTlsQTd3Vzk1VlR1amFENDhBcHRjdktQ?=
 =?utf-8?B?TFVzbHo3Tk9qTDFxZXFkelVqT0ovMlpqMlNVckZURENxTmdTeXU1a0pBQlFy?=
 =?utf-8?B?T1BUM0xBL2FZRFRHUHN2TTdVU0Q1YVBKWlJsTW9VYVE2VUg2OXFSbVRwTXRi?=
 =?utf-8?B?RTVaL1F1ZURRTnRTSmhGWkRnblFSVGVBRnRFNU8vS01Ua1hTV3RpVkw4OFZ2?=
 =?utf-8?B?QzNZNGkyb0Rvd1FlaDkrb0ZBZjZ0d0tKdmp2MWZRNnY0Nk10QVJQVUJ2Q1Zw?=
 =?utf-8?B?RUxxTTlraW9wcVViNC91Q3JDVlpobzk0enNoYnVHVGNPTUpZN1dzMno2TFFl?=
 =?utf-8?B?eFNsSWlxdjRKT0VIZGRQcTYrb1V3QSs3ZzhZeFUrQzFQdWRTRXl3Y29XTG1P?=
 =?utf-8?B?YlRMbzUrR0R3emFXRzJkOUcyZVNwc1dXbWNpWUtJNUQyWU00Uzd2SnBRVWJ6?=
 =?utf-8?B?bVZKeUlVZEtKUlZGQUJ5MWpxNHdOb2dVRVU5YXZCT1d0MkYvYkdrLzIwamZt?=
 =?utf-8?B?SzFhMG4vb3RNYW1QaitpQnRtNXFUaC9XWFJaSjVmakIxaUpTZ0M1ZlE0Yllr?=
 =?utf-8?B?cDZyTXFsOXQzZUt5aFR5M09VTnRvUXdyUENUYlBhdWlmcTY4OUtBV2I0VmJv?=
 =?utf-8?B?ZXJNRTJvWk1yUDN5K3VzczdtVzRuYlE4S3dwVzVIbmduTWtNWXkySkxMaHJQ?=
 =?utf-8?B?UllxUG40bEdpeTgxL2FEdE9FcW8rNllWN0NmRE1CV0VZNkEvdFcwVWliUTVC?=
 =?utf-8?B?WUZPY21hTHphbUVWZktacm52Y05hTmx5Wkh0bWFub0lha08ybUYyUkdvUlh2?=
 =?utf-8?B?aG8zYzhaSU1XRWJKbTBhRGZZTm1oaGJScnFxU1l1LzhGbzJEemJlVFgvcHFv?=
 =?utf-8?B?K3RaWFhCNXJIQm93UU1QR29PQlp1V3l0MTR3VTR6dE54VHdORGpuVjFXS0sr?=
 =?utf-8?B?cis3ZVFzK3RPM3JKK2NLMFBySFVPNVBia1F0N2EwdFBRMUM1MVU5ak1rSnRy?=
 =?utf-8?B?QWRYUGFVZkxsb0VHL0hFTW9iNDVMWlJjemZWRDJkbWp3QkwxdWJpYjE1VlFZ?=
 =?utf-8?B?SFg2c0t5R0RjZlFKR3V3N3pWbVJvVGtkbjNZUDVvYTM3OXBENkZmV2lsZlJD?=
 =?utf-8?B?TkhGUWc3N1JoMURhVnZZditSU3dObUd5bWUvUXBjdHBYRUlWWlpRbDgzTlJK?=
 =?utf-8?B?MGNjZU13Y3pDYTR4TzlMKy9FU3pNSkVlek1JdENYTEtuWG1ldC9KWWJldjhr?=
 =?utf-8?B?RU03WlRwRi9ocU5ZbFpkYUlPL2k3bGowMllQRm42bU41UG5JdkRIQ2NnbDk0?=
 =?utf-8?B?MkNMdzJIbXdYSlV5OFBTWjRiNzRZbDJQSW0vRjFsL1l3VG10SngybW1MVmha?=
 =?utf-8?B?VzNTSFhRdjNmOVhVeUI3ZlRvTzEvM3dZY3loSERndTE1NHVIWnVUQWI1VXhr?=
 =?utf-8?B?dlJKUEU5aFZneGo1VzZjSlNQb0F6WTk3eEJtWHpLYmdCYVhFL0s2NUVQUTdI?=
 =?utf-8?B?TExMVGpLYnRwY1Z6QkIrSUlISFhpclMvQkNkQkoxNzYvd3hqU2REMnh5WHFZ?=
 =?utf-8?B?dkxhSkpmd21XQS9Pd1dVVGhOeDJEeEJneGFkQnU3dS9XdUNQUFUwVS9mREM0?=
 =?utf-8?B?RXZ5RDFIOCt6VHc5bE1ocUtUajk5ZnozRUEvNGkyTDFFbUdYKzFtV1BuNVQv?=
 =?utf-8?B?a0N6NFJIazZkVkoyZzJFV1dGYTJUZnVtOFV2SU1FSEU0QW11b3JEWmN3UkhT?=
 =?utf-8?B?SUlvbUdkLzVuTnluT1BOdERYSHhiT0NpSEoyQ3VPeGd3bWpoNUZkQTArbTFN?=
 =?utf-8?B?R2FHT3JzY0NxV2hSU3dtbitSVFNJaGtGcFl0eTFDbUV4VEN0MjFNeUs2Ym9M?=
 =?utf-8?B?Vi9QMUVxeUhoNjBsWGpaWG9oSi93L0twblQxNDNKWDBBYVQwb0NPL05STTh5?=
 =?utf-8?B?TDd3SWIvQnpUTTROZ0dETitOdmZSWGZDeDdISFJSUXNjU1ZiUTJlS2JiN0Np?=
 =?utf-8?B?WkR1Vmd1azZqQUdjWUJTVUh6dW1VUnQ0amx1aUVkcW9mRGpOYUNvMXgydys1?=
 =?utf-8?Q?AWTRgXSc/fwNadXn189maYP8a3Y8HVhGfGDsr865bgm8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5A65EEF2F087B46B81965CE9FB6C538@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54d6835-df97-4c14-3f22-08d9ea40a02e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 13:49:13.5346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZG/ZbGnl7cvK1zxq0g4L44EG1KA9fIrJUsauwp3M36iHhuX2z9nA++SzxFHacjQEoY+b3pKm1qJicjXq3p7ssQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
Received-SPF: softfail client-ip=40.107.237.52;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

djcgc2VudCB3aXRoIG1vcmUgZGVzY3JpcHRpb24sIHBsZWFzZSBjaGVjay4NCg0KVGhhbmtzLA0K
WHVlbWluZw0KDQpPbiBGcmksIDIwMjItMDItMDQgYXQgMDc6MjUgLTA1MDAsIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToNCj4gSSBkcm9wcGVkIHRoaXMgZm9yIG5vdyBhcyBJJ20gYSBiaXQgbG9z
dCB3aXRoIHRoaXMgcGF0Y2hzZXQuDQo+IENjIFJhcGhhZWwgbWF5YmUgaGUnbGwgdW5kZXJzdGFu
ZCBpdCBiZXR0ZXIuDQo+IA0KPiBPbiBXZWQsIEphbiAxMiwgMjAyMiBhdCAwMzowNToxNVBNICsw
MDAwLCBYdWVtaW5nKFN0ZXZlbikgTGkgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDIxLTExLTAzIGF0
IDE2OjMwIC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE5v
diAwMywgMjAyMSBhdCAwMjo0ODo0MVBNICswMDAwLCBYdWVtaW5nKFN0ZXZlbikgTGkgd3JvdGU6
DQo+ID4gPiA+IE9uIFR1ZSwgMjAyMS0xMS0wMiBhdCAwMjo0OSAtMDQwMCwgTWljaGFlbCBTLiBU
c2lya2luIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgTm92IDAyLCAyMDIxIGF0IDA2OjA4OjM5
QU0gKzAwMDAsIFh1ZW1pbmcoU3RldmVuKSBMaSB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIE1vbiwg
MjAyMS0xMS0wMSBhdCAxNzowNiAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiBPbiBNb24sIE5vdiAwMSwgMjAyMSBhdCAwNDozODoxMlBNICswODAwLCBYdWVt
aW5nIExpIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IFdoZW4gdmhvc3QtdXNlciB2ZHBhIGNsaWVu
dCBzdXNwZW5kLCBiYWNrZW5kIG1heSBjbG9zZSBhbGwgcmVzb3VyY2VzLA0KPiA+ID4gPiA+ID4g
PiA+IFZRIG5vdGlmaWVyIG1tYXAgYWRkcmVzcyBiZWNvbWUgaW52YWxpZCwgcmVzdG9yZSBNUiB3
aGljaCBjb250YWlucw0KPiA+ID4gPiA+ID4gPiA+IHRoZSBpbnZhbGlkIGFkZHJlc3MgaXMgd3Jv
bmcuIHZkcGEgY2xpZW50IHdpbGwgc2V0IFZRIG5vdGlmaWVyIGFmdGVyDQo+ID4gPiA+ID4gPiA+
ID4gcmVjb25uZWN0Lg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFRoaXMgcGF0
Y2ggcmVtb3ZlcyBWUSBub3RpZmllciByZXN0b3JlIGFuZCByZWxhdGVkIGZsYWdzIHRvIGF2b2lk
IHJldXNpbmcNCj4gPiA+ID4gPiA+ID4gPiBpbnZhbGlkIGFkZHJlc3MuDQo+ID4gPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiA+ID4gRml4ZXM6IDQ0ODY2NTIxYmQ2ZSAoInZob3N0LXVzZXI6IHN1
cHBvcnQgcmVnaXN0ZXJpbmcgZXh0ZXJuYWwgaG9zdCBub3RpZmllcnMiKQ0KPiA+ID4gPiA+ID4g
PiA+IENjOiBxZW11LXN0YWJsZUBub25nbnUub3JnDQo+ID4gPiA+ID4gPiA+ID4gQ2M6IFl1d2Vp
IFpoYW5nIDx6aGFuZ3l1d2VpLjkxNDlAYnl0ZWRhbmNlLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBYdWVtaW5nIExpIDx4dWVtaW5nbEBudmlkaWEuY29tPg0KPiA+ID4gPiA+
ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gPiA+ICBody92aXJ0aW8vdmhvc3QtdXNlci5jICAgICAg
ICAgfCAxOSArLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ID4gPiA+ID4gIGluY2x1ZGUvaHcv
dmlydGlvL3Zob3N0LXVzZXIuaCB8ICAxIC0NCj4gPiA+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMTkgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMgYi9ody92
aXJ0aW8vdmhvc3QtdXNlci5jDQo+ID4gPiA+ID4gPiA+ID4gaW5kZXggYmY2ZTUwMjIzYy4uYzY3
MTcxOWU5YiAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gPiAtLS0gYS9ody92aXJ0aW8vdmhvc3QtdXNl
ci5jDQo+ID4gPiA+ID4gPiA+ID4gKysrIGIvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPiA+ID4g
PiA+ID4gPiA+IEBAIC0xMTQzLDE5ICsxMTQzLDYgQEAgc3RhdGljIGludCB2aG9zdF91c2VyX3Nl
dF92cmluZ19udW0oc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ID4gPiA+ID4gPiA+ICAgICAg
cmV0dXJuIHZob3N0X3NldF92cmluZyhkZXYsIFZIT1NUX1VTRVJfU0VUX1ZSSU5HX05VTSwgcmlu
Zyk7DQo+ID4gPiA+ID4gPiA+ID4gIH0NCj4gPiA+ID4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gPiA+
ID4gLXN0YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZXN0b3JlKHN0cnVjdCB2
aG9zdF9kZXYgKmRldiwNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaW50IHF1ZXVlX2lkeCkNCj4gPiA+ID4gPiA+ID4gPiAtew0K
PiA+ID4gPiA+ID4gPiA+IC0gICAgc3RydWN0IHZob3N0X3VzZXIgKnUgPSBkZXYtPm9wYXF1ZTsN
Cj4gPiA+ID4gPiA+ID4gPiAtICAgIFZob3N0VXNlckhvc3ROb3RpZmllciAqbiA9ICZ1LT51c2Vy
LT5ub3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+ID4gPiA+ID4gPiA+IC0gICAgVmlydElPRGV2aWNl
ICp2ZGV2ID0gZGV2LT52ZGV2Ow0KPiA+ID4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ID4gPiAt
ICAgIGlmIChuLT5hZGRyICYmICFuLT5zZXQpIHsNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICB2
aXJ0aW9fcXVldWVfc2V0X2hvc3Rfbm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4LCAmbi0+bXIs
IHRydWUpOw0KPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgIG4tPnNldCA9IHRydWU7DQo+ID4gPiA+
ID4gPiA+ID4gLSAgICB9DQo+ID4gPiA+ID4gPiA+ID4gLX0NCj4gPiA+ID4gPiA+ID4gPiAtDQo+
ID4gPiA+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1v
dmUoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBxdWV1ZV9pZHgpDQo+ID4gPiA+ID4g
PiA+ID4gIHsNCj4gPiA+ID4gPiA+ID4gPiBAQCAtMTE2MywxNyArMTE1MCwxNCBAQCBzdGF0aWMg
dm9pZCB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVtb3ZlKHN0cnVjdCB2aG9zdF9kZXYgKmRl
diwNCj4gPiA+ID4gPiA+ID4gPiAgICAgIFZob3N0VXNlckhvc3ROb3RpZmllciAqbiA9ICZ1LT51
c2VyLT5ub3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgVmlydElPRGV2
aWNlICp2ZGV2ID0gZGV2LT52ZGV2Ow0KPiA+ID4gPiA+ID4gPiA+ICANCj4gPiA+ID4gPiA+ID4g
PiAtICAgIGlmIChuLT5hZGRyICYmIG4tPnNldCkgew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgaWYg
KG4tPmFkZHIpIHsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICB2aXJ0aW9fcXVldWVfc2V0X2hv
c3Rfbm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4LCAmbi0+bXIsIGZhbHNlKTsNCj4gPiA+ID4g
PiA+ID4gPiAtICAgICAgICBuLT5zZXQgPSBmYWxzZTsNCj4gPiA+ID4gPiA+ID4gPiAgICAgIH0N
Cj4gPiA+ID4gPiA+ID4gPiAgfQ0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gU28gb24gdnEgc3RvcCB3ZSBzdGlsbCByZW1vdmUgdGhlIG5vdGlmaWVyLi4u
DQo+ID4gPiA+ID4gPiA+ICAgDQo+ID4gPiA+ID4gPiA+ID4gIHN0YXRpYyBpbnQgdmhvc3RfdXNl
cl9zZXRfdnJpbmdfYmFzZShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdmhvc3RfdnJpbmdf
c3RhdGUgKnJpbmcpDQo+ID4gPiA+ID4gPiA+ID4gIHsNCj4gPiA+ID4gPiA+ID4gPiAtICAgIHZo
b3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZXN0b3JlKGRldiwgcmluZy0+aW5kZXgpOw0KPiA+ID4g
PiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ID4gPiAgICAgIHJldHVybiB2aG9zdF9zZXRfdnJpbmco
ZGV2LCBWSE9TVF9VU0VSX1NFVF9WUklOR19CQVNFLCByaW5nKTsNCj4gPiA+ID4gPiA+ID4gPiAg
fQ0KPiA+ID4gPiA+ID4gPiA+ICANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IGJ1dCBv
biB2cSBzdGFydCB3ZSBkbyBub3QgcmVpbnN0YXRlIGl0PyBEb2VzIHRoaXMgbm90IG1lYW4gdGhh
dA0KPiA+ID4gPiA+ID4gPiBub3RpZmllcnMgd29uJ3Qgd29yayBhZnRlciBzdG9wIHRoZW4gc3Rh
cnQ/DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gWWVzLCBiYWNrZW5k
IGluaXRpYWxseSB3b3JrIHcvbyBob3N0IG5vdGlmaWVyLCByZXF1ZXN0IFZNIGRyaXZlciB0bw0K
PiA+ID4gPiA+ID4gaW5zdGFsbCBub3RpZmllciBpZiBuZWVkZWQgLSBjYWxsIHRoaXMgZnVuY3Rp
b24gdGhyb3VnaCBzbGF2ZSBzb2NrZXQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSSB0aGluayBp
dCdzIGNsZWFuZXIgaWYgcWVtdSBoYW5kbGVzIHRoaXMgaXRzZWxmIGxpa2UgaXQgZGlkIGJlZm9y
ZSwgaXQNCj4gPiA+ID4gPiBrbm93cyB2bSBpcyBzdG9wcGVkIHdpdGhvdXQgZ2V0dGluZyBjYWxs
ZWQuDQo+ID4gPiA+IA0KPiA+ID4gPiBJZiB2aG9zdCBwbGF5IGFzIHNlcnZlciwgdGhlcmUgYXJl
IDIgc2NlbmFyaW8gdGhhdCByZW1vdmUgdGhlIG5vdGlmaWVyOg0KPiA+ID4gPiAxLiBWTSBzdXNw
ZW5kOiBiYWNrZW5kIHN0aWxsIHRoZXJlLCBpdCdzIG9rYXkgdG8ga2VlcCBtbWFwIGFkZHJlc3Mu
DQo+ID4gPiA+IDIuIHZob3N0IGJhY2tlbmQgc3RvcHBlZCBvciBwcm9jZXNzIGtpbGxlZDogcmVz
b3VyY2VzIGZyb20gYmFja2VuZA0KPiA+ID4gPiBzaG91bGQgYmUgcmVsZWFzZWQuIFRoYXQncyB3
aHkgcGF0Y2ggMi8yIG11bm1hcCBpbiBub3RpZmllciByZW1vdmUNCj4gPiA+ID4gZnVuY3Rpb24u
IFRoZW4gdGhlIHJlc3RvcmUgZnVuY3Rpb24gZ2V0IG5vdGhpbmcgdG8gcmVzdG9yZSwgbWF5YmUg
SQ0KPiA+ID4gPiBzaG91bGRuJ3QgcmV2ZXJzZSBwYXRjaCBvcmRlci4NCj4gPiA+IA0KPiA+ID4g
SSBjYW4ndCBzYXkgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gaGVyZS4gRG8geW91IHBsYW4g
dG8gY2hhbmdlDQo+ID4gPiB0aGUgcGF0Y2hzZXQgaW4gc29tZSB3YXk/DQo+ID4gPiBXaGVuIHlv
dSBkbywgcGxzIGluY2x1ZGUgYSBjb3ZlciBsZXR0ZXIgd2l0aCBhIGNoYW5nZWxvZyBhbmQNCj4g
PiA+IENjIGFsbCBwZW9wbGUgeW91IGluY2x1ZGUgb24gcGF0Y2hlcyBvbiB0aGUgY292ZXIgbGV0
dGVyIHRvby4gDQo+ID4gDQo+ID4gSGVyZSBpcyB0aGUgZGV0YWlsIG9mIHRoZSBwcm9ibGVtIEkg
ZW5jb3VudGVyZWQsIG15IHZob3N0IGJhY2tlbmQgaXMNCj4gPiBEUERLIHZkcGEgdXNlciBzcGFj
ZSBhcHBsaWNhdGlvbi4gTm90aWZpZXIgYWRkcmVzcyBpcyBzZXQgd2hlbiB2ZHBhIGFzaw0KPiA+
IHFlbXUgdG8gbW1hcCBhIEZEIGFuZCBhbiBvZmZzZXQgZnJvbSB2ZHBhLCBzZWUgZnVuY3Rpb24N
Cj4gPiB2aG9zdF91c2VyX3NsYXZlX2hhbmRsZV92cmluZ19ob3N0X25vdGlmaWVyKCkuIElmIHRo
ZSB2ZHBhIGFwcGxpY2F0aW9uDQo+ID4gcmVzdGFydCBvZiBnZXQga2lsbGVkIGZvciBzb21lIHJl
YXNvbiwNCj4gPiB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVtb3ZlKCkgaXMgY2FsbGVkIGFu
ZCBub3RpZmllciBNUiBpcw0KPiA+IHVuaW5zdGFsbGVkLCB0aGUgbm90aWZpZXIgYWRkcmVzcyB0
aGF0IHJldHJpZXZlZCBmcm9tIG1tYXAgaXMNCj4gPiByZWZlcmVuY2luZyB0byBhbiBpbnZhbGlk
IEZELCBub3QgcmVsZWFzZWQuIFRoaXMgd2lsbCBjYXVzZSBIVw0KPiA+IHJlc291cmNlcyBvbiBr
ZXJuZWwgc2lkZSBzdGlsbCByZWZlcmVuY2VkLCBtb3N0IGltcG9ydGFudCwgd2hlbiB2ZHBhDQo+
ID4gY29ubmVjdGlvbiByZXN0b3JlZCwgdGhpcyBpbnZhbGlkIG5vdGlmaWVyIHdpbGwgYmUgYmUg
cmVzdG9yZWQgYXMNCj4gPiBub3RpZmllciBNUi4NCj4gPiANCj4gPiBUbyByZXNvbHZlIGl0LCBo
YXZlIHRvIHJlbW92ZSB0aGUgbm90aWZlciByZXN0b3JlIG1lY2hhbmlzbSwgdkRQQQ0KPiA+IGFw
cGxpY2F0aW9uIHdpbGwgaXNzdWUgY2xpZW50IHNvY2tldCByZXF1ZXN0IGFnYWluIHRvIGluc3Rh
bGwgbm90aWZpZXINCj4gPiB0byBWTSwgc28gbm8gY29uY2VybiB0aGF0IHRoZSBub3RpZmllciB3
aWxsIGJlIGxvc3QgYWZ0ZXIgcmVzdW1lLg0KPiA+IA0KPiA+IFNpbmNlIHZkcGEgbWlnaHQgYmUg
a2lsbGVkLCBubyBjaGFuY2UgdG8gbm90aWZ5IHFlbXUgdG8gcmVtb3ZlDQo+ID4gbm90aWZpZXIu
IEFuIGFsdGVybmF0aXZlIHNvbHV0aW9uIGlzIHRvIGRldGVjdCBzb2NrIGRpc2Nvbm5lY3Rpb24g
YW5kDQo+ID4gdW5tbWFwIG5vdGlmaWVyLCBidXQgaXQgbG9va3MgbW9yZSBjb21wbGV4IHRvIG1l
LiBIb3cgZG8geW91IHRoaW5rPw0KPiA+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBAQCAtMTUzOCw3ICsx
NTIyLDYgQEAgc3RhdGljIGludCB2aG9zdF91c2VyX3NsYXZlX2hhbmRsZV92cmluZ19ob3N0X25v
dGlmaWVyKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiA+ID4gPiA+ID4gPiAgICAgIH0NCj4g
PiA+ID4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gPiA+ID4gICAgICBuLT5hZGRyID0gYWRkcjsNCj4g
PiA+ID4gPiA+ID4gPiAtICAgIG4tPnNldCA9IHRydWU7DQo+ID4gPiA+ID4gPiA+ID4gIA0KPiA+
ID4gPiA+ID4gPiA+ICAgICAgcmV0dXJuIDA7DQo+ID4gPiA+ID4gPiA+ID4gIH0NCj4gPiA+ID4g
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci5oIGIvaW5j
bHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci5oDQo+ID4gPiA+ID4gPiA+ID4gaW5kZXggYTlhYmNh
MzI4OC4uZjYwMTJiMjA3OCAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2h3
L3ZpcnRpby92aG9zdC11c2VyLmgNCj4gPiA+ID4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2h3L3Zp
cnRpby92aG9zdC11c2VyLmgNCj4gPiA+ID4gPiA+ID4gPiBAQCAtMTQsNyArMTQsNiBAQA0KPiA+
ID4gPiA+ID4gPiA+ICB0eXBlZGVmIHN0cnVjdCBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgew0KPiA+
ID4gPiA+ID4gPiA+ICAgICAgTWVtb3J5UmVnaW9uIG1yOw0KPiA+ID4gPiA+ID4gPiA+ICAgICAg
dm9pZCAqYWRkcjsNCj4gPiA+ID4gPiA+ID4gPiAtICAgIGJvb2wgc2V0Ow0KPiA+ID4gPiA+ID4g
PiA+ICB9IFZob3N0VXNlckhvc3ROb3RpZmllcjsNCj4gPiA+ID4gPiA+ID4gPiAgDQo+ID4gPiA+
ID4gPiA+ID4gIHR5cGVkZWYgc3RydWN0IFZob3N0VXNlclN0YXRlIHsNCj4gPiA+ID4gPiA+ID4g
PiAtLSANCj4gPiA+ID4gPiA+ID4gPiAyLjMzLjANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiANCj4gPiANCj4gDQoNCg==

