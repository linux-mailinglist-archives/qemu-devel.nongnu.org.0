Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC33DEF0A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:27:44 +0200 (CEST)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuSN-0002Bv-5k
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQr-0000DR-2j
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:09 -0400
Received: from mail-bn8nam12hn2217.outbound.protection.outlook.com
 ([52.100.165.217]:16512 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQm-0001TY-Hl
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iesiQ9wh+H0lEI1/TPiIifVxQ8rQfnGGJMuxCz/GASHzVKk/ik7+NlkfglHePRDGB5yS9ffEihrWXERKaxAm5Kzjf08EhlLVQG0BRVww4u0tTGjhkHUK0WnWyRSAGXRiba4KuUClYWZLdO11jBljIJNNBc6lPq1EotKDgAyivZjiW0upGXlWBpTr9CyjLs/o+CvsHzJDZiezmkLVuGOPytSvKlqOgYXUXrV1vqwsag2qaxvE76/vReEQfOyO/q1L9ZscgU2nFKlpltzxlkAw3GfsrJTol8wle01Ro/JKdAd2O5rPW62tnO/SULFfbGv6pzglLmzem3ZZ8red0Q1tOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N1CHaSICEJCI8TGvBp1Xc3oSEztDh1KQlN9FkuwxXE=;
 b=XVyeAd6tF8tG1elJR3k+vH6HISXz6lpNZIYiOJGQsxnE8Q4cCWgMMZQfz6THhTZYwFGYlsxkqm5reZJMwx6WRSqPHOl/ZYMUZsVSLICXNpZwWXc5bK2hLTMumgE65DERQKfyLeO29lVfjpqIVHu1OtlsDe+K8oaaH776ED+NgbKA1woKkwXPaGTI6iKEZ5p6yV+skSmTteAzJ652Phkvpsax6xznXPS5nghpgovK9Prg2R5RilVDe+ls6fs4xUWoCOvqKDs2+eKfhlslB4WjQZNw6mED1mhDQ/HrFR5Ja7qZa0ND4LsLHww1YYStKPb6i2PVRMz5kLNvvBTaoQ5vzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N1CHaSICEJCI8TGvBp1Xc3oSEztDh1KQlN9FkuwxXE=;
 b=PeTHmmvrHwLL/F3T0RZyiD3Ugh0vI7jRxcuZ1kOv3tlOAv0++KZ5Sd3j1RiQkdJwa1TsKCCjEU2aDtB6AqymEx3ER9Zh6zuC+uAGWpqU+SOxwEMW/S2vBNs8VCzRslwrmRJajJBgW7dCiktkhHRvlW2woG17As8Zw1toV5DDPEk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 13:26:02 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:26:01 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL for-6.1 0/6] qemu-ga patch queue for hard-freeze
