Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8314E91FD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:52:49 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYm3M-0007Rd-FP
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:52:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYm1E-000618-Vt
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:50:37 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:54290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nYm1C-0004Ia-0b
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:50:36 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22RKwdcC023576;
 Mon, 28 Mar 2022 02:50:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=RjsMd4YewOAWV4AwsEH8noseBumMS9b+rnrQ0w/wz60=;
 b=z9oTMJxa6pS7KZD/A9xlR5gKewEv6wU5icDN0BjiJ4eemdAsVozu9jyvwh/Sc1qh4Nvc
 vZeVWSVMtdDjUFTGb5BQAhyVzrcAdEzS8eSGiSSlvqbvAMqr5rgkRLMBtdiUoqF0s+J/
 tAoVvGUabNvR1IbqOwDdYOno9AP2Mubm2oTdxTDsasn1Zdhx6+8t8abeaFacoeSRmB+q
 Nm4a8t6t41dQ9SYHShs/mwhO9xgldAxPJZxj20zp0X0pc0AsojpEhjnCs+j184iMq3h0
 GUauysuMxPV2VF7lw9KjV22Vu3TSa7Ex+svN8Wt9ieRRLlPCFsm+VD43tYK3cwYaAyuC Cg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f1xr8b6ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 02:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg+KtuCLsYRBxSNe4CjvX2VIQ0XQarociUzbynbsKCuU6FHTIwkZYQtfNEu1q74PnC3yQ7EnE76c+8SWfL9ANewsempPSpFf26TxzuNHrjHovINmAY762gNgYuPsbWQRISkrUrfzofKE1kLzqY04qNQUdZHrJ/uovyhmhZsBuqDKwyxyfkNudY1H3saJKw/4/7CtRPJcz+bfYCoNC8QzoqOlK+4dQ5lgTNWrWClAn9toYjF/FmNSv1IF3ryHIIPAs+gyNLDSLNCSVnZseRMim57oBfVhdtb1HP/1LewZwe3RMeY702P5m0qKihlSpf+6F68G0ejbbV/Lv+8tvOZNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjsMd4YewOAWV4AwsEH8noseBumMS9b+rnrQ0w/wz60=;
 b=bAp3uFGLnq/QtIuZkw8fZGjgZFwKrONH1SgQAMYDfyaCmw/ljhnjz44NHERoPt/69y30C8VEd5dwBsg/xjLwAytkSR9rQne1+lviiLZaffvwaHSFfReFr6Jpq7YCvwD65vaE4LqQETF+6HTR2qO7tX3Fv/BcBvESdwBvNWvfWEbrblXECcWXPhP1Kb5GByiS1N055d8X7P5C6vX7cd88tYzEN7zsD8Ci6OrHId7OM42dzCpNPACMUYHGvZfTUjjEL/emQ8FdqBpwt+QkA/UGuUkvT6J1dBiplFBMiWJ8fNxRdhOi8Bjfu4M321FA4KpomNRSSQqlIBweI5u1TsuZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM5PR02MB3701.namprd02.prod.outlook.com (2603:10b6:4:b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 09:50:30 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 09:50:29 +0000
Message-ID: <7afbb95b-9a26-add3-2733-a6fcf961c0e9@nutanix.com>
Date: Mon, 28 Mar 2022 15:20:20 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as PNG
To: qemu-devel@nongnu.org
References: <20220322104953.27731-1-kshitij.suri@nutanix.com>
 <20220322104953.27731-2-kshitij.suri@nutanix.com>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <20220322104953.27731-2-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::11) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635e8493-7367-4d08-acf0-08da10a06495
