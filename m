Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C83942ED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 14:49:08 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmbvH-0006hq-AK
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 08:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmbrR-0003xp-Em; Fri, 28 May 2021 08:45:09 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:62190 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmbrG-0005UF-6f; Fri, 28 May 2021 08:45:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9hKpXWdsrE4W48kpOnLxQqCHErIWe2Gwf7he+yXphLLlQ/aO2xpFrglExdbmt/QrJpF1RfNVIZVUC2/EExP932+WIYaTYRhN/Juf5/5N5IGjNEui5Nb3NZWdkbJTo4Ewgkk+clQVXIkuU0x67Ic7ZKUectXjJLqgQ7jkDDOVa5p6YCX66WhhBYexuWb81q8WQs0ayQQOTGh3RlZQz+tT3A4ChvO++tfT+bm3yfHZvvYpo1JIrhjO6rzj04AQfhNMO5hfj5Ft4iJIrRh9t1vs+jM6/m0QUfIBB/xMEfSb/DtDMiA5vC+NHo2Gr2a+DAfos4POrZG61QopigblzhxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncnVGsz3jFQc4niLONVGS+oNTv5tUKB3kUwk31ItKLQ=;
 b=j+43ObDDFYqa/Ju1k+1TRTdXBiUNIzvETYLwLnMc/bZgTpXbfqW5q7Ujk5uvezLamZ5UR2Nbd1Rcz2cRn32yOudjSuYd1OSOx3SNLpPJK9MOroqbsM1p91DN2uGjCjvysdzMkpUPreSIj5AqbIRlxCokwvwM6odGc3VT+x9W0+EG3WNL5/aHjt0y73sDE6pzS3mKNNWhh1AmMgJRT/bMYi/0k625X3VBegkUFg/6EfNaw7EtkLYSGqS3H9BScAUtDxj3iZFsFQrvJ/3OJp1U6VccQPZiO0I3kg+Oa661/3iHBXlW+D/sZp2wpzjkDQVrD/FwlVc0lSxYf9LJGb1+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncnVGsz3jFQc4niLONVGS+oNTv5tUKB3kUwk31ItKLQ=;
 b=TyMhjuTV2fdDw8ThdEtGC7pY/+TV6PD0N9hLAmEr0vgi5U+eJjnCMQ41Ll7hBvzahnnVDoAks5VaJbeeHmtq1NsXtXS0224+curvLVNmT/r0pFoDae8ZK3ebNPNQu7ap7iZMZZS7lEpE51lr/7zdvhB+mqNcTadlBzDVXtBaqHk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 12:44:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 12:44:49 +0000
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
 <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
 <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
 <db0d5d2c-2e7c-ec33-b9df-52977fc3179c@redhat.com>
 <47ae4243-5a4b-e3a5-44fb-48c689f8bc77@virtuozzo.com>
 <867d0357-1032-f56d-dbed-bd646ce8ec00@redhat.com>
 <fc91616b-9d6f-dfee-d648-30828a13c1b8@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <51212a88-375e-5591-fbe6-6eae3959f71b@virtuozzo.com>
