Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C5E6EC919
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:35:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsbH-000149-VM; Mon, 24 Apr 2023 05:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsbF-0000yK-8d
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:35:09 -0400
Received: from mail-ve1eur01on0712.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::712]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsbC-00081z-Lv
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:35:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXZE9IYTO8W2IDslgjBnO6ZW1aVRTDhUtIgmTNObzilA74uRCe0UWA3gK5cqg+G2HcDQk2MVa4NhOmhWd1uMGSmp0T9c8dPGJC/cR8Ns9lJa4xytPBlmGf/31CsJL8KwfnE7lj8oxNLdUZQMZ/irzwOlemQLP/ncwAf6HMmzXw05BPtmgSDT+h8VHhTcqFdHoc9ef1I+Sfqk0wUa+0EJgsLZDW25atw8V2xy1B9QZllI/GUI/2x+lNpGz4kPk3nGpBvP68Sjw+FQbPIt7cG5AuWKRlN0QjTbJTDk8PAjkkYlwVM+eg2wK/eogTk6YCCN52NU4+FjRGw3EIK1DfH5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m/+lY9KWXSZgYCvKbfGOuZudoOUhp9Jvo+YdUaaxDw=;
 b=Uwei2jvH47TxVfmCHJy3IL66U2C5sm5SrvHXGtS4Jzj/I5VP4e0JeuXSSy11lWeEUXhWxuIOS9SHUPxQG4BWWAyRMGCRLoVMxfLngFL/W9vYlxCNbftnrtA8v9Uwni8LRs6H75ph6J3UQODx34lEaPBUkRDK6lJ+EXexnldOLRSxN1yvBoOJFxSFVpDy5wuCFRFxDl0YzEpGIvkn37st7kBB/s30Gx5lCMReUsIICHvvjOeYsIOT2z0z+JaNDqLvaBHyllWXUtZz8CQMRC6jzzZU6P+WRWeNDFJYsS3QPq4q/eoXhvN7U0w4nl+/539M2m9mfuqhQk/T+DAMUhC1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6m/+lY9KWXSZgYCvKbfGOuZudoOUhp9Jvo+YdUaaxDw=;
 b=I6y2DFR6qoodqpg7TbVZLidOFwijCDArZ9xcSg0euHfid1pZIBtWpgI4Gmp5j0yHPF5Jif6c+sUIircdnmtUKK7uLGFDTNm3tFlS9Ny0bWfOORyBnXyPKYH8PYpBOn7OU/X7cD1qID6yd2QYBYcwDIvZS0C0kG6Vakw0MHYB/pE=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2437.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:35:02 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:35:02 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Tomasz Dzieciol
 <t.dzieciol@partner.samsung.com>
