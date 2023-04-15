Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D56E3349
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:10:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlIK-00048Q-O3; Sat, 15 Apr 2023 15:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlIG-0003yN-Uy
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:10:40 -0400
Received: from mail-db5eur02on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::70e]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlID-0007nW-T3
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:10:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHQsKxY8+J0s4HeS4BSUbPh5CV2+mjYg7zmRuvvy/XTbVgmwFJHk1wsO93SyzVCFRv2rWlbkoD179X1AIYj9gYCbalXMhit3xYG6QVuxzNCeWLLF5f/1m+W4rwkpHu27b1/YbIUTZafmo2lNKDrtTj19C6wRIxxRSdJovSofzF0Do1cdxzQGYu3EVJ63s/9p6Mn5PgW97h/ree98V/DrtKAx3GYwtKmHVrEfnAtQJBhDxR9Pd0DwtCKg93FrjFuSgXgvHZrKG5RS0wrWQfrcYxeDeSSO2v6+noJmiu6dw9nZUM+B92yzacqr+f8Jt4Gd6fTYhBZiaBVe0ZSsjWEQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIeHGFDEjAT3QLRe4R6BwsKB2zZxrvYw8mGOpWEpVtE=;
 b=e87etQ++Yy7U7w1V3HffbABaBRIqZgIXupG8qvpcy+BYEHzbPVNwM1C3yqgAjrqsuXdAQU4EipQCnRmQYjM2Gl3hnGwIvvSQHkPsYO6pufeco2odyjSFmBy06v3bvvIatJJbKUF+v9jAX9hxO/v1I/g7pVQ755ew19ChNfngmiA4kIke/60ug1J6YcE7A5+OQPvH+tv/BOIVBqTyQnlMGfiLEtbiPpcyL0irELPaqgmIsna3jKpDM3rs/hYuyKntSR+ZojF9usWB4mpBLTTNFtY8ol3aP+nkrxInnOFbAvr/3JR2ywGDnMdJw4XDpT2nhgrlfyYaSwGDt20JfyWE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIeHGFDEjAT3QLRe4R6BwsKB2zZxrvYw8mGOpWEpVtE=;
 b=j5qeSMFRUGaS8RdeRAhULO98oqkLdRz2v/K9kfvMNEaGcB/Gu7yDZcIP8TccBCbyWUAuQM4/ssbX/gx5ulKRwvJehB3owq3QAnyNlsc2dRiWzgTGOrQohVO0WWPRScSQ4cYxamJ+RPMKgrz/mCBeQFuBvBJH/JjVwGce4s08kxU=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:10:01 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:10:01 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 14/40] e1000x: Share more Rx filtering logic
