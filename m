Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B446E1CBA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 08:35:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnD0B-0004Jx-8q; Fri, 14 Apr 2023 02:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pnD02-0004J3-JS
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 02:33:34 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pnCzZ-0008Ue-6W
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 02:33:32 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33E5p3i8020152; Thu, 13 Apr 2023 23:32:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=IbINLYl/uA+B+/6QThyxthdNeYIBzlv10DgNP05a3jU=;
 b=qnwnoaSrOdyWzTdz1saQarx3EWh303T6RtgpGUCGAc2MmubmRZEz4uGbi1x2u5Z3m8FA
 dETPjP0ySo6EpyNoUv3F6YJWdsJ9yrPNp9+zojkqwuWdx6l/C8hlh5GtRHeZpCFXrNPX
 FzmzV1qBthEtMs0Cs08zjmu649Xftl3K0NXB7xQj5Ad+bzOf4LEUAaSyZvc30pOWsiS3
 e16FjEslffyy4DLuwWANVuSaBNJG+1zlj534GQXK0eP80OOxYF9vHh1dl7rjqpT8dmd5
 NclXlo+GitbtpN+fklnU4oRHqpitx7ufI3LocztOJilat6Y2dZyvd/teZ2i2GrSL0mA0 CA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3pu46ac7vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 23:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUYoH2j8rSnNPqymZwBKV7IfNU7YiluAsn2tZovMQY6oFizD6JT/mchVkOys8+ePdGbyFAOUHpBWIBb731sfqfWhz1/AgFs+h+YM7WCf5w7zXltlTOHFAZajtc/f7P+zNg7JrBct+Cnmb2QYW3PavDcwtZP2eUYdDsNn8gw7Av+efGjlLVmROc9txECIZFFrcI8GgMxIcm8eCRj5mZW9ReltFm4K38V8y7pO41UJw/plYEu254X7zAjAYsOYjM1r+3Z4aeS6D+sGFzAYSoDZCSQgg0IzJ/eTePup2vfwZJY+L+wmGGzBd59wSKG2kMaeTXeMrOIGKg8CGtuyQY+boA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbINLYl/uA+B+/6QThyxthdNeYIBzlv10DgNP05a3jU=;
 b=RprkCdc0Cy9X26hJZP4lHOmdOjn06RmWBQbf4K6L1HfvD+XdM/pwIYiY6ptYGhWStDtQhZjwjHvuJqjdZBiaGhz0sTQLi6QQzYSQBLiAepNgbKIXqOeNPdmz89f3jABB8J/FeHF6X205Ok1tgZ0g5F8WYiVQvb/AmuA9hq/XKoIx8DfNrK526j3RU43sNlLu1Wbiwij0hDAx/vjylFVjfm3h//V0K1bAwTCHtLxh6wOvDbsCeu9OHDviL50s/7McNyHrghBlM81F/I1rKjr3NqNxOIonNNT4yUBkm46NbkDg67FBWXRtXfGyBlkpJn91rnrfN3N9Wz9AIDa81deDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbINLYl/uA+B+/6QThyxthdNeYIBzlv10DgNP05a3jU=;
 b=QPa5+gFUFKfWTKAgG56Mn31IvCBjIIssm4tuuWld1qUHgYCdZVvKDhR9wXCciwIHsOx4ewS7S9MAx73sXJ/ws/cyHN59Ph75JfEXA9Uf0s1tR9mBOLkKJnaHpvbGPUdcc6PbpJfdxXc0pDnrnTvVekOj21XWpELDdTZ4LbCvuVpwLYEAXkumji18i70p8jyfC8UuE2haIrkvBEC26hKj9bvpvVzGnfLt0674N5vG0plXA/hjqFjNotml+i25+fnPZtF4sMFq0z+c3lVWMc2Fx3rE5hRCDil6uI9kmEgFJM2WyvE1Pys/bi3l38Nqh86FERKDB09e778AUhc22PynrA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM8PR02MB8248.namprd02.prod.outlook.com (2603:10b6:8:6::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Fri, 14 Apr 2023 06:32:55 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::3a8c:a7ac:ec02:b357]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::3a8c:a7ac:ec02:b357%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 06:32:55 +0000
Message-ID: <c12d88b2-7e04-79b5-d195-919c32c58e61@nutanix.com>
Date: Fri, 14 Apr 2023 12:02:43 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2 0/3] qapi: allow unions to contain further unions
From: Het Gala <het.gala@nutanix.com>
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <20230223134027.2294640-1-berrange@redhat.com>
 <87v8ize5j3.fsf@pond.sub.org>
 <deee0bde-86a7-5264-550b-a8650aaec88d@nutanix.com>
