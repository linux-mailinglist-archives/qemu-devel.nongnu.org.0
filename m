Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25892636523
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxs90-0000b0-5n; Wed, 23 Nov 2022 10:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxs8y-0000aq-DV
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:58:36 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxs8v-00087q-MC
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:58:36 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANC0osd025178; Wed, 23 Nov 2022 07:58:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=/2orSd6JVzpwMwdfcA25ykfUm6ags4EbO7CBMsSJlYw=;
 b=1zEb+gL9DabGVVfKGDv09ksQVietIleSC5ZVI1Hw++ErwNaWwzUA1MWwolwmD6Sg+HPn
 f8ObHnk94wU0YDfKCcl/Sl1Y5qAn9KMq3H4YPFkaWlq5c9nVsf9W3t3V9drTiJk86fmm
 MhE2SmZ8xQvDHGOZLDESz+WD6gNUO6UfSScQhhKDah5eWfZfSFhoSuKKCBX/hAXBokdy
 8Nh9LfqQlfvL6AQ+PvYpyUfg/YOYXm3HVAgRkzoUg8TFohZglu8Ekc6qdBzzF/Rc6hBI
 bwPTnCZlYgTjMnwd3EfGei1fXwKN1o1FkNRUGhFbE2VNQ3J1RThGW4L4TNjOtiSYD8aY 9A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxy3mthhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 07:58:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jORvmbZHllYKWxBthPu27FYfJFteKXvsvhVvT/53H+FKaj2Fq7dlCuMkgKgGfcPbYYBPn//GQzSn7Xa8q1NEix3e28yLg8h/pBnDdR94P8vl6jdDoaAn6i4+hjG7T1AaRf92A4a2Iny1eM5vwFt/y7Q/0X66GbGYZZQPzBR31DZpn9fm1ztA1vpYEmPtHGZrjFkUD+600RHvQlpbLY5p3yeIWngs9rdLNaJDK/K4WFn3oJPDI86WJKw6IAXdaxuUQJcMzkH1CaGYQAbCUol9cqG7fEbpq2AP3lHJuOnVCHjvI2erCtnHQJBJhNAPOTfR/XOWdCq+6d7IP94O246XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2orSd6JVzpwMwdfcA25ykfUm6ags4EbO7CBMsSJlYw=;
 b=iOpQulg0IH05qNSii8Wm/bTQQIhJ5UkZRBJo3ndwS9DmE/up6IwKTPYX+1+YtU53cp6gYllQfzUw3fPTASvN8rw3p9iqhO8KPa4IKZazDTy4BbsG7lpFRUPGoqYO/1Q3RVMT+U1TjQ+hA22JXYNkjYKYPAibobQbQsKP3WBBsOH+yUGKZkKxMgWXNchEhSvdxbBcYJs6C0ZXIPM5ftxNyAorVfzNc6aRA76ump8nr9fXBpdgNHFb/iwRSe3bZciwEeRvfxQUn8ui7e3TsTodYIy88m/J+2aBz8TdzMEQk7VGpEHdkfrhy5leBp2R4BUUWHvhomwRvH+gKcJHMIa53Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2orSd6JVzpwMwdfcA25ykfUm6ags4EbO7CBMsSJlYw=;
 b=HqSrCALtr6cFuBMkassqO1+cXxwTh1xPBA2B0cuf2NdZc8Lt1tNk+dPSFgvO3fCnvtyqaOQEbp1Mmr6fZil3wee7r6b0t9S5OvXAYZbBz3cLUTvrZYOINrceHXVw+iaRBHARpeMo89AsDf11Z+sb6q2ZN8A3/gzYih6mmbMlc3diW5DV0sCvHfDkNoVK1QzRanuXitsJ7GTHl+aFUQZyMsOoJDzyyrjJsj90A5AL4cwezTnY9kkg6BRP+CSEzquzm4VDioNhdr1Yof70LU8EHTTNMAf9OB4mn2Ok4N1wUDTOL9cqZGTP7EV5W+GZ6sjuqCOCCbMmISRahpYosaPLDA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SA1PR02MB8367.namprd02.prod.outlook.com (2603:10b6:806:1f2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 15:58:26 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 15:58:26 +0000
Message-ID: <a1711169-fa57-ac54-33c8-4a30631f0486@nutanix.com>
Date: Wed, 23 Nov 2022 21:28:14 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/2] migration: check magic value for deciding the
 mapping of channels
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221123150527.24608-1-manish.mishra@nutanix.com>
 <20221123150527.24608-3-manish.mishra@nutanix.com> <Y35BoSi9NUmbFoCk@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y35BoSi9NUmbFoCk@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:180::46) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SA1PR02MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: 689e487a-1c4a-4166-b8ba-08dacd6b8d99
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7EFLuAF8+dXshshDrpNR3nr74+gU5kPbpF7mMhHdn0PEDPrleN8NbZjWHTCDXxaOFnT3mf8qQz0E4D+UJM6B3dPUN3ZGEIgiAN63qoWW8srIBguxhWdqNt0HY1zMPN1T0+Z5HjyASpW8XnhueHtzvn/bvntoUrU6sYeWuy+HllfW5zTcwYRaHLFSNzctpK1A3rDkOzo7Bmu4jVXgS6GwGNJe1FdbH3P+4x3kORfKb7qI4Ba9Ia7/Rb/T5tj4o/H+462KvAFoI6qza/7Y5domvr9EDdtb78S9z/wtaWHFGQiyl35eByM+jQdXd4dpFC32DL9WozymldmWu02IWvrNuo7o7y4lLjR1OmSCv8kzoRZ36qbNQbZa2X3CUTvNobk4CEV/JKTLOgDi9S/xko2N4BLLH3zGJ5hqamQmJnbLzUREJDNTP4JhobX0hxyIakhtAYXQp6sZRn7bsJ9PUyxzHlJ+o0mUzUL0FbpGULOCACHB7h4EZR58Z70QxYh8ZN74VLEShL6vBO8ovG73L6qmBh/dMyRtHwBJQnfv2QkpFvDIaxe/pwBCaiTWsYpnHBXhe01b2J4dZIUeGQwfFBTDMloyy6JqH0db6koE2GqQPXxLR51gaawkm5XAHDoxR8DKIhk+kx5q0YWcLbJlUzr5eyimydeg5kisRheO9PkrfFjw7633LQ5dSLjelkorkOzUpQ4H7aGVeSxU8m8Ju/NKJjnbrjgmp5IYO9M84ASmoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(4326008)(8676002)(38100700002)(66946007)(66556008)(66476007)(5660300002)(2906002)(41300700001)(86362001)(8936002)(36756003)(83380400001)(6486002)(478600001)(31696002)(31686004)(6916009)(316002)(2616005)(186003)(6512007)(53546011)(6666004)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVMrdDhrOWFPZ2Z3WWxxcExFUnFXMnJVUGJSN2loWEdQMUpLMnMzNzIyVXQ5?=
 =?utf-8?B?VW4xeTBaMkNRTWxkS29HWW8rVklRZThwTUxsL1dLdUNSSzZqRHdDOEFxV0px?=
 =?utf-8?B?bG9uTVQ0azlzRkI3bjB1TTFZTC9MRVNmb3BHenFqckk3NGpIc2piL2pNbkVO?=
 =?utf-8?B?ZVBaaU1VU2xTRnlkQkExSTNyVC85bU9lSGxIWkN3Q0tEa3dibmIvQ3ZGOWU2?=
 =?utf-8?B?TjhvNFlQaExNZDhrKzd5cWRFL1VNUGZna2pFUTBMbktiRzNGdFZGQm8xcVBN?=
 =?utf-8?B?Wi9XL2MybGNLWm5lc2c1NWkzKzZSN0FNeVhYNXNKa2Y3N29YalhXZ01zUGFR?=
 =?utf-8?B?UFRDNm5IOHp3blJCOTNBaHcrMUFiWUt2cmhUdjQzbDJOY0VjZ3c5TUhpdm9p?=
 =?utf-8?B?N1NNU2pnNTBBeWlXZE5aRk5hZ245ZDFMbUpRamh3SzhCMFNXNHBzeVFGL0Ra?=
 =?utf-8?B?NU43YWhycGE1UmUrSU5uZU5wQ2FRT3VjUWRISHc4WDJzM1hILysxdHJZMVhk?=
 =?utf-8?B?bE5Bb3d1L0NxaE9qV1JaOTFpUVR4MnRtaGcvL3BJUEJmU2RDdG05a2FYWk1M?=
 =?utf-8?B?MlRWUE0vNEpXdnNxRnNyYUJ2emp5emNEWS9jWWdFc3dSWlVIeDMrOFlhMlpB?=
 =?utf-8?B?Q0JqQkluaFZ1bjJoVEFlVi95VmNNaCtnREIxRHE3VzJ2RGNGbEJYZExTZkhC?=
 =?utf-8?B?TUR2SDRWWGNUQU9Gei9vbUkxTEtUdWw2Wk4zeUY4Q1lVeEJKVXZIVmdBUEdR?=
 =?utf-8?B?aCsrSmdFbXRneDZPSDlIenJXQ0Zaa1N1aC8ySmJDZ2FCUzk4TmovOFRHbVZu?=
 =?utf-8?B?MUw0NWVIUWF4Ukgza0RkZTRTRDFWd2VkeHFsZ0JwM3hCVVJVaEpQQ3JLOFVV?=
 =?utf-8?B?OUIrR1dEcTNGb1M3NWlneXhsQkVKTllYUUQwa3pYNTF5UHNicFZNZ1JmL2dU?=
 =?utf-8?B?VEVPUVFDOTJDN1RoZWJ6ZkcxSXdsTVJiNlRCY3dRdkExWitiYnowenVMaE5o?=
 =?utf-8?B?SHpzMEZIT1pPSDVlL3hUOEdRTUNMUm9tVlVoanlBbjRYQ1ZEcjAyTkJTOHJ4?=
 =?utf-8?B?bGdoekV5UTFnSjhkRU9GM0I5cElRR0NQeGtzSFp0ZUZJcVBuVDRoQ04rWDIr?=
 =?utf-8?B?eG9FWisxQzcwQmFrdFhMdXlENkR2blZXWEF4cTZRZTY2VjlUSHpRcmk4OGxv?=
 =?utf-8?B?NG0rcVFTNjd0NHFpS2d4SmNkRm9aZDBBL1B5emZ1WXd5WDVkOUc5MnRxMWhB?=
 =?utf-8?B?WG14eTIvellrMWdaQ0ZvMVg1K1hQMnFKQXdmTlBjOEZia05WSWFOL0lJTVl5?=
 =?utf-8?B?VmZhRmYyeWxVY1hvVzlGSVV0ZnlzYVZ4UVJvM0J2SndseVQzY2pSdkNTaEZJ?=
 =?utf-8?B?N3RtUDdLOHN3VFJSa3JwUEdtYzlHb3hnMmxxcDNKQzczTzFmcnBVRC9QZXJM?=
 =?utf-8?B?eXBJQ1FXS0hFRFMvYVp0bDAwa1d0WnBYQUIrekxmdHJxQ0FDc0FTMkY1Y3Rl?=
 =?utf-8?B?azNORyszZXRDR2htY2ltMkZYdUFOazYzWjNDeG90a29nTjI5TmxKWUpXRWJa?=
 =?utf-8?B?WDZIUnBaZFVvWGRrSFVHYTRNTEZIbFJ1bzlwczlpd3J0dXRIYllmOEJiYWV5?=
 =?utf-8?B?NlNGQXk1T0JOS0JrYk8vMklvYWhhMjV5ekhxWTZQN2IwblJlK002S2k4RnNp?=
 =?utf-8?B?U2RFWUI4emdveGljeXJ0eGNLVGpra3VpRDRESkxpZ05Yd2pmTEN6V2ZzZTJw?=
 =?utf-8?B?aldycGRjNG8yWmJ3QWxkcXJhZTdoQjNyUVdqUmlYZmJXcjAxQTFhZ3dySmM3?=
 =?utf-8?B?U2gxdkt0M2VFaGl1dWl5dFZFWFJTdnpMYmRVejE5Rzc3SlBYbGRKUHFGMEw5?=
 =?utf-8?B?WXFCUmNJUUNLcWQyaEg1M2JyT3pQMElxQ0lsOTVpRDhQeDZZMWk0alF1WlhH?=
 =?utf-8?B?MTZOZXhXTndoNExMRjhWcHVCb3F4SzNKbWlOWElRQlhUOGxCUnBJVW83R1ZC?=
 =?utf-8?B?N1ZDOGh3enFsN0lYeGp1dkJuNWtGTnFuUWUvNGpUL0xoUS9YakF3akFFVlU2?=
 =?utf-8?B?dExhV1U1SFE3bjUzM0huVlViMnNKeGZLcENwRmpyTjR1Nm9SMkp2YlZsSWJB?=
 =?utf-8?B?OSthdUZkUVFIZ2ZIUDFwWGFBbDYvZ0dEK001dDZQMnl0bmVsUG5CMlkyNjhR?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689e487a-1c4a-4166-b8ba-08dacd6b8d99
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:58:26.5651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6m5wnzDAFpP5sCcslhuTMqhTknKr+0FRcRWhO8r5j7gnoBP8hZBd+Bb+jID5t9+nph7i3xMQGHAe5/DziD+Kz9TS89px5k6P+HSGKTIELSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8367
X-Proofpoint-GUID: OqP4v4Iq4gkEVCuILM4wRVdATxrKfjBE
X-Proofpoint-ORIG-GUID: OqP4v4Iq4gkEVCuILM4wRVdATxrKfjBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 23/11/22 9:22 pm, Peter Xu wrote:
> On Wed, Nov 23, 2022 at 03:05:27PM +0000, manish.mishra wrote:
>> +int migration_channel_read_peek(QIOChannel *ioc,
>> +                                const char *buf,
>> +                                const size_t buflen,
>> +                                Error **errp)
>> +{
>> +   ssize_t len = 0;
>> +   struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
>> +
>> +   while (len < buflen) {
>> +       len = qio_channel_readv_full(ioc, &iov, 1, NULL,
>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>> +
>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
> This needs to take care of partial len too?


sorry Peter, I did not quite understand it. Can you please give some more details.

>
>> +            if (qemu_in_coroutine()) {
>> +                /* 1ms sleep. */
>> +                qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
>> +            } else {
>> +                qio_channel_wait(ioc, G_IO_IN);
>> +            }
>> +            continue;
>> +       }
>> +       if (len == 0) {
>> +           error_setg(errp,
>> +                      "Unexpected end-of-file on channel");
>> +           return -1;
>> +       }
>> +       if (len < 0) {
>> +           return -1;
>> +       }
>> +   }
>> +
>> +   return 0;
>> +}

Thanks

Manish Mishra


