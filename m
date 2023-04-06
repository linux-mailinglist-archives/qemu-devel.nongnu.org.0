Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150BD6D9BAB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkR9e-0005sJ-Nz; Thu, 06 Apr 2023 11:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pkR9b-0005qm-D0; Thu, 06 Apr 2023 11:03:59 -0400
Received: from mail-co1nam11on2061e.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::61e]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pkR9Y-00081g-Um; Thu, 06 Apr 2023 11:03:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uwp9TebUAikp0RjHDJ4+AhHwOxRizdcDUL8uyF+otGvUj49OhofTA64Kkwvff8O2fmTEx0fkcZ+6uKMnhMmvwwa1WMIezX4e9axTbA1ty+CRdR6cuzxb1tIMsn9eerShYEAqgEUS4GUJ+gvyY2s/Y1ZKYGkAaT704qyJevAyIxraEJC9+FYON3NzzUojTuBL0ccZQ1eiAol/XkeviRVyEctvoZEJhl8W1jR17Ttd9xifTL+j5K54kMvb6yXcgBKzQpLwiUT5P1D5pZ+huvWdmaiQm0axGkL06Porh3OXVEkmbHS4P+FBt4bHxqM7mfABVQGFL20S9IdWQxcf/QDuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbFWMOPbsPOkDILFfb0VYQoG1xPEGkDyZVocN9GQArg=;
 b=E8GOJEJDHOoEJh45oKjMbmd4qwH6xzlvr+iODUNHjO1RJjHsH5oPbYLRozet20UlZwEycXVVyY5M7pja9SvmKlQ5eMIT1/1qVzf2K/Y2qx7mezJexdWNw7ZJ73qQxAIpKVSVtaBxN0B4CmH/0o0ASJxVxcZhISyZeDk3RflmgRN6qZUCh/h67fcJYFUHNbPOdnAk/yz806uS5IJRI4zzrufLfW9/nYplzgUEO5yllpHQnViR/7hRdjZEcKKpYTjeVFEyymjaOCs4wXl3ylWJeReG76v77qlmxbT6vYxcZDDAGhVFjj5vogftYW2HKafniIyT1kdIQnq+/rt3U9EZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=tls.msk.ru smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbFWMOPbsPOkDILFfb0VYQoG1xPEGkDyZVocN9GQArg=;
 b=OH+6lMG26wB6MyuE8eIL6qjFdsUk8MtrqXMmPMHm2PkFQvGso36QjFjH0uNZQdZ+pwiKkI92ZvMF2Q93uxaIfjPQ81y1GXVXVXv/JPo+BPjKok1S0uEGz2Dij3+K98DOAEUxogy7xgKrWWlD1ca73Sfre64mWSlQ6OFGWR4yKZ4=
