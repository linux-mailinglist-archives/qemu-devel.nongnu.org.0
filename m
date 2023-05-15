Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278DA702BC0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:46:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWei-0007xN-79; Mon, 15 May 2023 07:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pyWeL-0007wT-U6
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:46:07 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pyWeI-0007eu-1o
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:45:57 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FAPAoH001735; Mon, 15 May 2023 04:45:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=OdWtughalgjuX5/8ExJrzNbznms9kzryVVbW3piSR3Y=;
 b=XIvZkznIGyZWID3ypLuyKjWj/KTN5gopHmacHe1EYIMok7aDPmABR+VHpXLUeGr0OkBe
 qzqum/8WV2tS7TwlutjC1TLf4o5KBFlhkQ3se6vAiwKrgcopttYKy8xwGLyQbHxZZoSk
 NNb+mKV1MBphB2X2IdU+C2PZOt1E2H3GrdG2z8ZoFk2LLWgSKF00F/Kn9UmM2pc5hk2u
 Ces0LGHZihnMv8eIMu+3REqDHZ9wNXay2VpAuRFu5GoP5AlDFk7Nf5tziobVEq0kvMv4
 k6lLhyzdDxye8uCNLno2HgCaAWRrzverzJSgHshk2GiUkln48HH+GDkWVmu7bqXV/0y1 2A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qja303ahx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 04:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFe8vt+ktPsJJrf9FbxTsM689oo/RwtVY0ue1R4jDd/PPWINOgfLV54s3BfknouhiDloKKbv8Bb9nKOPYFyoBx7UuioNEzQVBG6UqRUHhi3eTh7jaVaA5tmRxN4lq4Pp1HvHZS1RFhhL3VXtMOvEdbV+nLuUrxRkRkBFisYcTITVjUtLz/aelYO6kptxJqUUWrR4ZMLZFk2UX7N4mE+fda79bxTqCgvAYe3tGttUmf2e2w12dTdetLOeB3rEZz6+9p/k41JxTt7MLlVMCvnj9Wzl4zzkxSQB7/alrY4k+j+ePPDUe8MGvhyYlZLjiPKgpRLYhLz4HKGWcyT5ycZgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdWtughalgjuX5/8ExJrzNbznms9kzryVVbW3piSR3Y=;
 b=dmonQFQr5p8mEsSTP5QSU2Z8/XVbNQjiHQAOPCxDoIeN8WsYMMfOPK/nYPviJKsgcX5pvwRkkHK0Sj/iMJt0WSdbQlciNtlopU2D1LeCXitdslAzbAjmNu57RA0JtkYv1SUrNa/ZDjJYioMuE9p3hz8X0UDUaVWX7CwDwPKBp5E2jrCgHc2CCjE1qEfhTxxUQbkuAAswSBSvD0VJilYXEl6n/UibAH7JhQtJDpXwC0DD61kadTsKS388slgeqAjucEk0VUaQo+z4ZUw/DEE6Zpz/dmZBefooqosVx/r0pLytNEXvHwe6kahQlyJts1kMEjhqp1mIqHBs/wozcCaMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdWtughalgjuX5/8ExJrzNbznms9kzryVVbW3piSR3Y=;
 b=amFEmgylw7ckRseD7p+1NAvW1P8tldlYsT5CNH5iw+6EEqUOH+KvDbhn9fHHP4y2zDmP88LrcLhzGYuWMF5HVPpQfIBNBqWxnh9CNSnO97ZTgJIYS46JrcAsv5avvADGlLnGOc91VPewx2Jwloo0QU2UAKSAw2sAEQXz7xagoVwtHwUbxXLifEicjMUeUTK3GP4f1h6FetO9U6ou+8eslnmNjaw8Q0GUtlwueCzYikynnc1YhQuwj2XtdJ2WGlyTf+mZ7nelPpZBC02UrV6roxCo3VXXHQXF6l7ehnAgwMDCersb9ALIt4Ode/VGAfLsDVfezLbohXeWCu0fz5t5VA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ2PR02MB10074.namprd02.prod.outlook.com (2603:10b6:a03:556::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 11:45:47 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 11:45:47 +0000
Message-ID: <5351a3e1-e2e5-9c30-431c-0ce6fff4c0c7@nutanix.com>
Date: Mon, 15 May 2023 17:15:35 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/8] migration: Converts uri parameter into
 'MigrateAddress' struct
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-3-het.gala@nutanix.com> <ZGIFmofD8CPJVM/g@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <ZGIFmofD8CPJVM/g@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ2PR02MB10074:EE_
X-MS-Office365-Filtering-Correlation-Id: b56b5aea-0852-4a20-c323-08db5539ec19
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yu181SP7q9gkWxevsuNbGTX9mmd8/iJvrvoM9DufbcSyiO7wpYeium19upgUz4L9DEc+JNlsXHqMtLEiztR/0WHDZ9fwIrZ8Wk+C5y+WUHmFrBuXwBXebpcT+L+bXuCzUPA2or8+kuvK2uRayG+cPILedpWOakuR1tO85dZG4kbILmFcm13FkhegOql0RX/MgJGfR8n1Fyu4727Mnw+G+WdRz2XHaadexL13fliwQXGHvrrVCH51ez6EdH+21NpGxra3B+L3Ct5qSL8YlTwhJAa4GKl5C1mmofDTaKJ0nzZPxhWWspNRzxkN8F945y76a5PeywMfYBuVICFCMPiDef6iJXjpzP8wkcDhSpkDx7oEVXaiIOYIOi/fwscyyIrEXp08rSuZ4Tcnh9pwMi7Zfq2YnRZObY6OMoex7cbAPSyNHil/NjTS7wPdkPkfmc0b/Q/EvMewtCzL/zEZMJZpbOvYAhbIepcWudtx6Dny5AZpkOmdmgJ5bvBaaeaCgNjXPdiaW8odh8CuEMAT7DRnxvQ1ABfl9NiNQDvK9/SdxkLbJ2Nz94gQXioaK0VOL7Kbe752zLKFRT29Y+hVn4vSz88/yM8lDLgBP9U7i8XBbT/jZp00k8IcwG3WIqa9WwGNrIyd+PBtPUoZ2FBw30rUkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199021)(83380400001)(66476007)(66556008)(66946007)(2616005)(6486002)(6512007)(26005)(6506007)(53546011)(107886003)(478600001)(44832011)(6666004)(186003)(31696002)(5660300002)(86362001)(8676002)(8936002)(36756003)(2906002)(4326008)(6916009)(41300700001)(316002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHZmNjI5eXMwY09ncGd6RFV6cmRvb1FmM2tWeG1LMXNqdWdTOTZKNE5mL0Z2?=
 =?utf-8?B?RVNiOUxyMGZFZUFianFFd09yUjdzN3pzaFdEWFdXcTVDaTRERjFkL3E3WG9p?=
 =?utf-8?B?Z3VxMVhiTVBOM09QTnBCK0xQNDhHeWR1eGVMeW5LUTQvQklzSmR6NmczekVD?=
 =?utf-8?B?UDRDNWpNZE1lSHFYRFFXcEo1QXdweWFGZnNOdFlxRWloeDNvNU5ZVmtDQzRu?=
 =?utf-8?B?RHZFcHBocDlrSmVnYlk3WDhSNVVTS3JXdzV3dlVTSmFESkpFam1DaHpqeG9W?=
 =?utf-8?B?ZEJMWVM2bCtrR25YNWpkTksrZHNmMndXQ09rbUFabFpVZWtFcEVWQU50VUUy?=
 =?utf-8?B?N3Vtdi9ubjB1dGtjcHpsN0RXMG11d2hWL0xSaVJJNzJobjVuOFVaRFF5SE85?=
 =?utf-8?B?UTZSdGR0N2dYaDg4L29iOVhLQVVGRk9HMDZkSjVTRk5yM0dETC9xK0k1NXdu?=
 =?utf-8?B?ck02bnpVUTRhMnhaMFB2Wkl2aER5UkZ5RXNMbnJFYjZMeDFXT0RJSkFoOTA0?=
 =?utf-8?B?MC9PaUkzdWVPbkRXeEVYVDQzaHNVRUJnRGR1eFZlZnpiMlV1VVdQZ1k1eEFO?=
 =?utf-8?B?cGpsM09GemNwWGlndFQyZFpHays5Q0o0eWVsZS9neEhTb2FWWllZYzZnZnla?=
 =?utf-8?B?Zmh1K2JtRDlFaXVYNHQzb0lYeFQ5UlNnY21ZTldPcjc0ZWY0c3NBLzVuc1gr?=
 =?utf-8?B?Q0Y5N3pKYVZDdW5TLzBrK3hYall4ZDNITzJtbnpRbFNBenNrWHFnUFFZWm00?=
 =?utf-8?B?RjBMbHNhaDRlcndNUDZMemUvYzFST3EvZUtSM0FVajJyUURMVzBJTGMvTU5k?=
 =?utf-8?B?UFQ5UkVkUmR6bXBEbkJLQVJUNS9uUGx6eG9YK0RJUnEwbXJudE5nVXI0Vkoy?=
 =?utf-8?B?RGlJOTNwUmNza1BsUHBrTGVkZzdWMDdtbStHdFRDMTBOL2c3eEZzOERsVU1x?=
 =?utf-8?B?d01Bck0rU29BYythQU11b252MVBlL3BIZVY3RUlKRGgxb1RkSnc0SjY2VndI?=
 =?utf-8?B?OXJRU1FKWGR5Z2JTTXpMT05ML3Z4ZTVzTjNMLzRTa0hRdWxBQ2FVVXg5QnEr?=
 =?utf-8?B?ZWFWVlo1R2ZiaFVQaVdTR051REZhdWM1OE8rM0IyeU1yWFk5ZTVVK28xOWQ3?=
 =?utf-8?B?ektiWEFIeWZwb0hwdmdIb0N4M1FVMFJWd09lL0V6YzZnL0dKdGNNaGhWWkNC?=
 =?utf-8?B?SlppWUtmdFQ1UkNaMnBYS3Npakh1eWhOSjU4R2hjMXhadlY0REk2bzdyR3V0?=
 =?utf-8?B?UDlSQnNZZHhkTXA0V3ZvbFF1eW8waDhhNWhNR0NSTStxQVRNSjluT05iaWFG?=
 =?utf-8?B?NUR2YTJPc2ZYUnQ4QVNtOEpWdDVMRDF2NDVKeTR4eVZvNFV3MHRtaThFTkRH?=
 =?utf-8?B?UGpoU0ZEaUlQVmJuMi9INWJ6L2dhbjN0YmZJS3JjcGErSjAvaDQ3VzZRcHlY?=
 =?utf-8?B?Sngrd1VpVThPN24vTTdLbW0zaENCQk1LWDdTcXdMU3FhWE1iY2lBMEsvSnNF?=
 =?utf-8?B?THRVYkk2RzNTUlpoSGV5QVF2UXVBSUk5aEJRZG4rT3EzMzZrYjcxbm0yMzBs?=
 =?utf-8?B?REp3SlA5YmVZQ3QzeDNxbUJ4QzdLV3dTYk9KY0ZQTDJxdUowNEZoQ3lNcHhN?=
 =?utf-8?B?b0thMXpjbmRqL1dMUVRRYVdCM0tyc0ZFOGdBUU9MSWVLcXo1MEdoUzZCcFFN?=
 =?utf-8?B?Tm5lTDJPdCt0Z0ZrdVVIUmRyS1V3L0xiMFd0TzJYcUx4cmViblloR0RUcmJx?=
 =?utf-8?B?OWtTYnA2cE82Rm1ZMHgrTmdOZGh0NktZdUJqNytCSFI3ZEY1YzBoQ1Exalp2?=
 =?utf-8?B?aW9neTdFMDEvNTA3OHZXc3h0eVNBUWtJallzd2hJNXpoUUYwbHlzSnZmTW14?=
 =?utf-8?B?cHJXQy9mTW01Vm9OVTJ3WFAxV21td0Nvc3ZyWisyU0t6SFVrVEtXRWp3ZW1J?=
 =?utf-8?B?WVRPK2hyOExvN09MbGJlVm9xZjY3bWE4SU92ZzArbDJoU0wxK1ZVSkZtV251?=
 =?utf-8?B?bmNSMzZYbzlYeml2cENxdThqSUpsMUV1VjVCQjFHTk5sUjlzc3pXV1RBMjN6?=
 =?utf-8?B?SUFCUmw5Nnk3eU9kN3hnMitDUmVLQWo4SHpETkdmaGNXVlJrbHE3WkpUOFho?=
 =?utf-8?Q?IeBQnjPPNGLScoXg30TEVOB/w?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56b5aea-0852-4a20-c323-08db5539ec19
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 11:45:47.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9Jm0SD753TqKGCjmkpHm8jbxFii4LTU+uvuw4j/Ownh1AQbTQfDyWOXh+XlC60AibJSkeDM7rNhl6/MzPA21g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB10074
X-Proofpoint-GUID: Lb2Mhp0T9rbZIoKFgL63XZ2hN9ZchLL3
X-Proofpoint-ORIG-GUID: Lb2Mhp0T9rbZIoKFgL63XZ2hN9ZchLL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.811, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just so that, there is a wider attention, I will try to address and 
discuss the comments from Daniel and Juan both here, as many of them 
seems to be overlapping. I hope that is fine with the maintainers.

On 15/05/23 3:42 pm, Daniel P. Berrangé wrote:
> On Fri, May 12, 2023 at 02:32:34PM +0000, Het Gala wrote:
>> This patch introduces code that can parse 'uri' string parameter and
>> spit out 'MigrateAddress' struct. All the required migration parameters
>> are stored in the struct.
>>
>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   migration/migration.c | 63 +++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 0ee07802a5..a7e4e286aa 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -64,6 +64,7 @@
>>   #include "yank_functions.h"
>>   #include "sysemu/qtest.h"
>>   #include "options.h"
>> +#include "qemu/sockets.h"
>>   
>>   static NotifierList migration_state_notifiers =
>>       NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
>> @@ -408,13 +409,58 @@ void migrate_add_address(SocketAddress *address)
>>                         QAPI_CLONE(SocketAddress, address));
>>   }
>>   
>> +static bool migrate_uri_parse(const char *uri,
>> +                              MigrateAddress **channel,
>> +                              Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
>> +    SocketAddress *saddr;
>> +    InetSocketAddress *isock = &addrs->u.rdma;
>> +    strList **tail = &addrs->u.exec.args;
>> +
>> +    if (strstart(uri, "exec:", NULL)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
>> +        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
>> +        QAPI_LIST_APPEND(tail, g_strdup("-c"));
>> +        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
>> +    } else if (strstart(uri, "rdma:", NULL) &&
>> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;
> I would have this as
>
>      } else if (strstart(uri, "rdma:", NULL)) {
>          if (inet_parse(isock, uri + strlen("rdma:"), errp)) {
>              addrs->transport = MIGRATE_TRANSPORT_RDMA;
> 	}
>
> as IMHO it is bad practice to have control pass to the next
> else if clause when inet_parse() fails, as we know this is
> only an RDMA addr
Ack. I will change in the next patch.
> Also you need to use '&local_err' not 'errp' in the inet_parse
> call, otherwise the later code block for cleanup won't run.

Yes, thanks for pointing it out Daniel. Will modify that.

Also, Juan is of the opinion that we could omit 'local_error' variable 
and try to address and free the memory there itself. For ex:

if (saddr == NULL) {
     qapi_free_MigrateAddress(addrs);
     return false;
}

Or, Daniel, can I also define here the variables like you suggested down 
in the patch ? or is it used in some special case or I am missing 
something ?

g_autoptr(MigrateAddress) addrs = g_new0(MigrateAddress, 1);

So we would not have to worry to free MigrateAddress struct.

>> +    } else if (strstart(uri, "tcp:", NULL) ||
>> +                strstart(uri, "unix:", NULL) ||
>> +                strstart(uri, "vsock:", NULL) ||
>> +                strstart(uri, "fd:", NULL)) {
>> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
>> +        saddr = socket_parse(uri, &local_err);
>> +        addrs->u.socket = *saddr;
> Protect with
>
>     if (saddr != NULL) {
>         addrs->u.socket = *saddr;
>     }
>
>> +    }
>> +
>> +    if (local_err) {
>> +        qapi_free_MigrateAddress(addrs);
>> +        qapi_free_SocketAddress(saddr);
>> +        qapi_free_InetSocketAddress(isock);
>> +        error_propagate(errp, local_err);
>> +        return false;
>> +    }
>> +
>> +    *channel = addrs;
>> +    return true;
>> +}
>> +
>>   static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>   {
>>       const char *p = NULL;
>> +    MigrateAddress *channel = g_new0(MigrateAddress, 1);
> Avoid the later 'out:' cleanup block by using:
>
>    g_autoptr(MigrateAddress) channel = g_new0(MigrateAddress, 1);
Ack. I think this also solves the doubt raised by Juan "I wish, I really 
wish, that there was a way to free things on error". Am I right ?
>>   
>>       /* URI is not suitable for migration? */
>>       if (!migration_channels_and_uri_compatible(uri, errp)) {
>> -        return;
>> +        goto out;
>> +    }
>> +
>> +    if (uri && !migrate_uri_parse(uri, &channel, errp)) {
>> +        error_setg(errp, "Error parsing uri");
> This error_setg() is overwriting the error migrate_uri_parse already
> set, so just drop it.

Okay, I got the point. I thought error_setg() would add error statement 
on top of errp, but I was incorrect.

Juan also made the same point I believe. I will remove error_setg() in 
the next version of patchset series.

>> +        goto out;
>>       }
>>   
>>       qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>> @@ -433,6 +479,9 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>>       } else {
>>           error_setg(errp, "unknown migration protocol: %s", uri);
>>       }
>> +
>> +out:
>> +    qapi_free_MigrateAddress(channel);
>>   }
>>   
>>   static void process_incoming_migration_bh(void *opaque)
>> @@ -1638,10 +1687,16 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>       Error *local_err = NULL;
>>       MigrationState *s = migrate_get_current();
>>       const char *p = NULL;
>> +    MigrateAddress *channel = g_new0(MigrateAddress, 1);
> Here too, use g_autoptr(MigrateAddress) and drop the  'out:' block
Ack.
>>   
>>       /* URI is not suitable for migration? */
>>       if (!migration_channels_and_uri_compatible(uri, errp)) {
>> -        return;
>> +        goto out;
>> +    }
>> +
>> +    if (!migrate_uri_parse(uri, &channel, &local_err)) {
>> +        error_setg(errp, "Error parsing uri");
>> +        goto out;
>>       }
>>   
>>       if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>> @@ -1688,6 +1743,10 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>           error_propagate(errp, local_err);
>>           return;
>>       }
>> +
>> +out:
>> +    qapi_free_MigrateAddress(channel);
>> +    return;
>>   }
>>   
>>   void qmp_migrate_cancel(Error **errp)
>> -- 
>> 2.22.3
>>
> With regards,
> Daniel
Regards,
Het Gala

