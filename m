Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49562DBB3A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:31:08 +0100 (CET)
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQL5-0006Wu-Qj
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQDv-0001J2-R5; Wed, 16 Dec 2020 01:23:43 -0500
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:60446 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQDq-00036r-HA; Wed, 16 Dec 2020 01:23:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY1w67L8aYAfHiIdQV5Bm1IU4LzXYUIgccit/Ti789i3vGRNHeieQBeA24YkmD2rh0lo4S7kxKd8KDWb5k93+5+8fNytlH2gA+w+dKe0fERYnh+hl8qOS0p5J8gzF7o1FG4gdirgdLtCp/zocVlPpEV5Hzy2o0K4+Zab9PM2qK4Vwj/RBJ1SFcNG0Rca6kzG8Ivl2G2jI4trj4zqJBHDxlRdvdX2ZTBMuHreuCygLuTth+F1CPVerDNmBCPMd5yy0NUdu7Hp+THaLxbJ7mT3tBV3HuXFf9q+gbX8rBgLD8SmjXhjfuodcYZUxsVwtze1PtoKzAvCeNxDVoqAByqajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi++YO3r8cgT5mBdMYITqSM5dcBEPD2t8t4aArwMkSo=;
 b=VbiLjGKYxP719pHtOZZWPh2Djc3KoTK1zOXk4WKTq0v4oTSSeHPLM4gAUdiGnIoglLUSnNwopazEvUjKrAdZVlTsmUFxRysMhqCsQYbCP76KzxcyBJvj07QF3J2qNhWHUrHlSBZi7IQL2pNV3ee9U8zgsIYHCEmOKXLJUEMAKQcR3dZf9zQEWR48cbZMubKJ37ZvSBi2++Jn56/H7bAfbOaNmADoaVY9us0AcDHDM7JJsWk9XAye6cgXuw/x3tcyAYuslFUsnGvrvfSsHGfRsgDxj/hjxV/mVqOSskETPbXeF5h/sE0mj7xLy21fCmelJA9Z75/lHVxhKKAwwffyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi++YO3r8cgT5mBdMYITqSM5dcBEPD2t8t4aArwMkSo=;
 b=ea9qtM2seM1AKbhL2sy6omUO8kk+BFd7q3hTZe4GSdWYDTC3/MOXPspY+F0s5ibZyxoh2V5oCW8NKHgqpz7lujpRfMLEgf9LltNhk5UqnIr7ZItGwTsVlCxBXd3qU78ChgQyrFBtA+p97DegIJ9fh+4SurnbFmJTau0cFrw4kKY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 06:23:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:23:35 +0000
