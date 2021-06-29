Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE03B7676
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:29:43 +0200 (CEST)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGcI-0004I4-3z
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lyGbG-0003V3-Fq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:28:38 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:9180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lyGbD-0004X0-HF
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624984115; x=1625588915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9uGRheAnhL755CAf7zCIC/8b/UhcS+h2VyImB25S35s=;
 b=BOHrj2oKK8odnhCazyQ6Ec7XoXcIaKXiLfejbaS2OPXRcFlnpmcrbgPP
 Er4Bm4D4WUfMJaIfvl3DnQ9bIMTJhfoWNDUFwyphiwHGFnvGBDtiX4Aik
 IZAT32yL7TophOrmN+LbbgtY1QvwRjKflSRe6IKrG67pbooZfztg/qMBq 8=;
IronPort-SDR: nVrsmqWr3IHMszSqq4w/Y9+kiISrfu317B6s8T32s5NtacFcE0nu2CvkuOa66gNNfVH8RJ6Ohi
 UfK2VzJxiOr8sUY+zLcMXxGmn0fs0yzZ1hN7umtF+0IL7FdJJTnba8GsI2JzUqe05wft6j0BSm
 ky+KIXlT6lP7evAuGZ1G8NQW8hysvtK7Rb+Zur6nwx60u9zdRdANWNHuZbxgbRGhNTP3LEKtBt
 LZTc4j2O4v2+4KC9qagrB/n1ISR4byPGEAfIR3+z69a/ixOaKwgCf+GlanKkoTPanQdmHodp9M
 rUY=
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 16:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6e3vdDw3sd8+OXUFr8uhn26oQD8AzHzfgYxdNzqlS4NziXzAcnE5/nuMx+8KQB8kbTPTkhgtauMMkKJ1KmEprVJrMC4qOvsKu5g3a+R9kkkDQenwugCY72t8pxq0HQVAbJ8z5oRNBS/SFgWIXECRT44JPeobNNIXr6C92KTgl7tyXhFf0HVrb2iWNkjEtyf4NoKbFgIUQouLdcOIWF0jCUTHIHbtu4OT1ZKVMdJ9TkPMOqafwnNFhwxj4wkRIYigPiOObNxN0E2S1qZnAot7f9cblx5or4Tj4kwXvIqDFne0D+1DQAtYr2cJ2huyUqVAG78gexAf3ptcm43UzRhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uGRheAnhL755CAf7zCIC/8b/UhcS+h2VyImB25S35s=;
 b=f9NBJm+RxpQhtTE4BxAWGejViERM2m84qwsj8gRiGZ9JF5Xi1kYrKEcv+/35mASQSsyfTaSKp16ExyfKlsCey8A65ASDHXDhD9gk8XgwP74CaToCF+AkZrna4EPHOLrB/tqPh/imrGAQUYDZr8lKrK6jNh8TXt2Mdh0vaus2tDgtbGRilUevCmtIxMRrlIJQKw+M3W2FYD6jwry+RaU061os3oQuPHsErm6uFHEfv5nD9Gf7r/VNJ+aV1bHhPEhczRkYmATe25r0YwHZJDMv+rSIoabWZnA2ibhQaopCWwwAi8upm2RR0B0ifPHCDam5yZnGMp64rbGVxzASeILLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5046.namprd02.prod.outlook.com (2603:10b6:a03:61::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.26; Tue, 29 Jun
 2021 16:28:27 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 16:28:27 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PULL 0/4] Hexagon (target/hexagon) bug fixes
Thread-Topic: [PULL 0/4] Hexagon (target/hexagon) bug fixes
Thread-Index: AQHXZHUiWV+TEmZa40Gsl2XNMCSL3Ksq+MSAgAA1/uA=
Date: Tue, 29 Jun 2021 16:28:27 +0000
Message-ID: <BYAPR02MB4886ACB240BE85950BC5B4BBDE029@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
 <CAFEAcA9aVKvUM0JKk683mzBQnbAj=g=NnqwqQ-ANXO17ntNbBw@mail.gmail.com>
