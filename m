Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8E3E50B8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 03:45:49 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDGpv-00075U-Tj
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 21:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mDGoP-00063O-BS
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 21:44:13 -0400
Received: from mail-sn1anam02on2040.outbound.protection.outlook.com
 ([40.107.96.40]:8018 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mDGoN-0005Vg-9i
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 21:44:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMD8Oc7FmVNwuYxfImFzjbN2czLJwkCdnOAxPOeIX8/VH4P5+5DctOhDgnf25+PKgOJ7gr6B9owSMIUTnz5KzsmBXiVvDBc7YzpKEO91DKGwY6zDON3hc/yPn85KmnJIJ6KKOOWHPFRM8k6WSiWfJNEcBNUEUPVUAfy6vYWhhcvioLzFKyU3YRp03isHyaA3TxJhaa7b8OyBSOtQMq894yCmngAF1QE4I41r/ASjL5/SmNZRIOTwHN/1L9nPRN5IpFqhc6zTqEDJp4pbz85Rlk6glcstyHvOtNr3w5O63SkPXqiRhhkudqA3QL2s2+ybtEsKXVl0FHucWqsrQwY/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJgZrDjLnWocSl2IUBffKRlKRZp0KBcJN3hpLeT/W2s=;
 b=aTkANMKihiGwGJVLo7jVZ1ov13Ul9t7/xZ6PCfan+0x8QpgSLHoGkRyDpC3tjm/aq+sWDCk1YKR5Y8YINqmoCgPMdV4suy0JrmBpwiaW8V1VM0ef/lk0aypiPLYjIML0a7Pzx348Hmft0FAjexgld7WTgaBtBhT6hmEe1apCS3aFovebEO1bQc9iKS8cObwSVT9nYhe7XG1b+07dpoInCuHjdQTPalSU7QIvb9v4SS6L7FVIFtO54AOdBtNC+IVWmKQRK5C072Rr6O4ATZCz5KuvAx5/jAMXp8Y02IiiukEr4yUusBJF0ZgCq2GR9cdD70sqvzNIXfX8GfShhFErPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJgZrDjLnWocSl2IUBffKRlKRZp0KBcJN3hpLeT/W2s=;
 b=M6ZCHBQMwdpTVig+7Vb9desllxZU+2Ezmnbftb/4wURKuZa3DWc+C8KEOJbKfUBJreWCi50tG4XvPV+FmCXFZWBixo4i4z46ahNdF+di+hLI3ckmsjZHuiXsyHnO7lXAh0AeG+7b7C1fDBrZ8ANYUqQScHkv/djazSjqPI1hWx0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 01:43:35 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4394.022; Tue, 10 Aug 2021
 01:43:34 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL for-6.1 0/1] qemu-ga patch queue for hard-freeze/rc3
