Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D01469696
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:14:28 +0100 (CET)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDp4-00084G-Vt
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1muDb4-0004lz-4T; Mon, 06 Dec 2021 07:59:58 -0500
Received: from mail-eopbgr800122.outbound.protection.outlook.com
 ([40.107.80.122]:27212 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1muDb1-0002pG-Ab; Mon, 06 Dec 2021 07:59:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx/N7MR7MMwt84hv4/+G7RonwknympAeiaKR9GoAftGb1PT9Pis2x9nhWyy4QjMksaAAk6+gfFUNMcu8kGI1BjOoZHVg9+AB/VGTtE60f5skgESvGYTNJTAKM/UG2pITiGmvDDsy0va2EoeVjPxC4K6nWaey8/Fvnp1u9udPiz2XiDn4/weNPhfSYIbvwOdAu/pQllkIFLkXNvl5CP4VXL6I3MIhEzwZjMQG8ipIXMs58TCqSp9qTu2UZQcTKRXAv6Vo3uGG7bhEW+AYj+hPKJ/7OuxK2bV+7ik2G+2i5nASQrC9FNtl5uBPjyKI37g3FDXVQqe/GzjVrUkJnoUrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjvXFY56o7U2n27L9F8By+AF1Mjlw/n5Yx4SB02ZiDQ=;
 b=QtZtMgZJVNz4vjHmeXkPknuVe66RuGXsNGYFRnF0IQoUlI4/b1XYv1VLsOTJ6yTGloS0OSl3Tr2kbgPLTgNKuhu8DPkLonrjrcrZ8zrPg75t9TFk9Utj7oZc23D/aQrCSLWNuNHcVkonc3MDYaHaMZZvdC6ueXIU0Ipori8TgDEI744MJSvUCVANs2WFoQ2ynkPIFbWzOHht9X2uRKay9T47ZwKwDBVBHYUiqI5FRoWyb+MjeCF9K6JeCWX3yeSP769Xw5NtNZztgNxSVA8/3Qi8gjV5vWJxf+MTf6fhjaIAdxNagfwTnLJSsZuzsA0cYCOH/7FmoEATyeH+k681Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjvXFY56o7U2n27L9F8By+AF1Mjlw/n5Yx4SB02ZiDQ=;
 b=GlEcFW0LGuOUuDChWCWm3OWSplG0J7hrxvrz4DBJeeL7nuYRfFVBP+u1dxNXjymtDWs82A1kGVF2E9TQuZuXgPzrmb33DbUq4QTcrDwKLm3G1bXK1C0XvlAQ+LlmfoPSQKSxmdCME6VjD8d9fXu65Ej3Ggo5tdt+wa3JGfhGKrU1cN0xN8fhq1VtOv4WMmyqXcas69NZBKz0cZhBcclpyJBc4nUPqav8ogRy823xxuAvS+mkLxcBUqwhUxjBvvHqVcDdj9M83XzHb4fHLSJZv+YxOMygyeDNhr+CHJa0YurOMNAIfVceFuccqS3rTDu9U4ytTUqxfUq/K1x8DXYTlA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB1954.lamprd80.prod.outlook.com (2603:10d6:101:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 12:59:49 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::2818:cd6d:db5e:3ebe]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::2818:cd6d:db5e:3ebe%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:59:49 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] ppc/pvn.c: fix "system-id" FDT when -uuid is set