Date: Fri, 28 May 2021 15:44:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <fc91616b-9d6f-dfee-d648-30828a13c1b8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR0P264CA0278.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR0P264CA0278.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 12:44:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bee65c08-5a41-4f7a-832e-08d921d661b8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5335277D55F42300EC9418A4C1229@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1OEST0dE0JBOjcZIL9CA6gcZMHPcWKpPwehEJzd4uD3YNfvkNmvKXEX7reBO8wurTxjXvh7aCAge4iZ1OMiIkTBYe2gyEw3+Dmd29RBcfnhnCS7JPFBOBdkgi/1us0hPrcOrWreBGr/hubeqbJ9Gz7Y6zjUE+uzuNXgnAv4gODmav7rMUptva0osI12cL8IpWTNBiYWtJJNaUbHechVgM1JtCiC+dmNyjRVwoNlNGwEj/1n0LApt/HhL04F9YIboCzPdnN0jFmzmYPQdBZzYPeFci7RTlaFsSNFwE2SfbHNTJWXhiZlBoOUly7kgzoABgiEjYRb1pRX3uLo77gs7KTUY+jQZ7jgkAqjCmJIse6rHEWzyoA+6YpITSkctBpZ4dZkEk7Z1dJRhh7gpEEkBjN7f1bYGFRb/bi7aKXJ2ls/8YxVcWlykKBO162PaLErgBmj1nZG+7dtc+qWcWLx6NiJibXQPcWwvUp6AmQkd3ruiMLyU0tptsb8lDksgtbzwvknjb8we6GirX+FoAtIPoxuu4CV+9Ba2Uywnpoq3X5wkqHlaZD06S1HmudCIhLcujpymhhUXGirKLPc3pxQAhR2zbFZHIB320Pwm7fYkg3dO5q9n9k9Ley+0VanQVXHAV9k4gFxO9RN8+htsb+Zc/nireeTk5X+wEaMRgNpHAeI2cMZW34h6BVCtu8dATttoavKmY+mFc0zO5VNbFSFqzbKANx6nc0U9gmOOQ9rTaiulOKVue95J9WRfSALf1ANn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39840400004)(396003)(376002)(83380400001)(4744005)(316002)(110136005)(38350700002)(54906003)(52116002)(16576012)(16526019)(186003)(38100700002)(956004)(5660300002)(2616005)(31696002)(86362001)(31686004)(26005)(36756003)(8936002)(8676002)(66946007)(66556008)(66476007)(478600001)(53546011)(6486002)(4326008)(2906002)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUJ2MjNKQVFxSkdwSGxZK3d0Q1VLZy92ZHIyU1lLV3BNSTVTdFRmZXJNRUQ4?=
 =?utf-8?B?TzlQaEZUdUY0NldKZTBySnNVQmNLK25NWlRJNzdIK1VqaWZVZll3VzdpbkRK?=
 =?utf-8?B?S2FDNlhxNlFpci9hdkRIRTBwbzRzRlFsVG9IcVR2a2Y0WFU1SmhGZGRweDgx?=
 =?utf-8?B?UFlwTGNxQnd6bktRY2hneXkrcGduY1gweStaOGRaZkJxS1JrYyt1cmt0UWJI?=
 =?utf-8?B?cXFkMFpWTHQzem54N0lTRUhsVE5iclQzZUpwL2J0dFRkZDZaSm9WN05sdG5C?=
 =?utf-8?B?ZXFHRGxvOEgxRDhmbVQrNE94S3ZJVms5V2thNmxrd1NEZldQOVdKWEpYNVV5?=
 =?utf-8?B?YmR3R3ZEOHBTNEQ0RmZNZDlrM2pXdWpURWt6OE5JaXZ4SnYzeTYwV1BQRjN0?=
 =?utf-8?B?TGlURTJoL2RnMFNkSmlXSWpneE8yRlI1QjNPNnJONmJPS3FKR0RTRzBYa0t5?=
 =?utf-8?B?TDRzRkpRS2NuUFlmQmtnQS9IaHVEMS92a1R1cHpGbEMyZnBHS1dyZXgyQ2VN?=
 =?utf-8?B?TVlLaHJ5dlNhUnU1THQ3VjE5VzAvWVBySXhjRW5nd2VQWXUrQ1p3Y0tBL2pS?=
 =?utf-8?B?dEs4eldhbnU5Mnc3NVZJT1Excm41enA0TDFobjZySW96czRaQ25aT3g0TVoz?=
 =?utf-8?B?OEdaV0xUS09OOHlSZVVlcjlvOTdtd1RBMXpjMGw3QWordDg3OW04QzVBR3Br?=
 =?utf-8?B?S2tid3kwYWFIMTYyeTVWcWRCN2VOTDJBQ0NzUFMzR3FXZWRDRERJcXQxU3N6?=
 =?utf-8?B?VUpidUcwbUZESFNXTHcrZE0wYWo0Ync3dG1Sd2JUUFNUY3VZL2duaUxwZTgr?=
 =?utf-8?B?K25WVWdUSm4yZWpuRCtGRUR6QU5STEhYY3lTWU5zekhYbjhkMmdOa0x6VW9n?=
 =?utf-8?B?cHVTM2IyQ2lXYkhVSHd0MncvaENVZHRmczFxVXdpNEoraElKNEhDU0ZSME0x?=
 =?utf-8?B?WGxVMzdydVBXTzdHQVVWMnY0NFBRcXo3WHozS0U5cjVWRGVJT2N6dVlQMDJu?=
 =?utf-8?B?eWw1Rk1HK2dJMzg5aXptZU9QTDlsV1hoaDJFUzdVUUloeUwzeWFSSVFVck9S?=
 =?utf-8?B?SUhMMFFpbk1IdFBKNVNjTGtFek1teGo2WGJ3cm5VOHN2RWdaZHdtR1owcXkz?=
 =?utf-8?B?WFZmbE5uOGhXandFeEdrRW9LK0w5TnVuYnFvc3RZTCtzRmt3U0t6WVRCMEdv?=
 =?utf-8?B?UXpqOVZKbjN1MkRWanpCaFRqU0p2ZCtLdFlVa1dlREVSb0dUZWN5akcwL2kx?=
 =?utf-8?B?MVIwdTNrd0pYZlh1K3pWWnZVVWgrRVZqVTFTaVZ2bmtIUFNiQ0tXa1lNRlhU?=
 =?utf-8?B?SnA5SktnQWh1THJFY2lqbllMN3VuMzFhWEg0dWNhd0ZkWVIxU3FQSzhVZkdO?=
 =?utf-8?B?NTZjR0wvR0xFaGlJd2hML0tlM0hhSDl5V044c01KeUZnRlI0QXpBbkc0VHI3?=
 =?utf-8?B?MkJybjhlZ2RJVW1yeU1CcWx0eXJCSlFzQVBseXcxWTNZSGx2cHhlVVNDZFg1?=
 =?utf-8?B?NERsVGdpS3Nzd0d4dm4rYWlScng3N2srbTBTR2dtSjBodlByaU9yRjlPUHZo?=
 =?utf-8?B?VEFlNXBLdWdzNEd4VDgyRVBvTDJZMTVSYWdUbjdmT0FQMDBreStqU0JEbEdC?=
 =?utf-8?B?Zk40QlJiVzdjeUphdHZBRFJ2SjhqTitQWUtLVXRjVjFzN2xTNS9hVU0vUEx3?=
 =?utf-8?B?V1o4a2QwTUh4cVhuZHZYZFlvU3dydWhHS0ZuRjRqM1VnTEhuUGIxRE1SZnlZ?=
 =?utf-8?Q?Iek3bFJJe5tJxiKezH+rszgpICg+aR0rv9zIC26?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee65c08-5a41-4f7a-832e-08d921d661b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 12:44:49.7000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cAtlQVkL1S0jDLdwNHI8fY/lmbSPKDcTCbYbffc5cvqa7avqCDKkIzLHZYnBLTcvYfBr/5yCkN4ZbeXew8VWYnEz2PLxOwthmRxSEquCNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Received-SPF: pass client-ip=40.107.7.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

28.05.2021 14:01, Paolo Bonzini wrote:
> On 28/05/21 12:24, Paolo Bonzini wrote:
>>
>> It's still more complicated, because you need to add some kind of
>>
>>      method = s->method;
> 
> This would even have to be a separate, one-line critical section...
> 

Hm, so, we should set .use_copy_range in task, when it is initialized.

> 
>>      ret = block_copy_do_copy(..., method);
>>      if (ret < 0 && method <= COPY_RANGE_SMALL) {
>>          method = COPY_RANGE_READ_WRITE;
>>          ret = block_copy_do_copy(..., method);
>>          }
>>      lock();
>>          if (method == s->method) {
>>              /* compute new method */
>>          }
>>
>> which makes it more complicated than this patch IMO.  But yeah at least it's a viable alternative to the atomics.
> 
> 

OK, I'm OK with patch as is. Finally I can refactor it later on top if needed.. I'll try now do some refactoring, you'll probably want to base on it, or vise-versa, I'll rebase it later on top of these patches.

-- 
Best regards,
Vladimir

