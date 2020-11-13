Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856982B182C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:23:46 +0100 (CET)
Received: from localhost ([::1]:38398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVJ3-0004bE-L9
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1kdVHo-00049b-Pc
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:22:28 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:7442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1kdVHm-0000jN-3r
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:22:28 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AD9JdZi007397; Fri, 13 Nov 2020 01:22:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Ck0dGJ56ALusdFO6Jjabjuj+FdvnE6OkzPjOkWe7ReI=;
 b=p4ICLhMytG4ONAlV9GOtkMv7slxjgOpFpdf9JCyZhZ4W7oN2PQNyKNwUubv7whXwSweu
 RpJn3G4bGaEto9G1f+mJhxbzkPyHQXXiWWhnPafX3jKs57QeolsoI0KIXz0uiEDcVnn6
 5rjYv3KtuP8qpdgpLwDn0Glav1lsKm/SYWwEy+2W3KzAeIpIR3hkQ+uY8kRZFL3Ag07M
 zKHVgwwzObAbj0rJKRSNIkSk/8eSFpWWykkQzaTmPggKxvVKqZOQ64gbdfHhTLZmrr1F
 GghIR1AgkomAlXXrZM/yScbLmDd/GbX3D6XTqN1YKKWwYx07THC9VqJsBbUkj0XIHDEp LQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0a-002c1b01.pphosted.com with ESMTP id 34rnenv37j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 01:22:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkCLACvUKRfUR8Z+O0o2gKerEPLM8YB3WtBzaLqkCHxHWKyfXDquSp3V6BWVgw0F3p90d9xLvQe474Kfr0RtUSkzvD+OeUXJwDUzvBXM7+Rf5u+gAFbxnp1Zx/I/bUlirPNpKXFIbT6Nbq2BST3omQfhOz3E3xDCnms0WkP12QY/c/Gs5J4YHu8NeEikdKFRa+asLTS9dj47/VrrcxjqYOKEsldzAroqWajvPB+BpMEYndWX3QumsnotnkoI1UkpYogTX0l0qEXDEI4qAtFznTG1vbyhvHvId2z6QM9IuvyG4DysKNUECqdvTAwFf5552uYQdTo/7bqE3IE2vNPP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck0dGJ56ALusdFO6Jjabjuj+FdvnE6OkzPjOkWe7ReI=;
 b=Y3+ix7QWJdVyG4teEsASgD18n9k1TXEcSoq2eLl7FtcGZpTo7XOh65n6S1vmhSI91GXB/C19QMbtqpEY5h4VG8dsRFo8xHn0M8oda3yRbKsqCSNQyhWgkcCkTFPXgjcsoOkH4Ihbe1TH6cMUFmBYFYqn9I+AqjaahR2wOCDSHK/690eir9ecFcgR/2Lvfs4D5nS5lIt/ovP1iAI86K1UJVzSuZZFFuy+XlYwjC2vrJF3NUlokK4wA24+rZ6oE2IyJM4zxLx4+bOshD/PldQh0xQGb9H8Npzrqr8B88VHQ6itHthlUx1dKefZIZYaxCWG8BBbTEPVzJguvw8EE/lnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by MW4PR02MB7250.namprd02.prod.outlook.com (2603:10b6:303:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 09:22:10 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::950e:a59c:cc5b:4908]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::950e:a59c:cc5b:4908%4]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 09:22:10 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6] introduce vfio-user protocol specification
