Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095EF5483CD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 12:03:25 +0200 (CEST)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0gup-00082c-Cq
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 06:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o0gqb-0006g8-TV
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:59:02 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:53762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o0gqZ-0003HT-CJ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:59:01 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D7Bk3R002180;
 Mon, 13 Jun 2022 02:58:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=mR9krnn40aYYdDkKD53AbD/HJ7IocQFd/8INs2pLTuo=;
 b=kECLF4IMUxLcoDp6jTevr4eAkU93ux9UY3AU8351Ibo+uxlxOzxaqfv0HS4bNo5Wad7d
 WfsNNqC8AzgfYMCGp2dDYGCKfs6HHAeL5CeYLlxFJPs3Xd6scauHys8PX4kwhddaaRZ/
 Y/IUTUrFkH8H/7myx7wRr/j5r9fLbd/e0TXmwYamsEqE+KemQgrTV/2JWtRHxil2hdPC
 cDasW/E7H49UftMJdGctvfRCEbTFsuVVfClPE1pFYfAXis14D25LGEnlyeZUT5APhj6k
 lD0B2vNBVlZyHADdrZhIyzWHJo0a86a8fIf8h+W5OH2MPSwXqvRzBQLzR5ycp46l8mTk gw== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3gms5jk5vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 02:58:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv/j518bmFnPzKiHvOhUd5KqKYyPgkpq+ap/1WBl43jJyMN5f5arEkJkENs+Sbyocu8mTe4paIm30QlvS9aaq0k97dGr2kFQyE0Gebg0Y0YTbGwZ0IUpLnSxCRLI1++g5mLv1jF7VvCaUzRaQlEc8433ao4n9JZDsoxZt9tK/JZULxDlkaRjddUwDZq/OnPreWbvCis9mf95xsZwVkCdoKjvA0UuMM7eVVxP1gxMVxV8U5mG/WfHehAZ2/BBDb+LyKZYkinr/JRtI6jLsF4xMOoSUIlnlVvmyINa/OV+VpL0XmLRui/Zgy5LiOQU92pB8bUqjjBwfJG994rQwbMDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR9krnn40aYYdDkKD53AbD/HJ7IocQFd/8INs2pLTuo=;
 b=eWof6qvDxHST990lxCYe2r6IhT2Va3EdWUaVrRuqDjlECalxMCZTZdFHqLAPG4LLN9rJOGeO8Op4nvMcf08mEcBv1SHEcw7FqrHRCx6RqDjZlMTCAg/ivnFAX9OY2GXuoqQiYvvgqqgLZxUSqcmlvJ/xDAhRodE+2wCC55GgWyne1zAMa8L7VRnND7WoCUVj58FxcGYUiUhalLDhFtD2+bE8w2XVK5s3S+Vl63DKlOQBjBw2Jm81IgtQ+8kDU7drIMhC3CjAHFNl0OTpJcFmNSpUdq1Yo37Cb2tEJV5KWXOh2ZI39hUqH8Qqe7frtwZ1U6s50M8/fTh7Sv3utRk8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM5PR0201MB3575.namprd02.prod.outlook.com (2603:10b6:4:7a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 09:58:46 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6%4]) with mapi id 15.20.5332.021; Mon, 13 Jun 2022
 09:58:46 +0000
Content-Type: multipart/mixed; boundary="------------N1VdSx3mPkk4b0ysKplQBU0o"
Message-ID: <3cac02a4-5c2a-362d-4035-e82d66097107@nutanix.com>
Date: Mon, 13 Jun 2022 15:28:34 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
 <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
 <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
 <Yo5RiqKWuwZPY6Iv@xz-m1.local>
 <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