Date: Mon,  9 Aug 2021 20:39:22 -0500
Message-Id: <20210810013922.215443-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:806:6e::33) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SA9PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:6e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 01:43:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef74c014-fba2-4289-b048-08d95ba04416
X-MS-TrafficTypeDiagnostic: CH2PR12MB4119:
X-Microsoft-Antispam-PRVS: <CH2PR12MB411954646C937939EBD0CF5695F79@CH2PR12MB4119.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHEbJld4ZRr2n1KVkgI+r9/HClXTgsB6qw+iNwGNpEX8XlEjwlNKCSUDudwA5+MLsnEtxaOu9waRFFbjnL0qWd8xVuLoXwNmavJEOyCoDCs8RlGfR+7IDIk4t55GcCd6oOPAwpVTV4CIe4oonOsMpvIJxV42n4hTvUvwTCmksBL4JDOBG26z3C8wthMxd92hjlty3SjzCwmsQ1PxMzMHoj7yw/otyW4QOtCoPADZsZP2ibquxom0lKuuW3z0JJEgJ3EdnzhlCeh3JUc6Khn8tu9OQxyFpfRhtyesP9bAF6tabQKzBj8BBZrh77sQ2e3pS+tzy2U0jEhna72pj3+bPZ/OBdDBMY+6R4e+5hAA7fltDJ9x9fYOn50s9rRYjs3Wg8zP+ofWtKQNyXVgrYM4Fpk74TB3bzEu8G4m2IreKo6EkNgXl5KKw68HPkGRzN9sopPP9dtQkrXgm23BHlZ6vBVPbybjDn0qeET1fteZ3xCRhKBGe73lIk8trzaAV1IRcrMQkySTPikH+aPnoin5PcjYOATBNEnUpMos5f14KkNPN+FXpLO5/JSzbtpQn4tse2Rr6qOk5nzjfUrItWXPmYAOj37qGjO6g2ShuxZA7/GdUmC93cm52n1d3On8preyKLWuVnDBtlnPsZaNfDGdLWBq3DANpW3WRt34qUBm+Qm7Ya8P7m8vhtkYWK+IDMQP44oSHvxB2DgcIoHY8xFbHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(478600001)(6916009)(66946007)(52116002)(2906002)(66556008)(2616005)(38100700002)(66476007)(4326008)(956004)(38350700002)(6496006)(44832011)(8676002)(36756003)(5660300002)(1076003)(6486002)(26005)(6666004)(86362001)(8936002)(83380400001)(316002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1VxT2J6QU9pbmJadW5jcGFPVXFRM0tJcmRZK0ZWVENoaTFUU2R1UG1wNDhE?=
 =?utf-8?B?b0NmWnpFS01tYmltYkpkVFhHcjNuejlIWFgvWitjUm1PU3UwUmF5a1g2T01S?=
 =?utf-8?B?VVd2SzdZM1IvdUVIRnl1aWhIeUNCeWlITzRnb2o4a0lNc2pwUlVEVDBYem9H?=
 =?utf-8?B?VVhYMi9pZDB2OWdReG9Eb1ZmbGFIVXpqNGYzbXlSMFRBRnFLQTBRVTNnem4w?=
 =?utf-8?B?SUtqenlFUnpCODF6WjVQNFZsZU5pYUNiTFJnMDFSR3krMHZuMUErMGpzUzVw?=
 =?utf-8?B?cWNHR1k4WDRId0xwbS9rL2wwdjdVNFE0KzBSS2h4VCtkbS9BVkl4UzRaVE5Z?=
 =?utf-8?B?SzFZZUxlMU5kMEJ0WUswWnZENy83T0ZFcDZMcVNEeGRZWTVvNjd1eG1QM2hG?=
 =?utf-8?B?TXAvRE1rSEpIR3hOTTdlZDhlNE82RlZEVS9OVHA2U2pjRytRdFhNaUNDVEw1?=
 =?utf-8?B?YldtNytFbG1FblYxb0dSNGV1WW1iY0MvMEVnY3FFTGhVWTRCVVRtdHRkeW55?=
 =?utf-8?B?MkNmOGluTDRBRnpSWTNhalBEZERBTGtWMjRwS3U1RE1NNHp0aVVOUHIwNUFz?=
 =?utf-8?B?bUlWSUtxeW1uUElhUVlabmVpdVdiZjkvYXVCMFlaS1dpLzlRbklycGhGKzll?=
 =?utf-8?B?UzRPMG03NXJqVTExZVIzblVzTzRFT0lscCtycHJ5RmErMFZrZHYxUUpBMXFZ?=
 =?utf-8?B?ZnRlN3Vobjh5dGQwS0FqSGNSbm5uTXJMRW9ZcEphamdKcHErOWx4TEVMRGhN?=
 =?utf-8?B?RHMxUlN5MEdWSE1XSmFvOWZ4OVcvSkdBMk9XTzF0R0NNVHFDUHQzMHc2eFlw?=
 =?utf-8?B?OEdLZjJzQjBOdUdKS1RaaFp4L01jZXdEYWdoTzJUbU1aMGFGSXNTOS9reFpu?=
 =?utf-8?B?NWNXeWtqazhvQkVXNmlZbUN1MUZWcHZMNEhFT2JjTSt5SGw0YVRIWWVKM3JV?=
 =?utf-8?B?THk5NkdJVERJMFNQTGRHcVlFVHg1NndWQStiT0hlR2txZ1NYS2NDaHN3Q1c3?=
 =?utf-8?B?aG9MOTdwSDBDd3RTaDVzdFNYbGZnd1JVbTVWa0RLaTNFdUhpQUZ2enpOaGFk?=
 =?utf-8?B?TkNGT3BCdEp5Z0trMis1MDlTRURZU1B6SUFjSXBYdmc3RWRZM09ITEl2cHI2?=
 =?utf-8?B?dGVUTkpEeldZVWh1b1pLeE9IUmpaVFoyT2hldWoyNUxVUFhGdHhxN3dPY1lR?=
 =?utf-8?B?QW11dXVENDJML2w4NGRQVkNweVN3THN0aUdFcTNjbmFCaTlEMDVuTzFNR1lj?=
 =?utf-8?B?U1k3MUJWOERDcHhVV3NBdSt3SHQvMEFud0M3Q256ejVFMUE4OG5hY3JtOUNQ?=
 =?utf-8?B?VDFCQlkxZVdqK3pCQWxnaHNPTlM3M3c0cURhSXAwazVHVkVlb1FWQjVYWXY5?=
 =?utf-8?B?c3VhVXp2WWlRbFJhTWxGbXRBc0x4ZTEvRWl5b3ZXUzhzSmtPc2MwVHl3eC8w?=
 =?utf-8?B?R1BqbkVqU2p0WHh1eGU0M01VTnNNcy9DVlVZVEtrYVg5TUpMVjg2OHpXR2Zk?=
 =?utf-8?B?UE1FUXQ4VmJvVDJMVkJvQzhhcUZidXp5Y015cUVoRHJFRVRUL1VkZUd2UG9a?=
 =?utf-8?B?dzFsT1lWaG5LRzVWU3paS1RZZTAwZ2Y3cVpuUlJnM0QyTG1saHUzOUZvR1Ni?=
 =?utf-8?B?WGpSOUJtVDdDdUlCanBhSFZLdVlzQnVzNDduTHVLcTVWTUpQUTRLeTM2ZmMz?=
 =?utf-8?B?RlBIR2pma1BKOTN2SFZLSFd3RWVoQjdZZUxzb2h4Wis5QkZiNzBaa2xuVnlV?=
 =?utf-8?Q?3IhO2k6wLSJbpfHJgNnLG0IKjDbbaJlbb2en/m9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef74c014-fba2-4289-b048-08d95ba04416
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 01:43:34.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQzS2BqfyDFzejAIJnEGrRlvWc9S3yGwQsP6Iy8F7G7hjKDWGG8b+z4PPpXi8sQAp2diAWYqee4uW454EUMglg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119
Received-SPF: softfail client-ip=40.107.96.40;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

This is a single fix for a potentially recurring memory leak in the guest
agent. If you don't think it is rc3 material I can save it for 6.2, but if
possible this would be good to have in.

The following changes since commit dee64246ded3aa7dbada68b96ce1c64e5bea327d:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-08-06 10:28:33 +0100)

are available in the Git repository at:

  git://github.com/mdroth/qemu.git tags/qga-pull-2021-08-09-tag

for you to fetch changes up to 057489dd1586612b99b4b98d211bf7f0a9d6f0e4:

  qga: fix leak of base64 decoded data on command error (2021-08-09 20:18:43 -0500)

----------------------------------------------------------------
qemu-ga patch queue for hard-freeze

* fix memory leak in guest_exec

----------------------------------------------------------------
Daniel P. Berrangé (1):
      qga: fix leak of base64 decoded data on command error

 qga/commands.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)



