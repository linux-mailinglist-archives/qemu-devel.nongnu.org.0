Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931006F1385
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:51:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJnx-0004LC-9U; Fri, 28 Apr 2023 04:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1psJnp-0004Kt-Ka; Fri, 28 Apr 2023 04:50:05 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1psJnm-0006Sx-Ch; Fri, 28 Apr 2023 04:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682671802; x=1714207802;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8ehitX5HKdXQDqWsX2JdY8OUx8AXksmnbLGd81g5oqc=;
 b=jKCLkEoAz8OdBjv0UUkp/S3LFsl+oWL2xAL5fwSezDAGl/WFJfuQbMik
 qNTd3cVLuf5sTO0ifVrOKBu4ddjTPxX63WxSwOn1Skp1VL9CDV2C/+QIK
 /SEyctQgE3SMI6LT9vcbz3a39s6wGO/eYQ4yxRw11K134KJqJT8ZVUOTO
 nVqs4nvrMlKHcNn8frBuNAAWnpHQBOYF4C1p0/q4epirfN3wqFoxfd402
 ch5SlfziBaNHi2VuKT1SQUr5dJcTYxtf1eNf6ex+koAT8hIYwmzpecm4m
 23vBij5UO3oOA5fMM85hIIJYdQziy7PTEUPeiuE0IcSgQ6Ib0eF/UxAor Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349715039"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="349715039"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="1024540927"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="1024540927"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2023 01:49:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 01:49:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 01:49:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 01:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU/rYmeMVptGpr2+SseZZWipw37t9jaXwlm4F/9+1XUCHMqyxc5l2R0ERP90AGAf7s19JJSvysHT0KyRd8HQemJo9hHX6FA82ygIxk2TIEZQ1/GgLZZaRILqA0+WwOm72HLF8A+kFiLzsuTARkwDicaPHirTGa0IGbYzeumQUc08NtTsjlPNvbYuPfm7lXCrX2dzTVps9+9t6bCpOQv4tJR3vJTEp85roZVd7ddCtdauybULLeM3EElWzZOFx3mWlmyZqQGM0RegQhIBBpV+74CrgQXkTkSLwxGiydlHZ7/7CVrH5UeMz5BW5mH60p5YlGW9pLExYm8d/GBtSvMyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ehitX5HKdXQDqWsX2JdY8OUx8AXksmnbLGd81g5oqc=;
 b=EWR93ZfAEr9di9wfpLrJrDNlRKtvw2xNS5C2j7k9EXeIWn8FQ9ZanNYwKBiMF9HTzWwCkJOeAwtO7scZlz3zqdpOSxlbMOWhaIuaUVNM63cwcBas0vhgJWipIt9nhOmTDM6lFNtFkQG9LazqXwn/Im08lHl4abspU1YuQFhM0xDPBO7RR9P2tEEy+3ZbaGz4T2FJOHfSbw3QOdpAiEsBHRo4SjdQLfE+yccloqfT8wx3pbfl9rnhjUaSk/GUdtvBuiG5/82VLbtkuWdnFx8NGAwC2tyvhVmVZd5ZWaU4ILb/0RD+A9U7b1TIRQvCtRxtDGeOriTLvUDCPaOnuBvVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DS0PR11MB7928.namprd11.prod.outlook.com (2603:10b6:8:fe::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.24; Fri, 28 Apr 2023 08:49:44 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6319.033; Fri, 28 Apr 2023
 08:49:44 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Lukas Straub
 <lukasstraub2@web.de>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "michael.roth@amd.com" <michael.roth@amd.com>,
 "armbru@redhat.com" <armbru@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "Zhang, Hailiang"
 <zhanghailiang@xfusion.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: RE: [PATCH v3 4/4] configure: add --disable-colo-proxy option
Thread-Topic: [PATCH v3 4/4] configure: add --disable-colo-proxy option
Thread-Index: AQHZeUczFEqwIuLt2EC9eCIshYC2yq8/qTEAgAADOoCAALvcYA==
Date: Fri, 28 Apr 2023 08:49:43 +0000
Message-ID: <MWHPR11MB0031097654F13ACD68F8EA389B6B9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-5-vsementsov@yandex-team.ru>
 <20230427211856.54dd2997@gecko.fritz.box>
 <a3800d55-a232-dd3b-4c01-c4263d56a2f2@yandex-team.ru>
In-Reply-To: <a3800d55-a232-dd3b-4c01-c4263d56a2f2@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|DS0PR11MB7928:EE_
x-ms-office365-filtering-correlation-id: 96210d34-6c26-425c-e48f-08db47c5834d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l1WdD4g3GDiyclO5sO8rNTjBY9MQFCcbrGkynLWB+SP8Nb0cB/87hebZkpSpBKg1Utj1moA2LRrcvnW+ne9xOKeydgSdFET1GdB7g8Ej3EKbhpXp94JVHHXMEwEtNFsvzURVM5pqxSYCGisw4t8Bon8lmyYDIOKs+vVAkwknXv0LMOTBtuatDpZOLV1d0xdpxL3txtBjURmb9c55TIFiYeDMU432HfBUkMFUKWAO93hTpv4uCEtI4FhaOpY+hPvne7wvD1tbWALxkkMnp77Ov1bIMItG5ngtNj09vv0E+zUIclzQ18O+9UFjiek5boX7lQOBPvKgnB8rmIBX4FoO5uVheItZAV0gWKA45aU4k8soOyVT8fVY/zrJ537qp3V0RJp5ngJc89kE0PgUU92FpIiVb1N5xspfWrOAuJE2egOm+mPuOhfFxHVobTNnlRTyj7u2wG/N4khMKPf7M8+Vr+j5FVoUdx4vppBg6PCBwogaHmP2Cj6T4UPKXn+yXxrdkM6b5uAHxv4IKK1o1bEoUuoS45fNr7EGG61k3LhoEGG9uQ66Drj6v9oJBVGnWYE9DNCdqYFFtnJDdCzeIZdXUbFm2PFJFpXju9Gusp1PGI0YIssKtVtI2laN0LulO49u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(5660300002)(52536014)(7416002)(38070700005)(2906002)(38100700002)(41300700001)(122000001)(8676002)(8936002)(55016003)(86362001)(33656002)(54906003)(110136005)(186003)(7696005)(71200400001)(478600001)(76116006)(66946007)(316002)(82960400001)(66556008)(66476007)(66446008)(64756008)(4326008)(6506007)(26005)(9686003)(83380400001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDR2QTh5bWI5OURxL1VWaGJyZ2lpdlAwb0tOSjRYUFR3OWVYY1o2OWd3bEc5?=
 =?utf-8?B?ek5PTU9hZWdGeUo1cSthc0F6ck5EZkVCVFkzQ2JkczladHhrbTVDaUZHSUx5?=
 =?utf-8?B?ckZHVkJyYjRiZElCbzFqWlNkTVk2NzdrY1lBNE1pUHFZNVU4NWZPTHloSTdV?=
 =?utf-8?B?UXhPcGt5a2tlMVJNODNRUmoreEM4Vnc0bjB6SjY4dHhsL2VwMFlRT24zQUhp?=
 =?utf-8?B?UDgyaGFRdWkxQ1ZrSld6T3Q5ellIOUNPS1FlOHJ0YWhFV01lcXZEQkJYTkU1?=
 =?utf-8?B?ajhONjBYQzVjcDZzbUNLaHZnRUU5VXBwZmVFMGFPVzNVT3ZVdHJqQ0NmREsy?=
 =?utf-8?B?YlA3NkwyTXdLc1hPK0k4OGNtTWQyTEJvdUJqejhYNkdZM2c5V3NabEdyczlR?=
 =?utf-8?B?M0hxQnFWSDF1dHlmVDJYUUh1YlBwYzhydjJBLzVsTFhrc2UrNGRqQVdMRGFI?=
 =?utf-8?B?Mi9OeXVOVk92UjZUemdFemtEZFV4cnZ5bVRtd2hSZnd6TmdTTmFmOUx3a2Nl?=
 =?utf-8?B?L05VMzAwVGlILzVKRjVCbjlWN0JaNTZtYS83WnE1bG95cngvMmxBS2NwRzB1?=
 =?utf-8?B?bnhEaTJFSU9MU0c1K0ZGWlZsc1o2NkpMUVBYVGtvOVBLSUs3ZW9YQlNhWVZs?=
 =?utf-8?B?cFNyNURVaUxPRWFJUDhiN2UrR1RHSjd5T0xta1FNd2lSK0plaEpHOUw5dEJ4?=
 =?utf-8?B?ZVRKZFovUjlmKzlDNGthQ2hsT2ZTMDJ0UjhaZFBHTzZqZUNWbzhWbm45RldF?=
 =?utf-8?B?SVpVSUMzemVkalZjZjNFZUIvK1NjOEo3SHhjdEtvcm1OSUxHSjBMMkNFVXV6?=
 =?utf-8?B?bmUyUVdId2c5b2d6MUdySGczRUNnRE8rZ1RkRDdFTFJyQk9KaUJnajlsdEtn?=
 =?utf-8?B?d2JEUURTdWZsT21wQmhsZmh5MlUvMEZ6L2hESjZsZG5LV21SNmhJNDBNVWtk?=
 =?utf-8?B?SVBFRERZL2J5T0VuM29CQ3lLK0tZZkg0bXFqa3BORGFFREZhV0dpcXV2M1Vr?=
 =?utf-8?B?cTlmVFNWSVlTdG50dFhlUXB3aUFYd0F1UlZQV1gwZzdPQVdQZnZ4ak1xMlQr?=
 =?utf-8?B?eFROaTNOU2lHTlh0THhMVVlVVmlOOXp0d283YTFvQlVBWEJ4bE95VWg5WWVl?=
 =?utf-8?B?clhreUNGWktOOExvQ1NjOEViYW1LQ3dORWd4TkQxUytBMHZjQ0VYZ2lUSVY2?=
 =?utf-8?B?dXY0OCt2REhIMmZ1MmxDakI2NDVkdm9PRXgreXhhQnhMUW14K0xiMWZSOUE0?=
 =?utf-8?B?S2c5S2pGa1lUT0FkMHRId2RjSnd0U0hSR0d2Ky9sbzBIQXBTOWYvczBlOEtT?=
 =?utf-8?B?OS9WcURlMFI0a1BMNWh4a050cURTWjlnc2pTdS9FU1FWVGowVnpnOEM5SCt1?=
 =?utf-8?B?aldjTWRKNVRjbzFhOEJvc0NBekY5MTQrMVpOVktsMDhYei9JMlRNK1A1NGFT?=
 =?utf-8?B?eWg5amdNYk1janM2eFJlQ2pYVnJkanhHMUtrTzRRQUd0ZnJvSlNsWDZ6Z0lE?=
 =?utf-8?B?Q0F0ZkhnM0lxaG1FQ3hoNW41NVpTMDZWK0lta2lEUWJXZ1gvbnM0eUJYS3BQ?=
 =?utf-8?B?dEYvTFhsTFpMTWM5MmhtbWRWUlB3TExjMFhyRmhrQlFSMWhyYkNScEdmODRE?=
 =?utf-8?B?ZGdOSlpVaGhGRHVHRW91L3RZaGhjcmxheEd0SHVMRzFnMnpyeVhFYXRKVy9q?=
 =?utf-8?B?Y0ZrMXpVdkRFcjRYUjRZK091TnJvZ255M09yTFNlSWNJTE9yYTRtVXZqM1Mr?=
 =?utf-8?B?Sm5wc2V1VG5WSllCS1FiWXhzcTVTTWtFOVorNjl3ejlzc1ZhaXdoOVFHcENM?=
 =?utf-8?B?a3BoNUwxcWhubkhQM0RKZ2pmMW1RN2RKbktPV0NEekNBcjdhRXg0b3haY3Yy?=
 =?utf-8?B?MUZDa1hqNmRKY256OHBmUHRmeGdSSERZODAvS2xvZlc0cmFMTVlMQURwTXR3?=
 =?utf-8?B?OGxxVEkrNjZ4N0oyNTNIbTdkUGtEY2FxVDdHTFJIL0hDdFA4dm5Jbkp5emE3?=
 =?utf-8?B?WU5Iam02VDJTcEZUeDBQVnF3S0I1WU5iU3ZlL0x0Y2hpME9lUTZzbEkyZ2ZN?=
 =?utf-8?B?K0l0S2dOcEVNeFpKKy9kd2s0MzhJT0N2ZThqVjdiN0NHYmFjVVEzcjNjeXk2?=
 =?utf-8?Q?4Gag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96210d34-6c26-425c-e48f-08db47c5834d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 08:49:43.9625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1E9K0gCT5vrge6HAA3nmCnP0sqoteGsm58VxBxHt5jrYZAGf9DPSAdxpl1SLbOjRbjKjLC/abBj15KTEqzi+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7928
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogRnJpZGF5
LCBBcHJpbCAyOCwgMjAyMyA1OjMwIEFNDQo+IFRvOiBMdWthcyBTdHJhdWIgPGx1a2Fzc3RyYXVi
MkB3ZWIuZGU+DQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtYmxvY2tAbm9uZ251
Lm9yZzsNCj4gbWljaGFlbC5yb3RoQGFtZC5jb207IGFybWJydUByZWRoYXQuY29tOyBlYmxha2VA
cmVkaGF0LmNvbTsNCj4gamFzb3dhbmdAcmVkaGF0LmNvbTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsg
WmhhbmcsIEhhaWxpYW5nDQo+IDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29tPjsgcGhpbG1kQGxp
bmFyby5vcmc7IHRodXRoQHJlZGhhdC5jb207DQo+IGJlcnJhbmdlQHJlZGhhdC5jb207IG1hcmNh
bmRyZS5sdXJlYXVAcmVkaGF0LmNvbTsNCj4gcGJvbnppbmlAcmVkaGF0LmNvbTsgZGF2ZUB0cmVi
bGlnLm9yZzsgaHJlaXR6QHJlZGhhdC5jb207DQo+IGt3b2xmQHJlZGhhdC5jb207IFpoYW5nLCBD
aGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47DQo+IGxpemhpamlhbkBmdWppdHN1LmNvbQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYzIDQvNF0gY29uZmlndXJlOiBhZGQgLS1kaXNhYmxlLWNvbG8t
cHJveHkgb3B0aW9uDQo+IA0KPiBPbiAyOC4wNC4yMyAwMDoxOCwgTHVrYXMgU3RyYXViIHdyb3Rl
Og0KPiA+IE9uIFRodSwgMjcgQXByIDIwMjMgMjM6Mjk6NDYgKzAzMDANCj4gPiBWbGFkaW1pciBT
ZW1lbnRzb3YtT2dpZXZza2l5PHZzZW1lbnRzb3ZAeWFuZGV4LXRlYW0ucnU+ICB3cm90ZToNCj4g
Pg0KPiA+PiBBZGQgb3B0aW9uIHRvIG5vdCBidWlsZCBmaWx0ZXItbWlycm9yLCBmaWx0ZXItcmV3
cml0ZXIgYW5kDQo+ID4+IGNvbG8tY29tcGFyZSB3aGVuIHRoZXkgYXJlIG5vdCBuZWVkZWQuDQo+
ID4+DQo+ID4+IFRoZXJlIGNvdWxkIGJlIG1vcmUgYWdpbGUgY29uZmlndXJhdGlvbiwgZm9yIGV4
YW1wbGUgYWRkIHNlcGFyYXRlDQo+ID4+IG9wdGlvbnMgZm9yIGVhY2ggZmlsdGVyLCBidXQgdGhh
dCBtYXkgYmUgZG9uZSBpbiBmdXR1cmUgb24gZGVtYW5kLg0KPiA+PiBUaGUgYWltIG9mIHRoaXMg
cGF0Y2ggaXMgdG8gbWFrZSBwb3NzaWJsZSB0byBkaXNhYmxlIHRoZSB3aG9sZSBDT0xPDQo+ID4+
IFByb3h5IHN1YnN5c3RlbS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXINCj4g
Pj4gU2VtZW50c292LU9naWV2c2tpeTx2c2VtZW50c292QHlhbmRleC10ZWFtLnJ1Pg0KPiA+PiAt
LS0NCj4gPj4gICBtZXNvbl9vcHRpb25zLnR4dCAgICAgICAgICAgICB8ICAyICsrDQo+ID4+ICAg
bmV0L21lc29uLmJ1aWxkICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrLS0tLQ0KPiA+PiAg
IHNjcmlwdHMvbWVzb24tYnVpbGRvcHRpb25zLnNoIHwgIDMgKysrDQo+ID4+ICAgc3R1YnMvY29s
by1jb21wYXJlLmMgICAgICAgICAgfCAgNyArKysrKysrDQo+ID4+ICAgc3R1YnMvbWVzb24uYnVp
bGQgICAgICAgICAgICAgfCAgMSArDQo+ID4+ICAgNSBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdHVicy9j
b2xvLWNvbXBhcmUuYw0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWVzb25fb3B0aW9ucy50eHQg
Yi9tZXNvbl9vcHRpb25zLnR4dCBpbmRleA0KPiA+PiAyNDcxZGQwMmRhLi5iNTllN2FlMzQyIDEw
MDY0NA0KPiA+PiAtLS0gYS9tZXNvbl9vcHRpb25zLnR4dA0KPiA+PiArKysgYi9tZXNvbl9vcHRp
b25zLnR4dA0KPiA+PiBAQCAtMjg5LDYgKzI4OSw4IEBAIG9wdGlvbignbGl2ZV9ibG9ja19taWdy
YXRpb24nLCB0eXBlOiAnZmVhdHVyZScsDQo+IHZhbHVlOiAnYXV0bycsDQo+ID4+ICAgICAgICAg
IGRlc2NyaXB0aW9uOiAnYmxvY2sgbWlncmF0aW9uIGluIHRoZSBtYWluIG1pZ3JhdGlvbiBzdHJl
YW0nKQ0KPiA+PiAgIG9wdGlvbigncmVwbGljYXRpb24nLCB0eXBlOiAnZmVhdHVyZScsIHZhbHVl
OiAnYXV0bycsDQo+ID4+ICAgICAgICAgIGRlc2NyaXB0aW9uOiAncmVwbGljYXRpb24gc3VwcG9y
dCcpDQo+ID4+ICtvcHRpb24oJ2NvbG9fcHJveHknLCB0eXBlOiAnZmVhdHVyZScsIHZhbHVlOiAn
YXV0bycsDQo+ID4+ICsgICAgICAgZGVzY3JpcHRpb246ICdjb2xvLXByb3h5IHN1cHBvcnQnKQ0K
PiA+PiAgIG9wdGlvbignYm9jaHMnLCB0eXBlOiAnZmVhdHVyZScsIHZhbHVlOiAnYXV0bycsDQo+
ID4+ICAgICAgICAgIGRlc2NyaXB0aW9uOiAnYm9jaHMgaW1hZ2UgZm9ybWF0IHN1cHBvcnQnKQ0K
PiA+PiAgIG9wdGlvbignY2xvb3AnLCB0eXBlOiAnZmVhdHVyZScsIHZhbHVlOiAnYXV0bycsIGRp
ZmYgLS1naXQNCj4gPj4gYS9uZXQvbWVzb24uYnVpbGQgYi9uZXQvbWVzb24uYnVpbGQgaW5kZXgg
ODdhZmNhM2U5My4uNGNmYzg1MGM2OQ0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvbmV0L21lc29u
LmJ1aWxkDQo+ID4+ICsrKyBiL25ldC9tZXNvbi5idWlsZA0KPiA+PiBAQCAtMSwxMyArMSw5IEBA
DQo+ID4+ICAgc29mdG1tdV9zcy5hZGQoZmlsZXMoDQo+ID4+ICAgICAnYW5ub3VuY2UuYycsDQo+
ID4+ICAgICAnY2hlY2tzdW0uYycsDQo+ID4+IC0gICdjb2xvLWNvbXBhcmUuYycsDQo+ID4+IC0g
ICdjb2xvLmMnLA0KPiA+PiAgICAgJ2R1bXAuYycsDQo+ID4+ICAgICAnZXRoLmMnLA0KPiA+PiAg
ICAgJ2ZpbHRlci1idWZmZXIuYycsDQo+ID4+IC0gICdmaWx0ZXItbWlycm9yLmMnLA0KDQpOZWVk
IGZpeCBoZXJlIGZvciBmaWx0ZXItbWlycm9yLmMgdG9vLg0KDQo+ID4+IC0gICdmaWx0ZXItcmV3
cml0ZXIuYycsDQo+ID4+ICAgICAnZmlsdGVyLmMnLA0KPiA+PiAgICAgJ2h1Yi5jJywNCj4gPj4g
ICAgICduZXQtaG1wLWNtZHMuYycsDQo+ID4+IEBAIC0xOSw2ICsxNSwxNiBAQCBzb2Z0bW11X3Nz
LmFkZChmaWxlcygNCj4gPj4gICAgICd1dGlsLmMnLA0KPiA+PiAgICkpDQo+ID4+DQo+ID4+ICtp
ZiBnZXRfb3B0aW9uKCdyZXBsaWNhdGlvbicpLmFsbG93ZWQoKSBvciBcDQo+ID4+ICsgICAgZ2V0
X29wdGlvbignY29sb19wcm94eScpLmFsbG93ZWQoKQ0KPiA+PiArICBzb2Z0bW11X3NzLmFkZChm
aWxlcygnY29sby1jb21wYXJlLmMnKSkNCj4gPj4gKyAgc29mdG1tdV9zcy5hZGQoZmlsZXMoJ2Nv
bG8uYycpKQ0KPiA+PiArZW5kaWYNCj4gPj4gKw0KPiA+PiAraWYgZ2V0X29wdGlvbignY29sb19w
cm94eScpLmFsbG93ZWQoKQ0KPiA+PiArICBzb2Z0bW11X3NzLmFkZChmaWxlcygnZmlsdGVyLW1p
cnJvci5jJywgJ2ZpbHRlci1yZXdyaXRlci5jJykpDQo+ID4+ICtlbmRpZg0KPiA+PiArDQo+ID4g
VGhlIGxhc3QgZGlzY3Vzc2lvbiBkaWRuJ3QgcmVhbGx5IGNvbWUgdG8gYSBjb25jbHVzaW9uLCBi
dXQgSSBzdGlsbA0KPiA+IHRoaW5rIHRoYXQgJ2ZpbHRlci1taXJyb3IuYycgKHdoaWNoIGFsc28g
Y29udGFpbnMgZmlsdGVyLXJlZGlyZWN0KQ0KPiA+IHNob3VsZCBiZSBsZWZ0IHVuY2hhbmdlZC4N
Cj4gPg0KPiANCj4gT0sgZm9yIG1lLCBJJ2xsIHdhaXQgYSBiaXQgZm9yIG1vcmUgY29tbWVudHMg
YW5kIHJlc2VuZCB3aXRoDQo+IA0KPiAgIEBAIC0yMiw3ICsyMiw3IEBAIGlmIGdldF9vcHRpb24o
J3JlcGxpY2F0aW9uJykuYWxsb3dlZCgpIG9yIFwNCj4gICAgZW5kaWYNCj4gDQo+ICAgIGlmIGdl
dF9vcHRpb24oJ2NvbG9fcHJveHknKS5hbGxvd2VkKCkNCj4gICAtICBzb2Z0bW11X3NzLmFkZChm
aWxlcygnZmlsdGVyLW1pcnJvci5jJywgJ2ZpbHRlci1yZXdyaXRlci5jJykpDQo+ICAgKyAgc29m
dG1tdV9zcy5hZGQoZmlsZXMoJ2ZpbHRlci1yZXdyaXRlci5jJykpDQo+ICAgIGVuZGlmDQo+IA0K
PiAgICBzb2Z0bW11X3NzLmFkZCh3aGVuOiAnQ09ORklHX1RDRycsIGlmX3RydWU6IGZpbGVzKCdm
aWx0ZXItcmVwbGF5LmMnKSkNCj4gDQo+IA0KPiBhcHBsaWVkIGhlcmUsIGlmIG5vIG90aGVyIHN0
cm9uZyBvcGluaW9uLg0KPiANCg0KSXQncyBPSyB0byBtZSBleGNlcHQgZm9yIHRoZSBmaWx0ZXIt
bWlycm9yLmMgcmVsYXRlZCBjb21tZW50cy4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gLS0NCj4gQmVz
dCByZWdhcmRzLA0KPiBWbGFkaW1pcg0KDQo=

