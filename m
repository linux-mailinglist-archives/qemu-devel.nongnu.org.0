Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B3634525
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:07:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxZWg-000814-1q; Tue, 22 Nov 2022 15:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oxZWd-00080p-Fl
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:05:47 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oxZWb-00043j-7W
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:05:47 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AMHMgsu028869; Tue, 22 Nov 2022 12:05:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 from : subject : to : references : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=KvE8w92BrSAUS7VZgyXtxGKSrqmI6Tln5ifLwFfNr40=;
 b=113jUM3pBsC5FNKUIuqrOImunpNJkwyZMM/WZj1vNcDTw9OXZg+eU/XzHGsL/lTybTNc
 P+gvuzfavFkWStyVQqoiyVdtm2dICXbzCvhf8xzRslrH0G93VJscCYPG4VinGi3X4Cmh
 PWOS+RokPQtRjEt6aX7Z2ruou7ubAYGACkfktGstvBmqxg1fE4LSfug/k5IrdJ8Iw7v2
 JhHpXiG7cwG5CWlDmUg4kANtBrrjX64fY0H6amKRsp6bdQVdK+2lY73azDPLykpyruok
 wDNvsAug4gfEXhYMhsXTsgWkyURpvdjB3onYlOicGBK4ucY/sZzbndDMq1Yz73UGgaWu Xg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxx4pgs5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 12:05:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH1bek8kCJ1VxnAYhhHY0wthDkw7DIIf1AYiEGHoiv0mQzqXOEzSE6Z9hHAfQQxrLnpYKZnlgcba+lpwOfTRqzcQ7meHz2pHf0yTE4eKYq5E8tuGN7MZRB7K7TY2+Gd+BkAYQHfHamJ1C2eki5dfWHPWFiOexMWumtqS1byTXY0abhulY+z4leM+t3Vk1k9s6JrEYGM1kCALGHcuspOFzusawCkXec0iv4OYONKUrJYH4gcUGl+0WJodmu1xS0P7i8qODQ4b6d7cDdgo3t9gGMrrDdvCq+LUYLQvtkTDnWJ4cr0yFQUm80SwG7NrtgchdGAvkm6RNrJ3hTPaOpT+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvE8w92BrSAUS7VZgyXtxGKSrqmI6Tln5ifLwFfNr40=;
 b=O0y4JEWYqgcB5S2Q//PFThEpemmxUAa1acTvjFvh8yKcvbB46V0+2J/NYOCORys7R0RJKbI4BUsI3zpNP28pAVW0QZYbEi0Cw53vVqPoheJbu13IrX3JE9o+zBw5MaP83Fhgeiou4usiWK5xHbBeDVLnhXJZsGlR086JlfRtlVblFQvLjacDxB3FQK+lA1YZPjfheF0o3hPIqTbsnm/vTmnOeUEhR7iZwWh1wW81d9WLHwRzvOJkkveko4HqswdGe8gyx6vE7rB8j/lDC7GJ8BAnapNC4vQdnvTKtLxJRqOVyuviYADhNPMxZjR15fPtnr1uS19bpUGD7TuLo7og8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvE8w92BrSAUS7VZgyXtxGKSrqmI6Tln5ifLwFfNr40=;
 b=UFuOKew5UcuKx1Ib6Eyn2etv/2mismKjwNkI+QKhlwa/uoaATyHi4TCKKLJOND2dXbeKZAMT7cRxKlcDO34utn90k3PBucPtSFdrvQePxZGmw4XCxBI5TiJXfuShcRmYB0EsP+oEljwnSKibIBwmhK8/+BvL101I83fSZv0T+Ffb+MsUUA0iJf0hmEvqn28MaY7rJqzZt8fQjeW5OZuA6mo7xc+hrrN99Gv3NnCrdv2s/sNyjPDjkPZUyIFnclkGW938kVU+CQHopb92qb080/4sQmpM1hQ+d09g7SOMCGqzff+Y43CsGLls4BZ/TBlW0HeUNWlxcuA3k9tSr2HMKQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CO6PR02MB8722.namprd02.prod.outlook.com (2603:10b6:303:135::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 20:05:38 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::43a8:c20d:67d0:74c6]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::43a8:c20d:67d0:74c6%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 20:05:36 +0000