Date: Tue,  3 Aug 2021 08:24:46 -0500
Message-Id: <20210803132450.1093602-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::13) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Tue, 3 Aug 2021 13:26:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fada3d29-52ac-4b0d-88bd-08d956823ccc
X-MS-TrafficTypeDiagnostic: CH2PR12MB4118:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4118701FFE6809AA5E7F807C95F09@CH2PR12MB4118.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JDMMLQhEgaYEOcph7gbxgb1LE5Oo6megw/EJrwNVlLCGDidFsSVg8lH/7iiI?=
 =?us-ascii?Q?8LexD5LqQBxd5rOjtly7c2M/KBH19508MtJkCJAW81uLDOFaRczg14S2AT0n?=
 =?us-ascii?Q?ebjG169hcMM9wbk2WWfh1acOA/1pXTxFnOJeXzojnztFY75hvHDSlp9jI79c?=
 =?us-ascii?Q?Gx+LDY1mbyTd5pGAYJZuFy51GeWm2hflGFQv4pAIoNxwZLr55Eb1eStTDffO?=
 =?us-ascii?Q?mAofY66r9laIGQkC1DB6K4xyOqiP4Py55QBl/rq/PV9IJxijvqqaiJ5D0GfC?=
 =?us-ascii?Q?PXPajSZQKPaC8uTAhc6k2dBc5tJXoEfafTftTFPAL6XeMKRd6zskRg+4bPu1?=
 =?us-ascii?Q?JvVG5dw1DNjyHyoqgewNUwjRi1ILeKBkjV2lOpN8N2YcH7uSF6DlJSOhEkOl?=
 =?us-ascii?Q?ESOMHJfyybG7WLjtMP0KVe1A1d13pPQmdRHZKqVO3YuCg39Ety2P2n6+tNGy?=
 =?us-ascii?Q?PjmEoGdHjulk5279dJ40cyaLUDeKxynvWg/mf8icx5GA1x0uy2Qe8kmIBZOy?=
 =?us-ascii?Q?MZlr4IML9ElNRHZEQ1vNcCD/NZGaJq/UOzOW464HDL18rW3pb37EH9ETqxhH?=
 =?us-ascii?Q?4PA9L742aOTgwJHpCz+Jq5F3JozsiBIIArcoAmJGgPQQiLmFAxR/thBAvXHM?=
 =?us-ascii?Q?KYRmuObxBQ4A4yDpuZVqob1bEMvdIrxxYUDlOYdU62JAQZnphAePfnIhRo3h?=
 =?us-ascii?Q?7pNsiMJbThMJppwEVEm7uhMnu+8zXajzBHXjIzopDPr2RfAS/uADu+Wc2pyx?=
 =?us-ascii?Q?bndQ3STh+1pmlUPjpQkqez/tBCSyPaMtAiqlx+s2gjfYkxV1bJp5SSfHey+Y?=
 =?us-ascii?Q?cdNjQurOgBTLR1BdMAS96pD6y7vYYdUNsEcUTIdgBRXwnML2vo16PIFgj4xQ?=
 =?us-ascii?Q?OzNB+LpEDoXblg5B9isuA5M+fjg7Snuzs6I+FWY2eEB4nNafG0ZxHgUTxC6J?=
 =?us-ascii?Q?mc8lmPz5ZEZFfgYGZabrSbxy8/22l3ssNP6FTrqerliyYtR9mYbvKIJ9A96x?=
 =?us-ascii?Q?Tzb0y2bwstNIjUKyBYDsoUVx5N/DghIU0KdNJ0ywk+hhgCU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(316002)(36756003)(86362001)(4326008)(83380400001)(44832011)(956004)(2906002)(186003)(1076003)(2616005)(478600001)(6496006)(5660300002)(8936002)(38350700002)(52116002)(38100700002)(6666004)(8676002)(66946007)(6486002)(6916009)(66476007)(66556008)(26005)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jLcJ6SWbLhTcmyPiyZlvO7QbVX23lBa7IU50NhlyCGFsQvTogLOnELK0vmCM?=
 =?us-ascii?Q?SYg0anWyu3+7MSyOlf9dXYf/Swx+/vqA7PvnStruqQfiwp//MOkXkumgM9Zk?=
 =?us-ascii?Q?mZ+9hJYKD3N5fNdCq8FH0ssjIJEQ+S8+iCLhJ5ZWaPEvMQcEmetqCjJ9tMzj?=
 =?us-ascii?Q?/mis3DZm7Oz/CxY8S0bGuXspqZYaFQ6xdlxJvVeZyvxXqISKzBppYpq/By5p?=
 =?us-ascii?Q?JW9DHvwcnP+KTLDPRe50HkggP+wBp3yIrsxEOZeC7eGmoY9ZRyB9NRERUP6M?=
 =?us-ascii?Q?TfEfDsGpKTcz6fSf99VNgAADxmlAR/4mkJHPwhqSab9GyCjuYMVInoFG7LhL?=
 =?us-ascii?Q?vrbwnCZPHfCOWdAWJF/Cq0qao+NSf+Dy/JaZjKQ5m9UvSUecV9cYP/sgg+dK?=
 =?us-ascii?Q?ZHka38+LKX1NY+he+3krf5IV/O13j15Xh4VGvc7lo8zCDHSV1qw5GTR4njOk?=
 =?us-ascii?Q?nJJ6gNOzbudFnhVBwmQ0YjISrWNIYAC55Sd91gSnWn64RjLaKh/jRjCQsCPg?=
 =?us-ascii?Q?pie/OKqUIUcW01n/evBHGVNa5hrI7h/uRuvyAuGWn4zdw77bvX4il//Ugf/B?=
 =?us-ascii?Q?TrZUAtIU6lzb1dktvIouwfDRQNNYqWenpp0n5T27Pkr3yHbBdMnTd94hjMSf?=
 =?us-ascii?Q?ksBrSQtk2pYI+ILis6/veNtl/GABGay/wF/r2qbZpXrVPRebfXrllXsCMRYT?=
 =?us-ascii?Q?1WLVy37mTLkJA3MPMJfNBjAgfsRdAQJxV4EdJZRTzBxP3fBsku8hNf+dsVS5?=
 =?us-ascii?Q?clQXPyXcZBFtAJsgy2PhwwiLpjsV+zhFq5neV71FaO8tRyTYuugeaLQWhAaQ?=
 =?us-ascii?Q?3rUoSrkvKFaT5AySLlHS52LFehvth48XKtMp4vgeo4AlwY/WsiLpJEfFtXdo?=
 =?us-ascii?Q?qKdbLOZLCK+Ha4xcHgiAyp8gttvrVB86uWibdaNbrWkSG24U/ndzfm3QW9o8?=
 =?us-ascii?Q?EKKsrP83/W70WwkAQFRzR5qUx3SXAxJ3PjC4DfBkK/4mKZcmsG9S6P0DgYVQ?=
 =?us-ascii?Q?O9F7Uy9bu0GQDcDWC8TT/ds9GwTBtb5c34yVzEsX5ln8p8wn0yq7viHU+EHl?=
 =?us-ascii?Q?xvcdlLcFniXiT175SWzIvUZ/Z25z08ckhjV/YcPVOcbTLg8E7HX2iP1nytXu?=
 =?us-ascii?Q?t0zbCN96RoD1VOpomT+5IbNOzJlJIXlwysG+tAPuWdNbw3ltva2BW7tn/Et9?=
 =?us-ascii?Q?2rPWRW3Z3lqnvahJovP7BSDUpV342ahq/CKGj6jhOb6jeUBHkJZrDTiNcJxA?=
 =?us-ascii?Q?EdQ98DuFsHNK1rLQVys9b23E9aumQ1BwTgpIUuRg3R/wwy91pE0jizYfFACF?=
 =?us-ascii?Q?AZFmx+3MI1GrcVpqQ5bhP1Ny?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fada3d29-52ac-4b0d-88bd-08d956823ccc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:26:01.7202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqgurMacuG0nw5pt2WsQWXhGN+ofE6HJ+G0vbuzA9lDlFp0MXtTx5LyuQis8kpsBPFYnGKW6zL6JACbj//ds0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
