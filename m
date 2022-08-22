Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0559BDB9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:43:58 +0200 (CEST)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4uU-0004gq-3c
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQ4pO-0006J0-6X; Mon, 22 Aug 2022 06:38:43 -0400
Received: from mail-eopbgr60097.outbound.protection.outlook.com
 ([40.107.6.97]:11523 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQ4pK-0005xB-Pp; Mon, 22 Aug 2022 06:38:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/SkCDvfsjMEPhjXhGXLUraIoLZIYzCoVDifJOT5xgmSR64hkTG596u+BLetEeIMP0vvHC9f8N2OxYLy0/Pd2LbODUtUyLLejvuTcAEim/Blu2/wmAKgbz4bLlet4nAdiJhhqq4qpkRYzl+7Ciz+5vbEJSgK6ndSoLglblSpoNP/EgxuCHPFV5uj77MvzB0Ohoz01mclPmNHoAcgQjk1vKXCn0d8ODKC3QkKuRLbBWauV9cWjl6GvWZ/mOvnofs0VKHxHl7moOf80eXjt7yVfz4YLkLBmVZRsdwUA5T2lg9XS7oq/Jk9oPp1DNHZHmFxs/pLeKihpknrXnuXATSOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Zuiprf0hgzwpfFZv2VQYcBj8J0DoYu+fQDdmqqGGfA=;
 b=Jpt6Cu1XaK7dG82UcWV4kg9rqKcK89bd1zB1AkihmVavhTPxoab39pjEKzkOMy9R3SUCkC0DimtbUTHxblA+DBQJ64HQ7eeaJQjVcR34F8xLCC5esk8k6higkvUJNqx2MXJGt9HKO2wJUIrnqbrs40MeDRCSCHoiqGTlgCAHjpiDtvLW9XRC+vv/EdSDy85dP0RSLLh5rqhNR8C4P6Go+WXPz0OPIxcZSRctQUmAaNS1t7gvjRqZyjj4BJFdJlG6+oKBm1mfrbYk5iRQbN4AhMHXhxrMq25A8rERFOnKx1Qptbtd3Lg+HuSvyxMjDbp3wDa66rZ+5c7G4Uq8H+32nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Zuiprf0hgzwpfFZv2VQYcBj8J0DoYu+fQDdmqqGGfA=;
 b=XvXiUnwbYFsk6ubfDXZ0bNKCXaJkuGgaZqbAwk9LO2hEb7XR7Io/PmIMEfgRTGdstm3F0nxEPLOXIgjb16kg4M4WuSikL8wwGk86yhQaNc8L/bleLzu+XKcuTpXWLoh2Z9NoSGZtvwyDSYTCWNnCGTvknuOKy2eugbpk48YWvU96EjhydMr0hQAHHIhG1naHEcdAhIBB4/FBDuKbDt6oSHXBs0v1Gutuv+ZhKHefJ2c7m6RoMO+MXxVxd98zJbR7XQLHtprvlBfaBNaX+gO3sR1Gglj7QNAE8SbZT2ckw21Ytg8XYdVhZkULkZr4LDZy8Gugv2/oImvn3I/Gp2XDzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM4PR08MB2689.eurprd08.prod.outlook.com (2603:10a6:205:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 10:38:33 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 10:38:32 +0000
Message-ID: <2e5b911b-e3ee-c6d7-3bce-a0854d037c5e@virtuozzo.com>
Date: Mon, 22 Aug 2022 12:38:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] block: add missed block_acct_setup with new block
 device init procedure
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220822103131.381075-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220822103131.381075-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0801CA0078.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::22) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6390663e-b649-4bc0-141f-08da842a75c5
X-MS-TrafficTypeDiagnostic: AM4PR08MB2689:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tr8HIc/0OUEJpWvkZ/ECJiZ78mYiATh6dcSonPamuZskYO7NzeLVpOYyUmPeHeLROYP7spUnI5gEK9V6F0QSt6SUGP8br9YQpGuQSX00V5EvxTWCZAFtQ1vQ4vuJ19WRv74/VTgqzPitsQ0WN1pb3DXAI4FqJ3IHoxo4qfSGMe4NptwBar+bX6N4xLMgkF1NS95QZOZZPAgoujS4WFGv1o1OT1s8rM3s4ogtgpLZ6LUVrBAtrXK4mU9LDh6wkRl0/2woUUmpkBriZzuZW8PmWkJFyNGbfEHNb6lfTdnkKgQZkAWrOqsIGfhT+euIxb61hip6adGirnXfsmzluG5Qv9odcrNB8Hev31/9NQ1zHRz01Li3cXVZ/NY+nm9ag7wzyPxEwVaim6pzaJTmmEF9MtneLucx/wqgn2+xfmNdB7LO0AXG87pBRCpxlOfTPcVsEHQD+Qzi482qXwxXTrkZ7aVN5uxTkYjCNfAZHRYaKqvWyR5HYT4E98SsNhFLGQKcyM7KVyvm/DeXr4qOxyDMn2hApzYJ2vqjFUJeh/E8+kN3CD3sMrf+13NO7mD3oYeQBHr0CyZa3A3jSCSkUZ/8dh7dmQLKD669D5piKmqUr1H+6N9jqNT/TXJt3iYxxUP65xSDd4hCF+WuNwfL2FHNCUhXjXkutZpmVX5ZGq99Fl70Jg8XuvBxLYxzDkDYQ6e2PchE5Bt/E1QThWh1FnZ0NIPB7m2VV5EixLrDCNdtY+imROfvDwTuTV+E+3PfqLdD1P7blwRs7K9tfkDMEyhzySpPVT6+Bs7EIa8iGULTb2hA2qMWIu9fMTl3qJo3HN9C3nUACnfJW+mT6CDrZksipQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(396003)(346002)(366004)(136003)(54906003)(36756003)(8676002)(66946007)(66556008)(4326008)(66476007)(2906002)(31686004)(41300700001)(6506007)(6486002)(478600001)(8936002)(5660300002)(53546011)(6512007)(52116002)(26005)(186003)(2616005)(38350700002)(38100700002)(83380400001)(316002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjFsY3Fhc2gza1drOGpneFdpUG5UK0NBbEVLK2Q0K0pERVJMVXRIMG5pN3By?=
 =?utf-8?B?N2FlNzRETEZWUFBvamhXMW4ya2UwdTBRUHF5VlRMMXMwTjh1ZU9GOEdrT0FZ?=
 =?utf-8?B?UVZUWGNMYXF5NlBUaDFqbktZRHRvdGhMMGtGdk9mbGZkRkREUVdWOXpqbkpa?=
 =?utf-8?B?cjZlVkdzSmxUejlScUtSbGU1Ni90OW9KNjV5a1BWMzB6MjJMRFB6TkdtWmlk?=
 =?utf-8?B?RE1Ca2VTSTFESVgxRG5LY2o3eHdibXFRWnAyLy9zS3ZXMU9qRHFRbTlzeWxq?=
 =?utf-8?B?K25zWERGTDV2dlRrT0p2NXV2LytVcFpNY1kvN2RVeHFrTGxwSXgyQ2FmQzYw?=
 =?utf-8?B?N3VQampjSU85bmZWZm4wcEszRU1hK1dkM3MzSnN2c0syRXNVVS9WQThpa2hr?=
 =?utf-8?B?bExILzM2TjM1SG5VNHhhL3RZbGNVdzhqNy9BeEt4ZDNtWFhFeFNWeG5va1hI?=
 =?utf-8?B?YzdralFaVXM4em1jZ3EzQmlBNWRoLzJPMmw4MkpBSVhDZk5KNDVlN3I5cFkx?=
 =?utf-8?B?U3pzaUpIYTFmSjNvZ29CUnc3WlhGb3cyQjZNL2pwcHFXRTFJMEIxMVJQUVQ2?=
 =?utf-8?B?STlKa2ZuVXBYNnFmYmtMNnFtbENQV09uUlJhenM5eStKQzN1cWpYSHNxbi9U?=
 =?utf-8?B?aU0ySHNudm5VcTJ3a0lWUWEyUlBDTUJuTFdWdVRhWkRndThBU0ZpS3pWeXJI?=
 =?utf-8?B?Rmc4OHNlMzY1YnlrcTFXdXBocWdOSkZKTk55NUNxcHdoNDRieEFmbzI4dzM4?=
 =?utf-8?B?VjJsdUJoQjdsall6TTBnU21WdXB0WHhXVE5TU2VEd2ViSUljY3NleXQ4M2ZI?=
 =?utf-8?B?MTVFSVNoWmNHQ2xSMVZ5WkUrOWVqT3czd09LZlRESkdqbVdZVFpRTkU1ODBw?=
 =?utf-8?B?T0ZvZklrb09iNGlRUHV1eHA1U24veFpIb2EzajV3TTRZMitFeWhzMkxvc3Rq?=
 =?utf-8?B?Ly94RGhBYTFHM2ZyY2Z3bllMMVZoSkVHbmdtOTJyYjBnYlE5WEVMK1ViYkMw?=
 =?utf-8?B?Y1Qxak9URjdGaWRnZ1ZJalVrWTJDNWhqZy9uZVJUVmVuTHV2d3dQS0RnaUtG?=
 =?utf-8?B?SEVVRjlQTTN1WEN0cEtQbWlPaWtuYURHbGlveEFjTThRTE9YQjRjQm1JNUc2?=
 =?utf-8?B?TitLVlJZUE0zRGVTcW1CVVArYUw5WkdnSzR0ME1RVEp2RFUwVGR2RU5icEpi?=
 =?utf-8?B?cGxoWEw2QjROYThpRHVLS3d6QjJYSXZGL01sSHErU0daUXJiZWFGaGhTUHJK?=
 =?utf-8?B?aUlIdVVqbUVrbmFFVmEyc25vMkZuL2YzNmUwNnpUTUprRTRISWZJb3p0K2kx?=
 =?utf-8?B?ZFFYbFlLL1poRDl1ZXVKU0dPUW1hUldEa0h1S3c4ay9teEVUYXh3NE8vclJh?=
 =?utf-8?B?bmF4NVhQU1JWdlRFc25PTkwwbXo5SzlhREpSZG56MmVkRDFkclhlcWlQZG1y?=
 =?utf-8?B?bWdOeEd4SDhZbmhuWkpUcUR3dVhkOE5XSWZQN0Ezb3ZpRHQzNW9seUtuRVJC?=
 =?utf-8?B?MXJqczF4WWNGMmtBU1hid0xiTmozdDRZdmZaZ3BhMFdwVnhwZUR3S0hzU05K?=
 =?utf-8?B?TlBNa1BVb2JzZldSd0RvK29Zd3dkVHRYMlZZcklVa0txWTdTcjF0U3V5eWF0?=
 =?utf-8?B?UEFhd1liN2lzZmJLU1QrYkQwMnEwOVY0MEJCNnF6V3hjMERhaHV2Y0FsVE5Y?=
 =?utf-8?B?QUFzdDlpUDJjQW1tQ0lxa0dKeFdqeHA1K1FMQ2hCVXV0QTExNUJIbitnRTBF?=
 =?utf-8?B?YXM0MUFSNFpoUW0zT2lvbkNFTGl2ektiSS85L0tjdkFlb1h5MHdIcFlGYTVW?=
 =?utf-8?B?UC95WEhpWTNURUp0WUc4YW80Ylp4bFB0MXdLdEFCRDZsS2dPeU83VzF6a2s5?=
 =?utf-8?B?MW1QcXZPcmhPcUw5Mll0clFQZDQ0aFlZWmtNWEVKYU9XdlNoQUZ1dzZhVjVu?=
 =?utf-8?B?endjRW40VUpiZkJUNG5KSGFxaUVHbzdROEJPZDRkMDE5eGcxQlBQeWJoNUNi?=
 =?utf-8?B?WG9hVHVSd01HWUxsa3hkamYwMkN1OXZjQlhhL2JVcXlrNDJnVGVJWTRMMmd4?=
 =?utf-8?B?UmtFSzk0QkFRSEdrUUFVYlZoK21ZeUhyQzMzcWoyQXd1N1RpenNhZ1Q0cnJj?=
 =?utf-8?Q?LXfPifT9VFkuS8n8O0ByIb6Mm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6390663e-b649-4bc0-141f-08da842a75c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:38:32.7963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eq4xCLdcYGS93WLL8f07u3ZQdnWCH3yGhkXfbYCH7y1dQTUIV80X15S+VM0uSqOEweONUmtyoT5SMbQi4Zunjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2689
Received-SPF: pass client-ip=40.107.6.97; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22.08.2022 12:31, Denis V. Lunev wrote:
> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
> the first glance, but it has changed things a lot. 'libvirt' uses it to
> detect that it should follow new initialization way and this changes
> things considerably. With this procedure followed, blockdev_init() is
> not called anymore and thus block_acct_setup() helper is not called.
>
> This means in particular that defaults for block accounting statistics
> are changed and account_invalid/account_failed are actually initialized
> as false instead of true originally.
>
> This commit changes things to match original world. There are the following
> constraints:
> * new default value in block_acct_init() is set to true
> * block_acct_setup() inside blockdev_init() is called before
>    blkconf_apply_backend_options()
> * thus newly created option in block device properties has precedence if
>    specified
>
> Changes from v2:
> * called bool_from_onoffauto(account_..., true) in the first patch to
>    preserve original semantics before patch 2
>
> Changes from v1:
> * set account_invalid/account_failed to true by default
> * pass OnOffAuto to block_acct_init() to handle double initialization (patch 1)
> * changed properties on BLK device to OnOffAuto
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Peter Krempa <pkrempa@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>
pls disregard, sorry

