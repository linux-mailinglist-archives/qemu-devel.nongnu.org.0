Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C06B6CBC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 01:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbVfQ-0007mN-Lm; Sun, 12 Mar 2023 20:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbVfO-0007lr-JL; Sun, 12 Mar 2023 20:03:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbVfM-0006PS-NG; Sun, 12 Mar 2023 20:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678665832; x=1710201832;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BwfQthPnzdnD/GCZkck1eaDjCIirFgeGMM4kb7le6+8=;
 b=fOTfQ2wPaXYtTawJAFWjSH3s6YEbEs8QVLc/NbgvsSQ3xJk018CNrOUe
 B4Ggps3ZnbSWad6q97J5atpz3mNM7bTq0u4OeKfaMSJ+HPqwUW2mahbPd
 tsZKBGqk8cpC3bnplV269CIW2Zqe7ao0M7ClhfE2Qcv6OjJ8u6DcnqGpf
 EX5tnDDqDab4xGyFeah7+zJthD0UrQPTBML9sN5Y4CLrImiRK3V3U8T+a
 xmBIv0m+ZkKhhc6WIS5F+FBJvvAwh++eT3aarmLbagoGfrHk9z7eeMvOQ
 SUiwzuUyaVutWylqaL9XC93wAi5W530/4LDJfQXrfP5vD6RmBE6HXdPlS Q==;
X-IronPort-AV: E=Sophos;i="5.98,254,1673884800"; d="scan'208";a="223742158"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2023 08:03:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB6YbjabPahtDDMulfiANhNZuJ1v1o3IIbFcY+92AYAVfepcsXxossBioSmVjvSscxLQLdn1wsRwe1LFjWBqV19IivxpRh63LKwreE5nmbeeBHCXogzWpxHLezbuOCqkgUuWynj1X1gYUghQwGoBg+QYkr8scEfI3RMS1u6gUvTGS9O2k/teg0CLcjXxVhVsHDrm8Jq2rrgBEWjRcr4CdOzNETOyL7YCnPiHurKh3ajuOizoUw5ke/sbf1ZziHBi4KEqF8NTs8XMkJ86kLyPKeJ+1VBf2P9qUmoQFoH265raEoKVdm9Cj1kKU9vVVQbhAlxbhXSPOOq3Y5awcYQFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwfQthPnzdnD/GCZkck1eaDjCIirFgeGMM4kb7le6+8=;
 b=EAYNSFcsgwtLoBC0kwXLBMiLk2Cq3d74As45Dna1JZa/K5D1OMjITLgAFGNtQAOmc0zyjrqEfZDAI0qfrC/PybitQRru9jztDeFLEsPnEBlpYrsOczVOdcpE+k0SzOfQsknPjUR1EG7V3ta/6Yj+f+KINRbObnuXRlVT7zjE2p7x5njH373gLovg0CJOQFElzrVtBZ5nfgHExOqJK4RaHNHeVW8q5nW2Fk5JIkyH6T1PAJKPyZvbQ68yxCgq9Hn34AFtpbx2v7kO3IReiBU0nq4cb3QUj/YaivDwmaQIqC+LYW1VTNFPP+WPUK5z/6sAO9Fp6EB9IECPSj92GG91FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwfQthPnzdnD/GCZkck1eaDjCIirFgeGMM4kb7le6+8=;
 b=qeYAdzVPNmmUijAf9aUbUf3eQI+nD6xIdxL+XIK2FUyAvmP9oqGfPubu3N1eCSKqDBn/mDgtD1+DSUr9i8xpjhZ8x1knnQvbSRRnfVG/kxX1XaNWa3JMDHQ4zDHLMlRtWPpZcs9TC/bkTyLm/BtYtc8VevnHy/Tx6eAzibQ63iI=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BY5PR04MB6373.namprd04.prod.outlook.com (2603:10b6:a03:1e7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 00:03:45 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 00:03:45 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "eesposit@redhat.com"
 <eesposit@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 6/6] monitor: convert monitor_cleanup() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Topic: [PATCH v2 6/6] monitor: convert monitor_cleanup() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Index: AQHZUrrSLjVpl91StUuYdqtaVWut9a732RcA
