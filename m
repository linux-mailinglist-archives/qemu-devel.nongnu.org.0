Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0B53150C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 18:46:12 +0200 (CEST)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntBC7-0000CR-Mw
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 12:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ntBAW-0007pa-8a
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:44:32 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:29774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ntBAS-0007ul-HI
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:44:31 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NGSGPG025882;
 Mon, 23 May 2022 09:44:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=7xv7pOgLKqZ+FxnAV/GdwHxEuUxQASx6cEfqe6rbB1c=;
 b=wg+5pZn1G7sltysGdW8GypLI1gGsIqogJ4Lf1AHFkeZ3DlACZvXVwkiAMsGbABcIv3pE
 fCHb80Pcr2ZKrEYOzabh4AG3ToRgzLLRMY/Gw7sjh8O9L51MvueVNSMaeveB2qjyh/M6
 Hi3C8xy3thHdhGr/SqnimfrPYkbM4m81TbSEm69zPtjv6Ip9lJx7RTVf88pfDn7OZnlQ
 MEmualM9pgZLtIvVwLxyqS4zwZpBJIO0cTPrty+rgxe2mg5nGAavCAbAqT7ynIIqotE4
 nNUWxAylKKdg1cGPbEh26aqokGseg3cohzDA/HFVHFF0XTunciJgMxu2KdDiLQy1sncX PA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g6ydekn7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 09:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chCQsj0WzZxgOG/F0Myh0N8GCJzmgCJ/+7MWE3B4k/mTkpqGcj9wmpZkkpiow3qrq3Z6xmVQxCYv8QtflZVXvLcabMHKyBjLSRrT7gq9QmosmYv8dag+PWs3USb2R8IsKgXU/feie7RKD1Keju4XnS3undI9LCjJfD1c88zyXPmQRomRoyGcqK7LdmjxzygWo1KPJFtnxOS9AHwtgiKC3OFk3v/WYYBdx/WhceUSUdVKdaiO8b8vS8RL/mt5R8vyXNRV0v7OxlTbyxdp6gf5BujZBHgDX8N/xLuFWM/AgiYX3Qp5qtREqrFhEbvLqoN4lWpRMaeoOvogR7Qll8wMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xv7pOgLKqZ+FxnAV/GdwHxEuUxQASx6cEfqe6rbB1c=;
 b=c9n3Fb/hbioKEXDCTZ4VYIqIuzvb6rU46oO+FeQgNdpX1uHkVcEf4CFtiCZmjyOc7hzNEOwOlQm7ixTpH452bZEXH4ugsqrflZJJOV6JZWl5KGIcFbrBkX+EsltvYMkReDUBgRVkldVfUdbjVTor36P/Dbn3JLKSa5Whp6YVp9LRrjki/D4IrOG8LKaviHdsY1AxLyAsqajmRrgm2Uiks+4oWHHKWx9Km85hR46tlJ3YlfO6wgFPHv9GrIPRhOP/XE9IFRO4UIkyoGZbzZMsliHKKoHEcejLUllVNKK4+WJgC3GKuHEreEyWQbBwCYVC6ok5QSB2QkB93mmQDrqJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SN6PR02MB4672.namprd02.prod.outlook.com (2603:10b6:805:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 16:44:14 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%6]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 16:44:14 +0000
