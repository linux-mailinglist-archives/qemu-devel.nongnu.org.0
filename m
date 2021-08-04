Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40B3E00BA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:00:38 +0200 (CEST)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFZd-0005uy-FS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFWd-0000kg-7P
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:31 -0400
Received: from mail-dm6nam12on20627.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::627]:27520
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFWa-0002wg-UR
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKREDx0wQT7684JyCBNRP+f9/h03S8svUjOM7kGTcRFGxjTokFvt5YPvzMkj9CIFiwbKW7lEYNgXy7ogZSskgj3GBtJZqxVsdz7LLfM81HXTR92CIsSN8S/X3rR4Jqmy/VB4BEFn31Bq3u5ENcPjMowJ2iNjaK/D1y46X2+bagNK4lJHG1DoecgvjiAuIn0u2wq73llggBf+Hg5CPhq9gzOxc2SQbvJtDzQb4cAneWW1CkrUQi9UEaLKfjfpi32tvJz1JTS3CDR0Zltr59W/AEw6vl2xSWUzQJNhgOrJVt/aZWi7qFMNQxLaxdCHnjHrTFIOXGbuxWf0whVAjMbozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU7ttsmQTWqTcdR1R01qXed2zRQDDWgQfiXN4pxvGPw=;
 b=apE+chacIr7qkgZYCzjWl0qA66VV7U99kfvILMlYUWQRH1WGgWZc+sNMdIQ+Tjtkh+8KhqwcecKv0sr7vXpdyZQUTNhUSXQSmdD1ojvTbqQGnIpH1N+NKEosNqEKCTXx9tDEBn5UuMBtwf9IhWfiysize4Azt16T04lyPtYWaPtynIhojSOFCKGwEv3hCqI9393uDycAq/BDU50cVuL+FgQJbUG8a+HK6IsVb7nc/w1d3QS70T8C+lpBx8ZjtXoZfiPSBS8O1BPgqDEBKqVuO9HFTMkhIXiCXiIRCguFwkerZzZ6arkRs/8wiceCFdr8cWySGbhXev6aMAESN4GSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU7ttsmQTWqTcdR1R01qXed2zRQDDWgQfiXN4pxvGPw=;
 b=sc9o8TY04/mhzOrLprBu+Q2Clt9dksPp+h/IwOUPsWOaH67YAUh+b/GTBJn2lNa75Z40BIoLRvOVBEjHt9pwCKJ8KT2IsopTdM0Njh9e5yRboCcAHT2iDumFjsuiNGJGFFiOtKxcu0eDd3tJQ81LOnAzXdDUjmPAcrF6+slBVOw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2687.namprd12.prod.outlook.com (2603:10b6:805:73::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Wed, 4 Aug
 2021 11:52:24 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:52:24 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 00/14] Add SEV guest live migration support 
