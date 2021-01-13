Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8912F5090
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:03:14 +0100 (CET)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjY9-0007wf-Ad
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjOF-0007fm-2c; Wed, 13 Jan 2021 11:52:59 -0500
Received: from mail-eopbgr40120.outbound.protection.outlook.com
 ([40.107.4.120]:20704 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjOC-0002hz-Sv; Wed, 13 Jan 2021 11:52:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NulZpx2u3u4sNj2RU6Yo0ECwO0TyPPXuR2xrfuDbd8LmGVv9ReCC7Eb9vn5oxMFVMIVW1l81+DAHbwr3o8fo+ZRohv3ENwBwCp0SU41U3pB9cyetWJ6Bfcb8NYNdmR/nQZTfkr50PB9WJgI6L0MAXtqLFGTvtOCuFCqF+9xOeTp+Wi3nJfaTNW1JPa7GZpHAQFQugX6TluBeIJ+Gw5mQkDAgzws/zO0H9kPWAMd2hvW2K3CIVomhqIV8uyV6Tzq4BoamLomJuaSm1Ej0hwukDGqBGhb5vQnVuFTFKV1xq1LQ052jCVBRdeqpfrrh4NGNaWD8Q78mmePUu8oMQHfvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK6dCpSLVfSJSulI4JUBFhpzItT+9JobkwPaTwjGRKo=;
 b=ZsBAIr6seXBxC/SewDgDzfGTpQaS8lgFSqhpAu+RuhAxmE33CazbLTGEM7CuStWdtd/aors6oMdASpAA4QtboKkiXIbN4Jd/Zx2D/vM/3Ni00milJTJCm6/QQpeOHzOxmRYsBeXYE4N1zQqxpg4Uswg5Awojdfg0lVQGhzI95oYzwZE71waL9442sv7tTo9XKXVIsC+xyIafRWqA6toS4cbera0oYGVNloHQ23QYLgW8+Psdgz4okUE97+AD8v4Al8kzSa0oeomOf63TnRqTMLteNkPeMyuAJweydJXlHSeUBk/TlmUVc1r3EvgNecwfsfLUq0rzw4E2kVuYuIOpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK6dCpSLVfSJSulI4JUBFhpzItT+9JobkwPaTwjGRKo=;
 b=IZrz8lPmziehKxYZRcxs9MaZG/q0iLyr168utOsFhhUe5mnYT6xoxUJHeBda6ocLKLnYSbeI31zq4a074ye+xMxGo/SLuJ6KYwQFDIzZRQww1s2QJjuHF0zwHBSZf9MHGDxoYMD3x74imtCVFNAr6NrMEcoCwpMQW2lUz4gVl2A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Wed, 13 Jan
 2021 16:52:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 16:52:53 +0000
Subject: Re: [PATCH 5/7] iotests/129: Actually test a commit job
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-6-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <de0e8293-c905-3e44-6d5a-59cc64fe4a01@virtuozzo.com>
Date: Wed, 13 Jan 2021 19:52:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113140616.150283-6-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:208:14::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:208:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 16:52:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49b8d5a8-3bd3-44eb-7257-08d8b7e3ab2f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4852:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4852F61FFD293B1C1334CE9FC1A90@AM6PR08MB4852.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SaSx9bS8fdg29IlSUf7wPQ6gjqDFOyr1AasmbEgB0uHq23JLn+UPQkceLQLnODe38lXtb6tHnuZjVtuC0yTjQ1fSJOE94aDz5AimS2DcBufGEa7eC9wKI0aQvE/bONKr/LJTYRvtqLKAubdl8JMWEmnx471iigj1t+p1tCZveViJh6bGVVfxpRQFU0dpeLwwx0AxNAGKUMAeydjtEq9vPO2E6V0QAqHxcmbqRwfOKx+L9H3bp1zSv5oYON7Ks19YEJ6iDcoJD5oc2Dwjr9nyO9thgG4Qg9cTIELIORgWYzSyevn629XU2N/jVvEUX/itTt6Lc1PTX9nbas8JbEVp6Gzb44/1qdek2C9UCKQ9HQqAowADeVvKrwmT5IDJ356itTjN29g/7pgcKtDd1LmCcqWTC+shLM78yDO3LYklnY1n7ufjh52CCWP7WI5uoped3Q4/0rJQbYZa6awbVMuO+J9OGi1oY+KfSeltH5LB90A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39840400004)(136003)(4744005)(31686004)(26005)(956004)(186003)(8676002)(83380400001)(16576012)(66556008)(86362001)(4326008)(6486002)(66476007)(16526019)(2906002)(66946007)(2616005)(31696002)(8936002)(52116002)(36756003)(5660300002)(316002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGo3RldtUEp3elp0VldHZU1lV0k0UzJORkt3QWlqM0ZTcUEvQnlNcGlRVXB4?=
 =?utf-8?B?Vkl6azN1YTRkaVIrcGM1Z0NmWmx5WEZLRUZNT1NiTjBHQ0c3WUNKT0gxVlNL?=
 =?utf-8?B?Z0lnS1NiSjNLMDlEQ1RNOFo1SnJySXVaY05wTjNXVEpFaENmS2tqdlQ5ck83?=
 =?utf-8?B?YkRaK3YvYXhaTUZkOHc4YW9UKzVUbnhYNGJlYWp2Wkx6ZlVkaG42azBpRWdx?=
 =?utf-8?B?eDlqb3ZRdXgxbjJPSkFtR1dwTnRBNGVCQjlaSWkwREFkWDZHUW9BSGJkZ1hC?=
 =?utf-8?B?S3BWRjU1d0ZqaUpUSDF6RmY3TFQ3YW9ZMmwxRWVaT3R3MEQ0QTFjNFlxTEF4?=
 =?utf-8?B?ZFcwMHlBZk5CU0o0TnNZem5uRzVsM3hpUGV0K004U3ZaVUJ4bFlFN2R2ZTAv?=
 =?utf-8?B?UU9iRElkbnJrK3pJSnhtclNqc3U4QVdJdnBNWXhUWEd1ejBPR200bVNERTFq?=
 =?utf-8?B?YWI3SFdiNTFFN1dEbDFDd1BCTmlJSk94L0xGa0s5dHNrSTBpc0czNzRGZld4?=
 =?utf-8?B?NVBPdUpMQmlYTHFuTEFONzJyTmRtSHk5OTNZUGRweWhTTDEzbFMvcGp2WVd6?=
 =?utf-8?B?Zk1TUkFFRnpHaEhUMjlwWGJPUng0T2VXYUZaN3duTWQwWWNXZFFiQlgyZXRN?=
 =?utf-8?B?UzRFdTR5SG4rYmRKNWFZcGZ6bTExMXZLQlE1cnFCSmlOTnpwUzVqWWkwdWJq?=
 =?utf-8?B?Y0RsbndYWk0rbCtwdTBzYlhnUG11c2hJdE5TeXdZc1U0b0xlSldWT2tGcFBl?=
 =?utf-8?B?dGxuQTlSTXN0bWRqQk53SWJxd0MrNVRxc3Zxd09NMThYZHhUeXJVdlNmZlYv?=
 =?utf-8?B?bFZaMkptVFhKZXBQdDBsdDZRVENscnlJclpLR3RVSFFXVnpaYytrZGJMK0Jh?=
 =?utf-8?B?RTNHaFp6ZEdsd1NSWjhza2JDUC9xOTBCcURFRkdQeWM1TkJ3emlUcGhyS3Vh?=
 =?utf-8?B?UTV5cS9LbUZHd1ZFN1NuNFlBRVBQZ29BdUZrWG1sMFRRdGViVjROejUycnBF?=
 =?utf-8?B?NExIUUtCalF0QjFYdnBpamZ4OE5VU055c0xreTFxOFdoWE1rWkt2bzVaK1hF?=
 =?utf-8?B?MHlsTVc2RHlaVnNTSUxINU82Vk1xVFVsTDZZQ1lkdU9HUFV2eVBNZElibkti?=
 =?utf-8?B?dlZIZ2N2RVpKOGtMVzU0d1crWUU0QzlhOXZocUVNd01HZzU1bFVPcitzdW1j?=
 =?utf-8?B?R1hISjM2VDJXT3BKWGlkY0JDdUN3WjV3ME82Y3IvM2ZMTVR6Zk81dFhSVVBO?=
 =?utf-8?B?b01LUHEvd2RHaHZ0cnNEQUN4SnhxMk1ZbnluaWd4MVE4V2VSNTl2dG93bjQx?=
 =?utf-8?Q?oiS49V1Hh8YuMvXx0uLizAQHDdu5PQiWXz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 16:52:52.9661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b8d5a8-3bd3-44eb-7257-08d8b7e3ab2f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YEAlFaWxSd5guEz+ILRDdf2B3gqJw7ScemBgNjcw0IS6BGFCbHL7ceptj4D4to8/qRu3gdJQ2x16yg1ilLMs+vIB7uspRlsCha1r992qsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
Received-SPF: pass client-ip=40.107.4.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 17:06, Max Reitz wrote:
> Before this patch, test_block_commit() performs an active commit, which
> under the hood is a mirror job.  If we want to test various different
> block jobs, we should perhaps run an actual commit job instead.
> 
> Doing so requires adding an overlay above the source node before the
> commit is done (and then specifying the source node as the top node for
> the commit job).
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

