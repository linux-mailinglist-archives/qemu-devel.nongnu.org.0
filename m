Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE4671342
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 06:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI19M-0006uT-SZ; Wed, 18 Jan 2023 00:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pI19K-0006u6-Fo
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 00:38:14 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pI19H-0007m6-Bb
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 00:38:14 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I0J15B012553; Tue, 17 Jan 2023 21:38:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=u6CD1YMiz7w+oqaesCB53fHpHIOxr3wwZck37xWC3y0=;
 b=pvGuODMS9CK9fksKrmmvw+yu99173NjznTRpvmrENbPxR+0eTCaPEQBO+VF0USnUXjPB
 BW2QC3urAgj9z8S0/VOkN+9aOAWmMncbx1AeFYGp5kS7lQEsyMrkTGSyVx+oWxbepJWD
 UwG8LJuFJcm7zCkjEJEL+pl0+XXJsIFTBr0TLMAP3T8OOsm01aEPEikr8xrqLSBlE7M6
 RovodwHgcl8ETyWUs/++xfsoRQwWnkHsUTyIfD27ZyTPRDBrrYFDnojPRNg1cx1u+LNp
 F2hNwUcuHCkI8g3/UAsooGpyOXxLGgBZyJkaJRgW5pfVlukc3jk7nIqGK4NHXOpz0T1s CA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3n3vu597cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 21:38:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpn2pc7csONJSfLhJ04tt8ZX2jHmvdEdx+ABo/Q+LB1oSIn7MuAuwLqeN2bDHlbs+0eL6VFeB7WZhTRepC+pAysm5Xf7pvbgGaSKN5eTJ2F5W96ecNXaQl63ZMoKSoOeMiTat9gu0/rC/Bax/avyPtwtvUSCzLzT2JZOkJxIcXHlg6FsZoik3iB12lvaJuB1wJ0fNOY42WFBv+PZ1aGwjxP5x2i0if/+IJfFR7LLZ3Ftm/B+f0HvPbGPRmmTNZiE5pjLgTvXuNunMrDc+AifKCTgM6aiUjb+20Th0TS8pMm+vlGD1awR/xbvqmWzddGrBTd3U9VpjY+sGlrb969Nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6CD1YMiz7w+oqaesCB53fHpHIOxr3wwZck37xWC3y0=;
 b=HuHe8VnxcS3iasuFszBHF2fg7C7xLCtZFO7nFhnNWKxVzJD7ATS1wQgGg2Il8kzW+B14RCppTNrvaLHd/XN4cg659mfa5qQYpC2Zg2mUPOeH5hyj6AYtBVF6Z5pk9L09qQdAVuB9M6SqFcn4cZG52a/SCQGlYKabR3bZcjyBDn2/GfyXl2d545HB6AvxGjR8P6ZaMkSJqk2H/QNFXqvURnAQnsNFonUayYZZklsAIBZLyMgwAmY91QUfe+W9wbN7o+Uc90vzBpWYEjkIyKbP3dTfVV7RLcMp1Sbl9JnKMYOeQR4TnnQqwd9TT3y1s4m+jUq5UU1OKQXkPCBB+8rcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6CD1YMiz7w+oqaesCB53fHpHIOxr3wwZck37xWC3y0=;
 b=DmXIvNM20BQqbabAQAKUzBTCVyb7R86FDyYKB+oA6r5imPUgfNF7gHgSSH2oMfktjWv1LctAGTf3zkJFbPUKRppbgkUgX8yiYWYNIVRJsAHkcIW1YEQ/7aOi87VaTEMcjwAjF89ZGm6KH/s3qPms15vaHgS93C38TrW9X1YZWEEH67qFOdhzdYndstvYlg1VGkYL63b9Y0YtD0YEueFQwBk888ndCYW7GNjgwSSpLH0gSOp1lk8YyJZI2h8AqQ4edGBzW9Kz4xsv6EJ4Vf6ojtJMz8n9LMgmd0lQlg8Fgmxpr/0vj16AUl5XSl47j+PBt9P7yhNb/+qgvkHOm6oMwg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH7PR02MB9049.namprd02.prod.outlook.com (2603:10b6:510:1f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 05:38:03 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 05:38:03 +0000
Message-ID: <8f4cbaf5-2be9-68e7-1eaa-2284d4db9839@nutanix.com>
Date: Wed, 18 Jan 2023 11:07:49 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com> <Y8Z8wNPLzk5J0EFj@work-vm>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y8Z8wNPLzk5J0EFj@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::22) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH7PR02MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e9f041-1f92-4b45-9013-08daf9162ad2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nXEq5w4nwK4dDOlSfNPsKTGG5JZxe4VA7ZE1IiaaSYcV1OFkeB5An9uRXUr/lQxIikaW1sBtrhxnBUNh+CNjnQai8KxNprkpbRdbsanUyJ+8BY18/xq2/OX6hd/f2Jid2uk+b55LlBp+JW/0AjqthIPjx5PzWRd+WFMfD/pL5bQmB/qv4v3q5BFPBCOdKbzOzBb4hpnerA0ectFdsAeT0+hisyP2Gj99yE0LklsGjfgEpxoLIacCQMyXP4BbahcRiNU1o8DesBQA4t0yeAlSEYTtGQ+JRBtJ7HZSzCIDGrN9rRAh2IupIE24n+w2KqXmwvS7vneVT6X2ccyLafF22P+n8bwp9TUwMSL1jqQ2upltTGZ1Ooys6Lrw7Rj8cLpwzQiGWriaBHMLJD596LqVsObI6BKu0pra9qz0GApQ8Vxoaaate+zUTT9gcfSrRnfC6mvbU42siubX5R0OMty2Hk2uzmAk1dcbI+RI2LzEo01FSVNZrRhlR8yeFmcxXzSDBP3Lmx+s3bl0ztGBWaWaUmyji+GOm1w6CNEtviEU9ACyCaAZU2/cmJYFW8Us41zKYrfgXE74WOeTYngj+6kOwcGggdD1DjTUYTUCeJ4C3ZIonNEOHDntVFIzJJOHHdtR0bKdj98eSxKsIbl5/1BPGsZ9S2pd9GUGDRI/7/X88uOt9xG+YehBbOEoyJppxMF7hmVrG3o9+QLq7ishjKeydbxKe0ill4ZYXJv9vxHAlEM6grQuuXfwKNn3WIbOuLk4Bdt0VZ6dpIk0pDG+W1oSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199015)(83380400001)(38100700002)(38350700002)(4326008)(8936002)(31696002)(5660300002)(66556008)(44832011)(6916009)(2906002)(8676002)(66946007)(66476007)(41300700001)(6506007)(186003)(6486002)(26005)(53546011)(2616005)(6512007)(107886003)(52116002)(6666004)(54906003)(86362001)(478600001)(316002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09ubDR1ekJQUkxyT1ZyTzhlZ251K05qOEU5VnVucnh4dmQyaytTRVdUdExG?=
 =?utf-8?B?cUw0RTNjbFdxQitsSFZuMlFiN1dJYjZKaHBqTG9EWFpKQ2crU1VkOHN1U2p4?=
 =?utf-8?B?YitRM1RxVlZzSFBQZDVnMHB0TmNWM0twei9XRHdjMk5LRFJKRURpeG9TZjNQ?=
 =?utf-8?B?Z2pKaUJXTG9YQ1RlNlB2QXI2L1hjT1lRam9GbGxwRHA4QVdBS0RpUmZTbitI?=
 =?utf-8?B?a2hKV28rSXMzcitQK3NZTGdPWkpNSHBFQ1hxYThCYVA1eVJ6RDRYaVBLRXFK?=
 =?utf-8?B?Vy9OaXFncnNFZUNLSjVndW9CcU1TWDVsRFpFOGZBSXlFSHNOTFJXRzdWVXhN?=
 =?utf-8?B?akdNNzB3alZwT3dWY0wyTGc0TEpycjAvUk5SYk1OMCtaeGNvR1JINGJRZStY?=
 =?utf-8?B?cWNiaE1uam00THRXemxCK0JiSStyTFI1bGIxcy9Bc0JWeVNUV0Z6ZDhIMTcr?=
 =?utf-8?B?c1l3VnFHVnF1dDNRMWFJSmZaajltNWpwRkM5NFlxZTloaWdHaFFjeUlZdWtT?=
 =?utf-8?B?UitaT1IwMFEvQmR5Y2NhYTJTSFAxSWxYZUVXd1IxNTYzRXg3U21XTW9VUVYx?=
 =?utf-8?B?OWRzWnd1ckVJa013VGpIdUF1UHRWWFpVWWdWU1BWTE1TSFlhaHBKbjhjdkMx?=
 =?utf-8?B?NWhXQzVneHgzdzdheERQZ1hlclJPSFp4d0FsTG9BRk94ZFFYckNHUFpBNzV3?=
 =?utf-8?B?NWhuUzJyVTkyZ29tNXdPNHRjNGNEbFFyQkxwY1AxK2FRYU9LcWdSakdhWnBz?=
 =?utf-8?B?UzlOUzhteUtabUZkWGJiSFd0cm9reXUxQWpEamNvQnNLUmQ0QTV0RGRHZGd6?=
 =?utf-8?B?bExuTFFPSUREUFRXcElsVHRwNnpnMWNzbFdzZWVYM1kyeTg2M2JIWkNFajlm?=
 =?utf-8?B?S1laVTQ4ZGZQRlhNZ0JjK3lIYmFSdU51ZE1uQlpuMnVlWHF2N2wzbWltSlpl?=
 =?utf-8?B?QjNRUHROR2hJQUNPTVlqWlY2bzBWa0w1SWI1QmRjdFROQjdpREdjdzhxaHo1?=
 =?utf-8?B?SmNZTHhFbWtvWW5QVEg0WlVtQlZLY2gvcXZXWkFJT0RydlI0TlVnVllSYm1R?=
 =?utf-8?B?NzFtNC9UNy8wN2Z5WXg2NFJ3R01mS0FydmpxUFExWVBpVy9sbjJqcHFjUXpC?=
 =?utf-8?B?aHFHY2x1UmFyUm1jaWlzSG1PenpUUGppUjB5Q3hGb3drekFmcmFuZjd6R2tQ?=
 =?utf-8?B?aWxrcEpwcXpzd2o2UDlDdkpEenlFWmtLM0ZXOFVObEtxd2c5T3Y4MWRWYS9k?=
 =?utf-8?B?YUNmZXB5dmJoMlhFb1UvWEgyRFhqcUxmb1pMNXM5R0VTMVd3NmlJb1YxaDVp?=
 =?utf-8?B?UU5Pc05uRXQ0eUg0OGMvb29GRUd0K0FaZ1RnS2Fac1Y2amp5U3QvSGFGc1Fz?=
 =?utf-8?B?dUd6b2dnODI0SEpKbnVhaDFUeDlHZFE5VHluQVprMUZQZkZVUU84RmpkUkU1?=
 =?utf-8?B?NUhyRWRHUTlBMm43Y283MHEvZXJVNXhKdXFuV1BzVmhyS3N3OURqNFNZa2JG?=
 =?utf-8?B?RTNiZGJzZjBYU1IzRzl1d0ZhWUg0YUNBL2ltcUtmYmQvbTBWM3FHL0FoRnBk?=
 =?utf-8?B?a2NRQVNMbjE4NEl1VEJSdzJVYUpqSUpZLzArNXFnOFI1SjRkVkhpQWRSNDhF?=
 =?utf-8?B?QzNTZ2JpNUgvYkFTdENLT296OUMrLzlDcVVtK0R4VXpxSmk4d0p0MGlLekRx?=
 =?utf-8?B?VStHbU5FUVpnRnBIV2hmQVd4VE05SDFEcmpSVVJ6L1VPQlJWclRNZkYxMFJY?=
 =?utf-8?B?Zm1hR3dwMDNvSnBMbUtidVh1Nk96WkVSUTBBWWE2bGw3Rnd1TXRjaUZVanZ0?=
 =?utf-8?B?dklUMHFTdjgxaHdOa1JxOWxrTnpoUVpmelhwTTBPZDVMYmZEZVZxOUZQeTZ6?=
 =?utf-8?B?dHl0aWpraVBNV0F2K3FETmNlMDhLU1NXdHRlRXNMQktEbXdJSHljdndKa2Jt?=
 =?utf-8?B?U2hGSTlvY3licFFFT2wza1BScWYwRXhza0VVNXc4NWpsU0JuYkRRMGtIL2RR?=
 =?utf-8?B?ZDJUemhPOFZtSE1rQkhIWWowczlhVEs2SHlIb3F5OW5nb3BpOW9wVTR2OXdO?=
 =?utf-8?B?dTZhbE9xZk9HZDcxdkVicDJoemNNVWRNNnY3azNvTUttWEJVSlljbVhlWnJZ?=
 =?utf-8?Q?9a41RsAQ0maytkvCLGdmW2JjR?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e9f041-1f92-4b45-9013-08daf9162ad2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 05:38:03.1260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sMp9mmOpG/mAvwj2zQ0rPKDkO5q0+nLJxarXTLCQgG+L1alMwuCUXlGc7EbTlmCDbAX8Mk3i3QH0F2l9anWXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9049
X-Proofpoint-ORIG-GUID: voVw0MwobM0RqWP3i1MYWiQAMNJrU9wJ
X-Proofpoint-GUID: voVw0MwobM0RqWP3i1MYWiQAMNJrU9wJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, SPF_HELO_NONE=0.001,
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


On 17/01/23 4:17 pm, Dr. David Alan Gilbert wrote:
> * Het Gala (het.gala@nutanix.com) wrote:
>> From: Author Het Gala <het.gala@nutanix.com>
>>
>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>> of destination interface and corresponding port number in the form
>> of a unified string 'uri' parameter. This scheme does seem to have an issue
>> in it, i.e. double-level encoding of URIs.
>>
>> The current patch maps existing QAPI design into a well-defined data
>> structure - 'MigrateChannel' only from the design perspective. Please note that
>> the existing 'uri' parameter is kept untouched for backward compatibility.
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   qapi/migration.json | 121 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 119 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 88ecf86ac8..753e187ce2 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1449,12 +1449,108 @@
>>   ##
>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>   
>> +##
>> +# @MigrateTransport:
>> +#
>> +# The supported communication transport mechanisms for migration
>> +#
>> +# @socket: Supported communication type between two devices for migration.
>> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
>> +#          'fd' already
>> +#
>> +# @exec: Supported communication type to redirect migration stream into file.
>> +#
>> +# @rdma: Supported communication type to redirect rdma type migration stream.
>> +#
>> +# Since 8.0
>> +##
>> +{ 'enum': 'MigrateTransport',
>> +  'data': ['socket', 'exec', 'rdma'] }
>> +
>> +##
>> +# @MigrateSocketAddr:
>> +#
>> +# To support different type of socket.
>> +#
>> +# @socket-type: Different type of socket connections.
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateSocketAddr',
>> +  'data': {'socket-type': 'SocketAddress' } }
>> +
>> +##
>> +# @MigrateExecAddr:
>> + #
>> + # Since 8.0
>> + ##
>> +{ 'struct': 'MigrateExecAddr',
>> +   'data' : {'exec-str': 'str' } }
>> +
>> +##
>> +# @MigrateRdmaAddr:
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateRdmaAddr',
>> +   'data' : {'rdma-str': 'str' } }
>> +
>> +##
>> +# @MigrateAddress:
>> +#
>> +# The options available for communication transport mechanisms for migration
>> +#
>> +# Since 8.0
>> +##
>> +{ 'union' : 'MigrateAddress',
>> +  'base' : { 'transport' : 'MigrateTransport'},
>> +  'discriminator' : 'transport',
>> +  'data' : {
>> +    'socket' : 'MigrateSocketAddr',
>> +    'exec' : 'MigrateExecAddr',
>> +    'rdma': 'MigrateRdmaAddr' } }
>> +
>> +##
>> +# @MigrateChannelType:
>> +#
>> +# The supported options for migration channel type requests
>> +#
>> +# @main: Support request for main outbound migration control channel
>> +#
>> +# Since 8.0
>> +##
>> +{ 'enum': 'MigrateChannelType',
>> +  'data': [ 'main'] }
>> +
>> +##
>> +# @MigrateChannel:
>> +#
>> +# Information regarding migration Channel-type for transferring packets,
>> +# source and corresponding destination interface for socket connection
>> +# and number of multifd channels over the interface.
>> +#
>> +# @channeltype: Name of Channel type for transfering packet information
>> +#
>> +# @addr: SocketAddress of destination interface
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateChannel',
>> +  'data' : {
>> +	'channeltype' : 'MigrateChannelType',
>> +	'addr' : 'MigrateAddress' } }
>> +
> The presence of the channeltype field suggests you're going to try to
> support multiple addresses; that's OK, but can you show an example of
> how that might look in the migrate command below?
>
> Dave

