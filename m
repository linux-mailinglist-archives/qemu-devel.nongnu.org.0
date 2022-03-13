Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918A4D7519
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 13:02:10 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTMvI-0002S8-Ju
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 08:02:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nTMtj-0001a2-K8
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 08:00:32 -0400
Received: from mail-db8eur05on2104.outbound.protection.outlook.com
 ([40.107.20.104]:32032 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nTMth-00008O-FI
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 08:00:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFoq6p1Gq7/R3Yo8JUrTMl8Ls1o0JUPHcPd+Qfj3qK2y6LJoxBejcIiRUzGeySsIcogipRdnCG4eWunUFzAAKypptQc9yPPyqOIeF/fvVQCF0gTNZIeKxc09CGR0s9rk/SXd5w2WsbAOVMlp7QCGI3uRbY3TldA5ikU4FIIEKOHHmMv0Igm7XzkKJm0yVDsohBNrqDQKykPePdx+30ogMxinEqDNoyhfQ0ZRjKmyxeYAO1CttHLZUVOYGaggbLzjDRGJECt1AMQNfBpUcPq8fA62bh0hSRfdVhQp9I+0rC1uf1WA2eHx+R6ZX+QcAMLIfwk0100FL4Er+UoxxKOPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3JtGU1CPZ9PtcKrGY8ysjlznjn0p03nAardLN25wDM=;
 b=O+snLfrIDkIrDbvwFUStm6d+WwJwIR4v3i5sNAOlIOlY5SXh2BWXhpMC4wySOALGUME72ELRm/rUuecdo49POlmjQyf9Qo9500cXLERA6rChsA+Uo5uafueezPivwrFXqHaPTBH4Zk3mhBeLbYWEooIvqe1NxN/ILhJdpbnuQdCe4SuCBmfvlSIMIiNYbKtEQ7fDS0WPYt/Tc/j6nuMtcoJA7VU0Knj7Om3P0ARy4BeftABaOv+/F9AyC3f8ofWshlKmLBhbz8vQqJCyJic9toEvt7ow3XHB8XrXb3yKIduOFRAu0+gsMmcTVDSgjOvj75BtORmb3oQm73/HqZZQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3JtGU1CPZ9PtcKrGY8ysjlznjn0p03nAardLN25wDM=;
 b=Xn26lgYu+S8xeN6069/3Cu6+1mWXyPPzVZit187qDQoggTfvn2x+Y9QUxoPSY6CD6x5kz3kjAcSf7QNTzmlJvp2+fvf0UTCx7H3xmQmkw71AmamuLhkT+tH5wOY8mkSR9KzAPdFuQXizcLU+6QU8nm3FrCtdvKnK7ItTcAht4Cs=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by VI1PR0901MB1566.eurprd09.prod.outlook.com (2603:10a6:800:8c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Sun, 13 Mar
 2022 11:55:23 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b%7]) with mapi id 15.20.5061.026; Sun, 13 Mar 2022
 11:55:22 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 41/48] target/nios2: Introduce shadow register sets
