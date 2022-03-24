Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3114E5C84
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 01:56:52 +0100 (CET)
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXBmU-0003zw-9Q
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 20:56:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1nXBl5-0003J5-71
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 20:55:23 -0400
Received: from mga03.intel.com ([134.134.136.65]:54967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1nXBl2-0002u0-6v
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 20:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648083320; x=1679619320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=JyHqsUHr/sTpJaOu0Uv8e2FAROSmwZJ5HnfIu0K7ejU=;
 b=aZ9Fadh+IkclOdmGk/p7XOGSdtn5sptiTbYnTWrNIXpXgT8sX7CMNl+4
 ucs0B0zfRRRtVXTzdm6jhSl9gC7ybc8G3khNjtKviebySZnUstSmYJ4OW
 dPwXx9Wz5TUECxKAeCLnDTZkkiDBA4acCBiAwQiwdCMT2UEjCUt4EaHlQ
 XiG0DgjJu0q4q/8GfC/BoLLDhYs23SIgtLlgObI83cUPMUjlmuo+3N8P0
 hYTnjyP15C56JvkeTJxfNaikTdP0J8O7ilU5v1S61jsyNF7TqEbqKe6qJ
 M/e3xuC3M6w0g5kNeQ1S7t+4YyIutrEUY8MoqqtXctSO6XVACsaJpLUKZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258213319"
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; 
 d="scan'208,223";a="258213319"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 17:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; 
 d="scan'208,223";a="544427774"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2022 17:55:14 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 23 Mar 2022 17:55:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 23 Mar 2022 17:55:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 23 Mar 2022 17:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdHqGZQVYGYLKVswhL9CmwXZa1L6bOkgh/7ltX7j9RbdmsIacVSmgpfNo0jXBiZZ9YitwsrhgBI2sc3fv2jDqeoLyDi4r4pxneNddBfXdVrorGpWwOfzZ/U4qfMoGx0LmsI8MzjJhlq5OaYjFFjV4yd3B079fAzpJ32TnG33jDa62xIUfkM4bjKAqbWIBrZeKxtxk372cp43sGDA1vJ8ulTk7rTL+gx+f515Z/F9mY5wmVDirz51qiQU030HuiEg4LgU/2V7R8hhGcCsvx78b5agwRy0sypxq3RzCgeAOEW51M/fnfXc9hyULcv/TRdotxM5kCa3VcpH8oYWiF4vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iFHOU6Vrsaq17CiG0aWu5WzjANSs5g4ZqnHndiWDBw=;
 b=RsQGjwfzJ8Qh4OMrHCtOPI/GeoF3kD6ikzU72p1lTpyaxGQj4vLrMM0tiDYusBcV98bQoL0X2C5j5EHwKBzqLJL/stwLgXWk1Qw40TJjLURlB6Dnq7oWgZSZdM2Jx6p29TK4YhYpEsp/PYtx1/Y2wb20T/84yZ1WKR0fTXeh4NgiOQQwQYdjQ1LKf/P525MkYoq6MInBaBqPjB30/QcD3ZKApYTSP//aEybMcWZSPCYDbzPmoCSEAX1F7ZTEJsj5ohu2/vfwCs2FBf3B+eniiUiQrPbPMdwWwO1eL1wS7c/Dr8MSLi13RJaSOdGUf/p4/a8TRAjFLPGAZdcjaWPlcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 00:55:11 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::bd50:e2fc:8f3:b100]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::bd50:e2fc:8f3:b100%6]) with mapi id 15.20.5102.017; Thu, 24 Mar 2022
 00:55:11 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <philippe.mathieu.daude@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH 1/1] MAINTAINERS: Update maintainers for Guest x86 HAXM
 CPUs
Thread-Topic: [PATCH 1/1] MAINTAINERS: Update maintainers for Guest x86 HAXM
 CPUs
