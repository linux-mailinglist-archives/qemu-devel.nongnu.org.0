Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA86C39C8CB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 15:23:57 +0200 (CEST)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpWHM-00007a-Dd
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 09:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWGI-0007mQ-1o; Sat, 05 Jun 2021 09:22:50 -0400
Received: from mail-eopbgr10132.outbound.protection.outlook.com
 ([40.107.1.132]:45776 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWGF-0003sY-8l; Sat, 05 Jun 2021 09:22:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/KyaUoH6Ev98jHOtUYqffSKRFB1mquTFaz26UFZiLLEdhHkerQ5rfLV3PchOl3Fc7pIDdH+EQwf+ptfiyYuYrrLkKVNu8PudZW1+q47Tl1fmgbhlySR9708z0Kb6uwBPs7MaHaTQLx60tJjU0r8kL9y343SdTXzqdPbaVnsLlnlpoVrskzZSmUpvjJf+y5xRZuZX9SOK0KkzMesbSXD9dxNMSGYDTmcActhPy0eZ8UAWL3xBrPJ98AdJFGZ/qm//KgZnfVt50aMBXUek3RwWMb2TXWyN8A7DFpYLLEGKG9VNTsj91VTMCRRdpqB+u3GxnWwlWm/PM26BmmHh9bX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWhiff84Q7bnC6jB6qgGubX5F4BmYKsBu9j4SAd6rfo=;
 b=X+ZTQPvO8AEpj3nqFMuAQEi4NMjBeU194IzCFNrOJwUdoJbThxaX/6Kiu2B2x5BQm9FWcKD/wvn9J6SchuDgELaOWoUIwDQhzlQjFSUCDMiznaGNJQJBP2lvDwtCCZi/qVE8IZ9xA37a6cxvGT8xksWVWNxbKDC+SkTe1WF2+Uxo8uAHVKREsXsFd/RtrBKVBOG7zsiicgqhaG+benUuj7y3XxRYRq+D1sa9eszCEwFZtiVmwlUTvqexw3/tFTIRhKdpaxgrMqZSRVtICn498lnALy4VcNW0QPq6bbnOI9tEfLDEzzh+EZIEFdZwat4HZjhWRpFfjTZGhwrsfa88zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWhiff84Q7bnC6jB6qgGubX5F4BmYKsBu9j4SAd6rfo=;
 b=lzowkStsdMQwfzfVwUSyq6pzIr8OlPoWa0PuwM858MBFz8M2P+kejmWYTCwRNYitTBiFaRfMabbsRE3bjmneqg/QmUZf5vzc9Ix1Fqjyy/f+RvDCDXBO4xv8D9j0aKc7V7WZZ+aY+a3sGGwGGuJwNmrRCBQ22bXDhmPqzMRzZng=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2450.eurprd08.prod.outlook.com (2603:10a6:203:a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Sat, 5 Jun
 2021 13:22:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:22:42 +0000
Subject: Re: [PATCH v5 09/16] docs/devel/testing: add --gdb option to the
 debugging section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-10-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2117203d-f7f3-a72b-5da1-f093b994fb09@virtuozzo.com>
Date: Sat, 5 Jun 2021 16:22:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604091723.13419-10-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: PR3PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 PR3PR09CA0010.eurprd09.prod.outlook.com (2603:10a6:102:b7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Sat, 5 Jun 2021 13:22:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0fa1fc-519a-4170-4de1-08d92824ffd5
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2450:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2450B2FD062293A6D17D3416C13A9@AM5PR0802MB2450.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62QAsD5BClfQZS59s8RVcFCgpT35FQ+UOLPSN+9tJ8Uz4eIZCcS59U70Ibpjb2Ifh95H7Z/7KBsAd5I/3DIbQaAyyyOS6XFMdcA2iMKmVNU14FKJ24GNnE0qY/xTF47sT6nfEDCrGvmc72I2UT9gUgcITLfIENQZgaZ6YbT4Bj6xiTOfnzKNwxyju+b74ZGdylmxs4IYBMVwaQdGcmETAs4AamUek5z0Aq55yraPQxc5XIxmWrGQXadQsy6fY3lBzNBxpG7B7bywfTzJDmuMWwsgMt27N8CmrqpUtKaIpTIDeWjuE4gg8FxfbHGuwq6DAqo17V0c8EnoG4Fvb1aEt7KJ8FUWlF9/8EmrA9zhn1y8GksfTuuvWF5fh1qyld0nU01nwucLYSuLrMS3Wt4lVfE5roUfqukTsFXI8YaliNR99PyzLsrz4OQgCCLeCgfiWp3tE2dsyHKwaH/P545SWQKOH2nve2QNX4cnjuNdDzna1BbJvT8QfJZy/4Kh/SSx85K2La6/kUkipYGDUV0uSytUUkULaemn+eXpQTOF7eBgRzsvXWq/SFFraMPy+UW+sbcf+uSs68Q7JBEYevcohLflwLjj7xo+JZ9sSzI2h9iK781nmMfJkMl7x5Oi3NVMowZ4OzDMLz6q0g0HSIpHSbkQB2c+JmRju9FmHx8HPYf6H1reD1t93C4cjthw4XcYsnhZ8C6H7OrwN3T0ayWEethZIs3xPh6UfYIJAgm9gIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39830400003)(136003)(52116002)(36756003)(316002)(31696002)(26005)(2616005)(4326008)(2906002)(956004)(16576012)(186003)(16526019)(54906003)(5660300002)(31686004)(38100700002)(8936002)(86362001)(38350700002)(478600001)(66556008)(6486002)(66476007)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U1MxQTBPcHIzcXg1dDhoUGRFLzhpNVJvMWFEQUNEY0hjbFVpL245VXNRdDN6?=
 =?utf-8?B?VThzZkNEVUh4Y3JoQTFuSFFYaW5qdjZHQWZ5cnp3ekdyRVUvaDdYQXM5SXQ2?=
 =?utf-8?B?Nml6MFlIU3FBTXBVcjVEanIzSzBHRll3Yjhtemc0MCtvbTJIZTQ5dUE2ditk?=
 =?utf-8?B?azJPSW51ZUozMGpwM1oydFBkd2RvOWJReUJLMVc0bVNacDg5UmV1TWdpNnh0?=
 =?utf-8?B?OVlzSVZmVkJ1RXJVbzdkYVhmcE1xMmsrcm9raitEeVZTS0hyWXVlSzF4QmZD?=
 =?utf-8?B?ZGFiTWdMMm4wc1hLT081THZzNnYybjd2Y00raHBYclR0NmxPcElTK3RFd0Z2?=
 =?utf-8?B?Ly9FWDJSOUI3eDZ6bVU4M3pHbkw5aDl2Nk5iR1NJaDNjclRiU0RSdTg2OVhD?=
 =?utf-8?B?TGViYm1wdUFqYjE3RUQ3VTVwZGZCRU1qcmFBSkNRUDk2MUE0RDFWRVd0L2h1?=
 =?utf-8?B?VkxHUkp2UnpvNW45NmtLeURRVHFFemNpb1dvSHZ6eEFuM1RTTHk5UmpnVFNl?=
 =?utf-8?B?anJDcnArUldWdDdLeWlaR1kyY1l6Sm5hTFF2WXkwVXNQUWxZNStBbXcrTGMr?=
 =?utf-8?B?R0x3bVFHY0p2dTR2UDdnVHpibTNHNWpTY1c5NUZFUU84N1JSSXRTZmRPQUw5?=
 =?utf-8?B?WTVQajZQRzlsaUEwNGlITHlnd2hYc0ptMDJMTkVNaVBaQ2JVbzdPWlR1NVlx?=
 =?utf-8?B?ZzNrRVRrRlVvU0hUdFhvTWM3TUl1aUFVbVhwV2pnamJlOFV2U2twaGUxdVJW?=
 =?utf-8?B?YW9uQkoxcEhhY2JsRkJja3FpbFhhV0Z0MHlMaTZJTldlTlFDMktQQWc5MjBT?=
 =?utf-8?B?Tko2OEhjTkNxUmZjSGxmU3BQcE1ocE9qZm14OHBiYmFWYk5ES2NDaThuNzYy?=
 =?utf-8?B?WnVoYm16K3JUR0ZWa0twVHpKVzd5R3BZOWpHdEFVL3dGa3kvaGd0UEFlWll3?=
 =?utf-8?B?dHpBVktQZ3FiV3phVkt1N0w1YVJOc0ZJZnpnaVNLTDFVQVNHUUg0b00wU2Vr?=
 =?utf-8?B?QzBZMGxoci8zeHFRY25tYXk0M0tKckozZzhud21aVWEzVUdYakpMaksvY2R5?=
 =?utf-8?B?VHJkeFJhUy9qbXNVRktrUXRUeTBSa2xzQW5qOXFPaWNyUWlvbHhVZ2o4NG1a?=
 =?utf-8?B?SnFkMDdyOWl6MjdiVFV4d3M1aXFBLzhHVEc0Z2Zic2hVMUpPV3haQnpJd08w?=
 =?utf-8?B?cURjRUdlUlgxODc1QUpJSkFhaDVvM3RQbUxhTW1HTk5ETEFJNVIxcVpETnd6?=
 =?utf-8?B?eGtqd3dMN2FUWW5PQlZRS1ZWYi9rNWNDeDZmeHk2dHlObXJ5TnNXcHUyMi9C?=
 =?utf-8?B?MmRnTTRENGVSQk10R0pXMjkvOFlZS0RsUUhTZG1ZSFY0eTF5eFluZHVyR28w?=
 =?utf-8?B?KzlUbUhXd0JCWC9vV09zMjFLdDAxZmtSa0RRdGtyblpMcGQxUFplRVNTOFQv?=
 =?utf-8?B?N2xHQUVOSk1XWEx2NkR0M0lsKzVnRUFrRDNXamFrWHkrbEl3WEN3SXBDb2wy?=
 =?utf-8?B?OCsrVEl3bkVteWxiWHI0dnBxUllPcnVwdXNvUEdLZ2pxQXEzT0dNR3pKMHVm?=
 =?utf-8?B?dzNjK2VFRHpIMFYzdTZvL2R1TzdHMWE2VEd1NzZyM0x4dVhoNjVLNWx5MEpY?=
 =?utf-8?B?QytTb0xrN0NjNU5ZejlBWVBIR1d2eUErc00vZEEwcmtDcXZBMEQyMnlNSWZk?=
 =?utf-8?B?bnFsc25SSGhudTZoNkRNTXB2TGpqNFhySCtMZkFKdzBCc3IyTnI5U0o0YVhs?=
 =?utf-8?Q?jRIcZtpiwKdL2y40aSAfEJQnwSPFq7dZ2I+WbVF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0fa1fc-519a-4170-4de1-08d92824ffd5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:22:42.6963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABz+AlygxzSKj4A24/rD/uRmdt3a2/p4MzijaAndqJbvIHCnJWK9z2RQmu4ql5zsm3AVDrxdsGC6gmI8vz2CXG3GP56vAxbZr2BI7hukWX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2450
Received-SPF: pass client-ip=40.107.1.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7,
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

04.06.2021 12:17, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/devel/testing.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 9d6a8f8636..11a0359218 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -229,6 +229,17 @@ Debugging a test case
>   The following options to the ``check`` script can be useful when debugging
>   a failing test:
>   
> +* ``--gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
> +  connection from a gdb client.  The options given to ``gdbserver`` (e.g. the
> +  address on which to listen for connections) are taken from the ``$GDB_OPTIONS``
> +  environment variable.  By default (if ``$GDB_OPTIONS`` is empty), it listens on
> +  ``localhost:12345``.
> +  It is possible to connect to it for example with
> +  ``gdb -iex "target remote $addr"``, where ``$addr`` is the address
> +  ``gdbserver`` listens on.
> +  If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,

Then, --gdb here too

> +  regardless on whether it is set or not.
> +
>   * ``-d`` (debug) just increases the logging verbosity, showing
>     for example the QMP commands and answers.
>   
> 


-- 
Best regards,
Vladimir