In-Reply-To: <CAFEAcA9aVKvUM0JKk683mzBQnbAj=g=NnqwqQ-ANXO17ntNbBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 021d52ff-1028-4b2f-32bf-08d93b1aecb7
x-ms-traffictypediagnostic: BYAPR02MB5046:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB504620EB330F067FE8D3B0D3DE029@BYAPR02MB5046.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: diuRXUJy3n3EXyeQ+AnxrukQYC0osUH/OJVbbn8ceXCs07Kv3/pgyB7JUZwxBSpf1H0fRl1rRDQTj59uAqIzQMe94tasFMDU99YolaQZNyQM3TyMrp/DxreFDZwt8Oz+FAMmmGB5mf3CJvrmmkJJ4FQmUK0ns/22VjKs/mqRr43luO+pNXgw+bASFyUxMQUZXuYHi6BXl/TcXOT4LnS4a2ry0lNNGvWy1W6nKz6CUFgjaslB9EQINO8S6P7YzkrzcQD6InI77nzuaOor4S3xC1oSIRXCfVrmbaX0J2X7nHdSRKGuaDmSaRSWC2cj6Keq9nKfPyd+Y2Viyk1sufhu6Ehi1IkL9q9AAPtKg+3oM7DmueTlK12R8IKB2N9uOGb8N07R4InVAMhLWUkczCjeNtrlpKnHl8iEKRVzst7/3hk9QsPIVGUtVnaXGPjGGkoHnC+2adFrp7n5I+usacpZ+q9ph5L5WNNIZRXutpQCiwfYDv+CgYzc+GGgvMFx/pBU6dUEBu7jNKCHY6gkHYPmV4Oa9CysSYMPfIfdiCnnsnXTSSXJILg2amRuqzzFrwzSw/Cr5qDqYGZFBKQly1H2SiyAP/oQVaCRKonmZVzB55pMo4SG2Fqu1qc+MvNpy2r2THg1ClyDPfLL5Hl+qOD2U3iWIPP2gyzwd68FUlqwKhz/zPA859z0F6fmS8yLnf4GOzEFMLXJU0LvdF7VbeplExcew55e+AqF7ENKC0vHueka7OOT24boA2bSSQD+9nyScx0vj0eyluTI6ZIDcR/J+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(76116006)(8936002)(6916009)(66556008)(4326008)(66476007)(66946007)(64756008)(107886003)(8676002)(66446008)(186003)(33656002)(71200400001)(86362001)(53546011)(26005)(52536014)(478600001)(6506007)(966005)(122000001)(5660300002)(7696005)(38100700002)(55016002)(83380400001)(4744005)(9686003)(54906003)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTU0YXhSZGRJaDRkMXUwWGJ3RGVobnU2MXRzRnpRQU5LNzdUb0pYandSMGc0?=
 =?utf-8?B?K3M5OElMSzNHK1ZrWlN1NC9USGRyQ0tncXBGdnpDOVVhV0dCY2grZlNSaWRx?=
 =?utf-8?B?ZjJsMVJyMDh6QkhLRUEzOG5sOHFmdWl2UWVUK0NWbGFHSERYQkRDYk9BTWdv?=
 =?utf-8?B?TTdSd3oxSEN4STFQMDV2d2tMVTFBYVVkTXREM2xSY09YOGhuNXJSQVpjbUpv?=
 =?utf-8?B?ZTZwVGZBTHQxRW9SbWpYUmRXSWg5K3NweWp6cmVVYW5BMU1weGcvNEl6MkFW?=
 =?utf-8?B?Vk51bW80YVV6Q1haNVBiSmVteEwvMGJndDE3dGJaekNpUnNZSndETk1BOWQw?=
 =?utf-8?B?VzFDa0gyNWx0b0lDVXJpcnZVeS8veWNmVzJnZnAySEM0ZEFhMmgwSW9WWWRx?=
 =?utf-8?B?eDJUVTlZZGJOT3NYeWRzQW5sc2d3YitVbE1KbXpDdzRRNXM5Z1N4WUJndzMr?=
 =?utf-8?B?c0xrUS9pdDdtT2tsWXU3aWFUZEZ2KzhuWDdrNjVIWHRVTHE1RmgwcDBhaEZM?=
 =?utf-8?B?aUIxc1IzOWFMU3BSM1pLVXpiZFhjNlBtOUlTTGNUZDRUYWR3Tm51TVYzZVhR?=
 =?utf-8?B?N3ZhQ3JLYkFwQm45Vmg0ZmJqb1BHTjlaUk0zaGJBTjZsREhjU0cwVFZ5cDB5?=
 =?utf-8?B?Z3FsNWYxOG5zVXFMMm1hQlhaNWNuU2xLb0sxVUFQSW5YS0dYWnpwU3cvVGgz?=
 =?utf-8?B?ZkxESHphV2hIY20wektPY3luSlNUbkNOYUx5ZlhjakhmVFg0ZlZKS3VRdTBY?=
 =?utf-8?B?ZnUrYWIyQ0JZUGF0c2wrT1ljUFdFWGd4SzBiVnc3SHBBaDk1SmRwYmdSNUZh?=
 =?utf-8?B?N2hTL0ZpMFFjV0kxNVRQT3RiY2JzOWRnanVDNXA2RDh5Q2phQWRlQVBJUVE1?=
 =?utf-8?B?RTArVUF5a2swU0FPNktGcVQxcUlIdy9nNExaN05KSmJOZ1N0eitERGZMdml6?=
 =?utf-8?B?WE9oZ0pKbHhzazhTVitadU1yc2tWa0svem1EMlBjOWxEUUZXVlpjc0JHK1lF?=
 =?utf-8?B?aUlZYzdSQVQ4bE8vWi95N0Y1ZEMyTVBFUkJCV2wxWUIwcnJOWHNWM29HOWxV?=
 =?utf-8?B?eVgwSTNweVFMUDZLcStSdGo3azVHZi9NVlh0Yi9uc09rL29DWVNVMmZnNkFJ?=
 =?utf-8?B?d3NtOWZmOEwyVi9tOE4xRW5KR2NqNXd2dVhCMEIzZGttUDJLRGpKbHJJMUdY?=
 =?utf-8?B?TGFDYm9rVUJHWjNuWEQwTDhWbTNoRDhQenEwV2ROT2pieTh0cUUvQkQwZzNZ?=
 =?utf-8?B?ZkxDb2x2WjYvcVRMLy9OQ2dmQng4RHZkZWdwT0hCL1FoQjJFOXBVRVE3R21m?=
 =?utf-8?B?d05QMXlHQ09YcjRMTlBGbUFvWW94S08zL3NheEx2VzlibzEzL1NrNEovNTMw?=
 =?utf-8?B?MTgzZGlLZXgvaWM2SHVoN3NkTUM2MStwNlRZY2lHamRiT0ZjS3JXMjNiMDcz?=
 =?utf-8?B?UDZjempoTUdZU1RHcUdwbVcrS3J0NE9ib2RrRHVkM2wrYTdEUjFMVDNLZkRF?=
 =?utf-8?B?K1F5d1VEYTFuN3dSUTBRSmQ2cGFkb2xFTURPWExDUDJiSzIxSGxwWXJHQkRu?=
 =?utf-8?B?SVhZSjhjclJUNXZSNEdWcVlHbTYyTkhDRnRBaUwrdGxSYUtrNCtlRVlLRVAw?=
 =?utf-8?B?THNBWHBaT2xxcGMvUHlSbnlCS1MzTmpWaU5CR0czTzNxblN0aVZaWHhRRWJq?=
 =?utf-8?B?eDF0UzFwTGlkRWJkSkgzS2lrZ1RlYTMveHVBRDhtT3BqbURjRVpqRTNWSGF2?=
 =?utf-8?Q?TdK42TNqO/XJzYELCmpZiMmdyZWHpg6VLfNkNQv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021d52ff-1028-4b2f-32bf-08d93b1aecb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 16:28:27.4664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygKfOf4PRwsqPyHJPnpzbOQeHnJjpodXcmi4OUchDxWPh6xfIPSmFRcpDRIzW88NiEAH3WIMDhczD6XDBiGTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5046
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDI5LCAyMDIx
IDY6MTggQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4g
Q2M6IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgQWxlc3NhbmRybyBE
aSBGZWRlcmljbw0KPiA8YWxlQHJldi5uZz47IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT47IFJpY2hhcmQNCj4gSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnPjsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUFVMTCAwLzRdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBidWcgZml4ZXMNCj4gDQo+
IA0KPiAoUGhpbGlwcGUga2luZGx5IHJldXBsb2FkZWQgeW91ciBncGcga2V5IHRvIGEga2V5c2Vy
dmVyIHRoYXQgSSBjb3VsZA0KPiBkb3dubG9hZCBpdCBmcm9tLCBzbyB0aGF0IHBhcnQgaXMgbm93
IHNvcnRlZCkuDQoNClRoYW5rcyBQaGlsaXBwZSEhDQoNCj4gVGhpcyBmYWlscyB0aGUgImNsYW5n
LXVzZXIiIGpvYiBvbiBnaXRsYWIgQ0k6DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2pl
Y3QvcWVtdS8tL2pvYnMvMTM4NTI2NzAzOA0KPiANCj4gLi4vdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmM6MzA6MjA6IGVycm9yOiB1bnVzZWQgZnVuY3Rpb24gJ2dlbl9yZWFkX3ByZWcnIFstDQo+IFdl
cnJvciwtV3VudXNlZC1mdW5jdGlvbl0gc3RhdGljIGlubGluZSBUQ0d2IGdlbl9yZWFkX3ByZWco
VENHdiBwcmVkLA0KPiB1aW50OF90IG51bSkgXg0KPiANCj4gKENsYW5nIGlzIHBpY2tpZXIgdGhh
biBnY2MgYWJvdXQgbm90IGhhdmluZyB1bnVzZWQgc3RhdGljIGlubGluZSBmdW5jdGlvbnMuKQ0K
DQpJIHdpbGwgZml4IHRoaXMgYW5kIHJlc3VibWl0IHRoZSBwdWxsIHJlcXVlc3QuDQoNClRoYW5r
cywNClRheWxvcg0KDQoNCg0K

