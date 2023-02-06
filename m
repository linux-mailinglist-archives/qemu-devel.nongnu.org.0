Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E268C347
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 17:29:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP4N1-0001bB-E1; Mon, 06 Feb 2023 11:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pP4Mx-0001aR-My; Mon, 06 Feb 2023 11:29:27 -0500
Received: from mail-he1eur04on0701.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::701]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pP4Mv-0000aU-CF; Mon, 06 Feb 2023 11:29:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFs+u1TVq5jm/oc1C6FANXemA0xT1tRL7mX0H6/2/ZciA3ZfTHA5NaCAzXWj5lOkuvQGa2YUz3FQbw1N0n+tBcRyxzwM3PDBH8yeGXA63CGwvl1w24FIOTBK3jWqB/cgnlBRVFSOh+FtdJf9fb+UKIyjQemBdPoX1ujVwY/HUf1tLDuI/bwhwx8O/74LCJWjShF7h3NiynfrlLViJFyvIilRp7S/EQ+vqTfiAg1JMmxXsectjkvQY1Q9cnsyvPrvo1pbC+AGTNeRzoROdzWkWpd6FY0Bkx57JtNE5oHcx9KSrGlvvsKSNx3gEjIdGl+3T8+MIKwBRN2hB1xZVwzhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj9qr+GYqC6WWr2tZBTdlZkoRXApW/3YAQcz+ZlfhNw=;
 b=FLmc6BRgpNBy2UzxUK+jHmY7+VK5NC62QKc1X5tqvb5hl+FIU7HzIRvRZFfnfap1O7v8pnM48pPoZjhMP/zzOhtj9WpncaYw6tGZ5Lfc/dLrebbDNXUinspBu7qu9hA+z7cDtyjg7u3mttwDkI7jGDCQ+FFGn4d/5pvwb5T2jpTVyLcna+EOlbLdNByKjRP0ND8yD7dmWJDHP9vnx+j9C9eppYcBREV/nz95XQyT6HQCx3Vgi6VPTCh5gUsBiCANPsiwc95/4YpMjkpJxLeG3D4RTWvogbtlsD6+KIHMh8KcP0dwnRaroSIvIVFLnUTAQQ2yQgdxGgHVnzE6W3rMPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj9qr+GYqC6WWr2tZBTdlZkoRXApW/3YAQcz+ZlfhNw=;
 b=mhvun7MCqOdM6OiHKupOqZe0yaPlONgDu8Xvx5mqJJz+EawlIonsj9caf5eV3OE7tdG59tE2kUFlH8BoZkKC/dmgYVXH9gOnc9oAwKedSyzHNxVo+OJRnLnTPETAgQJdfCU/FmInYmynKIQih8TDUvs3wfz7Wrrsvnb5uusbpe8=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0784.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 16:29:19 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 16:29:19 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Bandan Das
 <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "devel@daynix.com" <devel@daynix.com>, Yan Vugenfirer
 <yvugenfi@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, Gal
 Hammer <gal.hammer@sap.com>