Message-ID: <1192c455-3a06-d4c3-0f35-0ef217fda9ec@nutanix.com>
Date: Wed, 23 Nov 2022 01:35:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
From: Het Gala <het.gala@nutanix.com>
Subject: Re: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
To: quintela@redhat.com
References: <20221121110427.198431-1-het.gala@nutanix.com>
 <87pmdgtr9g.fsf@secure.mitica>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, pbonzini@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, eblake@redhat.com,
 Aravind Retnakaran <aravind.retnakaram@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
In-Reply-To: <87pmdgtr9g.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CO6PR02MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: 90176998-35c5-402f-2613-08daccc4eb35
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4tckoPNCMimqZ+Y5czKX08jf1p5fmeWBDKiv18yKrMdhxic3eHFCZj8YkqN6NdEf9nS5Yk3sj0IKM0t4gDHTSJkQUDZDwZSsGd9xEBbWqIXHJc11ZajkpLreQMJDsxs3jgxCja+NkA7tNtmGB9rGH0gT5EGBT1XqebUehujiJvnY2iMh5HPhEO+Wka4hmVHfvI7SDWKVvNGbf1Wvqq4M/T5fUnLY6luwSQ+B+Xj+dmqZsMmteKKybZyf7oV/6vtanWxqoeoFsAnJVWhVfMRxHF3ZXLggikkTCrshjN5DGr16YM+/QqzpHlC5vIKmiMGBDGS2xwvUbM9sY+fMuy68zD+CLThqUH1E9vEjCDyPJ3kgLayvL3eHghCKhznFwNe8RK8yhGPgVcQx3YBQySH9Z1DorvBIp4cUP+Nn4SJ9lJb3YWPi8j9riyOzIKp50bmWCS5ldmbk58OB/avPVPV3JOJDZ4RyvcwhqienxIw4Ko8q74qwtaEqRUdVvUz9EgIPVEY4o37UvSJxwaSbDI9OS9F8JRXRgyPdDCB0Au1PQ8abhTKY2bqWsSirXqVPP9pknV7vBW8XazQf2Ss4aPFWqJMyspXB5xZh1AmHzPPtX3T55PFHkEMHJBohYjuAktoj/bpNarkTCfq4uuCSoLCbsqHFKsvKXolsSYKhBSH2dfT+j9mNtmA1eSELvWF7r+JVP+hqz26HHXS0lx9k/tRpm5kP2T0Tq3aosRBVm2BHQBOBpHQqOqTb2Zxd86Imz/k4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(83380400001)(31686004)(2906002)(2616005)(66946007)(186003)(66476007)(41300700001)(31696002)(86362001)(66556008)(36756003)(6916009)(38100700002)(38350700002)(6506007)(54906003)(52116002)(53546011)(6512007)(5660300002)(4326008)(15650500001)(8936002)(44832011)(8676002)(26005)(6666004)(478600001)(316002)(107886003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVV6cHZ6MThQQ01OUXM5Q1Zid211VEdLbm10SVhlYlBjZVR4SmQ1VjY5dDVM?=
 =?utf-8?B?NWRoSzBnbHhmTmFuOCsxaUZ6Z0tETEhlVmdMVkZUYTZaZDUzdHhWQ09oRmVh?=
 =?utf-8?B?MkFCc094R2dUbFEzMDBtZ05yeUtVVGx4M0xhYmlJM3cvQTZoakFhMlRlWjBH?=
 =?utf-8?B?Z2hLTU9YRGoyMVRUZjZtYWh3RDlxby94N2ZRQzZlQ3M3LzdQN29sRzQ4b2wr?=
 =?utf-8?B?UVFtSXRIWitQcXFmTUYrL0hENWZiL1U0a25USlpwM1dvM2Vkb2I2NC8zSlhp?=
 =?utf-8?B?R3BKeVJ0WXd0Y1J5K1ZIUXBxaXFSblN0UHdSa2EydG9HcXgwWGxhRGNNQ2l5?=
 =?utf-8?B?YTFvRlJaZG04UGhhSUM5TSsxRjBDS1pnckxETGcrSjhFSFFRS0FCeWR6Q3hN?=
 =?utf-8?B?QVo0cHB2M3BZOW1OMlBYK0xZVTBTQk1LLzRrd2l5MFBaMUhGNjZ3OTBSY0kr?=
 =?utf-8?B?L1gzSTd0K1JHWW53UmR6TWh4eEs3MU8zbzVuakoxVmlUWkpmRUtlZ2FnVDNJ?=
 =?utf-8?B?b2JRMVoyREp0cDFjbWpoajN0cTBJU0taVXVWTjNkUlBIOFEvUzBkRGxqSzZ2?=
 =?utf-8?B?RkJHSERjUHZ2TFNjM1BkT3IrRVRGZ1JrcHdGbmVYQ2Rrb282dWltczJtZDk1?=
 =?utf-8?B?L2p4OVFLOHRrUXJPbTJSVGxFdzJMcmR2TFFpeldjTkR1ZWN5TkR4NUtzMUxV?=
 =?utf-8?B?SVQ3WERpNis2ejd6Q3lnbzBFQVUrSjA1dTlHMVNkUFRtSG5ZcVBDTjIrUHhm?=
 =?utf-8?B?ZStKbk9IcllTQVBDSDRnamhFV05NdkpWajNGcDdHcGpaL3lNS0FiaFpydFRD?=
 =?utf-8?B?R3ZSTVpQV2RpVThJR0J4Y0o3L0I4Zk5yVmNCd3Rwbm9TZmhHRldlWklsTTFY?=
 =?utf-8?B?MythL1hFS2lSZlFLazloWEwwTGFEWUpoZlR3Y3JRN1hkUnVXMDlib1JMdUoy?=
 =?utf-8?B?c2lvZEs3UUhaT2c3T2k1U3EzcStsYm9JbnpibEx4clJrMjhaT3hIMDJxZkxX?=
 =?utf-8?B?ZVQ3bmhUMnkwMjhNSWhGTUI1NG9tVUZYL2ZYOWlDU0NZQ1FPSFI2WVMwTW1L?=
 =?utf-8?B?dkk1N01JSExCSHJUUlFqTXVhOEZ1TUNpejAzNm1hWldLZWxwcURTV3lYdXpH?=
 =?utf-8?B?bXhxbndQTDEwb2NKcVBzeXBOSGptQStBS0djWlAxMGJ5K1pmdEMxTlk4SjlM?=
 =?utf-8?B?YUlZYm0xZmwwZVdsVDVOZ0NMZ21NNXBDNE5pV3VVNGxoYjA1SVh0UGpRVDJj?=
 =?utf-8?B?dC83alhXcVNqNzY5SDd6cTAxaEVPN2VhWUxHTjBtdWx1MTFkWjZxZ0l3bnBB?=
 =?utf-8?B?bmI0K2pZUVo2aVYxc2NvY0xFalI3ZFo2T1ZYTjhnK3NGZVRlSGlqMCttZllD?=
 =?utf-8?B?Rk1DMU1HUzh2eGRORm9WaElKTFpLQlhCT1Q4VGdBL0hQSUFsL0V3WjJrWVJZ?=
 =?utf-8?B?bGc4R0tqVHVwSTVnS3NVeDRxS28rTS9WQ1lFQ09Rd0tPR3lsTzNFK1MxbGE1?=
 =?utf-8?B?ekpTSGMyb2JVVFZsNDVkaFJBVzJtV3R5VFRnRWt5WEpIMXFjVkJMSFpCeXh5?=
 =?utf-8?B?c2VuZStLTEYrWHJJWTR4R3dnVzlkelY2YlJrYUJ6UGJjSEY5UHpkdXNLSHVI?=
 =?utf-8?B?TThEc25IMmdOUjR2OHd1Z0hwdU9zZEhmYVNzQWUwUVJtVmlLRzVnYVc0ZzFt?=
 =?utf-8?B?RlVOQ1o2Y0F1R0dqWVgwMW5FUWRQOVlmQkFzZjZEM1E0eXlSbkJxeUc1K3NR?=
 =?utf-8?B?MFRSSVpUejhkYitBRTdWWGZYSUpwQUxycG9nQ1RBUlVSZzk0RjkvZ1hhRGF1?=
 =?utf-8?B?MTdOYVE4THlVMys1ZzdHT013U2tBSEZhVEhpcGI2bDBuemRiU2I4YWR2aHcv?=
 =?utf-8?B?TnJTNjNHTFR2L2JSb3h0OHlyZWtNaUkyYVFhUG9jKyszQVY4UDVCZHF2a2tw?=
 =?utf-8?B?alZDSWdwRXMrcDgrR1gxSnNudTJPb0tJNDhFUzFQRzFtWmdSVlYxZ29JNEhY?=
 =?utf-8?B?Z3lnb2JtMTlNSlFNc2FCMExPemluOER5NCtWNFZvSTZobWJVQzZjTHpZK0Y2?=
 =?utf-8?B?K2I4YTBSV1l1dC85cnNkTFFickRJSkx2YndGeFVnb2lqVnVBdTd3NzNadEJq?=
 =?utf-8?Q?7ydV7aQ+a73LTscvrPtjzKuVI?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90176998-35c5-402f-2613-08daccc4eb35
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 20:05:36.1256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYaIIr2fHXVvzf1XM3z716FjjTH0Q+8qYsZN17N4rz+ptCG/7vgQVRyTAt4ZFK0lOkBJR8o95Suwecdt+yiN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8722
X-Proofpoint-ORIG-GUID: -U_dk2Bt1xqYg3j5Q4dESUM2q6dikZaY
X-Proofpoint-GUID: -U_dk2Bt1xqYg3j5Q4dESUM2q6dikZaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_11,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 21/11/22 6:10 pm, Juan Quintela wrote:
> Het Gala<het.gala@nutanix.com>  wrote:
>> To prevent double data encoding of uris, instead of passing transport
>> mechanisms, host address and port all together in form of a single string
>> and writing different parsing functions, we intend the user to explicitly
>> mention most of the parameters through the medium of qmp command itself.
> Hi
>
> 1st of all, I can't see how this is 7.1 material, I guess we need to
> move it to 8.0.
>
 > Thankyou for informing. I will change it to 8.0
>> +##
>> +# @MigrateTransport:
>> +#
>> +# The supported communication transport mechanisms for migration
>> +#
>> +# @socket: Supported communication type between two devices for migration.
>> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
>> +#          'fd' already
>> +#
>> +# @exec: Supported communication type to redirect migration stream into file.
>> +#
>> +# Since 7.1
>> +##
>> +{ 'enum': 'MigrateTransport',
>> +  'data': ['socket', 'exec'] }
> I haven't looked too much into this, but as Danield told in the past, I
> can see where the rdma falls into this scheme.  I guess it is going to
> be its own, but who knows.
 >So do you mean, 'data' : ['socket', 'exec', 'rdma'] ? or it will be 
separately represented
>> +# The supported options for migration channel type requests
>> +#
>> +# @control: Support request for main outbound migration control channel
>> +#
>> +# @data: Supported Channel type for multifd data channels
>> +#
>> +# @async: Supported Channel type for post-copy async requests
>> +#
>> +# Since 7.1
>> +##
>> +{ 'enum': 'MigrateChannelType',
>> +  'data': ['control', 'data', 'async'] }
>> +
> 'data': ['main', 'data', 'ram-async'] } ???
>
> I don't like the 'control' name because without multifd we still pass
> everything through it.
>
> And with multifd, we still pass all devices through it.
 > I agree with you Juan. 'main' seams a better name here. Thanks for 
