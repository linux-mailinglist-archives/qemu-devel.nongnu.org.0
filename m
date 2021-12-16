Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618C476F1C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:47:53 +0100 (CET)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoIi-0000jb-9O
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:47:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoGy-0007bT-Iz; Thu, 16 Dec 2021 05:46:05 -0500
Received: from mail-eopbgr150098.outbound.protection.outlook.com
 ([40.107.15.98]:17568 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoGv-00037P-Vd; Thu, 16 Dec 2021 05:46:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmobF5r5VE38nr/VRUAOsRxjt0uqaR3wQebLtUCWDXBC+KFBTdlUY6Jk2G3Oo+1Qeajmshx7NtqglKS4D1RpUNgDMFftpu82uPGKY8UCT4nd98oKrY86+U3E3eTW9OBVUOE6eWttAZc9G8smAwEkJ52//7ld965i8PrXb9jWsjMS+Er88HFGfJVlrZjajsiDpIFnHCFqCKmbjLA8d0wG7EARz5J301wnK5kgoxb/Ib9VaVjxY7P/LhiqZAn9qnDdDFnpl1VfvyvuE6pg4Q2qv0JMu7srJkxhU0iAbAiH4OJfATqF4ufwuafNYejY+FxAywb354jOrDmVmVlLaVHGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvhRZnRwnfEkQscWpO3p17Aa3CQqkNWQA/ZWJlvumNI=;
 b=Wf1pEXfZmRfSGE0P0XGlILowDOUVlZLPrab0c50FBu81mDhWh0YraUTDwhRcEQBfF0JrGLBUdv7u2j68CgWCdqEC0Dy21UW1SUJbWyWku0GL0eBmVrz9z1FjgqlFhxnX/a5v4DgauhMrRAy9Baj7icVV31m+Q8yNwHlh+tQNy7TPfBrYZW84aDePo9c7xFdSGqRiqrJs8uIiErVTDEcVvWqvkJwUQIVVgh+9yeq5q9XQzXnNxy0cv1qJISulCaQil9ylksWSAPE+HCHeUCr33ThEXgE8Hg9eW9t+F5dlVXp9+yBlSeeWdZbovXujQzJWB95S/d9q1zqIaf7f2UVSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvhRZnRwnfEkQscWpO3p17Aa3CQqkNWQA/ZWJlvumNI=;
 b=ZNEo0ErvBHK1gQpIk1uCwZDJTucoeskOrZQi4xCTKs2fo1CGDRnLY1N8xHklEl1ygxK5JtOPjHfkWCowuFch3/XfR9362NMIZ7jFW6jKXOYeGzVHYFcdeQoAkZLPxmJTKsTpQAx1nOoqSfprJg3HW/H4urktPkgIXYAhH/p7ik4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4961.eurprd08.prod.outlook.com (2603:10a6:208:161::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:45:56 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:45:56 +0000
Message-ID: <720ff9e4-8f68-c8d9-23ba-0770deb0955a@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:45:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 09/25] python/qmp: switch qmp-shell to AQMP
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
 <20211215193939.3768033-10-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-10-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0042.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6P192CA0042.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:45:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef96034d-6c62-494f-77bd-08d9c0813d36
X-MS-TrafficTypeDiagnostic: AM0PR08MB4961:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB49619F73B1C38624827CBF76C1779@AM0PR08MB4961.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwVxygLnMpB5nTsKEbY1qd7QOxSraFYenWRcN9HjP1PFqHz1HgHafvZbr4wJZMWidWz05ogI4kWCR9NzlTIOlfieJVxr291aP6L45JSJ9B6m6S6bw1KmVFeHSieGETW/02x+qxHWhRw8vqbC1yokfCX8sIxI9y4qOWH5gRateMPHCTwy8rYI9Z87eRaAY8Rms8LsaFL5j8wLqLEIg8M5GjwLS5J5SwEfVHsqCBw0PdJWCN6lgQu/pN/SgLxlk4XqDuJ0jmJatZtX1tR0B3ErnTItftKiw20+er1Rc0/Jk0RJsPnt4xxOu/WZZ5jlEK4bKos+V3hhl6U1hLQRF59gQJHclH0g/Lo60GRVMHEUnxNAptcY1I7nEGI0hzIna2iCNokXIST4XgU8EOUYLHreo94zQnKhXOP1PQ+/DA8Lcf4ewQ2p/Hrs8PrY7EzvUU1yqJlV5XgLYl5kN5l9wZ3cBkmTtd/fVMexlev+MqKqA950zFPdhmCKdU5op7agjz/eK8c7zRAMbnoOCf4UZGtGz2obEppti/RdKRlidtXnHoudjQ/QV8qnFO1mw3kh3E1TkEvxgHocZP24/BkTcigb4fuYgKuvR+vgkuCnX5h+NfdXHgYGiU2+g3sq6FxmkvS64WpZPJ8YV+SDiCFr130nf8pobpKdiPn7icEeQTbRleS6VDmZ6Xcf8LsayCEeWMcHpMvllINZNagQuSvjP5ZH7XkYvoZaVye2cQvtDibn7CwEso5euckSB3Zg5U16Txz7GQdH399fB7ldeJIGn3qHwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(5660300002)(4744005)(31686004)(7416002)(508600001)(8936002)(8676002)(16576012)(36756003)(2906002)(38350700002)(38100700002)(6486002)(4326008)(956004)(2616005)(186003)(31696002)(54906003)(66556008)(86362001)(52116002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXJzdGJSSVJZNDhndnUrdkcwT3FuRThMenl1ZFdFc2I1dDMzVUVOTFJMK3p6?=
 =?utf-8?B?S0tRVlZwVFZQSUoweXMvMEVCRGVUWDZtSUFWSnBaYk1yUXJ0ZHo5TXNyRURN?=
 =?utf-8?B?Uk5XeG91b0hYdnlWcUt5M0xxZFJsaXkycVVNNUNyeXRRV1hXQjhlT0ErQ1hJ?=
 =?utf-8?B?dEJ1RElYd1JrOWg3TzM2WU9aS01ydjRoQjdCYTc2RVpBODZ4WmFmeUwzditT?=
 =?utf-8?B?L3JOdzFxOC9DbGQrcDBtTDVqd0FNR2x4MkQvWGUwN3k5U1Z5Y0FTTGRHTjkz?=
 =?utf-8?B?TzM3bnBxdGllbC9JR0RmZWZydzdDWDMyWWlTOWE4aG1KS2prdkZ6QWRqK1pH?=
 =?utf-8?B?K3BzWVhhV0F5b1l3MW1kR0xTZDhidjUyT056TWpXNlNZYzRTa2JpZVI1OGMr?=
 =?utf-8?B?Y3g5OXhQNWlySUlMTUNXcXhVbzZTUXhaWm44Z1RQOEVGaXVDMXBHWG0vYWUy?=
 =?utf-8?B?YllUR1djVWVDaGxRVUJlNGFEekpKaEkwZ29LK1ZpaU1YMEF4WGowbG1pcnQx?=
 =?utf-8?B?WXhsNTVJd0l4MHMxSWtiaFlSQzBTUWY2RHVRbHNkMEprZGJqRTlIdmcxWlF1?=
 =?utf-8?B?SkExQVNhWVVaWkl1TzRjY2Y3TCtzeXgzNno3MGFSVitTc1Bnc2ozUjVkZXR5?=
 =?utf-8?B?QUJVR1dpZ1hlMTNYdE9neG1JNDM1dWJKc1l4TlQxRGFhajZxNkNyZkxNK3cx?=
 =?utf-8?B?emRuWWZjVUd3bS91WUxqTTQ2WXdOalljUkEvVmRsT0U3Rmt6UWgwbzgrVUVM?=
 =?utf-8?B?MXU5eUl1TjFjNENlamEwdEl3RTlwMllPM2lMYWxCYm54NER6RDhaZHNJcHRx?=
 =?utf-8?B?cnZTYzBWeklIckdVd1pOeUJ4T1hCMC9QTUFYcEJmTS9qZncvbGZFUVVtekpX?=
 =?utf-8?B?Q3FlcTNEMVFUOWZ2OVpVNlN6YkZoeUYvSWdXWmd1RVFFNzRHQjNlLzJKMWk2?=
 =?utf-8?B?Q3RGNEZwK3pCY2tkNEdvWFhGdURGNzlkZU53ZXpYRE1XM2s3MjM0eXp6ZHU0?=
 =?utf-8?B?eHlTT25GRGNKeDVTQisxYlU3MXZud1d3NHhyTzZ2cmh5NXZyZEc4NDA0RGFN?=
 =?utf-8?B?aFAxc2RhdzdId3A3OGJmUDcvVlY4aUFMbUYrOXdWMDNrZCtnMi95bks2RXNu?=
 =?utf-8?B?RkE3NTVPeGlQTDllN09BRCtsdmI3Sy94SHpNbzlBamVHRUNvdkFJZlEzOEhV?=
 =?utf-8?B?dDdVOFI5K0JXVGxnbWxkWW15dHRxRk9IS2FHeDQ5ZUtHTldQeU00dmZ4UCsy?=
 =?utf-8?B?Y0dMbVo1UHRWWEpZSVQwSG9BbE9IekthMFhEU0JMeEQwakIxRGN4UnZWeHZP?=
 =?utf-8?B?NythREI4UmJpU0NSMXhJQlNhTWhYMURmVm16S1M3UDVseVJJN1hlV1dsNTNU?=
 =?utf-8?B?azVSdlRhM0RqMW1zQXMwb056bGxZZ05JNWlqazQvTzJlZDNscWRBZU0xdStT?=
 =?utf-8?B?QittbDdkeDNnSW1VczBXL0J1aWxSa0srT0lGZFRwN01naDlqeUp4cHVFVEdU?=
 =?utf-8?B?MVc2L2ZTSUxmQ1A1VkdzaTh3ZVRvSnFscHlkcjBHQVdFMEZEa25maDJNWVFn?=
 =?utf-8?B?OFlwcFJmWkd4RDlFUDBOZlptU2VZRXBkYUNUM1cwRUs3NS9OQUhqWnpwTGtN?=
 =?utf-8?B?aTB3VzFLNHI3VS9ZSXJUazYrS3lLUzQ1RFdXZVc4V3lJVHF0M0J3WmswY1RL?=
 =?utf-8?B?eENzTWR0dlRQUnJBRGM3ZkJET0IwVjI4WVFsUTZFNXRoVEY5Uk1VVmtyVXkr?=
 =?utf-8?B?YmhUVW1XbklMKzRLelNNWjBoN05VeHExc0Vaa0tFN2xDMnBlRlkyOElhYmVR?=
 =?utf-8?B?dGg5b01mbXFWRUhqcEJ3ZjZySkEyZklBVjF6M2EyZFNNQVZQOFdpN3pnTWJp?=
 =?utf-8?B?L0YvaHpmTUxWeGxCQ3FHMnRJQ2N2SXBqc0d4citrMDFaeFljeFVzRHIrTEVv?=
 =?utf-8?B?OWt1WE9VdFlHNW5CK0JpZ0NCY0p3bzNqekNiaTlBenVUbjZ1R2hUdjJRNzVB?=
 =?utf-8?B?QTgrYmo5VmRJWUFRcXB1NENFL3Q5dnp5YmhEcFcreTV1REZVMFlRWlI2d2cx?=
 =?utf-8?B?REtIR0dQeEJlVHhydjlJcGVWYzFQSzJ6b0YxVUY4dUNnYnNDNGpBdUE4SHhi?=
 =?utf-8?B?Z015QkUwdG5PTnVDZ3BDQTBjS0k4THo5dTVwZGx0SmE0MlJ3ZFh3L2l5QkxE?=
 =?utf-8?B?OXNMNWR4Y3RWclNGUUxpckpDVVE4QXVsSVhtNFNWYnZYa0svTXIzam9ONjFy?=
 =?utf-8?B?ZktZZXhqSzhOQ1hzaEpncHhRTFVBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef96034d-6c62-494f-77bd-08d9c0813d36
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:45:56.1492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65aWetXytsKjEoTF/4Xo23wkh3F9O9BPgJQrTS+6IBtsYS/35MZdYUABksyKO+Hy/o7A9Ab+BDE73JDcnYX3Vja1XjnJu3q6gnbepHHt48Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4961
Received-SPF: pass client-ip=40.107.15.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.12.2021 22:39, John Snow wrote:
> We have a replacement for async QMP, but it doesn't have feature parity
> yet. For now, then, port the old tool onto the new backend.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