X-ClientProxiedBy: MA1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::12) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1ff82d8-47d2-462b-d226-08da4d234e86
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3575:EE_
X-Microsoft-Antispam-PRVS: <DM5PR0201MB357502552E7594D4C5F64D76F6AB9@DM5PR0201MB3575.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUGwAeLwtJHYg7kZpa8+5zZS5kA/ECMlkR+Dc6gS2xvYxsLGRM36FQZTI5IXXTeds5jrZPvAo4N3ZCnfKzbMQ0KMRFavV9GA+m7KCocX//MFu3Bm7Q5ySwxGz5mip9VtQHfSqOUdzEOJ7hSQTKXhHua8C9s71eVUyKFIYkSblhXa+u0A5a/RlgcOljqky2OUEl1NoH/othVM6ldAuvwS8JtuDQpohKH6kz9Oy2AdYrcCHci0y1HR4sMZiICIsOEFqd8o4ayBaEybd/TVbJ68QF+BzTQrvXyPunpqDbCl6+9neY8k9DCE6FEeLLvIjFmKUZHrUXehTxbl3SMK8/ChCrQBn/hXTC7cm9Kfxoem8wu9MyVXrpeXKbYI5krmt8ZFBHzf4ArV/kqWVQ5wiXOKuxqSUXmTzgO20+WkIh9McgUNQXZqFD2OnsjoBVGslNmYbLCZP+w1yeqta7qEpdeNGyMmv4hpFZc/GKLKxRcSXt5K88XeToQDsixIMmlyVQVvRKDn1Rxd22pfdPUjidBmg4ZBMZgh7YlAZJJI+sGTnNB3z3E9humGNPB0RXknRJ37EDm/73tSft1PdyfX007s6j+kAGrdscZDOXJRxocpZwGDFaE1XZDyTUQveeoiG1/0UIbcTGRH+PFKxRz6RYcKV9+yRX4u0n8dSZRVvyHcPd9b29rqpxE6gAXtTXDcvqp525ZYVAUC0/P6a2ZyhDGXQZxfl5Wn1WEiXximmcCrD7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(4326008)(31686004)(86362001)(36756003)(5660300002)(7416002)(235185007)(66556008)(66476007)(110136005)(54906003)(8936002)(66946007)(2906002)(6486002)(316002)(508600001)(26005)(186003)(2616005)(53546011)(6666004)(6506007)(33964004)(31696002)(83380400001)(38100700002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpFNElCKzRsSTNtcFFNc2pxV2hlbmc5Vi9ITlNVVDAyVWt3ZkRxL1JUL0Ey?=
 =?utf-8?B?THZsSGRlT3JpTWYyeWJnY1lJZXBQUUluYy96WW0vTmJTSHRGU3VrZWZwZi9y?=
 =?utf-8?B?QkZncThtK1Vjb0N6QVB3cWJsODNROVVWekgxSm1VNTREQzBxTGV1T0REZ0tk?=
 =?utf-8?B?NTEyRHdyQkp5ckVBOGk3TWxmeGdLeTJDVEJyLzFVeE04TjhMMTJLYldoa0d0?=
 =?utf-8?B?Z3J4WmhUVmszQVVZakZWOW42SWRKLzlUdm84a3hPSEVmUnFCaEpKUjN1S2Nu?=
 =?utf-8?B?TnhUQzdXSDNlL2ZWMFh3N0I3UFNzeGRlejJwc3p1MVRSOGtlS3RUbjQyVmIz?=
 =?utf-8?B?OXJoeVd5SWpTRkQ4NHBlWlIxZ1VMZ2xCbGdFM3JLdGRseGZsV0J6cVVjVzdo?=
 =?utf-8?B?U2ZBdWdPVmxmWlUwUVJJblVSNVNKcmxNcGc4anNTd0Q2OFVMMTNEVFFtVXhh?=
 =?utf-8?B?VHlnc2RKamEwQW91S2hPQzQ4c3FLbGRONHFmdnF5VG9FckxhTS9raGQ2TXdW?=
 =?utf-8?B?ODNXRGlmZmxQc0JBajdUTWlsalVjemNLM0h4WjVaNEdFTGE3NFYwL0hydVph?=
 =?utf-8?B?T1ZzTWhzMmVjNnFLQmhxdFp6VVdXU3lobDlWdmVWVWRGQTFoWGt2NjNpYkNS?=
 =?utf-8?B?MmdpSVJQemg3MUx5amdFTExZenpjN1BvRXpaYjkyMkNsVzZHM0pER2RlblBq?=
 =?utf-8?B?SGxxM3BMczVxSm92NUEvakFHZksyRzIrRTFHa3J2cDlnNzYrMGV2WnQrVHRq?=
 =?utf-8?B?Q1AyUnU0bXBsd0NtMUN4UGppL3pabkNMcUF2a1ZJZXlaMzhLejRMT0xiMDNm?=
 =?utf-8?B?ZE1ueVVSVmthSnNUck5QN1o0RjNPZzZDVXJ4cWg2bXJwa1Z0b2JnelpFYS9V?=
 =?utf-8?B?NkVyOVJhbnVaVGExNEx2RDdjUjd0WVh6cXBwZzZQbTAveEhXbFpGc2hwaDJO?=
 =?utf-8?B?Nys4NUJyMmlob09rZ3pjL2s5WVhHSG1UaVdMWDg0WUdBWHh1NEsxNWJSOVJU?=
 =?utf-8?B?ckhBd0t2bWxMYUxXeFRKMVJuYUhGTlk1Sng1dk11RnZPOUxBcUZ5WW5HYW9R?=
 =?utf-8?B?UHE0bE5DOWc2YmFxeGMreEFvdkIzdGhoMmdJUnBFeFdnOWV5NlVQc3ZMNmZP?=
 =?utf-8?B?NG9iRXFYTWlvT2w5T1I3NWxsSWFsSEtnSXZRM3oxOC9oQjM5OUpyUVBDYW5U?=
 =?utf-8?B?dVF4OXdZNVZFUVJoOHZ0d040MVFJaEJVMzVPc0FyTVBreFBXUGtLbzRJL0tX?=
 =?utf-8?B?QmwzYWtHR0xPandqS0lGa2lTb3haYjJOWEFyMDVCbDBZWjFEbU00cXd6WnVu?=
 =?utf-8?B?MVJJdHh5ZXdGeWNpdWF4eTF2RmtwU25ORVpBc0IwMjVEUnRTOTdaeFJFb25C?=
 =?utf-8?B?eEdqQ2s2MGZuRkVxY0JVc3JVSGNsMGpTNkNxTk55bnZEVUw3MEtpdkhXMGl6?=
 =?utf-8?B?aUZUM3RST1EweEpyaUhGUjRrWGd5S2RVMzRTU0VIRVdWYWhxMGpaUnd0bFRC?=
 =?utf-8?B?eHYvMDVYMVZzbVB0a0xNMmdVZEpyTXg2S0E3K0E4RG45LzREVHIyWUl2cTZr?=
 =?utf-8?B?TmpCaE9XYjVWejk1ZFdxYndBYlpXTVh6ZEVzZzZmbm92VXhMK2ZMNTBEWnFy?=
 =?utf-8?B?aGM2MURqZUhzODZGMWl0YkJMa1RpSElwSTFmbXZQc29ndG1QSS9MbnFvckRa?=
 =?utf-8?B?MTVtMURuVW4va3pXdWJld0k1VUU0K1h3Wm1ucU5iVzNKMERZRWdhcUtzck96?=
 =?utf-8?B?MEVFbHBiR0J4RS9FOVdqQ2xlSkkwSkJCZXBxb1h6bVdid3V5TFNlRm1UcENu?=
 =?utf-8?B?VnI2S3RyNHg5cjNROXFuMnpMa3lGeDNVRFBEWnhJVGlYU25QaS9iVDgyOVlO?=
 =?utf-8?B?OU5DM05INVN5UGxOL2IwT3pibXZwcVltclpkcVI2RkwrTXJrNFIyNWhzcmVm?=
 =?utf-8?B?eHY3bysvMk1od0hIQ3lDNWdvak5mckJHakEyNm5TdElyVDlmTEpSS3ZBVGNm?=
 =?utf-8?B?UHJyWHN3blZReE50MnJxNGg1ZThpU0UwUk5JNVpIeFhGR05meEpKRmtxWGNY?=
 =?utf-8?B?cEFWalVhN29iWCtCZjFmZTdGYXhuWGVtcmVzMUV2cXhObFdlNzBDOE81Wldr?=
 =?utf-8?B?TlYxVC9kMEQrNm5nUlp1R0dNU3ZYWUZINVJEN0pnNTRlejl5RTFUTk1nSWQx?=
 =?utf-8?B?c1M3L0xnY3JCZUcxNGxia1J0RVJMT05BS1FPd1FraGpJYThBV3MzYzRBVElr?=
 =?utf-8?B?SmJlUmsyenRLTmRRa2pJaWRac3RMRzEya21rMHY4NHJsUG5VemRJQkhxVS9j?=
 =?utf-8?B?VUFZMmtlYVlWZWg1cENmcmY3QWdFQmxyN2EzSmZId3JvRUVOb3ArZmRwRS9V?=
 =?utf-8?Q?H0wCNgWH7zD2CYeg=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ff82d8-47d2-462b-d226-08da4d234e86
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 09:58:46.5342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89Hs9qpDyNiXgL639BNBFqkvIe7AtiT+IhmG7mZpEzkCZDYaOFILfWx1//7BNLdk5cs7CIx4cXBcmNiyMwq2wvJVf3ob9eHT7AfBvIrtalk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3575
X-Proofpoint-ORIG-GUID: bIbVKvQ6KxgcPL83Z6clXGgh_V7BBQMG
X-Proofpoint-GUID: bIbVKvQ6KxgcPL83Z6clXGgh_V7BBQMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_03,2022-06-09_02,2022-02-23_01
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