the suggestion :)
> About the asynchronous channel, I don't know if calling it postcopy is
> better.
 > Okay, noted. Will change in the next patchset
>> +{ 'struct': 'MigrateChannel',
>> +  'data' : {
>> +    'channeltype' : 'MigrateChannelType',
>> +    '*src-addr' : 'MigrateAddress',
>> +    'dest-addr' : 'MigrateAddress',
> Why do we want *both* addresses?

 > As mentioned by Daniel, multifd right now is supported for tcp 
socket, and we want to make multifd migration as bi-directional 
migration stream.

>> +    '*multifd-count' : 'int' } }
> And if we are passing a list, why do we want to pass the real number?

 > I think multifd-count variable would be handy. Just to take a used 
case here, we have heavy workloads to migrate, and in our system we have 
a 25 Gig X 2 NIC cards available, and we want to ensure that migration 
does not fail due to less available network (because IO, and other 
processes might also consume network). By experiments, we know that per 
multifd channel - on an average we get around 8.5-10 Gbps. Writing the 
same channel atleast 3 times to cover one NIC seems again redundant. So 
to prevent this, we think inclusion of multifd-count would be useful 
there. And anyways it is an optional, so if you don't mention it, it 
will take into account as a single thread by default. Let me know if 
this is convincing or we can discuss more on this ?

