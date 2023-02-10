Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A856691A37
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 09:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQP04-0000BD-3P; Fri, 10 Feb 2023 03:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pQP01-0000B3-UK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:43:17 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pQOzz-0006jP-OE
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:43:17 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31A7LonG009334; Fri, 10 Feb 2023 00:43:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=GdjV2nJckQLGXLm5pcyWYOhYFsjyV0PsJIS7TbZrRw0=;
 b=fpLZoiNpM6cNCcIdxSnICeccvp3TYPNgqtjIlkOBWhxf5aLCofrxm/baAEs4FwwInJH8
 VXcPpijuoC0+RrAMRqZJmhopb4aP/cq/u5aQ6Ox1eeXfx4WSMzH3ttUBULFOdJ1MMiAj
 /U4JjOhZbJP5gAoxrODDlpMNQTIeCZ7V0Cdgog/6MJgSA99bLBmZOiPEjZz33Nskyv+3
 /xZv4+emxIfuB3dsvwsmus0C8/acKIeqzEvHvqf13mZyKLXTqpxO4kTsq493LSw/Hvq9
 GDNgySsjqGmx7VpeK4ciAVHvH1IWUUuJpFfuTpbcrXiG7WsTjW4y96235uG43vnVj2cB EA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1jmtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:43:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxuTXT8gY28OIzbn1Jwd/I1IkGXjQlG9u/37damiMCffDQJYGLEOW97JtcHry2XN9w3jxxgBSURQLjtrw2RhIyBcoHddE588E/0nhgE1l90IQawANsiMDvM+MJ+/izUZF0lfDsESwfwNeeclg9K32P3UDWxQNBlN9dq6n7kIFjJhaP+NJvlhotzLKXRdYEG5j7OcbQ38dHekJh3XLueuUxl6uB61ryHVEAijdLJr05sSDPKqk2HsGYxw2BWGYWk4KtUtln6DoZt8f5Bbb1JprVfJhCMmAlSYu146KCQbSHYoDDnGMe8tVzS2a3RVg62UcYrKNU0aGD5Vj6mmEY5qTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdjV2nJckQLGXLm5pcyWYOhYFsjyV0PsJIS7TbZrRw0=;
 b=IcA1KxhHufbjWEmcXg1XcEgw89RvyyM7CoQGmRdclWKii0ZFpfpiLazP1kVO4RRjbJygLRYn1bHQ8K/nYMgKoM1pjhpuPSZefth9wTD0bLKVs4nbpnzd+ANG3/FI0XPj30S1/GgPrGX2CfuQoC8MwFsTtLHfNpYG7B6pZr501V1WW2FE2uwh1xzzpo1E27CR5WVgpGaIZYKr0vP/ZU8EXg4sA9Du1nXnYgRZFr2CKwgBzTaD4mOsNj5GMoUyx5bsBAiEbtE7I+r9X2quMTpT/jYdMJgtL68IURJiUojlho37WCv+y3eiYEI3MTQuTkyIdxcVfNcsh7EIpuTXFWz+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdjV2nJckQLGXLm5pcyWYOhYFsjyV0PsJIS7TbZrRw0=;
 b=B5stqvg+O0W/VOq3m3U9qzMmD4SMsNkox3bphc86KJX72KGqbrm6dq16suOA2xIhFc9aUw5ssFwioWliGzvSsVjASGPL2/Kuoa8rGP1MDk/9mjIfdmWte6V5UV7o3fG0YK0LgTOOQ9F9fr2vh6mKhwdUkgKbmDuaKalvka07xaBvt2WOvSClG4p33tz79Z9m+pHepN/v9aLUdHMqr/v9LExGBTsTY6vhTJOqh/yEv8HmH8duz+SqsUZk9P3clDJTE8eyVzfDR0OGEJrWG1995Kw095P/t9+4jwyM9kAfEq5cupYIMeYdxhQyUQeRIVl3BWiVYSY3SX4hyYYs2JJ8Ag==