--------------N1VdSx3mPkk4b0ysKplQBU0o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26/05/22 8:21 am, Jason Wang wrote:
> On Wed, May 25, 2022 at 11:56 PM Peter Xu <peterx@redhat.com> wrote:
>> On Wed, May 25, 2022 at 11:38:26PM +0800, Hyman Huang wrote:
>>>> 2. Also this algorithm only control or limits dirty rate by guest
>>>> writes. There can be some memory dirtying done by virtio based devices
>>>> which is accounted only at qemu level so may not be accounted through
>>>> dirty rings so do we have plan for that in future? Those are not issue
>>>> for auto-converge as it slows full VM but dirty rate limit only slows
>>>> guest writes.
>>>>
>>>  From the migration point of view, time spent on migrating memory is far
>>> greater than migrating devices emulated by qemu. I think we can do that when
>>> migrating device costs the same magnitude time as migrating memory.
>>>
>>> As to auto-converge, it throttle vcpu by kicking it and force it to sleep
>>> periodically. The two seems has no much difference from the perspective of
>>> internal method but the auto-converge is kind of "offensive" when doing
>>> restraint. I'll read the auto-converge implementation code and figure out
>>> the problem you point out.
>> This seems to be not virtio-specific, but can be applied to any device DMA
>> writting to guest mem (if not including vfio).  But indeed virtio can be
>> normally faster.
>>
>> I'm also curious how fast a device DMA could dirty memories.  This could be
>> a question to answer to all vcpu-based throttling approaches (including the
>> quota based approach that was proposed on KVM list).  Maybe for kernel
>> virtio drivers we can have some easier estimation?
> As you said below, it really depends on the speed of the backend.
>
>>   My guess is it'll be
>> much harder for DPDK-in-guest (aka userspace drivers) because IIUC that
>> could use a large chunk of guest mem.
> Probably, for vhost-user backend, it could be ~20Mpps or even higher.

