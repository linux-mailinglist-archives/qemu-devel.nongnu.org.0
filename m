Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFC50091A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:00:17 +0200 (CEST)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nevKq-0007iF-09
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nevG9-0006cg-L1
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 04:55:25 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:6084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nevG6-0003nD-JR
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 04:55:24 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23E6g27C012421;
 Thu, 14 Apr 2022 01:55:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=V9ZbezWDO8EnlEYyxe/7Jw3BdSosUc6ytdykcEim45c=;
 b=XXvNh/jn0Kcj0YdEjl1zaFlNJqoLbA7Rfl15OjLt/Ta3FGQHp+eMgOJ02LD7tXyEDSMN
 MCw8HS5LioSNnaK3WrzPZsgWtFc+CRS9McjseBEFyk+iZChQFa1+zm6Ftn1Tba7GILuz
 sPdaCIxK1VeZvvjb91mK2WrGsE4TlILgA4/RfhlTNhIX70HtLXgbgvMeGnZUDP+cLUAe
 jQ1wk19KJhjLioxPk0pUoulz82sF/gPVA8dUsiZl8DAsxTSCP/1fZS0wIxOIbzc/zNyu
 DDiSQ6tu59WtHKT3xbC37V09y+7NQK2/LyV2Py4Va/Mjzyu0XZsGcceddYukQ79h0aAT pw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3fdas9mk3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 01:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+wXPYahYSndyOBIOw87+a64uVaAHTbIAWLuiVEM7O69V8/jf8UV1RCxGXO4/tt3Hmyldm458DHLXe2wj7Ix0EwHq9Bz0ej9c1ZicALrohFsCPf64CKBR+yuJ2r5AX4VbU+xuy22AzOGeKRvFhawA2vB4n1mF6///YobVeGzFn1MvmvCtzMcD21qcW/cbb9zm/ik225J7TcCnDADRF4IjEhvCeYdMgxaJoGMt22uqYlS/Kb0VEnI2fnbQwOsYAfNHCNGZ8/ApzkRyO5i9fBYQgGWAIK+X/bPpWfYcF73D3WphLW1jTUOAz+WJ0cnyEfc4R7ko0fDpnzMEOH5UuoTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9ZbezWDO8EnlEYyxe/7Jw3BdSosUc6ytdykcEim45c=;
 b=KLR5A7Mtkq8EdNozBQx7lM88FF9HnIpFSykouAjey3kZwatajvZ2SJVJ+JyNphYtMKRKXlGBPqLkronfO9QQZDubNmcIlgGGoEYMtKCKVPzvQJR5wlRqKuUitsFt12kbx58Ioy5jYNOa9haHxx+IrtQN8abQ/p4m8eUH0glyTiuWqxAUHZp7WiyeTQggUtXUQBQfvI1NM3mDhDv46/gxK2r52y1PK7vbUrgI11MOydL9z/kvylUiBnt5BMqcUP3MQuwwX78fSm/9ADhntGUuN6PZz0JYq6LtZuH3NB6ABI1pgpGCcIwvLqq0IH2bQ1O0fBFFaXaBRwG9g1OK5GDGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4048.namprd02.prod.outlook.com (2603:10b6:805:2c::26)
 by DM8PR02MB8296.namprd02.prod.outlook.com (2603:10b6:8:7::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Thu, 14 Apr 2022 08:55:15 +0000
Received: from SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::e405:2b7b:2a58:c447]) by SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::e405:2b7b:2a58:c447%7]) with mapi id 15.20.5144.021; Thu, 14 Apr 2022
 08:55:14 +0000
