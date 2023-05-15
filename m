Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D778702BB5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:41:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWZq-0003H0-0W; Mon, 15 May 2023 07:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pyWZV-0003Ed-JW
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:40:57 -0400
Received: from mail-vi1eur05on2072c.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::72c]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pyWZS-0006Fg-Hi
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:40:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCoOXP34o41QJknO7YtMrCNJuXaghINljRt7YLN/iLAKMCJDscboW6IGt5AVca1XTgJ1gMRfFpfLB1fUIerzhFPqOp1p0jtv07u6zIbi+jDhoALoyPmhSPcBD9r4VVwzIvZMOcDBCquYS3yXeZt0eZk6M2oAHh6x84fRjPvEaUuM5wJws0jk7Pab2TljttVdB8nu8gG6kBLGAnJOZ1n0epLeHVP76NeAuTLZkyRZcRd9iSiZlXB7eDNn3YRHUroaRobDwsw5eJdPOKS2EHRNDJRSIE9m2iJcrc0+sHtRAYZhtRNMjzjZefgHtTVFsvBsNlv67DcQNkkZjezR3cXJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYb4p8XGjLhS2maxAMj7Z0kQ2kJ5EDesv0JGmA64hok=;
 b=T7D4sosheXvciC71lf3g+Mnz7/r2QMut7PSsxwxVu8qgpJcidNftmpbrFKyHSrkvbRiGskdwy3O9RCEZEKE/LJyQsymSP4qaVBUpfJKCPXq/QirdAkh4PNVh8vqTXc9IW7FNhTFOTbo0g7RRnVZDHSYM82bQCyE9sEfUDMsONqD4zUNovwf81Cp3bB4TlsnOz/qfGHYfyRsFEK5fuE7omBAxqF7neUkOrd+cqg19aQxqPzhIXdE1rVAMC91J2XrEwkPj7VdJS3+cDJfWJBF1tFemvESWYj/uz5PIyq5pL5FwTK2Xmg8z8iRRrFhtZm17GhFXY63s9WMC1eWkgEuMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYb4p8XGjLhS2maxAMj7Z0kQ2kJ5EDesv0JGmA64hok=;
 b=UjlxRtYjqNgnA+lMIN+K0jR5qAgqrhSCsyv8RGopHRtfZLS3LYbA6olbtRkak4hISxYsuQb6H2UkxqH6tUJMUod8R9Fh8OWtXBbsorat9Dc+kfZL0YFDdutQ/u0MJWk0PJCfo2wKZl8yEPn9IR6V223PWu2qeTmZ2H+6QCnN0Zk=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VE1P189MB0848.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 11:40:16 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%7]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 11:40:15 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "akihiko.odaki@daynix.com"
 <akihiko.odaki@daynix.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "k.kwiecien@samsung.com"
 <k.kwiecien@samsung.com>, "m.sochacki@samsung.com" <m.sochacki@samsung.com>
Subject: RE: [PATCH v6 1/7] igb: remove TCP ACK detection
Thread-Topic: [PATCH v6 1/7] igb: remove TCP ACK detection
Thread-Index: AQHZhOiNyqxoBiaekUORTiSdY5ase69bOgZA
Date: Mon, 15 May 2023 11:40:15 +0000
Message-ID: <DBBP189MB14333AAEA1D74E03BA7C7FE395789@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154349eucas1p2b961793fa75c52b820fee1c61db66111@eucas1p2.samsung.com>
 <20230512154335.2536-2-t.dzieciol@partner.samsung.com>
