Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42433E7BA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:39:12 +0100 (CET)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMN1b-0006AA-9p
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMN0A-0005ct-M2
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:37:42 -0400
Received: from mail-eopbgr760042.outbound.protection.outlook.com
 ([40.107.76.42]:12416 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMN08-00023g-E7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:37:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE1jyJwCZyYv/yDmSxWkK9RQqnrwFISFLFmu75+KMt1d4H1gTtq09rT8OKKqz/uSfmDDEyE9plD4DVAG7rIr6K61tEcQvp1cIPpkpktj2f7fO3lCT8W5cfkAbSUUa9t60yWQfqHc5ftmPoEbHsftfA0jnwI+Q99U+UktBdih3IBLISS5/kBlFMAyX8fN7U+AZP4Gbqz0/KYHIKPgGoyMClbmXLeRHCwWFBbX060J0QNgiqQAMN8pb8SqhfwbwImN8O3a5YmgwVvmetLvZ75OTqW0SkM/cHDzvUxHXKwR7GFZWuaVhUezzGaUP+520FhCb/4TLTKQmArfLXWRi+Fe/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJILAEf+v/tgHbbKtRfdDWNyW3Ot2xUBLSSP089uEi4=;
 b=hn42e8coqHywxBdqg0wrSgoHUkaF5EZy2uuvy+lBMK0yystw/Jy3noTa793eLtifRtwi5tENxU3MgYWl3/NNcu9PapY0HbXbe5F57AhlmDywQdPvz90uHN9gEvdkBgea2QIKopa+ctyNA5pSUvgmcZbvuOgQcXrc+xWetSzTdAejl0W5jQ+zts3HwYUSYCPN6tIUnY3J9cwd04emb1oE7ONkyZeVD5cXY3pdXMiQWEshl1FsNB76xmyfRyfZF28OGnqmIb/Q5Qcwcszy7PeHM+BaH4IlDjMLM6lInxwlBoB41OX2lL4AjT7XPcqSI+qQ63neDb00ae7nAMx2nLxI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJILAEf+v/tgHbbKtRfdDWNyW3Ot2xUBLSSP089uEi4=;
 b=yIyvW63yxzdI74xy+ipX2icqRWFwJdt8oMRIQvkbgY+E6e327ia1Xj5uXHYWQkGZgGQ+OVOyku7KzUlOIXjBpPujPE7JjZTv4EJg0dB/CHLmBLE6i0H2Oe9CG3AVsbu1nzV2vBZlqud6yNUbHRAK8gD6LLjXpeSNek1C1ICJH9w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3704.namprd12.prod.outlook.com (2603:10b6:610:21::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:22:33 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 03:22:33 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 0/6] qemu-ga patch queue for soft-freeze
Date: Tue, 16 Mar 2021 22:22:11 -0500
Message-Id: <20210317032217.1460684-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:408:112::24) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN9PR03CA0319.namprd03.prod.outlook.com (2603:10b6:408:112::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 03:22:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e251e9b4-905d-4b01-6a64-08d8e8f3e7b9
X-MS-TrafficTypeDiagnostic: CH2PR12MB3704:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3704B384B870FF954CD96D72956A9@CH2PR12MB3704.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKqEM8P74Q56hizeF3OQeBq6jR3W0xkyIlB1pvoAChEYURcvIo6/KuBNmcTHLfUGc3JGeAVDfAVI4e9XJIXvv72d3WYy4+ppSK3Ug/8fTzshNCIyD1mFKQmKlXvbCPohXSQmS9HRP4nR4HaisdDi8p0Fh8FuvSfh1l75YEDm8+IHVCaWQ7FXut/5KV8wnbKFSvRQoke1Y0GRYfRTxnTxYrtYfM74OmAbY86dqEquhrXgxgD72pVNP7yt3nPKQG4k+3ylWl2TuFgUsOMJKqvVi65mGvN2nTO30cbtTunjU+PAAuc5+2ff6Ldafwz/FNr1HkKv65Pn1ztkyBmpoP1pIZ+seu8+ithIyyztbyrwdPxM9byeepGL6UaoiLW+L9IuRWLWsncy85PpP7XTLR8vu5402Qo2hh+7VZB/TN4Sm+erZ4tTCbR+Q9SrGLFg6vtPEXtJESGwaSi97JicssH1lBAqWXLvQsQ89tlauUmDXYwWtrr4fg2IISdHixa6YE9dsbVPvlaOHl1ObG2JfGMAxH26wyq/MYFm6pQfveOro5RuUYlOGSGSOr9X87aqBebR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(4326008)(36756003)(86362001)(316002)(1076003)(956004)(44832011)(2616005)(8936002)(6496006)(16526019)(186003)(6916009)(66946007)(66476007)(5660300002)(52116002)(8676002)(478600001)(26005)(66556008)(6486002)(6666004)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1FSMHg2d0Y3VnRZcXI3dHU2MFViUG5uRlhMWklYZENtOHQxWG5IYWR0WjFP?=
 =?utf-8?B?Ykd4eURZZWthRzBSZjQzWlRxcy9vUGliNHR4WE9LYzFFNnk0dTNSVjRVeXJ1?=
 =?utf-8?B?K0ZPRExEdlVvU2dPd1ZvRHJMRlhXKzZvMGJaeHN5ZVQ0Z3FEdU4xYTFUcDJp?=
 =?utf-8?B?RU1kbGxkQml4aVhWRFUrbFhGNEFxZVhZZGRFM01iN1djOGRrWjFWMWc1bCsx?=
 =?utf-8?B?Sm9NeFVENW9QL3RIVzZvQlV4a3U1TUsxNTlZaXQ5M0VZOXR5UCtKS3c2Ynph?=
 =?utf-8?B?RkZHNGJ2V1QyUjJWdk9hUnlFQ1dhSXFFRHNFV2trRGZ6QXVjNVdBUnBzVHF2?=
 =?utf-8?B?NE5yeXpoTUlRaythbTloZklzQy9tVkV2UVlyMWFvWVJoZVlrY0lyRmVtM0hp?=
 =?utf-8?B?V2RiYzRYM2hUVlNVbnlGdGlXLys2WmYvRG83cGo5UlN6WXlSVnhveFl2ZlBl?=
 =?utf-8?B?VjR3TlRCOXEvVEYrYnZRc3ZjZlY1QnpMbDlqNldDbEZNR1hVbFpXa2VmVjRx?=
 =?utf-8?B?cC9GVzMvVU5hYVNqWlh0dmdIbjBMd1dLbyt0aHVnZnhjd0ZSaFNDRDFWUWVF?=
 =?utf-8?B?RUFvLzRRYzBIWGp5aytyckVSL2VOdHIrbTNmV0xrZTYrRVdLWHdhTUNOSm5L?=
 =?utf-8?B?bkd5d3diMGdxT2hoZzJNanZMNjY4WklJbkFaR0dQM3gxam9Rd2NJL1BiZFBI?=
 =?utf-8?B?VXp1ZEpTZ2hsR2NMNzJwWkJLbzBKZC95V0FQRWFsc2ZQTUV0aDRSRklqLy84?=
 =?utf-8?B?VVplaS9PSy9GOG0vSXJDR2IzMTBlUFdKZitPYnFhTHBsK0JtWVE3ZmJuSVAr?=
 =?utf-8?B?bTQzQ2FsTmdGR0ZxZGVIN0hHckF5NElTdDdlYlIxbUpCS09RMjBVQ3kreXR1?=
 =?utf-8?B?UWtWZjFodzNnUGh1VXVFL0JIM1BOdkppRUljbUVxTzlReXBMNlE0RE1nSkRa?=
 =?utf-8?B?cUJwZW9jYnAxVUtyQXNQcW5saXljNnhZZVVrQ1l1VlA0UXZzU3F4MW80Z2Yw?=
 =?utf-8?B?VnFheHFFVG9WM0FCRWJra2FzK0xFQTBsYVpWMHo1aU9LdnpJNkhJeHhBbWdS?=
 =?utf-8?B?Nlkza0wrYTBrdXpyR1BWVFdFM3ArSzV1S2VJV3ZoYTQ0TVJQTktZZHFjS3c2?=
 =?utf-8?B?Zmo4MDZTL1pxcmwrU3dwYjZYclNQMUxOTWtCcVpKMkFYdlN6cEFNNStoemI3?=
 =?utf-8?B?TmtYZTFvWW9uVlU0VE5PbGd2NmlwcWI4ZGpSWlRkMzBEQWJ5WjJucUpLQmxO?=
 =?utf-8?B?N1ZxWTFqYm1ML0hyU3RzK0NjU0g1MUZVMVRqaXpON25vTEhxQWhMK0JXRnJL?=
 =?utf-8?B?ZGdtVS8zN3dyRW56ZlZGZEErd0VqeXoyZG8zalR6enJjUDNNWXQ1bFdUVE04?=
 =?utf-8?B?ZEFpT3VMdkVaVk5BMFhQSjA0YTJWU0IvVjRwM1lvV21GOFNQeDNPU0Roay8w?=
 =?utf-8?B?aVI4VmtHbFFiNFg5N3hOTmU1bUx6UDNyejViYkRwOVpLNWlrb2YvRFp1WGY2?=
 =?utf-8?B?TVZqWjZhVjVxb0R5c0V0Z3ZXaGE2S2c4bWJ3TFpVOENXb2IrSm1BWWFSencv?=
 =?utf-8?B?SVFTMnJqeUdHcW9LVkRud0RLR1BTMkRvQWZ3ejNLTlorbzIvUU5lUU1nTkdm?=
 =?utf-8?B?Nmo2SDlTT1pzL1dNUWpUYzNnREVJamJZNWRaQ3BSM3ZMRGdWSlZxY0pCbVYz?=
 =?utf-8?B?OHdsNXM0ZElGRHQ3UE5nRmppWjEwK3VqZHB1TmlTbWJQQUVIUmhEcHBJUlEr?=
 =?utf-8?Q?BysjU9M7TXp960BeK9BowMsX/iCiavfDC8okxEa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e251e9b4-905d-4b01-6a64-08d8e8f3e7b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:22:33.6943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49f7uOjQyMH/iqlwlQl/tHIzVmwsfLsW4ENNmFXQFGP/NA48uDQU/x1CWvXjxj99j1EVi3V5tbVmF7qurs1qUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3704
Received-SPF: softfail client-ip=40.107.76.42;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e2953e:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-request' into staging (2021-03-16 13:17:54 +0000)

are available in the Git repository at:

  git@github.com:mdroth/qemu.git tags/qga-pull-2021-03-16-tag

for you to fetch changes up to c98939daeca3beb21c85560acede8d3529e363d9:

  qga: return a more explicit error on why a command is disabled (2021-03-16 20:21:47 -0500)

----------------------------------------------------------------
qemu-ga patch queue for soft-freeze

* fix guest-get-vcpus reporting after vcpu unplug
* coding style fix-ups
* report a reason for disabled commands

----------------------------------------------------------------
AlexChen (4):
      qga: Add spaces around operator
      qga: Delete redundant spaces
      qga: Open brace '{' following struct go on the same
      qga: Switch and case should be at the same indent

Lin Ma (1):
      qga: Correct loop count in qmp_guest_get_vcpus()

Marc-André Lureau (1):
      qga: return a more explicit error on why a command is disabled

 include/qapi/qmp/dispatch.h |  4 ++-
 qapi/qmp-dispatch.c         |  6 +++--
 qapi/qmp-registry.c         | 10 ++++---
 qga/channel-win32.c         |  7 ++---
 qga/commands-posix.c        | 47 ++++++++++++---------------------
 qga/commands-win32.c        | 26 +++++++++----------
 qga/commands.c              |  4 +--
 qga/main.c                  | 63 ++++++++++++++++++++++-----------------------
 8 files changed, 79 insertions(+), 88 deletions(-)



