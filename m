Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6363C2D2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:40:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p01lE-000702-Va; Tue, 29 Nov 2022 09:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p01lB-0006tl-Mb
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:38:57 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p01l9-0000iL-AW
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:38:57 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT81vd0031674; Tue, 29 Nov 2022 06:38:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=nLoM0hw/esPh422z6b4o7GVoCWMBaNmwIlalT6pKA2A=;
 b=injQpHwKy27/UEUWXZsNFJi7KrdufKh1sOjE/H14d7KEmA4K0LIZPkTXy3r1O2ezibnd
 5ORVR7LBcbrlY7Lo7qWrebIk61uHKyaddR7oVNKPUJUP+gCoNUBwXBCM3rSkOTTpyptr
 EMTTzEuOjEz6oLp533aDPRjteP/npJnC1xPBrnHj8C46WnKa9NyI8T43yTIN5F5BHvZo
 eOO1IW2co5FKYGUtwORO5deKdFUKnEpO9xvJuWscz1ln/T+blQTc5nQv29sKcsixnp9e
 6eXTBAp97m8r+DuF61ucSWbl3Q1SFfOxcbmsx7X7wiTM92bQShXYAcQ0Jx7NPLBe7kpR 2w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3m3hsqqdh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 06:38:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiEG1Su2sthThjVvieKby7UXAIFGSBoJRaLhONMcZrITH19CFBT23LP4Kxnh0O1Gi2GFdYw2xNFgsnfPmV+8zPJOxprKMZWnsNwpiCS6KuU+kyZZU2rNIKQR6MrRyBTh8PYp3UFVH8ENAqtySAObMvVw50aoen9kdjNg1VHSIm1pIaUk+zWPC6xkRsEnwOs2bLfUTi2sWMynG9SjxeSNCYnlafeZjqyIkfRTLIhXVML2xvNG5XnHleYY86bnW/6inflTgcUagm6JLyLBuj9DKGGIc5Z1lVZC6DvP0TrI/xrWWfKmhUlNhHorh05mzZU2zN22FbjDbqbYTbVUR8wf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLoM0hw/esPh422z6b4o7GVoCWMBaNmwIlalT6pKA2A=;
 b=PG4bGI1YgvrB13PW1WXYVXhtWL7CE4jPpSyAyMyajxpdkEIN4jX7IhYKi+sIIlP883ivZ/qUubUL1X4w4Oztkczx89y7KZZ/Q+EsLUpeWv5J4De7WkSERQ28pG9UsOCcCAZH0vtGGARmD7Hc2ukwnQHaUcEfPHw7aiX4gF5TfMq/BBjfPMQBUVTMaCn/wlwQcBsnNKXThbGuxM36ufZkjUlfFClL0g0X6UToP5dWmlCzBbqT7OQ2l6VZxDpFjbYexZFC/uEoxIwW5/m9uDkkjeJRCgXNXMp+nh3dnxzoXZRn3HkmEGXLMVLQI3xIEBbrHlHWJky9EfoCG0Z+3los+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLoM0hw/esPh422z6b4o7GVoCWMBaNmwIlalT6pKA2A=;
 b=TZJ0tDR58R/+U573XkB906il7WFgXS8s+I2afDt7bBO1fKGkZlk4EYRTfC4CO+eVRnsd31cH4hHTvMfworuNNzQPFPpGedndIwwfAQISj0gWGNlSxgvUXPZbV5Rx2cbanjPn0MMXM4Pm8IOaKl15Eb4Ej9wwmMa7c9QpMijlUZ3oOeFMZ8GCo+WrI8JuI1ABKI5RYpK8HXPFQGylSYenEerfDAuszyp0PKErGsSlzpBoDmjKpNlS/AkH0EOcOJGIgVKFF3H5HEoVvdFVytqv/67kMZBFpNedG2hEKL+qqbj5OCTrs8RH/kO8dQhU8ebp1u9KGDas66T/F2tAbSXZuA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SJ0PR02MB7406.namprd02.prod.outlook.com (2603:10b6:a03:290::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 14:38:50 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:38:50 +0000
Message-ID: <c4891b94-87e1-24af-2057-aa321e207f39@nutanix.com>
Date: Tue, 29 Nov 2022 20:08:39 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v5 1/2] io: Add support for MSG_PEEK for socket channel
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221123172735.25181-1-manish.mishra@nutanix.com>
 <20221123172735.25181-2-manish.mishra@nutanix.com> <Y35gyiCk/Kjdd1Lq@x1n>
 <aaf17b45-ea8a-cd93-008c-b43b68532ef1@nutanix.com> <Y4YW3fRvTYULGLTd@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y4YW3fRvTYULGLTd@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::12) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SJ0PR02MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 933dd52a-4ffd-4701-e5ad-08dad2176df2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sakd8jRykEAk0Yu/eXrEOpx+5jzWC82IMez8Lf0jOzq9YywO1lcRmgwSaUa/4Hujxakp2m+GLZBvkyZ8kdB//4CVgp5TVA0rFRQvNtJfmpzFld/EiFZpTzJ3VRZVeHGRbSCWoO9kZGMj8r54vuhXUD9F3cwC/KVjluWKRh45FLLcKtlu/HvF/JoUv/KfXOTT2u9S8Lj0vqx7td/PnaNoVG7R0/T1Kd+taDozr7oWvuYa8VHICN/TFVXC6j1RTw9DTOt80jk0s0PSI3EICm8vUMjHORN6syNBNAIz1mkAdB27OXtG7hMocqHck8duChBFthDsSzQ1YBTCP/G1XVbnjzjxByJl5tHvQ99V5F/hTlLaESOZEzKwY/hkSfS6yVdEqTNMaT4GgqZlkCKsS3L5hPygOPh+4HzZeNBBk7McwvHYPyI5S0aymdtttSGlvVLFCSmFAm+6VyXE889JiK6Dl/CtgvJv5JxWG+uSnmxpVDnm4lM9qnIz0Z2KEHrG0PviFy0OxSlUwKC9XtEo289HIpbwvxot33/46sLunZgtEGUgKm6DueA9a01iZCrMIiUBJK6ZsfTk/svX5sew6yMOHyafeaoyVcIMx5FxDMtFQnT/6lHFyG6ty5QhKnQYOW+R7P1WiFe44wxvWgU6/K/ErARS7lu5dtnxBR0Qzny5c64zfYifCKG9Emw/qymtf8ZqA4r02CcmROlIXjVu921yoY3JqAO3j2CiDo2NPz5WkWgFl32nBsxw99BqdP3zWaYc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(31686004)(66556008)(2906002)(41300700001)(86362001)(31696002)(83380400001)(966005)(8676002)(2616005)(6486002)(316002)(66946007)(6916009)(36756003)(478600001)(38100700002)(66476007)(4326008)(8936002)(5660300002)(6666004)(6506007)(186003)(26005)(6512007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHRnNEpqSWpFNVJEdmp5cVk3b2p4Nnl5SDk2UmptaVFIRU56RmF6ZVFabHht?=
 =?utf-8?B?TDhIRmdUWnBZbTQ4OG9EUXoxWFlnc0xRbXVuVnZCeHdQYVZXaEJhMnJobGRC?=
 =?utf-8?B?VHI1NU13VzlrSEkzU1ZNL3QySXZPTDRPaFFSSktaZFc5VVp6SlFqU0tyUGI1?=
 =?utf-8?B?alVyY1VSUFVmQTFjU0VHN2lBNStabjVKalA5ZVFSMWRRdHVEblRuTkRkWEo4?=
 =?utf-8?B?ZlREQy9OWk8yRTBNMlVyKzhyVFZMNFhtV094T1NRU2N4enplNjZVS3VKL1hx?=
 =?utf-8?B?NFpTMlEwcmVwTU9oMXkybkR0c2xqcUx0QkQzanRhRFIrQ29hbm1FWFNNV0V0?=
 =?utf-8?B?dEZEQTNpVS9ERXdnajF3QnNBbVNtd3VoNG5aOHl5bzJ1aDNsYzlRZHJKSWF1?=
 =?utf-8?B?ZXB2Nm1CMCtIYzNEZEZaNEkweDBLUDhJMWhHUjRSZU9zU1hnUVl6dytZOUVk?=
 =?utf-8?B?V0NSUG0zTHpCWC9XdHBQZml2cWN0cVZ3cktpVVNhZE90UXdrZ21SUWFaTmlV?=
 =?utf-8?B?aWl6bWZhOW01SkNXcWRoV2JGVndMSStrQjM3R1NKYmZ1VkJOTEU0aWNjWU81?=
 =?utf-8?B?SDlHZFlwVDl0RXFzbzlRaFlaMWRWbTM4Vkg5a2kzQmVHbW91V1hqbzUvSzhW?=
 =?utf-8?B?WkpxbFcvcUxCNW0vUzZNcWkraUJFS2o2UHhrMS9ySEZTZEgwcnR0YXZTY3NN?=
 =?utf-8?B?b1ZleFo1M0diemxpRllsUVl2L0dmWXlxbms4OXI5Q2YyNW94c1FlMWRBbGVl?=
 =?utf-8?B?bERmSU0vZ05Rcmhja1gvbjdFL3VvWGxxN3NEdmJvR1RCcmJINjl6UU9hc2Zy?=
 =?utf-8?B?WVlVSnljSTd3STVOc0xzZWI5REdtajNBa2ZFTzBkcG9XQi82b2pTT0Q5TnIx?=
 =?utf-8?B?NGRwcTBHREgzcWxCRkZjQ3JTZVBIcDQ2TEFzSmtubWUxTGhTeDZ5WHdiRG9F?=
 =?utf-8?B?UkUvQnAvNncwVjZyU2lQc3Y1MW1rc0ZGSWVtd1lRNGtkSStOckRhOTd5Zlcx?=
 =?utf-8?B?eGwxQTRrSCtrM1Bncitkbmg0V3VKZm5CUjRGQlJseUpuQjZnRWlUZ05pVnN2?=
 =?utf-8?B?Z1Nrc0tWa2R6SUovTlNXb1NuUE5yakowL25nN0VLWEhabnZraVoyc2dCeXZX?=
 =?utf-8?B?S3E0UzE4Mm1KcERVcVJIMXNrTWF2V2V3QVNvZ3NnaWF6YUxwVHlsZmdSRzBh?=
 =?utf-8?B?bnBNU0RnNXk5dGRqS2VKYmVlQnM2MXN2VXJFejE3QlJrR1hGTlFjb1BKTTRl?=
 =?utf-8?B?SStyNC9LQWRCMStzODZOell0dTJ0TzdKcHVFOWNhVCtBUFpkbVp3ai82T3ZQ?=
 =?utf-8?B?QXVETnhMQlZPeWkwcHlYd25meGwweUNrNlE2M3hkb3puMUtFUzRQRUxlL3hT?=
 =?utf-8?B?bjlsWFBtM1FwSUx1eENndi9qeGVQWGlzMzBSODJoZWpJQzZxejdGNDJLNDg2?=
 =?utf-8?B?ZWQ1ZFl3VzFlQzZ1MzZZYVg4Z3laaldHb1BIMDcwaHJoWWE3K0hkOHdTc3Q1?=
 =?utf-8?B?THNLNnZVQmVPMzFXcHNySlZvQnB6MjU2YkJDS1VNaWJQZDdLbFpSNC9BdkhU?=
 =?utf-8?B?YjlkNG45ZEVxVWVBUlF4NGxPbkU4NFZGdUpYMUZGanh2cG4yWkoveHIzRk1Y?=
 =?utf-8?B?MHpJamtLUGNFMHZBYjVvV0Jtd1VJUTZZMXJkUHdyK2ZrV2c1dnpzQkhTNkdU?=
 =?utf-8?B?RlB4NU4zM3NVR082SWpPOFo4aExGOW1jNlcrN1NmMUtRNTNzRVNVYUg1Szd3?=
 =?utf-8?B?dy90M2N1R3prVVJCaFlEV3I1Q3pLeXhhUFNBVzQzMVhNUW4vRS9MZzlINnp2?=
 =?utf-8?B?SVRBdTVSaEVUcWhiZTJwQXBiVFNDTFpFeFM3SmNnQ2ZYN0prY2Jqd0ViUXBw?=
 =?utf-8?B?VUtBNk1sb0dNeGxweUdGL3hGVHFnVHArSVVQaEE0eXpGTnZZSENKSmVkbnc0?=
 =?utf-8?B?d1VtVU1EREpCNlR3cmZ1U2kvRndPRENKZ0Q2VElHWXNKMkFaZjFjMjFmNGxL?=
 =?utf-8?B?YTgyS0h3NUR3TDQzaFI0M2VhU0M5eDhIV091eEVYZHVOZW1QTUtDK2tHTW1l?=
 =?utf-8?B?TC9zalFzVlROWmdSOFB0YnUxUGFYQU1oQlVPT1hMcnVUZVFSdUExWHg4UFZs?=
 =?utf-8?B?UUlyM2ZyWHZDcG1MV29vWnJMaXBNeU1wMHM4YnpwM2lIRU5TVWM4dlJhSVNI?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933dd52a-4ffd-4701-e5ad-08dad2176df2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:38:50.0811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8C6bJeyMt7QZOWC3odCCcrqibeBUFylz/J788Ebs88qVAqHRM5AP1tmJBUA9nUyXG8LP+RVaEIHEVoiY8dbQEbHkoGhx9RBt6ggy4xpwmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7406