Received: from SA0PR02MB7386.namprd02.prod.outlook.com (2603:10b6:806:d9::19)
 by BL3PR02MB8987.namprd02.prod.outlook.com (2603:10b6:208:3b7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 08:43:05 +0000
Received: from SA0PR02MB7386.namprd02.prod.outlook.com
 ([fe80::5c61:f9d0:648d:a8e8]) by SA0PR02MB7386.namprd02.prod.outlook.com
 ([fe80::5c61:f9d0:648d:a8e8%9]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 08:43:05 +0000
Message-ID: <92f5f388-f635-a455-c48a-b604058cb09f@nutanix.com>
Date: Fri, 10 Feb 2023 14:12:46 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Expose support for HyperV features via QMP
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: John Levon <john.levon@nutanix.com>, Florian Schmidt <flosch@nutanix.com>,
 carl.waldspurger@nutanix.com, Prerna Saxena <prerna.saxena@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 rohit.kumar3@nutanix.com, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Justin Terry <juterry@microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
 <18bea7dd-c776-6328-2c6b-71c88838db72@nutanix.com>
 <87r0uzlyql.fsf@linaro.org> <87bkm27wj7.fsf@ovpn-194-92.brq.redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <87bkm27wj7.fsf@ovpn-194-92.brq.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To SA0PR02MB7386.namprd02.prod.outlook.com
 (2603:10b6:806:d9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR02MB7386:EE_|BL3PR02MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: bb93c63d-f9f8-4c01-461e-08db0b42d35f
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZdtUSCF5+UPdKGELxIQve+/0kMNSUW0lZo09fNd0lI1XNXP6q5P1CA76hhDeUs+iuXxJOx/A4jQtK+kAYq4ZbHXHUpFOnowMjETdiJTqPQRRPvY5GuEKi2PtZ/5jW9claw2xE9AnOCMlswkPYJDMMFZY9MMD0owO684dv7LM3kutxS5NYYI+/yjPBRRtdRUVfFM9dinEqrNDQxRqTIFAzhErqB7Vmf4fW8sjTIQtVQv2ZpcS0scpB/di06G7w8X+sTln1iddXgEGwfvlZ/V4+F7M7nVZ0IqzvMNJFNsuFZZbP6SE7G8Lp3KNrk7Xdf9+Fyk/ogMFjgDq5SfWYjFBf2Nqj/W8CLW8KNl5ODmqO4rmAThsb3m0tp4/sDgShVgIzHPafwputY9eEKbAUr4Z0pN5oTVh8T1PaNnpG/h1S16QH3mC32frUn+9N7uuuY82duhLOgV96CZDKoFVuXJKMiaW86p4G/FKXV1onPzTiLEkB27nnfSGRm9soBjFcGnSoggh1lbtLYjNVXkq8zf4BpucFVMoSxmH6s2zZUIm4EwN4GanHUe7dSPaNufOTobaMn49N6ETqwoHyj/ATp/Vt7SKMWTZhMqjHXgc2UArLm8oLd6j4XIxT2X33lEH40yaP6SnEPHPCC1eB6p2JXQtQbJRWlNyx3+M9YBGh5Xi4pHmYRXL8C+Lm0gyYvgWGAVrglWUQKrgbGgN0IblMCbgUpNow/YvbCLy/2AbvnbqZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR02MB7386.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199018)(66476007)(6916009)(66946007)(4326008)(8676002)(316002)(38100700002)(66556008)(66574015)(83380400001)(31696002)(54906003)(86362001)(7416002)(53546011)(6486002)(31686004)(478600001)(6506007)(186003)(2906002)(26005)(6512007)(36756003)(6666004)(5660300002)(41300700001)(8936002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUV4ZEJPWnE2aWNBa3hYalZoYmR5RjlxYXpRblBRbUpsVzBzWHd6N3VYOVhh?=
 =?utf-8?B?M1Y0akNjdndoMzNzS1VrMFY5SElyenY1Q2NSVnVtc0RWalVpUkYzTWlBZWpE?=
 =?utf-8?B?S3d1a3lnYWtCc29kVnZ6bFVrMlp0d3l4NC9wTGs3ampMWEZZbHVGd0NhZ3lv?=
 =?utf-8?B?ZDErZWRFeGw4RmErSUlyZXBSaE1xRzY4V3FyejRMZFBsUjJCQ3dKWGRBS0l1?=
 =?utf-8?B?NjJKTHJoaGZTdmE4ZU01dmZMM1JxRE9YVEZ6eGxkTGJZZDFiSmwyblA1bTlY?=
 =?utf-8?B?OEs5TG1Id0hGVXNiVkxENCs4TEM3dEd6SnFhVld2Y0hacEJlNUpmbk81aFFO?=
 =?utf-8?B?Y3FvRE5lMCt3THFaZGl1aXg2TExnYklaT0VlYUlaVzRLOVhiTnVaNEVJWTln?=
 =?utf-8?B?a0VMeVpFOFF2eTMrYTRsNmpDeDJpM3FkZVplOWIrR3BxejlwekNCNGN4Y045?=
 =?utf-8?B?UEJwTHY2b0g1K1NId25YQVdYeStDRmdUeEVSRkVWZjhqc2lpKzBFeHpXaVF1?=
 =?utf-8?B?dEFMSWt5bnZ5VkJ1ZXhoeFRNbk00c3krem1QU0FNcjZwMGgrdGZ2ZFZjUTBG?=
 =?utf-8?B?SWNBUVltR1hLK2drYVRtWlpBL0NRMTJCZ2F0TEMwbUo3bFJpV295aDMrZlBs?=
 =?utf-8?B?czlvU1YySGoxVUtrVkExblVJVVU1UTFQREhCMVZ6ZEl4eWRPN2R3UVI4Y1dP?=
 =?utf-8?B?VitNNEpFd1BhekY3U3JKRW9rdnMwalNscTlVVXlGUEZSa2RmUGxYS2lEYWpW?=
 =?utf-8?B?ZmFyeTc5NDdIMGU4SlVqZ0YxbGJNQ0FkY2JWc1dEZ0lzNkQvViszbjByalVF?=
 =?utf-8?B?cDliWGZpVXdKNmdKQ25HWFRCbENCSHVPU1E4SkxJbnV2WExVTDdBN0UxZmtn?=
 =?utf-8?B?dW5VQ3laVFRscWZWMVhkaWg0TjU0M2MyOEhWMEFKTEgyekc0TUhRSkFTVVpi?=
 =?utf-8?B?ZEhCTGQxNkkxL1VidVQyajFWQkljek5rZmRWTXpaZDUyeWpicG9EeDRUK1ph?=
 =?utf-8?B?Wmx1TUxWR0lxK3VORTJFTnQvektWdGl1c1ozd2ZXaGc4bkVBenk4bnp1SnlS?=
 =?utf-8?B?bTdPblVqMVdqdlZKcDZzSnhaWG9GakdYZnk2UWtNWEp5YVRNR0NnYkRTQzFK?=
 =?utf-8?B?M2FrSy9hSTNWZVZnNHRnK3lJYWxaVk1EYXpGSGdMb3cwZjE1NnVUbTkyRXNX?=
 =?utf-8?B?WWkyVkFQdHY1U0J0MWNaQnAwZjNjTjdGajZabENjZVUxQzFEUS9uMkJLa2RN?=
 =?utf-8?B?M3pvMkY4a2pWQ0MvNjhsN2Nva0UwbUpEUHNsVExRN2tMODFTbFZGVkxVSHUz?=
 =?utf-8?B?RzBQdTJ5ZjVJbUUzbDFGWUZ2STBsV2JmYkdSZVVLZlB5d2IrUHNiNU9oWHMx?=
 =?utf-8?B?a21pNVJ1RzAvTml4dlVsTUVZUnR3YWhMV2RPRktjTTdldkRiRVEvQ2IvbDJw?=
 =?utf-8?B?Q0k2cExmRGRIUUtLQ1NmaEpCdzRvM25Pcko0ZCs0cWVnYVIwOU5KaTJCYVlK?=
 =?utf-8?B?cXkxUGpvTkJqSDZmT2dVOXVCU3BwWFYvZ1ZMSTR0RW44VHJjVlVRd1h2N2t4?=
 =?utf-8?B?TDJiUGZ0VFJZMzNFMEZiYzZvUjk5K3Y0RWRqVnAycmpiMDVDRnUwaC9tNHE2?=
 =?utf-8?B?dklzak1RR1RTTXJNMFlaZVAySm5oYkxDOHpGbURpQmZ5ZFFxZzVkbTJlUE93?=
 =?utf-8?B?QzJhaG9qUzNZbk5CWndIOEZGV05PSTA0Z1V6TUo5QVVCV2l2WDNoRHIxY1JL?=
 =?utf-8?B?ZjVUMW9rdGhNNE9WTzF2MGJrWXpwQU5zaThPaXJFZldBNnR1Q0dIbms1WWFn?=
 =?utf-8?B?U3VJK2h6UnphazRRZ1hjUSs5SmRwR1haSURzelpiYmQzVFlCWTFyekxjbzJ2?=
 =?utf-8?B?YmpSQncxVy9lb0dITEdnbXVDUUM2THBMdHg4alk2RlNzN0NXbDVvdU5GWVZF?=
 =?utf-8?B?WEIySlk1SktvNEUvVm1ZMlRFWjBydFVrV2kyZEgzWnJaOHhlQjI5NXNOYm9F?=
 =?utf-8?B?cDVIYmZUVEFlV2ZiVUFGSm1iZWRkSVMwZWRXVkVFNDdwcTJGSjg2RENBUEw5?=
 =?utf-8?B?azlGR2M1Nk5qa2FmUDFOSWNkZnYxOVlibkNacXdRTDJTNWIzdDAxeGJldFI2?=
 =?utf-8?B?TDdmcXplRXNkVjVmVEdhTTJ6aC9lZVIyRURqYWtQbUtQb1ZWUU1RSmFGT0pT?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb93c63d-f9f8-4c01-461e-08db0b42d35f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR02MB7386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 08:43:04.9115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Dmnwnmq6OJoC119oBZG4dR7d0gT7pKM0LZ4Z+YAjtYdADtQz2xkwlLao5dLgJ2/Fbr6JD0aOxfFRQ/2aBSs0zfNVXHC+RAyTD/4E9NfFTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8987
X-Proofpoint-GUID: PEHIjhgQvzItFxBz5ZTDNh9lU3B8T8n0
X-Proofpoint-ORIG-GUID: PEHIjhgQvzItFxBz5ZTDNh9lU3B8T8n0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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


On 09/02/23 7:47 pm, Vitaly Kuznetsov wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
>
>> "manish.mishra" <manish.mishra@nutanix.com> writes:
>>
>>> Hi Everyone,
>>>
>>> Checking if there is any feedback on this.
>> I've expanded the CC list to some relevant maintainers and people who
>> have touched that code in case this was missed.
>>
>>> Thanks
>>>
>>> Manish Mishra
>>>
>>> On 31/01/23 8:17 pm, manish.mishra wrote:
>>>
>>>   Hi Everyone,
>>>   I hope everyone is doing great. We wanted to check why we do not expose support for HyperV features in
>>>   Qemu similar to what we do for normal CPU features via query-cpu-defs or cpu-model-expansion QMP
>>>   commands. This support is required for live migration with HyperV features as hyperv passthrough is not
>>>   an option. If users had knowledge of what features are supported by source and destination, VM can be
>>>   started with an intersection of features supported by both source and destination.
>>>   If there is no specific reason for not doing this, does it make sense to add a new QMP which expose
>>>   support (internally also validating with KVM or KVM_GET_SUPPORTED_HV_CPUID ioctl) for HyperV
>>>   features.
>>>   Apologies in advance if i misunderstood something.
>>>
> Thanks for Ccing me.
>
> Hyper-V features should appear in QMP since
>
> commit 071ce4b03becf9e2df6b758fde9609be8ddf56f1
> Author: Vitaly Kuznetsov <vkuznets@redhat.com>
> Date:   Tue Jun 8 14:08:13 2021 +0200
>
>      i386: expand Hyper-V features during CPU feature expansion time
>
> also, the support for Hypre-V feature discovery was just added to
> libvirt:
>
> 903ea9370d qemu_capabilities: Report Hyper-V Enlightenments in domcapabilities
> 10f4784864 qemu_capabilities: Query for Hyper-V Enlightenments
> ff8731680b qemuMonitorJSONGetCPUModelExpansion: Introduce @hv_passthrough argument
> 7c12eb2397 qemuMonitorJSONMakeCPUModel: Introduce @hv_passthrough argument
> 7c1ecfd512 domain_capabilities: Expose Hyper-V Enlightenments
> 179e45d237 virDomainCapsEnumFormat: Retrun void
> a7789d9324 virDomainCapsEnumFormat: Switch to virXMLFormatElement()
>
> in case this is not enough, could you please elaborate on the use-case
> you have in mind?
>

Thanks Vitaly, Alex,

Yes this should work. Sorry I checked qemu master code but not sure how i missed this :).

Thanks

Manish Mishra


