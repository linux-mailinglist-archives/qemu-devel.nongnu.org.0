Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E4057DBA7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:59:08 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEnYw-0003wJ-T2
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oEnSv-0007QG-V9
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:52:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:63942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oEnSs-0000MU-A1
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658476370; x=1690012370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TI8TrZtIMLgiiILyO1f+OT+i4YyR88wT5mCukkoDkq0=;
 b=P9rmBMaizH8EGuFmRpf5CtbXIixCXEdrV80cidELYjBWKRTOPDZ6cy1I
 XETOOuivh9+fVhejeV+/Wy4dmprtkzqsTWOuk889reL5pXP3M1n2Z/Dsv
 Qcqj8oZ+OjfskSukmaH8u6+EOSOJOohkGg2lvf/tYzue/56TioHA10PuJ
 J3sTy4WWRdwR+sTcm1PPbgh70kJUsz5BFl5A2hpK2+n9tMPXlX+YnyBoO
 BjZbNOb4llSw2llzUk4cv73X8IBPI17BloWcfoMAO8t8Dx48/9AhAApNr
 Y6/LiYG4up+ZJR7+CQM1t6cUZB58KMsWrwaBvaWfX8CeD5gAEyPJ+/eSa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="267657839"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="267657839"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 00:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="688204200"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2022 00:52:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 00:52:47 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 00:52:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 22 Jul 2022 00:52:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 22 Jul 2022 00:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dgug+os+tUr2u/mAAEWwpJtjz1Ejk+9ZFP6nCwK/vJvrlUUPURNP+Ogf6MmqEteBuU3dHBjQZ6cN9+707f2qKC9lV/RmoUliDl5gbzKztUz3xiYHk6vO/dK7+gOIw/9rNKD/pI3HokB8rGPSbF3RQSzHzcOXzq5LfT6tW5AzmrWnwsZkyUC1I4gk/+kyui/UUlNAZLNarW5ryBEZcbI2VEizdxPV1cckYd4MgjzRrvadWQzfLCvSWnTG0pnl7kWd9zc4zVg8CfutuUf9tOVkQPWuNvktVBJxUDB6gfc10mLvyTAdsCiZX4fcOz1gm2dV66Hjhjjs0S2PZdj+Yzy46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TI8TrZtIMLgiiILyO1f+OT+i4YyR88wT5mCukkoDkq0=;
 b=PKQNyRezmL+FFnzt2e9xxIscwU4SZz3pmB3uiBGI6pCsdi44apze9yPTcVNQbzNqB+poUqEKfM/oiqZWPWGZcIGHg0Wi15jC78Kn25UU35un30U2MnM2bOGO5M6QAbOO6ol8AML4z1KJCNVw6ULHMrK5tqa2Wn+AStCYrPsEtBxsiQAAr8GES9t5qve7BxVsRRWpbfJ6l+aWA0gwBsP1m2cUF0n3lH4ITBy4LiHwPn244skUZ6r+Rdafj+ZzaJOBKYLzFtaLd28X8VlBcsjadVxANecV4ABHD/slwTxVN+BqoLKkKgRMZOcYq9gJsqpj9c6Fpn/opOLkn2WNHatcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by MW4PR11MB6787.namprd11.prod.outlook.com
 (2603:10b6:303:209::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 07:52:45 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d%5]) with mapi id 15.20.5438.025; Fri, 22 Jul 2022
 07:52:45 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: David Hildenbrand <david@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>
Subject: RE: [PATCH] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
Thread-Topic: [PATCH] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
Thread-Index: AQHYnZcu5KKcY5tOvUKIIXUAqtV21a2KBDCA
Date: Fri, 22 Jul 2022 07:52:45 +0000
Message-ID: <MWHPR1101MB2110FCA02F05DECF09041AB692909@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220622012839.3419865-1-zhenzhong.duan@intel.com>
 <b63cb739-06b5-6a97-4b23-fce36ef52ef2@redhat.com>
