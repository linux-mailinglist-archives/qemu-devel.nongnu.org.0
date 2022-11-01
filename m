Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC6D61502F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:12:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsPx-00042P-0c; Tue, 01 Nov 2022 10:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1opsPs-00041v-Db
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:39:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1opsPp-0004PS-92
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:39:00 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A181dii009203; Tue, 1 Nov 2022 07:38:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=S5W/2hnS8QnIryQroJ98UoqRa8Yh7A/a+Fixgqz6PuY=;
 b=pkojwDpkY7IHjA01DWNaay8lwes13mpXYPJWU0t5AfIbqt6q+Fq7ZRIPQHNp+WeUy/ew
 JOAApTpnoruxbWNFnvv++w1NsG+Aj2+h1icG+5y/9Ne3HzVU793azzdkIc/xJDCbP2ZK
 ZZcxqFzqA+bSJenbnWzmWc/B+6HQ+s92Yk86CmkhAAzXq4FmrCwvgZMHqptwPJU0s5Tq
 4DVEkO0yOkV+S4efL60lJ4a9Tqcdg5SIT0TD5fMTHUgYwLk/Fts5ERkBqDP5adwi1m/q
 iWVKNaJVjPHyuIofqapOJ91Wz2G5ynu9U6nL2hLLbKqM8aFQQIOYL9miUJaK8KqSZDfY wA== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kj1qxwpn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 07:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of7B3OrYNmxu6rtfYTUOIQFc1Q1RLYRw7z4525eOhKzLRqvooUfuBh3jfVYg4tND/66tNnTmedWtSpTwN2LRbfiXuV56Y7JHbp3OQ9Y8i7gcdElTVDlH7FRXihZeoeUqe8pYsArUW97BXdlNki+W7JpCdke6PIpmT7Zo+neX0T5ObX2R6fj7Gd2Qf4NxTKhlho0XwRDBBaFQ8v773x46BJK+h0bSDqWZxZQUbgDdzfM4cPr8dTPNzX/06IZhL3U/KPTY92jRySb3JH138wMTwMUIFghqxmQzS1cmNiP8uObtNpbOL1Iqf4UXBum07Oq6rkJChSgO713lR3fUj2VemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5W/2hnS8QnIryQroJ98UoqRa8Yh7A/a+Fixgqz6PuY=;
 b=Q5lKkLc/vJCLCzk028goE2fvAREjL4mlsWyj3kmzI0sPB4bKWK2Ku7Fs7Rsie1DPoj4MBKSF3EkEBytLtntzsiAjPUFyNm/NZPV/q5sr7yiGC4Bduzkmie3u3xUh4Fk0+Mh9nbJsWzJGFAy46qLYKM7gnf1UzPozcS517+WEqe5d1ly8+bzALLItMcrGoz1Xsor+Cemd1a+vDpguz/CF02RVrQZys4Ms8g9bNc3pjCVLKQNwCggtowwAw728WEFvPhZ6cv9Vx2fa9AQj5yewknR7K87YtvKxSNw6NWBi6VGBsclPDCkeJoItPwUd1MJU+2l2tlQ92THEoY6/gB7qZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5W/2hnS8QnIryQroJ98UoqRa8Yh7A/a+Fixgqz6PuY=;
 b=2TEeKK0aR8k0s0TRIk/2EXkurATHb2rjWbDjc/6Px/GPIg7FfmNsjr1+Qz/uKLZLB75J1615Kv0eh39LbhFzmEOgy+hatsYYgCMwHjj62iWtlAt6O9P6VAMZfAvk6l80jB3Tw9ymn3PDIFLKDTckC3jUPMxO8iGEoJBtlH3vGsGdjC/lEMRWbE3f94PAeU/0QeS2Zeq7psRxk4D1syfUWD3eMsAnHfGMBknR02EOfrlGFBcVGvixIkJX/SSMxt54opH04356NOXE7NclI9iO3cVztemnhLdolK4XNlOoGbBnNRdjCRCy8YjwFgkPaplkjh0uF/GefPQcdEWlNAiQ5A==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BN0PR02MB7967.namprd02.prod.outlook.com (2603:10b6:408:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 14:38:48 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 14:38:48 +0000
Content-Type: multipart/alternative;
 boundary="------------EOPFrBIPPrlOWjO2s4zO073g"
Message-ID: <f1cec477-d26b-c9d1-141a-8bce5934ad11@nutanix.com>
Date: Tue, 1 Nov 2022 20:08:38 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20221101143029.14246-1-manish.mishra@nutanix.com>
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BN0PR02MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd49d9d-f965-4f9a-efcd-08dabc16c98f
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrtL6SeC0jvhrAhhhp7ROYAq3/cAiyiqxJICd8J1EeDux1uN3t60b0HoL4nye44+MpanPGYk6Ca8o8lEShXR6uG7UoiZvuAmW5n7zLts9nxpDjoyNVr8+iaW1EIwSqmQY4TVh9HkuaLxostejP4NzVUGHKqzi5QmpClP7DJQmrnmbgXRMXw2guJHl/99HOwGMRAsDDGUI2AHWplmjzLOO4H7cNf+f5ELX32ikN18zHoQk8eB968oEPCIKBMwHkYCocklPN4mcjGeJZ6cHbj+fmuhAKCO/16gd9hqyEgOMFM6F7Z6B4/hlcy6EcqOtTRNXRN3tl85XItryvgVGiJN5M6zU7B6vzTE4MRckSymlEcoWijK7SQ3jERtlMuX6bzGkecRIP0tjbBBDRxe3jwfC9pXNRv9sjIoGJqXO27CiflrNXSRqcKvda2zsVAUkzhlL8x5o9SCb8Bs9Rz9C4Q+v1cjuKrAfb6RKkGESVc5RKmSrFmHDWqBurnNWTgBIntimeFgb4fbQRDKrcbtQa58RvP1Z+jsaUevAnP/vUfUM3dM7B55T+4Gbw/26JZjjtjphaKTmjS8/R3oM613ZGBJevyIEMnjuEJZeOC1rCQdcZt22XBznOs7LRuDvh4dOoxCZ50DMqphDVniasBkn9j9RfRjNW05UAiHNTChllTb2BtEkTge+EhNS5iLrFc9wMH04jZTD925e54WUPnfzklJHgwamBTrtwB8vta2mdiVxgCdesOxq1X9jUZRnFUUkaaSRzjwfk9ZUSADbtV5qzeBAgssBdMBtft1xdQaxnQMZSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199015)(36756003)(86362001)(31696002)(41300700001)(26005)(6512007)(33964004)(6506007)(8936002)(4326008)(2616005)(30864003)(5660300002)(478600001)(53546011)(6486002)(66476007)(8676002)(316002)(66556008)(66946007)(6916009)(6666004)(38100700002)(55236004)(2906002)(186003)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2R2czBjVEwxdmhnYkhLV29wZ3VreWZSb1pjZk5NbUtFbko1QUJnZ3dpWDg2?=
 =?utf-8?B?d1FHdkE2K1JBN0ZVUEVsYlZwL2N0REphclZvazJEckM1MjhFVzFpSFlRZDV3?=
 =?utf-8?B?b2VObzFHWEpIODh1VlVwNnpLTllnWGlaeEdROFViWGNUQWZDbURPak5OcVlu?=
 =?utf-8?B?VGcwb3MzWTFzWjRtT0Q5V3lsc2RjZm10elJMVEw0YkFWWEx5RGFFc01keW9s?=
 =?utf-8?B?MGc1ZjdLK3JrTElvWEpnWk1UK0tJMS90SENkYVU5dWdQSUtMakIyVkc1empj?=
 =?utf-8?B?d1c0eDIxcHdlWStQQjkveWVQeTF1UkdVcFd2eWdoVTFCWStFdTUycVZPT1J0?=
 =?utf-8?B?dSs4ZDJoRDROVWphUS9iNFJid1RpTHpnV2l5dlgzck11UzFlckh5QnFicFli?=
 =?utf-8?B?VnNrcUl6VStYRFpYRlYvaWduTDFydWRUTU5NVnZMV2NiRU5hc0hBdmc2Y3pE?=
 =?utf-8?B?SitzcE96VDJoS2duRWE3NkFSVm0rSVNuNG96WTJNa0g4TkdhUXpEVkJGaGtI?=
 =?utf-8?B?QnhGc1RBSUl3UmtyQlE2MVhoM3VMT203REVpQ0hadGlGUkd6N05lY2FXOGJB?=
 =?utf-8?B?WEt5bm1GcVBPMjY3NWUrQkYwNWI4UDIyd0prcDlRVmRQYVNyeTYvUVhrSzJu?=
 =?utf-8?B?M05vbU1tc29ublB6QlNHdlhMWGlFaGRGMUorNzhJNFNkWkVMQ0UxMTdkandt?=
 =?utf-8?B?ZWY0U29uTGdiOFV6VVZVNS9rQ0hwR1YvUElyeHJyMDk2RTUrTWt2bzRZQ2lD?=
 =?utf-8?B?elpEemtNNGJKOGJiT0p4SC9DK0dGUkNwdThqOWVFeHlVVmx6ZEd6ZWRCbSt3?=
 =?utf-8?B?bkNZcUhBRUt6V3lkOCtpZVo3ZVR4WjhTOEhtb0ttajdpTWVHMkRnZFE5VTZD?=
 =?utf-8?B?anpuRG5XZk1HNHlLK1A1V1B1VURVVDdQaGVPbjJCWUQ2aTRsRXpEMlVja1Ra?=
 =?utf-8?B?Rk5yaVI4YVhmYzJCZkVMaDE1UGtFdmNCWUZMUkowVGl3bkZsNWVrRXZ6NFEx?=
 =?utf-8?B?enI3Z0JzQUlabnBqbGllNjJpejhUbjBtRTd3R2thRDZXeGZGMHB2alMyQVJK?=
 =?utf-8?B?T1gxS2hTbjZETFQ4RDd1d3kwMHRsS0lvYkd3dFdrS1VqSmpuNDFNMk5pWVVh?=
 =?utf-8?B?TzN0Zks5aC9ZNEFTU203a29DenptWnNjd1ZzNnVLdTlFd0JNTmxCOVlyREc1?=
 =?utf-8?B?OTcwRlJuZCthSDYzYUEvYjg2KzFBbVQ2eFhLV3UrUmx6dmVvaVd0b2o1M3hG?=
 =?utf-8?B?U3ZJbjJjOStORlVHR1pIakVKWlgzSU5oTFRhMWY2WmRKaTU1R2xheWVOWkVz?=
 =?utf-8?B?dkxJeTRNUGt4TGZxSVpyV2xDQ1lNbGRxVE5TOXBzL3hOanNvNDZsRmQ5RjM5?=
 =?utf-8?B?LzcvUUV1QzhzVW1rNUxuaWwxWVdyQWJvaFUwSGUvQW9JSFp3Y1ZOLzBqaGF0?=
 =?utf-8?B?RXEvaTJISExpZWlNZlE3Tjd6eVRSd1NRSE83bVE2N0RRSDZoTmJZRk5nTmVO?=
 =?utf-8?B?MGhUK3MzZ3EySnpDeFE2SkE2YWwySzEwcTFYbUVxSU1kRmkvRGpTdlhQZXFZ?=
 =?utf-8?B?M1VIT0JRT3Bkc29Fbjl1d2JjbUJHc0JMK1c3T3RZYXRKamJZaFlMdWNSbXRI?=
 =?utf-8?B?NGttN0FLMzJtQnZ3aklocU1YM2pTTlJBRUVzOVJ1K0M4YXdiTW1oMExoSUdO?=
 =?utf-8?B?d0RRa0lKeWtDVmdvd3JPNUI5ejY3LytLMFd4LytJb01STHRKcXFLcVNVZkFE?=
 =?utf-8?B?TUZ1aERteXNvZW1pbkE4VWNPamxOMk9XKzFVSGtwOWdaVTU4OVd1bG1jWjh0?=
 =?utf-8?B?VFBHSW9VOHZGQ2lOcVB0SS9PL2dQLzlNbWlwOUZpeWt3OVh4cjRKWTNuQUZW?=
 =?utf-8?B?ZkxSRWhsU3NrTkJIcndQWnVJUlVUOURiT2xXajBmVHlCV1FDNWk3Z3k1bGtn?=
 =?utf-8?B?N1ZmSXpTOHloOWlyQ1FMQkg4cDI3QnZHdTdJSExEUmVRbktQK1U5bUsxTGxz?=
 =?utf-8?B?dUp1N2ozYUlvK3Q4Q1BMWWxmQ1RsV2FXUGRXVHg0SURydkpvUy81QXRrNkhG?=
 =?utf-8?B?dG9FQXoxejVkMkZtYU1xb2ZieWY2S1FKS3B4MnpjUW40RlQ3RU05OFF6OTY2?=
 =?utf-8?B?aHNFRktlcUZTOVpmWkZ5bEdaUGxnM0Y0L05LditKTVpER1JtWmRYZzZQWnFS?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd49d9d-f965-4f9a-efcd-08dabc16c98f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 14:38:48.6426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKE6UKwIUcyx2RUVPUOWHKCaNTbHIlDd+uptICFz83XMV89ftLxn9+6focesvMMdpPHE0kWdN2u3/8CId2UtQ6Q0C9Tu+1Y+TNlNsBQ1XZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7967
