Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C033B0282
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:14:08 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lveM3-00072n-7C
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lveL0-0006Fu-5Y; Tue, 22 Jun 2021 07:13:02 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:62436 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lveKx-0007EO-Jp; Tue, 22 Jun 2021 07:13:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D86BXHo2bOpxKxIP+/pjBOQzYQTx2lBlAVWFJlQ+08HSZ0VJT+1Zl5MOMDnp52K1Vbyx+WkgtY8kavOpHoZXdPiDc/HT4Wzi7EU67HCbZRvx01xarS61br5u5Oa5tKpG9iiYxNazRzw5SEjHVmMgGtgUW3LM1AZPveOYoChbMY/72cROQ4V3qUWPxR24UwwJ3UAs7+Cp3o+i6T5q6BpN8NPdbYixxIyS1FBSYsvoegqM4gZaq9vuXJ27gZVdwPj/GvLraYmL/GP8nRrm+dtaKBRq85hFnGx4dbIBrECrisB84zgGPFQvV9vZlJOeb6AIBha8VGQQD3U8805dRlx/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl1I+3NS9xIGrizwFSGi9yBwyiclZDpfPPIVuxdMEmE=;
 b=lbG6m/wbWoy/eDWFbS+FeEjq296wrjPpABYzny/sUYVZnKwFLj6EOld3y2v4dYhxkyISvP9OwtM/4mBR+uyDTTxn3VAgHeCSre7NO3Y4UcBPMlF5kpkGXXlTsGtB8yCAeVlUvwoVr4uU6pVEnh2RIDVDZxoFWx1kfkJXHWSt7SiOvR0yA+ekmqV9JepGrH01Q+Jbup1VP1MyzjDMpcilj/sfEwFh0EFQ+KDfD29W/T9uqZHTojAZbHLSDOxG8+VS+rPtB+0pjrAln4BHan4G+fNCBpXIwqqJBTsletWAuedkcCEgC4ztDBgGAZS8kExJ/meyPZ8WtP2O/sBRYIVkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl1I+3NS9xIGrizwFSGi9yBwyiclZDpfPPIVuxdMEmE=;
 b=sCplYikWHkP+eDz+UvjHol+jIrUUN/Hsk8fukqVEWz6DrUuLONJhTbuduGElG8TOHZ4GEIHgi1nvKUW896EwzmPfceCibJC/d/qljljXKjENyX+Yse6LGpMBDUJDmwzA8EDsEiZt/IDjJENrpiprRfdt6rc5jvreKqeBfVBFD6Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 11:12:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 11:12:55 +0000
Subject: Re: [PATCH v6 06/16] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210621103337.36637-1-eesposit@redhat.com>
 <20210621103337.36637-7-eesposit@redhat.com>
 <4179a6d2-3fc8-aae1-4747-b4ae541a8819@virtuozzo.com>
 <ddfbc161-92c3-2f58-1ab7-9951d291a2b7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a017ba04-36cb-5b3b-7385-490bffae860a@virtuozzo.com>
