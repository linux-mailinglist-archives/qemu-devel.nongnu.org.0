Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997B5EEA1D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 01:31:01 +0200 (CEST)
Received: from localhost ([::1]:52184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odgW3-0006Qe-Lz
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 19:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1odgUP-0004ss-W6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 19:29:18 -0400
Received: from mga07.intel.com ([134.134.136.100]:62500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1odgUN-00026T-91
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 19:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664407754; x=1695943754;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/fZ35QCInDeUBrihg2yR6IXI7OqsvGSfauZ34ZB4Xmg=;
 b=VADF1ziw1ZXk4CdYGJX1I+9ymMevPvAaOR0SEtl5c1mePg5iOZIIziIu
 puigiIsbWRvNlZSnOuMJapUFsxqlWvruCvYw/R6GuLxstkiKFaHAHs3oD
 2CRzUNVFqiUTe8yPKdes4lHrExCbLW6CT2/6CAFP/EHOBFh+5u1bdkw0t
 jtBgXOAM331+ASKAL1MeYBUNv4Cg4pf8joSEDvpIhtNmVfKF6PpSqgF56
 GtuRqCBpaWakJX2uUsLg++RoF7NPeCu7duyupgzoFQrAjSVDFEi/1U//4
 GeDjTz90RaYcSk8W9jge+j1kcIae387t2FQZ38tyMhRpeC0XvCgFQ0ynT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="365791351"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="365791351"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 16:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="711156867"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="711156867"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2022 16:29:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 16:29:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 16:29:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 16:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbY4O1jtUu3hXOkcPE5+uZSy0vsc+AF4Bnhybhz8h5fY3cOPF/prb6grf3tvPOiSjW/69rjR9o3DOVyG+qOnHh83XnP+VdpgqYCjdqxoYEYHJxIlJiW+7fjnuMaiXrYD3jcm2dO+9JbDO4VZ+insXUGGA4TcGtI0vshNVatoKvhhVwbtEBnn44npQRSjYrQeztEDFkLhW66JO4ATjHCX5/E/XIy9F8sh3k9vqP1yOknV13C5Cq1h0+MYhIuiOmgFl/31jOt8NmICQwLjxM8UXYXBsnLEd9MpIp/5wHvV0b5nbuUl0PW61fT5wQURTqZ9Ym/TRz1NGpNmwaRXsG7Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWGf+ShfeW0Fda2WGfOHoOYeMEWUWOQ/u9PVRBYlQ1s=;
 b=T/lc1vxnDp/DAdOpBOYA9C/1pKkAQeZysi8EJL0Or+sULNap3k+Kom8xEbQrOuDoD0gN+NRLe0W1wcOUkNYCrgrHaSmer0ExfyHK99rHb3iT5zA9kgqldum+WGBcpKxyYDMw+aJsgNBTEhIiQ3kEFiv7Zhb/gpRvEimYpM7p9YCl7WsFDvWJo4Ow9AKAWVrjzAPL+Jq+JYsScZ2r/U+Wc4MyzFrlY0czJ0efIVEbd2QZodQi8pUUOagzJ2h5pqPnYRujXYHXP+Zxf0Uwj498gAZZdpmCcDgzIX4uGJQwepOVZcQtyvNZIrvCEomlF8JzwLNyNzGb9g1i7fcaZsAYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1261.namprd11.prod.outlook.com (2603:10b6:300:28::13)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Wed, 28 Sep
 2022 23:29:06 +0000
Received: from MWHPR11MB1261.namprd11.prod.outlook.com
 ([fe80::5074:3120:98c6:c1db]) by MWHPR11MB1261.namprd11.prod.outlook.com
 ([fe80::5074:3120:98c6:c1db%12]) with mapi id 15.20.5676.017; Wed, 28 Sep
 2022 23:29:06 +0000
Message-ID: <c18c0afd-9902-cf28-9249-b5df61deda96@intel.com>
Date: Wed, 28 Sep 2022 16:29:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 0/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to Guests' windows
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
 <87a66uhytr.fsf@pond.sub.org>
 <IA0PR11MB718538F0549024D9D66C2410F84C9@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pmfpfei8.fsf@pond.sub.org>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <87pmfpfei8.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To MWHPR11MB1261.namprd11.prod.outlook.com
 (2603:10b6:300:28::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1261:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aed6467-8e59-498e-a8ee-08daa1a93c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T55x3PnKE64+absa9qQidwiDNWd+UyMPnSROsCYQty7XH5ImyE/HUZ4HThtqgyBI63v6l/EUqCnOKy83glZLnpaiPB06k3BMJRThg+uQFdNdBYtIoaGoQYBt5XnU27nibc9xtbw7R/jUS2YYzW0+aM9dB5wVG9iVeTz99eMiATc7+V8UC39SWY8h/NwgtkwgGFgcSWJVR1r1Dv60ZjbTbyb5DHV25vYXNS34poOjDXKeaGCi3IJN55b45DsVFniFXUKl1bdego+VqIvzQpjRMIvMHKfTgK6dh6QZrN6x1PHgJD53LaJvqxWhxTwNW/u3dZ4KXyK3J4UaKjnhMw1KP9uWvsqQuSgRVpoZjTWCQS/cVXldeTNAKXkrJ/quEDxQE7FBA00mLlDThMMRCtBDD3aeNaI5enANk1mlGvwL5HvLocrX70wSZ0kwmWF8mhcwvlwpzWq7L7WkpHRxt5Q6+O9e/O4zw82Wn1gGhk1ubDsfu3Y1Gi1uSOUUtaA75V+gqgAHsRlsTTYPHm4tLzM4TWruQfbpYndyyYFyGJk31HT9bpPd6nHpUOlET9JdhJEcgWlbVhofjt7PR1xyW94/s2eVw49JyapfdVIiQmsJjtY7E6Mto/Se7EYHbDJXRnauu1jqIn/dBS2LnukwAmnO1VSXtnm1ST5Lqe4OWHswUzeu2/azm/tT8GKjDaIAeBWdmmbvuWl4+cjCYhBqOlHoyWuPcsBI/HTWv9uxbO1gc3sALA95c0KoSQPt29ZdnVsgRmcD7WEL4juqm/PUs6PC+fc9K0iorfYyAZaogF/R4MYfS1IMTX7nPa+MNxutTn277w5A7BdVHQ5+9nLZQlJwjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1261.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(6506007)(6486002)(53546011)(478600001)(83380400001)(41300700001)(966005)(6666004)(186003)(6512007)(2616005)(5660300002)(26005)(66556008)(110136005)(4326008)(2906002)(8936002)(6636002)(66946007)(66476007)(316002)(8676002)(54906003)(86362001)(38100700002)(82960400001)(31696002)(66899015)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29rQWVwSUtmaisrYlk1QUZjU1Jvdm1vbTA2U2hkOEgwdWMvUFlYSTRzK1pr?=
 =?utf-8?B?QXVvYnBxQ2VYRldieGZYdnRWOUZaWHYvVlRMc0xsRmo1clUvajJ0QmoySjFY?=
 =?utf-8?B?UDhVV3RtZHRqZDVYOEJuZ1VSZnVBUk8vS2UwREZ2U1UvaThxMTVjL2QwNUx3?=
 =?utf-8?B?Nmd3RGJmL2l4VGNpY2RBSUZQRmhhc3RIMmRQcmc5Ri9Yay9NeTJaeU9OTUFt?=
 =?utf-8?B?YjZNZHIrMGZ4WEZZRlBJSHVvTWR4bHMzak9KM0ZucExzUFZLdVBFUU0rYTJD?=
 =?utf-8?B?SHNZOGUwa0tpc053dldyUGpJK0xPUGdsY3hSQVlYT0RLWFE3VlRNbG5yNlM0?=
 =?utf-8?B?Z3F6eG9SYURVd0M4N2tCL204YVhjUi90UlZ1d2J0Q1VEYm5jWkY2T1ZvaHhj?=
 =?utf-8?B?ZkU2SWMrQ002QWx2Tm4vaWpzdFhxazdzdXVlZDdqVmRaMXc1SVB5V0oxRmhK?=
 =?utf-8?B?VTB1dCtRUzFOMDFkenRjS2tqeXVLMEdqMlpZUjNuWTFydVlka2wxYmFOVG1F?=
 =?utf-8?B?K21KSitKWlo3VUkrbnNRUHBnL1Evd2VFT3NiWXB2UGhqSDhqdXJDZUNJTkdO?=
 =?utf-8?B?a0NRRGtBTGdLTmhkRURSRG04MWJiYXdzMFZuMkl6TTZ0V05FTnd4YnlqdVBB?=
 =?utf-8?B?S2lnNWJ6Mm45dmlRekFZZzBsTzJvS05yODN5SWFLSS91NURQanlTc1dicFpU?=
 =?utf-8?B?TnNDd3BURXdvK2NiUzFRZnZ4b25lRGFQOHo5QStOT3BjUmkxU29tajNtS01U?=
 =?utf-8?B?WUFJQVVZUlNVc0JiTXBjdkhvYVd4S1JhV1ZJM2tDaWpFbkpza2c0VllkU25L?=
 =?utf-8?B?OXRoVTM0dEdYc3BTUlhaVnB5WHZuMG50b0thZ3RmZUpCbjhqUnBPN0t1cVlZ?=
 =?utf-8?B?bWdLME14MjJmYm5ZZ09BTlMwdXplKzJYaHVOZzErOTlydXlDSVhBR3hFaXVV?=
 =?utf-8?B?d0Q3Y3ZuWmZkVkl6ekFwSk9QTk5HWHVRZU1ha0hXMkQwa1pjWXVyMXRqSmtW?=
 =?utf-8?B?RnF3THhOeXdmZXpiL2lxWXZzUU9GYjRFc0xWRUZDYWZ5SHBmTUVsaEhZRVd1?=
 =?utf-8?B?M25GOENqYTlVQ1FMVDQ5cmNPV3ZPekJocnY0eitjZG5LY2NZbnpqZ2kvMndp?=
 =?utf-8?B?T2xERHk2K254aDY3T2lzVXM4WXBQVEJzdmNYYTEyTGtZSE12VmUvNnRKYlNE?=
 =?utf-8?B?R1ZpeHpNcUtFTkNqd2ovdGFBOFovVnR5cjhSbHhPNitiTVZYa1AzMDBCbU81?=
 =?utf-8?B?alFLaTQrM0tlS0gxWHpuYTFodzVKWXJxMy9OdTFiUDlGV09wR20remVHV1U5?=
 =?utf-8?B?SWxQTzBRTmVsRytZQVJHUENMTlFxbk9NN1pGQ29xRitHTTdkZ0hYSTRFUjV2?=
 =?utf-8?B?T0xXUGF3cGZ5ZEtrNE5yTW1MUmZOS3Y0RFk2OU5EUGNBdXZCMW5XWTVNUHJV?=
 =?utf-8?B?bmZJRmgyZndyWVJGbFgrNlpZZkcvVktGODFQVGNsZlVTb1NHVjFCVHRMRi9r?=
 =?utf-8?B?Q2pvQytkUml4bUYxMndGSzlkVnFXWHNaSCs4YXJtb2w2cXVabTlFWHY5dGlu?=
 =?utf-8?B?dEFGZFpzNTFRaXcvVEJYdmUxOEtBYWRrZHRXSHo5N3FLcklPUjlFY1A1Wnk5?=
 =?utf-8?B?eEpUN2JGYkM5ajlzQ3dIYjhwK3NHRmMvOHRjdGJIVEtKQUx6bytmaCtBWlFk?=
 =?utf-8?B?Q2VpSE5zbEIxK095UEFEaXlqYm9wRS95WnRRaEZjMzZubndyMTVnQ3NmcTRR?=
 =?utf-8?B?NllLaElYSkFtZTFmUkx4czNMYlNxaEFSbWtOMW1vc1dseUVjZGZlaGNXcENl?=
 =?utf-8?B?Rm5Jbi92WWVlVDMxcEJwMFJSMXpNUGZJcStWTlJiWE41OXdVeFF5Q0dCWFNj?=
 =?utf-8?B?K2tuaVIwS2w4cUFibXJLdmRacWduczJNRENnNmcyK2dQbVBua0Q3QW9Db1Bt?=
 =?utf-8?B?QjArRzFuNVRWTUVqQmNhalBieW1YUXV5aGU5L3hISTNNUDhBeTliRGRNR2Fv?=
 =?utf-8?B?YUh4OGlnWFUvRFNybU1ta1UxMm9kb0xRT3plS1pUVnNmZFY3NDdYSHI1Yjhv?=
 =?utf-8?B?eUI2c0RreG54aFg5WmlzUUt5cnhzVDlBNVVUcEdoZmkvVzRhUDlHZVB3VTlB?=
 =?utf-8?Q?4kJR/kXt+qqi+4+lrWiUR0y2h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aed6467-8e59-498e-a8ee-08daa1a93c31
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1261.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 23:29:06.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3LTMefog5c44eGiDLL0wbwA5G+UW1x7HLiilwRRJ+5FZUq8Gxn32/CsBirlL3Q0bvhVZDfuAPADYeAURXNe7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=dongwon.kim@intel.com; helo=mga07.intel.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

Vivek and I have discussed this already. I am fine with replacing my old 
series with this.

Thanks,

DW

On 9/20/2022 11:06 PM, Markus Armbruster wrote:
> "Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:
>
>> Hi Markus,
>>
>>> Any overlap with Dongwon Kim's "[PATCH v5 0/2] handling guest multiple
>>> displays"?
>> [Kasireddy, Vivek] Yes, there is some overlap but as I mentioned in the cover letter,
>> this series is intended to replace Dongwon's series dealing with multiple displays.
> I have no idea how I missed that part of your cover letter %-}
>
> Dongwon Kim, would this series work for you?
>
>>> Message-Id: <20220718233009.18780-1-dongwon.kim@intel.com>
>>> https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03212.html
>> [Kasireddy, Vivek] We felt that using monitor numbers for display/VC assignment
>> would be cumbersome for users. And, given that his series does not take into account
>> monitor unplug/hotplug events, it's effectiveness would be limited compared to
>> this one.
> Thanks!
>