Message-ID: <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
Date: Mon, 23 May 2022 22:14:04 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
To: Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel <qemu-devel@nongnu.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fec6c73-988a-4429-835a-08da3cdb788f
X-MS-TrafficTypeDiagnostic: SN6PR02MB4672:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB4672B50C660BF5EC72354D26F6D49@SN6PR02MB4672.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXJQP9U5FLgcXJJ3hF5+bjAsVoXPeNg4RQwionu50Y/fv/gv2mxOZGMrjs93Jz/gTkktlu/qCDAw5LsNjG88NZkgiQZsWIik9dMkxb1GF3IXIWgxF/Jop1zltgVvwtRarsxiGlJpp/RGYYPhCTN2wmF+TFC9wUy40BxeIx4p7+bYnbUBMC73gjlySGci2+1tQ6Joe3QJYZErDocfnND+qp9KGiEUFZoDveCZBgRK7yWsf02g50EhmSrRmvJ5fQAG5WC9n+mYNwBqs2LNwKyKVrq1WcRXT8NoSzxCwPdI/kSqMGQMWz5jWPKSFO7DmbeY3nnBPlCV6aVt3xRuRe5nUY8XA64RMa3IeOx8nRupgS8rGYY1vs5VvAjdgJioW+tzQTLzmv8tVwCensus17fyZCLdtoGCc+6qCXeYTfMGPP/sB2GdeuK0VwJGdzrkHu8sWGK99Pz0DtGGjUHOxlWfLmFvFPC79YqvDQ53L/jg11D0i8bcISg3KGq72devHuGiotvwAmwi+awYss10ER8Bdhxcf/HKXNnhN9YXC0RNDkbtN8zTE6HrTBXiPyp6jlEOu9Jtf6eq1bLqfTJVwGmo3rRD96JTGGY3YbwkU1NBDoTehgfTT6zObqWDk8VgRtkqrM7xrM89FTN8I9U6Wc5O911g5h8GV0E8kOEAEgA6l9MVqbemBzcA4x7BNfrb9lIe3vaqChICB3yRGXB05nuP64reWLDUKldglz7ZQ1Fuqc7o9EM1QUpt0VCqxq9cxmIqOl2/0NIeGLH0iJGVOeMCaFsApCVWuq1IznesDuHsVFqj0/Py1Yqnr0nANlp/OW78J/8203YOF+bU3n47M1uOng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(66476007)(66946007)(26005)(316002)(83380400001)(8936002)(8676002)(4326008)(30864003)(7416002)(5660300002)(508600001)(966005)(6486002)(2616005)(186003)(86362001)(36756003)(6512007)(2906002)(38100700002)(31686004)(31696002)(6506007)(110136005)(6666004)(53546011)(54906003)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlViNXgxVVRGRjNXeDI3WHN3Ulkrb2dQd0t3WHdzTGlTRzBMR0p1NDd6L0kz?=
 =?utf-8?B?K1Nnc0dmUDBTWTdFVVc2NTRabEtFcnBKelZLdzdlTlB4RGVUK01TMW5VNWNI?=
 =?utf-8?B?T1hVaFRyR1QvVVNqZ2IyRkJ6Q3U0Y3d5QWE2THpNeVhQaEpxYUFvQUw0eSs5?=
 =?utf-8?B?bU5Dd3M1NGxXbnJWVDdsZCtxeHpsTmY1RWY0NXpFbGMxODhRcVF3VHFJbm1T?=
 =?utf-8?B?RGFueDR1aEYzVHZZVWF3UmdPbEp3Y2hnY2Zoc1BtdENGMlZiSVFxLzdqMUp4?=
 =?utf-8?B?UXJ5VWNTcGtYR2phYXdLOWxHRUl5OXZ4S05MQWdqQ096K0M4cndFZmt0Q3Er?=
 =?utf-8?B?dFRWQXBKOE5hUWNOLzlsUml6SG1LOXlTMm5DbUVHdzBmdG9MZXRmTEYyYWdl?=
 =?utf-8?B?bXBYNnpjNW1mZDFvVEF6TzQ3dHpiRVBsSlh4NFpzQngrYVlUUEtKblJpV2lt?=
 =?utf-8?B?WnRLTGdxejZkdHplTXI5ZlVjS1ZIU0Y4clhQMmV1MlkyMFIzYmlkejZtOWlE?=
 =?utf-8?B?NzI5TFp4N3M3N1JQZDl1WFJNcU9McFB0UldXTldHWnJYeVVFYTRFcnZWaUxG?=
 =?utf-8?B?MnY2YTlyQ1BsWDF5eXh4Y1JQNmdvL241UWRxQVFDYUdCVllMc3ZLVXJvV0ZQ?=
 =?utf-8?B?Rm5XbGdzMkFGQTZrcXpDTEQ5bzhtRWZzRjBXdG5STU1vZWxpM0Uzc2JRQU80?=
 =?utf-8?B?WlE4cWZzRkRsRXVDbGd6VHZnWkhzZ2w1bjVmZzE3RVFGaDJBQjg3SjhYWlpi?=
 =?utf-8?B?dEQzVm9sRVBseW9GdVZpazJwZlJjTXBPNTZ5d2M1MnFqdUFjR3RSUXp4R3pZ?=
 =?utf-8?B?TFY5dDh6R0NhZ3BkNm8rYW9KWnpYMC9ndVJNaFNHdlhCZnpXZDI4cXlKM2RY?=
 =?utf-8?B?OGMyN3J5US9RYVAyUldVVyt1TmoxcEd1ekVsTUtESzR6UEtZbXRpZ0E4NUlC?=
 =?utf-8?B?OTlTZWppTjhsYnFFaGQzNHFXdmttQUdQVFpsRU9pRWM2clMzKzBnU2VQZ0lN?=
 =?utf-8?B?SVV0MVcrRTNCMTRleS90MXV6aE9iZlBmZlhoZmxyK0l2Q3ZodGltRTdqVzN5?=
 =?utf-8?B?WDFicDg2LzRQT0lyNFp5S2xhYUJUcjNVV3hHK3d1dnlMcTFtT1B5cVcrSmlj?=
 =?utf-8?B?ai9WcGk3YkFVNksrcDBhU3hYbWhmUm1mZTVvQmwyVDNWQnI3b0U2ZU4zRXh6?=
 =?utf-8?B?TStvTXV6SWlLY2ZDUkZ6SlJJODBCZU13dklXMGMxK0RxWDFHR3pRckJIVmg4?=
 =?utf-8?B?Y2ZuSnBjb29EdUpESld0eVIzNVZQVGFvYU9HOEl0YkNwa2hzWEw0bEViL2NN?=
 =?utf-8?B?UThRNXAxelNJbnM3aUM0NjhjRGMvODBKWW9VN2xYNkVueURkN1pubjN5eC96?=
 =?utf-8?B?M3M0Y0FTamdxcWxrcFlidHVsbFZTNVpwRmloanNVRFFLeERqZEdQVmErR2ph?=
 =?utf-8?B?V09qanNsQkI4MFVRRXNFaDh3cWMzRC9ySklDMldVME1wVUtNaXBaSEFoZ1VF?=
 =?utf-8?B?L2VZRTU0SHE5TjJueGVCSWRrMmwvdTFHY09IcG4yR1BoRHhtN0hVdTVzZDZY?=
 =?utf-8?B?WDBidHJTR2tkaUV1NzBxZzNlVDFXbjBIUVphK0dFOHZnSzdVNG5jSkcrYWo5?=
 =?utf-8?B?ZTRCdllZb3huV24rZXRTM2h1Si9rYUlBQlBseStNa1FOb2s4ZXkwM1RmN0tz?=
 =?utf-8?B?Nmljcm45VENPQUtLdFcyNkVKWUZkV1VNT1ZXQk1IaW91S1ZHSmZBdXZFbGYw?=
 =?utf-8?B?V3NXZHR5VUNzY2Ixbm1OVVkraFNFQW5HSnJoNHVMUDNvUlpKUVpDc0ljKytZ?=
 =?utf-8?B?bG1Bb3RUS1lqUmVOMlZldk9lV21mSVJpaGNaUWc2ZC9NWkZOU2U3SWEzSUJm?=
 =?utf-8?B?NFBZeG1hdkJrT1Jrbk5McE5hTXFaMmFJSmtDMnBQVHF4RHZpK0lYckZZTGMz?=
 =?utf-8?B?MHZwRzFiTnloeXpGd0ZPc2pXcnZsQjB1S1EzRXZqcC9lcERHdWo3YTdGMVRa?=
 =?utf-8?B?UmZlZUdCWjhsbTlkUFlmRi9FdUZ6SG96dTEyb0dMK1RsUkJ2RGx1MVVJcG5h?=
 =?utf-8?B?dXcrQ1NrZXhQWDNyV0xvOHFrWEQxM2dkdkZlbldGS2NNV2ZZci9kcUhLaVRx?=
 =?utf-8?B?UDNWRlNGL2QyZVNWK29kUW9UWkZVK0MyUHRLK2xrVTcvRm1XWVVZMW13Q0d4?=
 =?utf-8?B?aU0xbFo2bzdQM2szRFQ2dDUwSmI0SFIrNE8yOHpIOE14TDc0dTFRNjcvYUxS?=
 =?utf-8?B?bEFMeWl5V2N2ckRvVHJEZXkyRXc3SzBYNDU4UFdNZmpIRVdOZDNxM0F3RkJW?=
 =?utf-8?B?RmhXRDVZVUFlamRYU21vMytBYTdOWDlkZDZYMWJ6anZHbEwwMVJQVlVHMDN4?=
 =?utf-8?Q?l4XqMx6S+klSDZUU=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fec6c73-988a-4429-835a-08da3cdb788f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 16:44:14.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FY1xxZxfiCoFGecpGVvViGiyswnZwrjsTbXIx1lDR3/XOY3oldfXszNAkir/LTdT3rt96enz7kL13H2epiSe5ewrAIJIsnxTF0vrl75X51k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4672