Thread-Index: Adg4zt2a7QwPZGltSoa0MyKlq+7jgAGEcNEAAA4TMZA=
Date: Thu, 24 Mar 2022 00:55:10 +0000
Message-ID: <DM6PR11MB4090A58ACCA4AD8C752AEEA587199@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40905967203E4917E78C773487119@DM6PR11MB4090.namprd11.prod.outlook.com>
 <08b4756e-e27f-f8a1-8c9a-b0097c51bf3d@gmail.com>
In-Reply-To: <08b4756e-e27f-f8a1-8c9a-b0097c51bf3d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90325975-2f63-47b4-a8bb-08da0d30f320
x-ms-traffictypediagnostic: DM6PR11MB4641:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4641D87522B43F67A4EC49D687199@DM6PR11MB4641.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ICWLa03qa0H5G484OwG1ph+ELFivZaB+giyKbJh901e7zmDJfjqnn6pWpbuf0CbFf7Hhvqt0o1Uko94Di2P76WCDep+re43ip2uuwHPPOr9WYEHR3JObqU7aIlmg6WtaoWR0fnvA6u3jKQmdw291uNOJstBsmqUyhI5aO9vTj7veHFhIJKu0EqDx8gxz3mS+Gyd1hc59OfWRCyNvfYCd0VBnIHmg1GHilbF1v3MD1xN9H+mbjcrcMx+hV55VvjVzLqipiarsplFMWK1efiwlU6ZdTUlOg0jenHTnjRQz09EaLoYV3cmNTo60RW28EXdsUd21tRzZIESwig2bF0/DuaCeeDPcuP4w/2kss6VQyrSXWS2xeeQqxb2/dgVF0SV+v0jZhoo/WffQd2CL0c5kJMzgqLBkbhwF9s2eVvi2FpHLAEapTjOhXA5EcEblGNOx0WoohGLUrEHFsGPp2A7+Wv67mRggLVndxAQcankuwaGLaFe/lexsbjxs26W2ekLH1O5smjrieRbCdJvMMjLdItE7UQhK89/mkizcHj/RDExVcQQKwdINvqyx+uoqP03O4NYyKuCVlMyT4dadccwXQ86xtro/AE7rS1fbN/8La7nb9DiP+QJci0WX78TjtXNxhXcqESTa8RV2GGcrBFb4IgJm7RVz1piS/OnezUuxxQ79d3JnMN6UpP3A5TW2sJSzRUg6LevjZtG/6IWicT8Yw0RU2/OBM12nrDaJ4doxmWP4vipYJWXteHLsPC0q8opi/f9JT3fyyFB0tNhsZ1rqC40lGXbhIfxBQNymXYAKCU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(86362001)(38070700005)(33656002)(38100700002)(316002)(99936003)(122000001)(110136005)(54906003)(5660300002)(966005)(52536014)(4326008)(15650500001)(2906002)(55016003)(66476007)(76116006)(66556008)(66446008)(64756008)(66946007)(8676002)(186003)(26005)(53546011)(83380400001)(71200400001)(107886003)(8936002)(9686003)(7696005)(6506007)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVVPK2sxay9CeEFkNWFaUGF6UzEwM3FxS1ZnMjF4WWorUVp5RmlZaDBNK1VS?=
 =?utf-8?B?bk4vUVY0OWtSWnhIS1N3RG1HM1RCdDV3b0syMFFNSlRiWVVCcDM0V2hzbUpJ?=
 =?utf-8?B?dGpBRWhOakdvblJNSTJVdlRid3BGaDNwTXlXdHFMZ1czRFNLMmN4WTV0RW82?=
 =?utf-8?B?UlErUEI5c21lbE1uUUVCdlMxS3NpcTFqcXJab1k2WGRXcWNVYXlUbGhFTWN6?=
 =?utf-8?B?dlJZL0JpcjdrUCtjMHA0bWhIZU51SXkzSmIwUDBNVy9RQ2xlemtENnNEZUtO?=
 =?utf-8?B?YTdEeXRUYlRmaUxYdkNSRU5DNWNXSC8yUFJVMDJXR1p6dkozUUZsNmg3bHpH?=
 =?utf-8?B?d3VubFN0MW1zYVVUVnJ2RnBpd2x3eHkzMXhuQUllZkU3RE9Xa2pXY2ZTM29x?=
 =?utf-8?B?WXRhMkt3UzJlVjUxYXJadHlQYzB4Q2dyVXhkOWlRdEZyaUtvZm9uUUxrS0t2?=
 =?utf-8?B?YlQveW1LTWJLcXc5ZjAzc3Ewdlc3aGVSZXRUWmc2dWJncHhaTEZYS3IvSnF6?=
 =?utf-8?B?WmU0M3RXZlQ5cDkyd1RjaCtRSCtLd01GWlNZUFBWUUhieVBJSmtrSkhzMmZL?=
 =?utf-8?B?RFRtMThrZmtjNllaRjVYb3Y2NVB1YjFhb1p0N1B0RVluUHB5ZjdEUVFSZVlV?=
 =?utf-8?B?bDdRNTRrbUl4WUFtNkxxYzZwQUh4UGRBRFVDZ3pSWUV3YnRab1hwWjFYSlVy?=
 =?utf-8?B?dkRoUi9IRW9HZW9PUXlFTTk5OE1pYjlYRlpOV3hTZ1hyREdIQWMvTjNlSDF6?=
 =?utf-8?B?RGtta0d6S0U4cmw1MWEyUnBMa3djQ0RqUWtYQnZUcnhaalErVEhhQ2IySjdM?=
 =?utf-8?B?R1ljeGFKaWJNWENSNTVHNU9iU2NuZmc4OHY2WXJ5YkQzWUtJdnNZTmRndC9P?=
 =?utf-8?B?MERFUXB3NHRWQUhIRGlpZ1pFeHJUdUNsaVhyYmlJbnBmQUNQNG0rb21JMjV6?=
 =?utf-8?B?TTg0UTN0MlZaM3BaWFgrenJ0VTJjRDg2TDBJR1ZyMUw4M1k5VCtRQlpKdGlI?=
 =?utf-8?B?bitZUHc4aHg1Mk1hcks1OFFJSE9PY3NZOUpLS2lBeUlPRVNLZE9BT20reFp4?=
 =?utf-8?B?RWlieFd2MDJoMEI2ajhCK0luSmc5Qnl3cFQxem8vOGpJSWRHU1E4d2RwZkZ1?=
 =?utf-8?B?bkZsVEwxbHFNcXVRakphRzF2T2F4amZHVGwyaHRURGV1ZDFPbnpmRFhYOGh0?=
 =?utf-8?B?ZXpwRk9nczNRVmpVeDkxaEk0OHZhNm0zdUVHb1dqZXE1ck5GNGc1ZzJsWXlY?=
 =?utf-8?B?YTdrNUxhby9HTlFTYUJtV1FWOUpKQkx5cUJmOFgySEk5b1J1bnpScnFON2w3?=
 =?utf-8?B?Z1dmbWpZL3hwRlhsMU1wTzNwZ2xQeWFYY0N1ekcvZjZXL2RDaEFBV0Zxa2Qr?=
 =?utf-8?B?ZUFtZEU4dWg2MWxUSGJOUS9GbDB5Q0g1Y3AzWHhCU2UwZDNTOEhKN1pzSTdR?=
 =?utf-8?B?T2Z3ci9iTFo2Y2NZSHZYc2Y3dmNzb1UwbTdGcjdKbDRtUE5WdWZKV0FBMzlx?=
 =?utf-8?B?cnlGQXF1TGJseWpUMThBRm1YK1dVaGVkUm11T0N1Q0JXdXRnM2s0ZHNiYnI0?=
 =?utf-8?B?UGZwVndSZUxLQ0VTcE9yNDMrSTdSWFZRcXJFTjNIK0lqNjNqd1pmdGZ5YXJN?=
 =?utf-8?B?ekVHQUEyMDNkS08zckxlNHZQT215cU4vNWl5WHlGTWs4N3ZGZ0VDUFVwQ1N2?=
 =?utf-8?B?N3ZLdHNVdXBZSmpLWFZTemFTZVJ4a0R1VmpZLzh4ZnUzWFVZVDFMd2xOZmps?=
 =?utf-8?B?WkNOZms2bSt0SmwzTVJKeWY5R3VwWmwxSmhxclZPZmlVNGkrM2xqNWxBbXgx?=
 =?utf-8?B?TU1YaFdOOHVrN042Z0VmbUt2T1Y1L29xQUw0WGxEVHNxN0VoV0lEbzJxRXdm?=
 =?utf-8?B?YmIxWHVYNEdrbEpXUHdCNDVnTGo0N2tYSERHc1VUYjFkaElSYU1SSVVYSHlM?=
 =?utf-8?Q?WEV7kQbMgy08x2bHXgSwfaREvVJf03XP?=
