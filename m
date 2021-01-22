Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C409830024B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:02:41 +0100 (CET)
Received: from localhost ([::1]:39766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2v9E-0004zB-LK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2v6e-00042h-Gq; Fri, 22 Jan 2021 07:00:00 -0500
Received: from mail-eopbgr10129.outbound.protection.outlook.com
 ([40.107.1.129]:17292 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2v6c-0006Yc-W7; Fri, 22 Jan 2021 07:00:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ/tBF95sEfRkorkfw9TR1HjOo0LmKLyC1HIBBGLWctWyPOOBhzEQnHefxZxdj7Ydye0ehfg7QFplff/gGntThljQf1LjetxvYSByrDcm2jLCp5LwSR/imiPXaYcJkluLGYGErKqh2dZXVCUsWsX+FA0dd70eDt4VELuwTGCs1VE5LPesrBgW6bbnS9cj7oFp0aaqvWCkgLx01ewNWSGmIZ9SQFLbQ3lingbO9+DMzewwqLFre7kE18iTTUlSMuc0eTJnu/e221WP6SYCITZNnrFO+yNwtrvy2Q7SYziDmfMLDp30XLnEEpE/Vw918W1KspGZ5W8FeN71C4nX/kG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nmxc14/8dUYV7pqh5V7EIArDtcO76EVLlg464Y88Aes=;
 b=bd75adPN259oV35qk1VTChkYF63ZJjDZdIbLi0nKp6tVXIPZN/3zPEi4gctSHrHCePkGY82BHuIkw+MdcJByfPsfmU7WDWHaDyfPYByLqWE5nX5rbUrPn15itcpCl/e93mhlyZ+us3+ZkoC/PUUy6AFlRWHJjTgScBrANOu4/Ni8c6HZmBVR285nvbsM2vR6N91PIsOVBMaj1KDh5ULAAFxELu7OgL0DyRh/vM74ajnu1HR7rg0HM93nQtyq2ByV5Ibo9/WjV755zxFP+nModL8HMXN8zw+2pS5AZCQ/lydJhWpwTtxd8yUT6MCq5yg1rsG7O0Q1VK5dlKyYQFC8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nmxc14/8dUYV7pqh5V7EIArDtcO76EVLlg464Y88Aes=;
 b=wP7i6uqLjoUAWMV+vQoZgEK7N4f2ZNKs73lFWNmRhNyb5MbvIxCKk/K6VatytcbW0INBnkSZFzXZJchGq6lQ1yoVmws9jA2Ej+HYBFUl0RvUxAoMyvv0xonUYiH0vVOFNkXKlsrn53cC1HWhdScvEfQ963El05QV2tJcUGnvnUY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5296.eurprd08.prod.outlook.com (2603:10a6:803:eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 11:59:54 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 11:59:54 +0000
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
 <20210122114944.GD15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cdc9c9f4-5ec9-b186-2209-116f9186a9ef@virtuozzo.com>
Date: Fri, 22 Jan 2021 14:59:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122114944.GD15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM8P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::14) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM8P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 11:59:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8597be1c-1d4e-482e-1716-08d8becd3b62
X-MS-TrafficTypeDiagnostic: VI1PR08MB5296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB529695AA99D81044F8B0F74FC1A00@VI1PR08MB5296.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3q0QHf4Yt/dJ27gOlsebiPYNAEWzuBCFJU3W33/9QGVwrJFxKQcjGnRRtxAG4uLzsytdDlwpwYwYX9QpbB6gzwaVii08ntrf0kjTlUJZARllxe0tmVbuse/hVv7tuXCf2HRdyBDV7hmWujL32MMfzgpfN1/RltbYUtalU07VVKXC5F0+Bn+XuDMYUh71GkEf7ijkZ4oLlkmt2QoP1pvR0Ux/npiIU/O/g7Y+gkcXyilpmWVdnfbsWftiwl6pLhZTsU2NTzFHb/q5TPmwDhGnzrnME+TLZECQ9Bo8zwzruQTFn56nZ3v3w/8PRfvOm2aU8B678MLm9nMmDkeEwdfU4wVOizLUk1jZukRv3S4eDv3Sz+rPsdu+a46xszglbhbUcAGf7AVjRX8SgFDWrP7kXztJcJWAXqnqqDUWgnmWnQ/gRRvAHt39uFlVOZGaluijTjPj2WhnIGR4dv5SOq2If1bXzdtN3epypuUfwz3b0f8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(346002)(136003)(376002)(396003)(36756003)(66476007)(16526019)(2906002)(66946007)(26005)(8676002)(316002)(5660300002)(66556008)(956004)(2616005)(6486002)(52116002)(86362001)(186003)(8936002)(31696002)(31686004)(83380400001)(4744005)(478600001)(4326008)(6916009)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3YrRER4djg5VllzVnNiRFlHREFOYUFIZzV6c05LYUo4TU4vaWhmcUxyKzBw?=
 =?utf-8?B?N285K3N5eEE1TGVkbWtzV2hkc1BGaS9BeFZab2JtWVNqU1NOTVdDVWFjWEM0?=
 =?utf-8?B?Ti9DbDNZWklpYlBtRHlIOGR6SWJVVWhxak9WbjRjeFNIL0VEOWtsMkVrNUk1?=
 =?utf-8?B?VisrRlFMeUNwcVp6N2kybjBIc0h5V1hyNnJIbFdJS2VhbmZ4S3MzcGd6Q1dJ?=
 =?utf-8?B?bGVwMW1BWllkalNBemdYUmlydE9ZbUNhSTYzN1h4cUVHWTN5ZUtydXlQSmYy?=
 =?utf-8?B?c2FvallBeXV6Qmt2d3owVVNjWk0vZlpZWVRxTnNlVzlKc1pUVVlGZm96a3RV?=
 =?utf-8?B?ME8wRnhsMVg2UUNRbFFnTUdmbGFKRFI1aVlXNm9ZaWpxN0VacTh5a3FHcVZv?=
 =?utf-8?B?TFBDbCtkN1lISGNQNFVzRnV2MDdsenRYcVdTdnRRZzlSeDBBNTA2aDFGZGJ5?=
 =?utf-8?B?SWwyRnhNdDFOcWxBTDVTTDZQaGQyNWFEM3NPNWRVL2N4QXdwU1dKTStpYjFa?=
 =?utf-8?B?cm1KTTR5czVCWnI0THRNZHZ6cEZtR0plTnZoTXhnNG5WZ0FVYm53c1FyYm5s?=
 =?utf-8?B?VjVISGd3Nk80bFJRU3ROOERYck5Eekwyb3EraDlOYTZiRlM0Vng0eS84S1NM?=
 =?utf-8?B?SnRodEd2QVVlMFQ5MzRlOWlSWjBXMUgyR2dBV0ZGRXI4RElaZUl3RStNUHY3?=
 =?utf-8?B?cFdGTXcvQzlaemJ0elE5RFNKSEdoNG5OdUp6cytseno5V2sxalNDZ1oxTW8v?=
 =?utf-8?B?QlJQMWVUdlpETnhpRTVEc1k3V0R6ampiUWR0MnBpZjNpUk41blc2ZUNtdXJm?=
 =?utf-8?B?M3BIOXlFblBxbXFNSFJFR0IxRXFQMmJnb3pSK1BvQXpUT0NZeXF2MzRhU0hv?=
 =?utf-8?B?MHF6WEtlRlJkRGUvRTV3eG04SklGc0hYWG4waiszSEpOZTdLNEdtalhCdFRj?=
 =?utf-8?B?ditXSmVnQTFUckNSMUxkdmRZRzJXallnRDZOeHJuZThGNEV6OCsrM2FoRjFa?=
 =?utf-8?B?dzVHZzVpeFUxUTAycUhWc1FpVWJ5MGNrZThOeml1Yi9CQ3ViOGJ3TnpzL2U5?=
 =?utf-8?B?T1ZvZXlPOStPYTF4Tm1hVW1hRkNuWVcrcEFIcStteC9NZUxyaFp6aTY3aGdq?=
 =?utf-8?B?L1hmV1BkMXBoektPQ3h2d0JBcnhsR0VLd2JQU0tKcGYxUVBNNUFGSGlQZVg1?=
 =?utf-8?B?ZWEvc2U5ZmYxbHpMRk9WRFNPeGE5aXhrUVhtR3NaNVoyQ1ZKSTJ5L2pLVlpu?=
 =?utf-8?B?TFVScTdtT2lnZDVXbWNpSDEyWVRXZWJYKzhNVWx1aXVxYU9WdnBvaUd2ZVdL?=
 =?utf-8?B?dFZRNTdpMGk2c3ZPTWlJVzlwUW56aktqaFpNck13K1hlOThuZzVrbkI5WlJy?=
 =?utf-8?B?WU5jNVkyVERkY292Rk9tMzVFQ0diUHgvWndFNzlibjlzZ1l1Q2M2OXVZdXl1?=
 =?utf-8?B?Znc5d3RnNzJPYzJTSVFLcVRaUEx6NXIyM25pbkNRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8597be1c-1d4e-482e-1716-08d8becd3b62
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 11:59:54.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbsobM0RwGExGMfM/LcOybwu4laT1zqup+K/J2VP2DU03T6RQD8Bi1EYrrn/5sOzqCsbCPnhVHuSmpWgOubKoriHJIIC+vqYxzWJi3n0aBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5296
Received-SPF: pass client-ip=40.107.1.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 14:49, Kevin Wolf wrote:
> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> +        if 'disabled' not in groups and 'disabled' not in exclude_groups:
>> +            # Don't want to modify function argument, so create new list.
>> +            exclude_groups = exclude_groups + ['disabled']
> 
> Oops, forgot the other comment I wanted to make:
> 
> This would only have been needed if you had turned exclude_groups into a
> Sequence. Now that it's still a list, copying the list isn't strictly
> necessary.
> 

I just think that such side effects (changing function arguments when it is not part of function intention) are better to avoid.


-- 
Best regards,
Vladimir

