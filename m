Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BD83F43F7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 05:33:32 +0200 (CEST)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI0iJ-0007b4-2m
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 23:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI0hN-0006kg-Gz
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 23:32:33 -0400
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83]:2559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI0hK-00031m-KV
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 23:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629689551; x=1661225551;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=UNUj+edWwbhqThf+JxojTofv5PcvBObeZfFIBNIrFE4=;
 b=qRVYJWYPR/A3z9QE48ngVgjK0Z//bYmc9Q4YXkDnxq/Lf7Ay3c+aNYXS
 hvGYCS0TMoyHQlx3urV+rLtuh7EV5bz5iuMBuuWa07asokta0CbneoqNI
 OWKiBT8wnyYiYugetqJvobGPHFAzw6XrS5VGx0QBb+lgeMXWZmRbAbhpE
 Y/TsB7rEtW+/axAYOw+Ti3O8PphIM7gV14DmnWA17gE9QUD/vZSR7wlnH
 9SZT19kXXave7nr/nHa3vOpv6Vg8//T9F4LUOqElOhPuFiSfZEupmK3Sz
 QzsMg+WXIZW/2uqyqrf84w/TRfTaiqNgRv9mmsYkz6rSqBuRu6unesqVj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="37395656"
X-IronPort-AV: E=Sophos;i="5.84,343,1620658800"; d="scan'208";a="37395656"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 12:32:28 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrZqeWgXgnttphIehm5BzxrnbibVMbTgln3qSko56r7YJEPIUvY1PtteW6OphgceGzexYz8hNsOc0y6u2dSl0rmFJ/QR4KVoTbnCdrA5LdIwAJLvUCYwPM7FQvvMKA4L/u+fpQMhLnjiO2BlDNITS6TpErMzE5AK+XK0WkUsrzfe9g19q+4TGeY8D3UNA3KmqG0AIoIRDAF9DOfwZf83YMXTeiZM1upqa71r2hM4N+pkhWjkk4L0cf173qYULwgLLkBVrdAD4y0ipPOJTZc8CEYm5OOW9bS7MbVDamQGLUUkfYHk3CEP1zV+Qpiv0Ock8UIzheUSp2wcB6VUzYc2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNUj+edWwbhqThf+JxojTofv5PcvBObeZfFIBNIrFE4=;
 b=NB+c6eFVvZxNVVu4cBMGQohCzJKCld3LGOPKaYky5u7vwElsTdizauUQIF2cPY3+QSt1sGB+XDRWm2D/lerS8dJU+GuDgy+cQK1fyLBUTo1TqVhHvzu6qx5FzoIszt0EuS6o5o3vTdkTkEeWB0Ny+hmedqbEyrF9BjwDhTJt4XQ831z66OhphYCC16KgyFVa68rTxJ7GnFTwQQQNTAVqlZtbrYhlEv/h7qyQ+RwhlOJAS/TWWCkxGBjnyQQ5StrY/GN3S7tG6mJ4BJ+CRVi+SJAxHm6A9eFe2S3OxK9U3lSLiYxmvxjGJVd3x53+qp3x/tS0Nn1Qfy8BG1Okq++XQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNUj+edWwbhqThf+JxojTofv5PcvBObeZfFIBNIrFE4=;
 b=PQWpEyJoJctmVsBOy9dSadvKS78NL2Dbt0sWPEadLWt2DeN3FGp0SGdy9efTpyUhBI8NsouK7IfJwknJ+7Q28bNws6CTNCk/crDmXnUcQsmY1b+tolZ3g/g1kjIiB79Oxb8SgN8YBL+vbV/er1UZSR1OF6SNm8wpjfD84k2SBXg=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7597.jpnprd01.prod.outlook.com (2603:1096:604:14d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Mon, 23 Aug
 2021 03:32:24 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634%6]) with mapi id 15.20.4415.024; Mon, 23 Aug 2021
 03:32:24 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/2] migration: allow multifd for socket protocol only
