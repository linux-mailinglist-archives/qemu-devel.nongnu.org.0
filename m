Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A83D196B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:51:49 +0200 (CEST)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6K84-0004Fj-60
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m6K6R-0003Tf-Pp
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:50:07 -0400
Received: from mail-co1nam11on20631.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::631]:30209
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m6K6P-0005E5-Cr
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:50:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOzdhFjwNOFt/Zyx/2RXogOT1Hobl+B+JZJjHWMdqgTjb4zhn8hxuIvx88HG+0sf1qFIHh2YlXUC2SSMUWFgnweVh5QklDOzUO1n+k/rlYUtX8ydHd1Bxy4KsrvoX2p8wEq80ppAOJMs7U84G1v97F1EsbOlxaik8qQSL+WHHbLUxszIG8GVW4ZqBXPV+hcQ5ZxEYlXp1Y7bsDo+PtkBJJKziuftzVZPw6M+oTeOz8YFEzYZ8aBFGva+YqcJlPHulKEJgXkRj6p9SLtpHWDOghFcwfB06amU6JkdY47uDxielvm+jYiOIuiUQwxgvlXJKJES5J5zREG2SqR5xR0Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox/w20r5UZGXdrKykQjTy9+ih+UJsR5rw+gL0J49H9s=;
 b=YzlwNeD0Js6IhvB/gNKZFSyLXmi8qr7otbuAEPhIY5dveqJJs9hZQgrvywpXf47QhFzDkoP01jhPd0dLDPeOj/bYNMEAva37pOOkfKmKqShvqfO6S5QoZIeXc+vgMpDwcsH5vm4DV80IsiEnkblIVnHem0sd1c49Fl7/KOS6diVUYIWFXzP1pTdGzOw0nbHwvu4xrdTZ8cnzINkcwA4M4DPpsrNZYCOhhZo5qLXbhuYuUYGFTFyqjKbEbgfUu6Y3XxWAkPjAn0tbyBWWcEQ2o26saZ/0U8B44JSa9y3hoXQsZS9cfXP0ENAObLn8SYzNOfl243590im/sa0Juwt9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox/w20r5UZGXdrKykQjTy9+ih+UJsR5rw+gL0J49H9s=;
 b=P6dYII0eIWQ2Cl87c+tRB1F224CcxTGmDkcrDaQKQRFSp+SvDs+HLOJxc9Efic0+PjjaRw7JuofuhaK1q0mhuJdXg4ZCtfu2rC6vm4DidTQjJjNdc1I+62mmdfdAfur7eZSeF3WT9IfxSNiHGSd5BN02Pg4h7uYP+3yaKAXOZuM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 21 Jul
 2021 21:44:59 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%9]) with mapi id 15.20.4352.025; Wed, 21 Jul 2021
 21:44:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.1.0-rc0 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Date: Wed, 21 Jul 2021 16:43:52 -0500
