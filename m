Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CE52887C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:21:37 +0200 (CEST)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcXQ-0008PP-Vl
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqcEy-0004kQ-9h
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:02:32 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:57508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqcEu-0002Bg-3C
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:02:31 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G9eBmQ024377;
 Mon, 16 May 2022 08:02:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=iVKYc3shJzw7p2ZHUa8hIefVj5+LW6lnzkP4YnXvrN0=;
 b=ApObTJ9ld3dcpbtFvkzQsQnUiS5kjYoMACrzz8dOl6MP1l7meFnqUv2GoaskWXfpPw5e
 jts4wY8LxF7UhcDhybR1tWwD8H3iPC7jYgYbWmpxXmP1R+s8lewsTNe4X0b1D60DN/dT
 xrg1X8VdUsDu98DcCY0VM5hdA4gq3IdDFys5TS8OCgDyIDNmUAMC7h4IJDqZ9kCW2iIv
 pWy86ngUFoHyhVZKde/LvwXkpJ3PtqhBHHQsGM60+ju2Yaw+r4LgozbzcsQAlvLWaXO0
 BNXI/543LLqc/zx9W1CL3CRNdIsdCTtoeZlURh8TRmoC9c7bIw0R4T/sS1FDLA8nQ5HP jA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g29y93ph2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 08:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKX4ZScB5dEkPW7k71cg83YJ3R72COV/rpV3+ghblk9uaA8vZ7ToO0y0JbijY0P0j3KazVX+GX+LOUItaHNAF+lOWHskTvD+G9phbuA1uIQIwd5hQm1klWTxg05/9HIRz3W1ZuRfTJ4FtyLi6oSn6gP55PizH0jDa7MHe4FPz88jhRO84Kdxfl4S/9yb9lj9rGY33GyuHMc+E7tcz0mu0WN1T/pCQCcsTuJ+EFotagVzmXxb7CeIw0w3l1Yqk06VDK+y7AwdxN7pg3ohu6DIx84bXDHeoMps+QRgLmdE8Q9GJqVXIlm22vG5b6UfChpeAT+Eh1aHtDfOezK0csU7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVKYc3shJzw7p2ZHUa8hIefVj5+LW6lnzkP4YnXvrN0=;
 b=YTdvSUJLTmgXDo+yFx+9h96rFt0By7nZkEkbZenpN6f09CGbJ+l48nwwTPZxaFlIDEhq/r0tpjPf0AqL579Lf6lCqLu8p416tCfYWT5Pbsgjb7MBaii3cV4B1JOwhNUHzDYcFf1fkMUOMi/gbuZ2njcDOoHyJlNBltgcgUgHEV2DpKSt1LCIJQsdsmfveZB4dQvdF9e/Kzs1kamhtSR08CDVftW4MvF5i9M6/KUoYl1uV/wJ4QStl1cktVmomA1wjB9xt2OiGZPseJx9M3QwZr7T+n3HDkvGRkcrkeaMisis6P2WGxyoxty4ZEasSyrpqvE0b8JrpsLUSwPbjMCJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB6444.namprd02.prod.outlook.com (2603:10b6:5:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 15:02:15 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:02:15 +0000
Content-Type: multipart/alternative;
 boundary="------------hv08drxnUiHI9l8xV9EyRcrA"
Message-ID: <0ad87fcb-28d2-1be7-eece-d57931af23e8@nutanix.com>
Date: Mon, 16 May 2022 20:32:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 14/21] migration: Create the postcopy preempt channel
 asynchronously
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-15-peterx@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20220425233847.10393-15-peterx@redhat.com>
X-ClientProxiedBy: MAXPR0101CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::18) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18423a7c-1231-48ac-263f-08da374d101f
X-MS-TrafficTypeDiagnostic: DM6PR02MB6444:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB6444E58DC80F60820B39C45AF6CF9@DM6PR02MB6444.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2xVK8zAiZmbaBRSVuY/DxC44L9R7SbwGwzzhPWPOKmH3+XD94dF4yt854XVpLYNRXehShGX0OMbtC2lxzY1P5r1htWjLI/jg7zRXokE5U11z52pDAj0Lr/DicRw14VP/1ozGbmDnDKNVtVnWNdpWXMbDuXgrOt9TwCSKYeGT0QUj4+QwKsg/LgNpy+kDijOdecIS1eB4yyht3KhJZg1UJqc6bS4ZpcvNwVG7kIzcVvwNma/wv/CN7jqFw2RDF1BdN3vMPcN7woIWr8Uq+7LtCLwiQI+i9R8DeZapoygsd6aKJcf5CHUG46ZU2tTPgwBesnHbjHYiKODzvM5DF94WGwRxxBuDWSRGUxbju79xKrd1u5gm//lQbOp4SLsdnjLBtdROar67McxIHYwWwgrQMscx1tEV0Y7Mot3o1N64XmyR2pbL9ImZp3dR+tK4DdNZAMWdJ9nzGRSCn+CEY1SkTzXQ26qvod5UEZISVB/6KouCERuDuv78AQazfNiuCIodV8nywEAGnDL2kSUfVSoDtU3XV0h9J3+cOx+AqY9AmGGs+3aoH0mLU9BbjMVovNXAVwmiConx32B0ql1aZCAkCnoQX9Q98hwsUZyuEHm+HyChaYR8TIlGQCR4+HCj3RSMtr5/rWlpxVVWBsRUQIjW73J6ZzU/ldUZsIdmCUCaondRFD+Zhjcj4tQwNH3B2rX71QkFDtgAePF4P6CogtB+Z5CXChc2DvE3KI38yGJ/KhRCGywi7OftoA4Icb/3JuN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(4326008)(8676002)(66476007)(66556008)(5660300002)(508600001)(8936002)(30864003)(186003)(6486002)(2616005)(53546011)(6506007)(33964004)(86362001)(31696002)(36756003)(6666004)(38100700002)(2906002)(6512007)(83380400001)(54906003)(31686004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWY4eENDekFxOE1DNXUxd1B1cnpTcndPY2hVSW45RlRHeTdLcXVNc0VTS2R5?=
 =?utf-8?B?RW14U0d3SDBxRXI5UVZlalJTRjJEYXliTWM1RlJmOERoWkV0MGRlZHl2Tk9k?=
 =?utf-8?B?NE5kWXdmamJLWjRINnpLS0tqNHhMMldCcm5Rd3Y5ZGxxR1V1Ni9MV2FYQU42?=
 =?utf-8?B?YzlYV0VmSzl3TkVjYXlBOVRKdHpmNlJKbmd1Q1N0SUNacmljdEt0enpnamJn?=
 =?utf-8?B?NXFOY2IyY0tkdDB2ekF5eFlrVklLdCs2emtWUE9WRzVqcm1EbkVodFpNL3ZL?=
 =?utf-8?B?cU9BSEF3TnpZamxoZnBqeUNvb2hpVEEvMVZYSmJlN0p5eWV1c3g2bW84NWlV?=
 =?utf-8?B?K1d0Z3oxREE0UGFuM0JEQUxnVi9pOG55RThHYStRVitoYlRsUkkxbnEzTERr?=
 =?utf-8?B?a21qVDltdEZJWllWMGVKOC9Pb01IS2Mxd0Q4bnoySnZ1SXlHdVBHNEgvcDlo?=
 =?utf-8?B?Z1NyUHlFSE5ZL0xmdDlxYXo4M01hcDZ5Y08rM3FZSVRBT3hVblU1MlpLTXZx?=
 =?utf-8?B?c3A4MG1LaGoxMmhwS2RnZ3dVOGlhTEcxMi9lY2ZjN1YxanBydE44VFNPcWRJ?=
 =?utf-8?B?U0JpOEx3TzZzYVhyOUdQdHQ4Tmt1RllhMUZsVXNVeFBycFBWRVJoaFQrTWxu?=
 =?utf-8?B?QjQwVGpjZXB0WUljelhuWDFHUlY4c3BlKzd4YVpoVWgrMEZOUFVwZUdPT04z?=
 =?utf-8?B?QVBSQXJCcFB5SjZGOGJ5enpJK1NzRnVPdHNpSXVGWFlaQTdEaVhLME5VM21j?=
 =?utf-8?B?K1NHY0d0NHNyd1puNGk1WitvZ2tVYy9obmUzYUZ5NEdjNFRVYXRRM3RWcFZn?=
 =?utf-8?B?dis2U2wzM0RXT3VGeEJPUUNiWmJQR3FweVQxbG1vUXVsOHdZSHA0cHVlMzhi?=
 =?utf-8?B?YlpWdkMzOVRJUk90Qzk3OTZjNmcyT1Q1TGdONkFSYXkxRGNLQzRwYUExTnF1?=
 =?utf-8?B?SUN3amVPM0pJZVlabkxaOGFzakl3N2ZJNngyaWV4dE9rY2N3MU9pSmFnWlhP?=
 =?utf-8?B?WjRYRURqazVLRE9XcHg5UlIzNlpwNk9oUzBTaDZRK1NtMEljaEZaNFVQTCtu?=
 =?utf-8?B?bExmeGJFTXdxNWRjNEdScUZJWWsrdDhwelNFcDlBbVhnRzJNSTRBNnEwdE9F?=
 =?utf-8?B?Z3hVSk9nSXNiZUp0Qi8yYVEvcExJWmRKYTdndjBsMEJiV0RDU1ByeExiSjIz?=
 =?utf-8?B?YVF6N1J2ck1BdW94S1czOHhoZEI4djVQeGcvVG53NHQreDFhakdPOExPcVor?=
 =?utf-8?B?R2dFeWM3SFVGY2x4ZWVzbVpEU0JRdll0Vis2WjAwYlFxRElyOW4yRGlnMkRx?=
 =?utf-8?B?Q2JwOHFzMDhBMGdvcmFsdExGMW5vVExpSWNWa2VONjhNQTB3WmZIdk9vU3F5?=
 =?utf-8?B?K1ZmdDVub1Jua3AyZGMxVER2MlhZdXpYSWU2L1M3bjFoK2laR2x6aDgzVzlO?=
 =?utf-8?B?VS9aRldOZE91aGw4QVU4MENmaHk3NEhuRndRNHdqVWR6MXlMSU5GQ3NKNkZR?=
 =?utf-8?B?ZDVtNnJERVpES2EwVDZ3ZlNaUE1uZzBSQnZ0SkNiR015UnBuZmdpUGVyNTdU?=
 =?utf-8?B?Ti9xN0hGMThtQVhEMDhlYm1mL082VGVJOVVrN3haNy9nbnlMaDFsZWQyOWV0?=
 =?utf-8?B?UWxMZTFrQjQ2a05tTDIwY1dST29HaWlMeHc1YnFzM25vZVJGVWtvTm9YaTJQ?=
 =?utf-8?B?VFQxSzJrTjJ6eGlZdjF6QXc3aWlTeFFNMitmQ0xFV3hZTFhQMzlldlJKS2t0?=
 =?utf-8?B?S0lyMVkwdDJMTEU5SkVwUDZTZGlGK2dnNkl6NGZjTXVnR2VmOTZadmpka2V2?=
 =?utf-8?B?cUE4N1EyeStTTjNYWGxBRXN2UUhvcXB5dnRkNyt0cWMranZXT0d1WncvUXR0?=
 =?utf-8?B?TjlTN3MydHlFeGxQMDlqU0U4czdGWmlRdnFLOUUrVisrTWk2eVovLzNlNlJE?=
 =?utf-8?B?QTBBOWJzaW56VTVaYldRRzVwUWh0N1dTQ0pteFQ1MEdKRXZscGZpT3FxcktR?=
 =?utf-8?B?M2pjNmo4L1hZckFWNmc1a3p3Mm10b3A2VVJtRmFxYUNybnhjdy95YlN4V3BH?=
 =?utf-8?B?RmRzOVhnVkhkZ0ZQaWs2bUszL1BSOTdOdE5MRGFUVW9CQU9yaWhXdW9tenVt?=
 =?utf-8?B?QnhMdTlhckp4MlY0T3gwMlBwSmJvTkJJaElCcld3VlNTbXpmcVZqWkYvZ1BF?=
 =?utf-8?B?T3pIcTZxWmhDVjdMMnRtdFpkMzVzR3NGcmFmbjlaRkcwVCtsMW10TWk0WndD?=
 =?utf-8?B?bjNRRytTL3dKRy9ERmY4aHFGemM3Y3E4WUxrZERteTh5SkFseGxKZ2VLUFRK?=
 =?utf-8?B?aEVsSVdycnUwQlhiT3NtRUJmNEd5RXg2cEVqOVJ6ZHZrQ3AxSVVzWVN4M2V0?=
 =?utf-8?Q?dsE1+k6CUW9QU8+PMPF+jyF9MB/2OCsIV1cwvaoGg/ePL?=
