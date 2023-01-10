Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0F663A12
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:40:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9F5-0002oa-KN; Tue, 10 Jan 2023 02:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pF9Et-0002m9-G3
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:40:09 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pF9Er-0001Ba-HN
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:40:07 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A55ftL005097; Mon, 9 Jan 2023 23:39:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=/yNJg4tIzGMQjnmGpsySqL326UlXIC/2GyDhTG1vauk=;
 b=roP57lQxYytQT/oG32T8hrUfXwvwsAu5c4o1Y4+cb4IVXTkn1/nbY1Mo/YYbG+O1il/7
 NVvaoEPuejkSFES+RxXS9aU0rml/yeSxOzG2SroPpepuUWZb8Pw+9uFF64eZ5Fk9N+eC
 Q1DIQeIGUdLJnEhHT752WrcqkVNu4HIOU4m2BsMuWInhk0it4TzPRERrAaLrtpfNRV8C
 JBeoZ1sAAGb5zZaL70KQk2ThdTeatMoe0sBaXYjr3VbFRGzfhbYy4wRdO87uCFMldg7V
 x5wbS65Z5XBYXvfBoKbNQMvv5FPD6atJiRX7lA/aJrbMSnMvMu8e6zd8daCF/zE5xegA zg== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3my8pp72at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 23:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlOATM5HCBzMUSppmex/Nkevbr7LwahCp2AKc9ktJY98/5OZt0dBAtZYUZ5Pd/UfcgFTJMIpaDIDdWNgpIQrglBKE3ypT3VUSYXKl02BhHiuyxNJAomUX1ugGHbQHORSrpoO4iB1Ov+5foSU9YK7Rn/Mop/rxO/eh63lhpDvaw1FLPRBO+Iuvz4FIzxgXmqvVL1INvNrxTIqUUAFSdAm8VIHjt6cIiH1mqWyMtvpc1cRU540e7jTyfFj5wro+nenHYQydTodf4GhPkeiuhHXmCTcGm1qIsmjjeW7CkHuhlAAOpw3nR8WjAKeCRwjfizWaLT5NphTKOYOiEneIyWk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yNJg4tIzGMQjnmGpsySqL326UlXIC/2GyDhTG1vauk=;
 b=i6XgQLU61tWx+hCJXEsBaqWqH1O41oNuyDk/BHF2eZhEc2MBpdH3TDr7Z5SW+kgJ9dnZuwLHXdXMpkWXsclUVHjzcEL+z6xJ0WU0C60VE6E4gYXf4wjN/vurUteVU18MUz3FCqjCnjc+Qm/uxWFxA43vliZ7SZ6fDfOVBvuetIFwoWszEqPHPA/bKt3zExyKTM0ubNPm7MsfIPJMXmp0YluPxJni28Ys1pQFjVR/+NHN7LW/EjyXcjLdmEI2z1yJ64tonBLCnXqZMmHzlPh4BKSpaIhdgc7icfnl+qe6QgDD4SlDuWbIViZRX5XH90eg3ByQYMsac0iUrP6WvgLvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yNJg4tIzGMQjnmGpsySqL326UlXIC/2GyDhTG1vauk=;
 b=cVGis0M2a2oJTvEJwPZdZEn1PIu5wck82z+hL6fI07TYqZWHGXXto642NCpiFJDcsEQ1Yzau1lWK4UJ6F9X1P5TU9GJdaEb3EQ5J0eX7zrHmMyKPR/QzXzCu5ZEL0v0SsyJo78oMgmpgAZV2WcMQGEbW5BbhMUB8PMyrAKRBeZF7wlvpSVgJCYbXthLXxlLbw9KB31XB5zCJ92c3yg0+TzQ6/evka34uF9A2l2mE8rb6Oz8EFRWLWVz7SFwR0t7XBObnOMISg16c31X+McWS/mlObXtdb1oolyM+lzQg6GSbMX7donQ6Uji9sGgN8kYY/dv9ebQAwBMq6I8o7h/nBA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB7295.namprd02.prod.outlook.com (2603:10b6:a03:292::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 07:39:49 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 07:39:49 +0000
Message-ID: <2b1f1234-944f-756c-f952-c8096149191f@nutanix.com>
Date: Tue, 10 Jan 2023 13:09:35 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com> <Y7wfoGpM6iwzy8L1@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Y7wfoGpM6iwzy8L1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f55feb1-9213-4b7c-ed94-08daf2ddda01
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAY4JBzdU0UFfc7nHipbFWAvgHRIxuYanzzc+D0NWqOmPijFwyxF4eoZhxtbpp62dznWydgP6DXuVKGkfPIdezku/JJa2IumEo8M6TtCt0XpcKH4t40UfoVe3ECb4jGQDHfKOVAmRk4IPzWOeHV1KcViqJcj5LJSw9wmCAFpyqTyWexaN1XQ7hb5gB+9i4ej58xEIOGsot/3DYOCzsHEim24MxCo8oUAkGx9vUjW4g1446vvyZoK/bpxBUfaupl4gV6dN9yQ7ISj+BtJhF0Q11jhGxM1Gl47I0aSGtYphkujkHK+x18HhItf4nwO+ELXhoKU11aSAqNXiQJ/sZ/oHG+SQc6M/Tuda3flY8WMvIsZGU+yobY9XGA9cPv/77N4XpN/NEXLxtRhu+WygXlF2kGUYobfckqCeubnS06JI9e/9kqP68DsTTQIikw813/ozzXpaiecuQNhO5V5tUcq4QG2mi/szeeVl7ZOBiPPN8Fq+epTtN5k2q6zfqmJ5IPSxRPHiG++sczzMEdVy3ttafsy1waktdpW5stPq/6gw24Wv7vGcO8bnj99TCStbi9p36eCweCeC3hjNv8MJghLYBsqIsXsOG+a8/TxWcKlO4zRPumEeIAboAxj6Fxt0X+VqupyUEOR3t2gMwO1Sf00JQ4DNT9hC9XdqSDnNEaWsfL4X/7mpVA93llqsbWF/HQN7CIa/eqDcP6GjiSnQFsKQRgskADHSfNmNGs2UKAFVnMtpouImjOiaHHojo368NDEDmw2ph/hmrPlhOLsqzSg+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(6506007)(478600001)(6486002)(6666004)(53546011)(2616005)(4326008)(26005)(186003)(6512007)(66556008)(8676002)(66476007)(6916009)(52116002)(54906003)(316002)(107886003)(86362001)(38350700002)(38100700002)(83380400001)(31696002)(41300700001)(66946007)(31686004)(36756003)(5660300002)(15650500001)(2906002)(8936002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFZ6b1NRTlBJMk1MZDZIeTZpaTQrQVNYWWpVazQvSk1lWi9WblhBTUorcGlS?=
 =?utf-8?B?RVBpSWc1clAxaFgvOXpobzcvY1c2aWJrVHRZQ1AvN2tNRU9SQy9NK3h4eFpt?=
 =?utf-8?B?TWNMZmdsdFI4WUdKM1U2QUxUeGtGQkhyaU9MeTVPSGJkMVgrVHhDc2ZzYWVk?=
 =?utf-8?B?UlpNMHNWb2ZWZjV4N1VFWFQ2cTRqc0FBd3I4dEgzY1RVWkFGWVlyY2podldp?=
 =?utf-8?B?ZVBPczZ5REgyWUJXQURMaU5PaDVUTkRVTDBQRWp2S2hwK0VNOXljdzhLWEE5?=
 =?utf-8?B?VUJZMVYxWWtLMGNtcng5SWE2Wkp1VXRseFhKeStlQkNFditVempUYllyWUdn?=
 =?utf-8?B?MDhEM1IxVjA0b1lxQVpUaEhScEZGdVJtaDFpQU13S2hvKzdxam1FYnh5M0o0?=
 =?utf-8?B?QS9ib041d0dxOHJ3ZjY5ejNYeHltU0ZWTWVvZHhpSXhDNjk3d1dWaHVhT28v?=
 =?utf-8?B?c212c1E2K1VsMVVrekc0QjQ1YkJJZENDYlArcHFHZE1JQ1hQTXNTQlpHK3JL?=
 =?utf-8?B?cWliY3VaRlNQU0c5dFJhbEZxdS96eUVpTnBUTmZFSGpXTnErSmNmVGFXS1F2?=
 =?utf-8?B?azB5OVora2lwdlplVS9acWE2K0FXL00rd2x0dC8rcHR1ODNUdEFoL2FCVDhX?=
 =?utf-8?B?bmR6cGkrRkJGRzZnMFdxd0I0T0ZoQjFmbmNZT1h4M29lK3lPNWVSczZMQjhw?=
 =?utf-8?B?ZXR1WW95eWlPOUQ5Ym45bmlRT1ErYlAyK3VEYlRnVkVwb1lLWUhkZkUwQ25q?=
 =?utf-8?B?VUFGTDAzT2k0QzZuWnIrWEhXNGloaThIeW4rNWUrZHRYRGhmSjZpNlR1c1I5?=
 =?utf-8?B?QmJJNnVMK0VMZFRURk93Y2ZMV2JjbVhCSEpFRnV2bzBIS0QvTWhrc25Gdk9E?=
 =?utf-8?B?bEdiN0VMTnAwWUUwbDliZ1MwN25HWUJnQmtOOS9VcEVkWFVackVyNExpT1JO?=
 =?utf-8?B?aituem1NRkRwRlZlN2llU1NPVHZJVkdqM1lZUXVWWWc2TU42Vnd6OUMyNmx6?=
 =?utf-8?B?OFFaeGRWQkZYei9QdW40bHd0M3dGY1hyM1daSHhYcTJkS0hnQy9ROS9iaVJ1?=
 =?utf-8?B?N0x6QXpBbk5GY0JreTNPUDFyYXV5SWlWdC9IQUFDZ1VLYnhadkRHZ0tDWjZq?=
 =?utf-8?B?MHJmOWZIWW04NWtvQTdzdldUcVYzMmZtUG9HN2RVV0ZkT0dEWHJvMWNURXYy?=
 =?utf-8?B?RGU5Wk9lWTBMS2pBYW83NU53L3JUcTZlUDFURzBzN1crWHVmSHo0V2Z6YkpV?=
 =?utf-8?B?MFYrMDlEYjRGVFBVSzV0N2pzZ3VLdjlxYUpYV2piT0NpOS9ML2FNTk9qSkpD?=
 =?utf-8?B?TjI2MFEwaTdnOEtLNG92Nkd1cWV4ekJIN0REUGRaS2FhSWV2TEdPNFJidTh2?=
 =?utf-8?B?TnVIRkFiQ3diVkdNNml5S3lZU2k1anY1WWh2R0k2bDgzMWRIdG5CQmRqV3FU?=
 =?utf-8?B?Z0RTRTRMSlVETFJhYW9kR1NBTnpmZitscktNaXF4TTBCdndkOTBUSFlZV2pq?=
 =?utf-8?B?cnFxbGVXalZ0UDhRRHZTaWhzR2ZLOEtjKytYU3BiUnFSVTY1NlE4WnZCU2ZD?=
 =?utf-8?B?MVVNL3N0YVo4eFg5ZitJZUd4Znd3ZnQ4VDNabzdabXlTM204Wkc3UWZkWmVr?=
 =?utf-8?B?S3BBa0ptUlNUSUI2RERoK0ZVNTJ5dld4eStrRmdXZGpEYkxhQkl2T2RQaHpG?=
 =?utf-8?B?SXFXb3dYb0J1MEFhSUI3TGNQU1VWVnpzUUgwWTZpZDlZVVRjbVAyMjdwMlY4?=
 =?utf-8?B?bC94VFk2ZDZ3YzlnRjhIMWxTM3d6TUFKeGt6RFMxWjYyTTZNd0p3RE1rK244?=
 =?utf-8?B?U3UxSDF6ekVwTHBoRVNlSXJiSm9jbmYzdThpdVlVZmlTdS94WnlqcGZnc2NW?=
 =?utf-8?B?Q3FlOGgvYllxK2R0QVNzbFk0SHlYNW10RUdCNThoTWxoaFcrbDhJSnROYmdy?=
 =?utf-8?B?L1h4ZHpJWFRLTnhzUTNrRVo4U0YvWlF4V21OQmdnTnlvVlJwTUFXTEtpc0Nw?=
 =?utf-8?B?NEMyekk0Rjc1ZnRDYW01dTFuSiszWHNJaXBMVnlCd0Z0M3haSGk2ZFIweW90?=
 =?utf-8?B?N2NIYzlBV2wwWkFpdE5zTnM1Z1lEUi84MjNyR3E4TnF4Z0Z6alpPaUdJZ3lj?=
 =?utf-8?B?VDVKdkI0WlVBUnlwZ1JwbCtIc2ZBME10ZzJIM3hjNy9iU3RpV3VuT1ZWa2NN?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f55feb1-9213-4b7c-ed94-08daf2ddda01
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 07:39:48.9037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRx8PtRL1X83vE9YUXMNOPQsFQPB+oZsG5S7X1KRdlEI4b8b8TBtOuwWUGks+orCOevL618hRyfy00r5g0qo6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7295
X-Proofpoint-ORIG-GUID: UjTpDCN4M2f0N9Ilr43xURlWKW_My6Nb
X-Proofpoint-GUID: UjTpDCN4M2f0N9Ilr43xURlWKW_My6Nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
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


On 09/01/23 7:37 pm, Daniel P. Berrangé wrote:
> On Mon, Dec 26, 2022 at 05:33:25AM +0000, Het Gala wrote:
>> From: Author Het Gala <het.gala@nutanix.com>
>>
>> Existing 'migrate' QAPI design enforces transport mechanism, ip address
>> of destination interface and corresponding port number in the form
>> of a unified string 'uri' parameter. This scheme does seem to have an issue
>> in it, i.e. double-level encoding of URIs.
>>
>> The current patch maps existing QAPI design into a well-defined data
>> structure - 'MigrateChannel' only from the design perspective. Please note that
>> the existing 'uri' parameter is kept untouched for backward compatibility.
>>
>> +##
>> +# @MigrateExecAddr:
>> + #
>> + # Since 8.0
>> + ##
>> +{ 'struct': 'MigrateExecAddr',
>> +   'data' : {'exec-str': 'str' } }
> Currently for 'exec:cmdstr' the 'cmdstr' part is a shell command
> that is passed
>
>    const char *argv[] = { "/bin/sh", "-c", command, NULL };
>
> I have a strong preference for making it possible to avoid use
> of shell when spawning commands, since much of thue time it is
> not required and has the potential to open up vulnerabilities.
> It would be nice to be able to just take the full argv directly
> IOW
>
>   { 'struct': 'MigrateExecAddr',
>      'data' : {'argv': ['str'] } }
>
> If the caller wants to keep life safe and simple now they can
> use
>     ["/bin/nc", "-U", "/some/sock"]
>
> but if they still want to send it via shell, they can also do
> so
>
>     ["/bin/sh", "-c", "...arbitrary shell script code...."]
Okay Daniel. I get your point and it makes sense too. This will also 
have some code changes in exec.c file I assume.
>> +
>> +##
>> +# @MigrateRdmaAddr:
>> +#
>> +# Since 8.0
>> +##
>> +{ 'struct': 'MigrateRdmaAddr',
>> +   'data' : {'rdma-str': 'str' } }
> Loooking at the RDMA code it takes the str, and treats it
> as an IPv4 address:
>
>
>          addr = g_new(InetSocketAddress, 1);
>          if (!inet_parse(addr, host_port, NULL)) {
>              rdma->port = atoi(addr->port);
>              rdma->host = g_strdup(addr->host);
>              rdma->host_port = g_strdup(host_port);
>          }
>
> so we really ought to accept an InetSocketAddress struct
> directly
>
>   { 'struct': 'MigrateRdmaAddr',
>      'data' : {'rdma-str': 'InetSocketAddress' } }
>
Yes, It resembles to InetSocketAddress. Will make the relevant changes 
in rdma.c file.

With this, I had a small question in mind, do qemu need to develop / 
leverage some functionality to check the correctness for host or port.
So that if the user enters an invalid host address, they get an error 
message to enter correct address, if trying to migrate via qmp command 
line interface.
Please correct me if I am wrong here.
>   along with all
> +#           the details of destination interface required for initiating
> +#           a migration stream.
>   #
>   # @blk: do block migration (full disk copy)
>   #
> @@ -1479,15 +1575,36 @@
>   # 3. The user Monitor's "detach" argument is invalid in QMP and should not
>   #    be used
>   #
> +# 4. The uri argument should have the Uniform Resource Identifier of default
> +#    destination VM. This connection will be bound to default network
> +#
> +# 5. Both 'uri' and 'channel' arguments, are mututally exclusive but, atleast
>
> Minor typos                                   "mutually"                "at least"
Thanks for pointing that out Daniel. Ack.
>   # Example:
>   #
>   # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>   # <- { "return": {} }
>   #
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channel": { "channeltype": "main",
> +#                        "addr": { "transport": "socket",
> +#                                  "socket-type": { "type': "inet',
> +#                                                   "host": "10.12.34.9",
> +#                                                   "port": "1050" } } } } }
> +# <- { "return": {} }
> +#
> +# -> { "execute": "migrate",
> +#      "arguments": { "channel": { "channeltype": "main",
> +#                                  "addr": { "transport": "exec",
> +#                                            "exec-str": "/tmp/exec" } } } }
> Will need updating given my feedback above
Yeah sure.Thanks for the feedback above.
> With regards,
> Daniel
Regards,
Het Gala

