Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF664629233
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 08:09:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouq3S-0000Vc-Qb; Tue, 15 Nov 2022 02:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ouq3G-0000Uj-AY
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 02:08:11 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ouq3E-0005j0-4a
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 02:08:09 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AENKrOu021925; Mon, 14 Nov 2022 23:08:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=7ctHQW5UIbtwhL2ticRuvhGCjk2kQqqdUjroR6XHZrQ=;
 b=sSaahFRgJBGwnGeFGl0t/Po20IeNAwi3hN0r/6VDUfNlG8b4PTU+aFDGh8Se2DRbtEDJ
 wI1mM1YSi6IIJGN1+imwm1V0ponP9E2cdR76YEsaqgimh4ws25czWnigzf5In3NU972y
 F1Y4xaLfbYZIlSxKC+OUZbDukdKWM9lk1j3xIr5D5RTrGIsHMcnSPrCQLQdO5gxCIPTi
 EqmMrw41bnrmq4O5pt4Z78xxZhYmepSDEuAsrc9bg04yGDm7rqg4Ss+0yR2SQtq52f8I
 DCeq8rp1sx8plzgcO6A8PzJAtYz56eINzITVnwIHTQtrWt0+tfdNDQmZR3R4aJm4bQo/ JQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kuy8v0r5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 23:08:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUZq4SjU9AV7/DlvRWP3Qu20biOs9Rsxa9L2UFmgRVnmIYJs2FOfcRbsfgwB5a6cSGOMrZJqZzIJEXhRQfYB6EA+OUt8SRIl4GSDE7N8PATSRaPgQjGRS/Dqb+byx5Sy27m9PQHviHMWrgTC4sbu3TnH8ysao9xuKV1+Wjjffg5vFQ/ersrJDYc62OnL9BSBG4+7HnssxUyztgL/FSLTI/2grxSrXQafdEgKR0BdlhSOxPJ+7dx+usbg/oIe4dPV9sSDByOez+DeotQ5jnnTCRPNw6qiOtlygcXlKA5ByyZwIoWGG0gqFOjEcGYGfMxYgwr1Igku/tL0r7RgUvELRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ctHQW5UIbtwhL2ticRuvhGCjk2kQqqdUjroR6XHZrQ=;
 b=nonfXN7NKI8tDmBCir3jvix1uGfzmAVN/VqKCqCcyD8GwiXQaemvm3BiLp2ZWm+GFV2aszc1euTQxM0lCzLSN6oj69Me5XhzOZUrc/FsS/4FLTwkYKe7rubDWoZdPIJYTOtz7kJX5r4V6n3oJWcu2gfm6BeMNm05+MOKRSO9WAcZkfTc6IT1K5mGyWnzlUrFmVHcgU8+6vWJnZfZ1E6CaQkELWfpScV6BYmQU57tjItYf97j5JpyrZFvKnlBtxEEV5FFGP4BEq7rcTB6o27LJXG1NQX7y/+vmlyHw4spsmh/LewMuHl48Sbci5U1bNbHOZd+RYYfRbozBjwpycFUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ctHQW5UIbtwhL2ticRuvhGCjk2kQqqdUjroR6XHZrQ=;
 b=vzuzSq6Qie1uPkLi5NbuhFQH0WWInNRSGZOMtP0UubeZqkOS/vBqoTFVGwdtiXbBoy+fRCWfGZ4QibeX6QHrwsThphtLZdDdVwU2avJ4Z2nEGWDesXaArIIinH1aIQh5OhHSaV1Mj3G0TawpfnuEsmAaCqO7Z1+zEdWq5wXHY3oj2i/pFUTg+IpuqSRmVwqyD04iWA1cPIcUH1lD9xBZno+aS+jHn/7VM9mbfB9EHrC1rmznS2JxffE6RDR7oyWxHXtSqjTLK5raUWPKGiQng05kqSamtAFMkiG9RPB7BAtUyX6NIrPQWpxhN7ApXZiS4ynwVUFcgvwkYkHFIJJnMw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by BY5PR02MB6520.namprd02.prod.outlook.com (2603:10b6:a03:1d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 07:08:02 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 07:08:01 +0000
Message-ID: <75a5aa44-5b76-36f4-8cbc-7d0ad6c36716@nutanix.com>
Date: Tue, 15 Nov 2022 12:37:52 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Prerna Saxena <prerna.saxena@nutanix.com>,
 Juan Quintela <quintela@redhat.com>
References: <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
 <e5f69a86-f625-3cdb-4a25-065a0612548e@nutanix.com>
 <Y2OKCel2FlMQw+bI@redhat.com>
 <cf399da1-8558-06f9-2865-98abe45ddcda@nutanix.com>
 <Y2P6FMs42GLzkKl/@redhat.com>
 <0ad51209-817e-4f7b-3f93-e0ee231aade4@nutanix.com>
 <Y2QA93CGE6tyD4vT@redhat.com>
 <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com> <Y3JyHlemh9Jn9Lqq@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3JyHlemh9Jn9Lqq@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::18) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|BY5PR02MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 756c82f5-949a-4b84-58a7-08dac6d82208
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dlEyGpx3SlzGrvE0OkBbqlNkLZSLUzcUgrwE89ji8q3stDhYYY+k94/F8BIBx9wBpvHTxJ9/klMk+lbtJ9gIxAfCkSU0o/LSrUDzkXYIpEFDn9upjWE+OFxrPfWn4iIjaFuairoblHBZwoXAebH0OfYplZch0xb38Eaueg5PB7XgaVb7WoEfErOy6oTURozqGhvPg3mxGIREqsGKCQ+7h1BPXaYET2mzOdKhEdEw24NCAIog6hOhccRxSEr+hnUDjlKrL3JQp3hZ2j2OdG0e7TZ0aSfFq8+ly1+WHIIzcjsN0ix5sRPLKMf9mpbOiACpmBo0O2+MX3EFpZGQ8GHLQS6Hz5DCQiQcEhUkih76KYcBgFliZmhGt7YZMMBcFXEisBX4UiYlKtVGn5OsWckgY/dNdbBXy4vkuCB2292U3XaeZ1MeLPzGKMUDKBicV75HvJjyXwKnUuq5OXdcatWoTOnWKg4evowm3xpjaHAixPiHI0szGzxRqiUn7zaL0tV6KPGpsT+q+LFOYyuyioQnIC8bENrjww1ATo2sBAUgUC6UA/gpLLEYVsL6qDA5Q046hcOULPzbSNXbcJBDjH9c+Ed/sXerF462sg2WXHel0t4pY6ffTyxvlwHlwnxpqMPtStM7p8D0KXJr9iQiJINxs307fmvjJrc5bc6fDk4Acf3wrUuFpcxJ3+j+P8ogF3t8Bqw0VS3wr1DcrjQZms/kHFlqZg662O7uKcz0hm0vi1Ulu/bWPtaUcaB9l31P2gWXobROwfy2BtjH3RtfFgi687ywe+rSnNR6o3SdgS/21lE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39850400004)(346002)(396003)(366004)(451199015)(83380400001)(478600001)(26005)(6512007)(186003)(53546011)(2616005)(6666004)(6506007)(86362001)(31696002)(38100700002)(36756003)(8936002)(31686004)(41300700001)(2906002)(5660300002)(6916009)(54906003)(6486002)(4326008)(8676002)(316002)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXVOUVUvbXdWa2N0TzJzMFlPNzdSL1Q0YjZNa0dDQnVZMU92U1VSYjFSN1RD?=
 =?utf-8?B?RTlvL0hlZjBOWE9JTGl5S0NxZDJIeFZmUGVOVGpDS1ZQdnY0WVcrSUFWdWQr?=
 =?utf-8?B?S0tZTHBqS3Uzdm5WSGRpM09rUG1aTkV5dkhvbnBERy8rYk4xaktLVElJbWFC?=
 =?utf-8?B?blRQS3dycmZla2paN0xmK1VyZjJ0K21qZ0o0SDA4TTcxSG5GUGhPbWhBbGlr?=
 =?utf-8?B?WE0rcGZDU29INE1sL3FxdzRSR2EveG1OSjIwdDhhVUJyWGZNczFmcFBqUlJM?=
 =?utf-8?B?MzkzM25FWGlFclNNOTRaMkZna2JGSkdZYy9wcEp5QyttTGM5VXlvalFSYUE2?=
 =?utf-8?B?SWJmZDJPU0EydUovNE44ZE93L05USlNSTmZ5UkFEdWg0S2pSR3h5bmZrNjNE?=
 =?utf-8?B?TWZjZnM0WE5LeXZVVzlRdHpBRy8rYnJvcFN3YjVUcjdaUml2YnRlLzh6VjlK?=
 =?utf-8?B?UGhHd21uUHJnZ3FlcVlZalVXY1N3dDdmOE01bkZDaUNsRUFlMjlpTE1WenlK?=
 =?utf-8?B?NksyOGEweTNkZzV4Si9hdzhFU3ZOR21lVW0vTHlZdkk4Ti9SL0hpaXl6Z0R1?=
 =?utf-8?B?U3dneXpCZmdPQlh4OERiL1JGVCt6UDVrcXNMOHRzVG1FRDJxS1ZUU21Wazd6?=
 =?utf-8?B?TFdJUXA4VlNYSG1rQTNaSlJnT3luL0lFUXZkVjFMQ1c1cjJZVmF6OXZ6UVVn?=
 =?utf-8?B?TXV0T1UyZFB1a0Vaam1XazcxUWtLK3doR0dRUlc4RUZuZFlxMGl1OVdKeXl0?=
 =?utf-8?B?MVlXWFN3U29jd2gyNVlOT3AvTFlRSE45WHlXeGhpQ0VWUGxkU0RYRFJjWTdu?=
 =?utf-8?B?dTBMWlI4WUg4Z3lpaEc1by9yZHlqRmgxSXhmMFd1RTBWSXhUT0Z2d0hKNG94?=
 =?utf-8?B?ZEkxSVZnVkpTMmlLZERjdFpGM213QVhVcmMxckFadytRVk5CczBlUGlwZHdF?=
 =?utf-8?B?NnJxeXREVFhRemNrMG42aWE0MHMrQkllbjJQa1RKU2M0TXBvdG5VbUJLUTZy?=
 =?utf-8?B?NW5TdUdlcjNocVUzajJFWG5Pdnh4amtLYm9OYkZNMFcycmFMTm5yZlFON25i?=
 =?utf-8?B?ajBib25LbURORFVQeHFHQVhFcVljekt6RXRkVzZ5Z3RpbHZxMkx6aGkxZGZ5?=
 =?utf-8?B?YktyZ01mVWxZREFOaGt5Yk1HYWpESDFvYVBrbVQ1TU45d1orK3hrbXU4T2ww?=
 =?utf-8?B?Y2Z4NmtZeGNrUkUxOEtBb0RBRFNVaXdmUDIwSFZsZ2pwcmNwOVhuMkVvcm9L?=
 =?utf-8?B?aEhtVmlJM2N4UVZuV0pxRWU4ZTg2N2h3cmU5Q04zRElHNm5FWXB2K3VqMXRS?=
 =?utf-8?B?OUpNcFRlUkxPdzVQNzF1SWJPMkNTNTNVYi9JbStxcHhLWHBhUW04UTV3cHZR?=
 =?utf-8?B?bzlqODBxN2tTREFDMlNwWkt1dldPazNrLzYrWEkzTVdhNGhrSjhpK1YyNGc0?=
 =?utf-8?B?U3pHRXVFcE56VXVGdFBFRVJRejdaVDg0OFZXSkdXOTlBb2xDd01YZ2oxclRt?=
 =?utf-8?B?Wk94Y1d3M1ZvUHZiN1hJdDhyNDhRdGhNUmU4cXh5UTJMTkRuRGRxRWhUb2Nh?=
 =?utf-8?B?b2NDd2NBUHZWMWkzYXZWeHJWc1U2VFkzeVZ0UENxZmZwd2lYcDgxVDBJckIy?=
 =?utf-8?B?L2JzL3pCUkxxUG5GQ2hvZDZIMUhCdzV4cnlwMGMyaUdLSGJtaHpCQ3A4cmpU?=
 =?utf-8?B?MUc3ODlObjZOajhzYkIxVUpJelZYS3QvOXlqOXk2NGl0UlJNanhpNEt5Z0Vq?=
 =?utf-8?B?TG9HNFJocmhaaEZ2U1FOREZiK003eStBekNDWFRkbDVaMmlhSEM1QXhDRjNy?=
 =?utf-8?B?c3dPMUN0MVBybHNYZnBFRE84QkxLVHRWQ2ZUYWFQeVpBc1VxQS9KaHg4Nnh5?=
 =?utf-8?B?Z0hlT0lwMUZSakNxZDg4cUp6SldXL0RDMUVFS0N2WkViTDB2ZXRrMlgwSndX?=
 =?utf-8?B?aHV1aXYvSDF6em9sQXRtZjVoN2ZVSVpZT0svbytqRlM3S3ZwUHlncFlBSTRV?=
 =?utf-8?B?aGhBODFEbWtuU21MRXJkaGxJWFlLMW84dzYza3dEZVc3QXNUbUgyeDdocmh2?=
 =?utf-8?B?Qml0Z1hRRVhvTFd6NWpQeTU1a0w4VFIwRzQzVkwwdmFtK3dDRDBlSEt5S3FP?=
 =?utf-8?B?UHN0d1FGTzVBVXNVRkdlaW5NRWxKdTF0SmgySVJyU1hXem1VRjRiZmVqVkVK?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756c82f5-949a-4b84-58a7-08dac6d82208
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 07:08:01.8158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO7IIAJghPhYAL9mYUoFbvuQk6STN07VG+0rZzgUo+loqvKK3Fm0dMs0H0/P0wSncYesrdkFcBn8CF76obgFboni+4sUdX+WNcCU2gpx6rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6520
X-Proofpoint-GUID: kQL84LIFTb-uFx7_CIS5NoN_g85yplAZ
X-Proofpoint-ORIG-GUID: kQL84LIFTb-uFx7_CIS5NoN_g85yplAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_02,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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