X-Proofpoint-ORIG-GUID: DcOYDZ1-QqsHUMQCdffW-hzHr-lZCi-H
X-Proofpoint-GUID: DcOYDZ1-QqsHUMQCdffW-hzHr-lZCi-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_07,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 17/05/22 1:49 pm, Hyman Huang wrote:
> Thanks Manish for the comment, i'll give my explanation and any supplement are welcomed.
Really sorry for such late reply Hyman, this slipped my mind.
>
> 在 2022/5/17 1:13, manish.mishra 写道:
>> Hi Hyman Huang,
>>
>> I had few doubts regarding this patch series.
> For the first point, m'm rudely guessing that you want to figure out how should we set the vcpu dirty limit correctly during live migration to make it convergent.
>
> This can be achieved by set a single dirtylimit value on all vcpus, the value need not be equivalent of the half of available bandwidth so precisely since the dirtylimit is sufficient conditions of migration sucess, but not necessary condition.
>
> We can set the dirtylimit as the minimum of what user can tolerate, in most case, migration can achieve convergent in advance and do the switchover with the real dirtyrate greater than dirtylimit. This can be implemented because Qemu will check the criteria every iteration, once it meet the condition, Qemu will do the switch over no matter what convergent algo is.


Yes got it Hyman, my question was in direction that if we control dirty rate per vcpu, total dirty of VM become very unpredictable. For example if we have set dirty rate limit of each vcpu 50MBps for 10vcpu VM. Then total dirty rate of VM can be anywhere from 0-500MBps based on how many vcpu are active and how much. So if we had dirty rate limit control per VM it would have been much more predictable for user to use. I mean we can keep account of total dirty rate of VM and individual dirty rate and then assign throttle_sleep according to their weights to keep total dirty rate within limit of per vm dirty rate limit. But definately it can be targetted in future and should not be a blocker for now.

