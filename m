Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D248F476F9A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:14:26 +0100 (CET)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoiP-0003Ej-DC
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:14:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxofu-0008Id-TV; Thu, 16 Dec 2021 06:11:50 -0500
Received: from [2a01:111:f400:7e1b::713] (port=45024
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxofr-0007mX-TA; Thu, 16 Dec 2021 06:11:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ+JQTDq1tuhfBjjTgz/UAqwdslS5a396PshHaYyIlt4TgbODZ3sAvrVIvVQO+xXMqWsjtaucAyQunNVRzKMAVeRAmJBBsnaV2qDo3ZMAGz/hU6+tUxhMalNJrYNbzhTIwEal19QDYF7Z/Xb1jdHJ71W8hEh6CQHMWOYmzg0Vt0BPogI84LFAyq793RBrHsnJpPV0qoiTmNNr2vmF0D2nmxWs/MiZkoj0lC/DvknETjZ7YsgNl2DQW2GPXNNDHBd0TwGvTGQ/6jt0wco86OWVN1S7kYHNKln+6/0guIf68Kk5I5IH3M+cIXzQl+QHudFm9z/o43RVSMbD6tMH6cgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2NalYDAHhUrzuXF2h1zKf78qhJ1JGJTzW8xj27hwBo=;
 b=QTwmoZB20g+boAj9NYUxiKhmVKuSg9UqKIh7OyiDFF76o/MEn+uzQ5xneDQYAqRx4Pet6D0qA1H2yPsrPKUnQoaEumGrv4p1VQ/Pibm/5cn+91TN5aDWc4yQeeFIQ7sXftq4bwRaIDLIOdqgGYjqdNwddaSJ80dA0OoZ6x+MWD+dQVD+p33vVoUVHEvDtHJSj8XxXOJW3FcVTfAYl0SVrDu/lDc0u2uZHTI4TTTIeI9ES6wKZkP4ZL2t4jPCRCRXzyBZWfKzYBTIPAWUefu+j1Fsdw39pIGZaVi6YsfFWJ0Vvm32f4KtyRqFSlf/R/sTAjVWPIXR2UDgHpXVHkZykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2NalYDAHhUrzuXF2h1zKf78qhJ1JGJTzW8xj27hwBo=;
 b=buRVfY7pQ0SCnEQl1wc4QhzNU2WDgnRBF2GAtQ7q8f1H1gXB11Lsi77oWwL4zQuwag0CjUIYaS1o51Ju88k0BrJ+TIQotRNGaKaW7TIxYOEICZIZGjqX4EQ4p3Af92Sz4bj9hcIeyH9USP0nAGWsathPR+b3GrEmC4Uvg0qT0YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5729.eurprd08.prod.outlook.com (2603:10a6:20b:1de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 11:11:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:11:43 +0000
Message-ID: <27c8f968-7acf-223b-c5c1-f19a84f8e8ca@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:11:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 21/25] python/aqmp: fully separate from
 qmp.QEMUMonitorProtocol
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
 <20211215193939.3768033-22-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-22-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:11:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67697ff0-fdcf-4fdd-ab1a-08d9c084d7a7
X-MS-TrafficTypeDiagnostic: AM8PR08MB5729:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5729D4DF3377FF895E62BC40C1779@AM8PR08MB5729.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQP2zsAC4K2YiVNvNp7p413yLbf6JZrXewhulEJ6NKDl+ltuceVo6Usl2bvGwkSeS4qpF91oPL5RGdM+AQ+v3gdJA5yQzYugPwSDd5MpXk9JPj/qmkac80w7ibAgoE69OlDxR63wKJxY3JjbnugsHq5k0gO9Vfypv9anLMASwb8U/gQsV4TT4Qfk3mdeZZ+J7JCcGlXbUeJlLNS99BVeCsmwZDy3u61qTbLHdtv4My5S3VwLEzR7MzexPyOR63Aayg9XaW1A5OmcQhEYBzyHLc8G6l2H7YWXIZ3qQ+sqDN/e9B7lGpzxB79y0XQXiod3H/n+akG8N/KBimyow9QmJ3SxsPZR5bAnaWovedrYzTbbxKfJIbqMaLQagdDkBkZ+sQxeHRHSW24dt9+nyrdteP3OX45XKdv5DeoY0Af4mcYXA5BgPadiK9LdtcaB0t66pdvlWi5ANmj69RTT+oysaNw0gvdkOWp0QMdeTeVIYaCKJNfpP9IxECY2k+2metHl7+4+/FXZf/AKvagyIz5CNRKJgixWS7Gpo+q65TAJXqrqQs0A4NscB0dsALprIkxiroLVAbHqFE0KsvMSzYegObI/PVNosQ7uYpfBli5d0DVTkdhQlWglFynKsbyCV46gfEwyCKU22h3XI5+MAGbLpA5R5DXBFr10DyJCWxlk9TLQR/IDIkiLOISE3pdlQb1ZJV0e18WPhUbLGYl4H6BJEPxqfGwKavXKiS/hrEGnfO50twd4ABz7l+yD4h29oovlWZ5PuGtiTbaApURgsen0Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(5660300002)(16576012)(6486002)(52116002)(38350700002)(186003)(4744005)(31696002)(38100700002)(508600001)(2906002)(66946007)(26005)(7416002)(316002)(66476007)(36756003)(86362001)(31686004)(4326008)(956004)(8676002)(54906003)(2616005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVIxekdOTTNqMGExUmZ1b2NkcG1Jc0ZpRTZKTG5jcTgrRk1aQWFOcXBReHVQ?=
 =?utf-8?B?ZUYrS09YWFhtMWVjVmdJcnFOQkpLVkp3dGY4K1hpNk5BTHlaRlowajZJcVRz?=
 =?utf-8?B?Y3hYLzBpcjFzUVNlanlzVmVjVFZOL2xqM0lrbW5xb2ZNUEtQUWZ5ZkZETkFo?=
 =?utf-8?B?UEU3d0dZR090SmtJZkFqWDEzM1B5dk53VitCSkMxcW42SGs5UllvQjBCMkJ5?=
 =?utf-8?B?UkthSDFNeWNFbXp6NlVkT0dWTjV3ZUhKTE9Ja0NjN29MR3Z1SUt4cWlzaTlP?=
 =?utf-8?B?NzFJdndSamRyQVk5STlTUjY4QmxHS293MW10QTNHRktMYlA4UXhEUmd4SXNI?=
 =?utf-8?B?d3QybTkvQzhzbmdHckgyU0hhK21jVXZYRXFPYm14MHRKSlRpWi9ReC93eXFS?=
 =?utf-8?B?YmJoMkk3Z09hbi9XRzY3aHROamR1TW1Qc0RrMDRweUlCMWZLUHNlTFNRT1V5?=
 =?utf-8?B?d1RqQXhPTkc4aDYyMUFyNC9qa3FYRXdOWG45eFZBVExzaUc4NG8wMFVLWm45?=
 =?utf-8?B?VEpoQmtaRG9nYVBSWFZTRklaMVRXTkZoMHFqZ2lGOWRVZ2lXSHdCc0NyMThj?=
 =?utf-8?B?ZVZWbHA5aHVmS2M2N1I4WTVOcnBYR3l4dlRPVEphbVlEcldPMm9GVlk1TG16?=
 =?utf-8?B?T2htWWR4SkNtWE4yTDVmR0xoTWZyeFUydFI1V0VwT1RlN3JkbHFPQSs3cG9m?=
 =?utf-8?B?V2pzaDFyWHZsNFRaY2gyU08wS29uNnZvczNWbHgvcTBhK05ETndYSDMwY0ZY?=
 =?utf-8?B?RTIwTndBQTNnYUJHSjBGVmhkNDVwOTN6WWJFYm04ck4rdFN1akNwNml1b2w5?=
 =?utf-8?B?TXNBc29tbUtZR2dUNzJUbWtnSHQ2VURxcGg0VWJaSHFqVVpNMmRQaVBWdUNR?=
 =?utf-8?B?d2M3eEpWZUpNK0lYQmtHeVl1R1lyaHAxaGJhWlRibnVDZSs1bTd3ekI2WFhP?=
 =?utf-8?B?YTNVTkVqbTVXWEN0L09FaFZmOU9iMGFlUGZzVS9nZWtxb3YxSFBGbTh5ZCtl?=
 =?utf-8?B?MW56and6ZE5jbW9WUGNMcVFFQTkvRGlnZnRpUjhpV1RacXJLYmpUM00ySmZF?=
 =?utf-8?B?cTNMQ0NEaGlFdmM5ZkN3emRoTy9aRGlQQ0hHTEk0UmViTElxMGJ4OG9QQjA1?=
 =?utf-8?B?NXFIUHovNVRGSDh4bWFTckt6UWs2SEp3NUV1R052cmc5K2xMVlVEaW5lem94?=
 =?utf-8?B?UjNma1kvamNCdWs5cCtJY21ZbFZGTGNVeTdIc0NkQ0pIVlQvTitOdTVaTmt6?=
 =?utf-8?B?aHFGV1pCY1hOd1hLek55QURjaXYrbURNdUFzL1JjKzFZa09UaitVMDd0SkhN?=
 =?utf-8?B?eGpqUkU1NmllckZwYlNES3RKQyt1ZUg3MERQWDFteUl1bkZjaE9xRjZmbFhw?=
 =?utf-8?B?Wjd5TGlNVVptZFpMRWg4ak9GR0IrYzdWbzlLYmVJNGNUNkUzMDdWRGRtbnMy?=
 =?utf-8?B?YUhyb0p0d3B1d3F3RU1BN1ZJYkJVUDdma1FqeUFScXhXQ3ZzS1crVlIrMUwy?=
 =?utf-8?B?K29kNjFGTXZxbFp6S09Fd0dFRDgvRHh1dHN2a0VqUDhYWVdFWjE4TUJ1bllK?=
 =?utf-8?B?RjVIZWxPYzZOZTBxTUpTbWUwWUZPRXZMWkcxZHlVK3ZsSGVIU3plUTZSZjhm?=
 =?utf-8?B?WkJUYVpsTnVad0NuQ0EvOEZtK3RmdmxPckRqT2NTM0RzclIyTVNMK2JlVWdJ?=
 =?utf-8?B?RXJtQnBIaWFEbzJ6TlZnY3BaWlB2ejV0eWdYR0JKanFNeFV3NEVxbGI5VFJ1?=
 =?utf-8?B?Wll1RC9pMkJyV1hNQkVuZjh4cHE0WGtUTWczT1lUM0tXUFJtK2JvZWxVclJZ?=
 =?utf-8?B?T3FsVk5BQUlyblNPUUd2QklZSTUyUmpuamowK2RNZkNyYWw3alh0UGxkSUov?=
 =?utf-8?B?aEY2QmptaUlYMjhyUHcwai91WUQ3RVlRUS9IZGR4eDgyeDUxWmVMTkJzTFA4?=
 =?utf-8?B?Tm9mNVF5aHNWaktSbTR1SHVBNzV6bXF6RS9vckE5MVcrYlROVnE4VU5vWldx?=
 =?utf-8?B?S2luYzdqcWVIZmhCWk1EWTI3NEFiTmRUMHJIV0hHandtMFl1MG1uMW9rN01u?=
 =?utf-8?B?clk2aUphbSsrL3creHdicmZDNlBnSXlzUHRmV0hBbjREZ2wvNjZvcC9xVGFE?=
 =?utf-8?B?WkhqSVFMQkdXOWVrZVQybHJzVHl3TlpMQXN6NTdoSVM4NDhQSFRkZ05Xd1hq?=
 =?utf-8?B?QjBRUGo4MXpEdFh3dmttV0hBUGw0WjFIN0VYTGJtSjZ0SFA1UkFaNFl2dits?=
 =?utf-8?Q?kXr885zg1NbFAaYABMrCeRjoJHQ7yIlpehCFQXdvTo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67697ff0-fdcf-4fdd-ab1a-08d9c084d7a7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:11:43.6738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oiw09EiWIWWvLOATuvABsZPDpJMDWHFIZUordO0pVuQ2gLSDQCfi2chLKVvnKn60YMd0nk6mwtOD4oo07cx3/brWp6+7KZRTKl+YQY77Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5729
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::713
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> After this patch, qemu.aqmp.legacy.QEMUMonitorProtocol no longer
> inherits from qemu.qmp.QEMUMonitorProtocol. To do this, several
> inherited methods need to be explicitly re-defined.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

