Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9086340701
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:36:03 +0100 (CET)
Received: from localhost ([::1]:44440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMsok-0005VS-TL
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMslK-0002o8-Lc; Thu, 18 Mar 2021 09:32:30 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:62030 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMslH-0004oC-Bm; Thu, 18 Mar 2021 09:32:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIgSPPzL+wtDrSg6nbTZjPiPW9dtxwnkHtqSx6HQmApL+9QGra8PBpveqNTgAZgIM5Nxtz6J9kbnMQd74vMJRI0nb10Oy/zUBerMju1JlMDykuU09RryvPPYr624++whA5PydM0emoo/d4/DnxE96Pd7QeiBqOMRKu7a3geNgudu7ULKbQosa/uefQg7cqyOVVMXoz67ehxCb/PiQ7gYVPdDwYdK/eeoVukgw/cFBXsBLxXDpDNCJVGXyviIYm/YZuJfqFDZfLeiMtUcxOdcBod31g3C4qC4j9h22H3eaHIaYcpygP/z8U3emwBcNxLIUL40VbUWmxcmo992MGwccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0grSFBjfsvW384dWOHZGEk/aO9YD9XPBUeZb7LFwvyo=;
 b=lthX5PA5YBQBq3uTpGIdZQiVSQ1hIafP6hveTA2rQWLoiahAyg4ywaMjBwa95Wa1euSc8dy2KSYDA39PqwYrYZvyhu0VcnYRIvKDSB5hl+wkL2hFY2h5JohTYjAPwLlTRCRxLqMk4p86ddAttcaob6vr3PKnMDYWnYcBxFMbf/63VMtrHn7PxCNI/3qnVJcvbuO9MWISk+EvYJLyVD72B/8FCL8HUM9Swtl+IjclwQTNV/klUtNNp58m5HCzC2rxeKksyNrs0m01YWmU9zr3vHImz9Igqa89Lma71uO6ExWEsPqYRTW7ddowqKMeavdBt2aoBhM+XwMqrOtLNi0obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0grSFBjfsvW384dWOHZGEk/aO9YD9XPBUeZb7LFwvyo=;
 b=iBZ1HJOOUp1JQibw33ndAaBtaGuWe2Drhx5JPoC/q6teHt/4VYRPfIyPkZopg5S0ZEL9CvdYB7xTFuOu3Bk/oUCRhrKyfBbJJFPkqTGh+lvJQ/eRxeFK9P3xzTOxSgYpZ/fSPHbf4yAUTVLLc6I6eo3p2LZF5lR/HVszU6klGww=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 13:32:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 13:32:23 +0000
Subject: Re: [PATCH v4 1/6] block: Add bdrv_reopen_queue_free()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <187591f3bc69425bb8741fdc4a46f8fbe5b4d36e.1616000692.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d9289944-03ef-d5c3-a3f8-fd4a22f0960e@virtuozzo.com>
Date: Thu, 18 Mar 2021 16:32:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <187591f3bc69425bb8741fdc4a46f8fbe5b4d36e.1616000692.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:208:1::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:208:1::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 13:32:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 927a5074-ac90-4c3f-56cf-08d8ea12432f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471A89065601CB6CD60996CC1699@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZjJLVUbn8REnJsdwAjj+Kkhp1h3mBzwifJWUc78uyBCRylg280v0VaRJXojrFWKCeCTBYdvlJIqQ+xsvl0E8IQojvI24rLBnHbE+X5F8XSK4Lz71kNg6GD7C75VlF+6k4nWFMIpgqbdXuNFQigfm8FOYNL8Q6XlSIVtJt4T8HOJwHlv2OE1WbTIlh1ehcMLXcefpER9GvTxQ0Lpzn+ePruiLMcxwdvE70uIqp2NJ+2qXcgW2Dnyv2//nxqVHNVhsZ7DesdszFbR+7p0wjn9AeleX5rc1RA7l+P/n6jSFyn8ub7RwpOtWqeBWI7XXlzOo5jvzU7j2GBWHhKDg/bhOE6rEtzrjltukBe193CeecjOrEB2Ci/QpOaXjuzyx5RLHbEIERnzErvEsGUCEq3F6b/cGqlIzyH0XF/xmf5VyyJ5+f20fFvgFRMvi216zE+sC3NNMUPq6iK6AcUwtwAipkBQZXB0p0eIoG9bB4kG0WNUP9dz4Q8APWb1aOMHiFZULDdRHa5YwarCljOHEPIuIZHxQW/rMUdQYbipxnL7kna60988fn5nS8k8EftyzRr+KcP/t83dSwrXmu1d9LTkRFhST+n3t7edLXx/3Wo88H77RLBHL7EMtXdhDnNRf8lArjCImolOarHYBivDktlH76CNhj2sHPJpPz1uUjOHZEgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39840400004)(366004)(136003)(16576012)(36756003)(66946007)(2906002)(5660300002)(54906003)(16526019)(478600001)(8676002)(31686004)(26005)(38100700001)(83380400001)(31696002)(186003)(2616005)(4326008)(558084003)(86362001)(8936002)(52116002)(956004)(6486002)(66476007)(316002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZEFTbUxUMFdxUC9NUWQ3bHptNDA3N0thM1dOYW1RTWcxNm1HZDZ3RkhyeE82?=
 =?utf-8?B?cTdPeG94SFE0bGhwTGIxdkJYeW1Nd2pXYUxGSy9tZm5HWEhqM0N3b2tMS0hl?=
 =?utf-8?B?Z2dLVDhtQjN4Z1c0d1kxZmw4M0xldzEzWjRJUW04NkxOUU81RjRwUVNDdUtW?=
 =?utf-8?B?aVNscUNzVDFxR3NGMXdpNUhYZHNVeFhTN0E1Snl1T0o2cmthUTNreW5YRldu?=
 =?utf-8?B?eWViZ29lek5ZanBjVzNjNnFGSWVudFBvamlLRTBuNlpsdXA1eFB0czFodWRL?=
 =?utf-8?B?K3M2V0VlWGxUVXp1Y0NnT3dXS1dYUTNZUGRESGlyRmxPSGRnRVBnMjh4Vktt?=
 =?utf-8?B?VHRhaEZNOEZ2dkdZZno1VGdmTCtSTFN4OUNnMVhBYnUyQjkvRjQ2ZW9WMDcz?=
 =?utf-8?B?RXRmYmVIUVcvT2RlcnNrTzkxZXUvL0NZeXpTR2l0QWIyZktkQ0ZzNjRIZWo3?=
 =?utf-8?B?VGZSNE9PaTlETDRsbldhNXFpS0Naek4vWnFKaTZqcTc5L21wLzJXSmpUTFJ2?=
 =?utf-8?B?WnJNbm9BTitxUlpFcTN1SWt5R1BYOFBLVDdSR2QwMVdjVXpMU3dWaWUybExQ?=
 =?utf-8?B?d0dSYnlreTh4NnBpWnNCMitNNVpLRnpsREc4NHlZbmc4aG4zdHZiRlBnNWpj?=
 =?utf-8?B?cUtZMjAyUGVXZHNLNUlweXQwK2tpVUdpT0FCYUpvSDBXYm1iY0xPd21iaGRE?=
 =?utf-8?B?OXBMaEhqc2NvN2ZKY2g5RjlLUUN4TVFRUXVCZEhWMnN0c2V1c0ZlVmxndTJk?=
 =?utf-8?B?Ly8yRWFVT1JjaHdlVEtCMVgrWTRuZEN3Nm9OTENSd0hFajA4aFA4V0gvZUo2?=
 =?utf-8?B?Tjd2SmowTFFWbFUyTkhxVEVpU0lGQTFLMUFxWmtuV2llZlBadStPY0RjaXZV?=
 =?utf-8?B?WWUwSks4NWZHVmwrOGlPdVBUaXI1dDFOOHIrRVVFS0hTS01hc0lvQzlOWktS?=
 =?utf-8?B?cVZnVGRoOGl1WENqRyt4dTBCbHNUc3lDTGF4S1k1cEhpdXE1Tnc4OW9YQzFF?=
 =?utf-8?B?RFJBZUgxYnhESHVQcXRucFQyb1lIWkYyOFB3QzZSc2RXNHFTQTIycTFMUEpz?=
 =?utf-8?B?bUlPU2J6R3h1K1ZWVUN2UW1HeGh0OFBuWm9VTHBHTDF6dEF5cWJnT1h5Njgw?=
 =?utf-8?B?dlZBbG5yOTlZazM0dlNDR3VHT1BZcEJFSlNkMU1GT3ltUHFLaUVkcnBoNGFX?=
 =?utf-8?B?WGFKbCtDaXl3emhJb3VoTXRHVDcyWEMyT25OQWFtYkhmb1A4UkV6Qjc4NWR2?=
 =?utf-8?B?L3ZlRkpUTUp3cDdEeENLOFdpVEQyb1l3Y0R0YWpYWkFLYkJqV0VBM3hiTFZI?=
 =?utf-8?B?dDhrdXhWQ0kvMTVKVWNEWmJiM2lxb0tTTlFiU2FxRU1oQjh6UTg0c1lFdVY3?=
 =?utf-8?B?ckRuWmJGZEk1S0xoS09sWjBVWi9aTG5vdXZ6YUxLV0t4VmlXcjJzQTZ4UEM2?=
 =?utf-8?B?ei90azhiRFVYSk8rc2x2NXByS1dydmE1NitkK2FqRWQ3Ry9XczF2MTA3T3VQ?=
 =?utf-8?B?RlF1engxU2ZMemRlQjdaYTE4aThrd2Rac0JBOExNWU9RM3dUMVlMdG1QRTdv?=
 =?utf-8?B?ZGVLd0gwK2JNcmRNSEJxM2dIYm9MMk81NGhrMG5RMnFTU1NiSk9PN2lWZ3gy?=
 =?utf-8?B?eTAvMFNtMHVTQytyb1prSi9QbW5WWlB4UENOMnV5TDRFQytiWEovWTd3ZjB3?=
 =?utf-8?B?OGloOVUxbDhNdUw0WFhSbFF5VWVkK1UveFhjblRkTm9QS09nSmRlNnMxQ2k1?=
 =?utf-8?Q?4f4n+L3vGV7Am3BZNcs/3gaRpQY23f9XyNz+Pp9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927a5074-ac90-4c3f-56cf-08d8ea12432f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 13:32:23.2413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9J8/KWI94lZ0Sd20CPlu/jxpvje7URkxFxnd8VuLp8xb+s6jud2YJcIHr5qSgPN9SmUI8svkOJf46pxJzcVLc6B/ckFc+VBmBMnfJx/I7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

17.03.2021 20:15, Alberto Garcia wrote:
> Move the code to free a BlockReopenQueue to a separate function.
> It will be used in a subsequent patch.
> 
> Signed-off-by: Alberto Garcia<berto@igalia.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