Content-Type: multipart/mixed;
 boundary="_002_DM6PR11MB4090A58ACCA4AD8C752AEEA587199DM6PR11MB4090namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90325975-2f63-47b4-a8bb-08da0d30f320
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 00:55:11.3691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B2eq3rbqCEz7eeogx5U1Np1c1F/aZyovVpJGUorurpOSdpQvEIME6B+IZqML5rcMApVsRxCryd4M7H+DoUgCnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=wenchao.wang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, "Yuan, Hang" <hang.yuan@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_002_DM6PR11MB4090A58ACCA4AD8C752AEEA587199DM6PR11MB4090namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFBoaWxpcHBlLA0KDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkuIEkgb25jZSBhdHRhY2hlZCB0
aGUgcGF0Y2ggd2l0aCB0aGUgbWFpbCBidXQgaXQgd2FzIGRyb3BwZWQgZHVyaW5nIGZvcndhcmRp
bmcuIEkgaGF2ZSBwYXN0ZWQgaXQgYXMgYmVsb3cgYWdhaW4uIFRoYW5rcyBhIGxvdC4NCg0KDQpG
cm9tIDIyNTcyNzJjMDgyOTEwMDZiYWQ1ZTlhNDRmNDhlNzM2NWYzMzA2NDAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxDQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+
DQpEYXRlOiBUdWUsIDE1IE1hciAyMDIyIDIwOjUxOjIyICswODAwDQpTdWJqZWN0OiBbUEFUQ0hd
IE1BSU5UQUlORVJTOiBVcGRhdGUgbWFpbnRhaW5lcnMgZm9yIEd1ZXN0IHg4NiBIQVhNIENQVXMN
Cg0KQ2xlYW4gdXAgdGhlIG1haW50YWluZXIgbGlzdC4NCg0KQ2M6IEhhbmcgWXVhbiA8aGFuZy55
dWFuQGludGVsLmNvbT4NClJldmlld2VkLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBpbnRlbC5j
b20+DQpTaWduZWQtb2ZmLWJ5OiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+
DQotLS0NCiBNQUlOVEFJTkVSUyB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
DQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQppbmRleCBmMmU5Y2Ux
ZGEyLi4zNmY4NzdjZjc0IDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisrKyBiL01BSU5UQUlO
RVJTDQpAQCAtNDkyLDcgKzQ5Miw2IEBAIEd1ZXN0IENQVSBDb3JlcyAoSEFYTSkNCiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCiBYODYgSEFYTSBDUFVzDQogTTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFv
LndhbmdAaW50ZWwuY29tPg0KLU06IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+DQogTDog
aGF4bS10ZWFtQGludGVsLmNvbQ0KIFc6IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9oYXhtL2lz
c3Vlcw0KIFM6IE1haW50YWluZWQNCi0tIA0KMi4xNy4xDQoNCg0KQmVzdCBSZWdhcmRzLA0KV2Vu
Y2hhbw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiANClNlbnQ6IFRodXJz
ZGF5LCBNYXJjaCAyNCwgMjAyMiAyOjA2DQpUbzogV2FuZywgV2VuY2hhbyA8d2VuY2hhby53YW5n
QGludGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4NCkNjOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+
OyBZdWFuLCBIYW5nIDxoYW5nLnl1YW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAx
LzFdIE1BSU5UQUlORVJTOiBVcGRhdGUgbWFpbnRhaW5lcnMgZm9yIEd1ZXN0IHg4NiBIQVhNIENQ
VXMNCg0KSGkgV2VuY2hhbywNCg0KT24gMTYvMy8yMiAwMTo0NywgV2FuZywgV2VuY2hhbyB3cm90
ZToNCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gDQo+IGluZGV4
IGYyZTljZTFkYTIuLjM2Zjg3N2NmNzQgMTAwNjQ0DQo+IA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0K
PiANCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gDQo+IEBAIC00OTIsNyArNDkyLDYgQEAgR3Vlc3Qg
Q1BVIENvcmVzIChIQVhNKQ0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBYODYg
SEFYTSBDUFVzDQo+IA0KPiBNOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+
DQo+IA0KPiAtTTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4NCj4gDQo+IEw6IGhheG0t
dGVhbUBpbnRlbC5jb20NCj4gDQo+IFc6IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9oYXhtL2lz
c3Vlcw0KPiANCj4gUzogTWFpbnRhaW5lZA0KPiANCj4gLS0gDQo+IA0KPiAyLjE3LjENCj4gDQo+
IEJlc3QgUmVnYXJkcywNCj4gDQo+IFdlbmNoYW8NCj4gDQoNCllvdXIgcGF0Y2ggaXMgbWlzc2lu
ZyB5b3VyIFNpZ25lZC1vZmYtYnkgdGFnOg0KaHR0cHM6Ly93d3cucWVtdS5vcmcvZG9jcy9tYXN0
ZXIvZGV2ZWwvc3VibWl0dGluZy1hLXBhdGNoLmh0bWwjcGF0Y2gtZW1haWxzLW11c3QtaW5jbHVk
ZS1hLXNpZ25lZC1vZmYtYnktbGluZQ0KDQpPdGhlcndpc2U6DQpSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4NClRlc3RlZC1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4NCg==

