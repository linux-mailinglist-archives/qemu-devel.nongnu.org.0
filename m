Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366474C3DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 06:34:40 +0100 (CET)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNTFW-0004yq-SC
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 00:34:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNTCz-0004CO-NB
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 00:32:01 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:10258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNTCo-0000uz-TU
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 00:32:00 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21OL8kqg015468;
 Thu, 24 Feb 2022 21:31:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=hKCeoaw/iJ6cHsb3NvIW8d8qAdzj/ELotaATtBhdIIE=;
 b=XF4ipocC8T999+Gmwew7w9q2+RYY2D4oJJLsZrA5+ABuNJ8fLj+4pqRO3G07XqTrsMVz
 K3r9fW+BwF6cOkiiJETz1S9AytPOFXLURiXrfhwnSsMd2GvkEJoZ5NC8eH063DiIpUEj
 gklXy4YgtrxcW1D3emQF6kMfcg+Cy4RpG7x0Wx33+OSXJS5R7fx2MTZKFzw68bUHTGZC
 gXdn1Sq6atH4WgPFcKE7IGvv8vM0PP1M/F4uQT18LfQqZ4mqsI7/aGu36Vgie1Ao76dH
 lqdv3fQFbW7umyvjko85JytU8XywoOhTvneR/5BXdMw4EuNOWSY9lde5R99q6WL3339R Ag== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3edm99w2cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 21:31:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNECb59UlT7j6pSG+13Mi6ueDZzxbg4zbI7xWjyy++hX7kOvsGn2L83l2C+ZtlIeUYHmpn58qNpPs69LR0PEU/lQTAA24D3TlzNboCYPVzvqjY4ipglP/2Y1KFTdlG9hn5er/Kgdu+F+5Os0YMfaX3lC31xZ+Or+Xij4JnYS+CFEb1g9ILQIVL5zelY53knA4uTsprORQGrab+FsU8wJlMqhkVW/4tfTvV2lzX0G4YkOg8d06zgr35/XTwkpg6gb7STTev/u23iqWaoscKhB96Prr5Yk5RiJ4WoFMP7dbmYUZ+yh/QbOXRMsNzBSlyqyta/NCuKZpO48DanQUHCvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKCeoaw/iJ6cHsb3NvIW8d8qAdzj/ELotaATtBhdIIE=;
 b=IZ8N7A/8MSsSoArzJZT2EBWgwXyTgEjJuYzvm2eNiWdmbbvUaWWWT7ykb2657iieXc8vyAzcflMmgM3yoFQT3vXCmC+GTjNWeZNYit6QAcAzCBjCns1aZnQM4R/Km8GiPBpNDQoHuDqpwhrng5nQ6CIhH40rhMqUONslGftc6CP8v4nbMAxLQsn1GYdVoIfPDXSvde83RG3u/r8SiwOMgaCqSEZ/vf1qxfHK5dGjyYkLWIZpnKq+jT4mqiMT7UcvrFtkIhFusQSpNytP/dMT4e0afLDMnXX/mi7e9o8jsdchK8Bl2jKhddrstjIUsIgBmrsNWbhodWD5a5R7Ch9r5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by SN6PR02MB5247.namprd02.prod.outlook.com (2603:10b6:805:72::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Fri, 25 Feb
 2022 05:31:35 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 05:31:34 +0000
Message-ID: <95859d05-cffc-7cf2-0207-b44301b7447f@nutanix.com>
Date: Fri, 25 Feb 2022 11:01:24 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] Added parameter to take screenshot with screendump as
 PNG
To: Eric Blake <eblake@redhat.com>
References: <20220224115908.102285-1-kshitij.suri@nutanix.com>
 <20220224160228.qpeh6vd2257gqfku@redhat.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220224160228.qpeh6vd2257gqfku@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::27)
 To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9cb301a-9f79-4713-1547-08d9f82015af
