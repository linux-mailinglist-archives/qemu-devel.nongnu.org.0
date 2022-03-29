Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F24EAAE9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:00:27 +0200 (CEST)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8eH-0007u7-SB
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:00:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ8a1-0004CL-37
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:56:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:14270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ8Zy-0002vg-4C
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:56:00 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22T8t4TK011100;
 Tue, 29 Mar 2022 02:55:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=vwH4WIhbPFSe768ajDxyUxje2jMTdNkfv8jXv8a83eI=;
 b=cWa57o+1dLW64PIHAEEfsJGOcMA0y2LuAmBFCekoOfeOGivJNmVufL5uKBaXr819sk3C
 NGJlLyKZ+QnnllqUV/R8oosOBnXYbJ5TAIkcBVJ5LyZUOIMnb5yNCFgy3RN4lolsNRvg
 VS3wZy0Q6+oeGnn8S/ykRPCDsAneRnxO/yuVK38ezvXfa8zT6ter6KVL+VApx4UcWRRX
 KvQVKqxG9dUYLPz6uDzNSlp50B6Vu3rqgxAHdOBS26E+NlKdJAJCI5sltS19Y0DjBPPp
 Y7sSfFiARhXUII+peMzUcDg849Lq1BCWOlz6NyhnvlX4jZ0y/osZcLjWi5vghk5TYDHr HA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f22c0dhk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 02:55:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxRlEDYTFwpiG4Rp0BcskzZYHvIDX6hj8gK4chDebnUgvKPU1DFOp3D9aSHFX5Dj+8XpoR9Iy9Cw96R3CcCLC4Z+T5d8rQ7PiTAeeTNRf6sWnwWrF9jvq2obe+kM8/jkOrTdtC5kk5SId2DGTE2JHLWcde8KzIdEg2jDvy8JpsY/b3+WnW2Z7wB2RsZnc6cxY+CE/zcTAOyr923nba8A5Ltp85cuYH9+E1KVtCj76n+6YUKzBp5QQF5aiTd6KC3O6RdQ9pXUK3keHRAt7OGhjX/Tt9PW/+4K5DEyl0x7CC4Jo21AVhcHIxQimHj5S6FBlnVKqglJjo/PhgYihK1LLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwH4WIhbPFSe768ajDxyUxje2jMTdNkfv8jXv8a83eI=;
 b=HhqxeN0Ob21aUOJfBTJyNt3aCUJaEV8rvGN6MqzEkz1RFWdF/W8SAMG72SqN3N36zEGJNVM4F4M1TL2haHRRDitaI0kB6ghmQAOQD90wX5O++vgX6Ef5/wiSLLPyWJaMXMnyGAClo9T+JpvBcuwqRIR7OKAFyPNWTNPvHZIBOxaF6MRVsBP/SnyOh1L4porNMmqKvzbq4gvVvHlFjtg8+HdkjUC+Y+fwaHjLSVlJDcx8JNTWhUv/z0PCpUt4ukgVfUsChQQTV+P2jYJZJw30qj7s36NOX8zgB9B/X7Q5ElbSDz1fjtLRiGDCMT8XTqWdcuxp7c007Y8ohjmjC94i9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2275.namprd02.prod.outlook.com (2603:10b6:404:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Tue, 29 Mar
 2022 09:55:52 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:55:52 +0000
Message-ID: <bf0a9075-e2f8-f4f0-b8dc-4b63c21100b6@nutanix.com>
Date: Tue, 29 Mar 2022 15:25:39 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: On patch series version tags, and also cover letters (was: [PATCH
 v2 2/2] Added parameter to take screenshot with screendump as PNG)
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20220328165415.2102-1-kshitij.suri@nutanix.com>
 <20220328165415.2102-2-kshitij.suri@nutanix.com>
 <87bkxp5kfo.fsf@pond.sub.org>
 <0705b49a-d4f6-f670-e26e-84d637c8071e@nutanix.com>
 <87a6d9429w.fsf_-_@pond.sub.org>
 <CAFEAcA8Lb0FFybmQCZdqD=o-Md=ZTGpTNtunkmd3moLzK7p=Zg@mail.gmail.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <CAFEAcA8Lb0FFybmQCZdqD=o-Md=ZTGpTNtunkmd3moLzK7p=Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a29823af-539a-42e1-bcb4-08da116a4f18
X-MS-TrafficTypeDiagnostic: BN6PR02MB2275:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB2275799473C0E034CCD647ED991E9@BN6PR02MB2275.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvxxMdINPHSVmCRq2ktYJDzZ2ksqdkHD66FnQraLjceU4q94UUSkE17BCW+dbnKxfLhjG+jYyfnoMCBZfO5vh/ZWL3KRJH7molV8XkZrxGMHx7gkPk6+B41qUSL1mBoHUrN5ltv/TcDE7C3Hm+ce6UEfXFPtCIWNZ9K1he5k1wu8m1klCCY7cWhF69QcNedy8B+GCODyqhwfifAATBwJ8ea1BEVA27FxmMeoAOCLwHSOevqTOWnsL5zTRtzM3odcChy93IXlcgIvmqJzbl2kCrf5D4lTEGEBe5rA25wEuQswTT+wfJWRlyhGRzcsJ19GiQpTEoGXhyc23QHZZaEoI1SGoOTQF39ZkhSiRqKd7wbGX6wxd9xYXs2GnvSsSHNOhhxn7pnYGH6tjC0AKhzp4EycnVkB/oHV4sGNLtl/yhP698Wir5mwX5a8lbFaZHMVZ5dUZ1W9iOCnkE+5MH3HlB5bi6E4utNnFc7UsPIXAZuzQ3wBK4mXJj9ohATiROzMr71Aj1Rdo4EVimvgKH285hqzY+Ojih3CHsPDbw6OLY6VlgBhbN1LZC//MgDqbeSXI7juAoJyt0VxY1+iCrEQv4lpdMgNbwoTotiR3SM5K0+qVWuvSEiQRyCweEPcgqleuqp2GWwUkr+cIgwCD1dUbyfZq67H/EU+N0Tn8XFNLwrw3hSgs+3lSu+pzpTeDusJ5jYaUO44+zi+DtgDFozRqybBk6JmW8TjoWQkNB5qwLcxgNYR+1GNuvySmKVT+Cq7z72qUIpwkJfLB35DwGW0LQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(4326008)(66556008)(31696002)(316002)(86362001)(8676002)(6486002)(26005)(186003)(508600001)(2616005)(6512007)(44832011)(6506007)(4744005)(6666004)(38100700002)(38350700002)(52116002)(8936002)(53546011)(5660300002)(31686004)(110136005)(36756003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVoNVhqVTNkTXJZK3pCcnZNa3hoOTgyMTJXNjJCbzlDR2x6VWg2N2JjSVZZ?=
 =?utf-8?B?REc0Vi83SStoWUlGbjZiTC80b0J5TFhBUUVDWWxUelA3OHVHNEIvZlVJQkt1?=
 =?utf-8?B?QUh4VExHS0tQMjFGMll2dDdwbkhuVTZManVXaGNWSTBhOFlhNzhsL3o0bXpU?=
 =?utf-8?B?ZUVUTnF0cy9WNkpyZnIyN3JIWVluSU03RGxuMlo0VmJyVlBUd1RKT0tBSzdO?=
 =?utf-8?B?b2FxVWtJYmJIRjRCemM0VUJrRkFKc1JjcURrS2U0Q05rampsYjE2d2xsd1R0?=
 =?utf-8?B?SnRuNURBSGUvR0drZkZaYkdkenNUYUJPWlJEeXRCeHNETml3S1Rlc0w4V0lG?=
 =?utf-8?B?RGRnMnMwVjBZLzA1cUdhcjlBVFZBM1dJWnljUUdRQ0xkMjJ0WFlqRFd5UXlO?=
 =?utf-8?B?MGdsaGhGSjJFaVFIbm9FVHRNWFMrMkIrR2lFbTcxS3Uvc1RKSS9veXpScEd2?=
 =?utf-8?B?SjRJd3dpT1lJdzIyNGpuclNVdTREUUJNREJXeVQwdVlqQkVHVDJoWDZ1WlhH?=
 =?utf-8?B?WVlrc0NEVVFyeU9KQnY2R21xVzlJZTlCOWNXOTNPRXNpQU95UjdpU3FPRkFt?=
 =?utf-8?B?UTAwUHhPSDBpaE1nVy85N2YvK1FJVHhteW02NVRiQ2o5aDBpbmtKMHFnK0NU?=
 =?utf-8?B?OGdTVkpJa3pxbU9ua1pISTFwUlVUQUN6MXJWVEk5WHZoN0FCNDJMbitHN0F5?=
 =?utf-8?B?b3FmWHJBc1NxUEEvMVhvMHRtUlpOUG15M2w4K0oyaEZ5YnpCTjlFanI1Z2NF?=
 =?utf-8?B?TG9NNnVyMTlSVW50WmRscmJPL1J5WklzUlhXUm9rMjRYdEdBZGdsQ0VpSVN4?=
 =?utf-8?B?bGRsaC9adUlKY1pFWmV0R0xIbFVwNldTOUk5aVQ5Y0p4Nk5RQjlWQzFPR0lk?=
 =?utf-8?B?TmZDdXRTMk05VFJaajIvRWJWZkkvKzFuMzJDY2UzY2xYMGl6S0t0dzdoL0dE?=
 =?utf-8?B?UDltZTFGVFZJZUNsSk1IUGh2Z21yL2lad0JZSDE2UVhrT1UzdnJaM2NLZUZS?=
 =?utf-8?B?N0kvQTkxYzNEOVN4V3huTmlNR1RYeVFuTmZOa1dZT3llYmprVjk4S2tUUy9p?=
 =?utf-8?B?K21WVU9JNHRJSUtNUGxSWUJ4YTBoejQ5RjNrUEpuOWhpSTgwSFBGdm1SRWcz?=
 =?utf-8?B?WWM0dnl5Y1A0UHVMb2JYY0k3TUxxemFUdTloeVdKakZGalVZdnhBNFBZakRG?=
 =?utf-8?B?V1UvSFdhN2lHR0JldjdaV3NWazRzemNMSzk0UDJ0MkEwNmlqWXBESzUvVmVW?=
 =?utf-8?B?RzlSYWNwYlV5aGRPaVhZTW01NVpFU1MxNWoybzUvSXV3akZPWnl0ODFWVTkr?=
 =?utf-8?B?M0JXUHNqekxjeThqakhYOEhrNlpDa1Rmd1ZDek0rOVhFL0FDNHhhMXNLSTJv?=
 =?utf-8?B?UWFXRzVaNDlORWszRUt0NXlDdllneTlxWHBXUHJZbTFTU3FlZTVNMjBibHRh?=
 =?utf-8?B?OGR2QThRUGF5MUZXVzY3NlJrOFB1M1BiMWhCaklCMmlta2Y2M2JNTFpWQXY5?=
 =?utf-8?B?alhuSVhXQjhCYnk3WWNLUjltMmpPclRHblhNQ0Q3eUhrcER2RnV6bUJFNGNV?=
 =?utf-8?B?KzNlZXdHVXIyMHdXMFkxeWRpOExiRlAzbmZDaC9EMCtBVkZLMHphRkZSait3?=
 =?utf-8?B?VkoxdlZjakhRcjhqcXA4dUdqYjZpc0FERkZPVVJjWGVQNzVmUHNpOEhpUnFI?=
 =?utf-8?B?YjU4ZUJvdXdDeW9XWlowSVl6cVdkMVBZVzFRL0owN1owOFhlL0d1RFVRZGx5?=
 =?utf-8?B?dWFyZ0czdDdlTVd5QXFrTFNYKy9DSW51VHJIRkJzNGxRSWRvQjNyWlluWFNV?=
 =?utf-8?B?eGtOY3ViNDNzVXNPWDI0TmFQc0d0MnYrdjBJUEhBcmpCSmF4OVV6QWh2VVpW?=
 =?utf-8?B?dXQ1SHFVT205THhqekRvZEFjcGpUdFdnbGJxOWNxZThJTGFzdGlVUnRBZXlj?=
 =?utf-8?B?eC9jalozRDQvd2E1NVIyY3hRVGpPUVgxamw0ZXBzTHJLVFQ3Z3NqV2FRcXlU?=
 =?utf-8?B?Vnd3RHlEK2ZRR2pmaUl1TWsrMkpDRERGZ29QaWJYWWVycFlCNGlrN1RWZ0hI?=
 =?utf-8?B?dVdqQU9hcFV6WEQvdXF5UTNlcS9SZEhFbTM0MkMrZ1dOdmU0bzBLM2dCa0E1?=
 =?utf-8?B?VTkxeUNjQkp5L2diRzNQMzFzd2Erdm1vT0JaT0Vnd1pjMjZtUk9xeGsrbGps?=
 =?utf-8?B?aVRYVTM5THhlR05kS09aaUhuOVcza20xdG8vU3pEU0hMUFBjWWdEb05lV3FS?=
 =?utf-8?B?VmJJY2VqWlg3MWRFak5NcjRiM2xhMGZvL2hoTHRJenRISFZHNHpnODdHTTFF?=
 =?utf-8?B?NlM2SlltVUxGaE4zb082ZVNmVUZOL2Noc2VwdXdBaTlPSW9aWHZEQ1pENlhD?=
 =?utf-8?Q?sj6eiNO53vlqN+cI=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29823af-539a-42e1-bcb4-08da116a4f18
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:55:52.0854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J99SgNrwzTyRRXzLHmWRdoT4krTBiHBK6gkwgIBCv+/xTMa/ivVREuBWxOwX95uHtzdmkuvANN01RG/xdMyQwBVQqqPrfzzzUxVhSzgupSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2275
X-Proofpoint-GUID: qksozyw3_Vuh8jlwqFqc1FeCT8wCk25G
X-Proofpoint-ORIG-GUID: qksozyw3_Vuh8jlwqFqc1FeCT8wCk25G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: soham.ghosh@nutanix.com, berrange@redhat.com, prerna.saxena@nutanix.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, thuth@redhat.com, prachatos.mitra@nutanix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 29/03/22 3:18 pm, Peter Maydell wrote:
> On Tue, 29 Mar 2022 at 09:03, Markus Armbruster <armbru@redhat.com> wrote:
>> A cover letter (git format-patch --cover-letter) lets you write an
>> introduction to the whole series.  Simple series may not need an
>> introduction, but complex ones do.  I always use one except when the
>> "series" is a single patch.
> Note that a multi-patch series always needs a cover letter,
> even if its contents are quite brief. Some of the automatic
> tooling gets confused by multi-patch series with no cover letter.
> Conversely, single patches shouldn't have a cover letter, although
> getting that one wrong doesn't really have much ill effect.
>
> thanks
> -- PMM
Oh so regarding this PNG issue which has 2 patches, one to phase out 
VNC_PNG and one for core logic, should I send with a cover-letter?

Thank you for our advice!

Regards,

Kshitij Suri


