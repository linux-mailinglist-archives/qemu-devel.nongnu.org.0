Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856FD30A343
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:26:25 +0100 (CET)
Received: from localhost ([::1]:39370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6UXQ-0006mG-KD
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6UVu-0006AF-At; Mon, 01 Feb 2021 03:24:50 -0500
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:47072 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6UVr-0000lw-GM; Mon, 01 Feb 2021 03:24:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIyLsmQ8oyGst9GoeD1XdJHLcOuoHMzidBcyH6Weab+xQU7+XmO05O7GTfUDEFWMtlqKd1a1uM27T0ErCUSrGvjD0VLeSpYJFPa6IF1m7Qa1D3GZIthf+PYLqeR3uYGi64t/LU7eGhDkM2o2G35OP7QNZDGCSApjUbWwNVd7PHNdqpibGHV2dZVIKlAoJ1/g07vcOfkXbhEANuvTWyEVh2eAeNjeeIdluzRRcWKPwhS/iYLga3cAZ5Is0QElvR29TEecRUN+PgYmTWIWScciLI5IMuSXwlfg6+EqxHv5DQRIiXqng/cOHQ4hyhI18oWg4pH3y/Sore4DqWCn1mEADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqYAzdYXanuj/W/aEVA6sXPRVphXRQNtyaN1jwYYBHY=;
 b=PfUW5JDd4X7Ok/nYjckgeRK+Y0hxgfBg8+AN+V0vplZqv/daXNIw2Mkhi4UZJVe1VJ+sBm+1pydbuVKFqhf8FSYkF9HtNkmgjY8oYcCMqxe3fAZ5uTXJx4XMNuIw/RfyQveh76OjoN4kwLZ27jnPEsOl0mO3GfUFcRXfjFC6CVT/8mZGFf9Nccp6gR+hGD8D7DoJVcJvZSgkDjG/hdWMfz09tmUr0Vjq9FlV5/F7sSd1mQ9/lb6F7Z6c0NXfs+592CbxNm92rwUarqFZCbyIC+EKpSXNXKQ2xak2ZNYbO9LwiRsHRzeWpn28FiqPZ/OUp61AIMi45k+89OTQovouEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqYAzdYXanuj/W/aEVA6sXPRVphXRQNtyaN1jwYYBHY=;
 b=rkmfOqNnlOGYbeP9m/lts8O5eipg7Ms8Hoy3FvWW3tD5foWTaEEP2uWk5WJcmpMUND4UyVMVtiyNG9/XkDm9VMgAcTP0utb4rD58FA4ZceljlRCDD3wAFpYXrPN96PAnyLxaaDXD82g0/BKGz+HhBXF/ycfjPe3OPwnh3Nkma7E=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Mon, 1 Feb
 2021 08:24:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 08:24:42 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: qemu-devel@nongnu.org
References: <161194144692.29163.3534650626852021194@c667a6b167f6>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <08f2dcd8-57d5-9a02-e7af-33bb300934ef@virtuozzo.com>
Date: Mon, 1 Feb 2021 11:24:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <161194144692.29163.3534650626852021194@c667a6b167f6>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM0PR06CA0087.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM0PR06CA0087.eurprd06.prod.outlook.com (2603:10a6:208:fa::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 08:24:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4082ae9f-87fe-4301-6cc7-08d8c68ad335
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374FC31670448D6F9F8366FC1B69@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/7CqtChLPwfw1y6i+OvVcNXhtzyOOS4pBF51//ANugwTDm+C9SGUR2V8/ACJR88p3GJw4xIF2s5rtl7Pdu1T4YlO7jTS/brIFC1KENo1nwryGOhBFOBCausG3YOoFSuqjx8upLL11dDWTCO5kja7jQpqstlRHZ994LPEBzuDchP9W5TQQTpS2k/OMQhjjPYVxAOOqbTXeNbt/t8F1Ha7awQgjWLN2hSJiYaUO9uEIKECsO03wXB+0YhXLf4Y0Mf0xNWKjuOey2UdB17+T2szywO/D/i7jIn3Jjw5GFpBSTAvdGheyKaj+WVaMMgTimRwb4Ob61Cr2/XHVv5xzn+mi2l/49DVrfT0ljoBatOe/51d+s1hzm4VTEcjcbFIbaRCNITED3ywGYvhSVx7ypGeLLBGTW4oK+PJYX9MAztb0b1M9nOXamWEcTDtBqTelnd4W1pboeRrGmdGBYDFCskRyB637lnj15EKKzkhMI5uMijJnF5I9/q/mqcTwKQJHGg4T7iz6C5WOwOwzgB16UaURL+i5+IE5fv7TnKl9klJdLBn1bANg+2Y4Uth0dMFHEGebOFashz5TqKEkZPYvWr+3ArORl45tyRxzT6BflBmNcEzInSTAJVVk6ds4W2ydTiNl5hE88TPgN1YPcwqZUOqen22IfqY2DzdjXv9ka+nZQDGqhC9dpL70KOUnU2UW5s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(8936002)(83380400001)(52116002)(6486002)(31686004)(16576012)(26005)(186003)(6916009)(31696002)(966005)(86362001)(2906002)(498600001)(8676002)(66476007)(66556008)(66946007)(4326008)(107886003)(16526019)(5660300002)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y29HVzhVby9RQXk3aXRVYnRZVGFEcDV6VjU4ZElRckVoakk4dk9FL3Ftbjhu?=
 =?utf-8?B?SnZaaUJsNThqVEViZzdSSTRJWWZHbVBBeS9LWlNzN1NPV2pjVUtFQkhRcFph?=
 =?utf-8?B?Rm1IUThYUmdVRlAvV25NSFlxQnhXdGVxcVFwY3RYdHNpRTU3czREZzhnTFNr?=
 =?utf-8?B?dFFjZUZONVpLcnNmOStEdzJVaVlJa2VKWjdoeWFVUEtib3lTUVpOM0FIME41?=
 =?utf-8?B?Yzd3QlNNOEs3UUtqTkxzLzhLS2JFdjVTQmpibW1jb2J4Y1BMZDFCd3V1a2dr?=
 =?utf-8?B?OE8zT0RaTlA5cnJ4QVZ4VElJTmhzV1kvdXVRU01hNVBwTHpmak5hWWtrdTU5?=
 =?utf-8?B?Nlc5akxLV2RQV2dGZldWUWE3UDVTWVJjSFpLNmVtVkRFdFBTRmtET215WnA2?=
 =?utf-8?B?ZU5VQnhVZjJFNENKMHlZR1B2Wm85TWRnS1RERkJEcVY5ditZaEFkSkxUTGRQ?=
 =?utf-8?B?bTlIMTRUSk1vVVlLUW1IUDNqdzFLbk02Y0dmR0tpbDR3TTllT1dCOHNsOWJz?=
 =?utf-8?B?TVpqRE0zeU16aFhoK3RNNGFBRVZFbUZIZTZsZ1QyYU8zOWFRcHN4d0F3aVpq?=
 =?utf-8?B?RjEzVVVnZGJ2SmJCQWFxdGpyc28xUko4VEFqL0x5RTJOVjV6MGtmdDRZaUhO?=
 =?utf-8?B?aUR1ZUVSSDlRQWR4UVVDNy9LSDQvb3N3Yy9JeXhLczJUTWg2bmsvczRZS0l0?=
 =?utf-8?B?UW1MMFAwZ2hOMWgxa2RVZVlNMWV6aU5pWGpOVlZkb05oa0tPd3ZIbzUxNVVJ?=
 =?utf-8?B?Y1lOMXEzTWtSYzVjUG9ZYnJDKzJKeEpPOWNENjRrQVYzWVp3WWQvaTBiSjVZ?=
 =?utf-8?B?SEU1UFp2Z2dYMERYZzZDMTQ1dXdCLzMrYmVSNUVxc2dOZHBsampZMDZPRVhv?=
 =?utf-8?B?TnFENitkSVA3NDMzeVBteTVNaHh6YXI1STZZU1hkQ1ZOVm8wa2pMZlMzSU1I?=
 =?utf-8?B?SFo2Smhubm9Uem9YTkRJcTJNN3ZORWxiNit1R3IxL2tIL1RReUk0TEkyc2d0?=
 =?utf-8?B?c2NUdFUybmhoSE1hR2ZwVGVLTnY4cndEa213K2g3WFVZTmZNNG5MTmxLb2Er?=
 =?utf-8?B?TmZUOGIxeTFIM3h1MDV1VG5CUVZkUkkvRnVmSy9CbWtoMUlpQUd4UFh4L2lo?=
 =?utf-8?B?OFBROEpuYlEzQlhvRW9tQnFCTHk3UEhQTTlrU3hhckR5amN4OHpOMDhVdjNw?=
 =?utf-8?B?ejJ5SUl6TGpHSzFJODRJVUxocFdXNVRYM3VxVElScUhsdFI4VEY0RTBpMVd2?=
 =?utf-8?B?TFBiUVFuc3pudFZNWEgzYzRrRXRpV0xCU045UWRIWGJvb1pGcUh6c0U0SGh1?=
 =?utf-8?B?QzNlOTBDb21vRzJmYkRKdzhIK2tzV3FaNFF1ZEVmaFFQcGxqeUtiMGl5ZS9z?=
 =?utf-8?B?d0V2SElmckp5OEduemV4SDRHUFpEdUhIZUZUelRTZCtrTEJTMFNPcEVtY1Nq?=
 =?utf-8?Q?RutopR25?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4082ae9f-87fe-4301-6cc7-08d8c68ad335
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:24:42.6435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VX6CGJf9dA7217OUXMczoVIzKlJrWFeHcDVle7g7dG3Jcxb9BPDnJN6q72pLLi/8FSMuJmX0G5OKqbp7Tl9CRVsrA4XJsLL7/Jg+hPuvxf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.4.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, den@openvz.org, armbru@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.01.2021 20:30, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210129165030.640169-1-vsementsov@virtuozzo.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210129165030.640169-1-vsementsov@virtuozzo.com
> Subject: [PATCH 0/7] qcow2: compressed write cache
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>  From https://github.com/patchew-project/qemu
>     5101d00..3701c07  master     -> master
>   - [tag update]      patchew/20210129110012.8660-1-peter.maydell@linaro.org -> patchew/20210129110012.8660-1-peter.maydell@linaro.org
>   * [new tag]         patchew/20210129165030.640169-1-vsementsov@virtuozzo.com -> patchew/20210129165030.640169-1-vsementsov@virtuozzo.com
> Switched to a new branch 'test'
> d7783a4 simplebench/bench-backup: add target-cache argument
> ddf4442 simplebench/bench-backup: add --compressed option
> 47ee627 simplebench: bench_one(): support count=1
> 2b80e33 simplebench: bench_one(): add slow_limit argument
> acf2fb6 block/qcow2: use compressed write cache
> d96e35f block/qcow2: introduce cache for compressed writes
> 0d009e1 qemu/queue: add some useful QLIST_ and QTAILQ_ macros
> 
> === OUTPUT BEGIN ===
> 1/7 Checking commit 0d009e16280d (qemu/queue: add some useful QLIST_ and QTAILQ_ macros)
> ERROR: spaces required around that '*' (ctx:WxV)
> #25: FILE: include/qemu/queue.h:177:
> +    typeof(*QLIST_FIRST(head)) *qffs_var, *qffs_next_var;               \
>                                  ^
> 
> WARNING: Block comments use a leading /* on a separate line
> #29: FILE: include/qemu/queue.h:181:
> +} while (/*CONSTCOND*/0)
> 
> ERROR: spaces required around that '*' (ctx:WxV)
> #39: FILE: include/qemu/queue.h:501:
> +    typeof(*QTAILQ_FIRST(head)) *qffs_var, *qffs_next_var;              \
>                                   ^
> 
> WARNING: Block comments use a leading /* on a separate line
> #43: FILE: include/qemu/queue.h:505:
> +} while (/*CONSTCOND*/0)
> 


all false positive


-- 
Best regards,
Vladimir

