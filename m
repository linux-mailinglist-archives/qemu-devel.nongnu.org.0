Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADAF476F56
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:01:35 +0100 (CET)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoVy-0002LU-Sp
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:01:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoT6-0007zi-Qz; Thu, 16 Dec 2021 05:58:37 -0500
Received: from [2a01:111:f400:7e1b::704] (port=52800
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoT5-00050P-7n; Thu, 16 Dec 2021 05:58:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0YXK2pHHf2WP5NV9jWWbYjTqQTCJB7icJyPiORPVsLxHdh8x8CobFJi2CjDM8SxjfCAl7dgsmzE27ptOddIZmhXFmQze8ZS5HEax9Kuk82TELzPhwjNU9Ksv1mWMl5g1yWzXO3zMRD7jqJ+smspYW+fUfEqAuFthnexWgza3jvdDnXUzfjGEQ446xhfuXLpNt0H8SFi8OPUE7U7Oe2raz0E88dVQ09JhMM/5sgfICp4R39PLMJX4SICuX/PFa75+52KhPIwxjlMDrBfuGQaOXauHsdLFQC7m0mMg5xFSLiUrUMjB2bOP5262tL0gM/iNOVDfBLi2rFLHSqu45Oe+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gAlxMepEgGwi9tunx8qC4Xh4FCsPiQo8wXP1ttebdQ=;
 b=DlyqAZwh8V3zznkLaBr1SLt17zvNqHpnjGP8eQHohMZAQ0NJVbykPPxIrZJAR/c5eV3vkrXhcKDl7fO0pDVfH/141OczYArFoXA9EUI5yNStCt6qYazmUg1P2BgnH0xwCADP00yKT5P7yRJXtP1XQP+TryFk3ceZ6i2cqigAIdPk99dfQBXouBWyCi2IX6gA7e3kVIC6mOw21KduW6P5U4E5SSdJ1bE9s0Y6R+z5BJ6bErNRxb4B+6Ib8DfpIBfNt+uD9Ytp6YSgJtjWMVcrBr2FNbOuyaAFB8tkUbmcAoAyswMs5uTHBgekw9Pw+wl4OpRvG8s2lfBo1+HnrIbWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gAlxMepEgGwi9tunx8qC4Xh4FCsPiQo8wXP1ttebdQ=;
 b=DcGjXmWvJP1AWN+qS4WjSAiSrz2C7z3O4BK7eQE3P/cCCVEzuLeA+T3q7Z088vzzu8ZtK0z5duMstu7Pg+h1cASS3YHQBfYuUHTDG93DwTiKHgOps9Ke6TrZlsuQc8el+TvIqO6x6LHxeI8+UDuo+PJKxelIcMKfd0IVS2fw1Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3698.eurprd08.prod.outlook.com (2603:10a6:208:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:58:32 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:58:32 +0000
Message-ID: <d1fc2f65-9662-17c2-34ab-c43f3f60845d@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:58:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 16/25] scripts/bench-block-job: switch to AQMP
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
 <20211215193939.3768033-17-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-17-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:58:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baa1fc16-2689-4a24-f412-08d9c082ffb8
X-MS-TrafficTypeDiagnostic: AM0PR08MB3698:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB36985E347B6C23703EC5DA93C1779@AM0PR08MB3698.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A259Aa/KOI4J9UC3IPLD1lyIusMn3dOjkl7IUi0BP7aVaq9l1xt7TJ8C7OV6KCaxC8AewSeleItxtFM9A/Pw7mNjKa6pX9G1mnwm0jwmeR/bn8Jr7qD9b1OOwdKTv/yuKqY1BoA6RYvEBnKq0ZkXJPlMfkzFR/S7ypaZ+ExgFLxoCuniX6jIvCpdHpGRKFi0ZDJHlp36RkA4LpykRsTKzc4VRHLRJ5x4sTqBh6A57xXbnxF/UtRjHlrs+/1rXJMnPYNPetBJMaZbSd20Dc825Cbwu01f57U1qTxN3x5TcO4lWq8TH4KMTPmkAGj+rPjM40vGOaE8B3foHWXmgYd6MA1w9oBrcfY+sDyDWNl7k6iD9uTPM+lRxEpJtqKde3rEgphanHG2GXBZ+zZlxLvfiNjbbm23nUcP82XfjY1Qhw1v2JTCa8BEsrJZiCqhp+IuCcEXSgzj38JspkX+5HWhqRZsh0NcvYR5W8O+0+h2DNzbE8q+v3cVyrj65ifEhXiUObrO+1wXYrHITb09TtD8sJeWnAUOblvQTr3N3hvznlzRWrH1mF1EKCDFn5bpkqjjN8oZWE/JkQRlM8RvllHdT3gBTAlcUV5wKr+vhdenQjgghF+RPyt9rkkVqS9hkCwEfV6QOVP/NFXk/okaWju0Oziu3NSgLoxNKfqiWhwzxeu32y/gK81GBBXlYLvepL+vz1yyZIMowMBkSZUy2OlKmzkhLYJrtVb/6hVD4DCRk4teHObc+HsC1hXatJgV+Z5wt7qfWH/CC7cG4tKXfXlGJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(558084003)(66476007)(31696002)(66946007)(186003)(8676002)(26005)(86362001)(4326008)(956004)(38100700002)(52116002)(66556008)(54906003)(38350700002)(508600001)(5660300002)(8936002)(31686004)(2906002)(2616005)(16576012)(6486002)(7416002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk1CNDJZWktIbXNKaEUrNnBYb0NaeXVHeEZCV1hON0JuemJBSjlhZlFna3kz?=
 =?utf-8?B?dG9vTVZnaWMrL0JHVFM2TEM5QnR5UVpTdEFPZ1AyMmUzNFZaMEN4MUJxaVZ3?=
 =?utf-8?B?SWFMZkY1MXN1QjVhU0w0NjVLRlJDd0NHMzFjNFV5UlVlaXRITzAzc21keCtL?=
 =?utf-8?B?VWhFUDRZNjZFb2xjTGNZUkloZHdQUVBiTXJHZFZCdWcxemlORHdONzdOVzlC?=
 =?utf-8?B?ZEJ6WlBWOXhRQWk3VGlKT2hDYm5lUkkzUWFEZTlJZTh1ZWNDZG5lSU9wZlJR?=
 =?utf-8?B?aHQwM1hhSE5TdGd0aVZsc3l6ekV1NUxaMVNlUStmZHcrRXVFVlNoZWsyMlA5?=
 =?utf-8?B?Y0JVUUZtdUMxWEpCRXc0SFdmSU42eTFYMy9lV1ZwdTk5Z3hBWS9MdFlONWdZ?=
 =?utf-8?B?STFiS2xTdFBMVDZmV2g3LzJnMllmMksvbnUwOHBDeVZxbTJjZDlEWTVFR29N?=
 =?utf-8?B?NUZ1WCt3aHdYWkZmZjZBNDJuam1zcFJUL20zQlhyb2hZZ3diYjM4QmxMZk5y?=
 =?utf-8?B?N2lFODlyV0N0bXArZVdBSG9BOEpEWGxNRk9nMEkrTElHUEM2Vm1HOGYyMFRu?=
 =?utf-8?B?MzRiZldUSUEzWHMrZUt4d3N0aElFYWNTMFAvcnBXOWVGS2FMVExlMlVmUERx?=
 =?utf-8?B?Qmdvci95WUpXQWx1OHk2QkdDSWZOYkxldXhHSmlFWnR2K2hTK3Rud3N2azAz?=
 =?utf-8?B?Vm90MGtITUZGWUUyK2tpUkRTMTZBdHFsU0xoVUlURll3amNoWWpBNFh2Yksz?=
 =?utf-8?B?YXdxQll6TENLRmxBZERCWWEzaHZZQW1uejFacm8ySFg4NW5aRkJrMms2NjRL?=
 =?utf-8?B?dnVZb0NLTndnWS92QWgwaHdHZXk4ZEdicEZIa1hJVzFmTFVjU214MHVwRVRE?=
 =?utf-8?B?enlOb1ZGRWw5d2pvVG1KcXVleHRPTklCOTRmWHorRG53bkdJZHVtNVNsMktq?=
 =?utf-8?B?RWtPa2Z6V3ZadDBLSGNVZVAwTVpvNnd6SHFjc3liT0RQUWUwbkpMVG5JcEkv?=
 =?utf-8?B?Z3lUS0sxZXE3RER2K0NsTjl6d081ckxtZzVoL2dNVXZSU1pWdmZ4RUUwZjAr?=
 =?utf-8?B?NmxWaGNGV0tITFltMTlMYW5vbXRBUTJIb0EvRnNJa3dsbHVBMFZXQlhlL3Jy?=
 =?utf-8?B?WWhJYzU2ZmU0ZTRZTEVjSG1NK3J0NFZZTUxNVWtmNWY2ZEdlMm1xd0ZmYngr?=
 =?utf-8?B?Q3RXN3FYZVpyZGVQUDB1ZXRwTVc4bkJEb0xWYzJGUUlYSnY1UjdMelJHVVRn?=
 =?utf-8?B?NVpodDA2UFhyMXRtR3liUVArN01PQzRzMEdmSTRIRnNONUJpd2c5LytIUnRZ?=
 =?utf-8?B?SDMwK0hIeVJGdFVxTU9ZUTFvK2dHWUc4QXBMRUUvYnpYVStRVDlyc2tuRFhF?=
 =?utf-8?B?ZGpBWlJaYVRVUXFKeG02dGsxcTdxVkhiQjF5R1lKVEtCY1pYeVVCd2k3STRa?=
 =?utf-8?B?Tk9OWU9hUzEvY2RjUmRzNnE5ODNkK1ljaEZQdmw2QjhLTnNkN2hZYWtZR3Az?=
 =?utf-8?B?eVhsR2h6M0pNbmFZZEp5cmVPUFRwUURldUk2VzBlZnBXVVdib2x6TTNqbUNu?=
 =?utf-8?B?YldXakliRHcxL3QyRUpEZTJ6TGllQU9RclFIbS9wSXJxK1lNcGFWZEZBekV5?=
 =?utf-8?B?S2pBaUFrMk5VRFQxRkZlemZxbHlDdG5PVnlMS29Wakh1U2dzK0ZlbEdmaVlU?=
 =?utf-8?B?L2VHOG9laTh1WG1JTElLSXVEZ3M4ak9jM25QeEdMTnFLdlhiZ081clZlVzlB?=
 =?utf-8?B?Z0didlV0NmV3VW9HMUYzeUtMVWtQWWpDL1lWaEVhek02OEhBRC90UWZBUFpz?=
 =?utf-8?B?S0tyWmZEZGpNcm1tRityNzNlZmFjemZQb2VNZWtQQ29idmRFUStibU1haVk2?=
 =?utf-8?B?Q242WGVINDRBNDhsTWowVWpwczlpSVE1anJ3Q0draW02ajJUMjE0Rit1T2Qw?=
 =?utf-8?B?ODJvR0JGenNJV2FvalR3SFh6cUNxNkZhQUNHV2l1TzhPNm1pb3NDR1NHa1V3?=
 =?utf-8?B?S3lGT3NWY2tZZ2xqTTVuZ3NCZ040dmt2NnNPTU5kNnpaN1RzMVJPZndTQjVV?=
 =?utf-8?B?OXpIY1Q3RHdrK2Q2QUw0VW11VUJhYllrNkg0MFZHWGU0TjFJRnM5b05PYTBi?=
 =?utf-8?B?c2lOZGQ2S2JJTEhya1FjMWo0OFFteVJJdVJqZUZmQit0WGNCRzJ1OXVYREdn?=
 =?utf-8?B?ZkhMN2xYd0oyQW1ETnc2ZEdJSURSbWFSTTNiK0RxOTh1WmZXUHJIajB1YTkw?=
 =?utf-8?Q?ZmE1gTKXcsC0Yjq/qMDJj8y7+YZbhxDeZKHi1Px7jM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa1fc16-2689-4a24-f412-08d9c082ffb8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:58:32.1484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjD0Gyv23tFSknqEFMhL8RwhyS5f1t2NvVo4owHgqjy8d6rZzR2xKtFYk51JoDAQIfzv/4Dee8SiuQDA2+2yUNURRNXOStyFDbJyq1zjmtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3698
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::704
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::704;
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
> For this commit, we only need to remove accommodations for the
> synchronous QMP library.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

