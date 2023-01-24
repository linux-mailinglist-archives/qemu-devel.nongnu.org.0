Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B7679388
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 09:55:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKF4G-0003Qs-NM; Tue, 24 Jan 2023 03:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pKF3y-0003QF-BK; Tue, 24 Jan 2023 03:53:55 -0500
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pKF3w-0002vL-3j; Tue, 24 Jan 2023 03:53:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkH4IjUoHO6R9ONTErBpD9m8Q3Ql/ixvbqNLVW2/uIQIbuDDA5j4ob/OdTKD2YZAy3gqBx61vVHDyqdhqsDNkQeiz5U8cBzmKmRIPv4Oh4bCGHwHZzMlEUhoTMK2osoe+Aog6V+hFoxyGtKhKRFvJ46RFLMFZxWujdb/eIvIcRirB75oTBsICFgEdkpDaYAPZWZUDKBySueoUdBBq2lU8zV3iDBMF+KY4gD2CyjCtQokLgME86SE3iBiTVl3VUP1ug+3LZyHkKCbUT2FeXdKAV35DYxLLz/9i+4JwsTCpf8rqUiwKFlL+6ZJf8MeIkP1vOl5b0yI1NeSJpWKxTQ3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwoJze3qppFURH23dUL7iWw+s8FiZLWpCkU5vCqKM7c=;
 b=YT4Qz6O9iPQTHdA73h71gxPq4e+05vTLAbFtpvnQm3brShcvwVSNTghVqjzDdYDubcbmjqaPGEF/VpGcR+mUcyYYRqQ7VhIWCaBjHTTuzPswCJiw9faaMv24gt+6EICQ3xhQxdzqElxHTL4dpW0fmpFEmmD830CIgZbwPfcHxi8rLr4kBhx2BBSDcpTwpwEeagOi7l9QNiATPbSgVXPHjy9OFkALwO8hw47cY28JeO2nmoaBw0o7IbMWahmm2zIbp32NbvUq6xUXHexK/SwsO62EcnXeqySRSbBzYH1j1xQpvTnddOFZWQJfpKIGAtIH3Po8ZuSQeqUr6Sd2hgki3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwoJze3qppFURH23dUL7iWw+s8FiZLWpCkU5vCqKM7c=;
 b=h8b0SDe2tKtrMiMdqO7begmB7cNmyfgz7uyjqOSBxLgN/0U+hiAAu8Hrrg2dCDDbZMEWnlL40MsJxgW//sCKiryu95hc9IcGkHt/r1H8b3FSN0cDDUQUuY6WN1kmuhETv+hlimlLv9C1y61KMy7RPf0ACglU5z8zKAXN3XuD9EE=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0825.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 08:53:45 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 08:53:45 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
CC: Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "devel@daynix.com"
 <devel@daynix.com>, Yan Vugenfirer <yvugenfi@redhat.com>, Yuri Benditovich
 <yuri.benditovich@daynix.com>
Subject: RE: [PATCH v2 00/13] Introduce igb
Thread-Topic: [PATCH v2 00/13] Introduce igb
Thread-Index: AQHZL6/W6Z9pTAcNzEeKP3pMyZgBPq6tQfQg
Date: Tue, 24 Jan 2023 08:53:44 +0000
Message-ID: <DBBP189MB1433ACFCB19263B4CD0414AF95C99@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
 <CACGkMEvAwrfUwQVAj0qZFy+Wib5FSBwayyN_qGbZ8edNwB_18g@mail.gmail.com>
 <afbd035c-e275-4600-d2b8-7445008ebbd2@daynix.com>
