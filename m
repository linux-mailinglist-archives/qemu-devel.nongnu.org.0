Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0C4B8060
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:04:37 +0100 (CET)
Received: from localhost ([::1]:50640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDQa-0006J2-8h
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:04:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nKDN3-0005Ud-Qn
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:00:57 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:50014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nKDN0-0000bl-7D
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:00:56 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FNG5Q8019005;
 Tue, 15 Feb 2022 22:00:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=JxapR4NUiXsIr4jyKT7SImi4fCp1/Gk8ZbEuxxdJfHE=;
 b=kPSvU1rIL7tndfm33nF6zCc4zy/NwnuFnj/v36lkyKtCaCVaqq4FIAKqbRlhm0F1LZb0
 x5BZOMcSgCaEAOqlYk/bLUiufL07T/WXvcw+flOOaxirFUz96BtERkOYmHWXItTihHY7
 261NV59NeRg+704oNtA/37t1vn0rWdz6FzJh+NiWfkMWTt8+fEsXnM3Y1FjrNWTsvQ5/
 62ZZCaG6niLUJ2VBhC/UPMAKCj2Q5DDlV2eI4x3DNrXUMYedNtN2q9T/QnzwWMXtbWs9
 QS31HMSAzotycq0CVpatO9/vNI02ddxY9R3NqHxBP9umUAgNuS/EHJT3ehJJ60Yx1E1r Qw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3e8npugjhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 22:00:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMNIEunY0F2xxIaD8U6oQyNzbFWBCwduqgb60baH7oqTt/aFLx2inaBonIYhSfv8XP1exsdnHaWmegiVbh7I82RPSsoPR5Jizcv/Or5BZmpRgdEIlrXkW5kdizu7RYv19OL4+DLGen5ins8ePEI3FMP+qCHsBHZ5Dwau4WQlngJ2UV44VLOsxOOj2wvzpNQ8DeItIVsadFmQay2hboioAm6Syziwoux9N2pjPCbbw+JKV6RJGbmlHLLmDGSOE32SJCZX4pfmVRlrRwzqThWAy7cZbiV3gUPzfQPeo9893q4S5pwQokLUb0HAjvWdtZ30JmwLjIjwrv87yVR6XOxp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxapR4NUiXsIr4jyKT7SImi4fCp1/Gk8ZbEuxxdJfHE=;
 b=DxCHm4yXmBLzYD8rhUWiCnEH3M19eiqsWYO9eErILfo4a0ti5s6duLQqtBGyo6TqE8zUF0QxVV1VuJB63qIeX34ek8FFLP2W/caGsSk/3eiRrR/sHGDcAwElbghHak8FW1SdoQFj3T6NK4Jt009h/M/Z3PW+G3ZWguwfGusr2XkY854aXjf4+3164JOEtbDYEnXXHdA/t1z8im7beVSHMeOLkuf4rUMhKW0jEJq04skKLEUuHRQqM+tBkvSdLgDwpapVZPvOFoON9YZ2Py9kWtx0vZfD+R54EfDK+yqu1L2A/F82pw03iq9PSfKtamWfcJJUlsJq0HScMeQ+aw+FUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com (2603:10b6:a03:3f6::16)
 by SA2PR02MB7803.namprd02.prod.outlook.com (2603:10b6:806:142::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 06:00:47 +0000
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::f58f:2ec1:820b:19f1]) by SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::f58f:2ec1:820b:19f1%3]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 06:00:46 +0000
Message-ID: <5cb4a936-6277-5466-638e-d67f9a75f06c@nutanix.com>
Date: Wed, 16 Feb 2022 11:30:09 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2] Check and report for incomplete 'global' option format
To: Markus Armbruster <armbru@redhat.com>
References: <20220215055138.267904-1-rohit.kumar3@nutanix.com>
 <87sfskeatx.fsf@pond.sub.org>
