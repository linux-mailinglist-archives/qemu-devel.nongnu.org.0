Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0995992C5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 03:49:30 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOr8b-0003VM-B1
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 21:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1oOr6k-0001m2-49
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 21:47:34 -0400
Received: from esa20.fujitsucc.c3s2.iphmx.com ([216.71.158.65]:55163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1oOr6h-00014u-PG
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 21:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1660873652; x=1692409652;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F2dqlpuX9uSwL9HT1M4prubJ0cHBkTpXkUoLlKgRLJU=;
 b=trsUZMqwCFi11ltt9r9Giq+0tvSTejRCI5hDAGjVs5Ifc1c0JRgKWWRo
 xerUqIrrSWcsvhuCXbW4lKgkXcQ+gpEGCrHhChFnEaGdZwyBkAZe4cRz7
 7qSvHZXq0mi5ILf7oN/VTtwF5U3yfGxomAfNfJDgPrNG1JaKySwD80xZX
 hR77HeGVJUT5k58p+sqVMzWad28cjDXM6yEgZXTi+DgwqA5uYYCBOBT3l
 KHRkR7jk9U77hfjDXHdwwvZpLDf6vP/Do2Z7QChPpytSxp62z77YeT1lM
 qeXb/SzkE6UJ3FMtkrQ/TwoUZrSHoTjnjiK6bWUGnq1DZLZmtGmZ68N5R A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="62930355"
X-IronPort-AV: E=Sophos;i="5.93,247,1654527600"; d="scan'208";a="62930355"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 10:47:25 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiuQ919bvw5PyHxjhRgKTijJsF0nBa/u70rJXsOhMMKQAkZjd9ETjDRiJpORVdFnomxvyFxlCo1WxwMCcil2Gyxoy+PqhOE4ctqBtiTqzBvhMvGyhhTMMDKIi2cXmpt/Ga7hV16C2o+Vk5fe1f5qSV1JUohYOdjMRcacFQI1FR0wUz/F0QujDYcDt3l8yPFabeTCxBTX6uxGW36JnJYRk1FNUtMkzUZ1KlBIaSKKGHtlFRIXcMVXywEvLsPezXLNfWaiWoUbt4tvtXE334IGLXdEXLsc55FdTwe2PBO/1sDqVwkVE2H7PxRHUTY8f5Iu7c0xLKIjoq3zy1eP7XYnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2dqlpuX9uSwL9HT1M4prubJ0cHBkTpXkUoLlKgRLJU=;
 b=YxndRzqUmARLkKNi0sREIjceaICP2jKRefr/CZ9oMnqO3A1TkucdzvncQzIl035X+YitHYnPK6ll4LYe5i87f6UDcAgl8XrJs5eJb/traqIjkKtmjjlR+uUDa+1rvz7NizRI8WvZD9Ya0ezMmMOkgvIsK5dAyXV76gS/OvOCTGnnf3pJhifpJcsGQ77MMPRFb0a2YBFlKx1/Vne3ACwKjHracjy9cFTVMHSpnBrffJeW3Dsl7PHvgd6eOnFqpoDyb0kk6qQemNgFjH/RSUW14gaMgpUQqINBh+D00tn3nkFMlOyOYblAmovHnIx340zogFkeB3/aGORv9nRdRnP7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com (2603:1096:604:107::13)
 by TYYPR01MB6941.jpnprd01.prod.outlook.com (2603:1096:400:d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 19 Aug
 2022 01:47:21 +0000
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::ccd:ccc6:1a42:94cd]) by OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::ccd:ccc6:1a42:94cd%9]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 01:47:21 +0000
From: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
To: Yusuke Okada <yokada.996@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "open list:virtiofs" <virtio-fs@redhat.com>, "okada.yusuke@fujitsu.com"
 <okada.yusuke@fujitsu.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: use g_date_time_get_microsecond to
 get subsecond
Thread-Topic: [Virtio-fs] [PATCH] virtiofsd: use g_date_time_get_microsecond
 to get subsecond
