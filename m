Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BC4A9775
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:07:38 +0100 (CET)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvVB-0000b7-RS
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuwC-00045m-BF; Fri, 04 Feb 2022 04:31:29 -0500
Received: from mail-db8eur05on2101.outbound.protection.outlook.com
 ([40.107.20.101]:13152 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuw6-0001Us-R7; Fri, 04 Feb 2022 04:31:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXtZ/n1D83fHJC1fIS5gckvK/1bG2uXg+jxUzQin32N2rigAyzGBve6CfoH8lvoPPNbkXFzXCiqVoEDxS0y3TRVoCYkSRkvjbf7jHlFLH5OeYm9HfhxVsJuuaFFt7y/IS+busPEl8s4OrD3XN5jFLDyDCq9YXbssDBgfWhMXkRtpqswbKw/PCF+Pge/BTb5TH35RqFg5NziLi2atRYiAzgnJSH2OLKkHFOa/3cYS5vGrwUEBenzce+/d4BXjj1qm/AN8gDkhC9YKzFq3rjMBPUNAgvCNOg53Y1HMcdMDrETNyg42MXyOh4Wv3MlaCmjthXOTGGn7Wi3tNbxWQfozLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1CaeRWiTAPZzukkwyuYCTOeqCRq66Jp+8S7GKQVZek=;
 b=QbI5hxlJfOa1GndGnWulMXt3+zQ+14a2OQ9UxbkicqaR9Fz68TB52dxNBFEvRtQIsBRpKdZq9j9XDth7C7354Hsxdi3mFg7N2vKAoe/jkmd9iyVsUQtKslrafYzubt5p+EYlb2bSXZJgw3yk+HH87svIAF7fmDbi+IhLzKu13Tga5mm4/iaSn+9qEdjQNdPlMdYg76LegVE6U6GEX0Vgp79BG0qH8rYPlLv+mPBMBBh4qS8pQFIlOyYKArPDH4AFL/R6Qx8IPay3z621ezq3KrHqyw3LmXdOFSC/jyY9ExU4FSAVizkbKLGrVhw1r8hJDN8hnM7/mWAERehwYSwXxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1CaeRWiTAPZzukkwyuYCTOeqCRq66Jp+8S7GKQVZek=;
 b=q+CoPwABIgo9J46bj9/7BVNDRf32WA+y4uMBxuOJX7Opeq95+Ab4ZkHvfuWWXIdgv+WcMVxtSIiXBACSO9TU4hKnQWjIBQt9jrE9snF9G5nzpeAJIJ17c8RnkI1N0Th9ivIJqwk0fH8OsfuOK2F+kub5wblV3foiQxDR5oh8+Ic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB6PR0801MB1944.eurprd08.prod.outlook.com (2603:10a6:4:73::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Fri, 4 Feb
 2022 09:31:18 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 09:31:18 +0000
Message-ID: <f14cfa4b-996a-ab95-919a-0a2329a12621@virtuozzo.com>
Date: Fri, 4 Feb 2022 12:31:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 7/7] iotests/281: Let NBD connection yield in iothread
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-8-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203163024.38913-8-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0026.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::29) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82aba6ad-d243-45a8-5e86-08d9e7c118cd
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1944:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0801MB19445E0FA434869A13D33B0BC1299@DB6PR0801MB1944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idi1q2iTmJ7kZdHSSqbl1cHPHf7jgTfeMWtlPz6hei6m6bv4H0YE/12xMmOBXJ9L23YcywjeBRIJeLLWLOLFCLcqgQBP47GfFp9Lldddh4PWCcH67slg5ru9dFAGTUDRTqIX/og5c81obElOisk8baN5e2DVFL6heqKfV3wa8ug2rAs7BVKN4CJa8A+oMicZk8b5yeDI+A1lQRDrgoC0adEDgqbzRZI4nIsR7lTJqKWvWL8ZeywdqM9M36vnpjmFShaEyhsHLj405lz/akeb0+x3vaHvCEy/qQiUK0328059b4DfytuQoCDLweNOygnBgoorujCkGj/OG4oMfAvUogQKHQqxfxsyWVzFnZ2OTEQFsSTH7t2FPDwwlCQhnEs8fy0iO+WF1tuA2C5rLHmb6oAZ26fwO79dAe3kR5OpaQMd5Yr+bIuCXkkj9G3S+BYg89PbZpqEiioAuVtJGYPNjI/PVkeIq17nDkR2omMgpWbFcXySbbe7DtMlg8CM5Irpi4DVoOVisF1sB2WjpGOTYSqVUcocan2O0/4PUa3tNdhAqnWU2hKcXx9c4HhAyvjkTOv5oi+GAfnopidqQz3AmXxpW9ALpf5tSDgy3Fi7h0+MVRpitYj8XsB3Q5Szh7xzrFNGIgl4rtwiT4zqNX+7ksIB5TK1cSf602i0Z6ynWsTN0i1vHBXaY71e+d/iW8tdRaFJEr01rMbs+zVhdqzTs9i3BZPQ2RcJdT58B+ZWXYqvw5xGAQpJB/8+Asikbnh00bb8+iZsMHOSABj8oMKQUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(83380400001)(186003)(52116002)(2906002)(38100700002)(2616005)(4744005)(6512007)(6506007)(8936002)(6486002)(4326008)(36756003)(54906003)(316002)(86362001)(8676002)(66946007)(66476007)(66556008)(31686004)(5660300002)(508600001)(31696002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3Vwa1o5UGwzVnByaUJlV2FUTzVXQkR0MHFTYXI0Yk1YNHVzQlo5TWRFQ2Vv?=
 =?utf-8?B?STI1bnhEMVpBSGVlL2cwTDBZV3pTb3RCamZxODhRdHZjZTF1M2xGWUpTT3lq?=
 =?utf-8?B?R2dmZVFnQkRNUC9CTlZWNFZRcWdWaVFGV1VSaXBFQWVZOVQzL001dTBXbWtr?=
 =?utf-8?B?a0YyYmhDdjBpWEoxY2FRT252Vll0enA5VThjVFEzSSsxci9VMlFuQ3N5Nm1Z?=
 =?utf-8?B?djhoTHY4UzdORnJOY2NvK3pNR1p1N2gwM2dzL25yVmc5WUR6L2hZR1FTaTFP?=
 =?utf-8?B?WS9YZjY5Y1IwaGk5VER3bi9od0Y4S0Zic3JrU2xmVDZqTDI4b09za20rdUVC?=
 =?utf-8?B?Mnh4THVFSncvaysvOXpWVjd1cHZMK3RjOWJxVk1pcE5UU29UWEJWY3BHd3VH?=
 =?utf-8?B?MEJtczZGNFhFR3ZMVDJ4V3Z0VXByOE9sMCtpYnlndlBCa3JGT3JkY3hsZWdD?=
 =?utf-8?B?Z1JlVDBxZ0hPSDRjcll4dTgxMFlVNm5pOTVaejIxZ0FTTXB0QW9rWXQ2VWlH?=
 =?utf-8?B?MVIwbDFMQVUxNUY0VHVYZ3dzL0diU2FEQ0JVcWozSzJRdEhaVUFMWGRSM3M2?=
 =?utf-8?B?MlhQMXJNRFIwK3YzSnhKekE0eGFaaFVWZnI5b204MC9pQXQyZmRnL3NGVGpB?=
 =?utf-8?B?NUl0SUN3d3dMSE8xN2kzTXpoeTBDTnhvUUlDaTBiMEUyb3V6K2JGejVHVUdC?=
 =?utf-8?B?OUVETGlpeDBVakIrVDRSeHFUWDM4S1RrTzVNQ1pxN21NREd1QXd5ZitnNzYw?=
 =?utf-8?B?VjdreUo3YitwemRBS2d5bUVaKzRUdTlQVzFZWlRoYm1xcHBqemZiUXV4SzE2?=
 =?utf-8?B?SjM5MkY5V3IxM3puWkFEengrTFNLOHo5YU9zMk9Sb0VpVWdxaytacU9CR2Jm?=
 =?utf-8?B?b1NmcEtPaWphb0cwYjNjaFUwQ0lHOU5oeTlFcWVjZitUOVpsSElSVFh5dWky?=
 =?utf-8?B?cEVVRDBkSFJOYmdxbms5OEUzRE5WMlZWejdqWFBtNm1TYlBTK1c0a0Y3OHp6?=
 =?utf-8?B?NW5HKzJFSXZsaENRazZ6cU1YUWhRMnE3UTNHOW9VNGJSWE1tQnBuVklmdFdz?=
 =?utf-8?B?TWFpMWhFSXoxLzljR2FDNVBHZzdqcXBOQUVuWVBUcWlyN1M4cjRQbTV3OVM3?=
 =?utf-8?B?SUNZbkpJUW9mWGhXeDcvaW5iYXpQYkx0RGpjVXRzMjVzWDNoNzZURFEwVjUz?=
 =?utf-8?B?MjgvYWd1U0Ewd0hYVlVqZ1dNcXp2VG9kMXJwVlVzU0tVemdxMHhISXpBWVpn?=
 =?utf-8?B?OUQvZUdSMCtIanB3eEJXWkRvTzJkVWdUcndyQjRoVmQ3cmF6bU5nbTJpakNK?=
 =?utf-8?B?REp5ZlVBRzhyVWJodWZ4RG16dkk0RTArdWwxSnN3R3ZLS1B4MHQyU2hLQiti?=
 =?utf-8?B?QTBEQmozQW52dXc5bUNDdkg0OWtkRVZyTWRoUGpNeC8rYzZ6cGk1UnlDOU9m?=
 =?utf-8?B?VlAxeTJNUHZyS0hjM3NtdmJoU2NuVFRnQTAzNWFGRG0xQWpDRDNUN003Y3Vi?=
 =?utf-8?B?QXl6c2NsVWxERDZuMGVTU0YzbDVkRUNuQ1FCYjRSUS96MGhzUjV3cXZmYzVu?=
 =?utf-8?B?a29DdjE4N1NWZmFxMWlmQUliTVdyRmxIUDE1N3gwZVUzN05ndnVwRWFoSmJq?=
 =?utf-8?B?Sld1OGdWSFNMWkFJSWxjU3YzaDRKeWxhRTZXbUR3OWZVN1RzcitDMDB4QlhS?=
 =?utf-8?B?UUIzQ0tJbXB2NGdTVUxzQTBhaHVaakdEWS9kc3N1blkrMkhKSzhuRjUzdmh0?=
 =?utf-8?B?MkgrTnRaUndXbGIwQTFtQUZRNDVibW5LNXdPUmFNV0lFSmNGQ2QvWGxLeWJp?=
 =?utf-8?B?NjJNNWs1cnF3WUlVYnk4YmptYnA5RC9WbGdtVTgzRjhaQ3AwT1NkS3FOa3Zl?=
 =?utf-8?B?RE5sU2E3K2tncW5LQTZvYnBicVYveGxQb2libFRhN1Y0ZGZnajlxMktYeGt3?=
 =?utf-8?B?Z1Z6Si93ek52c1kxZjJoT0VIQmRERUtKNXhpSTFEODFRK3NFMUlzd1N1WHNC?=
 =?utf-8?B?QlBLSUZCZldBckZVTzhrNndRMU9FcjZLWEFMWG5mM2trc2c2Yy9hdktpUHFE?=
 =?utf-8?B?VGdKSERiRDZlaVlNVktYbVkvaTgvcDh3a1J4aTZRUjRnWTZEQXdndXdHdkFY?=
 =?utf-8?B?ajdHUGtTL0tLVlRXcXlJSjZ4cFIyeXlDZGNrSTZzRWhhbTJkMGE5bm5kem53?=
 =?utf-8?B?R3U3OE5RMnlUcGFHQ21FVExuSUhNaXdqUmEwVitXcFRpTG1OM1lQSXY5WnhS?=
 =?utf-8?B?cnhoQS83QURQNjJ3aG9tQlpIT0dnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aba6ad-d243-45a8-5e86-08d9e7c118cd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:31:18.1702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sug27pgNtEDulMcGGanYMwQ73UU7ALuRt/o/Fv+YM3VuRHJLC5MBC1FWmA5Ok4xsZl++f2N8S79ne2nwlnCDlWdfLf43dMMOoJETU6+mLf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1944
Received-SPF: pass client-ip=40.107.20.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

03.02.2022 19:30, Hanna Reitz wrote:
> Put an NBD block device into an I/O thread, and then read data from it,
> hoping that the NBD connection will yield during that read.  When it
> does, the coroutine must be reentered in the block device's I/O thread,
> which will only happen if the NBD block driver attaches the connection's
> QIOChannel to the new AioContext.  It did not do that after 4ddb5d2fde
> ("block/nbd: drop connection_co") and prior to "block/nbd: Move s->ioc
> on AioContext change", which would cause an assertion failure.
> 
> To improve our chances of yielding, the NBD server is throttled to
> reading 64 kB/s, and the NBD client reads 128 kB, so it should yield at
> some point.
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