X-MS-TrafficTypeDiagnostic: DM5PR02MB3701:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3701A7BA7891DF884199995A991D9@DM5PR02MB3701.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHgshwhumhLmwqjHfQEM60pITly+HE+4NQ1aCjA+0EF4ZaGwKOkTK5uEp+mvTUPaOCM5KNx5kXwgTb1VY5CpKpVE95dpRgQjqaeWceNGtO6ubSNOeugVuSAR9gfqAqWf4neD5RcFBloFIXcP6er3/E/V46sSm8X6tEwlpIJajMzJ/sFnr3/GRf/DAIP2z4MYZXZPk5liLx9x0bkV4sfY1inqKfXK+Ky8AWOIepLlIOvK9YUx+Pc0w0flwIVOnfPz9Q1qYde7Kj9wSkxyr3ExLEsx3m1ekxidokGlmLCL+bZxajZXODXrUzebzwdGkil9qDSyy4gjpp6GXfUQ2fuSsFZvHQDXpQ73btSFZvi5DYLae6T1UAytE3TGMTsPmxOf1GjUAOPiOtxMU8ekecDkm/IEWLU7S4XOVanLiT+xVIAG1LQ0M+U5q0CGW9n3kt7JgsG/zPEDugKV9F0xXf1fLZ4mjigIl75/0Z8df3zwFbxKqSa1Oh0xe63SvozQXaQdXQjvo0Li1Es9a4ny8y6/KrN0Ry4JL5+6Y8L6lhC/Vol7Fmj8KvWon8+QamdLjO4lmbgcU52Wdcyf2YQ/UeVYD7TSqW8d6s5fbYLHFLp/IIxvAJ5d+6ENLvLyhLSvKhAdAVefmP4ETY4QI33Nd5EuJaKSyveWDThzaAs/fRKWi4AZeABuSqLQDz0pJeR5ygdduDm4idUJ59oMw8XTGPm54q42GtTuoBO1g+exy/+2qPCQP1+ZsnOF8PAQBmHRrcbXAlnx108PzmJQiUTQgJ1tqXDXayPiHLeY3+L/d3lEtfTt4+N6TIV3qjmOHxBXTpIPfOEiDOTz1QFx+YoBIZlZwkvEggZEFYTftvvC6BFrKM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(5660300002)(38350700002)(38100700002)(66574015)(26005)(31686004)(2906002)(8936002)(186003)(36756003)(6666004)(66556008)(4326008)(2616005)(6506007)(52116002)(316002)(66476007)(966005)(508600001)(6486002)(44832011)(53546011)(6512007)(31696002)(66946007)(8676002)(86362001)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czg1U29ZYVkrT1F4dlg0ZGhGTTM1T0ljYmZraWtEanlGMFg4MG9FUlNZYzZn?=
 =?utf-8?B?TnhKejdrck42WllmZlM2WFVFOEV5TWd1bkJaa3pNaTA3RGI4RnprN3ZZREpz?=
 =?utf-8?B?emNoWTdpY3k2TXZMUytmcFE4cWJPSFlpdlhRWVdYNXV4MEFxU1FpTFEvTjJN?=
 =?utf-8?B?SFR0Lzhla25hOVU3WTh3dS9pRjJtRmQ2RUorelZhNjY1NHJ5MU5tbDlTQ0xB?=
 =?utf-8?B?dVBEeHRhRDc4OTY1NUF6TUNLb0kwazJxdFVsUitZUXcrdVJEdzlrd2ZWdmc1?=
 =?utf-8?B?ZVVlM2FjeHlrVWpsSnRvbUFYSzF3ejFNT0YvWk5salk1dUlsbFRiWDNoQ1ZK?=
 =?utf-8?B?Wi9ocGVTSS8rRzREbVZJMU8yc0R4aW96a2xGR3NSV1orai9Ybk0rWTJDSTg3?=
 =?utf-8?B?eFlqQ1RacmZ0RlcrZGdkU2twMjhRYlZNa3lJV2k3SE9QOFR0WWNSeHhWSTVV?=
 =?utf-8?B?WHB2eEQzTG1zR05BWXFrVDhRZFZRNk5tYU1wdktSejlkVHdtUVR0QWxPMExH?=
 =?utf-8?B?cE1ha09LYnptRkJyV250MDJ0dzFXU1RybUtGY2xKb2pxa1ZhZ3VVV2xDSE03?=
 =?utf-8?B?M2hMK1VCTTFJNE5aMTU2Wm05VUN6Z3YwNzhLdDVWbCtZbEJMMFNjalRIVU5K?=
 =?utf-8?B?VENDNTRDb2pEMFBNY2VVMURrejh3VVN5aE5NS0ltcjdlbmUvcTZQeGZOSjZt?=
 =?utf-8?B?Zi85WXFOVllCZHoybnU3T0NzTnVSMnoxWVlRVlZYbks0QUsrTXF1MEpyakJh?=
 =?utf-8?B?ZjNVLzVKVUNsemZWZ21RNFl0aDFBTWRMNmxDL0lTbnBYWCttcjZJcWxac3dE?=
 =?utf-8?B?QjRZSjJIZGV4Qk5XLzVWazdZbjJkTEF3QTdPcWpNYy9FVTMweEhYR25oaUc2?=
 =?utf-8?B?WkxOSzlRU1c4UklxUDcvMUUvbXpnbmdhSnpTclloR3ZMa0dVby95V2h6T0xv?=
 =?utf-8?B?dUxGMHA1d3RobVNFalJ5dHhiV3FEWlJkc3NJWFdWSTNJNHd0dy9LWTAyOVAv?=
 =?utf-8?B?dEhMTXdvL1F2ZngxSE9ZT2c3UzQvaTZjNmVKMGZjdWwvVXhrZTJlNS80VDRP?=
 =?utf-8?B?UktDUHhQMVQxb1UyWWlYWDU2bVZiTGQzZzZwRTllcEErbUhOM0ptZ0VsOUJq?=
 =?utf-8?B?R3Rnb0dzcDJVeVE2VlFIek5QOUUveCt2Vm1YWVdyd1B6Nk5uZDZRK1lVaUxO?=
 =?utf-8?B?OUw1RTFRWVZwdFBzS20wSFJ6aEpITmhCWkdlY3hVd2Zmek5BRHhKMTVTUXJy?=
 =?utf-8?B?cXlobHBQYzFlVVRrVUFXTytFUEtXbG9hcHVjUUdFMVZxeE1mYVFOUlphVUNU?=
 =?utf-8?B?WmZ2SmhJY0VQU2NmTytuRjZSUGJBaGRHUUNNRVpkTkdHdzRoTTl5dnJJOWVZ?=
 =?utf-8?B?U09PNjNtUmx4TGVwWDMvSTNOUm9aYk9FZVdibVZXMEdTWTlGeWF4SUtMWGJH?=
 =?utf-8?B?UWp5dHhFOEVvNUlnU0s3cmE1c1VzTXo1VmZBTDJLanRwa0NIWVN4eUo1b243?=
 =?utf-8?B?UVFWckc5MEtWQUo1ZThNdncwMDg4emVSTWJMaXoyWm1Jd2FMN01Sa0dCMlFw?=
 =?utf-8?B?R3Q5QlFvOVF2dndxTlBIeXRaYjJmL2hRVGtkZmdVSS9JOWdRV1M0Q01XekZI?=
 =?utf-8?B?ZE02K0Y3QW1WN0p1TGJEUkFaL1RheFBZT2pDdWMvMW1BMUxFci9zSFVNcjFz?=
 =?utf-8?B?SU00c3ZwK1JGS3JsV1ZPTjZsV2RxWFR4YnNsdmJ1WmNKQWttL3dPVzZFMDUy?=
 =?utf-8?B?a2l5bERhWktJelNuWTREM1JJU0ZYejZnTUt1OElrWW5YdGFUZlhpWFlTRnVj?=
 =?utf-8?B?YzBOdENTalVGTVdaV2dtaXZFZU9JeitsWXJyY2FpcmlXRGhGK1NvazdpekNW?=
 =?utf-8?B?RW9ROSt0U09LMmQwU0twdEc4ZTNGa3llQUZ6aGpQVWdqK0o3NnhOVnorb0ta?=
 =?utf-8?B?aUFlN1ZhMWpmM1U5d1RsRXI4UzJReFdTbWxCRitUdkN3ODBxd0Zxd09MNWtp?=
 =?utf-8?B?RWw4cjB5eStCbEUxVXQrZ3hhRE9DY2lSSCtBU25sQjJPTlZnenFabkJBQnJS?=
 =?utf-8?B?RkU1M0g1V0l4NkNSb1JqdkE0V0NYMjBaWjRnaldSTkZMNmRubHdHVE9wdUM4?=
 =?utf-8?B?cUpDUFZQVTJNcVl3dEdTOTNxRm4xSzFKVUhkYytnTWdMekRuSnZkTDdQVHQr?=
 =?utf-8?B?L3Nqc0NVUkZId1BwaFhqTXlrZnhQS2k0QXFyNE5RV2VkSys3bkFSUjNhL1Rr?=
 =?utf-8?B?TTFhTVBvbzZ0K09kN3BSNE5CbE1kMDc1V3V3QWhqaEJ5bUYrRGIyTVBodG1L?=
 =?utf-8?B?b1kyZnZCSmdJWE83Z1JkQzhobmlVM1RadTFrWmpkbzhycTU2K2xuSkF2Smpu?=
 =?utf-8?Q?v60v0b+WPhu4ZoBI=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635e8493-7367-4d08-acf0-08da10a06495
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 09:50:29.7657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFr9XiO1cCbu0jcOVlcwBmFcjsE0D/W+a6+WmmA9koa7IU1U5Wrc+Evn/kw6f2us4kJgQPQK4dquKx7LgOlJAxwBjfNADi5gV2upHj+B0+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3701
X-Proofpoint-GUID: U2lku9aLs_wXzCqB8__USadLpmZzYGa0
X-Proofpoint-ORIG-GUID: U2lku9aLs_wXzCqB8__USadLpmZzYGa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_03,2022-03-28_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Hope this mail finds you well. I have updated the code as required 
and would be grateful if you could review and suggest changes that are 
needed to be implemented. In case no change is required, please do let 
me know the next steps for the same.

