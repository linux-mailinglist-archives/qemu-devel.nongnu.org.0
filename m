Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881586B8634
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 00:40:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbrm9-0001wi-06; Mon, 13 Mar 2023 19:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42916f15d=Dmitry.Fomichev@wdc.com>)
 id 1pbrm6-0001l5-B5; Mon, 13 Mar 2023 19:40:18 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42916f15d=Dmitry.Fomichev@wdc.com>)
 id 1pbrm4-0003n3-92; Mon, 13 Mar 2023 19:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678750816; x=1710286816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f8/JtstsLE7C9Dxm9su7G9vex1Z0pqCgg4n76kvGfyY=;
 b=HvMYaEjhw4JNTtzXiFMpHEl5+OnMZDHTK3H+Njr0fploibvFCSFZHU5x
 SrsoDyErxegAdg1DsQjELi4PpduJy4GwawvY617NiBw2qxX3pENt3GiVi
 kjyI8Ve+F8YZIucuidon6DzF61osrVS1KdkPqrG63FFwexk9Vf7ccHUlx
 A2dtmdSqG7mwOgQ4CYS7q7dILYxXp23s1lGpryKWBESa8xK+9c4uKXiXg
 DE4hCSd8UaVdQaosocmkjJ8TiMe0pTyZNKVOJWqvH0To3aHxScmK+NfVe
 sthcOU2VLZ3O56W66l5gxtqULlmBGnZG6u26rCYIwpS3OAp25OTLx7IED w==;
X-IronPort-AV: E=Sophos;i="5.98,258,1673884800"; d="scan'208";a="329925043"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 07:40:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5Vs1xQ3pzh1PrmntxtAFTdwebXCS0cdKu6ln6B+w7cmMimvYi1ExUTcWj2A6pqLx3ThmRuSzQzv//X5THNVyUky5lCLU1asLmhIakO7uCC7yOKAsqBjWo09bWoS0vD1tlCZLst3khAw5M7Opat6vbM/24J7IDTZFj5OhT73gXe/+C7vJxn0Tmtw1LszBWqYsU88uo4ujqjBjPMgt61tNLKA9fghQ3XQzqJ3EJdZiUoq1V8JgrjPEzIULUgseYcGM/EcZh7ScpYRl36lSd3GSgHQUU4StXryVQH6zI0fMXQezGvLYKwg7qHfnBmh549OZGSIFx1bMK5zUIT34X5K8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8/JtstsLE7C9Dxm9su7G9vex1Z0pqCgg4n76kvGfyY=;
 b=Be/pPpBUP4muC2Mk1E0AAl+icNEpORo8AGYPVjYRBqK0YVcUAuHMUxRZmKc8etbD42EwerkZ8VkTCiQGAHVUCu8gqwBg893cWx/ksJRmlmDGuN61bvSwxrvQ/MbHDgCXovfId5mwyRmys22dK+FsCHGu1eatF+arIWMm2xEYJtPjihuAwQPMAztaHF7pjtPS2N8hmBd4RH8IbQ1ggFKsZzUAypBsPTRYIXCRjwodvS81HeWoTKHvQzxWsZBzA9SV6HtfcdHJj0WlcFQpbscnafev+WYeVCimCb2drupVaMspbOJugXsn2LXXDUVnEdm3qJPmS7UHt7Hpp/WFq7xzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8/JtstsLE7C9Dxm9su7G9vex1Z0pqCgg4n76kvGfyY=;
 b=bfjW7+bsP0826WnX9TZK9v4kNjsyiEuWnVz2z9iK33b4YPAZBxXTrKq+Pg235Tg16pmKvi99VAKQyxeG8W5wh5wKL4mkEIGYUlO+Z0kkYGNKLEkEEckUsD+A19abFTAJT5U24k/AkRqrcEygnMRHjclfuZrVvZxlFTMO8M2V8tk=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by DM8PR04MB8103.namprd04.prod.outlook.com (2603:10b6:8:2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 23:40:07 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::9171:c66e:ce90:6c24]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::9171:c66e:ce90:6c24%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 23:40:07 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "philmd@linaro.org" <philmd@linaro.org>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>, 
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "damien.lemoal@opensource.wdc.com"
 <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v16 7/8] block: add some trace events for new block layer
 APIs
