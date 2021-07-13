Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A33C69E9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 07:50:53 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3BJk-0005H8-VD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 01:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BIT-0003Kz-P8
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:49:33 -0400
Received: from mail-bn8nam11on2099.outbound.protection.outlook.com
 ([40.107.236.99]:46657 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BIS-0007xc-D2
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:49:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8dclzpwGOgP5Gf3p/tTN5Uy7/5AMlWgZs/c74SO8PDaTHYew9x676uYnrNmmEtQed9oQJB5QkpavTc5keWKOKca+ucErHtMcAsFKUCED1LxmkAjKasdUPmfGwThXo/UI+/16D1+VjUz4+UeeDpdYuz0fPv499lweuQqzeyGDW4Eko4OXXB9oeTAeLVtRfZSLMvfMrX4B/JH/gSejiPn1X+q8L9pgUBR1dzE3e0hM4dlHdGUL/Aafpy5lL4DY7ljb2ZLGswtxTtiNVGBcdOtwlg/V6fl1WRpIjJE6uXXSwIJsMtKz+rYi0fycxCsXPLTc6OLTsxinJM5qfj+UdRkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi7KWRqcj/ayErPXgIla96wj0z8Ya6yswtF8KzK04Wc=;
 b=U+nlQ+8TqXwpDBmjDyluz1nDe8A0K6WPmlmMCfVAcj/KMaZOCdNe4TNIrzjK+YoHdl5jdfiIP8xkYjF7oBHNT9bKtmI1Sidkye1KTW90U5K37+hnU1j2E+y1jSDWFvaBRm7TkalYnGmBLcGc4gkTh5VCEBr1TJImksnQD9Bidq+/xJfaYXXmGTIDoq1ac3SXEfeifYt1szDcV/9IVP/vv+FTbNzPP0eXWwZ4kqXr65IIdKzSpNzy7XjhEHyjicx4h/Z9HlIx8jtk7pGkwp+MmNtF5zrpxEcTDxkNidmpsZvx8m0ba+UD1wDDMZMpKc2PXCgM/+ZB2so+U/6d4R3XXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi7KWRqcj/ayErPXgIla96wj0z8Ya6yswtF8KzK04Wc=;
 b=lgERrtqItqOVkG2KMb/FA0c5iNhBs+WuTNIpfOqAQhEAbOZsvPQnxEnHeZ74yTEMs+xoBld0dcOeVAGcEnO4CqN/WJFvU5CUoajvVlyOZwjfFLAHqg/e+mBHVLEFTisi1zul5jmK+jS35Kfbn7qSz1rwn9+W/p+u64f75j9QlT4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2285.namprd03.prod.outlook.com (2603:10b6:804:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 05:48:55 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:48:55 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Fuzzing Patches
Date: Tue, 13 Jul 2021 01:48:33 -0400
Message-Id: <20210713054836.154421-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:23a::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:23a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 05:48:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d5d006f-6e31-4160-f626-08d945c1e6ab
X-MS-TrafficTypeDiagnostic: SN2PR03MB2285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2285DA6DA2C2090402EB3D68BA149@SN2PR03MB2285.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KiqzVv7a+BTsuH1faWburppdlt55xgqvK5nd+XvC+P4f2A//ODCNXZmW+gxxcHmXsgGZTEivwUeWc6Jbl4sjhsb9tpKbZ6KkJI57cb7BnJjQFgnho/7PPaIvpzHo9amRdBUAvJfY9WSLS17ukrWcx+trL/caW2CRvJg1qZ7hoM1FY/FWk4UkEzDak1K0GsJr6p46EDX+zFk122XkE/pinW66nGAUX1IKtHhHX3cchLOoApa4ZBNdanU+lN2lGVeniRDo4aaw6hpuDRoRWHqVyb03Eub73RP/SLA1uRFhDUTke48PIQZAXlgdNune1RkmnYShaQYq8P8Ds0WnwjtFXOT/46JWNWuREO/f8ASKcK32tgvZDqrgb/NaZQER0bsUAhnnv0FLCi2owm4fqwDTq5OSj5QVqmqxLOYa85RI7t6SL5IzwV3CqriKK3g2FuYB2/X2UZ9CHS0sNuaFouTRXmDJn+ik6jGwyc45XmODoW3HSjJYZ/iQdByknWrW02fRD5t/o2Q53Gvt2p+14fWvxqjdFKy1532zbOCWNl0zxrbhqeV+Bsg3BkENvak0oGRHKud7qMYLyKEegux+r+4nGnTDODIVQ7RhGzvJesMJRXxp4fHTlhbyPi0vsghQDunGNxzEqjt18CJVhg6IQ6AulZT9yNURfQ65q4Csvgv1etkeGT0XRLpykdigFy+qYfqQK7wo/HgBMQnXjZOZkUCL10wvVry2awXGqkvjmVeUcwfBGjdP8QJxQz1ZDL37XrB443z07B2LkYU+fTprpoGEDajtB1NWd95YyNJQT3o8bCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(75432002)(26005)(8676002)(36756003)(6506007)(86362001)(52116002)(6512007)(4744005)(966005)(38350700002)(8936002)(316002)(786003)(38100700002)(956004)(6486002)(5660300002)(2616005)(66476007)(66946007)(66556008)(4326008)(478600001)(54906003)(1076003)(6916009)(2906002)(83380400001)(186003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5QSXQrOGhHNGJVV3locnd1cEVWNFZTNDJFcDU2bkZLWEZreGhpN1AxczlT?=
 =?utf-8?B?K29qaVFNRnR5ZGJxSHcweTdGK3dUWmlyVHlYNXY2LzFTWHVTSHdYRE1vTFlZ?=
 =?utf-8?B?Ykxra05MNmRtN1UvRHBFN1VIS0c5SE0zbndZOEdzQmtTRm1YOHA2WHgzVlU3?=
 =?utf-8?B?MElkQTl0aVRZc21lOGVvQXF5RDJRYWVvMG5CUDl1Sng0dXlGcG52M1hUS0xU?=
 =?utf-8?B?WHVXSVMvazR0UlRFMWFNSmNwY0FBUkh5c2pSZmc2Yi85WGlaejRNazdFamln?=
 =?utf-8?B?SWc2eW44SCtIdHljVHp5QndiMGkyeXY4MXFIUHlEbTNORS8xSW9QcnFQcTBZ?=
 =?utf-8?B?Y3AzUDlFWm1VMmxCM3dqdVZrT1NtdXRISGR3czB0MjNjNm5OWkhROFpLYXpM?=
 =?utf-8?B?VXR2bFZ4aTZXUHJTLzY4WXBkamgzSnhRdm1FdFFJWG1SakswV2VUSU5aWFht?=
 =?utf-8?B?cW5LVmwwVlRnV1dYRHVseWR1SDlkTTZIQ0lsZnZoU3RkWlh4MExjWHVSd21C?=
 =?utf-8?B?NmlCUXFaL2I2Ly90RHF1R1YyWFFHbC95bEdFblVxaHhrM1BTS3hMN1VvWGo0?=
 =?utf-8?B?L1Q1VlR6TVlMYnZJWnRTazRzOCt4eENTZWNnNkIwMVhnS0ZUeGo0RFJHaERn?=
 =?utf-8?B?OVBTc3BOOElDd1F4Vk50ekRVZTV3aVJ0TGJmeCttcmRZOHY3alc0Y05WS3hZ?=
 =?utf-8?B?SUg5U0dQREJrSlpvd2FuY1YzamluWisxdEZXU0VLTWtpRmF5MFJ3K3hERWp5?=
 =?utf-8?B?WEhoVFZyQ2ZlSmliRHZsb3QyT1REaFdBK1NtVUtiT0FHMWJ1QmkzODdkSmYv?=
 =?utf-8?B?M2F2UXZOdGZhaXBsVm4wWmUwR2l1eXVXcHV2MWMrL3pWRDZlZUVxSlR1eVF1?=
 =?utf-8?B?d0lXQWhobXVKRytleDcwamRuZkRZdVRJbXlJRTNnbllTTWhsWVZTWXRKTzRa?=
 =?utf-8?B?SVhrWWVuZ2M2UGEvb3pGbkZwb1laUlEvUm9mUmE3S1VtelEydHlrN2hiWWtT?=
 =?utf-8?B?Q3BDUkp2UDY0TVl2U00wMS9XQzRhT2U4aE5JYXFqWWVaMUl2Wm1zKzdxd09M?=
 =?utf-8?B?SlFGTmlWZHlNOUwzeVFxaW9Ld0haWDlEMGlYNEVZYmlwMFhLclhqd29ya3ZK?=
 =?utf-8?B?TkJzMUpNVEVrNGdLWTcwK2wwdUw1RXMzeGtueDIxOERjc2NGbmJ0UGxITUp5?=
 =?utf-8?B?RFcySlpCK2prZTlNblJ4bFpUeitxU2pER1hOUFA2UFA5NjN5RlAvbDQrRFpm?=
 =?utf-8?B?ci9NNjJrOS9WNVo0T0lwa0VvZVM1bEMzc1o4U1I5UHlzNTBBZ05XbnRiZ0FX?=
 =?utf-8?B?K2ttYzdJczNVT3Bnd2JOU2ozQWgvR0VHNVJCazVVRXB0RG1FUW5Jdm0veW5L?=
 =?utf-8?B?NzlvVEVsTlFrT0NsZ3VtaTc4Q3R5eDE4OG1EUWEweFkxOXNqem9xUHdGVlZW?=
 =?utf-8?B?bzUrQnVldW1HQWhydElpQzJDWUdGaERNMnVnSTlZeks0cDNSVnJkM0c5ZTJw?=
 =?utf-8?B?dndZVWo0VngxTW4wL2ljN2E2aFZsRThFdUl6MnNGaFptbVJVNDV3bWtHVmYy?=
 =?utf-8?B?RmFoSGtmbytjYmhuekh0dTl6RWxIOTRUQXdjbVFIRGJwNUltM3BXa2I2QXF4?=
 =?utf-8?B?RCthYnRXWlBJSklGbUhuTk52bncxV0g1djF0NGVLNzBDbXMxTjR0ZTZkaHdY?=
 =?utf-8?B?VVNHLzEyMklLcVBXWklYR3hRaExNYWhDQ3ZOa05hcGUxRmxQYTJ1NGRLQm4w?=
 =?utf-8?Q?hhMSCiedkT6uuyHsQNOsD6dljqBlts8O/Dybfss?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5d006f-6e31-4160-f626-08d945c1e6ab
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:48:55.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hqj91Ulf9nrD77z7BnqeYxxEJbQ2d9II1kGQUrAXYWJHyXiCue1tWoIe+c1Lavue
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2285
Received-SPF: pass client-ip=40.107.236.99; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Paolo,

The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu tags/pull-request-2021-07-12

for you to fetch changes up to 3f4a00e1ec2ee9ab34cfbb8a955c3089256b21c2:

  fuzz: make object-name matching case-insensitive (2021-07-12 09:56:13 -0400)

----------------------------------------------------------------
Fuzzing PR for 6.1: Bug-fixes and refined timeout mechanism

----------------------------------------------------------------
Alexander Bulekov (3):
      fuzz: fix sparse memory access in the DMA callback
      fuzz: adjust timeout to allow for longer inputs
      fuzz: make object-name matching case-insensitive

 tests/qtest/fuzz/generic_fuzz.c | 50 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 11 deletions(-)

-- 
2.28.0


