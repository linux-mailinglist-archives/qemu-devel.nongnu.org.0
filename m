Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151DA3499F5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:08:58 +0100 (CET)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVLl-00041J-3Z
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1lPVJc-00037b-AJ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:06:45 -0400
Received: from mail-dm6nam08on2055.outbound.protection.outlook.com
 ([40.107.102.55]:43744 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1lPVJa-0004xK-4Y
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:06:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZpDx5U2wUZ5igdzG8Y4+lEDiMHelV4A1B6Kynv2MJNyOpz7CDAfAyBXS/0fFsG6Be6h2gd6TSp0jwfqGAIKt/gLyBohlxsYguWhcmdLx/jQaGb/bAp9oCHAsVKzDSb5mo+6TJPZL4i3JzNrCNprt0DMi3MubLRNCgMj7KXnmxccL73RbexBibrBkzSQLLJTanhkOPsn81U6qijBiygyYgI/CB4kwzCgaG3ZOD5MEA0wMf9UoHAjOVkQzXuyoELjtG9uScSZYKKp5oVgUQVVewNV45mtu+iiB8AFzPrV3RDjoYqEWg+LbSlQ1Zapgy1iBy5+BmyqfOaylwHIRYqljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFi85ps09evkti/cpUop2RkJMaw4GerT9sicF5TmRmE=;
 b=BDIWsLginhwR6oelCvUO0QDwqD77p2x2H0enWj7YiKg+8VVxqSsFPg+sbY/gzX/LqqWBWYX2VaTq5yo4+WfMBeg3TQPXMmghfibLRdJEqLnnQybIVX/N0V1v8UT/Jcp1hn59ywiJ3LMk8eevuduF9QUbQ9DAeUNaE8S5CLZAROd71NiQOaOo1RlHno5T15lV77kWIZvZiI4BYGyHGZVyK/bNugzp6kN+/XrfnGhkcKnkNQMoGVMs25t1Ccs/pbmaHMOiBQBrMb0R0v7YQuQwVh+AITPgUZQ5M+VaYd4Fo1zxRN3mOwdofmXEGsPCwYiaO1nxSX9JqdTRaK/x6ghQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFi85ps09evkti/cpUop2RkJMaw4GerT9sicF5TmRmE=;
 b=pntmaz5whXJDXijJkWvnRUXJ83oyo90PYf28NSHPH9X/AcNfjT1pSZxPAsrFEsWfbuqFqE/tlrk2FraPbiD91erQdPeoxGW9/0YTmwJ4YloykmEj2IqhYQkS2cd8kNhDMoA885QfbAIHmu5nlnzDjRUbL53gfNivhmeILnMEyss=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 25 Mar
 2021 18:51:37 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::30fb:2d6c:a0bf:2f1d]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::30fb:2d6c:a0bf:2f1d%3]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 18:51:37 +0000
