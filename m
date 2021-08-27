Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B0F3F9D36
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:06:08 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJfIt-0006hn-0q
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilmut@microsoft.com>)
 id 1mJfHP-0005bg-Ld
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:04:35 -0400
Received: from mail-eastus2namln2011.outbound.protection.outlook.com
 ([40.93.3.11]:49734 helo=outbound.mail.eo.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilmut@microsoft.com>)
 id 1mJfHK-0006qm-JA
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:04:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnEq1bzEZ8mdZnJ+hSI6QN1KV8uzRFu2myb+nZmgglg7CA144mm1j8J5iHZ6lO3Hr0gZUvuh3aN7bZgu/1G4mCqI+tIYnzyNddOFsw1UjgqsPOVP08zwBHWD1YGBNjSxy6P1VKjtr8IIwSYFAU5dDX1jXzBUUjWZKzkYPYfD2/blXiTu6LFAMpQVEVKXNfapxm8fQmtJ3wK7NoDatsNwQgZ129FTZ6NkTdPoXLeOGxS0lzjKT45VajN7NrJgoVX/NqnNmxP3Xwt4GTUG1g0DnVN0nyNAybC9waTE5ffpSOqlct0DmcYQZPYVg4OZZwX/pC31PpjatuKkF4hizlIHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yc2qnmtIsdKsv53Ec0YhYLy2rDb85Dn1BfZ6V7J/KvE=;
 b=V+51iyOSLbFsKy42a+tjqC1E3ady5BiZX9XI0/0o09vJS3iOpme7RbifrcjlBb+vp5GOR59D+uvJuKpsokBBJbYQ5REhrWxB2yzgoNsWnZQHpXCr/16TGu+JtISvz/qyKZI7YG3TFWEtWlFFVXLTPkZwQOL9WijDBDfHI5uVQVLJnQKzNUR93ew4vPTnUrJddXTbM+qQ7NOgIBio9KhJpKDj32fzQXPH8DL7EzcJEdsGlx8a4vDBnpzwv4ntHGbaB727+f40Q0/gPx6oQBpX+ZIk2r97FeSRYBfzV3fScChgkzMTKiLJbJAoEjTC/WgDog3aFGwWRFo9fyTcYKuBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc2qnmtIsdKsv53Ec0YhYLy2rDb85Dn1BfZ6V7J/KvE=;
 b=QDj7E2pl37/1T+naqK83qOkwe1AoELEXYaQrAkvyBdi35fm057/SSDTGamKjpDS4rN4133lzY+58EN5n2nxQxqytaLZBIbe+CxyCKAy3a8+HraqYHdW6r9z7Wt7LAiNgLJ8oXBeKZ6w5V0YXLjntwUJSXlqOINs88toWmzfgY/0=
