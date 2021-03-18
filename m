Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9542B3409F9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:20:58 +0100 (CET)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvOL-00004y-Et
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1lMv42-0006Rt-1n
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:59:58 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com
 ([40.107.93.86]:64097 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1lMv3p-0008K7-Nu
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:59:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjo0lNccJBbJzB5TQ/bxT6lCaWIpUHVDpjyOuDocEkvxUebZcGhDbHshVt7tE6jWyRGNkr9B4DDyoA3XQykgN2oMg6mkHXGTRgMG0TBalm8RYa4mjsu+I29oF8zceXlsufnR3yxwCeUyPSLJ5RjqecwR9jnuUgWNVZYN5lqO4lt1MrC41w1j7tQLZi1/XNuS9Nall2TQFEc2KGXmRgbnq7BU7Nul1YgY0/mTjyWttp2xXCRB+/TFixYyAvDpeXP4USwmr8aHePRfwdQx05kx7yQZIeCZ45xelI8DTodSXGTgAcIH4H3cy3q+9BmYexAo+7DGLeB1nYVo+BmRqA/GTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVh7+XfMRnDtsRaigUg9UnH3ON3Dyi38jS57I32MJqc=;
 b=Lg5D/m6+EzF7cBNGWgSVj/vzc8v3wp+DGx6KQ8L10r4XLSg++2sEfqVWgXuTxjgeGZaw9qHLTJbW/BmHN1S7yyLxxRerf4uLoXkJpYZZYP9qMAq+Q4ljkTLZMwXBigBFmxI6ao2GJ+UqNln7YKhHGyRWaJg/Bk3bcQthYskXpQPoExg0Jts14SrvPGQR2iO2Yy+efE6BI6wKU7vS+hBLMESndN3fT4Ry8rxV5oWxp1D/WR/u4in77pDLKAHip4AFuQ+qpriyoe2/z0qE74xRcGeOhi6pmYH9O8scr+gZJ3NpUydNR+d+ls9xwPE3n1ieabJYDkfik7WOfWpPd34V6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVh7+XfMRnDtsRaigUg9UnH3ON3Dyi38jS57I32MJqc=;
 b=OTIyZQO1k2z2pne+Vx5ElQQC+fiYTjgVBuvdXGJHxkdAVAJlJrybEcWvaGoQmSHl6U1MpEGUcqyMRLpg/mur/FHqLle4fNNfIRfnh6leXc1RmaGM/gFrI+m/w0o047ez1SBv/myEjH8GWkp6H/ohiKx+3wz3+gQL62DPCfQaB+I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 15:44:40 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::30fb:2d6c:a0bf:2f1d]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::30fb:2d6c:a0bf:2f1d%3]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 15:44:40 +0000
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210219180131.2061072-1-philmd@redhat.com>
 <bb91385d-ce8d-c949-d261-ec5315888b30@redhat.com>
 <590b0e2c-361a-e339-6b39-1793a5be6ea8@redhat.com>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <c7870295-a35d-e1fe-f86c-2372e1f581f3@amd.com>
