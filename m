Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA4639673D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:36:58 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlqT-0003fK-Af
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnlon-0002kT-CF; Mon, 31 May 2021 13:35:15 -0400
Received: from mail-eopbgr40116.outbound.protection.outlook.com
 ([40.107.4.116]:36110 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnloj-00067X-BI; Mon, 31 May 2021 13:35:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UB+aFP9eUqgQq0yXLlR4bJgkcSb9mqCR1FqdWMtyt7TJf2SAHgsGXT79VaNaEvxxu4wYeVndxIRe8FcvviN9edGBSnRX79GQ3KLPZIZP82PywEMeGyYJ/55BtKFcQ7y16EXszA/X3eqBp4VNS3gr4p/qJDfcBnd/io5QV43DHCz2Ip0JwGhATVX8DiixB0AV5M/fV5MbQqWSe5H9sKR6oMqa5w7nt9l/DvDxvL30UwZf/DHLAEqeaqtBXYgcw9TOuCUT+TZqO4dEvjlz4Q0Ipfj4toOtZoWX7Fb+GoNZIHebNhOCWIAyWkwmHFxHamIsRd83tN3h/mmdaPeH2qTjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpiD9neB7RwXsxhdt+AXV2GcIUGCMcI2eTiaDVGndJI=;
 b=ECcsfMKjUM+GSyjzRGpjR+xbftx+kjpr9IonlarfLalUipPgVVIjMCfqlEwDlwjeeZMdG1X1v8RKz6ZZDV2FwY1QudimFDMaCaT7HwratwPNnHE2QTG1b3V/+icsyc8xGSfLrBO/vz7UIBz3hYO9QkNlzhc7lCGYZoToB6guUYpkymNVHu2Jf6aGQr5pHxL69pdcl2P8z6lO8/hV3OwCENfgvH6HPCzkxsnm2oEwuEMuWPOw+kKta52VtOWc1OC8pE1jAYUHKY+CgsOeJiFPPRH/hXDvEv7Dcd09Z9O6vdVHaz+qji+gv307TARuF2goenJoRIMKQKCwsknTaUDp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpiD9neB7RwXsxhdt+AXV2GcIUGCMcI2eTiaDVGndJI=;
 b=eWmdYo8Yfw5vwvSXGswOZ6WYJq7/oKzfhnIjueRBNsRJm84isKMuj6u7olqJMCrYHPjSy2pEdblvq5yNCxwoQcRutRTdd3+6zw/Wd3QmJeJZUJWrZVmFDMXrYY47pChZFOLAfSqXBj9XBRBh2T2aqagCWkkr6jQOwmVh3PEVUDA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4950.eurprd08.prod.outlook.com (2603:10a6:20b:ea::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 17:35:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 17:35:04 +0000
Subject: Re: [PATCH v2 00/33] block: publish backup-top filter
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <f0dc2c94-b75e-6530-e986-22100ea2fcb7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <21f9e2b9-ab18-612d-ed78-770b6d32ef76@virtuozzo.com>
Date: Mon, 31 May 2021 20:35:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <f0dc2c94-b75e-6530-e986-22100ea2fcb7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR3P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR3P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22 via Frontend Transport; Mon, 31 May 2021 17:35:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0a4ce4e-e6cf-46b7-c7bf-08d9245a6d15
X-MS-TrafficTypeDiagnostic: AM6PR08MB4950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4950869AE8503D04A75EC8DCC13F9@AM6PR08MB4950.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxy2fKARivBImKtC8SfMvRtw+cm3vocDkW98pEiJGOaUkwbWv/FEe5cMSLBrOBZ3weN6d53jywPrIA/ffGcrYDpFypG5ABbymUGuj0JUWkYzZdcpFznp3sUAW0QqwKBW+Budidwb6nv1iUmXc5bvDXz3RLqzEMd0LtiIqYb84+hCjbfZCuKoCfX1HknHKkzE70PNn+m+IlhNsoqjygU9U8kO/nSYk0sGD+fILtBc+OmS6j+N+Tqa5qlnwxR10u6YMX3Wmxwg8+6HvW3daon9b9U6i+kLrgqvxfgoY0fQRQ9STr5TkAxWmq8FhZ4wFZTtfZupCOo9acWK4QWCCd7ALw2Mm9CBnCwyyZWSfOYlZklwEaWINDtz/tG/4u+tibDadxtykvePwLKS/sUq41LbT4pLUHqkLysiU1j5PjbktwZz496NFA4lFer8Y5jX3EEq7UOfMXnG+mSk/zFu+t87WCnuv4DP53FSqqvPYHuNCyMwVWSrBw2ngxgL9JKvkEH+aKWjqVRc/CRVtyAJvuYx814hg0Au2Wj4045hxQDU/AvytBffuRpSdNLQV37gdFgxu537LZ8z/QwAeDxtSAiAydLVCON5QYpjSnWf/zsndhfXRTVZQpMY0+Pfdc6Fbq+KiEiBHcumW3Rcip1wodyHQc+FuYsOtoeqakAT/aYwBUV2D/lRCAbznzhZ7DOH7JhyJiHtGv6QflrS4C4Si0oyJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39830400003)(136003)(376002)(7416002)(38350700002)(38100700002)(31686004)(2616005)(83380400001)(66946007)(4326008)(16576012)(316002)(36756003)(52116002)(26005)(4744005)(86362001)(478600001)(956004)(66556008)(31696002)(107886003)(2906002)(53546011)(8936002)(6486002)(186003)(16526019)(8676002)(66476007)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RW0vbkZSS1kzbjBNcmFmRzNlcG96L0cvNTdFeE83dVRUQ3puM1JIbmZCMUM3?=
 =?utf-8?B?ZTVGUXRNc1FITm84RGJSQWxJcEV3OWdsV0x3L0hTUmtsTSs4SHJmQ21ENEMy?=
 =?utf-8?B?bXRBdk4ycllvRVN6WVZzeVh1dG1wdWVnK2pHVDBkTFl3S0Z4NDl5eGIwRUlU?=
 =?utf-8?B?U1p1ZFVPb0VUaC8vZm5NbjR5d1REN2REZEFTNjYrWkFiZmduZUdLZ25LTVQx?=
 =?utf-8?B?ZzJYaE9XVThzSTBDVEtpUmNSN0dxNU1sZVZPMDY3bldLc2Zsb0VhaXJKaFRm?=
 =?utf-8?B?NmhlL285cUtvTS9MdUVBWGt4REZvMm85VFBEODZXaFNrNEVMWlVIRnhISlcy?=
 =?utf-8?B?NFU4MkRON042bWlMVHlWK3JyU1ZXWG5KNTBybFlEUFpBMFdiaElEVzdYYnZK?=
 =?utf-8?B?TEVQd2hOYk5YdWRlZTBqSkhEU0s0WEd6SUd5UzlCN25CdXc1OExzSW1CNUNK?=
 =?utf-8?B?SlBHcEhpTE9UYmRoMDlkY01sVU5IWHR2eGtLbVJnUkwvbGVYajA5OHkyQXZU?=
 =?utf-8?B?NFZnMU9yNkFTVW9aT0NpUFhoVko0aWg0UGdFSm92OXVXQUdnVStsd2FIRmZh?=
 =?utf-8?B?L0xTc3UvanNHNjhPK1NNMTRDdmYyTHlKM1FaM1I5MkV3MDdua0VleHVBaUFU?=
 =?utf-8?B?Q1NpZ3h6Wk9XOGxnWHI3OE9TWDN5Y1ljTFRlNnZrelVEbHdYMDNaYWJVeWNZ?=
 =?utf-8?B?OCtEM0czckNWSGd6Tm94azFxeXBmeEhNWUw1eTlkc3hRaVlycXA3M1pzZ21z?=
 =?utf-8?B?SFVVaHh4RzExV20vVUV3Y0RKcGxheVI5VEZRMVlsclJHS3h4azNWbmEzU3RN?=
 =?utf-8?B?MVlBNUtmOGNKYVFuQ3B2eUw2V1d0RHFkaVZ1NHpTcHlZZHBLYlJFYUVaSkw1?=
 =?utf-8?B?ejBvVldjeTRNVGxpNHg5STVEUHVUaWJrcG96ZmI4c0tUcjZMd3ZQd25sU3Y5?=
 =?utf-8?B?TEFQdDBnWWROelkreGlPaTNGUDlQUWQ5R2VxNURVM3RnMk54ZGR1bUI5eHV3?=
 =?utf-8?B?SmJiMDdlZHZBcU5Zc21oalNubk53MlZwVVE4bjVlR29pdjBoRUN0S0ZUc05G?=
 =?utf-8?B?Qjl6cTBVb1FXR0oweW9wQ215ODNDZVkvbzJ1R3NRYW5Jb0hmMncvNzFpK1ZZ?=
 =?utf-8?B?V1ZFYWlVcTNpRGVSQ3lhSlBqd3Q1K1RCZ0dRa0ZHbjVEQWR3SlZBUStlZHl5?=
 =?utf-8?B?WDEycXlhSzY1MXdHZUpXZlk1cWJqa3NkbHVWSCtxeXIwQmxCWkVpWDBsMWRE?=
 =?utf-8?B?cmRUMjZWOUZndll5UkxFTXh3RDdJK1gyejJGSVJkSTZvbExMMkRhdEUwU09J?=
 =?utf-8?B?NWJHT3Vya1NlVUNVMGxKQjJyUTk1RjYvSmZFUUM4V01QaFdZQS90eGd5VzZP?=
 =?utf-8?B?ZEZVY2tNK3RFNXU1VkRZdlR4WU9YaVhVQVEwclJ4TksvcHZ5VzRuVHFKcnJS?=
 =?utf-8?B?aGh6RU1FVUFhVXNoNElFNFFrN0hqdTJiWjJHUHpGRGdMeDV3T2M2WnBPK2N5?=
 =?utf-8?B?V1E3azJhVFVnZUdlUC9YUFAwN3p5T09CNUp1QzkrY2l5MGxoclZCTU5jd0ls?=
 =?utf-8?B?azhUU3Z5STg0bGc0NHVxa1VCakdhVzM4SFZCUi9JMlFYbEZFUjZNYVNkdW5q?=
 =?utf-8?B?QThYV3BVaFRMbHhnZFpNUVduSFBYWkNwYWpuOXY5cmR3b3M3Q0hiRC91QUhj?=
 =?utf-8?B?VlgyaUpkTFlwcldkYiszcmpocW44cW9xQUZpenFQL05kaUV5Ky96Tlo5L3Fn?=
 =?utf-8?Q?Tloc26lZ53y74R2x8GPqoArSwVaNWEF8mQC1n2J?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a4ce4e-e6cf-46b7-c7bf-08d9245a6d15
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 17:35:04.6780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDe5D/P+oEhhHqAwbEwlaoVOhWwV20vQBoxHltgZh9d8UUzZ8+RFMA7ew9DhalMy1mUFNy9nYxIj2t6qsAeeRV8cOpatmyPx33JtrwZEdTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4950
Received-SPF: pass client-ip=40.107.4.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_NONE=-0.0001,
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

31.05.2021 20:11, Max Reitz wrote:
> On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> v2:
>> 01-02: new
>> 03: don't bother with supporting empty child: we should never have such
>>      at this point
>> 05: add comment
>> 06: keep checking conflict with global
>>      add realized_set_allowed to qdev_prop_drive_iothread
>> 07: improve cbw_cbw() name
>>      improve commit message
>> 10: rebased on unchanged backup_calculate_cluster_size(). keep r-b  CHECK ME
> 
> I checked you! It’s ok. :)
> 
> (and btw, I’ll look at the rest tomorrow)

Thanks)

Actually, "CHECK ME" was for myself, and "ME" is a patch, not me) I forget to drop it.. Interesting, did I forget to check

> 
>> 12: new
>> 13: drop extra bdrv_unref()
>> 18: add compress local variable
>>      add comment about x-deprecated-compress
>> 19: new, replacement for "[PATCH 17/21] block/block-copy: switch to fully set bitmap by default"
>> 22: improve qapi documentation
>> 23-33: test: a lot of refactoring
> 


-- 
Best regards,
Vladimir

