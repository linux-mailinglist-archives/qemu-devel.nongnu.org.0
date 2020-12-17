Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659D22DD55F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:42:41 +0100 (CET)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwMS-0005LS-2n
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpwKF-0004CJ-Vd
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:40:24 -0500
Received: from mail-eopbgr40104.outbound.protection.outlook.com
 ([40.107.4.104]:18123 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpwKD-0008Kj-3h
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:40:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4JeM38duLgmJMHsAYtWF8iqcQ4Z0vXOTPXs2wu9LTOXAjIttzpxteK+rBpEl+A2e4eUdIWNLNwEDDZoedK4+OxdD3J/QPEKA6X2H6WGIeb4tUANYTulUG+M9GAaZd8D4zUUFjPfEhWhDG0VYnm3F8OQzewyeVb7mBpUqG7sL9nAvZPFCOd/Oax8strYJfa4PmtmJeBRBc9ORd4g7hBHkzm9IK/hr0ZsjPeO1skopYbMYhg70nremrpFFmkXgV3wIof2yd4mG5UO1vaKYxSGKE8wIT+a17Tt39R1PpiPvfCwu/glEOo3ZlFsq/JzBEkv1WqqXo5Bt9waIPiV/IcdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4FqjSFmMdeHazesWPIo5frdN26NIukGDIGn7qGrK+8=;
 b=gxBCph/jnwF5SekPsrozT/qYV5u96fsUh0iL4/7nHY+0CasIe7lKtKsBrEe3yQKPXzyIcQJ1+tsB2y3LZ/8j6nFzoGrWpDDIFNCFFg1BJ3BJvXtWLpcYpPhl1t77oXk3GdALaQtLlYiINDCdCcTYGfaBaD+hkdzgtnmZsvGnaKE2GkDCC3DcQ479jFqfWZkI+Gqbhu2wbVDiiAOoOAWfHiL/H6LBwRf0M4435W7MtkThx7WqWanQQT/ouK8E8Use7Peno2HAb2ESpy4rVdnke3u5ZhqzfZyUmBEdfjUtKqS0vG8Kw6w3YWXbg5QJrJJ9ygTPmtYXuwdhsFSp3Aurng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4FqjSFmMdeHazesWPIo5frdN26NIukGDIGn7qGrK+8=;
 b=rs9hidLySDe2uhmYU1hFElqDwkbBCX6urQNUADQarkzngoRfv4rsoBJD4SjGyTF5zv2QUSWu/UJgv5pVvlyBqZRHFnILB+kRuzh/M02zz6LfIifUpYuVym1ZaGn4BKte7dQRMctzCcz28bExcpiZB+7pnPLPHfpZOaVFTK0y724=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB5470.eurprd08.prod.outlook.com
 (2603:10a6:803:136::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 17 Dec
 2020 16:40:16 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3676.025; Thu, 17 Dec
 2020 16:40:15 +0000
Subject: Re: [PATCH v9 1/5] migration: introduce 'background-snapshot'
 migration capability
To: Markus Armbruster <armbru@redhat.com>,
 Andrey Gruzdev via <qemu-devel@nongnu.org>
References: <20201217144540.365903-1-andrey.gruzdev@virtuozzo.com>
 <20201217144540.365903-2-andrey.gruzdev@virtuozzo.com>
 <87a6ucgzvd.fsf@dusky.pond.sub.org>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <56e19a00-11df-1a25-eea7-000bfa97de02@virtuozzo.com>
Date: Thu, 17 Dec 2020 19:40:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87a6ucgzvd.fsf@dusky.pond.sub.org>
Content-Type: multipart/alternative;
 boundary="------------D9357DB32241A8BF95AED669"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::22) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 16:40:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cad5be15-0890-4dd4-5b94-08d8a2aa6ec2
X-MS-TrafficTypeDiagnostic: VI1PR08MB5470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5470A63A1F2AED985001F59C9FC40@VI1PR08MB5470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvZQytj7HMU5vkQ+t2q0D7YbVqYC64Vhw9OOdZ9r8GE7Ny73sFTzBJafI7sXcxjZgq/JAPVbo0TPxui8PSe7zGoxPBiQ3ULlZNHQfBdPxYsVrcAwv4RNMKlmOCYlvkvXcPPchkjopxAixQVWRW68wW2VfyQeYZ6VbG+sxcAIwQI771fIXoFGf9veA+F+GB+IOM2AbdnLYzPO5LaRQnibFrAlcOrCkPqaMx82xSkg8bwD+E+m5lo/bcZMTaAQN7IEqTAk5YD2o3DoXMZ9i/9HiHMMifF2877uVxWHocrmimnJylgZK4oc8e20GtPSR3yHjpXlLFRkyNiKhHrlJxH9y1KUMvQqGXm1luc0fGKkaz4vp3WZur1D4Nnqa8ADHcotKQHyx1glIXXvu4P3JrOanPWX+g7gTKIy/dMb+hWGo1G8SVUjRkAf4s3rkCVj/OwHkMCzV0CeBBnyrcVAMnIzCyIccMbdG8K9qzRh6JHePpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39840400004)(346002)(366004)(186003)(26005)(33964004)(16526019)(956004)(44832011)(2616005)(316002)(52116002)(16576012)(8676002)(53546011)(66556008)(54906003)(66476007)(110136005)(4326008)(2906002)(36756003)(6486002)(31686004)(86362001)(8936002)(478600001)(66946007)(31696002)(5660300002)(107886003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T29ON3ZydW9zYnhLVVNoTWYyN3hCTUFMSDNOemcxMklpRWYxbFlSMlVwai9v?=
 =?utf-8?B?aW9Wb3pFUU1PaklsdTd6dUdpS3BBSlNjdnhIN050L2h5NmcwWFVIOWsyZlJF?=
 =?utf-8?B?Kys5dnYyeWZqUVBuKzZqWEtqaDBBak4xelg1dWV2aFJMWFo3eTkwZkUybVNG?=
 =?utf-8?B?YVJ1MVVMdEFCZmpMZzlRQ3pIVk43enEzMVUxRWRtSStYbzF5L1ZWeUo1UXZk?=
 =?utf-8?B?cDBDKzFkTHdOWGM3cS8zVGtpYzV4b0FScjRqR3MzUDBzV296U0dyR0s2R0pr?=
 =?utf-8?B?Y0gxTUdZbEExYkhjYzM3ZzRQMVFWam51blhKclRtZFZKTlFZOVVhaVczMDN4?=
 =?utf-8?B?M3daL21iZVRhRGVQdm1HbVpKWmIxcGNoRm9zaStaeG1TTlBBQVpLaWsyTDFQ?=
 =?utf-8?B?bGRuWk14d0hiYlY3SFhXY29rWXFLVU1KTXBIYlNVWkFIMGZMcFMxZytMYkdY?=
 =?utf-8?B?THMrWHBUWkZKd3RQQ0FpL0pjNVVoT09aSWtXOFlGS0pZTm03bTVyU3Voekhk?=
 =?utf-8?B?bFZuWFFIeE0xNXFKejRRZkNUOTR0UlM0Ny9EL3hkSGF2SHNna1E4VnJPWnEw?=
 =?utf-8?B?aTJpNlZnQjU4NUJjeG5ORk9yYzJoRDBVMXBYVzJKK1Zib1BqOEo4eXBTeEI1?=
 =?utf-8?B?NnRNUXNZdFBTMnhYK1Roa0RnRnVjUHJJdk5sWFFGVVVMMi9lQnFPcmNDNkE1?=
 =?utf-8?B?RWZ1eVV5ZlNaYm9INlk4b2pxMUsvcU9wN2xyUXJ3YlF4SkFUbUFFRzM2MDBm?=
 =?utf-8?B?RHR0bEVpVmhsTS9yVFVMSUoxMTNvZjZXWFh4YnJZbDc2alhYUys4bGNjVWYr?=
 =?utf-8?B?OXE4Z2FGaWY5dGk3YzNzQ3dEbzJRN2Z5bW1Db2lFZURacWVLZi96TnprSzNS?=
 =?utf-8?B?N2F5aUFaYk9QYnFZTDhELzZkMFB1TE8rOE5DcXFseERLdlp4TFdHNVFSL1Rw?=
 =?utf-8?B?bWdTRmlweDhuR0FXakcyb2I5a2VrdHZ0U0Zhb0RjeFB5TVdwSWU3eEJOVG5Y?=
 =?utf-8?B?ZXNNTDB3aTFIWWVOUkl6U09kMHEwNjZxdWVPeC8zTGpUdGVMTjBKcWdVUkZC?=
 =?utf-8?B?OFhqSXJ6S2xuY2tkV1E2VzQzL24vTHBQRlFEcm12Y1N3YXJ6Z3FuY0h3V3hm?=
 =?utf-8?B?bndYR1ZxYTZjYjJ0bmRvSjRWdnMzSGczZlFoTXpUL3JZK2hXYVE5bTZ6Q0px?=
 =?utf-8?B?VlVIdE5nNkJLUlRaN2J2VmRnelZuQjBNb3NnOG1TR2ZYVFZwN2VJUjIrcFR4?=
 =?utf-8?B?VEN2WTFzZHdDTnRONnBUK3VFMEdqdEhhd2wrTDRWQmd1V0dnaEt3WGV5dmlZ?=
 =?utf-8?Q?rGaySO9i3yT6U=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 16:40:15.7547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: cad5be15-0890-4dd4-5b94-08d8a2aa6ec2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8nK5YQTxfqzn0XCNt5gTDo9AB083k1pC6iRchxDm7Qf9Jk/Av93H/DwsTBTFpA2rvhKVhgdNEVkDzkpZWnB2ODxmEC8mjTLAfR3r3gKjA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5470
Received-SPF: pass client-ip=40.107.4.104;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Cc: Den Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------D9357DB32241A8BF95AED669
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.12.2020 19:29, Markus Armbruster wrote:
> Andrey Gruzdev via <qemu-devel@nongnu.org> writes:
>
>> Add new capability to 'qapi/migration.json' schema.
>> Update migrate_caps_check() to validate enabled capability set
>> against introduced one. Perform checks for required kernel features
>> and compatibility with guest memory backends.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
> You dropped the
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
> I gave for v6.  Intentional?
>
Oh no, Markus, sorry, I missed to add.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------D9357DB32241A8BF95AED669
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17.12.2020 19:29, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87a6ucgzvd.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Andrey Gruzdev via <a class="moz-txt-link-rfc2396E" href="mailto:qemu-devel@nongnu.org">&lt;qemu-devel@nongnu.org&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add new capability to 'qapi/migration.json' schema.
Update migrate_caps_check() to validate enabled capability set
against introduced one. Perform checks for required kernel features
and compatibility with guest memory backends.

Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
Reviewed-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You dropped the

Acked-by: Markus Armbruster <a class="moz-txt-link-rfc2396E" href="mailto:armbru@redhat.com">&lt;armbru@redhat.com&gt;</a>

I gave for v6.  Intentional?

</pre>
    </blockquote>
    <pre>Oh no, Markus, sorry, I missed to add.
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------D9357DB32241A8BF95AED669--