Subject: RE: [PATCH v3 40/47] igb: Implement igb-specific oversize check
Thread-Topic: [PATCH v3 40/47] igb: Implement igb-specific oversize check
Thread-Index: AQHZdZsECMpqhoI3r0SfKtE1s1FnLa86NM+w
Date: Mon, 24 Apr 2023 09:35:02 +0000
Message-ID: <DBBP189MB143301DF748A8C78B1CDFFD895679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-41-akihiko.odaki@daynix.com>
In-Reply-To: <20230423041833.5302-41-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2437:EE_
x-ms-office365-filtering-correlation-id: b11e0288-9345-49de-6e64-08db44a72dc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /zR7yfGEbIixIQJRR799XzGiTBNfLwnhqpUupZMYaCGIt7DMu88foOkyc9xV2sLp4oHrtrOwePKcsZX5yZUEfwCtX6UJwzsuLQucj2ZEt4k2kswWHbJBK19qAwr22qsIJ+efcKV1PlJuKWZnu+2HlrBZI814YNHcpe1CUYx8rnRBgRTjC+HxNReOUSj6GXMdc1iOJffRez8YezNVyZwviPAHMDTJFvJ4bCP3HMjxgTJ+gKFVs0C68ZERD20Mm97y9Tr8vGEV2ShmqMerxLSLGDGpY+YkR6PlHSZ6+1g9yBNwwxTl3JP3kLMRDc6CIG30hKzackhNAGY1OnjYEh1Y+k2JH/j6BV/7XQriT7z49urM3metJ5w188uyejA8KNmrYsylUC68GZhF9XD1CQyis2tMjod2E8dxrRn8WUBNzqTuvpjNLaCyQayqi0R/Cj1xsBfY2p408cx4++2QO/rtqjBA01p5KIEusW6TKNpcHF1gQQxGcX+bfkUk999lnpbT5pwWDOuc5cgA0vPury8PddcvcuQHrCzRw1ZuLJmOv1Z4HV8uR2xTQKtqhH0kPvue8A1isga9kSKx+LETZhe0wUh+VaWFTbXYpeUqaZItIhlkZWKr7U0fdERW+SnM7l6s
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(346002)(39830400003)(396003)(451199021)(4744005)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(52536014)(44832011)(7416002)(8676002)(8936002)(5660300002)(38070700005)(41300700001)(33656002)(86362001)(55016003)(9686003)(26005)(186003)(122000001)(71200400001)(38100700002)(478600001)(7696005)(66574015)(83380400001)(6506007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW5HSm00cjVBOUhlR28yWWtEbWNPRGRKWitydWxTN3hqbUZsRHduNmpNQVBH?=
 =?utf-8?B?T1NOeXpUdTVpT2s2aUxad29aeEFyY3Q4Y1FDNWh4QVRQcjFkS3psMnVSNllC?=
 =?utf-8?B?WG5ReXM2eHVkTk81a2RaRlJQV3p6cmVhdHB4dHNIaGlHTmlCcnlCOXRWdUpi?=
 =?utf-8?B?VWFGZzNFeWVVSERPWlRYOHVPZFZ2VkJCc3I5NXBEejl2d2VYMXVtVk90djdH?=
 =?utf-8?B?cXFlS3FzWm9vaWRKam43RDUyVGZCWW5jcTBYb3N4QWc5M3JwY3VpWW1qcWNI?=
 =?utf-8?B?MmlzZlNSL0hXc2I5eVZ2Qzd5QnQ4N2xoV3VBcUFmZGxJeWRKNFNyUXdHRWVV?=
 =?utf-8?B?aW03b2FEc3NjT0Z4enJ4T29IVkNQNmxaRDhxMU10KzcxSnlnaE5kMHhHOU9Z?=
 =?utf-8?B?cEFKSTlLeVc1clhieUdIZlBOVDdURFNmM3NYbjZWMG9jN2R1K2tOUGlxMEZY?=
 =?utf-8?B?Z3NURjdnLzFLYjh0TlVDTkhIbnZFVW1PTnh0WFpmenhMNGFZU1l3NytGWkFE?=
 =?utf-8?B?azQrT2ptSHpnSWhkUno2aWx3RHhOODR2U2JOdFpsZmViTW9BZUpNcmlJZUlF?=
 =?utf-8?B?U3lTalpVUHdvbFBzTnN2R2p4aEkrTW1iMVF4eVdDV0x0YWw5eGI2SFhLdENw?=
 =?utf-8?B?UVhRRzRuVGlmaU1ZTVhWNW15WkpLdldTSnpMUklUZFd1TEpZVnFqdXAxNDNn?=
 =?utf-8?B?N1loaUxaWEVIeC9FMVI2anF5V2Vjb0tZRklRRG9oWXdkYVgwUHFwRFJwczQr?=
 =?utf-8?B?a0xpZWZPUlE4dHBncU9tVU5taWlFVWdzQlZHVGdFTzhFdGlodGtXcWRGejZS?=
 =?utf-8?B?MTFqbGEvaUZGcjYyYmhHVVoxYVJOOHVpME8xOUxYam1wNFRKVGV1UVdMNjRC?=
 =?utf-8?B?anZUR1NmL0pVL1dxRStiQ0U2Znh1bXVTS2tjNGszT1VZSlR4c1pZc0lBeWZ1?=
 =?utf-8?B?VHVjWDVPZkJKTlE2SENNaUxlWnpRa3lSYVZoWU5BK0ZiRnV2c3VjWUR1V3Ew?=
 =?utf-8?B?ZzJWM1h2UDVWUUZMOStkWS9nM3pWSlNIeis0cFZmam84c2ZlOG5UanlEemJ3?=
 =?utf-8?B?TjhRR0tkSFhlMkVQaDYyR2tla1Rjbm1DaHN2QnlSVmxBSktIQzNNL0hBd2o0?=
 =?utf-8?B?QzlDZHFEbjNRRG9xQ0xadndxYlYvWmVXem9RQ3FLdmt4TVJzSExrdVk5UkFR?=
 =?utf-8?B?Um4zRjFhWTNidzVEeXhPUExKV1hKYVhRR0NCRFBYbk1lcWlGTWIzdXJ4Z1da?=
 =?utf-8?B?WHNpTUprWCtzUkpuaW5BTnBQOXdRYzBsVUlodTI2QlVYR3BEajJvd0U3cGx3?=
 =?utf-8?B?NEdGVXJHU1RnMjMzZ0xoMlB4dWU3d041bHVvYWIzQWpYVHlMSWNLYS8wejlx?=
 =?utf-8?B?WWVMY0hIY1h6V3BjOVJtVjRjOExJSVYzTnc3NEJ0UVBVenBJbFhUbFB5bmk4?=
 =?utf-8?B?VkRLT2tFSGRZakI4ZGl2TnlDTWVUTTlRcHNseU53RkYySmlZd1BKdktTTUli?=
 =?utf-8?B?MXZJaXRpcjF1cTA0cU5WRHRNV2JEUWNocHJ6NDQybmpBR3QxWHY5a25XRDJG?=
 =?utf-8?B?dFNYTmNTclBxaWdlMmNVOWg2cUpja2VobFhqQ2pJb204S09tamVSd3RiUlNK?=
 =?utf-8?B?NXd0QmdPcmZyR2VSWkhZTDJkU2ZxUkxGTlp1T2ZxRmx6UkpmMFY4aGVTQUt2?=
 =?utf-8?B?bmR0Mktaclp0M0N3VEFkOGZSTlBtTWptSWpkeWNhak5QSHFHc2dlY3VNTjAy?=
 =?utf-8?B?enhtU1JFUHlacUhJc1hPVTVSSkdJVW45RjdEdVlQSkk5bGpISDdaVnJwcjNt?=
 =?utf-8?B?bjNqZ0lDRmVXaGVEbUk5bmRITnFtMjFGVlpONjZQbUxQbXNrUmduOEx1bnEx?=
 =?utf-8?B?Q2tSZ3JVdFpMSlY2SGJneHRaL1YyWVRZNVN6UWo3eXJXYW05ZitJZmd0bmM0?=
 =?utf-8?B?bjVGd2RNSVc4dkROc2RvaUxLKzVGSER5WmtkN3QwalgwRVFOU1FZSXA2ZTcr?=
 =?utf-8?B?QmNuL1E0ZGZ5TGJwYUtXVXNTZlNucEZNdTV2cnJIZHRmUjY1cFJGWXB4OENu?=
 =?utf-8?B?MWdlYXUrazNtNmlMVC9Ia3BEQ3k4V1ZtVkJnN1cwZnV5K3JNZ2tsaG9HcVhS?=
 =?utf-8?Q?0M3uh4vCywR1GkyZN3xvJcIkb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b11e0288-9345-49de-6e64-08db44a72dc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 09:35:02.0924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiXvDlQtrvYMT36xIIQ3wQbVySDJL9b5NFpd8nsoRbF+yLK658ToyKQBvPs7RUecZ0DBwLC+MseQZVDoJxWlf+lNfKwMgiHpCVxV1jJ5H/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2437
Received-SPF: pass client-ip=2a01:111:f400:fe1f::712;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogU3VuZGF5LCAyMyBBcHJpbCAyMDIzIDA2
OjE4DQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
OyBKYXNvbiBXYW5nDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFuIDxk
bWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsNCj4gTWljaGFlbCBTIC4gVHNpcmtpbiA8bXN0QHJl
ZGhhdC5jb20+OyBBbGV4IEJlbm7DqWUNCj4gPGFsZXguYmVubmVlQGxpbmFyby5vcmc+OyBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Ow0KPiBUaG9tYXMgSHV0aCA8
dGh1dGhAcmVkaGF0LmNvbT47IFdhaW5lciBkb3MgU2FudG9zIE1vc2NoZXR0YQ0KPiA8d2FpbmVy
c21AcmVkaGF0LmNvbT47IEJlcmFsZG8gTGVhbCA8YmxlYWxAcmVkaGF0LmNvbT47IENsZWJlciBS
b3NhDQo+IDxjcm9zYUByZWRoYXQuY29tPjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0
LmNvbT47IFBhb2xvIEJvbnppbmkNCj4gPHBib256aW5pQHJlZGhhdC5jb20+OyBxZW11LWRldmVs
QG5vbmdudS5vcmc7IFRvbWFzeiBEemllY2lvbA0KPiA8dC5kemllY2lvbEBwYXJ0bmVyLnNhbXN1
bmcuY29tPjsgQWtpaGlrbyBPZGFraQ0KPiA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjMgNDAvNDddIGlnYjogSW1wbGVtZW50IGlnYi1zcGVjaWZpYyBvdmVy
c2l6ZSBjaGVjaw0KPiANCj4gaWdiIGhhcyBhIGNvbmZpZ3VyYWJsZSBzaXplIGxpbWl0IGZvciBM
UEUsIGFuZCB1c2VzIGRpZmZlcmVudCBsaW1pdHMgZGVwZW5kaW5nIG9uDQo+IHdoZXRoZXIgdGhl
IHBhY2tldCBpcyB0cmVhdGVkIGFzIGEgVkxBTiBwYWNrZXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+IC0tLQ0KPiAgaHcv
bmV0L2lnYl9jb3JlLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4g
DQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
ZWNoPg0K

