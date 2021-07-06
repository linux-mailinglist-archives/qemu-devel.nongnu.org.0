Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA423BC88F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:36:44 +0200 (CEST)
Received: from localhost ([::1]:60860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hVT-0002QK-Tp
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hRG-0006mH-CE; Tue, 06 Jul 2021 05:32:22 -0400
Received: from mail-eopbgr00112.outbound.protection.outlook.com
 ([40.107.0.112]:56039 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hRC-0007oX-Pl; Tue, 06 Jul 2021 05:32:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N30IUGvfyDME2cRqxuqicueCiw6/F/RaybJyRE6oLAjugtgFrkdNx04yXt/WKunO4UqRgNWt8uJfaifBCIjgTbhatxQ+M2f4RQGjUyb3O09IdTkAdXr3msx1XqZJibFBnRyv4nJuDC4E8s31Y5N0wbrdzguKoXAdLSB1BBk57WSNXjBcn7L7Km2c8FLx7H0FgT2L5cblx2wdBbEx1A54QOIIYPcJTqp1lAuuau4yCSkeUvQSQ1OpC84qkPTw0ONKUuJkar9qrMzgeJSFYAG0og5/1oCrehoWVm2GP9NbiFINaZNRgks2G4YipWLoEXU7oEWTdSsFILfJ1IWyS8LGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1S3b6MwZK5TFo9eLmyPfV+8Hx2YcvIy0tyYYPe4ZAI=;
 b=axerOXsgEP6Pmc54+r6ntvmPwp6Ol4ZE8AcZc3YmLGTOZujL7Auxkg6E533FPfGG9wmGFfMQqtKrJECq4INs1IfYivLYpbzKUJtmny0PLwSPlqFsF3ufuqwiH1R/0iPEk6Pz+mFE6T3MIPvx4CY5m2ANOfc8hxHll4YfLrT+zaoihoDZYc4EoAVaXniQLiUx+2aB4PdetvLP+f9UqpKsyPaEu8VUVewQWTmeYbCRRsgtRGdUIw84Cfh8YM+Dv9XFj8mzRgNYtBkXqgaHc3Ij2aYty0QpskMqU898hNXCIEhD/OUijSz7Kh0aTzVfgA+9Gi5P5Oz6Bu30FSwa8dPxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1S3b6MwZK5TFo9eLmyPfV+8Hx2YcvIy0tyYYPe4ZAI=;
 b=Ih0pOV8TwugW94BPId+XbmvgCjKj/6UOZnNLCkISmggytiv2d93lPdsIxfYOS9EtnfK3XoWPf5kstKaJHe6EJhJF3HJWPmA27q9GKHxK3KRPLdoNUVaeTzjM7crferHBNYoRpQyxIAsnZ/lAEArwSGRkoR6VsIpv7SpxdBznbgk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 09:32:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 09:32:15 +0000
Subject: Re: [PATCH 04/10] iotests/297: Create main() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-5-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bbd009ee-c4ba-ea49-f40e-7f134b042199@virtuozzo.com>
Date: Tue, 6 Jul 2021 12:32:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-5-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Tue, 6 Jul 2021 09:32:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db95f023-8875-401d-595c-08d94060f120
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333C67652983B5A74DCADC7C11B9@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8uWslSIdfKC1e/avkFORxaMF1e9xjhHwq1w6/SGkWkxg1elWcWJ3GBXJk+vX5v7q84oAY5gBUiN20jxL4b/oGhimMsEAcTPmoXhp6Zxxkoy078TZbhthg/xce7WtuFc/XFv01ew+NIFW0YtA+g0rVHdmUVppe+nhiCLOm5syF/W7CgUY9ufS77/3S8a2F8lA70ggQ0B09vxNUTcMNRHK+lAHvFgDyH1ry0I27Zjmt7iczAysDhDPxp6nMIYjo9IYl/hJLlARy7eBk9HB40PIvJZ7VKMXGilm9gnVM7Dj1D306RRDuee24l9+XZASZ57ZRzW1nKU4MwWh6X4HUREGrL4x8tY8MJfEVF0oiVlGZ4pU2U0tTuHQ1HzSKE+BchZZRFZqdwRmc9OWsNHyK7H/Qo3acP0zFJtj0EBZKQCGa1jj1vyCSGz0nvn52t0uEndKoRJHYWIuX+A2pHsBnGpFrKY51BliZBuGeP4oCJ8Ec6W2KwCndejOgUYsVmFlX7ouxUw0Ui8bcw5v0TH6BpcmWRVg11EH1RvovXqOk3dmimRleyBRsvWvCRa4J9obnAE81PPnqq9toKYq/x8/0H74e2dem4uY8CBMwQW4Kut2iTNRJH9+vk7HQgf8vsS8UAhcejtutQicbY8GhgnCZsNSelt7oT0xKPECKnGpaI62YSJnoRMIzTHrJmeotdhcr83SNyR5YB+8VPbCzNnD/MOZODbLWHvL8naPjFCyOqktwvcT/14XIiFg80PyEi1NLJ+ax4ASv4D+CUBJojgfnBAHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(376002)(366004)(136003)(8676002)(66476007)(66946007)(8936002)(316002)(36756003)(4326008)(66556008)(16576012)(186003)(26005)(4744005)(38350700002)(16526019)(54906003)(2906002)(38100700002)(86362001)(52116002)(2616005)(956004)(6486002)(478600001)(31686004)(31696002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2I0UVIwYUwwOEpBMlBIWkp3SkFMUENhbXFVYk1oSTRqS2p2bUFScldoekx1?=
 =?utf-8?B?TkJmajlWMURuVEZ4cTRBZC8wckpRNHMxVUZFVnlMczNOUVhVNHloRS8vYlZS?=
 =?utf-8?B?cEkxeENzU1RHUnA2WklKbEg5MzJQL3VxcEVwRThrUkxUR0VGWStldzhyZVFN?=
 =?utf-8?B?QVZ4aVBmQy9aRm55MFE2ckdGYVhKb1NWd0NrTWhsWmtCTnlEcjMzN0F5SjFB?=
 =?utf-8?B?clNoUHY4cGxyc2M4OWU2R0t4OGU1amNOd1hoTXdpc2dzU1lTVklrS2hNUE5z?=
 =?utf-8?B?b1ZHeEtXZ0F3NllSOFA0UWlZM05lVUhGdWIwRnJFdFdyaWlGZTk5U1RvSTB5?=
 =?utf-8?B?Rm1qbTZzZklCSk5NaC9YWEtGSlEveHFQYUVhYnoyMzFXSHk4WGFFN0Q5elQ0?=
 =?utf-8?B?aHRidDdCVUh0WkhxMWdEZ09ydTBSOUxCaHNHWlFTMnR6U0V2cGJFbzJ6b0RS?=
 =?utf-8?B?dHVmcmR3cngzMHhXNFMxNXE0ZElwTXB2RnZhY1RIK0lLQ0xqdlZJbE9hcHZ2?=
 =?utf-8?B?eWtvUlFBNUNFNHNSZit2NlhLR09OdG9xMHI4ZFNETHJVY2ZndENxdkFiT2FZ?=
 =?utf-8?B?em42TzdvOGYweXVFYXF6MXhMdkk3WGtBUW5ONjlvdlRJS0ZIS2M4UGYwUHl4?=
 =?utf-8?B?RFNzMUw2K00xNzM0U1Z5Unlxb1IxYm8zQWxBejNQSXg0Y0xOY0xXVGpvRURw?=
 =?utf-8?B?TnNpU2VFWVh4cnRvU3VEcTFFQzZtOFNubVRLNGtIWUNkd25CU3ZkOFdyaVY5?=
 =?utf-8?B?NEtQdW9LcThrZGt5MDlYZnd4OGdLYnduUDNTZHBnbjBlZzhwNkZvUTZ1YjIx?=
 =?utf-8?B?K3BLNVViOG1TVGI1OTZtTHBZaXdLcDR4ZnJzRVlqRHlzVmo5QTN5bjd4Z0lF?=
 =?utf-8?B?OU1MSmsxUWl2d1VyQ1VlWTdTRWljbW5JMmVpMTZiRkNxNjQyNjZybEFaekVa?=
 =?utf-8?B?akdsd0xZcG9VbDF2bWpGbUdnK1ZSRUhGNDFVRGRncEM2dFRtSmpab3pVdFdn?=
 =?utf-8?B?RXhKSG9qZXRYSVk1Z25XSmh5R2JuaGZsN2Y3TUU1QzhYeUVPTlY5ZmtncVl2?=
 =?utf-8?B?R2hxTm14MEZ6UFBHWWJ0MWdJYW85T1k0ZVE1TENYNnNBU0RNcWd5SHJ2VVFt?=
 =?utf-8?B?Z0VpOVZ6R3kxZXI3bFgvQThVeFV4bldXLzAvdlZ1ck5Cci92L1E2ZE9Uai9z?=
 =?utf-8?B?ZFRETE1QRGRVK1dYVWhXZllRQ1VmYXZKZGoxdXJpcWFhWnpZY051cHFESisw?=
 =?utf-8?B?dGxSeWJ5Nk1RT3hVcjZzOUgwMWNUbHlpK0ozeEJaeTFSOVlad29vT2FLYU1r?=
 =?utf-8?B?MTQ5S25ITEdCM0RDVUNsV080ekJkVlJPMVJSWTV3TnFaOHp2NE40TmIzdHFR?=
 =?utf-8?B?Q0ZicE9JSmdnZ0RRNUdVWk9vSnp6Uzd3V1BiaGM5TldhV25RcTViNDI5Qzda?=
 =?utf-8?B?WTV0RkNlWGl4ZlFTaGxOa3ZieHhDRjdlb1ZENS9mRVpGRVFPNzR6YjVGcGJ0?=
 =?utf-8?B?a1llajh0L24xWjVRVWtrdHNWWUhPUHpUaXpxa0xuYjgzWnVYand5V01BdFVG?=
 =?utf-8?B?NExFR1ZFNE8xL1lOSkRnYzk1KzduUGVkVVlZRWdETFZBeGZ5RTU3dWZNbU9a?=
 =?utf-8?B?cTVjN092cWlsVTk4M2N1NjJrd2ZLalEwdlpZZmdGMVhsbXoxWkdWN0s4a1ly?=
 =?utf-8?B?YVF6SEdKMDNibGg5R2cyUDFpYWZRRExac3RJVzcyOFU0aU5FeDc1d0Znbzhq?=
 =?utf-8?Q?L36Rl64KmNUy8hwrnuCP+uny0MOu/45mY47urhU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db95f023-8875-401d-595c-08d94060f120
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:32:15.6869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBYNKO218qo4hS57j/bh8/AbasQ1GzDOWAyrTlpVhOSURRSe7tGcIctsznGqP371vQkdVMFO1Qej6BTce2iZoOMZjHZ9OLRhs2zJXJypBNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.0.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.06.2021 21:20, John Snow wrote:
> Instead of running "run_linters" directly, create a main() function that
> will be responsible for environment setup, leaving run_linters()
> responsible only for execution of the linters.
> 
> (That environment setup will be moved over in forthcoming commits.)
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