Thread-Topic: [PATCH v5 41/48] target/nios2: Introduce shadow register sets
Thread-Index: AQHYNHJj+5S6P8mHo0m5+OvuX8R4v6y9GVdQ
Date: Sun, 13 Mar 2022 11:55:22 +0000
Message-ID: <PA4PR09MB4880000D11F64087C24E795DEB0E9@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-42-richard.henderson@linaro.org>
In-Reply-To: <20220310112725.570053-42-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0faf07c3-3492-446d-16f3-08da04e85ad1
x-ms-traffictypediagnostic: VI1PR0901MB1566:EE_
x-microsoft-antispam-prvs: <VI1PR0901MB1566F370A98CE76AA5582F72EB0E9@VI1PR0901MB1566.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VGH5qW37xMCzHDTTH2zfVQvCtDEb/uPuQTvTsVcAvbS39vGtJEHIaPyxgomxgfy+M0pmlKwWjODy0hL+fq4hopqQAOxQ/zv7LYt5cM34jAMtQiDCM+9ExjouzI5oKOzaNnp5JRpByg6CIXu744U9dODKdoL7Kn9tIuMPrIpiUFMrwoqQtb4tBr6LEZXhLVkQroZ72wWHvlAVA2ScAzx1UXMJAGhaneF2ojkVpXOxdwBnyLJmOMYqA4nM8Q2KTiPqKor7+tOH3ddNfXcn2KdVRLlcZH3VV0P+vCx8qyQTF7BrNwhJtQMEpvPPlOGmJQevWJoFU80OygaKs7FxllE1947iHGa3fD6nIbuOyT1UavOI0BzTTL3SpR5avCCqvjSWpZJGVZwrRBSVHcIuSQih7nYWVHDZEH44Kjp/risOMJEAVRtizU+FntnVxe0gIvJceRcNr72QoNHWfcJkN1zSvSSHhT8J9ej1h4sRvdYsiSkWAqGvFHW8Ek9N0eeD8wSJD5Wk6s4PcbqeBofOiQJ7ihivNAU+RSxILESkZdhrpuGgX6OT87bOWIzpzCLqBUl8uOyjmS5Q9bywjCbaTyQY3DL4BPkdgNwo5KcM63w/Pz9a0hHy+0TvAcQRJhMEGPjGYuDDAnB3yasvtpTXHnNMNKp5bWI30nDEfCmXee+LrUU50c2NLS1PNTWF1oO6cwkSaYQxfMPT4R4OE1YZxpEqdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(2906002)(7696005)(8936002)(508600001)(86362001)(5660300002)(54906003)(52536014)(44832011)(38100700002)(4744005)(9686003)(33656002)(122000001)(55016003)(186003)(83380400001)(8676002)(107886003)(66446008)(71200400001)(64756008)(110136005)(66476007)(316002)(66946007)(38070700005)(4326008)(66556008)(76116006)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WTB/LEBV50zXgpngrNARUKOBHq91HhW3FIbZeqKs9stDxHFRDmO7/WZgMvFr?=
 =?us-ascii?Q?8AFV2VNc129MgiE7denCJPiJZSBNCVCjcdyW9Pwj5LZOBlyJ9ecYPHuhkNPf?=
 =?us-ascii?Q?Tgl1ABM2aNtebJEUVj90NM9I2wQXIcKEYll5vy7KP/9AH06aoWgaa6Dx73LK?=
 =?us-ascii?Q?3zGpb/0tn6KYz6T7efAQbdxIw1tFK7AH4J+kFxoCzFs6DV5FAvgpkbT1waaA?=
 =?us-ascii?Q?Zx0jCWyFHVKJ3BysoQlzpfsqayMxz3hdG0A2J4GvbYR8bRMfKc2qURyYvFQu?=
 =?us-ascii?Q?WnrHgJHXF4zfQ4ixF9Tsk9IfMR4y6/mkY7xhCTPHxPiOR6FRfUXSPGNXr33v?=
 =?us-ascii?Q?PSpkOj+N1in8QHO+D0BclC8g5HxmTo1GCB1ZoDb8K1mhtab+LRoyWpU1jDDq?=
 =?us-ascii?Q?+A0j4/htCRG+pQnlul7QeLS+/KETlJta1IgIMq/hf7U9ogdNptAfWrr2HXoe?=
 =?us-ascii?Q?LaxTM4NzNR1SJF/yCi1Sl7gkf9h72jpL7hr7ZdzjsVGzwfHDhSUYo4fCg5e1?=
 =?us-ascii?Q?yW9W+7I5WH9dUyjekcCdXmNAtyfr954AmnINPf2zIrmZhF507xKN6+vIp2Wa?=
 =?us-ascii?Q?BNVduTUhfzCdthcNY6rIh0SqhVolJe6cXOPaTodrkO/HvNOn0y1orDsTJx+m?=
 =?us-ascii?Q?z4UbApPaY7xfyLsQw3F5b6U9T0kURjaYLk4auVbk5s683tPDLzOhp+EPYVQo?=
 =?us-ascii?Q?0E2mtj0wGvalpkP1JsK2HtsL4qRkLQAtW82pNK7Nbkqq6FdTzN6jppxAxHfG?=
 =?us-ascii?Q?y0RZj6C73UBuhWLG+LR9F9p6LZLKA3DD2OSXqpce2Rd7H6odWO/Lx5Os9yge?=
 =?us-ascii?Q?Oic3QZF2qvPJ1jXrvOq3RqqdZnYE/HZITo1dnReX5rr8XAm/9InocVDJMDA1?=
 =?us-ascii?Q?LuoYm3fNFub7uwDcWIvs0vMiVGB+sOFT1JLNaGt8so7ZPrfJ8G2kFm+DM/e/?=
 =?us-ascii?Q?rE88+ic64ynVSgueb82u1KwwxzlLLIKJrMbXqpd8ooRO9TXygxzO8qSRk8Bc?=
 =?us-ascii?Q?8vuwp9/uh47ddzpJalw7RS5vbuQwLPnw5uq8B5JlZQ2PsePDBsZZguHF4jo8?=
 =?us-ascii?Q?/hZNLEDGlJWmg6pJpEzRfLcpPjIyimoeLJE50UJ7TUOBvOTAoIlySBGSAeGW?=
 =?us-ascii?Q?47VegwPjsQQ/Xr2pINqLJBZXRrc+dqCs0gWunXnWHd9bzayNjmzKM9Y85lrP?=
 =?us-ascii?Q?pfDcxbxUDdKMRyE6xp+/Gv4wUu4JeJGuwEVN3w/LOTmQKkOCwHfulZ8h7O3c?=
 =?us-ascii?Q?io1oZLgkuisX4Q/snX4YUh+hzcfXLw9QGnrVUKZwV8DKC6fEh7gd5d5W8WeV?=
 =?us-ascii?Q?UH1hS7dklkXhsWAVq3PntU7HwwQshY/8Mc+VvjLk7C5YVBpf6DvB5AZ3QpeD?=
 =?us-ascii?Q?q/J45fbrVZN/hUOBP0nvl8HbsPlezeBAy2nrKWTd4i9+877+InZ+1sHI6BwL?=
 =?us-ascii?Q?6UdVn/0YjAZApRt9czm0JLJk7rhWC1PgFuLzjWBL09cS2/GjdFlIEQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0faf07c3-3492-446d-16f3-08da04e85ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2022 11:55:22.7829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ApAv1Q8Pzn52htK3N5K1OCBbYwTgGjzWlZOPvTmspaYJVP3vkddXxNJVt2CFH+jNi4daInAG2UHGTdBIMW09UuL9FAkbOwj+8Fc8LhvAD2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0901MB1566
Received-SPF: pass client-ip=40.107.20.104;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: "marex@denx.de" <marex@denx.de>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Continue discussion from Re: [PATCH v4 24/33] target/nios2: Introduce shad=
ow register sets)

> > How does "cpu_crs_R" work?
> > ... Otherwise, each gpr access would be indirect. I'm probably missing =
something here.

> They are indirect, but with some optimization.

Why not always access directly? =20
With an EIC each interrupt handler is associated with a specific shadow reg=
ister set, so we can expect that (on a sane use case) each block always exe=
cutes on the same register set. =20
If we update cpu_get_tb_cpu_state to translate differently based on STATUS.=
CRS we would still end up with a single translation for each block. =20
This way the translator could emit direct registers access for shadow regis=
ters, and we won't need to rely on optimizations to lower indirect access.

Thanks,
Amir