Message-ID: <48d3c4c2-7e64-902d-b6ce-d0a547ba4c4c@nutanix.com>
Date: Thu, 14 Apr 2022 14:25:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v5 0/2] Option to take screenshot with screendump as PNG
To: qemu-devel@nongnu.org
References: <20220408071336.99839-1-kshitij.suri@nutanix.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220408071336.99839-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::27)
 To SN6PR02MB4048.namprd02.prod.outlook.com
 (2603:10b6:805:2c::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eccc574d-cd40-40d2-dab2-08da1df47d92
X-MS-TrafficTypeDiagnostic: DM8PR02MB8296:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB82969FDAE9FEC0832B9DA11799EF9@DM8PR02MB8296.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JckoHsDjpgQl97HPj2wTZ6ck7Tq+QoiXN1UXB8PjkUyaBuPdjNgTe9qUOw3dOEDuWxmUILJQHDRlZ4xN27TaEeqlfS6mp1hJzynD0iLBwc6QWJGMLU33tDc/YJS6cmVcULUJI9LouoCKlQQOTp0vsrzbPqjnChWaOMLuohQI7vl8M6dX3vzZWLfNuyVCzv8czRzuRfDJM/bxeQRXjluVqBHRPmNRW//Ufc4x/u+1FykgB90SBMnKTnV2SzzWbnhIh3Ge+uPhNgGiSZ4NLZ6Su64SojqSgHNUJNthJN5DolrgY3ehx1i1KsWf+SsErD9jhtm/2eZEDL8qqMWJBqVnTJU6EI6BB4iC75ARnBDgBO3H4YrZycqR1IyK+h9qMNHm0XR+ic87nRK+sutVyytIp8u5jU1ZdJKbdmkmIX00r5NpjWT1wjgs0vo4YDqQNw9rJ2Hacu1Ur/CC+NasFmcIkUQCGoqBAvz8+lyG7A3F4q5NqRzHBpsETqBCRCbu+ZDif6aXizLRikSUpVsrXPf7XVMJjpscXdGjlpG1A1xUyKkl2Bqyq6MciP0BuT577fwou9fyCSO+OkEjYW3KfoOkcTkSSZbqnAsIy+/SRCnS0IqTMDd1HB1tt1LGBgENEFBhPAQ8B3dYR8pXZOwpCAQEE+YtzI6/a80gtZxVLgv6EYit/8Cb+UZ3wsZNUfb8ZZ7ZiszalfodTlSqfVhvrwOmT0A5+lX349tyUDfcQdKubqZ76ERvX83id3k95abTxgcZ/QNXI7ylApE6q2yBVCtljQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4048.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(66946007)(6512007)(38100700002)(31686004)(83380400001)(6486002)(53546011)(508600001)(38350700002)(2906002)(31696002)(316002)(2616005)(5660300002)(7416002)(44832011)(66574015)(26005)(186003)(52116002)(6666004)(66476007)(8936002)(6916009)(8676002)(86362001)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZIVTB1RXZuQ0UvUE83OG1XRDF3OFJpUmt4LzhHUXpkOFJCc2REbEtSZW1k?=
 =?utf-8?B?SnNiVFlDajJQcFh0ZnhvZnlha0l4RkdSZEV6NU55YmtnUVM4RkM2anNZMVFw?=
 =?utf-8?B?YjdLVFFpbjBmYWZHSWNTUE4zdEU2QkpBeFdibEltUXRHUUJWdk1SWmNwTE5r?=
 =?utf-8?B?ckVKYkxMakxTUGltMkJUTmN0enRNVTI2dEZGRjlaaWFxUm14MFJSdzBjazlw?=
 =?utf-8?B?OW91M3k0d3F4RUpHQ1hUL0xNQm5jaDBMQmlkUTRiOG1sMElIL1hjd1YwUkVS?=
 =?utf-8?B?TlhYTk9uWDFySzFmMk94K2c5SFpjc3R2OGdzSjUyNjZXQjNVMzVwS1FjckFk?=
 =?utf-8?B?dGR1Zkp6aXhSS3dmYkNZSGpwZlR0LzNvL0R4VDJzQkhFTnVITmkxOTM0T2dX?=
 =?utf-8?B?b0FGOEJtZ3B5NlU5ekZ4cUVjcTNBY2UvdmhYMlpCRy9DVys0dEZMZWIzU3dx?=
 =?utf-8?B?bDUwTnZzVXJ4MzVyR1ZodjNIYWNseG5vKzAyaDE2SkViQS94SmRyRTgrVjdC?=
 =?utf-8?B?SzFKdjlMS0VzYTN3WEU5RlNJSWIzRGhJaktnR21PRlFybHNWd3RRcStrd1NT?=
 =?utf-8?B?SUt4eWs1WndjU2RuVEU3TkozTlVnT2huSEZqOU56QzZibm9CWDJUMnVMeTlQ?=
 =?utf-8?B?ZnliQmVkdzlQRzU3UVFUMjZLMEovYmNEVERYeCs1b3FDNk5XaWUvTmYzSU1r?=
 =?utf-8?B?RGdBRHhSZFVXVkY5eUd5QWtzSnFSYyttdjJNVU5IQUNtYlhDM3FvOURucXdO?=
 =?utf-8?B?VkphVjJXMHY4OGNGektsdUx3VmZQOFJKZmFuL0JycS9XTW9zSFM3L2M5cUg4?=
 =?utf-8?B?c0pWcEh0cjM3SmN0OHNoMnovY2pwaGpNbndmUlN2R2JDcXlpbW9CMVk5WWVm?=
 =?utf-8?B?THJxRlBQNUlac3lHMC9SR01oVlBvZUxLbjBVOS94d2djSUEwK2wyRmRMN0Za?=
 =?utf-8?B?ZDcrdkd2ampWWm9BK0FsUE5tWmFqUjlKbzdNMUxBSGNSYlBzSVZtM2xRZDNz?=
 =?utf-8?B?bzhtME9Td2RFUlFEZ0VobVloT21MQ1BmUjYreVNTaDBQT2l5NXNTMkljZXFH?=
 =?utf-8?B?TENtd2J1Snp6aW1aT0JUMlNiOGpleERIcmlpelpCUGZGZGc3ZlVLTWpBQTFU?=
 =?utf-8?B?UFFCVDRyaXBFMThCa2dGckhYOWoxRGpqc05sNThRRk95QllaamgyMFR4VUlG?=
 =?utf-8?B?V0h4WTBWcUhJcG1ZajlGZUwvV05NQXBHVWNmbGtOcjc5a0U0RXRzdE5ScUVh?=
 =?utf-8?B?TEFMazZ2QWNwckxBRGNvVWhmZjBKcFpKOHAyNUF1MWZMUjdJTUtXU2loL3By?=
 =?utf-8?B?bGt6R0xVVmwyUmxCLytRV2o3QmlEWTFmWjBId0FadUFCdmxFQ3YyeWM0cTZS?=
 =?utf-8?B?b2owNXlJV0YxMWdZaFR6UmxKZVNjd0ZJZ3ZpSVBUb1lPZG8zTjUwR2JqOXhZ?=
 =?utf-8?B?Q3IrS1BHUnVXRmZkR0FrcTlKNVVKZktWbm1XNUkzRndUVysyL240c0JnK3lB?=
 =?utf-8?B?U1F5Zzl6ejlFTHJVSDlrQmxpM05OWnEycm8ra1phY1pUVkFXQTRQRUdEd2NQ?=
 =?utf-8?B?dVdRSVc2WnNyTDZTZThDRzhxdFkvRHlZT2NEd201eVQvc0lidmdCdHRiVnZ5?=
 =?utf-8?B?bTFRQ3BVNFo1dGdycmdtTW56eG9vYjFOWjFtMDZzZjJTTy9wWEhvYmU4NUln?=
 =?utf-8?B?d1JZMlFjdTRKNVZpb1pONGZ5N1NCWktaQSt1VTNxcXVyWm5BV3ZzMFJSaTN3?=
 =?utf-8?B?Nm4xckJ0eGpNc1VKTEgySW9HN05wb2lKYkI1ZjdvRzJjQ0dmZllkQmsxc0Vk?=
 =?utf-8?B?SVpCM2ZGc0hSMS9DY1Jzb2RRZHMyWGxSa3BZVnpEamM3dUsrTGwzSzlKTFMy?=
 =?utf-8?B?c1NqQ1Roam9nWVoyS05JSVptSytJSXNZTWE0N0YycFRTYmpISzNmSWsvMXhh?=
 =?utf-8?B?TkxuMEg2UUNNMG52ZDR2eXFUOHB5Wk1vbjhtYkE2KzBMNWtZQStPYUU0eVFu?=
 =?utf-8?B?WFBJdSs0TGIzS2gySWx0MHpSa1hRdnNBSGp2dWp5czFtczhEMWhiNFhmWVZC?=
 =?utf-8?B?VGVTQ25maHpSRVYwcTQwQS9SQUJuQUZHOWZQVDZvaWtIYW9wbGJFUi9ZUWZ4?=
 =?utf-8?B?ZEdtMEZnZWpyWHpELzJPMHJNeXBCR2NtR0pqc0xCeDI3NEtlUjR1OEdnNnZM?=
 =?utf-8?B?aC9vaWJ2NFRLTFltUmUvWUVxOXJodktNWHVsaktFSTB3aUZ4RFI1ZzRDQjNz?=
 =?utf-8?B?WFVlV3phKzZpMTNWYWNNZXFGcXdxTVdqZFk4OXI3aFFnRmNHUHJrajBNL25X?=
 =?utf-8?B?NEhIZC90UTNZeFdaYWFVSVNRbEFjQ3M3b3ZYajZ2NlJ2SlBsdWd5Qi9zbGYv?=
 =?utf-8?Q?votSFCte52uDr1ZM=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eccc574d-cd40-40d2-dab2-08da1df47d92
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4048.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 08:55:14.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0n97x7uVj0fM66RsNdM/DpaefIt0SokbjughxhM6PsGqe8M1xBhNY5dmA9inMNmKLfnss2fWdhYCXD1go3CpPx1HkekuOqUnu0NgFNuC9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8296
X-Proofpoint-ORIG-GUID: 0kCK9vsZcmpGBdue3iNp6ofixwzrp8cJ
X-Proofpoint-GUID: 0kCK9vsZcmpGBdue3iNp6ofixwzrp8cJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_02,2022-04-13_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Hope this mail finds everyone well! I have updated the code as required 
and would be grateful if I could get your reviews for any changes that 
are needed to be implemented in the patch. In case no change is 
required, please do let me know the next steps for the same.

Regards,

Kshitij Suri

On 08/04/22 12:43 pm, Kshitij Suri wrote:
> This patch series aims to add PNG support using libpng to screendump method.
> Currently screendump only supports PPM format, which is uncompressed.
>
> PATCH 1 phases out CONFIG_VNC_PNG parameter and replaces it with CONFIG_PNG
> which detects libpng support.
>
> PATCH 2 contains core logic for PNG creation from pixman using libpng. HMP
> command equivalent is also implemented in this patch.
>
> v4->v5
>   - Modified format as a flag based optional parameter in HMP.
>
> v3->v4
>   - Added condition to check for libpng only in PNG option is allowed
>
> v2->v3
>   - HMP implementation fixes for png.
>   - Used enum for image format.
>   - Fixed description and updated QEMU support version.
>
> v1->v2:
>   - Removed repeated alpha conversion operation.
>   - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>   - Added a new CONFIG_PNG parameter for libpng support.
>   - Changed input format to enum instead of string.
>   - Improved error handling.
>
> Kshitij Suri (2):
>    Replacing CONFIG_VNC_PNG with CONFIG_PNG
>    Added parameter to take screenshot with screendump as PNG
>
>   hmp-commands.hx    |  11 ++---
>   meson.build        |  12 +++---
>   meson_options.txt  |   4 +-
>   monitor/hmp-cmds.c |  12 +++++-
>   qapi/ui.json       |  24 +++++++++--
>   ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>   ui/vnc-enc-tight.c |  18 ++++----
>   ui/vnc.c           |   4 +-
>   ui/vnc.h           |   2 +-
>   9 files changed, 157 insertions(+), 31 deletions(-)
>

