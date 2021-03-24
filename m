Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E433472F9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:50:28 +0100 (CET)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOyHb-0001HN-A9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOyFY-0008V3-Nq
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:48:20 -0400
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:28644 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOyFS-000684-DN
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:48:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EE6OvJ3h+heUcBj9QG6iddMZW1UuJrDooEW+v8VkONgBYjJIzBsrpmvittXwliiRqk2lCIF1e1/hjrLP0r/kkdT72S/28r8u1m4InmPMmEyqsFTiW8iYAr2UaCPVaaHqwDn7xKJMEpc0S0jA9vRjPejpiTF9jM0T4yGB7UxX7KUhzKxXsRl+fxeaEnUddwG4AKXhd67C34FiZ41K46uFqlWtyQSCea1vtW9O74OClQ6032Yre9yQRTAxBV3q5F/GPbV+zALRrDmhzawpgule2XhVM+YncDmgBpqW7bOBbMGIuMD8LBQF/XP+KU2fPTuhRQjFbMpvj+9Nv9nQ662sKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyF9cUzjq1xZhzBdvyQxOGYReCbngxT5506HsIc44tA=;
 b=RvrLsHxoCHXENDlylkd0vV+P1+CIgcfjTODyoMj6xcPwpz1uLXhnijiUg1dB3uA0rPZYoKI0aLgLNCWk8Xnt2nZGj6j4JD4mA5DWkB3tLGy1+312MHLxw/OtZGfXl19jD2b4k0khzgUbhwDbZo999Fxkm313rRwRV3s4begqlhv7x1o5a7l91Y2m+JrLRTAwp5qcu49T7BUb+nkIwyGGTGBepvvmbFnf2De8DtmaKHIpc2m8/eMhPTXAVnVstWW3s/msonQ6EF8Gxj1oyj6bPYXQs9yy3SWEksavmabtJEweYpPBm6djW9ebhs0Rd8kHkcVjLMG1JCvJUQzCq6WMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyF9cUzjq1xZhzBdvyQxOGYReCbngxT5506HsIc44tA=;
 b=whhjU3ppnEjlz2rTLxzq/4UNqv+PI/nx7HQsZPJmixDdoYRBl/3XLii6RTld0OxL1nTqsnYJ/n7HPfkEp4qvxp2x2jQamlaJLGbDvfUIBIUNu29tFDHOQ11R3OwpX1HUMXAMOV+QNURySrNsv3koZdfPyn/4tBOa59u7sDc9M4I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB3375.eurprd08.prod.outlook.com (2603:10a6:803:87::29)
 by VE1PR08MB5600.eurprd08.prod.outlook.com (2603:10a6:800:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 07:48:09 +0000
Received: from VI1PR08MB3375.eurprd08.prod.outlook.com
 ([fe80::94d1:d06c:76a2:af28]) by VI1PR08MB3375.eurprd08.prod.outlook.com
 ([fe80::94d1:d06c:76a2:af28%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 07:48:09 +0000
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
 <20210322201716.GG16645@xz-x1>
 <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
 <20210323145457.GC6486@xz-x1>
 <9311f31b-298f-d235-45bd-0ed9d66f9468@virtuozzo.com>
 <20210323183537.GH6486@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <b6aef92d-2545-ecb8-c20f-1c43367badc8@virtuozzo.com>
Date: Wed, 24 Mar 2021 10:48:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210323183537.GH6486@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------F709CD51FF95E6141BF765C7"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM9P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::8) To VI1PR08MB3375.eurprd08.prod.outlook.com
 (2603:10a6:803:87::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM9P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 07:48:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09cd50a8-c0a3-486e-fd94-08d8ee9929df
X-MS-TrafficTypeDiagnostic: VE1PR08MB5600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB560004145525668AA4136CA09F639@VE1PR08MB5600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZfV+hNcku99jsozbilrIZX44je3EWzvAMcFEHXVZnXBZMp30TxF2u/m9C0ymwK7bBLDBd/11CWQGkmhT+gU2a30q5dcieQO4r3A9RA5mq7cnrbCRIRXd4pYgG9isFK2+oGZEsSRWQJ4qml6DpRGJhWarvwKVNsYBys90OZfJAWfpn9DYJOySFV7n8H9OEdzkrc5sEHausM3VI4oBkGj8EfekogC/bM41Dq/E8sbGhkC2ry8WGFMGNe3OdA1AdkzDlG2193KX7R9F+1aCjgT+VyRudDnzHjJibsb3pDRyu4t6xoVy624mLpWUBbvU6ynAvjGO1NOjb90Klk+xsXDKt31Zsip0zyA4yH7tTnCiInPJ6zRkBV8DtM5J6hR4ySwCZQORd1MtyoIjh3apqo9MsNnvThQ8bgcOZeiLcRGGBSqP5N1EOI09d1IRCixu03/DaZDjUZg1CRbRGHK9cTgdqMtFRIq63ZosrAEvbjvqyKZA9slQREldYJe1lL5gN6NBC93mchXo/FSCSJM8cPtFvI8mhiZhaIuQIcf0YWHVHmGApKM7sfUvNpCKHs3rAnM6R16E8DnLXwHtnUCiOEYN4Z5l/1MOFEVfTrwZETgAwJhc0EmLcBC6vkxIpDUofzCXbAA8P0i0gokFYMWEy4gZGaGg5qKwwqwNo9twnMaf5OCmM6xsV31JqQzYf5bSdtS2KqdIkMJ0BMGMkNNgx+fa+gjdP2ZX64qHxr8TYIEkY4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB3375.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(136003)(366004)(346002)(956004)(54906003)(52116002)(478600001)(53546011)(26005)(2906002)(4326008)(5660300002)(316002)(16576012)(33964004)(36756003)(2616005)(186003)(66946007)(66476007)(6916009)(31686004)(8936002)(86362001)(16526019)(38100700001)(44832011)(31696002)(6486002)(8676002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0pZQy9CY21ER1FvYjNTejVDN0ZPVHRoQlBHUCtRY0FqQXJ6RTltRlhGdnFu?=
 =?utf-8?B?TXVMek90cXNEQWVuekNQZDhlcVo0Uk9JVUFyRnczNm1xZ0p3VzRkdE5jU0ZC?=
 =?utf-8?B?aDgxVVdCdi8wV0J6YjkzSVF5OHgwcnc0a3g4TmM0aVp5OWlTKytPNmxxQnBR?=
 =?utf-8?B?MzNlTlJIUVJmQnpNRGFVbWZWNHFVS2xibHFQWlAzK2gvY3hZdUY3d3RqNWFR?=
 =?utf-8?B?elc5ZjVOMWVVcyt3Ly9UQUNaNFozWk12OG5BTERyTG80a0VWL0lWaG9rY2ww?=
 =?utf-8?B?N1NGMGpGd0luUDIwOHRhOUhFSUNMbnljNTNzQ2JBYS81aFg5bDdQZXEyVXB0?=
 =?utf-8?B?dG91ZENJdHcrRjN1UTZvdk9rdWRRLzFxd2NzejhSMFROV3FBZTJRSExzeWR2?=
 =?utf-8?B?cGFPSmNmaHNFRUpyd3dPbmRZOGNwRlpnLzNYQ045eDNGdXF0dW9FbFgvemZp?=
 =?utf-8?B?TWdNNUNZMFplbTJ0dmxUVzlST2syNnQ0MHhiRFNkcVpIU2l0MnFKUzNNSVJh?=
 =?utf-8?B?RWJ2R3BsWjIzbGxJOUxyNWsvM25SQUwrQVBsakp0VXp0Z1had2RwVmh2QXdk?=
 =?utf-8?B?elBvM1g5ZEpOQlZSaml4QUpISGxkdVRNN1dVZXdzSXZPRitNOXk4dlBuai9o?=
 =?utf-8?B?OG5BNGcrdTV4bDVYOTI5TlVYVnZ2T1VOZmpuVFJrL3kvZXR2N1V6YzQ0UEk4?=
 =?utf-8?B?ajZWeHBRbUgwT2g5djlTcmwvUS9CcGtVakUrUXpManhkZ2M0WjZaRjdVdHIv?=
 =?utf-8?B?K0w5MHR2aFhaY3BpTityR2NWclY1YlpRMnBmM201cnZwRmhTK2crMVFIUWFj?=
 =?utf-8?B?Ykd6bHJ2SVVLdTNDd1ZrVzZzMEwxMXR6VmV6cGlDQ0VWSjczK0g5T3AwZ29D?=
 =?utf-8?B?SnNkbUtjQU9CUmRVNjZqblhHUXpzMnJidXB4ZThPOGhuN2dKUld4K0ZaWkNp?=
 =?utf-8?B?VGgvQnJWQWdFdDVleXRpbHpQeUFzSlZNSVdpUkk0cVBGTUFvN0FXOExndE84?=
 =?utf-8?B?TmZMQTkxTG9LN3hLdHZYSC9tNE1INkIxVXViQjRWem42djdZRFlLOTZTeTFt?=
 =?utf-8?B?Z3ZHeXNXV2dHeUtXMllCb3V2WEJrSERxaFFrU1BWUUhQVURXaEdJNWZRSXFJ?=
 =?utf-8?B?cEs2ZWNCUWpHZHgrWGlsZ3MzaWlCZTQxMVZ1NXJCbldaSEtUcW9RMFBsajB5?=
 =?utf-8?B?d3BNQmphMFdiSkptMFRoR0w2UDU1QnBRT0RzUzRQUHd6UVJhVVJLQ1ZSekk0?=
 =?utf-8?B?b3NkOGY1N0ozRTVEOS9QV043L1RrMnE0bm14dkVzSHl5UlRPU0hTdUJiZWt0?=
 =?utf-8?B?NTNqTzg4WkpMNno4MC9TSktKaUpKK2pkVEVaSmpKSC9FVjYvRnVNU2pxYkgx?=
 =?utf-8?B?OW9WdDVZbTZlclUwOUJhdzhSeHUycnNZNnF6cGhvYjFRWGk4Q3dxTEVTMjQz?=
 =?utf-8?B?eUlTTEtITXFPTnZpZjdKKzhkOTl6bmI1QWkxTmR0L08zbXFhUys4aGNtcEdU?=
 =?utf-8?B?UjB5RkoyOGduazZScXlVbEdZcG52MjlGa1NyNWZidnRkVkxXS3ZSWlc0YXpq?=
 =?utf-8?B?c1NmU2JYYUlHSzAyNlErY2RDNHJUSzR6cjNDbCtscjU5NW9ERlVNdkRTTnNr?=
 =?utf-8?B?dVdsdGh2UHNzRjRIR1ROaUR4MzRTSnl3Q0ozazM3SC8weUFWWEVYWm9oUWxD?=
 =?utf-8?B?UVhlMDlIVW9LRWZlekJlZzErR2xsR2JJWXMzVDVha3Z0TUplWEFCTzFpdDAx?=
 =?utf-8?Q?aSYOxFz20+6GLKZyEHjnSXEORtOI83eDlWRI3iX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cd50a8-c0a3-486e-fd94-08d8ee9929df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB3375.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 07:48:08.7399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HoGNm/2QiA7U5vpiyWaUFV98iUXgeOBe9VcYvmFS2YLjKIzyoNX9Kv/bszmhbXp0+AOBitZFHjzK6ngiiXJJWzCuOvnrfFyy99F6oM7Bmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5600
Received-SPF: pass client-ip=40.107.6.109;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------F709CD51FF95E6141BF765C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.03.2021 21:35, Peter Xu wrote:
> On Tue, Mar 23, 2021 at 08:21:43PM +0300, Andrey Gruzdev wrote:
>>> For the long term I think we'd better have a helper:
>>>
>>>           qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)
>>>
>>> So as to hide this flush operation, which is tricky. We'll have two users so
>>> far:
>>>
>>>           bg_migration_completion
>>>           colo_do_checkpoint_transaction
>>>
>>> IMHO it'll be nicer if you'd do it in this patch altogether!
>>>
>>> Thanks,
>>>
>> Sorry, can't get the idea, what's wrong with the fix.
> I'm fine with the fix, but I've got one patch attached just to show what I
> meant, so without any testing for sure..
>
> Looks more complicated than I thought, but again I think we should hide that
> buffer flush into another helper to avoid overlooking it.

Thanks, Peter, now I've got what you meant - not to overlook flush on buffer channel.
But it seems that adding a reasonable comment is enough here.

>
> Thanks,
>


--------------F709CD51FF95E6141BF765C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 23.03.2021 21:35, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210323183537.GH6486@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Tue, Mar 23, 2021 at 08:21:43PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">For the long term I think we'd better have a helper:

         qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)

So as to hide this flush operation, which is tricky. We'll have two users so
far:

         bg_migration_completion
         colo_do_checkpoint_transaction

IMHO it'll be nicer if you'd do it in this patch altogether!

Thanks,

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Sorry, can't get the idea, what's wrong with the fix.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm fine with the fix, but I've got one patch attached just to show what I
meant, so without any testing for sure..

Looks more complicated than I thought, but again I think we should hide that
buffer flush into another helper to avoid overlooking it.</pre>
    </blockquote>
    <pre>Thanks, Peter, now I've got what you meant - not to overlook flush on buffer channel.
But it seems that adding a reasonable comment is enough here.
</pre>
    <blockquote type="cite" cite="mid:20210323183537.GH6486@xz-x1">
      <pre class="moz-quote-pre" wrap="">

Thanks,

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------F709CD51FF95E6141BF765C7--

