Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB546C48CC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:15:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewQK-0005ka-Od; Wed, 22 Mar 2023 07:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pewQE-0005XI-7R
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:14:26 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pewQC-0001H4-7g
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:14:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaHLGPFxhgD2zBjYR5Azh6TJDf7T1hivWc8Th22wROgfu1kLNMHZrdT5ed+5Fy/Viz9mfHuqSbaV9JVxf2hrCcRFNftobENacRNE0jjVCYCLtQQ/tHg7xuex+r09bDOXaVcHqAul0YestxyfOro1jrRzD/QnBQr7JU5H/iH9Ep6h0fsgoW0lHZHYCGDXHrO5kZE/aZ7UWiVOnAjgjnbp/Cwe+0c6WoYKaE87slHQXwTiGCM8F8LVkdcoBHfmm8IrXkKLnxss1MbIQhJsgQ0S+QELRGdshsiEfdUStdAy/6oDf9Ne1aZdjFgYRnbogQKq4502RLARi6hLhkTbuTXV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7jO1Mk2DIfzMLmnlX1M0ryVjLV4T0r8JTxC3VaA3bU=;
 b=fNFy9K143VkpnByE+5hzTJbS7lotQ6nitxbGOf3ELySEa+MYjCTzdRMIG9qDVOwqbHCryuBmQFu/a5QRxyxEUCsaW2en4hkxOtCCCYLrOtOwqtN3uTgMmGp3jQ/WGUgIhUt7Ueudo29lyZqVrxJvezlYHQlrr3m4+u2ZX8ySope+K6b/8F74zzHMnMtVyPsOyTslupEaU/6YM4xWF9rU4jSV3kNmaPjghn8klztDU341fHIsRzWzgs1rNSH8qCGuyMmN+4pSq5rLkymWaXXS3WLH5Q8Czfcdklfr2FeQHVhPTCAa2T/8dLVK8aFmQzbF/5dQq3Gv7sRxZT/4oapTeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7jO1Mk2DIfzMLmnlX1M0ryVjLV4T0r8JTxC3VaA3bU=;
 b=H2qHbijNHLmya1/o2e3WLSu/fZ5i+li1gSN2tTVkWtR79+0WITEVYaEN+/Vbl27X13GAzTelEcWYDJWrWE17sn3neH7L1g37+4OAzVUpSJxjZi3/HIp5cWx4xutLOUz2sJcTmSPBvkPcwk7mz98CiB47Jo84DwJkH++w69wWIEw=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2166.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 11:09:17 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 11:09:17 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH v8 2/8] igb: handle PF/VF reset properly
Thread-Topic: [PATCH v8 2/8] igb: handle PF/VF reset properly
Thread-Index: AQHZXKCMx3YS0jGNr0KCzwoNeaA6/68GmOOAgAAKlGA=
Date: Wed, 22 Mar 2023 11:09:17 +0000
Message-ID: <DBBP189MB1433E721097FA19D544B952A95869@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
 <20230322092704.22776-3-sriram.yagnaraman@est.tech>
 <40559c3f-9c42-3877-3e63-45c72cfa1dc6@linaro.org>