Thread-Topic: [PATCH] ppc/pvn.c: fix "system-id" FDT when -uuid is set
Thread-Index: AQHX6qCjE5gugPXnTECOosgq07n4oawlbJtw
Date: Mon, 6 Dec 2021 12:59:48 +0000
Message-ID: <CPXPR80MB522484DC28B535343BCE837DDA6D9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211206124538.627920-1-danielhb413@gmail.com>
In-Reply-To: <20211206124538.627920-1-danielhb413@gmail.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcce604d-bbd7-4aca-73de-08d9b8b84933
x-ms-traffictypediagnostic: CP2PR80MB1954:EE_
x-microsoft-antispam-prvs: <CP2PR80MB1954DC7C063D1DB4C4E9A97FDA6D9@CP2PR80MB1954.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rjfv7vP68bYm3ts5XwFbkGAxVXAHkGvghzjygFzIlaDs23YUiRBEIeqIJfIa173p+Xjv7kUAUBK1kZYX1QikbtRf7LXCqMBhIsUKVYRRB3HMRalkgwE/axMkTkBQrfIvPygru9PJ/mYhqlYT1guAaD1IuTneMvPDSVnorOl6iuAHQbqB7iBjyS8wRem6cD8boZ2rNDuwFjVCKamppDpIewyUD/oqSVHNlCjWrA3b0M4wxLPRGp7GD0yap3PGzGfp6/t6k4VOI37Tkej59mLuTDnD8YZEXt5THc9FPO4tqPJKpGgY+nF4ApEm92usqeGpsnBs12l6R3fuzWCMhIdlVE/Pg5Suap8w92bOzjGQEl7ZTzgCWYDttfF5pvqf/Dkyhw9P7rvqveylMoKUdSLasWwAiSv40PqdZbo3nehOhJsuEx4RvjpSzfUSTjC0LbZUa/JaGz6WY5rIwiPnBsh3k2IMwLbi6ipLg63xYPHKhtLsfY8mN33mYALdkKUnxCw4Ly8V+cw3yh2z1tH6XJGsAMjzd+9hArzV8CxvGkTXtoeh2OG5m4B5EjOxdx4nSc73o6r6YROjhRHwoigYnCIgB0mxedBG5WU4tXgvAk8L/TlAvsd36BquULNRv1mebMUyHgw5v6R5uoxivrlAiQx9aRm/+FgKlksCzyMVzAxJ0mXJFYDh0+nw3Cm0A7CrHx/up/KAvuNHqCeXiDLJWntdwtdTnJ6Kkc/S4M3WMHaCdUt868OrDPyYkJvKQU2ad5S8wc7PPvpW9bLjzDfQqOCzeATLz/qWsAjQKgzi2XdViXU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(26005)(54906003)(5660300002)(110136005)(38070700005)(316002)(8936002)(86362001)(38100700002)(122000001)(55016003)(508600001)(186003)(33656002)(76116006)(66946007)(83380400001)(2906002)(71200400001)(6506007)(9686003)(52536014)(7696005)(558084003)(8676002)(66446008)(55236004)(64756008)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZqGlxSQJ8DS3xdZVzNHPQ3bXd3oK64SAZ5KM2WDdhSUFBuQjz1bFSVHsTl11?=
 =?us-ascii?Q?EyAJP4xWmP1XY+7FnCPKd+kPFf2SDZXjS/C75C7jWrp+n2I15u1pBDCvSAti?=
 =?us-ascii?Q?0l+ZlGV0Q3sc8Jo5o2w7kyjwHJ7KiURp6EYtUXq+9UtVl3OVmwMLo5adv7tl?=
 =?us-ascii?Q?+xCdYmoGMdLojuLtKH2480p6mNQ6DgkfnqmfCMnQogQRtdVA9JSOkLb28z/U?=
 =?us-ascii?Q?x21EszN4ikBIOViFFtHMJuzvOFK4pOkML13Qx7m33H/NOx6LZeB1+8aVpSr3?=
 =?us-ascii?Q?nwyuvSn4PgZ/r+2TdP4XW9CBtA9GhVbFBD/rpm1+gUT7AJku96NbZqzrLOp5?=
 =?us-ascii?Q?51lErSyo4myE4TSDiBOn9mrWLBQ1Tn0KOWNWz7h3JoMqRUOTch4IcAdPh0Uz?=
 =?us-ascii?Q?XzLVa5uvigJckTRmhApVANiVcmeBbcf0WdqcTqnFAYHCs7ltLZMVmTMvVfmg?=
 =?us-ascii?Q?VoBeg7QSixKTMVHhcoeXs+/qd/KWNIDurCWvXUKf+ctXd6zDJLRC3LWoYixS?=
 =?us-ascii?Q?a0a8W4mITuLKvdmbGx8B98XPPxLujjmFhsWxpdrj8zZ7jExS7Yez2BdcT5RW?=
 =?us-ascii?Q?us5WjurhooppegT6Y76ZJ89EM8xRRH3VWbp0v+F5R24RYIpcM1tBGiHXaX6i?=
 =?us-ascii?Q?+tKIHVM5fhyU0rwHDhwB5FthLfKAcKE6FSboYH3hMwOZvGEfEwzZXiRTrgIS?=
 =?us-ascii?Q?YaPoKuoSO2mAN0E2sloKF1lNccispX5erk5jJ2iJjYpBDWhjo02yZcnkurUs?=
 =?us-ascii?Q?4dDzvcFTN/wDgrdGzZIQ2rZ966bkNnOadR76oKhe9CXARBwrDMRYbrjUI3mK?=
 =?us-ascii?Q?hP+QiBjxrD6WxkymfJZQv65T3BDqwB8X174bIIe1l6LdUXaWyNZseyVZdvvl?=
 =?us-ascii?Q?63veMVtyY/V17gbBXofOSGXUsjLWO3jgfPrycseA9FB3mwCIfV6dY0m+onEK?=
 =?us-ascii?Q?mUaQYEY2JnBBcJ9IAvMxk1a47KDdev4nT9/WktOF9i55kADkdyPe4hcWi4wp?=
 =?us-ascii?Q?91GLZ1a+z6cDLiSd4bd81O7hDGBlbANQDGGW57XeRBPgPo3QjEA5ACJBYSUf?=
 =?us-ascii?Q?wTa83OVFC4NigYBIDwy2RQudjJJOeezQkFe51VTCztexyfuW39o7shzHJmRb?=
 =?us-ascii?Q?APXrVeOqXtUmeayOlyJVcmIrBoLg6ie0Wv83q5QQ3MFz0QD/sXMEzfPZriVm?=
 =?us-ascii?Q?qk1OdW2alILlLJSDocjxBED29PS4CWyWd6Aq6SkK/Eb0CnFh1Xgdb2TN4gqE?=
 =?us-ascii?Q?65L/0VMlkmsu5ntCB54uclSOelH6/SyianNzQj2qbac5SSE2EaXuWxx/UZvB?=
 =?us-ascii?Q?KI8RROHy1TZsZITnPnATOINYMPVZm5bkRhXwCDf8HDt8TQGn6dxkyIafCff6?=
 =?us-ascii?Q?i6J6bT2LuKGZG7bErWFz1TE31UQQ2kNJ/xw8CCHitP7oSS104m5G3rk7ICKA?=
 =?us-ascii?Q?mQBlSODXe6XUjuA3TUeAK74j6mHgn8ISb1kwRNPffYYFBWt7nC1dat3BtZX/?=
 =?us-ascii?Q?b1AWJZIVeSUDNUXe1R6h+CuiheW0FAxg8GoLsMYjA0o7peks+WVfDhUvI8gc?=
 =?us-ascii?Q?8bjl52yQP06rAnmlhXwTXOreOYcUlxut9VVGvgf0Y6dbCriXjls2xhdF9iKx?=
 =?us-ascii?Q?3mJUCUSmU6acNydV9nCKhkg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcce604d-bbd7-4aca-73de-08d9b8b84933
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 12:59:48.8425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IhGbB1HWsFMkzcuDr1LJPjpFzSJiwmr5O4oGf5oTzw/9yeJm3f+ZRiLvbxZegpbmJENPNrj9vGDD0uvO0J43VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1954
Received-SPF: pass client-ip=40.107.80.122;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "clg@kaod.org" <clg@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>
> Subject: [PATCH] ppc/pvn.c: fix "system-id" FDT when -uuid is set

I don't know enough to review this, but there's a typo on the commit messag=
e (pvn.c -> pnv.c). :)

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

