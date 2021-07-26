Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E53D56AF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:35:01 +0200 (CEST)
Received: from localhost ([::1]:58028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7x0m-0005Jm-Nt
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m7wzg-0004V1-AL; Mon, 26 Jul 2021 05:33:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m7wzc-0007pR-Te; Mon, 26 Jul 2021 05:33:52 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q9VWgL013407; Mon, 26 Jul 2021 09:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=1Oknb293PtVmlVsbH4XawksJK2iqGk+KIsQWKVQhVXc=;
 b=ydKYE9FSzfc9+1LYIpT230wObaEacLgVBvlVPEdq1QBdKPjgXr+UViCfYL9zE8pPf7vt
 TBWZPBfpS2lC3yZKj/+LMD0o9FKq/Ps4mzPDts2aWfkCswjGNQdi3gtovyll8Jo/0fLZ
 xF6886NPELNwQQAL1n3Cs3C2nuk1w1OCdfZMnXHjjmqYC3z+3uBOokSDjfhGAuqfPJf/
 iLiK1I3nDfJ+tqIlkIoVIo4fnkYPkdtkwiVJuhmrLUp5MaeDyOK3iL/V1zfnuBhKB1ks
 CNKKAIJXQ8rjRfO5IoRvKqEwVNATG5JM5bQSSrPQIvGacypgzLPDQVSsOg+JN0Z/4iG1 lw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=1Oknb293PtVmlVsbH4XawksJK2iqGk+KIsQWKVQhVXc=;
 b=Uk1OE+Sg2I4hxy2xQIdZ4cUWYTL2o7D4FW7WH0UcKW043n0xG+VCpMpy9TMirdWqir2B
 VFLQMruxgra3ElsxZCW4+JoHhHOMOXQRT+g6Rb/ReWrozrORKsVuLbrF840c2yJRKz+n
 oJ38deObsm8+P5Ujr9CZOtrBev4In0Dhu/eEAwrWUWDPIZxkZfqtP7ZUBNfQxR09g92b
 NsxadAZFvZjtR3hFohiXCtZjAvLiphnHCb8Scam4vUchJMH5l2qy3ebDSHUnuccHNYtQ
 UxJnHykph078irLtTSm8IOZljTO4XHySv2e9dWJpMhR/oeQmEiX4yFxlDOjk4OVcPgye JA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a0afrtmbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 09:33:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q9V2nt036144;
 Mon, 26 Jul 2021 09:33:33 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
 by userp3020.oracle.com with ESMTP id 3a0vmskw6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 09:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wutmy2UM3J0BxxnLJUCIIoXjl7UatQzx78XLmw0n6O2cRAr82eRyjz5m42J6KUBbboNu80UINTsWw1YSubUjLaWNbVbm6os3cMgXuLPJAisNHEwqNmwe+IjxDbdZTH+c25bFGjltEvkhKMfFfa32VNWX1W8NHzdaACdNA7y/tqIxAH2xTTA1NPAdMv+lVkDdz5gjsjU0/5kY3CqXiMTuDiN//SvjgTbuQm4E3SG9JOUJ2GixhGw2zJLH6CzM4EKqoq8bzbtKvHNCXY0NrP1tZ540uQsiqQWo5+eoLyDvRAXdAFdlc66zKQVlm+4rq5R3zF22LPY7PXc0m/sLSqcVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Oknb293PtVmlVsbH4XawksJK2iqGk+KIsQWKVQhVXc=;
 b=YCDyjFp0YNlq54+vehJQbWMp2i2YTeS3GvEgM4cxFCHzPrvC1s5O99ogW4bILtx3WUHWpIjcO7x1Mr+aWanE6qwEB7kwJY86u+cfPDZ5CP+poDZzQOyDkDxLSK5Gj/Is6K36vYH8vKmrJb6MrLS+N63FQ1/PxVV1m+yOXYYF9ImhE01Iax7YBiCTMnlZAl5gSr2aEMfQtMT8qxOMG78/RbdcU5R9jQ17HQNrc+5ED0chiDF/jCcmeqOADJeuLXUpeW+J/PmIsLFM3ncIoTZVA1WNBANlSABMCkuGeh68y/vO3q8uqHP0B/Z6/wQ+b+6PzKwBbKIzFeNUkdU1mXQcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Oknb293PtVmlVsbH4XawksJK2iqGk+KIsQWKVQhVXc=;
 b=gjAHS6D3vE1mbUHg+x7+m9ZgnH9F3u9rG9iUGt5eEA5Bk1i44MP6LL+aZhjvkzHEyBwYslojcEFMSJeuIvoaGMmfNQ0K/enuiW0XDcUzildiX8eTIvN2lzt4U/LO65vswwnPQhG7H7qCAd1cZV0d4S8VRqgrh9IO6aiJPNTnZvs=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4550.namprd10.prod.outlook.com (2603:10b6:510:34::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Mon, 26 Jul
 2021 09:33:30 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:33:30 +0000
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
 <b0c11f6c-31dd-121d-ab27-e83e5afa8596@redhat.com>
 <82c4ad5d-c866-9b25-42b0-d1c3a731ed3a@oracle.com>
 <11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <4e1c3a57-8360-2618-8c74-62e26c1c7aee@oracle.com>
Date: Mon, 26 Jul 2021 05:33:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------DCD8574FB024A54B3F28EE84"
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:806:22::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SA9PR13CA0035.namprd13.prod.outlook.com (2603:10b6:806:22::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Mon, 26 Jul 2021 09:33:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9a809c0-7248-4768-58a5-08d950186db6
X-MS-TrafficTypeDiagnostic: PH0PR10MB4550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB455072E1F24624ABE3C82874E8E89@PH0PR10MB4550.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzyC2xPNZS0X9X1nxC/Qw2HajCioj3gELGRLKxBkRoji3XC9oZeE+bjn2kcg5CCHsEFU+GqI79k4Z2eBTEJpUZNGFyX9aPp23H8giaHuoTAdisiYQmh0c1g5E7VYN5l+AIHkdHYakLuOe4psE0wG/SMvrdtC6qNiGCdcOhH5Yk45zu6sxiuVU2aGPx5s3vtUPY1qXQhAuulbyI9H0M0UUaocE0my70A60Dd8xG2v+GrmghRgulhhA03Q/vD3ihFrAksErlqVMsxVVx+MuR1VZeSEiB6b+sO0J20zxwNerRLt+F32LqroZSu6JdOUC1fNAh1Hw9OswTdpsE6F9j/L+8sDJTMtAMK3v7eOn1tcMQbhEcn9ycTGw0hEkowMC3C194v+n33WkIKdLfbPkSom73TzDzD9Xw9R8noA6F5rDxRf0xtkN+91+skjD+T/rpegrxHrIlpfsrKavLUuUm6qn+/M5ROHW0XJf3L9HZD45DhBSlXfVEMiqtA9e7zehjKfzblZnoB4yewJVVdgbv7zYvSfpodI7gTln8PtX81miKeRH0YxH6jMzJCCYjL1lCelY1Y+qUg0g6j0G3kkXD3QqtV7R5euqZBBRV/3mN5vIPxdZ+YZIpbqMAzqrfRKMpvEexLg8wwY0XNiI70Mq/skHPjBydx5dzPjT6jO+zmW9S7jwwXAEPDBJ7Hz0Y+Z8BGPIXEUdHkQ6mXRoGndjKpN2lru5UrzDWdjTPeGZvJH+BE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(346002)(136003)(396003)(107886003)(186003)(7696005)(26005)(86362001)(5660300002)(316002)(2906002)(8936002)(956004)(2616005)(4326008)(31696002)(30864003)(36756003)(38100700002)(8676002)(31686004)(53546011)(66946007)(44832011)(478600001)(66556008)(33964004)(7416002)(66476007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDlZTVl4MVFJNUVKSkc4bnd1a0RhcHh4TWEwZXQ0QXE4WTc4d1FPT0tnb2NC?=
 =?utf-8?B?UXBoVy9VNFhHcE5TN2dCVjVabVhpdVN0UnFheUZWcWdPY3hNbHJ2a0QrSEJW?=
 =?utf-8?B?dm9iOStXVEVMTjNIb25QUUhNYmh1cnJFWmNhNmJ5YU5xSTlDZlN4QU42VmtF?=
 =?utf-8?B?K3J2Q0tqdXVjT3pOWkMyeGxLVzVITzBqdnVZdmttclBCblV4T1VjQ0pGUHhZ?=
 =?utf-8?B?K1NseFpmVnllQkFQVkh1TUQ4UjR4R1ZrdWRCOGoyaEdTTFF3cVZ5d3o5bWNT?=
 =?utf-8?B?VEZmcWN6L3QzdmFySlg4cmE2TnpyNGRhaUZ5ZUVLUzVBbE5ZTkpSVWF1Z0lq?=
 =?utf-8?B?dWVpSzRVb2x4dVZFZWJ3ZDZDN0YzcUJmMWxzczA2dWptZ0t1Si9rN09nc2FI?=
 =?utf-8?B?S1I4NnRCbCtLL1RDTDVna2JYWlp4R2k2S093LzI1bTUrbjB6SVp4SUxFeThJ?=
 =?utf-8?B?aC81RE1udWNiYXc1d2Y2b293UXk3WTNDbzZtQTdLRjBmMFdtUU1rL0ZDNmxn?=
 =?utf-8?B?YSsxejVtelVzZWtvQjJQZjh0c0NPbHVSbCtGOGlmWnJYMk45OHJZSGk2TTJZ?=
 =?utf-8?B?Z3U4dm5lVFQ5djQzVHVaUWRsUW9pT21USTVIbUVSNk9YdjJ3dkZZMUk2NnRY?=
 =?utf-8?B?c2FSZ2hnSGlnQlpJeHF1bmNCZGZRdFE4YTNvWEdvSFBVQmRuMUl2VEZqRXR4?=
 =?utf-8?B?ajRJYUdGazFiZ1R6RnQvOTV6NTlVKzJvSXdJQm83aVRHZ0pYZG5DdE9idEVL?=
 =?utf-8?B?UWdHc3VyY2kxaVhRdUREU29KRHo3ei8yTGxtaW5xaVhpa2dFLzRRamV6UlZa?=
 =?utf-8?B?TkpzWEpBV1FDVGMvL3BIOFk5SStpOHVJMXhsY2FuN1lXdXhkY0FIVTlZQjRm?=
 =?utf-8?B?WWFxaGM3MDZvUWN5M04xb3ZpWDRTZHBmS3VSOExBSkpab1BucEpKbkEyMEw1?=
 =?utf-8?B?dzI0UU9EL1Ewb2dhaHEzcWhqV05sZHEwcDdERlBEZXBtaEdPMHQ0cFQrZHlu?=
 =?utf-8?B?Z3hWcmQ2ZnlySjBUWWM5Y0E2ZUNBOEQ0b1RlTDcvWFlMV2ZzejJOSUZ0a1lG?=
 =?utf-8?B?cHpKRjNTWjBrVHF3REVlVFBIcWEwWGVlS3drQ0kzeFdFT0U2SE0vcThZdXUr?=
 =?utf-8?B?R3MzMjM3ekU0blVZRjh4bEZBUC9YQVhBQUdYcTc1YVpLaU0wRFBtM1Z2UllS?=
 =?utf-8?B?aER2d1g1eGNMR0IyOVFLNW1YR1kwRjFrUXpSMzdRa1NRNDBDamgxblZ4eith?=
 =?utf-8?B?dzZvdmlHNWFuM25xWVBxSlp6R3lXVS9rOTNua1pSREhOdkhQRldDWkRVL0o3?=
 =?utf-8?B?UTlpZlhlLzJMYmk5RTNHTDFqckpkVkRyMFYzRE5WR0hPdk1yUVpqUTdkN2lN?=
 =?utf-8?B?NWt6T2twSVU1blRDc2pYVnVIV2tZcjVlOHhhU0ZIa1dDTHU3WkNtOC9qUWxy?=
 =?utf-8?B?MTlFOW1WYU9vaURKZUpoUjhvLyt6Vy9lUm9nMjkrcFNaRDdFV08yQzFoL0hk?=
 =?utf-8?B?LzRuQ003bHJTSmFVSDVWcFRnWlgzdkNGdFRkek5rMjVQSFYydzBib2YzcXg4?=
 =?utf-8?B?U3NDb2xHZzFWdUJoUTZTWlg3ajV4NlQwb1EyN0ZpWERjMjQwV2pTampHTG1W?=
 =?utf-8?B?V1R3UlNnOFZFOERBQUQ4aHdjZVFkZEhFL3RlY2JXWXlrQVdLOThFSmovaXp1?=
 =?utf-8?B?Uy9ZMWFhbjdza1dVNnVsYktHQjdaSDNMcDlxbnI4dENrRUF2aE9HcUJIbGNZ?=
 =?utf-8?Q?+uyhDGXE4/G1ZWjnUm++WtOXxn3NqtulVcn02la?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a809c0-7248-4768-58a5-08d950186db6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 09:33:30.2467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rvVsyhsC9YcBo1O2M2l8UIn9ID8BVF5jlgAV3ZK/DTiV57+Zh9L5ADUPw2Z1uVCLTUKguiikc6IkFe2FCHd0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4550
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260054
X-Proofpoint-ORIG-GUID: r8Bgsu7G1rU6UuXkdp5ZzvChEaiWRJqy
X-Proofpoint-GUID: r8Bgsu7G1rU6UuXkdp5ZzvChEaiWRJqy
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------DCD8574FB024A54B3F28EE84
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/22/21 5:22 AM, Jason Wang wrote:
>
> 在 2021/7/21 下午4:59, Jonah Palmer 写道:
>>
>>
>> On 7/13/21 10:37 PM, Jason Wang wrote:
>>>
>>> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>>> From: Laurent Vivier <lvivier@redhat.com>
>>>>
>>>> This new command shows internal status of a VirtQueue.
>>>> (vrings and indexes).
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>>> ---
>>>>   hw/virtio/virtio-stub.c |   6 +++
>>>>   hw/virtio/virtio.c      |  37 ++++++++++++++++++
>>>>   qapi/virtio.json        | 102 
>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>   3 files changed, 145 insertions(+)
>>>>
>>>>   [Jonah: Added 'device-type' field to VirtQueueStatus and
>>>>   qmp command x-debug-virtio-queue-status.]
>>>>
>>>> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
>>>> index ddb592f..3c1bf17 100644
>>>> --- a/hw/virtio/virtio-stub.c
>>>> +++ b/hw/virtio/virtio-stub.c
>>>> @@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const 
>>>> char* path, Error **errp)
>>>>   {
>>>>       return qmp_virtio_unsupported(errp);
>>>>   }
>>>> +
>>>> +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>>>> +                                                 uint16_t queue, 
>>>> Error **errp)
>>>> +{
>>>> +    return qmp_virtio_unsupported(errp);
>>>> +}
>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>> index 81a0ee8..ccd4371 100644
>>>> --- a/hw/virtio/virtio.c
>>>> +++ b/hw/virtio/virtio.c
>>>> @@ -3935,6 +3935,43 @@ static VirtIODevice 
>>>> *virtio_device_find(const char *path)
>>>>       return NULL;
>>>>   }
>>>>   +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
>>>> +                                                 uint16_t queue, 
>>>> Error **errp)
>>>> +{
>>>> +    VirtIODevice *vdev;
>>>> +    VirtQueueStatus *status;
>>>> +
>>>> +    vdev = virtio_device_find(path);
>>>> +    if (vdev == NULL) {
>>>> +        error_setg(errp, "Path %s is not a VirtIO device", path);
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, 
>>>> queue)) {
>>>> +        error_setg(errp, "Invalid virtqueue number %d", queue);
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    status = g_new0(VirtQueueStatus, 1);
>>>> +    status->device_type = qapi_enum_parse(&VirtioType_lookup, 
>>>> vdev->name,
>>>> + VIRTIO_TYPE_UNKNOWN, NULL);
>>>> +    status->queue_index = vdev->vq[queue].queue_index;
>>>> +    status->inuse = vdev->vq[queue].inuse;
>>>> +    status->vring_num = vdev->vq[queue].vring.num;
>>>> +    status->vring_num_default = vdev->vq[queue].vring.num_default;
>>>> +    status->vring_align = vdev->vq[queue].vring.align;
>>>> +    status->vring_desc = vdev->vq[queue].vring.desc;
>>>> +    status->vring_avail = vdev->vq[queue].vring.avail;
>>>> +    status->vring_used = vdev->vq[queue].vring.used;
>>>> +    status->last_avail_idx = vdev->vq[queue].last_avail_idx;
>>>
>>>
>>> As mentioned in previous versions. We need add vhost support 
>>> otherwise the value here is wrong.
>> Got it. I'll add a case to determine if vhost is active for a given 
>> device.
>> So, in the case that vhost is active, should I just not print out the 
>> value or would I substitute it with
>> another value (whatever that might be)?
>
>
> You can query the vhost for those index.
>
> (vhost_get_vring_base())
>
>
>>   Same question for shadow_avail_idx below as well.
>
>
> It's an implementation specific. I think we can simply not show it if 
> vhost is enabled.
>
> Thanks

Ah I see, thank you!

So, it appears to me that it's not very easy to get the struct vhost_dev 
pointer from struct VirtIODevice to indicate whether or not vhost is 
active, e.g. there's no virtio class-independent way to get struct 
vhost_dev.

I was thinking of adding an op/callback function to struct 
VirtioDeviceClass, e.g. bool has_vhost(VirtIODevice *vdev), and 
implement it for each virtio class (net, scsi, blk, etc.).

For example, for virtio-net, maybe it'd be something like:

bool has_vhost(VirtIODevice *vdev) {
   VirtIONet *n = VIRTIO_NET(vdev);
   NetClientState *nc = qemu_get_queue(n->nic);
   return nc->peer ? get_vhost_net(nc->peer) : false;
}

Also, for getting the last_avail_idx, I was also thinking of adding 
another op/callback to struct VirtioDeviceClass, e.g. unsigned int 
get_last_avail_idx(VirtIODevice *vdev, unsigned int vq_idx) that finds 
if vhost is active or not and either gets last_avail_idx from virtio 
directly or through vhost (e.g. 
vhost_dev->vhost_ops->vhost_get_vring_base()).

I wanted to run this by you and get your opinion on this before I 
started implementing it in code. Let me know what you think about this.


Jonah

>
>
>>
>> Jonah
>>>
>>>
>>>> +    status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
>>>
>>>
>>> The shadow index is something that is implementation specific e.g in 
>>> the case of vhost it's kind of meaningless.
>>>
>>> Thanks
>>>
>>>
>>>> +    status->used_idx = vdev->vq[queue].used_idx;
>>>> +    status->signalled_used = vdev->vq[queue].signalled_used;
>>>> +    status->signalled_used_valid = 
>>>> vdev->vq[queue].signalled_used_valid;
>>>> +
>>>> +    return status;
>>>> +}
>>>> +
>>>>   #define CONVERT_FEATURES(type, map)                \
>>>>       ({                                           \
>>>>           type *list = NULL;                         \
>>>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>>>> index 78873cd..7007e0c 100644
>>>> --- a/qapi/virtio.json
>>>> +++ b/qapi/virtio.json
>>>> @@ -406,3 +406,105 @@
>>>>     'data': { 'path': 'str' },
>>>>     'returns': 'VirtioStatus'
>>>>   }
>>>> +
>>>> +##
>>>> +# @VirtQueueStatus:
>>>> +#
>>>> +# Status of a VirtQueue
>>>> +#
>>>> +# @device-type: VirtIO device type
>>>> +#
>>>> +# @queue-index: VirtQueue queue_index
>>>> +#
>>>> +# @inuse: VirtQueue inuse
>>>> +#
>>>> +# @vring-num: VirtQueue vring.num
>>>> +#
>>>> +# @vring-num-default: VirtQueue vring.num_default
>>>> +#
>>>> +# @vring-align: VirtQueue vring.align
>>>> +#
>>>> +# @vring-desc: VirtQueue vring.desc
>>>> +#
>>>> +# @vring-avail: VirtQueue vring.avail
>>>> +#
>>>> +# @vring-used: VirtQueue vring.used
>>>> +#
>>>> +# @last-avail-idx: VirtQueue last_avail_idx
>>>> +#
>>>> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
>>>> +#
>>>> +# @used-idx: VirtQueue used_idx
>>>> +#
>>>> +# @signalled-used: VirtQueue signalled_used
>>>> +#
>>>> +# @signalled-used-valid: VirtQueue signalled_used_valid
>>>> +#
>>>> +# Since: 6.1
>>>> +#
>>>> +##
>>>> +
>>>> +{ 'struct': 'VirtQueueStatus',
>>>> +  'data': {
>>>> +    'device-type': 'VirtioType',
>>>> +    'queue-index': 'uint16',
>>>> +    'inuse': 'uint32',
>>>> +    'vring-num': 'int',
>>>> +    'vring-num-default': 'int',
>>>> +    'vring-align': 'int',
>>>> +    'vring-desc': 'uint64',
>>>> +    'vring-avail': 'uint64',
>>>> +    'vring-used': 'uint64',
>>>> +    'last-avail-idx': 'uint16',
>>>> +    'shadow-avail-idx': 'uint16',
>>>> +    'used-idx': 'uint16',
>>>> +    'signalled-used': 'uint16',
>>>> +    'signalled-used-valid': 'uint16'
>>>> +  }
>>>> +}
>>>> +
>>>> +##
>>>> +# @x-debug-virtio-queue-status:
>>>> +#
>>>> +# Return the status of a given VirtQueue
>>>> +#
>>>> +# @path: QOBject path of the VirtIODevice
>>>> +#
>>>> +# @queue: queue number to examine
>>>> +#
>>>> +# Returns: Status of the VirtQueue
>>>> +#
>>>> +# Since: 6.1
>>>> +#
>>>> +# Example:
>>>> +#
>>>> +# -> { "execute": "x-debug-virtio-queue-status",
>>>> +#      "arguments": {
>>>> +#          "path": 
>>>> "/machine/peripheral-anon/device[3]/virtio-backend",
>>>> +#          "queue": 0
>>>> +#      }
>>>> +#   }
>>>> +# <- { "return": {
>>>> +#      "signalled-used": 373,
>>>> +#      "inuse": 0,
>>>> +#      "vring-align": 4096,
>>>> +#      "vring-desc": 864411648,
>>>> +#      "signalled-used-valid": 0,
>>>> +#      "vring-num-default": 256,
>>>> +#      "vring-avail": 864415744,
>>>> +#      "queue-index": 0,
>>>> +#      "last-avail-idx": 373,
>>>> +#      "vring-used": 864416320,
>>>> +#      "used-idx": 373,
>>>> +#      "device-type": "virtio-net",
>>>> +#      "shadow-avail-idx": 619,
>>>> +#      "vring-num": 256
>>>> +#      }
>>>> +#    }
>>>> +#
>>>> +##
>>>> +
>>>> +{ 'command': 'x-debug-virtio-queue-status',
>>>> +  'data': { 'path': 'str', 'queue': 'uint16' },
>>>> +  'returns': 'VirtQueueStatus'
>>>> +}
>>>
>

--------------DCD8574FB024A54B3F28EE84
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/21 5:22 AM, Jason Wang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com">
      <br>
      在 2021/7/21 下午4:59, Jonah Palmer 写道:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        On 7/13/21 10:37 PM, Jason Wang wrote:
        <br>
        <blockquote type="cite">
          <br>
          在 2021/7/12 下午6:35, Jonah Palmer 写道:
          <br>
          <blockquote type="cite">From: Laurent Vivier
            <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
            <br>
            <br>
            This new command shows internal status of a VirtQueue.
            <br>
            (vrings and indexes).
            <br>
            <br>
            Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
            <br>
            Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
            <br>
            ---
            <br>
            &nbsp; hw/virtio/virtio-stub.c |&nbsp;&nbsp; 6 +++
            <br>
            &nbsp; hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 37 ++++++++++++++++++
            <br>
            &nbsp; qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 102
            ++++++++++++++++++++++++++++++++++++++++++++++++
            <br>
            &nbsp; 3 files changed, 145 insertions(+)
            <br>
            <br>
            &nbsp; [Jonah: Added 'device-type' field to VirtQueueStatus and
            <br>
            &nbsp; qmp command x-debug-virtio-queue-status.]
            <br>
            <br>
            diff --git a/hw/virtio/virtio-stub.c
            b/hw/virtio/virtio-stub.c
            <br>
            index ddb592f..3c1bf17 100644
            <br>
            --- a/hw/virtio/virtio-stub.c
            <br>
            +++ b/hw/virtio/virtio-stub.c
            <br>
            @@ -17,3 +17,9 @@ VirtioStatus
            *qmp_x_debug_virtio_status(const char* path, Error **errp)
            <br>
            &nbsp; {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return qmp_virtio_unsupported(errp);
            <br>
            &nbsp; }
            <br>
            +
            <br>
            +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char
            *path,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t
            queue, Error **errp)
            <br>
            +{
            <br>
            +&nbsp;&nbsp;&nbsp; return qmp_virtio_unsupported(errp);
            <br>
            +}
            <br>
            diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
            <br>
            index 81a0ee8..ccd4371 100644
            <br>
            --- a/hw/virtio/virtio.c
            <br>
            +++ b/hw/virtio/virtio.c
            <br>
            @@ -3935,6 +3935,43 @@ static VirtIODevice
            *virtio_device_find(const char *path)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;
            <br>
            &nbsp; }
            <br>
            &nbsp; +VirtQueueStatus *qmp_x_debug_virtio_queue_status(const
            char *path,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t
            queue, Error **errp)
            <br>
            +{
            <br>
            +&nbsp;&nbsp;&nbsp; VirtIODevice *vdev;
            <br>
            +&nbsp;&nbsp;&nbsp; VirtQueueStatus *status;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; vdev = virtio_device_find(path);
            <br>
            +&nbsp;&nbsp;&nbsp; if (vdev == NULL) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;Path %s is not a VirtIO device&quot;,
            path);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;
            <br>
            +&nbsp;&nbsp;&nbsp; }
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; if (queue &gt;= VIRTIO_QUEUE_MAX ||
            !virtio_queue_get_num(vdev, queue)) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;Invalid virtqueue number %d&quot;,
            queue);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;
            <br>
            +&nbsp;&nbsp;&nbsp; }
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; status = g_new0(VirtQueueStatus, 1);
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;device_type =
            qapi_enum_parse(&amp;VirtioType_lookup, vdev-&gt;name,
            <br>
            + VIRTIO_TYPE_UNKNOWN, NULL);
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;queue_index =
            vdev-&gt;vq[queue].queue_index;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;inuse = vdev-&gt;vq[queue].inuse;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;vring_num = vdev-&gt;vq[queue].vring.num;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;vring_num_default =
            vdev-&gt;vq[queue].vring.num_default;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;vring_align =
            vdev-&gt;vq[queue].vring.align;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;vring_desc = vdev-&gt;vq[queue].vring.desc;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;vring_avail =
            vdev-&gt;vq[queue].vring.avail;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;vring_used = vdev-&gt;vq[queue].vring.used;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;last_avail_idx =
            vdev-&gt;vq[queue].last_avail_idx;
            <br>
          </blockquote>
          <br>
          <br>
          As mentioned in previous versions. We need add vhost support
          otherwise the value here is wrong.
          <br>
        </blockquote>
        Got it. I'll add a case to determine if vhost is active for a
        given device.
        <br>
        So, in the case that vhost is active, should I just not print
        out the value or would I substitute it with
        <br>
        another value (whatever that might be)?
        <br>
      </blockquote>
      <br>
      <br>
      You can query the vhost for those index.
      <br>
      <br>
      (vhost_get_vring_base())
      <br>
      <br>
      <br>
      <blockquote type="cite">&nbsp; Same question for shadow_avail_idx below
        as well.
        <br>
      </blockquote>
      <br>
      <br>
      It's an implementation specific. I think we can simply not show it
      if vhost is enabled.
      <br>
      <br>
      Thanks
      <br>
    </blockquote>
    <p>Ah I see, thank you!</p>
    <p>So, it appears to me that it's not very easy to get the struct
      vhost_dev pointer from struct VirtIODevice to indicate whether or
      not vhost is active, e.g. there's no virtio class-independent way
      to get struct vhost_dev. <br>
    </p>
    <p>I was thinking of adding an op/callback function to struct
      VirtioDeviceClass, e.g. bool has_vhost(VirtIODevice *vdev), and
      implement it for each virtio class (net, scsi, blk, etc.).</p>
    <p>For example, for virtio-net, maybe it'd be something like:</p>
    <pre>bool has_vhost(VirtIODevice *vdev) {
  VirtIONet *n = VIRTIO_NET(vdev);
  NetClientState *nc = qemu_get_queue(n-&gt;nic);
  return nc-&gt;peer ? get_vhost_net(nc-&gt;peer) : false;
}</pre>
    <p>Also, for getting the last_avail_idx, I was also thinking of
      adding another op/callback to struct VirtioDeviceClass, e.g.
      unsigned int get_last_avail_idx(VirtIODevice *vdev, unsigned int
      vq_idx) that finds if vhost is active or not and either gets
      last_avail_idx from virtio directly or through vhost (e.g.
      vhost_dev-&gt;vhost_ops-&gt;vhost_get_vring_base()).</p>
    <p>I wanted to run this by you and get your opinion on this before I
      started implementing it in code. Let me know what you think about
      this.</p>
    <p><br>
    </p>
    <p>Jonah<br>
    </p>
    <blockquote type="cite" cite="mid:11a89103-dd0c-26ca-37e1-7e1b0aeac1f3@redhat.com">
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Jonah
        <br>
        <blockquote type="cite">
          <br>
          <br>
          <blockquote type="cite">+&nbsp;&nbsp;&nbsp; status-&gt;shadow_avail_idx =
            vdev-&gt;vq[queue].shadow_avail_idx;
            <br>
          </blockquote>
          <br>
          <br>
          The shadow index is something that is implementation specific
          e.g in the case of vhost it's kind of meaningless.
          <br>
          <br>
          Thanks
          <br>
          <br>
          <br>
          <blockquote type="cite">+&nbsp;&nbsp;&nbsp; status-&gt;used_idx =
            vdev-&gt;vq[queue].used_idx;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;signalled_used =
            vdev-&gt;vq[queue].signalled_used;
            <br>
            +&nbsp;&nbsp;&nbsp; status-&gt;signalled_used_valid =
            vdev-&gt;vq[queue].signalled_used_valid;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; return status;
            <br>
            +}
            <br>
            +
            <br>
            &nbsp; #define CONVERT_FEATURES(type, map)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ({&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type *list = NULL;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \
            <br>
            diff --git a/qapi/virtio.json b/qapi/virtio.json
            <br>
            index 78873cd..7007e0c 100644
            <br>
            --- a/qapi/virtio.json
            <br>
            +++ b/qapi/virtio.json
            <br>
            @@ -406,3 +406,105 @@
            <br>
            &nbsp;&nbsp;&nbsp; 'data': { 'path': 'str' },
            <br>
            &nbsp;&nbsp;&nbsp; 'returns': 'VirtioStatus'
            <br>
            &nbsp; }
            <br>
            +
            <br>
            +##
            <br>
            +# @VirtQueueStatus:
            <br>
            +#
            <br>
            +# Status of a VirtQueue
            <br>
            +#
            <br>
            +# @device-type: VirtIO device type
            <br>
            +#
            <br>
            +# @queue-index: VirtQueue queue_index
            <br>
            +#
            <br>
            +# @inuse: VirtQueue inuse
            <br>
            +#
            <br>
            +# @vring-num: VirtQueue vring.num
            <br>
            +#
            <br>
            +# @vring-num-default: VirtQueue vring.num_default
            <br>
            +#
            <br>
            +# @vring-align: VirtQueue vring.align
            <br>
            +#
            <br>
            +# @vring-desc: VirtQueue vring.desc
            <br>
            +#
            <br>
            +# @vring-avail: VirtQueue vring.avail
            <br>
            +#
            <br>
            +# @vring-used: VirtQueue vring.used
            <br>
            +#
            <br>
            +# @last-avail-idx: VirtQueue last_avail_idx
            <br>
            +#
            <br>
            +# @shadow-avail-idx: VirtQueue shadow_avail_idx
            <br>
            +#
            <br>
            +# @used-idx: VirtQueue used_idx
            <br>
            +#
            <br>
            +# @signalled-used: VirtQueue signalled_used
            <br>
            +#
            <br>
            +# @signalled-used-valid: VirtQueue signalled_used_valid
            <br>
            +#
            <br>
            +# Since: 6.1
            <br>
            +#
            <br>
            +##
            <br>
            +
            <br>
            +{ 'struct': 'VirtQueueStatus',
            <br>
            +&nbsp; 'data': {
            <br>
            +&nbsp;&nbsp;&nbsp; 'device-type': 'VirtioType',
            <br>
            +&nbsp;&nbsp;&nbsp; 'queue-index': 'uint16',
            <br>
            +&nbsp;&nbsp;&nbsp; 'inuse': 'uint32',
            <br>
            +&nbsp;&nbsp;&nbsp; 'vring-num': 'int',
            <br>
            +&nbsp;&nbsp;&nbsp; 'vring-num-default': 'int',
            <br>
            +&nbsp;&nbsp;&nbsp; 'vring-align': 'int',
            <br>
            +&nbsp;&nbsp;&nbsp; 'vring-desc': 'uint64',
            <br>
            +&nbsp;&nbsp;&nbsp; 'vring-avail': 'uint64',
            <br>
            +&nbsp;&nbsp;&nbsp; 'vring-used': 'uint64',
            <br>
            +&nbsp;&nbsp;&nbsp; 'last-avail-idx': 'uint16',
            <br>
            +&nbsp;&nbsp;&nbsp; 'shadow-avail-idx': 'uint16',
            <br>
            +&nbsp;&nbsp;&nbsp; 'used-idx': 'uint16',
            <br>
            +&nbsp;&nbsp;&nbsp; 'signalled-used': 'uint16',
            <br>
            +&nbsp;&nbsp;&nbsp; 'signalled-used-valid': 'uint16'
            <br>
            +&nbsp; }
            <br>
            +}
            <br>
            +
            <br>
            +##
            <br>
            +# @x-debug-virtio-queue-status:
            <br>
            +#
            <br>
            +# Return the status of a given VirtQueue
            <br>
            +#
            <br>
            +# @path: QOBject path of the VirtIODevice
            <br>
            +#
            <br>
            +# @queue: queue number to examine
            <br>
            +#
            <br>
            +# Returns: Status of the VirtQueue
            <br>
            +#
            <br>
            +# Since: 6.1
            <br>
            +#
            <br>
            +# Example:
            <br>
            +#
            <br>
            +# -&gt; { &quot;execute&quot;: &quot;x-debug-virtio-queue-status&quot;,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;arguments&quot;: {
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;:
            &quot;/machine/peripheral-anon/device[3]/virtio-backend&quot;,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;queue&quot;: 0
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            +#&nbsp;&nbsp; }
            <br>
            +# &lt;- { &quot;return&quot;: {
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signalled-used&quot;: 373,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;inuse&quot;: 0,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-align&quot;: 4096,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-desc&quot;: 864411648,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;signalled-used-valid&quot;: 0,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-num-default&quot;: 256,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-avail&quot;: 864415744,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;queue-index&quot;: 0,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;last-avail-idx&quot;: 373,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-used&quot;: 864416320,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;used-idx&quot;: 373,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;device-type&quot;: &quot;virtio-net&quot;,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;shadow-avail-idx&quot;: 619,
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vring-num&quot;: 256
            <br>
            +#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            +#&nbsp;&nbsp;&nbsp; }
            <br>
            +#
            <br>
            +##
            <br>
            +
            <br>
            +{ 'command': 'x-debug-virtio-queue-status',
            <br>
            +&nbsp; 'data': { 'path': 'str', 'queue': 'uint16' },
            <br>
            +&nbsp; 'returns': 'VirtQueueStatus'
            <br>
            +}
            <br>
          </blockquote>
          <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------DCD8574FB024A54B3F28EE84--

