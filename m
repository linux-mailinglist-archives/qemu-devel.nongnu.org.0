Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92D2B513B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:34:21 +0100 (CET)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekGZ-0000Sb-VW
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kek4j-0004sK-B1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:22:11 -0500
Received: from mail-dm6nam10hn2248.outbound.protection.outlook.com
 ([52.100.156.248]:43009 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1kek4h-0005yL-K2
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:22:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBAnjScQdVpe4srnvztCjnLf4r9yMR4Hye/wyoUEKkPAFWR88F16PyCzqA2W+4nN9WOhvNeH/WL4wcfSAdffI01qM+NeCz6aIoN6TxQG0zAQLalZ2rp7OR5kUY0sV4xBGdX+BE/+k9cswlRza9Dj5kNFJsi6rYgVRLiIW4pWE75z6PQQKb9WzBd7SgWQ5RZ+nEsZhvn0IsgRxaaiLNf+lGXGxMMDX3641jjeIbNVzxaulq9auVIi1TsKBtuFS0Oh/82qubQ4FhPj7OJV4JnG96sWhJu7KEH7FXBSAe/FH4r8XYzfZt50MxS61CaGmEasZgs/nv/HsEUvKI05I2yXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXNpUk3jx683gSnQZE0FirrP1APeqIuxONwENvyy57o=;
 b=LmAaJ6KHDC/gd4moGJqidRM/PLHBstv4BUeX2cEjC7mKp6GgA9oxKNY0oB2AYsUSNJNsLFNf0TXLAv08Eyyl5DCr0dqu7rL2ErL5sqBxtlgHlRjYWIlCl9qRbJ1KqQHo0Iu3QGZpDGlCQKVp8frAe7U1oJaLxnCZPDR3p5OBzFgTmrIAzECMVtU8SKeYbnhMofhUbyUip1hHROjg4Gr0bNazKLGhfN1O+t30r52hKrjinUCxXScOLTJAAcsJBp9zczqT+eh1ghkxacO6gFFoa+IK5qbFGDbI/eFNbFoIQL1yyKjbBLtJbwdnQy0lU7OCugnj9w86YqmL98I1zJUvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXNpUk3jx683gSnQZE0FirrP1APeqIuxONwENvyy57o=;
 b=cP3QutHF6dLCXpaaABPgAJH4s6rXTB1OaQDAfJetSTXwhAudcdMdF/l9TXVTZKftF0Eq8LNV5BKmuSbI5j44kVFWjGjkj/dB81suDmvUjrGCm699Nd1cgY2YJFly8IxyPIcjSKnV6yab9TRquYfm4ce/S2gb7vIHy/xNlyiKzVE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3814.namprd12.prod.outlook.com (2603:10b6:610:28::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 19:21:57 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::6c15:785b:4e48:e2d4]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::6c15:785b:4e48:e2d4%8]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 19:21:56 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 0/1] qemu-ga patch queue for hard-freeze
