Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE96B6CAD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 00:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbVWH-0003Ui-Ru; Sun, 12 Mar 2023 19:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4282d8238=wilfred.mallawa@wdc.com>)
 id 1pbVWE-0003TN-UX; Sun, 12 Mar 2023 19:54:26 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4282d8238=wilfred.mallawa@wdc.com>)
 id 1pbVW9-00054h-M1; Sun, 12 Mar 2023 19:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678665261; x=1710201261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6psYWiO2GcJ2cxcEiZT6/pO7Yko4/OFa0lJAJEsQUPs=;
 b=WlaFilbEj1ipcPkPQM8EDWKK4Kz2g6tuHhE6ZdEhxyw4r/R6wgreraOO
 Ses/qKLaE5sIWZs0MN+fTfeGBQSs+IoSjU3tYsDjArPLAFSKgj+TZqTiP
 cctFp0K8lB0eauc0NwUtlFmndqVsUMHjqd18aTiVM2OINpDuJT/g07IEW
 QgPG0mSpHXJI12SsVECD/zHDnlJMkdJC2B/N3zwWzAGyZqPDfypB2S6VK
 TbcxSeiiy8JF2/aBUH6nAeOQeO4/BBH196wIIymYUAz2hFWG5f/rgJogo
 PkDszZlOfxtAAwW5rtwABkBWGKONMS5IHFfG2d71eECHuy1Q8ku+9E/h8 Q==;