Message-ID: <162690383252.570555.15179829011211932378@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SN7PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:806:126::10) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SN7PR04CA0185.namprd04.prod.outlook.com (2603:10b6:806:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Wed, 21 Jul 2021 21:44:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c03aaae-058d-4af6-3390-08d94c90c9e1
X-MS-TrafficTypeDiagnostic: CH2PR12MB4197:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4197C67FDF61CB3C4D3E6D3D95E39@CH2PR12MB4197.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPfG/4Ykb782CsKw6uQVeaIDli4GUfXVtyOFh9ht32FnLv2TBQ1SYASJ78vrVtw6CPKLEiTnldZ/G2TSi4VTUA3AKKTKgXT6LCtAJI6YPwahLHPiMNN+Sh4cdAI0LOL+KncwScnjtPBhurTH1SJfU8E4rHhv8r+zO0PDNu0WTaVi5xrrtNtESGMmQIAz6qyeAJoz0/vsjtchz5EamY1+K1vxX3wPKVUedvvpymzdb7B8gebeiSyq4Mo/JhPecOa29j2Q6nBuyrydBeSTUoJCcNBYSG9Pzgs1MbJcTuIhh223IJu9u4wuiPesG75j+ZgBnRqN0X55ngEWUZ0DB3ESivuHllGfzXPJdFt/0KCVss1U4gvWkaKi0oPb0TPhqPOBgYHvyZZWiDazcN620azAugMhCi8kt7kFhNm+7loT09wW5hEhHZXwuuBE2ckFe4u0T8iC3GMV+8oSag/45gh3QNguE2XbdNLpJ/GokARV6PIuK0+r7mzwwfTqZMfhiOEjgXFdO53rz/rmFjMYzkIj2DMBBe8FOMXIy3gQjgr+LcTLY4poRe5cQNEnMypy0hAoxUXqL3YyNGVBZiBqEpKGVjCZ2BhmSnOEDzP9iJ+XhC9ddgC9i6DCChb3sR+vM4eTkql4DpOmIwUbEk/Xr2plurdRUXVNZ4kaHKqEiHWNqAVUqzavgBTz/PxwhHE4559TkmxgeeMVdUTrzBjJ9TRGQK2MYX8hHwIaDoqWjAy/frcZ0+Nv0qIFA9u4PgNqMzOnjpU5HizWfO/CKosPG/SV7EO70wWeS9bZJQE0ECwr8pO5R/5WPCuNG7cg+F+LF0Kx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(186003)(52116002)(26005)(5660300002)(4744005)(36756003)(66946007)(66556008)(6496006)(4326008)(83380400001)(956004)(2616005)(44832011)(66476007)(2906002)(86362001)(316002)(6916009)(6486002)(478600001)(8936002)(8676002)(966005)(6666004)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTdhWmVmZzg2a2F1TDRFNDVVdVdBeXlkcVhKWWdEc2t4WW9kcFJnalAwV1BJ?=
 =?utf-8?B?Nnh6RGhoVWo3Mk5LY2dLbFZkUWpSaER6ckhKaEdhcTU2TE1CZXhZRVdIOVRn?=
 =?utf-8?B?TEhIOVNlUXJXQlRSVGZzdThKVmd4VWJ6N2xtcTJoUHViTkx5Vmx2U0tranJt?=
 =?utf-8?B?VGRVandUV1JEZlpLU1hHNUw1aWt1dk01WndpWFloOExkNjVMU2R2d25STmFO?=
 =?utf-8?B?MWhwZFpHRjF6U0JmTHNGdkRGakxzZS9CamhZK0Z1NHAzTWtDb09ydkNKbG1s?=
 =?utf-8?B?V0RpMFBERmJkMzdOTlZ1blgvbkFEMXVzVzVMMmN4MWhJY1NUb0o5MjJvT1NM?=
 =?utf-8?B?MWdNZzU3ejlwbEUreis4SVMwOTFsVktjMWt1dWV6allzbEFSc3pMS0F0WGx4?=
 =?utf-8?B?VDhSWWdWYVJBSkJYZjA3MWxnZXZ5REdaNlhoTk5oQW1hK01hY2VuVlE2RVRH?=
 =?utf-8?B?NWMzSEdJemZ0SUNrRVJEMHpCUjRabjI0OEFtM1g1cnVnQm90VnIwWkswb1Rm?=
 =?utf-8?B?d3VVMHFzQ0MxNGR5d0NESVZMNW1FOFlsVXRyWWZ4MXpGc3E3c2pKUnMydVpi?=
 =?utf-8?B?SnN3UVpCU1orOGFueWs5L0NvVHExQXJjb3VsaUMzSmRCcnRIMll0MDhHSDYw?=
 =?utf-8?B?Q3J2OHN0SGlBK2JaT2M4L01Kcml3VkpUdWg0bzdTb1U4dGpmL0k2OFJpeVJz?=
 =?utf-8?B?T2F2TmFkbTk3U01jOVhBcE9WZUR6eHMwMlRZNUZUNERGSnIwc2ZWL2Q1bkhj?=
 =?utf-8?B?bVkxbUZ3a1dpOEhvWklUYlB5eGhIaFpMMVMyUXQ3ZVZXcHBsR2JsT2M3VTE1?=
 =?utf-8?B?cGVPZjlaVmdvdDhNRGo5a3k1SjEzWUhjYy8wbXdJN1pxbnBsc0ZvNW1ZY0Na?=
 =?utf-8?B?VUVxeVFreXV4dS82d3pGWkhlRUdVTGZuMXlTSjZlTmhuUCtieXJ4Y0JEaWtz?=
 =?utf-8?B?VGhLWTZrV3c5eVlxVkV1eUNVQXNTMEtYYUpTdTNaTFBDRVhaRm01dXRaTDN5?=
 =?utf-8?B?V3JXekJ6UHNWbkhUNWpGMGhKSUpCY2xjN0xzS3hQem1tV3VjbFNpNGRzZUlw?=
 =?utf-8?B?QVJXcEQvN3JXUnV0N1dMdk1Lck5qVWZPUnYzRXJHeGtPV1BGdTZOQTB6UlJE?=
 =?utf-8?B?QXRmQjU0WHU1VGdlK0NGUzJSbFc2Q2ZqWjF3bnJJR2lvc3gycGJabXBseWJU?=
 =?utf-8?B?eHRkUHViUWFHZmtoOGUxd2ZRMmhMT2tKQ1NHL3llTmpESjBON0pwRTg5ZDRO?=
 =?utf-8?B?NFZGa2I4YzNuMGM1eDc1SlVNK2pQbmYwbG5NT0poT3NtQXUrMzN0Y0N5WEQ0?=
 =?utf-8?B?eWNKVDNFTnB5WEtJRjVYeG53Y2w5cFJuYVBvWFJHYnBzVlZYR2MxWktpcWhJ?=
 =?utf-8?B?a0dWMWVuVXNOVUhLbWppSHlWSkhFalV1R0l0S0hUOXlEemIwbE44Ynp4Qzdx?=
 =?utf-8?B?TWJrelNLQ3lqdFZDNE4rSTZIbVRoRnpBYXBjSGdob042cDdVOUdWQjNGVlpI?=
 =?utf-8?B?REFsRjZmYWkyMHFBY0ZaOFRMSy9sQzlLVWtQblNyYncwcmdWbzVXbkNJczlN?=
 =?utf-8?B?Z3h6cUhCTzFIN1hYY2ZmUUsxNjg0VENuajh5K3Ewc2xZaVhzRXFMZk9tek0w?=
 =?utf-8?B?MUdvL01UbG0rRXJIcWdCQ0VlRm51NHZYeDQ1Ti8weEwvTHVVY0szeDQ1TzZo?=
 =?utf-8?B?YVZ4RVowbzFIb0VYYy9RVTJKT1U5U2Q2S01BY1h4ang2ZVZta0tWVDVGa0E0?=
 =?utf-8?Q?52PuAXiOe9NWPoc2kR6yggsS+mz6zkYbRlaiex3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c03aaae-058d-4af6-3390-08d94c90c9e1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 21:44:59.6901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2vG0TERgYK6bB6DV/gR/P/OqFsJop+nKEFhHTMdvVU5sWRz6gg351YaBfkWaY5i6XK6ylAqdi2TfHHbd7Fyfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
Received-SPF: softfail client-ip=2a01:111:f400:7eab::631;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
first release candidate for the QEMU 6.1 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-6.1.0-rc0.tar.xz
  http://download.qemu-project.org/qemu-6.1.0-rc0.tar.xz.sig

You can help improve the quality of the QEMU 6.1 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/6.1

Please add entries to the ChangeLog for the 6.1 release below:

  http://wiki.qemu.org/ChangeLog/6.1

Thank you to everyone involved!

