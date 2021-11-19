Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E244571F1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 16:45:10 +0100 (CET)
Received: from localhost ([::1]:36342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo64a-0001jt-TZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 10:45:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mo62t-0000YU-F5; Fri, 19 Nov 2021 10:43:23 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:64645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mo62r-00043d-Bw; Fri, 19 Nov 2021 10:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1637336601; x=1637941401;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ffx//O3dJ65EEqAzGo9xYZIY2EjBeXDJhYNyaPBsLoY=;
 b=EtGMSQ88XZCroOaQGWdVDNHFzDKbKCWiuJUpBpjId+9L+okoP16yiKQe
 hEKYYAAhK0T4WxYDTW9dh7eXNWcAIU1G/WYIBUU+H7EVlC4hBbklFdeCb
 jCC37L0xOS9QtW9qoTbxUnJYSFHZwIMEt53jP6ab974p8B0SNeOlVp5ia I=;
Received: from mail-bn1nam07lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAM4N6a7yqQMIvS7o3rfUgwggPseoq6sG2qzEfyd351Q+495xSjGBYqlNsLBYBelJDgZC8XQ3D7jkRAjGYH+6pK5UMrXbrsGV1zuzGYa/wjopdZmymvzMy1VDN3Vgy9oVc9ioPLrMc5SpKW1zQvfvDuWC/Vfw/HUdwxW3d5mmPlAROcRJf3oxAJILm1d6csG9dGeP5D4GkbXEXQiEiu6B/GBqprCkQ/xSuxa84bITFIJEfjeX3v+HzI2pyrQ0X3tXLvRGrRSWfZ41wolUPqFBWTOxpchjONirIEaRUN8tXvfkR1fp0oSA1HnK0L7+mS81sFksh2EEgYX9XhmY4tbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffx//O3dJ65EEqAzGo9xYZIY2EjBeXDJhYNyaPBsLoY=;
 b=V63xLmgjsUAms3cdgOutWIFVOsYUT1vNvWt1mrntxy/0WBeKbg/MnUTXcDM8KB+K1asOqooBE7k8A0Xx4tI1rX3dPTC9TaYqF3beDwvyZXwVNa+8Hu/bjTM7hTwG58OW7J9YIgHi+h2sifOOzARR7ZDLeJqaYGNG4ZXgvfYSvbOF4HEnpVEgbmIwFuuq7bY5KKJvYimtfodCD1f5yykoGInMtAgHbncLzEUTQZDHyOZVPvbPzGR3B7A+TCfZzo83tgDKSwXDjJ7FUnxPqBahbP7kqxOEqbJEqkZcdzDbou5fB//icJbr8tiu4NfufnUX80QPFHLVLF30NYCSL1p97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4477.namprd02.prod.outlook.com
 (2603:10b6:805:b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 15:43:11 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%6]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 15:43:11 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH-for-6.2? v2 2/3] misc: Spell QEMU all caps
Thread-Topic: [PATCH-for-6.2? v2 2/3] misc: Spell QEMU all caps
Thread-Index: AQHX3SZQJVNIl8wcnUuwTGxT8cONiKwK/Wvg
Date: Fri, 19 Nov 2021 15:43:11 +0000
Message-ID: <SN4PR0201MB88087B05D75EF21FB9EBA845DE9C9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211119091701.277973-1-philmd@redhat.com>
 <20211119091701.277973-3-philmd@redhat.com>