>>
>> 1. Why we choose for dirty rate limit per vcpu. I mean it becomes very hard for user to decide per
>>
>>      vcpu dirty rate limit. For e.g. we have 1Gbps network and 10 vcpu vm. Now if someone wants to
>>
>>      keep criteria for convergence as total dirty rate of VM should be lesser than half of available
>>
>>      bandwidth. For this case to ensure convergence user has to give dirty rate limit per vcpu
>>
>>      as 1Gbps/ 2 / 10 = 50Mbps. But assume then that VM has only 1 thread which is actively
>>
>>      dirtying memory, in that case so much of available quota will be wasted.
> This is a good and frequent question about dirtylimit, as mentioned above, throttle occurs only when dirty ring full and exit to user space.
> A vcpu is set up with dirtylimit during live migration, but it does not dirty memory, it may never get throttled.
> The dirtylimit only throttle those vcpu who dirty memory and dirtyrate greater then dirtylimit.
>
>  So would not it be
>>
>>      better to use dirty rate limit control per VM instead of vcpu?
>>
>> 2. Also Here we are adaptively trying to adjust sleep time based on current obsered dirty rate and
>>
>>      dirty rate limit. Can it be more forceful like. Assume we have dirty rate limit of 10pages
>>
>>      per sec and auto-converge/ dirty rate limit was triggered at time 0. Now at any point of time assume
>>
>>      at time 10 sec if number of pages dirtyed are more than 100pages we sleep for interpolated amount
>>
>>      of time. Basically at every dirty ring exit we can check if current number of pages dirtied are more than
>>
>>      what should be allowed by this time?
> Yes, indeed, but as memtioned above, if dirty ring exit, it give Qemu a hint that vcpu is dirting memory, we should check it.
>
> I post the series of dirtylimit capability for RFC, may be it can help me to explain the usage of vcpu dirty limit, it can be found here:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_qemu-2Ddevel_cover.1652762652.git.huangy81-40chinatelecom.cn_&d=DwIDaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=eTtzbPA0FcwY1xwq3KPGhj-Nk5zT41MwAjVGH8a-yeQokG7j3pJxtGsFVCzMDH2X&s=iitKUTNXv8Xkvs-n-K1Aow8MxLEP64RdTXw532_oLIY&e=
> Thanks,
> Yong
thanks I read this.

Also i had few additional things in mind.

1. I see there is no limit on cpu->throttle_us_per_full. I see below line but then ring_full_time_us can be very high value so in some rare cases cpu->throttle_us_per_full can be very high. I know few database applications which can not tolerate continous sleep of more than 2 secs. I agree user should not configure very low dirty rate limit to avoid such situation but then user may not have enough idea of algorithm so better we keep out internal limits?

cpu->throttle_us_per_full = MIN(cpu->throttle_us_per_full,
        ring_full_time_us * DIRTYLIMIT_THROTTLE_PCT_MAX);

2. Also this algorithm only control or limits dirty rate by guest writes. There can be some memory dirtying done by virtio based devices which is accounted only at qemu level so may not be accounted through dirty rings so do we have plan for that in future? Those are not issue for auto-converge as it slows full VM but dirty rate limit only slows guest writes.