Thread-Topic: [PATCH 14/40] e1000x: Share more Rx filtering logic
Thread-Index: AQHZbsW53DUG3jZKuEK6K+qKV/1+wq8sugRg
Date: Sat, 15 Apr 2023 19:10:01 +0000
Message-ID: <DBBP189MB1433541278B9CD7357E06135959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-15-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-15-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: 957b8d95-2031-45a7-a41e-08db3de50334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tuXgLoiF+lYQKwvcKe3YKVjxULLz97TnquQy7WNkDwSIf9elxZO3HLl/nwEg22X75eqHYsWU8fY3dBFc6I1MpUzBYxpOoRDkCOK2gVU4FVZYuN86NGX4nD9hbas/TEx5WKkaTAg2FUGurx+NIGiy9p2fPCL/Vbbya7eqiCveJORZc8yHyb7g72+oa5L6+xyG903qBtBhVpXT77BUSwtrRJmHYvKIKCSprYsGzMXJWxHYxWk9GHrBFpvnzO7w0dYXzVqiPGtDBiZ0d2jF9zkrJ7479lf5eQsizda8MHLVRi4WKZze1jhc11PWWlhGBoT8S4q1kfTnnDmStRSvefZMUveCqvGd4PIUKUB5kL4jw8tMxVlMW7wsMOg7ru6M9rrM6yDXupoy45TQ/MZ70IB3OwQa6iGoUOCfe4dyFOL91bKV9+cx8woFbHffFH3ogCqhalkC6Ui9RZa2VIvOWtvUSfTFD7/J1sBkqsq5Y0nr0HeVegLvW3NmhdhEQKGPQ1KwbExpKvDqgvEBaq3O1ztqluR9NcLj7dwnkNumi2mzcx0mJzdEX6qiOl1cRP81InNFNDP5ixz14QU22xbfXAz/pK8pu6HBDUcPds/RAirOCJqlwkea8oyKhfP9MItXc0lq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(366004)(136003)(346002)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(9686003)(86362001)(122000001)(54906003)(8676002)(6916009)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(38100700002)(4744005)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U285UFJKZ0tGMXd5WTQzanhJRW80ZzcwUTc1MjhxRUJBMzZDU3hpb3Mxeitx?=
 =?utf-8?B?WWdUSmlKenBKa0pWSVZ1WFQ4N3UvK1dxdHp0Y3cxL1FpSE1KOC9lTHdYc3BE?=
 =?utf-8?B?NkhGYjRkQzd0YXIwTjlXTmVsR0llQW1GVHRFd1ZJZm9pM2tGQW1tK29PTEZN?=
 =?utf-8?B?WTNGMUpOcExLVWVYQVBvZy9Xdjd0TTFnbGRJSkZodXFGNHJrOERCMFF0ODB4?=
 =?utf-8?B?UnpUUERaM2RNcC80NFVHV2hkajJuYjdPY1JnZU9iS0FBWEZwajM0OTRKcDE4?=
 =?utf-8?B?d1JkcWFaVVkxRUlKdkl0VHJmQUZENU5MMXNjTHpzWDhWYVZDT1JMSFg5Tk9C?=
 =?utf-8?B?ck1CTmM5WEFkYTIxRVRsam1kSlgxTjJjQ0JmczQ5K2svZ1pRYmxkUmlSclNj?=
 =?utf-8?B?UTFCbHZXY21GOE13R1lMS0NiS1JtbHhvRFA4cXZBYlRoZ3hoQlRJdEpyVjQ0?=
 =?utf-8?B?d1FqQ2ZyK2lFR2t6TEp6Q2FoYWdRcG4wMmZzSm1lYktsKzhJL1FrSEtHUzdu?=
 =?utf-8?B?eW5SMmorTWVlbWc0aXZNbmhrSGwxOURwV3QwcEd6TDhyeGxOelRTenZqczZK?=
 =?utf-8?B?TzN4R1c2c0NiNTdVSHAwdkZKSVNSR3NGMCtBL2lraGZRMnBrOVVENkJMSmZr?=
 =?utf-8?B?ZEdqZWQvblEwWlVKOXB5MDFQT0FodkxVcnNWRXkwMXlLUTVpVEo3NDRxQXRz?=
 =?utf-8?B?K2EveGJpUWhQZW4xYVloc3hNZjl1ejNHYS9Qa21nRDVWL2poekRlejNpdmc5?=
 =?utf-8?B?SFp1NTBrT2VWUjgyUHRkVFZsYlo0R0k1VVlJK3dyd3MrZ2hobm5qdHhHamlF?=
 =?utf-8?B?aWxXU2FqR3YyQjl0RHFYWDIxT284YVU2WHN2YmcwNlR4d1ZqVkh0STdvNUlR?=
 =?utf-8?B?TVNjMjlObTFyWWEvUjdGQ0gwalE4U01PWWFYUk9rVSs1a3RlU1NyL3Z0VnJp?=
 =?utf-8?B?SE9vK1ZjZVB5eGJReGpSc05EU0UrVkFoR1k4bHdVTW16Z3RNeEY2c1YzZzFn?=
 =?utf-8?B?dWF1Tmt3NzVjdlRnQVFtL1BtUlBDK2lYMk9JQWhMU2RwRHVZdEVOMjNKQld0?=
 =?utf-8?B?WWJlVGo2RVZ0amFQblNFQkNaMkxhNnRrRHhqUHVRWW1ralo5YmJ6Vkx5QVFF?=
 =?utf-8?B?VTlSMWpOZHpnQ0M5Nlo5TlhvbDJ6K0w1T0ROREVxeGVkclpHdjVBZXcwWDcw?=
 =?utf-8?B?c0ZHeFZaRXUxNk1PZVRHYWd6azgrZ1MrQ3NqQzd1OGpBNDZwaVNXN2hHNUNK?=
 =?utf-8?B?UGFaczhNS09QQ0JXL05Od0t1NVhJSm9MTERhN1hkYkp4TDJzSnlHRmxwSTAx?=
 =?utf-8?B?c0FOb0JJclU2TldVMkV0NGVxY0MrYTA0NGVKTGFpSk5lcHkrZnRZQWVwVkVw?=
 =?utf-8?B?WGZ2RElKSGdjbVArYjhwaEVhb1FONWhWclF1WjJUS1paTjBxVi9NQ3Y1V1pk?=
 =?utf-8?B?VGFBOHM1TUk1UmZXb1o4cFlBa2VyNWQ0STRDVVBtSURTYURVVjQzSnJzY0JQ?=
 =?utf-8?B?RzVTVzVRUmt3VW9hbkthUjFFZVRnRDJKVFlYdktyR3ZuWEJVb2NTZjhuVksx?=
 =?utf-8?B?eHN4M0xtNUVCQ3p5T3IrNzdKa3NxY2lHdjZ4QUhYRzRQRnNZL0U0WWlPQzQx?=
 =?utf-8?B?UEJJbTBQMEFmcW0vRnc0ZCtxNjZuQUhQSitzVXBSaVo0bktYTnFOaS9vSEdo?=
 =?utf-8?B?Sjc0YkRkcUdFSzVkT0ttWGU0bTlUdkxiL2tFMkpiNVk2dXZpeHd5M3JRdXZG?=
 =?utf-8?B?ZzN4L1JidjdvS3lrbFlWTFlPcjRjQi9nM0prZHFhNzJ5N3BscG9tVDY0YWJ5?=
 =?utf-8?B?WlFKUFdxWUdxS1I0NEJWR05sRE9XOXlta0sxbzhESUcvM2RRNWduay96ZVBI?=
 =?utf-8?B?MlJJY1pPTHExV2l4RnFoTnMzekFoam1PK0YzY1dQVUJyVXVNMlJtcjQ5QUsv?=
 =?utf-8?B?NGlydGE3c2hweFhQUzgxNW5RZ3VhZmFYU3E5dllCTEMyTER1citDTWVkaEUx?=
 =?utf-8?B?cllvb3lObUI4UkRyYlNlVUtoRFppSlM3dFlkcDgrQ3M4TnFhV0ZCbklWOXZz?=
 =?utf-8?B?VGRyMjBoRlBBTXZZZFNOam5jVnJLdHNBQTcyNVJQUkREOXk5V2lDWHNvM2JX?=
 =?utf-8?Q?f1/lvCi24s5U8b8o9GyjGMGtO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 957b8d95-2031-45a7-a41e-08db3de50334
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:10:01.3360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GmfeL+ZLGGnnhijZKdb9kaAkZQt/H0XXThO+nugKyAFSA8qM1S/5bPBEMNIE5MJyXVTE9xlU2Jh9v04c9+7UHbULrvlYcxhxrBkuD5RXCF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2239
Received-SPF: pass client-ip=2a01:111:f400:fe12::70e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogRnJpZGF5LCAxNCBBcHJpbCAyMDIzIDEz
OjM3DQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
OyBKYXNvbiBXYW5nDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFuIDxk
bWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsNCj4gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT47IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47DQo+IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IFRob21hcyBIdXRoDQo+IDx0
aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWluZXJz
bUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVyIFJv
c2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQu
Y29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgQWtpaGlrbyBPZGFraQ0KPiA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMTQvNDBdIGUxMDAweDogU2hhcmUgbW9yZSBSeCBmaWx0ZXJpbmcg
bG9naWMNCj4gDQo+IFRoaXMgc2F2ZXMgc29tZSBjb2RlIGFuZCBlbmFibGVzIHRyYWNlcG9pbnQg
Zm9yIGUxMDAwJ3MgVkxBTiBmaWx0ZXJpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBa2loaWtv
IE9kYWtpIDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+IC0tLQ0KPiAgaHcvbmV0L2UxMDAw
LmMgICAgICAgICB8IDM1ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGh3L25l
dC9lMTAwMGVfY29yZS5jICAgfCA0NyArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gIGh3L25ldC9lMTAwMHhfY29tbW9uLmMgfCA0NCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tDQo+IC0tDQo+ICBody9uZXQvZTEwMDB4X2NvbW1vbi5oIHwg
IDQgKysrLQ0KPiAgaHcvbmV0L2lnYl9jb3JlLmMgICAgICB8IDQxICsrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgaHcvbmV0L3RyYWNlLWV2ZW50cyAgICB8ICA0ICsrLS0N
Cj4gIDYgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMTE5IGRlbGV0aW9ucygtKQ0K
DQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
ZWNoPg0K