In-Reply-To: <20211119091701.277973-3-philmd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d94534e-6a9e-4644-d2b6-08d9ab734adc
x-ms-traffictypediagnostic: SN6PR02MB4477:
x-microsoft-antispam-prvs: <SN6PR02MB4477AF92D4E1A974587DB2AFDE9C9@SN6PR02MB4477.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:199;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oo0P8jq5wzQoedhRhkslrb0EOizCSUQDKBn+K4yNU1heDWIfK2Pg0/Ae9CIDITf/mHVhEKwxxqLJIWrYbr3MG+PzWfVg9mDMSPziLHOUwam3liP3BRDbFtewAmByBQjOwcu8bgghIQFsFA9oztHGVi3FOuVDNNB3LjCxC1/gKP8z8U2RHvOVSDVvdejFp+tZajYXQdh37/SVruHB7DpTKTCWn0ThxOmvvxpnT03kD116Tdc4oMCGLP0mdevdQmYk7EeFpDG6OFKzIFqRx/lapuaw6/2l+TqcOGwd1tRTaNUB1L3q95S0O57yJ1ZmjGoml2Gx2ANsvm59/FZ57fH7vc77iLYxdH0dLf/M6+H12dhI95FQg/ddZoWIW9LJ5Wf3BVB07tTK32rsvgLEedV7rnpwt3SkWAmY/6n/m5m3ZIj8c+xfJvInAsds8nMlWIYL1ckN1YFspA26TqJU3Zp9YVaDW7VzD1amoLCaYqCsBELUbzyWsbFOjFa9BzQ5/v0teyJWBICldSsWh8XLg9LEk7m+5taDw1Cc2a/lCDscyAwVrbsvKY7wvCI8Y+zLced0n9RgWrXvg3Iol9PesjstWvaRlW1EtgheQSaIuS1hxFvDhVnk/5iIe8vWEYmBTahuXMnQyG4bLvy/k6qnGgLw6niDspfPbZPCqHEk10pUBBn1Os5Y3xhY76YyH6p9yKIHv8dfX6wZM0me/azyJqS1tQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(71200400001)(76116006)(316002)(7416002)(8676002)(66476007)(66556008)(64756008)(7696005)(66946007)(66446008)(5660300002)(53546011)(110136005)(26005)(54906003)(33656002)(83380400001)(52536014)(8936002)(9686003)(122000001)(186003)(2906002)(6506007)(4326008)(38100700002)(38070700005)(508600001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0cwMFRqcExqRnc4dlo4eTFVZFZ3RXdidTdEaHp5MFVsTHd1WUJrTW1aNlZP?=
 =?utf-8?B?OHFNTVRQaUVEdkVlR2JLV3RxL2k5MFB3WS9QMzAyQnJ6d2FsMy9WUmpybk45?=
 =?utf-8?B?Rnc3OFQwUys4dTFQRWlUME9vZFdHQTdUdS9pRVh6NUVHNEF2NEpBbjE2ZHBV?=
 =?utf-8?B?dVM5eGRadmQxaEhYNXUwL0o1d2VxOTUxZURWYjREVHNSVS91RXJHMmlTQUdj?=
 =?utf-8?B?T1ZsNnVuYW9HRHloN3hZVEl0ZW9KMms1YTE2amtLK3ZxWEh6T0tRbjVwS2hv?=
 =?utf-8?B?WjVYb1V3dzBYSTVmeG9FSWFSRlJwaysxVXlLWXprYU8wNGh4NXhNSUxpR2Jy?=
 =?utf-8?B?dFJGL1hPS1gydHdrdWkrZzhmaFRtYVJLNURzdC9WY0Z2ZVRnQlJmcUVBYjdt?=
 =?utf-8?B?d09PZ0tRWkpycEd2RjA0U1E4QnEvcUF0dVFyNEF3bXlWZWNvZTFiMW4wbERF?=
 =?utf-8?B?a0d5cGxwQjA1OHpEQXJkd0RLeUNtWEh4K2VNcTJMMnlqWXR3bnpKWnJYZTFJ?=
 =?utf-8?B?Y0Y3WDg3NUtXbmIxM1F0OHpuS0lVcm5jNk5pa1kvSW1sTTQ0SVloWkRnczUz?=
 =?utf-8?B?M3VHY2VBTFp0NjdiYm1wd3NPcHowbDZ5Nm9GNDEwb21LcjQ5dEYrcmRvTXhy?=
 =?utf-8?B?UGd4Uk1lVFkvbUN3V0VpVjR6NGVWckpsZmVQanRoLytJM2RBT3RMQ0hCanp5?=
 =?utf-8?B?V0RXLzRWUDhjY2dWc05nb1VoclhIczdEN0F1YUp1MXdpUzg0L29NNEd0enNw?=
 =?utf-8?B?SEsra0hHQ2R4WVlvM0c1Qk0vVXhPMllmOXZJNEYySlhpZUcxdVhya1JYZnhH?=
 =?utf-8?B?MDVZV3dNb01oR25UWWtxV0ovUmFsWlIvWG9KSlIrV01VVkI1RkpxcEw4L2U0?=
 =?utf-8?B?U09xeWVHVExNK0FDNjN5K0xJMUNiUzF5dDg0b2I0ZG5QTzZrekVWQ3RheCsw?=
 =?utf-8?B?RXBkQ3JXbmVvTGF2czUzTHBiU25acitjVDIxbUJWVmdmcFVzc3g5S3lyRlh6?=
 =?utf-8?B?WWlJZmhRNWpNNndlVnp5WExqZUl1RjN6eUtFaWVwcU1qUVV1Rnk0d2U0NWRx?=
 =?utf-8?B?VmFRdUtYY1p3NWw1U3hIRnhGN0JHQlBhTVdDYWZNZnp5Z3hmM01qRndOWnFP?=
 =?utf-8?B?VFBFUWdkbHlnV2hVMDF3VDJKK1JIV25RbS9hSmxJMGpBdkxMNDRuRC92T0pa?=
 =?utf-8?B?d05HM1psMUdFMkpsMUdYOU5aZzZUazFPNlpoZlJ0cmlhZGNwdmg2K3lrT1c3?=
 =?utf-8?B?TFNkOVNnUW9RQWN1YmkzKzAySlpkcHlNN3QycjZnSFVBaTVmTnpNb0RDTzg2?=
 =?utf-8?B?RHRIVjBJS3ZmbTlDQ3M4WXFpZnNrWVFiKytINnRvUTNnczhrREcxMDNYV3Iv?=
 =?utf-8?B?Sm5YaTcwUmdBRWQwUUJKK2xCRUZxTVBkK3ovQTJmYksxd1MwbVNrUW5EUVNY?=
 =?utf-8?B?d2phUHpTaVd6c1RqbldKQ1oxTXNYWnJOaitMWmIrTHB5Q3R2YVd0VWtFQWc2?=
 =?utf-8?B?RDE5bU40Q3ptZ3FjRVAyWG9tM25nWXpNcUZCQkZaczBXY3dONDNHaG4ybFRi?=
 =?utf-8?B?b1BQQlJ1NDMzdFp0aitkVmJjaGx4ZitYR3lHZDVjOWl6YzB5eG1RcGtBUVBD?=
 =?utf-8?B?Z1hINWhWaHhjUC9iNlVYN2FHNVMrTVpBT1hUQkhILzVhQ0JGYTRteXZkc0Jh?=
 =?utf-8?B?TXhtejBRZFBnUXhjNnoxdHkwV3lpQjZJN1dlMHduei8vbzFSQU5NMm1CV3NY?=
 =?utf-8?B?Q25nTHlNM2lBb0I2ZnNvSmIzTEJldHFBOUtDM0hic2Y5aVdvOXZGczlkcGtN?=
 =?utf-8?B?UE1rL0JqWVlFS3ZGNVEvMC8zaTRjQmRZQ01VdzAwRjV1anFWYkNMMFJMS3lj?=
 =?utf-8?B?QnlqSFZZZmtUTkhIR2sva3RsRG5kL1l0aHZjT1Z0Tm5PRmVNV2lnVk9nWUJr?=
 =?utf-8?B?NnJ1ZVEzcU9LWWd2UFIwVmV3MUU2Rk9YbEVJdllYV3BSU1JyMzBjNEZZVkN2?=
 =?utf-8?B?TVhjOWZxSTJyWVAwakZRVlpiSEhMSTZmVEYxWjZ0dUNIWE5BZkN1TTVXaXZQ?=
 =?utf-8?B?VWdPMTh6ZmdnOTlFUGVOK0JDRTkwb0paSjdqMFcyaTJyczk4enNYSHZQa0hI?=
 =?utf-8?B?S3NXOThqRXp4amFXZ1FiM0dtdzJMZ0ZUTUJZTzh2L1hYMjhZOWFRdXF4VFNt?=
 =?utf-8?Q?ZRwyjkKdBZq2IShqX3SJM0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d94534e-6a9e-4644-d2b6-08d9ab734adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 15:43:11.4095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CogGWvIQqdHE0XLX6tLIVx97a/iy3ZK/6rRLFfozLqrJVLNkEl49uWup/Wz1KLB9pILCLeyccn0FoQdcw0au5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4477
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDE5
LCAyMDIxIDM6MTcgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogQ2xlYmVy
IFJvc2EgPGNyb3NhQHJlZGhhdC5jb20+OyBKb2huIFNub3cgPGpzbm93QHJlZGhhdC5jb20+OyBF
cmljDQo+IEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT47IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1i
cnVAcmVkaGF0LmNvbT47DQo+IEhhbm5hIFJlaXR6IDxocmVpdHpAcmVkaGF0LmNvbT47IE1pY2hh
ZWwgUm90aCA8bWljaGFlbC5yb3RoQGFtZC5jb20+Ow0KPiBxZW11LWJsb2NrQG5vbmdudS5vcmc7
IE1hcmNlbG8gVG9zYXR0aSA8bXRvc2F0dGlAcmVkaGF0LmNvbT47IFZsYWRpbWlyDQo+IFNlbWVu
dHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT47IEVkdWFyZG8gSGFia29z
dA0KPiA8ZWhhYmtvc3RAcmVkaGF0LmNvbT47IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWlj
aW5jLmNvbT47DQo+IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+OyBLZXZpbiBXb2xmDQo+IDxrd29sZkByZWRoYXQuY29tPjsgUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gtZm9y
LTYuMj8gdjIgMi8zXSBtaXNjOiBTcGVsbCBRRU1VIGFsbCBjYXBzDQo+IA0KPiBRRU1VIHNob3Vs
ZCBiZSB3cml0dGVuIGFsbCBjYXBzLg0KPiANCj4gTm9ybWFsbHkgY2hlY2twYXRjaC5wbCB3YXJu
cyB3aGVuIGl0IGlzIG5vdCAoc2VlIGNvbW1pdA0KPiA5OTY0ZDhmOTQyMjogImNoZWNrcGF0Y2g6
IEFkZCBRRU1VIHNwZWNpZmljIHJ1bGUiKS4NCj4gDQo+IFJlcGxhY2UgUWVtdSAtPiBRRU1VLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRo
YXQuY29tPg0KDQoNCj4gLS1naXQgYS90YXJnZXQvaGV4YWdvbi9SRUFETUUgYi90YXJnZXQvaGV4
YWdvbi9SRUFETUUgaW5kZXgNCj4gMzcyZTI0NzQ3YzkuLmIwMmRiYmQxNzAxIDEwMDY0NA0KPiAt
LS0gYS90YXJnZXQvaGV4YWdvbi9SRUFETUUNCj4gKysrIGIvdGFyZ2V0L2hleGFnb24vUkVBRE1F
DQo+IEBAIC00OCw3ICs0OCw3IEBAIGhlYWRlciBmaWxlcyBpbiA8QlVJTERfRElSPi90YXJnZXQv
aGV4YWdvbg0KPiAgICAgICAgICBnZW5fdGNnX2Z1bmNfdGFibGUucHkgICAgICAgICAgIC0+IHRj
Z19mdW5jX3RhYmxlX2dlbmVyYXRlZC5jLmluYw0KPiAgICAgICAgICBnZW5faGVscGVyX2Z1bmNz
LnB5ICAgICAgICAgICAgIC0+IGhlbHBlcl9mdW5jc19nZW5lcmF0ZWQuYy5pbmMNCj4gDQo+IC1R
ZW11IGhlbHBlciBmdW5jdGlvbnMgaGF2ZSAzIHBhcnRzDQo+ICtRRU1VIGhlbHBlciBmdW5jdGlv
bnMgaGF2ZSAzIHBhcnRzDQo+ICAgICAgREVGX0hFTFBFUiBkZWNsYXJhdGlvbiBpbmRpY2F0ZXMg
dGhlIHNpZ25hdHVyZSBvZiB0aGUgaGVscGVyDQo+ICAgICAgZ2VuX2hlbHBlcl88TkFNRT4gd2ls
bCBnZW5lcmF0ZSBhIFRDRyBjYWxsIHRvIHRoZSBoZWxwZXIgZnVuY3Rpb24NCj4gICAgICBUaGUg
aGVscGVyIGltcGxlbWVudGF0aW9uDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9ndWVzdC1kZWJ1Zy9y
dW4tdGVzdC5weSBiL3Rlc3RzL2d1ZXN0LWRlYnVnL3J1bi10ZXN0LnB5DQoNClJldmlld2VkLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo=