Date: Thu, 18 Mar 2021 10:44:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <590b0e2c-361a-e339-6b39-1793a5be6ea8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [70.112.153.56]
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Brijeshs-MacBook-Pro.local (70.112.153.56) by
 SN7PR04CA0038.namprd04.prod.outlook.com (2603:10b6:806:120::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 15:44:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9367df03-fe76-4bed-83ea-08d8ea24bdf0
X-MS-TrafficTypeDiagnostic: SA0PR12MB4512:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4512EA703561F1036BF66E30E5699@SA0PR12MB4512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BQCmPwJFGgVicLkPtraydrqgmJzdE94SHnzGcBPyBR/krAJCZKjX9NKx9dZ5c3gdd2EEtJVGnHEh5sv8tTPHrmUZvUg4UG2fdrk2GI/eqCt0VRrcpf/w/DB3XdHviYnmI3rL/DkhCGmjdJ9RNTLeyYR7UQfc/tOaE/Xwgjb02rSsnofceccaQMTEbSkxUVcu1KoCIjfVdd5PYV40llf4443F+zUriM05LuVEFv3dBwhiSrOgI8mUTFb5Qxwu/tnqQqKMkAU3VQAP+Zb2zmGO5rOOHSkXxWJoz2F7QurEZ5ySu+o8SqG8AVOUYzakaIVdpmYXm43ibytXS8p9o7G1YuHB1VyMvNOAElrWPYvVctu3wfYuYNGgm5GlaQalYjupTCb0ooBonFaMkf5Y8A1Uhcj1leI7RvaJYXvRsOoKEuW6T13XyqqFn/txQnnPkipy+dyrbdvLpgMjowTLDo7kWZEA3613qRJoz49PzPMxXHoRhBFYBnnp7qQNFhnBlkjM4BnHIMn9XEf7S4e9yPmrs9yKc+PQQBSdxY1glBkWEtuz8bHEHXNB6z/fcKc29lApNy60Axb3iwYkH87eyF27sxnWfS1cdGz3esb6KNXaczNiGFhjuY8jiU1wTopuqkqrtOXYqriQp5GoIIyF7T4UEJHNmYj9VeE6xrzJHqmi7aGOf2A3er9M3WY1SS5cOka
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(8936002)(6512007)(15650500001)(36756003)(26005)(44832011)(38100700001)(4326008)(316002)(8676002)(52116002)(54906003)(478600001)(186003)(2906002)(956004)(66946007)(66476007)(31686004)(83380400001)(66556008)(86362001)(2616005)(16526019)(6486002)(5660300002)(31696002)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VDJvZVZ0aDJxZUlCUWZrK21QMXhxaldSVUkzYmFHMnNSSlFhdVpNNERwYlpn?=
 =?utf-8?B?b05rS3NYbGRqeEVIUVlNR2pqTG9FMnRmSnJZSjZYQ2M0YlVvU2JQblExWHpM?=
 =?utf-8?B?VVVtRlNYSk5mdWN5VUxlR25uUkpuMGgzQkUrcisrc1hwSFhBZlc5OXYyVE5L?=
 =?utf-8?B?R0MwQmtiWno4R20wdmVVSUlFeGx6WEkyUnNGRGNmcnhSTGtaSUJvS3hjd3BF?=
 =?utf-8?B?Ujdob21Bb28vem9ncDJ3ZnFJeEpDUmhtVmtSMHRlTjNLVzl6L2RRTktIUm9C?=
 =?utf-8?B?Q0FXQnZxeXhrejlTUjZHMTVubTh4NWlWa04vSndTWU5ZRGZyZUVSQVRhSTJY?=
 =?utf-8?B?QXhya0cvZS9PblY1bCtGRFhHTkp6MVdML3FkOEI0SXp4alF2eCtjZGdDenlN?=
 =?utf-8?B?a3VmRTBwdzJoWlpGejZxMndZazhNemMrTHVnakVoUW1LVEtmemxidktGUmh5?=
 =?utf-8?B?dXBGaXV5b3B3VlBVRi9mN1NwcmV3UVBQQ25rN3Fkd3orckh1NXFlUnFUTVVw?=
 =?utf-8?B?TWNJMWVNbVFPcjk5T0d2N0d2QWhaZStMRndPRzMxd1cyRDg5TGE4dU5VTUVZ?=
 =?utf-8?B?U2prRzVSUTRZMlhSTTB3MUdNcjNDN1FVbnJuNXl6N2JDcnBOdmtJNDlEU3dn?=
 =?utf-8?B?MTJvSDJsYzJuK2RUNys3K2VyWVM2bEVVeGtxazZjNVJxWW0yV3pjZFFiM01M?=
 =?utf-8?B?VStVdGhkcGlsQlAzVlNkelAwRkRQT0JGellwTTl4QXJsYkVGUFBHaFEyczlz?=
 =?utf-8?B?MldjQXhLdkpRc25LU25SVEQyNjNyUHBRRHVwT1ZYaThORHdheWM4MHV2aU4w?=
 =?utf-8?B?bGV1bnpFK2ozSDZjeWtQK05QNUpEUTllcG9id2cza0t4allPdmdtL2pTamJi?=
 =?utf-8?B?Qzdqa3U1YjlwMGdzUVIweXBlM2dZUGJjYzIxdFJwTFVDQTlXeTRaOURrMGJX?=
 =?utf-8?B?eFdvL0U4QXF5UEVpVStWOEJLcm9lcjc2cjlKTkxkSlFHeVVaWTRZeVZheE1R?=
 =?utf-8?B?UW04NWNCM1RQaWFkYW9KVittQTc1OVViek1MNzhESWhkQS80Z1JNNGQ1VUpN?=
 =?utf-8?B?eUN0eWhyS2syS291b3hBUFJJYnFPMGpNc0VMSXZwandrUGNsbU5jZmIxUEdq?=
 =?utf-8?B?UTdZZTdhZjJBM1lFZ0FaVXcvQkxqY2h4ZkEvYmxaamd3K2JWVlFXMnNlQkpP?=
 =?utf-8?B?SHdlRW5YZ2R1djJZSE5JK3J3RTh0anUxckhrLzBOWDJ2NHptRkIwK2hhOUgr?=
 =?utf-8?B?ell1YWZXenlxTnNCMHpKQjJSYnNQcXVEdlJJTU40TWJIdC9FMHBqY0wxeGdY?=
 =?utf-8?B?Rk82WjZYNVo0TkZaNmI1RzBFVWNleUxzK2tzK1pESWhNbFlRSHFiV0t4K05L?=
 =?utf-8?B?L2YvZ1dWRGFiNXQ0TnlSRitGVndITjErK1p2SkZQZWxjY2NETHN4eVMxS2FX?=
 =?utf-8?B?R25GRVRodStxZVhOWGxCcTRDUHhtRUpCb2ZIMFBrSzBUeW43QVFuTmM5Wjkz?=
 =?utf-8?B?Q1Y2WXl3d0VacjY5a0dMQ1pMK3JJMVc3SmxhNDE5eDVLNjdHcDdJNnRTR3Mz?=
 =?utf-8?B?RUJHeHZMd29odU9KZ005c2Y4SGxHcFd2OUxJNVF4c2VQYW1qL291RGVQczN3?=
 =?utf-8?B?MHFySzI4ZWJUQVBGVlN6YzZSWUtDV0ZhcXNCbm9yaDBFU3drbklKME0zcjBD?=
 =?utf-8?B?dis0eXdtVDJXTElFcEY5OW45eTVYWlF5M0xRRjNZS3hFYTNpUGpTUWlLWmdy?=
 =?utf-8?Q?dWZ0DaDJj7Y8lKHLq62C1Wnond1LyQHy0HLVvQW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9367df03-fe76-4bed-83ea-08d8ea24bdf0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 15:44:40.1322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xut2MIqQ66aumLrpwYCgSuEyAXVXDZnjohdSR8cj01kqHc6j9c/pHTF+NutT+VzUskRQnbiATBZX6YH+rxXEeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512
Received-SPF: softfail client-ip=40.107.93.86;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, brijesh.singh@amd.com,
 Eduardo Habkost <ehabkost@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/18/21 10:38 AM, Philippe Mathieu-Daudé wrote:
> ping^2?
>
> On 3/8/21 11:21 AM, Philippe Mathieu-Daudé wrote:
>> ping?
>>
>> On 2/19/21 7:01 PM, Philippe Mathieu-Daudé wrote:
>>> Ensure sev_fw_errlist[] is updated after running
>>> the update-linux-headers.sh script.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> Based-on: <20210218151633.215374-1-ckuehl@redhat.com>

I am in the favor to keep list in sync with header updates. thanks

Acked-by: Brijesh Singh <brijesh.singh@amd.com>

>>> ---
>>>  target/i386/sev.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>>> index 37690ae809c..92c69a23769 100644
>>> --- a/target/i386/sev.c
>>> +++ b/target/i386/sev.c
>>> @@ -87,7 +87,7 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
>>>  static SevGuestState *sev_guest;
>>>  static Error *sev_mig_blocker;
>>>  
>>> -static const char *const sev_fw_errlist[] = {
>>> +static const char *const sev_fw_errlist[SEV_RET_MAX] = {
>>>      [SEV_RET_SUCCESS]                = "",
>>>      [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
>>>      [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
>>> @@ -114,6 +114,8 @@ static const char *const sev_fw_errlist[] = {
>>>      [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
>>>      [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
>>>  };
>>> +/* Ensure sev_fw_errlist[] is updated after running update-linux-headers.sh */
>>> +QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 != SEV_RET_MAX);
>>>  
>>>  #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
>>>  
>>> @@ -160,6 +162,7 @@ fw_error_to_str(int code)
>>>      if (code < 0 || code >= SEV_FW_MAX_ERROR) {
>>>          return "unknown error";
>>>      }
>>> +    assert(sev_fw_errlist[code]);
>>>  
>>>      return sev_fw_errlist[code];
>>>  }
>>>

