Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABAF618802
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:55:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqfMT-0002tx-WF; Thu, 03 Nov 2022 14:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqfMR-0002sc-6O
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:54:43 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqfMN-0000VA-HF
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:54:42 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A3G0OYl005902; Thu, 3 Nov 2022 11:54:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=DHddObaeeoN2bNGR5b0Tv5G44fNxG+Wc5BUtzR+Jgyo=;
 b=h/XQg0P2phikrLz29TjOmBaMKSvuRbBnrUo4ym125AL0BsRWmMeVXk9J8sqQTKUAuNEv
 Wi+YsrrW2vUx6MF146LYzCae1qWECefi09yIcdKJayJ5qdSFIg45R++VVDTuGlfteto7
 NkEnGrNdh1i1juAAcY/UH8gBIEW4vwUvtoaPwG5hxxbeY5KWxAhYGkkYZsjRD47TDmvT
 i2KpSExVT05v2BYCcpdqd4S65nY8W5/M2v6ecOm25QHBSrK5vviIGdLWsXNFsvWRIfwd
 TlRFX0IxZ7NvRTxnOSzqfvOfPMt+8RFXdf5dE2EEVChXK22XRTk1PEHYcTYn9A0DSq0x KQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kkfsumjfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEJRViBhOJiZ0nEk2IXNmNbBXis4Pm4S93XQUVgWW+6r7HTBYGgiACKya9sYfkdj0PhlKytO38XQe6sx84lxrK5cG0c2tFQVfVgrTKCAW2h0LICsM2Kc02G9PANYjeXoiXgFbHsz6RuQ+14sb11O5PyMc0oeRT0OfjX0+Ompmep2nHC8asoigZDiyiCG9ETG/im3g5o/AkL+XB2sH8ldrkXkjpR6uZD9LuiQ68TTqW+f3iD4CNjsLk6FQpkhoYo27qbe9orw8ncye6YmcTtBQ1XZ2KfQPiptF0p7crFj6kXETk1n2q1xoN1eUnTRTqBpEttMiCzvrTjzZA8EqvQ0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHddObaeeoN2bNGR5b0Tv5G44fNxG+Wc5BUtzR+Jgyo=;
 b=YaeGFxsdDq1BCWZ8qElznhzcxAlci7xxf8kwycf1QopOCa9Ija95V9MzcADlhm3ewGhIMuciF37V1Ka2got0bXIOJb1JWUyCA8JXqjC9ZhUp/FKUPQr40hwwFLGjgm+TFXVVOB3YQrQcK9aB2L3rRfWkBF7kOIG7NhYqwEn7al0QCS9TY8CeywCDUf3I7s/OyVbqmtGSw90o64FguLYgH2sSODf8SXD+QmjZRaebTojbf1+K0n6oCu9GQffKSinj9fSgMT/WROrJc20Y/NEVOiJaSD4WoHh1z69irFYY2nbUCK8FSluxRSj7HohuEKzMdQwQzb3aEnL52AOzL3H8vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHddObaeeoN2bNGR5b0Tv5G44fNxG+Wc5BUtzR+Jgyo=;
 b=NvGTYyo7jigzd2shwSYXFg1R2X9ruqGmt63sr3Czu97XHQdKEOyRAYcnBDU6CH/jyZvZQu37HjbLxVmHRBDwCuasIHuPkWDk2MiPNumjVlwS6xy7Zzg8RNaRMF56WCRf85k4fr+Cmhdzv8zHaZZEw3ZXbdV10OdNiE2j9r0V/ZohPFEv3rrQVg1iAg8ZA8umA5Qg4dNS+rYO/MS/sLdJQwTLNVvxhwqnJWA5ivwCmBw1+4WL8FWOqMdGDV1mEMbEEeNh/BBvIdSb81nurGJ+eLb/DlWfj3SabmbbWKkUhYdbbAs/gCDVN9m6m2gcF6DLU0UUGf7fwJenqlR3QKXQew==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM8PR02MB7942.namprd02.prod.outlook.com (2603:10b6:8:13::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.21; Thu, 3 Nov 2022 18:54:33 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 18:54:33 +0000
Message-ID: <488bedd8-d18a-21a7-62f2-53b7c9e60f79@nutanix.com>
Date: Fri, 4 Nov 2022 00:24:25 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
From: "manish.mishra" <manish.mishra@nutanix.com>
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
 <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com>
In-Reply-To: <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|DM8PR02MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: bea81fc9-c7fb-46f1-1cb4-08dabdccd8e4
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0swsxLEMWACmQ9ktm6zJUP2iJinNCBYlt5g54uEOLx9V8PvdOeMrGOIDbhQGht7/AYo24+Aa/XTlLlIJ1lzfVMfcwJpu3r+EZipryu+UBtMV8pmKikoQnieATnxzyLPAylDHWM2GWnvQFFdrhYt1GkJ5PFlmB13KpRzqN9W7WyA+Yk8lttY+LzjFYpge4sxlFVxDTPb98elfiRp91kbTvzPw8l++2UTlEJDp/37Ujuig1hY33O3/WYi//9cN/FQbT7QC1zUWha3lBAYuMj/rkrC5MCL0DaX6w7lMsTW+MKFvleJkJdG1jzxm+80BGFSfgDkiHi4cLlRzo/w46lVHfCiPGfVC2M+Ty48Eul3ntC6ZyzpFCDjD2A9gc3Q6gNogz6Etr62aoWajglf8tbE8HiJT9uHtVXsS4j4hy1pnm9gX6vPniYuCLuCcNpIvcNVspxyYVk/sgduL+QaPO3DR7W2cqdFB6+fLOYPsmLOlPC3q58lPaPgOXu0C1yxjwDNc7NtqeV42IkGux82IDHRywfgM6sErM8JvBt1txXRK3g4SWa2QAenm0Uae+pxf6o1s5BkCO+DaJzqc06RwXduwHj+gmgFX46IePgiKuGBtad2hFc2YlbAopLtGOwlSN0R+xIjk0hdAckewlNdmfdguqqsFax/dC9zaKepLaqGlUg1Or2j57ML04LcZ70RBEb4iSiaCkGedluoqMI8YPW2WlyiMPaOikBIND8EAAQSdq/rnXknj2Z8Q3peG0FB8lMldd5mshBvGBgrXK8AC0nLLRRUQey/QzYwr/u4vrhqcVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(66899015)(6486002)(66476007)(31686004)(478600001)(316002)(6916009)(6666004)(66556008)(53546011)(2906002)(66946007)(107886003)(5660300002)(31696002)(2616005)(55236004)(8936002)(8676002)(26005)(41300700001)(6512007)(36756003)(4326008)(86362001)(6506007)(38100700002)(83380400001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alNaSzRDN1JqQ0MvY1lkZ1BIa1g5MzNQZ0FBaW12M0t5ZXFyRU1LS0ZVRTcw?=
 =?utf-8?B?ZklxUFNWa05DenpYTU40aTBpOTluNUtYRzNSR1MvdEdoM0prYi90aHJTdDhx?=
 =?utf-8?B?RU53amN3N3dzUExXWjZzaEp4Y2RwdUlrbktXd3VjOFV6T2JPOUF1YzIzMmY4?=
 =?utf-8?B?UWRNL1JxMzNnejRpWFVmS0pUU3UxUWVSWmdJQVhCeDRIcjdjVU9Xb2lZdmlk?=
 =?utf-8?B?bTJVajlGN09GNWozbEtDbWNudDUvU1pwTmNEelhBVmVLWHVTdk5XOHQ1Rktp?=
 =?utf-8?B?Z3NLbVoxL1htVWVJM3lFT0NrS2VJTUJJN29ZMldJa3VsMERTY2VuZHg0VUN1?=
 =?utf-8?B?MGVISHFrUVZ3SWJSMU42bmc5KzdBZkpFWkhHSnpzTFFCL2svcVhVa1QxNEs2?=
 =?utf-8?B?VG5DZW9pU201K2ViVExoaEpTYnpISFRmcXBjU09Db0lWcmdZNUs3MWw5NXlQ?=
 =?utf-8?B?ckhDUWllZXR5RkVGMlYvK1ZGekxnK1FRdDMyL2Zvbis3VzVtMFV5cmFGSE8x?=
 =?utf-8?B?U3RDeUZ0M0Q0VEp1RC9LcERFdGRHdjVJTmR5OVMvRXJMVzhUYWhMZVNRU3ov?=
 =?utf-8?B?UUc5ZWJrUjlUcHBJZXFobXZjT00zMERGam82eEVmbWUzVnNrUTkvNVE3QkpC?=
 =?utf-8?B?M0t1VVI4anRYU2NFR1dkMzdjeTVjZ0cyRUxsSW0zRndFZjZrZFgyeHVBaEEy?=
 =?utf-8?B?QUZYeVlmcjlaOUFGSk04WS8vMGt3N3ljVzllcWM2MWg3alI0Q0lIZ2UwK29n?=
 =?utf-8?B?dWlDbCtvejlkTmJGL3J4bUFQUDhVeTl5ejBYWkxrTFF3N25MdzFLV3A4KzBi?=
 =?utf-8?B?SWxrOVFCWUtLYVIvK0JwRkZLZXFlNVlFSXFaY1lseDJPMm5EMDJ5U3dBaVJk?=
 =?utf-8?B?ZkNPVVRiODdvU3NJVGJOeFdLcUlSWHk0K1ZuSWtNNlNOaWZCclZ2aXJVWCt6?=
 =?utf-8?B?cENDT29rL3N5enplbkRycWwrSnhwWmdZeWU0bEZCRkRUTnRFcDEzTzFEM0lQ?=
 =?utf-8?B?dUFxdVZSbUwxaVhXWnBnS3ZxNGRiVThjVmhCOC9hSnp2a0prZzdrbzhvRGh5?=
 =?utf-8?B?YVFmeTQycmdGc29KRnVRK1gwNUxEUFYvMFk3NjFHczdyV2w2NVNXNWthb3lp?=
 =?utf-8?B?eWE1MTd3dEU1U1o1UGcvMGFoV1UzODVBNkZmU2lycG5LbjU2TlNDVW5QTmNY?=
 =?utf-8?B?U2t5aGNaT3lWdWEyWG9xbWRsc2Vjdm5mNklMT1ZwMDdmUHRjelpxZEtTYnVE?=
 =?utf-8?B?czV1YlFFNjFJVUhSV1J2RGRIc1puTnM3OVp4VWJ0dnNUUVM1NmtVakpWb3FQ?=
 =?utf-8?B?cEk5TDZWMlB5eFc0Q3l6NEl1dFd2a3ExdFhxVnp0SlpnSk5MM1JWSEZnNWJl?=
 =?utf-8?B?ME9WcnR2ekhaZjhvd2M1KzhLY0VFWTRINWUvb2drQWF4Z2d1ZXkyTTFXNS9r?=
 =?utf-8?B?STNtSWxvdUxDSFk4M3hBOXVhenJRSXV6SDNwYlhsNlZvNS8vSmxGQmpJQmpm?=
 =?utf-8?B?bWo2RnV4YTJxZTQzT2tKV2lZS3BFVEFpTXJGOXZleXVKNnZCWUxBbFlndmdr?=
 =?utf-8?B?NEVsK2I2VWhSSjlCOG5Ua3RHeGpXNFhHSlJtRWJQT1RnVG0yblpRSHZzQURT?=
 =?utf-8?B?RHFqNmgxRVQxR0hBQjNDUVRmZitvMnlna3VnYkM0UzZDKzFYT3Q3Nk9hZWVC?=
 =?utf-8?B?aFdrY1BiSUZJUkJBT2RicWFPM3JwTnd4bGoxT04yV21QdmRpSWxyWExIRmlx?=
 =?utf-8?B?SzdBZC9YVHNMS2RRTUxQd3M4dzREWm10ekxLU0pVNjRhUjFYNFVKMExiaTJU?=
 =?utf-8?B?bSt3RTNEZUZDbFRMRGp5ZWdhMXBxdVhBc1MzY1d3R01tUDNmWGdFQVdxZStt?=
 =?utf-8?B?b2VOSkFpbURtY2lnT0ZTNitIQ0pYbzVwdTVQZ0kycEZqR1NqMitLWjF4R0Z3?=
 =?utf-8?B?VnpPYjhJSFdSOFJITDdpSzBjS1BETU91SEhSV2FTQzJjKzdvV1hlRDNhenA3?=
 =?utf-8?B?RlhQcWZBTWViSGlMNTlyZVdQQ2N5N3JpVFhDMzFaMitjRThobnhxOEpBY1FM?=
 =?utf-8?B?TTFVRFRQRzJCT0NSc0l0OEtJRHNRcUtSZnpialBXKzRTcm9vNC9LOXRMRkto?=
 =?utf-8?B?S2MyZHJ4ajBaajJlZ0grbnhIUy9qQTkybENyODdSV1Q1WlFHTlRkTDNtaU9Z?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea81fc9-c7fb-46f1-1cb4-08dabdccd8e4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:54:33.7573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ly69M0zlHpL8ed+l/x+XFK0wCbcm0srVAvaOWCtoCB6rgSl9z4lvRzaeVqEmfWRb+mMIzh/xWlQI269MU+aFL7031TXnAbWgEFXuFiIcnRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7942
X-Proofpoint-ORIG-GUID: ANFWUB3vREjCsIRIF8CQksHmeMgbSLAa
X-Proofpoint-GUID: ANFWUB3vREjCsIRIF8CQksHmeMgbSLAa
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

>
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