In-Reply-To: <afbd035c-e275-4600-d2b8-7445008ebbd2@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB0825:EE_
x-ms-office365-filtering-correlation-id: e8055b55-43e2-471f-043c-08dafde87fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QWYhnKfXkfa9rRJmb2fUVJ57cVR7s4qcKdL9SWs+VJAozVO4mtpQ9neZPTSKcVB5yXLcnYNzbr/kCmSRZ9wVQm3oTjEo6qJcaOb2ExTGv1j/99ETY3glG7AAoNUgGnWBZRqMcAWsOEzA6jt0LK7ug/E7jQj2FWs/8CVXK39ul5kJr2M+J79XalNBMyxyDAgve5sUAygy0BpHLwxOfwhibMYoZg+ALSrAAOIMkJ2sxQNDEmk8oq4lLhvIQT09EKngy+bx8SfuQe58SToTuvu8crrQPPs1A9v1ZcvE3GsIqsSveHaqgulS+tcmdbUWIkvsBakTXHYW4boLjtNWYWywXubEkdGaNCC6/7hXllCOnW33/Jwxv8d02/y9WWGGvOjIeWrAmqTC8KSzKf/PTb1Vx/t3tYL8nvJ0DDkpkfySlqZZWCEcmMlQUgGTdLbIpvfOAZXGM9AKHYVIIUVfk1bOEH4i1SCivuWBZhL2xFoJ/Uwgv348z0ehYU2xbCAVnVQTItKdtEkioLgQKQsABZPpjj6uc/JGwDXlW5jPPrWLLN00vgma3gwYvxZ/AHdiuCKw7bi3DIr1PbDqWv/cg8KL+MrK5mkuFmkTzZgTyN6Yvu+f38X8VovaUp/hAaCBYflll3FrTr3qavhA0uj50q4wcq+45oF6Vzw7cNZ7rg16PMST7jg5G0kOxjUeVvMPP+PYU8uct7rgGfTi77w7ALqrAtix/a0mbz9iibNbdaYUxCQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(376002)(39840400004)(396003)(346002)(451199015)(52536014)(8936002)(5660300002)(7416002)(44832011)(2906002)(41300700001)(83380400001)(33656002)(38070700005)(86362001)(55016003)(122000001)(38100700002)(71200400001)(110136005)(9686003)(54906003)(478600001)(26005)(186003)(316002)(966005)(7696005)(66946007)(66446008)(66556008)(64756008)(66476007)(4326008)(66574015)(76116006)(6506007)(53546011)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0s0M0FpQW1rb1VCdDlnc0NQeVRYTWF6N3Z3V2ZWMzBUeERScEEvOUNoenMy?=
 =?utf-8?B?MVV2TTJCS0FSNmo3RmxNMXJyL0dqT1NZc0dpSk9DTTduTysyT3lka0t6VmtB?=
 =?utf-8?B?TGxYOEdTOWxPbzlJUjF6amNiNWVwRk1meUZQc3RnV20zaDd2NldEbUduTytS?=
 =?utf-8?B?Mng2NU5kaWd3Vmo2cThxZHpCOExMbVprb1dORWpkQ1BrR0VVYTZnS2w1cXRm?=
 =?utf-8?B?alZYV3lyTkRoNUdwUjZNZDlpcmx0alZmVHkzYXVVM0RabDRyc2RsNDFmQ1FC?=
 =?utf-8?B?ZEdFYjFSVi8yTlVpWVFLSFJkUGJ2a1p3cDNTK1E5cHlISWpvekJmMjFKN2Z2?=
 =?utf-8?B?MHg0cGdIU0lSWXJEaG5qZmoyb3dBVWFmSUFpd2FWWkVXaXp4VVROckJOdFBD?=
 =?utf-8?B?SG9IVXVydXJSNEJJQjYwQ0p2TnFCVUVrd1pJajZnNW5NUTRDR0FSNkdRZGQw?=
 =?utf-8?B?dUF5c09MNVF4WkdEemNrcnNQS1Ftb2E4SWUwZ1AvUHVFRTQxOXQxTjR6YXFj?=
 =?utf-8?B?aHZ3ZWZRNmh1OTFnTmNxUS9EcWYrWDdybWNoeU8yR1dNSkpGQjlPbGlZZDFM?=
 =?utf-8?B?TThZME50Zy9OR1FudldMNDIydmcvUW9CaDZiNFM1MWRycytPd05YV1lYdlFH?=
 =?utf-8?B?ejBnd1p3Vi8yMVUwcElRWWxUSXFnTm03SGpZMmdGTU9QL3Z3aks3VWdCSTdy?=
 =?utf-8?B?eEFCQXAxWmF3RHU4b050U1pxL0NWSkxXZWZIdFJKbkZEY0E3ckx3cHZZTXdn?=
 =?utf-8?B?S2ZVL2VTK09GSnlxbUc2cWFHM0ZYS3l1bzJUWTBtTUtIVTVSd0VnVzFOaHFG?=
 =?utf-8?B?ekl6YmZpSFhMUXkyS3V4T210c2Z1dTI0d20zbSsvY2ZrUmlNYjlUeGY4dXlj?=
 =?utf-8?B?VFBrdldkdGFzNmE3V2xlbTRWUVRhdTd1K1YrbnVwMUJsbHRkZ0NKREJHUWJv?=
 =?utf-8?B?ZFQ2R3hISGROWDBOMkllcC94OGE4Zkw3QmpyeDNkRjNnakJVdk5XZ2R5alBK?=
 =?utf-8?B?Z1hPd2pjM1JKeEVaNEVmTG4rdDcwZ0pqYnlKKzRXV1hCT3RINSt0OW9oRDBq?=
 =?utf-8?B?M3pkeU9PVkJWNlpNckVOOFdCRzlJWkdsZXJQbmlBbFN0ZHJkRnYrL1BjTGVU?=
 =?utf-8?B?YW4ra3BGYlFsNGJ6c0FjR3VWR1EvUFE5QlJ4VGRwWTlRY3d2NFZQd29QdEc3?=
 =?utf-8?B?czRSOTAxR0lYblg1akoxYk5jd2pBNVRIalluK29zUCtpcWtRUHpVZnl3UzJq?=
 =?utf-8?B?NloxUjExVHBmNVV1T3l5citiY280cENNbmdWQzhDdmFTSWRhOTYybE96THo3?=
 =?utf-8?B?MW4rWEtuNDRHekEraUtBZXVzcERnWk5GZk5obGk1cmMzd1l6UWlOWGQwZUg3?=
 =?utf-8?B?eTgzV3BuZjZvVFRYNTN3cFh1TlNSTmRMcTZycm5kQUtqcXFqbHZVdzFaTE9P?=
 =?utf-8?B?NGMxdUZhandzcEt6NG1tUjhid0lhVjRaVlRPNFVQY1dXNzV0OTdCbjF3NFlL?=
 =?utf-8?B?aXAzdUR6Q3RINU15OFhNTHlvNDE2cXhscWRWVmo3ZFFNWllPanAxRDI4ZXJw?=
 =?utf-8?B?NUF4Mk9pZkFLOUlaNmxkaVIvUFhPMHc0TGtZSU50ZElIbHVxdndWN0lPSk90?=
 =?utf-8?B?SGRhMUliS21MVGRPeTVmRmdnTVRFTldzdUJ3d2ZuWkdFQ1dKYVRVNEM5TW9m?=
 =?utf-8?B?TXhPZ0t5Y3ROQlBMWUdRdUtBQWdsaysvLzJmWnJVY25NbWtNeTIvZWtSVkFo?=
 =?utf-8?B?MUhueE4wZ1FXVWRDTW1nMFhSaFlJMjFKNWh4RUdIaTY4N0owRGNtMDhUVkF0?=
 =?utf-8?B?bm1YYXhHUTRabWpKZjRUVlJqV2kvOE03REN4NXNVNEd1UkdXRmRoTUlJdUJC?=
 =?utf-8?B?TDYxK3FGWUN0SGlBdmtaeUFpTDZyWjZIckphQ2dZUUdXUEdWUXVHWWhQQnRX?=
 =?utf-8?B?bE80bDZWZEhqbVhudTY0N0JnalJzeXFXREJZSk5rc0pXNlN6VjAyQThONGRv?=
 =?utf-8?B?ck1pZEJ6T2tNdlErNW93a3hZQ1JYY2NDSHJjajdDaFZYN3ozcTBGSkgyTkNn?=
 =?utf-8?B?M1d4WHpuM2RtcnBQOFYvK2ltZTNxQkZvLzAvSkJlM1QyeCsvR21hQldmaWdX?=
 =?utf-8?Q?UO7LzgjS7ut0y3WkxcljBgaCj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8055b55-43e2-471f-043c-08dafde87fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2023 08:53:44.5544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hw18cb7Qzx3cLXuo4hNckdFh6wx+w4HjKHMOC9n7kALPn34stRcCnnZEp0xxJbjLIhKgy2Xgyghlm+GO67lMWkhOYmfIKxT9g12c4JeDrys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0825
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogVHVlc2RheSwgMjQgSmFudWFyeSAyMDIz
IDA1OjU0DQo+IFRvOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgU3JpcmFtIFlh
Z25hcmFtYW4NCj4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPg0KPiBDYzogRG1pdHJ5IEZs
ZXl0bWFuIDxkbWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsgTWljaGFlbCBTLiBUc2lya2luDQo+
IDxtc3RAcmVkaGF0LmNvbT47IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZlbGJhdW1AZ21h
aWwuY29tPjsNCj4gQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsgUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kNCj4gPHBoaWxtZEBsaW5hcm8ub3JnPjsgVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcw0KPiBNb3NjaGV0dGEgPHdhaW5lcnNt
QHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+Ow0KPiBDbGViZXIg
Um9zYSA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5j
b20+Ow0KPiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgQWxleGFuZGVyIEJ1
bGVrb3YgPGFseG5kckBidS5lZHU+Ow0KPiBCYW5kYW4gRGFzIDxic2RAcmVkaGF0LmNvbT47IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT47DQo+IERhcnJlbiBLZW5ueSA8ZGFy
cmVuLmtlbm55QG9yYWNsZS5jb20+OyBRaXVoYW8gTGkNCj4gPFFpdWhhby5MaUBvdXRsb29rLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS0NCj4gcHBjQG5vbmdudS5vcmc7IGRldmVs
QGRheW5peC5jb207IFlhbiBWdWdlbmZpcmVyDQo+IDx5dnVnZW5maUByZWRoYXQuY29tPjsgWXVy
aSBCZW5kaXRvdmljaCA8eXVyaS5iZW5kaXRvdmljaEBkYXluaXguY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDAwLzEzXSBJbnRyb2R1Y2UgaWdiDQo+IA0KPiBPbiAyMDIzLzAxLzE2IDE3
OjAxLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiA+IE9uIFNhdCwgSmFuIDE0LCAyMDIzIGF0IDEyOjEw
IFBNIEFraWhpa28gT2Rha2kNCj4gPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4gd3JvdGU6DQo+
ID4+DQo+ID4+IEJhc2VkLW9uOiA8MjAyMzAxMTQwMzU5MTkuMzUyNTEtMS1ha2loaWtvLm9kYWtp
QGRheW5peC5jb20+DQo+ID4+IChbUEFUQ0ggMDAvMTldIGUxMDAweCBjbGVhbnVwcyAocHJlbGlt
aW5hcnkgZm9yIElHQikpDQo+ID4+DQo+ID4+IGlnYiBpcyBhIGZhbWlseSBvZiBJbnRlbCdzIGdp
Z2FiaXQgZXRoZXJuZXQgY29udHJvbGxlcnMuIFRoaXMgc2VyaWVzDQo+ID4+IGltcGxlbWVudHMN
Cj4gPj4gODI1NzYgZW11bGF0aW9uIGluIHBhcnRpY3VsYXIuIFlvdSBjYW4gc2VlIHRoZSBsYXN0
IHBhdGNoIGZvciB0aGUNCj4gZG9jdW1lbnRhdGlvbi4NCj4gPj4NCj4gPj4gTm90ZSB0aGF0IHRo
ZXJlIGlzIGFub3RoZXIgZWZmb3J0IHRvIGJyaW5nIDgyNTc2IGVtdWxhdGlvbi4gVGhpcw0KPiA+
PiBzZXJpZXMgd2FzIGRldmVsb3BlZCBpbmRlcGVuZGVudGx5IGJ5IFNyaXJhbSBZYWduYXJhbWFu
Lg0KPiA+PiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAy
Mi0xMi9tc2cwNDY3MC5odG1sDQo+ID4+DQo+ID4+IEl0IGlzIHBvc3NpYmxlIHRvIG1lcmdlIHRo
ZSB3b3JrIGZyb20gU3JpcmFtIFlhZ25hcmFtYW4gYW5kIHRvDQo+ID4+IGNoZXJyeS1waWNrIHVz
ZWZ1bCBjaGFuZ2VzIGZyb20gdGhpcyBzZXJpZXMgbGF0ZXIuDQo+ID4+DQo+ID4+IEkgdGhpbmsg
dGhlcmUgYXJlIHNldmVyYWwgZGlmZmVyZW50IHdheXMgdG8gZ2V0IHRoZSBjaGFuZ2VzIGludG8g
dGhlIG1haW5saW5lLg0KPiA+PiBJJ20gb3BlbiB0byBhbnkgb3B0aW9ucy4NCj4gPg0KPiA+IEkg
Y2FuIG9ubHkgZG8gcmV2aWV3cyBmb3IgdGhlIGdlbmVyYWwgbmV0d29ya2luZyBwYXJ0IGJ1dCBu
b3QgdGhlDQo+ID4gODI1NzYgc3BlY2lmaWMgcGFydC4gSXQgd291bGQgYmUgYmV0dGVyIGlmIGVp
dGhlciBvZiB0aGUgc2VyaWVzIGNhbg0KPiA+IGdldCBzb21lIEFDS3MgZnJvbSBzb21lIG9uZXMg
dGhhdCB0aGV5IGFyZSBmYW1pbGlhciB3aXRoIDgyNTc2LCB0aGVuIEkNCj4gPiBjYW4gdHJ5IHRv
IG1lcmdlLg0KPiA+DQo+ID4gVGhhbmtzDQo+IA0KPiBJIGhhdmUganVzdCBzZW50IHYzIHRvIHRo
ZSBsaXN0Lg0KPiANCj4gU3JpcmFtIFlhZ25hcmFtYW4sIHdobyB3cm90ZSBhbm90aGVyIHNlcmll
cyBmb3IgODI1NzYsIGlzIHRoZSBvbmx5IHBlcnNvbiBJDQo+IGtub3cgd2hvIGlzIGZhbWlsaWFy
IHdpdGggdGhlIGRldmljZS4NCj4gDQo+IFNyaXJhbSwgY2FuIHlvdSB0YWtlIGEgbG9vayBhdCB2
MyBJIGhhdmUganVzdCBzZW50Pw0KDQpJIGFtIGF0IGJlc3QgYSBnb29kIGludGVycHJldGVyIG9m
IHRoZSA4MjU3NiBkYXRhc2hlZXQuIEkgd2lsbCByZXZpZXcgeW91ciBjaGFuZ2VzIGdldCBiYWNr
IGhlcmUuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEFraWhpa28gT2Rha2kNCj4gDQo+ID4NCj4gPj4N
Cj4gPj4gVjEgLT4gVjI6DQo+ID4+IC0gU3B1biBvZmYgZTEwMDBlIGdlbmVyYWwgaW1wcm92ZW1l
bnRzIHRvIGEgZGlzdGluY3Qgc2VyaWVzLg0KPiA+PiAtIFJlc3RvcmVkIHZuZXRfaGRyIG9mZmxv
YWQgYXMgdGhlcmUgc2VlbXMgbm90aGluZyBwcmV2ZW50aW5nIGZyb20gdGhhdC4NCj4gPj4NCj4g
Pj4gQWtpaGlrbyBPZGFraSAoMTMpOg0KPiA+PiAgICBody9uZXQvbmV0X3R4X3BrdDogSW50cm9k
dWNlIG5ldF90eF9wa3RfZ2V0X2V0aF9oZHINCj4gPj4gICAgcGNpZTogSW50cm9kdWNlIHBjaWVf
c3Jpb3ZfbnVtX3Zmcw0KPiA+PiAgICBlMTAwMDogU3BsaXQgaGVhZGVyIGZpbGVzDQo+ID4+ICAg
IGlnYjogQ29weSBlMTAwMGUgY29kZQ0KPiA+PiAgICBpZ2I6IFJlbmFtZSBpZGVudGlmaWVycw0K
PiA+PiAgICBpZ2I6IEJ1aWxkIGlnYg0KPiA+PiAgICBpZ2I6IFRyYW5zZm9ybSB0byA4MjU3NiBp
bXBsZW1lbnRhdGlvbg0KPiA+PiAgICB0ZXN0cy9xdGVzdC9lMTAwMGUtdGVzdDogRmFicmljYXRl
IGV0aGVybmV0IGhlYWRlcg0KPiA+PiAgICB0ZXN0cy9xdGVzdC9saWJxb3MvZTEwMDBlOiBFeHBv
cnQgbWFjcmVnIGZ1bmN0aW9ucw0KPiA+PiAgICB0ZXN0cy9xdGVzdC9saWJxb3MvaWdiOiBDb3B5
IGUxMDAwZSBjb2RlDQo+ID4+ICAgIHRlc3RzL3F0ZXN0L2xpYnFvcy9pZ2I6IFRyYW5zZm9ybSB0
byBpZ2IgdGVzdHMNCj4gPj4gICAgdGVzdHMvYXZvY2FkbzogQWRkIGlnYiB0ZXN0DQo+ID4+ICAg
IGRvY3Mvc3lzdGVtL2RldmljZXMvaWdiOiBBZGQgaWdiIGRvY3VtZW50YXRpb24NCj4gPj4NCj4g
Pj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5
ICsNCj4gPj4gICBkb2NzL3N5c3RlbS9kZXZpY2UtZW11bGF0aW9uLnJzdCAgICAgICAgICAgICAg
fCAgICAxICsNCj4gPj4gICBkb2NzL3N5c3RlbS9kZXZpY2VzL2lnYi5yc3QgICAgICAgICAgICAg
ICAgICAgfCAgIDcwICsNCj4gPj4gICBody9uZXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICA1ICsNCj4gPj4gICBody9uZXQvZTEwMDAuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gPj4gICBody9uZXQvZTEwMDBfY29tbW9uLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAyICsNCj4gPj4gICBody9uZXQvZTEwMDBfcmVn
cy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOTI3ICstLS0NCj4gPj4gICBody9uZXQv
ZTEwMDBlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzICstDQo+ID4+ICAg
aHcvbmV0L2UxMDAwZV9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+
ID4+ICAgaHcvbmV0L2UxMDAweF9jb21tb24uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
MSArDQo+ID4+ICAgaHcvbmV0L2UxMDAweF9jb21tb24uaCAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA3NCAtDQo+ID4+ICAgaHcvbmV0L2UxMDAweF9yZWdzLmggICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDk0MCArKysrDQo+ID4+ICAgaHcvbmV0L2lnYi5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDYxNSArKysNCj4gPj4gICBody9uZXQvaWdiX2NvbW1vbi5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQ0ICsNCj4gPj4gICBody9uZXQvaWdiX2NvcmUu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzOTQ2ICsrKysrKysrKysrKysrKysrDQo+
ID4+ICAgaHcvbmV0L2lnYl9jb3JlLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE0
NyArDQo+ID4+ICAgaHcvbmV0L2lnYl9yZWdzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDYyNCArKysNCj4gPj4gICBody9uZXQvaWdidmYuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMzI3ICsrDQo+ID4+ICAgaHcvbmV0L21lc29uLmJ1aWxkICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgMiArDQo+ID4+ICAgaHcvbmV0L25ldF90eF9wa3QuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgNiArDQo+ID4+ICAgaHcvbmV0L25ldF90eF9wa3Qu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOCArDQo+ID4+ICAgaHcvbmV0L3RyYWNl
LWV2ZW50cyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzMiArDQo+ID4+ICAgaHcvcGNp
L3BjaWVfc3Jpb3YuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNSArDQo+ID4+ICAg
aW5jbHVkZS9ody9wY2kvcGNpZV9zcmlvdi5oICAgICAgICAgICAgICAgICAgIHwgICAgMyArDQo+
ID4+ICAgLi4uL29yZy5jZW50b3Mvc3RyZWFtLzgveDg2XzY0L3Rlc3QtYXZvY2FkbyAgIHwgICAg
MSArDQo+ID4+ICAgdGVzdHMvYXZvY2Fkby9pZ2IucHkgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAzOCArDQo+ID4+ICAgdGVzdHMvcXRlc3QvZTEwMDBlLXRlc3QuYyAgICAgICAgICAgICAg
ICAgICAgIHwgICAxNyArLQ0KPiA+PiAgIHRlc3RzL3F0ZXN0L2Z1enovZ2VuZXJpY19mdXp6X2Nv
bmZpZ3MuaCAgICAgICB8ICAgIDUgKw0KPiA+PiAgIHRlc3RzL3F0ZXN0L2lnYi10ZXN0LmMgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyNDMgKw0KPiA+PiAgIHRlc3RzL3F0ZXN0L2xpYnFvcy9l
MTAwMGUuYyAgICAgICAgICAgICAgICAgICB8ICAgMTIgLQ0KPiA+PiAgIHRlc3RzL3F0ZXN0L2xp
YnFvcy9lMTAwMGUuaCAgICAgICAgICAgICAgICAgICB8ICAgMTQgKw0KPiA+PiAgIHRlc3RzL3F0
ZXN0L2xpYnFvcy9pZ2IuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxODUgKw0KPiA+PiAgIHRl
c3RzL3F0ZXN0L2xpYnFvcy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICB8ICAgIDEgKw0KPiA+
PiAgIHRlc3RzL3F0ZXN0L21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEg
Kw0KPiA+PiAgIDM0IGZpbGVzIGNoYW5nZWQsIDc0OTIgaW5zZXJ0aW9ucygrKSwgMTAxOCBkZWxl
dGlvbnMoLSkNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9zeXN0ZW0vZGV2aWNlcy9p
Z2IucnN0DQo+ID4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9lMTAwMF9jb21tb24uaA0K
PiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9uZXQvZTEwMDB4X3JlZ3MuaA0KPiA+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBody9uZXQvaWdiLmMNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
aHcvbmV0L2lnYl9jb21tb24uaA0KPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9uZXQvaWdi
X2NvcmUuYw0KPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9uZXQvaWdiX2NvcmUuaA0KPiA+
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9uZXQvaWdiX3JlZ3MuaA0KPiA+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBody9uZXQvaWdidmYuYw0KPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0
cy9hdm9jYWRvL2lnYi5weQ0KPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9xdGVzdC9p
Z2ItdGVzdC5jDQo+ID4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0L2xpYnFvcy9p
Z2IuYw0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAyLjM5LjANCj4gPj4NCj4gPg0K

