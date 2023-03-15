Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542196BA447
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 01:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcFKq-0006jw-86; Tue, 14 Mar 2023 20:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=431d3833d=wilfred.mallawa@wdc.com>)
 id 1pcFKn-0006jm-Iy
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 20:49:41 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=431d3833d=wilfred.mallawa@wdc.com>)
 id 1pcFKk-0005xg-TS
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 20:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678841378; x=1710377378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=38i02A6PkMVaHlpykwIsAxlX43rHIBR0+iiN03nz6D0=;
 b=ekgOcAS+qp+93287D4baz515q0epne9e//yHLiLRX3kWGFmE8O3mGxfo
 ZJfPRrWZa2IMRK2KN5bKosa7En0JP74B/oXH/iAYHm4lTgOjcXdsOIffo
 0Ni/hBq0aYciSzP3ctfvhqVMkNTyyEbEWPF2Dt0B/nYHmFcXT9qxWGn0Z
 yIl2OZsg5kX/1B7U1Y2WLL6kpGrHBzVgX/pnXuaxvyeThCRxjiR+gU+bP
 tPqR5pZTakkN/x7YFVDMkDIetYvW5HO0ELPCkt6fU1w3pcSfBVck+js/l
 oI7LnwIWCZ5efPzMsme8hPnL3cvQvbizrndnSnECjmMROW9FdIF3XB0Bt g==;
X-IronPort-AV: E=Sophos;i="5.98,261,1673884800"; d="scan'208";a="225643468"
Received: from mail-sn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2023 08:49:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xx5x9Sx6htFK/2fD16fl+VvjXI/ly4cYGQ2qoZI5kb5YlPbtqcwsm1s6LEKKrRvQxIYmgqSr0Y6JAKLJNkv4M+p+JkmTJIfdmaC/G9FahvrqtfsxWODuzDTC0q2gz2gyMqcI/8pAYs2QMLdaJHn9KcCbjyCZyBdvjpj2PRt6v73m7S7hc8cdferEc7aOgaa8KGjN5RGdNoFqF00lN5CJ8dgF0N9C4G574iQ829KNvlONnfR/zI3w87HDYD8SNgxKzeD0L0fNSCZtusZg3QubOSLCfh+tvz7obnyXZDfcM3jfK/MqmPz7p+REyaMlvYb7Y891DdeI36HPHWp8NDJ5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38i02A6PkMVaHlpykwIsAxlX43rHIBR0+iiN03nz6D0=;
 b=Pz4MVUYrnPNlICzlXgHq+22wT6yboIi+h5dVb1ppFKeduwG5zvYaST7yVoX8bWzRQYAOxzVrWI51oSmUYB0fRn2tyaZ0OmplP433ZIBdoV7sw1MPMkHn3BoJxIyprEknNt7AdKGYUyJ1h085n5N05SFg9FFpk2LUFOj+Zcbi1Nfq45V3C3i0U/h17NR/7llVv4i+nbJQmuiMmQOhEX2b0OgN3uok/2FvG+llqpWV5mSCXWuiqfymycu3JIYsP+xAEaPz3c7Jy2qH54V+eSSw51jM74tnu6GW+NHnIQn5M1FZqQvGVu70nHFV8lMuZNXOcFcnRelIjz7sMoihco9eGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38i02A6PkMVaHlpykwIsAxlX43rHIBR0+iiN03nz6D0=;
 b=DzP9Q0Qy5pwyvQq+A9tc9PP8W7juH+XROfzijEVYJ99SHwquVEPhh+S7Jp0maT2bkM76E7b1JPiuqopPi65pkXTmkhUI1t/pXXo3EsdSYwAMoRH6kgdAtC+nwcjYpUnfJamfSktDHHyjwyAC71yLqIxBqNDbWi+ryvvilJ47d5w=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by DM6PR04MB6841.namprd04.prod.outlook.com (2603:10b6:5:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 00:49:24 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 00:49:24 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] tests/tcg/xtensa: add linker.ld to CLEANFILES
Thread-Topic: [PATCH] tests/tcg/xtensa: add linker.ld to CLEANFILES
Thread-Index: AQHZVsHAmg4iq3hU3USiebQ8oLPKwK7673oAgAAHrICAAAtOgA==
Date: Wed, 15 Mar 2023 00:49:24 +0000
Message-ID: <a3e7da0f17041cc5a17cd8084072f30bbe301aa7.camel@wdc.com>
References: <20230314220832.2211028-1-jcmvbkbc@gmail.com>
 <6909cb4a238e25bfef9f216b7bdbfa0a20fda582.camel@wdc.com>
 <CAMo8Bf+4xCBuY=iNZG1e2XKgBbMzMyQQ_oRjZSo4U-YZq9uEgg@mail.gmail.com>