In-Reply-To: <deee0bde-86a7-5264-550b-a8650aaec88d@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::28) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DM8PR02MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: b464d752-a150-40d1-02a8-08db3cb21429
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R81t6+Edm/wufqM9MqPBq0lNUTrwRVIrNvXcZEwhtmfpzjSsQxoSOSRqIbjJOY0C7wUb1DQ+FeHKod+v+sklm6or6JMoXr3EWNKL6omYc+6Ss+ShiiK4akJnwxDcmujUDabuKlrlLELjOFHh2GE/q8kd7SXZS3lr0VhdMjUAJKsF+1cCR8Nga5Q1+eGlwcBDW3M3iq8/iXeVfaxknIo2bSybfVR3hsoNkVt58xyrEZmvI+sE64gzWV9FpK0hcRixvGEm/66uPS6ZP3PwtJZA294GadI4GKLTMNjAmAMMgq+pXUfSiYfF1dWbgNX+6gDaohavJ/EOKsr7C/VdF1jJzHoZIhX8nt1FjDB99zqYjDUR9RvzVpvxIS9+OX4WQeGYJqf8wk+fKcBWta9p4YxwX7AN0EKItdZri3lJnGslhx17r/7642gocmLSIyFgF9+QYxRfmV6g7Rf8dCrYYjz8SN+Ayx/mQyrX2yY0w7SxtuQ2lmohIAz5xU7GI6WBvJH5yujrEmq350EGEPpHDfrWgjyFk6l1WyDo6RyICeAxF/z5zdgpWeWBXBfiAxd6tLJyTYJFkYtZZBzTizcxmAqkteTxaklfi0CQdo3cCAdqaUpWGwMM1vTM/IH9nMn4gnBo0w4fBJjWyBBf2Zo/t9hY+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(83380400001)(54906003)(2616005)(6506007)(6486002)(6666004)(110136005)(6512007)(26005)(186003)(478600001)(53546011)(44832011)(2906002)(36756003)(38100700002)(5660300002)(66556008)(41300700001)(4326008)(66476007)(66946007)(316002)(31696002)(8676002)(86362001)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWtIOHAzemRvV1hsc2E1WlJuV2l6RjFtYUc4Nm5rTytWbFpOM0FZVVBxSjFm?=
 =?utf-8?B?UmlDNkl0Yy9ndG85VVB4RDFBL29WQVplSllDN0JTMFRnZE9PUDlCZGpKNi81?=
 =?utf-8?B?dER6dEFFdFRhNnFpNVR1SFFCMTVJUVYweXF6cFJ3U0FjR0lFcFhzUmhuYWg2?=
 =?utf-8?B?eU9QZ1p4RkFib2V1Y1YyU3ZYTUJRc3VSTEZOOUZ6RVd3aFZMZFdWUW9wZUxr?=
 =?utf-8?B?NGsrTkV5RjJ0ZGdoMlhmRWJHRE5pOEZFY3MxTnYyRzRHeEpUNzE3WkRTSkFN?=
 =?utf-8?B?Um9OZlZCRTNveUdyZE1FcWJJRzJ5SS9xNHk4TzVyOU5RcGdPV2VOT3dPMzMy?=
 =?utf-8?B?MHA4S0J2c0RSUjZuYXdSeFNPLzdjUm1uN2tyVGpKc2QrYnpNYm1XQ3N3K29p?=
 =?utf-8?B?K0VJcjNvSTZPWFVTMkp0RmpYQ05TcmZ4bjJqcUo1RFIrQmR4TGsrS2pkNFJC?=
 =?utf-8?B?V1ljcUtZWWEwa3dRbjZrZE1GM3pISSs4eDFrZ0h6b0wwZTgxOGgyZm05b2l5?=
 =?utf-8?B?WGltclR4TW9LVWM4WGFya0lFQzFqT3I3QmI5eVJiTnkrZEljdkpra2l3RThj?=
 =?utf-8?B?L0NOUjBYYmtMaG9EQnJEYlhSNmtJTFJJclRWSHQ3VFFoRzRVVE9YRWtjRExl?=
 =?utf-8?B?dXRnNWJuQklTSjB5N0RIV3RLYzV6NFc1QjRaR3lKSS9wRU5CYzRCbFhhV3F0?=
 =?utf-8?B?K2lyS2NnM3JpQnluTFhueDBvc3ZZT2N0djdYbis5QmJMaENMY2FoR3o2eU5G?=
 =?utf-8?B?NzVGOGhoN2M5dUNzL1ArNVlDQVRRbnVISEk0ZFVtODJ4WWRVTllhQzJyRjJS?=
 =?utf-8?B?cFhyNVp0SElyalhub2VFbmtwK0VqK1JVZW9SN3c4Qy9sRFZJeUFDUjFSOW56?=
 =?utf-8?B?MEJraTdwTWdCQzBPUHdQUGlBMDdMbzlJOU9wNVozU2Fqa0M2aWM1cFF4RmJ0?=
 =?utf-8?B?TC9tb25HWnp4aFZ1YzByNEVpdWZheUUySzI1bThDQzVzb21VRXdCdDF6SU13?=
 =?utf-8?B?QTVHaGlFcUQ0SytnNWZ1aHBaMW53YlA4ZnNsektIQUV4QXBsOTdkd2ZzQ3FV?=
 =?utf-8?B?Um43ai9hbENYaWlPWk1mdWkvUzhDQndnMGFSNE01d0YxaGh1N1VWMFdEb1BX?=
 =?utf-8?B?RnFmeW1ZTHl4MkVIaEErN04zcWg4c0FuRHhhWmswYWg0TENaSW84bUVUTXVP?=
 =?utf-8?B?dDM3YkF4bUlaRnB3S2pLSWduc0xTSk1EYVJGTkM5a1ZwSDFSaUVndEF1REpu?=
 =?utf-8?B?YWlkS2g2VGhSQWJvS0J0SGtYOG9zMzFvSk5DM2NNbE5zSkxFYVNGaXV0Tkt4?=
 =?utf-8?B?RURJTEJaNlB3UGxINjJrSkZYT1BMc25xa2JSUldOL1c4eDQzeDFxZzYxRHoz?=
 =?utf-8?B?UitpZkxuRmRXTjF0c2txd3paL3d5SFcxUDBpUjIyV3NROWYzNzYvbE8wTDJW?=
 =?utf-8?B?a2czOTNFNzZ0eXlIUkwxaTVmREVOSFlYNDdxazRzVUVFcEhXNE1LUHV0MVFz?=
 =?utf-8?B?eE1CSmdBalBPVmNKTnNzZDd6NllTMDVaWE9FSkwvVTg5ZlBvdEsxNXpzNC9v?=
 =?utf-8?B?R1YzMW5XdGUxWllLUS93ZnFJL0ZxRVprN09yOGdoZno5QXh4eUV0YldCNW5p?=
 =?utf-8?B?UXNTSGlFWTRXTjJZMkc3Qnh1WWxZWVJJNThJUzN3QVZzSkN5UVM4TUZ2RTdu?=
 =?utf-8?B?bDNIRWZ2eXc0MGZDOEg0VVRmeFo4TUdEbDFLdkpTNGtkNDlHMEJQeTI4QWpP?=
 =?utf-8?B?Mlk2ZUdIU1QvYUVXckR2MTZJa0h5SG92dml6aWpVcXVMQjFLTkl0b05FRHRo?=
 =?utf-8?B?MmlXR3dQWEh0VndzaEM3eVI2dTFIS25PUTMvZTFYczhCc1l2Z1BYcG1mUXEz?=
 =?utf-8?B?KzVObjUrTk9GOGpLck1xUm40ZVJCTjBLeU1nUEdWY0gxeDJiSE1WNXlWL0Nz?=
 =?utf-8?B?K2dacVV6T2xIcXNoc0JlcU5tK0dRdFFSeG0rcnFLcW1pRk9EQ2VPVnhkSnNC?=
 =?utf-8?B?Zk5UU2I2NkhQS0o2VzJHaGlITHRGVUt0c2t0WFMvOHp5NG5HMVNKWGc3dll6?=
 =?utf-8?B?eDZmQ3prbmtsZ2laenNUbWFBQU1LRDZ4VlBVck41Ym90V3hxL1krZ2k0azAy?=
 =?utf-8?Q?P5Nyn/9ehB+EVStL7oN58YyLJ?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b464d752-a150-40d1-02a8-08db3cb21429
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 06:32:54.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SegUd38aLchm1ABwnopZhmXVaFw0WX2/DC8PZ2c0l9jlm+akZ3mQuV2RjVfKenJVAM93iCknWvvSyiaKHzvpnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8248
X-Proofpoint-GUID: sSdxeIEck2fzIwAXNnwRG1CYsOX_iWjx
X-Proofpoint-ORIG-GUID: sSdxeIEck2fzIwAXNnwRG1CYsOX_iWjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_02,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, SPF_HELO_NONE=0.001,
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


On 31/03/23 5:19 pm, Het Gala wrote:
> Hi all,
>
> On 17/03/23 9:25 pm, Markus Armbruster wrote:
>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> Currently it is not possible for a union type to contain a
>>> further union as one (or more) of its branches. This relaxes
>>> that restriction and adds the calls needed to validate field
>>> name uniqueness as unions are flattened.
>> I apologize for the long delay.  Sick child, sick me, much snot, little
>> sleep.
>>
>> PATCH 1 is wrong, but I was able to figure out what's going on there,
>> and suggested a patch that hopefully works.
>>
>> PATCH 2 is okay.  I suggested a few tweaks.  I'd put it first, but
>> that's up to you.
>>
>> PATCH 3 looks good.
>>
>> Looking forward to v3.
>
> Thankyou Markus for your suggestions and I hope everyone is in good 
> health now. This is just a friendly reminder if Daniel is ready with 
> v3 patches for the same :)
>
> Regards,
> Het Gala

Hi, this is just a reminder mail to check if Daniel has plan to post v3 
patches in the coming days. Would like these patches to get merged in 
qemu as soon as possible, so that we all can focus on restructuring of 
'migrate' QAPI :)

Regards,
Het Gala

