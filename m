Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186E34EEE3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:02:48 +0200 (CEST)
Received: from localhost ([::1]:60242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHlP-0001Pg-2P
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHj3-0000tX-AI; Tue, 30 Mar 2021 13:00:21 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139]:17377 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHj1-0004C0-I0; Tue, 30 Mar 2021 13:00:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxwNMZqCPL/yzPWBBCB8TVQ3EJCfWfePoW5dAa9ZH/Cag4cE64dHC4iq/GzBFaRReF2oCz2PBQR67sefvYoWvAOZRiqKcG2XXwHGL5TgHyxmuJc2MuacSlZkQ5DVaMOUIc4isxm1h2PBnmIFSwyrK0cXuaYGH0ApBCKSfICXHyDpJefZGNBcgt9z3BvYXYtAO9EmQ3Qwt6q3ir+FUVdprcoTa0MXA0Ddj3XaSmxIh2fbmRnPHHNCKmrDEGDG8j8VLrjzj/faV4VjE5UCrYavoF8kUd685l2AWrgL64T67YF1NrDYoNYWr/MOptkrLMUQ2y+bZG8yR/506cQ0EoODeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=694yqhwDAr76KVVaeFrL9sc1+Vp13gWDqMyGLIgZajE=;
 b=CjDPib0S0QnGXOfVhu8qqg5w0a459baPnc+dgQj6JdB55hZdsB5ov4rNiaU6yZnOvCi4KUKqu8+dJ/pKTk7lGdS5dZCSuDWvIxikWxp7wdhO4zdNcTh9avTVN0PBo+zCIOEm39BJ2cQUwB+oHe2u3JYjJ1ZcNn7PeQDpJKF36ierWB7pasBQoL34+5OVOsaoX5DFnT2Ih3Z4T9YRZ58iLr7kZEvZEHfshsckvsWR2putVErxjjiEOIrUe7YXd68MQrokT8GvKh8WM7KUxM5lEJf+/sxyiCff2bYbj2P0Nr2WVUfMTbqTMA439I+rZVvj5fMZ+WewBzpVXJlA1004Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=694yqhwDAr76KVVaeFrL9sc1+Vp13gWDqMyGLIgZajE=;
 b=HO5oWq3G8nXGHOsCEI0TBIMuaOKb4C8fbgEdTAMXvC6o/Ue/xPZJhwST7HTMOPEtLgobKSGxyyUSVn+DE5F65BhdtdjKN5EryGXNUGBdLnm755cGItD3gm38y5V7e9MM0ZiLvtB+cFIq87qmdfNNg2qwGRuIKY6SMRM33+fHRQE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2532.eurprd08.prod.outlook.com (2603:10a6:203:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 17:00:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 17:00:16 +0000
Subject: Re: [PATCH 4/4] iotests/297: Cover tests/
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-5-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <37713b3b-5d27-77dc-a18c-e1a16faecc5b@virtuozzo.com>
Date: Tue, 30 Mar 2021 20:00:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210329132632.68901-5-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR02CA0031.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:208:3e::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Tue, 30 Mar 2021 17:00:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa6b1aa8-445b-47b0-19ea-08d8f39d4a8e
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2532:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2532976D565FE90783359697C17D9@AM5PR0802MB2532.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GzsSLL63MtUS+9CaEyT+qOj6m8B5T0v5wYr44hXHH+DL3h0r5LC7wTOStYJWoRFYVV2c5RSLu+mq2oCsHyBvaM5G9lgKtvk9pubhFPlFTwWgafu0ubsnPp2eFWY0KcAzNzUnbOE+LT/DiDqEteHyNgCqr14xkIX+npxz8wwD6+hFmK+gUkAuNwFX0VxzlQTG9mPsMafNoIAtMVJCqKSClBbpL2rx9T0J9ba/1MOQq/gH/6xeXiyIaOyZR9GHuDrtPCLnLZCw3RZbwcNhb6qk6qLSxT4VywKzvk3j7cgHdVbkDNIyF9R3Lv1qTKTE3W/yWEcWcAjtKeGuw1qjTlit0x2cgpyg+ugTdMMOL7HTL7AzneZKMjcffSE4U/dQ6V4A+n/W6P9wFpAgoQrEqv6ddBFwgo3gxNHBUeSqAlFS7OdQZXnN/VOtguVJCs7docAxUB20jFfFnypDFVZWKuHLTZkZa5RU53P/HEeC5xZwaEJeYSogAcVINmYGRfWuJW2xkVI+OQpLXNO/oIzxbOg42GIhNtM1r79zKiNjYKXBVZQpnKDD0z2AR+TgKa2Cl7hdu7V1aDmzIUSSP3W08KbjArEQ/So8jA94yFXZW6UHoINGKjvQib20Mk4OTK8PZIoxVfkHYcZ/Cb/9FYTCm1+16LVXw6+OQjYyfNZh2T3yJVrOqTXj1kOmfzYWZ78mBZeX+mocdAYh11iGIv8qDkNtxxqXywHYSBBNeHm0yRLtZXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(316002)(16576012)(5660300002)(86362001)(4744005)(31686004)(66476007)(66556008)(31696002)(186003)(52116002)(2616005)(8676002)(66946007)(6486002)(8936002)(2906002)(36756003)(956004)(38100700001)(26005)(478600001)(4326008)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFlZWm54WlZHN01FL2ovcDRwcHlDMGFMYnByT3lUMWRPc05OUTVoM3Rsa2FW?=
 =?utf-8?B?OWpDdFdKSklGVmVkTW9ObVFmWVhLbHduRDlMdWZCaFdESG80Rk91VSszbWV4?=
 =?utf-8?B?ODdDZEtlcGcyaENrRzB3ZVQvK0NvdUttVFVPSjdUWGxFRzhFbHZuQUZjRXkr?=
 =?utf-8?B?aEJDUGVWTjljWVlJdUN0aXd4ejNEck5QWnJCTnhHMTN1QU9VNmdOTjZjcmlD?=
 =?utf-8?B?Q2tJdGNYT1ovS1ZrZ1dCZVczTlZiUkpYOURtL0dsTFdwYm56UWR2TFpYSm5P?=
 =?utf-8?B?NmR2TEk0cURBZzJLRC9WcXMzT3dweUREOC9DYjlEL2lHRHU2U1dNdm9KcndD?=
 =?utf-8?B?Ti81blFmMzNvdVhlcWNuc1YvOEdqWDJyYWIxeTdBVUZDeTkvZHl1YXVNa3l5?=
 =?utf-8?B?NXBHRDhFUlo0OVcvc2lyQVRJbXRvdGplZ2s1WUVkL3dBTUN3NUpkcnI3N1dl?=
 =?utf-8?B?NFFUQkRXYzljQVdxOXA5ZkhqZnkyWkNONG4zZTdQZXZSRUIyaThJdFhRWVdH?=
 =?utf-8?B?OFVVVlR4MzgzWkdxb3JXb3NlNHFuNEFjZkw3Zi95eGUvbjZ1ZVR2UmFpN2V1?=
 =?utf-8?B?MWloa2t4SStDN2hPWFNZYmR0RGliY1RKTFZWNmdia3JJU21OUzZkS3RTMjN6?=
 =?utf-8?B?Zk5NMDdrTEpPRDFnaEplT0xSOTdRZm80emtVNEZpTGVlUC9EQnRaMXlXL21W?=
 =?utf-8?B?eWFwQ0NUQk9ZZUZNK3JtZDZDNlhIQzZQeGZwbHZNQzlxNTJWVUJ1czJmM3E5?=
 =?utf-8?B?dFNYVUZ2MytHc0VQVXFKeUd1bGNMTG9nRi9seU5CclFUVEZuZlZFbVNvbGVw?=
 =?utf-8?B?MEtlSmtJQnk3dkNKUnpsOXRYR2d4cnBPcDZ2R25jRFFmRVJLK215ZE8rbVY2?=
 =?utf-8?B?L3oxUW5VbHkzbFc0ZFBDYWpsTXgvb1B5cXVCL2pMeEszOWR1bjJLZm1wV0M2?=
 =?utf-8?B?dzJuU1FmMjY2RDlJU2dqWWZTbVZKWTJ6M1hxbks3UDYzZmFOQVpFSXYzSmN3?=
 =?utf-8?B?eFRvTUVxOW1TaVJPSzF2b20vLzZkQ3IxK3dabWVCMVg1Qk5mTFJEUDFWZ2V0?=
 =?utf-8?B?M0hRc2RzUkIyd1FLcmYrODNZUXYvVDM1aHpZZEtWUWZzRndXZFJWY3F0Wi93?=
 =?utf-8?B?eVNzYTRmSTl6RUNOQmtKRlpHVm43K3NjT25JMzFjQXZyaG5kcVI1OGUrd1lG?=
 =?utf-8?B?YUpOOEdYVzBVNjFQVGdYa2FjR3gxUWpMVnp2S1Q2YXcxaldwczdFWUVyNlc5?=
 =?utf-8?B?WkMrUFM1d25SMlZsMkp5MnN0aUdFWkxGd1FoQUJyT3dBcTRSemtzMkVXdURn?=
 =?utf-8?B?T2MwR3FzVlZnZ0JKN2JwS1FLdmNpdUdMdGs0TTZ6N0s1aFdIQ1FLRmVvZEE3?=
 =?utf-8?B?UlU5RGZkUlU2OGlWTTdJZGVrTDgxeTZic0wvcDMrcUhQVGMzZGt0cGpkMlFa?=
 =?utf-8?B?T0VXVThSMTgxRVdidXhKM1JsWXNTb3hOZENlNXlSdGpXQmdwVU5sWWo2WFNm?=
 =?utf-8?B?SmcrVlNzNU9xSjFGN1o0R3ZYOWxHTkNBRFVjRWlsNGN3cUlLQVJRVy80MEU1?=
 =?utf-8?B?YWd5c1ZEWkFKS1hIMCtUTDFKTGhjTXFycjNpMTZGMmtRcFA4dTVORGJ5ZXY1?=
 =?utf-8?B?ZHVDaVB5NW9jRUl5L0ZaelpKT1RScUJOMVRDTGkyenMxRjQraEFObEJOekhD?=
 =?utf-8?B?dktDdDRVZnVPWWIzY0t2akFtTExjVTlPZXl3U3FrdEtFMEdjZS94L1lqQ2pn?=
 =?utf-8?Q?9ahX6ml8w72ImjynsUtC9d5ynbLwdYafc5SPJ3+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6b1aa8-445b-47b0-19ea-08d8f39d4a8e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 17:00:16.1566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57pcpc97dq6ZsxioPSCELAl/DSjdqLzkvMzJAq5Dh5dKuEAYWTgBEf7SgjRJ9YPMg0G9bDJKYpgm65eUp3eHb8mH0ESxin9yVqosfP3bDuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2532
Received-SPF: pass client-ip=40.107.20.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

29.03.2021 16:26, Max Reitz wrote:
> 297 so far does not check the named tests, which reside in the tests/
> directory (i.e. full path tests/qemu-iotests/tests).  Fix it.
> 
> Thanks to the previous two commits, all named tests pass its scrutiny,
> so we do not have to add anything to SKIP_FILES.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