In-Reply-To: <CAMo8Bf+4xCBuY=iNZG1e2XKgBbMzMyQQ_oRjZSo4U-YZq9uEgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|DM6PR04MB6841:EE_
x-ms-office365-filtering-correlation-id: 1bc136b5-ca59-4dfb-f821-08db24ef1f3e
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B1C2KkLGArVMpuDCmlSrlkkXUYOQQo8A+RmGY9vUgp90xz+SyolY7En8S8cTzrmLQA5FNlQ7f/0S3HZ2dctuBbIC+dJux4xEJny3Q655NBh6YIvx3iKlwvUBDHBoP1myRDeCZeAojoCwWOrrhmmpHQqpa/IzIM6Xtm9IKrAUBDvUFUb5BRW3eARrrsZtf2l7AA8UB5s2U3dyVQzUqVCyFe7mso33yd23hzluREC5UUF+7Z4VqX0WyyCU2e5kjnVaRZDBJUWjLNAQESVfBHhQbPYRBIowx1QVqK17FelO1QmhwOWzt6O5OB/60mPFnLlghv/gAc/Z2PQI9n/q2vmjCGxgHfdC/9eWx+NoqUfgpnMcyGNq/KCQ4/6xavs9wIIOCy+8xsCpg0UxmdczIZenpmQ3IU5R6Y69BvhVN6eCWKTWFodCdQ+R7Pv6pqnRut5+HKTaan7eJ2w/a6F/xZaRK4AppYoNHHYCLcM/r2GDv2eICDs6H4ZjP/rtQz10WDo+SwcV5fOg81vP5cqn2mbtJhVUX77tdi8rgYWhuhRo7W9jfkebL8ZYeiuovTYixSr1jiBwZYkjwHTTrXOG+8Vi6omoODjWBnPrn876YN1F/8JUcnFkNVZFAVFUabWXxyDnoTRx/EMAWj+koR2y/4iXSc9g3SnHBuT965mrw7Do+dNjUkOCKLBOsnw3sPWrRhqilY9Jj5hv0IFeAS8kRvh97Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(8936002)(36756003)(478600001)(91956017)(6916009)(66556008)(64756008)(66946007)(4326008)(66476007)(8676002)(316002)(76116006)(66446008)(44832011)(41300700001)(4744005)(2906002)(5660300002)(38070700005)(86362001)(71200400001)(6486002)(26005)(6512007)(53546011)(6506007)(186003)(82960400001)(2616005)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzNTYkdxOGdVbEdZUzM1Y1kyU1FsSFpCYjhTMGJRZGw5WVB6QnFDOVFGZElZ?=
 =?utf-8?B?aGtCU0prY1pSNzIzZ2g2SzMyUjhHK3g4MTF2MzdtcEVFdzFhdTA0ZWtVRGho?=
 =?utf-8?B?OXQ0Uk5HQkdCMGJ0OGlxTmZ4UkJxazYzbGpCZjY4NlAzczFQRDQyd2paWXYr?=
 =?utf-8?B?emxRMmExazRTWHZoM2xtNVZHUkxycmtNTGVGdklKeGE0cnRuNzk5RndNaUNW?=
 =?utf-8?B?Z0JkWWJNSzZOdWxBZWM0dWR4T0VNMWtCUit1UUdwSzZzUTZIQndjeTRrczhC?=
 =?utf-8?B?VEVaS0FBSVhETDV6bnZNWXUrbys3aE1oSHFFL2FUZmM1N2FMZU9LY3pabGFh?=
 =?utf-8?B?QXpmZmloUkt2SjROR3F1QnFiN2NZYTR6MEg4TlIzeVE3d2hja0h0RkNUS2hq?=
 =?utf-8?B?ei9qemUvSFdhNm43N3ZSbzcvbXJCQzF1aDFZQnJ4NnNhQ0FSOFB1dUFCNFhQ?=
 =?utf-8?B?cFA0RVlOcHZWdy8vdnNteG5lQVQ2ZzBCaEdJdUxEdS9vbExiSHEzVkFEVytl?=
 =?utf-8?B?QTE2OHIxTDBla1h5Qk5lWjUyL0dxNVJoY0NBUWVLVEFZdEcwKzVhU1dMN1pJ?=
 =?utf-8?B?RFhkbHc2MWt5cDVlOHYxdjBhbzlEWnIwM2V0a1ZtUDc0WENLOCtoU3hJY2tT?=
 =?utf-8?B?bStjVi9qQ3F1aU5sQTZxQ1diS1FiZzNLSStFSi9va3lpS0hzL1FTYjBqeHVG?=
 =?utf-8?B?Q1BzYWVhSE9HcEZBTkpWblVOSk90K0Zxb0tuVTlKazFSZ0xNZzMxUmc3azRr?=
 =?utf-8?B?d0I5cE9iL3c3cXYzaFVQSUYzaFVwM0RlZ3BVeFBNdUpMM1h6OXhIVzA0Titr?=
 =?utf-8?B?Z0loRFpuTlE3dEFudk5YR0tURkVmb3VKSjduWVR3aGJpQWdUUzVLd2NINk9r?=
 =?utf-8?B?RWRjYUVoZjV2MG5FK2pJajhNaTBjTnAxOUNINjNPQVkyZGVtTy9PR0h1U1lZ?=
 =?utf-8?B?ekFzcFdRMkpEY3BnYXI0RjhJa1FrS003S25rejE1WEp4Zzd3cnFFazBNaEQy?=
 =?utf-8?B?Ymlta2Z5d3Q1QndUeEtYbG5DMkVkeEhsRmI4aW5qaHJWcU9EQU40OEg3K2k2?=
 =?utf-8?B?bVZoZGZwWlo4cnF6K2Q5Y1UvWXE2MlE3aW1kZDdmc1F6eTlPOVNvTHRoakV1?=
 =?utf-8?B?em8wejZsSmRLWElPeGxDNkxMT2t2emxkOUx2Uy9mOEE4dFNLdTM5aWp3bExR?=
 =?utf-8?B?U2wwT0IwdEFQNUwyZ0RhS2FiTmswbHE0RmkwMVMxSjNORmhpR2VrMzhOS1d3?=
 =?utf-8?B?WWdMZlFPYjdKZXFyWnJIRnFBUkpmK3ZveVNuM0NoMXpzZkNjazZDbWxwQmxW?=
 =?utf-8?B?WGg4WVJ4emZEQldtSmQyOXpQekl3Q2RseWdMbE0yenFRVytvSUZaUWJqVy9a?=
 =?utf-8?B?QU5KR3V0UkFYVTQzMjlOaml6UlhqYnNBY2RmOFZDVDA4ZEVxNGVXdlRnYzNK?=
 =?utf-8?B?ZEhDT3lkbnNPdnJJMzhoRDlaT3JOY1NaNW82TTFISGZVR1MxNVVERGhocEFo?=
 =?utf-8?B?SEVpUlpqeFNHaENFYzlSM3hYMG5ZRTRuTXdsaTB0WmlVSUpVMGVZS1VQbTY1?=
 =?utf-8?B?b3hlTmZ6UzNNSFNneEZsdnBYMlVNNFRRUG00dHlFMU90Q0RUd2ZOdkFMdzFP?=
 =?utf-8?B?WnV2V2M3eHhUTWhXSjdCSEhkRGwrdytsRGNJNmlyWHNvbG1nc1pCZGRFS3hM?=
 =?utf-8?B?U3E0UzVtL1lqdFZvSGFFV1kwdGM1TFRjaXV3d092bFVxRGttY0ZWekh3OXpJ?=
 =?utf-8?B?YlI0YWQ0ajU0VGhHL1ZuU05KRlk1T3FYY3d2QThnenlGVGRuVnpyTnRTbnQ5?=
 =?utf-8?B?YWR4eENYOFdmbURKRE5BOUEvTE5aSzVsazgvZWZ6dHNTRFVKdUkwSS9GemJY?=
 =?utf-8?B?Wmh0OHVzUDMybFJPK0g5YTYvbG92YmpkRlhqYWZ4N0gzSmlRU3lpbmQxQ3gv?=
 =?utf-8?B?TUVIVWlwTkxvc3RDVTFTQlU5ekNPUlM2TXNuVGUxc1psL0NzOUIwY3pGQWFh?=
 =?utf-8?B?RDVERGxRR3FjaDRNUEdEQ3pkd25kT3oyMDgwOExNWXdCdjQzMEM1c3NjTW1i?=
 =?utf-8?B?cklVN29Xc0p2a3VDUGdFM0w1SDhBNVllVkdydGhCQ1NFNVMyYm9yNWlwT2Ji?=
 =?utf-8?B?amRGTG1nbVB1bUFUelZGZmdaaTVMdWljamFUQm9lRXhOaXRuNkt4SDM3dHZl?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60612EE9423385439FFF1C8F72766AD6@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mHXqMAC5Rqdb2SBtAA3sm99ukqoVsvRnY3QhwUON5pMuWzFsyGoOSAURbi1YEP8cZFBqS0sb/eSc762NRgxX884Eegq18JVpbyaFCCnHJizCZBZubnvWD/MG3Ol+XCVNVmId86Vyq7KWPrkvy3O3tUwURpZxTOfWr05HiZHpaNR75rILZQhdMDw7kDAtB89nn6DIuiarMJV8JqKIfFWkMhsd0VBB9KDckdZiUtQCPR1l5efuwnR7UdruUhcyQdJ8qy9zzer3dS+pLYVvSYoJLTr8paErAQQMx0cfe0FlOTC23R7p44dTE/6fHO6MxX024eeSo2LnZP9OsAOy5ivS+bdPDeSOJjIi0NHLQGt5tG4vqG1hmCDKzlVBi4fIQUPaaGdt7+CB9FPd/HUYPU8170TixSbtvZ31Q99A3gRi7FRFbTHXf4m62UfY5xsCLwLf5cM8zuctth7776FFYIiEiL/MLkJIDH507GgUvebUdmIO2oEFz7dd5aOaFRYqCImk5lQIjboZtibXc/Ps/Di3mXS4fCx5cW4T9wXa7XSmAwQDSs8sMeKjBkz3mlYsEf37QKGTAc6Mv8CC6QnEB7rbQQGWyL5BdYmnBFzNEdZFo6vkBbDzmIz2Uf73NWquA92iLtastAmssD3j8POrvvJkZDQLdmczTuMk/I3Jc/+8+qDTUDjXjiYLfkjC4dLciCd0LXWwSvuPVGrpcK7Roy+PP513nGoAAgNRvZMvRaUikzpLPVas0ANVfkHzkWrztpeBt1I44VzHQ+5jLjvfnOr12cvavf9knuvPHtpwpZb1EMc=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc136b5-ca59-4dfb-f821-08db24ef1f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 00:49:24.2748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EX90ECcRi9LeurLAoTik/+UiBxFRDO8bQrT28npQOSS/6fAAdU8lgT1GOYU8eICdNBKL/s7cisNexSX0nlsLMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6841
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=431d3833d=wilfred.mallawa@wdc.com; helo=esa6.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gVHVlLCAyMDIzLTAzLTE0IGF0IDE3OjA4IC0wNzAwLCBNYXggRmlsaXBwb3Ygd3JvdGU6DQo+
IE9uIFR1ZSwgTWFyIDE0LCAyMDIzIGF0IDQ6NDHigK9QTSBXaWxmcmVkIE1hbGxhd2ENCj4gPHdp
bGZyZWQubWFsbGF3YUB3ZGMuY29tPiB3cm90ZToNCj4gPiANCj4gPiBPbiBUdWUsIDIwMjMtMDMt
MTQgYXQgMTU6MDggLTA3MDAsIE1heCBGaWxpcHBvdiB3cm90ZToNCj4gPiA+IExpbmtlciBzY3Jp
cHQgZm9yIHh0ZW5zYSB0ZXN0cyBtdXN0IGJlIHByZXByb2Nlc3NlZCBmb3IgYQ0KPiA+ID4gc3Bl
Y2lmaWMNCj4gPiA+IHRhcmdldCwgcmVtb3ZlIGl0IGFzIGEgcGFydCBvZiBtYWtlIGNsZWFuLg0K
PiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWls
LmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqB0ZXN0cy90Y2cveHRlbnNhL01ha2VmaWxlLnNvZnRt
bXUtdGFyZ2V0IHwgMSArDQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
PiANCj4gPiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiANCj4g
VGhlIHRhZyBpcyBtaXNzaW5nLCBJIGFzc3VtZSB5b3UgbWVhbnQgUmV2aWV3ZWQtYnkuDQoNCkFo
IGNyYXAsIHNvcnJ5ISB5ZXMgSSBkaWQuDQoNCldpbGZyZWQNCj4gDQoNCg==