Received: from DM6PR06CA0037.namprd06.prod.outlook.com (2603:10b6:5:54::14) by
 SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 15:03:52 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::80) by DM6PR06CA0037.outlook.office365.com
 (2603:10b6:5:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37 via Frontend
 Transport; Thu, 6 Apr 2023 15:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.31 via Frontend Transport; Thu, 6 Apr 2023 15:03:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 6 Apr
 2023 10:03:50 -0500
Date: Thu, 6 Apr 2023 10:01:26 -0500
From: Michael Roth <michael.roth@amd.com>
To: Michael Tokarev <mjt@tls.msk.ru>
CC: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Subject: Re: QEMU stable 7.2.1
Message-ID: <20230406150126.tan4npfartb4oyhm@amd.com>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
 <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
 <20230405185720.2yxd52njk3tcsauk@amd.com>
 <20230405210658.yg2i6grklgqp73rr@amd.com>
 <9d2a753d-0b50-8fa4-2a71-590fd5ffd22f@msgid.tls.msk.ru>
 <734b7b91-0305-1358-15f4-f63d7d272e7f@redhat.com>
 <199575b7-b4ce-b502-a1dd-d5f1174c0b87@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <199575b7-b4ce-b502-a1dd-d5f1174c0b87@msgid.tls.msk.ru>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT067:EE_|SA3PR12MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 77db0a87-4781-494e-62cf-08db36b021a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECmt4wVqKO9WN3OcJW+IPLkj7PQXaBpgrGQRcvZ8C09j6nf+nzpj9EOBiVnknGau8EV1s1dfKb8f5dLZPiPDj9+SdCOlq/ufgZtOn1eyCB7c+oTa1HN0PYlIDynBC/nAqOciv2J5meFxlxxPrI0e7KVoPrLnU7nWgkbIWudCxOX8Sbc8nnB2P3tGhtroGP+WJW+fGLbB79vzDu0X3gq+9aG8gKJ0mY6hSALEh8GDhdk3l88TgRzNNkqsGE6NXj3z7VxEkoJKB+oc2fAXcPLLDmUOrGhKOeFNy0as/lEePuo5Z5o6M7ALELvruxc/tjl7VgR2masQPG8WWaqZsRPTptfWULBXz9sqg7TqzIYPVeO2mAt8O4FpyuPGVGsFKVw5V/0pvoYiFaR1cvraAtrzSgGXLyqIrQw5cxP0zIT5auf61GYzUjLSv4cgemxAZzwqesOJ35octnP4sYjK2oc1eiqQxaT++e1mBpfIOvDNrKpRN2hjYdVoXlR/UtQjwnrx+L+EhfStsKMpLsZ8UDpy2NSeLnc4NVcTDRubCkvin9hdD8zk7HqbmSiIZqmydrqmyoacW9hO/+N+jTWpoeJ4fsu2ME6aJUssIDs9Kp0RYCtrSfMz73v7c6aFpUhxWirEJRT1wr9SxNuVBWeNBtQZi3QtgMkJuBCK0C30kjz2Uqv82aVybHeoz+SNPIvCrXIwJuLZ6C7GJ0XLqAmRd0xMdib/1Ix0R9edc9VnlQaajmJJsjxmyynopyMjFFQ0OKOmdgT8GCkKvhS7EQa7k+jRvg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(81166007)(356005)(5660300002)(44832011)(82310400005)(47076005)(2616005)(26005)(336012)(426003)(66574015)(83380400001)(54906003)(316002)(1076003)(86362001)(4326008)(16526019)(36756003)(966005)(40480700001)(186003)(478600001)(6666004)(36860700001)(70206006)(7116003)(40460700003)(6916009)(8936002)(8676002)(41300700001)(70586007)(82740400003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 15:03:50.8579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77db0a87-4781-494e-62cf-08db36b021a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781
Received-SPF: softfail client-ip=2a01:111:f400:7eab::61e;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

On Thu, Apr 06, 2023 at 09:54:55AM +0300, Michael Tokarev wrote:
> 06.04.2023 09:48, Thomas Huth пишет:
> ..>> There's one minor caveat still, though: it is missing in the
> > > "Full list of releases" for whatever reason.  Dunno how that
> > > happened, maybe that page hasn't been (re)generated yet.
> > 
> > FWIW, I can see it on https://download.qemu.org/ now.
> 
> I still can't, no matter how many times I hit browser "Reload"
> button, or try another browser or even another computer.
> 
> It's available as a direct link but not in the listing page.

Yah... I'm noticing the same issue with 8.0.0-rc3 not showing up under
"Full list of releases" either. 8.0.0-rc2 shows up fine however, and I'm
not aware of any changes between -rc2 and -rc3 that would affect how
these pages are generated.

The associated gitlab build jobs for the latest qemu-web.git update look
okay to me too:

  https://gitlab.com/qemu-project/qemu-web/-/pipelines/830133154/builds

I'm not even sure this page is actually generated by those jobs though,
it just seems like a direct link to whatever download.qemu.org statically
points to. So maybe there something else server-side that might be going
wrong?

I suppose it could just be some aggressive caching somewhere
server-side. I've never actually checked the "Full list of releases"
right after uploading, so it's possible it takes ~days to refresh and
we just happen to be noticing that now.

-Mike


> 
> /mjt
> 