From: Rohit Kumar <rohit.kumar3@nutanix.com>
In-Reply-To: <87sfskeatx.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::32) To SJ0PR02MB8564.namprd02.prod.outlook.com
 (2603:10b6:a03:3f6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f30f5f-af11-4f08-8191-08d9f111acae
X-MS-TrafficTypeDiagnostic: SA2PR02MB7803:EE_
X-Microsoft-Antispam-PRVS: <SA2PR02MB780376294BF730C38C6B9E36D1359@SA2PR02MB7803.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zz+82arrlTqnwz9dywAQE8Aq8opEYvpZhGLnIguxohseu5VgkdrWAC3PBKXWjqtx/VlSHu6x80HouwUuBj7wNIDJqSrZxt2iw6SFAGUFWaoA70cIR3l2gdkNcc9aCxLzUUFcyIl3xwmo2afl3gpFMsVPPlMdz6SM85bfhJM5crgeLQJKFTSi7B6PK3k00/UwK3AiuGDRzhDzw0SZXcV1UV8iGvnUtSbEuca1UfQpO1NXQtq+rSDElzuktIaYgFr7qLUfMd0r7H1GLfrzIjha8cma3latMnQJGA5YmQJd7Fqz0L0xg8Ru1wJgaVQ3SO3e99Uyyrezo9C+sRmQd2Rc2vdozFRFzRbjgefmizi2fk6nPs0tYmvsZKnYykJdTQ6RtRXSzBJKTqNq9X2GYjNlN5h3pFd6mQGY1Eou0xC+jycB9y1YwEB2Xfo8kqXgdYq34E6+auxSuHDpwE74i1+JqQLeqScPE/B9nn/6zIADxoEWOh2fm1pcmslKVNqVlgGAyi7pIOg0wZ4AFL6leSVqtf6bGPMaSRZUw64JxZ0NVnFHEc1hxfs6wzfVpt8W0KnqC29ykmTrde3+sJC7zwvop2LwMy8lthKX+snNhIra27biyVIH5FJJnv6Y7Ej7r7Z9zH+sdkp+uFj1u2nQvCoBP3WnTvVUzm+eexWBJ8/GqY2ycX89J3KOkNcOP6CR2nryyE9kUBMfnTRB5+Vq/RloPuLd0cnfZzymZLDUPaIutCiBn/byLVl5CyGtBTcSO5dY1smLddVTxER8Mu7qf9tHXdq8OjEF7dU+JwZlfbcdwl+nq8LbMy3Qlak0OWIOVx0qb8imqf60r/vR3UViF/cAEYRx9qr17PIrzLqCjOW3Ycg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(186003)(26005)(31686004)(107886003)(52116002)(53546011)(6666004)(6512007)(6506007)(508600001)(316002)(6916009)(36756003)(6486002)(966005)(8936002)(2906002)(83380400001)(86362001)(66556008)(66946007)(8676002)(66476007)(38350700002)(4326008)(38100700002)(5660300002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFRMEJxRDgwUXlCeUNyYlorbkpYVkFsbGExV3FHU0pUd0s0aE51QS9jKzZr?=
 =?utf-8?B?dVZVbXMwK0xqVmRNekUzYUtPUWpCVjAzRnZjMEozMmxkNGplQmpEMUYyRkQ0?=
 =?utf-8?B?U0hycHZvWmU0YWFGNGhCSFVBcUZjT1Izc3FqaFFZVmRHSHRUdEY4aXdjYlVD?=
 =?utf-8?B?WUJjNU5veEkzNVpSZWpWRW43OGJhMXVBcElLa0UwbVByN3NCTWk3UStEV2Ni?=
 =?utf-8?B?aFJrYmlDN2VpVTZFN0Roci83TWg0YjgrWWlIb3pra2w2OHFPaG5VRmFadStu?=
 =?utf-8?B?QldkQ3A4VGxOY3pHeThLYXlHZHRqVEVzRzF1WmRrd0F3djh3WEZrOHZvTHJa?=
 =?utf-8?B?c3VDSnNsTmZpcFpTOGpKMGFYMDU1SHB1SlRxZzhSV0lHcFpFeEhEWHBDQzJm?=
 =?utf-8?B?bVhlbVVMZnJXSHR2eXZtR1VETXlVTUNCRms2dmk4QW9oN2ROUHc2N2hLM1Rx?=
 =?utf-8?B?MDQ5a1dVSDJxRFIvWEdsL2grK0pqSDEwem5vaGZldGJMSHFqcU82cTQ2YmhY?=
 =?utf-8?B?ZkdYazAveGZwYkwzbmNtV1hKRFpBd3hJMFQ0alR5SCtKZ0tlVXc1K0VqYTI4?=
 =?utf-8?B?OWk2ek9FMm9uMFNxTDdFTHlKeUZIUkVWSUM3UVczc0xQVUNpTlRoeUg3bjdm?=
 =?utf-8?B?alJpYk53QzUvaERiTmY2a3c0OEw1eXhzeWJUOVVQblR5dTI1M1JzUmIvVUY3?=
 =?utf-8?B?M2RRZXhwcHUyTGlrZFg1Rm84R0ozSmxGV2M1a3ZiZGZuNHg0Q0tUTDJGOGpu?=
 =?utf-8?B?TW4yQ3hSbDZBNjVSb2Nzc2VySXZoWlQ0WWJlUExsMlVZTGhIbzZsZzlqREk4?=
 =?utf-8?B?MXZmWE1CWXZjd2cya0JGSTM5ZVVtakhCL1RyNWE1T3J6ZmxpOUNZcVpodUdB?=
 =?utf-8?B?c1ZCTEpjaXFQck1zTHM3bmNxNHV0MW1VNVNLbVZNL1JpeGdHQU5ZWGcybE5t?=
 =?utf-8?B?TGRmOFNuTDZFVGJWN0FtMkRYKzJZaVJlL0d0SmtqYzlmS2tBS1BUMlRsamlD?=
 =?utf-8?B?Nkxqd0FIQkcvMkhIay9zc3FiY2VxV3U1NDJGb0poUXB2NEEyOVFDd0h0azBp?=
 =?utf-8?B?N2VMMDRuRzFoRDlFTmRpZ0tRRHRTRitkd2RGQ0xkZjFEd2V3eTRGTytIS1I1?=
 =?utf-8?B?TUkwQWNUeng2MDFKVmFXWW5Iai93aHp0NllEb1AvMmtQVmVxTGhIa2xpVk9s?=
 =?utf-8?B?UCtYZTh1b2lvQ0p5dERSR0NDWmZEd3NLNTZ2NFNGRzJoU0NmVUt4a3dlVm91?=
 =?utf-8?B?S1JJOXR0V1VQdEMwT3dFQ1NOb1RkdUc2bjNkcE02alVKajY2K3FGVExrbWI4?=
 =?utf-8?B?TE14N2VFVEVmREIvZVV1a0g5TG96ZGlVSExzYURnN0ZFOWttSjlSeGZuMzZV?=
 =?utf-8?B?YWN4ekJ6YUtDQ2FJbHJyRTVMcUo0RGZrbWtZcUVzelZ4dVpucmxyT1BNZVN6?=
 =?utf-8?B?WXYyb2dnb1dyQm40SHc5Mmh3Zm5HRFVJdzBKbWhsVkMwYVJOSmd3eVZQdFBn?=
 =?utf-8?B?R0tESlprZDJscUFJWHorR0VSM0NjZXh0bUVNS2N5cm50SVQxTmZIdnpxSm1T?=
 =?utf-8?B?Nk5YT3ZTQjdHeEI5OTg3Qzlnc280NDArY3Y3VjV3a0YyV3p4WUlMWXp4YTJQ?=
 =?utf-8?B?eHFYYXY0UlVDbCtEZkg0VVhiQVBXS3BJZ2pha1p6OVg4NVhhU0dyRmZNNFpa?=
 =?utf-8?B?dVJTR1B6Vmk1VVNZMzRZWEhSSUkyTCsrY21rL0hDYkd0K0x6RU5qdDNCZVBX?=
 =?utf-8?B?YW95d2sxd2tKSUgrK2FreEpIL3pCeXNqbTduMWtwbXp5MnRMVklCc0NhM0xB?=
 =?utf-8?B?Wlp6bXQ0a2xXQ2Y2R0dhdnZOaHU1VmFjVmt3RXlwU1BaT3ZYZEJoVjNSL2h6?=
 =?utf-8?B?dEJ1MHE3SHBVOTFFRUJqRDBHWkxuZUszYm9adXVMSHRodUZsSXRGZVQwM1dt?=
 =?utf-8?B?VDcwU1d6Y0ovVmMyeVVKUDM1d2hkdGwxNnI3RVNuTlhWTGFCdk45YzVxbWxs?=
 =?utf-8?B?UU1pR3k2Z1Q0WGlZSVlJbEc3dCtvSlh6dFkxQkVqVVVjR2VpanptaVg1MjBD?=
 =?utf-8?B?UUVIZXN6RHpBODRWcUFkc3g5TzU4N1Zxb0x4bitaaFNlM2Y0WHc5Zml1Vzdt?=
 =?utf-8?B?emJaenFIZzRaS29Db1d1OGJFY1RPM0RVNHM2TXZjTmxFUFJ1SGxLbGludk9h?=
 =?utf-8?B?UEFxQ0VoM2haMWNsWllWMGR3NHA1S1NTcjRobkxpdnYrVElMa3hZRW01OGwr?=
 =?utf-8?B?Q3lpRXJpcStMQ1JWcm55VHpHWnR3PT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f30f5f-af11-4f08-8191-08d9f111acae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 06:00:46.6147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Loxs28CkOYV0Qyr9mApEHbj+GwJafYjEJ/xOr2js12IRh8ORhx6NaQWIGGjLJFLXY9AMggxUCI2cilUKZMmIZvnExAbWA6rK+NyJFDvE5P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7803
X-Proofpoint-ORIG-GUID: 4-URqnYKIvlLgetSwXZfKwi-D1EDZ-8K
X-Proofpoint-GUID: 4-URqnYKIvlLgetSwXZfKwi-D1EDZ-8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_02,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=rohit.kumar3@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, prachatos.mitra@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 15/02/22 3:00 pm, Markus Armbruster wrote:
> Rohit Kumar <rohit.kumar3@nutanix.com> writes:
>
>> Qemu might crash when provided incomplete '-global' option.
>> For example:
>>          qemu-system-x86_64 -global driver=isa-fdc
>>          qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>>          string_input_visitor_new: Assertion `str' failed.
>>          Aborted (core dumped)
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_604&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=ABSkr7gy7ZTfApFfI-Xxt1gZNtsDDiXoXOXc0OrkyFs&m=YfuOt9ozXVjjleGOXTdWK4Hu8PoU3kTzGTXAJ223138_AM934NRnuqUQHpaLSWTs&s=WEGcm58m7pR4XrWGsUvHOVPj18ym0OrlAObwY_CfKlc&e=
> The original qemu_global_option() only ever created QemuOpts with all
> three options present.  Code consuming these QemuOpts relies on this
> invariant.  Commit 3751d7c43f "vl: allow full-blown QemuOpts syntax for
> -global" (v2.4.0) wrecked it.
>
> Let's point to the root cause:
>
>    Fixes: 3751d7c43f795b45ffdb9429cfb09c6beea55c68
Thanks, Markus for pointing out this. I will add it in the next patch.
>
>> Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
>> ---
>>   diff to v1:
>>    - Removed '\n' from error log message.
>>
>>   softmmu/qdev-monitor.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 01f3834db5..51b33caeca 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -1020,6 +1020,7 @@ int qemu_global_option(const char *str)
>>       char driver[64], property[64];
>>       QemuOpts *opts;
>>       int rc, offset;
>> +    Error *err = NULL;
>>   
>>       rc = sscanf(str, "%63[^.=].%63[^=]%n", driver, property, &offset);
>>       if (rc == 2 && str[offset] == '=') {
>> @@ -1031,7 +1032,12 @@ int qemu_global_option(const char *str)
>>       }
>>   
>>       opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
>> -    if (!opts) {
>> +    if (!opts || !qemu_opt_get(opts, "driver") || !qemu_opt_get(opts,"property") ||
>> +    !qemu_opt_get(opts, "value")) {
>> +        error_setg(&err, "Invalid 'global' option format! "
>> +        "Use -global <driver>.<property>=<value> or "
>> +        "-global driver=driver,property=property,value=value");
>> +        error_report_err(err);
>>           return -1;
>>       }
> This fix isn't quite right.
>
> When qemu_opts_parse_noisily() fails, it reports an error and returns
> null.  Your patch reports a second error then.  Reproducer:
>
>      $ qemu-system-x86_64 -global =
>      qemu-system-x86_64: -global =: Invalid parameter ''
>      qemu-system-x86_64: -global =: Invalid 'global' option format! Use -global <driver>.<property>=<value> or -global driver=driver,property=property,value=value
>
> You should do something like
>
>      opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
>      if (!opts) {
>          return -1;
>      }
>      if (!qemu_opt_get(opts, "driver")
>          || !qemu_opt_get(opts, "property")
>          || !qemu_opt_get(opts, "value")) {
>          error_report("options 'driver', 'property', and 'value'"
>                       " are required');
>          return -1;
>      }
Ack., I will update it in the next patch. Thanks.

