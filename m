Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09765237E3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 17:57:25 +0200 (CEST)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nooiK-0008LF-II
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 11:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1noofu-0006pS-S6
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:54:55 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:2990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1noofp-0003e5-HF
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:54:53 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BD5AdZ004684;
 Wed, 11 May 2022 08:54:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=BChbuzycRQMxwogUU4qfc0qt0GIHVD/ccWHxYgRfHNQ=;
 b=IVVaXk4sF6OdxNVjeEdsW5h7KSDjIz97Dh6wllvmJj4ThHpGe1bxlTLN2SyTeY5Qi2+U
 wxND4mzyW/uNJjhTT8loIN3l/6a5EKbK4s9NkSCIEmokTH8lqYJG0K37ffYcCcyhB5DD
 gFzryqDad9WYNKQ055GG89t/5kSRc9EfNb5TIk4hUSbHmCDanDISjsPpS704DGmfLL/L
 5KxhecR22IVdImJz3L1bkgW4CASGbymEE5f1qWLI0qIv9zJXeB/MFB+8SoAFeR1iBDE9
 yYD1bx1dMl35vfI3FpR0xHQr90QNABDeYSeom+T+xCXcWz2+sugxnMyhkmRgykmujMPM 7g== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3fwmp88ucd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 08:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFME0OburGE7Ia3eD9U/789S+Br4kDdXPFCBbY3uCxJThsvb30QjBrMAAKUYWQ7EHp3KqosGMw60nelN7+geHTZN+5qT7BJLfqH8/65tpGvw/FlyqCBFPmrCMTZVCvhFJtHoB2wei/+KP1KUsRfXSTCXGzZknSjiD/YwwwFckDxASeu5Pn3tYniF4HgVGRN2BcTf3KoEIm9PutHFqu63UIo0POZfU3DNFJHwpDxTdZKrj3d9ujYSAXlNSQGha8uc5+XDj6LopL9xAF6Vw1njTc+eB9pa9RiTkTP/PupeXCwlCXj0F55qtqoieEIq4RaEuLqYEDRPFaMH6isJafIaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BChbuzycRQMxwogUU4qfc0qt0GIHVD/ccWHxYgRfHNQ=;
 b=JNRatZZjlJ4jOiiW6k4LOIHacV7mI0B+4pBIe+3tKGslcJsOf/AR1O2D+A6SbIGNLrJpJzCsiBvmEpoHMXdosSn6D3FKw+GY1wllGIMTB5FVIOU6TD5xngLjCK74bTBUHa2i3dyakBWdppyA52I4UHOe4pwye1CvVk/HyRoI7m0UFehD4d55ArMwhHSTw5WfGm7GQ/sRCK1VMZ7oRi4D6d9yt1iBq2O8okQ5TcGbrH+mc7zbAWnmkupnp0nGOBl8OMvNPQEu3b2z8B+FvMGdHKSyvqAP2NaBZnETiBOIZ5I8by8Yel4I+L/LETwGM4oQjAsG6ldl4jk4S2V8EVIoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SN4PR0201MB3616.namprd02.prod.outlook.com (2603:10b6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 15:54:38 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 15:54:38 +0000
Content-Type: multipart/alternative;
 boundary="------------nvtONNDW0jO0iczJDbE4MdZg"
Message-ID: <b42e7619-7ba7-6933-b4d7-b67b06704d15@nutanix.com>
Date: Wed, 11 May 2022 21:24:28 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 10/19] migration: Postcopy preemption enablement
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-11-peterx@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20220331150857.74406-11-peterx@redhat.com>
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba68cf47-921d-42ea-bea5-08da33668d5e
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3616:EE_
X-Microsoft-Antispam-PRVS: <SN4PR0201MB361645128A7D36A053A631A8F6C89@SN4PR0201MB3616.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9L4VdJSraycB6w9IYbN3HGK4ErzugQx2TKBm/fqAuRE8hTemD/nzu2Q9rVrsYnVpOiMNquxgnC9U3kAJtQ5xE3ggugSqD6CHtu0xbXp+gyMnupLgdCit4YCjs2UdC90QRIpHi8uqO1GtDD/+oBsEUPGJCKhnWZO1PTti1G0YTcOGISlULDRPdxzKEU/nkhksDk5AGKnDHrP0Dcc9J9Kf44n4jj3kQDZC0WdnDUTPJvMJZ8e2OoGx3Hs+KGPLbQmKNMR+4bai59Kmxc9tu5f6K2onOdrcSVKJ/myrE9IxOsChb1aS68Z7CE4yyElayBrAUvLLKE9mt6HfwKWVorgTST2ReldS1f9YM46X+d37y3DvcId3WWMI5VMYy8LCti8J/uFUqZNGlSrrp+ERyx2XrmZub4DSa8YXhAW30bR0EXovsV1SA6QpU2koX3pbjerBtX8loSxM3uBy451pXdJ5G7q4RNDo/amgoA1/EOnzyAoP9mEQnjT5qqjIVNoLLOQ4b/4pGf3PkrwJj1DmTkdcb+7FM7DoBcw+s29NAVq6UUEw1uYfT33Wi48BW3Jexi2y6IPXmvReu+b2Md9cj3xW+yAD5TR+iuSprj0mV1V7cs+KmtBpdL3kWsEPaPOUw0flCc+a1oNiHptanA4Kz45sDt9mnJX9NDpGJTzbUXuCbI/vUjEqM4eys7iWi1SwxNf5K9xmqHhxx5hXGvXSY12HXhbJxIdfhmW6v/8jIzB7Gk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(8936002)(2906002)(86362001)(5660300002)(66476007)(30864003)(66556008)(31696002)(2616005)(83380400001)(66946007)(4326008)(186003)(53546011)(6486002)(33964004)(6666004)(6506007)(36756003)(31686004)(54906003)(508600001)(316002)(26005)(6512007)(38100700002)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmVIaDZJb3NSNllZNmZYRnJsUkR3YjJnQkJ2Yi9ZSG9RMGVaYVFHUTBVMzlP?=
 =?utf-8?B?amNvZWR5Y0E3NHRwZVhGM0NOTTZzRzZjY2ZNbzRyK29GTEtLMzFSTTZGVGQ4?=
 =?utf-8?B?V25NSlFtSmNPdEFuUEhxNW9wVVA4anFIdWNodmkrSEYwaUZHM2t5L0wvNWFz?=
 =?utf-8?B?K2JkRXhtcXVybkVqWEtnOXdySkRWVGhDNEZVdUc0SW9wUTkyVkEvaGw1M1dW?=
 =?utf-8?B?VXN2WmRWU3l5aDVpYVVvdTRGQ0VXMTF3S2x1VjNRV2dCZzg2ZEhESmhlOW5a?=
 =?utf-8?B?c3JuZVp4RnN0SmlnQyt0UDlXY05HZUwzTkt2cjZ6c3lsMkZpK0tXVEZJcHdH?=
 =?utf-8?B?WFpKV1ZPeThtTEVUYjh4RjAxYWRUUHZXckI1MWh2cmhjWlJ4T2ZOajRxcWtG?=
 =?utf-8?B?WHJ4MENDV1c2VTk2Zk90QW1rSmMyWDVSQUtpdmtTd2owSE1OYkpEdlA5RVd2?=
 =?utf-8?B?T1FXZGJIRmNpdVFrVGo2Y1BKcDFTUzZWY3V2cGVvUGFWNG43VjIvaUpLaENL?=
 =?utf-8?B?ZmxIS3lFdGtCQUNjbWxoamlXMEtiVlorSzQ3Q3BBako5M0FNL0FVOGV3eDFa?=
 =?utf-8?B?M2pmdnJvcndZUVh6VFpxcUphMEdyNnlucG12cWpjK21DTG9NdHhvSFVpbmM2?=
 =?utf-8?B?TGZIM1U0MjlicDYxaWUzeDRsZDBYZ2JUTmp1MjhPeU4wZURVNlN4KytHbDN5?=
 =?utf-8?B?LzU3VlcwRU1BanQ1b1hVU0pWc29NV1ZzZGlVNUtDRUlmbkJyN2htQlZ4ckx4?=
 =?utf-8?B?YXBxMWxYSG9KT3lVaWFUREhvU2hwS0V3MlRsZENXUVlkK0w2WlVPYjFLTkFY?=
 =?utf-8?B?MEhBckhGOGpJTncxT2lkWVhMNGg4T1YrL3RCOW5ucnBjdGgvbUFodjU2WXhk?=
 =?utf-8?B?dnFPV3pjNm8rdXJNN0R2ZFpZalRGMHIra0NiNlliRUdvOVNvUHM1c3RMV3hm?=
 =?utf-8?B?TjYvUkFtMVEvQnZVSVVZTk5uaWJGMjNCM1Mra2lxNUdtY0thbnRGVVh4SEh5?=
 =?utf-8?B?MlRITExzeDJDTVRrWU1nNktVMm4vdTh1ZVIvMExLeEpmdVVtVnhDbjZQTjlG?=
 =?utf-8?B?czJmUWxWK29naEt1WWZJbHd4ZGpiRDlMNVZmcGdEWDlsUDEyUWdZMk5EV3hJ?=
 =?utf-8?B?YWh4VC8vVGVYbEhhb2Y2cFNLNUxMaG9MUjRWN2QrQktRVjZ0VUJTN0FPZzQ4?=
 =?utf-8?B?RlZlR1Iwb3h0WmQwcW0wZGlJS1hsV3lVTHpiZVZCdXE2bi9kWmFmUWdkTjdG?=
 =?utf-8?B?aW5sVWNTNTY3VWhQSGFUWDJsTTFNcHFOajMrNm1QNUlaMThxbXZxNUZ3dWZG?=
 =?utf-8?B?MjJ6RkNONDd2UUN4UzZoQWN4eGZmM3NmamdmU3p0Vk5ZdDRyNWRRdzlLNmtW?=
 =?utf-8?B?UmtvbnUybEdNeWt6YzYwT0hRUDI1VnhjZFlLbGVva1AvcWZDc3NJNUxURm1v?=
 =?utf-8?B?MVMwSm9uNEJJc0VrSnJLZ0x3MDJNWHVUUUhHWjU2dzh4a1VacFVpeU96ek1C?=
 =?utf-8?B?eVNYM2IrQ2R1VE13cENWb1BqeXpzZE9NZUZQQWJqNmNNOVdocURnRm5YM0pw?=
 =?utf-8?B?Z2FpVkxidGYwZzdGcmtPaUovTHkvSmFCeDBnOUdQMjl4YUdLcmEzN2dycVZs?=
 =?utf-8?B?V1BVT21oRFY4NW9ZcTFVYjFqbGJGR3d3NVZSenFPZUE1ZjVjTCtYWEpPc1ZH?=
 =?utf-8?B?Q1FLdDNHcUIzTnpmbkJCVmY5Q0JRb0FvSnJORDBUNW5NTDVEQ250SW95QzJn?=
 =?utf-8?B?MnFLNDJMS0dsUVUrM0YrQ3NNbEtwZElxTDFWZXRIWEs3RDRlcTBIMVBUMWVi?=
 =?utf-8?B?M2JyYjJhZHVsd3gzSlk2RS9PRzFMSHZwYmVDZjJOK05uVDBMd1FudDRSbEZq?=
 =?utf-8?B?VGd5SVp5SnBzTmErUG1nVW0ydisrUkptc0lyNVlEU2FJcUM3azBBNDZ5MTdV?=
 =?utf-8?B?Y0pWOEFadXBUT3dFMHl1dzRhZ3FyaGV5WmdPaVRnMzJYbUNpbU1CUEhIWTZC?=
 =?utf-8?B?TDd0bUluQXErdDJiclFGTkR5cks4dHVUQ0ZYcE1uZDBLUGptMGMxUzRYbkJn?=
 =?utf-8?B?VzhwTkxZREVobWxaazhpaGsxZXhBeDlFYkNwdDBpc3pkMDZYdG1VOHliQUZV?=
 =?utf-8?B?WlJsRm5XK0xvQ1ZFVjJGT3Z6cDBpNldNeVZjaFVSZm9nMnhhQlF4TzNtTHY2?=
 =?utf-8?B?Q3dndVJQeWY5VTB0OG9JdmUrRlNYUmNHSlhxNDZScjhlRmFadnNpVzZubjd2?=
 =?utf-8?B?a09DTnpQNkFEd1hWRDJDZjUyY0NPRjY4OWVoWlVFSTdqQ3hacjFuaXZUQ01V?=
 =?utf-8?B?eERnTUdzYkRyWFNjZ0d1QlNWS0JSN2x4YkVFTUVWdktQQWRoTlJ3c3FkK3ZR?=
 =?utf-8?Q?akgE50VQpSJxbr50=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba68cf47-921d-42ea-bea5-08da33668d5e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:54:38.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvFy/e8WTkqtX6XYP+KjGhAsO85jPIQJsHTJCEansR4STCh0UyidTdFtuVqv6BJcUk+cYXjUTwWPaDilfLUQ9na6mSUMhlI1QIS+oUfyfM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3616