Subject: Re: [PATCH] block: report errno when flock fcntl fails
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3bfa50f2-a1f1-0b18-9c15-24de312a810e@virtuozzo.com>
Date: Wed, 16 Dec 2020 09:23:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201215190127.1765595-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR06CA0110.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR06CA0110.eurprd06.prod.outlook.com (2603:10a6:208:ab::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 06:23:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0888ed4c-88cf-41c6-6ee0-08d8a18b1e1b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494AC4471E82DD1A58E11E1C1C50@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vm/YNcUqDAMM8aCHY1oLo43u/BosO9UEm9j7DVfOMv1G0ZYlQmzYC6wcwglnPNGH5Qy1CMODSA6NTH+R4oyhAJagstme8+3R6wTFmHJby/gtD86UjhGOLL0U68qafjbGdG+P5hO9A2N5MZE15yMPVObnTTtMzVOTjhia8SHSQw8PX7NeZl40k7+sXH1oh3hf1UeRfaNPjBsDoH8tp2Fud/3s4XhTYTdHQZtTQ1aq3U8QlEbeaF0EqH6zXkMk4hjGJM+aGX4w9Wp/Y3AGQwD6TFkjdDm6UzkVbK36Q4AWiVEq4PTzAqbt5xN63SaNwdFtb4y7no0P8QPu+Rlq6VhCEfMoW3DKz6eZgtBCpNLSZNj49Hj50etWoHlzW8szh79l1G9mQ7TnNt+7YRVADbMoPKVZBwG1BVUMb8M6nKgXAEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39840400004)(2906002)(4744005)(83380400001)(31696002)(26005)(8936002)(86362001)(66946007)(8676002)(478600001)(66556008)(2616005)(5660300002)(16526019)(66476007)(956004)(36756003)(52116002)(6486002)(186003)(54906003)(16576012)(316002)(31686004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEZCTHpQSDRZY3Z0OXZhbWJyUHZwdW9HVnhVS2gvR1EyaTNBVUUzbE1jWVBp?=
 =?utf-8?B?OThwdVdGZVNKUjBBeURLQlNlY3J1R3Jpa2dsUjhlRTBJRGx2d2UvcmJuN2Zh?=
 =?utf-8?B?M3pLQWdKQkkzZ3B6aEd0blFmcHhZK2tWbllaOUxpMlhEQnplVndvK0RtQTV2?=
 =?utf-8?B?azVzZWtmd1RVeWFVdy9DTmo3UkNvanpRdlIyYWhpZ09XbTlrNFJ2TXI1azBJ?=
 =?utf-8?B?bHRIbDZ6QXZwWEVqTkk1WXJiNjVYdkJqYzlTNTV6Vlh0NGUxcEh1djVUUHNx?=
 =?utf-8?B?STlqK0RUNUpMQWFPNHlYRmE2aWhuSkVSVnA2Q1RMUnVXUFdXYnVWYUNCSm1S?=
 =?utf-8?B?V1E1SWt6czc5QnpZcm1wYkVqUVlvcmpXb2dKaEdSdDlFZmdLRmtmNUFmWkZP?=
 =?utf-8?B?T3lDNlZ0ZDJ0bkpKMlJ2bGh3YXpZZ1VkSkY2WmZ4ZmZuYkhLdHEyZGRMYmk4?=
 =?utf-8?B?TVpLelRrem1xVFlJZ09qUElnOEhIdVN0L1RXdEk0UXdrVnRWMHdYOU1sQnkx?=
 =?utf-8?B?U21VclJjN05namdQbEN3eWpNdVVLSmlQNlNtTE1mbjdIVHV4NnJNZjc5RHJx?=
 =?utf-8?B?L28xQjI4cTA2M0JGeTU3TkdYL3c2NnVmV1ZKNmxQQU1jdnM1cVlqZVA5NEdY?=
 =?utf-8?B?U3hIUEliNTVCV3BHeVVjVVl3SHU4SmRsQmJXUWFOUnJKcW1DOU4yRGNhSHly?=
 =?utf-8?B?SGNBTXpsOURWL1c0eEthS3pTQWhXb2pFV0JzYjJwUjNOeEMvbkJ4UnlBdmVa?=
 =?utf-8?B?bUpwRlRvVVpseHk2QU1PUldIMmF0TVQ4V0UrUko5R1JMQjZsTUt6RTlMUjc0?=
 =?utf-8?B?eFdpZzlZMy9ibWFNa1c2YjFhRnhYeDlYMDUwYzJ1blZocjVoZ3lCeGdhUVdC?=
 =?utf-8?B?ZWtVelF0NnJ4YTJ0eUdKSFRJNFBUZkJOYXRPUmVLQ3dac3l3cjdQNnBENG41?=
 =?utf-8?B?akNZZm5RdUFLcjlvdXp1UXVsRXJxT1ZaOVNUVjdOUDBOVWhDTDR1YW8yb1dI?=
 =?utf-8?B?eGp0Q2pqSWpxSml6Nnd1ekxaNWVqbUkzNW12VllrWEV0dFdXS0ZnSW93VnVT?=
 =?utf-8?B?STVXUExubkZyMGtORFo0ek41aDFFM3VDazQ2aXM2bUdWL05OVjZhMGUyN25w?=
 =?utf-8?B?VFBMUlZzRGozcGRiSXMwODdESEhTeGpNYjZIYnp6NE9CcFp2OUM3aEF0Y2tx?=
 =?utf-8?B?MGV1Z2E1RmhwbWRwbG1iSnVObkRyZmRoZzJHQ3ViVmtlTzZDaVNpSXlaZ01B?=
 =?utf-8?B?bHQvR2k4aGFld3hqRE5LRjlYYWFkUERYbnp4ZnNUby9RMjF2ZTVnb1BlaStR?=
 =?utf-8?Q?mJondrO37AabOVk6apNRLoVL7OYXz/Dp0r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:23:34.9868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 0888ed4c-88cf-41c6-6ee0-08d8a18b1e1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvB4Z1VNq4U6BO6WnCQAN1caADuR85VCAZycPoh0JdEjGUzdEfd+M+QUDHFiesQPJLyd/vEiSdMZukSWvZko7miZX2YEaoWmGpQ/niY+cf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.8.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.12.2020 22:01, David Edmondson wrote:
> When a call to fcntl(2) for the purpose of manipulating file locks
> fails, report the error returned by fcntl.
> 
> Signed-off-by: David Edmondson<david.edmondson@oracle.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

