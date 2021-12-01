Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D6465062
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 15:49:03 +0100 (CET)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msQur-0000I8-Un
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 09:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1msQrB-0005qn-Uy; Wed, 01 Dec 2021 09:45:17 -0500
Received: from mail-vi1eur05on2106.outbound.protection.outlook.com
 ([40.107.21.106]:27873 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1msQr8-0002nb-Oc; Wed, 01 Dec 2021 09:45:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHBBZgNazHDy3sHAL8M5XUvo4LutPPodEY0kgpFJLVNIjW5gvz+RNjAAowxb4o5qA3XUtOVAoRtMQhDyer723+/ac/PAAliUjSnMgNWMAOJDg8QuObQnhqMBGjdKK+5QOqM82YZRcXAiCBvU6+UYZLpOq22VGkzt1ZQJHJG+PHsv0wW9IduLEtuOyFFZDYr0oNSbwuOLwE5rQNdJ253AV2dHitmi5z2eWqpW8JkXjxikLOo6v69+WCYA1eHaMMFxTghR9NZkuLEyFIaw2+asJ/a12/Sa0vSmPhhCAGEhRneHb2w3AH8UN+vOY//5cRE0Gm1cUcMqF+KzDFVY0A/c9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuMq+1WiUtxmhKgl0DqtbaoDsxD7/m7EyxL8UI8AzDg=;
 b=lfOrrpAIb322IL5EUWuoqn75BsCyRAA3CBcjl5DfMf03QggyXtrk5PFRqZblgIeoClCJxtjzv63Z/bN0cKQKXamemmMM1aW/9QB/idHIfSJCx3MNuJvhdbkU7Kt4WYxCB79FG3ggaFu09VVf2YA9eruHTmVg54UcECvhvMy/ttDpoiayVQefdutlrsj2qmR4UO0tb5ebDQ/xovlM+ml3o928AuKRduVVY2+Mk3JcUqxYwPsoy8npcmr9yu/h7qJlkaTvn5mUPZq1/s89oNrFditnJBOoeVjswI94xvFy9ogE3Hxyp0hGJiezmGAUadkpQSooQd++cF2ri9XscLXpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuMq+1WiUtxmhKgl0DqtbaoDsxD7/m7EyxL8UI8AzDg=;
 b=g9gum8iBuEAur/aWHlE/ojWh8Wup/IwJX/oW3zqf5JrW/Y/EGFtTXY+JllrqDokUG2HBtKODVn0m66/l42okjsmhvX5fi0vCvQDQ5IglIQDbTo6RwOuYGnDV10WNlMat7ZufT18cqY2nwbF8gZr6iw79SaBKlzpAIB2nLybIoj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4067.eurprd08.prod.outlook.com (2603:10a6:208:130::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 14:29:28 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Wed, 1 Dec 2021
 14:29:28 +0000
Message-ID: <a1706788-2f28-9948-f68f-a6fd51b81fa3@virtuozzo.com>
Date: Wed, 1 Dec 2021 17:27:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits
 cleanly in some corner case
Content-Language: en-US
To: "Rao, Lei" <lei.rao@intel.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211201075427.155702-1-lei.rao@intel.com>
 <Yac8B76dAulyx+2T@redhat.com>
 <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0054.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.179.1] (31.173.85.175) by
 AM6PR0502CA0054.eurprd05.prod.outlook.com (2603:10a6:20b:56::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 14:29:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c939b55a-6762-47c7-2cc7-08d9b4d6fb8a
X-MS-TrafficTypeDiagnostic: AM0PR08MB4067:
X-Microsoft-Antispam-PRVS: <AM0PR08MB406728FBFFDB361E13B5F582C1689@AM0PR08MB4067.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 80TOq1kVK8g3fhMoCIcOzvPSnrs3Qigu5Tg45jzINfgoOJNkTmrc++4CdYzzGHj0FVRCz57GSziuB8SJIQagPqXHR66nkyAnxDbSCWubSiiVl4mpN6LFzpINXsLCqS7o41b2hYkH/F1vGXQ1XABaL1lXdxsDXomuVC7yNwxPCQ2tYGmYCSqASK9JCQRPWlVT8Ra1ZYLCBqrxlfM8rqpqwU+utjxnQwmqfw9NM7fh9sau0lfhPgTULuKXj2XxKoFOU+E9jasTR5uo7F0PM0UbPCqVwmP5XroD1l6I3EPKg9i4caxTXRI7zoMBowqrDCNIU9qc4+0q4MGXvbBF90EKZ4+O8BIimcQ+7xfCKK+tOf5kPHLg8K5VQJAZevRgxXvny1Qb/KELjN3oVppm1J7vIagFdF21/FDI7CtxuUkKNqC+IHVzxzUPqEf3Zs3LLs0BwKBVJX9HzjaSq4tUsakUy+jDObmy5uzahzhBuKMst7UfUalbev49YeILg1Azz9FIy7oIxaP08eN1PExnEw/w2tjgExNnWc0JfRrVnI3MFul5tWOHxvMU/z2UwYEsPsgc63N1QRZRcFqpSvc+6Whl/orx4CzbrdDJOUM3ft5BsQlFTog9jttjLIHLY2mZyQKWprBar2vy7duWXIAQaNroCOv6QASjvNC3IrQwO7+4HwvVZdnrw0BwVFIzPrvhC9NW2dGcdHDjPfiD5n9FllMZ/OiexU6XMV4BI742TXOR36vrXVKF4tfta+TuVit+jzQpoySrAPpHsFZtEw2xdDxx2ytFSiR2TOnUm59Qde/neN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(30864003)(86362001)(54906003)(66946007)(36756003)(4326008)(6666004)(110136005)(2906002)(66476007)(53546011)(5660300002)(316002)(2616005)(16576012)(956004)(31686004)(26005)(83380400001)(8676002)(31696002)(508600001)(38350700002)(38100700002)(52116002)(66556008)(186003)(8936002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODZ0ZDhTWkpNN2IxZjQ3dWh0UFhNQ0xPbGFOVHlvaTFUTHRWc1ZNYTIwNHRV?=
 =?utf-8?B?VEhBekg1bVZuaW5yWi9NUGdnSzJLWEx3M2VQckRqbVlpWUVqNVhCTE9WS09H?=
 =?utf-8?B?N3dNSlhyTnBJY2xjUGs5dmNqUmwzRzNqaHI5c0ZUcFJrbXp6UEZMcHRiV0NZ?=
 =?utf-8?B?TU5tbVRGd2VJM2plSURkcENWSUZ5Y1F3U0FmU3VadVpDWVBvMmNEaXQ1eWt2?=
 =?utf-8?B?MTFSZFFlanI2M0dpb0JORkxSZzYrdUJxWWFxL05HOEV6SEtkR1JRazRLS0Vk?=
 =?utf-8?B?Q3FaQnUvS2RZRktHU2lzT2dFVnVqSmJGUHJNOUhuRi9reHJSUzkvTmdwRHdF?=
 =?utf-8?B?VWdaWDV0clQzZS85eWdkVGxEUnZJRm9vdForT3RvS0JXdzRFeVBaNWlBcXdH?=
 =?utf-8?B?WU5FR1JKeFlGWlRhT1MvQ2hRek5qNHdBNjJVRDlFdXpKVXozamNJcVJPRW1J?=
 =?utf-8?B?enB6S3VDamJqckhRK2RhRGdTU29QTFpmQkxsSWJ0OWRraXNIRXJtNXNGTXhv?=
 =?utf-8?B?V1MzT2psWE9NZEVEUmpzaUxRQ0w2cDdyV29ZS0dxOFhBT3RwR0ZJdEx0dUV0?=
 =?utf-8?B?ZlJHSStTb1NIV3h5RE9vVyt2OU5WSTVJZjd2WUM2cWRjWi9xaUVFeHl1cy90?=
 =?utf-8?B?RjcxZVh5QUNJZm5VVTlDdzZoV0V5VjhvRTlleXB3RGUrdGk4T2p4UFlqQWRR?=
 =?utf-8?B?L0p2MFJtbFJ6WlZkRmZsK3hGdkNjRVFGZmhBaDVPb2lOTUpDTHc4TldXNnF3?=
 =?utf-8?B?b1ZmWHk5THRmK1pvVENjcnFIZmhidkdBSm1oMUxwNTl1dWh6eWFDbmtwcHc1?=
 =?utf-8?B?dnZ6UUpTejZ5THU5ZjRxK01WWThieDJBd3dKNldPNlZzK1FJanVoM0w0VzN6?=
 =?utf-8?B?LzdlVW9EbEZFLzlOUXN1UUJ1RWdwbnVHR00reGV2YVhvbDR3L2NtRHBMSUpn?=
 =?utf-8?B?MldYTm1sb2w2ZUhlTXRySGZnMzk2cUhiOXZ6NmZOcU1lRnQxcm5Tc2lsWHgv?=
 =?utf-8?B?dFdqdGJaZEFpM0REMmJoUGJVWWN0cTgyZjQwTnE5TDRXMHU1T3E2SVNOUjg5?=
 =?utf-8?B?MmFiTWw5amRKVlJMZ2pORy9iWjNiL1RyYndlSCtZSmk0NmRPNHdrUWg4c2hC?=
 =?utf-8?B?elRxSjZpbFF0SXdxcWx5WFQzOG9sYURHZ2cwUExPTHVHNEFrL2x4SHFWT255?=
 =?utf-8?B?eG55WVkydzF6MktPSi9OTkNjdlYzb2JMRHk1MG9vaE81MVVieW9zTHRnb3VQ?=
 =?utf-8?B?OFhoVnNmM3d4Y0NOeGRtSWtEYnNFWnIwT1pPYWhXeEl1UzNkK2pxdHlCYWU2?=
 =?utf-8?B?em80cjRIZzRPUUY4SklYM0RTaWdpVmZ4Q3JyeTdJTElxOHgrYWdjWTJoTlNW?=
 =?utf-8?B?T1hoRThDUXhyLzhTUG9FY2VHdnBNeFlyTzEyK2lHWmVwUHY3SkFCaDJqV3Bu?=
 =?utf-8?B?N1ZJM1pBM3NQa2gvTU1TZVg5T0tsenRFSnBBaHN2R0piTWhrY1FEa1NzcDEz?=
 =?utf-8?B?Sm9UUVdkaVAvRStSLzJRSS9xTGd3WlVMNkdQeDhpeisyM2g4N25RZi96RUt5?=
 =?utf-8?B?OEZmeDNDWTZJOVJQMTFudTB5NHlYa3dpZkpwenBjWEIvd0ltSWhtV0FqVzQ4?=
 =?utf-8?B?NFNYUFl6N2Q5Qzk2Zkhwc2lVL2R1azNXemFtTmo0d3RnSEFXWUZZOE93NE1X?=
 =?utf-8?B?Vmsra1dqbFRueUlpa2ZWNFpNYmI3czB2YjVscGcrV3h0elFhQ3VGbkpiUTZY?=
 =?utf-8?B?WVM4QTBkQzFKSWJrV3JtOFNiSUh6RlBxdEFpdzZNa01POG9kbjBkem9zYUo4?=
 =?utf-8?B?WnlpaEk3SkxJR05vT3ZFUFdPMFZpN1d5K0F4dUpLeHhaRlhvVzdMMytGVVBo?=
 =?utf-8?B?SExIcjgzUjdSb2loYVc0RGJndUg0ZjZFaXVoRnowZlRaenJmbjRKOGJkck1j?=
 =?utf-8?B?UnVscEZIMFNxSUFzMGxWd3JNMjZRT0VFUW1kYzJXT05ITXM5Ni9CbXc2Yjkw?=
 =?utf-8?B?Qk9oK25SY21ML2dYOVRQM3ErZGVnZmZPdnR6bEkyRTZRZGdhUVljMWhCb3lV?=
 =?utf-8?B?U3ZMN2JrazQwOWN2a0hZb2RteCtrRmRvQ3dSL3Q2Qk5XTUVmL0lqSmpIOTYw?=
 =?utf-8?B?NitWUStIK0l1UU9BN3p3MGZ5Y3hnSXNCKytsazJ4TkRwUlJUcWNLT3NHVzIv?=
 =?utf-8?B?WDVlVmhqOHFYSXhrTzJ0UGxvWEl2Z1h5ZWdpSkVERytLQzdTc3llRzFJdmhO?=
 =?utf-8?B?bUorQWhXRlozYVBreEhSeGpOeGVRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c939b55a-6762-47c7-2cc7-08d9b4d6fb8a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 14:29:28.7147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjZOaLpJIRkzGd+Wo5sx6wWs5+J+wN71A4XW99dU847V7ZA6A+ErSYYFUASr6Gqlrn1OYwkaYl+u2Nyi7ZumI3ngNEJjCIgenTOeGQ5pkpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4067
Received-SPF: pass client-ip=40.107.21.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_NONE=-0.0001,
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

01.12.2021 12:48, Rao, Lei wrote:
> 
> 
> -----Original Message-----
> From: Daniel P. Berrangé <berrange@redhat.com>
> Sent: Wednesday, December 1, 2021 5:11 PM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
> 
> On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
>>      We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
>>      The patch fixes as follow:
>>          #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>          #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
>>          #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
>>          #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
>>          #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
>>          #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
>>          #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
>>          #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
>>          #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
>>          #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
>>              at qapi/qmp-dispatch.c:132
>>          #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
>>          #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
>>          #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
>>          #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
>>          #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
>>          #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
>>          #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
>>          #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>          #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
>>          #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
>>          #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
>>          #21 0x00005563d658f5ed in main_loop () at vl.c:1814
>>          #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
>> envp=0x7fff3cf5c2b8) at vl.c:450
>>
>>      From the call trace, we can see that the QEMU main thread is waiting for the in_flight return to zero. But the in_filght never reaches 0.
>>      After analysis, the root cause is that the coroutine of NBD was not awakened. Although this bug was found in the COLO test, I think this is a
>>      universal problem in the QIO module. This issue also affects other modules depending on QIO such as NBD. We dump the following data:
>>      $2 = {
>>        in_flight = 2,
>>        state = NBD_CLIENT_QUIT,
>>        connect_status = 0,
>>        connect_err = 0x0,
>>        wait_in_flight = false,
>>        requests = {{
>>            coroutine = 0x0,
>>            offset = 273077071872,
>>            receiving = false,
>>          }, {
>>            coroutine = 0x7f1164571df0,
>>            offset = 498792529920,
>>            receiving = false,
>>          }, {
>>            coroutine = 0x0,
>>            offset = 500663590912,
>>            receiving = false,
>>          }, {
>>            ...
>>          } },
>>        reply = {
>>          simple = {
>>            magic = 1732535960,
>>            error = 0,
>>            handle = 0
>>          },
>>          structured = {
>>            magic = 1732535960,
>>            flags = 0,
>>            type = 0,
>>            handle = 0,
>>            length = 0
>>          },
>>          {
>>            magic = 1732535960,
>>            _skip = 0,
>>            handle = 0
>>          }
>>        },
>>        bs = 0x7f11640e2140,
>>        reconnect_delay = 0,
>>        saddr = 0x7f11640e1f80,
>>        export = 0x7f11640dc560 "parent0",
>>      }
>>      From the data, we can see the coroutine of NBD does not exit normally when killing the NBD server(we kill the Secondary VM in the COLO stress test).
>>      Then it will not execute in_flight--. So, the QEMU main thread will hang here. Further analysis, I found the coroutine of NBD will yield
>>      in nbd_send_request() or qio_channel_write_all() in nbd_co_send_request. By the way, the yield is due to the kernel return EAGAIN(under the stress test).
>>      However, NBD didn't know it would yield here. So, the nbd_recv_coroutines_wake won't wake it up because req->receiving is false. if the NBD server
>>      is terminated abnormally at the same time. The G_IO_OUT will be invalid, the coroutine will never be awakened. In addition, the s->ioc will be released
>>      immediately. if we force to wake up the coroutine of NBD, access to the ioc->xxx will cause segment fault. Finally, I add a state named force_quit to
>>      the QIOChannel to ensure that QIO will exit immediately. And I add the function of qio_channel_coroutines_wake to wake it up.

If qio_channel_shutdown() can't kill request that is in qio_channel_write_all() - it's not a reponsibility of nbd driver, qio channel layer should take care of this..

Or, you probably need some keep-alive settings set up.

>>
>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> ---
>>   block/nbd.c          |  5 +++++
>>   include/io/channel.h | 19 +++++++++++++++++++
>>   io/channel.c         | 22 ++++++++++++++++++++++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
>> 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>>       assert(!s->in_flight);
>>   
>>       if (s->ioc) {
>> +        qio_channel_set_force_quit(s->ioc, true);
>> +        qio_channel_coroutines_wake(s->ioc);
>>           qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
>> NULL);
> 
> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
> poll() loop. We shouldn't need to add a second way to break out of the poll().
> 
> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
> 

What do you mean by "the NBD coroutine" and by "forcibly wake up"?

In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.

Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.

Also, there is good mechanism to debug coroutines in gdb:

source scripts/qemu-gdb.py
qemu coroutine <coroutine pointer>

- it will dump stack trace of a coroutine, it may help.

Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.

> Thanks
> Lei
> 
>>           yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
>>                                    nbd_yank, s->bs); @@ -315,6 +317,7
>> @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState
>> *bs,
>>   
>>       /* successfully connected */
>>       s->state = NBD_CLIENT_CONNECTED;
>> +    qio_channel_set_force_quit(s->ioc, false);
>>       qemu_co_queue_restart_all(&s->free_sema);
>>   
>>       return 0;
>> @@ -345,6 +348,8 @@ static coroutine_fn void
>> nbd_reconnect_attempt(BDRVNBDState *s)
>>   
>>       /* Finalize previous connection if any */
>>       if (s->ioc) {
>> +        qio_channel_set_force_quit(s->ioc, true);
>> +        qio_channel_coroutines_wake(s->ioc);
> 
> Isn't this code path just missing a qio_channel_shutdown call or a qio_channel_close call to make the socket trigger wakeup from poll.
> 
> I don't think it can solve the bug even if it is added, the reason is as above.
> Thanks,
> Lei
> 
>>           qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
>>           yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
>>                                    nbd_yank, s->bs); diff --git
>> a/include/io/channel.h b/include/io/channel.h index
>> 88988979f8..bc5af8cdd6 100644
>> --- a/include/io/channel.h
>> +++ b/include/io/channel.h
>> @@ -78,6 +78,7 @@ struct QIOChannel {
>>       AioContext *ctx;
>>       Coroutine *read_coroutine;
>>       Coroutine *write_coroutine;
>> +    bool force_quit;
>>   #ifdef _WIN32
>>       HANDLE event; /* For use with GSource on Win32 */  #endif @@
>> -484,6 +485,24 @@ int qio_channel_set_blocking(QIOChannel *ioc,
>>                                bool enabled,
>>                                Error **errp);
>>   
>> +/**
>> + * qio_channel_force_quit:
>> + * @ioc: the channel object
>> + * @quit: the new flag state
>> + *
>> + * Set the new flag state
>> + */
>> +void qio_channel_set_force_quit(QIOChannel *ioc, bool quit);
>> +
>> +/**
>> + * qio_channel_coroutines_wake:
>> + * @ioc: the channel object
>> + *
>> + * Wake up the coroutines to ensure that they will exit normally
>> + * when the server terminated abnormally  */ void
>> +qio_channel_coroutines_wake(QIOChannel *ioc);
>> +
>>   /**
>>    * qio_channel_close:
>>    * @ioc: the channel object
>> diff --git a/io/channel.c b/io/channel.c index e8b019dc36..bc1a9e055c
>> 100644
>> --- a/io/channel.c
>> +++ b/io/channel.c
>> @@ -136,6 +136,9 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
>>           if (len == QIO_CHANNEL_ERR_BLOCK) {
>>               if (qemu_in_coroutine()) {
>>                   qio_channel_yield(ioc, G_IO_IN);
>> +                if (ioc->force_quit) {
>> +                    goto cleanup;
>> +                }
>>               } else {
>>                   qio_channel_wait(ioc, G_IO_IN);
>>               }
>> @@ -242,6 +245,9 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
>>           if (len == QIO_CHANNEL_ERR_BLOCK) {
>>               if (qemu_in_coroutine()) {
>>                   qio_channel_yield(ioc, G_IO_OUT);
>> +                if (ioc->force_quit) {
>> +                    goto cleanup;
>> +                }
>>               } else {
>>                   qio_channel_wait(ioc, G_IO_OUT);
>>               }
>> @@ -543,6 +549,9 @@ void coroutine_fn qio_channel_yield(QIOChannel *ioc,
>>       }
>>       qio_channel_set_aio_fd_handlers(ioc);
>>       qemu_coroutine_yield();
>> +    if (ioc->force_quit) {
>> +        return;
>> +    }
>>   
>>       /* Allow interrupting the operation by reentering the coroutine other than
>>        * through the aio_fd_handlers. */ @@ -555,6 +564,19 @@ void
>> coroutine_fn qio_channel_yield(QIOChannel *ioc,
>>       }
>>   }
>>   
>> +void qio_channel_set_force_quit(QIOChannel *ioc, bool quit) {
>> +    ioc->force_quit = quit;
>> +}
>> +
>> +void qio_channel_coroutines_wake(QIOChannel *ioc) {
>> +    if (ioc->read_coroutine) {
>> +        qio_channel_restart_read(ioc);
>> +    } else if (ioc->write_coroutine) {
>> +        qio_channel_restart_write(ioc);
>> +    }
>> +}
> 
> None of this should be needed AFAICT, as the poll/coroutine code shuld already break out of poll if the socket is closed, or is marked shutdown.
> 
> 
> Regards,
> Daniel
> 


-- 
Best regards,
Vladimir