>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "channels": [ { 'channeltype': 'control',
>> +#                          'dest-addr': {'transport': 'socket',
>> +#                                        'type': 'inet',
>> +#                                        'host': '10.12.34.9', 'port': '1050'}},
>> +#                        { 'channeltype': 'data',
>> +#                          'src-addr': {'transport': 'socket',
>> +#                                        'type': 'inet',
>> +#                                        'host': '10.12.34.9',
>> +#                                        'port': '4000', 'ipv4': 'true'},
>> +#                          'dest-addr': { 'transport': 'socket',
>> +#                                          'type': 'inet',
>> +#                                          'host': '10.12.34.92',
>> +#                                          'port': '1234', 'ipv4': 'true'},
>> +#                          'multifd-count': 5 },
>> +#                        { 'channeltype': 'data',
>> +#                          'src-addr': {'transport': 'socket',
>> +#                                        'type': 'inet',
>> +#                                        'host': '10.2.3.4', 'port': '1000'},
>> +#                          'dest-addr': {'transport': 'socket',
>> +#                                         'type': 'inet',
>> +#                                         'host': '0.0.0.4', 'port': '3000'},
>> +#                          'multifd-count': 3 } ] } }
>> +# <- { "return": {} }
>> +#
>>   ##
>>   { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
> I think that "uri" bit should be dropped, right?
 > yes, it will be dropped at a later point, right now we are keeping it 
for backward compatibility. Daniel has also responded to the same query.
>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>   
>>   ##
>>   # @migrate-incoming:

 > We want to know your views on a suggestion we had in your mind. Like 
we know that for now, multifd feature is available only for tcp/inet. So 
should we frame our QAPI design in such a way that instead of 'socket' 
including 'tcp', 'fd', 'vsock', 'unix'; we should keep the transport 
union as ['tcp','fd','vsock','unix','exec'] and we would have 
'MigrateAddress' struct only for 'tcp' (i.e. bi-directional migration 
stream only for tcp). For other transoprt protocols (uni-directional), 
we can either have struct which would include 'path' or can directly 
link to 'VsockSocketAddres',.......

Juan, Daniel, Markus and other migration maintainers too, would love to 
hear your inputs on this :)


Regards,

Het Gala