Received: from PH0SPRMB0007.namprd21.prod.outlook.com (2603:10b6:510:48::16)
 by PH0PR21MB1305.namprd21.prod.outlook.com (2603:10b6:510:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.11; Fri, 27 Aug
 2021 16:58:16 +0000
Received: from PH0SPRMB0007.namprd21.prod.outlook.com
 ([fe80::19eb:a62e:1f6f:9966]) by PH0SPRMB0007.namprd21.prod.outlook.com
 ([fe80::19eb:a62e:1f6f:9966%7]) with mapi id 15.20.4478.001; Fri, 27 Aug 2021
 16:58:16 +0000
From: Sunil Muthuswamy <sunilmut@microsoft.com>
To: Markus Armbruster <armbru@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Kamil Rytarowski
 <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, Reinoud Zandijk
 <reinoud@NetBSD.org>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: RE: [EXTERNAL] [PULL 08/15] whpx nvmm: Drop useless
 migrate_del_blocker()
Thread-Topic: [EXTERNAL] [PULL 08/15] whpx nvmm: Drop useless
 migrate_del_blocker()
Thread-Index: AQHXmv8kn7vxntzpmEaj0LV8Ao7+K6uHkveQ
Date: Fri, 27 Aug 2021 16:58:15 +0000
Message-ID: <PH0SPRMB0007A274652B55CB19F742EFC0C89@PH0SPRMB0007.namprd21.prod.outlook.com>
References: <20210827045044.388748-1-armbru@redhat.com>
 <20210827045044.388748-9-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-9-armbru@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85fbaeac-d55a-4caa-662d-08d9697bdd20
x-ms-traffictypediagnostic: PH0PR21MB1305:
x-microsoft-antispam-prvs: <PH0PR21MB1305E65FB1B046946B5A330EC0C89@PH0PR21MB1305.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yFQl7uObBxWLFi8lrWAy36dveW2ncl3psQVo3rXCkPmHamyy47zM80OZZybmBKwJVlzdHX8yf/GPcbCZ7MmpBxJsOe+AZTl9psUwh2la/60/D57fncqHLEB7KlKi7lZoOpf26Of4ul1PtCIInIKgzz70uFfyZgR3G0zc7UWEG6A/ZKfNDih0d4pyNVW8yANHAYD3mpIf+krpmp64ZtCsKTeGhp6xtjO7kqXZIO+TWOaiOBBOO8uco12OxwuKTG/cd0m4EOCPnjCFOmd+ADSAV03lktLS8atJxE1ilMPY12xwVqaSBZtdQfPiOG+mJ7fYJshLdBwWaflrwf/gbZOrZmzT8Jkc4Ev1pPsJKLh6s7V5jPdyCKe9wpVmuhFwtvB64JUN4w2ZW957hSJpcrD1vLpkuavNM5P1L+B9+EehSJSODHMBDTf017ttBrBcrG323piw0PkG9AWU547hD0hKmXTwB9l5IYkDWvh+Td4mi1ihtzgURyplbNC2rpoONMgG7NjGvR4jMi6MTpFz5p9JZs0959N/ae6GmeQXUXF78TQH64oWEapXM4+lQyvV3cGS2hfPDpK30miM8gXVYAiKg+ZEoPlr/mDUDNMtZ4EcXW+5+cvm4DekybWJ9iMbDv0CcDGuYVhbBLxMoJ7nqsf/RelZXUAaR3gxyyqgbEtJKu9AHufPHjoN9B5hjiTIXuTi5qsTCs+3wTGZ5uezheuLGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0SPRMB0007.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(55016002)(122000001)(66946007)(8990500004)(54906003)(38070700005)(7696005)(316002)(52536014)(83380400001)(33656002)(66476007)(66556008)(110136005)(2906002)(186003)(66446008)(9686003)(64756008)(5660300002)(82960400001)(8676002)(508600001)(4326008)(53546011)(76116006)(6506007)(10290500003)(82950400001)(86362001)(71200400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?suldz346FlirE4eJv1ith8F8oLlZi9d8XNqpTbbc19R17n1zIjSRS2rMOwz8?=
 =?us-ascii?Q?It3rM4DbJoE3eNKqxfEbcXPCMluCpEn+fDutR5j9Wh72kccpDZOV4f9oJpO5?=
 =?us-ascii?Q?NbcIdfOmWecC+ov3xeXMB9hKKRC8k6LsWrUCENFlb9xT0RW/iZY+G74n3+f/?=
 =?us-ascii?Q?zA+PZb72fzMf2eJGwCxuCXVXrGAfTlrzEZtslSrMNH4ZQOp9pBtJvE7RrZw0?=
 =?us-ascii?Q?eBop77TcV4roozo7Pahrk+8ZGNHmQhPGR7MkKkibL/caE50hMTwLWEM+j563?=
 =?us-ascii?Q?i4hE7fCXDTQtUKmnJiHGzqTkK29TR8ENya7XeymSQo3yoxRG2R/xWvnquzZT?=
 =?us-ascii?Q?NTg2xPcXuldAlB9DA6x/V+Uo7lKBVaSuw7DVio424ptZPANlLv8lxW72bQsO?=
 =?us-ascii?Q?i/OsG54gizsZpriKVYlHesYVJfEwL0CRa8M4Q/8xtLQExe27c84G2SUI1Exo?=
 =?us-ascii?Q?g5lWDTLMbUTyBPqXouYhyL6cysMauQ6QM7NTH54LfYBjao0Nv2p04tThPCFi?=
 =?us-ascii?Q?jGq36Tg7g9Ty0yuo/RV1DdVL2guedgMIZrtGmpN1my6pYHGuwl1vYLZ+edRq?=
 =?us-ascii?Q?DJRnUb52H5RP5rN9faQXg6YsY2hsAhhZ6SYSSOom8Inf8BYmMrMFErQ2ntrE?=
 =?us-ascii?Q?Lekc7F0pMm3RJhJaRyX29O7MkdjDLrjNzdbCug+KZMXeP5dIKHOUz63fjAiq?=
 =?us-ascii?Q?unB3bIREWgpDq27PzRVHeZK4ip/ClKklk0U5xiRftITDStdUDZYpabGepCZE?=
 =?us-ascii?Q?cw231F6Hpz+MDfq30jhYNtC4J7NWKLppWJBLkzij5IuJ3w+oeCadGU65JH/f?=
 =?us-ascii?Q?jxYdNuk1SgXcjSmH40gKXAZGo9leIXG8W4Xxa5dmW1UnJTe9/Yyis9CgN4po?=
 =?us-ascii?Q?Xj2kfNlyGaSYEk+azo0ygy9kzZm4u1Zf+OlLosV6GkGdTKkx/xyL/e9XLUky?=
 =?us-ascii?Q?4LY+tTYCtnof4LVP+WlToDh9H7ZGRm+LUKAsycVohupob24Sbc2Y+aeI9M84?=
 =?us-ascii?Q?Jpp32ZN1wKo600ftLHK+ftotPAh7Onigt/DEURE/526OxnH9oKYFIxlvSmn8?=
 =?us-ascii?Q?Tcd2xuYguGcDAK8lB+6UzqRIATYTRSm0uAamLPWmspuPpxnfi5m5OFjUELnl?=
 =?us-ascii?Q?Nk4aTQKO6WtRO97j/1YAmOI8w+VBXgPs2W21KrisEs7zksDw4l+4Jq2KScU7?=
 =?us-ascii?Q?eQSjAjrv8V+24jJK4KKmcFR6Pv+7UVY9JfzrJ5j8pluOaR4gWGteXilQhdHJ?=
 =?us-ascii?Q?VBajOgnWDDfGayQdqXPppoM4yJhvUOJr6ZbQJ23ISzAps1ImhoykY82BGQNx?=
 =?us-ascii?Q?npI03/dnUuPo4jaTi7nHU7GrxYNye8vCI+AMnKWoGvTh7NF6Qaka41CI5yua?=
 =?us-ascii?Q?MJLj0OusAScQta3TnbUGc99EeoI3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0SPRMB0007.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fbaeac-d55a-4caa-662d-08d9697bdd20
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 16:58:16.0063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0hKUxJOyaQuyCSmzesRpzEQYhOKEFlIchRPnzyUUevHVOYczwAbfDMeZFJwqCh32Gmf7rhoO4BJTECdH50ENObmR+uAZknU7n/A+GFpGCKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR21MB1305
Received-SPF: pass client-ip=40.93.3.11; envelope-from=sunilmut@microsoft.com;
 helo=outbound.mail.eo.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Thursday, August 26, 2021 9:51 PM
> To: qemu-devel@nongnu.org
> Cc: peter.maydell@linaro.org; Sunil Muthuswamy <sunilmut@microsoft.com>; =
Kamil Rytarowski <kamil@netbsd.org>; Reinoud Zandijk
> <reinoud@netbsd.org>; Reinoud Zandijk <reinoud@NetBSD.org>; Michael S . T=
sirkin <mst@redhat.com>
> Subject: [EXTERNAL] [PULL 08/15] whpx nvmm: Drop useless migrate_del_bloc=
ker()
>=20
> There is nothing to delete after migrate_add_blocker() failed.  Trying
> anyway is safe, but useless.  Don't.
>=20
> Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
> Cc: Kamil Rytarowski <kamil@netbsd.org>
> Cc: Reinoud Zandijk <reinoud@netbsd.org>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20210720125408.387910-9-armbru@redhat.com>
> Reviewed-by: Reinoud Zandijk <reinoud@NetBSD.org>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  target/i386/nvmm/nvmm-all.c | 1 -
>  target/i386/whpx/whpx-all.c | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index dfa690d65d..7bb0d9e30e 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -929,7 +929,6 @@ nvmm_init_vcpu(CPUState *cpu)
>          (void)migrate_add_blocker(nvmm_migration_blocker, &local_error);
>          if (local_error) {
>              error_report_err(local_error);
> -            migrate_del_blocker(nvmm_migration_blocker);
>              error_free(nvmm_migration_blocker);
>              return -EINVAL;
>          }
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index f832f286ac..cc8c0b984b 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1349,7 +1349,6 @@ int whpx_init_vcpu(CPUState *cpu)
>          (void)migrate_add_blocker(whpx_migration_blocker, &local_error);
>          if (local_error) {
>              error_report_err(local_error);
> -            migrate_del_blocker(whpx_migration_blocker);
>              error_free(whpx_migration_blocker);
>              ret =3D -EINVAL;
>              goto error;
> --
> 2.31.1

Signed-off-by: Sunil Muthuswamy <sunilmut@microsoft.com>