Thanks Peter

On 14/11/22 10:21 pm, Peter Xu wrote:
> Manish,
>
> On Thu, Nov 03, 2022 at 11:47:51PM +0530, manish.mishra wrote:
>> Yes, but if we try to read early on main channel with tls enabled case it is an issue. Sorry i may not have put above comment cleary. I will try to put scenario step wise.
>> 1. main channel is created and tls handshake is done for main channel.
>> 2. Destionation side tries to read magic early on main channel in migration_ioc_process_incoming but it is not yet sent by source.
>> 3. Source has written magic to main channel file buffer but it is not yet flushed, it is flushed first time in ram_save_setup, i mean data is sent on channel only if qemu file buffer is full or explicitly flushed.
>> 4. Source side blocks on multifd_send_sync_main in ram_save_setup before flushing qemu file. But multifd_send_sync_main is blocked for sem_sync until handshake is done for multiFD channels.
>> 5. Destination side is still waiting for reading magic on main channel, so unless we return from migration_ioc_process_incoming we can not accept new channel, so handshake of multiFD channel is blocked.
>> 6. So basically source is blocked on multiFD channels handshake before sending data on main channel, but destination is blocked waiting for data before it can acknowledge multiFD channels and do handshake, so it kind of creates a deadlock situation.
> Why is this issue only happening with TLS?  It sounds like it'll happen as
> long as multifd enabled.


Actually this was happening with tls because with tls we do handshake, so a connection is assumed establised only after a tls handshake and we flush data from source only after all channels are established,  but with normal live migration even if connection is not accepted on destination side we can continue as we do not do any handshake. Basically in normal live migration a connection is assumed established if connect() call was successful even if it is not accepted/ack by destination, so that's why this deadlock was not hapening.

>
> I'm also thinking whether we should flush in qemu_savevm_state_header() so
> at least upgraded src qemu will always flush the headers if it never hurts.

yes sure Peter.
>
Thanks

Manish Mishra