X-MS-Exchange-AntiSpam-MessageData-1: ghCiQCkI/S63frUJdbpwNQf2BCivyJamF7M=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18423a7c-1231-48ac-263f-08da374d101f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:02:15.0238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3qItOmimiS1xkDSGPzviSoZ93NCP3GHiJ+j6xbV4un+B53V+8vKgcisnIcOPP0Ltqj1iubBYE+YqztFD5yBNHxRW/XarbA2Z49wtw4CYxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6444
X-Proofpoint-GUID: 73YutClaK54bOjH_V0HVtEBj9vABI87M
X-Proofpoint-ORIG-GUID: 73YutClaK54bOjH_V0HVtEBj9vABI87M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_14,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--------------hv08drxnUiHI9l8xV9EyRcrA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26/04/22 5:08 am, Peter Xu wrote:
> This patch allows the postcopy preempt channel to be created
> asynchronously.  The benefit is that when the connection is slow, we won't
> take the BQL (and potentially block all things like QMP) for a long time
> without releasing.
>
> A function postcopy_preempt_wait_channel() is introduced, allowing the
> migration thread to be able to wait on the channel creation.  The channel
> is always created by the main thread, in which we'll kick a new semaphore
> to tell the migration thread that the channel has created.
>
> We'll need to wait for the new channel in two places: (1) when there's a
> new postcopy migration that is starting, or (2) when there's a postcopy
> migration to resume.
>
> For the start of migration, we don't need to wait for this channel until
> when we want to start postcopy, aka, postcopy_start().  We'll fail the
> migration if we found that the channel creation failed (which should
> probably not happen at all in 99% of the cases, because the main channel is
> using the same network topology).
>
> For a postcopy recovery, we'll need to wait in postcopy_pause().  In that
> case if the channel creation failed, we can't fail the migration or we'll
> crash the VM, instead we keep in PAUSED state, waiting for yet another
> recovery.
>
> Signed-off-by: Peter Xu<peterx@redhat.com>

Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>