X-Proofpoint-GUID: laQflPTt1CbUyHyN0bwKTSyfE_mQLFiF
X-Proofpoint-ORIG-GUID: laQflPTt1CbUyHyN0bwKTSyfE_mQLFiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------EOPFrBIPPrlOWjO2s4zO073g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for late patch on this. I mentioned i will send it last week itself, but later reliased it was festival week in India, so was mostly holidays.

Thanks

Manish Mishra

On 01/11/22 8:00 pm, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the default channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, this patch
> uses MSG_PEEK to check the magic number of channels so that current
> data/control stream management remains un-effected.
>
> Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
> ---
>   include/io/channel.h     | 25 +++++++++++++++++++++++++
>   io/channel-socket.c      | 27 +++++++++++++++++++++++++++
>   io/channel.c             | 39 +++++++++++++++++++++++++++++++++++++++
>   migration/migration.c    | 33 +++++++++++++++++++++------------
>   migration/multifd.c      | 12 ++++--------
>   migration/multifd.h      |  2 +-
>   migration/postcopy-ram.c |  5 +----
>   migration/postcopy-ram.h |  2 +-
>   8 files changed, 119 insertions(+), 26 deletions(-)
>
> diff --git a/include/io/channel.h b/include/io/channel.h
> index c680ee7480..74177aeeea 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>                           int **fds,
>                           size_t *nfds,
>                           Error **errp);
> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
> +                            void *buf,
> +                            size_t nbytes,
> +                            Error **errp);
>       int (*io_close)(QIOChannel *ioc,
>                       Error **errp);
>       GSource * (*io_create_watch)(QIOChannel *ioc,
> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>                             size_t buflen,
>                             Error **errp);
>   
> +/**
> + * qio_channel_read_peek_all:
> + * @ioc: the channel object
> + * @buf: the memory region to read in data
> + * @nbytes: the number of bytes to read
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Read given @nbytes data from peek of channel into
> + * memory region @buf.
> + *
> + * The function will be blocked until read size is
> + * equal to requested size.
> + *
> + * Returns: 1 if all bytes were read, 0 if end-of-file
> + *          occurs without data, or -1 on error
> + */
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp);
> +
>   /**
>    * qio_channel_set_blocking:
>    * @ioc: the channel object
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index b76dca9cc1..b99f5dfda6 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>   }
>   #endif /* WIN32 */
>   
> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
> +                                            void *buf,
> +                                            size_t nbytes,
> +                                            Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    ssize_t bytes = 0;
> +
> +retry:
> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
> +
> +    if (bytes < 0) {
> +        if (errno == EINTR) {
> +            goto retry;
> +        }
> +        if (errno == EAGAIN) {
> +            return QIO_CHANNEL_ERR_BLOCK;
> +        }
> +
> +        error_setg_errno(errp, errno,
> +                         "Unable to read from peek of socket");
> +        return -1;
> +    }
> +
> +    return bytes;
> +}
>   
>   #ifdef QEMU_MSG_ZEROCOPY
>   static int qio_channel_socket_flush(QIOChannel *ioc,
> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>   
>       ioc_klass->io_writev = qio_channel_socket_writev;
>       ioc_klass->io_readv = qio_channel_socket_readv;
> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>       ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>       ioc_klass->io_close = qio_channel_socket_close;
>       ioc_klass->io_shutdown = qio_channel_socket_shutdown;
> diff --git a/io/channel.c b/io/channel.c
> index 0640941ac5..a2d9b96f3f 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>       return qio_channel_writev_all(ioc, &iov, 1, errp);
>   }
>   
> +int qio_channel_read_peek_all(QIOChannel *ioc,
> +                              void* buf,
> +                              size_t nbytes,
> +                              Error **errp)
> +{
> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +   ssize_t bytes = 0;
> +
> +   if (!klass->io_read_peek) {
> +       error_setg(errp, "Channel does not support read peek");
> +       return -1;
> +   }
> +
> +   while (bytes < nbytes) {
> +       bytes = klass->io_read_peek(ioc,
> +                                   buf,
> +                                   nbytes,
> +                                   errp);
> +
> +       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_OUT);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_OUT);
> +            }
> +            continue;
> +       }
> +       if (bytes == 0) {
> +           error_setg(errp,
> +                      "Unexpected end-of-file on channel");
> +           return 0;
> +       }
> +       if (bytes < 0) {
> +           return -1;
> +       }
> +   }
> +
> +   return 1;
> +}
>   
>   int qio_channel_set_blocking(QIOChannel *ioc,
>                                 bool enabled,
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb683f3..f4b6f278a9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>   {
>       MigrationIncomingState *mis = migration_incoming_get_current();
>       Error *local_err = NULL;
> -    bool start_migration;
>       QEMUFile *f;
> +    bool default_channel = true;
> +    uint32_t channel_magic = 0;
> +    int ret = 0;
>   
> -    if (!mis->from_src_file) {
> -        /* The first connection (multifd may have multiple) */
> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
> +                                        sizeof(channel_magic), &local_err);
> +
> +        if (ret != 1) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
> +    } else {
> +        default_channel = !mis->from_src_file;
> +    }
> +
> +    if (default_channel) {
>           f = qemu_file_new_input(ioc);
>   
>           if (!migration_incoming_setup(f, errp)) {
>               return;
>           }
> -
> -        /*
> -         * Common migration only needs one channel, so we can start
> -         * right now.  Some features need more than one channel, we wait.
> -         */
> -        start_migration = !migration_needs_multiple_sockets();
>       } else {
>           /* Multiple connections */
>           assert(migration_needs_multiple_sockets());
>           if (migrate_use_multifd()) {
> -            start_migration = multifd_recv_new_channel(ioc, &local_err);
> +            multifd_recv_new_channel(ioc, &local_err);
>           } else {
>               assert(migrate_postcopy_preempt());
>               f = qemu_file_new_input(ioc);
> -            start_migration = postcopy_preempt_new_channel(mis, f);
> +            postcopy_preempt_new_channel(mis, f);
>           }
>           if (local_err) {
>               error_propagate(errp, local_err);
> @@ -765,7 +774,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>           }
>       }
>   
> -    if (start_migration) {
> +    if (migration_has_all_channels()) {
>           /* If it's a recovery, we're done */
>           if (postcopy_try_recover()) {
>               return;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 586ddc9d65..be86a4d07f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
>   
>   /*
>    * Try to receive all multifd channels to get ready for the migration.
> - * - Return true and do not set @errp when correctly receiving all channels;
> - * - Return false and do not set @errp when correctly receiving the current one;
> - * - Return false and set @errp when failing to receive the current channel.
> + * Sets @errp when failing to receive the current channel.
>    */
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>   {
>       MultiFDRecvParams *p;
>       Error *local_err = NULL;
> @@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                                   "failed to receive packet"
>                                   " via multifd channel %d: ",
>                                   qatomic_read(&multifd_recv_state->count));
> -        return false;
> +        return;
>       }
>       trace_multifd_recv_new_channel(id);
>   
> @@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>                      id);
>           multifd_recv_terminate_threads(local_err);
>           error_propagate(errp, local_err);
> -        return false;
> +        return;
>       }
>       p->c = ioc;
>       object_ref(OBJECT(ioc));
> @@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>       qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
>                          QEMU_THREAD_JOINABLE);
>       qatomic_inc(&multifd_recv_state->count);
> -    return qatomic_read(&multifd_recv_state->count) ==
> -           migrate_multifd_channels();
>   }
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 519f498643..913e4ba274 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
>   int multifd_load_setup(Error **errp);
>   int multifd_load_cleanup(Error **errp);
>   bool multifd_recv_all_channels_created(void);
> -bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
> +void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>   void multifd_recv_sync_main(void);
>   int multifd_send_sync_main(QEMUFile *f);
>   int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..f84f783ab4 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>       }
>   }
>   
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>   {
>       /*
>        * The new loading channel has its own threads, so it needs to be
> @@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>       qemu_file_set_blocking(file, true);
>       mis->postcopy_qemufile_dst = file;
>       trace_postcopy_preempt_new_channel();
> -
> -    /* Start the migration immediately */
> -    return true;
>   }
>   
>   /*
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 6147bf7d1d..25881c4127 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -190,7 +190,7 @@ enum PostcopyChannels {
>       RAM_CHANNEL_MAX,
>   };
>   
> -bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
> +void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>   int postcopy_preempt_setup(MigrationState *s, Error **errp);
>   int postcopy_preempt_wait_channel(MigrationState *s);
>   
--------------EOPFrBIPPrlOWjO2s4zO073g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Sorry for late patch on this. I mentioned i will
        send it last week itself, but later reliased it was festival
        week in India, so was mostly holidays.</font></p>
    <p><font size="2">Thanks</font></p>
    <p><font size="2">Manish Mishra<br>
      </font></p>
    <div class="moz-cite-prefix">On 01/11/22 8:00 pm, manish.mishra
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221101143029.14246-1-manish.mishra@nutanix.com">
      <pre class="moz-quote-pre" wrap="">Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the default channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, this patch
uses MSG_PEEK to check the magic number of channels so that current
data/control stream management remains un-effected.

Signed-off-by: manish.mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a>
---
 include/io/channel.h     | 25 +++++++++++++++++++++++++
 io/channel-socket.c      | 27 +++++++++++++++++++++++++++
 io/channel.c             | 39 +++++++++++++++++++++++++++++++++++++++
 migration/migration.c    | 33 +++++++++++++++++++++------------
 migration/multifd.c      | 12 ++++--------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 8 files changed, 119 insertions(+), 26 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..74177aeeea 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -115,6 +115,10 @@ struct QIOChannelClass {
                         int **fds,
                         size_t *nfds,
                         Error **errp);
+    ssize_t (*io_read_peek)(QIOChannel *ioc,
+                            void *buf,
+                            size_t nbytes,
+                            Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
     GSource * (*io_create_watch)(QIOChannel *ioc,
@@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
                           size_t buflen,
                           Error **errp);
 
+/**
+ * qio_channel_read_peek_all:
+ * @ioc: the channel object
+ * @buf: the memory region to read in data
+ * @nbytes: the number of bytes to read
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Read given @nbytes data from peek of channel into
+ * memory region @buf.
+ *
+ * The function will be blocked until read size is
+ * equal to requested size.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp);
+
 /**
  * qio_channel_set_blocking:
  * @ioc: the channel object
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..b99f5dfda6 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
+                                            void *buf,
+                                            size_t nbytes,
+                                            Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    ssize_t bytes = 0;
+
+retry:
+    bytes = recv(sioc-&gt;fd, buf, nbytes, MSG_PEEK);
+
+    if (bytes &lt; 0) {
+        if (errno == EINTR) {
+            goto retry;
+        }
+        if (errno == EAGAIN) {
+            return QIO_CHANNEL_ERR_BLOCK;
+        }
+
+        error_setg_errno(errp, errno,
+                         &quot;Unable to read from peek of socket&quot;);
+        return -1;
+    }
+
+    return bytes;
+}
 
 #ifdef QEMU_MSG_ZEROCOPY
 static int qio_channel_socket_flush(QIOChannel *ioc,
@@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
 
     ioc_klass-&gt;io_writev = qio_channel_socket_writev;
     ioc_klass-&gt;io_readv = qio_channel_socket_readv;
+    ioc_klass-&gt;io_read_peek = qio_channel_socket_read_peek;
     ioc_klass-&gt;io_set_blocking = qio_channel_socket_set_blocking;
     ioc_klass-&gt;io_close = qio_channel_socket_close;
     ioc_klass-&gt;io_shutdown = qio_channel_socket_shutdown;
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a2d9b96f3f 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
     return qio_channel_writev_all(ioc, &amp;iov, 1, errp);
 }
 
+int qio_channel_read_peek_all(QIOChannel *ioc,
+                              void* buf,
+                              size_t nbytes,
+                              Error **errp)
+{
+   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+   ssize_t bytes = 0;
+
+   if (!klass-&gt;io_read_peek) {
+       error_setg(errp, &quot;Channel does not support read peek&quot;);
+       return -1;
+   }
+
+   while (bytes &lt; nbytes) {
+       bytes = klass-&gt;io_read_peek(ioc,
+                                   buf,
+                                   nbytes,
+                                   errp);
+
+       if (bytes == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_OUT);
+            } else {
+                qio_channel_wait(ioc, G_IO_OUT);
+            }
+            continue;
+       }
+       if (bytes == 0) {
+           error_setg(errp,
+                      &quot;Unexpected end-of-file on channel&quot;);
+           return 0;
+       }
+       if (bytes &lt; 0) {
+           return -1;
+       }
+   }
+
+   return 1;
+}
 
 int qio_channel_set_blocking(QIOChannel *ioc,
                               bool enabled,
diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..f4b6f278a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis-&gt;from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() &amp;&amp; !migration_in_postcopy()) {
+        ret = qio_channel_read_peek_all(ioc, (void *)&amp;channel_magic,
+                                        sizeof(channel_magic), &amp;local_err);
+
+        if (ret != 1) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis-&gt;from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &amp;local_err);
+            multifd_recv_new_channel(ioc, &amp;local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +774,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..be86a4d07f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 &quot;failed to receive packet&quot;
                                 &quot; via multifd channel %d: &quot;,
                                 qatomic_read(&amp;multifd_recv_state-&gt;count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p-&gt;c = ioc;
     object_ref(OBJECT(ioc));
@@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&amp;p-&gt;thread, p-&gt;name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&amp;multifd_recv_state-&gt;count);
-    return qatomic_read(&amp;multifd_recv_state-&gt;count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis-&gt;postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
</pre>
    </blockquote>
  </body>
</html>

--------------EOPFrBIPPrlOWjO2s4zO073g--

