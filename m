Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3F3CFBE2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:19:02 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qaK-0002jr-Pt
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5qZ0-0001ex-OK
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:17:38 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:48146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5qYw-0008Hw-TE
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:17:38 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KED4iw009175; Tue, 20 Jul 2021 07:17:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=8ZGLKMarkzmylcoHoBlRu4G/OYWiySaDPJ9Pb/BZUmg=;
 b=RZmapeF/NO4IAMzWdBveBfxOq+cIRe7o6BQtJc2JfFtrcObjnJyqcUxohp/eAOu/mHsT
 lLEa2sZ/DcskGm7+2DD80uEQ/qM5o3KOZpJ7B7/jmfwq9qGdoZsgqSy8Pv7eVTydPa3k
 UsAeoaCHVGR669MOLx1xrYDsplrORBaWFXm0tVAAB/MSYZJUV62axY+r43ulnyX4PMY1
 I3614fHaBcSFYZRLei4+4AjUL03C1sbZsvrZin3I8y49OZQFeqwWQkNiXvX6VgWmIaJz
 xylscyORE7x8wCmada5yQj5+ZkhjcJAGpappYWBK1mnwtTsolGe2pZtzjde+YuzCrpW3 6Q== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by mx0a-002c1b01.pphosted.com with ESMTP id 39w7u52tkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 07:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ9IoaPKxoyiO1ECov6WZqqlTCuVaJeVvltaFCsQl5THgHlOdSGLiow2BajDFtaMZJjZMvbSmLcpc7tAClkyggoDpT1u2+EW1PkYUpJSRFkWA3Jlod6vUhCUA8kEbq13jUQX9r5yk4hdP9tyr0QrhcdRfCCeVXQYhqza0mPDzvtqp0fP9wJDYl0+X+epoDhCgCaCcrUqsxegHq1WAedcslcz+bz4tuhobrxy/B8COUyA2GrO0mn3vQcppj1gKYm8HsJ1HDvUWoDfV/1MN/JqyiIO0Wd+rFuvVepmrwA5nXrYOqozmSR3SQb+OfyFcXU93vV3mjTOmIDFImNDwm08Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZGLKMarkzmylcoHoBlRu4G/OYWiySaDPJ9Pb/BZUmg=;
 b=QasEWPJfMNmapeRXREjPg+zVeulEc2lao3M6amGrJNXvm/RJuvLLH6JZCjfKoUS4OkLQE52P5N0zvK4LeTPN2WOp40n7qwbLxQXYfMVhPZj97Lue4HTXkVkp5D7tzGrS+yDsYHImwSx1S0eOZmhEAWQMaTHaHUnK2bgw6PIGpSd70g6xxOilMTybc6UU5OkqVUla4X7zo3r6v8VASG65uTwqmranokilgf2eqOEpoNnQ+x6HTbK4Ze8Wecn/B0OS0t3CgKIH0r6W4qLWkoWFg7/BCD17q4Adh1pdq+kbNVnCKIVUadkWhbBHqYURfrQQzenQ5t5tuFAgwZgDDzFCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6582.namprd02.prod.outlook.com (2603:10b6:610:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 14:17:29 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 14:17:29 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Jagannathan Raman <jag.raman@oracle.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Topic: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Index: AQHXfNjiwIKxnwbPe0S4aoe8a4Ll5atL6NUA
Date: Tue, 20 Jul 2021 14:17:29 +0000
Message-ID: <CH0PR02MB7898528462CB5A47FE31F0E48BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <9ea4e77a39aaff3dfac3e463d3de76b0e4e1844f.1626722742.git.jag.raman@oracle.com>
In-Reply-To: <9ea4e77a39aaff3dfac3e463d3de76b0e4e1844f.1626722742.git.jag.raman@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af3fd447-121f-4f65-5fd9-08d94b891bc1
x-ms-traffictypediagnostic: CH2PR02MB6582:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB658237D699D33734954C41C78BE29@CH2PR02MB6582.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s3JOJancyFDwv4KGErHOlgzIRBNc77vSyRej0n4FyfPYp6Hh/76JxcNtYR5nqmkGZaFmmn6hzwdiGZteXuyltEvNbp9/RqV3Ouaos6eznZhq0LaKFEBxdjlGpm2uDt9IMW0zG3KCjRaCZ8MOozm4QsVGgE4/splZfx0zScSMEbqrtkt/prSFx/Mckp/eqDoWh6t6L4QmN4TcpDU3XuBZaAEED5n7vKk4GfNmqYi9WgJVF0EnoMzd68esJE/BlOa34oD+2D20MYLuDr2/bXXyrDaAtpYSNCWPdfyXX4KFOiV1eNaUZZ3rQh65iyBVeQ6bMDptASBjikysOi64Pa9fkMWrR8HB4/bvEEYST5yHUjs7O5MKrUkiXNSm590Vm17VIOKeD63Cuh78LeF0nzie2Ut1Q5uz3Dr0jkUTCt5rIApXpUxJWHAVZoRfO6Ui3+5z/QTXyB226dkthQf0xXxN7qEHgESYW/s0OemFREqI5vkf3zETzwJMLN904yMPxJwOxA9PxF2vEgZaN+TuZod4Vf9XVg/pJkOWtM8jDY9iyqJpIVPJYL3/a7E0zZERQJhusmdTjtgld/+6s8GQ2GbG8WM2pbKbjxnO4PmaT2N3e8gaetOGeDJabhVhARDpfwDoRwe3iPRG3kPkxwDy3GNA3lx1bx3Y/92SWxyoqfq2O+0WChRrP+0fHAF7DiNFjOK4aTHnaHGhzd9hlCHo+G1UtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(54906003)(86362001)(38100700002)(83380400001)(2906002)(44832011)(4326008)(66446008)(26005)(66476007)(66556008)(66946007)(186003)(33656002)(316002)(107886003)(71200400001)(6506007)(64756008)(76116006)(52536014)(110136005)(7696005)(55016002)(53546011)(8676002)(8936002)(508600001)(9686003)(122000001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnlLZ2tBVkZ2dDV6SE9iZ3c3ZUFUQkQ2aVYvU05KWmU5YlJzT00xQUUrN0hW?=
 =?utf-8?B?aEVBallQSE5MZU94Nng3WEtQQnQwNU5yVExvRWErd01OMmQ4cWsrc1ZoSjMw?=
 =?utf-8?B?TXVIL0RERHFjTWxpUFlDUzBQYWIzSEJMNEJNejlwYmpQTmJjTXQ3cU1zYmVO?=
 =?utf-8?B?b1Rhd3B3eTZqVy9qclNaa1ZxSFJDZ2pwZjN4Ym4xMzh5WHNYR3NUajRCWVFx?=
 =?utf-8?B?UktQUmE0SVVyUGpHMzI5MHBGcStiSkMyQ3JmaFBnWGw3akYzaTAxSWFZam9C?=
 =?utf-8?B?QkVLRWZMbStoaDR3bk55RkJpWnQxV1BBOUNuME82VHlsN1lSaFN0c0lGOHE1?=
 =?utf-8?B?T2YvOUp5Zi9CUW5DTHhYd3UxeWRBVVN3MVJZUTVLRG5zbHhJY3BtOWVJRldp?=
 =?utf-8?B?MWZOR0VSWkNjRi9SMzNzOUFDMU5RWHRaS2o3YjFXa3U3eUtRSmkyUDluWmxm?=
 =?utf-8?B?OEorYUE5bHZ5MUdYdVo4QmF6YmpQcGpsb3krY2lnSnZlZ0Zma0NsVVVnODNk?=
 =?utf-8?B?d1cwaVdXVlB0RDZlZVVDeVdPTlNRM2NDZ282R3I5aUFHT0MzWlFNQU80M2RV?=
 =?utf-8?B?V0NiK3VGY051V2s1dytnbE8vakZxQUI2V3lDdXlMdUJtTG01dnZPb201TjV4?=
 =?utf-8?B?QlJuWmU0bFZObnB5YmpnNEVHR0E3blBOTmhlbWliaDUzS1BRZzdPblVPRXRV?=
 =?utf-8?B?cW94SXRCazJsOGpuc3lUN3d5YVZpeGNvUFdZdm9HNE5QbGllaFk1Vk12ZWpp?=
 =?utf-8?B?V2UyVXBUd0MycWIvU2kvaElJdUdMeEJSQUN6VCt6Sm4rVlhuZVZBajF2WkdR?=
 =?utf-8?B?bUxsa1RXa1ZXRVh2OGQ5elJPTHhOTTk1aEFKSUhEYzlONmZnNDh3U3lZRTAv?=
 =?utf-8?B?bFZLeVJhRVZyTGdrU1VCUEhMcExwajdWckJaQkdhemNpck9ad3Q2Y09vREo3?=
 =?utf-8?B?TDh1QmhuL2dsc1RVTWZxd3FEb1hvRHV5UEd6aENoQzVnVUNTWUIxNEJoRnNw?=
 =?utf-8?B?MFZLaFprczQvSVBMVXB0YXlBWk5iSzhNbjdtTThtenNvSUFvWEhwY0hQN2xU?=
 =?utf-8?B?dDNuQjNleWRiY2JIRXF5aVltQk1ZRzRlTTdtd1BDd2U5ZHN3QkNvV2pKZDVJ?=
 =?utf-8?B?NlJsVnVYUEdaTHA3UUtGZzNGazVCRThZdnFsbmhHVFpjcGdCaCsvNEQwYlFv?=
 =?utf-8?B?ZDBwSXNtSGpjbjl5TW1RV2RjSXY4YUpIRUlEQlJYZkJCQUFxNVhrZnFaRC9T?=
 =?utf-8?B?RjRXVXJXcFJHeTY3RUI3bHI4bktHelVyU1YxdW56eC9wQjlxdVhxQmhacG5N?=
 =?utf-8?B?UWRseUhvbzk4MUhNL0FJYjEzTExScm9LSGJCN3ZpcUUrSUVhbTVtZEdvanNO?=
 =?utf-8?B?MTBvYXpwdFlIcDlFYURCME9TVmEya1hYSHN5bnQxWVBNeExMd1ljZGtqdlV5?=
 =?utf-8?B?TXRaVmkxdGkwdGFjZExjUDZkb0N4eG5KQXVkY1JJZThQaU5uS1EzTHhjZ0Fu?=
 =?utf-8?B?QzJTb3hzM0ttMlBtWkdUR1dhU2dHR3piaHVQV1pSMTlOTGNoN2RRMEhFdG1J?=
 =?utf-8?B?ZjhLeU94SERhdXZHYXplWXlRSVlnUnZoNmRKbURzZXZhRFBRWWthbEZTRlp6?=
 =?utf-8?B?eUc4QUx1dndld1V1KzQ2WkUzY0syM1hjeU9wMXZpcURZTDhIelplcDAzOFI4?=
 =?utf-8?B?M2EySGlQZTAzdE13dWpGeXdxQzhPc3BWZitoWUFaY3cwRnY1dEo1blQ2VTE2?=
 =?utf-8?Q?5lCBH7r/oBy98NnePo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3fd447-121f-4f65-5fd9-08d94b891bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 14:17:29.7368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilIvfGPn9m3GpJwhZpJOVZL1eS1VYPjHgP+CEnnNlPMNXgyVZrK8RTSY1MeAi977kOmMo4FKsIliWQDsJvYxu6EsO8xxUqHW2BOsRN4mj8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6582
X-Proofpoint-GUID: nZaqspSgycHY8Td5yr432SDJL9nykPVO
X-Proofpoint-ORIG-GUID: nZaqspSgycHY8Td5yr432SDJL9nykPVO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_09:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWdhbm5hdGhhbiBSYW1hbiA8
amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+IFNlbnQ6IDE5IEp1bHkgMjAyMSAyMTowMA0KPiBUbzog
cWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBzdGVmYW5oYUByZWRoYXQuY29tOyBhbGV4Lndp
bGxpYW1zb25AcmVkaGF0LmNvbTsNCj4gZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb207IEpvaG4g
TGV2b24gPGpvaG4ubGV2b25AbnV0YW5peC5jb20+Ow0KPiBqb2huLmcuam9obnNvbkBvcmFjbGUu
Y29tOyBUaGFub3MgTWFrYXRvcw0KPiA8dGhhbm9zLm1ha2F0b3NAbnV0YW5peC5jb20+OyBTd2Fw
bmlsIEluZ2xlDQo+IDxzd2FwbmlsLmluZ2xlQG51dGFuaXguY29tPjsgamFnLnJhbWFuQG9yYWNs
ZS5jb20NCj4gU3ViamVjdDogW1BBVENIIFJGQyBzZXJ2ZXIgMDUvMTFdIHZmaW8tdXNlcjogcnVu
IHZmaW8tdXNlciBjb250ZXh0DQo+IA0KPiBTZXR1cCBhIHNlcGFyYXRlIHRocmVhZCB0byBydW4g
dGhlIHZmaW8tdXNlciBjb250ZXh0LiBUaGUgdGhyZWFkIGFjdHMgYXMNCj4gdGhlIG1haW4gbG9v
cCBmb3IgdGhlIGRldmljZS4NCg0KSW4geW91ciAidmZpby11c2VyOiBpbnN0YW50aWF0ZSB2Zmlv
LXVzZXIgY29udGV4dCIgcGF0Y2ggeW91IGNyZWF0ZSB0aGUgdmZ1IGNvbnRleHQgaW4gYmxvY2tp
bmctbW9kZSwgc28gdGhlIG9ubHkgd2F5IHRvIHJ1biBkZXZpY2UgZW11bGF0aW9uIGlzIGluIGEg
c2VwYXJhdGUgdGhyZWFkLg0KV2VyZSB5b3UgZ29pbmcgdG8gY3JlYXRlIGEgc2VwYXJhdGUgdGhy
ZWFkIGFueXdheT8gWW91IGNhbiBydW4gZGV2aWNlIGVtdWxhdGlvbiBpbiBwb2xsaW5nIG1vZGUg
dGhlcmVmb3JlIHlvdSBjYW4gYXZvaWQgY3JlYXRpbmcgYSBzZXBhcmF0ZSB0aHJlYWQsIHRodXMg
c2F2aW5nIHJlc291cmNlcy4gRG8gcGxhbiB0byBkbyB0aGF0IGluIHRoZSBmdXR1cmU/DQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNs
ZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBv
cmFjbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFu
QG9yYWNsZS5jb20+DQo+IC0tLQ0KPiAgaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYyB8IDQ0DQo+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS92
ZmlvLXVzZXItb2JqLmMgYi9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+IGluZGV4IGUzNjI3
MDkuLjZhMmQwZjUgMTAwNjQ0DQo+IC0tLSBhL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMNCj4g
KysrIGIvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0KPiBAQCAtMzUsNiArMzUsNyBAQA0KPiAg
I2luY2x1ZGUgInRyYWNlLmgiDQo+ICAjaW5jbHVkZSAic3lzZW11L3J1bnN0YXRlLmgiDQo+ICAj
aW5jbHVkZSAicWVtdS9ub3RpZnkuaCINCj4gKyNpbmNsdWRlICJxZW11L3RocmVhZC5oIg0KPiAg
I2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4gICNpbmNsdWRlICJzeXNlbXUvc3lzZW11LmgiDQo+
ICAjaW5jbHVkZSAiaHcvcWRldi1jb3JlLmgiDQo+IEBAIC02Niw2ICs2Nyw4IEBAIHN0cnVjdCBW
ZnVPYmplY3Qgew0KPiAgICAgIHZmdV9jdHhfdCAqdmZ1X2N0eDsNCj4gDQo+ICAgICAgUENJRGV2
aWNlICpwY2lfZGV2Ow0KPiArDQo+ICsgICAgUWVtdVRocmVhZCB2ZnVfY3R4X3RocmVhZDsNCj4g
IH07DQo+IA0KPiAgc3RhdGljIHZvaWQgdmZ1X29iamVjdF9zZXRfc29ja2V0KE9iamVjdCAqb2Jq
LCBjb25zdCBjaGFyICpzdHIsIEVycm9yICoqZXJycCkNCj4gQEAgLTkwLDYgKzkzLDQ0IEBAIHN0
YXRpYyB2b2lkIHZmdV9vYmplY3Rfc2V0X2RldmlkKE9iamVjdCAqb2JqLCBjb25zdA0KPiBjaGFy
ICpzdHIsIEVycm9yICoqZXJycCkNCj4gICAgICB0cmFjZV92ZnVfcHJvcCgiZGV2aWQiLCBzdHIp
Ow0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkICp2ZnVfb2JqZWN0X2N0eF9ydW4odm9pZCAqb3Bh
cXVlKQ0KPiArew0KPiArICAgIFZmdU9iamVjdCAqbyA9IG9wYXF1ZTsNCj4gKyAgICBpbnQgcmV0
Ow0KPiArDQo+ICsgICAgcmV0ID0gdmZ1X3JlYWxpemVfY3R4KG8tPnZmdV9jdHgpOw0KPiArICAg
IGlmIChyZXQgPCAwKSB7DQo+ICsgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1
OiBGYWlsZWQgdG8gcmVhbGl6ZSBkZXZpY2UgJXMtICVzIiwNCj4gKyAgICAgICAgICAgICAgICAg
ICBvLT5kZXZpZCwgc3RyZXJyb3IoZXJybm8pKTsNCj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+
ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0ID0gdmZ1X2F0dGFjaF9jdHgoby0+dmZ1X2N0eCk7DQo+
ICsgICAgaWYgKHJldCA8IDApIHsNCj4gKyAgICAgICAgZXJyb3Jfc2V0ZygmZXJyb3JfYWJvcnQs
DQo+ICsgICAgICAgICAgICAgICAgICAgInZmdTogRmFpbGVkIHRvIGF0dGFjaCBkZXZpY2UgJXMg
dG8gY29udGV4dCAtICVzIiwNCj4gKyAgICAgICAgICAgICAgICAgICBvLT5kZXZpZCwgc3RyZXJy
b3IoZXJybm8pKTsNCj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+ICsgICAgfQ0KPiArDQo+ICsg
ICAgZG8gew0KPiArICAgICAgICByZXQgPSB2ZnVfcnVuX2N0eChvLT52ZnVfY3R4KTsNCj4gKyAg
ICAgICAgaWYgKHJldCA8IDApIHsNCj4gKyAgICAgICAgICAgIGlmIChlcnJubyA9PSBFSU5UUikg
ew0KPiArICAgICAgICAgICAgICAgIHJldCA9IDA7DQo+ICsgICAgICAgICAgICB9IGVsc2UgaWYg
KGVycm5vID09IEVOT1RDT05OKSB7DQo+ICsgICAgICAgICAgICAgICAgb2JqZWN0X3VucGFyZW50
KE9CSkVDVChvKSk7DQo+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgICAgICB9
IGVsc2Ugew0KPiArICAgICAgICAgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1
OiBGYWlsZWQgdG8gcnVuIGRldmljZSAlcyAtICVzIiwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG8tPmRldmlkLCBzdHJlcnJvcihlcnJubykpOw0KPiArICAgICAgICAgICAgfQ0KPiAr
ICAgICAgICB9DQo+ICsgICAgfSB3aGlsZSAocmV0ID09IDApOw0KPiArDQo+ICsgICAgcmV0dXJu
IE5VTEw7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfbWFjaGluZV9kb25l
KE5vdGlmaWVyICpub3RpZmllciwgdm9pZCAqZGF0YSkNCj4gIHsNCj4gICAgICBWZnVPYmplY3Qg
Km8gPSBjb250YWluZXJfb2Yobm90aWZpZXIsIFZmdU9iamVjdCwgbWFjaGluZV9kb25lKTsNCj4g
QEAgLTEyNSw2ICsxNjYsOSBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X21hY2hpbmVfZG9uZShO
b3RpZmllcg0KPiAqbm90aWZpZXIsIHZvaWQgKmRhdGEpDQo+ICAgICAgICAgICAgICAgICAgICAg
cGNpX2dldF93b3JkKG8tPnBjaV9kZXYtPmNvbmZpZyArIFBDSV9ERVZJQ0VfSUQpLA0KPiAgICAg
ICAgICAgICAgICAgICAgIHBjaV9nZXRfd29yZChvLT5wY2lfZGV2LT5jb25maWcgKw0KPiBQQ0lf
U1VCU1lTVEVNX1ZFTkRPUl9JRCksDQo+ICAgICAgICAgICAgICAgICAgICAgcGNpX2dldF93b3Jk
KG8tPnBjaV9kZXYtPmNvbmZpZyArIFBDSV9TVUJTWVNURU1fSUQpKTsNCj4gKw0KPiArICAgIHFl
bXVfdGhyZWFkX2NyZWF0ZSgmby0+dmZ1X2N0eF90aHJlYWQsICJWRlUgY3R4IHJ1bm5lciIsDQo+
IHZmdV9vYmplY3RfY3R4X3J1biwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbywgUUVNVV9U
SFJFQURfSk9JTkFCTEUpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5p
dChPYmplY3QgKm9iaikNCj4gLS0NCj4gMS44LjMuMQ0KDQo=