Date: Mon, 16 Nov 2020 13:21:16 -0600
Message-Id: <20201116192117.45930-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [76.251.165.188]
X-ClientProxiedBy: DM3PR12CA0087.namprd12.prod.outlook.com
 (2603:10b6:0:57::31) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (76.251.165.188) by
 DM3PR12CA0087.namprd12.prod.outlook.com (2603:10b6:0:57::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 19:21:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c97a68c2-2845-4d6b-7a9d-08d88a64e1e2
X-MS-TrafficTypeDiagnostic: CH2PR12MB3814:
X-Microsoft-Antispam-PRVS: <CH2PR12MB381417D8B9535A17FFDDC83395E30@CH2PR12MB3814.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7maaGIUjyR6iKthe1HCrzv985KqbkJOxqaytPN3nezRPoDaXgnTpKX+ufsvlT1fzNyYMAN34hQBmD8V0yIS3y+geSRs7sg7s8KAddpAnTcu2OzopWYiplQoD6cpLF1270UC8fbnT1Ov4Q67w/ZmcCk4znpCTojg88GPGdIwcbMHSp6aLFt8NQv8zDjPrZwNwU+PTfaafZcDc1hseJNdm5wZ2ruf+qDauayAHO4Hs3a2a5U9HAkA9jyRQ6Ehk3o3WxdjcoqT8XXGKDoh2MYMizSNwS0Z6F3OuT4LBie3VgWuFuXV91XuQbHSDhzuGNH96rrFpbN2NmDN9Q8MiankVNLakk3Rtqlnitp67/RPtxFbXuHotyeuXACGDaTR9JnJ+8abyYWH2Uxur6Zstyck3634hp7DOhqXSpW86v8EONbwNNToicADM9OLBLZUwBt8VGfwmFMEOD7ff/P8WUbT5WNJJPB6kVfQ1K/edvu+5gZij72Da33HYUIpDy83M+KLcYAguGIMctEA7Cqgzja0FvQy/2tf+YEkfOrt7+yF68SrKYr1Mbgl8be3AsQcoxDASd8WSq/4HJhL7TAsIRsdUKTB1SFf+TRLGI4+wLyBN19ynGNQKwJI5w8dSMmE32kp+/Hs4tVp6KavLaG49c8FrhnrXXsnE45Y5Ii8rkwZzfFVyN4jrFN1rSzAISxzUffj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(2906002)(16526019)(4744005)(26005)(4001150100001)(86362001)(478600001)(956004)(2616005)(186003)(44832011)(1076003)(5660300002)(6916009)(66556008)(66476007)(36756003)(83380400001)(6496006)(52116002)(6486002)(8936002)(8676002)(316002)(66946007)(6666004)(4326008)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData: gX2RZ4PhstnDGfsRazaNqnK7beMVQIwLz8soAgnK7fOF9HvN+OmqDZpY1xVfzUAscqVUvvoVcznoGe+jVnPnyFL1mVppOwVuwe+VO0xdu8rF+bm7kbe1iaGG4UVhEPc+AMk7ioIa6l7ijmsFLx4bWW/e/ECqcPtPpvTu+rxeJW4EZsYjfkcyh5Z9awCSeB20wY94Zx4VtRboUxn7cHvnDUh6rn9Mz/JV9sjMDx+Tsm488gIkxzCQj9oz/4Mu99fnwRaBloZjuXyvl0MZqVZbsCsGXUOOBlcx0qLUGV4B6nlRz1rYPmgwDjxHnVRVF6Gm3SzHhyqgi/aadgx1Z/iU86OfhK/+gJMsQexpGGGSfICQdDB/g7/rkI9QhNob06l3qH06SgddqCF89LwtL1g8ZOxUYarvkG+UHlJMxqiRHh4vLGJjRkrFCzbLwC16Zo7mvhONJOi/roFuKhOg/i8P9hm9Xg8Z50ymxhFuCyr4IAPXTi2ucRcQp2Tpv0nRkQmdJe4qj2rXU/QEFBzmJxLeg0sQqEFYTonu8ZykIa5wepJIFTDrqV7raS3xjL6LeVqhEqRpQwzq+FrP0yEN/tUJk6fLb1gvSzq9J/BwfcM38LJjfieRQkRouf+vEO6TqGTfoqqkJpvCjJFGX5UHykAgZ2vCLSiQeOEJbVBU4SFOzYXCMV6aVlZ5cY+XthtNpQT8uXhFSc716Bxn02Sdc4uVooKOB+Hzssgz15qpT02RL5aDP0p1F7q/u5Q92HQ75iWweisudSP0/waRClKGMNF+gIyddbPfFRcqmoRpTcI0oBSNSzNg6KdD4lR4TbbezH331ljyMiPhBay+Cf+MmR0iqaMDo0+H1ChbZiMcWjF/TyIhF1WuevkUxg0Y9TcI6my0KYED+GJGpL3Am7sbZEMrfw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97a68c2-2845-4d6b-7a9d-08d88a64e1e2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 19:21:56.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO1yIJ1zOcW+J/1iTLCQ6+DUDt0El7mEe7GLVBmCnUal339kPVVYq98/WNtf1HVU3/HJ6f+kD+GyOnxodxIJGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3814
Received-SPF: none client-ip=52.100.156.248; envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 14:22:00
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2f7c9dd5181524ceaf75ba3ef8d84090b1e9e8d8:

  Merge remote-tracking branch 'remotes/kraxel/tags/fixes-20201116-pull-request' into staging (2020-11-16 14:19:31 +0000)

are available in the Git repository at:

  git://github.com/mdroth/qemu.git tags/qga-pull-2020-11-16-tag

for you to fetch changes up to a8aa94b5f8427cc2924d8cdd417c8014db1c86c0:

  qga: update schema for guest-get-disks 'dependents' field (2020-11-16 10:48:11 -0600)

----------------------------------------------------------------
qemu-ga patch queue for hard-freeze

* fixes for schema data-type declarations for guest-get-disks

----------------------------------------------------------------
Michael Roth (1):
      qga: update schema for guest-get-disks 'dependents' field

 qga/commands-posix.c | 10 ++++++----
 qga/qapi-schema.json |  8 ++++----
 2 files changed, 10 insertions(+), 8 deletions(-)



