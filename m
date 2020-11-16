Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0732B510E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:27:57 +0100 (CET)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekAO-0001QQ-KR
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kejZV-00040t-H7
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:49:49 -0500
Received: from mail-dm6nam08on2064.outbound.protection.outlook.com
 ([40.107.102.64]:44128 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kejZT-0003cb-9J
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:49:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSOoHZYEQt7rSjvh+y1UKPb0pFFz5alAkW99LX7zEbsTswOWzQIl62YcJkLYz5CUGtpdmLXsBJagB1IXRRxaCp65TK25mX5k8x9ethDU5WIL4BO5dEZPu+kKDCicowWAtlpnVahNn751uhCyq/HufQJj5V2rlvqS1Tva75aFwLyWmCORCSnbrmOHs/0T6iMFVd6KHNeXG9guO9zNuW5GoYjBieejUqj4esjXbHI1AiFGcWSzvgg5ipVZPVFQqYwRq3MsSjjPEv3JHEUSxOTnBqmr99tBuwAijS2MrI4CG5HmEj2hGzwlV1tHCzrZvsGZw5P/1VCqpQ36yuCyPsIZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOaakQFQt0d0LxUoW9Kngs89oPksHsauj8Gp5tZmEUI=;
 b=Gh8O8Kmdf3dkPEfYtWz+vgfQLFw+B2zwNPet/UppV4At9ZYbW5snE94Wr+Uu+w+mTQwLxXm7Jg4iRBnGYD8zwd4B977scSLvkGI0Afq75B4Z5AsVL9PjRBuFVvfFvYYE5rYwSSx12Firw77XLGE7hS//evGplSRIu3lfdydjGYOH7OOB8PHuDdg+OPHy4eCxT6J5QckQx7/jvODWyl1cq1LZcPRs6yreb55gZ7kELSeL0jM1kEcHEDe4x+u62q6pXrbpS2fyBA7hsNKcVMcYYkpOdfPnLA/eYg1RNND0wBILm0rKVWAzOjwKkKtKjxMPeyjXt/+KEonr9fUCQhBXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOaakQFQt0d0LxUoW9Kngs89oPksHsauj8Gp5tZmEUI=;
 b=LMP2I6jyLON3lKJgMFvHoZUIqdqwvHRp1xi55zxSwQFVEz4GrjagTJ7WMOOvFZJimXnJDF/4mZnijDOOumsDj0+pUks2wy+pgFxD5xi2yi3U4aWQn628sUXiTILkemvwYdh/+Y3DTbGiBEjA6iPz4tDeK0X54NGJU3ly6ydslwI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Mon, 16 Nov
 2020 18:49:10 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec%3]) with mapi id 15.20.3541.025; Mon, 16 Nov 2020
 18:49:10 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: pbonzini@redhat.com