X-MS-TrafficTypeDiagnostic: SN6PR02MB5247:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB5247F255579B1A40E601B436993E9@SN6PR02MB5247.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LdADIFfxWSUSfanQf8yqwb6TKePH8tpfM2nw/sHhBcJGxoc0tHhso3eBzpUVICJxCAsbG4m4hQuxLbUBMmPXVfdq6DTaregzqkhJ6pMSEZBZSWGmMGSpy77e3q6YwjtdsZtPRNoVN88LACqrLTV/ox4oeuSaSQVvAyMn2wk1eBFQk1tKfmfiWTxOSd+IpQcrKo/NlIQnbKwJWo95fY+++5vVIu3BRD8f5i86t2a8HlCjfxp5a1MPuu6yNcF7ZnAH3zJmGn0K+Q5NfB1LvpWEPIyvbM9f8JawCHvwIuZHjl4yapWM60zcQNTuerE85Kssp5L6mBhNnzHS3wl/mGy5Vh/aDmbB5jd1e3EQW7aROWlpVk2+sBINB6Tj/0uMNx2UnDtnCruQ99r83h1adBWO1Z0qfSPQPhlEBKu1K4ca/2OlmYLpej2Wb43YyR6l0ENzBJJdpEpwuiCdf3PjaCi3FjTLh9xHav0RBg5gu8oVDdwEatT7YwU5HMwXDJs5tW/Qys7zgBJJeXghLWdmEslkpqDDc70AK8j9jCl7SOQbP2+MEUbABKNKnfpSh9ZDPJBwFgj6KO/Ao8z9RdwPVdXV0/rGLhCPhh6c3owTCP9Mml2DHKwguI4nQosPY8HVIPcmZYb7DjyhF24mdzHfneDt1LQvLtgxoZzfnvlC7jFPxJPzkVKIEEZ0+J58Lfbh18RCDiRVl1wsiVTrJTnVlKCg43p87r485diKzJgOe878OQm8eqLIo8YFxG+ywPqCjZN4geGrfWw7lNAnDM/1XC6m/mlmkxz+GNU0iMWewD1rUZSRZfr51ViWrlv+s9KgxV6wgkxYOnnvdYfeodxgwDR4EhytRm0wCHGEoNmqfikRHyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(4326008)(66946007)(8676002)(66476007)(5660300002)(66556008)(31696002)(86362001)(66574015)(2906002)(8936002)(52116002)(316002)(38100700002)(6506007)(38350700002)(53546011)(31686004)(508600001)(6486002)(26005)(44832011)(107886003)(186003)(966005)(36756003)(2616005)(6916009)(6512007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWRRdFdwL1hkK1Rub01uU1F5RGVZRUl1ellnVDZoYzd6WGo1WlMvMVk3Z241?=
 =?utf-8?B?U0V2cWQ0bTVMekU2bWdIVTZFZ3puKzk3S2l3bXdyVjZPTDR4b1o5U21PeTBu?=
 =?utf-8?B?a3VneURudXhxc0hMVjdlN1pqUnFXdWFDQ2F2L1ZIU3plNVcxSmthMkhOU01q?=
 =?utf-8?B?MW84dTRSNnhsWEpNc0lScGc1b2dxSjNoUG1GM1FpN0hXRjExRlVqcGtON1pJ?=
 =?utf-8?B?NWhKQksxQzhIczN3Uno2N09lcnBKK3ZQWGlpS1R2bldBODRWVEtMTnovZ09m?=
 =?utf-8?B?MEtVVGlyTld6UkthaENHYW92b05Xb1ljeVhtSWdnci9EQ2FVRUYrejhHZTFD?=
 =?utf-8?B?VTVueHRrYjlUd1pLcGVxd3RncW1UclJHMjdxNFU0WHpiMThYTm96Uk1xYnlC?=
 =?utf-8?B?emNGT2tYa280cy9vSWhhcUlGTGd1OFFLOVlZVi9UUW84dktvOXhXSkl4ZjRn?=
 =?utf-8?B?aDNxSWtqU0dFVnNoeUE4NW1DSk9rVWVGMnRDcFhVQ0xMeXN3RCtKK3dHb2dv?=
 =?utf-8?B?ZmhaTWI2QUhONlR2enJOMW9INmh6aUZYdmczcVBGbmowOXR3YnRDZTdNZEFF?=
 =?utf-8?B?S1RGRWhBeTFubWdEZWNmTnQxR3Z5RUlRR05pcnJOV1ByajhibWdVQXo1VitP?=
 =?utf-8?B?cUR2cTVsK1RRMHIwT3UxbHBqZ2dtNGdMcnUxcExBZ3d2eTZYVFppZGVMNmZm?=
 =?utf-8?B?a1laaVdOWFplU21ZZ1pqSHFBeW1MNjJrYUR5T2Fsc2JrNDUzRjNkelJiRGFz?=
 =?utf-8?B?bHcybER5TXBva0Vzc05nV3pnNnJwVXVmVWFPNHNnQVN0cWZ2YksxakpEaUYz?=
 =?utf-8?B?SWJPYmhJbS9KM0FvR212MEJKUEIxMk5PZmpaMXpOZ3BvYUZBK0lMOEtuQUtK?=
 =?utf-8?B?Y1J0OU1GYWVWK05kdEZvU1RjeUhDVEtvWXJ0amx3QXY2OC9QVmg4UzVYcm5Z?=
 =?utf-8?B?SjZUQ1h3SFNHMWdQVUlmUXF3MGpRc2hGN203aXJONjNOczVvbzNKM084NDAz?=
 =?utf-8?B?aFR6bnFGRmhONXByVkU3NU0yVnd1bkdwWHhoYUVSUi9ONHJ3MTJDck5VemJD?=
 =?utf-8?B?N05vL1BlSWFYdm5GVFY2UmI3bndjWFB6M3RNd2NOK1RWT1R1MUtKaUptS09y?=
 =?utf-8?B?emE4NTk3NTdvZVZOWTFVQzJ3ZDNBQ2JOMHhpSTNpSFZDS0pyV3gzNmVjNCtG?=
 =?utf-8?B?NFJQS3RWUnBuNGtCWlVyNXBETGJxU1NWczVGTlUrK2V1Rm9ZN2k3aWh0ZEND?=
 =?utf-8?B?dUFaT1Y2SFdaSVZ1cXBqdDg2TmgxM3NpME40K0JLSEUwTUJURzB0MVc0MGZ4?=
 =?utf-8?B?bFUyNlgrNm4za1doaXFZY1N4TXRHMXlaZ2pYRHMxdjV3WURvS2d4aEVJZmFW?=
 =?utf-8?B?cW9iRzJ0dU9FZ3h0SXhWdzJWZGFIa0RsQnIvSWttc1RVSk9QQXZQQnp0QnUw?=
 =?utf-8?B?djFrVm1QN1hRWE45WkFiMmJhOFV0MHkrZkkvQy90V3NWOXhFTkRTQVJ2a09x?=
 =?utf-8?B?WlN6KzhEcllwZnFoOGJTaDVwUXFWOThEMmlPdGlRWlQvZUNUU2ZQZi80WVhC?=
 =?utf-8?B?cndlRmNzR25YNW02LzZPcDJuczVwTlp2OVZjS3hmSlEvTVI2T1JTYk9ZWU1r?=
 =?utf-8?B?MitzMDhtelMrbnFGNlNpNmhsVVhCWmlqSFRBTVBaRzVyZHhId2NVUTZJenBo?=
 =?utf-8?B?cFBnM3MwVmVPYzZZKytjYjVJbWhIQXBxQk5ZT3Vld0FOb1I0N2JPR1lUaVlT?=
 =?utf-8?B?VXRzZGpwOUNIWThUWDZOczZmWmVOZ3Y3SVIvQTNlSGdOcnUzWkJRZXlLaFFv?=
 =?utf-8?B?YmhudkV4c2k0WHl0UmVla0tsOFpOOWlESkRiUmNZZWkvMHpOLyt6bnlxcWZx?=
 =?utf-8?B?c0x4azh6Wi9Ld0RYaWZJMXByMDlEbFFjQlAzZCtqSGFZLy94ZCsvVGdJUmRO?=
 =?utf-8?B?cE9QaVl3eGlMY3FFMC9pZ0lxQ1EzQVlqbys0UFNsbjBFdEdEUThLUlRtdEFq?=
 =?utf-8?B?TEJZWlZsQzVPcnl1eWkyWjBpaXVSV1dObnRMWFRCZWI5RFNDWCtvVGpPLzVa?=
 =?utf-8?B?Vlc1a1haTEl0Y3lpVjE1WE85MEFyT3ZaZGVlc3dPaDVVblkrbWN1Skh4RFJa?=
 =?utf-8?B?Ykc1TFlDejRBZmp0TEdFcVphTElZTnEvdzZFUFlpNXhhSGJocFRMRGgvdmhz?=
 =?utf-8?B?VzFjc2l4Yk85MnZTdHNuektSQ1BiZEdjVGFFckVjcnM2QnRtY0xaSCs1U3hz?=
 =?utf-8?B?Sk5FSDZadmZKNVN3NWVZU0lpMjdnPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cb301a-9f79-4713-1547-08d9f82015af
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 05:31:34.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di7nU/qtmMz4AwMSzj6m+5hQnSaySROa+9cUtrdQRQpqs0qiIKoXKbUXO95eC6RpaghBvqbhBr3AvxkX5CBCVKuh6nVv5SnzN0gGdCis/8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5247
X-Proofpoint-GUID: WOqFAjhhb4VdgYnK6RAz8SBNfme4Ke0Z
X-Proofpoint-ORIG-GUID: WOqFAjhhb4VdgYnK6RAz8SBNfme4Ke0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_01,2022-02-24_01,2022-02-23_01
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
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 24/02/22 9:32 pm, Eric Blake wrote:
> On Thu, Feb 24, 2022 at 11:59:08AM +0000, Kshitij Suri wrote:
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=qNJ3bItOdAVHt5dAMXQLkxPL-RWabpnjdw53Hqk9lMbMhTF5Z2PmCjhWiBIiyiII&s=HjICgN7yF07YFTdi0rumN8vhm3-EwLgjHTuHhZXVc5w&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>> diff to v1:
>>    - Removed repeated alpha conversion operation.
>>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>    - Added a new CONFIG_PNG parameter for libpng support.
>>    - Changed input format to enum instead of string.
>>
>> +++ b/qapi/ui.json
>> @@ -73,12 +73,27 @@
>>   ##
>>   { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>>   
>> +##
>> +# @ImageFormat:
>> +#
>> +# Available list of supported types.
>> +#
>> +# @png: PNG format
>> +#
>> +# @ppm: PPM format
>> +#
>> +# Since: 6.3
> The next release is 7.0, not 6.3.
>
>> +#
>> +##
>> +{ 'enum': 'ImageFormat',
>> +  'data': ['ppm', 'png'] }
>> +
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Write a screenshot of the VGA screen to a file.
>>   #
>> -# @filename: the path of a new PPM file to store the image
>> +# @filename: the path of a new file to store the image
>>   #
>>   # @device: ID of the display device that should be dumped. If this parameter
>>   #          is missing, the primary display will be used. (Since 2.12)
>> @@ -87,6 +102,9 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. Currently only PNG and
>> +#             PPM are supported.
> The second sentence is no longer necessary, as the documentation for
> the enum type covers that information now.  Missing a '(since 7.0)' tag.
>
>> +#
>>   # Returns: Nothing on success
>>   #
>>   # Since: 0.14
>> @@ -99,7 +117,7 @@
>>   #
>>   ##
>>   { 'command': 'screendump',
>> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
>> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'ImageFormat'},
> Please wrap the long line.
Thank you for your prompt review! Will update the suggested changes in 
the following patch.

Regards,
Kshitij
>