Thread-Topic: [PATCH v6] introduce vfio-user protocol specification
Thread-Index: AQHWtsIyo6ypnUY890i+unEpRtdAuanFywFw
Date: Fri, 13 Nov 2020 09:22:10 +0000
Message-ID: <MW2PR02MB3723E5EF7698E4BC9624E7D18BE60@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <20201109180001.177665-1-thanos.makatos@nutanix.com>
In-Reply-To: <20201109180001.177665-1-thanos.makatos@nutanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.9.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0b56a7c-73ea-4948-8997-08d887b59951
x-ms-traffictypediagnostic: MW4PR02MB7250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW4PR02MB7250B5CB63E38B1780CFABA08BE60@MW4PR02MB7250.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tGpOaHpBvxvlcVJr2DW5grKaymgfJo/BqF3ahNGcTspGvdTe2n60lwqr4FXnhTvYkrTdNcMXthIJp9N3sB4fOg9cGfgeQklm47oFkXdUKYfNeP4I/cwv/GBmGxRBR+uayfJ8nhnKHa3ZQQVZEiVx0OB6daY88R9hUOEQ0lfmDmVFeCLTDZ5Ab8BBfYXluM+ZcPYkvTdT1W6dQ5Joir/tS0Tb9m83nzr+j0+WG16ykkvhLLffEsGa/HixWfac8rXiFMaJIY8qf0HlhKoYavww1t0n4wuKmX4XV3O4y8WbK1wZhaHm6pW7kdJjkK1qUwdTaDILgRzeMEUUphzAulm7bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(376002)(346002)(366004)(8936002)(64756008)(7696005)(66946007)(66446008)(66556008)(44832011)(6506007)(55236004)(86362001)(83380400001)(4326008)(71200400001)(8676002)(55016002)(9686003)(5660300002)(52536014)(7416002)(2906002)(110136005)(33656002)(76116006)(66476007)(54906003)(316002)(186003)(26005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JKND6v11T72/SVm2VoLnMIgbD/w/696zMD/Fb0obptiIVpTc/daVenGp4TKcFpFcti+iI3xQmDo2+C8nC57Ttq56kKtUAtvKuoAhtYNVlY7iUC9DK4y4LUHobp1HOeVibOxJo1mVx/yhyeGGuV4vUgSxQXCfq2z5TB/f4Ea9bGLg/yL0ARwSyT8NDoL0GE5H0/mF9JKtD3nSR16mmU65YU88QjB2Ulk7a575Bt1Sqk2x5NkbBkFEvXl1sLLG24hIKE+Pl1n5JIq//OL4pbCukhE6rVV1RWu6URzRnZxwYYJbrmxsSCyi1SYG3ErpqCHqYUzLgqttIVfqfdVXRCXQq18gKqz+eVkLXPBrRXd3H9/9sWmpYvSflOKS7ifr07BSolVdKoVhesRepNb1513p217itGnI8GWTWSwOSQGyUogIUn5wkkVs2ukIQDQa1H6xlM1Tfv8dAetoNS61dkF4iVUeYWQKGHRdRfRUj3ylkeHKUH5/hwM69V4t712+0DtWxFsfdz3cXkKvyKjk2ybeEHKFbPKPm6rtcYJf3Zkvoo0zJ2lrKTH1aJYkFzXYYH1VtO8eFzWVbv84QK9hH3mv9lS1lSrPesh/bTT3SoZQUzEJlFFnaNWwEnPsUCpSNh+sWmVZszPWiIKxbB/i5kupgg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b56a7c-73ea-4948-8997-08d887b59951
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 09:22:10.1314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PD7mXd3AGG32M7tqISHMqXVHYF1uQCMdMqgNkok01WEWDpnOQRmz3nkjpJoljdEX5HfXlhK8gfhPjGKNXwlszTeGppZiLf6tb6YjE1AcBjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7250
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_07:2020-11-12,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 04:22:22
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiArVmVyc2lvbiBEYXRhIEZvcm1hdA0KPiArXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiArDQo+ICtU
aGUgdmVyc2lvbiBkYXRhIGlzIGFuIG9wdGlvbmFsIEpTT04gYnl0ZSBhcnJheSB3aXRoIHRoZSBm
b2xsb3dpbmcgZm9ybWF0Og0KPiArDQo+ICsrLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICt8IE5h
bWUgICAgICAgICB8IFR5cGUgICAgICAgICAgICAgfCBEZXNjcmlwdGlvbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8DQo+ICsrPT09PT09PT09PT09PT0rPT09PT09PT09PT09PT09PT09
Kz09PT09PT09PT09PT09PT09PT09PT0NCj4gPT09PT09PT09PT09PT09PT09PT09Kw0KPiArfCBj
YXBhYmlsaXRpZXMgfCBjb2xsZWN0aW9uIG9mICAgIHwgQ29udGFpbnMgY29tbW9uIGNhcGFiaWxp
dGllcyB0aGF0IHRoZSAgICAgfA0KPiArfCAgICAgICAgICAgICAgfCBuYW1lL3ZhbHVlIHBhaXJz
IHwgc2VuZGVyIHN1cHBvcnRzLiBPcHRpb25hbC4gICAgICAgICAgICAgICAgfA0KPiArKy0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKw0KPiArDQo+ICtDYXBhYmlsaXRpZXM6DQo+ICsNCj4gKystLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsNCj4gK3wgTmFtZSAgICAgICAgICB8IFR5cGUgICAgICAgICAgICAgfCBE
ZXNjcmlwdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gKys9PT09PT09PT09
PT09PT0rPT09PT09PT09PT09PT09PT09Kz09PT09PT09PT09PT09PT09PT09PQ0KPiA9PT09PT09
PT09PT09PT09PT09PT0rDQo+ICt8IGBgbWF4X2Zkc2BgICAgfCBudW1iZXIgICAgICAgICAgIHwg
TWF4aW11bSBudW1iZXIgb2YgZmlsZSBkZXNjcmlwdG9ycyB0aGF0ICB8DQo+ICt8ICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgIHwgY2FuIGJlIHJlY2VpdmVkIGJ5IHRoZSBzZW5kZXIu
IE9wdGlvbmFsLiB8DQo+ICt8ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwgSWYg
bm90IHNwZWNpZmllZCB0aGVuIHRoZSByZWNlaXZlciBtdXN0ICB8DQo+ICt8ICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgIHwgYXNzdW1lIGBgbWF4X2Zkcz0xYGAuICAgICAgICAgICAg
ICAgICAgICB8DQo+ICsrLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICt8IGBgbWlncmF0aW9uYGAg
fCBjb2xsZWN0aW9uIG9mICAgIHwgTWlncmF0aW9uIGNhcGFiaWxpdHkgcGFyYW1ldGVycy4gSWYg
ICAgICB8DQo+ICt8ICAgICAgICAgICAgICAgfCBuYW1lL3ZhbHVlIHBhaXJzIHwgbWlzc2luZyB0
aGVuIG1pZ3JhdGlvbiBpcyBub3Qgc3VwcG9ydGVkICB8DQo+ICt8ICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgIHwgYnkgdGhlIHNlbmRlci4gICAgICAgICAgICAgICAgICAgICAgICAg
ICB8DQo+ICsrLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQoNCkNhbiB3ZSBpbnRyb2R1Y2UgdGhlIGZv
bGxvd2luZyBwYXJhbWV0ZXJzIHRoYXQgY2FuIGhlbHAgc2ltcGxpZnkgdGhlDQpzZXJ2ZXIgaW1w
bGVtZW50YXRpb24/DQoNCiogbWF4X2RtYV9yZWdpb25zOiBtYXhpbXVtIG51bWJlciBvZiBETUEg
cmVnaW9ucyBwZXIgVkZJT19VU0VSX0RNQV9NQVAvVU5NQVANCiAgICAgICAgICAgICAgICAgICBt
ZXNzYWdlDQoJCQkJICAgDQoqIG1heF9kaXJ0eV9iaXRtYXBzOiBtYXhpbXVtIG51bWJlciBvZiBk
aXJ0eSBiaXRtYXBzIHJlcXVlc3RlZCBwZXINCiAgICAgICAgICAgICAgICAgICAgIFZGSU9fVVNF
Ul9ESVJUWV9QQUdFUyBtZXNzYWdlDQoJCQkJCSANCklmIHRoZXNlIHBhcmFtZXRlcnMgYXJlIG1p
c3NpbmcgdGhlbiB0aGV5IGNhbiBiZSB1bmxpbWl0ZWQuIFRoZSB2ZmlvLXVzZXIgY2xpZW50DQp3
aWxsIGhhdmUgdG8gYnJlYWsgYSBzaW5nbGUgb3BlcmF0aW9uIGludG8gbXVsdGlwbGUgbWVzc2Fn
ZXMuDQoNCg0KPiArVkZJT19VU0VSX0RFVklDRV9HRVRfUkVHSU9OX0lORk8NCj4gKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK01lc3NhZ2UgZm9ybWF0DQo+ICteXl5e
Xl5eXl5eXl5eXg0KPiArDQo+ICsrLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKw0KPiArfCBOYW1lICAgICAgICAgfCBWYWx1ZSAgICAgICAgICAgICAgICAgIHwNCj4gKys9
PT09PT09PT09PT09PSs9PT09PT09PT09PT09PT09PT09PT09PT0rDQo+ICt8IE1lc3NhZ2UgSUQg
ICB8IDxJRD4gICAgICAgICAgICAgICAgICAgfA0KPiArKy0tLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsNCj4gK3wgQ29tbWFuZCAgICAgIHwgNSAgICAgICAgICAgICAgICAg
ICAgICB8DQo+ICsrLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiAr
fCBNZXNzYWdlIHNpemUgfCA0OCArIGFueSBjYXBzICAgICAgICAgIHwNCj4gKystLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICt8IEZsYWdzICAgICAgICB8IFJlcGx5
IGJpdCBzZXQgaW4gcmVwbHkgfA0KPiArKy0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSsNCj4gK3wgRXJyb3IgICAgICAgIHwgMC9lcnJubyAgICAgICAgICAgICAgICB8DQo+
ICsrLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiArfCBSZWdpb24g
aW5mbyAgfCBWRklPIHJlZ2lvbiBpbmZvICAgICAgIHwNCj4gKystLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsNCj4gK1RoaXMgY29tbWFuZCBtZXNzYWdlIGlzIHNl
bnQgYnkgdGhlIGNsaWVudCB0byB0aGUgc2VydmVyIHRvIHF1ZXJ5IGZvcg0KPiAraW5mb3JtYXRp
b24gYWJvdXQgZGV2aWNlIG1lbW9yeSByZWdpb25zLiBUaGUgVkZJTyByZWdpb24gaW5mbyBzdHJ1
Y3R1cmUgaXMNCj4gK2RlZmluZWQgaW4gYGA8bGludXgvdmZpby5oPmBgIChgYHN0cnVjdCB2Zmlv
X3JlZ2lvbl9pbmZvYGApLiBTaW5jZSB0aGUgY2xpZW50DQo+ICtkb2VzIG5vdCBrbm93IHRoZSBz
aXplIG9mIHRoZSBjYXBhYmlsaXRpZXMsIHRoZSBzaXplIG9mIHRoZSByZXBseSBpdCBzaG91bGQN
Cj4gK2V4cGVjdCBpcyA0OCBwbHVzIGFueSBjYXBhYmlsaXRpZXMgd2hvc2Ugc2l6ZSBpcyBpbmRp
Y2F0ZWQgaW4gdGhlIHNpemUgZmllbGQgb2YNCj4gK3RoZSByZXBseSBoZWFkZXIuDQo+ICsNCj4g
K1ZGSU8gcmVnaW9uIGluZm8gZm9ybWF0DQo+ICteXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiAr
DQo+ICsrLS0tLS0tLS0tLS0tKy0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSsNCj4gK3wgTmFtZSAgICAgICB8IE9mZnNldCB8IFNpemUgICAgICAgICAgICAgICAgICAgICAg
ICAgfA0KPiArKz09PT09PT09PT09PSs9PT09PT09PSs9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0rDQo+ICt8IGFyZ3N6ICAgICAgfCAxNiAgICAgfCA0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwNCj4gKystLS0tLS0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKw0KPiArfCBmbGFncyAgICAgIHwgMjAgICAgIHwgNCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8DQo+ICsrLS0tLS0tLS0tLS0tKy0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsNCj4gK3wgICAgICAgICAgICB8ICstLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsgfA0KPiArfCAgICAgICAgICAgIHwgfCBCaXQgfCBEZWZpbml0aW9uICAg
ICAgICAgICAgICAgICAgfCB8DQo+ICt8ICAgICAgICAgICAgfCArPT09PT0rPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0rIHwNCj4gK3wgICAgICAgICAgICB8IHwgMCAgIHwgVkZJT19SRUdJ
T05fSU5GT19GTEFHX1JFQUQgIHwgfA0KPiArfCAgICAgICAgICAgIHwgKy0tLS0tKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKyB8DQo+ICt8ICAgICAgICAgICAgfCB8IDEgICB8IFZGSU9f
UkVHSU9OX0lORk9fRkxBR19XUklURSB8IHwNCj4gK3wgICAgICAgICAgICB8ICstLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsgfA0KPiArfCAgICAgICAgICAgIHwgfCAyICAgfCBW
RklPX1JFR0lPTl9JTkZPX0ZMQUdfTU1BUCAgfCB8DQo+ICt8ICAgICAgICAgICAgfCArLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rIHwNCj4gK3wgICAgICAgICAgICB8IHwgMyAg
IHwgVkZJT19SRUdJT05fSU5GT19GTEFHX0NBUFMgIHwgfA0KPiArfCAgICAgICAgICAgIHwgKy0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyB8DQo+ICsrLS0tLS0tLS0tLS0tKy0t
LS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gK3wgaW5kZXggICAgICB8
IDI0ICAgICB8IDQgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiArKy0tLS0tLS0tLS0t
LSstLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICt8IGNhcF9vZmZz
ZXQgfCAyOCAgICAgfCA0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gKystLS0tLS0t
LS0tLS0rLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiArfCBzaXpl
ICAgICAgIHwgMzIgICAgIHwgOCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICsrLS0t
LS0tLS0tLS0tKy0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gK3wg
b2Zmc2V0ICAgICB8IDQwICAgICB8IDggICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiAr
Ky0tLS0tLS0tLS0tLSstLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+
ICsNCj4gKyogKmFyZ3N6KiBpcyB0aGUgc2l6ZSBvZiB0aGUgVkZJTyByZWdpb24gaW5mbyBzdHJ1
Y3R1cmUgcGx1cyB0aGUNCj4gKyAgc2l6ZSBvZiBhbnkgcmVnaW9uIGNhcGFiaWxpdGllcyByZXR1
cm5lZC4NCj4gKyogKmZsYWdzKiBhcmUgYXR0cmlidXRlcyBvZiB0aGUgcmVnaW9uOg0KPiArDQo+
ICsgICogKlZGSU9fUkVHSU9OX0lORk9fRkxBR19SRUFEKiBhbGxvd3MgY2xpZW50IHJlYWQgYWNj
ZXNzIHRvIHRoZQ0KPiByZWdpb24uDQo+ICsgICogKlZGSU9fUkVHSU9OX0lORk9fRkxBR19XUklU
RSogYWxsb3dzIGNsaWVudCB3cml0ZSBhY2Nlc3MgdG8gdGhlDQo+IHJlZ2lvbi4NCj4gKyAgKiAq
VkZJT19SRUdJT05fSU5GT19GTEFHX01NQVAqIHNwZWNpZmllcyB0aGUgY2xpZW50IGNhbiBtbWFw
KCkNCj4gdGhlIHJlZ2lvbi4NCj4gKyAgICBXaGVuIHRoaXMgZmxhZyBpcyBzZXQsIHRoZSByZXBs
eSB3aWxsIGluY2x1ZGUgYSBmaWxlIGRlc2NyaXB0b3IgaW4gaXRzDQo+ICsgICAgbWV0YS1kYXRh
LiBPbiBBRl9VTklYIHNvY2tldHMsIHRoZSBmaWxlIGRlc2NyaXB0b3JzIHdpbGwgYmUgcGFzc2Vk
IGFzDQo+ICsgICAgU0NNX1JJR0hUUyB0eXBlIGFuY2lsbGFyeSBkYXRhLg0KPiArICAqICpWRklP
X1JFR0lPTl9JTkZPX0ZMQUdfQ0FQUyogaW5kaWNhdGVzIGFkZGl0aW9uYWwgY2FwYWJpbGl0aWVz
DQo+IGZvdW5kIGluIHRoZQ0KPiArICAgIHJlcGx5Lg0KPiArDQo+ICsqICppbmRleCogaXMgdGhl
IGluZGV4IG9mIG1lbW9yeSByZWdpb24gYmVpbmcgcXVlcmllZCwgaXQgaXMgdGhlIG9ubHkgZmll
bGQNCj4gKyAgdGhhdCBpcyByZXF1aXJlZCB0byBiZSBzZXQgaW4gdGhlIGNvbW1hbmQgbWVzc2Fn
ZS4NCj4gKyogKmNhcF9vZmZzZXQqIGRlc2NyaWJlcyB3aGVyZSBhZGRpdGlvbmFsIHJlZ2lvbiBj
YXBhYmlsaXRpZXMgY2FuIGJlIGZvdW5kLg0KPiArICBjYXBfb2Zmc2V0IGlzIHJlbGF0aXZlIHRv
IHRoZSBiZWdpbm5pbmcgb2YgdGhlIFZGSU8gcmVnaW9uIGluZm8gc3RydWN0dXJlLg0KPiArICBU
aGUgZGF0YSBzdHJ1Y3R1cmUgaXQgcG9pbnRzIGlzIGEgVkZJTyBjYXAgaGVhZGVyIGRlZmluZWQg
aW4NCj4gKyAgYGA8bGludXgvdmZpby5oPmBgLg0KPiArKiAqc2l6ZSogaXMgdGhlIHNpemUgb2Yg
dGhlIHJlZ2lvbi4NCj4gKyogKm9mZnNldCogaXMgdGhlIG9mZnNldCBnaXZlbiB0byB0aGUgbW1h
cCgpIHN5c3RlbSBjYWxsIGZvciByZWdpb25zIHdpdGggdGhlDQo+ICsgIE1NQVAgYXR0cmlidXRl
LiBJdCBpcyBhbHNvIHVzZWQgYXMgdGhlIGJhc2Ugb2Zmc2V0IHdoZW4gbWFwcGluZyBhIFZGSU8N
Cj4gKyAgc3BhcnNlIG1tYXAgYXJlYSwgZGVzY3JpYmVkIGJlbG93Lg0KDQpJbiB0aGUgY29tbWFu
ZCBtZXNzYWdlIHdlIG9ubHkgdXNlIHZmaW9fcmVnaW9uX2luZm8uaW5kZXguIFZGSU8gcGFzc2Vz
IHRoZQ0KZW50aXJlIHN0cnVjdCBzaW5jZSBpdCBnZXRzIGZpbGxlZCBpbiwgaG93ZXZlciB0aGlz
IGRvZXNuJ3QgbWFrZSBzZW5zZSBpbg0KdmZpby11c2VyLiBTaGFsbCB3ZSBkcm9wIHNlbmRpbmcg
dGhlIGVudGlyZSBzdHJ1Y3QgdmZpb19yZWdpb25faW5mbyBhbmQgb25seQ0Kc2VuZCB0aGUgcmVn
aW9uIGluZGV4Pw0K