Subject: RE: [PATCH v8 0/8] Introduce igb
Thread-Topic: [PATCH v8 0/8] Introduce igb
Thread-Index: AQHZOFJEF9lY9GjnpEimT2X+9zvzCq7CHqgQ
Date: Mon, 6 Feb 2023 16:29:19 +0000
Message-ID: <DBBP189MB1433A35866EED42584ED8A7295DA9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230204043621.13540-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230204043621.13540-1-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|VI1P18901MB0784:EE_
x-ms-office365-filtering-correlation-id: cee8cbe7-b4e9-4123-1c04-08db085f4c1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MHFMeYGtoDuPif3bJRqnIrANAln7M/4rTneI6UFtH1fscLxmqD35b0nmXnObB8q8cWccJvlarkpahzZJsmEZ5CeKZBV+z6Q+NBinsg40DpCUh7mSv8OI095LePKRj5gdXV01gYPGtcEiFeeVLaRNsYAq7oGraPZ8FWy4ChgBGTeGMzMFgT+9BtO0tFtB7EUvioY0reXx1TU6bzm78h+pMkzQNbVeTfxNLM8HJ4W/Pt9dDql0o9ZwVgqttq02THYEVXGfPObSWa4V4qBg+f0deFBsD9HTWcJRWdC7KGZ2o5GG9iJq4oCyW2Wbkt97H9wvyuW7w2PvtKOEx72vAo/6pthRJ9xNDW9Cspc8YmMtvgdXu7gj3/7rckchovMJQGnd7EfEAX1vNOjrV10uKJLvflxczyVkTMZTof5uAtMI+/aa1Vj/NNO2E3Tp8E64jFDY5JB8l1Ctq2zaIBmioWiKemx0QbmHor+jl9wfntmaBMQ7ry65IDhf5/UTDGT6ZkSuRPGjYIbJFumE11m0E08s8Hr0uvcpLtYlMPqPK02aCRDiR64jbZxN8RoKomzr/CiduIzycsXU891NCFJpqObauf+ajNlSCdJQUTW2F2UHdQqWZ52YQOYfliEGtRXo5h2zRS4HxgXIzkX0h0HaKtyXBuXHFpnohdkJXA+Hg5e84sd+s1brqsnwChCmXwOv8aoBYOHMIVXr9K215k4cwNYOcJHd9i7i48QhR+Qrpdt5Cg8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(376002)(346002)(366004)(136003)(396003)(451199018)(186003)(66946007)(38100700002)(76116006)(122000001)(83380400001)(38070700005)(52536014)(5660300002)(6916009)(41300700001)(64756008)(2906002)(66476007)(44832011)(6506007)(7416002)(4326008)(8936002)(8676002)(66556008)(9686003)(66446008)(478600001)(966005)(86362001)(26005)(33656002)(316002)(54906003)(66574015)(7696005)(71200400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXBWQ0h5Vjc5T1JXRW5mWFRPQzQrSDhtNC92YUY3ZmdBQkMzSy9aY1ZpYUJG?=
 =?utf-8?B?MjBKKzI3ZlhxalV3N1diaDVueHkrNUZKSWN2c0lWNndMZW5NcGR2aE5VTnlC?=
 =?utf-8?B?NDBiNzBscXBhN0REZ0RVSzJqcGYvYUxaTzR4Ulg2L0hlOWxWSDlPREsrbllM?=
 =?utf-8?B?UWdRS3pYZUFlb09iYWpmeVM1a2JzY0laR3RLTkdHVFFoTGVmR2UrK0lCRWx4?=
 =?utf-8?B?bEhTMDJ0czV5aUhFaXZrdEtEejVPV0h3NHQ4bHBLdzhzQ2x0aWhGYnVzL1NW?=
 =?utf-8?B?SXJEMHNEZkFEN0xRNEZjZU1mUDZxVUp1WDZLQ0ZiemE4bzF2b0JOMDVpcjRr?=
 =?utf-8?B?MFpJVFpScUZCY0VCSDltM2pLQ0V3bUMvaStFQWhycUV5Y2tFWENud29KS2xo?=
 =?utf-8?B?VGg2NC82UFdNb2xTV2FNTWVvYXBLd2FISURZdFIvU2RXdjE2RnB1ZitMMWs3?=
 =?utf-8?B?TUloOXYyMUFjUTIyT2tOUHlMMFVKZ0dVRXRXWDBhMTQ5QzRoa2g2dk1JNVZG?=
 =?utf-8?B?RUlmOVlHeHg0d1R0MzVsbUlIcjJmLzM2cU9PWGJXRDhhYlNkZ25Ec21KWENl?=
 =?utf-8?B?V0xJYzRYd3ZUcVpkNU9IL2dGSjFzUkdNbkg0bjM4MHIzRkk2WHIybXBSZVh3?=
 =?utf-8?B?ak9YMVNqR3RkbndXdzBoQUo2M0M1aDZvc3pBUDNyUWpVR3FsNDZYbUNSOTly?=
 =?utf-8?B?Tmxzangza0RtNU8xVjd0azkxMlh3UkFWa1lTb1IwOUhrMUt2di9TTEhXMWZJ?=
 =?utf-8?B?N2NQczdOeXIvZjVLRHRFeHR2bVhzV014Yjc5OUp2OVJOMWUyVU83dGVRMHkx?=
 =?utf-8?B?ZWtrT1ZwNWJFUFExVjlKV01iOGE4ZmNEZTdpa0o2K2FIWUFPNHVVdkM5SjRk?=
 =?utf-8?B?c2RqYStQUDBFUWdyUThaN0JWeDVpQkZnN1BTT210SGRIV1pPMksyZENIbWt5?=
 =?utf-8?B?VUc2L2gwQXAvTUMveEREcUhKTWJDQ2RmZFh4dS9Fbk01QWdwNmVDcmpIUHhs?=
 =?utf-8?B?WndKN21NUTZHOHFaZ1BDQllaMTg0bWRCUDByWW4xSzJ2aGJucGtKNTR2UTdY?=
 =?utf-8?B?SE02cDkzT09xVXdhd09QbmJYRE9xT1YxNFhxRUlMNFRUcU1zUWpnM2xFS0tt?=
 =?utf-8?B?YzFTMkx6dS90VXQ5Mk1KN2dSdXdpR2tYVzExNWpKVGNHaktKN0NSTVRNRVky?=
 =?utf-8?B?Sk94bFdaYzY3TkFYQjU2bUhzZWVFSHRXSldMdDlMMC9TUGEyNUNRU2kzaW8x?=
 =?utf-8?B?MmNhSTNrU2k4ZzQ5Zk0raXZHdnJKQ1I5MUdWMkQrWG50aWNUY3A1MkNRaXA5?=
 =?utf-8?B?MzZaeUdrSjdaT1lYTTRXcEdLTCtNU1k5MEpzSmZGblFUUVN2WFI1WmlXVDRY?=
 =?utf-8?B?SlpHNFdCU3lEb0cwQm9YcWFpdjA3dGlEMnozTTZWYnQwbUxKcXR5ZzVxeXJt?=
 =?utf-8?B?RXdEeGZGQ0JYV3VDYzhaeEV5Rk15NTVaYjJzSDgwcUpoaU1oSEJqNHo1bmYw?=
 =?utf-8?B?NzJJMkFDaTFaUWZQMHNaSi9hVVZnZ1JEV3A0Nmc3M1J0c3JFZlg2QWRTVFpW?=
 =?utf-8?B?UENwVmNwSmpUZDBIcWQ3YXRhL1V6L3c4WDAwU2pIc3p1RGlhaVp3Wm9kVmhm?=
 =?utf-8?B?dG5vdHVFSFNCVlBzaU1lTlFrRFFKbmVjRm0vemFiNkV4ajRJbFRMZU41V3dT?=
 =?utf-8?B?aExkVUJERlBLUzJseENNclpTaVhlZm1GY3RScFQxMlloTmZvcXdhSmFETU1x?=
 =?utf-8?B?TXk5dzZ4ZldsdjRidzQ3WW5hcTh6NFBmUWI3QUN1N1VDWExOZVN6cGxQWWl6?=
 =?utf-8?B?U29xb21MQ0hNUmtkYXZ3OWlGK2hXZ2t3RzFZWEZKQ2JTODRBY3dGQ05xa1ls?=
 =?utf-8?B?SzBVNkIyMTRtZ1o4SE1NdFI0ZU1EK2ZCVzRHeWRlWUE1Yk53M1dtOGN3dWEr?=
 =?utf-8?B?Nk50RmljT2FIdEY3RENRVHhKRm5BNUF5anBhaVM5TkJoMGJPcDhkSUpuL0xZ?=
 =?utf-8?B?d1lBM0VvUDBtT3UvV2ZlVEt0dW96MnlOanl5V0swcWJrTkhpdmpWenVseURn?=
 =?utf-8?B?bWdZM2RteWtSemFxZG0yVDZOR0pFMFNPUERMdHhtR09heDJVVkR0VHlROXB1?=
 =?utf-8?B?U1pDU1Z0KzBTb3FNSUpZNFFTay8wYVQ2d1d6Y3JzMEtOWE9tQWZ6VU5FcTRK?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cee8cbe7-b4e9-4123-1c04-08db085f4c1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 16:29:19.4611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XI+YPUplc+7tSZ/FUwoXw3OZFHwi7unDq9OxcxzNzOhlMRZZ+0I68fLMMudBCj2xRqsdByd1UXELtL4FuIAlVeFKlc915gE8+SZvLq+VOWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0784
Received-SPF: pass client-ip=2a01:111:f400:fe0d::701;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBa2loaWtvIE9kYWtpIDxha2lo
aWtvLm9kYWtpQGRheW5peC5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5LCA0IEZlYnJ1YXJ5IDIwMjMg
MDU6MzYNCj4gQ2M6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxl
eXRtYW4NCj4gPGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+OyBNaWNoYWVsIFMgLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT47DQo+IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZlbGJhdW1A
Z21haWwuY29tPjsgQWxleCBCZW5uw6llDQo+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsgUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsNCj4gVGhvbWFzIEh1dGgg
PHRodXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdhaW5l
cnNtQHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGViZXIg
Um9zYQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhh
dC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgQWxleGFuZGVy
IEJ1bGVrb3YgPGFseG5kckBidS5lZHU+OyBCYW5kYW4gRGFzDQo+IDxic2RAcmVkaGF0LmNvbT47
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT47IERhcnJlbiBLZW5ueQ0KPiA8
ZGFycmVuLmtlbm55QG9yYWNsZS5jb20+OyBRaXVoYW8gTGkgPFFpdWhhby5MaUBvdXRsb29rLmNv
bT47IHFlbXUtDQo+IGRldmVsQG5vbmdudS5vcmc7IHFlbXUtcHBjQG5vbmdudS5vcmc7IGRldmVs
QGRheW5peC5jb207IFlhbg0KPiBWdWdlbmZpcmVyIDx5dnVnZW5maUByZWRoYXQuY29tPjsgWXVy
aSBCZW5kaXRvdmljaA0KPiA8eXVyaS5iZW5kaXRvdmljaEBkYXluaXguY29tPjsgU3JpcmFtIFlh
Z25hcmFtYW4NCj4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPjsgR2FsIEhhbW1lciA8Z2Fs
LmhhbW1lckBzYXAuY29tPjsNCj4gQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXgu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjggMC84XSBJbnRyb2R1Y2UgaWdiDQo+IA0KPiBCYXNl
ZC1vbjogPDIwMjMwMjAxMDMzNTM5LjMwMDQ5LTEtYWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiAoW1BBVENIIHY1IDAwLzI5XSBlMTAwMHggY2xlYW51cHMgKHByZWxpbWluYXJ5IGZvciBJR0Ip
KQ0KPiANCj4gaWdiIGlzIGEgZmFtaWx5IG9mIEludGVsJ3MgZ2lnYWJpdCBldGhlcm5ldCBjb250
cm9sbGVycy4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cw0KPiA4MjU3NiBlbXVsYXRpb24gaW4gcGFy
dGljdWxhci4gWW91IGNhbiBzZWUgdGhlIGxhc3QgcGF0Y2ggZm9yIHRoZQ0KPiBkb2N1bWVudGF0
aW9uLg0KPiANCj4gTm90ZSB0aGF0IHRoZXJlIGlzIGFub3RoZXIgZWZmb3J0IHRvIGJyaW5nIDgy
NTc2IGVtdWxhdGlvbi4gVGhpcyBzZXJpZXMgd2FzDQo+IGRldmVsb3BlZCBpbmRlcGVuZGVudGx5
IGJ5IFNyaXJhbSBZYWduYXJhbWFuLg0KPiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9o
dG1sL3FlbXUtZGV2ZWwvMjAyMi0xMi9tc2cwNDY3MC5odG1sDQo+IA0KPiBWNyAtPiBWODoNCj4g
LSBSZW1vdmVkIG9ic29sZXRlIHBhdGNoDQo+ICAgImh3L25ldC9uZXRfdHhfcGt0OiBJbnRyb2R1
Y2UgbmV0X3R4X3BrdF9nZXRfZXRoX2hkciIgKEPDqWRyaWMgTGUgR29hdGVyKQ0KPiANCj4gVjYg
LT4gVjc6DQo+IC0gUmVvcmRlcmVkIHN0YXRlbWVudHMgaW4gaWdiX3JlY2VpdmVfaW50ZXJuYWwo
KSBzbyB0aGF0IGNoZWNrc3VtIHdpbGwgYmUNCj4gICBjYWxjdWxhdGVkIG9ubHkgb25jZSBhbmQg
aXQgd2lsbCBiZSBtb3JlIGNsb3NlIHRvIGUxMDAwZV9yZWNlaXZlX2ludGVybmFsKCkuDQo+IA0K
PiBWNSAtPiBWNjoNCj4gLSBSZWJhc2VkLg0KPiAtIFJlbmFtZWQgInRlc3QiIHRvICJwYWNrZXQi
IGluIHRlc3RzL3F0ZXN0L2UxMDAwZS10ZXN0LmMuDQo+IC0gRml4ZWQgUnggbG9naWMgc28gdGhh
dCBhIFJ4IHBvb2wgd2l0aG91dCBlbm91Z2ggc3BhY2Ugd29uJ3QgcHJldmVudCBvdGhlcg0KPiAg
IHBvb2xzIGZyb20gcmVjZWl2aW5nLCBiYXNlZCBvbiBTcmlyYW0gWWFnbmFyYW1hbidzIHdvcmsu
DQo+IA0KPiBWNCAtPiBWNToNCj4gLSBSZWJhc2VkLg0KPiAtIFNxdWFzaGVkIHBhdGNoZXMgdG8g
Y29weSBmcm9tIGUxMDAwZSBjb2RlIGFuZCBtb2RpZnkgaXQuDQo+IC0gTGlzdGVkIHRoZSBpbXBs
ZW1lbnRlZCBmZWF0dXJlcy4NCj4gLSBBZGRlZCBhIGNoZWNrIGZvciBpbnRlcnJ1cHRzIGF2YWls
YWJsaXR5IG9uIFBGLg0KPiAtIEZpeGVkIHRoZSBkZWNsYXJhdGlvbiBvZiBpZ2JfcmVjZWl2ZV9p
bnRlcm5hbCgpLiAoU3JpcmFtIFlhZ25hcmFtYW4pDQo+IA0KPiBWMyAtPiBWNDoNCj4gLSBSZWJh
c2VkLg0KPiAtIENvcnJlY3RlZCBQQ0lEZXZpY2Ugc3BlY2lmaWVkIGZvciBETUEuDQo+IA0KPiBW
MiAtPiBWMzoNCj4gLSBSZWJhc2VkLg0KPiAtIEZpeGVkIFBDSURldmljZSByZWZlcmVuY2UgaW4g
aHcvbmV0L2lnYnZmLmMuDQo+IC0gRml4ZWQgVFggcGFja2V0IHN3aXRjaGluZyB3aGVuIFZNIGxv
b3BiYWNrIGlzIGVuYWJsZWQuDQo+IC0gRml4ZWQgVk1EcSBlbmFibGVtZW50IGNoZWNrLg0KPiAt
IEZpeGVkIFJYIGRlc2NyaXB0b3IgbGVuZ3RoIHBhcnNlci4NCj4gLSBGaXhlZCB0aGUgZGVmaW5p
dGlvbnMgb2YgUlFEUEMgcmVhZGVycy4NCj4gLSBJbXBsZW1lbnRlZCBWTEFOIFZNIGZpbHRlci4N
Cj4gLSBJbXBsZW1lbnRlZCBWVF9DVEwuRGVmX1BMLg0KPiAtIEltcGxlbWVudGVkIHRoZSBjb21i
aW5hdGlvbiBvZiBWTURxIGFuZCBSU1MuDQo+IC0gTm90ZWQgdGhhdCBpZ2IgaXMgdGVzdGVkIHdp
dGggV2luZG93cyBITEsuDQo+IA0KPiBWMSAtPiBWMjoNCj4gLSBTcHVuIG9mZiBlMTAwMGUgZ2Vu
ZXJhbCBpbXByb3ZlbWVudHMgdG8gYSBkaXN0aW5jdCBzZXJpZXMuDQo+IC0gUmVzdG9yZWQgdm5l
dF9oZHIgb2ZmbG9hZCBhcyB0aGVyZSBzZWVtcyBub3RoaW5nIHByZXZlbnRpbmcgZnJvbSB0aGF0
Lg0KPiANCj4gQWtpaGlrbyBPZGFraSAoOCk6DQo+ICAgcGNpZTogSW50cm9kdWNlIHBjaWVfc3Jp
b3ZfbnVtX3Zmcw0KPiAgIGUxMDAwOiBTcGxpdCBoZWFkZXIgZmlsZXMNCj4gICBJbnRyZG9jdWUg
aWdiIGRldmljZSBlbXVsYXRpb24NCj4gICB0ZXN0cy9xdGVzdC9lMTAwMGUtdGVzdDogRmFicmlj
YXRlIGV0aGVybmV0IGhlYWRlcg0KPiAgIHRlc3RzL3F0ZXN0L2xpYnFvcy9lMTAwMGU6IEV4cG9y
dCBtYWNyZWcgZnVuY3Rpb25zDQo+ICAgaWdiOiBJbnRyb2R1Y2UgcXRlc3QgZm9yIGlnYiBkZXZp
Y2UNCj4gICB0ZXN0cy9hdm9jYWRvOiBBZGQgaWdiIHRlc3QNCj4gICBkb2NzL3N5c3RlbS9kZXZp
Y2VzL2lnYjogQWRkIGlnYiBkb2N1bWVudGF0aW9uDQo+IA0KPiAgTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOSArDQo+ICBkb2NzL3N5c3RlbS9kZXZp
Y2UtZW11bGF0aW9uLnJzdCAgICAgICAgICAgICAgfCAgICAxICsNCj4gIGRvY3Mvc3lzdGVtL2Rl
dmljZXMvaWdiLnJzdCAgICAgICAgICAgICAgICAgICB8ICAgNzEgKw0KPiAgaHcvbmV0L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNSArDQo+ICBody9uZXQvZTEw
MDAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gIGh3L25ldC9l
MTAwMF9jb21tb24uaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMDIgKw0KPiAgaHcvbmV0
L2UxMDAwX3JlZ3MuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkyNyArLS0tDQo+ICBo
dy9uZXQvZTEwMDBlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzICstDQo+
ICBody9uZXQvZTEwMDBlX2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsN
Cj4gIGh3L25ldC9lMTAwMHhfY29tbW9uLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEg
Kw0KPiAgaHcvbmV0L2UxMDAweF9jb21tb24uaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3
NCAtDQo+ICBody9uZXQvZTEwMDB4X3JlZ3MuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
OTQwICsrKysNCj4gIGh3L25ldC9pZ2IuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA2MTIgKysrDQo+ICBody9uZXQvaWdiX2NvbW1vbi5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTQ2ICsNCj4gIGh3L25ldC9pZ2JfY29yZS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDQwNDMgKysrKysrKysrKysrKysrKysNCj4gIGh3L25ldC9pZ2JfY29yZS5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNDQgKw0KPiAgaHcvbmV0L2lnYl9yZWdzLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDY0OCArKysNCj4gIGh3L25ldC9pZ2J2Zi5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzMjcgKysNCj4gIGh3L25ldC9tZXNv
bi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKw0KPiAgaHcvbmV0L3Ry
YWNlLWV2ZW50cyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzMiArDQo+ICBody9wY2kv
cGNpZV9zcmlvdi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA1ICsNCj4gIGluY2x1
ZGUvaHcvcGNpL3BjaWVfc3Jpb3YuaCAgICAgICAgICAgICAgICAgICB8ICAgIDMgKw0KPiAgLi4u
L29yZy5jZW50b3Mvc3RyZWFtLzgveDg2XzY0L3Rlc3QtYXZvY2FkbyAgIHwgICAgMSArDQo+ICB0
ZXN0cy9hdm9jYWRvL2lnYi5weSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDM4ICsNCj4g
IHRlc3RzL3F0ZXN0L2UxMDAwZS10ZXN0LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMjUgKy0N
Cj4gIHRlc3RzL3F0ZXN0L2Z1enovZ2VuZXJpY19mdXp6X2NvbmZpZ3MuaCAgICAgICB8ICAgIDUg
Kw0KPiAgdGVzdHMvcXRlc3QvaWdiLXRlc3QuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI0
MyArDQo+ICB0ZXN0cy9xdGVzdC9saWJxb3MvZTEwMDBlLmMgICAgICAgICAgICAgICAgICAgfCAg
IDEyIC0NCj4gIHRlc3RzL3F0ZXN0L2xpYnFvcy9lMTAwMGUuaCAgICAgICAgICAgICAgICAgICB8
ICAgMTQgKw0KPiAgdGVzdHMvcXRlc3QvbGlicW9zL2lnYi5jICAgICAgICAgICAgICAgICAgICAg
IHwgIDE4NSArDQo+ICB0ZXN0cy9xdGVzdC9saWJxb3MvbWVzb24uYnVpbGQgICAgICAgICAgICAg
ICAgfCAgICAxICsNCj4gIHRlc3RzL3F0ZXN0L21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDEgKw0KPiAgMzIgZmlsZXMgY2hhbmdlZCwgNzYwMCBpbnNlcnRpb25zKCspLCAx
MDIyIGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IGRvY3Mvc3lzdGVtL2Rldmlj
ZXMvaWdiLnJzdCAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9lMTAwMF9jb21tb24uaA0KPiBj
cmVhdGUgbW9kZSAxMDA2NDQgaHcvbmV0L2UxMDAweF9yZWdzLmggIGNyZWF0ZSBtb2RlIDEwMDY0
NA0KPiBody9uZXQvaWdiLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9uZXQvaWdiX2NvbW1vbi5o
ICBjcmVhdGUgbW9kZQ0KPiAxMDA2NDQgaHcvbmV0L2lnYl9jb3JlLmMgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBody9uZXQvaWdiX2NvcmUuaCAgY3JlYXRlDQo+IG1vZGUgMTAwNjQ0IGh3L25ldC9pZ2Jf
cmVncy5oICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvbmV0L2lnYnZmLmMgIGNyZWF0ZQ0KPiBtb2Rl
IDEwMDY0NCB0ZXN0cy9hdm9jYWRvL2lnYi5weSAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3F0
ZXN0L2lnYi0NCj4gdGVzdC5jICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcXRlc3QvbGlicW9z
L2lnYi5jDQoNClRlc3RlZCB0aGUgc2VyaWVzIHdpdGggTGludXgga2VybmVsIHY2LjEgaWdiL2ln
YnZmIGRyaXZlcnMsIGxvb2tzIGdyZWF0IHRvIG1lLg0KUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWdu
YXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4NClRlc3RlZC1ieTogU3JpcmFtIFlh
Z25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPg0KDQo+IA0KPiAtLQ0KPiAyLjM5
LjENCg0K