X-Proofpoint-GUID: rtBTOYB6ZPXMHUcVXPWuNuPzui-9nWO2
X-Proofpoint-ORIG-GUID: rtBTOYB6ZPXMHUcVXPWuNuPzui-9nWO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--------------nvtONNDW0jO0iczJDbE4MdZg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/03/22 8:38 pm, Peter Xu wrote:

LGTM

> This patch enables postcopy-preempt feature.
>
> It contains two major changes to the migration logic:
>
> (1) Postcopy requests are now sent via a different socket from precopy
>      background migration stream, so as to be isolated from very high page
>      request delays.
>
> (2) For huge page enabled hosts: when there's postcopy requests, they can now
>      intercept a partial sending of huge host pages on src QEMU.
>
> After this patch, we'll live migrate a VM with two channels for postcopy: (1)
> PRECOPY channel, which is the default channel that transfers background pages;
> and (2) POSTCOPY channel, which only transfers requested pages.
>
> There's no strict rule of which channel to use, e.g., if a requested page is
> already being transferred on precopy channel, then we will keep using the same
> precopy channel to transfer the page even if it's explicitly requested.  In 99%
> of the cases we'll prioritize the channels so we send requested page via the
> postcopy channel as long as possible.
>
> On the source QEMU, when we found a postcopy request, we'll interrupt the
> PRECOPY channel sending process and quickly switch to the POSTCOPY channel.
> After we serviced all the high priority postcopy pages, we'll switch back to
> PRECOPY channel so that we'll continue to send the interrupted huge page again.
> There's no new thread introduced on src QEMU.
>
> On the destination QEMU, one new thread is introduced to receive page data from
> the postcopy specific socket (done in the preparation patch).
>
> This patch has a side effect: after sending postcopy pages, previously we'll
> assume the guest will access follow up pages so we'll keep sending from there.
> Now it's changed.  Instead of going on with a postcopy requested page, we'll go
> back and continue sending the precopy huge page (which can be intercepted by a
> postcopy request so the huge page can be sent partially before).
>
> Whether that's a problem is debatable, because "assuming the guest will
> continue to access the next page" may not really suite when huge pages are
> used, especially if the huge page is large (e.g. 1GB pages).  So that locality
> hint is much meaningless if huge pages are used.
>
> Reviewed-by: Dr. David Alan Gilbert<dgilbert@redhat.com>
> Signed-off-by: Peter Xu<peterx@redhat.com>
> ---
>   migration/migration.c  |   2 +
>   migration/migration.h  |   2 +-
>   migration/ram.c        | 250 +++++++++++++++++++++++++++++++++++++++--
>   migration/trace-events |   7 ++
>   4 files changed, 252 insertions(+), 9 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 01b882494d..56d54c186b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3158,6 +3158,8 @@ static int postcopy_start(MigrationState *ms)
>                                 MIGRATION_STATUS_FAILED);
>       }
>   
> +    trace_postcopy_preempt_enabled(migrate_postcopy_preempt());
> +
>       return ret;
>   
>   fail_closefb:
> diff --git a/migration/migration.h b/migration/migration.h
> index caa910d956..b8aacfe3af 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -68,7 +68,7 @@ typedef struct {
>   struct MigrationIncomingState {
>       QEMUFile *from_src_file;
>       /* Previously received RAM's RAMBlock pointer */
> -    RAMBlock *last_recv_block;
> +    RAMBlock *last_recv_block[RAM_CHANNEL_MAX];
>       /* A hook to allow cleanup at the end of incoming migration */
>       void *transport_data;
>       void (*transport_cleanup)(void *data);
> diff --git a/migration/ram.c b/migration/ram.c
> index c7ea1d9215..518d511874 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -295,6 +295,20 @@ struct RAMSrcPageRequest {
>       QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
>   };
>   
> +typedef struct {
> +    /*
> +     * Cached ramblock/offset values if preempted.  They're only meaningful if
> +     * preempted==true below.
> +     */
> +    RAMBlock *ram_block;
> +    unsigned long ram_page;
> +    /*
> +     * Whether a postcopy preemption just happened.  Will be reset after
> +     * precopy recovered to background migration.
> +     */
> +    bool preempted;
> +} PostcopyPreemptState;
> +
>   /* State of RAM for migration */
>   struct RAMState {
>       /* QEMUFile used for this migration */
> @@ -349,6 +363,14 @@ struct RAMState {
>       /* Queue of outstanding page requests from the destination */
>       QemuMutex src_page_req_mutex;
>       QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
> +
> +    /* Postcopy preemption informations */
> +    PostcopyPreemptState postcopy_preempt_state;
> +    /*
> +     * Current channel we're using on src VM.  Only valid if postcopy-preempt
> +     * is enabled.
> +     */
> +    unsigned int postcopy_channel;
>   };
>   typedef struct RAMState RAMState;
>   
> @@ -356,6 +378,11 @@ static RAMState *ram_state;
>   
>   static NotifierWithReturnList precopy_notifier_list;
>   
> +static void postcopy_preempt_reset(RAMState *rs)
> +{
> +    memset(&rs->postcopy_preempt_state, 0, sizeof(PostcopyPreemptState));
> +}
> +
>   /* Whether postcopy has queued requests? */
>   static bool postcopy_has_request(RAMState *rs)
>   {
> @@ -1947,6 +1974,55 @@ void ram_write_tracking_stop(void)
>   }
>   #endif /* defined(__linux__) */
>   
> +/*
> + * Check whether two addr/offset of the ramblock falls onto the same host huge
> + * page.  Returns true if so, false otherwise.
> + */
> +static bool offset_on_same_huge_page(RAMBlock *rb, uint64_t addr1,
> +                                     uint64_t addr2)
> +{
> +    size_t page_size = qemu_ram_pagesize(rb);
> +
> +    addr1 = ROUND_DOWN(addr1, page_size);
> +    addr2 = ROUND_DOWN(addr2, page_size);
> +
> +    return addr1 == addr2;
> +}
> +
> +/*
> + * Whether a previous preempted precopy huge page contains current requested
> + * page?  Returns true if so, false otherwise.
> + *
> + * This should really happen very rarely, because it means when we were sending
> + * during background migration for postcopy we're sending exactly the page that
> + * some vcpu got faulted on on dest node.  When it happens, we probably don't
> + * need to do much but drop the request, because we know right after we restore
> + * the precopy stream it'll be serviced.  It'll slightly affect the order of
> + * postcopy requests to be serviced (e.g. it'll be the same as we move current
> + * request to the end of the queue) but it shouldn't be a big deal.  The most
> + * imporant thing is we can _never_ try to send a partial-sent huge page on the
> + * POSTCOPY channel again, otherwise that huge page will got "split brain" on
> + * two channels (PRECOPY, POSTCOPY).
> + */
> +static bool postcopy_preempted_contains(RAMState *rs, RAMBlock *block,
> +                                        ram_addr_t offset)
> +{
> +    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
> +
> +    /* No preemption at all? */
> +    if (!state->preempted) {
> +        return false;
> +    }
> +
> +    /* Not even the same ramblock? */
> +    if (state->ram_block != block) {
> +        return false;
> +    }
> +
> +    return offset_on_same_huge_page(block, offset,
> +                                    state->ram_page << TARGET_PAGE_BITS);
> +}
> +
>   /**
>    * get_queued_page: unqueue a page from the postcopy requests
>    *
> @@ -1962,9 +2038,17 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>       RAMBlock  *block;
>       ram_addr_t offset;
>   
> +again:
>       block = unqueue_page(rs, &offset);
>   
> -    if (!block) {
> +    if (block) {
> +        /* See comment above postcopy_preempted_contains() */
> +        if (postcopy_preempted_contains(rs, block, offset)) {
> +            trace_postcopy_preempt_hit(block->idstr, offset);
> +            /* This request is dropped */
> +            goto again;
> +        }
If we continuosly keep on getting new post-copy request. Is it possible 
this case can starve post-copy request which is in precopy preemtion?
> +    } else {
>           /*
>            * Poll write faults too if background snapshot is enabled; that's
>            * when we have vcpus got blocked by the write protected pages.
> @@ -2180,6 +2264,117 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>       return ram_save_page(rs, pss);
>   }
>   
> +static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
> +{
> +    /* Not enabled eager preempt?  Then never do that. */
> +    if (!migrate_postcopy_preempt()) {
> +        return false;
> +    }
> +
> +    /* If the ramblock we're sending is a small page?  Never bother. */
> +    if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
> +        return false;
> +    }
> +
> +    /* Not in postcopy at all? */
> +    if (!migration_in_postcopy()) {
> +        return false;
> +    }
> +
> +    /*
> +     * If we're already handling a postcopy request, don't preempt as this page
> +     * has got the same high priority.
> +     */
> +    if (pss->postcopy_requested) {
> +        return false;
> +    }
> +
> +    /* If there's postcopy requests, then check it up! */
> +    return postcopy_has_request(rs);
> +}
> +
> +/* Returns true if we preempted precopy, false otherwise */
> +static void postcopy_do_preempt(RAMState *rs, PageSearchStatus *pss)
> +{
> +    PostcopyPreemptState *p_state = &rs->postcopy_preempt_state;
> +
> +    trace_postcopy_preempt_triggered(pss->block->idstr, pss->page);
> +
> +    /*
> +     * Time to preempt precopy. Cache current PSS into preempt state, so that
> +     * after handling the postcopy pages we can recover to it.  We need to do
> +     * so because the dest VM will have partial of the precopy huge page kept
> +     * over in its tmp huge page caches; better move on with it when we can.
> +     */
> +    p_state->ram_block = pss->block;
> +    p_state->ram_page = pss->page;
> +    p_state->preempted = true;
> +}
> +
> +/* Whether we're preempted by a postcopy request during sending a huge page */
> +static bool postcopy_preempt_triggered(RAMState *rs)
> +{
> +    return rs->postcopy_preempt_state.preempted;
> +}
> +
> +static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
> +{
> +    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
> +
> +    assert(state->preempted);
> +
> +    pss->block = state->ram_block;
> +    pss->page = state->ram_page;
> +    /* This is not a postcopy request but restoring previous precopy */
> +    pss->postcopy_requested = false;
> +
> +    trace_postcopy_preempt_restored(pss->block->idstr, pss->page);
> +
> +    /* Reset preempt state, most importantly, set preempted==false */
> +    postcopy_preempt_reset(rs);
> +}
> +
> +static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
> +{
> +    MigrationState *s = migrate_get_current();
> +    unsigned int channel;
> +    QEMUFile *next;
> +
> +    channel = pss->postcopy_requested ?
> +        RAM_CHANNEL_POSTCOPY : RAM_CHANNEL_PRECOPY;
> +
> +    if (channel != rs->postcopy_channel) {
> +        if (channel == RAM_CHANNEL_PRECOPY) {
> +            next = s->to_dst_file;
> +        } else {
> +            next = s->postcopy_qemufile_src;
> +        }
> +        /* Update and cache the current channel */
> +        rs->f = next;
> +        rs->postcopy_channel = channel;
> +
> +        /*
> +         * If channel switched, reset last_sent_block since the old sent block
> +         * may not be on the same channel.
> +         */
> +        rs->last_sent_block = NULL;
> +
> +        trace_postcopy_preempt_switch_channel(channel);
> +    }
> +
> +    trace_postcopy_preempt_send_host_page(pss->block->idstr, pss->page);
> +}
> +
> +/* We need to make sure rs->f always points to the default channel elsewhere */
> +static void postcopy_preempt_reset_channel(RAMState *rs)
> +{
> +    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
> +        rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
> +        rs->f = migrate_get_current()->to_dst_file;
> +        trace_postcopy_preempt_reset_channel();
> +    }
> +}
> +
>   /**
>    * ram_save_host_page: save a whole host page
>    *
> @@ -2211,7 +2406,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>           return 0;
>       }
>   
> +    if (migrate_postcopy_preempt() && migration_in_postcopy()) {

I see why there is only one extra channel, multiFD is not supported for 
postcopy. Peter, Any particular reason for that.

As it must be very bad without multiFD, we have seen we can not utilise 
NIC higher than 10 Gbps without multiFD. If it

is something in TODO can we help with that?

> +        postcopy_preempt_choose_channel(rs, pss);
> +    }
> +
>       do {
> +        if (postcopy_needs_preempt(rs, pss)) {
> +            postcopy_do_preempt(rs, pss);
> +            break;
> +        }
> +
>           /* Check the pages is dirty and if it is send it */
>           if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>               tmppages = ram_save_target_page(rs, pss);
> @@ -2235,6 +2439,19 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>       /* The offset we leave with is the min boundary of host page and block */
>       pss->page = MIN(pss->page, hostpage_boundary);
>   
> +    /*
> +     * When with postcopy preempt mode, flush the data as soon as possible for
> +     * postcopy requests, because we've already sent a whole huge page, so the
> +     * dst node should already have enough resource to atomically filling in
> +     * the current missing page.
> +     *
> +     * More importantly, when using separate postcopy channel, we must do
> +     * explicit flush or it won't flush until the buffer is full.
> +     */
> +    if (migrate_postcopy_preempt() && pss->postcopy_requested) {
> +        qemu_fflush(rs->f);
> +    }
> +
>       res = ram_save_release_protection(rs, pss, start_page);
>       return (res < 0 ? res : pages);
>   }
> @@ -2276,8 +2493,17 @@ static int ram_find_and_save_block(RAMState *rs)
>           found = get_queued_page(rs, &pss);
>   
>           if (!found) {
> -            /* priority queue empty, so just search for something dirty */
> -            found = find_dirty_block(rs, &pss, &again);
> +            /*
> +             * Recover previous precopy ramblock/offset if postcopy has
> +             * preempted precopy.  Otherwise find the next dirty bit.
> +             */
> +            if (postcopy_preempt_triggered(rs)) {
> +                postcopy_preempt_restore(rs, &pss);
> +                found = true;
> +            } else {
> +                /* priority queue empty, so just search for something dirty */
> +                found = find_dirty_block(rs, &pss, &again);
> +            }
>           }
>   
>           if (found) {
> @@ -2405,6 +2631,8 @@ static void ram_state_reset(RAMState *rs)
>       rs->last_page = 0;
>       rs->last_version = ram_list.version;
>       rs->xbzrle_enabled = false;
> +    postcopy_preempt_reset(rs);
> +    rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
>   }
>   
>   #define MAX_WAIT 50 /* ms, half buffered_file limit */
> @@ -3043,6 +3271,8 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
>       }
>       qemu_mutex_unlock(&rs->bitmap_mutex);
>   
> +    postcopy_preempt_reset_channel(rs);
> +
>       /*
>        * Must occur before EOS (or any QEMUFile operation)
>        * because of RDMA protocol.
> @@ -3112,6 +3342,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>           ram_control_after_iterate(f, RAM_CONTROL_FINISH);
>       }
>   
> +    postcopy_preempt_reset_channel(rs);
> +
>       if (ret >= 0) {
>           multifd_send_sync_main(rs->f);
>           qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
> @@ -3194,11 +3426,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>    * @mis: the migration incoming state pointer
>    * @f: QEMUFile where to read the data from
>    * @flags: Page flags (mostly to see if it's a continuation of previous block)
> + * @channel: the channel we're using
>    */
>   static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
> -                                              QEMUFile *f, int flags)
> +                                              QEMUFile *f, int flags,
> +                                              int channel)
>   {
> -    RAMBlock *block = mis->last_recv_block;
> +    RAMBlock *block = mis->last_recv_block[channel];
>       char id[256];
>       uint8_t len;
>   
> @@ -3225,7 +3459,7 @@ static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
>           return NULL;
>       }
>   
> -    mis->last_recv_block = block;
> +    mis->last_recv_block[channel] = block;
>   
>       return block;
>   }
> @@ -3679,7 +3913,7 @@ int ram_load_postcopy(QEMUFile *f, int channel)
>           trace_ram_load_postcopy_loop(channel, (uint64_t)addr, flags);
>           if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
>                        RAM_SAVE_FLAG_COMPRESS_PAGE)) {
> -            block = ram_block_from_stream(mis, f, flags);
> +            block = ram_block_from_stream(mis, f, flags, channel);
>               if (!block) {
>                   ret = -EINVAL;
>                   break;
> @@ -3930,7 +4164,7 @@ static int ram_load_precopy(QEMUFile *f)
>   
>           if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
>                        RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
> -            RAMBlock *block = ram_block_from_stream(mis, f, flags);
> +            RAMBlock *block = ram_block_from_stream(mis, f, flags, RAM_CHANNEL_PRECOPY);
>   
>               host = host_from_ram_block_offset(block, addr);
>               /*
> diff --git a/migration/trace-events b/migration/trace-events
> index 1f932782d9..f92793b5f5 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -111,6 +111,12 @@ ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRI
>   ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
>   ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
>   unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%"PRIx64" dirty %d"
> +postcopy_preempt_triggered(char *str, unsigned long page) "during sending ramblock %s offset 0x%lx"
> +postcopy_preempt_restored(char *str, unsigned long page) "ramblock %s offset 0x%lx"
> +postcopy_preempt_hit(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
> +postcopy_preempt_send_host_page(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
> +postcopy_preempt_switch_channel(int channel) "%d"
> +postcopy_preempt_reset_channel(void) ""
>   
>   # multifd.c
>   multifd_new_send_channel_async(uint8_t id) "channel %u"
> @@ -176,6 +182,7 @@ migration_thread_low_pending(uint64_t pending) "%" PRIu64
>   migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t bandwidth, uint64_t size) "transferred %" PRIu64 " time_spent %" PRIu64 " bandwidth %" PRIu64 " max_size %" PRId64
>   process_incoming_migration_co_end(int ret, int ps) "ret=%d postcopy-state=%d"
>   process_incoming_migration_co_postcopy_end_main(void) ""
> +postcopy_preempt_enabled(bool value) "%d"
>   
>   # channel.c
>   migration_set_incoming_channel(void *ioc, const char *ioctype) "ioc=%p ioctype=%s"
--------------nvtONNDW0jO0iczJDbE4MdZg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>On 31/03/22 8:38 pm, Peter Xu wrote:</p>
    <p><font size="2">LGTM</font><br>
    </p>
    <blockquote type="cite" cite="mid:20220331150857.74406-11-peterx@redhat.com">
      <pre class="moz-quote-pre" wrap="">This patch enables postcopy-preempt feature.

It contains two major changes to the migration logic:

(1) Postcopy requests are now sent via a different socket from precopy
    background migration stream, so as to be isolated from very high page
    request delays.

(2) For huge page enabled hosts: when there's postcopy requests, they can now
    intercept a partial sending of huge host pages on src QEMU.

After this patch, we'll live migrate a VM with two channels for postcopy: (1)
PRECOPY channel, which is the default channel that transfers background pages;
and (2) POSTCOPY channel, which only transfers requested pages.

There's no strict rule of which channel to use, e.g., if a requested page is
already being transferred on precopy channel, then we will keep using the same
precopy channel to transfer the page even if it's explicitly requested.  In 99%
of the cases we'll prioritize the channels so we send requested page via the
postcopy channel as long as possible.

On the source QEMU, when we found a postcopy request, we'll interrupt the
PRECOPY channel sending process and quickly switch to the POSTCOPY channel.
After we serviced all the high priority postcopy pages, we'll switch back to
PRECOPY channel so that we'll continue to send the interrupted huge page again.
There's no new thread introduced on src QEMU.

On the destination QEMU, one new thread is introduced to receive page data from
the postcopy specific socket (done in the preparation patch).

This patch has a side effect: after sending postcopy pages, previously we'll
assume the guest will access follow up pages so we'll keep sending from there.
Now it's changed.  Instead of going on with a postcopy requested page, we'll go
back and continue sending the precopy huge page (which can be intercepted by a
postcopy request so the huge page can be sent partially before).

Whether that's a problem is debatable, because &quot;assuming the guest will
continue to access the next page&quot; may not really suite when huge pages are
used, especially if the huge page is large (e.g. 1GB pages).  So that locality
hint is much meaningless if huge pages are used.

Reviewed-by: Dr. David Alan Gilbert <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>
Signed-off-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
---
 migration/migration.c  |   2 +
 migration/migration.h  |   2 +-
 migration/ram.c        | 250 +++++++++++++++++++++++++++++++++++++++--
 migration/trace-events |   7 ++
 4 files changed, 252 insertions(+), 9 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 01b882494d..56d54c186b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3158,6 +3158,8 @@ static int postcopy_start(MigrationState *ms)
                               MIGRATION_STATUS_FAILED);
     }
 
+    trace_postcopy_preempt_enabled(migrate_postcopy_preempt());
+
     return ret;
 
 fail_closefb:
diff --git a/migration/migration.h b/migration/migration.h
index caa910d956..b8aacfe3af 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -68,7 +68,7 @@ typedef struct {
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
     /* Previously received RAM's RAMBlock pointer */
-    RAMBlock *last_recv_block;
+    RAMBlock *last_recv_block[RAM_CHANNEL_MAX];
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
diff --git a/migration/ram.c b/migration/ram.c
index c7ea1d9215..518d511874 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -295,6 +295,20 @@ struct RAMSrcPageRequest {
     QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
 };
 
+typedef struct {
+    /*
+     * Cached ramblock/offset values if preempted.  They're only meaningful if
+     * preempted==true below.
+     */
+    RAMBlock *ram_block;
+    unsigned long ram_page;
+    /*
+     * Whether a postcopy preemption just happened.  Will be reset after
+     * precopy recovered to background migration.
+     */
+    bool preempted;
+} PostcopyPreemptState;
+
 /* State of RAM for migration */
 struct RAMState {
     /* QEMUFile used for this migration */
@@ -349,6 +363,14 @@ struct RAMState {
     /* Queue of outstanding page requests from the destination */
     QemuMutex src_page_req_mutex;
     QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
+
+    /* Postcopy preemption informations */
+    PostcopyPreemptState postcopy_preempt_state;
+    /*
+     * Current channel we're using on src VM.  Only valid if postcopy-preempt
+     * is enabled.
+     */
+    unsigned int postcopy_channel;
 };
 typedef struct RAMState RAMState;
 
@@ -356,6 +378,11 @@ static RAMState *ram_state;
 
 static NotifierWithReturnList precopy_notifier_list;
 
+static void postcopy_preempt_reset(RAMState *rs)
+{
+    memset(&amp;rs-&gt;postcopy_preempt_state, 0, sizeof(PostcopyPreemptState));
+}
+
 /* Whether postcopy has queued requests? */
 static bool postcopy_has_request(RAMState *rs)
 {
@@ -1947,6 +1974,55 @@ void ram_write_tracking_stop(void)
 }
 #endif /* defined(__linux__) */
 
+/*
+ * Check whether two addr/offset of the ramblock falls onto the same host huge
+ * page.  Returns true if so, false otherwise.
+ */
+static bool offset_on_same_huge_page(RAMBlock *rb, uint64_t addr1,
+                                     uint64_t addr2)
+{
+    size_t page_size = qemu_ram_pagesize(rb);
+
+    addr1 = ROUND_DOWN(addr1, page_size);
+    addr2 = ROUND_DOWN(addr2, page_size);
+
+    return addr1 == addr2;
+}
+
+/*
+ * Whether a previous preempted precopy huge page contains current requested
+ * page?  Returns true if so, false otherwise.
+ *
+ * This should really happen very rarely, because it means when we were sending
+ * during background migration for postcopy we're sending exactly the page that
+ * some vcpu got faulted on on dest node.  When it happens, we probably don't
+ * need to do much but drop the request, because we know right after we restore
+ * the precopy stream it'll be serviced.  It'll slightly affect the order of
+ * postcopy requests to be serviced (e.g. it'll be the same as we move current
+ * request to the end of the queue) but it shouldn't be a big deal.  The most
+ * imporant thing is we can _never_ try to send a partial-sent huge page on the
+ * POSTCOPY channel again, otherwise that huge page will got &quot;split brain&quot; on
+ * two channels (PRECOPY, POSTCOPY).
+ */
+static bool postcopy_preempted_contains(RAMState *rs, RAMBlock *block,
+                                        ram_addr_t offset)
+{
+    PostcopyPreemptState *state = &amp;rs-&gt;postcopy_preempt_state;
+
+    /* No preemption at all? */
+    if (!state-&gt;preempted) {
+        return false;
+    }
+
+    /* Not even the same ramblock? */
+    if (state-&gt;ram_block != block) {
+        return false;
+    }
+
+    return offset_on_same_huge_page(block, offset,
+                                    state-&gt;ram_page &lt;&lt; TARGET_PAGE_BITS);
+}
+
 /**
  * get_queued_page: unqueue a page from the postcopy requests
  *
@@ -1962,9 +2038,17 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
     RAMBlock  *block;
     ram_addr_t offset;
 
+again:
     block = unqueue_page(rs, &amp;offset);
 
-    if (!block) {
+    if (block) {
+        /* See comment above postcopy_preempted_contains() */
+        if (postcopy_preempted_contains(rs, block, offset)) {
+            trace_postcopy_preempt_hit(block-&gt;idstr, offset);
+            /* This request is dropped */
+            goto again;
+        }</pre>
    </blockquote>
    <font size="2">If we continuosly keep on getting new post-copy
      request. Is it possible this case can starve post-copy request
      which is in precopy preemtion?</font><br>
    <blockquote type="cite" cite="mid:20220331150857.74406-11-peterx@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+    } else {
         /*
          * Poll write faults too if background snapshot is enabled; that's
          * when we have vcpus got blocked by the write protected pages.
@@ -2180,6 +2264,117 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     return ram_save_page(rs, pss);
 }
 
+static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
+{
+    /* Not enabled eager preempt?  Then never do that. */
+    if (!migrate_postcopy_preempt()) {
+        return false;
+    }
+
+    /* If the ramblock we're sending is a small page?  Never bother. */
+    if (qemu_ram_pagesize(pss-&gt;block) == TARGET_PAGE_SIZE) {
+        return false;
+    }
+
+    /* Not in postcopy at all? */
+    if (!migration_in_postcopy()) {
+        return false;
+    }
+
+    /*
+     * If we're already handling a postcopy request, don't preempt as this page
+     * has got the same high priority.
+     */
+    if (pss-&gt;postcopy_requested) {
+        return false;
+    }
+
+    /* If there's postcopy requests, then check it up! */
+    return postcopy_has_request(rs);
+}
+
+/* Returns true if we preempted precopy, false otherwise */
+static void postcopy_do_preempt(RAMState *rs, PageSearchStatus *pss)
+{
+    PostcopyPreemptState *p_state = &amp;rs-&gt;postcopy_preempt_state;
+
+    trace_postcopy_preempt_triggered(pss-&gt;block-&gt;idstr, pss-&gt;page);
+
+    /*
+     * Time to preempt precopy. Cache current PSS into preempt state, so that
+     * after handling the postcopy pages we can recover to it.  We need to do
+     * so because the dest VM will have partial of the precopy huge page kept
+     * over in its tmp huge page caches; better move on with it when we can.
+     */
+    p_state-&gt;ram_block = pss-&gt;block;
+    p_state-&gt;ram_page = pss-&gt;page;
+    p_state-&gt;preempted = true;
+}
+
+/* Whether we're preempted by a postcopy request during sending a huge page */
+static bool postcopy_preempt_triggered(RAMState *rs)
+{
+    return rs-&gt;postcopy_preempt_state.preempted;
+}
+
+static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
+{
+    PostcopyPreemptState *state = &amp;rs-&gt;postcopy_preempt_state;
+
+    assert(state-&gt;preempted);
+
+    pss-&gt;block = state-&gt;ram_block;
+    pss-&gt;page = state-&gt;ram_page;
+    /* This is not a postcopy request but restoring previous precopy */
+    pss-&gt;postcopy_requested = false;
+
+    trace_postcopy_preempt_restored(pss-&gt;block-&gt;idstr, pss-&gt;page);
+
+    /* Reset preempt state, most importantly, set preempted==false */
+    postcopy_preempt_reset(rs);
+}
+
+static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
+{
+    MigrationState *s = migrate_get_current();
+    unsigned int channel;
+    QEMUFile *next;
+
+    channel = pss-&gt;postcopy_requested ?
+        RAM_CHANNEL_POSTCOPY : RAM_CHANNEL_PRECOPY;
+
+    if (channel != rs-&gt;postcopy_channel) {
+        if (channel == RAM_CHANNEL_PRECOPY) {
+            next = s-&gt;to_dst_file;
+        } else {
+            next = s-&gt;postcopy_qemufile_src;
+        }
+        /* Update and cache the current channel */
+        rs-&gt;f = next;
+        rs-&gt;postcopy_channel = channel;
+
+        /*
+         * If channel switched, reset last_sent_block since the old sent block
+         * may not be on the same channel.
+         */
+        rs-&gt;last_sent_block = NULL;
+
+        trace_postcopy_preempt_switch_channel(channel);
+    }
+
+    trace_postcopy_preempt_send_host_page(pss-&gt;block-&gt;idstr, pss-&gt;page);
+}
+
+/* We need to make sure rs-&gt;f always points to the default channel elsewhere */
+static void postcopy_preempt_reset_channel(RAMState *rs)
+{
+    if (migrate_postcopy_preempt() &amp;&amp; migration_in_postcopy()) {
+        rs-&gt;postcopy_channel = RAM_CHANNEL_PRECOPY;
+        rs-&gt;f = migrate_get_current()-&gt;to_dst_file;
+        trace_postcopy_preempt_reset_channel();
+    }
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
@@ -2211,7 +2406,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         return 0;
     }
 
+    if (migrate_postcopy_preempt() &amp;&amp; migration_in_postcopy()) {</pre>
    </blockquote>
    <p><font size="2">I see why there is only one extra channel, multiFD
        is not supported for postcopy. Peter, Any particular reason for
        that.</font></p>
    <p><font size="2">As it must be very bad without multiFD, we have
        seen we can not utilise NIC higher than 10 Gbps without multiFD.
        If it</font></p>
    <p><font size="2">is something in TODO can we help with that?</font><br>
    </p>
    <blockquote type="cite" cite="mid:20220331150857.74406-11-peterx@redhat.com">
      <pre class="moz-quote-pre" wrap="">
+        postcopy_preempt_choose_channel(rs, pss);
+    }
+
     do {
+        if (postcopy_needs_preempt(rs, pss)) {
+            postcopy_do_preempt(rs, pss);
+            break;
+        }
+
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss-&gt;block, pss-&gt;page)) {
             tmppages = ram_save_target_page(rs, pss);
@@ -2235,6 +2439,19 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     /* The offset we leave with is the min boundary of host page and block */
     pss-&gt;page = MIN(pss-&gt;page, hostpage_boundary);
 
+    /*
+     * When with postcopy preempt mode, flush the data as soon as possible for
+     * postcopy requests, because we've already sent a whole huge page, so the
+     * dst node should already have enough resource to atomically filling in
+     * the current missing page.
+     *
+     * More importantly, when using separate postcopy channel, we must do
+     * explicit flush or it won't flush until the buffer is full.
+     */
+    if (migrate_postcopy_preempt() &amp;&amp; pss-&gt;postcopy_requested) {
+        qemu_fflush(rs-&gt;f);
+    }
+
     res = ram_save_release_protection(rs, pss, start_page);
     return (res &lt; 0 ? res : pages);
 }
@@ -2276,8 +2493,17 @@ static int ram_find_and_save_block(RAMState *rs)
         found = get_queued_page(rs, &amp;pss);
 
         if (!found) {
-            /* priority queue empty, so just search for something dirty */
-            found = find_dirty_block(rs, &amp;pss, &amp;again);
+            /*
+             * Recover previous precopy ramblock/offset if postcopy has
+             * preempted precopy.  Otherwise find the next dirty bit.
+             */
+            if (postcopy_preempt_triggered(rs)) {
+                postcopy_preempt_restore(rs, &amp;pss);
+                found = true;
+            } else {
+                /* priority queue empty, so just search for something dirty */
+                found = find_dirty_block(rs, &amp;pss, &amp;again);
+            }
         }
 
         if (found) {
@@ -2405,6 +2631,8 @@ static void ram_state_reset(RAMState *rs)
     rs-&gt;last_page = 0;
     rs-&gt;last_version = ram_list.version;
     rs-&gt;xbzrle_enabled = false;
+    postcopy_preempt_reset(rs);
+    rs-&gt;postcopy_channel = RAM_CHANNEL_PRECOPY;
 }
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
@@ -3043,6 +3271,8 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
     }
     qemu_mutex_unlock(&amp;rs-&gt;bitmap_mutex);
 