Thread-Index: AQHYsysdq7tnRJxbf0S07nHCHvr19K21dP4A
Date: Fri, 19 Aug 2022 01:47:21 +0000
Message-ID: <402e7bce-46de-6d9e-5bad-045a42efa6ba@fujitsu.com>
References: <20220818174650.31360-1-okada.yusuke@jp.fujitsu.com>
In-Reply-To: <20220818174650.31360-1-okada.yusuke@jp.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50799cb3-261a-4854-ecc8-08da8184c1e4
x-ms-traffictypediagnostic: TYYPR01MB6941:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Sg6GZNGySciGWUuUvIKURFsFRbPD6Wtr1c0mGvX1kYIGaqxDCcBDViqH1JNcq1mI8YDmS3cRfq+QKinj69rsOP94c0qA0jE38bw21Dg33xxW6SSG2p9rI9rU0gW6i2rhI9G2QAKT4yiqr+aEuZoWmD44N/Yw+/EWfjbn2/ymzAboU5x5CkD2zuVE2c3Nvi58jEHBTubtmgYPgICj67PfE46M/tVArahjBlfSd8QS3C9bclYzY6ljS/xWOClq7Q8TS6fnj/IsTmAONsQEpYuE/es/9b0zLdJ1yW9kIFHC8t3LzNg471LlPxrXJeUnP4r/V93NcnbI1BfwUdx5JbYN0zdKXRjo5YUE5Ve80UUDCYLTzaa2xUkZ9X1G9b66WCoZhuNEMNcuuDyKih6IkCB15UbboWXRYWofWM1EIF9EO8qm2MpcBXqmABgb+pt4rZ3nei0cEj7JsmK005rbHAAig8rqCOi8dfdPJVwem3g49sEJCC5D75V9c5YHqHxvCtI/g6gBnvzKGAymhb6Kga5qKS8oWdt3kHrYfCJ4yOItmG97O4INqTn2kSgxKjzMYTi+lcMPr8xdTiW7SVCiJsUnXyhAGh3vW45ELA2BTYpyxnklO5nVbtMlTDvJvZOIBhG3T4FRasN9HGA2/oGrd5eoU8YY8a8W7SjuXSpaC+p3dZtRFFL/K3ZonzabxVzO1UuGdNZspDoCOIESA8o5tIMuJuxJM5lsUPt41+5mNs3KYZSPCgXmdoiHFiFF63EwjnoLr0KNP24PkQDCONp/je4T48LNvPLasSgox0uUN8YRhqaKk5ubz1jwC6Ha2Dm7dpRhXkjLtGAElG2fpo+8ecgsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6481.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(38070700005)(85182001)(5660300002)(91956017)(76116006)(41300700001)(316002)(54906003)(66556008)(31686004)(31696002)(64756008)(110136005)(66476007)(86362001)(4326008)(8676002)(6512007)(36756003)(53546011)(26005)(66946007)(2906002)(122000001)(8936002)(66446008)(82960400001)(107886003)(2616005)(186003)(83380400001)(478600001)(38100700002)(6486002)(1580799003)(6506007)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEYvTmxBb0ptNDFhMjUxZGYyYW5CQXZsOXgwY1pSRE5xellvTFlXbnBNMmRl?=
 =?utf-8?B?VjBhTVVTTFl4R051aUsxYWVCK2YwMkY2MVRVTGFrcXVMVThvbGVDNWs4NjBX?=
 =?utf-8?B?TkhPd2VqbVJIaVFQWHoyTWlIRGlZeUdQU3cyWlFGcUI5VHFVaGc0NjhndnRz?=
 =?utf-8?B?ZllOeHZZV1AvZHlKbWJLd3p0OUoxT0ZTZUN2UFEzeFJKN0dFWXJBdmlobWx5?=
 =?utf-8?B?R0JiaGQ0ZFFxdlRmSXdmMzIvbHBPVzc5T2xzSkc3eWQ3cmZFWkdmTUV1Ykto?=
 =?utf-8?B?eHJIOW5KaDUrYVNTWThaL3p4RFhqSkN0dW8vdnhaVkRTUFlJTStiNSs1WkE1?=
 =?utf-8?B?Q0ZmRjRheDUyZ0twMnBFMXBScnFTTzRLSGhiSnpvYWZhMDFlQzR2V0pWK0Rm?=
 =?utf-8?B?alg1TmhiRjRGWVprRloyL0lzMytiNG1oYkpVWUtBaFBqcWxPMzBnWG9tQ0lm?=
 =?utf-8?B?YjVkK1lwMWlMb3EvWTFCMXZpVlhsTy85TCtEMGxWbzRJcDY5dVgwdDhVUnZO?=
 =?utf-8?B?SXBTOGZGeDNRUzlLUFBUOUhzNlhscHVHWW1BeTNuVDBRMWhObFRNZ0FvKzhX?=
 =?utf-8?B?STcyc05jRkJmcVh6eURxYklsK0pwTmRDcHJSQ0xSMGtJNm1HWEZ0ZklHS3BF?=
 =?utf-8?B?S3pKWG5hOXFjcXJyRGVRNTB5VEUzdk16SXdpOVRTdEJhcUcybndycmUreWFU?=
 =?utf-8?B?VXhEM1ZRd1J1RFpNNGNSR0pHOFU2a1AyQlVhNSt0UFBGVVpibnN2MmdvQ09V?=
 =?utf-8?B?THd5bkpwRHo2UlQ0RUR1KzdYbHpSa2NhOUZkWnpTL2E4N1FWMWVUY2Y5VGcv?=
 =?utf-8?B?cEFtTmlXQXJPeFhUazVuUURuU09RbDY1eUtwUkJINERlTXMxWnE5TDJFZ0pt?=
 =?utf-8?B?NnNHWEZ5WlVwWTZaRmtaWEZ5b1prK0kwOHpBWVhDbzFNUjRBcVU0TlVBRXNH?=
 =?utf-8?B?ZWtvMUh3K3VaaDNQNndhZFVJRENscnVzTU42eFpNcmE4dXRtS1kvRXJNT2Qy?=
 =?utf-8?B?dzV0b09WYkU4WU9lb21Xc1krUkxXZGNxajUvSE5Jc2dMNmQraVFDSjBPYjZX?=
 =?utf-8?B?V0oyZUhKaDZsRmVpYkFwZU1OWUNtUEM3cGwxbTl2a0Z6SFVEVTVSQlVpMk9y?=
 =?utf-8?B?Ums4NlQ1cDBMMDZMOXh2Z1Y0K2xGbGlTWS9MRStvV0dmK05GZk5NZCtHdDUr?=
 =?utf-8?B?VDc1cmtSa3l4aHg1UFpIWjhEZCtJc0U0a2phOG5iY3NpK1dHcUZLV24yNDF3?=
 =?utf-8?B?NVRuVEowaG9zUGxDS2R0c01tRmc1ZEc2bnFXWUNHL3lpSDg4NEhvMmw2UXFS?=
 =?utf-8?B?KzZIVUM5bTErTmZnMFFhbHZBVkV3MzF3TnlVdytyYTMwRjJ0eU1hUGdqaWhT?=
 =?utf-8?B?Wmw5b2VnWUNrakRGc09UREVGdFAvMWdmWTk5NURUeUVXc1pvQlhWQ3cvRDhu?=
 =?utf-8?B?aE5NTUdWKyt6K3IyYXI4dHp1RzRLV095ZEZpUnl3UDUvbWk4UmVPbFJuWW91?=
 =?utf-8?B?aUtNRXBvMDFGUUo1MUxNR1ViYXM0VldRNkFRbmxqdENPcEJoZHl3bm9xbDdu?=
 =?utf-8?B?L2hlaEdjeGRja2pVRFZZN1oxSmFYNlN4ZHJrUVI1VVBuZExrTE5RMlAvOHhu?=
 =?utf-8?B?dW4yTnZjS0N6clFWTWpjWjExeDFybXVpV3hWMGZYNkVPZ3pZVUJINmNVN1Nq?=
 =?utf-8?B?NnJsSThFTjdBa2daMzZ2SUI1bC9HN0c3Z3Zna2dnQWZ0TDNHblZTVHlXSy9W?=
 =?utf-8?B?bENoSU1ZNCtEalh6NldTMHJtMU9yam9aVlNPdEJoQXJuQ2Z6dHBVbHNtazdO?=
 =?utf-8?B?b3cxTWo3N2VJL2wzUDFXQWRkOVJ4bnNMY0EwK04xQVNYaElReVRvTko1amdZ?=
 =?utf-8?B?UjBWbjRBeUxjbW1TWG1jRGxKUXZGN3REdXRZaXdLN0M0NGpkZ3h5VFYwNFNv?=
 =?utf-8?B?UGpmeTJQdWxhV1hDNTR4RDJ0SFdkY3RBNmRjNEUxM3habThERWJqRmJxbllq?=
 =?utf-8?B?WHYyWUowY3RhL1VrTmlBNWd5RXp6ZVFjSGRyT3kyZDdYNlp4a3pKR084eFJi?=
 =?utf-8?B?eU1ZODVkWUU1SXloUDREWEZVYVhCWUt1ZkVuK0VtRm0zUWxkcklHWnhmQlJs?=
 =?utf-8?B?a0dMUFNnS1BPWjZkTGJ3V1ZmaWxSclU3aldMU0c5Wm1rb2VHeVZBam5tSEVS?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D8F37ADC2301F4CB805FD37A1CC1C24@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: P7E01dWW/tcdCy2GmGavXz0KhTvZs+B/hJAnEFFsqw431sXcmR18ns8MoUu0KLVbYZkjwoZwzFJCKez7kmsmMgUZfIwxOoA2kbJUnMguYBoLsG8DrpOzozx9Z+AWH58uQxk2KV+38GXkiMhEE6aAB7CefBjGsejRHo1O7zhI1j/LlOsZzYGZKOksN2l4vJjniCDXq2OvZ6FTIBTxZxs0K+W/7H8Kyl813SwoBtzp6wL2dZZKvkhuTc8/t+FRGP9Km9a5t2Tf0u+h+UQrSCsD0VU9iEwRg++c+QlXiQKVgqG14LBmCu4X6KB7wIjtXiwkX/MRaWeeU4gcoNr5JhTW4Y9zNNGH98ldtNOUOQwBhyDTt9w1xbYBv4GK8Otl2Zec9TcwkzrJDmPfBGKY8rc89VW7AqNK65/nrtiKm7qcquZ6eRH8J3jCvflVpm6HXHeoU2Adn0GvHKm8GUqVqou82UzyIBKIGGjzBwyRwliJN4OQjuA6hexEmeR2/Z2HVx3hFGiRVMCRFHMZJZwyr8Xla1KElrDdiVwCPMwAcgOMHXIkAq2w4Qgoi8pncuBuQRZNnSHlrLhoxmWpo+L560ncojz3MjOG0PT5cHZaz94l8XzxrIY2AOA8yV4Yw6ptzrJHTH1QHgm/NrXiQ+vqHYc60NbhoEMDI5PGL9MO0bRtyTDWUEqZ6IIdjB+w6XI+K1jjztOCk0KXS/Gllb/Ru2TWx0E5fLq21t2H0rHfRh6Q9/w26pnE1G0vUIM8pzPa8IWO9NAZVTY0tILVr85k/gtrtMtPeqyZSIhd4Qrz6mOtkyOm/AQnl9z1vA64VEZsGCpHKxvKHb251R9jKuOQuSxyig==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6481.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50799cb3-261a-4854-ecc8-08da8184c1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 01:47:21.4549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2uVhg6omDCx63ClXFXvoC9vs0Gh4SzP1NUXqGNUhkq/3FYJ2T+8YEErBTEER3VWEJkXdmtgN3EP6qotMpfEdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6941