Date: Wed,  4 Aug 2021 11:52:12 +0000
Message-Id: <cover.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0022.namprd07.prod.outlook.com
 (2603:10b6:803:28::32) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN4PR0701CA0022.namprd07.prod.outlook.com (2603:10b6:803:28::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Wed, 4 Aug 2021 11:52:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6e73052-9be9-4198-cf01-08d9573e52f4
X-MS-TrafficTypeDiagnostic: SN6PR12MB2687:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2687F0CEFD3B7E6C51FE3EEB8EF19@SN6PR12MB2687.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9LiMF4uXs2idphNY4BRx8+L1p/1vGX9cwiw+4+OMOL37BspUJG26T4+Jhn3nuPgcl00rFu9VSenHm8RKfOCi39yZVzlxW8RVXpW3R1XbU1V5Q5VUisCniqs/DVmXyMRNPAx/nvWFVb8IRrHO4S36KOBnT6BbEN9M2qOXIUFnp4OOhU6MC9bg/RKhhMMFx70OvOnZmfdSWg0GqT689jnMRUzRi2cRzQbEAQfDTM6dQv7hINaAgPdhh5df1IBFjPmBXL+0Y/MQlyF/9BbsJWgp5QtSLShCvL0z2CTAMAHTC00bNyt1XZ3iAf0cYPzHvYvwDGBihm5AKhZC5s5Ryzykr67NOEnvOR5Bq01V51OdsEIrX1q+oT5gel1JqB+XmAHLgLLmvYKW1up/t/3qcOC+cM+RiieKrrqdDTIzh0s2uTUAgWNt39fCL0BkolkoxdsmxCNh6zht/BQlwq4Cx5sklIlY5ZAwYG/XuTSj+qNVyPcnNOBwdK55l68ljOI6qMH0Ko8a//3E3BNpAPTmZqfdSfBlqZ/Hhj732T1LYRFbbZfNhGDGUROtlGuAsC8qHfXOMdc/gNdRx4DZG3aG18RFAO4BwTCDqlOjI9fVytewME4m0pT5PX3hlt5W7FIYXF5SG3s0TGnaqqzlLgcbluYyKtnOcrkPQHRK/duj5NnkoEK70d8OaBnEc9lR0MkeESyLsNRt7tdNAOGj5fHpZgHPB38e6IFGneep2A9yiIfIG3ltG/CD/ZgUDf+vwomyHhFY4JXIxtrM371rbXdBGG/MM3BH9J3pFgiZ06xnJbZSdEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(8676002)(186003)(316002)(8936002)(52116002)(6666004)(956004)(83380400001)(2616005)(6486002)(5660300002)(6916009)(4743002)(86362001)(478600001)(36756003)(4326008)(38350700002)(66946007)(66556008)(38100700002)(966005)(7696005)(26005)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E1SmI2I/PEBZDEp0TEg6oEAPX45iXgWPOg63xAybg3eKnWTqSfY62sirOLN4?=
 =?us-ascii?Q?62pxRZPb+W8Uqf/8Z1JHJoF3QG4Y/pRaO2+zQw8Twtlp2J5QpRFxw4BBoF8y?=
 =?us-ascii?Q?e0t3fph3aVWIQhbeUxWAu98jmFskrvJ4Qa9JE9Mi46o4FKIDkPsPpCY1C3xI?=
 =?us-ascii?Q?Ba8XEdgsfYOuD5g+mBI0+aPKp7PHpznMYQxeoRNhNZVPTUDHDt5NBm89qtx9?=
 =?us-ascii?Q?NqqONOH9JuVGO+SZLOyWJLJXUGUFS8iwG7WYSD3hDczAJpEjNfGQKXRbrbpk?=
 =?us-ascii?Q?OgJUjD+H/X0KgnMjrb8qjb7E5xdFGdsIm9MQRXSG/PhoL+jbiGf8rYuGKPmf?=
 =?us-ascii?Q?cXkma0HWz7j7eUCGiHjsoqKNzhKsgd/jxPinx0h/24l5cpQKvdLqDRAWKQQB?=
 =?us-ascii?Q?IwK0EoHwjv28TiG0XFEXuTL+TK0neBr1exqzaRZpWzhAGei9A67pu4HXHG28?=
 =?us-ascii?Q?180ZmPV8Gy7bB/sECkiFbsNuhtKEulmWIu/IupS46qWBWDuSSYFJ9jnKJZZt?=
 =?us-ascii?Q?ybUvQmb6xzpF2AbOTgkcfnCmQU3K+S6RnFq2dA/brhh9A8XTNR0ct76MRsQL?=
 =?us-ascii?Q?MVGSd+70mIQc/5I2PVRXZSiZgKv37dl4z0eY1VWgbswu05FFzV1TLRkak1bN?=
 =?us-ascii?Q?oe5tYYOdrgbxXQJwf9OwN5gkKoMBudCALdFxSMv11HwbvUaeAdlTu9xLBta1?=
 =?us-ascii?Q?7i2c/Bj5p6sCx31g9VCp1Ll09Fp6mndAUom6q/xIkXB7jTazkDbNFVxZP9PK?=
 =?us-ascii?Q?H9ZgFOIyTvrIANzic2pV53LCWADiKXHelbzO0mdu79kZ+RIqAQTrHlj3iUIn?=
 =?us-ascii?Q?xkomRfKr/ADSQ/bAGs1kdSVfSapBMlHcs7Ck2r0ovh6uTP4LXRVslyJKzVy6?=
 =?us-ascii?Q?jAhpILr1idntob//PVTUi/4z90hcgZ5AvttvIOhiVOPfSmwpDEzXG8rTkha6?=
 =?us-ascii?Q?H+qUWtN+VMlEIgL/oDvtXgDeaEJ8ibnECS8v128E/PXTBMRT9ubuofhooDgD?=
 =?us-ascii?Q?O2dWkZEeEGHY1hwkMCTVtsmXTMqjRn3YS8c/vzXRtLqjg26f84IlasrtQ8+Y?=
 =?us-ascii?Q?gyEYqzP0iK3x0I3ITLtPEg8fl1k71WFdKV73MLJzbRbIUf9m7AKV0rZ4xZKv?=
 =?us-ascii?Q?pjWZmJazlPeMHziI5o9nuVqvaU1GTNu/PXrHA8n14YxJLJnWeUcHRCCSOdj5?=
 =?us-ascii?Q?hO3layC5em79l66pKNektXR5yHmiFnloB9VkdvyqGW0EIY8afQ4fYEZybZTd?=
 =?us-ascii?Q?fIgj7Xk3lBY7lkXGb1ttqTkOm3dswIe/omCBbSzdq40bXOSXqbxgrDEwYcM1?=
 =?us-ascii?Q?9R+I5Xnxr/aAyYDjpHX/we2u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e73052-9be9-4198-cf01-08d9573e52f4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:52:24.2819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNAFv5idYYzXcUZ9zNBpGeUznO/J0Igflq1WhsLX91AWYLefxeqrkt7M7/+W4eUwRaKakPIcOfHbCi8xk4i8Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2687
Received-SPF: softfail client-ip=2a01:111:f400:fe59::627;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

From: Ashish Kalra <ashish.kalra@amd.com>

AMD SEV encrypts the memory of VMs and because this encryption is done using
an address tweak, the hypervisor will not be able to simply copy ciphertext
between machines to migrate a VM. Instead the AMD SEV Key Management API
provides a set of functions which the hypervisor can use to package a
guest encrypted pages for migration, while maintaining the confidentiality
provided by AMD SEV.

The patch series add the support required in Qemu to perform the SEV
guest live migration. Before initiating the live migration a user
should use newly added 'migrate-set-sev-info' command to pass the
target machines certificate chain. See the docs/amd-memory-encryption.txt
for further details.

The complete tree with patch is available at:
https://github.com/AMDESE/qemu/tree/sev_live_migration_v4_1

Changes since v3:
 - Add new ConfidentialGuestMemoryEncryptionOps in 
   ConfidentialGuestSupportClass which will be used for migration of
   encrypted guests.
 - Add support for KVM_HC_MAP_GPA_RANGE hypercall and it's associated
   KVM_EXIT_HYPERCALL exit case which is currently used for SEV
   guest encrypted page status tracking. 
 - Add support for SEV guest encrypted page status tracking
   implemented using shared regions list.
 - Add support for userspace MSR filtering, which is currently used
   for MSR_KVM_MIGRATION_CONTROL for SEV guests to indicate if the
   guest is ready for migration. The KVM arch code calls into SEV
   guest specific code to delete the migrate blocker added during
   SEV_LAUNCH_FINISH.

Changes since v2:
 - Remove direct kvm_memcrpt calls from migration.
 - Add MemoryEcryptionOps in machine which will be used by migration
   instead of kvm_memcrypt calls.
 - drop the RAM_SAVE_FLAG_PAGE_ENCRYPTED_BITMAP. Now the RAM_SAVE_FLAG_ENCRYPTED_PAGE
   can be used for sending bitmap as well as guest RAM encrypted pages
 - add some bound checks on incoming data
 - drop migrate-sev-set-info object
 - extend the migrate-parameters to include the SEV specific certificate fields.
 - multiple fixes based on the review comments from Dave
 
Changes since v1:
 - use the dirty log sync APIs to also sync the page encryption bitmap
   when SEV is active.

Ashish Kalra (4):
  kvm: Add support for SEV shared regions list and KVM_EXIT_HYPERCALL.
  migration/ram: Force encrypted status for flash0 & flash1 devices.
  migration: for SEV live migration bump downtime limit to 1s.
  kvm: Add support for userspace MSR filtering and handling of
    MSR_KVM_MIGRATION_CONTROL.

Brijesh Singh (10):
  doc: update AMD SEV API spec web link
  doc: update AMD SEV to include Live migration flow
  migration.json: add AMD SEV specific migration parameters
  confidential guest support: introduce
    ConfidentialGuestMemoryEncryptionOps for encrypted VMs
  target/i386: sev: provide callback to setup outgoing context
  target/i386: sev: do not create launch context for an incoming guest
  target/i386: sev: add support to encrypt the outgoing page
  target/i386: sev: add support to load incoming encrypted page
  migration: add support to migrate shared regions list
  migration/ram: add support to send encrypted pages

 docs/amd-memory-encryption.txt            |  50 +-
 include/exec/confidential-guest-support.h |  27 +
 include/sysemu/sev.h                      |  15 +
 linux-headers/linux/kvm.h                 |   3 +
 migration/migration.c                     |  65 +++
 migration/migration.h                     |   1 +
 migration/ram.c                           | 170 +++++-
 monitor/hmp-cmds.c                        |  18 +
 qapi/migration.json                       |  40 +-
 target/i386/kvm/kvm.c                     | 107 ++++
 target/i386/sev.c                         | 602 +++++++++++++++++++++-
 target/i386/trace-events                  |   6 +
 12 files changed, 1091 insertions(+), 13 deletions(-)

-- 
2.17.1


