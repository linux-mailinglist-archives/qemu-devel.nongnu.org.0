Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54F433E5B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 20:25:39 +0200 (CEST)
Received: from localhost ([::1]:37634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mctnu-0005kT-Iy
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 14:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mctlU-0004JH-Ax; Tue, 19 Oct 2021 14:23:08 -0400
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com
 ([40.107.223.41]:57664 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mctlR-0007Vn-UX; Tue, 19 Oct 2021 14:23:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja+bhS3WE7xwi5hCWlzj316Yqs2N3Eh0HH/aibd7N3oOMWy0p93PGTVLCWamb3q2Lov+Sgd8HutqGDgDmw4b+3WU4ScuFYA4wVYiNweQS/hkDZqnjZska//O7Ny2dm7f7UzINRP5mHsU0LGPz00kb3IidgvVVRAVZHd7EJXyhg/YOD81rwdre7cv8N5oV5tFX0MYwKSD4xluSSS9iG5XvNBsbrhy7PAH6MIbJLlJIPB30W8Fi0xqm/Vvre/lMz+FKfI/zbZp1ZcGt1MAk7E8qNzdfvkRWb3rQe6NhmBlsLfvSkhx1ddBzQbDBf1aBmCCmnJ1j0E64Lkre9D74jBeig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN8++mTI/jQbywPTdHTF0IQitDSjJdL5rFtNXXrAaYY=;
 b=lXtWhkjzoVe7DbVy7yVyR2GHGXTC+1d6uPRqKX8hYZNYH7YruXn0q5i97xQBdrww4EhonwQOlhpCBtsvQ6l2/10AZnsd0NgqrGr8ATXrtH68m0nyi+6jjuxPcyV28TdIlos57f40QGIYwg5ALiPzvKYdpjEGIvKCifFJyrol/5ZapFrVXvqVZeb2DlR9FbmS2SLOGHThGk36LJMa6CPV6AcGtmycAfLYKzVWDHH7oSNyqwHBVDLnyi7yR6bEhujLtdlD/syYqkLpy5ugcQbgYZX83rciRe0DtEJ75yReUC8yPAakF4Gr3HR7tGGf0v5R8qzIKyYQk7XJbGCOXzfDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN8++mTI/jQbywPTdHTF0IQitDSjJdL5rFtNXXrAaYY=;
 b=XWxJPk6ho9PQP3+f06bOkOWDII3eBlAqkAcZe2uCeTgT4eQkYS3jv7f2X59fbZofBwsZoafuknND9UUXiMyVMShE0fi5Pm/VQ1baFtBKQujxhGyYwSwph9B74qYpdE2fLUbPxoTtWDxP/Qj4hPsBOzr7bARH+v6ihjFd+zLh2YI=
Received: from DM5PR19CA0033.namprd19.prod.outlook.com (2603:10b6:3:9a::19) by
 BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 18:23:01 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::93) by DM5PR19CA0033.outlook.office365.com
 (2603:10b6:3:9a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 18:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 18:23:00 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 13:22:56 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <alpine.DEB.2.22.394.2110192010430.172612@anisinha-lenovo>
References: <20211019140944.152419-1-michael.roth@amd.com>
 <alpine.DEB.2.22.394.2110192010430.172612@anisinha-lenovo>
Subject: Re: [PATCH 00/64] Patch Round-up for stable 6.0.1,
 freeze on 2021-10-26
From: Michael Roth <michael.roth@amd.com>
CC: <imammedo@redhat.com>, <mst@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-stable@nongnu.org>
To: Ani Sinha <ani@anisinha.ca>
Date: Tue, 19 Oct 2021 13:22:41 -0500
Message-ID: <163466776130.169626.15936594200289260492@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4a75bb4-32a7-4ee3-7996-08d9932d7bdb
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:
X-Microsoft-Antispam-PRVS: <BL1PR12MB511271018BF8A56EB776A11795BD9@BL1PR12MB5112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZlsfJfdsrTznbRC5SGWSU9dBI7F0M4YQ1Mqnm26h0Vnlhsriu8hGbv3YKpET104DOY6PE+wM+QzgEvpYfPPooObtIiGsD31qwt9p/3ACMSEi++ud9liU58aOcp4xXBPAGrWhqInXkLKrCnWuwAblYK51cYFIHA1aF0Ue4OfUKGr+9PdLD+XVAy/CSZhzE7y/FU+3eAAAdiEqbdOFi0P0oS2hZ3nNpdZAjrDVg14eVdwKO9D3OSuSAyJtSuAwfct/DAQKtbKurYjF/LAkKuhrArYdBjXgJ2zP0tjexGAxjOhpwQSK2JN4YqBXb5F9LRnmA86TpoJpw7R93E9EwNGD3O2x3rIqkq42GtkwOYt77g1zZHXZPzNRMIzfZRaB8iE+NTLK8MI8QS4x9VeHI6eKrwBI4hwn3Rzva0KxC7D6zm0k1h5XfrrfIhpy2Vl9JOXbgZ21DZ6EgqT5fbB0MhraPXPVXoSfCEQVN/3Etierme6apvMOgQTuxj2WCLtKDIh5LJFhAUksseWuMLJ0qoIeYI8rf/xwh19us+ZZGDdn71M2PNzsMV7fibLBhVzRUOADLEmYa6VB6lZ354L5exlbAZM1aiOXsgCOxJzLxV6nPQJDh58Y+39Tt5AKPIQ5EHHzQc/PuvnusQWdWbUuIsG1cu3/Scpja76tTq2pcr7RG3XsvZL8vgfew53S/g7GX/LPJh/1sOMzl3Ig12sYUsLauAsJknFaADxs6yf69jMZ6KotRv4LGSC0Me5vRmMs6CVqg0Kav2tQe3gMeKykIFQSQyFS7ZiUrDgFvMZcKwOLCpPV1kwgslbeLDznMr8BflcgQB3KINRzSILV9iYpsCxvl/vTvCOx1jmRjCK7yvQVHo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70586007)(26005)(966005)(336012)(36756003)(81166007)(16526019)(6666004)(47076005)(2616005)(44832011)(316002)(4326008)(426003)(6916009)(5660300002)(54906003)(36860700001)(186003)(356005)(70206006)(8936002)(508600001)(4001150100001)(2906002)(86362001)(82310400003)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 18:23:00.9698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a75bb4-32a7-4ee3-7996-08d9932d7bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112
Received-SPF: softfail client-ip=40.107.223.41;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

Quoting Ani Sinha (2021-10-19 09:43:52)
>=20
>=20
> On Tue, 19 Oct 2021, Michael Roth wrote:
>=20
> > Hi everyone,
> >
> > The following new patches are queued for QEMU stable v6.0.1:
> >
> >   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.0-staging/
> >
> > Patch freeze is 2021-10-26, and the release is planned for 2021-10-28:
> >
> >   https://wiki.qemu.org/Planning/6.0
> >
> > Please respond here or CC qemu-stable@nongnu.org on any additional patc=
hes
> > you think should (or shouldn't) be included in the release.
>=20
> I believe we should also include this patch:
> https://lore.kernel.org/qemu-devel/20210916132838.3469580-2-ani@anisinha.=
ca/T/
>=20
> It is also CC'd to qemu-stable@ but the patch itself was not tagged so (my
> apologies for that).

It looks like this patch is a fix for:

  commit caf108bc587908f7608729f39639dccdfa53010b
  Author: Julia Suvorova <jusual@redhat.com>
  Date:   Tue Jul 13 02:42:00 2021 +0200
 =20
      hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35

which is in 6.1.0, but not 6.0.0, so it didn't seem like it was needed
for 6.0.1. Let me know if that's incorrect.

Will definitely pull it in for 6.1.1 though.

