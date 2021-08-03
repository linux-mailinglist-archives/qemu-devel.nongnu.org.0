Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCABC3DEF1B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:30:16 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuUp-0006ab-Pp
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQy-0000S2-3q
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:16 -0400
Received: from mail-mw2nam10hn2244.outbound.protection.outlook.com
 ([52.100.157.244]:5600 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQw-0001fE-HL
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRhxcbMz5IS45kcV7mPyV8pXFqwe2PFiPurnaz+DUUEBXNGcOss4kxvzS65QZUxg1+rUMtXXqYjXVssIIUTrIbj4FGItMiqxwkjWqJaGkUO3eUCiy4pXpTFLDV58wNpmXb8uGgXxvuceAuhPTVy4Aeqf3GG8Ewv8DFr4xw54fUMxxCoPvRxpEvvqfNeGeRx8OYxCatWtZKnVlddrtOq/QKWgAcdxTaEL0erGNqBlksFF6++yHjLPyC7ELwAoDhm/TzkUOWeRBVRSj4id1aOQHlst04kWnUSw65j5E1jGLA8kDdXeezrVbGYNijPMiiK0JZ6flUT28bsMmRo+MBfnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXQQec2PBb1yfwZ+lAq6gUzfmpSXExObRhxBxJUaLWw=;
 b=oHMcFky9cQAHrmNDCCMLdOEZ1K93Ih09hd9C9u6MxyB5M/JyLzvdQnCLHCh2Jq7z48GXFvci4fnxtvfqujgFEh1+80W7u3VbWPLW3lXFP7DWUlAlYWai0JVzRpcnIccSBZgVuhvz31dz1vtTQB77BoKz9GJD7TAvdO9LQSp/XcJuZgxA8Z7AMFAlOT898S1EmCHwjf/yl6w4hpRDcaOnHOaX05LTqNdZi6X2qUCbYnyibq68cJjuGvJNuDkyo+w2SYDVr1fhdjMTE+fxLYvb6Pr/stVtMxh2nZPQOCJiM8DfOfZ9BxQh2Wy6fAd0BVi+wbi9abQYRX1lOU/CCJBFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXQQec2PBb1yfwZ+lAq6gUzfmpSXExObRhxBxJUaLWw=;
 b=hVMAud3FlnxYrbtfQdEAf510GEakoP3XYlpyBfoGcHdiY/+ohJMQNxTsyG4Jc8d0l3q5yR7LqdE/1w3Kl66629Qy1kOl3x26blny1OKLi9JL+XauT/7YMGUDtySh7KYhgDkmUT1qdBNZ03AcMU3aCA9O19XLpKZgNoIawCUvTOY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 13:26:12 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:26:12 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL for-6.1 5/6] qemu-ga/msi: fix w32 libgcc name
