Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811C7476F51
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:59:44 +0100 (CET)
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoUB-000106-L7
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoSd-0007iL-U4; Thu, 16 Dec 2021 05:58:08 -0500
Received: from mail-db8eur05on2121.outbound.protection.outlook.com
 ([40.107.20.121]:16993 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoSc-0004wx-4H; Thu, 16 Dec 2021 05:58:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5mD5mN/ElvPOw82NSqfANWQd/NabWvFaUtNlf+qae3pVxGkm4JfSQLo17mnEIhP5LFu/FKaDfWaNzZQHIaToPlYPAc1FTOGUcciuuR3DafYlqAorqfSKXzY13AY4hwdCf6Fp4FCC4SMNf9TGy5RAEBpL/d5JH1iUgSdalluoTrqu8XBgzMqWjU6SjyeSVHtJTfDY+yb1hijab6V9A3w32Ok2XuslsrOrjtxGNMzsniGXiBQM8JdhIBl8wZ1pXtgrXZWGCUrjaPOM9F1+oIcx5M3Ypqu4+VmrJMoLlPVbM51OOLQcgSKp4zIKJzVOB2poVWhjeY0zo9+J5RKnsAWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1BKcYvOYq+Pxz6bESBaRRWF4+rGzlMy5o1UTl1+/qk=;
 b=an56Zwm8iDQzdsrVSaVQwxie7TapnZcfEglHvq0gnmL0E2j5LBCVOf7clRJYv7HFAr4YVU14znvPf6y+TYKKbRv2XpfxP7KrFJbIpK8QaVIMZTsFWdQ4lQujvNgN/z0f3XO0XJ2YW+/q86tJAzr5OhuZe21aZmVT0MksTDFS/kxOakkWAk/CBcjnC/Q5VF2Lnfaqis6SFQ8kGFeQs7qDaqcgnyPBbaLeFc57NVRivBV05/kyUqNfL0KN03wW7v3ECo5ZWaBMv07GN0KOlGB1t/BdolSrJMfcTzM2opyHtpo8Q7OopnheFsqEY3djPQR5GokYhfr0khfxeh1Jtf3mUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1BKcYvOYq+Pxz6bESBaRRWF4+rGzlMy5o1UTl1+/qk=;
 b=kopN/QX3ORPSWDQqi8NGyPHxXTtfB2VqWFbnL4WmQkGkEkHdteIJcRala+Kakonu7CROegUV35QgQYyfsIdoW29Ls4Ew24uQnYrR4yfcxnWTkmOIZWe0F8wVtWM9d8hlO8dAZIBc71pKB4WLEZYBSahn64VlrX6PTU9ypbEMuhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3698.eurprd08.prod.outlook.com (2603:10a6:208:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:57:59 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:57:59 +0000
Message-ID: <fb2f7353-7cd8-28af-5f38-d9fd68440155@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:57:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 15/25] scripts/render-block-graph: switch to AQMP
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-16-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-16-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:57:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88634e68-4a71-4630-87e4-08d9c082ec5c
X-MS-TrafficTypeDiagnostic: AM0PR08MB3698:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB36985934147E9CE516492265C1779@AM0PR08MB3698.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EN7WTaoasDGALHPjewAvE1ljGhMNnL12o1zO5AiWbXU+MmczQgY6oalcVzqoy5SVX78+J3mZfTFgOgrYWCS4EzDg2xLkwf+SrykS6ShPI91zDE3Fw0eCq4Wbggvz5pjDryNQkjUSMPsTorzI4UXHLSpwtNCeSc/vxUrei4J7IG7PnewDUJ3rszFoj17mxiWtaIpNi9taIAtTnXc86xBZVjQMeb1m4ttFYKRX9YVdKWRAtKqcmFyJsyZIxKF8ktdB1EmAYQeSl9fw5xGsSabrB7CSbhF2mnCAZEaubSe9IOI3LiNVOF3iw3XecEChpbwxzlhvket3zaWY9BDSkBHjjXWRBK82Kvnc3VchSh7Z038897g32jRg7k6q/p/q8qvx+ebf+qfteNEmFWfj+354s050qmSw3gdcCqV5ogpMB2Qy+V3gnhKzDMP4rSJZJ4Eyk39cihqZaB+GWy7Aab2ICv/UGM78Z7Ae267iVJtykkEnFyshPUC6wRQWX+svMTT/e/SI5S+2NRgGDJnH1dKJ9sD80iu4K9cMV/n3BodOK2NHWHCymRyOB5SOxmrVDqUGlJN9znkb0rLtofuF8LL8QrlzYkE9hppq7GBTcoshoLJnD3aLx0W18e73tnwiH9P6nwKbEWRMw4eJLkbvZ5OtEQoNMpN2XJ0ybv+P0yXixE36fkvRwJQE3EWU4NkecBvfT938Wjgvyz/lVvLIpLE3sbguFUZ/J6F7eO7dw9VS8j98uImYJ05O0fuJ4R54IspjhjtpXiMN0922gt5852FZQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66476007)(31696002)(83380400001)(66946007)(186003)(8676002)(26005)(86362001)(4326008)(956004)(38100700002)(52116002)(66556008)(54906003)(38350700002)(508600001)(5660300002)(8936002)(31686004)(2906002)(2616005)(16576012)(6486002)(7416002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGp2SGVUNkY5Qi9YT2tsTUZVQlkrK2JGRnRMekpXMGlhQWN2d2krOUJBYUNq?=
 =?utf-8?B?cjBTY2I0VGVXL2FDQnQ4MzhUaStqREd6VklGaERaYzlQY2pUSGlkTHJNOTY5?=
 =?utf-8?B?Q2JxbUVXdWNuN0NaSHJ5VTVMczI2WFMyOVg1VkdCcVJ2ZThwVlhjWFJzNWVO?=
 =?utf-8?B?ZHNiaWVWY1M4ZWthRFh0NCszVEVsRXBhYzZUbmlPZytzN283YkEySEhsa2ZT?=
 =?utf-8?B?T1NlMXJvWHMzVFdmOTJ0Z0pYVFFZMWNDaEZoK2RxTkhRVk1JQm14QmdETGsz?=
 =?utf-8?B?bTMvUjNBWnVoNklXeTRzak9KSVBzUVNMM0xaUHlrcWVRbVA3VncxTnE5bU5m?=
 =?utf-8?B?VkNMaS9RVGZTV1BDdUh2ZitncVVyZmNmUTQvOENNR0ZHTkhEdFZzcEZoRXlK?=
 =?utf-8?B?QnpMSFJFZElTT0hpcGZDSzdVcXFLcjJpWjlITU5lTXIyVGgxK3NuTG95YXJJ?=
 =?utf-8?B?NFFpUHZUd0JITk1lcDdHdWRPdXhsYzM5Tzk2UUZmWnh6M24wSUxKckNsQVI1?=
 =?utf-8?B?MFpwTE1VN2Y5YmlCZ2xIbzZ2c1RueGdzQXRkdVRjY0RGQU44Y0pmVmxuaENh?=
 =?utf-8?B?TE5sSXp4eE5MVzNLR2tDV1FleXczRm1oM0xoTDZpRXVvSC9TNGtIamJBbmRn?=
 =?utf-8?B?NHhmRzZVZy8yYjVNNmdkYkJiVUZvVTUwYzNwSlNIZHIzS0lBSFNlSGdEMWp5?=
 =?utf-8?B?V3l4ZDVmTlZzdlZtbE9oYlhEbTVPWFgwTmxJMDVyTDl6SHRGVE5EbXpLblpB?=
 =?utf-8?B?N1V1VkZ5MjJwdVVOZWNiNHIzL2pzTnNDeE94OGZDT2RmWHA0RTN6MkNDUGhG?=
 =?utf-8?B?b0VlSXh3QVdiS1VrVXFJWi9zYm80ZjRpd2pUNXhZMW9ZbXcxcDZDWWNkakNO?=
 =?utf-8?B?R0ZNWGlPOE1ZUnoyYUdNM2ZJUUEvR3plSFcyeXRuK3IzQWpnQjlacDhvcXZB?=
 =?utf-8?B?WXpkNUZVYnhtUlZBY0dJVVhMRmYwaGgybTdlQ2hBckJBRnM1bEpWRUZtMmZR?=
 =?utf-8?B?MVBxa2xnbjR1UkZZUkRyeUZGVVhucndzUEVOeUhIQTdjRHZQaG4yWklnYVht?=
 =?utf-8?B?WS9wUVhOY2UrSHFQOUZxcDRoZkt0WW9lOTRVOWhwNDlIQ0ptZ0Q3THlmclh3?=
 =?utf-8?B?SW5MUTlFK3EycVkxUnZOK1M1M2hPc25GZFFCOHQwclpZWVhZL2tITU81MDZ3?=
 =?utf-8?B?eTg0YUJmSDFKRmppZFlqOGhURmJhL0V6S1JPcXN3MDJaYVlIM0tlMEFJb25J?=
 =?utf-8?B?VmpFUE4ycS81V0kzeFE0RGd0OGtkZGVtZldoSlRuUlJxZmdQNVlTRk1oYlFn?=
 =?utf-8?B?ME95UWtyb3g3K2M2ZTZ6NmY4clBnSGtueTRnVkZaT0lXUmtObkZOU1ZaNkhC?=
 =?utf-8?B?Y3FyMHV5NFVJVjZIWFF0T2FvbmxKWEdJUHdtUkI1ZDBWTHFoTzNnTE9mMzNJ?=
 =?utf-8?B?ckppenpKVGlmemQ3YnR4Y3R0VUVVb200VU92L3FYWWVaNXBLd0ZTQWI2bVJ1?=
 =?utf-8?B?aUpxMmtWa3FacnM5YmE4eUxIVkJSTWpZSnFRdmtMZFZxMmpMai9JaXBTUmNz?=
 =?utf-8?B?ZGRSeWtxNGhVZDdmODYvR0FBT3JPZVFwOGlQcU03SS9WVzNFaEJpVDMrNjhs?=
 =?utf-8?B?L2JTeE83amM3djRBdUV6WURKN0pjTzUwM2pKdHkxQVpxQ3hHczV3SzU0bzI3?=
 =?utf-8?B?M3I1Vk1vVUZ4Q3FDQnRva01md2F6d3F1cWMxZ0lhMm1IWDFiSHRoNnhHQ1l4?=
 =?utf-8?B?NEFzYTBBaG1Nc2FwT1lEZTZCamZWc09PWFVMaDJ6dHJwK3pJZzNRcU41VFRX?=
 =?utf-8?B?YzFTOVZuMHk4YWlRcVRPVzgrWmRPdjVTaG9nVktpSkR4ajZGcWlJMFdiaEsx?=
 =?utf-8?B?bFRaK0Z1Ui8wblVzOFJTYlF3NVc5SlRRMGxqdDM2MEtIRlltbVNaYmtYOEFG?=
 =?utf-8?B?aGwwZkJNMDZpR1dJZTVwNXR5SVFEbUU2MDdLUFhvS1cvbGhsWCtqaHdiWWxZ?=
 =?utf-8?B?c1N0RFFCUWdac0M5M0VNdm1lbU1DWXBER1lld3VCZ0psTVd6YUlIaHJRdmtH?=
 =?utf-8?B?eUxhUGR0U281NEYzN29ralkrZ1hyTExKTjNQMkdmcVZjY3djUmN0cEZvdVJh?=
 =?utf-8?B?TjVOOFhsODdMcVBvckE0dGVKdGpmdVQ1UE0vUC9PQ3FPc0g1MzBHbkQ2V1Ns?=
 =?utf-8?B?Q1poUUZKVm4zVnV2dnVzUk9ueW5zbUl0UHBMeG93cFcyTUJFUmozTU0yR1Vv?=
 =?utf-8?Q?+pF97gulreQtGFvizdNALowTlIa5UvA+PzuNHFNJK8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88634e68-4a71-4630-87e4-08d9c082ec5c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:57:59.4380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pb+gFbSkz3+YqJjqePzCEnTTUCSVq5n1LIYQLMkjqmUKqmBFaCvJ9Zps3VB4UgWPTOGMc1nPPOCUcs1+ux8qol3FtkE+++y9WU6AY1juaCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3698
Received-SPF: pass client-ip=40.107.20.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.12.2021 22:39, John Snow wrote:
> Creating an instance of qemu.aqmp.ExecuteError is too involved here, so
> just drop the specificity down to a generic AQMPError.

s/AQMPError/QMPError/  ?

> 
> Signed-off-by: John Snow <jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   scripts/render_block_graph.py | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
> index da6acf050d..97778927f3 100755
> --- a/scripts/render_block_graph.py
> +++ b/scripts/render_block_graph.py
> @@ -25,10 +25,8 @@
>   from graphviz import Digraph
>   
>   sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
> -from qemu.qmp import (
> -    QEMUMonitorProtocol,
> -    QMPResponseError,
> -)
> +from qemu.aqmp import QMPError
> +from qemu.aqmp.legacy import QEMUMonitorProtocol
>   
>   
>   def perm(arr):
> @@ -105,7 +103,7 @@ def command(self, cmd):
>           reply = json.loads(subprocess.check_output(ar))
>   
>           if 'error' in reply:
> -            raise QMPResponseError(reply)
> +            raise QMPError(reply)
>   
>           return reply['return']
>   
> 


-- 
Best regards,
Vladimir

