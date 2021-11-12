Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6144E62B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:13:13 +0100 (CET)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVQe-0006mV-5u
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:13:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlVPk-0005yh-4G; Fri, 12 Nov 2021 07:12:16 -0500
Received: from mail-eopbgr130139.outbound.protection.outlook.com
 ([40.107.13.139]:31546 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlVPi-000715-81; Fri, 12 Nov 2021 07:12:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0NzBVqgqxsOwzgv4HudTdZW2ksea0gA/zZqmYk3IFcRfBTwLErG24nDvINmjvqk4A8TNJxU1vCCq7WCTi33HoMCb/7X+NddM1WRWKAqVovDd334MAwGkhnAckWglxhs7I6U0mInPD29lczEPClKFfp//4BoVWCWk523Yx1Bml+lTg90SNakyjlMgmtZJk7XdrOTkp6T2/t82SYUPoZ9Ql/4B0EfcUey9UZqyc0nPgt/id7RDohUySb6x7A+GjRF0vQ0eDeHuSBUqBnUjx3iYZz16eBj8NnVjUoJ7WtsNeyPg17aVL7yBPGJZj/0L9GpocFe2+cO+znk/1EM4pB+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU0GX8HxAp+x1rVWs5beUkLSVl8CyOGjCNb9c0b4tuE=;
 b=mEl5wxDnNt8mK4V9ARjfjcRALdoBYsUl/5tou+cbVN0dzzkns2anxBRKOAE8tzwzd2azBUJxGzsvs1c7dyyha/CdkqVO3sY2rzR7r/X6/lpqdYaWp+TTWfzVIE1NK2YjKoFPIF9jx82FKUNUkLPYaD7a0rhyTmxDESd/99qyPguj0Ry2kt102YU8PuWC7y5Dya/WJYow5wYa6gwZp6ZRfFvI+7GQn/+meVpxPneEkoNJ7nnONMkUZX1xga7jhNBUXea0tprM6hpNUyImO54urKibAvho0LnHzWjL1xdHmWeHSoOu3zlZXyqhXnXEA65aNNWbfUOZPj48KRGSaB9FlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU0GX8HxAp+x1rVWs5beUkLSVl8CyOGjCNb9c0b4tuE=;
 b=g1tJ7PyEILb8oE/moeaE8VlGef/FSq9zlJ2qNUl5d+s5tZCy8FM22hwg/gHQoAKNytDm2UahwhMvFFMpOrwhNgxf0qbUkmbqDk0ReBlCddPXWOBj2YV8hAjtFSMu9ejdqvURfJ/rF2VDzzGewZSMXs1wz3Or2DxBBdLTiCPheEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 12 Nov
 2021 12:12:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 12:12:10 +0000
Message-ID: <7297d2ff-f593-2649-0524-b032657acfc3@virtuozzo.com>
Date: Fri, 12 Nov 2021 15:12:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 06/10] block: Restructure remove_file_or_backing_child()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-7-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211111120829.81329-7-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AS9PR0301CA0006.eurprd03.prod.outlook.com (2603:10a6:20b:468::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Fri, 12 Nov 2021 12:12:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57aa50e0-a215-485b-2c62-08d9a5d5a719
X-MS-TrafficTypeDiagnostic: AM6PR08MB4279:
X-Microsoft-Antispam-PRVS: <AM6PR08MB427934B5B1B44AF1F5BD3276C1959@AM6PR08MB4279.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P1ZXHqUZMFyC9hRmv3fud1cE5gCK2Nz+UekhIh7R6Udai+YII3+Z9BZX9VSwG8cDdTvS0ZSE91SXfSjiVkR/GctRSLW3ZVMxecbsBZTfMlQdqeH4vafXY5wgJHJu4ZIEWlL9xpd42MGS8rNITSajvmNPRUHHJxrSdqTPtU2/xVqZjpY/hnsTqikzAMRXVvp+6PF3uY0VXpuRzyFhprBVtUzpkHt53UWZ0sff4pohWEEmrgyAa/EDGYeXyiGBBpex7T6EFrch2avXOnkD5Z2FwbXTDNdCabNSmTMfmAwDEJ1VM34ttFNWLot8Uk/BvrDHrommLbwCCeD5H3Hrd8uFGQC+ZycEo0BQOAnoknZv3zX7vqQeVJMfzIhEmtBFTOgdhHxM36a3L+4n2ir3/QeA7I1MxdPrUza6rl7UQzTyVPHVYLIq8y/ETyrmm/zy/Y3PSTg8p5m0N/Afl8ELtRcicbmyaBnEmSfJCmoEcQLA5KZrpkKVG5rlTFMTv+HgStCZCHzXpwUj8G4stf0eh4ZyW3I+7R3DiabSuZ2j4L2RxBk1GzjMeLWtlfg+zpsUKJqQcWAompCZE3jrU6Swhnp++TJCV2ToxlSLP78D205/VjdWMlkSk+zepwcbuZuZm4kRDc98UjFQQTLL+xpYaPdZiVIornx+/KCD8BoH1L9RcL0V8iW9KdR0DyuBo72cDBrGOZ1fTs6Nnq5Izoubp8w8pmUpwZnMD1SuaMvXje9klPlJrl7PwFV+PxVTWcAbDDnzEOgiX0R3hMa7LltKgWPhhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(52116002)(16576012)(316002)(4326008)(2906002)(4744005)(2616005)(86362001)(31696002)(66476007)(66556008)(8676002)(36756003)(26005)(956004)(66946007)(38100700002)(508600001)(186003)(38350700002)(5660300002)(8936002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXAwQkt1Z3VBd0p3dVhmVU1sTHZZVVBxVDFrRi9TZS9Bdm0xSW9ZZnBDd0Zn?=
 =?utf-8?B?WXIycnFuTEdlVERzYUt2WmhCakFHTGFzcGcvMEtDMkZzNVpGUTJQNU9IV1F3?=
 =?utf-8?B?aXliR2ZLZG5OcUkzcW5heFhGQU90WnBHYmRadVkycTIyUGlqdFMwYWthNUVI?=
 =?utf-8?B?ODdSU2hBL09WMVRKS05YZmMzUXBqYk01NUc1Vy91L3preU9HR1JXcUJnV1R4?=
 =?utf-8?B?cW1BMlAvT0lmLzF4MENVRWZxVGcxcVVoVTBLVy9MVERLdWFRam82eHRHNGNW?=
 =?utf-8?B?RHRnSkhUckdrWURkaHRsZU5xNG1qWEwxeStzRHI2blRzanNFU1QraGNwT2I3?=
 =?utf-8?B?Q0RXN0ZkRFFobU9xOFlIUkpqaUVYcE1LUDJMcDNmcnE5YkpsNklMVDdpMXVC?=
 =?utf-8?B?NU1NSDF4aGNsei8xYWdySHFBNFBLd1dXd3RsQ3R5aHBtNG1lclZQOHNXNits?=
 =?utf-8?B?MDVZVkNtbEVGWkY3azJxdVJ5ZVVZd0hlTDFCYzVvZWN2UVZ2Nktsdk96TWsr?=
 =?utf-8?B?VUpvRnI0dUk1VUVFWlE5bmdJVHIrSmZRazcxclF2Vy9HMjF1SHROeTkxVnpj?=
 =?utf-8?B?TUd5UkxkRHAzbGJqVHJ0ZlZ6dDc4ZlZseklIWnB5UkpIc1dCeHY0aW9PL1M5?=
 =?utf-8?B?UlBiSWsvUWk0Q2dSbTVKMWZzSFI3alFwSlFFdlFSVGJENzk3RjkyOTJxM0pW?=
 =?utf-8?B?OWFIWFJqYlFlQW9NUGRJaHhHK3BQUjNvS0xmak5oT2tsV3l6S2FXMUhtcXhL?=
 =?utf-8?B?M1Y5L1pEdzF2VXhhcFBYU0kwWDJpbDNPdlptRGNZUkNXRnBwZDVla2Nqb1l0?=
 =?utf-8?B?eTd6aGJGUmp4dlJkelJqc3owS3J3TjIydG0vL29iampsS2RmUW4xT3l2OFFL?=
 =?utf-8?B?eGZVeTdaZW5hRDNTeXltSklrWHMvWkdoNlZvMDBzQ2NBTjVvMTdoeHRBSXVR?=
 =?utf-8?B?T1pBQXFGRno5U1RwM2NpTGtiLzhBVUhDTDc5UjlrWjRuTVg4ZTdMbVdhZHIr?=
 =?utf-8?B?K1hjWFpiZm03MS96RCtGYXdUOUtJVUJENGR5alhtb0ZVZEpKajZ0UCtMeHIr?=
 =?utf-8?B?RWExb0poUFR6Z3lzUE5ad3IyNGpqSzczd2xQcHdOY1MybEFMcTdMU09rWDJ1?=
 =?utf-8?B?VHpaRDc1WDZNak1xdVdrUm96d29maERzTlYwc1pPbkplR21sNit6cVBlY3Nn?=
 =?utf-8?B?UStaU3Ixc2RSZDhiM3dBMC8xb0lhcHhndys0dExnZ2NpRmxjSEtvcXZ0aTQ2?=
 =?utf-8?B?c3J6a2dLeHpBWld5N3Myemxzanhwb0Y2TXlRQlA0d2k5UkthNHUrbHdkREpY?=
 =?utf-8?B?YkxnaDdmeGhsOGJpbCtFZ3pBbDhVVTh2VE5xMGlhdEpUL2JIbmM3dU1pT3Za?=
 =?utf-8?B?bmhTdVd3bi8yVmk1N0NreElNSmxnTU0vV0lBQUk5bGdlVTJjb3JvWHVueGhl?=
 =?utf-8?B?M0tpUkVSMG4vR0EzVkVCRzR4clhPeEd6VjdSZ3EzT0NHYkloVHVubGtNaU9u?=
 =?utf-8?B?TlNsUGp2bjhjYlIvZ2tDUGNXNjM3K3N3Z0pNTjFJbnB5R09VNEZvQ2VsMkZk?=
 =?utf-8?B?TnF0R0NLMTg4aWZhQ21KTW00VEllUGhkSW9CTEltUUpjd1BYSkpCNjZWdjBB?=
 =?utf-8?B?RUR1a2hPRlZIS2YyblNRbWUzU3JSbVhwTEZqZjIwL3hlVk5DOXNUWC9SOC9F?=
 =?utf-8?B?ME9JdlF3SEZrRTRxaUxWRWVmUzJUb21zS0N2UU51T2cvejRnTGx4VWFQTERW?=
 =?utf-8?B?WDhYVlM0N3RKbytFa1pKaXpyRWZIck5zRnRzV3FCQnprcnJEMEFraTB5SG5O?=
 =?utf-8?B?ZVh1S3hKOCs2QlAyLys1dUVmaHl0cFVlc1YweTNkWkpra3NEempwYlkwcllL?=
 =?utf-8?B?cmcwR01OTFFxWDlOWXJObTR1T2R0T0FtbG5wVlk1MnBpTi9na3AzYlFGSmQx?=
 =?utf-8?B?U1hidGQvSjVod3ROWmZoWk81RUtMUURpcnZqZnVDU3RDam1ZWHQwWmUwT1Nh?=
 =?utf-8?B?cVorVGJ1T1cvMDN3alBVNWVrbjhacTNMTzBBR1Y1b2M1YmRTOXZIZ0NlSjVL?=
 =?utf-8?B?ME9oRzFwWk5hYW95RlFoOHIvTk5rU2RHYW9MbzBZSnVIRGhzK29HYW51Ty9n?=
 =?utf-8?B?QWJ2UXh5LzhzRWI2SlArWno1NWZjY2owZ1MzaUNWSk10WFBCZFJuRktyM3o1?=
 =?utf-8?B?UnIxbjJqMTRqSUtUeFNYNHlGYkNXMlNCYUpTQll5ZENnZnNyN0pvaWRPWEFz?=
 =?utf-8?Q?6dpHmzFMKPcNBIw6IpCjwaEO2oQ2CRCiZ+bPuIaxZU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57aa50e0-a215-485b-2c62-08d9a5d5a719
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:12:10.1280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0f8Dt80PtHQe5lIZunDAPNs73BDTtt14neOImSYCKN6iDkmQpXKu0ytbNHt62UkL05PJ9MgktuK9uQDZR7gGYMQ2fy/G5K0c+nNUNnsTtGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Received-SPF: pass client-ip=40.107.13.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
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

11.11.2021 15:08, Hanna Reitz wrote:
> As of a future patch, bdrv_replace_child_tran() will take a BdrvChild **
> pointer.  Prepare for that by getting such a pointer and using it where
> applicable, and (dereferenced) as a parameter for
> bdrv_replace_child_tran().
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

