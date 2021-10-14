Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C342E4C8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:34:01 +0200 (CEST)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbAEb-0003Kv-4n
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mbACM-0000vs-NX; Thu, 14 Oct 2021 19:31:42 -0400
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com
 ([40.107.93.72]:60072 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mbACJ-0006Os-Fm; Thu, 14 Oct 2021 19:31:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8GDipIlXsnfrkvBHTr63vFHV/vDKKilvK3OZUFDCb4XQi07CAhnZTjwOheO+JbB3/I2M0XWgfIHG79+NgjJ/3gD4NpHZS+CQRrD1fk179yBMDMKy0C4Q4D0LhTmw/RZvCRLKFJf5b/g2HsUaP9UmzlE3HdBTy4OxRIIqvszIWzSWITaZruxfQ5TZn/NmNcD4+22amG+ATqzxcQvdDQ/zaG//DULpL+Jf/9/xePvyT2K1xvM+9hoUOLWCQ49zDXhc3se8k2fDr7RHiL/mjOTdtBQBNy9nFVNh0wkrjX6v1CuDmYXTha8cQjOWQKYETr0bkfc/mBlFxevfB/eox5Ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyZkJAPepqJiG5qitlGM/okWd+JZ8sL67v0Lmav47PU=;
 b=QC+sGLc5D+QimzNRLWezdZKov5iTTSO9jCJ3eegJMF3LgAE4/N0ZgYkV94iAVWUKHIFa9bz7a7JXtt9nI04NaxvwXuB2heaPB59Aua1DvkYGacv3MZEjQcYLDalweD08SNfzPwKTcy6CfcUJJT222QRFne7PrRGJXjDZZzNrTD6mWTlyE60lCDxNxIEhOOe5btOqgBaa5aoKt4OJFllgCXXRHERu/mazxEku0tJJXMpeevKyuAYvvAQ8Ljp8AVjZV0CSwW14AmZLoTRJShxb3PHggHqDTrW0PpKWIJm1LtVOcfI1DHCwz5SG2tAZaIIlj1s5o1mq0keXLw66RZIxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyZkJAPepqJiG5qitlGM/okWd+JZ8sL67v0Lmav47PU=;
 b=Qmlp5QK5XeF47O4zHQqaJ2nwcRjhWO1wG0nStz8fVFVvkw2IMPZ8JGJzI2DGUBTOMPOTxhqYwDaPGO21bWbKo5IaI0oBOlfaMaSrcCWLX5Qh5HpRggKVF63E/vCOmYGMBp/3H+dI3eeWfoCQK390kAgZ7pGnsk59uk4Pz+/avnM=
Received: from MW4PR03CA0175.namprd03.prod.outlook.com (2603:10b6:303:8d::30)
 by DM6PR12MB2748.namprd12.prod.outlook.com (2603:10b6:5:43::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 23:31:35 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::7d) by MW4PR03CA0175.outlook.office365.com
 (2603:10b6:303:8d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 23:31:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 23:31:34 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 18:31:33 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210805192545.38279-1-jrtc27@jrtc27.com>
References: <20210805191430.37409-1-jrtc27@jrtc27.com>
 <20210805192545.38279-1-jrtc27@jrtc27.com>
Subject: Re: [PATCH v2] Partially revert "build: -no-pie is no functional
 linker flag"
From: Michael Roth <michael.roth@amd.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 <qemu-stable@nongnu.org>, Christian Ehrhardt
 <christian.ehrhardt@canonical.com>
To: Jessica Clarke <jrtc27@jrtc27.com>, <qemu-devel@nongnu.org>
Date: Thu, 14 Oct 2021 18:30:43 -0500
Message-ID: <163425424356.2158.16851994446465453609@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da639280-c297-489c-0873-08d98f6ac2ff
X-MS-TrafficTypeDiagnostic: DM6PR12MB2748:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27483105B3AEEA1BB6D5CE2895B89@DM6PR12MB2748.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ujb1RbUHtWrbRjF41HMwWD2Lkojwmv7As1Uwk4s1RNocQoDwImwBwX5JWwL50SAMp7GkDykCaAo3L0Grl5d9BSRvU55hmerVdrwKxaIdkMm9VPZ1YngyDEMHfaLiGeVox+5qJ467Ps96yRaZWkTDYmZSDhda88+YtV4nQ2TOPxZc6/WEZBpwfMQn7I8wlKwwELYO/9mBwJpjJ8CL/CAnJBM5ytADBuYCkA3aDbZUazTUps62vXXyLbDo263Ug3GOpl7/8fsK59WDk2A92Ct5tKDsnx8JpceNlicTKVRvYa85//pdaKxuQkhn49NQrq7tCy1TbPIjDwWMdUqMp6wRELWJ5Fow8E0Wg7dSNJpR73P6UImEdpKZROmdJegxetoayiUwbqDDKrZsMmCMTGDe7zXwCDiPSQH1qlBlzwIdQxnnQjl80mcZBsdKDpNTS3uLjXDwpe0Lj+4eTFjhckuGj9JCncpvbB6GHXFy921MnihsmKFWxTwOS5/r4zc4WjlgFWxyop7BauDActkoxOcsdN5ZPjr8HQ8IebkE2Wo7CGp4EZy/RtXpRQNPM3CfJeLaG5IREv+Evnn5Qxq0ebzMI80nInqJWyJmOqn1Nuq4k43suCiks3qYowOnGAaCEB8p40JFlqrKw+PmhFoo7qSlaI6v5yHV0z2sCkCs0FIZ45NMWrcQYPHcaea2YZmwAQN4xR01+8OV74URBWZn4X3pJFRDU3HsJ+Anm1VU3D9gF2M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(316002)(2906002)(186003)(5660300002)(508600001)(82310400003)(81166007)(336012)(26005)(356005)(6666004)(36756003)(54906003)(36860700001)(86362001)(16526019)(4326008)(110136005)(8936002)(8676002)(83380400001)(2616005)(47076005)(44832011)(426003)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 23:31:34.8905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da639280-c297-489c-0873-08d98f6ac2ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2748
Received-SPF: softfail client-ip=40.107.93.72;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Quoting Jessica Clarke (2021-08-05 14:25:45)
> This partially reverts commit bbd2d5a8120771ec59b86a80a1f51884e0a26e53.
>=20
> This commit was misguided and broke using --disable-pie on any distro
> that enables PIE by default in their compiler driver, including Debian
> and its derivatives. Whilst -no-pie is not a linker flag, it is a
> compiler driver flag that ensures -pie is not automatically passed by it
> to the linker. Without it, all compile_prog checks will fail as any code
> built with the explicit -fno-pie will fail to link with the implicit
> default -pie due to trying to use position-dependent relocations. The
> only bug that needed fixing was LDFLAGS_NOPIE being used as a flag for
> the linker itself in pc-bios/optionrom/Makefile.
>=20
> Note this does not reinstate exporting LDFLAGS_NOPIE, as it is unused,
> since the only previous use was the one that should not have existed. I
> have also updated the comment for the -fno-pie and -no-pie checks to
> reflect what they're actually needed for.
>=20
> Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
> Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

Ping. --disable-pie builds are broken on Ubuntu 20.04 without this regressi=
on
fix. Looking to include it for v6.0.1/v6.1.1.

> ---
> Changes in v2:
>   * Actually include the comment change; didn't add the hunk when
>     amending...
>=20
>  configure | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/configure b/configure
> index 9a79a004d7..8aecd277ed 100755
> --- a/configure
> +++ b/configure
> @@ -2246,9 +2246,11 @@ static THREAD int tls_var;
>  int main(void) { return tls_var; }
>  EOF
> =20
> -# Check we support --no-pie first; we will need this for building ROMs.
> +# Check we support -fno-pie and -no-pie first; we will need the former f=
or
> +# building ROMs, and both for everything if --disable-pie is passed.
>  if compile_prog "-Werror -fno-pie" "-no-pie"; then
>    CFLAGS_NOPIE=3D"-fno-pie"
> +  LDFLAGS_NOPIE=3D"-no-pie"
>  fi
> =20
>  if test "$static" =3D "yes"; then
> @@ -2264,6 +2266,7 @@ if test "$static" =3D "yes"; then
>    fi
>  elif test "$pie" =3D "no"; then
>    CONFIGURE_CFLAGS=3D"$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
> +  CONFIGURE_LDFLAGS=3D"$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
>  elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
>    CONFIGURE_CFLAGS=3D"-fPIE -DPIE $CONFIGURE_CFLAGS"
>    CONFIGURE_LDFLAGS=3D"-pie $CONFIGURE_LDFLAGS"
> --=20
> 2.17.1
>=20
>

