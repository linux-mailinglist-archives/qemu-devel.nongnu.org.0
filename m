Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAD476EAF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:17:33 +0100 (CET)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnpL-0005HY-Sm
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:17:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnmn-0002sY-8w; Thu, 16 Dec 2021 05:14:53 -0500
Received: from mail-eopbgr40128.outbound.protection.outlook.com
 ([40.107.4.128]:64710 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnml-0000oc-1j; Thu, 16 Dec 2021 05:14:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grDHXd6+W8BrX2O8E+LgVP7TRnq86NJ6d+aOGD17Mz2JE5RoxBX+u+i/V3mKOx0bqyVxY9X0jc5NVPfVrvOfnvKiVy0b1aDhApELy60ilPZTj08YcA8masB1R2RuHxyh+sHE5DvRsseFBwE6xZ2caFkpwGQUUZ+d9SrqrwC06RxmdGHzCOpmrLeGhzi4nJqcRtZxfqvK2B1Sgmoqjiz0S9gpmmJXJbz2AQKyYL0I6dPok+1CSRMZY2tmdq3cSWIXcrD8Mni3Yi4gPNo3mm4veqEyy/kxj7mzuXcyKyivygARB8VSS4PmpCazP6Zh1uIEpDGcSb94JSo8oBVKuXUQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sxLx0FKeprXbmrjdOo5w8ORrgQK1eg7p3BT+x9lTfg=;
 b=NAJQdRTBOJxSuJNF7CJUX61o5USncJRaIdgA5zyj7AqtFCJ0LfNkm4bAkR6vQQe8jmrS1svUd2IA3BCeHl+oQQFfXf5mgHz9uXo3ccDHk1nip68H45iEvrviFFaHEK8+AqHIVmWDuY6xnzFIL/Gmbm1a/Pc9xNxcW8lUpf+JqxmJbPYwzrYIoDOwJF/CeCVpqUgDDZ5iCcNyX6XYuhGXPQE1bUIFLiwyEju/TvHJH8w6Bj69KBFH3ypZ2jrv4bliAd9mXRc8fwhGyn7XHKuEw05xU3QHOkgRV/cGt6BCnoeYFb3zRyRRMLUAirVMWVtyA+ZaT2szZIHJ8/p3Vxaqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sxLx0FKeprXbmrjdOo5w8ORrgQK1eg7p3BT+x9lTfg=;
 b=GwCseVkQZejAULaV/kAHlZdcdFAtBcsoinyMjXl0jmKdJ9oEHLkDV26FxqWN23XOsodEp8goq+l8O7B02ZnoBFahC5wM/vKAurgMLpYnJdYVVsfLQeR183K//rrExe8pjvKVcfzywzc6leAAp6N3NfyhHlgPxM0UWb5NnHWwTUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2178.eurprd08.prod.outlook.com (2603:10a6:200:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:14:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:14:48 +0000
Message-ID: <c1e17832-3046-541b-de79-b7c4b85024d9@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:14:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 06/25] python/qemu-ga-client: update instructions to
 newer CLI syntax
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
 <20211215193939.3768033-7-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0146.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS8PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:20b:127::31) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:14:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81435d66-17a9-404d-62e6-08d9c07ce3d2
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2178:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2178C75D9A596A8216BAC132C1779@AM4PR0802MB2178.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfLvYWQ8yakyRAU5u6V9zwImgWU8x0UH35+snltL5hpNw3T9+OxLc9c8GPrhij+pzCuwG4exr2IhZ5CIh6fMmXOxn9pbBMe4aRBnRoi9tFuf4G0zZHt4qivpFM9IbSTboHO+oA6p8+ugWc1a7XTsV3FYO/J1IVsT7xSqR3MqAeZ+FtlXsj6JN+VkT5dsgbYtKR0UNmSC5v88euQW2XsqYU1IzrOmTJWOp/rkRLrKkeK0wM5WcAhV64uAY+/YRHPi/+oVYqQb/PhokzVucDGvDbPPcNPTTDaAQNsen3guW5m1IhPB+zRtq/LrHC4gfy5mc1E/1Ij0lw+09dfd6n/8jNMFfGy3T1d0g4b+uGFrDeQJPuzIUKoifd8ZFHb04cHqVEV8AuYOmI4EjcY1k8zj1NEfVBXR7+op6X71GENLnSwEhLWnAAAZMHY+KQ8Ol2Aai+On5oGzVYf1CyFCkIVOe1zmBB5wY4JtfhqcxruUDt6rZsNBOXH7Jt6WWOHxWSnrwdHSgv8eEGIGHjsQaXzw+VvowOWIEsMMre4GyRHmoYLADi0pu41Ie6d3VU8Jk0utOlrJjLwRNUAxHbZtepzLaVMSCKZpfwYhjW0O3TmidbGVwjrGRaU44J8baIYtNgkz8Y6O3tjJN1rc22nL6pP44q1GPiy4vMSiq79h3Ynke6fNjqRlGV8Y5tb4K98FD4XjTc+g5xtos2lHtQdyMJKxwO5Wqvsl43vhryBh8eqjv2vlmFJBJss1RUllx50alQwnJz4eFIfFVC7sfKEqWyaaog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(16576012)(5660300002)(4326008)(7416002)(66946007)(8676002)(508600001)(38100700002)(83380400001)(38350700002)(8936002)(66556008)(66476007)(36756003)(26005)(956004)(2616005)(186003)(52116002)(86362001)(31696002)(316002)(54906003)(2906002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXo1cHJ0cmJrb2lqd1E5S0tienhTc2FQS0dodkNWVzdkaUREMDFqaGdQcGUw?=
 =?utf-8?B?QnNEWlJxM3NGS0R5eDMyS3VESFRmWVBDUjkvMUN6MDRpTjF2dHU0T0srRXY3?=
 =?utf-8?B?ODZERXh2WnF2bXlZQ0txTXl5eDBIbjQ1a2xnZFptVEhBa2UzYjlTc2c2K1dt?=
 =?utf-8?B?eWlMMUxJbXltazdOcTFQYjVJMUd1blJTb2QrNFgwbXhISEJnR1hJaWJNeWR3?=
 =?utf-8?B?bE9vaEgwN0J5UTJMM0ZzRmlScHFPdjQ5T2tOTkQ1VE5RdWVjMVg0WUlyc092?=
 =?utf-8?B?UUZTL3ZiVWI5TlVPbEFzSE5sUDhFdGN5aHZUdlZaWlg5TDFLS1V5WTMrSXBG?=
 =?utf-8?B?eHprbUxBblFSSHdybXBGb094ZWE5QnNmdVozT2IvZ1IvQ3dML3hxSjJrUUlF?=
 =?utf-8?B?eEdlaHdoMnJwcGdwSnl3dGptTmRxUEwvNkxLYVdhMXBidmx1eFdXdkRhUisr?=
 =?utf-8?B?eXlxZ0JUZW1xeU4vYzNwbXI3OHBTakM2di9ONGx1SVlHMklTeDFPbmlQbGh5?=
 =?utf-8?B?eFNSaEwvQWJLbDFaN3FrZG5wQmhjODZTWUt3dlltM0FXZkpSanNyWWhQdlJo?=
 =?utf-8?B?RnZ6K1dvZjQ4WStnNFZldjJwQ29FZVBCeGtVcWltd0R0TUdlMTJsb2pIYTdj?=
 =?utf-8?B?UCtNSWQ5QU55UGE5RXROQmFITVdpbU5WNWp5L20rbHZJL3FrSEZOY3NOcFJL?=
 =?utf-8?B?ZHNxZDBSYytWdms5eUp5ZGU5ZDBFQ3pkYUl2emRDdVdzdTNjMkRyc24rTHAz?=
 =?utf-8?B?NTBLOGVFTFFETWR5eFprYTRkR09nN1ZZTHpJdzJsUWgyOWdtOEo2bmNpeC9O?=
 =?utf-8?B?VmtGTEF0Ym5TSDNNcVlESjdMaTlDazFucXo1UDE1U3RTb29iOStUdm00b29R?=
 =?utf-8?B?NEV1SVgwNEdRMVp1ZklNdHRraVJrNFJHcDFaMUI0Y2VzWFdPOVJreHA2NmRF?=
 =?utf-8?B?eGFDbzVVUThONlV1TmtDeWpJem8wa3YyUkZHWUNra0xwWGl3c0pPcE9oVUVi?=
 =?utf-8?B?MlNmZGpvVk5IbFNqQmxtSG84TVdra1FvYmhYeEhsektnV3BQc1d0SWxXblZR?=
 =?utf-8?B?cjRDbWprRXFkR29WdnluMzQreUU0QW5XSEJZam5jZElhbGQxRCtsTGhiNHlZ?=
 =?utf-8?B?MFFoR2RsY05md1I2bmVnZ3IyNjB3Z3dMa1h3TS85d1pEenByc3hJTjNDZzJQ?=
 =?utf-8?B?WTNUVGk4RE9hSVdHOTRDTjJXeTYxS0g1MzZDSWEydGZJNzdoQ0tkb1FITVFm?=
 =?utf-8?B?WHpnRjVjeitES01MMnNhenNUN1ZIMEp6NER6MWFVZ2NQZ1huQnI3YTB0b3hm?=
 =?utf-8?B?emNIeXBWR3JPWGFtc1dqSEQzYjNNdkdubmZ3VVBEQnNjZkVBaWd6c0FUaDZ0?=
 =?utf-8?B?NnkyQXZGNE9YdllBSzJ3YVcrNzJBdlZiZDZZM1lnK012eTZQWjRBNzNaMkFS?=
 =?utf-8?B?YnhMMWZDa25veDQ5YjV1azR1SjkrMC9oVHdFRlM2WWdWUTRwZnFDQVNURjdt?=
 =?utf-8?B?L0RXUVVUMHZOVnpBOHRpbUJzUmduazBHSXFzWDBEYlUra0hJNGxXZ0xMd3ZS?=
 =?utf-8?B?YXNVNVdWMkNxSUpyODd3R0ozSDhLczdydW1nVzZKNEJSNytPT3JsTmpzdU90?=
 =?utf-8?B?cUpiZjVkeXhTaGN3MUFIbjdvazgrOHluNVl4VHVGTlMrOUROT2VZOVNSZkY4?=
 =?utf-8?B?QzB2NExWcVV2QjM1NXZwU1Z3djYrNkdvV0NRbWJLOUdRVmhqeTFTMEQ0anl4?=
 =?utf-8?B?OEc3OGl3bUJSaEhiaE1lbldKNDY2NlpKQ1RvbHRCYmZia1hSVW9QeUFTUXFW?=
 =?utf-8?B?T0JoZVh4L0d0NXh4Nk8yU0FONjNUdm9KK3poTVFYMW1Sd1Z5REFPb0gvYU5m?=
 =?utf-8?B?ZnlNY3pGbGpsOTBFeGd2c2t0RG5RN3diWXZTUnhSTzBrRy9MeGF0Uk9JaDEv?=
 =?utf-8?B?eTFFWCtrZ3lwRkpCcFhKTWZkSnZVL3pRb29MSWV6S09mcHJLQUt1TWp6cVBi?=
 =?utf-8?B?cUwvK1gvWVJkaWRIaWdJYmU4UWI3QjBabU5UbjI1M1l6Y3Z5UWVUcnNlQ2x3?=
 =?utf-8?B?b05jTVYxM0xlUTdQQkZabHdCWkVwV1Z1a0VNNWp5WU5GRDBqK1htdHE2RXRW?=
 =?utf-8?B?akpNRDRBenBGY0ZkU0lLdGRJUkYzd29BK0hHUUt3SzN3a1RyNGI4eThLcDk4?=
 =?utf-8?B?YWI1RjdqQzc5L2Q4UzFtbVI1cjJnZ1V4MHVlQkFIOElFTHpsamFqV0ZCSjRj?=
 =?utf-8?B?ZzRHL3pJbHVIWUZtdlJwdldlWXNRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81435d66-17a9-404d-62e6-08d9c07ce3d2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:14:48.1444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nq+oWNv5sguP1SyIPCw+1ZaUZ2EtXW+UlR321BWS2d3coyzN0fEzj5OPycWfzwUZsXRR4x5Emqd9YcA5quIRXlp4nMkLgQy/0rBCJrfRBUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178
Received-SPF: pass client-ip=40.107.4.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

I had to search a bit through the history to check this )

The commit ccd3b3b8112b670f "qemu-option: warn for short-form boolean options" may be noted here.

And may be subject changed to "don't use deprecated syntax in comment" or something like this. server=on is not a *new* syntax I think.

15.12.2021 22:39, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   python/qemu/qmp/qemu_ga_client.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_ga_client.py
> index 67ac0b4211..b3e1d98c9e 100644
> --- a/python/qemu/qmp/qemu_ga_client.py
> +++ b/python/qemu/qmp/qemu_ga_client.py
> @@ -5,7 +5,7 @@
>   
>   Start QEMU with:
>   
> -# qemu [...] -chardev socket,path=/tmp/qga.sock,server,wait=off,id=qga0 \
> +# qemu [...] -chardev socket,path=/tmp/qga.sock,server=on,wait=off,id=qga0 \
>     -device virtio-serial \
>     -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
>   
> 


-- 
Best regards,
Vladimir

