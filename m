Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D899F369B26
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:11:17 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la28y-00022C-Tf
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la271-0001Au-Fk
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:09:16 -0400
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com
 ([40.107.92.67]:12705 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la26z-0005D7-Pd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:09:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgdZ3mGyUGgj7C+2PHHeCGb+aaBecnkwzPhUbxNhNGoCgSXoJyjaInJdQICQcZW6sWOaQNNWCi/s+poEtvQySUT9evTECrhvdxJzGIZIt0m1CkiAYjms1IFQfmwmocLPKtfiJiwml4d0Pyfr226taiUZo7oqeF7OxZqHlcxBZyCOPnJMYjeVmL4rHXX6rnVekmJqJn69bz07sue/vvh1tiFzKeX2McLf9NQmzB8ndugG6t4WHYVxd0qdjhgsv9rXKK+3sgE4D6P/FC+dLK8VoA+IrjE873m0Zw/IidQ3kqtdkyZOzpywddDmnLVbVIhli16uO4m96f0hxMvhBOOOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIIR5th1EQyftS+iRKtrY7sIhIjZ+jCoA9CHAtg0hOo=;
 b=ekR5p2deEHoVGkCfB04k0gQH6uj+3gIslS1RgN+qbTUQ3L13LgOZgFgKexJvkcez3RYMdNPyRcnXw4akjbqtg6uvER9dEzZ66Dx5NFY0UU/0KetQuF30BmY9qMpGyLg14f+PR39Y0P8wclYTC82QXhUnCwTdlaJ3zbv3sMKnk1CgfWKEwAw7rsNu03RslaCKHvkLDp+p/lqvVvhteqZ6Dm6V8GcEZfs2PAnSR1CnS7GBD1WTm3FlSsyiOXpm6wSnlknmiFdGx6/7u8l3Nw6EtkC9Zh88ZZkGVaeT7/8G1SgjzrdV1uaCEePVFUqupk10KbnsdQ9xZ+r0eU8Gs1f4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIIR5th1EQyftS+iRKtrY7sIhIjZ+jCoA9CHAtg0hOo=;
 b=pMW0VfRK8NMnUL+IURviPzJxCoMtV/yz4Das1kjbzsB1IuPhcXzxaJZtOzI6WUClt1Xt8FgJvddFOxQz4dcaZoZ3GiTUOOiu3MWvzrIyKtsrVS5kNcUFW4Zyj9fTSokSyCo/vMOjXxrocxs07d5b7HI7Y7AGikuj9HBcx9be6f8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB4678.namprd12.prod.outlook.com (2603:10b6:4:a9::39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.18; Fri, 23 Apr 2021 20:08:46 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4065.023; Fri, 23 Apr
 2021 20:08:46 +0000
From: Tom Lendacky <thomas.lendacky@amd.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] docs/interop/firmware.json: Add SEV-ES support
Date: Fri, 23 Apr 2021 15:08:19 -0500
Message-Id: <b941a7ee105dfeb67607cf2d24dafcb82658b212.1619208498.git.thomas.lendacky@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
References: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA0PR11CA0179.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::34) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tlendack-t1.amd.com (165.204.77.1) by
 SA0PR11CA0179.namprd11.prod.outlook.com (2603:10b6:806:1bb::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 20:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 488f6f17-88a2-4ae2-3206-08d9069399f1
X-MS-TrafficTypeDiagnostic: DM5PR12MB4678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB467868D8EF88A94CEDE19844EC459@DM5PR12MB4678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QR4Om4NUUSkAv4xL+25bcz2t/cOP14RO6sfygKiJOU5AznHMBPKjYstCwXNwLvU39vPIdd+C1KJhxn+YmMqHJfsbt4PIDqPA4ZDz/x9K90dpW+6i8p3MEXghy2UeXZ5klHK94gAZPDRy4ibODJqzfidEsOr3uBrWI0jHwGGNd0JP1XNPoCwuDAZgBZO5f29iqCIF65B7wVDim08KkzfWOj+HouSCXY2woh4Cnk4HeO7Uo6yBrFw/PUyPGrtIRug3WLduDySdxLGelcpTesbDm74PmDzPTKGg/kiMcpUrhhBaaz2JjEBHlUdXhqRh80ioDEqOC4t4y86hH9T8tZTWGuFrF3MUCVdrgh6uN6dQN834I/7H+5lCYVY+NU33A2XFUqUUHG5WBaFKzDVvbXmAzHZw2Zxkse/f0FLx04PzaiGtikVG6nhdub0phHW9Y8dQGmGGXIHVKsc01GybgdeWvpuAUDMCH4mw/SlyywC5JGut+0lP48Et3O7pWwbvQE0zYHuO1oREYABT7pq5LufrglcyhXmfq004hlzjqvUqAZtVbbTdYIfdK0fwszk9LMcYyI1XlUX68s9HMZCTv83cqp99xZfLkooFVrMZTBSqOvHcvdLiDHMEKxpY4lzTIrbDFqv/3zM33Z7q0YyFjNI8tRbsvaGK4pYfxblZy6FNIQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(6486002)(8676002)(36756003)(7696005)(66476007)(66946007)(26005)(956004)(478600001)(316002)(83380400001)(6916009)(4326008)(186003)(66556008)(16526019)(86362001)(2906002)(54906003)(2616005)(38350700002)(5660300002)(6666004)(8936002)(38100700002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?N5USIEV9mib1AIEEbHczkF3Ygmkxwl/MfWjXF8PVODWcbmqqyY0RyIP07fCs?=
 =?us-ascii?Q?b69yB30i+BQGENqyeeJrwaiZvoFX5kfEkX7eWCVlP1RZ/xE4JaJCDU7idK30?=
 =?us-ascii?Q?Wln/SbD9RLmoHuncMCx24C78xNweA+BPBm6/RQ97WNbRSvTJEEMW9OnP96YG?=
 =?us-ascii?Q?WtXgQGhCWH28J1Ekd8YAIMMLGrEb5XF5pvzVT+t5iZQLao1gYXlIRFIKzKE/?=
 =?us-ascii?Q?GO7HrfizVgGKU1WWmAQJm4RVu5DTqPdpQ9MHMpyxYknCm0aFUR4c1PSzsf7M?=
 =?us-ascii?Q?XbTxF9nkpSn6IhlrDKxyU9y9/cyVSzVb78dgA4jDR/m4pV26sDhcbLNfg9Dh?=
 =?us-ascii?Q?i1r/9/l3aXd6WsLRaVgxNXAoxvpiIwF1qzpCAo/FkDP1UHOO/awS/eyAnVDg?=
 =?us-ascii?Q?63wiImz59lqyJ21zySo9EiW9EJlk6yczwRP8UvO3hVkyi7ZUEMchaXjOCmMU?=
 =?us-ascii?Q?bSzUR6iP4DkcYyYBL5oKrz0Mfc+90nGMDz7uZSe+QTVInuV7SlYmQFMpdAzl?=
 =?us-ascii?Q?ZWD1qNbcq1Bqc6MlfobXFXebT2ye4PfnwqMVufGWBJ99R/Ckuq+2sGMXKME5?=
 =?us-ascii?Q?v20nKBkAR6gxViWxwCcieD8uEk/eUaRJDNJ/niwiIcBBxRP2L5bWqrEOE8kE?=
 =?us-ascii?Q?KwiicbXIUP4hak+pX5MQIsDzO6GGg3/V8RblBVuh16DSyUWtS+27dUuggRBY?=
 =?us-ascii?Q?ueh+Te8i3PAMrOvGiL6LyAfT9xGKT+Q7t62HorJindPcxhvxmFCKbGLc0eXN?=
 =?us-ascii?Q?P8MZrWRNUIL2zmEAbeNWicHJ81/nwRJlHZFZ6pSF+/nwo1GpvtwuwSkMR/c7?=
 =?us-ascii?Q?5ujQwTSKpYTmhCeUdgNTYa6HZRFI12UY82d1njpNX+btlx+auWHsA5efl7FY?=
 =?us-ascii?Q?XT/oN/vum8mHpInCHvD5inK4HwH76MOcZk/dCtZo1NxqBl7gXguxJAIStxQG?=
 =?us-ascii?Q?wand307oicLAMxWnhykVHGDujqCsErqdYrUb+/qssLL3H60nYHoSfiRWXZgy?=
 =?us-ascii?Q?l4JbM+Vfw7yvW8m6mmklK1NdumGSXx3HKyNxeUnbmXuk7no4/U+tOHOloJWP?=
 =?us-ascii?Q?zbcH20T2VVFF99lUvXO+1WWM6ePqUHQ7Joj/+7E2KsM15Zpe8fPckU/8D0Gg?=
 =?us-ascii?Q?ktmL+l+Zu+rzagIZSwFooiq3AF3ldh02ZhVDrZuLxN9H5P1+O25LYb5JTCap?=
 =?us-ascii?Q?+VQk//0b0UWf9MkdNJi5v4ORizXlR9EDshPbekzTVU1kZFIUPXIFNkgiEFMc?=
 =?us-ascii?Q?+ZRe58KZtM9kOgpD5js5FvTWTNRC9HMws0Mg8obOoxJuCwvgsrEj0gV/LI9s?=
 =?us-ascii?Q?82nBfH7giVs4efyeClFeO2AW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488f6f17-88a2-4ae2-3206-08d9069399f1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 20:08:46.3725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+5EExLsgtOF2ER0gxsNVDDpClsOe7/JLNYA8OPTVryBakwlIJT2UBNvyNanTum5tHgUc5+WK7U3pQl9zAG21g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4678
Received-SPF: softfail client-ip=40.107.92.67;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: Pavel Hrdina <phrdina@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Create an enum definition, '@amd-sev-es', for SEV-ES and add documention
for the new enum. Add an example that shows some of the requirements for
SEV-ES, including not having SMM support and the requirement for an
X64-only build.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 docs/interop/firmware.json | 47 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 9d94ccafa9..8d8b0be030 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -115,6 +115,12 @@
 #           this feature are documented in
 #           "docs/amd-memory-encryption.txt".
 #
+# @amd-sev-es: The firmware supports running under AMD Secure Encrypted
+#              Virtualization - Encrypted State, as specified in the AMD64
+#              Architecture Programmer's Manual. QEMU command line options
+#              related to this feature are documented in
+#              "docs/amd-memory-encryption.txt".
+#
 # @enrolled-keys: The variable store (NVRAM) template associated with
 #                 the firmware binary has the UEFI Secure Boot
 #                 operational mode turned on, with certificates
@@ -179,7 +185,7 @@
 # Since: 3.0
 ##
 { 'enum' : 'FirmwareFeature',
-  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'enrolled-keys',
+  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'amd-sev-es', 'enrolled-keys',
              'requires-smm', 'secure-boot', 'verbose-dynamic',
              'verbose-static' ] }
 
@@ -504,6 +510,45 @@
 # }
 #
 # {
+#     "description": "OVMF with SEV-ES support",
+#     "interface-types": [
+#         "uefi"
+#     ],
+#     "mapping": {
+#         "device": "flash",
+#         "executable": {
+#             "filename": "/usr/share/OVMF/OVMF_CODE.fd",
+#             "format": "raw"
+#         },
+#         "nvram-template": {
+#             "filename": "/usr/share/OVMF/OVMF_VARS.fd",
+#             "format": "raw"
+#         }
+#     },
+#     "targets": [
+#         {
+#             "architecture": "x86_64",
+#             "machines": [
+#                 "pc-q35-*"
+#             ]
+#         }
+#     ],
+#     "features": [
+#         "acpi-s3",
+#         "amd-sev",
+#         "amd-sev-es",
+#         "verbose-dynamic"
+#     ],
+#     "tags": [
+#         "-a X64",
+#         "-p OvmfPkg/OvmfPkgX64.dsc",
+#         "-t GCC48",
+#         "-b DEBUG",
+#         "-D FD_SIZE_4MB"
+#     ]
+# }
+#
+# {
 #     "description": "UEFI firmware for ARM64 virtual machines",
 #     "interface-types": [
 #         "uefi"
-- 
2.31.0