Subject: [PATCH 01/11] memattrs: add debug attribute
Date: Mon, 16 Nov 2020 18:48:59 +0000
Message-Id: <2ba88b512ec667eff66b2ece2177330a28e657c0.1605316268.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605316268.git.ashish.kalra@amd.com>
References: <cover.1605316268.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM6PR06CA0075.namprd06.prod.outlook.com
 (2603:10b6:5:336::8) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 DM6PR06CA0075.namprd06.prod.outlook.com (2603:10b6:5:336::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 18:49:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca3a6828-35e9-4d48-9a69-08d88a604e11
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB278246CC6F2675F8373789BB8EE30@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XhT5TLSCx5jyqYPkOlElw939/Nr3EwiY0afv/PCFoeQ/frAlXNHqgyHHnplVXPvdNeHnlOv4Ol5VN7aSM+7/ri8HQqGKUACNcfmpPkYiF5IM6DKge0vr3Ee7VtrSoeWbWGVJ7NsHyIrjQhiqE9r7Vt2MNxj+DFopVpKUbCMoa35CbsGOoS8HGdEorXt8DcV9bzYDtdIoB76vyjgeo4E+ZcZqQaeJSc0FK7LZtaC6CYMz7AF/dtlpWrTVm1scae2Ssw3xgOkOUMKUW54pdFrbnpTDo1/0gv3GgMoFFacKJzFsHFIEiqw64tAlnZjNfvdM894KYf3CUrrahKuZCDPYzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(7416002)(6666004)(186003)(83380400001)(478600001)(4326008)(5660300002)(8936002)(2616005)(66556008)(8676002)(66476007)(6916009)(16526019)(66946007)(86362001)(316002)(7696005)(36756003)(52116002)(2906002)(26005)(6486002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6h5BPgt4Y51bSqz+F2p4Sarq96fJHGaPDK2TJLTGJD+FE72QqoDNr/r+Pb89RyaREBFlEcekFNl6MzQnBLwf2mQVGnM6hCHNXNFvabVCGGAkCRkBIxP2+m2WBbFFCi8K4/75QE44Tk1foPoXOgZrcFI2PzZyS1wYK9BtZqu2XB8KSVZhVDmfoMhx0Y/6Aw7pnCtJMK0DYrA3F4mTcSMfglp3HE1z6g6uJCju6O3Wxr66cMHeUVwLItSBv/hGJDQRNGRMTvCkZLrtSBpj33G6vztlDYQ8M96XcyKUSy2O8RJeIF4ttf+02UajTy+VH7NhIhUo+DkPUh78HO4d/MXtP2BpXfdK57BSrAwhuHrDxvJrEKaVbdvzB8rh1U3TUErbnH0wQmM4zk8UElqq8C6jQ8z8Tot0BmPHzd64Lryh7jRGQW+HVibu19U1+XrYnOEZ/8f4PKnTMsKVsckpN9B/ii6wkNnLmuNLUdnxBNUzn5gwbLiEy6rSvm2q3S/NWYyabuG7O441rQyBowBCgSA9W4VLfZc5QyTo+OtdqFdZHBzGJYsqQvV3lqX7ngcY7A43HETC1gilS3fEpwwSUvWGmYSuE3tcsWGSbeEsPFzYVW2CIQspfmgyQ2D4V/cCWk3fcsBni3TL8aNCawBxi2EeCd2n52ht1gZ1/DPjDLxr/fy7Yop35OlCTWT+yy+YrBIDNUy6ZoJ+y/UWnNZCBGpHdL2Hz83qLt0MTgY/r03cCesblObMIz7Es3oALp/SgYUky8Bw10KrSn2wVigqnO4RC9bFpICuYgypLJ/JkhYrArJYe4jeXHAoqCqz49aLUXMJXlGDCWkLG4jYdn6JO8DQ1nF650BIYMQfr4BAkGL/mYxsiXo/T2GSZM2Oh8cojbSfD6RePlZxEkh1Xm3/pkj4yg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3a6828-35e9-4d48-9a69-08d88a604e11
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 18:49:10.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EApdeOuPwkIInSgH1wAyMY6oN4UKHBH/X6q4MQ6az9jPaxzBFtnCImbUc6uisQKrb9z1JoT3guUwf/DB+/bnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
Received-SPF: none client-ip=40.107.102.64; envelope-from=Ashish.Kalra@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:49:45
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 ssg.sos.patches@amd.com, armbru@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

From: Brijesh Singh <brijesh.singh@amd.com>

Extend the MemTxAttrs to include a 'debug' flag. The flag can be used as
general indicator that operation was triggered by the debugger.

A subsequent patch will set the debug=1 when issuing a memory access
from the gdbstub or HMP commands. This is a prerequisite to support
debugging an encrypted guest. When a request with debug=1 is seen, the
encryption APIs will be used to access the guest memory.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/exec/memattrs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55..c8b56389d6 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -49,6 +49,8 @@ typedef struct MemTxAttrs {
     unsigned int target_tlb_bit0 : 1;
     unsigned int target_tlb_bit1 : 1;
     unsigned int target_tlb_bit2 : 1;
+    /* Memory access request from the debugger */
+    unsigned int debug:1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.17.1


