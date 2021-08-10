Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8723E53EB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 08:51:54 +0200 (CEST)
Received: from localhost ([::1]:37018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDLc8-0004Dv-TV
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 02:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mDLak-0003Dv-8Z; Tue, 10 Aug 2021 02:50:27 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mDLaf-0007bQ-Tr; Tue, 10 Aug 2021 02:50:26 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17A6kgqc018735; Tue, 10 Aug 2021 06:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=3YhDVO7tl6yfJ88eQS5Wy2HzBsLBqlN46adIxjZUA6Y=;
 b=GzYnSBvgiFoehOLHpGr4XAnuYFHdQk1sbli7SnK26m2lm1aK0WDvg3ZqyH81Epgh1MpJ
 LHplSKFisoispE+ok6u4c1LYn1zCcI55W6EayD0NCRhKBvuckJ0Ql5uQUiqEX8XgsW7X
 LN1cM6hh5Wjnm8eKBLiAiMTI1Qxsuozzg/SpU7aoyv/AtqlzeRnFxAOcSgUmt6gWTKz6
 xIxya2Nrh2P3xmElUf8UHb+hEtMVTye3iW/MDr/Ez0vJcEpoxkawv4SKtVocIJpxFFT+
 mxTRxEnIYFKqL71bMI/YdLNag7Ru2Em/Yr2Ul+2i1Llw3/Mi4vtmJ4X5d3w4+tp/cB9U oQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3YhDVO7tl6yfJ88eQS5Wy2HzBsLBqlN46adIxjZUA6Y=;
 b=AZ96FmSoZT0rS32bSGT8kVXqFGvWEdCF0UwYiqf2vM7l4aKkIdMkOa/iLwY7HpocnOe9
 ms+EAYOlGnSpejkyeGPWgm2iX3HPNTyE/MwFCDhh+OXNtf/l53hEdZrtKMYOJHinRhMl
 CdLyzBWEB4J2rF6DTI0mdSaMhUUUPsbDUEvnrVG8aAuhDB30CNaZeKkkkUvr0rOT7Epc
 47/eSrbuLAdUXsbdexh7FAo5Zj9kCTFrY5XM1ArMqbPDuuA8Vn6+3tmhVCmhZZJMD90v
 hmk8wPJ68h5165cyNQ2Uci/m2SahI6Vt6r+fVmNfGPEhVXdcH9LluNwrLzgipkpxNMN+ nQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ab17dtf6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 06:50:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17A6kNQ0161843;
 Tue, 10 Aug 2021 06:50:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3020.oracle.com with ESMTP id 3a9vv46g1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 06:50:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnuPGhJ3mS9MlYWDh0CX1A6FKWqLWJKIG4D6YCqCTvPVoz3HWcw7qzw06eGB60M7QTdLttTGlRzsJxiXM8jjBwf93vDfRBhjN1FFcuTUF0AdBBSksgqfPFQQP7llGPCItfczjsqTNhJTNBTdSLx9c187quKuog6E8m0X/2rY/ESsaGeNKBnyK22LWPuRCJ+Gnbu3Nhp4uq+eEr0uepFbskXTk3W1+TSXb9IRbsoRyR8M0Q0TPX1pY4YVA8cqq2qfbkyepKNWl3uIaJ7t2xY5TNx9pbMESO11rtz5LAvgqGXwh1fi4OUVVef8nELDqqaDyVOvfSx1GW3m2BY5OoY7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YhDVO7tl6yfJ88eQS5Wy2HzBsLBqlN46adIxjZUA6Y=;
 b=avfRnSxhmeY9bssVl3+V2wHJHifRP9J7Ttv91W/aU+2fxaspbY6wzbD3clna/QZrLvYeoK0G8lAIPf4bOtWMP3VIOZNcG6PtYNHqwfQkGWn6du/GaVq2N3gpc0ZSrucU4iZDzPScEx569bol3Tfz1Z7aUQaKGPWy7hB/FOHSmNOvUZmIQ6W1nGGi/r0pvFKOIhLDDMTVTAlIyRMrwnHTPE3Hq16/yaPnamt3LCOeWpLbPYgHoGYWmFUlt8xRSefauXAYC3Lk2ZaTDzW85HtNiYKtKHAekTsPC27X8OM6mzo2QMe0CD0Tr06dl5xERucrDM4XzRr/Sj0gqOrQNaTfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YhDVO7tl6yfJ88eQS5Wy2HzBsLBqlN46adIxjZUA6Y=;
 b=FqSt/d0L3YO9yjKUtAOhEDElbPF4at+5U/cg+4q4ErnClmRARjzrMAtZoBM/kvKYcFzxVM4QBZwqLvSwGqaVAFjE2WonEYr9lEE0x4s5DHPG60ouhaxx/mblbrtFLsvdjShifXQgpoou2/FSjphbTMr1N9CjEjLVsNf+d4K5jJc=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4423.namprd10.prod.outlook.com (2603:10b6:510:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 06:50:08 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 06:50:08 +0000
Subject: Re: [PATCH v6 2/6] qmp: add QMP command x-debug-virtio-status
To: Markus Armbruster <armbru@redhat.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-3-git-send-email-jonah.palmer@oracle.com>
 <87bl69e89m.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <e735058a-a3d0-ea1a-7cf3-90757a6ccc78@oracle.com>
Date: Tue, 10 Aug 2021 02:50:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <87bl69e89m.fsf@dusky.pond.sub.org>
Content-Type: multipart/alternative;
 boundary="------------6710159561E584303D04528C"
Content-Language: en-US
X-ClientProxiedBy: SA9PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:806:a7::16) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.37) by
 SA9PR10CA0011.namprd10.prod.outlook.com (2603:10b6:806:a7::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 06:50:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 321c230d-6195-48d9-e7b2-08d95bcb1766
X-MS-TrafficTypeDiagnostic: PH0PR10MB4423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4423521D5455B42DA8BF0DAEE8F79@PH0PR10MB4423.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2eCASalq1iEC6nWRzQ+eL1R3f9pCD2JHRt/ZzCy0abWcTnkg8fqhumNvZBEGhecmuFJNZkBUh3Gmt9UxTvb/s53nE6WufVPIfI6/zLoFmHdnOh+fnZaI1/b4u9iIPw8CBgYwy5AtcbcrGyp8gfoI2HZgGM4Y3WzXwu/Gz8iIv3lxPIOAcC70CQ/6zbqQfw2hRYnF4GlmQrwj+lxqM/yxW/Us0oUCWluPcsI9PMPHhoBQQaaGNX1fP0RbAW2x/o3qvQJJIna/BG4Wl9AtbQSSiaaz73lNz+iIoSrtuTYgcV3SedysUj1B85/c/gucGO8Q8zO01JzegWD33PrEVGpk0lE0B+UC62UTFAeXuKxfolMJehCvQuAhh16sH+y3lTVCUwVzciI8NeFucQXe1fz2cc/cKN5+26+Shccq/PrUWfoE+1XHshNmE7NxIE81uQuCF9bsM4MyUvWnrADqw9xknQn2nb9mFaEBU/KlYhPEvOhwLxQAcYK41b6F5K6boBB2koff+l+w4QCfryQ/mihkULJ71/FvkXXJKihwR6COwHlIHIh+R5HshF/JHXYL1CEwbeECMJvmwP1dxJ4PeJcqwrQmKc4mG5cwJJIuP4x2ozeIFg413OJ+CjXdHUhAYUGQ6N36tckqEiIfH0ysuOlb2fD8EvVghH6F9D41VjbZ/JtiKpdAPdUFPKEFf3BDLaL7QZfCvuRwujd3bGjR+lr7P2ht3shzW1eK2RzoAljh1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(396003)(366004)(136003)(5660300002)(8936002)(36756003)(186003)(26005)(4326008)(8676002)(31696002)(44832011)(316002)(956004)(7696005)(478600001)(53546011)(107886003)(2616005)(38100700002)(33964004)(31686004)(7416002)(66556008)(66476007)(66946007)(86362001)(83380400001)(2906002)(6486002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE1neTZnOG16VXhJTHNPVURxYkpjaGlZQXhONDh1Nms3OW4yMzIrQzh3OGNu?=
 =?utf-8?B?SXdlRHB3TUxJY0Vuais1YzdVOVpkOCszQkR3RXFmWGU5aGszRUthWFhHUXU3?=
 =?utf-8?B?YlVqTTZ3MEdCVkpYOVFuMEZPYU9lc0JBdmZOZjY0UE1CZm5oZ3QyZ1huREJh?=
 =?utf-8?B?cTFaZTBhR1RmYkRNRzgvOXFwMjVZVG5iZVRBdThpNHBEdTI3c1NJU0s3b3k4?=
 =?utf-8?B?S0thNGxpUWsyNEpLYUdPeUZGR05jcTM3YnJnbXA4UW9qZHpLcWNlcWZOYWVN?=
 =?utf-8?B?NUFFeXh6SjFNRmVQcVhtVkFvdlJualI3OFFsQkZqeUNlWUJEQ0dybkVnNmhJ?=
 =?utf-8?B?bjA3aE9oUm5TQjNobERIR05vcy82QkZZdHorZ091a2ZsNHRFNjN3c2pQL0Yy?=
 =?utf-8?B?S1NDOUsyREZCT0g4Z3BNZTJqZTYxdDh2MDNKOG81OEVFdnhXdW5MMjFjN1A3?=
 =?utf-8?B?WW96cG9WR0d2V2hUazZvaFFnbGJDa3g3eHluQThGYnlIbmZGOWxnc0lzYXBB?=
 =?utf-8?B?ak53TngvMXZPQ1l6VlJ2TFgxdVEzRUF2LzVNaGMvSTF5TUIvN1hwOEl0cEUw?=
 =?utf-8?B?Q2lITGc1Ymc5bmsxTEJzVFFwMzRNcnRiVm1NUy93OGhqYy84LzZhU3RZNzh4?=
 =?utf-8?B?L1RXOHIydFJEc0FiUC9iK0Q2cE52dEREdCs3RTZHSnhEa0x4dkVmdVRhT3Ey?=
 =?utf-8?B?cm15N1pjc0ZINEo5ZU13MFVMQml3UVZNamlDejAzRTU2cTdqSGVHVEtRQnkv?=
 =?utf-8?B?N1Bwbk5xNEtDNS9mZU5nZ1ZKUStLUFI1VDJtVFpTaW1zM2FERFpTS0FoRWpL?=
 =?utf-8?B?YzhpbXcxdDRDQ1ZSdnZ6OEVCS3duNUxvQkUzS0hzdHhTd1o2eXZGOTlHTWk1?=
 =?utf-8?B?Mjk2ZWkvLzl2Sm1DUlpUalBBSnJUU2JhQTQ5Y2JvNG1tZkJTdDlzb2N0NW9w?=
 =?utf-8?B?aFNyK092MGlFR3B2YUJ3eHNNY1E5bFlmNk5HL2ErV2lQOHZXMFRxblhOazVQ?=
 =?utf-8?B?dUh2NUVFSFBmQVZXNEM4M2Fjd0VqVGI4MDNyUzdlWjE1K3doT2xEVEFpNGZy?=
 =?utf-8?B?S3BPa1h4cDhlNFFKY21OK2pRNVBObnNTaUNrTjRZNk15ais3Z1NJRFdiWEdR?=
 =?utf-8?B?WHAwNlljR1p3MURnQTJOai9IdjFCQ0QxMkdIa3IxL1B1MFZtR2ZMN0F2REFN?=
 =?utf-8?B?ZHlGVys4eHRFZHdFK0NSWjRQVnkvLzN1ZzRSeGQvSzhhZDVqdXBRQW5GTk5p?=
 =?utf-8?B?Y1lDYm9ZWXZOeDQ5bWZ0SVorYU5MRm9FTkd4VTg5QVRQaFRlbnZta0lRMlZ5?=
 =?utf-8?B?ZG9jaytzSWVQYWJxNmM2L3Y1K2hNcWR1ZXN4a1BsSHFRT2xsZU4wdjY2VWI0?=
 =?utf-8?B?cVRUSzJzQjJZU1ltZ0NmaHAyYkVCdWxlYXhDcmF2aUpWSURIK1g4UDlhZ1Jv?=
 =?utf-8?B?Rit5Myt4RjJOT2JMaVBqZ2toSFVkNVc2UlB3MDZRSVVWVE43WTBYSzhza2VM?=
 =?utf-8?B?M0g3NVMyN055aW9jTlBtNWNkWUw5NkNUVGZ6b0JIekozakMvK1FHRDM4dk9S?=
 =?utf-8?B?OGNTWmJab3d0dHAyejAwQ3dqcWpsVGI4bVBycERtVFRlb2x2eTBDYVp3K1Ju?=
 =?utf-8?B?MTV2ZnNwQTBtWUlPbGxJdzRuSjRzL3Z6UHlYOXhoZEpuU3FDZ3ZnSHJSYU9Y?=
 =?utf-8?B?Ry9NdEg0aXM0dXE1NnA0enl4R1M3L0lwMXB3ek04eTBpODNrdXhJT1NBM0RY?=
 =?utf-8?Q?yLg4BKPxKjUYEpckDRx3xr2C1g1uixoZqe19YuV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321c230d-6195-48d9-e7b2-08d95bcb1766
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 06:50:08.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZ6JayziDXQ8g2JFu2okcI+1C0sCK0nYMDaVu1edS6+9sbZ8DbwwYv5ppODHgS/6mtCl2cAIkJMezHNF6J/+3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4423
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100043
X-Proofpoint-GUID: qgdYh_98_0yty7n8LxbUwHc0sfyhWI0m
X-Proofpoint-ORIG-GUID: qgdYh_98_0yty7n8LxbUwHc0sfyhWI0m
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, david@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------6710159561E584303D04528C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/21 8:42 AM, Markus Armbruster wrote:
> Jonah Palmer <jonah.palmer@oracle.com> writes:
>
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> This new command shows the status of a VirtIODevice
>> (features, endianness and number of virtqueues)
>>
>> Next patch will improve output by decoding feature bits.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> [...]
>
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> index 804adbe..4bd09c9 100644
>> --- a/qapi/virtio.json
>> +++ b/qapi/virtio.json
>> @@ -70,3 +70,79 @@
>>   ##
>>   
>>   { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
>> +
>> +##
>> +# @VirtioStatusEndianness:
>> +#
>> +# Enumeration of endianness for VirtioDevice
>> +#
>> +# Since: 6.1
> 6.2 now, here, below, and in the remainder of this series.
>
>> +##
>> +{ 'enum': 'VirtioStatusEndianness',
>> +  'data': [ 'unknown', 'little', 'big' ]
>> +}
>> +
>> +##
>> +# @VirtioStatus:
>> +#
>> +# @device-id: VirtIODevice status
> "status"?  Really?

I'll change it to 'VirtIODevice ID' instead

>
>> +#
>> +# @device-endian: VirtIODevice device_endian
>> +#
>> +# @guest-features: VirtIODevice guest_features
>> +#
>> +# @host-features: VirtIODevice host_features
>> +#
>> +# @backend-features: VirtIODevice backend_features
>> +#
>> +# @num-vqs: number of VirtIODevice queues
>> +#
>> +# Since: 6.1
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtioStatus',
>> +  'data': {
>> +    'device-id': 'int',
> VirtIODevice member @device_id is uint64_t.  Should this be 'uint16'?

Ah, yes this should be uint16. I'll update this.

>
>> +    'device-endian': 'VirtioStatusEndianness',
>> +    'guest-features': 'uint64',
>> +    'host-features': 'uint64',
>> +    'backend-features': 'uint64',
>> +    'num-vqs': 'uint16'
> virtio_get_num_queues() returns int.  Sure 'uint16' is the right type?

Yes, you're right, it should be an 'int' instead. I'll also update this.

>
>> +  }
>> +}
>> +
>> +##
>> +# @x-debug-virtio-status:
>> +#
>> +# Return the status of virtio device
> "of a virtio device"

Oops! Forgot the article, thank you.

>
>> +#
>> +# @path: QOBject path of the VirtIODevice
> "QOM path", please.
>
>> +#
>> +# Returns: status of the VirtIODevice
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-debug-virtio-status",
>> +#      "arguments": {
>> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend"
>> +#      }
>> +#   }
>> +# <- { "return": {
>> +#          "backend-features": 0,
>> +#          "guest-features": 5111807911,
>> +#          "num-vqs": 3,
>> +#          "host-features": 6337593319,
>> +#          "device-endian": "little",
>> +#          "device-id": 1
>> +#      }
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-debug-virtio-status',
>> +  'data': { 'path': 'str' },
>> +  'returns': 'VirtioStatus'
>> +}

--------------6710159561E584303D04528C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/7/21 8:42 AM, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87bl69e89m.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command shows the status of a VirtIODevice
(features, endianness and number of virtqueues)

Next patch will improve output by decoding feature bits.

Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/virtio.json b/qapi/virtio.json
index 804adbe..4bd09c9 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -70,3 +70,79 @@
 ##
 
 { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
6.2 now, here, below, and in the remainder of this series.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+##
+{ 'enum': 'VirtioStatusEndianness',
+  'data': [ 'unknown', 'little', 'big' ]
+}
+
+##
+# @VirtioStatus:
+#
+# @device-id: VirtIODevice status
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
&quot;status&quot;?  Really?</pre>
    </blockquote>
    <pre>I'll change it to 'VirtIODevice ID' instead
</pre>
    <blockquote type="cite" cite="mid:87bl69e89m.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# @device-endian: VirtIODevice device_endian
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @num-vqs: number of VirtIODevice queues
+#
+# Since: 6.1
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': {
+    'device-id': 'int',
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
VirtIODevice member @device_id is uint64_t.  Should this be 'uint16'?</pre>
    </blockquote>
    <pre>Ah, yes this should be uint16. I'll update this.
</pre>
    <blockquote type="cite" cite="mid:87bl69e89m.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+    'device-endian': 'VirtioStatusEndianness',
+    'guest-features': 'uint64',
+    'host-features': 'uint64',
+    'backend-features': 'uint64',
+    'num-vqs': 'uint16'
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
virtio_get_num_queues() returns int.  Sure 'uint16' is the right type?</pre>
    </blockquote>
    <pre>Yes, you're right, it should be an 'int' instead. I'll also update this.
</pre>
    <blockquote type="cite" cite="mid:87bl69e89m.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+  }
+}
+
+##
+# @x-debug-virtio-status:
+#
+# Return the status of virtio device
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
&quot;of a virtio device&quot;</pre>
    </blockquote>
    <pre>Oops! Forgot the article, thank you.
</pre>
    <blockquote type="cite" cite="mid:87bl69e89m.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# @path: QOBject path of the VirtIODevice
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
&quot;QOM path&quot;, please.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# Returns: status of the VirtIODevice
+#
+# Since: 6.1
+#
+# Example:
+#
+# -&gt; { &quot;execute&quot;: &quot;x-debug-virtio-status&quot;,
+#      &quot;arguments&quot;: {
+#          &quot;path&quot;: &quot;/machine/peripheral-anon/device[3]/virtio-backend&quot;
+#      }
+#   }
+# &lt;- { &quot;return&quot;: {
+#          &quot;backend-features&quot;: 0,
+#          &quot;guest-features&quot;: 5111807911,
+#          &quot;num-vqs&quot;: 3,
+#          &quot;host-features&quot;: 6337593319,
+#          &quot;device-endian&quot;: &quot;little&quot;,
+#          &quot;device-id&quot;: 1
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus'
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6710159561E584303D04528C--