Date: Mon, 13 Mar 2023 00:03:45 +0000
Message-ID: <4977a94a9b7ff82487bf7b1db11f1a7c6d944219.camel@wdc.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
 <20230309190855.414275-7-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-7-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BY5PR04MB6373:EE_
x-ms-office365-filtering-correlation-id: f84b717c-df30-43d8-d9be-08db235669b0
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nhwRXNlq0Ig0k+Ex3ZUFqEKsmTHugX3bbUWCWwLBcgN6QBNVek7/kDcy1oMEiHGIqEkqwQi98o9BQBIDQfNDWl3asZV711ma33zjd3N+JurYWL80rZzhplJbC1NL68nelZ6OyjeXxX67J2Bpy++qZqS77sMwQH67xoAXPSlOYI2S9otW8PugP5+f9CwbPWykUoHei/4LiIq15AS8/G31L2t5nZwRUmDhO6UcFU9nZEXQIRkYxnX1rRXJ3+orMHPRhV5yWNCeRhlrV9CSpf29I9EhsXQn4xoMfvdXQr13y2glqrvJ09JkuHzKVWzxuS9shE5juoHtj9WUAwcO94H8Co0LTR2CniwSmc8ZpwOulWdw6SNr5rWOYV43NkHyv9GM8EUMiq3nYXY4F7beyBgMo15tf2becM0jxUpl2hXdJbCe1Kp5ZNyr5/dUE/YYj5EVEwpRo2qpnOhOiYNQe+1wPsTgF1IJ3RYfd1Hxmv6R1qQBQB60eQxjjrJ5MnodBJwgJaOC7JGzQEUItok77EDVgVT+UxC6bACnKegsvlYYjOnpjRZa4lp2aYXKqgCFCacPAMIpgKRTxAsqjQVh2vSpKHbg/tFuqyUI722IhO96Mczs9ytOR5Iv6jRGP7UOz7e2PBtQl7WQiTfGnnBv5Rif8tcaOaaQid5hKhtDPUhnbqHA7EMOug8/OXyyiTG2vJqJB6FHLNSfADMjmF6DL0dxmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(451199018)(82960400001)(83380400001)(110136005)(38100700002)(316002)(478600001)(122000001)(54906003)(186003)(71200400001)(8936002)(6512007)(6506007)(26005)(36756003)(44832011)(7416002)(8676002)(4326008)(66476007)(66446008)(66556008)(66946007)(76116006)(64756008)(91956017)(41300700001)(86362001)(38070700005)(2616005)(2906002)(5660300002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3hmUTduOEhMeEZGTElIMzk0OG5RNFlndEJWbnY2bFk3ajZTSXZhWTlLQ3Zl?=
 =?utf-8?B?R3JwZExWL3cxM1cvY21iSXZxcnVob3ZCelZYTXRsZHd4S29jVGF6NHJzTGU5?=
 =?utf-8?B?UmFRblJMejJoMWx3N1l6MXhpek5JM1Fpa00waUN3aTVIa1FzMzhpTWF5R3B1?=
 =?utf-8?B?emdVNjJ6UXZpeHFaVEhVdktiTW0xV01tcnJnQ05xeU9HTFg2bk9Od3RvNEJ5?=
 =?utf-8?B?a0g0bTZyaTdybE5iU0dwUElURU9mSlZmRkc0TVdyUUt5LysydFlaZTBKc2xO?=
 =?utf-8?B?ZnJ3MGZSK3c0QzFySTEzeUh3WnY0ZTQ2MXpiL0NOWWNXdU05VjVxWlB5aGg5?=
 =?utf-8?B?T0sxU0xuK0ZCUFFtUWpHTjFYT1FtbjR0ak1hdGZLaTQ5N0c3clZyR1BuYXZH?=
 =?utf-8?B?ZURXL283QUlrbHhhN3hrRlVicTArQnRFZDZKSmRWWVhGN1k1WjZRQVR5dzhM?=
 =?utf-8?B?VmQ2R2xseHhmTWhPbVlINzFIUUJ3dTRpb3RhdVVocWlRc3BvRm9WeGh5UzJH?=
 =?utf-8?B?eThSR1hvOTZXK1YzaFNHcmJFRWhTdGxJbjhCLyt1WXBwM1hQZCs2MW9JOUJz?=
 =?utf-8?B?cHJ4YW55VHVGV2grV2tsYWI5enhFL0JvM1BhK2pDbU1ub3pobGlLelBVUWZ2?=
 =?utf-8?B?aDlkRkhrQjlqWUdJUWVBbFh3aU82RUVjU09hRTZ1bXFhbXgrc2tyTFFzNzR3?=
 =?utf-8?B?SUZ4M084eVVxMW1wbFgyd2I2ZUE4NWhJRms5alJTQzJCSjdnVHp2YVJzSWpC?=
 =?utf-8?B?UjZBeGNKSTV3SjdjdXdIYlFOSk1uU1VUM0lUampTWnkxdzIrSisrZHZ2MG1Z?=
 =?utf-8?B?ZGE3QmVNaGd3UktzZWZqWWMzNUpNOEF3ZWFSK3Z0Wk4xWElVbFZkSExmL0pu?=
 =?utf-8?B?V3Z2ZDNVZE03a2FFcjdpQUJEeGJ2TUttZWhWb05jMlYrMW42MW56cDVNNW40?=
 =?utf-8?B?aTd2N1ViM0V4Zm0zR2ppOUtaOXlydzhpQWVKYnlWSFlaU3lSbU5ONS9kWDNL?=
 =?utf-8?B?ZUVTOVlGcjluU1ZBSmhhTkt5TGh1ZTRhNU51WFVnSW1BL1pHTVhYLzNucXg2?=
 =?utf-8?B?Qm81L1o0UDhsR2NFd2xCNzdGa2F4dGxneWRNZUdxK2hzM1RnVlh4aW5POUJY?=
 =?utf-8?B?QmIzVDV4bUYzT3FFVytod0NNR2RZZVdiUjh3SER1d2lEdHhqQ3hON3h5ZUVS?=
 =?utf-8?B?aHRNa1hyK25PaWRYejNmaTE1cWNyN0lCb283NFQ0V20zYmpUZWFMVFEwS1lO?=
 =?utf-8?B?bXFTbVFwQUJvclFvQ2YxcGhMQUpQRFRETFRWUzAxcFVOQXdMZjJlQndSaEo2?=
 =?utf-8?B?ZStPekhwU0t2WENqVXNTRUsxb0RyY3ZGVnhQMGVzT0loMnZveDYvb3VpdTh4?=
 =?utf-8?B?Q3FoaEh4WHliUVFJNXNUTkV3Q1FQUVZEUmRXNmJsMU5GaTBKaXVHeXhtajd1?=
 =?utf-8?B?TUxyY3FSdG5TZk1QYlJDc0ZoRkZRd2N3a2hibnd4enl5QXhPbEZpTUVsMS9i?=
 =?utf-8?B?aUloVk1JNTJOMFhNZWluNU1qNGxtclltQ1JpZGhHd0psRW93WDQ1VHplRDJG?=
 =?utf-8?B?SWEvWVl2OVFKOGwyMmNzZFFabHlFMXd4UktVdDg0SjMrVDh4ZUtIMVNJanVI?=
 =?utf-8?B?MW84dlR6bm51b0swQkc1UG51KzVsSFI2Z0lkWmtSUENLNzdjSjNZRXhZK2Z5?=
 =?utf-8?B?NUxMV2xQWEYrWlZmVDA5STFYZkNMWGtyTGpxOW5aSWFoQkROSysrWjR6SzNh?=
 =?utf-8?B?R3VvRTBaKzFDZzRtQVp2czhuQWlXZHFBN0dKb3JWeTc0Z2xnUk9weHpBbktN?=
 =?utf-8?B?SVZUd1NxU3RoL1ZMQTVxUGJYOGFzYysvT1Z6c3Evb2QvNXBnT01tOEQ5UjF4?=
 =?utf-8?B?UTJRV1hHZWlwbFdjemZsRk9kbExPS1dWV3cvV0hZV3dESmY0TFdLbmREWWFR?=
 =?utf-8?B?MlZzalZVTE8rdnY3VmpabXV3QTJIQkdwL3RYSE55d2RWMDFnUHlUbytZRk9z?=
 =?utf-8?B?a0FkZW1jK2E4UndaZkFYQUNORFZLZ3p5STJyV2drek9PankxbUFrVG8zemJn?=
 =?utf-8?B?N2tQRVVrZWVQVkpQNGdlNEtwUTRBcHZHek5VRlRsNDVFKzh2Y0tCZ0ZraFBS?=
 =?utf-8?B?bnViWTVrNmV5N2NRK0V4VmxQbCtWZzRsNzNJUkcyb1F3NlFjbFJ4NHNPTFJy?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF2DA2D9AD5E6747A2E5E80F611BC4E8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TSMgFjN05yNwaOwZa+YVvxXlo/oxSxSpLKZ12ngHRttVUDiXfVh9vL+NgvbZBAM8ZYf+NPE9am0sEBuKEGBLAYUQaJWc7+VkcxOZ+xT1vAG5+DhWBCxQ1sJ2kNPGZYix+CxDDq5hDcjk055kjkcKFUPLHH/xSqxIZC0hbalRhiMxaCW41ZY2Q1YH7IR1xnqmXV39mS4p4Ppm9WxcGm1hCyqFjGsBjDwHqp5zN8CpjsGlpZ3/5jXZxp7WVHuon+ZIW31K9b0IpZy+dlTLz7B/nO0kXJ0AXqrNxZTKwVpdfbeWo9El3MjedmgJwQ9EP2pUZk0F+lsBijYTOBTSl8a68jG5zU55YUEXXXJ6P3hCRNJsOqW7BlsChlzQYBn4xtG5i/zZv10FXeGP/EG4lwLhIWL2YSFYKv1zozyokYXnIOLm1aUEiMO6eoAHjTjG7ch+VNHau+T9NW5pn8fjFd6t5LoT/z8q4C30KDmmOk1jQIfRgz8JR6Q2ZIr7BmIgkkcftWkYUEB+6xxB6NLiuqetmSfVWfB8zgKueke+UvG8qG41aUtl3gv9bykgS8Ps2ljtSF7Gw/dcMzLgrplir8HirCR3vn/qXH+fejDjXBn2olQSC/VUSE7RfVjp1T3XP3toB3Xp6QjQbgHKvMjV9sF3A4uEa+bqXqXSiCGagWP82y/2CFzhZAbmbgDmLLRuunxFeUMJuhiLDkJI6Acq9X8/Tqpw37zB8EI/3W08jmawq717bZxlMsRvLg/tM0a0vikFxxJQOL8ZT+vPJYj/UZ1X/n1X9FE7s1+lOhqSg1bnWVbSzwRfGB5VxNzQSOM15d/QgOns6MCGgp7ZV9RTqBz0+C94Grv3/ovgcCYGLyYlMKE=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84b717c-df30-43d8-d9be-08db235669b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 00:03:45.0258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LbRnIVZZlF884gFFsoLGJ5LfDkV0Xi14XxiLthskSZLIiYkCkJeFpY6CAfZQ8z1V1i3ntyCAL67hbnLQNZIB1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6373
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=42906d642=wilfred.mallawa@wdc.com; helo=esa4.hgst.iphmx.com
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

T24gVGh1LCAyMDIzLTAzLTA5IGF0IDE0OjA4IC0wNTAwLCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6
DQo+IG1vbml0b3JfY2xlYW51cCgpIGlzIGNhbGxlZCBmcm9tIHRoZSBtYWluIGxvb3AgdGhyZWFk
LiBDYWxsaW5nDQo+IEFJT19XQUlUX1dISUxFKHFlbXVfZ2V0X2Fpb19jb250ZXh0KCksIC4uLikg
ZnJvbSB0aGUgbWFpbiBsb29wIHRocmVhZA0KPiBpcw0KPiBlcXVpdmFsZW50IHRvIEFJT19XQUlU
X1dISUxFX1VOTE9DS0VEKE5VTEwsIC4uLikgYmVjYXVzZSBuZWl0aGVyDQo+IHVubG9ja3MNCj4g
dGhlIEFpb0NvbnRleHQgYW5kIHRoZSBsYXR0ZXIncyBhc3NlcnRpb24gdGhhdCB3ZSdyZSBpbiB0
aGUgbWFpbiBsb29wDQo+IHN1Y2NlZWRzLg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gVGVzdGVkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFJldmlld2VkLWJ5OiBNYXJrdXMg
QXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBLZXZpbiBXb2xm
IDxrd29sZkByZWRoYXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiDCoG1vbml0b3IvbW9uaXRvci5jIHwgNCArKy0t
DQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNClJl
dmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiAN
Cj4gZGlmZiAtLWdpdCBhL21vbml0b3IvbW9uaXRvci5jIGIvbW9uaXRvci9tb25pdG9yLmMNCj4g
aW5kZXggOGRjOTZmNmFmOS4uNjAyNTM1Njk2YyAxMDA2NDQNCj4gLS0tIGEvbW9uaXRvci9tb25p
dG9yLmMNCj4gKysrIGIvbW9uaXRvci9tb25pdG9yLmMNCj4gQEAgLTY2Niw3ICs2NjYsNyBAQCB2
b2lkIG1vbml0b3JfY2xlYW51cCh2b2lkKQ0KPiDCoMKgwqDCoMKgICogV2UgbmVlZCB0byBwb2xs
IGJvdGggcWVtdV9haW9fY29udGV4dCBhbmQgaW9oYW5kbGVyX2N0eCB0bw0KPiBtYWtlDQo+IMKg
wqDCoMKgwqAgKiBzdXJlIHRoYXQgdGhlIGRpc3BhdGNoZXIgY29yb3V0aW5lIGtlZXBzIG1ha2lu
ZyBwcm9ncmVzcyBhbmQNCj4gwqDCoMKgwqDCoCAqIGV2ZW50dWFsbHkgdGVybWluYXRlcy7CoCBx
ZW11X2Fpb19jb250ZXh0IGlzIGF1dG9tYXRpY2FsbHkNCj4gLcKgwqDCoMKgICogcG9sbGVkIGJ5
IGNhbGxpbmcgQUlPX1dBSVRfV0hJTEUgb24gaXQsIGJ1dCB3ZSBtdXN0IHBvbGwNCj4gK8KgwqDC
oMKgICogcG9sbGVkIGJ5IGNhbGxpbmcgQUlPX1dBSVRfV0hJTEVfVU5MT0NLRUQgb24gaXQsIGJ1
dCB3ZSBtdXN0DQo+IHBvbGwNCj4gwqDCoMKgwqDCoCAqIGlvaGFuZGxlcl9jdHggbWFudWFsbHku
DQo+IMKgwqDCoMKgwqAgKg0KPiDCoMKgwqDCoMKgICogTGV0dGluZyB0aGUgaW90aHJlYWQgY29u
dGludWUgd2hpbGUgc2h1dHRpbmcgZG93biB0aGUNCj4gZGlzcGF0Y2hlcg0KPiBAQCAtNjc5LDcg
KzY3OSw3IEBAIHZvaWQgbW9uaXRvcl9jbGVhbnVwKHZvaWQpDQo+IMKgwqDCoMKgwqDCoMKgwqAg
YWlvX2NvX3dha2UocW1wX2Rpc3BhdGNoZXJfY28pOw0KPiDCoMKgwqDCoCB9DQo+IMKgDQo+IC3C
oMKgwqAgQUlPX1dBSVRfV0hJTEUocWVtdV9nZXRfYWlvX2NvbnRleHQoKSwNCj4gK8KgwqDCoCBB
SU9fV0FJVF9XSElMRV9VTkxPQ0tFRChOVUxMLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAoYWlvX3BvbGwoaW9oYW5kbGVyX2dldF9haW9fY29udGV4dCgpLCBmYWxz
ZSksDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcWF0b21pY19t
Yl9yZWFkKCZxbXBfZGlzcGF0Y2hlcl9jb19idXN5KSkpOw0KPiDCoA0KDQo=