--_002_DM6PR11MB4090A58ACCA4AD8C752AEEA587199DM6PR11MB4090namp_
Content-Type: application/octet-stream;
	name="0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch"
Content-Description: 0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch
Content-Disposition: attachment;
	filename="0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch";
	size=807; creation-date="Thu, 24 Mar 2022 00:52:00 GMT";
	modification-date="Thu, 24 Mar 2022 00:55:09 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyMjU3MjcyYzA4MjkxMDA2YmFkNWU5YTQ0ZjQ4ZTczNjVmMzMwNjQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+
CkRhdGU6IFR1ZSwgMTUgTWFyIDIwMjIgMjA6NTE6MjIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBN
QUlOVEFJTkVSUzogVXBkYXRlIG1haW50YWluZXJzIGZvciBHdWVzdCB4ODYgSEFYTSBDUFVzCgpD
bGVhbiB1cCB0aGUgbWFpbnRhaW5lciBsaXN0LgoKQ2M6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGlu
dGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPgotLS0KIE1B
SU5UQUlORVJTIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZjJlOWNlMWRhMi4uMzZmODc3Y2Y3
NCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTQ5Miw3ICs0
OTIsNiBAQCBHdWVzdCBDUFUgQ29yZXMgKEhBWE0pCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIFg4
NiBIQVhNIENQVXMKIE06IFdlbmNoYW8gV2FuZyA8d2VuY2hhby53YW5nQGludGVsLmNvbT4KLU06
IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+CiBMOiBoYXhtLXRlYW1AaW50ZWwuY29tCiBX
OiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvaGF4bS9pc3N1ZXMKIFM6IE1haW50YWluZWQKLS0g
CjIuMTcuMQoK

--_002_DM6PR11MB4090A58ACCA4AD8C752AEEA587199DM6PR11MB4090namp_--

