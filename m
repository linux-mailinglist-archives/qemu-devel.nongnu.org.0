Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824444175EF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:34:52 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlLn-00059l-4u
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlKU-0004JJ-EN; Fri, 24 Sep 2021 09:33:30 -0400
Received: from mail-eopbgr30112.outbound.protection.outlook.com
 ([40.107.3.112]:51265 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlKQ-00069o-BS; Fri, 24 Sep 2021 09:33:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5MvB2DtP0vKQwgnT3AnM9kxTNFRB22uJqxj5nl7V4KEVY2gUJ9DkNFfbXZ9ywwvp0MIYwIA5h22au/ebWoXrj470nEk2xLdoy/uP0+OmZJHHctWYqxYHWoMvQA7knOZ681g7/EL4JQCaCzmTFnXiEXk6FPIriLKGsQEPC1kI+fR9F4aqLOsE2hjY5wBVKkrWy/6IlHvntsKuIDQPpLYhiPZTPntHOcTHmRb6W/zvaD470T5fa7nC7uGM++T1e8XB4mRZOkZ3PyYVOrKulbQvaCGHRh6Od3rILruNeAtliuf9rT4adEBHnm3BZVnaNeW70252j/b8CAb/BcK6+0VXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=j5F6CmvI4XxZsOgoEIyHbNiDf45KzcQTb3E/K+n2MrU=;
 b=OHV4SVLozv6Xwk5Y+fCAeX2MMfXG94f6oDwIRZWhuWk/01LqMVdP64toeFr8OU1fKYEgzSLAfBSrjSMXHGIV1xdZjiU8hBn0R52Z8AHEXQkBMqYovMcdWWGpUgNojnirmb2c0JSqX6Ep646qpinod0KhuPVpGYELHoFnVpUvbaXS23VbyVVoKCjUQAV9KVND33lTqhXkAYQMcIxBRgf2vgTLT1R7yj2QAfLh8AHRJT7o6MQ4RDjjynSic3y71AQHQ/ckJHggfBXGa97CKUSgd1zMrb3w2tsovBokkzfteBEv7OHrPcshJ+wVv4MczJdpRj96AZxBwZr4ry+Sb7eX1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5F6CmvI4XxZsOgoEIyHbNiDf45KzcQTb3E/K+n2MrU=;
 b=wNDWIgG4KHdRVqTV2MoHkcFBST1n1iW8Fc9k/niXoabQ1pKabgwybUYH1znmDHDU0DU8YM2Oe2haeBu4M7U5y92OhEBJQjTSYHHNhU3aBDwt8EvgM8b2AJaomk3AO4QomjjCxfH+9GsycAdfEiqSeni7V3+M8tqwqlWCbgq7mig=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4950.eurprd08.prod.outlook.com (2603:10a6:20b:ea::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 13:33:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 13:33:21 +0000
Subject: Re: [PATCH 02/11] iotests/245: Fix type for iothread property
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8e56feb0-54cc-f5c1-c669-a08e9280dfd3@virtuozzo.com>
Date: Fri, 24 Sep 2021 16:33:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924090427.9218-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Fri, 24 Sep 2021 13:33:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c30cb3-3be4-479a-36fa-08d97f5fe099
X-MS-TrafficTypeDiagnostic: AM6PR08MB4950:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4950D515F2691FB2AA221F54C1A49@AM6PR08MB4950.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Us2IE5yyyobiQtNDNdX7mJ/oS3aeAFTPsXoMYfLbWFWR5G4xjyp0NfcY957u695GcJpO0kVYDao+SVniwB0aZhq8tAVW6cPKoHyEUDmABxPhMs4yTkxFaI6QOYk1fIdpTkPK9SRA52xhjOWlV6LNCokZ83mhs0sXCk19nJlV9oGzq29I4uHtSZ/pPUw7Oo+7GfnnzGtPn4+nWBtxm9sQLn0LPVITsZk9pKDVH5bAALjn6tsNg5vIqURMTiTjWzNQAtsl+oeuHL1l/rMalszwYLKD6tYM+EkMxQxGrmRvLf0IT0VZ1sS61a6m3BJisM2TS4Ph5MIk9t72QIrVR4yl7deF1uwDFmViNYTyhFiC39ZnystBqdz1O7CLNLuwEw+Z5CnsKOl6xbEZS5H+RN5vezMMaST8gcwJkk0amTo5nCqiZkg25P/BV4FAQpzecyVDfNdzJKzWZ4REJqrmRc56zbHQsdarPsg55tMk6BHj/kLkIr6DOtudjGMIlVbsrIBm0QGSdOxJ75FsQCM0nSm+TgnKx/Y1I5BZNZvz8s/wnGGoEsY/eOIxPhYQPPbF/l/ObQW7zRRrwLsWSSaQm3OXeCvNVRBJtopJs3orr6AnQaVnEqDJAap5QuiG+FlvWcEcbv2wGGlRCcpyDRJOvAQWfV7gbKxYaRH+tqCqXTGDrO4x8MEssL712lV7rJUHyyVAsOxxQJ6usJfNIoi8kNY1fK0zn9GeIjKeHWbyG+CPdQL0812JWW8f87xbQgrC6pqaEZTqsGMwSpR3MtgcloFUUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(8676002)(8936002)(4326008)(316002)(16576012)(2906002)(66946007)(7416002)(38100700002)(38350700002)(86362001)(31696002)(31686004)(36756003)(956004)(5660300002)(508600001)(66556008)(66476007)(2616005)(52116002)(4744005)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1Q3dGFOUDdJaW9tVEVEZU9mUEJQTUR4aXcvODVHckhLSTJmZTc0Vktla2Fi?=
 =?utf-8?B?eTZHRkVlbHg1NDBodFZUM1F0UGh1R0xkVXh2K2hwVlNxOVg2NFR1Y3Y5cVBY?=
 =?utf-8?B?ZUpPTHRrTVVlRy9JdDF3Y29HUDFCQ3Flbk40aGc4eVhDcGFlYWJOZ2tYc293?=
 =?utf-8?B?N2FMczVSTi9GejQ4VHg3cjIvN2orVEFEM2ZhRlIwUGRSQWVjdEFYMC9pNkNw?=
 =?utf-8?B?a1k5TU1XYUxFWnZrcDRVOWtGdU5YNTRPZjRmaUFqVjhUK0pxYnkycEVMUDJF?=
 =?utf-8?B?SDRxWFIvSWNDSUhrbUg2Nm9LY3pEYk12dTN5LzNOT3RHWVF0c1lCVzRtNFlz?=
 =?utf-8?B?OWx1b3dCT3BkVk12UndseU9rRU8vTmtidVN5SkorOGhSQ01hWmRpczRFTVhO?=
 =?utf-8?B?VTgwNkpHT0F4L2RQdU5DUVVxZVUvRFR5WTdZSlllM3ZRZ0F1YUhjUi9uQ2hH?=
 =?utf-8?B?OWhNemlCZTFTczI5d21RWWlZT2kyWE41ejNKTjJEOGR5UU43SVZmT2NHZEsy?=
 =?utf-8?B?Z0FGWURQdi9SQWhyc3ZKV2RvT2w4MWFOa1E1bnl0eVc4MGZPQnZkMVRuelll?=
 =?utf-8?B?SmxBdTJxV25jMHc1d0ZxMWk3R0dibTBha3ErZGtSaityNS8wbkhmV1E0Y0tm?=
 =?utf-8?B?TE9WbkxwV1JxaHVRS0lYZDZ5aitPcWcyQUx0aFFIeVFvdnJjd1YyYnk4MVdI?=
 =?utf-8?B?dE9XSUhBWCs2VjJFS3ZRMG5LbFVwR2xjYjRHWVVXRDdKcVZ0dFpEbnF2blVK?=
 =?utf-8?B?WmphdDgwOHVJMlk5SmQ4KzQzMTBsUVFrY3ZQRHZSbStPV0loKzJXTHJRWXlv?=
 =?utf-8?B?YWZJV2ZtL0lBS1VCYTAzM29YdlRrZFQwQXV0WXlWSVNuSHQ2R2NheXFsdGZW?=
 =?utf-8?B?WmFvQjlRQ205dmtpTkVUUDExZ1RlRXZIV1pBWjU4QnExcUdya21vNGw4R090?=
 =?utf-8?B?NGUxOTBCN2RhaU9lcHVKdFB5ZGhFYU1VUkNjeERDQ0dOSzZ1ei95VVRLY1Qx?=
 =?utf-8?B?UTVmdmw5Mnh0TUE4SlNPNnF2aFl3MUpiNExxdGU0bkVKQjlFeFBNRFdxVitw?=
 =?utf-8?B?bHdZOVVScldXd3A5bmdJR2Erenp5dG9hVzFoS0gvMjA1TmJhUmd1eTNNb1pS?=
 =?utf-8?B?TkRBNzlDY09laGZmV0JJMFdpcTZ6aTZqM1AvbzVHZ2hadHZBKzlLZExuZHZv?=
 =?utf-8?B?SGdKVG4rd2JUNDBVTldXclEwK3VzT3dWVWpiZlkrT0ZTSVR2L0tmTi9Hb2xL?=
 =?utf-8?B?VlY0cmFHcTlXV1pXVVZyK2FzSG9sQS85UE5lTzF2emtmZmRYWC9GeFl2OXUv?=
 =?utf-8?B?L2RXODREMEJKemFHMGhtSjZ1eUdiOHBlempoV2RTQmJ5Z0JML2VpRE9vN3Qr?=
 =?utf-8?B?QjR3NWFlMkNzd2dRU0ZEWXQyeVljVTl6cGhYa2ZkczNGdkZJeVFtVkJ2Y0RM?=
 =?utf-8?B?WDd0QmJueXF1MGExRFdrVzl4L2cwcGEvcytSRFg0VFR0Nkg4Zzg0M3hOb1p1?=
 =?utf-8?B?REZRRWZJVVRmL28ralVkbHNCSWV0SURPR2srOU4rRjVaTSt3WE9Bek1uV2xL?=
 =?utf-8?B?R1REeXBKWU9rL0diei9vSEdYN0VEMkxvZFYwM0l1NW43Z25INUVCbm80OFg5?=
 =?utf-8?B?UmxSMGVjRFdoeDI3bzgvd2t1VlB0a2dPRDhMMFl1eE9KRkl4RjJSRkpLdCtz?=
 =?utf-8?B?OHJUN1pJaVVCbm1YRmgwbjg0eCtpSXdmYnR5dDVnVFNTdDVsR1pVQW5BL1B4?=
 =?utf-8?Q?rR34FZFGTu6vSIYqoqbG9x4JBhLJtzaJ+CwQlaS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c30cb3-3be4-479a-36fa-08d97f5fe099
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 13:33:21.7459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLYy67yEJf7NirWsLtVA4x2iGZyLmgad3NokdoAVVfIXcXwG1b3NV9NI/UsgxsIcTpw0so/lwOxRxAuRxXeG8SKnus5nHZkx2m5NfzJe3QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4950
Received-SPF: pass client-ip=40.107.3.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

24.09.2021 12:04, Kevin Wolf wrote:
> iothread is a string property, so None (= JSON null) is not a valid
> value for it. Pass the empty string instead to get the default iothread.
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