>>
>> thanks
>>
>> Manish Mishra
>>
>> On 02/03/22 11:25 pm, huangy81@chinatelecom.cn wrote:
>>> From: Hyman Huang(黄勇)<huangy81@chinatelecom.cn>
>>>
>>> Setup a negative feedback system when vCPU thread
>>> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
>>> throttle_us_per_full field in struct CPUState. Sleep
>>> throttle_us_per_full microseconds to throttle vCPU
>>> if dirtylimit is in service.
>>>
>>> Signed-off-by: Hyman Huang(黄勇)<huangy81@chinatelecom.cn>
>>> Reviewed-by: Peter Xu<peterx@redhat.com>
>>> ---
>>>   accel/kvm/kvm-all.c         |  19 ++-
>>>   include/hw/core/cpu.h       |   6 +
>>>   include/sysemu/dirtylimit.h |  15 +++
>>>   softmmu/dirtylimit.c        | 291 ++++++++++++++++++++++++++++++++++++++++++++
>>>   softmmu/trace-events        |   7 ++
>>>   5 files changed, 337 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>> index 8821d80..98e43e6 100644
>>> --- a/accel/kvm/kvm-all.c
>>> +++ b/accel/kvm/kvm-all.c
>>> @@ -45,6 +45,7 @@
>>>   #include "qemu/guest-random.h"
>>>   #include "sysemu/hw_accel.h"
>>>   #include "kvm-cpus.h"
>>> +#include "sysemu/dirtylimit.h"
>>>     #include "hw/boards.h"
>>>   @@ -476,6 +477,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>>       cpu->kvm_state = s;
>>>       cpu->vcpu_dirty = true;
>>>       cpu->dirty_pages = 0;
>>> +    cpu->throttle_us_per_full = 0;
>>>         mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>>>       if (mmap_size < 0) {
>>> @@ -1469,6 +1471,11 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
>>>            */
>>>           sleep(1);
>>>   +        /* keep sleeping so that dirtylimit not be interfered by reaper */
>>> +        if (dirtylimit_in_service()) {
>>> +            continue;
>>> +        }
>>> +
>>>           trace_kvm_dirty_ring_reaper("wakeup");
>>>           r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
>>>   @@ -2964,8 +2971,18 @@ int kvm_cpu_exec(CPUState *cpu)
>>>                */
>>>               trace_kvm_dirty_ring_full(cpu->cpu_index);
>>>               qemu_mutex_lock_iothread();
>>> -            kvm_dirty_ring_reap(kvm_state, NULL);
>>> +            /* We throttle vCPU by making it sleep once it exit from kernel
>>> +             * due to dirty ring full. In the dirtylimit scenario, reaping
>>> +             * all vCPUs after a single vCPU dirty ring get full result in
>>> +             * the miss of sleep, so just reap the ring-fulled vCPU.
>>> +             */
>>> +            if (dirtylimit_in_service()) {
>>> +                kvm_dirty_ring_reap(kvm_state, cpu);
>>> +            } else {
>>> +                kvm_dirty_ring_reap(kvm_state, NULL);
>>> +            }
>>>               qemu_mutex_unlock_iothread();
>>> +            dirtylimit_vcpu_execute(cpu);
>>>               ret = 0;
>>>               break;
>>>           case KVM_EXIT_SYSTEM_EVENT:
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 76ab3b8..dbeb31a 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -411,6 +411,12 @@ struct CPUState {
>>>        */
>>>       bool throttle_thread_scheduled;
>>>   +    /*
>>> +     * Sleep throttle_us_per_full microseconds once dirty ring is full
>>> +     * if dirty page rate limit is enabled.
>>> +     */
>>> +    int64_t throttle_us_per_full;
>>> +
>>>       bool ignore_memory_transaction_failures;
>>>         /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
>>> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
>>> index da459f0..8d2c1f3 100644
>>> --- a/include/sysemu/dirtylimit.h
>>> +++ b/include/sysemu/dirtylimit.h
>>> @@ -19,4 +19,19 @@ void vcpu_dirty_rate_stat_start(void);
>>>   void vcpu_dirty_rate_stat_stop(void);
>>>   void vcpu_dirty_rate_stat_initialize(void);
>>>   void vcpu_dirty_rate_stat_finalize(void);
>>> +
>>> +void dirtylimit_state_lock(void);
>>> +void dirtylimit_state_unlock(void);
>>> +void dirtylimit_state_initialize(void);
>>> +void dirtylimit_state_finalize(void);
>>> +bool dirtylimit_in_service(void);
>>> +bool dirtylimit_vcpu_index_valid(int cpu_index);
>>> +void dirtylimit_process(void);
>>> +void dirtylimit_change(bool start);
>>> +void dirtylimit_set_vcpu(int cpu_index,
>>> +                         uint64_t quota,
>>> +                         bool enable);
>>> +void dirtylimit_set_all(uint64_t quota,
>>> +                        bool enable);
>>> +void dirtylimit_vcpu_execute(CPUState *cpu);
>>>   #endif
>>> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
>>> index 6102e8c..76d0b44 100644
>>> --- a/softmmu/dirtylimit.c
>>> +++ b/softmmu/dirtylimit.c
>>> @@ -18,6 +18,26 @@
>>>   #include "sysemu/dirtylimit.h"
>>>   #include "exec/memory.h"
>>>   #include "hw/boards.h"
>>> +#include "sysemu/kvm.h"
>>> +#include "trace.h"
>>> +
>>> +/*
>>> + * Dirtylimit stop working if dirty page rate error
>>> + * value less than DIRTYLIMIT_TOLERANCE_RANGE
>>> + */
>>> +#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
>>> +/*
>>> + * Plus or minus vcpu sleep time linearly if dirty
>>> + * page rate error value percentage over
>>> + * DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT.
>>> + * Otherwise, plus or minus a fixed vcpu sleep time.
>>> + */
>>> +#define DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT     50
>>> +/*
>>> + * Max vcpu sleep time percentage during a cycle
>>> + * composed of dirty ring full and sleep time.
>>> + */
>>> +#define DIRTYLIMIT_THROTTLE_PCT_MAX 99
>>>     struct {
>>>       VcpuStat stat;
>>> @@ -25,6 +45,30 @@ struct {
>>>       QemuThread thread;
>>>   } *vcpu_dirty_rate_stat;
>>>   +typedef struct VcpuDirtyLimitState {
>>> +    int cpu_index;
>>> +    bool enabled;
>>> +    /*
>>> +     * Quota dirty page rate, unit is MB/s
>>> +     * zero if not enabled.
>>> +     */
>>> +    uint64_t quota;
>>> +} VcpuDirtyLimitState;
>>> +
>>> +struct {
>>> +    VcpuDirtyLimitState *states;
>>> +    /* Max cpus number configured by user */
>>> +    int max_cpus;
>>> +    /* Number of vcpu under dirtylimit */
>>> +    int limited_nvcpu;
>>> +} *dirtylimit_state;
>>> +
>>> +/* protect dirtylimit_state */
>>> +static QemuMutex dirtylimit_mutex;
>>> +
>>> +/* dirtylimit thread quit if dirtylimit_quit is true */
>>> +static bool dirtylimit_quit;
>>> +
>>>   static void vcpu_dirty_rate_stat_collect(void)
>>>   {
>>>       VcpuStat stat;
>>> @@ -54,6 +98,9 @@ static void *vcpu_dirty_rate_stat_thread(void *opaque)
>>>         while (qatomic_read(&vcpu_dirty_rate_stat->running)) {
>>>           vcpu_dirty_rate_stat_collect();
>>> +        if (dirtylimit_in_service()) {
>>> +            dirtylimit_process();
>>> +        }
>>>       }
>>>         /* stop log sync */
>>> @@ -86,9 +133,11 @@ void vcpu_dirty_rate_stat_start(void)
>>>   void vcpu_dirty_rate_stat_stop(void)
>>>   {
>>>       qatomic_set(&vcpu_dirty_rate_stat->running, 0);
>>> +    dirtylimit_state_unlock();
>>>       qemu_mutex_unlock_iothread();
>>>       qemu_thread_join(&vcpu_dirty_rate_stat->thread);
>>>       qemu_mutex_lock_iothread();
>>> +    dirtylimit_state_lock();
>>>   }
>>>     void vcpu_dirty_rate_stat_initialize(void)
>>> @@ -114,3 +163,245 @@ void vcpu_dirty_rate_stat_finalize(void)
>>>       free(vcpu_dirty_rate_stat);
>>>       vcpu_dirty_rate_stat = NULL;
>>>   }
>>> +
>>> +void dirtylimit_state_lock(void)
>>> +{
>>> +    qemu_mutex_lock(&dirtylimit_mutex);
>>> +}
>>> +
>>> +void dirtylimit_state_unlock(void)
>>> +{
>>> +    qemu_mutex_unlock(&dirtylimit_mutex);
>>> +}
>>> +
>>> +static void
>>> +__attribute__((__constructor__)) dirtylimit_mutex_init(void)
>>> +{
>>> +    qemu_mutex_init(&dirtylimit_mutex);
>>> +}
>>> +
>>> +static inline VcpuDirtyLimitState *dirtylimit_vcpu_get_state(int cpu_index)
>>> +{
>>> +    return &dirtylimit_state->states[cpu_index];
>>> +}
>>> +
>>> +void dirtylimit_state_initialize(void)
>>> +{
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>> +    int max_cpus = ms->smp.max_cpus;
>>> +    int i;
>>> +
>>> +    dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
>>> +
>>> +    dirtylimit_state->states =
>>> +            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
>>> +
>>> +    for (i = 0; i < max_cpus; i++) {
>>> +        dirtylimit_state->states[i].cpu_index = i;
>>> +    }
>>> +
>>> +    dirtylimit_state->max_cpus = max_cpus;
>>> +    trace_dirtylimit_state_initialize(max_cpus);
>>> +}
>>> +
>>> +void dirtylimit_state_finalize(void)
>>> +{
>>> +    free(dirtylimit_state->states);
>>> +    dirtylimit_state->states = NULL;
>>> +
>>> +    free(dirtylimit_state);
>>> +    dirtylimit_state = NULL;
>>> +
>>> +    trace_dirtylimit_state_finalize();
>>> +}
>>> +
>>> +bool dirtylimit_in_service(void)
>>> +{
>>> +    return !!dirtylimit_state;
>>> +}
>>> +
>>> +bool dirtylimit_vcpu_index_valid(int cpu_index)
>>> +{
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>> +
>>> +    return !(cpu_index < 0 ||
>>> +             cpu_index >= ms->smp.max_cpus);
>>> +}
>>> +
>>> +static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
>>> +{
>>> +    static uint64_t max_dirtyrate;
>>> +    uint32_t dirty_ring_size = kvm_dirty_ring_size();
>>> +    uint64_t dirty_ring_size_meory_MB =
>>> +        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
>>> +
>>> +    if (max_dirtyrate < dirtyrate) {
>>> +        max_dirtyrate = dirtyrate;
>>> +    }
>>> +
>>> +    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
>>> +}
>>> +
>>> +static inline bool dirtylimit_done(uint64_t quota,
>>> +                                   uint64_t current)
>>> +{
>>> +    uint64_t min, max;
>>> +
>>> +    min = MIN(quota, current);
>>> +    max = MAX(quota, current);
>>> +
>>> +    return ((max - min) <= DIRTYLIMIT_TOLERANCE_RANGE) ? true : false;
>>> +}
>>> +
>>> +static inline bool
>>> +dirtylimit_need_linear_adjustment(uint64_t quota,
>>> +                                  uint64_t current)
>>> +{
>>> +    uint64_t min, max;
>>> +
>>> +    min = MIN(quota, current);
>>> +    max = MAX(quota, current);
>>> +
>>> +    return ((max - min) * 100 / max) > DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT;
>>> +}
>>> +
>>> +static void dirtylimit_set_throttle(CPUState *cpu,
>>> +                                    uint64_t quota,
>>> +                                    uint64_t current)
>>> +{
>>> +    int64_t ring_full_time_us = 0;
>>> +    uint64_t sleep_pct = 0;
>>> +    uint64_t throttle_us = 0;
>>> +
>>> +    if (current == 0) {
>>> +        cpu->throttle_us_per_full = 0;
>>> +        return;
>>> +    }
>>> +
>>> +    ring_full_time_us = dirtylimit_dirty_ring_full_time(current);
>>> +
>>> +    if (dirtylimit_need_linear_adjustment(quota, current)) {
>>> +        if (quota < current) {
>>> +            sleep_pct = (current - quota) * 100 / current;
>>> +            throttle_us =
>>> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
>>> +            cpu->throttle_us_per_full += throttle_us;
>>> +        } else {
>>> +            sleep_pct = (quota - current) * 100 / quota;
>>> +            throttle_us =
>>> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
>>> +            cpu->throttle_us_per_full -= throttle_us;
>>> +        }
>>> +
>>> +        trace_dirtylimit_throttle_pct(cpu->cpu_index,
>>> +                                      sleep_pct,
>>> +                                      throttle_us);
>>> +    } else {
>>> +        if (quota < current) {
>>> +            cpu->throttle_us_per_full += ring_full_time_us / 10;
>>> +        } else {
>>> +            cpu->throttle_us_per_full -= ring_full_time_us / 10;
>>> +        }
>>> +    }
>>> +
>>> +    /*
>>> +     * TODO: in the big kvm_dirty_ring_size case (eg: 65536, or other scenario),
>>> +     *       current dirty page rate may never reach the quota, we should stop
>>> +     *       increasing sleep time?
>>> +     */
>>> +    cpu->throttle_us_per_full = MIN(cpu->throttle_us_per_full,
>>> +        ring_full_time_us * DIRTYLIMIT_THROTTLE_PCT_MAX);
>>> +
>>> +    cpu->throttle_us_per_full = MAX(cpu->throttle_us_per_full, 0);
>>> +}
>>> +
>>> +static void dirtylimit_adjust_throttle(CPUState *cpu)
>>> +{
>>> +    uint64_t quota = 0;
>>> +    uint64_t current = 0;
>>> +    int cpu_index = cpu->cpu_index;
>>> +
>>> +    quota = dirtylimit_vcpu_get_state(cpu_index)->quota;
>>> +    current = vcpu_dirty_rate_get(cpu_index);
>>> +
>>> +    if (!dirtylimit_done(quota, current)) {
>>> +        dirtylimit_set_throttle(cpu, quota, current);
>>> +    }
>>> +
>>> +    return;
>>> +}
>>> +
>>> +void dirtylimit_process(void)
>>> +{
>>> +    CPUState *cpu;
>>> +
>>> +    if (!qatomic_read(&dirtylimit_quit)) {
>>> +        dirtylimit_state_lock();
>>> +
>>> +        if (!dirtylimit_in_service()) {
>>> +            dirtylimit_state_unlock();
>>> +            return;
>>> +        }
>>> +
>>> +        CPU_FOREACH(cpu) {
>>> +            if (!dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled) {
>>> +                continue;
>>> +            }
>>> +            dirtylimit_adjust_throttle(cpu);
>>> +        }
>>> +        dirtylimit_state_unlock();
>>> +    }
>>> +}
>>> +
>>> +void dirtylimit_change(bool start)
>>> +{
>>> +    if (start) {
>>> +        qatomic_set(&dirtylimit_quit, 0);
>>> +    } else {
>>> +        qatomic_set(&dirtylimit_quit, 1);
>>> +    }
>>> +}
>>> +
>>> +void dirtylimit_set_vcpu(int cpu_index,
>>> +                         uint64_t quota,
>>> +                         bool enable)
>>> +{
>>> +    trace_dirtylimit_set_vcpu(cpu_index, quota);
>>> +
>>> +    if (enable) {
>>> +        dirtylimit_state->states[cpu_index].quota = quota;
>>> +        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
>>> +            dirtylimit_state->limited_nvcpu++;
>>> +        }
>>> +    } else {
>>> +        dirtylimit_state->states[cpu_index].quota = 0;
>>> +        if (dirtylimit_state->states[cpu_index].enabled) {
>>> +            dirtylimit_state->limited_nvcpu--;
>>> +        }
>>> +    }
>>> +
>>> +    dirtylimit_state->states[cpu_index].enabled = enable;
>>> +}
>>> +
>>> +void dirtylimit_set_all(uint64_t quota,
>>> +                        bool enable)
>>> +{
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>> +    int max_cpus = ms->smp.max_cpus;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < max_cpus; i++) {
>>> +        dirtylimit_set_vcpu(i, quota, enable);
>>> +    }
>>> +}
>>> +
>>> +void dirtylimit_vcpu_execute(CPUState *cpu)
>>> +{
>>> +    if (dirtylimit_in_service() &&
>>> + dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled &&
>>> +        cpu->throttle_us_per_full) {
>>> +        trace_dirtylimit_vcpu_execute(cpu->cpu_index,
>>> +                cpu->throttle_us_per_full);
>>> +        usleep(cpu->throttle_us_per_full);
>>> +    }
>>> +}
>>> diff --git a/softmmu/trace-events b/softmmu/trace-events
>>> index 9c88887..22606dc 100644
>>> --- a/softmmu/trace-events
>>> +++ b/softmmu/trace-events
>>> @@ -31,3 +31,10 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
>>>   system_wakeup_request(int reason) "reason=%d"
>>>   qemu_system_shutdown_request(int reason) "reason=%d"
>>>   qemu_system_powerdown_request(void) ""
>>> +
>>> +#dirtylimit.c
>>> +dirtylimit_state_initialize(int max_cpus) "dirtylimit state initialize: max cpus %d"
>>> +dirtylimit_state_finalize(void)
>>> +dirtylimit_throttle_pct(int cpu_index, uint64_t pct, int64_t time_us) "CPU[%d] throttle percent: %" PRIu64 ", throttle adjust time %"PRIi64 " us"
>>> +dirtylimit_set_vcpu(int cpu_index, uint64_t quota) "CPU[%d] set dirty page rate limit %"PRIu64
>>> +dirtylimit_vcpu_execute(int cpu_index, int64_t sleep_time_us) "CPU[%d] sleep %"PRIi64 " us"
>

