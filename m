Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B84EAAA6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:44:00 +0200 (CEST)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8OM-0006Z4-Vk
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:43:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ8L3-0004pi-Ga
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:40:35 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:32458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ8Kz-0000VD-PX
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:40:31 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22T4W9QV017737;
 Tue, 29 Mar 2022 02:40:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=CjX1Nw3qmTF+koWproWxiAxhdnvZcfFhopxJtR4+E6s=;
 b=m38h7DDiJNDTVHtX4z6ZgilFGxcozKB+qWG9wDMzVvd5+o7wTGPefjB+yUYKFGl1BatL
 OqctWbfsAc/rlDQI5t+OSfzOsH39vdmKGsLAlMxOKqAD4ZCCAaQfzT/VCwOH1L5fjjU1
 T/iHf6LT3pOsyUBKDvrfLvD8wSFoV7VK7jf37FqvvvCHCxrXtecMPxFiURsAnZLSvBAK
 N7flQxFTLGDekqfGBviqjOzf0f9hgePhniVI5LnSHxcjX1VMjaEE5wQARolsT+w7ttK3
 KpvdqWHQ/E99DIgRA5NYOFxScfKkXBAmQwRqzSICV+PQpXTHGrdL181f6O9u7qt0TYoU 9A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f22cx5fv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 02:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiTlZIbFhgSdmx8PRdAUhNL02nHGfkD6H+09u7z+eaGnwFeRsP1XgxoJNHNWusiC/UrwRzx1kNjpidrv8lJ1hbXnhuOBJbvf8uSHyRkl8ghKoVax32abl0OF2wKrfp0wx0qeWazIPkwJ0hBhEgVm9E1n/TS6BW9Eu3xV/zBpuC5NFk4wSEicGWkyZVz5cuVwPlyRW90AX6mIudAgz3lu8S3fmxnm2aD+iQyc0qFF/fU7WOQWgi56o6QMRvd0MUPY337RhfJaRqlRc2hcN5D8k19Gh4A7DZUo554o2jJf+aszvWittDqa/WODLP8G9oGQItYXNDFpzrv9nuQ5UKCxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjX1Nw3qmTF+koWproWxiAxhdnvZcfFhopxJtR4+E6s=;
 b=Ndab0X1oG8A74pVwneU2tUVsMKTKuyUmOSx2KKFYDVcMNu0vWSBzsoDZ9iguONh9XLFtPr+zMXx9Awnlo6hYXH87dTs7mlYZ1y4p8g6qpjvjTA5BuOfcWxdrlHwChJfdfkg6Bi4iyqsghG2rpdofUhpi5YSO54WbD3Nh3nww9+QS33lnoqFFu4Z6zlijG16HY6VmCIzsmf+dnvZaQRl7JfUYw5zdOEAuoxBfP51X3isYj6QLAqoYq2XWmj36AXVHJcuqzMexVk/vb/02/Kex5xAY4iS/mgMGCt9pY6bzrpQLU0v1FK/xUs5YaMxnXYsdUQWZHhGL2gaN+tm0tmINDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CO1PR02MB8425.namprd02.prod.outlook.com (2603:10b6:303:154::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Tue, 29 Mar
 2022 09:40:24 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:40:24 +0000
Message-ID: <d61409be-8c69-dc63-aa40-bb01d0875b15@nutanix.com>
Date: Tue, 29 Mar 2022 15:10:11 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: On patch series version tags, and also cover letters (was: [PATCH
 v2 2/2] Added parameter to take screenshot with screendump as PNG)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com>
 <87bkxp5kfo.fsf@pond.sub.org>
 <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
 <87a6d9429w.fsf_-_@pond.sub.org> <YkLLBymd9kCr9sLN@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <YkLLBymd9kCr9sLN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d696ba0f-9263-45fc-057b-08da11682607
X-MS-TrafficTypeDiagnostic: CO1PR02MB8425:EE_
X-Microsoft-Antispam-PRVS: <CO1PR02MB84255CE35F6506DB4639F4AD991E9@CO1PR02MB8425.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xb6ohhFatjvTQ1ClaxgsSD5A8Uf1vwv5TNa0GRZ+Fxpr+M0nRTu7F852PupAFWDVG/TUeYOCNOVZXACy5YNyxE6foV6zPOk1g0h2qzsADinvv2MzTERXhYCLJajR6gs9N0NOLDPiHT3eIancksmkz34PDkupOvKVzuEzSktqH0ZhUSMiC8/WsnQgaOYCAYKeFYZF4WieFlUOmVD7T4+2SingC3e2umKFEzu4QLln2WOURBpdKfK5exbcID13saoiO1R4JxxD+LZbZL18h1Gs1LB9RpO2RzxEfx2szBK3yeMQBzX8BHEscEBxgUc2Q61LvrVExfYtoVqW4TumnLEKLCIDahp91PZldYt+KrGkFRyh8rlo2yZtJC4OOT5UVimCA+FjKafj14qlmY72BIaLfY1EX/zVwM3fiDGGMZI7A5/zWwxFErB2PdloJk5cxUQiAmKfp2OrIBKO0+q4gx4WKghPLA/goyRgM/D210YwuzARcWZN0A+S2N7g4/+32S1rptU0uoylE6RWOOZaiRtQx8Wc6KSEpgwwHDqFTYIuud6dXCFj6TL2kE5vS71/ooLD5tBWIZt+foik0EQ3lV4IqqDaqWlvaHCV+Ck0JQFRvOjg3t1pyKuqIT9RA7cu/OngsMrNAqeC1nKViIhAX6fo0Tao7QhceJlHoiN5L2IiKoxX5jHFrQtliI9cYmXzJ8boHu0a7hAliPVVZQTsigQhUxcURLn2DHjqQ1eo1Nb/X2SBAlQ+V4mpZ4VH9DmJaV3DG0MRZ2VrYHICXcJyDunypQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(316002)(36756003)(53546011)(6512007)(44832011)(52116002)(2906002)(31686004)(86362001)(38350700002)(83380400001)(31696002)(508600001)(38100700002)(186003)(4326008)(6486002)(110136005)(26005)(8676002)(5660300002)(8936002)(6506007)(66946007)(6666004)(2616005)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THFuTFlLQ0QvMC9ZaXczdWRTUUh4cGJxMHV0YWh4by9aZTl3QTNhNzNYeExO?=
 =?utf-8?B?ME41bS81dFBlN0p6Z01VaUxnWkxBWXg1UGd1L2ZacXQxcFJaN041UjdDZERL?=
 =?utf-8?B?TEs4c0JZMnNtaTFZSzhtS0RaRG9XWTJIZW5FU3hlV2tFQUhDVkJDYlVhS0s3?=
 =?utf-8?B?RWpodjZlWGg4QVNJTlY4RmxZVGF5SFdsWktlQXVEMkVBRzhFOGtpenBsdXpL?=
 =?utf-8?B?RDN4NDFKaVpoRXNuOGVYaTNPV2tXTnpJbTlvRVhJSkRCeGZJTDhKTjA4NUVO?=
 =?utf-8?B?eTdwUU9FYmlWU1lqM1RheHRrRDE3RmVuWkM2aGdwUmpzNzVlNGthQ055cGtE?=
 =?utf-8?B?aGVzaklocFErV0Zoa1l3aDNxT1lPVXdOYjNIdHhrc3FuYjFLTVN1RlBNcjJz?=
 =?utf-8?B?ZmJXUUpqeTdIMVA2Q2phSVZhbktDc2YyZnp2UW0ybWh0bTdzUVJiZkhWK21Q?=
 =?utf-8?B?LzBnd05ESkYyTkxuUzJGaUZkcm5NckNTS3JnUnh3TldWN0FON2dRdEZ2MmRM?=
 =?utf-8?B?MzEvdkE5ZEVpZ2thblZtU09NeDd3bzZEM1JDeVNpVVdvUWk5R2pSM3pSeTVi?=
 =?utf-8?B?M0tiN1ZIbTFmaWNncG5sL015R2ptWFFZazN4Y202MExINERnZ0ZDKzB0OFVw?=
 =?utf-8?B?UmFCZEVCR3p0am1YdzhMbWJ1SmljaC9kbjk1ZHRoSzlOSHpYR1NzQ3Z3T2l6?=
 =?utf-8?B?bC9ZM3Z0c0RnSjdhSlJPL0tZb1VWY1BibExZazJtcEw0aEtsUjVvR2czN05O?=
 =?utf-8?B?djNYZ1FOM05aQ2NGVi8wdGFiOUlKaUhQVzgzUlBOMnRXQlhSVjl3cDkrMXVU?=
 =?utf-8?B?VS9lYTQ1YUpFdVQ1RzdCQkN5ZTNlYVVDS2wvWWUyNzdWT3JnR0hIa3lmakFJ?=
 =?utf-8?B?QXVXRVd3MnFwSGhoL3RPNzZDd1FCaEoxRkhGSjA3SGxTVkttYWJPMHFZMVZa?=
 =?utf-8?B?QzU0MEd6WkcxWkdON3h2WG15aXRwdGQxdjhSQkNxMyt6bEl0SElTMkV3MHZy?=
 =?utf-8?B?anhwam81anBoN2ptSkVONlZvdVVrdXpYclBScGpPQVBrVDRZUE5UMzdYeGMr?=
 =?utf-8?B?bnlqMlJiTjAwZE1wS2QzRUROWXNPVy9KVWdvZG5jSXoxWFUxeVlFYzBza3lp?=
 =?utf-8?B?NiswbGplSG5wdVlFS09YRnQ2bUZyVEpmWENEZFQ0SWJQbDhTU1dNY1BEb2po?=
 =?utf-8?B?bWhnOXM0M0w0RHZHeDhhMDBIeGtZeEtndWl0THZvMDQ1UytzUTVTWG15cjdJ?=
 =?utf-8?B?aEk3T041eGJDaUpVTU56clJKZFdqSG1JOEo2YllRWGlkL1I4RzNTc0cvQk80?=
 =?utf-8?B?NjNkMUZVQ3BadnVxZmU5ZXNKTnJOVUowRnVUYWJqazZuOWl0cXdxdUx4R2p5?=
 =?utf-8?B?ZmMyQjluU2lqYVpWOFNFTG1FcnNvMXQvVUx2OXpiYS9sbzJtVS9WK2p3dXhk?=
 =?utf-8?B?MlZHSkkyWTJJLzJ0blBwTDhZcTQ4QnRrUEN6d2VGRUtIeU00Zm9reCtiYXA4?=
 =?utf-8?B?YVlRUHpxWE5GWnd6anBzd2JVVWJxRndPb1V5L3pqeG9OVUs2MEMrdkNpcTN0?=
 =?utf-8?B?eEQ1QUdqUUw2K0FpSVp3TjFzL3hyNTlOWm9Db2RFNHdJSTloQW1TM2Y3VlZp?=
 =?utf-8?B?VXg5eDBJSDN1KzFVVnpjcFhpWjhSQ3lkU0R1MmQwMXQ0MFhXSkJVbDRlbmk4?=
 =?utf-8?B?ZlRTVUl4NWhCbXIvcGFUUGtxNWZXdUYvZ2JYUTVZVTVhclpIWEpsSlNYWk1I?=
 =?utf-8?B?dENuRXhYN3QvbnhlVmFNc1AwdERVNnhJcVpKU2hGMnUxOHBYRHkyZEZsSHZx?=
 =?utf-8?B?eVhvWkdmLzllaVg5N1FGU0lhQ291ZjFXNTgraDNVNXpKU1F5Qk1Lb2ErNUVZ?=
 =?utf-8?B?bmxSbUlwR05NM3VkOSt2Rm5TYU1SVVNRRHltZUN6WkdkckdtOGhsRW56TnJH?=
 =?utf-8?B?ODQ3NmJXbVhObDlCdnBxMkMyOXlWaEpxZkFsZ21VSFBsbnJtWmtpaDRRVzNI?=
 =?utf-8?B?cTdFYzFzY3cvTUxiKzl5Z3hvOUZDWk5BZmNZcFh4T2VHdnU3ODVFcmV4aWkv?=
 =?utf-8?B?bHYxQmllT1VtVnFNTnk3Y3Z0RFBMWTJzY2pNbDBUVm1tZ0pKWEdRUDlPajd0?=
 =?utf-8?B?NUpzU0lmd3UxUjJhL095U2hzQjBER043UU1sdFVoMmVIWlBZUTNWelZoSWdE?=
 =?utf-8?B?TVFtaHViMXlLcm1zTlQvaVBmVUE2WmFhbW1seEQ2NmFjYllGS3UrckdaM085?=
 =?utf-8?B?NjF3OHlKMzExclZnaHczWitzc1BYRWVrMFR3OVBOQk1ibTdYTmdhOEs4M3JS?=
 =?utf-8?B?cjh5V1haZUJPZzFIWUN0eHRpVnBtTTJSSjVIb2JSZEppSkxTdG5aL0gvYjR3?=
 =?utf-8?Q?Iwrz+3oe9g0lVYyA=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d696ba0f-9263-45fc-057b-08da11682607
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:40:24.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/dBmmY5LbFQsOWSXM4nSvpvlUyhkguxUJ8jdkWcU3ZCvBtJGfmzchagqISBKMh2uDv5bBmi228NUVW6mUzZKtyzLwhsZIF3BHBSzvZNk3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8425
X-Proofpoint-ORIG-GUID: XPd6tW9eQHpDElPCt9blUuDHYxdL65Pr
X-Proofpoint-GUID: XPd6tW9eQHpDElPCt9blUuDHYxdL65Pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 29/03/22 2:31 pm, Daniel P. Berrangé wrote:
> On Tue, Mar 29, 2022 at 09:59:55AM +0200, Markus Armbruster wrote:
>> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>>
>>> On 29/03/22 12:12 pm, Markus Armbruster wrote:
>>>> If I count correctly, this is the fifth posting tagged "v2".  Don't do
>>>> that, please, as it's quite confusing.
>>>>
>>> Thank you for your review and I apologise for that since I am fairly
>>> new to upstreaming. As per what I read version updates should be done
>>> only when there are significant design changes to the patch which
>>> didn't happen in the v2 version. Will update it to v3 and send the
>>> patch.
>> We all make mistakes :)
>>
>> The purpose of the version tag in the subject is to help humans with
>> keeping track of patch submissions.  Increment it for every submission.
>>
>> If you need to resend a submission completely unchanged for some reason,
>> you may want to keep the tag and add "RESEND".
>>
>> A cover letter (git format-patch --cover-letter) lets you write an
>> introduction to the whole series.  Simple series may not need an
>> introduction, but complex ones do.  I always use one except when the
>> "series" is a single patch.
>>
>> Keeping a change log in the cover letter helps people who already
>> reviewed previous iterations.
> FYI, using the 'git-publish' tool instead of 'git send-email' or
> 'git format-patch' helps you do all these things. It automatically
> sets & increments the version number, it prompts for a cover letter
> and remembers what you wrote next time.
>
> With regards,
> Daniel
Oh didn't know about it, will try to use git-publish from now on. Thank 
you for your guidance for support throughout the issue!


Regards,
Kshitij Suri