Received-SPF: softfail client-ip=52.100.165.217;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Hi Peter,

Sorry for the late submission. These patches affect only the w32 build of
qemu-ga. A number of these patches I've had queued for some time, but a bug
in the MSI installer that was just fixed was blocking testing. Now that that
is working again I am hoping to get these in along with a couple of other
fixes that have come in since then.

The following changes since commit 7f1cab9c628a798ae2607940993771e6300e9e00:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-08-02 17:21:50 +0100)

are available in the Git repository at:

  git://github.com/mdroth/qemu.git tags/qga-pull-2021-08-03-pull-tag

for you to fetch changes up to e300858ed4a6d0cbd52b7fb5082d3c69cc371965:

  qga-win/msi: fix missing libstdc++-6 DLL in MSI installer (2021-08-03 07:01:36 -0500)

----------------------------------------------------------------
qemu-ga patch queue for hard-freeze

* w32: Fix missing/incorrect DLLs in MSI installer
* w32: Fix memory leaks in guest-get-osinfo/guest-get-fsinfo
* w32: Increase timeout for guest-fsfreeze-freeze

----------------------------------------------------------------
Basil Salman (3):
      qga-win: Increase VSS freeze timeout to 60 secs instead of 10
      qga-win: Fix build_guest_fsinfo() close of nonexistent
      qga-win: Fix handle leak in ga_get_win_product_name()

Gerd Hoffmann (1):
      qemu-ga/msi: fix w32 libgcc name

Kostiantyn Kostiuk (1):
      qga-win: Free GMatchInfo properly

Michael Roth (1):
      qga-win/msi: fix missing libstdc++-6 DLL in MSI installer

 qga/commands-win32.c        | 18 ++++++++++++------
 qga/installer/qemu-ga.wxs   |  6 +++++-
 qga/vss-win32/requester.cpp |  2 +-
 3 files changed, 18 insertions(+), 8 deletions(-)



