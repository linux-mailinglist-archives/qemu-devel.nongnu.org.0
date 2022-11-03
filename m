Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB3618757
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:20:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqeo6-0006Gn-FM; Thu, 03 Nov 2022 14:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqenQ-00062f-G7
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:18:42 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqen3-0002qd-Vw
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:18:28 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A3HqcMp015862; Thu, 3 Nov 2022 11:18:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=RR/nrqrNTiSPuydChGEOL2n0YuzKaBJUd40XdbGT71A=;
 b=X605T7XY3v5o5GU9sguRFP+QCKYmuCm68y6AHdxv1rtEkLRwOhcmfBwj1W9SKyVXO2lR
 x0xs1IZcHs6xhP2qaLs2AjpLTVILfmsXz/UpOPCFqjUUrHek5NuPz/0cj57cjrwTvdys
 oS7wr18jNbV8204LhUT0yZ++XPrv1MNXESMORk/7xRO0BK/SPIY/Z4RzNlu91ox8TZJ/
 AHT5i3WEqlSOPm7V+u+jo2KbBHvE4I5qwy8hSJ30WqRBx7UlaqS51gL4KR5d41ZCm8cV
 YDirkVGgi1/mP5Dx0Pjf/boCGLOQb6+C3R7Tg9b7TBTt+fJKYflpT0IRyupRTi8m9dpG 8Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kjpth7vvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:18:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exNE6tkkx0beiG+++5sBdpocuwvvKefsxrXoj1MqJsDMtDE7ic6AMC1EtZ7FLMNblpEu2gixaXHnAY5cKZVAQ7WsQ+F6PWy+paoRD0+RnEwxJVHxEloL7zssgtkvtNc9EDitWq2Toos0BSNu5t+xVAX9vUMVSURUImymSvFbpAnuC+RYEAQ+mz4EyUC4WLneIrmnsCc7EDAKCDSphukn3/mxUEDkrv6+M4LyPXjsiqnXI/aqtkxfUMGCkVLFjqd4dbp4ELLNJ25ZvmeR4qdWK+X3u6oiUQ5C0YRXNkmo3i5Uc9VXNcpRqfY9XRVWZhs2si0lFQxAStXnf7eoXIfOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR/nrqrNTiSPuydChGEOL2n0YuzKaBJUd40XdbGT71A=;
 b=k4LSLtVdpNg2W6BcMfMgxkjEUURFQGdOFEEeQwLFugtLi1HsXk3FFhHzeLDg324A0276e21TcEwpNWgdtnSxjBYlL7xzU7pE7DoRba5EsGW8OE5pO+0n/6Qazx6RDL6Wmo4lr+2+8Lhv23RBIshVc91euL9Jag5unqm4FylPAEnDSahUKICFy8EKjNWVEi1OeGRlggrY63mlu6T1trEb8NM81LoRTRf0GxOkd6FSisN1zo1ALLhS0OZuhSO4QnR0GXjjvGISY0wZ+9rhuHsWaHLePCEE4TIzZVQzRL0eX20Bzy02tEmZgrNWX3wyqIlsU0dHssUnshM8FAWME/eGQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR/nrqrNTiSPuydChGEOL2n0YuzKaBJUd40XdbGT71A=;
 b=lrMIYLD9TDAqCZn0/3B8R9jCirk6ZXu2BWvm88Xd5gjP6q2KX20RFJbX1luHUlnTh9YUG8Dd72AUO87UcUF4l3zwaLLozSAImvBYQ8/iua4Gkd+o2B8oH2TNdv27AjLFqDkb7GL4F+hVpD/RZJoKY8YBFxRcErRWj0D3XupatjUjMW0K+aguYiUmb0Mc4McvWdwPLrLFUqvnInWqTtl5pOUSsjIP0EPRSlw7+aIwB93G6/mIbEY+3CqX8OOLy+3LCxU1XsU5DXiJQooviUZpmr2rfrE47+U7k+Pv7p4OFYJ5i0IHdGGOwCkDEfQd/7yu4FOBzW/5CX5+AqotE4rn6Q==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CH0PR02MB8059.namprd02.prod.outlook.com (2603:10b6:610:108::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 18:18:02 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 18:18:02 +0000
Message-ID: <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com>
Date: Thu, 3 Nov 2022 23:47:51 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com,
 Prerna Saxena <prerna.saxena@nutanix.com>
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
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y2QA93CGE6tyD4vT@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CH0PR02MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3e499e-665c-480c-24a5-08dabdc7be73
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5ffzqZ8zKuMX13zgw0CXN8iLhypjQln2euSFs15YCWmvli6M40er6kM4pV89Vbw3VOePLwa+H9Zrf5efDkDZjdHdaJHr5dpDzcGu+ju6TW+p3OUO67wdwcmk4tOgnxSdvYcjiZu7ZGyWmMiD5+w04UqI0sLuDkU6xgA3NVrr7FhC98PbfQfbuGwbnCHPnZ/cKYIEdsW27ch/DcCvIa/CXJGETCwYzR52WAEZKl5r2kUYBVUWv+cq2yfjJioHfuenP/QuTJvFWTxTof4xk/vWTZfIvl1L5kLdNUMz44UAvgs96212cJRpb+puat74Aj+NDOGwKOpwphy/5hJwbwsdRNRS8nEQAPPBLYTimiwAj+td/yWu8Te6pdVkk12OiC9Ly0sFTaykzcrxUfjykzrOD72vCABjaazxtoYAIwaiNL9eEBDLGVj4+jQ5rX4xxo9P/vIyV8rGzaRiUx+ipUYwf5dV7qmX/55W1EM2jfDrsB97klS7O5Udz2MMbB1qrtCTerjQaaqufofCJ6FohHWTElPC1D4u8tfUJmklDf5cRcALi63iQssQn4lLlqwNnLMtMC6tTz3+WgK9uVqwQ2Sm29GPA2gW5w1K83KxyYsunegJIXB5yna7tA8CSu+oriziuqBgJ8xw1ZdKIh5rFKM2dTZrCeZ69WoZuQa8gjuebAvquc/fykPOuaFauYl+gHQ7ToUU11jwSw5M4lMG9eUbLi2c3bOltiMXQPbXf3GBhisjgmEbI0zq4edD9GOe6fAhTE1TxkwaTgmRyie+x5aU/R+H37TnBQgXLsbqzt3Opc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199015)(4326008)(66946007)(316002)(8676002)(66476007)(41300700001)(6916009)(2906002)(6506007)(66556008)(38100700002)(6666004)(5660300002)(6486002)(107886003)(6512007)(186003)(53546011)(55236004)(26005)(83380400001)(86362001)(2616005)(31696002)(31686004)(478600001)(8936002)(66899015)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWNYRDcyeDNCNzNtYWJYbThpdW5QOThlK2UyUGF5eFljcUJtcWVYNTM1L1hr?=
 =?utf-8?B?VG8zSUFQODFuczN5WWh4YW5TQktPL1hRaDgxNU5tSTVxOWEvWm1FZFBKR3lG?=
 =?utf-8?B?SElZcTZJb25Hcmkrek9rSW10MkhSRDNoa3ErbW43NDR0Vm5MOHJLWGgvOE9n?=
 =?utf-8?B?a2xUa0g2N3VwYllUdFcyQ1BxaVl5eSt0SjFpTWhPUG5JeStQUXhwaVl2THBw?=
 =?utf-8?B?OWF1aWx1cGRtRHRyVjJmUUNhZDExMmhnTmFYeFRzcGVlYm5FR2hPTklDYUY1?=
 =?utf-8?B?WmJLMFRHL09YamR0MU9tSkdQeXF6TTc2YW9BMjJrTXJRU01vYmx5Ulk2WUJh?=
 =?utf-8?B?MDcxVDl1WjBISndnOTJ6cTcvSGdPaGlLMk1BT2xtRkJHaitYaUExd2hBV25F?=
 =?utf-8?B?M0N1WVR1OHRjMjhES0ozZDY4Q2l2TE1tcnVZM0pRWjdoWDdlT3VGQTF6Uklo?=
 =?utf-8?B?MzZFMFhPKytaaUN5QXJyUXlVNlhRMXcyVWlGTUg2TG9kNHBzdlFGektHbjdi?=
 =?utf-8?B?SExCNk1XWVJRSmlacCtCL0xkZG9SSU93RG5DWUpkQVVEOTlRQVVhTC9IU2Zv?=
 =?utf-8?B?SDFoNkNVUUNPQVdxRlNBRHd4WC9URlF2d1Y4VVAxc2pBZi9lNlNRVEkyc29M?=
 =?utf-8?B?aGZiMHgyc0xHdDZ5TFZiMXNOaVFKTnVpdUZWTk8ycS9lRGdRUTJXcEdWdkFO?=
 =?utf-8?B?M3dzZStsSUkxTGlZa2JUZUNNdGxZb2NXT2FOMTNFUlBHWUxuK1hEblBJS3Bu?=
 =?utf-8?B?WUt2Si9oY2RWNHJpbTFybHV1d0tJT0Z5SjdNMk5BakI2ZlBuSmZFd1lUc0lN?=
 =?utf-8?B?eTJGYS82bm9Wa1loODlsd1grWS92REREQmgwMWVTNTh5MVpkR0RkTGhCMG9E?=
 =?utf-8?B?ME9qR0x0SGdOTU5qL0lHZS9KK0dVR0FESXEvWjAyRlhDTHdtbUVzV0ViYmlp?=
 =?utf-8?B?T0w4VVAxWXVWb0lzemZlSDFkWlZaWDVmMi9HeVdIRk9DeWcxZ283U0dnK2VB?=
 =?utf-8?B?cHBUVDNaRXlTRU5RR1d5SFNXcUgxaEljcjBBRjc0QnJzSzd3WkxFZXJlMll1?=
 =?utf-8?B?M0lpZXVyNWlwRllqZlZPZ2VHTE1IMXAvSFpxZFBscDFvYzhPbjV3blpmbE1j?=
 =?utf-8?B?WWRnMXZLS0d3Ty9jVUJ5V29pQjFxOEQ4ajNjMnZad2lZSXFlMEYrdS8yQnBa?=
 =?utf-8?B?ODFTK2xEcHlRS0RxSFhWbkgrWTkycWdscWFlNzMwWEVqWCs0d0NtQnhFcEVo?=
 =?utf-8?B?eG1ZbWs5SUtNanRkdGZCRkVabi9EY1JqTUVlYW5nQ0tEU0tBSUMvRVJiYmZn?=
 =?utf-8?B?Z1FpUDAzb05yVlVqYk1iUUx0OGVpSzhsWVdNL1NBMVdTYnBSdldPRjJsNzZ6?=
 =?utf-8?B?NS9nSENrbmxoUWdFbjBONHpCb3RsWGx6Rk5kKzFVYzNKSWVRSjlzcVBQMmV0?=
 =?utf-8?B?ZW8vd3pCQTBRMGJoOFI1NE82SldVaHljS09ZeFllenJyb1Y0TXpGSWNxb1dP?=
 =?utf-8?B?ejl2VUN2MUh5akl3WVZBcW5HVit6amY0cVZnTFo2T3VWTjhkVldKcW9XTWs2?=
 =?utf-8?B?eXFmRzA1ZTBHSUdHWG9vWXJMZVpXRkFQN21lK3hNU2xFdm5MUFo1ZlhiOWRG?=
 =?utf-8?B?VC90R2RRQUJpdnJiM0dWMXp1cEF1Ymp2THIvR0Z6bjVBNjBlT08yMGh4citp?=
 =?utf-8?B?cXMyRy8vWnlGckxNT2JDMEcyMllNbUg3RWJMV1NPeUVFZmFFRXdXWk9wMUxw?=
 =?utf-8?B?VHcxZHloUEtPcW8vYWhEcUg3eHVhaWtYVWpkZnpyM0pRUHBQY2xYYUdYYTdE?=
 =?utf-8?B?dTViYjYzRDNXN0VveTAzWFVNRHpadzRrL1l2R2plMDZhVzI5SlNsZXAzR1g2?=
 =?utf-8?B?eFpRRHRBQ21mSlZYcFJJSnl2QUdtRm9tSTRzQzVzUUVsNFBWZVNhTGZ5V2xw?=
 =?utf-8?B?cjNJVktLcmFPQmFZZk9hbkZadjFvOUc3bzlHcENvK3pQZnFWWE5nZWVlNGpJ?=
 =?utf-8?B?V2lNOTNiL2w1alpxWWxTOW5MRUc2emZLVlNXTjRPQ1I5UFY2RGVtV2lTZzJ2?=
 =?utf-8?B?aFgwZ1BFNlBWbFQzYVNUTW5jUTJHdE16dndaT0pzakJ5cWxTQkE4cjBlcGRj?=
 =?utf-8?B?cDdBN0IvbmIva2pibkVLV3dGVGxzWHozeUx0VzZWajJtZUNvdHNhNXJLMG1w?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3e499e-665c-480c-24a5-08dabdc7be73
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:18:02.1610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sMxueJEaPA3M2HQLcHK+3fM2scvSXT+R5+qFmo57NW8t2bvmTRS+VdsY4xqrD/ReQLEMmqAVaRmt7YZtKND/Jf+SK/wi2TgH6c6omWMARA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8059
X-Proofpoint-ORIG-GUID: Fmz2AKNaygIDOFXi41kjt5BWuyH8bEo0
X-Proofpoint-GUID: Fmz2AKNaygIDOFXi41kjt5BWuyH8bEo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 03/11/22 11:27 pm, Daniel P. Berrangé wrote:
> On Thu, Nov 03, 2022 at 11:06:23PM +0530, manish.mishra wrote:
>> On 03/11/22 10:57 pm, Daniel P. Berrangé wrote:
>>> On Thu, Nov 03, 2022 at 10:04:54PM +0530, manish.mishra wrote:
>>>> On 03/11/22 2:59 pm, Daniel P. Berrangé wrote:
>>>>> On Thu, Nov 03, 2022 at 02:50:25PM +0530, manish.mishra wrote:
>>>>>> On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
>>>>>>> On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
>>>>>>>> On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
>>>>>>>>> On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
>>>>>>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>>>>>>> index 739bb683f3..f4b6f278a9 100644
>>>>>>>>>> --- a/migration/migration.c
>>>>>>>>>> +++ b/migration/migration.c
>>>>>>>>>> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>>>>>>>>>       {
>>>>>>>>>>           MigrationIncomingState *mis = migration_incoming_get_current();
>>>>>>>>>>           Error *local_err = NULL;
>>>>>>>>>> -    bool start_migration;
>>>>>>>>>>           QEMUFile *f;
>>>>>>>>>> +    bool default_channel = true;
>>>>>>>>>> +    uint32_t channel_magic = 0;
>>>>>>>>>> +    int ret = 0;
>>>>>>>>>> -    if (!mis->from_src_file) {
>>>>>>>>>> -        /* The first connection (multifd may have multiple) */
>>>>>>>>>> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>>>>>>>>>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>>>>>>>>>> +                                        sizeof(channel_magic), &local_err);
>>>>>>>>>> +
>>>>>>>>>> +        if (ret != 1) {
>>>>>>>>>> +            error_propagate(errp, local_err);
>>>>>>>>>> +            return;
>>>>>>>>>> +        }
>>>>>>>>> ....and thus this will fail for TLS channels AFAICT.
>>>>>>>> Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
>>>>>>> But we need this problem fixed with TLS too, so just excluding it
>>>>>>> isn't right. IMHO we need to modify the migration code so we can
>>>>>>> read the magic earlier, instead of peeking.
>>>>>>>
>>>>>>>
>>>>>>> With regards,
>>>>>>> Daniel
>>>>>> Hi Daniel, I was trying tls migrations. What i see is that tls session
>>>>>> creation does handshake. So if we read ahead in ioc_process_incoming
>>>>>> for default channel. Because client sends magic only after multiFD
>>>>>> channels are setup, which too requires tls handshake.
>>>>> By the time we get to migrate_ioc_process_incoming, the TLS handshake
>>>>> has already been performed.
>>>>>
>>>>> migration_channel_process_incoming
>>>>>        -> migration_ioc_process_incoming
>>>>>
>>>>> vs
>>>>>
>>>>> migration_channel_process_incoming
>>>>>        -> migration_tls_channel_process_incoming
>>>>>            -> migration_tls_incoming_handshake
>>>>> 	     -> migration_channel_process_incoming
>>>>> 	         ->  migration_ioc_process_incoming
>>>>>
>>>> Yes sorry i thought we block on source side till handshake is done but that is not true. I checked then why that deadlock is happening. So this where the dealock is happening.
>>>>
>>>> static int ram_save_setup(QEMUFile *f, void *opaque) {
>>>> +
>>>> +
>>>>       ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>>>>       ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>>>>
>>>>       ret =  multifd_send_sync_main(f);
>>>>       if (ret < 0) {
>>>>           return ret;
>>>>       }
>>>>
>>>>       qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>>>>       qemu_fflush(f);
>>>>
>>>>       return 0;
>>>> }
>>>>
>>>> Now if we block in migration_ioc_process_incoming for reading magic
>>>> value from channel, which is actually sent by client when this
>>>> qemu_fflush is done. Before this qemu_fflush we wait for
>>>> multifd_send_sync_main which actually requires that tls handshake is
>>>> done for multiFD channels as it blocks on sem_sync which posted by
>>>> multifd_send_thread which is called after handshake||. But then on
>>>> destination side we are blocked in migration_ioc_process_incoming()
>>>> waiting to read something from default channel hence handshake for
>>>> multiFD channels can not happen. This to me looks unresolvable
>>>> whatever way we try to manipulate stream until we do some changes
>>>> on source side.
>>> The TLS handshake is already complete when migration_ioc_process_incoming
>>> is blocking on read.
>>>
>>> Regardless of which channel we're talking about, thue TLS handshake is
>>> always performed & finished before we try to either send or recv any
>>> data.
>> Yes Daniel, agree on that, in this case tls handshake is done for
>> default channel so we went in migration_ioc_process_incoming for
>> default channel. But if we try to read some data there, it does not
>> get because data on default channel is not yet flushed by source.
>>  From source side data in flushed in above function i pointed. Which
>> blocks for multiFD channels to be setup with handshake, before
>> flushing data. I mean data is sent only when buffer is full or
>> explicitly flushed, till then it is just in buffer. But multiFD
>> handshake can not complete until we return from
>> migration_ioc_process_incoming for default channel which infintely
>> waits because nothing is sent yet on channel.
> On the source side, if we're in ram_save_setup then the TLS
> handshake is already complete for the main channel. In fact
> I think the TLS handshake should act as a serialization
> point that prevents the entire bug. It should be guaranteed
> that the main channel is fully received by the dest, and
> transferring data, before we even get to establishing the
> multifd channels.


Yes, Daniel, tls handshake could make things serielized, but issue is that from source side handshake is done in background with another thread we do not actually block, so it is still possible that multiFD connection is accepted first on destination side.

>
> All we need do is read the magic bytes early, regardless of
> whether its plain or TLS channel, and it should to the right
> thing AFAICT.
>

Yes, but if we try to read early on main channel with tls enabled case it is an issue. Sorry i may not have put above comment cleary. I will try to put scenario step wise.
1. main channel is created and tls handshake is done for main channel.
2. Destionation side tries to read magic early on main channel in migration_ioc_process_incoming but it is not yet sent by source.
3. Source has written magic to main channel file buffer but it is not yet flushed, it is flushed first time in ram_save_setup, i mean data is sent on channel only if qemu file buffer is full or explicitly flushed.
4. Source side blocks on multifd_send_sync_main in ram_save_setup before flushing qemu file. But multifd_send_sync_main is blocked for sem_sync until handshake is done for multiFD channels.
5. Destination side is still waiting for reading magic on main channel, so unless we return from migration_ioc_process_incoming we can not accept new channel, so handshake of multiFD channel is blocked.
6. So basically source is blocked on multiFD channels handshake before sending data on main channel, but destination is blocked waiting for data before it can acknowledge multiFD channels and do handshake, so it kind of creates a deadlock situation.

I am still not sure if i could put it clearly :)

Thanks

Manish Mishra

> With regards,
> Daniel

