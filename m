Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63442349B33
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 21:47:55 +0100 (CET)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPWtV-0008L7-SP
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 16:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lPWrs-0007ua-De
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:46:12 -0400
Received: from mail-eopbgr700068.outbound.protection.outlook.com
 ([40.107.70.68]:22585 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lPWrp-00013D-Rv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:46:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAishLk+aTguF7dw+GwKR8ZzbRiCxXANZkUjGAEhfT5MQk2wlhTIR/+lg5e3y9QUi3YfWN3CRdrgwHGpzDSYTrcFUwTG2y75ZYkzQkLOff1GLhIfdQmLAEI/2ED4gmKR4MMBRlgCP1lfnLYpwFeiKeXbGmLEA3lBhnwH0ret7rIa0rz833dLQGkQlcnPpcBH9hphj07h8FOVCn7PFy5IJJO4DEkcyVdfGQSITCL6GbOJrfxhiGQsNWas6888zjAD5T72MEpTH2wqoBAQaiFSt71eQY1YERRYpI1QR2hJAHkKjk3UCAECUAN/KvqGKgSW5WC+CddDIKjyDVN4UrrcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tbaXrCVlDd+aXaMLAc235s0sgks7i745MhdW7I1hmY=;
 b=iYZAWmnBTcJGTVgv5wg2BRxpxndZBwd0ow8lGa1zrKGcho+zajm0X+/Fi7rla2ugCkGa568o+dKse1SCICgnFG5OMJp8o2vaFO4OdkNv1Vt2wogrJ0fcjc0aECK9AuSJEVGqHpAyKxSntmukq7mQWksgG/ENpfLVurZLNYHRahbczZldRBivBnpeAfYkWc6gvKfeBMPfWHWLzXyfzKeBZUSKVy1nuSVwQab+XCsxZ9Ke2k1YlEJHwig1jhRvHzOS95EBcVcClkZxoC9l8Lnr1O69LDd43mIdZraqpHCjQa4du56xi5Ce+QtVoHgheE571S6dX2avuEq7XyXjjgylqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tbaXrCVlDd+aXaMLAc235s0sgks7i745MhdW7I1hmY=;
 b=dNpILauaYBaZtTDZNSHWGpRvLRNp9QLIL37TtCqnPo4IHeIYvRgrgKm/8aDm4G0cUGfP7kXumLbx3Gz722O+ZapHGb7wvUqaVi0dZQNLfL0t69vS7EqjTL99/cTDi2JPPxNhmvI+wvUP/BsnVjun8ZQQBxS8i/xPmYFbvrjP5y4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB3770.namprd12.prod.outlook.com (2603:10b6:5:1c4::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Thu, 25 Mar 2021 20:31:03 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::c9b6:a9ce:b253:db70]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::c9b6:a9ce:b253:db70%6]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 20:31:03 +0000