Date: Tue, 22 Jun 2021 14:12:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ddfbc161-92c3-2f58-1ab7-9951d291a2b7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: PR0P264CA0203.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 PR0P264CA0203.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Tue, 22 Jun 2021 11:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09d0f124-2e82-4984-5b33-08d9356eaf88
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6568018E4DB4A6886638CF6EC1099@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNlWj3TQC5Se61p576fB5/4JU5sG/57XDl51B/ibSup+aAQ240vyniNjnz4QFwN+6BxI2qi42dDK/gRCt6jROvUaHFmUd2MRDU4lr5shdd8aXyaDsmQA4hsOnjhlX9sNTA0tbdEiq44huU3kcM65e27qg7c92Jd07se13vjPkm6TDMjp148gAxJZYNNjLjgMcgYqHGItLF/B8FuL/FDidyZnR76PMJM+GZJdC+cvrMqnhwTePjuj1i4Qs256CdsrUX6WUw/D9zmP+R5UyL+JrwKL59FEz/PoU+8/EbThYvwNmo43z5rxKk68wg1CfIZL7w8p3wa0zkXKqE3RYydZSuHoCN1Un+53OP72NtsBgsoPDeS2DmF0X1QwW2wlWNzJDDxSzRx7ob9vFwFuEc+KDn4oTDzkIrrGM9IrIcNmxTHh+zNGUR06KcUQMax5DDcacL6y2RdFJOYvkWQaJVnQOmp1rEL31hl0JM0to4/er1wZVkg0MCPSropJx/fgSVEBkplibXHY9Cu30LnfjCsH8RpVNUcqkpmT+sAlhqwMXahZLEhJm8Bl4qe2RWjk9g5exyiQz4ptpCsMam13peNzDT12lsod0h6ez/1/3eVlrigZLutJSMygHYe607RIbf2lxEbnIyZSVF6nKW9eEDbQUPvtxAflOjCXJjUKtOWUx780dRWIR2ycqjKDRzUvcJDyBlwqzzh8lxGwGXKL4VnGzg//wNt2KNXW6tm2PDB2o1DiRy45tJ4utmD5anDmR/rT9kugPWj5sd+EsIugbGZrYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(366004)(136003)(396003)(38100700002)(38350700002)(26005)(8936002)(956004)(86362001)(31686004)(4326008)(6486002)(16526019)(53546011)(2616005)(36756003)(31696002)(186003)(54906003)(2906002)(478600001)(316002)(66946007)(66476007)(66556008)(5660300002)(8676002)(16576012)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmV2UFFZeVZRMEFBc21TZENVa1Y3Q2svWmx1QzQrSFAwWFZ2Q2JGdTBmWEh1?=
 =?utf-8?B?VmliNjE3VnladFVVNkphd0RQQ1ZxQ2dLd3plcmJ2dUx2dkc2NE5tdzBHTkxJ?=
 =?utf-8?B?NG9yOHdVUWZ2U3UybEVTcldBWGpkc2IxNEhucXhDb2VUa2laYjF5eVNMNkZP?=
 =?utf-8?B?T0tYbUZKUnh3R1I2L1MyejJ6eThPeDBObTYwaTNrSVJwREdsWENKSjREVXY5?=
 =?utf-8?B?UUlSTG1yS3dVeVlSS3krRko1ODhGaGZtK01SNTZhL3kzUndob1FQSG0zSzFo?=
 =?utf-8?B?RFJRdjRFWCtaM1dtNUZYdmVvZDlWOWRBdWY3U2x3OWdVS2dmS1lSM3N4aG4r?=
 =?utf-8?B?a05sUXR5b0lFNzUrTndNbkNOTG5TL01PKzlxM080b3lJWG1GZ1VVZHFFblV6?=
 =?utf-8?B?OWpjbnA5SHJvN21YTTRLRmtGSlY3WmRQc3l6K2ppTkp6K1liT2ZHRGFJc0ZT?=
 =?utf-8?B?dUdycUI3cThUemorSEtvYmpKMVJrc3doZzJFVjFNYUxaSWpxbWZhUklPdzU5?=
 =?utf-8?B?b3FNMmJPRUk3MW9ma0lCR3RwdGVDSW5lWnZibUs3RmtVRi9IU3prdTJEamNN?=
 =?utf-8?B?RmMyY3U4VCtSaDFOSS8xcmdwOENKNGt0Yyt3MlRSTG43YklQSlBLejdicDll?=
 =?utf-8?B?S2MwYkFPbktGTXNhdFJvWDNpb3ZRa2ViMGVXV3pNek9RbUtVUGdEVFNFc3F6?=
 =?utf-8?B?UUlKZlhMM1BPaU14d3FTcTF0S0FSTkMwZ1VORmVxblJxMFMxaHZmNFBpZmZW?=
 =?utf-8?B?bkF6MFk1dWJnRTJDNWxjS2l0dW1RY1c2TTRNcTZOSFpzRi9PTEgwTWFrN2t2?=
 =?utf-8?B?eUpSSnVsa2lBMEMxQ04wQjhPRTM5YnZjdkRQNGwrUVkvSlBtTjZIdzR1bllE?=
 =?utf-8?B?TTJjZ1RhZlA0aWVnOUQ1Ym93MklrZEFyTXRoOHJDSXFvRWorZ1BSMmpNd3VN?=
 =?utf-8?B?YWV3RVhOamEza0NjUWVGRHdqVlIxRElteXpldjhBQ0wwZVR6MEVqR3RGVHNu?=
 =?utf-8?B?a1ovdDJBbDdZMzErcjlRdlFpVTNTUWFzZFFrNWkwUjRlQ0xzQW1oblliYkRt?=
 =?utf-8?B?ckRWNjU3OU1sbTJFdTh0cFE2ZG92d1BQRkxVT0hMS1BMWUZRZWhkaDdzelVE?=
 =?utf-8?B?UFB3UlJ0UnRKenFQQXdXWUhnQ2hua0VDRjVpS093b2M1SGt4bnI1QnFMTXRv?=
 =?utf-8?B?Yk5qRWZFa1l4V1pZcVloeGFCaUlDV0NVNmFDSUlkZ3dGV1BkTjk4WGgwZEhW?=
 =?utf-8?B?d3FXa083SDNKRWlTazRpQno0aHd1WHhWK0JZTzg4UjlhTHREaFU1c0laclBk?=
 =?utf-8?B?aStHalpRc0NIYmV0MEhmV3p4a0VjQk1VU0VXL3lzZGhyazRkTTVjQVMrVDZC?=
 =?utf-8?B?Qkp4Mzh4aW9nNzBaeFlKYkRmdWZhbXlleUJycDZXZkRGRU9rNzh3U3AyTWlS?=
 =?utf-8?B?bkdtb1BjNXcvSDVtTEdhV3hkUDU1QkdhQitELytiT0hyTEMzTEpsNWtZTVcw?=
 =?utf-8?B?ZVVaMkt6MU1BY3RoT3lXakxJUnRQektCNUFBRXEvejNwQmp4UGRyRU9rRTND?=
 =?utf-8?B?U0I0aEFOeWg1OEJzUFl5V3JWc3BEd2VXbWI1cEJ6NTNxYWRqVmxiY0RCQk9Q?=
 =?utf-8?B?Yy8wNVFNQ2FVOTg1bTZpK05SVGErRlM2UzJDelJreEZDK0hXbmlaWXY3bjBV?=
 =?utf-8?B?YVhhY0hoR1I3NzZhY0pUMWdmMDdRRFZURDNWVVlBL3dPci9DK3E4NVQ2VXZk?=
 =?utf-8?Q?wYsGPXwDiGhcVRdMAFrre+K+k/SwA9FGNElPSft?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d0f124-2e82-4984-5b33-08d9356eaf88
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 11:12:55.8275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACR3bbKkC9Qzda3yJlWaSIoGJpasyziT5N6WXOwXfl5Lvtn68eOvblK/7J1+++HpDkkimN+2DwchqfAF6AKla/axlgWq++kL5mv03Ge5V0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=40.107.8.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

22.06.2021 14:04, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 22/06/2021 12:50, Vladimir Sementsov-Ogievskiy wrote:
>> 21.06.2021 13:33, Emanuele Giuseppe Esposito wrote:
>>> Attaching gdbserver implies that the qmp socket
>>> should wait indefinitely for an answer from QEMU.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> Please, let this patch go without my r-b. I don't like it, I explained my thoughts, and you even used my suggested way in previous version.
>>
>> What I don't like: good component - Timeout class, which is currently independent of outer code and can be simply moved to another module becomes dependent on global variable, which doesn't relate to the class itself. Neither I like logic of the dependency which just make the whole class do nothing by skipping any action internally. So, IMHO Timeout class becomes worse.
>>
>> I'm not a maintainer here anyway, so my r-b isn't necessary :)
> 
> Oh okay. Sorry I understood from previous versions that you liked it even without your suggested change. Apologies.
> 

No problem. I really gave an r-b to earlier version, so formally you had it until now :)  I thought I was explicit enough in my last comment to this patch in v5. apologies if not(


-- 
Best regards,
Vladimir