This also looks good to me, sorry if i mis-understood and this is not correct way to add review tag.

> ---
>   migration/migration.c    | 16 ++++++++++++
>   migration/migration.h    |  7 +++++
>   migration/postcopy-ram.c | 56 +++++++++++++++++++++++++++++++---------
>   migration/postcopy-ram.h |  1 +
>   4 files changed, 68 insertions(+), 12 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index a0db5de685..cce741e20e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3020,6 +3020,12 @@ static int postcopy_start(MigrationState *ms)
>       int64_t bandwidth = migrate_max_postcopy_bandwidth();
>       bool restart_block = false;
>       int cur_state = MIGRATION_STATUS_ACTIVE;
> +
> +    if (postcopy_preempt_wait_channel(ms)) {
> +        migrate_set_state(&ms->state, ms->state, MIGRATION_STATUS_FAILED);
> +        return -1;
> +    }
> +
>       if (!migrate_pause_before_switchover()) {
>           migrate_set_state(&ms->state, MIGRATION_STATUS_ACTIVE,
>                             MIGRATION_STATUS_POSTCOPY_ACTIVE);
> @@ -3501,6 +3507,14 @@ static MigThrError postcopy_pause(MigrationState *s)
>           if (s->state == MIGRATION_STATUS_POSTCOPY_RECOVER) {
>               /* Woken up by a recover procedure. Give it a shot */
>   
> +            if (postcopy_preempt_wait_channel(s)) {
> +                /*
> +                 * Preempt enabled, and new channel create failed; loop
> +                 * back to wait for another recovery.
> +                 */
> +                continue;
> +            }
> +
>               /*
>                * Firstly, let's wake up the return path now, with a new
>                * return path channel.
> @@ -4360,6 +4374,7 @@ static void migration_instance_finalize(Object *obj)
>       qemu_sem_destroy(&ms->postcopy_pause_sem);
>       qemu_sem_destroy(&ms->postcopy_pause_rp_sem);
>       qemu_sem_destroy(&ms->rp_state.rp_sem);
> +    qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
>       error_free(ms->error);
>   }
>   
> @@ -4406,6 +4421,7 @@ static void migration_instance_init(Object *obj)
>       qemu_sem_init(&ms->rp_state.rp_sem, 0);
>       qemu_sem_init(&ms->rate_limit_sem, 0);
>       qemu_sem_init(&ms->wait_unplug_sem, 0);
> +    qemu_sem_init(&ms->postcopy_qemufile_src_sem, 0);
>       qemu_mutex_init(&ms->qemu_file_lock);
>   }
>   
> diff --git a/migration/migration.h b/migration/migration.h
> index 91f845e9e4..f898b8547a 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -219,6 +219,13 @@ struct MigrationState {
>       QEMUFile *to_dst_file;
>       /* Postcopy specific transfer channel */
>       QEMUFile *postcopy_qemufile_src;
> +    /*
> +     * It is posted when the preempt channel is established.  Note: this is
> +     * used for both the start or recover of a postcopy migration.  We'll
> +     * post to this sem every time a new preempt channel is created in the
> +     * main thread, and we keep post() and wait() in pair.
> +     */
> +    QemuSemaphore postcopy_qemufile_src_sem;
>       QIOChannelBuffer *bioc;
>       /*
>        * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b3c81b46f6..1bb603051a 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1552,10 +1552,50 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>       return true;
>   }
>   
> -int postcopy_preempt_setup(MigrationState *s, Error **errp)
> +static void
> +postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
>   {
> -    QIOChannel *ioc;
> +    MigrationState *s = opaque;
> +    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
> +    Error *local_err = NULL;
> +
> +    if (qio_task_propagate_error(task, &local_err)) {
> +        /* Something wrong happened.. */
> +        migrate_set_error(s, local_err);
> +        error_free(local_err);
> +    } else {
> +        migration_ioc_register_yank(ioc);
> +        s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
> +        trace_postcopy_preempt_new_channel();
> +    }
> +
> +    /*
> +     * Kick the waiter in all cases.  The waiter should check upon
> +     * postcopy_qemufile_src to know whether it failed or not.
> +     */
> +    qemu_sem_post(&s->postcopy_qemufile_src_sem);
> +    object_unref(OBJECT(ioc));
> +}
>   
> +/* Returns 0 if channel established, -1 for error. */
> +int postcopy_preempt_wait_channel(MigrationState *s)
> +{
> +    /* If preempt not enabled, no need to wait */
> +    if (!migrate_postcopy_preempt()) {
> +        return 0;
> +    }
> +
> +    /*
> +     * We need the postcopy preempt channel to be established before
> +     * starting doing anything.
> +     */
> +    qemu_sem_wait(&s->postcopy_qemufile_src_sem);
> +
> +    return s->postcopy_qemufile_src ? 0 : -1;
> +}
> +
> +int postcopy_preempt_setup(MigrationState *s, Error **errp)
> +{
>       if (!migrate_postcopy_preempt()) {
>           return 0;
>       }
> @@ -1566,16 +1606,8 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
>           return -1;
>       }
>   
> -    ioc = socket_send_channel_create_sync(errp);
> -
> -    if (ioc == NULL) {
> -        return -1;
> -    }
> -
> -    migration_ioc_register_yank(ioc);
> -    s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
> -
> -    trace_postcopy_preempt_new_channel();
> +    /* Kick an async task to connect */
> +    socket_send_channel_create(postcopy_preempt_send_channel_new, s);
>   
>       return 0;
>   }
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 34b1080cde..6147bf7d1d 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -192,5 +192,6 @@ enum PostcopyChannels {
>   
>   bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>   int postcopy_preempt_setup(MigrationState *s, Error **errp);
> +int postcopy_preempt_wait_channel(MigrationState *s);
>   
>   #endif
--------------hv08drxnUiHI9l8xV9EyRcrA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26/04/22 5:08 am, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220425233847.10393-15-peterx@redhat.com">
      <pre class="moz-quote-pre" wrap="">This patch allows the postcopy preempt channel to be created
asynchronously.  The benefit is that when the connection is slow, we won't
take the BQL (and potentially block all things like QMP) for a long time
without releasing.

A function postcopy_preempt_wait_channel() is introduced, allowing the
migration thread to be able to wait on the channel creation.  The channel
is always created by the main thread, in which we'll kick a new semaphore
to tell the migration thread that the channel has created.

We'll need to wait for the new channel in two places: (1) when there's a
new postcopy migration that is starting, or (2) when there's a postcopy
migration to resume.

For the start of migration, we don't need to wait for this channel until
when we want to start postcopy, aka, postcopy_start().  We'll fail the
migration if we found that the channel creation failed (which should
probably not happen at all in 99% of the cases, because the main channel is
using the same network topology).

For a postcopy recovery, we'll need to wait in postcopy_pause().  In that
case if the channel creation failed, we can't fail the migration or we'll
crash the VM, instead we keep in PAUSED state, waiting for yet another
recovery.

Signed-off-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a></pre>
    </blockquote>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Manish Mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a></span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">This also looks good to me, sorry if i mis-understood and this is not correct way to add review tag.
</span></p>
    <blockquote type="cite" cite="mid:20220425233847.10393-15-peterx@redhat.com">
      <pre class="moz-quote-pre" wrap="">
---
 migration/migration.c    | 16 ++++++++++++
 migration/migration.h    |  7 +++++
 migration/postcopy-ram.c | 56 +++++++++++++++++++++++++++++++---------
 migration/postcopy-ram.h |  1 +
 4 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a0db5de685..cce741e20e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3020,6 +3020,12 @@ static int postcopy_start(MigrationState *ms)
     int64_t bandwidth = migrate_max_postcopy_bandwidth();
     bool restart_block = false;
     int cur_state = MIGRATION_STATUS_ACTIVE;
+
+    if (postcopy_preempt_wait_channel(ms)) {
+        migrate_set_state(&amp;ms-&gt;state, ms-&gt;state, MIGRATION_STATUS_FAILED);
+        return -1;
+    }
+
     if (!migrate_pause_before_switchover()) {
         migrate_set_state(&amp;ms-&gt;state, MIGRATION_STATUS_ACTIVE,
                           MIGRATION_STATUS_POSTCOPY_ACTIVE);
@@ -3501,6 +3507,14 @@ static MigThrError postcopy_pause(MigrationState *s)
         if (s-&gt;state == MIGRATION_STATUS_POSTCOPY_RECOVER) {
             /* Woken up by a recover procedure. Give it a shot */
 
+            if (postcopy_preempt_wait_channel(s)) {
+                /*
+                 * Preempt enabled, and new channel create failed; loop
+                 * back to wait for another recovery.
+                 */
+                continue;
+            }
+
             /*
              * Firstly, let's wake up the return path now, with a new
              * return path channel.
@@ -4360,6 +4374,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_sem_destroy(&amp;ms-&gt;postcopy_pause_sem);
     qemu_sem_destroy(&amp;ms-&gt;postcopy_pause_rp_sem);
     qemu_sem_destroy(&amp;ms-&gt;rp_state.rp_sem);
+    qemu_sem_destroy(&amp;ms-&gt;postcopy_qemufile_src_sem);
     error_free(ms-&gt;error);
 }
 
@@ -4406,6 +4421,7 @@ static void migration_instance_init(Object *obj)
     qemu_sem_init(&amp;ms-&gt;rp_state.rp_sem, 0);
     qemu_sem_init(&amp;ms-&gt;rate_limit_sem, 0);
     qemu_sem_init(&amp;ms-&gt;wait_unplug_sem, 0);
+    qemu_sem_init(&amp;ms-&gt;postcopy_qemufile_src_sem, 0);
     qemu_mutex_init(&amp;ms-&gt;qemu_file_lock);
 }
 
diff --git a/migration/migration.h b/migration/migration.h
index 91f845e9e4..f898b8547a 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -219,6 +219,13 @@ struct MigrationState {
     QEMUFile *to_dst_file;
     /* Postcopy specific transfer channel */
     QEMUFile *postcopy_qemufile_src;
+    /*
+     * It is posted when the preempt channel is established.  Note: this is
+     * used for both the start or recover of a postcopy migration.  We'll
+     * post to this sem every time a new preempt channel is created in the
+     * main thread, and we keep post() and wait() in pair.
+     */
+    QemuSemaphore postcopy_qemufile_src_sem;
     QIOChannelBuffer *bioc;
     /*
      * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b3c81b46f6..1bb603051a 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1552,10 +1552,50 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     return true;
 }
 
-int postcopy_preempt_setup(MigrationState *s, Error **errp)
+static void
+postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
 {
-    QIOChannel *ioc;
+    MigrationState *s = opaque;
+    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
+    Error *local_err = NULL;
+
+    if (qio_task_propagate_error(task, &amp;local_err)) {
+        /* Something wrong happened.. */
+        migrate_set_error(s, local_err);
+        error_free(local_err);
+    } else {
+        migration_ioc_register_yank(ioc);
+        s-&gt;postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
+        trace_postcopy_preempt_new_channel();
+    }
+
+    /*
+     * Kick the waiter in all cases.  The waiter should check upon
+     * postcopy_qemufile_src to know whether it failed or not.
+     */
+    qemu_sem_post(&amp;s-&gt;postcopy_qemufile_src_sem);
+    object_unref(OBJECT(ioc));
+}
 
+/* Returns 0 if channel established, -1 for error. */
+int postcopy_preempt_wait_channel(MigrationState *s)
+{
+    /* If preempt not enabled, no need to wait */
+    if (!migrate_postcopy_preempt()) {
+        return 0;
+    }
+
+    /*
+     * We need the postcopy preempt channel to be established before
+     * starting doing anything.
+     */
+    qemu_sem_wait(&amp;s-&gt;postcopy_qemufile_src_sem);
+
+    return s-&gt;postcopy_qemufile_src ? 0 : -1;
+}
+
+int postcopy_preempt_setup(MigrationState *s, Error **errp)
+{
     if (!migrate_postcopy_preempt()) {
         return 0;
     }
@@ -1566,16 +1606,8 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
         return -1;
     }
 
-    ioc = socket_send_channel_create_sync(errp);
-
-    if (ioc == NULL) {
-        return -1;
-    }
-
-    migration_ioc_register_yank(ioc);
-    s-&gt;postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
-
-    trace_postcopy_preempt_new_channel();
+    /* Kick an async task to connect */
+    socket_send_channel_create(postcopy_preempt_send_channel_new, s);
 
     return 0;
 }
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 34b1080cde..6147bf7d1d 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -192,5 +192,6 @@ enum PostcopyChannels {
 
 bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
+int postcopy_preempt_wait_channel(MigrationState *s);
 
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------hv08drxnUiHI9l8xV9EyRcrA--