Thread-Topic: [PATCH v2 1/2] migration: allow multifd for socket protocol only
Thread-Index: AQHXhhSLWkQFC4tBrUi3WGJitqysgauAkkQA
Date: Mon, 23 Aug 2021 03:32:24 +0000
Message-ID: <5ad9614a-801a-dea7-dd26-85c59ebca51a@fujitsu.com>
References: <20210731140552.8818-1-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210731140552.8818-1-lizhijian@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d690db0-0a62-4c1e-23ff-08d965e69fd5
x-ms-traffictypediagnostic: OS3PR01MB7597:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB759716080EAB28A6137B4396A5C49@OS3PR01MB7597.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:336;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JR/CV97cypnhiBekD0avad5kVqOlyfp2QF0UlVKbV6IJ34GO1sdK7cqFgJwEwO8A9BKHEzFI4vi9Oc/h47Kf1VTEOE1wyCABwYhFYpDum8foBttMDQuWeFQJbyxyeEDlXopGI6SQaIiC1S47gInnQIlT04R0H7Vz1GNavkKkfEWCmovM3WldKD0mVUWmYeQEWjgGZFM0/DGTglnFVaP8NOn7X80pvNxffjDnVT/i3NEAv+10CwJis7Db6SHjbKL0JyPm4uTa/bHHxJkzO010lIHfc7cP9zZ3Yoqr0Z5zwnjWUeUYXu6kLj1u6qJKwrKshKxbPnOHoMl530eeH64o7/BTliW+BsH80X4HCI5Up62Dbvc0NBEgFVO2JlL0n9qcpBLrIWr4alZrm6eFfQhucwCcU88yiPjg0qodyMxfTrcmdYoZma2n4niHOMqZuOoqa4KMFL/TkiiAWzG2pemahBuXca6j+58OXTRui7xYwhi9N2eHTwxOpfXtecrdx21JDQQntahtd3Cy/BO8o/DmritlooJkG/cT/337LM+5EC1OMKlBowpeYca4+CGDZVdZ59IHKZTN76xRcUsxuQnCcwGUuJSPM6ZT4NsRzIS5Vrgb19+/uF1jem7qguVfUv8UvDHkAgRN8Wzi/LEiNO9UjyWnuawUyawENvz/6WJV+hdJejoa6Dav7stPC4wKubuRy2nXQFeglEjv2M1MkRtW1O91F6qC0upwxkOWNau7Qk7WZDypJNLnFLLJkJiF2iyNLywAxr6OeLPWLGJL4/4ZlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(64756008)(76116006)(66476007)(91956017)(66446008)(6512007)(66946007)(71200400001)(316002)(5660300002)(31696002)(122000001)(38100700002)(86362001)(8936002)(38070700005)(31686004)(508600001)(6506007)(186003)(8676002)(53546011)(85182001)(6486002)(26005)(83380400001)(2616005)(36756003)(2906002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWM1Ym5DQ1ZWRUxnSlFXbzhZak9FdFoxNXJ0RVhBRDd3ZCt2UG43MkhDcE1U?=
 =?utf-8?B?NEt4ZHRqc04yd05lTVpkUFltakhVbmF6SmY4eWd2OGxGOExnVUJDZTdodXVF?=
 =?utf-8?B?M3U1NjZlVXV0b1ZQcElFSndCVmhrMi9MTnorN0d5SXFabG52aXErZElOdTB4?=
 =?utf-8?B?cDlpdjJuZ2dIWEFNclFvcGMrTFIvMTlsYTV5S25HMXlCRU41bDVUQ3RUa0RJ?=
 =?utf-8?B?L2lLb0xldFFMcEVYdkxscWVJUEFwalByMW9vcTc1VThMR09WZVFUUHRzb0N1?=
 =?utf-8?B?ZlN1TjE3aG9MbmwrN2RXR09mSE9iUmNFZzM5M0FZYzlqRlFXRUptK0sxbFRa?=
 =?utf-8?B?ZFhuUTBwZ2RiV3BIejZCVm5ZQUt6UG1QLzZ6dzFoeThXLzRqdkdLYUZlbzVU?=
 =?utf-8?B?VXpWVkRrQ1lnZldhV1JmVEZHelJaS1NwdnpGL1JaZ21Vb1hHRVpNS29JTnJD?=
 =?utf-8?B?MW1zNmNyUUxjNG42aW0zL1cyZ2JFRDR0OTdSWDFsNXhTWmdTTlZwaWVzWUZv?=
 =?utf-8?B?MThXQlJscWo2OUNKbzYrZkZDcURxWVRib25ZQml1MDVMQkM5eXdyWWE0VHJU?=
 =?utf-8?B?L2tEd2lLcDhRQWMycHVhUjNEdzgzamtIVjFhTm4zREN3cmZtaVRmVTN4YjYz?=
 =?utf-8?B?MUl4OFA4NU4zeEM0REZsZHByQnJTTncvUzhtOFBTRXluZnlFY0o4ODRxOTNW?=
 =?utf-8?B?OGYzdUZnbUJTbHZnazZ3ZzRtc1FISUpPcFNlZE13cGRNMXhGc01JS2VCM1NV?=
 =?utf-8?B?Mk0zSVRKM21ZVDhtU2tuZ2dsaERFWHJKRVMwRlh6SmxDY1FwRWU5WjlTNDZ3?=
 =?utf-8?B?RW1rZ1hmaGIyTGVINGdoS3Zsa3FVZDJpN01ScEtNWjZUNjBpbnVBSzA2NUpX?=
 =?utf-8?B?UGRXTlpqbE5uUG14dGFic05nc2ZmcEZDd21FZjgyS3FSeVFIQlBRVC9lemhp?=
 =?utf-8?B?OEVMUE5SUmp2UUYvVllQMFZ3TEEzNXBJNTBjU1hkeG52UEpFOS8yZSs4SGh6?=
 =?utf-8?B?R1dqbEpNZnh1TS9TWHYveGl6RSthS3JoOFJLRzZZM1NJWWo3VFFXcWgzQTJu?=
 =?utf-8?B?TnROTDJWQTEreUtOSTAwWmdTd0FwSURVV1RDZFRmb3lkVkVhOG05a2V2a2N2?=
 =?utf-8?B?ZllHRkxZU3VsckV2dCtseHo0Mlh3L2o4YStVQkljSVZVWU9paUNFTExvOC9O?=
 =?utf-8?B?QTV2bHVGYXJhN2QvdlBVZDlicnV1U2ZjMWhoRlBLcnpoOW1EWDNndUN2amR3?=
 =?utf-8?B?U3puVy81dUNkd3hydTVxaWM1NWY5VXA3RHRvTUlUNzFzejlIZ2taaUxwOWxK?=
 =?utf-8?B?T3gyYjFTVXVRS3RkdlRxYkNUN0RkcEhYUGY5ZStHaHVXSDVjVGFMVy9SQXo0?=
 =?utf-8?B?SjNIVHhKR2FTZ0l3blBLV1ptY3NncXAzYm9Kemg2YmFpb0tOTzhGUndBTzBz?=
 =?utf-8?B?VlFkUUFZQVBuWWxGMkxBRC9jWjgybVp0NldMWXIzU2I0eGowQlJWR2lqeU85?=
 =?utf-8?B?WjhrRVFzeitjRlIxK204MWVubFUvdmlyT2wrbDFJUnNLWmt5TzlBcVJFbTd5?=
 =?utf-8?B?Rk9mNUtuS1RiamVLck9ORUkwRzBqM3kvVkJZTU9kZDlMbzh5NmFiM21OTnVH?=
 =?utf-8?B?OXFNV2I5Y1VCNG9oUzFCQWRVVC9la1luQ0dsTEtsamdEMmpuS0cwck5PZWZh?=
 =?utf-8?B?RGZSdzhTaTBnSWY2cFJEV0pTR1BYQjUzb0tiaTBMNmZFeDE1Q1MydUJuU0s0?=
 =?utf-8?B?YzliNXUzN0o3a3lLTG00U1RiYTB6RllnajdURk1NRmNpSHI4eHdBMmR4YUh6?=
 =?utf-8?B?c1I0aWp6NTFMNHFZWUkyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B101B851C2518488DFDE671CE910787@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d690db0-0a62-4c1e-23ff-08d965e69fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 03:32:24.6720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5SwmmHf0GYFEtJz9Bh0sm5kRj1JCmuoKrsjLZ4vI3AiZBhxJK0uXlk/UexAJZUpTgJ9GcFY6/b4RWGXtYlbZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7597
Received-SPF: pass client-ip=68.232.159.83; envelope-from=lizhijian@fujitsu.com;
 helo=esa6.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.959,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

a2luZGx5IHBpbmcNCg0KDQpPbiAzMS8wNy8yMDIxIDIyOjA1LCBMaSBaaGlqaWFuIHdyb3RlOg0K
PiBtdWx0aWZkIHdpdGggdW5zdXBwb3J0ZWQgcHJvdG9jb2wgd2lsbCBjYXVzZSBhIHNlZ21lbnQg
ZmF1bHQuDQo+IChnZGIpIGJ0DQo+ICAgIzAgIDB4MDAwMDU2M2I0YTkzZmFmOCBpbiBzb2NrZXRf
Y29ubmVjdCAoYWRkcj0weDAsIGVycnA9MHg3ZjdmMDI2NzU0MTApIGF0IC4uL3V0aWwvcWVtdS1z
b2NrZXRzLmM6MTE5MA0KPiAgICMxICAweDAwMDA1NjNiNGE3OTdhMDMgaW4gcWlvX2NoYW5uZWxf
c29ja2V0X2Nvbm5lY3Rfc3luYyAoaW9jPTB4NTYzYjRkMTZlOGMwLCBhZGRyPTB4MCwgZXJycD0w
eDdmN2YwMjY3NTQxMCkgYXQgLi4vaW8vY2hhbm5lbC1zb2NrZXQuYzoxNDUNCj4gICAjMiAgMHgw
MDAwNTYzYjRhNzk3YWJmIGluIHFpb19jaGFubmVsX3NvY2tldF9jb25uZWN0X3dvcmtlciAodGFz
az0weDU2M2I0Y2Q4NmMzMCwgb3BhcXVlPTB4MCkgYXQgLi4vaW8vY2hhbm5lbC1zb2NrZXQuYzox
NjgNCj4gICAjMyAgMHgwMDAwNTYzYjRhNzkyNjMxIGluIHFpb190YXNrX3RocmVhZF93b3JrZXIg
KG9wYXF1ZT0weDU2M2I0Y2Q4NmMzMCkgYXQgLi4vaW8vdGFzay5jOjEyNA0KPiAgICM0ICAweDAw
MDA1NjNiNGE5MWRhNjkgaW4gcWVtdV90aHJlYWRfc3RhcnQgKGFyZ3M9MHg1NjNiNGM0NGJiODAp
IGF0IC4uL3V0aWwvcWVtdS10aHJlYWQtcG9zaXguYzo1NDENCj4gICAjNSAgMHgwMDAwN2Y3ZmU5
YjViM2Y5IGluID8/ICgpDQo+ICAgIzYgIDB4MDAwMDAwMDAwMDAwMDAwMCBpbiA/PyAoKQ0KPg0K
PiBJdCdzIGVub3VnaCB0byBjaGVjayBtaWdyYXRlX211bHRpZmRfaXNfYWxsb3dlZCgpIGluIG11
bHRpZmQgY2xlYW51cCgpIGFuZA0KPiBtdWx0aWZkIHNldHVwKCkgdGhvdWdoIHRoZXJlIGFyZSBz
byBtYW55IG90aGVyIHBsYWNlcyB1c2luZyBtaWdyYXRlX3VzZV9tdWx0aWZkKCkuDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4gLS0t
DQo+ICAgbWlncmF0aW9uL21pZ3JhdGlvbi5jIHwgIDQgKysrKw0KPiAgIG1pZ3JhdGlvbi9tdWx0
aWZkLmMgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgIG1pZ3JhdGlvbi9tdWx0
aWZkLmggICB8ICAyICsrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWlncmF0aW9uL21pZ3JhdGlvbi5jIGIv
bWlncmF0aW9uL21pZ3JhdGlvbi5jDQo+IGluZGV4IDJkMzA2NTgyZWJmLi4yMTIzMTQ1NDFmMSAx
MDA2NDQNCj4gLS0tIGEvbWlncmF0aW9uL21pZ3JhdGlvbi5jDQo+ICsrKyBiL21pZ3JhdGlvbi9t
aWdyYXRpb24uYw0KPiBAQCAtNDU2LDEwICs0NTYsMTIgQEAgc3RhdGljIHZvaWQgcWVtdV9zdGFy
dF9pbmNvbWluZ19taWdyYXRpb24oY29uc3QgY2hhciAqdXJpLCBFcnJvciAqKmVycnApDQo+ICAg
ew0KPiAgICAgICBjb25zdCBjaGFyICpwID0gTlVMTDsNCj4gICANCj4gKyAgICBtaWdyYXRlX3By
b3RvY29sX2FsbG93X211bHRpZmQoZmFsc2UpOyAvKiByZXNldCBpdCBhbnl3YXkgKi8NCj4gICAg
ICAgcWFwaV9ldmVudF9zZW5kX21pZ3JhdGlvbihNSUdSQVRJT05fU1RBVFVTX1NFVFVQKTsNCj4g
ICAgICAgaWYgKHN0cnN0YXJ0KHVyaSwgInRjcDoiLCAmcCkgfHwNCj4gICAgICAgICAgIHN0cnN0
YXJ0KHVyaSwgInVuaXg6IiwgTlVMTCkgfHwNCj4gICAgICAgICAgIHN0cnN0YXJ0KHVyaSwgInZz
b2NrOiIsIE5VTEwpKSB7DQo+ICsgICAgICAgIG1pZ3JhdGVfcHJvdG9jb2xfYWxsb3dfbXVsdGlm
ZCh0cnVlKTsNCj4gICAgICAgICAgIHNvY2tldF9zdGFydF9pbmNvbWluZ19taWdyYXRpb24ocCA/
IHAgOiB1cmksIGVycnApOw0KPiAgICNpZmRlZiBDT05GSUdfUkRNQQ0KPiAgICAgICB9IGVsc2Ug
aWYgKHN0cnN0YXJ0KHVyaSwgInJkbWE6IiwgJnApKSB7DQo+IEBAIC0yMjg5LDkgKzIyOTEsMTEg
QEAgdm9pZCBxbXBfbWlncmF0ZShjb25zdCBjaGFyICp1cmksIGJvb2wgaGFzX2JsaywgYm9vbCBi
bGssDQo+ICAgICAgICAgICB9DQo+ICAgICAgIH0NCj4gICANCj4gKyAgICBtaWdyYXRlX3Byb3Rv
Y29sX2FsbG93X211bHRpZmQoZmFsc2UpOw0KPiAgICAgICBpZiAoc3Ryc3RhcnQodXJpLCAidGNw
OiIsICZwKSB8fA0KPiAgICAgICAgICAgc3Ryc3RhcnQodXJpLCAidW5peDoiLCBOVUxMKSB8fA0K
PiAgICAgICAgICAgc3Ryc3RhcnQodXJpLCAidnNvY2s6IiwgTlVMTCkpIHsNCj4gKyAgICAgICAg
bWlncmF0ZV9wcm90b2NvbF9hbGxvd19tdWx0aWZkKHRydWUpOw0KPiAgICAgICAgICAgc29ja2V0
X3N0YXJ0X291dGdvaW5nX21pZ3JhdGlvbihzLCBwID8gcCA6IHVyaSwgJmxvY2FsX2Vycik7DQo+
ICAgI2lmZGVmIENPTkZJR19SRE1BDQo+ICAgICAgIH0gZWxzZSBpZiAoc3Ryc3RhcnQodXJpLCAi
cmRtYToiLCAmcCkpIHsNCj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9tdWx0aWZkLmMgYi9taWdy
YXRpb24vbXVsdGlmZC5jDQo+IGluZGV4IGFiNDE1OTBlNzE0Li40YTRkMTZkMzg4OCAxMDA2NDQN
Cj4gLS0tIGEvbWlncmF0aW9uL211bHRpZmQuYw0KPiArKysgYi9taWdyYXRpb24vbXVsdGlmZC5j
DQo+IEBAIC01MzEsNyArNTMxLDcgQEAgdm9pZCBtdWx0aWZkX3NhdmVfY2xlYW51cCh2b2lkKQ0K
PiAgIHsNCj4gICAgICAgaW50IGk7DQo+ICAgDQo+IC0gICAgaWYgKCFtaWdyYXRlX3VzZV9tdWx0
aWZkKCkpIHsNCj4gKyAgICBpZiAoIW1pZ3JhdGVfdXNlX211bHRpZmQoKSB8fCAhbWlncmF0ZV9t
dWx0aWZkX2lzX2FsbG93ZWQoKSkgew0KPiAgICAgICAgICAgcmV0dXJuOw0KPiAgICAgICB9DQo+
ICAgICAgIG11bHRpZmRfc2VuZF90ZXJtaW5hdGVfdGhyZWFkcyhOVUxMKTsNCj4gQEAgLTg2NCw2
ICs4NjQsMTcgQEAgY2xlYW51cDoNCj4gICAgICAgbXVsdGlmZF9uZXdfc2VuZF9jaGFubmVsX2Ns
ZWFudXAocCwgc2lvYywgbG9jYWxfZXJyKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgYm9vbCBt
aWdyYXRlX2FsbG93X211bHRpZmQ7DQo+ICt2b2lkIG1pZ3JhdGVfcHJvdG9jb2xfYWxsb3dfbXVs
dGlmZChib29sIGFsbG93KQ0KPiArew0KPiArICAgIG1pZ3JhdGVfYWxsb3dfbXVsdGlmZCA9IGFs
bG93Ow0KPiArfQ0KPiArDQo+ICtib29sIG1pZ3JhdGVfbXVsdGlmZF9pc19hbGxvd2VkKHZvaWQp
DQo+ICt7DQo+ICsgICAgcmV0dXJuIG1pZ3JhdGVfYWxsb3dfbXVsdGlmZDsNCj4gK30NCj4gKw0K
PiAgIGludCBtdWx0aWZkX3NhdmVfc2V0dXAoRXJyb3IgKiplcnJwKQ0KPiAgIHsNCj4gICAgICAg
aW50IHRocmVhZF9jb3VudDsNCj4gQEAgLTg3NCw2ICs4ODUsMTEgQEAgaW50IG11bHRpZmRfc2F2
ZV9zZXR1cChFcnJvciAqKmVycnApDQo+ICAgICAgIGlmICghbWlncmF0ZV91c2VfbXVsdGlmZCgp
KSB7DQo+ICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICAgfQ0KPiArICAgIGlmICghbWlncmF0
ZV9tdWx0aWZkX2lzX2FsbG93ZWQoKSkgew0KPiArICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJt
dWx0aWZkIGlzIG5vdCBzdXBwb3J0ZWQgYnkgY3VycmVudCBwcm90b2NvbCIpOw0KPiArICAgICAg
ICByZXR1cm4gLTE7DQo+ICsgICAgfQ0KPiArDQo+ICAgICAgIHMgPSBtaWdyYXRlX2dldF9jdXJy
ZW50KCk7DQo+ICAgICAgIHRocmVhZF9jb3VudCA9IG1pZ3JhdGVfbXVsdGlmZF9jaGFubmVscygp
Ow0KPiAgICAgICBtdWx0aWZkX3NlbmRfc3RhdGUgPSBnX21hbGxvYzAoc2l6ZW9mKCptdWx0aWZk
X3NlbmRfc3RhdGUpKTsNCj4gQEAgLTk2Nyw3ICs5ODMsNyBAQCBpbnQgbXVsdGlmZF9sb2FkX2Ns
ZWFudXAoRXJyb3IgKiplcnJwKQ0KPiAgIHsNCj4gICAgICAgaW50IGk7DQo+ICAgDQo+IC0gICAg
aWYgKCFtaWdyYXRlX3VzZV9tdWx0aWZkKCkpIHsNCj4gKyAgICBpZiAoIW1pZ3JhdGVfdXNlX211
bHRpZmQoKSB8fCAhbWlncmF0ZV9tdWx0aWZkX2lzX2FsbG93ZWQoKSkgew0KPiAgICAgICAgICAg
cmV0dXJuIDA7DQo+ICAgICAgIH0NCj4gICAgICAgbXVsdGlmZF9yZWN2X3Rlcm1pbmF0ZV90aHJl
YWRzKE5VTEwpOw0KPiBAQCAtMTEyMyw2ICsxMTM5LDEwIEBAIGludCBtdWx0aWZkX2xvYWRfc2V0
dXAoRXJyb3IgKiplcnJwKQ0KPiAgICAgICBpZiAoIW1pZ3JhdGVfdXNlX211bHRpZmQoKSkgew0K
PiAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICAgIH0NCj4gKyAgICBpZiAoIW1pZ3JhdGVfbXVs
dGlmZF9pc19hbGxvd2VkKCkpIHsNCj4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAibXVsdGlm
ZCBpcyBub3Qgc3VwcG9ydGVkIGJ5IGN1cnJlbnQgcHJvdG9jb2wiKTsNCj4gKyAgICAgICAgcmV0
dXJuIC0xOw0KPiArICAgIH0NCj4gICAgICAgdGhyZWFkX2NvdW50ID0gbWlncmF0ZV9tdWx0aWZk
X2NoYW5uZWxzKCk7DQo+ICAgICAgIG11bHRpZmRfcmVjdl9zdGF0ZSA9IGdfbWFsbG9jMChzaXpl
b2YoKm11bHRpZmRfcmVjdl9zdGF0ZSkpOw0KPiAgICAgICBtdWx0aWZkX3JlY3Zfc3RhdGUtPnBh
cmFtcyA9IGdfbmV3MChNdWx0aUZEUmVjdlBhcmFtcywgdGhyZWFkX2NvdW50KTsNCj4gZGlmZiAt
LWdpdCBhL21pZ3JhdGlvbi9tdWx0aWZkLmggYi9taWdyYXRpb24vbXVsdGlmZC5oDQo+IGluZGV4
IDhkNjc1MWY1ZWQ4Li5mNjJhMWJlY2QwYiAxMDA2NDQNCj4gLS0tIGEvbWlncmF0aW9uL211bHRp
ZmQuaA0KPiArKysgYi9taWdyYXRpb24vbXVsdGlmZC5oDQo+IEBAIC0xMyw2ICsxMyw4IEBADQo+
ICAgI2lmbmRlZiBRRU1VX01JR1JBVElPTl9NVUxUSUZEX0gNCj4gICAjZGVmaW5lIFFFTVVfTUlH
UkFUSU9OX01VTFRJRkRfSA0KPiAgIA0KPiArYm9vbCBtaWdyYXRlX211bHRpZmRfaXNfYWxsb3dl
ZCh2b2lkKTsNCj4gK3ZvaWQgbWlncmF0ZV9wcm90b2NvbF9hbGxvd19tdWx0aWZkKGJvb2wgYWxs
b3cpOw0KPiAgIGludCBtdWx0aWZkX3NhdmVfc2V0dXAoRXJyb3IgKiplcnJwKTsNCj4gICB2b2lk
IG11bHRpZmRfc2F2ZV9jbGVhbnVwKHZvaWQpOw0KPiAgIGludCBtdWx0aWZkX2xvYWRfc2V0dXAo
RXJyb3IgKiplcnJwKTsNCg==

