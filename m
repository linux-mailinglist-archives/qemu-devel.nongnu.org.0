Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721558C582
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 11:27:06 +0200 (CEST)
Received: from localhost ([::1]:52184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKz2P-0002VK-Gh
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 05:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1oKyp0-0007j9-J5; Mon, 08 Aug 2022 05:13:15 -0400
Received: from mail-dm6nam12on2066.outbound.protection.outlook.com
 ([40.107.243.66]:48704 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Frederic.Konrad@amd.com>)
 id 1oKyox-0004Dg-VR; Mon, 08 Aug 2022 05:13:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAJbn8lsvBdoacY77uhOMYYdEzbadMe1omhdqEEOgXuQbs64B0rEr/JBJNX4/2BmPtY9PtF7hG2oXqTcS6quQgdMWUC3nNq1Lq7Xqq4pLioO+Ikai0proYpL7e0yWIX1zFJtCU2UAzP6WN83PWz/TbCUppu652ArhYt7Ke5rj5AM/K/R7CPfjCU4IiWfJNdDHqn4lNxubdHnLVx0cPh/4mPDNx8vQM7PaMRmYu3LyDgzR1Qgz/4ThxYqJaq6yF+9iskZBTOYP1TlfdkwyxB8Y66xCCeL3o74XwbELvEUBQwKOkENHDo0RtUhTYDhxzB6+fL8ToqzQ/XIruHr4KH1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRg3Jhk9rMqYtXJdz4nabidyRP9n2oyLpsN1dWafv5s=;
 b=au8YkS/5XXi75SOQTD2nAFeY4W+Exx/YSCncRIFO8QbPxaWsJmo4zCamEsIpky9DbvGS80CrA2jZJCnpTbG2EIcwjCycp3/fqrLTMh8eSbwEWne98Tr/3t+UFqM7tmRyC4w0PGX6vPfyi8Vg9K5L5lPfdttmDOSqlNHnrz/vl+t2G0uE1Pdlxz3pjG1Tne+kW4NaGGZaqY6xbjekiTAf6zhIr6EYDyi84SOc3e66pv/IDgkWE/yD3l78UvkDM33ra/uAemToHP7jURhxEAQI2zQSmSElVIUJS5qlZD+Dfy+AcLIah0X1C2NltMUobthtAPeUnXVok48bz6HYKJ6RRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRg3Jhk9rMqYtXJdz4nabidyRP9n2oyLpsN1dWafv5s=;
 b=fdKrBN5xXtDGvQMM0yG11h/KVlOUAsj6PHAZSHq3kUxghBz9SfloBhnB1m92Zfd9UkzZfRhDJpMhB0K+IjuZNaRK/qPsFeLXXUkvZFXPnTE/1fe9sWDGEwv3qNu5L5moePqnklzVX2SF5qAr3kM+o0u3P32wU1A8sOEhdvyUkMw=
Received: from BN7PR12MB2801.namprd12.prod.outlook.com (2603:10b6:408:2d::33)
 by BN6PR12MB1123.namprd12.prod.outlook.com (2603:10b6:404:1b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:13:05 +0000
Received: from BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::64e3:bc0f:b296:7987]) by BN7PR12MB2801.namprd12.prod.outlook.com
 ([fe80::64e3:bc0f:b296:7987%7]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 09:13:04 +0000
From: "Konrad, Frederic" <Frederic.Konrad@amd.com>
To: Qiang Liu <cyruscyliu@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:Xilinx ZynqMP and..."
 <qemu-arm@nongnu.org>
Subject: RE: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
Thread-Topic: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
Thread-Index: AQHYqwVkOnec3vMvcU+uOsztiaj4Y62kt4Qg
Date: Mon, 8 Aug 2022 09:13:04 +0000
Message-ID: <BN7PR12MB28013CD45B4CCBD220411D8BE6639@BN7PR12MB2801.namprd12.prod.outlook.com>
References: <20220808075507.2183603-1-cyruscyliu@gmail.com>
In-Reply-To: <20220808075507.2183603-1-cyruscyliu@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d1eadb9-7163-4dac-51e1-08da791e3390
x-ms-traffictypediagnostic: BN6PR12MB1123:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /NoDqn1S4ld6G1v/Owjh1w3GBtYwWpsfh8rnK2HLMqVqqx/KfbST/xr04eI2G3r64FHI6EdVZAE50gCuNn4ME9UfyXlPoAmtBkjkIuaxuDnHvpd6rslxWZqpWwuJ4zLi0lFgPoGP1Gee/7hCCui2adkhbOJa2A55Wbc8iZbn4+ZTuM/8yJft6eV9IjkVYCpzvtl37mw09gv+wKlBCyLYvjIkVo/o3t0BPhFvZ9GT4griYLp7lGFW9hhLFqUBHX8TZf8gI1spUttiJVDXBk3l8J7afLRwtB0Kpf3HWjHcm9LItgSj5SeXvOqpPXedqG9sasVv8Xduj8gMlBQF8oezn2/fk4trGxDL2iPQkVr9zcgF3rKnOcOQr7LMLjXqjFEAx1Z4r7IfvYgcELyb2GTc8orc5gwaK2e3VpfbxlHT34dBUK73t2NAwS8dly345dxCH28uWsMaFjoQxvhw3rRiOx2BYN0eLwm1JT5QWTs9/2IJ5ZclODvWOEseNwLibh7MKfMH9vKKPn5OjBA7ppIEh0VG2kQmQFwiA3KhlrWkvYPL/pzkpM5yBmXBHsZqcKAQqXCeImzh6xWiuFiwc/QBImjwZ9ajymxoiHxTw+M9UydQ/Au5g62qqPdLHqqDP9l2qzeG/6H8trhbmWeKxHcyIuKxxNMfHDdqlgHm1rrWix6GvQN1AjlRgZEp/BM8Zdyc0JuV0emf+ilazHsnhoPjtouKySFleSIDYTl57/2bhq7dOZibtrYJXQLphsyv8Ngk1C5vW/tqgaseMkDsAH7aDSPa6xupyQ+5w1LHqyBWowrxEGjhnQQBNmOqywYZpsnj6pV2XnDTD51LE8ea3LlsdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR12MB2801.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(71200400001)(4326008)(186003)(966005)(33656002)(52536014)(478600001)(316002)(54906003)(5660300002)(86362001)(66946007)(110136005)(41300700001)(26005)(83380400001)(7696005)(6506007)(53546011)(38070700005)(9686003)(2906002)(38100700002)(122000001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8cbSPWznA97CB1ujiYB+PHEnQt6kHN+55JtiLkdkvRqZRKcSC940skpe59mF?=
 =?us-ascii?Q?11PrAUgBFZ+XANsAdIi1bMsf4TbzlByB4EmfbN1WuA8qpLNyY52EKDvIbx+Z?=
 =?us-ascii?Q?LdO9x+R50Dg7Kf6yphkuwYKf2wG5YBe08BTGgq6tqkDYBpGxb9XpkWYiZ4Fs?=
 =?us-ascii?Q?x80tOVEeyszwmEPUfWdojkmXNr5z6lDEXABjXJxPwbIZk7xPxvO9Qok22oJy?=
 =?us-ascii?Q?wnwWgzx1R6MqUKDPvypWhKDfOgWh/psHm2xR8pOTq7t6s8KsruhSIu1zOQvg?=
 =?us-ascii?Q?03f0DmYVWhLO52MbYNsCUb8a3isyuAuF4WCMaw7QwGGtVSSP9/x/8IILWytt?=
 =?us-ascii?Q?Q3UHK6jpvJcmg/NCmvBgUhFgO9s0PcWLejJ+6G+HvfdpJxKa94DY2nGJlg2m?=
 =?us-ascii?Q?hs0y2TqxrQB+E6jpVYYy5J95wc5HMFYD6q6wYNhBtV+G/hzRCoGWCzo4KEb7?=
 =?us-ascii?Q?2mCWWW7++s00OC/Lxx03/JUVfHrbmwkjDU2HMvMb/TgNBKHuxe4kTk805sne?=
 =?us-ascii?Q?hHtlgNja2Zz1BGyvjkI7pwBf6wxN/ah5S0psypBOaToALFiF1AdyEW4Bpr66?=
 =?us-ascii?Q?k/zucxt/KDRpp+3fU348VS9MBieuqIpMgR6h22X+IkxWe8LIFju8MGXRP/Wf?=
 =?us-ascii?Q?CAbq+ei7qOVY4GxD1WOugaZN7z23+OVwpqI452vnMWX5kYSW2XgKQ1v5Klq1?=
 =?us-ascii?Q?1OQLnYaQygVh5XO/NtdVpmX24lD0KrvQowVV69E0D6AqZe004XdcycQrq27O?=
 =?us-ascii?Q?TmEU4t8vJlBa65mfeLdgoe+cKbzKnrePt0nSesdiB76bBCV69HmDgzkZzxBZ?=
 =?us-ascii?Q?qFbNl/DJxy/70EtTrQguB8y8MgkExYPZ6gEqqTaExThcxJypCfAVA42z8N4w?=
 =?us-ascii?Q?hwbq+qrs64S5MPVPa/UpCzsOC+iWCh9lvxAF1um6xLkShK/tC9FfZeca26wi?=
 =?us-ascii?Q?CWviS1IBh6Gidyh1KDITRNVOEoFg7NPK4wPeqicOHjVticfbXHoFNeSIk3fi?=
 =?us-ascii?Q?ljZW5DCmFxv+I1xN9q+FcR7nlmkIny3vXW0E1PPBA3KPG/rR9f+rTjKJkdvY?=
 =?us-ascii?Q?X/CpH3k0EA2oL0yNi+3mFKwiSbGNX9befdPc+r/RLiuuLvFo0gUVdtAqynQd?=
 =?us-ascii?Q?HN1AWRkcsE50vJiZsanS3PkRKX7dlSaKbQl6YAmgb0HeoyJmRBQtKS7O/8d8?=
 =?us-ascii?Q?C9m1WtfQgks6ePOlQN0i1J75jFtWk80yldtwqm+gXvIudDKz+qQcKJ6Bo72t?=
 =?us-ascii?Q?1EQtO5CLLAt2z2HSzr7XeW/eCklCB/efHkBdCOU3zQAfkU8d+bAWd3iHE25o?=
 =?us-ascii?Q?K1GPeIlD4HnS7VjdQaJ+l7vgRfzjfo48vO8H1UIFquMziTc5wmyiZf579WJU?=
 =?us-ascii?Q?1ptKDixRw4JsKEkuon6IStlHeb+Dej7Jdib2HB8I6o8/l9t3vRM9uYqsZitm?=
 =?us-ascii?Q?Pe05xmNNXd5sQcW4OBG3xyucSJXr++P2yeQkZdXir0tikwAFbzk/l9f+zcs+?=
 =?us-ascii?Q?H0hFDP/gAHopPDgf4MNfu1grgpofPvx5aqsFDHy2B2pztqTKlp+vlgmXZclD?=
 =?us-ascii?Q?nFUoExbjVmyaZqUr9qU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2801.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1eadb9-7163-4dac-51e1-08da791e3390
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 09:13:04.6953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yuNjZv5BqQF75cVaD5r3BIOdLjZf/AP8QUdYe2qf1nlwAcey/fiFX77RnAuNhkC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1123
Received-SPF: softfail client-ip=40.107.243.66;
 envelope-from=Frederic.Konrad@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+fkonrad=3Damd.com@nongnu.org> On Behalf Of Qiang Liu
> Sent: 08 August 2022 08:55
> To: qemu-devel@nongnu.org
> Cc: Qiang Liu <cyruscyliu@gmail.com>; Thomas Huth <thuth@redhat.com>;
> Alistair Francis <alistair@alistair23.me>; Edgar E. Iglesias
> <edgar.iglesias@gmail.com>; Peter Maydell <peter.maydell@linaro.org>;
> open list:Xilinx ZynqMP and... <qemu-arm@nongnu.org>
> Subject: [PATCH] xlnx_dp: drop unsupported AUXCommand in
> xlnx_dp_aux_set_command
>=20
> In xlnx_dp_aux_set_command, when the command leads to the default
> branch, xlxn-dp will abort and then crash.
>=20
> This patch removes this abort and drops this operation.
>=20
> Fixes: 58ac482 ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/display/xlnx_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index a071c81..b0828d6 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState
> *s, uint32_t value)
>          qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not
> implemented\n");
>          break;
>      default:
> -        error_report("%s: invalid command: %u", __func__, cmd);
> -        abort();
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u",
> __func__, cmd);
> +        return;
>      }
>=20
>      s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |=3D 0x04;
> --
> 2.25.1
>=20

Looks good to me.

Reviewed-by: Frederic Konrad <fkonrad@amd.com>