In-Reply-To: <b63cb739-06b5-6a97-4b23-fce36ef52ef2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb65f268-b629-456d-b9c2-08da6bb72a35
x-ms-traffictypediagnostic: MW4PR11MB6787:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7r1uSLMnQevQqPvXBl/3uUcBLvR/SMvBa0M2XRCUtgPbFPwXBp/jqnLNeMDB1xlWBQSsai0EXGiWzuS5LVnrsTfJAiivUjj6d/ctyz2Dyrbvsh2VJerOEeVXcTTSz1BfiFxaBv5gpa55+QCWR/8KVCDv6WwkQK70eTxkESNny5E9ajPGpCYtm1q802Z8CZho7Tdshbz7DA3UWmQaEFEddTt4e6Dy+npiNnFyozC8EdaITV9kdxwDP27iIekHNG1zmc7jPz8i+AHuW/VvlZmVK0dZqKn+pd/aFPmjvebZ22wp2A2n2Fv8soW28ynAeOvz+p7VZOd453qvjDmxiNOrv4Q4edv5/OkW8u3nA3yB4o5va9OqXpS3+mBRVKKUn8MHaAAjs6BlCAjuoZDc2zAVY682rpHK02gWAUvw8655rue0ajRBZGbeHmg3tG7QOD7wkQsI5uP4odv/icdeDeaqzs9Go157Y3mYo9ck5YVUfkAa8vRzW1Ehtq5COrae/vJfAXQLFNL4oV949TFnax9oZyp1pFf9wTdFKt1RBadixzSzbc6FVWlmBj5UNEWB2waTChdpphnjeqbMvxDM20lr2Ttu/L5LkIORYl4JadjoH2SSJOPeXB2d5pknVWfRcpMIRNRvu+SOrOsgXiiQedrgMdPRIon+m0xmOWZes66yd8V+USOUZ0gO+sOpm8cFAvPKeistY91PQkrEaZQkvAzXmzvUInQJKG3MW9hxGhRYloQMJhu9vGYPlXbmpkjeF5xV9gfVASooySgLTKL97jSqBz8aXtEfnPBcvzkKX8quXbQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(136003)(366004)(376002)(396003)(110136005)(54906003)(66946007)(76116006)(478600001)(8676002)(41300700001)(316002)(71200400001)(66446008)(8936002)(64756008)(5660300002)(52536014)(122000001)(66556008)(9686003)(7696005)(186003)(33656002)(2906002)(26005)(66476007)(38070700005)(82960400001)(55016003)(86362001)(4326008)(6506007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWtoTFNObi9xNEJ2V0pPTnI0SkVlZVJpa1R1dFZnTTJGSC80cW9HK3pHb2Rs?=
 =?utf-8?B?b0VhdEp2ZEVGWEZSV3IvNkc3aFJXOHA0T3EraTd3U0MwbG5zMzY2L0haZ3Zz?=
 =?utf-8?B?bmdMVDJFSjloSUZ3b3EvR3VSOWluN0JqbFlmVWF1ai9qZ3pWYk9zZkhnam4x?=
 =?utf-8?B?ZEVsQnhuRzBjK2w4ZDhHOGtEYzUzZ21LOGxrN2EyYis3eXdIYjNycW1KTjdN?=
 =?utf-8?B?KzIxNHVVdGRGR1ozVXd0SGdLT2VsQmg3WUx3Ty9pejZGZzZRV2c3aGd1N3V6?=
 =?utf-8?B?cUxVV3Iva3I5TzlIeDdxQ3NNSWxodk83WTJIbWMvelJsRnJTQU4yOUdIWDI3?=
 =?utf-8?B?cWRXUU10L0ZQbG5HeFl5cUNBcTcveExkQmlrdGk2K0hUbGFjbytFdlA4Slgv?=
 =?utf-8?B?dVNKUmZFOUJzZHdmYnhGVUpjZmExbk5NOWZoSHNvYXNtM3JWOE8xQnljTW5l?=
 =?utf-8?B?KzdpNFQ5a0IveSt4RjFCaVNTQ3BDQUU2cmgvSk9nSUliTkREbi9hWk52S3A2?=
 =?utf-8?B?RHhMNlN3aUt2VFo1aXpNMjIvNjV0cGU1UkEramtOeTNEbnQzYWdoUjJvZUxn?=
 =?utf-8?B?emVaQ0liV0MvRCsyMVZMbGhRWXhSZ0hsRkhGTWw5MDRHTU4rQitwUGlpQ3Vr?=
 =?utf-8?B?aVpKTUdvRHVScDZHM2pCdzAwU2hweUdiWER6QkY3dG9UU09LYUZrUGlCY1Jn?=
 =?utf-8?B?UDRqMElKM2JnOFFNNTdvbVhMaWt1b2g5T3ErQmJBMzFRWnVKOUVMd01LZk1R?=
 =?utf-8?B?UlArOU1McWtVcFdISjdpVXBEcVBTUWU0WmpYaXh3SlRBcXhCR0lhWUFpbjd5?=
 =?utf-8?B?dURMZWZaVlBwajlsNzlUVHNpMDQ4M1ozRTVVcGRxMHZ0QUdDOHd4dVVVelpy?=
 =?utf-8?B?T0JhNUM3RzFTREtFdklwS0l2eThOQkc5Zk9uRjdCYUNwbkFtTHlkQVJ2bkJR?=
 =?utf-8?B?S1FZazBFZ2ZIU3QycWx1U2xZdVA4WFJzTW9SempyNmNHSkRtTUZQbXlKSWZM?=
 =?utf-8?B?ZlRZMXR0cHF1azFSSkJGRHpKYXFhMHpNbWFlOHVVcXpKRWVtcVQwTXZOQ24w?=
 =?utf-8?B?TmhwK2RXZWVDWjVkWVIwaXV5MzE0cnhoK2ttTGFhbnJTaUVyLzkxYy9SKzU2?=
 =?utf-8?B?d1VadmtNZ0RHbG9ybERxOXZMN1VYZnZwWGovb2JLUFhoV0dBcnFuSlN4K2dF?=
 =?utf-8?B?SUl0a05lblpnNWh6VlRFbW5HN1JBTTZNK05WSHdKcEUzWkdac2JtUHdtLzN1?=
 =?utf-8?B?WTVwT3hOSHhuLzZPd25hS1V2VzFjVng1ZU40RnNRc2FCOEpDWEhCSGFxTElX?=
 =?utf-8?B?ajlVTmxkdURSVXdyZEc4RXJmVFh3ajJOd2NLVW9Ibm00Mm9hUU1XV2ZWTDZN?=
 =?utf-8?B?Z0h1NnF5Wm1IanJsUUVrSUxWUUl6aWM5ZXNlb3IwQzVtN3BJb1pLbUJMUEFR?=
 =?utf-8?B?WFB5dkEwVnN2b1RtNTdRb3NsOEQ3eUo0b2U2SkNIM1hwbG9mRDV3WWk3RnhR?=
 =?utf-8?B?UktJaGNKMDlHSTU4UWNtODZzNXhqQlY2aUVKY000UEVCRFZ3S0N6YVpqWUsy?=
 =?utf-8?B?WVFVY00vRWhkL3kxTVpqbUhtaHl2M3JGM0F0Qng1Mkgra3BrYWx3SjV5cTRL?=
 =?utf-8?B?WEk2bUxTUEh5T0lVc2t4V2hxL2VnajZISVM1SVpYdFc2NlJZYklRNkErVjhU?=
 =?utf-8?B?YWFuVGdnNUVCam8zbUFFMHlMKytwR2VNVmsrY25uMEJ5dmdlT2RHZXJhTHhM?=
 =?utf-8?B?VjJJb01sMDlRNUFnQUpKbjRFUW1WZEJSUVpJQ0RhQ0t4Q1ZBUGJjWGhGcGRo?=
 =?utf-8?B?alk5bUhtUERIL2U2UnZyZm5YSGh6aFJqd0pRaTYzMHplcTdFMFR2MGRxWVVJ?=
 =?utf-8?B?ZnkySjNhRlpmbWZMUm1LQ3ZLZzZzMm5CbzVjSVdqa0RBcWZaRjZ0b2NiMEky?=
 =?utf-8?B?ZjNXZDh6UHlLNFZyNXNsem9hdEg0elVBMkVlSU90Qm1LeW5oVXFaaTQ3Z3Bo?=
 =?utf-8?B?anpUY0pPYnJJSVo5SDVTZVVlZUE0d3NacGhCRjhQOStQNmh4TU1JWEhHUUUz?=
 =?utf-8?B?dUhmZkphazlXa056TXRRVHo5SXdnOVBSaEJsT25zcmtrWFpQWmFsMkdPeWdu?=
 =?utf-8?Q?Y5X1AF+X3A/gSxpXOCTS+S7sJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb65f268-b629-456d-b9c2-08da6bb72a35
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 07:52:45.7229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4MQMoD0uWIZH3sc/TQlBXZSMEJI0TeuJi7KMH0CQzbBcTQ5TdVzaAwCrSnVXmlYpWkw4m3fFbxGuYEK5YQkT5M2hrA5sbxLHkliclAA9a8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=zhenzhong.duan@intel.com; helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPg0KPlNlbnQ6IEZyaWRheSwgSnVseSAyMiwgMjAyMiAyOjQ5IFBN
DQo+VG86IER1YW4sIFpoZW56aG9uZyA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPjsgcWVtdS0N
Cj5kZXZlbEBub25nbnUub3JnDQo+Q2M6IHBib256aW5pQHJlZGhhdC5jb207IHBldGVyeEByZWRo
YXQuY29tOyBmNGJ1Z0BhbXNhdC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIXSBzb2Z0bW11L3Bo
eXNtZW06IEZpeCBpbnB1dCBwYXJhbWV0ZXJzIGZvcg0KPmZsYXR2aWV3X2FjY2Vzc19hbGxvd2Vk
KCkNCj4NCj5PbiAyMi4wNi4yMiAwMzoyOCwgWmhlbnpob25nIER1YW4gd3JvdGU6DQo+PiBUaGUg
Y29tbWVudCBvZiBmbGF0dmlld19hY2Nlc3NfYWxsb3dlZCgpIHN1Z2dlc3RzIHRvIHBhc3MgYWRk
cmVzcw0KPj4gd2l0aGluIHRoYXQgbWVtb3J5IHJlZ2lvbiwgdGhpcyBpc24ndCB0dXJlIGluIHNv
bWUgY2FsbCBzaXRlcy4NCj4NCj5zL3R1cmUvdHJ1ZS8NCg0KV2lsbCBmaXguDQoNCj4NCj4+DQo+
PiBUaGlzIG1ha2VzIHFlbXUgbG9nIGluIGZsYXR2aWV3X2FjY2Vzc19hbGxvd2VkKCkgY29uZnVz
aW5nIGFuZA0KPj4gcG90ZW50aWFsIHJpc2sgaWYgdGhlIGlucHV0IHBhcmFtZXRlciB3aWxsIGJl
IGNoZWNrZWQgaW4gdGhlIGZ1dHVyZS4NCj4+DQo+PiBGaXhlczogM2FiNmZkYzkxYjcyICgic29m
dG1tdS9waHlzbWVtOiBJbnRyb2R1Y2UgTWVtVHhBdHRyczo6bWVtb3J5DQo+PiBmaWVsZCBhbmQg
TUVNVFhfQUNDRVNTX0VSUk9SIikNCj4NCj5NeSBvcGluaW9uIGlzIHRvIG5vdCB1c2UgZml4ZXMg
dGFncyB1bmxlc3MgdGhlcmUgaXMgcmVhbGx5IHNvbWV0aGluZyBicm9rZW4gLS0NCj5hIHVzZXIt
dmlzaWJsZSBlZmZlY3Qgb2YgYSBCVUcgZXhpc3RzLg0KDQpUaGFua3MgRGF2aWQsIEkgd2lsbCBy
ZW1vdmUgaXQgaW4gdjIuDQoNClpoZW56aG9uZw0KDQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBaaGVu
emhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPj4gLS0tDQo+PiAgc29mdG1t
dS9waHlzbWVtLmMgfCA0ICsrLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9zb2Z0bW11L3BoeXNtZW0uYyBi
L3NvZnRtbXUvcGh5c21lbS5jIGluZGV4DQo+PiBmYjE2YmU1N2E2YzYuLjIxNGNiMDRjOGZjMyAx
MDA2NDQNCj4+IC0tLSBhL3NvZnRtbXUvcGh5c21lbS5jDQo+PiArKysgYi9zb2Z0bW11L3BoeXNt
ZW0uYw0KPj4gQEAgLTI4NTAsNyArMjg1MCw3IEBAIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmll
d193cml0ZShGbGF0VmlldyAqZnYsDQo+PiBod2FkZHIgYWRkciwgTWVtVHhBdHRycyBhdHRycywN
Cj4+DQo+PiAgICAgIGwgPSBsZW47DQo+PiAgICAgIG1yID0gZmxhdHZpZXdfdHJhbnNsYXRlKGZ2
LCBhZGRyLCAmYWRkcjEsICZsLCB0cnVlLCBhdHRycyk7DQo+PiAtICAgIGlmICghZmxhdHZpZXdf
YWNjZXNzX2FsbG93ZWQobXIsIGF0dHJzLCBhZGRyLCBsZW4pKSB7DQo+PiArICAgIGlmICghZmxh
dHZpZXdfYWNjZXNzX2FsbG93ZWQobXIsIGF0dHJzLCBhZGRyMSwgbCkpIHsNCj4+ICAgICAgICAg
IHJldHVybiBNRU1UWF9BQ0NFU1NfRVJST1I7DQo+PiAgICAgIH0NCj4+ICAgICAgcmV0dXJuIGZs
YXR2aWV3X3dyaXRlX2NvbnRpbnVlKGZ2LCBhZGRyLCBhdHRycywgYnVmLCBsZW4sIEBADQo+PiAt
MjkxNyw3ICsyOTE3LDcgQEAgc3RhdGljIE1lbVR4UmVzdWx0IGZsYXR2aWV3X3JlYWQoRmxhdFZp
ZXcgKmZ2LA0KPj4gaHdhZGRyIGFkZHIsDQo+Pg0KPj4gICAgICBsID0gbGVuOw0KPj4gICAgICBt
ciA9IGZsYXR2aWV3X3RyYW5zbGF0ZShmdiwgYWRkciwgJmFkZHIxLCAmbCwgZmFsc2UsIGF0dHJz
KTsNCj4+IC0gICAgaWYgKCFmbGF0dmlld19hY2Nlc3NfYWxsb3dlZChtciwgYXR0cnMsIGFkZHIs
IGxlbikpIHsNCj4+ICsgICAgaWYgKCFmbGF0dmlld19hY2Nlc3NfYWxsb3dlZChtciwgYXR0cnMs
IGFkZHIxLCBsKSkgew0KPj4gICAgICAgICAgcmV0dXJuIE1FTVRYX0FDQ0VTU19FUlJPUjsNCj4+
ICAgICAgfQ0KPj4gICAgICByZXR1cm4gZmxhdHZpZXdfcmVhZF9jb250aW51ZShmdiwgYWRkciwg
YXR0cnMsIGJ1ZiwgbGVuLA0KPg0KPlJldmlld2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4NCj4NCj4tLQ0KPlRoYW5rcywNCj4NCj5EYXZpZCAvIGRoaWxkZW5iDQoN
Cg==