Date: Tue,  3 Aug 2021 08:24:51 -0500
Message-Id: <20210803132450.1093602-6-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803132450.1093602-1-michael.roth@amd.com>
References: <20210803132450.1093602-1-michael.roth@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::7) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 13:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6182651b-6e4e-40cf-7620-08d9568242f0
X-MS-TrafficTypeDiagnostic: CH2PR12MB4136:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4136AF5A033E4D5ED3C3166B95F09@CH2PR12MB4136.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uZYF0IJye0eLIZuOTBM9VDzjE0EaICFfGxYJpomrF/OQFP41bLJbjg/Wwdxg?=
 =?us-ascii?Q?P6qCd05o1/PrutgbXMyjoecS+ket3ebuBoSV4uFe/ASCMSS5iFeOOKoYf7os?=
 =?us-ascii?Q?5BDJODdmWYV6kFV2+/PL6jxWri9p0bwkIKOtd7AwYcgB6VPBPdPSEGUSjf41?=
 =?us-ascii?Q?+rj2dBDUqVCCMpP0TeD9HE5pku5SyDbCQ+m0RXRLCuvvRm08nOVFOJHuTS2P?=
 =?us-ascii?Q?ftMTzIFsIJnly12i00lHq01DCqIk+n+3VQoIze54o8cD/gOSCHuUZWjJX3xn?=
 =?us-ascii?Q?BkcQQloRE5tG8f2m59hvWNDHWpCUt21xK3BsKRw0ZwJfLu39MWQA2OYtJ3wA?=
 =?us-ascii?Q?v/U8j7ncVE9EXT6UF0+zX7upNxTDZrAzQJx2u897aBo1+xptLEW5YgVLLn/U?=
 =?us-ascii?Q?Cgqt5wljGpppoxE6Dn48klBMTUTSbAtc6Fmrcw16BvAPb2a49mmDhH7V7jFf?=
 =?us-ascii?Q?sMccEr9YWFJfjyKb1dLEjxfT6OasSkgzlsndjEEwfGTdTX6r4MMUe9XRKANs?=
 =?us-ascii?Q?1QIT16NE+BcvJ2UIYtHzTfNif2Po7tE1Qz4X5PjDzvnLFdHJiGOeMeLS4jdo?=
 =?us-ascii?Q?1TUMdFN3MRdMRtZR0SzHd9nP9LlD0MnksU2jrJ7nc2vki1HuTV5k4Oq3dVr7?=
 =?us-ascii?Q?PtxRPRd60XkrfhjFc3gZpbKTLMeCft10aonIFgx/vltxUvx6LTYQrDzofDSs?=
 =?us-ascii?Q?+7kOo3UwpKQ3Kkv9EvNVFpsKztSIMj9zqNo5YtDlewM0ymF08WPMI8hsMJqM?=
 =?us-ascii?Q?jHiKjXecE56kCX41Wl0Xn1thRkRRwQJogmd7ELdZc7EQFttJn+DGANlkFIKs?=
 =?us-ascii?Q?MGhNATnz0OBwdR/l+AMsInE793MIUzbR9a46wuo1+46zEoD7grmA6pNlYzI7?=
 =?us-ascii?Q?9jTY235eYNfBN1HTAx1THZ9tg0IGprCQ+lhpqWhgDWyS5sragrzdRaHc6sro?=
 =?us-ascii?Q?TbJuVtUdepZ4tzIYyhnq/944lC/o0O7SSHR1NgtbBidKMb2jm0ig4YlQPxnI?=
 =?us-ascii?Q?RypiEDoboxMv4OWSBoKSYlqnzhpVQlBnw0Ns5Oo4E1iqxT4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(316002)(2906002)(38100700002)(44832011)(83380400001)(8936002)(1076003)(36756003)(6486002)(6496006)(52116002)(4744005)(38350700002)(2616005)(956004)(478600001)(5660300002)(66476007)(186003)(66946007)(8676002)(66556008)(26005)(4326008)(6666004)(86362001)(6916009)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3AR+avy+6Cfz10kYae49V16fEDxrQX3ddOYSUz1jupC11++fBDSH8NvNmr7b?=
 =?us-ascii?Q?d8S5RgbGVB2P3CnpLwe+P/35oGckvtRKXnB1GZJ8kuf5gIOl9bVFNZPNQaQF?=
 =?us-ascii?Q?HAwsfUIo6xzKvRULf/RARa7jMGBWZ7SeifNhKIAxboYHFbMg+WmfvcM1dn7K?=
 =?us-ascii?Q?OCk0S2IsjS7y0vsA0RlzrX3dpuERvPJ3ntXohR4vH2W1LKb/7Sw7a0+e6rcQ?=
 =?us-ascii?Q?TKaHmhBJPpe4+9KmthdV4huEIQAZYeTSfRNhTPSGe1ZpEK24QV+qXLdCjbxF?=
 =?us-ascii?Q?oHBaMVotiUk/QqtJGIdHasvuyvyY47HlQpaJ7wrata2vkE8GixdTez/R/yzC?=
 =?us-ascii?Q?v3tqE1L4FtzAXQdSsCkuGcxM88baKthM7L8ToAp0VIpsoqezuLd7NSh0pxtJ?=
 =?us-ascii?Q?Kf/V0+/jWbn/u0f476R6wEhcWqdO6aHHjx3/XTxA8grp5NoDuaEh80A8O6gO?=
 =?us-ascii?Q?CMqyzEficxxj9AhXLRAsm8LRYSD5sTw2XD3uTSlcTWZDP4aFcR5H8D1wJB8M?=
 =?us-ascii?Q?zh0L6nFUdGS5KNKwjcpghALLH2MRnPGT8keQX7S55UxJrJKS1H6+CE7F1t6v?=
 =?us-ascii?Q?m/sPjfDb3mfwA4YCny/GEfRVcGQOy+OHH8emoV6jK34qs8TWtwYJhzVkeCc0?=
 =?us-ascii?Q?3MbIOhjFtWIgKHimgJSrHnLbGXVa02/7PQBMNLDeE57i4mI9bQvDL/nU3I6s?=
 =?us-ascii?Q?CjVFys6pdXojXMKuPItvjjcbQl8jXLmw3hiM8fiY0INYJORRYOKZ0Nyf3SF9?=
 =?us-ascii?Q?P/Tma/o35ngG5ispq5KRgbHCo2jbYv+yNsMY6ZEoazJycNU7uS6l8DdRj8UL?=
 =?us-ascii?Q?tDfDboowImYJHn0Ov4hSiLZqN0cTG5JenAqFmX51OJZG8On+CDjM54kk0eZd?=
 =?us-ascii?Q?GE8x37vEWyTcQ/bHS5thUeSh+1EA+shcVHGhkLrdu5wig4HgBGt+1mOIcUCo?=
 =?us-ascii?Q?Y5/JsTJDX7gDkry1TrnzCEFj0rbK2MOhn+OlX//WPrxFgOPUmgs4SJsPINtw?=
 =?us-ascii?Q?7hQoaWx9sO9AAuCuZMgMWARdMVhWUDqCSsMdKIdJZXay6JVFAu0NmqG998/Z?=
 =?us-ascii?Q?zztqeq1f19ZVtnZDya95NtmOz0pdgvmIKskA5bm4dz4F/WvxIJZ5Yl8ZlzYj?=
 =?us-ascii?Q?o84xYV+5dlUeXBPLdk9mn14+kdUE1MwT8HMOoVVRJWRtNajPza88D4WfhFcH?=
 =?us-ascii?Q?rLBO3yjYYRfxSmfWiTejVjzsN8MZwrENRcSMAcj+Xu/CIQQea4JgWEIU9372?=
 =?us-ascii?Q?aZAV55LUWO8W7tBuRq3nKx7fzwPD4cZO+ba2BlENRPjUq6z7FKxkq3b0MTir?=
 =?us-ascii?Q?U+cuYhgoRJpeBvvuQu/qLgPN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6182651b-6e4e-40cf-7620-08d9568242f0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:26:11.9632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmcgqaHiqPc4/GtT7HWIIEgQV1gZz7eOg7e8nkynroFwA2EIUmZUC9c8BWo1mg6d6FwAH1euzo/nYg0EyY3dvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136
Received-SPF: softfail client-ip=52.100.157.244;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Gerd Hoffmann <kraxel@redhat.com>

This is what I find on my Fedora 34 mingw install.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/installer/qemu-ga.wxs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 9cb4c3d733..ce7b25b5e1 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -31,7 +31,7 @@
   <?endif?>
 
   <?if $(var.Arch) = "32"?>
-    <?define ArchLib=libgcc_s_sjlj-1.dll?>
+    <?define ArchLib=libgcc_s_dw2-1.dll?>
     <?define GaProgramFilesFolder="ProgramFilesFolder" ?>
   <?endif?>
 
-- 
2.25.1


