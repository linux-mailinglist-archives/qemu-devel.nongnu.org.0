Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4C3FD96D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:20:39 +0200 (CEST)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPEJ-0000B7-Ux
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLPAS-0006Be-Ka; Wed, 01 Sep 2021 08:16:36 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139]:28512 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLPAN-00081t-CX; Wed, 01 Sep 2021 08:16:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbAM6ayULSINtb09JPLZz0hb2MpJhLrEnlMAbDit4Tc6z/p/E7KzzhwAWUWZdjWhVTwRu5YftSR0gJ9/tevYogvUFQFixfLqrh6q2gS9XPzsvQ49mXEP6iUHuyGqAzcFuhHtryYO8fJCfywdQ1x2IFl6EON6h36qZA4Hm7UNd4jvHUMtEBP+2KTpsJIib4+WL+GQJ5pfAdhlIIH/NilkfxlFdsmHqyWfEijIh0toIzKSup+3ahpSDIbGzTcaVTws8gZdzD4+3lGgenbKpq+R4sWK3TbucTEEOMPJd7Ak6l/LNJ0zIL/0IMsKqXBv9C+Br/XRZBFB6Mg6HizcImZ9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HKLgCzaFqigZPrfVbNLWipps85+B488FR0KVdlYCzg=;
 b=TChV4L2Qbx1dmcxHtDXmQPZx++YTasOWEXuRCqM5N+yARBjJFXPMKqRxtY7mJ+QR2mOxUfRP3aUm0wIi3cdYr5l/f95pIt2GNINGabIszlEuwOpNmM4zeIU2spF0tutXd0dg/ermkZQINPYGyNzKrww913/i8qAEfAkz2bx+widfLM6EinFa0ds2ciuBPvHYsg6t4OaoBHwzw+p+RVKDojyxDRVeAxaj7Iexc89t2X+Cx7oL+AdcnkeodT42VhmoiWJnDpW5wdUWu0WSfXOF5ChNZecowjdXn/GOZDsyqi4Y2UeIJlwgNjuHVzkPLEKWttbBj0uc4dv9rn636Z5VXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HKLgCzaFqigZPrfVbNLWipps85+B488FR0KVdlYCzg=;
 b=S0vg+V6AZH4m5n37yBu/bwcufN6248AAEdGyjD39SRYeHzAx9XglniwAweF/zgbbuQyURRl0DXwekK6xnQ/UIbI6n8c5RvItTaKzPuVGn/IWQ5WFpJtJv9Iuy12Sjw4jcoehd7XYDSVsEBhWF8rVwuxn0oR2lN/IMni+HYntQ/Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB4814.eurprd08.prod.outlook.com (2603:10a6:802:ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 12:16:27 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 12:16:27 +0000
Subject: Re: [PATCH for-6.2 v3 10/12] mirror: Stop active mirroring after
 force-cancel
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-11-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6a237782-bb93-9a13-d742-144425a071da@virtuozzo.com>
Date: Wed, 1 Sep 2021 15:16:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-11-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::29) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 12:16:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e0bdcf-1a31-43d6-73d8-08d96d4252a5
X-MS-TrafficTypeDiagnostic: VE1PR08MB4814:
X-Microsoft-Antispam-PRVS: <VE1PR08MB4814736CB683EE8D131088F7C1CD9@VE1PR08MB4814.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6N9kNqKV/EGR4lx5e3zxlSNIa7Yp1FL0Ciby6GbQNrOYnMnWFu686SUUTno0LR46JcenCl7IwKgt3sLX2w4Uu8N4TglEUWz/i4wFD4aYDHsrLImeO0k2V3RQw5KfLUBPxCsk8636bxkFVaHFoWzKr8wrREDvl72CYA+coVSYWbveD4ZVVJ3pqmqiLD7w6to6skfyfLN2/VMH1IPk24aD+zsHjDv5wuREGZfUIDHRxo8I23dFNWEWw8rqcTdSwQoHev3lSGvi6K2XeJQkZmv30DBQlzGKtM9dTiWQVxdvVQNd2D6fRy43EnzjsblF6IM6zQESNnuKhmxfzP9aGTQAUHWVFagcPKqtFpDeT2KDgeHTsm3MUjlUMOFuFlv1SW/VydDDPTa6TJWT4WqwO8dZ6gLy+sFTknzvsQt0rSRK/l6QaBodC2UJ7Fh7ApPZeHkKlc+ZV43/qay8NLDmDoORFOdmOXT0JQap8CVNA7G9LRh/R5QYs8McZbSTmUo/bWAvMh7a36510MvQm6vLuKXJa8F8FDE6SF4tUalhcd+60I19BXmT+Oj3kwhR5rdd2W/3KHn1Kz4HvqWTpgfSQ7dFIHsYAvuVOJcp4FRfN4puxdp1nWPQHOzvNq3chvOYSbJ7gzMsxBlqJSCjA6ZBwRg7RmzxMxCSMpNqg4jUaQVFvGAcHrQ91Mb5vE8HBXGgW+UavpFTHPqyA2H6fVinPE7tcfuxn1nAMn5fpET9CaRjJnwkpcaw+VmVZByCITR0BYyPKmUAhXlrvCIBfz9F6d3drA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(376002)(366004)(346002)(396003)(4744005)(2906002)(4326008)(31696002)(83380400001)(86362001)(36756003)(2616005)(956004)(38350700002)(38100700002)(8676002)(6486002)(316002)(66946007)(478600001)(5660300002)(66556008)(16576012)(66476007)(186003)(26005)(8936002)(31686004)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0hKWjhFaWJ5eUdlcnloYkoyRzhpU25YVlZaOXVxOGlORjYwblJTYURNZ1N2?=
 =?utf-8?B?OXhEN2I4ZmtEdkMzb0JvUTJCelF4cTNzcDhjUGczT05mSVJNSjZvSzd2a3ll?=
 =?utf-8?B?c2FOZ0xwSFUrdWJsUmprK244dWozaUV0cTJnR3lDc3IvSWk5ajBQSkxVVC9X?=
 =?utf-8?B?bHFWWHNxaGtuRE1mK3liT3JjdFNpakZ1NEYraCtCTWZ1bFZDM09HTVRuZ3dv?=
 =?utf-8?B?TzRkTjhEL3p2NkZ5SW9OYzJxZlB5WDNCbDIvMjl5Qk1MaU1yRlZPOVFaMFRt?=
 =?utf-8?B?RkRSZGNCa0t3SGxNNVBMVDh1cnMwZUQwVDU3dTR1aGpoVzAvL1VNNnU1WVV3?=
 =?utf-8?B?T0tuQVFMak96UjkrYnJ4TTRMakx5cWg4T2poanVyMXZjTFVXdTlhSnlnUDRl?=
 =?utf-8?B?MkVKU0FmZHpWSnpveWp5Y3hsdTZIUnoza2lMd0plcmZRZm5PQ29TUW53RzJ5?=
 =?utf-8?B?SWxCM2IzTlJxVFV5ZDhEVTdsNmUxeVdmM0lQdFkzTktpTGJ1NGxQbU4rUHpT?=
 =?utf-8?B?aTlaRmduQlZ1VmxZWXE0WkFvekIwZ1BDeWtadVpQK1hzYmx5YkZ3Z0dzK0g5?=
 =?utf-8?B?d1ZSd0JjRjZGYVQ5R085U0E0K0lqKzU0NDZCaDhteDJtSWx6SWtjRlBPZjh5?=
 =?utf-8?B?aUxDNlg4SlhTOTg0NGtSL3ZGdU4veXFCa2o2anNYTjlxdCs4VElLR1Vtd1NM?=
 =?utf-8?B?RDAvUldqSWVXUVpwVHRyK1F3a3lHNjAzdFpDb01TeFFFR1hlbSswbHhPa1Ns?=
 =?utf-8?B?RnZGMVpWTkFOaHlRbE5hT05CZjU3OEhnNks2SmFNMi9jQlNKcW5UMmw3Z1BC?=
 =?utf-8?B?OS9VYlhuaGhTU1owWk1uaFhTRWM5K2hnNnltM3JZdjZvZi92YTQzVklTZjBW?=
 =?utf-8?B?bHFXeVpOTHY3R0E1Y1Q4VUZwV3FoZW9STDI1TEtuRHNDRXZobDAvcUZBckFQ?=
 =?utf-8?B?S3psaWIwMTYrYXM3bWpxazYwZzVJM3l5NWJ4MVo5Z0RJVjB6WnA2MVZqaXYr?=
 =?utf-8?B?eThJWCtmdGp6MzNqaVd1Q1J2VmlyeDJjd3Y4emRrbnJEOW1DcWtkSGJ4SWpY?=
 =?utf-8?B?N0hWVTA5MURtTmJmZWtmcjAvOHVVYTY1U0VZRCsvSC85Z2g3Z0E3T3FhdzRy?=
 =?utf-8?B?L011d1BuQmVFdHZSUzRYUU5IdXUvV1IraEhvRld3ZHJQb0JpNWVveC9idUpi?=
 =?utf-8?B?UjhyVnJoV2c5cUxaOFkyVzdOMEZMbVNyZEdFTHIxR085MUlVUWJpRHlSMFNO?=
 =?utf-8?B?M0IySE41UnBOWWJsVDBNWlM0OFVKSjJpcXh1dUR1dC81YzBNc2FmRnI4aE00?=
 =?utf-8?B?cCtVWUdvdnNXeEJpdWt6Zmd2bHRxVitMWEhndmtXTGdZSVpJRnhvZ3pOTlJN?=
 =?utf-8?B?dDBhMUxwY0dCd0hrUjcxU0dpa0txUHVWd3RialF0OXRQeEFTSlVTR3RJVnhx?=
 =?utf-8?B?cmF1UzZGSXF0QTRBWFlnRXNaWGxxclRGRlVUTGNQeForVktXTmR6NmxiWTda?=
 =?utf-8?B?dk1kUGsyeFJUS1BNQjFmT3F6ZUJjbldaa1B4RUY2V1VYRlFIYW5ldDFwSG5V?=
 =?utf-8?B?V01tenRobm1PaVpKemt2enJDYUZZTXd3dHk1TUNST3JmUkExaW1ua2VVNko4?=
 =?utf-8?B?amVtQzBXb1ZMYkp6RkxWWDFEallmUkpRUmVjaS85SmZpZU1VR0l0WDQ1NFVx?=
 =?utf-8?B?ejdUdkswWDUrQU8zSnJHK0VjWHVTSzBXdFVJS1AvS3FqclF6ZHQ1TUFOOGZN?=
 =?utf-8?Q?X6GgA8yaaIDDHkGTO0D3jB2PDuocEuOb0YeTjw6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e0bdcf-1a31-43d6-73d8-08d96d4252a5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:16:27.2644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAQuBfs6vdZyrIV71FYj7pXmLFrvgambUY/r0HWC5j5TeyKgQ2qLthIPR+Pm0XxCSbW8w+qncdmJKcWyw5lZ7yeCBkMCW+iRvJwHsMUmLE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4814
Received-SPF: pass client-ip=40.107.20.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.08.2021 12:38, Max Reitz wrote:
> Once the mirror job is force-cancelled (job_is_cancelled() is true), we
> should not generate new I/O requests.  This applies to active mirroring,
> too, so stop it once the job is cancelled.
> 
> (We must still forward all I/O requests to the source, though, of
> course, but those are not really I/O requests generated by the job, so
> this is fine.)
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