Regards,

Kshitij Suri

On 22/03/22 4:19 pm, Kshitij Suri wrote:
> Currently screendump only supports PPM format, which is un-compressed and not
> standard. Added a "format" parameter to qemu monitor screendump capabilites
> to support PNG image capture using libpng. The param was added in QAPI schema
> of screendump present in ui.json along with png_save() function which converts
> pixman_image to PNG. HMP command equivalent was also modified to support the
> feature.
>
> Example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
> diff to v1:
>    - Removed repeated alpha conversion operation.
>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>    - Added a new CONFIG_PNG parameter for libpng support.
>    - Changed input format to enum instead of string.
>    - Improved error handling.
>   hmp-commands.hx    |  11 ++---
>   monitor/hmp-cmds.c |  12 +++++-
>   qapi/ui.json       |  24 +++++++++--
>   ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
>   4 files changed, 136 insertions(+), 12 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8476277aa9..19b7cab595 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -244,11 +244,12 @@ ERST
>   
>       {
>           .name       = "screendump",
> -        .args_type  = "filename:F,device:s?,head:i?",
> -        .params     = "filename [device [head]]",
> -        .help       = "save screen from head 'head' of display device 'device' "
> -                      "into PPM image 'filename'",
> -        .cmd        = hmp_screendump,
> +        .args_type  = "filename:F,format:s?,device:s?,head:i?",
> +        .params     = "filename [format] [device [head]]",
> +        .help       = "save screen from head 'head' of display device 'device'"
> +                      "in specified format 'format' as image 'filename'."
> +                      "Currently only 'png' and 'ppm' formats are supported.",
> +         .cmd        = hmp_screendump,
>           .coroutine  = true,
>       },
>   
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 634968498b..2442bfa989 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>       const char *filename = qdict_get_str(qdict, "filename");
>       const char *id = qdict_get_try_str(qdict, "device");
>       int64_t head = qdict_get_try_int(qdict, "head", 0);
> +    const char *input_format  = qdict_get_try_str(qdict, "format");
>       Error *err = NULL;
> +    ImageFormat format;
>   
> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> +    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
> +                              IMAGE_FORMAT_PPM, &err);
> +    if (err) {
> +        goto end;
> +    }
> +
> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
> +                   input_format != NULL, format, &err);
> +end:
>       hmp_handle_error(mon, err);
>   }
>   
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 664da9e462..e8060d6b3c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -157,12 +157,27 @@
>   ##
>   { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
>   
> +##
> +# @ImageFormat:
> +#
> +# Supported image format types.
> +#
> +# @png: PNG format
> +#
> +# @ppm: PPM format
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'enum': 'ImageFormat',
> +  'data': ['ppm', 'png'] }
> +
>   ##
>   # @screendump:
>   #
> -# Write a PPM of the VGA screen to a file.
> +# Capture the contents of a screen and write it to a file.
>   #
> -# @filename: the path of a new PPM file to store the image
> +# @filename: the path of a new file to store the image
>   #
>   # @device: ID of the display device that should be dumped. If this parameter
>   #          is missing, the primary display will be used. (Since 2.12)
> @@ -171,6 +186,8 @@
>   #        parameter is missing, head #0 will be used. Also note that the head
>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>   #
> +# @format: image format for screendump is specified. (default: ppm) (Since 7.0)
> +#
>   # Returns: Nothing on success
>   #
>   # Since: 0.14
> @@ -183,7 +200,8 @@
>   #
>   ##
>   { 'command': 'screendump',
> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
> +           '*format': 'ImageFormat'},
>     'coroutine': true }
>   
>   ##
> diff --git a/ui/console.c b/ui/console.c
> index da434ce1b2..f42f64d556 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -37,6 +37,9 @@
>   #include "exec/memory.h"
>   #include "io/channel-file.h"
>   #include "qom/object.h"
> +#ifdef CONFIG_PNG
> +#include <png.h>
> +#endif
>   
>   #define DEFAULT_BACKSCROLL 512
>   #define CONSOLE_CURSOR_PERIOD 500
> @@ -291,6 +294,89 @@ void graphic_hw_invalidate(QemuConsole *con)
>       }
>   }
>   
> +#ifdef CONFIG_PNG
> +/**
> + * png_save: Take a screenshot as PNG
> + *
> + * Saves screendump as a PNG file
> + *
> + * Returns true for success or false for error.
> + *
> + * @fd: File descriptor for PNG file.
> + * @image: Image data in pixman format.
> + * @errp: Pointer to an error.
> + */
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    int width = pixman_image_get_width(image);
> +    int height = pixman_image_get_height(image);
> +    g_autofree png_struct *png_ptr = NULL;
> +    g_autofree png_info *info_ptr = NULL;
> +    g_autoptr(pixman_image_t) linebuf =
> +                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
> +    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
> +    FILE *f = fdopen(fd, "wb");
> +    int y;
> +    if (!f) {
> +        error_setg_errno(errp, errno,
> +                         "Failed to create file from file descriptor");
> +        return false;
> +    }
> +
> +    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
> +                                      NULL, NULL);
> +    if (!png_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write struct");
> +        fclose(f);
> +        return false;
> +    }
> +
> +    info_ptr = png_create_info_struct(png_ptr);
> +
> +    if (!info_ptr) {
> +        error_setg(errp, "PNG creation failed. Unable to write info");
> +        fclose(f);
> +        png_destroy_write_struct(&png_ptr, &info_ptr);
> +        return false;
> +    }
> +
> +    png_init_io(png_ptr, f);
> +
> +    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
> +                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
> +
> +    png_write_info(png_ptr, info_ptr);
> +
> +    for (y = 0; y < height; ++y) {
> +        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
> +        png_write_row(png_ptr, buf);
> +    }
> +    qemu_pixman_image_unref(linebuf);
> +
> +    png_write_end(png_ptr, NULL);
> +
> +    png_destroy_write_struct(&png_ptr, &info_ptr);
> +
> +    if (fclose(f) != 0) {
> +        error_setg_errno(errp, errno,
> +                         "PNG creation failed. Unable to close file");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +#else /* no png support */
> +
> +static bool png_save(int fd, pixman_image_t *image, Error **errp)
> +{
> +    error_setg(errp, "Enable PNG support with libpng for screendump");
> +    return false;
> +}
> +
> +#endif /* CONFIG_PNG */
> +
>   static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
>   {
>       int width = pixman_image_get_width(image);
> @@ -329,7 +415,8 @@ static void graphic_hw_update_bh(void *con)
>   /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>   void coroutine_fn
>   qmp_screendump(const char *filename, bool has_device, const char *device,
> -               bool has_head, int64_t head, Error **errp)
> +               bool has_head, int64_t head,
> +               bool has_format, ImageFormat format, Error **errp)
>   {
>       g_autoptr(pixman_image_t) image = NULL;
>       QemuConsole *con;
> @@ -385,8 +472,16 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>        * yields and releases the BQL. It could produce corrupted dump, but
>        * it should be otherwise safe.
>        */
> -    if (!ppm_save(fd, image, errp)) {
> -        qemu_unlink(filename);
> +    if (has_format && format == IMAGE_FORMAT_PNG) {
> +        /* PNG format specified for screendump */
> +        if (!png_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
> +    } else {
> +        /* PPM format specified/default for screendump */
> +        if (!ppm_save(fd, image, errp)) {
> +            qemu_unlink(filename);
> +        }
>       }
>   }
>   