Thread-Topic: [PATCH v16 7/8] block: add some trace events for new block layer
 APIs
Thread-Index: AQHZUzqLrP8xsAjV5UeV/r6goDaQa675Y9OA
Date: Mon, 13 Mar 2023 23:40:07 +0000
Message-ID: <75f3fe5135a9728cd2717e81c20ac1a4762381b9.camel@wdc.com>
References: <20230310102403.61347-1-faithilikerun@gmail.com>
 <20230310102403.61347-8-faithilikerun@gmail.com>
In-Reply-To: <20230310102403.61347-8-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|DM8PR04MB8103:EE_
x-ms-office365-filtering-correlation-id: 631cedcf-1ee1-4de1-b189-08db241c4740
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZ+OGIrijKY21BIYQgs83UV5hhxKw0SiLsdAJSF0q9q+Fntd0hBNp/oS/RRjdioqgxPA9URvwoqFSdLU8Al96q5h/w0jacDFpB+RxBZVSnZ+Ke3HH4XTTmi3Qul8DkEh0TaH1E/2uBWuCA126Asvv1BqqIeWbpubcizgXGEYr0BRXPIcD/N5nvsxWud0T+DzZD8Ca5U4+vMmuQSL6WoaiUH6ExRs/paL/SpzaHpr/uX/uYy2lKoHyaStNo3d61DApgJpW5BEzH+6dNMbN4ONEOMb3K9mSS5p/v40PWaxTT1/R9s3C8gxISMjWc0LgC+hnEm/zHLizN68ta9YMgSECZjqQzfFMDIudyOA3AKksOvqo0MB5FP/GhX9JRDQRa6oSh7jlY8qSJJLXg1U4kmoN8IhF3wfmaAW5oNpdD1ujpOZuMg+8ZY/LWhOlOVs3QmkG+AMRSSHk99QwzUSqIThrZby+YMWqUF0l2uAiRcCZlxfg4ayniPTYwYZPSkxMbb2H5rrAhw0qS01/BU1TMXWSqGj2BRMXlq7HHgt1gdqf1wSPBdeJJTwtjI8oCfsJXnwa4VrBAwFxVbyvfVQvgnWmaEPVlo6CTIkvwTScgki7In0WpNEclae5O/Y5kJNOYNqTrCPGxDU9Cj19QbXDhWTjCgFh20x0vOC9YHX1J6mvfeIqlomuJw5yq0nhTDZFGGevbNSN8wQZfM3Z/A/Z9NXtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(82960400001)(71200400001)(2906002)(41300700001)(8676002)(76116006)(66446008)(66476007)(4326008)(64756008)(66556008)(36756003)(316002)(478600001)(86362001)(54906003)(66946007)(110136005)(122000001)(38100700002)(6486002)(38070700005)(5660300002)(26005)(6506007)(6512007)(2616005)(186003)(7416002)(8936002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2RIRVp1S0JHdi9NcU9Oc0x6RjFmNFdJcVJWSnhqSkRMa3ZiSUcxa2JzMUgz?=
 =?utf-8?B?VkdzdG84TDNkcGRBaDJNTUhBQzBMMTQzSXdHSjE4OVZFUTJNMHJaSXcwUGdI?=
 =?utf-8?B?aDBCbWVNUmJTTUNxUDlvWTYraGxmbTE0MGhBZnFvUkdGSmFKTmJ6d1gyZlBh?=
 =?utf-8?B?Mm4rWTkxbzNoempiVmd2Ylg1SGpheVpaUlVxaGdWSmI1djF1YXVybWRLQUtQ?=
 =?utf-8?B?Q0J5cVE3VGFxVktkVjgvOFByVWgwUWE2TUU5OStiNmE2VmZaOUFYVXQvdnhn?=
 =?utf-8?B?TTVKYzI0ZFFpbUJUWXZBTHhqTGdENG5jZmhJcHRMUzVkaW5XRkRmcURPcGRM?=
 =?utf-8?B?WnpNUklxUWhrbk1oaDU2NXN1ZzNreFZRSHRZMjArNkkwdU9pL0ZzK1BjcnU2?=
 =?utf-8?B?dnRXUTFoUnpXaUNkMnBGSHpLK214dE5hbHhwSFJDWStLKzlWNndidTNYVm1U?=
 =?utf-8?B?TVJVdE5KTGI3RVF1U2tyOWlMS254VlJ3OVEyRWt6cUJzeVB3Tit4WVFVdjVk?=
 =?utf-8?B?VnUrRHV4azNCd21TakUwWU9MaGIzdlZyeXZEdW5rL1J0aGU3VmFWZnp5bm9K?=
 =?utf-8?B?YS94K3NRaFhZRVF0REVtaWpvUmFmQWphYUtPVk5mdk9UM0c4MytCSTB5OEo4?=
 =?utf-8?B?WjM0Um5aVXdyUmsyS0RGak5tR1VOT21vVlJlNFAvcnMvRk5WeWoyVjN1c09w?=
 =?utf-8?B?ODJ4b0pTMGY2WFdPZ0h6Kys4dDJoTmQ5dVVjQktGcjNYUEg1VmxlQm04QTMz?=
 =?utf-8?B?VXMyRVdaVE9yZTNvWDlpK21JN3Q3MWN1eHFVQmxwY1FEMERjdk5zT1pKdlA1?=
 =?utf-8?B?dkJyRWUzUFhQTTQ1OUtwN0swOXpOQnV5S1RwOVJ2QzNUTEhvaXhWQWVXZ1Vt?=
 =?utf-8?B?NVdUQlpNWkhCYkQrK1hObytDaVFZY0d0VTZFNU9mckZjTnpYNHlzYmZ1cllo?=
 =?utf-8?B?UlR6NzhFVm9jeWhFU0VtcG9ReTl1cmc4cnBGUWI2YnV6VndDVGhydEVYWDRO?=
 =?utf-8?B?czdGcW56VUoxTnRhWUJIMS9xbkRxbzRpaFdwUlRkakFsaU9waTgrWVNUTUlq?=
 =?utf-8?B?Z0VJMzFyWUtsWnMvV3duc0NCL0xDNzBVUmNVVnlMVzRURUs5bmVQdlNXcTNH?=
 =?utf-8?B?dzdDZ28vTWFPcStLNFFtQ3RObkdlQzZrR2FCOGhKSzJUZFlrNzM4QU0rdzJx?=
 =?utf-8?B?MGtwZCt1cGFKUnRuZWdBUXVCaHpaYjJuSzkwb2ZSNnN1b20vVmwvNjNYamdS?=
 =?utf-8?B?Rmd5M3Rrakd4Qk1XSTJFclhhZmsrNWxRYXBzYWN1VVhoTHhGSTQ3SCtEdGtJ?=
 =?utf-8?B?SnM1ck92WjBIUXhNa2ozOEtOVlA3YlJ5UXllZ0hsR0lSbTM0K1NWMlRFS1la?=
 =?utf-8?B?enlyR1p2Nlc4dmFwUGh3MHdVOWhkWktOWmtib2VlS1pXTG1yTmJCRlRKMW9p?=
 =?utf-8?B?M09BZzBncFp5WVQ2VDU1NWx1VWF0YS9BWVBIQ1BPY1NIL2ovazYyc0U1TEVu?=
 =?utf-8?B?aVdQWWhUOVhpZ2MyeFVQRFBiajNtSi80L241L0MveVJsUVRXaVFmczFqcGcv?=
 =?utf-8?B?YmUyamtZcGh6OU0xVlgrK1dYK0xnRW0vUkdrVkVmR29jeFl6eVpsVXFKS0lR?=
 =?utf-8?B?YklmdTNlcXZtR0J5SHREb2l4aHFYenlUOU9NYzY1eGlXS091c0VyUXFrOUpC?=
 =?utf-8?B?eGhlelRWR1o5cjliWjBidk1vNEQ0MjlvS2JRVGxqL0lFMDhNK0tFY1dPcDlI?=
 =?utf-8?B?eVdUOWFUaE9iLzNuU3NINTdHK1BoSkRkbVZsVkl5SUdXMjZSZVVHcytXTzFT?=
 =?utf-8?B?RWdlV0F2U0x0R0ZpUXZzWk5zTitJVDBuOStLMHI1b1p5azljYzV1Y25RTDVQ?=
 =?utf-8?B?Y09VU3VQeHJ2amU2K0ptb2w0RzNtZC9LNmNsaGlGcUE1N0pGQWJnL3FNWWMx?=
 =?utf-8?B?aHdqSG9KV1g2SCtXS3YwV24rdHhIOW42UUp2ZG1aanFQVFh6eGlDTXJFT1Mv?=
 =?utf-8?B?emt5WTgwNDlCbm5NV3VST2VGUWJGVUtRY3dFTWcwQkcwZnJBdlFtMGtCRHNL?=
 =?utf-8?B?KzNuMlVYMlJKdHBleG1lWEZJUnlobC84NUpmbVdGYWh2VHZ6djJtdXpwakdX?=
 =?utf-8?B?L202Q0dkUjdjYkdlWC80UzRpK2RSTXNFU201YlpObnNLUW1NWmE1TnM3Slky?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A03DAE43E15B2478D423D4970FB8A41@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: j03jZinY/Evj2rpwaJgn0L4l/Lh/sAkNhkvcDzj64kYAyzPccMJe9DRqtap93UiJKUKPabMHS2dCmGuOgrDN7FcWeTbC6yarFNvyfe0VnuDczf7d09cOo86Zz/2urs/qNQdBKnjfXYv9IMesBgCAz5h9bjNWvrDgWkqbM9Abzh4DQj0IE5pP4pQfEMo7XOYd0mRBcpCG9M/C4nlPaov2ldOrV+u5fun92BxUM3S/FCqn0VZ5V78JaDnHb67TdTiV/zjCNn4jzLtnBIj3eFoPEZJSXQTv6B6tD68+UWhQacZrFyXHwpXmoo+I+cuCGwjo0UeQZxZDhqxljgg5GUxRzjE0s5nHnKZRSaqsYAnyOuuD1y1gzA/jaabAqSr8BY0itNpptK7ka/KnEKqM8NlTaakK74+Ydbvw8UaM2u6j2uyTilQ0mgf6rUKxenbQ2Ye29Vudey5NoT2KsolMvkKUkMyDiq3Dt4o4Q+lxbz+YIh2a2HHBjj7gm8Wyx94yArHO6l9gcoVO0kZua+96E0KvpUaJz17n7oR5XFPyl/YIFnmxpU4++zJB4LH/t3Jamj/uBnBz9ClCSHPYUPlzd35QSmiWvlZvcYB621O+0LbEEUtKZ5FCTWMZ+IkZ6kAZcJLB4zcB+d2ZRYnpJFbqWQJkgPKI78/K2+Di5QTBgn/oRYfmFSFadjWUv0UFNni5f/8tiImzeFDU6qj7dGPJkVycubsVxwA/SYz1hiaJBjtG9FAxBW2a8fmwIeERPeXgpuNrEDYeqLyJ9DNyq4CcaFcS8u3uAaw6Q0dagg0k/ZGnJPm34Q5yFVcHPj8/d0fiD9s3S3EsQ2ffQt9QuZcOwiiZZ8my33ZEHXIpbcJYQljvz9Wv1RH7W3C7ivcXcbXcXg03jQRyABc8kQ+ZExESw6kSYQ==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 631cedcf-1ee1-4de1-b189-08db241c4740
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 23:40:07.5538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJO4EtFV4Z7lbmfer03aKI5Y+GjN78+1aq1j8p4H+rdGLc61oBjelgkL3VHP0x2/wvMvN1+iZ/tu4b4vp1saDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8103
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=42916f15d=Dmitry.Fomichev@wdc.com; helo=esa2.hgst.iphmx.com
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

T24gRnJpLCAyMDIzLTAzLTEwIGF0IDE4OjI0ICswODAwLCBTYW0gTGkgd3JvdGU6DQo+IFNpZ25l
ZC1vZmYtYnk6IFNhbSBMaSA8ZmFpdGhpbGlrZXJ1bkBnbWFpbC5jb20+DQo+IFJldmlld2VkLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQoNCldpdGggb25lIHNtYWxs
IG5pdCBiZWxvdywNCg0KUmV2aWV3ZWQtYnk6IERtaXRyeSBGb21pY2hldiA8ZG1pdHJ5LmZvbWlj
aGV2QHdkYy5jb20+DQoNCj4gLS0tDQo+IMKgYmxvY2svZmlsZS1wb3NpeC5jIHwgMyArKysNCj4g
wqBibG9jay90cmFjZS1ldmVudHMgfCAyICsrDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9ibG9jay9maWxlLXBvc2l4LmMgYi9ibG9jay9m
aWxlLXBvc2l4LmMNCj4gaW5kZXggMmVjZWIyNTBmMS4uNTYzYWNjNzZhZSAxMDA2NDQNCj4gLS0t
IGEvYmxvY2svZmlsZS1wb3NpeC5jDQo+ICsrKyBiL2Jsb2NrL2ZpbGUtcG9zaXguYw0KPiBAQCAt
MzI1Niw2ICszMjU2LDcgQEAgc3RhdGljIGludCBjb3JvdXRpbmVfZm4NCj4gcmF3X2NvX3pvbmVf
cmVwb3J0KEJsb2NrRHJpdmVyU3RhdGUgKmJzLCBpbnQ2NF90IG9mZnNldCwNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgQmxvY2tab25lRGVzY3JpcHRvciAqem9uZXMpIHsNCj4gwqDC
oMKgwqAgQkRSVlJhd1N0YXRlICpzID0gYnMtPm9wYXF1ZTsNCj4gwqDCoMKgwqAgUmF3UG9zaXhB
SU9EYXRhIGFjYjsNCj4gK8KgwqDCoCB0cmFjZV96YmRfem9uZV9yZXBvcnQoYnMsICpucl96b25l
cywgb2Zmc2V0ID4+IEJEUlZfU0VDVE9SX0JJVFMpOw0KDQpUaGUgY29kZSBpbiB0aGlzIGZ1bmN0
aW9uIGNvdWxkIGJlIG1hZGUgYSBiaXQgc2ltcGxlciAtDQoNCiAgICBCRFJWUmF3U3RhdGUgKnMg
PSBicy0+b3BhcXVlOw0KICAgIFJhd1Bvc2l4QUlPRGF0YSBhY2IgPSAoUmF3UG9zaXhBSU9EYXRh
KSB7DQogICAgICAgIC5icyAgICAgICAgID0gYnMsDQogICAgICAgIC5haW9fZmlsZGVzID0gcy0+
ZmQsDQogICAgICAgIC5haW9fdHlwZSAgID0gUUVNVV9BSU9fWk9ORV9SRVBPUlQsDQogICAgICAg
IC5haW9fb2Zmc2V0ID0gb2Zmc2V0LA0KICAgICAgICAuem9uZV9yZXBvcnQgICAgPSB7ICANCiAg
ICAgICAgICAgIC5ucl96b25lcyAgICAgICA9IG5yX3pvbmVzLA0KICAgICAgICAgICAgLnpvbmVz
ICAgICAgICAgID0gem9uZXMsDQogICAgICAgIH0sDQogICAgfTsgICANCg0KICAgIHRyYWNlX3pi
ZF96b25lX3JlcG9ydChicywgKm5yX3pvbmVzLCBvZmZzZXQgPj4gQkRSVl9TRUNUT1JfQklUUyk7
DQogICAgcmV0dXJuIHJhd190aHJlYWRfcG9vbF9zdWJtaXQoYnMsIGhhbmRsZV9haW9jYl96b25l
X3JlcG9ydCwgJmFjYik7DQoNCj4gwqANCj4gwqDCoMKgwqAgYWNiID0gKFJhd1Bvc2l4QUlPRGF0
YSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgIC5ic8KgwqDCoMKgwqDCoMKgwqAgPSBicywNCj4gQEAg
LTMzMzQsNiArMzMzNSw4IEBAIHN0YXRpYyBpbnQgY29yb3V0aW5lX2ZuIHJhd19jb196b25lX21n
bXQoQmxvY2tEcml2ZXJTdGF0ZQ0KPiAqYnMsIEJsb2NrWm9uZU9wIG9wLA0KPiDCoMKgwqDCoMKg
wqDCoMKgIH0sDQo+IMKgwqDCoMKgIH07DQo+IMKgDQo+ICvCoMKgwqAgdHJhY2VfemJkX3pvbmVf
bWdtdChicywgb3BfbmFtZSwgb2Zmc2V0ID4+IEJEUlZfU0VDVE9SX0JJVFMsDQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxlbiA+PiBCRFJWX1NFQ1RP
Ul9CSVRTKTsNCj4gwqDCoMKgwqAgcmV0ID0gcmF3X3RocmVhZF9wb29sX3N1Ym1pdChicywgaGFu
ZGxlX2Fpb2NiX3pvbmVfbWdtdCwgJmFjYik7DQo+IMKgwqDCoMKgIGlmIChyZXQgIT0gMCkgew0K
PiDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1lcnJubzsNCj4gZGlmZiAtLWdpdCBhL2Jsb2NrL3Ry
YWNlLWV2ZW50cyBiL2Jsb2NrL3RyYWNlLWV2ZW50cw0KPiBpbmRleCA0OGRiZjEwYzY2Li4zZjRl
MWQwODhhIDEwMDY0NA0KPiAtLS0gYS9ibG9jay90cmFjZS1ldmVudHMNCj4gKysrIGIvYmxvY2sv
dHJhY2UtZXZlbnRzDQo+IEBAIC0yMDksNiArMjA5LDggQEAgZmlsZV9GaW5kRWplY3RhYmxlT3B0
aWNhbE1lZGlhKGNvbnN0IGNoYXIgKm1lZGlhKSAiTWF0Y2hpbmcNCj4gdXNpbmcgJXMiDQo+IMKg
ZmlsZV9zZXR1cF9jZHJvbShjb25zdCBjaGFyICpwYXJ0aXRpb24pICJVc2luZyAlcyBhcyBvcHRp
Y2FsIGRpc2MiDQo+IMKgZmlsZV9oZGV2X2lzX3NnKGludCB0eXBlLCBpbnQgdmVyc2lvbikgIlNH
IGRldmljZSBmb3VuZDogdHlwZT0lZCwgdmVyc2lvbj0lZCINCj4gwqBmaWxlX2ZsdXNoX2ZkYXRh
c3luY19mYWlsZWQoaW50IGVycikgImVycm5vICVkIg0KPiAremJkX3pvbmVfcmVwb3J0KHZvaWQg
KmJzLCB1bnNpZ25lZCBpbnQgbnJfem9uZXMsIGludDY0X3Qgc2VjdG9yKSAiYnMgJXAgcmVwb3J0
DQo+ICVkIHpvbmVzIHN0YXJ0aW5nIGF0IHNlY3RvciBvZmZzZXQgMHglIiBQUkl4NjQgIiINCj4g
K3piZF96b25lX21nbXQodm9pZCAqYnMsIGNvbnN0IGNoYXIgKm9wX25hbWUsIGludDY0X3Qgc2Vj
dG9yLCBpbnQ2NF90IGxlbikgImJzDQo+ICVwICVzIHN0YXJ0cyBhdCBzZWN0b3Igb2Zmc2V0IDB4
JSIgUFJJeDY0ICIgb3ZlciBhIHJhbmdlIG9mIDB4JSIgUFJJeDY0ICINCj4gc2VjdG9ycyINCj4g
wqANCj4gwqAjIHNzaC5jDQo+IMKgc2Z0cF9lcnJvcihjb25zdCBjaGFyICpvcCwgY29uc3QgY2hh
ciAqc3NoX2VyciwgaW50IHNzaF9lcnJfY29kZSwgaW50DQo+IHNmdHBfZXJyX2NvZGUpICIlcyBm
YWlsZWQ6ICVzIChsaWJzc2ggZXJyb3IgY29kZTogJWQsIHNmdHAgZXJyb3IgY29kZTogJWQpIg0K
DQo=

