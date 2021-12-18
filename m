Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A822E479AA3
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 12:59:07 +0100 (CET)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myYMk-0003nB-OL
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 06:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYL6-0002NT-T1; Sat, 18 Dec 2021 06:57:24 -0500
Received: from mail-am6eur05on2126.outbound.protection.outlook.com
 ([40.107.22.126]:60897 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYL5-0002DH-C7; Sat, 18 Dec 2021 06:57:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRbBLgsFH+/JwsW8gMv2jVcEFk7dCUlFWpBRDDzgwdaJ0bqp1Zt6ixh0Cjieo2vnXljc0HvhVDyVHsiNO2yVzZ2UO6EXbW/AtdcikQ/JnG9epC0Tez5iSkoeK0w7fkCNjgxmIlokz1evXtK4kiFZJ8HxgyoEVL+GLp/dOivHHwOChfNPG3E/AFt1AjuxJf/r1LfyKzkY4S7WjAe08Qd1XmhUEyySbpipA3B+47FnakRRogv/aOx8/fFhCBECi/yT974KBR6u+Lk5Fo3aSXknYpvqj3LbsDuHkz/oN5U2Kis2a8l6wbDH58Rbdlr2ajZxNz3JZninMGvU+UM0rJ0VNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMz6z2fTL62DZ+p9jn+df8Qct636qhTs5ZsCLxBXKdc=;
 b=JIc9VXI+ndjUN5p/x6mBROixlvTroZuQxZHNqqDbFzDW/RkeDJlaASQUktFXc2qyDzPQ7b7QaYMgJp1cLQtk9nBzjvZHzVXzWfpGw0ZPPK9c6bD6+wl1gAwhaLJXsi1QhyyQljyeHrTToJiEPBTc2rwjWxVSaqPeaNZo0+KAbzWNyzhvHRehHvgQWzhpavMykr6coZap45RghBCNmiHR00smg4XTVrCgUpMUP7VD80913UAytEGfhne/OTynJ3rctPBtmgy2P2Do2n/VybNqviQRLyrwhRNHnhR2T49KGwH08axU8z1zkJyD7qbeaRrWEXQlJ9xzMsF34gSeV7sJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMz6z2fTL62DZ+p9jn+df8Qct636qhTs5ZsCLxBXKdc=;
 b=PMvTF854yzjceXufMBE4PEYIYyRYkyDR91j4XNZWn2j8IAjYDaHiW3eHFeFJMFthh5BCJZncGYKz6d2ZmfTY/10oY5EI4bRS5wUF9EK1v/LGQsLKwzOK38sxTztAMq0zRlN+g21Nzf//DxrNMGNEHcWnmLM3nJvKfEv5J37CruQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5041.eurprd08.prod.outlook.com (2603:10a6:208:162::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Sat, 18 Dec
 2021 11:57:19 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Sat, 18 Dec 2021
 11:57:19 +0000
Message-ID: <496a8b80-ad95-a6aa-bfe8-f0d5a38dbf49@virtuozzo.com>
Date: Sat, 18 Dec 2021 14:57:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 10/14] jobs: protect jobs with job_lock/unlock
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-11-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104145334.1346363-11-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0014.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 18 Dec 2021 11:57:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 896b8853-999d-44b2-be68-08d9c21d8b0f
X-MS-TrafficTypeDiagnostic: AM0PR08MB5041:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB50411032C959E08E86B83016C1799@AM0PR08MB5041.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +L9rADH6vpuODR2a+PgjdFZ085kKgFJdd1FMiOzYn6QiXa/wDzkPpRlz+Njga9Zp/f4AQxUaPRA42LgNlj3WV41cOcy+zxOYr5NjPsd0bZQGEAT0RNe64XzoQcKg3k0Q8yEKd3kFcQE9UA7lF8o2hz8AmWKQTbft9gmPBlwuyuxKe8k4E7PsmeUaJHnn/vfsvAeM5GksCHtMkzsrHhgK1ZaRHAXROde67iq6f8oZo8Jk8zep7BXDFfM2FNbU/Uh1ogaybRESwr51QnVzSQX8Hzw51VijjhlQsU5a3lrF/iLOWKtWTHJioyQ/KbZ9t8OyjDt/LY3qI4qWTD2/HCnvkj84uTIvAXrAi2MEACW5MfWfPI6q2/2QGJr/5uLcEfo3KAcP8t9R9YImjKOetBkYzRa49586JHIKCAlV9YsPs4fIfUYvk7o2QUJ0muA4T8mvc2xJiOOzwn/ltkE2STiVCBOne30zCacj+lRlxU29U6j9WsSLA05XIt8URDR4mXReNJIuIOEUfslcXFcpY+QjyVxvruq/hUD45Fci6Dbefs/A6FafK6xYA8cdUiO6fUpUj+9+WlL3Y0j5rjxur0pT+8pd2+8fyoOnpPfS6lAA2VRDdzAPO6PkUgOX/62H33XKFMKLLjjM74yW4dkiG12ny6W2TwbCG+HMj9nhIxR6Yi7oyko6Q1pnkCXoOeDBFzamtKzLMCtBtBuQZ/MtDdUaBDv3Mwi+HIweU6YKkTxCbrCP9RoRUzd0+dan/hxB8kQGLgM1DjIufQPraBtchSuEyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(5660300002)(8936002)(83380400001)(54906003)(316002)(2906002)(31686004)(66946007)(16576012)(86362001)(52116002)(508600001)(8676002)(66476007)(66556008)(26005)(2616005)(7416002)(186003)(38350700002)(38100700002)(6486002)(956004)(4326008)(4744005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXIvY0VNMlpPZ2NDNlgrRmhQem1pRG84cWFyNWIyWklqRmJPWGt4MiticFFF?=
 =?utf-8?B?RGdlWDdEaEVXMjRCUFBFTGV6QkhKN2xWL09Hcms2bVFnUlZZRWxmRVladTA2?=
 =?utf-8?B?dWJkTEdNSVlnRjhTcjc5MWJSTUtrQ21TWTFIQXRXN05CSmlsaVY3R1VPVlFH?=
 =?utf-8?B?eHF6QUFsTmhQYkNGUjZWWDA1WG8yb2xXeXloR3YxUmg1VkRlanBiQThNU2dC?=
 =?utf-8?B?TnF5N1ZsOVdkVTZwaUtSR3ZRcHBZMFREeUZOVmZsS0ZiM0kzekJib1k3WlRK?=
 =?utf-8?B?L3JLWlBYaVYvUlRReHpWNDIyb1g1c2U4RUduR3FUSk8wY21mTmlZekExUWVw?=
 =?utf-8?B?bWVhM0lVUkhhSE5ESzlzT1IwMkt0dG9JY3gvVmxZcXF5SHlWb1dYcFhmbzFr?=
 =?utf-8?B?Ly9YeTJodS8wOWNNdy9EQUx5Q3RKRTk0THMvL3hiQVUyR1J6OUlGN1VFY1hM?=
 =?utf-8?B?dXBWZmI0eVh5SkhvS3JRcllZVlRXb2IzVC9VeklCWXpJSlEzeFJ4cnF3UGZy?=
 =?utf-8?B?bFdESmpndXFaUGVuOThKMWd2RGp1SC9SRDlkVnlkZUNzd3RzYWdqMWtVR0li?=
 =?utf-8?B?VmJSVHI5V012REttd1NhWkcvaWdIOEtXTUUxMjZwOVVxUEJCWGdRa01VMzdX?=
 =?utf-8?B?ck9FU2hpRXBoOTF6Y1JJMnlBdVVTUDV2YytvVkhPVFBXQzdBQk80QzZ3WDdP?=
 =?utf-8?B?dW5naGYwdjUwSGp6dmJHZldqK1BwWTR6MFVRellKNGdSOHBuSXpRR2lqWVhp?=
 =?utf-8?B?SUlNV3NwQTVwY2dGWkQ4YVBUYmVURFlJR1Fza3FZT3pkeXc2dXdyQ3ZqQnhG?=
 =?utf-8?B?eEtFZkl2TTBGTmxod0FHZU9qYXVYemEzR3p0cHIwWmlzS0x5VTdxeUZ5ZE9n?=
 =?utf-8?B?TWw4aU1GNnZNamVCQnlFMEcxQldqbDd0SnV4UExpUEt1YWRFdHc0dTMvUnVE?=
 =?utf-8?B?ZG81VnNlNSsxZTEzcnAwM1ptbVZmK255NlUraWZMZEl5T1lMYUFvQW1tMG1k?=
 =?utf-8?B?WEltNGltRjN1T3RlT1huZHhvUERvdmh5QUJoazVORTVhQkp5RHFvUzRaUC9z?=
 =?utf-8?B?bWFtMGZ3eEpTQmhFTlJRM05Db1cvOGplcmIzUWxrWnUydERyc1ZWbzJDcmhI?=
 =?utf-8?B?Vk94YzFZb2twYURFdW0rcXBqNzZwd2Jib2cvcnZGR3JEOWhVQW1OTGpkNlpW?=
 =?utf-8?B?ajZiayszV3djUDRFcHV2YU43YTlMRTZFYU5RQU14eElTYUZ1ZStQOWZySUxw?=
 =?utf-8?B?azBtQnphREorNXNObXRWY0FGVS8xN3N5YzJLWDkxQ2Z3MncrY056aTRuUVFp?=
 =?utf-8?B?YVZORUpPWFUxcFN5V0dkMU8rSThuVGpZK0haOUh5TjJUaitsdTZNaVhiNE9D?=
 =?utf-8?B?ckVDZ1pBaHIrMHBjRHBiU1E1RUZad3djODFhZ0t4MkdUK2Foc0o0YmovRytB?=
 =?utf-8?B?RStENzRqYVYrN1kzQ3hXcVloKzRGcWY0QnVsSndJV0J4dktweGw3b0lQQVBH?=
 =?utf-8?B?OW41K0hjWkhrM1VNTlUvMnFVbUp4TUJZT3pnd2NRTWFFcFF4cEFPcld3UnhZ?=
 =?utf-8?B?SWx6NmtPcGpHZTN0ekpBUHROeHJ4Ylo0OVJvMk9LSG51MTBtL2lDclZoUlJO?=
 =?utf-8?B?aHE2N2wyYWgyY3Y1MDYzZkNjMnlMZTBBVW9wTUZ0VngxdHRCNDhnU2F1QmpL?=
 =?utf-8?B?UkJDZStkV2pRdHJWNk16MnJQQjN6bWd5OXFyZ3R6YXVzMGdoUjZzeTRMbkpi?=
 =?utf-8?B?ZkZlUnN4Q1BsVmsrMDViZkJFT21aY25saXp6SDJGRmVWN0xYU0RocXJQZVdk?=
 =?utf-8?B?K3dPLzJHajRVYTErN0l3MU56Z29YUGhjNldpbWkrWGlES1lUeGpORGYyUVUy?=
 =?utf-8?B?bnJCYVFHVkVYbzN0WENHaTcwNjBGZXROV3kyZ3hsWnIrNFpOOW1YL0I5Q2VB?=
 =?utf-8?B?c0w3bkZTN0NxUDhhWlp5RjJJMnVRZVY5eVpiTnVRVStzK1lLU0NQV1hObFZ6?=
 =?utf-8?B?VG81RGFlNTlndWpxem5VVVQwKzJraGJnaDhJUzB5ZzkrK2FjMHFaVERJZHZQ?=
 =?utf-8?B?K1lBTFhrS0x2TlNSd3EyQ29MU3JqWWI4UENJNlE5MGcwbDV5TVpoVy9MZ2w3?=
 =?utf-8?B?Zyt2K2Z4VDhUQVg3eW1NaG9yMHh4ZWU5SktMWEZrRmlXWjg2aGpHQ1RvUGpV?=
 =?utf-8?B?YUNJSXdPWHZ4Sk9FVnBsV0JIYjJFTlg1VFNzL0k0ZUZsU1FEWGtwbFBIbnl3?=
 =?utf-8?Q?Bn4G3/OiRk+Uvsw4+xmlVqmgbtx0SWyVpsYgn7qDEo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896b8853-999d-44b2-be68-08d9c21d8b0f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 11:57:19.3148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1r6WYZW35dGscmmmC3fZh/8FQPzTz0fXOTe2CcfF+8aubnjG0+jeNU/iFdZShHLeUN7rnnB2a0soShmEVA9ojerlUbp98OhD6y0bk9igmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5041
Received-SPF: pass client-ip=40.107.22.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
> Introduce the job locking mechanism through the whole job API,
> following the comments and requirements of job-monitor (assume
> lock is held) and job-driver (lock is not held).
> 
> job_{lock/unlock} is independent from_job_{lock/unlock}.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are*nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

JOB_LOCK_GUARD / WITH_JOB_LOCK_GUARD may be used in many cases

-- 
Best regards,
Vladimir