+    postcopy_preempt_reset_channel(rs);
+
     /*
      * Must occur before EOS (or any QEMUFile operation)
      * because of RDMA protocol.
@@ -3112,6 +3342,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
+    postcopy_preempt_reset_channel(rs);
+
     if (ret &gt;= 0) {
         multifd_send_sync_main(rs-&gt;f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
@@ -3194,11 +3426,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  * @mis: the migration incoming state pointer
  * @f: QEMUFile where to read the data from
  * @flags: Page flags (mostly to see if it's a continuation of previous block)
+ * @channel: the channel we're using
  */
 static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
-                                              QEMUFile *f, int flags)
+                                              QEMUFile *f, int flags,
+                                              int channel)
 {
-    RAMBlock *block = mis-&gt;last_recv_block;
+    RAMBlock *block = mis-&gt;last_recv_block[channel];
     char id[256];
     uint8_t len;
 
@@ -3225,7 +3459,7 @@ static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
         return NULL;
     }
 
-    mis-&gt;last_recv_block = block;
+    mis-&gt;last_recv_block[channel] = block;
 
     return block;
 }
@@ -3679,7 +3913,7 @@ int ram_load_postcopy(QEMUFile *f, int channel)
         trace_ram_load_postcopy_loop(channel, (uint64_t)addr, flags);
         if (flags &amp; (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
-            block = ram_block_from_stream(mis, f, flags);
+            block = ram_block_from_stream(mis, f, flags, channel);
             if (!block) {
                 ret = -EINVAL;
                 break;
@@ -3930,7 +4164,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         if (flags &amp; (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(mis, f, flags);
+            RAMBlock *block = ram_block_from_stream(mis, f, flags, RAM_CHANNEL_PRECOPY);
 
             host = host_from_ram_block_offset(block, addr);
             /*
diff --git a/migration/trace-events b/migration/trace-events
index 1f932782d9..f92793b5f5 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -111,6 +111,12 @@ ram_load_complete(int ret, uint64_t seq_iter) &quot;exit_code %d seq iteration %&quot; PRI
 ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) &quot;%s: page_size: %zu addr: %p length: %zu&quot;
 ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) &quot;%s: page_size: %zu addr: %p length: %zu&quot;
 unqueue_page(char *block, uint64_t offset, bool dirty) &quot;ramblock '%s' offset 0x%&quot;PRIx64&quot; dirty %d&quot;
+postcopy_preempt_triggered(char *str, unsigned long page) &quot;during sending ramblock %s offset 0x%lx&quot;
+postcopy_preempt_restored(char *str, unsigned long page) &quot;ramblock %s offset 0x%lx&quot;
+postcopy_preempt_hit(char *str, uint64_t offset) &quot;ramblock %s offset 0x%&quot;PRIx64
+postcopy_preempt_send_host_page(char *str, uint64_t offset) &quot;ramblock %s offset 0x%&quot;PRIx64
+postcopy_preempt_switch_channel(int channel) &quot;%d&quot;
+postcopy_preempt_reset_channel(void) &quot;&quot;
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) &quot;channel %u&quot;
@@ -176,6 +182,7 @@ migration_thread_low_pending(uint64_t pending) &quot;%&quot; PRIu64
 migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t bandwidth, uint64_t size) &quot;transferred %&quot; PRIu64 &quot; time_spent %&quot; PRIu64 &quot; bandwidth %&quot; PRIu64 &quot; max_size %&quot; PRId64
 process_incoming_migration_co_end(int ret, int ps) &quot;ret=%d postcopy-state=%d&quot;
 process_incoming_migration_co_postcopy_end_main(void) &quot;&quot;
+postcopy_preempt_enabled(bool value) &quot;%d&quot;
 
 # channel.c
 migration_set_incoming_channel(void *ioc, const char *ioctype) &quot;ioc=%p ioctype=%s&quot;
</pre>
    </blockquote>
  </body>
</html>

--------------nvtONNDW0jO0iczJDbE4MdZg--