X-Proofpoint-ORIG-GUID: _r3TfpKTDaz3DuDERXZ6ZfrqvbClG7bs
X-Proofpoint-GUID: _r3TfpKTDaz3DuDERXZ6ZfrqvbClG7bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_09,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, SPF_HELO_NONE=0.001,
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


On 29/11/22 7:57 pm, Peter Xu wrote:
> On Tue, Nov 29, 2022 at 04:24:58PM +0530, manish.mishra wrote:
>> On 23/11/22 11:34 pm, Peter Xu wrote:
>>> On Wed, Nov 23, 2022 at 05:27:34PM +0000, manish.mishra wrote:
>>>> MSG_PEEK reads from the peek of channel, The data is treated as
>>>> unread and the next read shall still return this data. This
>>>> support is currently added only for socket class. Extra parameter
>>>> 'flags' is added to io_readv calls to pass extra read flags like
>>>> MSG_PEEK.
>>>>
>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>>>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>>
>> Hi Peter, Daniel
>>
>> Just wanted to check if both patches in this series are approved or i
>> need to update few more things. Also Peter, for your Review-by to be
>> included do i need to send another patch version or it will be taken up
>> whoever will be merging it?
> No need to resend it for now.
>
> https://urldefense.proofpoint.com/v2/url?u=https-3A__wiki.qemu.org_Planning_7.2&d=DwIDaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=VKz-1dQAm60GTS1TgeCxSN7GCerZujf727kNL7OIzxaQGwdxTmmXBlOi4jJyNnGv&s=wnWA4vdxdaNYmEh0ZDD498R4ClO30VnmpOQhsIurs7U&e=
>
> Today should tag rc3, maybe it's too late for such a change to go into this
> release.  It's not a regression of 7.2 so may not be justified either.
>
> Maybe it'll need to wait until the next dev cycle opens.
>
> Thanks,
>
ok got it, thank you Peter.

Thanks

Manish Mishra