In-Reply-To: <20230512154335.2536-2-t.dzieciol@partner.samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|VE1P189MB0848:EE_
x-ms-office365-filtering-correlation-id: d3d5ae59-f39f-4ba4-860a-08db55392698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: to+w01jr8i4XjPaqo5ig/6oMnGU/dauJDDRUzvjpkhk5km+go1KQnb97nEqs3Yg3j7ATHmngDSUiSzKwIJnn3da/AkjCSykFLhhu2Q9OH9bNJM8noIClbJSGZoIGIjKRRqqYH180x0B4rV0pN/NiHqddukgCXA9NebvXY3G6Dmt1dJLabfAHztfyaNmzxh3D1U3Lj5P9J2GMB0So5Les1ZId+YSAFv+76gJUucWW4RWrxgywF2Hg+YgIvw3cgyJfQiHcGV3YitQghR9g415H7ZCtSU90FrKadR/+XwBKLl53t4+HuyTYdYcCl/jThB7+BOx6d6+ARcjOV9lG2BzxHYNv2WzXRjDqSdOIboItwuNbdA4A7sy+1/6nrfiNwagreq74PSKXu3+Ihmj0KlW9yEI0XKFNIie/eg99XjRevGJyghbM09wfPjw/HXJ4mYHrLdcRGHTuyFwdg+DNg01kq5pLaGbUi7OhuEORCAlHzwh8fGUoCYJKgXwhn0uSv6hA0TzsYnko8jz7sQW6itcX4lUwLJfyY0zYQcU0EBq8+zBuaBzofYjdFvtEgGW4suV06GjtrP0xB3SDdzGR3S7HV16VtPoqS1nGJkjf52Lv94hZmevkXo43rL1Ft2I8CQm1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39830400003)(451199021)(66556008)(54906003)(110136005)(478600001)(4326008)(64756008)(66446008)(66476007)(66946007)(76116006)(71200400001)(7696005)(316002)(2906002)(55016003)(8936002)(8676002)(44832011)(41300700001)(5660300002)(4744005)(26005)(52536014)(122000001)(33656002)(86362001)(38070700005)(38100700002)(83380400001)(53546011)(9686003)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmJVQjlBdDdXT2ZReEQzZzVpaTZ5R0prL0x3TFlyV0pDVTdpYmp0WUYwWHJM?=
 =?utf-8?B?cE9Ba0k5L29GTjAvZSt2RGhqZm5lNGprUmwyaWN1dXNVR2FUYU1lMENhVTZ4?=
 =?utf-8?B?MGl2cFRscnY3dDRmNzVwZEVnSThKZHRDVVdMSW5USXVKVHpTNTZWOHVMczla?=
 =?utf-8?B?cEVoRUNBeGE3VFZXVktWNmpUa3A1WU9LTzRoemNHU2daeXdiOGcvNThWMmVQ?=
 =?utf-8?B?bis5Q2dGbzg3Q0dKeGNvb3JiY2kxYUdZVWJkSUx1QUROV2hxSlhCUGt0ZU1G?=
 =?utf-8?B?ZGpJYjRCRHkrUm94QnZBUXNMcGI3ZkxVSEZjQk1OVE94WU1OWjQ0QS9UU3Iz?=
 =?utf-8?B?QWdyanNhUC9VMlJhR1ZMVS96Qk90bTdKZjBZOFFuS0FzanU4aDRWcWVyTWRi?=
 =?utf-8?B?L0hDbk92NHRKSmJ6UnNFU2l6STZCQlQ3NGpuN3F2NmEyclhZUVFad2NoUzZQ?=
 =?utf-8?B?THJVWFdvcEYyREM3RmFqbk4xb3BFcjlWQzFqRU8vQnRsL3dBUzVEVXhtSDY5?=
 =?utf-8?B?WE13UEp1TDF0YU5zT2wwVEdheUNBNFM1OStaMzY5WnkxdVZxQkUrL3piZThU?=
 =?utf-8?B?akZLeTVrUkIvRW8ycHdVRjlUSEhYNmtOd3lJTlVqdGhTamIrUUd4ZXV6UjJX?=
 =?utf-8?B?MnpmWkxURW9RbG1pWU9KN2Z6VTVxYVN5V28rQ0xtcjNHTzRFaFRRcW1FQmpz?=
 =?utf-8?B?ZkhlTzlqVENRcDBNMUFTMmwxNjNDR0xOTG54N3dBandDY0o2b0N6bVRHYlp1?=
 =?utf-8?B?TzVQbGc4ZFQybWl5QXU0MUtIQjRxUE9jbXluNlA0WWF1eUIrRFRpb2ptK01o?=
 =?utf-8?B?d1NxV3FvNUQ1MU1qU05TZ01EUmk1TXNkK2pnRkhvMFM2TElwZ3JkOHNmbHVD?=
 =?utf-8?B?MG1vYlJic3lGbFNFUER4blE4TVEvcWxpZTFZRFJ6bVZBbnJZakk0OHh5eXgy?=
 =?utf-8?B?WmhNcVVuM0NPSDhYL1l2aGpJampjZHBtRWFaeVExN1lDUWZYZTJtQTluVEVN?=
 =?utf-8?B?b3B3VTdqamM2WkdacVQ4Ylg0WHJBSnYzQmhUV2ZscDgvbU9QT2QxYkNZZVNs?=
 =?utf-8?B?VjN1RDJRWWJWcFRMVldPOG9FN0JBczBUdUVUU3dkMzg2MnR6enFSZE02NWRZ?=
 =?utf-8?B?NFJROXp0Znl3aEo2a253eEZxbzg4ZzIwWmlXNUhMNzlxRjRhNnRzWFFjYUJ5?=
 =?utf-8?B?Y1h1OGV3MytxS2FWT1JBTFFZOHQvMVhPWlk3cjY4cFZGTnFmSWZBTzJKajFy?=
 =?utf-8?B?emw5dEdYRjNyMHhxSDFrcGcxWVBxZ1c1alJwM2hucWFHbjllUWR2VHdENG1q?=
 =?utf-8?B?aHJ5T2w3ZkErTkdINlIyR0RxVTBabG92aVhEK0krMEZhMnlyMGZESERoRXUx?=
 =?utf-8?B?NG1yQmp6MTF6V09sbEczT2tQZ0tjQjJjQUVNdnppK1hBWGhMS0FLWkcrUDhX?=
 =?utf-8?B?cVdUMTdTSUo4M3RsVHJYS2RFTTJxaFlvclMxVVlKWDRjTzJiT0VhRTRWRTFw?=
 =?utf-8?B?azh5U25CbTYrMGZQbGRyRWR2V1hxckdpOUdBcldxUVJxWHNjZzZtY2k5SFdD?=
 =?utf-8?B?WEVXZUJSY2pRVXpNTHJTZTIzQzBLRHBUVkEvNXJ1YlhGUlp0Ym9YY0F2Q3VH?=
 =?utf-8?B?ZzFpancvdlBTeHpFUnJsbU9SZk55eW9CVmlYUHBQbWZ1RHNSVS8yRmNaWmUy?=
 =?utf-8?B?NEpyR0cva2FEem9jMjFvVUNTNXBVTzZPWnJ4eW9qTThsZ3FISnR1VUd1L2xy?=
 =?utf-8?B?RFNkYlAycU1SSkFlcWxpcjdiRkhmVXlQTzczTFFOWmxhTGpvUWlTVmdZM3E0?=
 =?utf-8?B?SFVSYkxkSjY3SThhTVNrTHdUcjlLd2RPUS9jZ1NEeU11b09VbFlBeUlJNFFX?=
 =?utf-8?B?bHl0RUo2Z2xsaUlvM2F3YTlzMmJjOEphVXljcXRvaFpLZE5XUHNHRXozbWZ1?=
 =?utf-8?B?c3RQME5xcjFNRzkxVkszcVNCTTkrWGRvNTRBbkQzcW9CdFM3b3lPS2EyR0d1?=
 =?utf-8?B?ZkxycUZnM1VWd0UxRjdXWEwzYzQyTnkxUzlvRzVYcXNOTWYwVGtqQmdQOWI2?=
 =?utf-8?B?RmNVWDlMdnN2QXdRTXp6TkE1OWVpWG9MZkNwV21Fd05GY1B5MXM0RFhhOTVo?=
 =?utf-8?B?QjVLaTVSaHBIb1FaUjRTN3NPY0ZhKytRN2NITUpkc1pvcHdyT2NzMmRib09Z?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d5ae59-f39f-4ba4-860a-08db55392698
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 11:40:15.1854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5us4jaKaxxNByTjpN3dsPGbKcrwK+c4M+Met8Y05h1xGI2cMBWWGYSfyPK47h8PgKQMzkGls47s+KDVRCDc6wmFfKSxHsUxIz98P784OGBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0848
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9tYXN6IER6aWVjaW9s
IDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ftc3VuZy5jb20+DQo+IFNlbnQ6IEZyaWRheSwgMTIgTWF5
IDIwMjMgMTc6NDMNCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgYWtpaGlrby5vZGFraUBk
YXluaXguY29tDQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0
LnRlY2g+Ow0KPiBqYXNvd2FuZ0ByZWRoYXQuY29tOyBrLmt3aWVjaWVuQHNhbXN1bmcuY29tOw0K
PiBtLnNvY2hhY2tpQHNhbXN1bmcuY29tDQo+IFN1YmplY3Q6IFtQQVRDSCB2NiAxLzddIGlnYjog
cmVtb3ZlIFRDUCBBQ0sgZGV0ZWN0aW9uDQo+IA0KPiBUQ1AgQUNLIGRldGVjdGlvbiBpcyBubyBs
b25nZXIgcHJlc2VudCBpbiBpZ2IuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogRHppZWNp
b2wgPHQuZHppZWNpb2xAcGFydG5lci5zYW1zdW5nLmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdi
X2NvcmUuYyB8IDUgLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cg0KUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3Qu
dGVjaD4NCg==

