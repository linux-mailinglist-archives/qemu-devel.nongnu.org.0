Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2730F4A974A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:59:28 +0100 (CET)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvNH-0000N7-82
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFumA-0008KC-Ao; Fri, 04 Feb 2022 04:21:07 -0500
Received: from [2a01:111:f400:fe0c::72f] (port=8356
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFum6-0008Ov-20; Fri, 04 Feb 2022 04:21:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/3U7lW2n/J1U/In3kn9ADxXzZlPR29eIL0U46Ir7j1iKiKRJ38I+kKSOmuV5kCrYmIX4vqFe4WAJtnKmfQknpUKLZRiC7dOXL5lxKQLKJGsEajt84f6fGc5/V9nulqHteX44z8m32xaDf5fCnFMtPH1QvRUOnouyxfePh6ZNSoO7wkB/msPjmqKBikcEJpaBfEoYq1XJhQBBES8wNzsju1qgie20sMMvDmCtnSHzxJagX+iYRpT04H+g2hZWWe3D0i7JiZwRuLqG9mIsLn6Mo6GH7ZnQT/Ux3WyHL3rAJ3iscwfnT5QgPiuvLbRZeRZVWWUSxhcj5RKP4LFVs6ENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fts6Fjx0qb6NN55Iy6KyR/ax4zm5e5zvnlJsX5jV2cg=;
 b=Rtvf1N8XzagiDCTpDLRy6euf5cxDV6ysOvLPj31riwBDrLwe4UGITR8rt59Fb/njNcK34PMlvdiKN/7wOQlGKqTfccLnq+C9JlbchfEjR32qfnwLuQl3JUTa45Bfd56k2YqWkS0L3MpRGcJHnCFVW/b6vj/dRNk2FaLCyuXldCM2SiraDsGA7sxBQ64Ch0Tp4v+JvwDHMKpMTGKqpYGwf4DAJnnmawEhRDbnkTcjOLphgnikgIog1uWV5vBaGGl6b1dbB7Uq6AqKvgErOxiGYbHXZIsXsFatbcX8T43in3a57LPz+gOwo6ExGtpM9w75WMxi61yq+Kl9VEWZ1qOhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fts6Fjx0qb6NN55Iy6KyR/ax4zm5e5zvnlJsX5jV2cg=;
 b=XHB0kXoGO2uYM6EntH3cUcxwIx5h3ZQH+Jfv3eh3KrOuVAkCcBr6Nb8Bv4yn065nu0ToDtK9pP/rcljJq8oTe4Jf80DfmtaLj460dhfjU82YbnKLpB5X+LjorSIm36bkFpVj4tpYjErX6XpJYhKPFN7b0Tv35dFBXdf0ZXkDY0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0801MB1754.eurprd08.prod.outlook.com (2603:10a6:3:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 09:20:57 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 09:20:57 +0000
Message-ID: <d1116f7e-7f7d-fc4d-f4c5-bf07d96a321e@virtuozzo.com>
Date: Fri, 4 Feb 2022 12:20:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/7] block/nbd: Move s->ioc on AioContext change
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-7-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203163024.38913-7-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::11) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baa23b56-4f8d-448b-01c1-08d9e7bfa6cf
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1754:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1754F1FDF0BA2CC97E55F2EDC1299@HE1PR0801MB1754.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1KT/3jtgxl3oVIcgZXjILkKzQwupeUIpnRA/xvbsxP6BwMXu06ucEbZraNqjxd2mo8eKkMxdLHS6D3JN4L3VYlKlU9pn68vjLcAP8tKOdAMIETqr4m4gE7IXu7/T5WqmGNL/1G176jFyswAOtjIsgjGrt0ug05y8Q26wD1vHNxWq0MwxL166z0wVvfWn9oIehFNIrpa3qRrm0ZSVaTvCln772o10DV31CjALEEsTTpwJDApATM/cDB+FMslQ+RYFboosFE6vwJmWGFkl6ePRS1Taoq6oPMMbczxdl6BrdsNFjVE2fymC3V5/a5BbwiSAphUNHya0RbqFnbWak8wsGlgqmMB1AzKjbFSz5pj4g2/qQKdueUFgxtMF4nCLTNacXENOnLJ/XaWw0XBXpRSK8FIwUh8MFdm6KW7ZmdOp6gxvgJQs38zBzAZapvA8neD9iI+cH+erTg0K0ch2m7vrcs/DW9SFDqKzw6lHAiwydfNaLFabOaomVmztIiWDEifEwATOmZHpnTsPInjy2RGSAaZtWDdz7vAEUOs+VyGt9HxCR1REFcrkmJmLnAhOflaXihraxVxDsTa/j/P19wALO9F+W8o7wq+UmQCHuXNC3JP5d8cF9aXcLUGiC+9HHxGzbOpJ7pMqJRqScV44MBr8JPjq+mAPkaO8FFMznhnMNSI5UCMIgR8YkzwFRz9WIpYnn9rCLqgU5RCeGC0epI4+cdnH8GWieoSWKmieD9+iou6T+3wndH5spams+LinfXWuS0GIziPEEcc1XUUQ/Bi06b4hbIiyWrMdivNhqpA/SVFtUTo9Iq6SvWxwZ4oe6ljEL3beqmiZzopRKK+frMGTQwX+2J8VsM0WNT57E1QnPAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(508600001)(52116002)(36756003)(6486002)(2906002)(4744005)(5660300002)(38100700002)(316002)(54906003)(66476007)(66946007)(8676002)(66556008)(8936002)(4326008)(31696002)(186003)(2616005)(6506007)(6512007)(86362001)(38350700002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNmZk9rbHl1dm9zelhhRkx6RUdkUU96bllGOHllUThjVGd3aFd1elZaNWwy?=
 =?utf-8?B?ekdkS1ljY0ZIV3VENzlhaW9UUGFYQVFsSW5nbEJZVzdlcWlKbXZPbEphTFNo?=
 =?utf-8?B?djA0VmZrbFM5dm8vOGY3WFJCNFRkUExXaUFrQXUrbkpxMXVOenZmOVJyWTFh?=
 =?utf-8?B?STNaVnYxazcvU1hQMkF3UXZRN3h6cFBEK2wxdjdyS1lhUS9mOEtnZzdVRGxo?=
 =?utf-8?B?UDZhalAvaU8wSngrOTluQ1FIOC96R1pxQzhRU2RwV2dNcGxiOW1FeGg0SU5x?=
 =?utf-8?B?VGxTUkhGTWQ4T1FuUFN3cWNpYkRwTlVOaWgrMlBBRlBjN2dRU1B3bnBNZWhp?=
 =?utf-8?B?bWU3U2Z6aHJqR1BQcTMxanlGN3pCcE15ZGY0ZXJaWFl3UTJSUUdHUkxaZDlm?=
 =?utf-8?B?VE1FMlBlNjg3c2pYbHNzeEdVa3FWVjRhSThvald6TkxOTWR4cUtyNm81aXBK?=
 =?utf-8?B?MlVWazVVMytBbWhTbzVuckk3c1RGZ2tMM281RnB0ZUtqN3pRanAzdE1NbXRi?=
 =?utf-8?B?aFlpU1doK245SkJYMklDZ2gvOCtVN3ZRZEFBOXVEdUQ1d2RQVTZiQlBnNFl6?=
 =?utf-8?B?S3NHaEpZR1FjWk80MU1Za2EzU291NUFzZ1pGYWZXVkxCQXNuU1JFcHJ3Q1B0?=
 =?utf-8?B?VUxGK3VmZWtWMUNPdVFKYUx6S1lnSVE5NmFKNm5YeWdCSWNDbFltS0N6L3Yv?=
 =?utf-8?B?WjNkeUQrMW01cktnN3FuR2lJRElQSExzdWNVWTI1cUI5VzNNaEpmazBDNTg4?=
 =?utf-8?B?MXZuY2JkOGhlZFBhREZhb2hXcnEwYk1iaFNGRG8yN1RKUGRIcUprT2JkZWVY?=
 =?utf-8?B?NDFYc0svRDQwbVJLWCtzVmJhNkszMXFJaVBNRVc3dGR6bUMzd09xVzU5M0c4?=
 =?utf-8?B?ZDRrQVdmSTdISlkrcENLK3lWOVNTazJBWm9teGQ3N0dPSWhJUTJOWGxGaXhN?=
 =?utf-8?B?S25oVUQ5K0lNMktCQTNzaEJlYmN3SXJTQWlFSXZvTFBXWDVWWFRUWnUxTHUy?=
 =?utf-8?B?SkJVaUlTcWszR1ovTzlubzNNVWQyb21uRW5SSlI3VmlXa1pyMWY5THdkL0pM?=
 =?utf-8?B?YkJjTk5EakVSRUN4MnpKZFRBZmNtdWhWaWZxeElqMmI5STZ1TGdzdGxGcm9w?=
 =?utf-8?B?UWNLY2pDeXlCY2JVdUMrb3V6RVFaMEhWaWxMRFZWN2ptcmZDbGxmWUVYREFN?=
 =?utf-8?B?bGJkQ3lyalhCMlVoVWdDQlFxOUpXUm1WVDFyUGxZTDBTMjJvQXNVQm8yVXd3?=
 =?utf-8?B?ZXhjZWtEZVdZWlUxemQ1SmJMY3A4Rm11YU52RFR2UmZxQzFiL2h0dlBqdERN?=
 =?utf-8?B?bDZ6ckEzczlHNllpODJyUzVXUzQvL0U3ZEVEVjNWb2JENkxnMEYvRFZPd05U?=
 =?utf-8?B?a2lJaUIrUThKTWZUWUx6WjBWZmZtbEFpNlFvRm9vQkdzczV2VGtGSkRHSW4w?=
 =?utf-8?B?dXQ4N2YxTEZPNEcwb2toaThoM2F0MERKbENuRzJGZTM4empEN29yRlh3Ykk0?=
 =?utf-8?B?ckpPdmduT3Y2Y3QzNlVvbWoxUWpKMG1PeG5DTXBLck1GemVvTkhKblRweFRF?=
 =?utf-8?B?eXQ1a3Y1TGVzdGJwdHRGNDlteHhGLzMwajY2cTBKZnU4Mk1hY1JIYXFZak1w?=
 =?utf-8?B?MHZTMVpUeXZRRHJ5djBiNEZJZ3RvZnZ6QVUzaFJSRWw1UnBSUk1aNy9sY0ov?=
 =?utf-8?B?czZnWGFhRDFkeTk2SVpYN3JrM2thZnF5NDhEVWJqN0JHOCs2NWU1VGxrNVcv?=
 =?utf-8?B?UVQxZHB1V0RWZkV1dEd4TTBhdDJQTHcwY2pNc20vSG1uTTZ3TWU4aWdRaS81?=
 =?utf-8?B?RGdnTnlnclY3aS9PU2xNSDUxbHh2Z2NpMjhtN1BmVVFnSU5xaTNMZ1RwdHdU?=
 =?utf-8?B?cFg2STV6RXRCcUZibzJ5VUhERXNGakh5QnNpRUlLUHFVd21UamZhdGdGaUZy?=
 =?utf-8?B?VVgwT3J2VVlxajBPYk43NXdjUSsyN3M3anpkZU8zTXdKRWJxYkZiYnF0aUdp?=
 =?utf-8?B?bXZIWHhaSzlJajJmZFNjVnNRNzZIeUVGa0JFZVdsN2RLaU1qQ21OdGoyOVgw?=
 =?utf-8?B?MWRtV0ovYVNnMmhucTE4Vmtqbko0MmluV3pncU5HS3k2Wm9iaXRRcFJ1UUlX?=
 =?utf-8?B?YlIzeTdGdXdqT012QkJXTmYvWVR6end0alh4cWpRYUZzRlZwbVM3NzFwK0tM?=
 =?utf-8?B?QzdablNwT3BNK3d0aENDVnpGMTZ3NWQzZTRMUzBUZlpHS1hRUy9Bb3hhbmhN?=
 =?utf-8?B?eDNsUy9sYm9BWFdpVFp0bkdWWWFRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa23b56-4f8d-448b-01c1-08d9e7bfa6cf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:20:57.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgF57ot97NQSlwsZSP0ED0YtOxUb2hnFkrqjvthuJbQQmE42Qf7mtGbj7ingy3+9aReGQcAAeir0mL31QxuwtdkwVkl+SIUPtgXYXcqD+98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1754
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::72f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::72f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
> s->ioc must always be attached to the NBD node's AioContext.  If that
> context changes, s->ioc must be attached to the new context.
> 
> Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=2033626
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