Sorry for late response on this. We did experiment with IO on virtio-scsi based disk.

We could see dirty rate of ~500MBps on my system and most of that was not tracked

as kvm_dirty_log. Also for reference i am attaching test we used to avoid tacking

in KVM. (as attached file).

>
> Thanks
>
>> [copy Jason too]
>>
>> --
>> Peter Xu
>>
--------------N1VdSx3mPkk4b0ysKplQBU0o
Content-Type: text/plain; charset=UTF-8; name="non-kvm-dirty-test.c"
Content-Disposition: attachment; filename="non-kvm-dirty-test.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+
CiNpbmNsdWRlIDxzeXMvbW1hbi5oPgojaW5jbHVkZSA8c3lzL3N0YXQuaD4KI2luY2x1ZGUgPHN5
cy90aW1lLmg+CiNpbmNsdWRlIDx0aW1lLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KCiNkZWZpbmUg
UEFHRV9TSVpFIDQwOTYKI2RlZmluZSBHQiAoMTAyNCAqIDEwMjQgKiAxMDI0KQoKaW50IG1haW4o
KQp7CiAgICBjaGFyICpidWZmOwogICAgc2l6ZV90IHNpemU7CiAgICBzdHJ1Y3Qgc3RhdCBzdGF0
OwogICAgLy8gVGFrZSBmaWxlIG9mIHNpemUgYXRsZWFzdCBkb3VibGUgb2YgUkFNIHNpemUgdG8K
ICAgIC8vIGFjaGlldmUgbWF4IGRpcnR5IHJhdGUgcG9zc2libGUuCiAgICBjb25zdCBjaGFyICog
ZmlsZV9uYW1lID0gImZpbGVfMTBfZ2IiOwogICAgaW50IGZkOwogICAgc2l6ZV90IGkgPSAwLCBj
b3VudCA9IDA7CiAgICBzdHJ1Y3QgdGltZXNwZWMgdHMxLCB0czA7CiAgICBkb3VibGUgdGltZV9k
aWZmOwoKICAgIGZkID0gb3BlbihmaWxlX25hbWUsIE9fUkRPTkxZKTsKICAgIGlmIChmZCA9PSAt
MSkgewogICAgICAgcGVycm9yKCJFcnJvciBvcGVuaW5nIGZpbGUiKTsKICAgICAgIGV4aXQoMSk7
CiAgICB9CgogICAgZnN0YXQgKGZkLCAmc3RhdCk7CiAgICBzaXplID0gc3RhdC5zdF9zaXplOwog
ICAgcHJpbnRmKCJGaWxlIHNpemUgJWxkXG4iLCAobG9uZylzaXplKTsKCiAgICBidWZmID0gKGNo
YXIgKiltbWFwKDAsIHNpemUsIFBST1RfUkVBRCwgTUFQX1BSSVZBVEUsIGZkLCAwKTsKICAgIGlm
IChidWZmID09IE1BUF9GQUlMRUQpIHsKICAgICAgIHBlcnJvcigiTW1hcCBFcnJvciIpOwogICAg
ICAgZXhpdCgxKTsKICAgIH0KCiAgICAodm9pZCljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05J
QywgJnRzMCk7CgogICAgd2hpbGUoMSkgewogICAgICAgY2hhciBjOwoKICAgICAgIGkgPSAoaSAr
IFBBR0VfU0laRSkgJSBzaXplOwogICAgICAgYyA9IGJ1ZmZbaV07CiAgICAgICBjb3VudCsrOwog
ICAgICAgLy8gQ2hlY2sgb24gZXZlcnkgMTBLIHBhZ2VzIGZvciByYXRlLgogICAgICAgaWYgKGNv
dW50ICUgMTAwMDAgPT0gMCkgewogICAgICAgICAgKHZvaWQpY2xvY2tfZ2V0dGltZShDTE9DS19N
T05PVE9OSUMsICZ0czEpOwogICAgICAgICAgdGltZV9kaWZmID0gKChkb3VibGUpdHMxLnR2X3Nl
YyAgKyB0czEudHZfbnNlYyAqIDEuMGUtOSkgLSgoZG91YmxlKXRzMC50dl9zZWMgKyB0czAudHZf
bnNlYyAqIDEuMGUtOSk7CiAgICAgICAgICBwcmludGYoIkV4cGVjdGVkIERpcnR5IHJhdGUgJWZc
biIsICgxMDAwMC4wICogUEFHRV9TSVpFKSAvIEdCIC8gdGltZV9kaWZmKTsKICAgICAgICAgIHRz
MCA9IHRzMTsKICAgICAgIH0KICAgIH0KCiAgICBjbG9zZShmZCk7CiAgICByZXR1cm4gMDsKfQo=

--------------N1VdSx3mPkk4b0ysKplQBU0o--