Received-SPF: pass client-ip=216.71.158.65;
 envelope-from=liuyd.fnst@fujitsu.com; helo=esa20.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgd29ya3MuIEkgdGVzdGVkIG9uIFJIRUw4DQpCZWZvcmUgdGhpcyBmaXg6DQpgYGANCiMgL3Jv
b3QvcWVtdS9idWlsZC90b29scy92aXJ0aW9mc2QvdmlydGlvZnNkIC0tc29ja2V0LXBhdGg9L3Rt
cC9zb2NrIC1vIA0Kc291cmNlPS9ob21lL3Rlc3QgLWQNCg0KWyhudWxsKV0gW0lEOiAwMDEzMzE1
Ml0gdmlydGlvX3Nlc3Npb25fbW91bnQ6IFdhaXRpbmcgZm9yIHZob3N0LXVzZXIgDQpzb2NrZXQg
Y29ubmVjdGlvbi4uLg0KDQoNCmBgYA0KDQpBZnRlciBhcHBseWluZyB0aGlzIHBhdGNoDQpgYGAN
CiMgL3Jvb3QvcWVtdS9idWlsZC90b29scy92aXJ0aW9mc2QvdmlydGlvZnNkIC0tc29ja2V0LXBh
dGg9L3RtcC9zb2NrIC1vIA0Kc291cmNlPS9ob21lL3Rlc3QgLWQNCg0KWzIwMjItMDgtMTkgMDE6
NDU6NDEuOTgxNjA4KzAwMDBdIFtJRDogMDAxMzQ1ODddIHZpcnRpb19zZXNzaW9uX21vdW50OiAN
CldhaXRpbmcgZm9yIHZob3N0LXVzZXIgc29ja2V0IGNvbm5lY3Rpb24uLi4NCg0KYGBgCQ0KDQoN
Ck9uIDgvMTkvMjIgMDE6NDYsIFl1c3VrZSBPa2FkYSB3cm90ZToNCj4gVGhlICIlZiIgc3BlY2lm
aWVyIGluIGdfZGF0ZV90aW1lX2Zvcm1hdCgpIGlzIG9ubHkgYXZhaWxhYmxlIGluIGdsaWINCj4g
Mi42NS4yIG9yIGxhdGVyLiBJZiBjb21iaW5lZCB3aXRoIG9sZGVyIGdsaWIsIHRoZSBmdW5jdGlv
biByZXR1cm5zIG51bGwNCj4gYW5kIHRoZSB0aW1lc3RhbXAgZGlzcGxheWVkIGFzICIobnVsbCki
Lg0KPiANCj4gRm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHksIGdfZGF0ZV90aW1lX2dldF9taWNy
b3NlY29uZCBzaG91bGQgYmUgdXNlZA0KPiB0byByZXRyaWV2ZSBzdWJzZWNvbmQuDQo+IA0KPiBJ
biB0aGlzIHBhdGNoIHRoZSBnX2RhdGVfdGltZV9mb3JtYXQoKSBsZWF2ZXMgc3Vic2Vjb25kIGZp
ZWxkIGFzICIlMDZkIg0KPiBhbmQgbGV0IG5leHQgc25wcmludGYgdG8gZm9ybWF0IHdpdGggZ19k
YXRlX3RpbWVfZ2V0X21pY3Jvc2Vjb25kLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWXVzdWtlIE9r
YWRhIDxva2FkYS55dXN1a2VAanAuZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgIHRvb2xzL3ZpcnRp
b2ZzZC9wYXNzdGhyb3VnaF9sbC5jIHwgNyArKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy92
aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYyBiL3Rvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9s
bC5jDQo+IGluZGV4IDM3MWE3YmVhZDYuLjIwZjBmNDFmOTkgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jDQo+ICsrKyBiL3Rvb2xzL3ZpcnRpb2ZzZC9wYXNz
dGhyb3VnaF9sbC5jDQo+IEBAIC00MTg1LDYgKzQxODUsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cF9u
b2ZpbGVfcmxpbWl0KHVuc2lnbmVkIGxvbmcgcmxpbWl0X25vZmlsZSkNCj4gICBzdGF0aWMgdm9p
ZCBsb2dfZnVuYyhlbnVtIGZ1c2VfbG9nX2xldmVsIGxldmVsLCBjb25zdCBjaGFyICpmbXQsIHZh
X2xpc3QgYXApDQo+ICAgew0KPiAgICAgICBnX2F1dG9mcmVlIGNoYXIgKmxvY2FsZm10ID0gTlVM
TDsNCj4gKyAgICBjaGFyIGJ1Zls2NF07DQo+ICAgDQo+ICAgICAgIGlmIChjdXJyZW50X2xvZ19s
ZXZlbCA8IGxldmVsKSB7DQo+ICAgICAgICAgICByZXR1cm47DQo+IEBAIC00MTk3LDkgKzQxOTgs
MTEgQEAgc3RhdGljIHZvaWQgbG9nX2Z1bmMoZW51bSBmdXNlX2xvZ19sZXZlbCBsZXZlbCwgY29u
c3QgY2hhciAqZm10LCB2YV9saXN0IGFwKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZtdCk7DQo+ICAgICAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAg
IGdfYXV0b3B0cihHRGF0ZVRpbWUpIG5vdyA9IGdfZGF0ZV90aW1lX25ld19ub3dfdXRjKCk7DQo+
IC0gICAgICAgICAgICBnX2F1dG9mcmVlIGNoYXIgKm5vd3N0ciA9IGdfZGF0ZV90aW1lX2Zvcm1h
dChub3csICIlWS0lbS0lZCAlSDolTTolUy4lZiV6Iik7DQo+ICsgICAgICAgICAgICBnX2F1dG9m
cmVlIGNoYXIgKm5vd3N0ciA9IGdfZGF0ZV90aW1lX2Zvcm1hdChub3csDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJVktJW0tJWQgJUg6JU06JVMuJSUwNmQleiIp
Ow0KPiArICAgICAgICAgICAgc25wcmludGYoYnVmLCA2NCwgbm93c3RyLCBnX2RhdGVfdGltZV9n
ZXRfbWljcm9zZWNvbmQobm93KSk7DQo+ICAgICAgICAgICAgICAgbG9jYWxmbXQgPSBnX3N0cmR1
cF9wcmludGYoIlslc10gW0lEOiAlMDhsZF0gJXMiLA0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbm93c3RyLCBzeXNjYWxsKF9fTlJfZ2V0dGlkKSwgZm10KTsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ1Ziwgc3lzY2FsbChfX05S
X2dldHRpZCksIGZtdCk7DQo+ICAgICAgICAgICB9DQo+ICAgICAgICAgICBmbXQgPSBsb2NhbGZt
dDsNCj4gICAgICAgfQ0KDQotLSANClRoYW5rcywNCllpZGluZw==