Yes Dave. Other options will be "data" (for multifd) and "post-copy" 
(for post-copy migration).

I am not very sure how will we represent "post-copy" part, but I will 
give you an example of how "main" and "data" Channels will be 
represented by an example below:

-> { "execute": "migrate",
        "arguments": {
             "channels": [ { 'channeltype': 'main',
                                   'addr': {'transport': 'socket',
                                              'socket-type': { 'type': 
'inet',
'host': '10.12.34.9', 'port': '1050'} }
                                 { 'channeltype': 'data',
                                   'addr': {'transport': 'socket',
                                              'socket-type': { 'type': 
'inet',
'host': '10.12.34.92', 'port': '1234'},
                                   'multifd-count': 5 },
                                 { 'channeltype': 'data',
                                   'addr': { 'transport': 'socket',
                                               'socket-type': {'type': 
'inet',
'host': '0.0.0.4', 'port': '3000'},
                                   'multifd-count': 3 } ] } }
So, 'data' channels will be used for multi-fd conection while 'main' 
will be used for just normal migration connection.
This 'data' channel option has been planned with a whole different 
patchset series in future.
Let me know if you have any more doubts regarding this :)
>>   #
>>   # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>   # <- { "return": {} }
>>   #
>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channel": { "channeltype": "main",
>> +#                        "addr": { "transport": "socket",
>> +#                                  "socket-type": { "type': "inet',
>> +#                                                   "host": "10.12.34.9",
>> +#                                                   "port": "1050" } } } } }
>> +# <- { "return": {} }
>> +#
>> +# -> { "execute": "migrate",
>> +#      "arguments": { "channel": { "channeltype": "main",
>> +#                                  "addr": { "transport": "exec",
>> +#                                            "exec-str": "/tmp/exec" } } } }
>> +# <- { "return": {} }
>> +#
>>   ##
>>   { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>   
>>   ##
>>   # @migrate-incoming:
Regards,
Het Gala

