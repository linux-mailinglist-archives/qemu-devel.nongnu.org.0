Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B86B625474
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:32:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOW1-0003jM-Aq; Fri, 11 Nov 2022 02:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1otOVx-0003hp-6q
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:31:51 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1otOVu-0003Je-DL
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:31:48 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB1qHPY015950; Thu, 10 Nov 2022 23:31:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=o5qHThHcbUWiepSyKvrLXw71Ug2v2L4RQxUpXz1pKMk=;
 b=ix73oeBOJ2Rt+1Jhqr0OA/b8pEwvw3K6TqfrnBy/KiRlx6y6M/1Uf/rsTvMtqQ1C6pFB
 0hrWYQIT2BhsZqsn3YVuawRlI7Ikbh+tCACbqPKCNb74qK3KAl9mMs8dqrT23l9Kegsg
 nW0p0o8Jgg8j+gF3pQQaPHt1HuDP5y4ubNkvCeetPp6gKMbBwUU47okAW+jjjyhGzDPv
 PXjLXj3YraUf0twWvyrxAaZLAXzVEvlRhudP2h9/bpTKJguMb43ugFpF93gejBskfcMb
 0EaxRwL/0G0x2mjP76aQjmIPBmh6nTNoNWQQh1pji+VoEIpU32AUHlSXo0tx96MqzTU2 Lg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ksd42gh5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 23:31:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqvbfAqEv7DfUjgnF6DnBnG9PMU7VKMjSff/5Wqg8uIX9XKNoCfvMouEGMNRWmSmR6FtgkfRO52Tj+BrH5vvE2WC1z3nDuqIAQPziGZXqDve+zohY81eLo3j7z3yQFyPIag899vxent282LdqBlVPESgDof/CgyOCOLQXEjwWP7QB22Jv9vSAOwOFomTXzmNaLiOi67oRu6ZYbtIkDnLKbcDwa9/b6DKfdPbfqACdm6wMJkkFcjEN9dYxvRa8ChvsJSDOdhSlO0SZTLO68A3Ah50ggSYZFdAr3wbGT2on9mAiv9TK8Y0Aj2WO6GpLNrxqbUsYDvw8hnHytnNz3PKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5qHThHcbUWiepSyKvrLXw71Ug2v2L4RQxUpXz1pKMk=;
 b=B4GQVuaHeRQfWUVf1X8HIICNKT4xo+cgh6JHa6UrtHGZRmPftc2+Pl5iks+5CVqnXYGi9aL9BnZBdIPAfFhiXG0msKg/5nRj20pBZetJHimtJu5sVtUgdNHKHdU2dhDQik78Bz4jCJ1hT+RTPZuuMO99G6tH53oYeg6HQF0VBOI3kqHnTfL+wJf3fUuNABXLOz6KRJSd2y1KyzQ8ME4kntf2l7lHFR8oCDl+73L5S84+ob2TsCjkbN+IdQLtvvGLlUYxweKOGJusjpn/+dZVGokLRVzwKpA9yld/OLRGeB1cj9FYo7Ee+Z1xMq0Sl5ObLGD7go6GxdtxPKI7MJw7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5qHThHcbUWiepSyKvrLXw71Ug2v2L4RQxUpXz1pKMk=;
 b=T6xPpGv4+Kk8MTgVzTd8Qp8iwHoxjwWcadlTKF9b4D4A6+45NpjKxuhL+g4CI1kT/uli35QQDd+wdx6Lu7qnaopd61zmOiWnwTTkqJldTqNCKvKN++DB4meBGkHaft6PpBvcgUlbdimiODlSBgZI5Gwh1h0xNMaEopdsPGBlnIe1Kzf04XrhMNn3iIwSr2WMhYvhNbcE2RhNhyF5TFKka8ZMmEz5VJ9+28W+Ryh2TQ8yRfQ/RMgZp5tQhcstrFf2Njluk+8Pm57woV/Rls5YTI94HpDA/3Vc0lJhioxqS1vusHltmD9MrlB8aJKMy9TzfkYFuA9wAAuTxn2xOqht/A==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CH2PR02MB7031.namprd02.prod.outlook.com (2603:10b6:610:88::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Fri, 11 Nov
 2022 07:31:41 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::6900:90d6:f4c2:8509%6]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 07:31:41 +0000