To: QEMU Developers <qemu-devel@nongnu.org>
From: Brijesh Singh <brijesh.singh@amd.com>
Subject: Fail to create sev-guest object on 6.0.0-rc0
Message-ID: <c0d75038-a48b-6c0e-4dfa-09e9ec4c17d4@amd.com>
Date: Thu, 25 Mar 2021 13:51:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [70.112.153.56]
X-ClientProxiedBy: SN6PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:805:f2::28) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Brijeshs-MacBook-Pro.local (70.112.153.56) by
 SN6PR04CA0087.namprd04.prod.outlook.com (2603:10b6:805:f2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 18:51:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4604bd6-42fe-415d-f396-08d8efbf04e5
X-MS-TrafficTypeDiagnostic: SA0PR12MB4365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43659480D5E99745D427FF04E5629@SA0PR12MB4365.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWhU0WNejITBhp+0kaFGe2yeuYXf1tHVNtmH0ENkDYySOwDrxYr33Ab4R/TyAo6KnSlLbLPz4VqTTcP8Nqno6l+avZQDXTCw1N1k4DZqV5E/LuCHIPUGBCrrsn07k4DuSPpvbzLwh1TrowxpBgsYa+wQ8r8SwS/4vSj6LnxlxmkDtFvPwDTnvGGaG9Uv31v7Vf78EaPRt1YIE4q6dV9Eim4TjPA4FjLms+bM/BhKYlnl5BsWimx4cZiwdb7164nPSzbNKnpdGKI5G3toeNYlVhayLSqdOwIb7Nk8QwwQllNA5ucsXPtHtgFJz47nmdpoZhtm+FpqtRNfVBOm/J5b8/wUPnKIJqPRWZFLiIkgmm+ggg17zTr1EguLwRZeUH4Xc3cdm0nNSn930t8ymWOo8uR45GTlBqd6Doa9FPslBbBNy8lXcZhiVi+dr6rMARFJTwXpxKvZX6a5QgGXjq2I0j3wvEyYZHj2s3d4i05XOP22HkB5VvK3gjmdHDJCzwbcMNjpvUFn7FsR+ykxtfucFy+iaWIDzVEVTFyiByiHvWm2aTyMwOqjYRMb9Z8Q6zMURFtAckHLJrrbLFBab8jjA7NvPZl9Qh84I0KuzkOvfS0Gqhlut1WIb2Pt49+k4mY6bTy5H2sdGOedY0lekwcldLULnYe1A7PazJiTMHVeyVf01E5W1AIe382F2Y118R1SyawXwbglqPGc7djUx3KH0yJ94wUsdJcMTAFy+so6MHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(6506007)(4326008)(36756003)(316002)(52116002)(8936002)(31696002)(31686004)(86362001)(66556008)(6486002)(478600001)(66946007)(66476007)(8676002)(6916009)(2906002)(38100700001)(186003)(44832011)(16526019)(2616005)(26005)(956004)(4744005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RE92cWZCNHJUNW5wd0gzd21HMGlvaDhpNUlPUmR1RXhQREo5Rit3YlZqN3k0?=
 =?utf-8?B?OWtLTDVQcFFnRW5BUXkvSENxZmFJTVpSUmNBNFpONnBWMGRiajQvd2FoejZQ?=
 =?utf-8?B?Z3BwSlVibVg0RitrUlorY0hlL3ZlV1ZQNmRUK2lIMmpaL1hhc1MxY0VqQnpy?=
 =?utf-8?B?ZStBNDVzbnNLZzFOcll4WmVrci9rK1Y2dWJEWldXeFhoeHoyTFl1YXZ2WkdJ?=
 =?utf-8?B?N01JdTdXZFpzazhJZWRvcG1CSHphTW5ESGFCRHpiSnRpdmtoZjB6L01zT1NU?=
 =?utf-8?B?S0hjNTNNdVhPU3pvcVFlbTMxdFp0OTRJYUR1b3NKTFc2MDRVYlFQRVdqM21G?=
 =?utf-8?B?djNqQ1lNWXBkSFExK2dFaVFEQjZkV2poaUNycmdNTkc4VzVOSWVReW91QzJ2?=
 =?utf-8?B?c3ZxTFk0c1lVRk1CZ3U3SEdyOW83enpua0xNTStibXRpSitxVUJhamxFWEZo?=
 =?utf-8?B?NVZtem1SSk5hV1J4NWh2WmNHellMcis2VDExK05Ea1Bjb2R5QnpSaGk4Y1FV?=
 =?utf-8?B?enlmSlRtakM1NWJhem1yVVZ2TWNUNXpFS25ibjU1cGtIeDNkTXNBY2c3dzI5?=
 =?utf-8?B?ditlWWdBdVZDRnQvRTd3dXBxSEVmNFhnTS9kWk83QXVKNVdjbjJTV3QwdU50?=
 =?utf-8?B?ZndaWGpFcjlxeFNmeTJmRGdWSmVYY3VDa251MjV1NUFSNG9mMWtDaTUxZXdI?=
 =?utf-8?B?b2JsS2FKRS9OVDBaa2p1eHdKR2JjazROZkhsYlZYSTgrMiswRmN0VG4rNE5l?=
 =?utf-8?B?bERWZjFTanBLNFNZa0VPUjdjRS9wU3lVNCtwMDdaUDdJY1FJaURkcWNvV0cr?=
 =?utf-8?B?UVRyM3BPU3N0NDk0UzNQN3dUVWJ5Wk03dHl0cVFiRGpYeDBOTXdhVW5tLytJ?=
 =?utf-8?B?SXRjemRxQVRmbDB5VUE5T2dqUDdocmhRUnN2UlI4Ym1UelRvUVFhek5WNlFG?=
 =?utf-8?B?cWYwL21XVHhEbXJYUlJKL1MveWM3OFFUb2k4bkViMG9lSVkrSXM0WnBWVzdC?=
 =?utf-8?B?L0hrN3FqcVF1WmxXZFNTOG5CT0JyYXdBNXpSS2huTzhPc2tRK2lPOHZ4SWVR?=
 =?utf-8?B?YkEwTFAxSEJxL29EZ0MzYWVrTko0dXhGdlVKZ2E4RnBPaWFtL0ZNZjFHYzVa?=
 =?utf-8?B?SUltRVB6WmE0WU5QWTlseXQ0L2tUU1dYV1F1a25vd0hpakUwTzBROUEwSTd0?=
 =?utf-8?B?ZE9DTnk2bm0vU0FUTmI2czNZY3NOSVpXVVFKYksyeDJ2WUJlSWtQZmNDTnYx?=
 =?utf-8?B?ZGhKUDhBQ3VXZGtpbVBqVFllMXZ4YzVsdEFTRC9MdFJNaFV4TmVEQVpyUy85?=
 =?utf-8?B?bHlSNlNuVlgyV0VGVytNZWpUeVhZN2tjQzJDZ0p5V0tuOU5TUHNLRGxpZFlT?=
 =?utf-8?B?cWwyNnJpanAwL1NTODAwbllyVGpybGE4V0ZPZEc2bnZYSldmUjhRUFhDU05J?=
 =?utf-8?B?NTVoSUh6VVRhUGxXYW1FcmFKK1g2dkpsdUcyL2E0b01SUlNWeXR2bEtIa1NY?=
 =?utf-8?B?NU01VkJmWTRQZmh2eXpOaUVFUHJEY1dGS1VicnBBVHkrZ2ZuKzBSYi9sbEEy?=
 =?utf-8?B?R1p0VGVTYnZKOGdLdCtrZS9uemdnZUJTaU9Yck5mdXBmZVF4K2lWSGlQTTBN?=
 =?utf-8?B?ODZVdTNjY2toN0lYaEJHb21saE9uS3lUZ2tnbWNOR29OdjRFMzc2cm9uWE9D?=
 =?utf-8?B?Nkk4Wi81cGdEWm9hRGR2WTNObXZCWk9aSVZEcCtCYUJYK2ZWb1dtcTZZMWsr?=
 =?utf-8?Q?whGC1E5WILuwttfzqvxwDiiUCA/m9uvwRZWGFRo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4604bd6-42fe-415d-f396-08d8efbf04e5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 18:51:37.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aj1fsVTlgakKKkPc9uJD6hD2TifUQbLgTyVUF5AGwMSSkixS/ltfxRPTqdD7p83JmLve1u+h6BtU9QKGSkoHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
Received-SPF: softfail client-ip=40.107.102.55;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, brijesh.singh@amd.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

It seems creating the sev-guest object is broken rc0 tag. The following
command is no longer able to create the sev-guest object

$QEMU \

 -machine ...,confidential-guest-support=sev0 \

 -object sev-guest,id=sev0,policy=0x1 \

It fails with "-object sev-guest,id=sev0: Invalid parameter
'sev-guest'". I will try to bisect the broken commit but if someone has
already looked into it then let me know.


Thanks

Brijesh


