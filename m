Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA81636549
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:05:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsF5-0002zb-PJ; Wed, 23 Nov 2022 11:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxsF2-0002z0-Fe
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:04:52 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxsEz-0001Hw-Ni
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:04:52 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANEAJxP000589; Wed, 23 Nov 2022 08:04:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=hQlOzZuCL1IUMc0q2eebZUqsBl/oIalXGId6Hn9uHbU=;
 b=RthDF5ECuJ3hjT5hGKeIvVuhl3SdvEGiH5Nz9FatFPgMOXhDMgiJUs70ZJPZ5VI0IKxo
 fedwGYdHJQ2mkP5HNaRUalKR7mEl24nKwf3zmSp8K31ULZWZxHXtfZTBtT4VYtvtsJ/a
 5O9GF/EHfxIJKDoZFuN2Q+05nG3nh3x+U36Qn0Z7yuSLiEKVF/OIaqck2m2tvKW6TfkS
 +WHfITOP7zRGbr9L11BiKmBBSIZ1FFT56HE4kx7tN4SkD/74lFBqSq/nF3O3qqqc3HMw
 uKqf6yj4jsLAFIkhiTqWIjZl0Lvvcj9YOeHcy1YKoBTJ0UVbh7eyKeNg5iTjKKC5x7Xi Fg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxwje2y3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 08:04:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIUUdJt69h6Oo8eZ8r/b4ZOhgYbhrCeauZKcabY1DV7zRiSp7LnPllSBSR3E3S0UJnerxDMmY8CMqwNyVX3EynUATBeDRgELAYlxInSg/6nIqN5y0lhWwnv1tf1rV2QNSOZNV95lsmNu8wSAfKw85V6RaN/ud5N9n5WN3xqTLLWgOYgIVlN0wam6R/8UVC3H0T04azC7Ii+OaJSq1uhVROIx8zumAsmoOwXTjiPI+4YBSEbxOwD3Zk+iex+aXWJxnQklDX1IM3ArfDXmDqb9qxT5SevrmI3Lq9xPpjox2VGFHuvajBsL256sBFCxct8zv5XKUOx5f/paQkzVTsyWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQlOzZuCL1IUMc0q2eebZUqsBl/oIalXGId6Hn9uHbU=;
 b=Wuur/IjAJ1I3QfRA+ponvs1JzmxFKM2NFIl7hgtNliD63JWXdQCbXVl7rbHe2rP+aUM6Y9ibm9M2wqD8NXFpHOcNZVUMrbkoSGfWcXuz3faM1jTTHh9UYRlHorqKAH7sjhUlzsxQsMhLzQjGgR1XGexbtKTz/VvIRIZUxz8LMbCGQ2T82D+o11JHkxR7utrmVwMjdCDFXbYHDQcjEPVVr8+kVWp5PO2u9OZJ2YO3jeI7Ub3cl8GLawpFl/BJEoUxEL/ZRYv45JQRlGLiYPaR5lZTp304aQfL1W8Eg9SQBgiryPdZ3SSi0ZdmRvorIkDFis9FiXCdFMPd2gEHRrtAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQlOzZuCL1IUMc0q2eebZUqsBl/oIalXGId6Hn9uHbU=;
 b=dLN6/Xlu4tl9nqu7mPcASMvjycqVKJ36TyW7u/VHTepT0ZquPPleka4kj2wm87f6SnAXyLCTWEj+3WrEvFV63h9HzZX3X0UvC/xKUEKSHE7kROVGBFonAnJpkwSIY3PSw+GROWjOgOuOI1k40pQyKfrGUJm1eXSR6/A4DOSDcacy4eJraTutoDRLhLnO0qvWrzpda4nXqoOet7gstsiA34RCw4oGh/rLvI1y1rjZMmw9Rp/Ck7JCCFuEvXSU4f9DlCItolLgQYw7F31XrWVTmrpijZOlhZ8CsDEafjZmnBcxXmDOvpywA3YfFPiu+/jUAH8Qy6EyX/e2vOn5YwVeTA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SA0PR02MB7210.namprd02.prod.outlook.com (2603:10b6:806:ea::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 23 Nov
 2022 16:04:43 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 16:04:43 +0000
Message-ID: <9cdace7b-7fd2-7c9a-01a2-14bef1473136@nutanix.com>
Date: Wed, 23 Nov 2022 21:34:35 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/2] migration: check magic value for deciding the
 mapping of channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221123150527.24608-1-manish.mishra@nutanix.com>
 <20221123150527.24608-3-manish.mishra@nutanix.com>
 <Y35DOkfHr2+2PwSe@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y35DOkfHr2+2PwSe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SA0PR02MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ea4ae0-b60c-43e0-9081-08dacd6c6f3b
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WebvD0+gbYtPf5VMhY52AxjaaP2oiCgdd0rEiOUoiLsSZmjQS2WtTLIglCu+W4dThEtBfrWH6g/Dz7JkF6b6bmRH54r0zE0oNWgcKc+e+0+DZNPTA8Na7scVBGNmDxLdA7UoUHINlRtXXcU0pGJSy/la3agX+9U3KsuplG6XSNZ7Nn6FAULNAsAPpL/3e9oQeyocuteuj7tGJkMvdQyvShArxi2jlVhFqNYHGuP+cDkBN4QvJ7vL50rEZIrR8SPT7hiz78FxkRWpfj2Akxch/RH+3pOAGompF56AkaNitWVpfUc6ORLlub9rKcx4Gc/MafUyh4da20YNL2qxLCkt3CfHpaZ74cYDEz5yt/yvSHQ8tTPOF2Rq60mD20ZpGr+LcmsGIiHkdxbeLJeasgVpz70B6DGlwMExWwGNYByAtJqcDU0XWajrVFceUGIG/Jm8gRVFtUxDtRXt/fZXfwfA/S8FWPsdsZmidIWsyXiuzDXVB9TMetPOFLD+NAN+NkMBGWO0jrF9djLWQyLkO5qzHl2x1+guDvbQNJZ8Be4ktoTUmUc/AKw7PN8S2Svn2yYCcIXWlrfe859K1OeLhQ6GQ1HhGAOTcSI3CE09FQat5OlLXDDzI8Hjy+B0SJP9TQEuXbgqukFaNBNjpzfXQj563NG3indqcFGsAWqxEjv1KaJRHfWC5jJ/VyYFClTuwFDOYk+FUecDcLPvFg8SpQge08/PkAuDiJw2w+M310UduZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(6666004)(6486002)(478600001)(6916009)(38100700002)(2616005)(186003)(31696002)(6506007)(53546011)(86362001)(26005)(36756003)(83380400001)(6512007)(66899015)(5660300002)(2906002)(31686004)(4326008)(8676002)(66556008)(66476007)(66946007)(316002)(41300700001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXEwQ0Z4aVNIaUlvRm5HZUtzQ0Q5bksvUzl6dVMyMTdpMlIzS3lkbVozYlRG?=
 =?utf-8?B?Um9TOExYRTdPUW1sWkZWbVJHbG9WSFJJWURBdEY0a3l3bXFsU2lxa1ZhdWkz?=
 =?utf-8?B?Q2tGakFObmh5ZHZmTVJhRmFzMElTekx0aCtTR3dUY3B3ekN0dHB4OXorK3ZP?=
 =?utf-8?B?c2QrMHNzMVhka0lscEJEdHNwVkxrTTNva210TCsyZ01Bb2NuRE51TWh3MHZT?=
 =?utf-8?B?eHBBR1YxS3Q3WFBmdFlBRE1vQ002ZDVsT2dGVGhCUnJ4SU4rR2ZreUdKRG50?=
 =?utf-8?B?UTlEUzRQcFNEQld5WU94a2wwWmpzUHk0ai9FNmFCWlV2TTl2bVhSTDZ1UEhT?=
 =?utf-8?B?OFQ5Ry9Rb1VNY1ArbkNMd05yV2twV0tJcmxEUWZSdm1EMW16RGtBRGJLRUhM?=
 =?utf-8?B?RkxacTEreTByeWxSYzlEWUR4cVI1TEZRN2kyZzBOd3lPdHpReW5YVktCcHE5?=
 =?utf-8?B?dS9kdS9YTkY2bklMVzdkNUswb0U5aW0wZ29Ea2lLQnV4dXl4V3RlemgrbmhY?=
 =?utf-8?B?dGZZOGFhcFhRNkxtNzlBZ1hEcEZmU29nRlBxSXIyVXFhT0dtbWNGNk1WRStr?=
 =?utf-8?B?V3BhT3d5V2laL3hSbVltOEZTZG5BSHZ5dHhXd1dORzRwM3lyYVJnMkpWL1VU?=
 =?utf-8?B?RjhDSjRKbFBrWWxXMjBoMzdmbnhoNGNLNm9zNTNhUU9hUHRjYlc2QSt1cm44?=
 =?utf-8?B?TlVnaTBoTSt0cnI2UUJWZWppMnJyVmsrZkJ0VUpPNmJXV01YT1BRODFTUksw?=
 =?utf-8?B?MnRhblBsd1JzNFZVN3plT2F0NVFWVE8wajF4NXdRVkRQd3BNbitZeTFlK2tp?=
 =?utf-8?B?TUlDTmFIdE5pR0VJclhhWWZPSllEQVpPVWVFamR1UXNYbmcvNTdyV1NCUzBs?=
 =?utf-8?B?TGQxY3pvMytVNlpaNWM2MjJJcXY5S1Z5VXBUd2RybE50V3NRUzdScUR4NmlO?=
 =?utf-8?B?ZXlEV1N1SCtmWEZCL2tlWDdGTTJHdXMyNXpmb29JWTN4aEdGYlVvZlFJU2kr?=
 =?utf-8?B?RjFaWGk0ak14VWlWNTVXdktEa2lmWlpRbUZlRWpaYW1Yd2w0SFI0ZDByK3RS?=
 =?utf-8?B?S1NIMXRhMFhmMlhBVHlDVlBOd2NERko4TzRBMzNQK1BITUF4a04xVmRpT1hJ?=
 =?utf-8?B?SlNRRzFycjVXNFhZWVo5YTViM3RkeFEzV0NmcFRxVnV5cEpJS3ZFQmQwMWVO?=
 =?utf-8?B?SU1QTm9YcTYxTjRhOVlCcC9zTm9laG5ubEF1TDJBR3M1NVpUNmF6RFB5OTRS?=
 =?utf-8?B?VDBxY0gyWUdaNGtJL0hnOUtVcHJVeHQ2d0JvWER2VzZZQkpLeWQ4VlhUSHdy?=
 =?utf-8?B?VDFUdVVpbGUxZ3VralRiV2NqMVkwWHhUNjRJaVVZQ3dhZDY2SlV1cElYNTZW?=
 =?utf-8?B?UVBrTk96NnE2VDhIeDl1NHk2ZEI3NElzRW90d0ZYVlhqYzBvQ0lHQXJDaklD?=
 =?utf-8?B?NWI0dWM5UWpHZ0c5dkZyVXJCamdLa0J3QSs1d3FWazFaUmJkbTY4NEdmRFB5?=
 =?utf-8?B?eFdDeXo4dE5aRlN4UWQvUks0WXRkS01KaHZoVExBVll5ZUpaRFlvUnZrZVdx?=
 =?utf-8?B?blJLNG50WnRURE02aUZvNWlqZkdMV2cvSWY3VG1Jb0F5NG1rNW1taXQway9Z?=
 =?utf-8?B?NjlpOC8yZGM1ZkcyZU9SWW1KdlpyVWlJUzVvTXR2clBhR1Z3dFdrQVlEUDhK?=
 =?utf-8?B?TkhTYW5FVVFpRlFMYUxodHlBMHVzZXM4aFk4NW1Db0dZb1EyUCtraWJUSDdW?=
 =?utf-8?B?eFBIMFVGQ05VRHRUc3ZDTUxza0lrQ0lqUmY3QzFUZ1hpemRMOTIzb25idWt6?=
 =?utf-8?B?M1NpYzBzRXBKTDc4OTFqSUt2ajZtWmo3NGRBUk54Mzc4M1NYL1BqNUovS0Fr?=
 =?utf-8?B?V2kwV3ByZlFzMzlxVUk3ODZSUzJTQWNHMmZQSDNrNzd6UXl2eUowRVZPeDVH?=
 =?utf-8?B?TzRENFY0UFBxK2ZEL1ZkaGQ5dUloekJtV1RSM3pLeXNFN0ZmUEhqakd0M1dh?=
 =?utf-8?B?MW4wZHZ0WXNTdE8yY1ErdmVjeHoxMHVuTTdEVkhuL3JIZ2tjMFlubkxqYVFt?=
 =?utf-8?B?aUlpR2hkOXBHZ2p5cXlxRWpFeERoZDl2ZUJZMEZLcUNLN1dNSHcrbERLcVI0?=
 =?utf-8?B?R1dYRFdTUFlaUkVkcU14MkI2aXJaSnptaExQOFh0Smx0RXE1M25Ieit6Sk1N?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ea4ae0-b60c-43e0-9081-08dacd6c6f3b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 16:04:43.3932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv35WRqJNI1LOpG4LH4fF9p/q+CkEOcfa0jNd5MH8DcFGPAwGbxuxUe9pyfUwCuUnBd5xR000aPjKHaTvKZH+w4r/bpMupMpx2quUhVcKBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7210
X-Proofpoint-GUID: 0VEJrS8ED0W-D0bd24OkHFN3GXR3OsDS
X-Proofpoint-ORIG-GUID: 0VEJrS8ED0W-D0bd24OkHFN3GXR3OsDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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


On 23/11/22 9:28 pm, Daniel P. Berrangé wrote:
> On Wed, Nov 23, 2022 at 03:05:27PM +0000, manish.mishra wrote:
>> Current logic assumes that channel connections on the destination side are
>> always established in the same order as the source and the first one will
>> always be the main channel followed by the multifid or post-copy
>> preemption channel. This may not be always true, as even if a channel has a
>> connection established on the source side it can be in the pending state on
>> the destination side and a newer connection can be established first.
>> Basically causing out of order mapping of channels on the destination side.
>> Currently, all channels except post-copy preempt send a magic number, this
>> patch uses that magic number to decide the type of channel. This logic is
>> applicable only for precopy(multifd) live migration, as mentioned, the
>> post-copy preempt channel does not send any magic number. Also, tls live
>> migrations already does tls handshake before creating other channels, so
>> this issue is not possible with tls, hence this logic is avoided for tls
>> live migrations. This patch uses read peek to check the magic number of
>> channels so that current data/control stream management remains
>> un-effected.
>>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>> ---
>>   migration/channel.c      | 46 ++++++++++++++++++++++++++++++++++++++++
>>   migration/channel.h      |  5 +++++
>>   migration/migration.c    | 45 ++++++++++++++++++++++++++++-----------
>>   migration/multifd.c      | 12 ++++-------
>>   migration/multifd.h      |  2 +-
>>   migration/postcopy-ram.c |  5 +----
>>   migration/postcopy-ram.h |  2 +-
>>   7 files changed, 91 insertions(+), 26 deletions(-)
>>
>> diff --git a/migration/channel.c b/migration/channel.c
>> index 1b0815039f..a4600f52c5 100644
>> --- a/migration/channel.c
>> +++ b/migration/channel.c
>> @@ -92,3 +92,49 @@ void migration_channel_connect(MigrationState *s,
>>       migrate_fd_connect(s, error);
>>       error_free(error);
>>   }
>> +
>> +
>> +/**
>> + * @migration_channel_read_peek - Read from the peek of migration channel,
>> + *    without actually removing it from channel buffer.
>> + *
>> + * @ioc: the channel object
>> + * @buf: the memory region to read data into
>> + * @buflen: the number of bytes to read in @buf
>> + * @errp: pointer to a NULL-initialized error object
>> + *
>> + * Returns 0 if successful, returns -1 and sets @errp if fails.
>> + */
>> +int migration_channel_read_peek(QIOChannel *ioc,
>> +                                const char *buf,
>> +                                const size_t buflen,
>> +                                Error **errp)
>> +{
>> +   ssize_t len = 0;
>> +   struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
>> +
>> +   while (len < buflen) {
>> +       len = qio_channel_readv_full(ioc, &iov, 1, NULL,
>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>> +
>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
>> +            if (qemu_in_coroutine()) {
>> +                /* 1ms sleep. */
>> +                qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
>> +            } else {
>> +                qio_channel_wait(ioc, G_IO_IN);
>> +            }
>> +            continue;
>> +       }
>> +       if (len == 0) {
>> +           error_setg(errp,
>> +                      "Unexpected end-of-file on channel");
>> +           return -1;
>> +       }
>> +       if (len < 0) {
>> +           return -1;
>> +       }
>> +   }
> This busy waits when len > 0 and < buflen
>
>
> With regards,
> Daniel

Sorry,   Daniel, may be i misunderstood something from earlier discussions. I thought we discussed we may not prevent it from looping multiple times but we can  qemu_co_sleep_ns after every retry to deal with busy wait?

Thanks

Manish Mishra