Message-ID: <82938e1a-76a1-204e-2718-ac4e2e5b2857@nutanix.com>
Date: Fri, 11 Nov 2022 13:01:33 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
 <52579466-e91f-2bea-b39e-b48cc3cb8a24@nutanix.com> <Y21/elPaaiWVNTSI@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y21/elPaaiWVNTSI@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::34) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CH2PR02MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a66022-08af-457b-6652-08dac3b6c6ac
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aj72CzwHYDRTE4+VSxW/Cy5Uy33evhLMbN01Tojw9JWA36kt7bdXWRsy97gshK53kjlWjGlNP+7Tdc8jdW9fSoiToanwwypBBcGzkJP/ozfi4p/5nURan8hj0mBDUB+rP2z1XIEzdZwJqY/3moltwQ7ML92W3EMXHHHWW/+5gOlNgWe6K9i92waRHhevz1SaYbtzyiuWRHndlzrAeQ2abbZ4rEzAOV4tAeTDAaJauS46Ps0eDuSAb+U5eQ75kfmKCTs/97Qm6unMn/TUKgEJdOfmOL1DGbglucyWcZtaXzC+wctU4piA6r/73cbe5R6fX05AWCxe8pA1Ba0/GciojbogcKZwGDfzlyn0wJKZw+SOs+HT/AczeXxx63URVM3ck0tJxqNpDq1k2jP5uGTEn90zvpCsNoYmfDFYnh+RJLQwAY9pSQxAOzYNO+NqTsCc+PXZPBiLW1t7C4hfZBUBz/gS4X/LhkfLmgI4ftr3vJ7e5tB+FFGAFELHcUTT5RdsK9ZjaxKdBURXqFay4xZ27YTckLY874epLWUL1mEgxn8Qa4szKcEtJW3Eb+4kkSEdvNzMG2qaLnNfgBgfi+fmP5yHFeN/q8eNNsAP0GVaWiV2jsK/naQo5YiBTh2NPQ5CK8ci7M/DA5OW1wqEpwf+eUbPRIcmvgK6INGzaNGjaqnVx6LxEsGalrx8rbFrOE1MryBxAgG1eUupfYhOybyVarT+fs/BP0TdQPm508cnwkRXB5ro9GIyZJgfFtn09fNDXDtiibi3+CVtmcV0X4S7UiuSzQSNxN3/jVvk1fyP2EM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199015)(8676002)(66946007)(66476007)(31686004)(38100700002)(26005)(4326008)(66556008)(36756003)(316002)(6506007)(2906002)(6916009)(4744005)(6512007)(6486002)(31696002)(53546011)(478600001)(86362001)(186003)(8936002)(41300700001)(83380400001)(2616005)(6666004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTQ3MnRjUGdZaFRwdlZxWFFTcVlzQWFSckNKZUVCUXB6SXZpWkJFTzYxV1Vx?=
 =?utf-8?B?Umg4YmVVUG9MRFlhUm1xRFVXMlcxT2tGM3BnMXh2Zk1mMVlWSTRsd0ZKQTZy?=
 =?utf-8?B?M0VBY0tPMHhlMWZZWS9QMXJlU0FMUis2WDhlS0ZFeFlnVmNxTjFEQ0Q4K0JY?=
 =?utf-8?B?OTRaM3hOUE1ndmcwd1NGOEc2YXBtRG0zQm9JV1htbmNveDdHYXRyakhUdXVn?=
 =?utf-8?B?cVo5U3J4ell3MDFGK0YyU3Nwa2lLbjVSTFBYWnJXYzlFb1RoUk5XVktrVkZl?=
 =?utf-8?B?U1Yra2dpdzIyUVlqY3Z1dVVrdVNRYTZzRmpGMGZvelYrZitiNDRJOEtEOGZq?=
 =?utf-8?B?UkJIZWxCRGYwM3ZkaWF3YlJpVVZ5QTFKcHdvNjV6di91RkNEdU5uVFYyVnhT?=
 =?utf-8?B?QlNmSHgxN1I2WVdGQjByUWN4UktlWGhFejhlU0ZVZ1FlMDZhRldoUXc0cG1M?=
 =?utf-8?B?eUlBQ3JHbEZRL3V1WUtzMlZNeWp5WVJwcGF1OS91TnFqUVdFUzh0ZmF1ZERq?=
 =?utf-8?B?M0JMRHoyOWZJNkFMY1VxaXFlVjhCendSSkJRbG42N3lNWi9ydVFxa3VDMGtX?=
 =?utf-8?B?K0FTeW9jeXVsaXY4bUY0VE0vNkF0dFF5Z3IySzVUdHJVVjROSWlxeHJHZ1or?=
 =?utf-8?B?UlVSY08rY0pFWUthMmRvckxXVFFlVzhuK3BLNWlqQ1Vway9zT1k1YUd0b0dv?=
 =?utf-8?B?VThLWld6SDUvTzF6MndUOWtrOXZydzV6SHN1b2c1Mi9JNlRtMGZaSHpxVi9m?=
 =?utf-8?B?dDhYeGVpbWQxSWNoTFNwUjI5OHdUNk5uSGZYdDNrQmw5MitpRHhvMzNNUFcx?=
 =?utf-8?B?VU04dGZJM0ZKemhSbWNoSWRjbDBYUDJXOHZTNkRmZVhEa1N1SlNUTE9raGJZ?=
 =?utf-8?B?TjVJaE1GWkF6MVJXeGFHMHFHaFY3eERNeXRrc3Vtd2d3UVFPUU9DY01IZEtO?=
 =?utf-8?B?UjBManI0aXhTc2tOVmtsYVd2RHN4dWQzY3JDNjhqSkRDRzdZUHE5ajhkMmp3?=
 =?utf-8?B?aWtQcFRsK2JLcURvWExoczVIS29JK3ZaZG95cGZqOUZIZW1VeDBKSHZQMXNV?=
 =?utf-8?B?ZndrZHFHTG5CV3hxazBPdll5VHZLR3NtZUlFcm9raFhEQ0xrYm9FUVZ5TDU0?=
 =?utf-8?B?V1pkYUhLSVV5d1puUGptMU9KVWZtN1J4eTRlMVJiaklPNUEzM2R0T0ZxSVVS?=
 =?utf-8?B?WEtRcDBzZy9hUElZaGdSK2x5blNoSEZ5WDlJdjhOSXN0MkRlazgwZUptWWE1?=
 =?utf-8?B?dC8vTEIyVURUUkUzeFVrbWJyNnVLNHlSajlFa3IxakN2bGZ2dG1VOVJRbUp5?=
 =?utf-8?B?eVF5R05tbCsxcmxaQTNjVUFyOE1GeUhqNFJqMzVCZmRzT3pJNmdlMzZBb1BU?=
 =?utf-8?B?RjBTZlZwS1JHSkJzR2hwdUxmODBCRGRrQnJWVkFYVmk4dUNZYThDZnRVcGtC?=
 =?utf-8?B?ZlNLQkZnTnUwL1hoUlBhZTQ4blVQUG00WXEzL0RFQWNOMEZCQlVRWVlQODJL?=
 =?utf-8?B?K0JsWkRzMzQzV0xObzVxSlNQT2lIV2ZYbG5xejY5WUlwNVZZeFhseFM2Z0Jq?=
 =?utf-8?B?R0dxcmF2RTNBdmVsSDMxT29aL2phVEFSL0wvdG5oalFEdFFQTlRmai9wdzRs?=
 =?utf-8?B?czdvN2N3T29wWk15dXNTei9odjdORXBkTCs2alRSeDJ4U09WeGlKMjRHaWJr?=
 =?utf-8?B?Q2MvVU51UGlhaUlQQWgzZ3M5VTZ6K2k5MXdkSGNXclkxVUZDM0xKbUxBeHdi?=
 =?utf-8?B?NUlkNnEvQnV6MjFpL1R3RW16MkY0Tk1LRUxuTUJ6U1JuSk95VG45ZGF5RnM2?=
 =?utf-8?B?OVBFd0JOcExKa1FHRzRJNWw5VzdRWWY1L0U1b0lhODVrVjZtMGU3ZkNxbkZt?=
 =?utf-8?B?VHhIMVprakFwNmR1M2RsakFacGlXNFB4VHphN3dSNTh4TXlJaXM4QTVrR0dx?=
 =?utf-8?B?MEF3WlZDRjZSMXI0dlRGQmdaVFIyK0JMODRNSko1RjgxSitIdURhamQ2clli?=
 =?utf-8?B?WTZQMDNWMDFFZUU1NTcxTnNNRmIvRXVZTUdVOW1aZ0IzNThaOS9uQUFiUDBw?=
 =?utf-8?B?T09mNm1ZMHFSUlpNMGQya21TY3YzZnVsWHMzTWFvTEE0RHo5c09WRElSNHFV?=
 =?utf-8?B?allmRFlnSTBmUkg5Z0dxMVNhVnhKWHpxWVpTMXpQQWNEUzNVYmQ2YnVWYWNh?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a66022-08af-457b-6652-08dac3b6c6ac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 07:31:41.2716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4jiNYe2gV58Sb0H5JnYvkQ3/1cRXuByv9eWM5Iq52AG9MuQTjR9sII/TlgG+9+wZlzBBxKNShdUZwF9lFYrtBKjG51mJwOtdFwJ2R7hLg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7031
X-Proofpoint-ORIG-GUID: bN5laoErifiYRkMdKgz75rCdbMSrDDAG
X-Proofpoint-GUID: bN5laoErifiYRkMdKgz75rCdbMSrDDAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_04,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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


On 11/11/22 4:17 am, Peter Xu wrote:
> On Thu, Nov 10, 2022 at 05:59:45PM +0530, manish.mishra wrote:
>> Hi Everyone, Just a gentle reminder for review. :)
> Hi, Manish,
>
> I've got a slightly busy week, sorry!  If Daniel and Juan won't have time
> to look at it I'll have a closer look at it next Monday (holiday tomorrow).

Yes sure Peter, Thank you and Happy Holiday :).

>

