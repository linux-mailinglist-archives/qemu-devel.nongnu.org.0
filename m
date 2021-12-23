Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6E947E19C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:40:01 +0100 (CET)
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0LVv-0006Hk-T7
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LUM-00056B-HN
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:38:22 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:13707 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LUJ-0004cC-NO
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:38:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYEAJ6tzC3qiAX/HNvWZ/RXwnbekrE7AEFs0g+ecwtJsLQXzSndZ7pMuw1tYl2DT1xvkMvgwWbQvjBGWKV88y1lPB51/6ojMSyaH732qSl3IVEWq+Df2JerFddzqYtTu4nXE0tms+yzxv63GG2vSSimlkV6lkQhacpmBAtBQ5Tbs5AoWUeVuJmKttRLpSDKIjLMAzrdYmJyGKIkwBytxlhmSezPOsfPtaw9Cyf2NPs0ohVAYgMzPfqMwYtDzGXPSvvryURxfpLZubfMZqRLTVkzZiilwSxc4di5MVTlV1afnfy/jpS7jxXtNV7QA7m3/FarzDNMxiMeMFEisV5Q5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jM7DRzNrN0uYpA/94MdKpgB2YMDZTUTR7R8YbJpNXbQ=;
 b=iyz8He5c2ocBzlRXIRIzBqLw18rmOnlxY8q5Xz8x6zLv4OJG+R1MyVj30f3rpAGi7BTDp0jwqUsovvBRmn0H+K8+3iV0CeO4fdI8WLZz/ppkIwRa6cgK8dhvxbElNGBouzh1a3+jUV7DjAB+S0ywXNxblY201WskMO9+1COT+bct1SGsTC1/9nflF2Dvjgj9Fl1sxlPOUcdqLrQtfQnWhbemFol4mxmsI62ph7Yf9uuxUiZPqtB5zJRcD/N3pD2aPiy6bmmpjKUVFJ9v8EGvvc7qVV1t7JM+RoyWSQ1YSjl/tk0WO4pfbdEWyJs+N/BrrlQDDlCzJtl+BhiqzgrRGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jM7DRzNrN0uYpA/94MdKpgB2YMDZTUTR7R8YbJpNXbQ=;
 b=QYqagZ/RIRYwItTu8OLZaEDfmx9HZV1NKJ5+dl7t8u5zKdt5YbBXem+4NILj4VvwJOug7DV3+wOfCM036Gv6XRdaWNygU9EBFPEO8u1xhepc0puLn5IzZSKj3uxCzmOg25TJbmOCAFf7P7e/XG2YWAsNh3dD+AG1UwxoBSwGM54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 10:38:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 10:38:15 +0000