X-IronPort-AV: E=Sophos;i="5.98,254,1673884800"; d="scan'208";a="225458118"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2023 07:54:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vooj3ykp8W7nLd4uc4KT9VtYl5eVs/qQ3pbaRvnTukDE4HSC7ZatzoEGumCJqKV6TnEUBw8O8bAn91iK5+NunV3CxktcC34aOQn+b+7E3VlhtW08KnwscV2M2N91BvLERkr1RXxj2JyMyn8VAmWbzt0i303arUXk5zXZ797YQa3AYS3bXL7RSjVsmWb0kOwgkFQGOgexx+Sak0kJdP1FJ2anT1xtBSX3ux9p8Lagub0NBOWNJcZ3vrXJhXJ6cBHrByFvkvu1/VSenKb8edWJDOMU6YmCnUnnmubosjTzTNF61lHwbJgJoVW19gdNA++KN853hxwn381S3GuyscHS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6psYWiO2GcJ2cxcEiZT6/pO7Yko4/OFa0lJAJEsQUPs=;
 b=SaEAmykqUpviSAAZ4em8DDz1esXcRP8RgCTv9fO+A3kh1IF8D+AYWqCiHyCA5HiVamT05pkOcO7yemWRd/f4e6cKfKw/cHybm39we/jUFvF4q+VThOC4bMcAqgm9Dkb5TeLBnChEWOrBEgCCRwmJrNQBnmj0o7Sl0G8R5gygA+Sj3qKbXtjg7JDkCT8+wmVWm/Tf4YKX7T/sG366xoS8GWxDBfXSXbkxWnP4AXQLsyXWQ5NIzWJq9Ob+olnjXT1hR069ZDIFIItHaWd7tCjAfZc7k+a/yH4HawlRI6DTVF1J2v80sZN/LlHUB07kUbYG2k2bA9G8XQutC3EfVXiFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6psYWiO2GcJ2cxcEiZT6/pO7Yko4/OFa0lJAJEsQUPs=;
 b=U3CLBiBbvfh6wWxNZVqCjs2Beul4YZosJ8AagFiGvamQFVPBGHZFp6grNDiiBOGd3ZbeE+qr1xG3SnVX0q7Txjbg9T+UGFGViBuQnzYwE2SVSKrs9qOWcbB0PiQIoMJKCVvr8DjQm/Kr8Ouece+0VASOUMU+dEyv8omEc2OyM5o=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BN0PR04MB7999.namprd04.prod.outlook.com (2603:10b6:408:15a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 23:54:14 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 23:54:14 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "eesposit@redhat.com"
 <eesposit@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Topic: [PATCH v2 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Index: AQHZUrrMqaYvEq1aH0SA1VLi7Oy50K731m6A
Date: Sun, 12 Mar 2023 23:54:14 +0000
Message-ID: <20dda23b3d448a72859a2b7bcbdfd1accf6ed2a4.camel@wdc.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
 <20230309190855.414275-3-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-3-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BN0PR04MB7999:EE_
x-ms-office365-filtering-correlation-id: 02e3b7a8-efad-4490-e709-08db235515ba
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Z0DeKeJ0kQbtw+N11yzPSc6DRZ3CfMRpxBVZPRaFutngaktXcsokiBORZwewJYRO55XchaICe01y9G0ZqFmookLzCqqt565GZ9GsasgbW2CjKw1HPPRdFz2Oq49yMUfcjGSAJMMXel+Kd0bIjgopIJ+U/lyBammrbeUD41TRRN6/QU9xGdGJF7vl7TV0f02RxUEPN7dkuigRrroYpMBtePgrLL5tYCoEK2a8XWFMuYu04LSygoYqg46G3I4wJ6LeMhmxpdMLFgefNY4NfnWXa4OTTCJ3vMce9uywQRy9c5SLN6fSpOO68AzXcazRWtaCJMmHliwpyvdlD1HKtGJJeLlvdyS4Y19FkFZDxl7jcCyN1Ral/mD9pw5tweLcgEax3dm0wiLHddE0W1o4vTeWN8LJ+ZyTKSG9N1UQp79WdrD6P36YviLlbPK08JmxszOc5b43O3HiIkXTcuTowK9oyMhf4xWU2snFXsG4LNwhA6Zq2o6Y4iStEmuZBKsxqTa1HDT7IapvEUlzSxfyjsHZDxCduOnOQ8cRcI0AAKyz0SlRfwqlVFNXg4FEBMJ/ibK6Tt8g71Ie+ZJnY259EMU9sggf947oET7bJdx3MdX3V9ZinVCOZTAwypWuzQVOHyJMByCy9Hr/vbuVkHPD5HLeL5nqshg0K2+z5bkUFE7UjGCaAiUps5fSizdnFpDVwkQcFKJTMCJBCdqp+KW1ZiwmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(36756003)(86362001)(186003)(41300700001)(26005)(6506007)(6512007)(5660300002)(7416002)(4326008)(2616005)(8936002)(316002)(71200400001)(110136005)(478600001)(54906003)(76116006)(8676002)(91956017)(66946007)(64756008)(66556008)(66476007)(6486002)(66446008)(122000001)(82960400001)(38100700002)(38070700005)(2906002)(44832011)(83380400001)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUVLdHpiUm5pYkNvdkdqd1MrRllPQTlLL3VSSzhGaEgwWEZreEk3MUpuSk1S?=
 =?utf-8?B?TFpMOTJQczc1c3RnUGlId2F5QThPQjRBcHpRbS93Ynh0S01Gc01TMlZPU0Iy?=
 =?utf-8?B?SCttbE15TFlXU254YUVkdkRtZHc1Q3RXYnl1Ky9XQmNxbEdEZG15TXo4alhS?=
 =?utf-8?B?TW1rNEw4VlhYVnRRT3JiaU84VENnR1ZDOEV5RnZVeXQ2R0pKanhudWFXd0FV?=
 =?utf-8?B?TEVDUHpZV202YmZRSi95c2p1LzFsU0RUT09BaDJyRy80bU5EWG4yamEvRE1y?=
 =?utf-8?B?UlhsaHB2K2E1WkR0YXp1eitTTXVTVFNXUXFIUUJTVVFGUGVJS1dndC9saElq?=
 =?utf-8?B?b1I1VXM4aXFxTDlsVytsYU9RbjU4Ny8rd2tMT3VkeVV5Yjd2VlhVRkFCUld4?=
 =?utf-8?B?Zzd2VmZwVm1OdkhmOGkvYlZtQm1GUU45VVJrcjE1TFE5VU1BRXE1S240TExi?=
 =?utf-8?B?bXI3d004UzZSV29TSGtxendLK1Uvc3lUUG9rVFUzQXlBcVRRbWFwaE5LbnRC?=
 =?utf-8?B?d1MySEpWM3RFYkEwZkh2WTFnZzIzeEkyTTRIblB4QndMbGRlY1k3c0gvdjA4?=
 =?utf-8?B?YisvREV2aUlIQ0RaQVpOSityQVBDbUdxcE5uNFdjSm5qMmxtZUh0ZmNvMkRK?=
 =?utf-8?B?MnlFUVhOTkpwNURjZzR6cGNteFkrYkoycHpYbldjUjgxV2YzRmRRa3RXNjJL?=
 =?utf-8?B?OSt6YklXVnF1MkFTRk52NXB2MExOYzEzODU3MkhRTGVEVmx4ekRwNGl3ZkdD?=
 =?utf-8?B?ay93c2hRVkVtMGIyMm8xNGpkT0RxdmYybXNLK3VLTmtyWDBBbjJ1RHZRSU5S?=
 =?utf-8?B?OHIrZVdQalRjRWpHcm9ZWFJkdEh3NWZQQWRjV2VJMEpXeXpMZjgraTk1MmpZ?=
 =?utf-8?B?WTdjVUxKeTVlYzEybzFSWHUzRHVPbDFkZnRKUnNEYWFZanp2R0svQTR2YU4x?=
 =?utf-8?B?dEQwSVdSNzRIM2hNVGlmTTZ5R25rNTNGUDk2VTN5ck51bGFUT3R6N0lkL3ZQ?=
 =?utf-8?B?OU5IQzRNdFhjVXhBc29Bd2dUM1FraHBRMjlGdTMvYnRhVU1OaDM2d0ZTWWJU?=
 =?utf-8?B?WjB2L0toZzN6T0NaMEtLdGhaQWpsSWpKSmRLSDdZQWQ1VDdQcm1CRkpMM2hk?=
 =?utf-8?B?R0IrZmt2cFhsMVZQc0w1K0U5Z0lqVWhaUHdMYTdwdTdNZjVGU3NyK2NGbVBL?=
 =?utf-8?B?MHF5YkNZdHQ1cnJPbmRrOTVTSlpzc05HSmt1dXpCNDgraFk2RXhCN0hSQksy?=
 =?utf-8?B?YnRMbTF6dVJOTDJUUitSUkxaYWpwTlVXc1hnSHF3OTFQRENncERZYVhHa0Z2?=
 =?utf-8?B?S25LRm1Pa3lBU3M2ci9uV0h3c0JjUHBvMFVteVhHb2JJenhmQ09nVHZ1U3Ir?=
 =?utf-8?B?TWtibEZqbGt0K3V1blVoNXM5UEs3NEQ2UVA4VWpjZC9BYmR6YUhVeDlPU0NV?=
 =?utf-8?B?empLWmFJeVZrZDQ4eW1mS0M4QXhqMDZoaUlaNXlMTlV6eGRFSGh4L0hpajJI?=
 =?utf-8?B?RDFXVVpZb2ZSazdUZmlsQ2x3d3g0R0JWcEdacDYycU1iYWpxK1R5Y1RiMk1H?=
 =?utf-8?B?MXY3dGNsU1ZIdG9mb09jTE5DMEQ4VGUyRFljRkJZSEtyVXk1OVEzNTB0aERq?=
 =?utf-8?B?QjhDMGhJNW40bEF3S1V4czNJT0tDR2QxVlNkVnJiMElGSk5Zd05PSXJXVi9K?=
 =?utf-8?B?NUx1RTVVaFlpTlBxakgrNk8vaU9jbUYzR1g1b2luWFpDY2pvZFBLTU5VaTcw?=
 =?utf-8?B?azNJTXo4ek83YWZqMnRyeTZXRVdoeHc4RENoN2ZaZERNeWhETStIT3MydTJx?=
 =?utf-8?B?bWJnZkhEUWtxNkZaU0lJNFFsNllUdDJzMjNFSDBTV05sOS8zNTFkN2p4WFE5?=
 =?utf-8?B?OUpMMnJKZUZGcHpab2xiV3RpT2dKWDlneE04ZVFaRXh3YUkwWE8zQ2t2aWl2?=
 =?utf-8?B?MkhtMmtpcmJtYlNXTnNXUElScEczTWUwQmx3NU1XUEt4ai85YW9Tb0ozUVI4?=
 =?utf-8?B?Mm45bFVRZnRTUmxIN0oxZFJVMWgxaU9OcFRWbjIzVkswcjdDTE1yS1Y0MXRC?=
 =?utf-8?B?enpqZ3ZIKzE3NnpreTVvUGdWVDBsM1VTems1OTF3azZUc25iY085dGMzMExw?=
 =?utf-8?B?Y0JOSXpCT1prZWpuQXByVEM1VkNnelFteXRPbWRtalk2OUNwaDYxZlQxUjZN?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9533B42D0D1613438903B69F17302661@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mNun/Q5dmDr6eaeDmo0KetuoSxFuLkj0UJPKW565nJdthwcmoe8iP3TCr14Zn4PevcTsjj46XnPp7Ye1JYey2pUJ8nbEHw32JQWuQ1ZX7dgQ55VwEFDeCJxxfa3U7B585YV0n5+Zln8nepJ4RRfxuqfGUdt8AzbKxLMwcVq3K2c7+YeemSn3whfz7avbtckWiwaKsIit2rPKKlJ5MbtEf0RJvAVO10QqBwmUiWets1tEeAmF7nTQktnoj0ARvpYg94+wHKK8ZwrcQmuL0Cyo9Tfvd3krOcEKC1mDEiAysQ3ARkEELIfG8PpZvetOq+emwAfeCqprHkn1aUkZH6o+6l91YAcYMwC6KzTLMDSvliQZjcJDrSNxhF5s4cvbUTqhYV+GhcOgSCjeA0dO3ORLyqaM9Rf2TiNaNuge4UAMothX1JoDSMjAO9FIV+b5LFZXrtzltSYw1on2KfzhH9I38If5eFWLDeQH+vT5V6ZktdMUz7HKtI03hLiNqMI7ebmntXD3L7v5K4OBJ0IXGP1r9qalcgxGfgYPpegqEFL4ijS+hAvWX8X12VvZQHKlObYJKnWYU88DeI/fYhAWcXWhYiMIhLdAprUAJ2CfjLneCg5G/eRKJiy0gZ7kLuJRwv6mb3OCyD5ibpVqRVIrKOVDkP49Zn1NsdmKGISzrRQhdiiF+aS4F8RO/2IEIaRh+Z24BATX4ODX2Zfd+I4W98cvnJsopCPbAhQACBZa9396CIapnAL2mHSqIHLSx2uoWabV9A9dhfLWxEYu6IlkBJ+LEVkntChXv9et66qCxbbZVS5I0wPO6/kcXq1vQsvlFFHo+iF5oen/2hXnydcJsEdcFawAtVPo5eviIjaUB0fPss4=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e3b7a8-efad-4490-e709-08db235515ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2023 23:54:14.6194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHW+B8GhG5Rc3r7AVwhFHIGq21Zhpb/QRvjRZxxUjCT+E1V4AcKtjZzsVgtWYFsJQGo/dTz/DwxXD0KI/kLVIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7999
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=4282d8238=wilfred.mallawa@wdc.com; helo=esa6.hgst.iphmx.com
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
DQo+IFRoZXJlIGlzIG5vIGNoYW5nZSBpbiBiZWhhdmlvci4gU3dpdGNoIHRvIEFJT19XQUlUX1dI
SUxFX1VOTE9DS0VEKCkNCj4gaW5zdGVhZCBvZiBBSU9fV0FJVF9XSElMRSgpIHRvIGRvY3VtZW50
IHRoYXQgdGhpcyBjb2RlIGhhcyBhbHJlYWR5DQo+IGJlZW4NCj4gYXVkaXRlZCBhbmQgY29udmVy
dGVkLiBUaGUgQWlvQ29udGV4dCBhcmd1bWVudCBpcyBhbHJlYWR5IE5VTEwgc28NCj4gYWlvX2Nv
bnRleHRfcmVsZWFzZSgpIGlzIG5ldmVyIGNhbGxlZCBhbnl3YXkuDQo+IA0KPiBSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBUZXN0ZWQt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gUmV2aWV3
ZWQtYnk6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gLS0tDQo+IMKgYmxvY2svZXhw
b3J0L2V4cG9ydC5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KUmV2aWV3ZWQtYnk6IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxs
YXdhQHdkYy5jb20+DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYmxvY2svZXhwb3J0L2V4cG9ydC5jIGIv
YmxvY2svZXhwb3J0L2V4cG9ydC5jDQo+IGluZGV4IDI4YTkxYzljNDIuLmUzZmVlNjA2MTEgMTAw
NjQ0DQo+IC0tLSBhL2Jsb2NrL2V4cG9ydC9leHBvcnQuYw0KPiArKysgYi9ibG9jay9leHBvcnQv
ZXhwb3J0LmMNCj4gQEAgLTMwNiw3ICszMDYsNyBAQCB2b2lkIGJsa19leHBfY2xvc2VfYWxsX3R5
cGUoQmxvY2tFeHBvcnRUeXBlIHR5cGUpDQo+IMKgwqDCoMKgwqDCoMKgwqAgYmxrX2V4cF9yZXF1
ZXN0X3NodXRkb3duKGV4cCk7DQo+IMKgwqDCoMKgIH0NCj4gwqANCj4gLcKgwqDCoCBBSU9fV0FJ
VF9XSElMRShOVUxMLCBibGtfZXhwX2hhc190eXBlKHR5cGUpKTsNCj4gK8KgwqDCoCBBSU9fV0FJ
VF9XSElMRV9VTkxPQ0tFRChOVUxMLCBibGtfZXhwX2hhc190eXBlKHR5cGUpKTsNCj4gwqB9DQo+
IMKgDQo+IMKgdm9pZCBibGtfZXhwX2Nsb3NlX2FsbCh2b2lkKQ0KDQo=

