Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3756D618801
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:55:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqfM0-0002jG-3V; Thu, 03 Nov 2022 14:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqfLx-0002hn-Mg
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:54:13 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqfLr-0000TP-5B
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:54:13 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A3GMw5K006975
 for <qemu-devel@nongnu.org>; Thu, 3 Nov 2022 11:54:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=qOVdNCjBDnO/MUoyfiGaZip0zcmdoQ6CERlFrLjhB70=;
 b=QVJf9Tj217o9V61FoC6+PPXNlOK1k1pa0sRdiHb/yTYeUyYCkYmgCHF9cVfn6SCGH7Rj
 //i21kOWiya+15zaTLQUOkfAtCCohlcUNDEBZa6F6FgACCkaHc7kOJqDuIfb4cwP8UxS
 StsjiX0zBJSCm7voZ+CYlHj98aCS6CbqcOGR4dXWZ3nsAD0pNl/9lcuAJFGL1O3S6TXX
 2jVXujF/wpZYVSpuDg8LhTDTkLyuPULeyUxFbulxtGuLU2ZHKsRgFuwJ2YoV0/aLKyOZ
 iach9GVkBexWlnkDWoYlRqTktnc9bgnsDSJQ54PNxe5HlPu83nLnbLXj+fn1cSBpL44j MQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3km3n02266-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 11:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maAE/x3cyRffQnlkTIXPNyPquzhWoKqY3QM85GQrIFGX7544eu14bdyz72/2tM/CVi93YEWgb74zG1unyttS+JIt4JaB78MHDfadcDLbA4SI+Vgyv/Zjg5vMiDg/HfG6cY6b5B0SlV0yDtRpdgaEaeKbW5xxWlIePh6HtZ/TRw1AfuF01MqOdrL5VKO5WHrQwzar3vYrbhK/DXMt+ObwvFO8FfmkqNyhoWRgMHUIxf0ns5fUc6nSVaVVjqFP0/YBI5VZV22CMY1TSexeKaPCBtN71IzJjjWBKcQAn2aIrHV1EiVa+aoJA5+Sh8gWqLnS8QNbfqf/hL2clkki9dWHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOVdNCjBDnO/MUoyfiGaZip0zcmdoQ6CERlFrLjhB70=;
 b=lY44hctBMfGPxC/eDLFM4D89zwxyUewP2I+KMZuRo4YnDcnHbB1NSuLrcaBVoeeHB68nX5Qs7gzvplirTMVLMmxnYpNgCWpUZcEJSHfkC8T53jcHMLIL+67gjO1A/27hej6/bke2UBc+oUGRx3FYMb+Cr1P/M7X77OUepsKgIsW+4szCHzzNICfWYWOcJnsOyPLqy11jmPRZOQu+94uPZ581B0z4lNyhlMrVqRf6cKEaJkugZ4zAWDRXkwOj+2EV3VTJgMtepZ+0xSvloG7PqwEEeSVzFjIsLrdz7tDtAO/giAdWM9f2/coX8eoXu1Ukz4hK74gbMwbfVA5h00pTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOVdNCjBDnO/MUoyfiGaZip0zcmdoQ6CERlFrLjhB70=;
 b=S3IW/EJGKjprEM0GENg8r+WvX7KCS+YmcpsG+XYDx7sO56xBHQW3iqh7RIzsQQt2u8HEhJ+qniBLiLEiajbM38rvK+MZtYQbasOhkt09+uD8wBXr2ZVuu3byXvMiXHmsT3Uzz8rR0mQp6WRbqCbjh0JRYs7kBL39aFumrLLC2yX7QjyVm8ZfE16jNsP/ywNEmhwmwTorCgFCTrBBR+2U5IWEFuW100PAQwi12bp0d7UKsef/U0qui8r3JSJFBoUL4PIQaZvHmU+TN10wPqVz2E6+gQ7I7RliMVksvCfoJ/8vDQ0o45DjSBkoEWHHPQaVVO+KbB2mGtP6P7nvrazLBQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM8PR02MB7942.namprd02.prod.outlook.com (2603:10b6:8:13::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.21; Thu, 3 Nov 2022 18:54:01 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 18:54:01 +0000
Message-ID: <a54a6608-e6cf-c432-4e65-da5521c44e5a@nutanix.com>
Date: Fri, 4 Nov 2022 00:23:53 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: qemu-devel@nongnu.org
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
 <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
 <e5f69a86-f625-3cdb-4a25-065a0612548e@nutanix.com>
 <Y2OKCel2FlMQw+bI@redhat.com>
 <cf399da1-8558-06f9-2865-98abe45ddcda@nutanix.com>
 <Y2P6FMs42GLzkKl/@redhat.com>
 <0ad51209-817e-4f7b-3f93-e0ee231aade4@nutanix.com>
 <Y2QA93CGE6tyD4vT@redhat.com>
 <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM8PR02MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5ba9ed-25c7-46e2-e807-08dabdccc546
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8o3mn0CQlTYHy5m2pI8oKGGXkcqWzXUsc1xf+/SIloPXBYdAolcdz0csMNgCGfhgcnsBk4QvxIxCQ+YMTXQ5yJhCDMX3PDGn5wvM6RJf43dad3rB7aj+OYoh6Xa7qBhIt7mNJEwQ9NECwVcEuwiogohIsab6PepgqzbGTB4ELZGXNkRAPDRYUj0y3/tNJWx3JQc+x09pw4QGUqmCBzHzuupDxLYOFlJ2qGWVj7IpSXHDbcBLfmUT3o+XAZEXwHOake0Pjy77Qt5lQWPs95QYrun3ExEvzOQ+i+4k+w1lpqg4pqYlSi0epd4YNJu4kOlHY7XryNYw3GZDwYBDkqjczNUKnWZpYDC1ovTIlFRnSsfbzbWuSyVTAkXag8a2T7JUU2uDF+qh2kV/gB3B0wEMSgswTBBobybyTaIO7/qhsKVqmP+SdNBxzLy5vLKmXMxUQy3addNyvHY5NPl0mBWCjPTcyNx6ECxFRWpYT4oPvK602/jOMXZciuuOohICBub8Rhvchy4c6K00BdiNd1tvwMw44CM/M1enJyls+2IFk9wUAdVIJ6TpslsC6o1mafim8n42ovK6f7OX03XYZmr3eYTViF7W7aBexdeOwkDkcNK6a3Z60AYGnH+2E+rNFNeDA32XWI4DdMrcqktOA9kY23JeKf233mNkj1g0vvUYsYPjD3zPjv+ziNa4zdQYKFvxEA7hqpA0/CTmnx7QPYRJkJgNWRKNiRWbL1ER26xD0xWUNUh6AjYTEX04X0BTqnswUyWs5AydPIaCx+5i1LF0hvdr9oNKa++iTmJyCGRQpmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(66899015)(6486002)(66476007)(31686004)(478600001)(316002)(6916009)(6666004)(66556008)(53546011)(2906002)(66946007)(5660300002)(31696002)(2616005)(55236004)(8936002)(8676002)(26005)(41300700001)(6512007)(36756003)(86362001)(6506007)(38100700002)(83380400001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHNHcS9nVm5RRTJybWlvSGJ5RFdqS0ZkSnU1bHRGNGhQL0IxREdtdkliYW14?=
 =?utf-8?B?UGtHZG1ldytWTkloWnpGZExjdXdDc1hnNCtMTHBWR1cyQi9EQnhmNmExa2M4?=
 =?utf-8?B?TTgwZFRwaXdjTTVEVU91aGt1WjJub0JFRHhWZ21NeTZrZUR4NUxkUEtSOVZR?=
 =?utf-8?B?NkFHK0FzQ2hndE14UGV0aGZma2UrYW1PVW5TYUQ4OHBldEFyMzBCY2MzY2hX?=
 =?utf-8?B?Z0owWnI5UVIxb3ZiT3hDVUlaV3pLYWRKSGVNeXRrWm5EejFEVDB6KzFyS29J?=
 =?utf-8?B?R1hZRTlFRkVIbXJFWWhFa1BqU0d4U2NMRkFWMzB1enNoRUo1ZnZXV0lDWmlY?=
 =?utf-8?B?ZmZHMVpPM1IzaHNuR0U3YlVSVDZQZzVrTkRXYnY4cllJTE1WdVlCRjVHU040?=
 =?utf-8?B?MStPNXd4VWRicTUrbGpXWGpEaUoyWXdGVCtkT0dZOW1sSTZYVTREM1lyTDZI?=
 =?utf-8?B?bUEwdFJzRlVCaUFORlp2V2pmQ3g1RUcvMEpLR3ZhZkJaT3d1eGVQNm5TZ1Bk?=
 =?utf-8?B?VEJyMGp1VURTd0lyNTcxSmQyeW5sZmdVZldJR2FpOHhodyt4eVlGTXB2N3gw?=
 =?utf-8?B?bGw2R2ROQ08zalJkbmxyZStKbTI5ZS90ZytTQzNVQnp6SXZ1Sloveml3R0R5?=
 =?utf-8?B?RncxSE9vRm5nU1NzM1pEblYyMjlVSnN0bXM2WW1hK3h6eHZNay9YaThBN3Zw?=
 =?utf-8?B?dUVsWGRLdVBsc0YzVDZRMW40UzRVd3N3QzAxaFkyeHpBOE1jN1EraERoSGZ1?=
 =?utf-8?B?Smt4YnZIMzVVdWE0aHRSK1NzblU1YmdDU3VwbHBFQm8vV2dOc2lpWHFVemcr?=
 =?utf-8?B?dmpwelN0bWNKTkQrbjh1dTZIMU91T1c5eUlCcFpIdlBzNUtDZXV4aFNoTmV4?=
 =?utf-8?B?dTFDS1RGWk9nMHZycFVuaWdVREE4NFRmbzZlQzlFTW1JSk5iQ2doSkFWbUZE?=
 =?utf-8?B?bUxpRVBpY3I3Q1JMeU5UNmNBbFdTWVppdXFPaEN2VEUwZnhyWXhmNnlTa3g0?=
 =?utf-8?B?UVl1VXlmSDVTcThhTGs1aTNxcGVIYmdtUGQ1cHdmZ0FlVm8vTS9ER3pVTUlw?=
 =?utf-8?B?UDFtRnBTMlFyYTNXRHkyK1dXUVlvMW92YkY1UE5aQndGVUMvU0d0L2pZcDJx?=
 =?utf-8?B?V3NCMk11SDdsKy9tbWhlVllGdEdxSEFxZ2VKbVRmU3RDSGRqalJieE45RzRF?=
 =?utf-8?B?SVMrNmZKczNNR0ZFYmNKLy9mTmhrWTVQOUN1QlNhNDRvU3paOS9RNTF4bTJS?=
 =?utf-8?B?UTF0eE1hd0ZCd213bHJmVnNWK2NqRGFqL1Q5RU9jWnZFdGIrNitNUHpGRmU2?=
 =?utf-8?B?QVZkRlJMb3dGcmg3R3NzUEVkNkR4eTliVTljNXg2M2U1NjduRXR0MVFPMEVD?=
 =?utf-8?B?Zit6MzlzQmtXSmFraWVzVElBclpTTDhwMXcva1ZFZzhuM1BZelB3TWhnL3pT?=
 =?utf-8?B?WUoyN29QbDRGUmN5OUwvRFJFWEtmWWk5ZUxVT21iMk5GdlZzU1VsQk1zSW80?=
 =?utf-8?B?TkI2bko5OHVmeUNOWEdmZzRMY1dvQXBxOHdYclk4d2dqQ1MxWGc1TWhxTEZZ?=
 =?utf-8?B?U0pzeG9uaG42d1ZuQk1uL1ZFRzFsNXZ4cEZsdXp0aW9IbzByeFN0TTVaQ3Zt?=
 =?utf-8?B?SDhqdzh2VXg4NnBjQlpkdmtwZDBHWEphOE5Yc0E5c09MelZlUnQ4MzdqbEFW?=
 =?utf-8?B?ckNzN2E2OTBPTDcwZWt3UVlnNmEvQ2VxZ2FXd3k5K1BnNGY5aWhIa01rQkpv?=
 =?utf-8?B?UHZvb2Z3TzhnL0VzdVFtQWZ5bStxV1hoQXo4MnRpYmJyVHZiSXhPVzVEM2NY?=
 =?utf-8?B?ZWQ0TXRObmczRXVzOGl1eUVscGJ6YVMvQVMvbmhHL0FRNG9qK0gzVnpRZHJX?=
 =?utf-8?B?bE1CYmlvZnpIMEwvKzZ3OU02UmdjcERUVG5VZHlrbEpVOGQwQWplOUJFZFRm?=
 =?utf-8?B?UjhMQ2swYUdQMmM1TzJrTWlteG95NmV3L2c0WWxESjg2WGxIS2dEMlYzelNM?=
 =?utf-8?B?dGU1bE9FaVh4THBrZTFNcEErRERIa0NOY2RWTUZ4eVh4Um53UE8vdWxxNXRG?=
 =?utf-8?B?NWFCZGozanlCTzdQZG5HMDRCdTN3MEI1MzZnRTJHUzJ1ZW1PdWdqODJldnF0?=
 =?utf-8?B?Z0hzaDZZRHVFT0MwZmo2VG9IQmNjOTNTNW9QMWVrZDh4OE5iKzJCSks4alNH?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5ba9ed-25c7-46e2-e807-08dabdccc546
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:54:01.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnLTPA4kLiaWAfLcmaaKO6R8cR4PeQVOiVxQ0Sf9uQUi+P8hrp7TWQlrdx3xmsbpJhXzld/mkgVvBnxPbccdCOinuTfCBEx5DS4CZWc7EGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7942
X-Proofpoint-ORIG-GUID: alAXCPx2k9zpuUn57txah6nKqFYCa2qi
X-Proofpoint-GUID: alAXCPx2k9zpuUn57txah6nKqFYCa2qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 03/11/22 11:47 pm, manish.mishra wrote:
>
> On 03/11/22 11:27 pm, Daniel P. Berrangé wrote:
>> On Thu, Nov 03, 2022 at 11:06:23PM +0530, manish.mishra wrote:
>>> On 03/11/22 10:57 pm, Daniel P. Berrangé wrote:
>>>> On Thu, Nov 03, 2022 at 10:04:54PM +0530, manish.mishra wrote:
>>>>> On 03/11/22 2:59 pm, Daniel P. Berrangé wrote:
>>>>>> On Thu, Nov 03, 2022 at 02:50:25PM +0530, manish.mishra wrote:
>>>>>>> On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
>>>>>>>> On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
>>>>>>>>> On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
>>>>>>>>>> On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
>>>>>>>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>>>>>>>> index 739bb683f3..f4b6f278a9 100644
>>>>>>>>>>> --- a/migration/migration.c
>>>>>>>>>>> +++ b/migration/migration.c
>>>>>>>>>>> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>>>>>>>>>>       {
>>>>>>>>>>>           MigrationIncomingState *mis = migration_incoming_get_current();
>>>>>>>>>>>           Error *local_err = NULL;
>>>>>>>>>>> -    bool start_migration;
>>>>>>>>>>>           QEMUFile *f;
>>>>>>>>>>> +    bool default_channel = true;
>>>>>>>>>>> +    uint32_t channel_magic = 0;
>>>>>>>>>>> +    int ret = 0;
>>>>>>>>>>> -    if (!mis->from_src_file) {
>>>>>>>>>>> -        /* The first connection (multifd may have multiple) */
>>>>>>>>>>> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>>>>>>>>>>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>>>>>>>>>>> + sizeof(channel_magic), &local_err);
>>>>>>>>>>> +
>>>>>>>>>>> +        if (ret != 1) {
>>>>>>>>>>> +            error_propagate(errp, local_err);
>>>>>>>>>>> +            return;
>>>>>>>>>>> +        }
>>>>>>>>>> ....and thus this will fail for TLS channels AFAICT.
>>>>>>>>> Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
>>>>>>>> But we need this problem fixed with TLS too, so just excluding it
>>>>>>>> isn't right. IMHO we need to modify the migration code so we can
>>>>>>>> read the magic earlier, instead of peeking.
>>>>>>>>
>>>>>>>>
>>>>>>>> With regards,
>>>>>>>> Daniel
>>>>>>> Hi Daniel, I was trying tls migrations. What i see is that tls session
>>>>>>> creation does handshake. So if we read ahead in ioc_process_incoming
>>>>>>> for default channel. Because client sends magic only after multiFD
>>>>>>> channels are setup, which too requires tls handshake.
>>>>>> By the time we get to migrate_ioc_process_incoming, the TLS handshake
>>>>>> has already been performed.
>>>>>>
>>>>>> migration_channel_process_incoming
>>>>>>        -> migration_ioc_process_incoming
>>>>>>
>>>>>> vs
>>>>>>
>>>>>> migration_channel_process_incoming
>>>>>>        -> migration_tls_channel_process_incoming
>>>>>>            -> migration_tls_incoming_handshake
>>>>>>          -> migration_channel_process_incoming
>>>>>>              ->  migration_ioc_process_incoming
>>>>>>
>>>>> Yes sorry i thought we block on source side till handshake is done but that is not true. I checked then why that deadlock is happening. So this where the dealock is happening.
>>>>>
>>>>> static int ram_save_setup(QEMUFile *f, void *opaque) {
>>>>> +
>>>>> +
>>>>>       ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>>>>>       ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>>>>>
>>>>>       ret =  multifd_send_sync_main(f);
>>>>>       if (ret < 0) {
>>>>>           return ret;
>>>>>       }
>>>>>
>>>>>       qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>>>>>       qemu_fflush(f);
>>>>>
>>>>>       return 0;
>>>>> }
>>>>>
>>>>> Now if we block in migration_ioc_process_incoming for reading magic
>>>>> value from channel, which is actually sent by client when this
>>>>> qemu_fflush is done. Before this qemu_fflush we wait for
>>>>> multifd_send_sync_main which actually requires that tls handshake is
>>>>> done for multiFD channels as it blocks on sem_sync which posted by
>>>>> multifd_send_thread which is called after handshake||. But then on
>>>>> destination side we are blocked in migration_ioc_process_incoming()
>>>>> waiting to read something from default channel hence handshake for
>>>>> multiFD channels can not happen. This to me looks unresolvable
>>>>> whatever way we try to manipulate stream until we do some changes
>>>>> on source side.
>>>> The TLS handshake is already complete when migration_ioc_process_incoming
>>>> is blocking on read.
>>>>
>>>> Regardless of which channel we're talking about, thue TLS handshake is
>>>> always performed & finished before we try to either send or recv any
>>>> data.
>>> Yes Daniel, agree on that, in this case tls handshake is done for
>>> default channel so we went in migration_ioc_process_incoming for
>>> default channel. But if we try to read some data there, it does not
>>> get because data on default channel is not yet flushed by source.
>>>  From source side data in flushed in above function i pointed. Which
>>> blocks for multiFD channels to be setup with handshake, before
>>> flushing data. I mean data is sent only when buffer is full or
>>> explicitly flushed, till then it is just in buffer. But multiFD
>>> handshake can not complete until we return from
>>> migration_ioc_process_incoming for default channel which infintely
>>> waits because nothing is sent yet on channel.
>> On the source side, if we're in ram_save_setup then the TLS
>> handshake is already complete for the main channel. In fact
>> I think the TLS handshake should act as a serialization
>> point that prevents the entire bug. It should be guaranteed
>> that the main channel is fully received by the dest, and
>> transferring data, before we even get to establishing the
>> multifd channels.
>
>
> Yes, Daniel, tls handshake could make things serielized, but issue is that from source side handshake is done in background with another thread we do not actually block, so it is still possible that multiFD connection is accepted first on destination side.

Oh I see now, tls handshake is done with different thread only for multiFD channel, for main channel handshake is a blocker, so agree this bug should not be possible with tls. So does current patch works with another change that we do not do read peek for tls cases and fall back to older way. Normal read ahead anyway does not work with tls for earlier reason of deadlock.

Thanks

Manish Mishra

>>
>> All we need do is read the magic bytes early, regardless of
>> whether its plain or TLS channel, and it should to the right
>> thing AFAICT.
>>
>
> Yes, but if we try to read early on main channel with tls enabled case it is an issue. Sorry i may not have put above comment cleary. I will try to put scenario step wise.
> 1. main channel is created and tls handshake is done for main channel.
> 2. Destionation side tries to read magic early on main channel in migration_ioc_process_incoming but it is not yet sent by source.
> 3. Source has written magic to main channel file buffer but it is not yet flushed, it is flushed first time in ram_save_setup, i mean data is sent on channel only if qemu file buffer is full or explicitly flushed.
> 4. Source side blocks on multifd_send_sync_main in ram_save_setup before flushing qemu file. But multifd_send_sync_main is blocked for sem_sync until handshake is done for multiFD channels.
> 5. Destination side is still waiting for reading magic on main channel, so unless we return from migration_ioc_process_incoming we can not accept new channel, so handshake of multiFD channel is blocked.
> 6. So basically source is blocked on multiFD channels handshake before sending data on main channel, but destination is blocked waiting for data before it can acknowledge multiFD channels and do handshake, so it kind of creates a deadlock situation.
>
> I am still not sure if i could put it clearly :)
>
> Thanks
>
> Manish Mishra
>
>> With regards,
>> Daniel
>