Message-ID: <17f72d0e-4474-ff04-0614-83b8fb7b31ad@virtuozzo.com>
Date: Thu, 23 Dec 2021 13:38:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 pbonzini@redhat.com
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
 <20211221193502.114296-2-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211221193502.114296-2-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4a8b36d-35ed-4b29-7a55-08d9c60053bb
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6034E1407DC5DD705DBDC0BBC17E9@AM9PR08MB6034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Kr4wJrmqZxL5Um1PdAG63mw6oPPnT8e5EOF3K1iiWZdnq4y3BapNiijjawyj3NFrp1XmaMqcP3lo2BeQKWa4183oTA/kNHLG0tiVxvB8M4gvLsckx1jFaudEtn0euSxkoHPX2hevrCJ+fZIyIWT/UnJDnJViv32xcJGSuYFikQqFo9GW0nVb+4VDEEnho2msRqASTkhbtnoDXiTn+5vyssFaNBk2vy+NuXhuV/pmJeWT1WB5lCagfKaRCKuVI0IbCcTvtdrL+4qZM6hD0ZNIF3PQHNO7mgAGSL9yZDmVZmNuZ6MTSCSLm/2Ro136GWBuHvI6SHwsOEclWbG8K/oRfdSs52qBFDCcSmf7L9TxIRP7PaoZCwYEDphdDfmDU7/UyL1U7lcYTmBdyfS+uYFTupHF+dCR8S8y9JBey3BITwXVfAYXn2YJ0LvdCXpTQTvPPhlM2Og9wrVziMU8ejHKcSV8XHL0C24fSlj+47oxGLul1XRD4H/YVtSFhguh3iFVeL5qhKw6ljb7v5yfqLhIqJF8g+u32GxeOd0uQ5zLJVouo/IJ22rD92BXbumOs9qsKvnP4AFlP8kYH7yuG85k+dLX5Rt7NyT19w0UVka3Ktq20Zg0bSbfd3vkIkIjI7Qf3m9cKgtmV9zGWtAjDx1TKcRBC335UCmrDG6bN3VP69VG96W7t5ryqQcMeQS1Bm2vMRtUTPOjksiZp5TmQFnkBjWSlK8JPjxKzLbHUrRls2UxlVjfdlxZzTIlElJoQWaFTkHYQ0KMWb6MYNuOFdJ8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(508600001)(186003)(26005)(6506007)(38100700002)(5660300002)(38350700002)(6916009)(6512007)(6486002)(83380400001)(8676002)(4326008)(66946007)(66556008)(2616005)(2906002)(31686004)(36756003)(8936002)(86362001)(316002)(31696002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hFRVB0YjZzTHQrTGtIUnpYZjVGWTczY3V5RnE5aDZtZ0hUaDA3V0gxc2dk?=
 =?utf-8?B?MUdtcTFNK2dXU3RZTDM2c3d1RWVVcTNOVGVNbDVlS0FoUFpBVG5pTnM3cVRZ?=
 =?utf-8?B?RjkxcWhQRTVJUDhQOFpWRjZQTmdzYm5vd2Z4aDJvdnk0a2FRTEVEemE3UjZ2?=
 =?utf-8?B?WG9DUkxhNlEzV3crY0JZZkI5cGtROTZKODlWSEkzWVBoOC9EbEFaVFlqUjl5?=
 =?utf-8?B?aitSSVZGQlJmWWtkWmR3WkQ5TnBxYVdrYlhYRThDcThyZlJuWlpIYVkyenc3?=
 =?utf-8?B?Ky9IMnV5RUNrYVgwNXJZRnA3RVR5YWdrRVFIWUh4M2NjOTNJUzRqcEJhYzBh?=
 =?utf-8?B?WktPZ2cwQVZQSzV2Y05KNFErYndoVGpqNEdWS0VvVE5Fa2pmMWdmcGp1eWQr?=
 =?utf-8?B?KzJiTXNacFhaQml1NUc2TEk4bDBFam5uK2RRZ0RVdkk5T1QxWjZ4N29HRE90?=
 =?utf-8?B?bE4rZ3F6ci9WZ3BDV1g1VklSNzg4SlVia0VkOFpaUmZLdGR5Z3J6L2loTFRK?=
 =?utf-8?B?QjZuMmdhZDBXOElDaHMvVFllQVlodGRwVU1GdXVrSnpCb3BaTXZ1NWRqayt4?=
 =?utf-8?B?cGdlaHN4MGo2a2RhcHJ5S2cwaGNzYnFWeU91MTVNWXJORHZ6V2dDWmkrcWtv?=
 =?utf-8?B?VTRKdnR1dHBxVlRvQk4vckJtVlVmRHR1V0pjRkFoQUFBdFNOcTZLTFRvelFl?=
 =?utf-8?B?ZXgrMHFvd2Y5M0ZTS0VqL2RmNmtvQlZjZUJEZGpTUFZncCtUSUI3Q2V6Q0Nq?=
 =?utf-8?B?eU1iaUdaWEpVWDhvYXdKUmluUU9MNTVKYTRYd3pBV2d4aytqb2lJbEo4ajNr?=
 =?utf-8?B?dExwc1gwbmxIQnRpOTd5WTI2UzhPYWtCaGxBdEFTWWkzNGs5VW05YXVJc3ZH?=
 =?utf-8?B?YTVMODhsTDZBazFoS1NKOFkzMWlRMXVKSkhtV29IM09WQXN6RHRmOVA3ak1W?=
 =?utf-8?B?Ny9VNU45cGpkZkVKWnZOSVcyWXlqKzg4RlJnRUlNWEE3WTErdkJ5YkpDcGZ6?=
 =?utf-8?B?SkNjTlRYUStHK3ZQZERzM3d4NGRCL3phR1dUT3BTdlJEUStRNDVSanFuM29D?=
 =?utf-8?B?L0hWcnR4NWRIdUl5SVVuRU16QVZYYU9ndzA2TmRpOXcrNllDWnZtWkxLdDRY?=
 =?utf-8?B?LzVFZHEveC9ZVDZ3V3hrTUQ3S21VS3MvVXZwQ1l2WjBVRVl5dk55dVVxODd6?=
 =?utf-8?B?endEMFkyVThOd1lzaXgzbHBwYUpCWkFCamxxay9aQUxqdW9DYkVEajhqYUk5?=
 =?utf-8?B?ZElhSFJLbDE4K3JPMlEvWlhFMzBCNnhHRXoreXBRTXMxU0JiWlQxdHNqVnVk?=
 =?utf-8?B?a3E1N0FjL2IvOGEzY1loMlhMSFppTkdJRnVzcWo3ZFR5ZEJRd3U3WnR2dEx4?=
 =?utf-8?B?VEkvbjBKUDl2S2xDa2ZzWnJBTnBDN1ZuVi8yUzdndW1oY1N3c21KYU5SUGRD?=
 =?utf-8?B?L1IrSnZLaDZPdC9YN3ZtYjFhaFJvdTFrbCtZNi9qZlJNbTdxNy8rMWxSZ0ZI?=
 =?utf-8?B?TFVzdWVOenRwSTBaWDNDU2xtK2pKTlliZzNCVTljN2l5WUptNjVVNndnay8w?=
 =?utf-8?B?WHBYZTBwdXlVYXZqUnY4aHU3ZmQ1QlRZbEFnSys1VGVwcThLaWlQTkVnSWg5?=
 =?utf-8?B?SHROSTNpTkUvc25yMkxmOGpkSW50V2cxbFJNRnIvUmNwaTVOMmdJRU1ac3RF?=
 =?utf-8?B?Um5vTW9BYkZBYmFZNVl6ZHppR1Y4b3Y2bUxuZzNGTVR0YTA5dHNBMldnR0NC?=
 =?utf-8?B?QUhnQ0JzaGlnUzJvM0FjRzZVL1ZqVytEa0pRRzU0UzFQYXlhZjZiRHJTY0Rs?=
 =?utf-8?B?QTRNUU0xYU1oSjIxRFdHNUhWaTVFY01mMUtFMWF5OWlWRW1DZEozbEIyWEJa?=
 =?utf-8?B?RjdpU0syRURiQ0duMkdCd21nOHRlNHV3dHNwMkNRQUlLZEVGUjFoNXlrYk1k?=
 =?utf-8?B?bE8rbVE5RkJUMXp0bmRGeFExVUtwSUpuQ0xubWFsR0w1ajIxQXpkbjJoUXYw?=
 =?utf-8?B?UFF0RXVYcFBYdkxWMW91VEVtbjFIVlRHUW1lWThDc2pyQ2FQL1JUWTN3M21h?=
 =?utf-8?B?dEhTKytTZ0Z2c0RjMWQ5aENLZUhyVi9IeEp1RUdrc3VrclRWRExHQnVGNGYw?=
 =?utf-8?B?VlJ3ei85ZjdlUkhySDAyNThpTlVuZk5PL1hTdEs5MFhiR3pmbjcxL3I4d2tZ?=
 =?utf-8?B?WVJQWk8vSzJiYW43Q0pieUFBQzVxLzRYMXFJQmM5WXJNL0FRU2w5cnd2UVlK?=
 =?utf-8?B?d2dlTmd6QzliWTlZTE9tbWdDcUV3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a8b36d-35ed-4b29-7a55-08d9c60053bb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 10:38:15.8449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20AdqP17+GI1S3pV0/bOgg8GnfMoHkaxoxJfXmhIzbzRM5f/thFMyB0Qk38rJ6EKHYqSoRcHHv63yn3qhVSKvWhEYla3H5mkaPCEpFdYV1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6034
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

21.12.2021 22:35, Vladimir Sementsov-Ogievskiy wrote:
> Add possibility to generate trace points for each qmp command.
> 
> We should generate both trace points and trace-events file, for further
> trace point code generation.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 73 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 21001bbd6b..e62f1a4125 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
>   def gen_call(name: str,
>                arg_type: Optional[QAPISchemaObjectType],
>                boxed: bool,
> -             ret_type: Optional[QAPISchemaType]) -> str:
> +             ret_type: Optional[QAPISchemaType],
> +             add_trace_points: bool) -> str:
>       ret = ''
>   
>       argstr = ''
> @@ -71,21 +72,65 @@ def gen_call(name: str,
>       if ret_type:
>           lhs = 'retval = '
>   
> -    ret = mcgen('''
> +    qmp_name = f'qmpq_{c_name(name)}'

That was called qmpq_ because qmp_ conflicts with existing qmp_ trace points for jobs. But looking at them, they don't add much information to new qmpq_ trace events, so, in v2 I'll remove old qmp_ trace points (not many of them) and new generated trace points will be named simply qmp_*


-- 
Best regards,
Vladimir