In-Reply-To: <40559c3f-9c42-3877-3e63-45c72cfa1dc6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2166:EE_
x-ms-office365-filtering-correlation-id: f06d1e79-30c1-4c94-c1b6-08db2ac5e0d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IeaocTyHdbbWRvbSudfhcSnz37ak08Xidgi/DXJN1ZTKMl4IZ1ZKelWInJSUj250/gBBL5b/lcw9mDmfI8kFBLvB7kVts1vlTFLCsXUB98zDS/FVBJ18raA+2dniIIuKid//GQHNzNa40RguqmyVtz+eu+FtG769dAzuqELFxHLTEH/BK7u6kl4b9yiq6wxukFVrLWz9jmj7tA8uV4bQctCWQ+hHzR3aEv/GcXtAomtlTYTXBC4KCNjOxU/mApE0tpcFSrF2nGF59DfxzYsZVqcuIW7volXAigjHVDVVX5hpgbA6h+Mjfjq/CidhmWWSl9fg0bzUpbZwAmsA9LfwCxCi2AAe7e9T9c79AYLxmoJVbJAY19lPxZJLVYZQ0miwY9tzCoT37eq1kfimFokuEaiuW1UmuhvViWnm4JEGMeBts9aVCeBmgbSE/1mmAKL3OFs5Uxvci156IN3sr/Q1J4/D6c/CMmb3yuqjNphrkxMtL8UGc6QpH7uFdXzUBU9PPEvbZN3Y7qBJZHj9ZeJHNKT/scYxDbul8jypJIrUbH3L4IDVlHNjdHjHtVjBMbdCRBabXSCKuYR4F7OhcRmpCknKAPrFaIyzQR5DL8DlAQUidiDgN9/Fn+1cspn3jFRLX9Lfc7c8EWP68J3E+ibXWSsJ22VEqy7dFBzZZCDxvW5tV7axobDxO3Cfka8N+7MphZsZ3FOBTo+MO3Elv9TAow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(39840400004)(376002)(346002)(451199018)(7696005)(26005)(186003)(71200400001)(6916009)(478600001)(83380400001)(316002)(64756008)(66476007)(66556008)(66946007)(66446008)(76116006)(8676002)(54906003)(6506007)(53546011)(9686003)(52536014)(41300700001)(8936002)(44832011)(5660300002)(38070700005)(122000001)(38100700002)(2906002)(4326008)(55016003)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVRTRHZpOVZVZythQTV3aFN1UHlJTXprbG80MXBiNGdaQy9jSHZBN0F5dFZ3?=
 =?utf-8?B?RHlnUHFLOHUzay94VWk4ZXQzMUc0cWxlcTEwR0dyeExMUXhyQkE2aDdDekdE?=
 =?utf-8?B?bzJkVzJyL1A4Rjc1QjM5dWE0YTRBemxnV2hoKzBjeXV1NXh5eDV6NFhkR0Rh?=
 =?utf-8?B?QjVVd1JFaFN0bGhJM3RMek9JcEJkOXFDTU1XWGRWemxxbzdTdEtXSVN1eDB0?=
 =?utf-8?B?V2k4TzdnK3g1T2FoOTMxbWZYT2haSEZFa0dZZEtZYW9hWFN0NkdWSXFXZEhs?=
 =?utf-8?B?b05HS1BFUThQSzFhWVROZ3RYYTdPbVVndmh0cm5aSnBRMkxTMGx6VXJFYlVC?=
 =?utf-8?B?MWVQbU5QWnNPZ0dTV3VDL3hzOFY3dEIwdXVwT2JpQ0dOQjMzcXp2aHk1a3B0?=
 =?utf-8?B?TWFwNWs1QzZtZ2NHbkl2dFFGZ0ZvV0ZzK0NRRFZ1ZytoUERWOXNoeGFHcUxm?=
 =?utf-8?B?SnA2dEFsNmpObFhXSXhwanQvanYyS2kxSnhDczlaS0lpN3JUSkRGUDdyUHIz?=
 =?utf-8?B?MTI3NVA4Zmg4VTJ5Tk45dE11cUYvTi9Ya3Zkc0ZjekdQR0cxaXVXTDRqZXlk?=
 =?utf-8?B?ZDQ0Zk10dUwxQ2x0QzA1MXRlZldqa0YrZUc2V2NZMWJPREVNcnVKVTVpZlFU?=
 =?utf-8?B?c2ZVQys5b1hjZ1ZmSTZFYlYzamd3VTl0dU5XQkczOWhPK1prTS8ySUwrTGlj?=
 =?utf-8?B?QlJoR0xFYi8xSU8zRWF4dmg3ckJ5a0RFN1RoeHdiZllDV1ZJWDFMOGM0NzIr?=
 =?utf-8?B?YVRzQWRJWG1mMU1ZYVFlS3JWQXorRmtFUDJGTjk0WkVTNFNEa0pLYlRFRHVz?=
 =?utf-8?B?ajRHSmlEVnJXdVE4WjZIUCtHbUVZWnYrelRucHRKMzdkYWJrN1ZoMnZsS01D?=
 =?utf-8?B?RDNoZjNiNW43cy9ScjAyUU1TNkNseDdkZVNLRnNyUUVHWXFjQVVEVVVjNkNX?=
 =?utf-8?B?d0tqQjNaQnpkVk5vVEV1VFR3UEpyK3lPcFVnd0phSTA0WEtPK0hWQUhTNkZG?=
 =?utf-8?B?NFhJMFZ0OFVSckRQOHhPYkYxMERmYWRRNHVKUFA4azB5THNmdUdwUFZ3STNR?=
 =?utf-8?B?Wms3dGs3MTVpOFVTYmp4SnJ2cFE4OG9JT0MzT1BnMVdMZ3YxZHRVaStzdWpG?=
 =?utf-8?B?Ry8zbmp1blhDZkRPdlU1RWhWaVhCTjR5MGlQNHg2enZic2Q0K1Vwamw4Z2pU?=
 =?utf-8?B?YkhjNHJvTkwwL0x3SXk0d3RuNWVVWmg4V0dxY0NBaDVndU8vWlhKS3JJQ0k3?=
 =?utf-8?B?eUpPTmtTTkRUL1hCbkFESk90M3FIUjcrR1ZyN2lyMGlNbTYvUEZWbXVNVVkw?=
 =?utf-8?B?RjBvZHRJSEh0aEk3ZW5nOWM0bWlETGlkRzhPd1U2ci9HN0tPS1YxdkdsU1Vs?=
 =?utf-8?B?WEdvcDVPYkdrUVBrU3hzL29FSmNqRlZwT3FaT0gyakZRN3lPcTJjbTN5TFpa?=
 =?utf-8?B?bjFmR3pKTHJ1VHp1ZldDMEFhK3VqZlE5ajNmTXFOUExvWmVweEhjQ1phcGhX?=
 =?utf-8?B?S0xRaE1LQlN3L2I2TGx1VUxCQjhiY3Y5MGNaR3BjU085TTVKelF1dWprbXh2?=
 =?utf-8?B?L0lxUGVtSm5Vd0Q2RFM1WkdpRmJUS25VbGI4YWNFd1dXQ0g1SEg4Z3g4SzBl?=
 =?utf-8?B?ZEdrdnhvSzV2ZTQzOW5GMUNIa09iMzMyeW5Iakk4UGhGNGUxeHVBZktHc0NB?=
 =?utf-8?B?T3FsaXRiZ0VxY09EOHBmQkF2aklON0krRE43VlJXcGNjMzNIYmhMOVl2UkdT?=
 =?utf-8?B?T1BqR1lUa2IwUFpkWlJxTFYwTjFrVTRqdEpkVWQ0RTZocWhsY2xJWXNBV0FH?=
 =?utf-8?B?MWdwT0srVGp5ZUNYU1dXd1BMelVxbEtVYm82aldXNWN1OVF3R3V4eVM2YWNV?=
 =?utf-8?B?a3hpOE5XaDMwT011czdYSGZyWWk2NDdqNXZSWTRPZkRuckdvSkZpUE9Fdmk2?=
 =?utf-8?B?cjVNWkR3S1FzK1IzV2FhaXBTYmNGVFZSYnFDY3QwNmczdWwwb1VlZk5GUXRB?=
 =?utf-8?B?dFVySFdKeHYzd3puWmk1c2NBU0tETHhNNTNMVDc3TmUzM0tFZlB1UUN6bStE?=
 =?utf-8?B?NEllc2UxWHRldDI0VWZtL041eGhPVEQ5MHRxcHo0cERUa296dWpsSEtBN2Ry?=
 =?utf-8?Q?TY/2uyBqzkfNjOX7zT1nyQSQP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f06d1e79-30c1-4c94-c1b6-08db2ac5e0d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 11:09:17.1723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yeWtTRfo+MEaprY1010LQe8ngzA1cyLsUtAYqkc5EtiOSQS1ZxnZMdlw/tTnNPHakfKlUpTZHV4ZS+dOQkySCB6yzY0cZ1ctBQDFkLokBjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2166
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgMjIgTWFyY2ggMjAy
MyAxMToyOQ0KPiBUbzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
ZWNoPg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBBa2loaWtvIE9kYWtpIDxha2loaWtv
Lm9kYWtpQGRheW5peC5jb20+Ow0KPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsg
RG1pdHJ5IEZsZXl0bWFuDQo+IDxkbWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsgTWljaGFlbCBT
IC4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+OyBNYXJjZWwNCj4gQXBmZWxiYXVtIDxtYXJjZWwu
YXBmZWxiYXVtQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAyLzhdIGlnYjog
aGFuZGxlIFBGL1ZGIHJlc2V0IHByb3Blcmx5DQo+IA0KPiBPbiAyMi8zLzIzIDEwOjI2LCBTcmly
YW0gWWFnbmFyYW1hbiB3cm90ZToNCj4gPiBVc2UgUEZSU1REIHRvIHJlc2V0IFJTVEkgYml0IGZv
ciBWRnMsIGFuZCByYWlzZSBWRkxSRSBpbnRlcnJ1cHQgd2hlbg0KPiA+IFZGIGlzIHJlc2V0Lg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJh
bWFuQGVzdC50ZWNoPg0KPiA+IC0tLQ0KPiA+ICAgaHcvbmV0L2lnYl9jb3JlLmMgICB8IDMzICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiA+ICAgaHcvbmV0L2lnYl9yZWdzLmgg
ICB8ICAzICsrKw0KPiA+ICAgaHcvbmV0L3RyYWNlLWV2ZW50cyB8ICAyICsrDQo+ID4gICAzIGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2h3L25ldC9pZ2JfY29yZS5jIGIvaHcvbmV0L2lnYl9jb3JlLmMgaW5kZXgN
Cj4gPiA1OTYwMzlhYWI4Li5mZTZjNzUxOGU5IDEwMDY0NA0KPiA+IC0tLSBhL2h3L25ldC9pZ2Jf
Y29yZS5jDQo+ID4gKysrIGIvaHcvbmV0L2lnYl9jb3JlLmMNCj4gPiBAQCAtMTg5NSwxNCArMTg5
NSw2IEBAIHN0YXRpYyB2b2lkIGlnYl9zZXRfZWltcyhJR0JDb3JlICpjb3JlLCBpbnQNCj4gaW5k
ZXgsIHVpbnQzMl90IHZhbCkNCj4gPiAgICAgICBpZ2JfdXBkYXRlX2ludGVycnVwdF9zdGF0ZShj
b3JlKTsNCj4gPiAgIH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCBpZ2JfdmZfcmVzZXQoSUdCQ29y
ZSAqY29yZSwgdWludDE2X3QgdmZuKSAtew0KPiA+IC0gICAgLyogVE9ETzogUmVzZXQgb2YgdGhl
IHF1ZXVlIGVuYWJsZSBhbmQgdGhlIGludGVycnVwdCByZWdpc3RlcnMgb2YgdGhlIFZGLg0KPiAq
Lw0KPiA+IC0NCj4gPiAtICAgIGNvcmUtPm1hY1tWMlBNQUlMQk9YMCArIHZmbl0gJj0gfkUxMDAw
X1YyUE1BSUxCT1hfUlNUSTsNCj4gPiAtICAgIGNvcmUtPm1hY1tWMlBNQUlMQk9YMCArIHZmbl0g
PSBFMTAwMF9WMlBNQUlMQk9YX1JTVEQ7DQo+ID4gLX0NCj4gPiAtDQo+ID4gICBzdGF0aWMgdm9p
ZCBtYWlsYm94X2ludGVycnVwdF90b192ZihJR0JDb3JlICpjb3JlLCB1aW50MTZfdCB2Zm4pDQo+
ID4gICB7DQo+ID4gICAgICAgdWludDMyX3QgZW50ID0gY29yZS0+bWFjW1ZUSVZBUl9NSVNDICsg
dmZuXTsgQEAgLTE5ODAsNiArMTk3MiwxNw0KPiA+IEBAIHN0YXRpYyB2b2lkIGlnYl9zZXRfdmZt
YWlsYm94KElHQkNvcmUgKmNvcmUsIGludCBpbmRleCwgdWludDMyX3QgdmFsKQ0KPiA+ICAgICAg
IH0NCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCBpZ2JfdmZfcmVzZXQoSUdCQ29yZSAq
Y29yZSwgdWludDE2X3QgdmZuKSB7DQo+ID4gKyAgICAvKiBkaXNhYmxlIFJ4IGFuZCBUeCBmb3Ig
dGhlIFZGKi8NCj4gPiArICAgIGNvcmUtPm1hY1tWRlRFXSAmPSB+QklUKHZmbik7DQo+ID4gKyAg
ICBjb3JlLT5tYWNbVkZSRV0gJj0gfkJJVCh2Zm4pOw0KPiA+ICsgICAgLyogaW5kaWNhdGUgVkYg
cmVzZXQgdG8gUEYgKi8NCj4gPiArICAgIGNvcmUtPm1hY1tWRkxSRV0gfD0gQklUKHZmbik7DQo+
ID4gKyAgICAvKiBWRkxSRSBhbmQgbWFpbGJveCB1c2UgdGhlIHNhbWUgaW50ZXJydXB0IGNhdXNl
ICovDQo+ID4gKyAgICBtYWlsYm94X2ludGVycnVwdF90b19wZihjb3JlKTsNCj4gPiArfQ0KPiAN
Cj4gT3J0aG9nb25hbCB0byB0aGlzIHBhdGNoLCBJJ20gc3VycHJpc2VkIHRvIHNlZSBhIGZ1bmN0
aW9uIG5hbWVkDQo+IGlnYl92Zl9yZXNldCgpIHdoaWNoIGlzIG5vdCBjYWxsZWQgYnkgaWdiX3Jl
c2V0KCkuDQoNClRoYW5rcyBmb3IgdGhlIHBlcnRpbmVudCBjb21tZW50LCB3aWxsIGZpeCBpdC4g
T24gUEYgcmVzZXQsIHRoZSBoYXJkd2FyZSB3aWxsIGFzc2VydCBSU1RJIGJpdCBvbiBhbGwgVkYg
bWFpbGJveGVzLCB3aGljaCBzaG91bGQgaW4gdHVybiB0cmlnZ2VyIGEgVkYgcmVzZXQgYWZ0ZXIg
dGhlIFBGIHJlc2V0IGlzIGNvbXBsZXRlLg0K