Subject: Re: Fail to create sev-guest object on 6.0.0-rc0
To: Brijesh Singh <brijesh.singh@amd.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <c0d75038-a48b-6c0e-4dfa-09e9ec4c17d4@amd.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <935d4fa4-09fd-b063-77c3-dc388b662e81@amd.com>
Date: Thu, 25 Mar 2021 15:31:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <c0d75038-a48b-6c0e-4dfa-09e9ec4c17d4@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0501CA0080.namprd05.prod.outlook.com
 (2603:10b6:803:22::18) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0501CA0080.namprd05.prod.outlook.com (2603:10b6:803:22::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Thu, 25 Mar 2021 20:31:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0dd438f-b115-46aa-974b-08d8efcce908
X-MS-TrafficTypeDiagnostic: DM6PR12MB3770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB37705F996726AAF7161691F5EC629@DM6PR12MB3770.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1woq9p9IkuZZBCk45RnPBKP8NgBnObg5DCDqL8YQ+IqZTzelU4d6+NN2p+YU3ToHcjKcwj+P0D81aOyeBLMo+aGCWVXQjrWH1MzgacY7Z91p4gH+0sYWP7Bgl2ptzvp5W3MJwYRhlzz0o9CfyLw5K3CL06hZH1OXC+xNrQhnRh6kxSQAjuv9QxrDgCmsfGnh86e4EJkPmeZyuUNIadfeM9hgSE6TH2gXBOBKi/caBQiyA8KKxdwQRIfeFav2HySqzXpXJ1IEa61VR+RQpK+RqJVB1PzT+RSMVjduNJMhJo7CccjpQ96h5OayROVt6BlUyQnqhuoZHTJAzWRqETd0ouwcNa+3+Xk5b2agKKGHGzGf8hiPqBujCyjt3jx84K94hGKMpHj5FTwRWHVk2fnQeCu9uixpFA/Qg3B9fGF8Bto9m2Se2p33TLpGnUcpty7Q0zflfuJld2kAC0VreAc+Z1OH76zBgNVisbxePPFrnNBtjGnFpezPwdRcj8L8c9ij3tfoTGRdR1CAxyGFNG5aRuNIQOtPIultg3swkRav+LdPOIEZL01Kav4KEE3ALv/Mieg6dtH7LBZgctGIgXe3LXh/xBP7Brg/JGFRViMNqI/jDbN8FKlD8tLR6/BMb0AAu3Cdrgti8h2ZM82gt8g3PvaNWOfRDoEixB4JQuAzRGNmrJOOx09buDC9x7VZCCIxIc8LE+pMye4QFLrCVIc3QjGBJUIPqnTnsi0n8RfHM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(2906002)(8936002)(4326008)(38100700001)(86362001)(6486002)(956004)(66476007)(2616005)(31696002)(66556008)(53546011)(66946007)(16526019)(8676002)(5660300002)(478600001)(6512007)(36756003)(186003)(316002)(110136005)(31686004)(4744005)(6506007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?elhCS1RYcWhYR2FQN0MrSnNrc2MvcXRrVUFlQUNtdm9yL1djeW9rQnlaMHJR?=
 =?utf-8?B?ZTdoakhlUXVlbkVHalJhWmxWaUFMc0Z2aDkzRHFpMmwyWm4yRXVYdTlXcFN4?=
 =?utf-8?B?MmU1T1ltV1FpYnNZOVp1c2c0eFpWQ2RXeWhxMEVwL0d1ZUgwVFliNWpTU3By?=
 =?utf-8?B?ODZmSHJMbFAwN05BRzMwaTB6RnVkbVJYMUxFS3BHMHpONmlPYlN4NXVxMERt?=
 =?utf-8?B?MmNQQ0M1WXAyczZ1NkM0U1Q4V0VaNGlUbFNEeERiWHkvbFhHd3gzZWpSSklt?=
 =?utf-8?B?cEYxYnJBUlBTbFpuZytoTTlaMlR1dTN4N3hGV3RRczZCVDRDa3JBN3lyOEFW?=
 =?utf-8?B?WlZ1WjBrTFRWVDNJNWZGemtoU1llMkY1b1dvWEQ2eUlGQnpNeG52TFJxMVhs?=
 =?utf-8?B?Zk1lSEhoTXFGVWNFT0pDdm41UGFCWFJZTHRGekFBdzF0TSttUVpwbWRDa3A3?=
 =?utf-8?B?clFHT0lwRTJhVGJLL2dxdm9SQzBwNENXYVE5Y3NBZ0E2TnF6M2lRY3cyc0tk?=
 =?utf-8?B?L2k5a3BsMXVpMnErUzVVRm04TnkvejVyMzhaa2d4dFBYbTFRQVp6YWoxMUx1?=
 =?utf-8?B?aFBtcW15VHptZGxaZGErbjRQQ1duMzhnekt3RW1xajc5TkZHTDR1ME16WlZa?=
 =?utf-8?B?R2NoYkJLNmx5VHUvZ3ErdmR4TUFUNFJiRmRnaUoySnFuaFhGbzZ6bEx3eDJ2?=
 =?utf-8?B?VkZ6QjB5Mnd4Y3cySXhzN0duRjZkdW5CYnNsb1FuMmtKWDJiSnlsWnBWVDJV?=
 =?utf-8?B?Y1JYblJzWE9HaXpWZEh0SWZoVHJZb1pWaUFxQVJZVnZmekxOeUdHM2xORW94?=
 =?utf-8?B?QVZjaVFEVHVKWnZCd0FzRGU4Zk9KOGFZeFFlSDZoc2ZZYVpCVzlpNFZURFpC?=
 =?utf-8?B?dXJMTHdXUDM5NHJLdlNIM2ZUZ2xJVWwzUXpFMUJRWGVJbGliU0JucEEwRmUv?=
 =?utf-8?B?eE1vK0dneldDTU03a1M2OEcxa2s1UnFaaFl2bCtKcHFwZWlZLzhWb2RnZk1j?=
 =?utf-8?B?SWN5K09kVWFOM1F1ZmtZbXpuZE5HeVpyZys4cHFKcVFhMitxdjlraTNGdEN5?=
 =?utf-8?B?VkFGSGZzbi9IR2dqbHl1d2c2N1BHbVF4NnAwbVEvQTV5VUhCOFNpUzFOY2hu?=
 =?utf-8?B?SDNXaVNFTEdMazVFU0Q5RTlVQ2NqRkExT3NacnlrZXVUNkw3aS9BVlFPQTZU?=
 =?utf-8?B?MHorMFJpOG1EN05iYWpjTzZrZy9JV2JhZ0Z6OTI4V01vbmpzWU0xU2t2TDJX?=
 =?utf-8?B?ekJUUE03a0NGaUNjcDQ5bzI2U3VvYnR3NEszZXg4YTBvMlFpMzMyTExCK0J1?=
 =?utf-8?B?ZExvWUVMcllJVUNmMFM5S0tjcFpuTFkxOXBOQnUzaDR4bUVSY3U5aUk5MTBM?=
 =?utf-8?B?dWNyb3k2c3hGb0l3NzRaTEZNN2d2S3h2M2NScmM5cmdCUTFGRWUvQ25YTG82?=
 =?utf-8?B?Q2Q4V3pCaGNrUXFpR2hMT08rOUdRb0JqUFpsOXpMY1UzV3FkRDhXVERZZFBm?=
 =?utf-8?B?WVFKeG9XNE4yVHNGYVhLVHpYV09hRnlqbjk1aFVWcVFOWStLY2Z0M2dkVEpR?=
 =?utf-8?B?ZjRrUUx2OEF6cTdha1NFalVoSUpzVTVaNm9NQUxmNHhGMklmbGtReVFENXlG?=
 =?utf-8?B?WEtSR3VBaW5IRjZ3alVKeWJEdW9HRkRwZldyZFRLZ0RKY09FaWdadDVVdDhy?=
 =?utf-8?B?RW51cWFBaktlc3IrUDZFY1RPcml0aUwwTTh1V3o0bHpvL0dhQ1c2U1hUeHE0?=
 =?utf-8?Q?mfN21emX9J4/+fV6sgJvRDQS1jSy5B5pC63PNoV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0dd438f-b115-46aa-974b-08d8efcce908
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 20:31:03.7745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJEmUTrEHuEwbtP02db6jhDxkEAlPgqcwEUDJNHMSwV2ptsnEeViEftY+IzgeoF800KDZABtLDFRQ5dio6L7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3770
Received-SPF: softfail client-ip=40.107.70.68;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 1:51 PM, Brijesh Singh wrote:
> Hi All,
> 
> It seems creating the sev-guest object is broken rc0 tag. The following
> command is no longer able to create the sev-guest object
> 
> $QEMU \
> 
>  -machine ...,confidential-guest-support=sev0 \
> 
>  -object sev-guest,id=sev0,policy=0x1 \
> 
> It fails with "-object sev-guest,id=sev0: Invalid parameter
> 'sev-guest'". I will try to bisect the broken commit but if someone has
> already looked into it then let me know.

I bisected it to:

bc2f4fcb1d ("qom: move user_creatable_add_opts logic to vl.c and QAPIfy it")

> 
> 
> Thanks
> 
> Brijesh
> 

