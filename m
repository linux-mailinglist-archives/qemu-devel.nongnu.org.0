Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD13EAF89
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 07:15:17 +0200 (CEST)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEPXI-0007ZS-Av
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 01:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>) id 1mEPWG-0006qg-IX
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 01:14:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:10354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>) id 1mEPWC-0001kV-PZ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 01:14:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="276536030"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="276536030"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 22:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="517886588"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2021 22:14:03 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 12 Aug 2021 22:14:02 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 12 Aug 2021 22:14:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 12 Aug 2021 22:14:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 12 Aug 2021 22:14:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xp0YXE1/2ZU3QHuufh5TuqFYCdkZdDLpmPtQrpAOy1lwOMzU6d4Lp3EXCAuvMlc0LZ6EmaPZRK6runjA13p+/EipncKJnkxhV+2JIA7IcsH4Z8KqG0W/udO6jDRbsFBoqBpRH9I5w+PKMhdBViYZIRcMf36CQSAiV4zssr3qVRlaNVIsu8GC/9g9//T0WZKzz3ScJXWT52XKenWfRSCQu70d8chp3SrxXULA+ajMpnd4IW4MOPrSF5TjUxUUiS0nWdhGJEUPhMzHFhgahYDecZzucKJYh9eVnUACYBHK759JW2NOcdlUfSga4Tjz04IrEw4QFI7V3XAUbqpU5IAhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVbooR+Fv7gkq8nMPxS9VO87n+Jj4JNYy1HSYaWivOY=;
 b=HWqM08DzFSNasF1N66+G8JFZq80hbH4k14nkW6pFR2eIR32cXKGncjosxS8gUzBJHQuL0y+EMTc0RCV6iRRzC8FIat7FPUx+LkzjZuDUzEbeFZcSY8d/UPzyeK0gx6/uhDcCtb6spDHIzG9nkJnKMW2XHeLA7TPv4/UNBbwaiX9EKTPLfEftruOoB42n2mpBxjQNd0KBcklW0wQo3K3HFpDdkrQ3KjvL5xLsiaGaW7oLeDF3VmlQA39JmKNThsyXHSN71cdAuBHbH23Fwf/+kVZbdgjvuZPPwa70EKa/JNYLrHF6DWucAPpibI6N1I0ZEdyOe1qRwTz1PvCBgXOjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVbooR+Fv7gkq8nMPxS9VO87n+Jj4JNYy1HSYaWivOY=;
 b=wa6Wm78+jRE06QL2NjRvpYCCWeUcbUGm2ryrZE+6Zi1siDgBvYuzVOsCG0ci9N2cgE9+7zvGGfEETX7dmoxqhdZg1D9w66zY40udAAFj/pf/Oo0fH5qkkxHsjoLu1PIEqIRgb6pEfDr1YWuyyliAUHz3owVbeFm47qBnEnNf5hk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 13 Aug
 2021 05:13:55 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e8cb:c28c:b1ea:13e4]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e8cb:c28c:b1ea:13e4%9]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 05:13:55 +0000
Subject: Re: [PATCH] net/colo: check vnet_hdr_support flag when using
 virtio-net
To: "jasowang@redhat.com" <jasowang@redhat.com>
References: <20210806060837.62774-1-tao3.xu@intel.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <ea2af5fa-6122-d772-9ee0-ee97c3253cdf@intel.com>
Date: Fri, 13 Aug 2021 13:13:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210806060837.62774-1-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::32) To PH0PR11MB5579.namprd11.prod.outlook.com
 (2603:10b6:510:e6::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.238.4.175] (192.198.142.12) by
 HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.2 via Frontend Transport; Fri, 13 Aug 2021 05:13:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 741a0fc6-79c1-4f8d-f6a3-08d95e192607
X-MS-TrafficTypeDiagnostic: PH0PR11MB5641:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5641D3C8450A94023C487101A5FA9@PH0PR11MB5641.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RfgpgappjTSs4+IlabmaMq46ug0d+mx027F48qY5WPpgWHTXF0PEvjN5Htbbr2f43Acj3thyOXCADkNCyFwaf/k3Dhu619nWF3sh14VYXBrQJKQ71SYbon7qF0xG/7QDfn5Yh/39NLuK8g9MLOCJO8KqyEBahoLT1kzLPHw9SJcRtL9XhrVxR2d5g0PJsvZ6mequQBOrOTZ8c4bDeGM4u68v4eMMejlK6vAne4bWVb6128JyR29oJCQCv+UC0GsdnEMK4CkFLJ18kHnIQfk37SzrKveVLAHhiY+EidrxMQ63bBwLbgOLqu2diaO2FzFLbhGXixBa7FNw4gbJ42YBCqoWNW664LOvtvntaxakEpsnbAq1dSKYCBkCyLip16VXMa7/RjJzJFCmFE9/BnUwZk9KFtG72T7swehEHfFw1EalzetHYmfkSzX76YJ2EtrHkFh/ZXYedWMFaBV4S3PwOFNhQirt27FKo/Y/sJK+mwQ2VrLzbrMiGplE/DpEZV0VGHOZ5odQmn1bxWRyjQvqKejaMkji/yFBaL9o/czazP6/3FSzFfnLkRTGyZQjUFh6fzZ2ZeEo8XLjL2KvnZtUxDTjVYwxFMtpY1Q4xlYnXJw/2W5Wcm233Jb3NRUDhSFVZTD6kbi6ha4ERjeGyEb5KmB+oCKnyHjYK2fwgkepFz9gbFAVHpty461ztXluPlPe+NanLIs/ElkCvb2OED+24UVX4uX4FC/y4774j1Nu/N4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(66946007)(83380400001)(31696002)(6486002)(5660300002)(6916009)(107886003)(66476007)(66556008)(86362001)(31686004)(316002)(16576012)(54906003)(36756003)(26005)(38100700002)(53546011)(2906002)(186003)(2616005)(956004)(478600001)(8676002)(6666004)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnA5bzVtUXcwajVucFJoS2Q5Wm8rN0U1ZjhpTVpYTVFVY3Bac0hrbE5KUVVX?=
 =?utf-8?B?MWZuWjJ6Y0lWdkNEd1VKOTJic0lweW5zN1UzZ3dNTS9JcnNFQk4zV0Y3OGJN?=
 =?utf-8?B?QlF4MXd3Yzl6OURBT2hNd1k5cW9BN0U3ZFdQcTZvUkFEbW5MV1A2aUdZN05p?=
 =?utf-8?B?UE85MFJCaDcxYXpYWFdwakZySWo1cExOOXBVWWRtL2YvZWVRZ0lXUWUrK0hr?=
 =?utf-8?B?Yy9EMkY5RUJPWVo3SzZJTExVREZIeHc4U3JYQlhmQkZsSzhYclhiUXNvV1E3?=
 =?utf-8?B?S25ySG8vejk3WnpXbERRYXpYWmdBZ2pIamVob0VWUlZ4V212c25LckprNlNC?=
 =?utf-8?B?ZC80b3gwK2hqWXFLSWtXa29VbG9GNGg5R2hFSFJxVGtqQVJqclJnSjgwUTZF?=
 =?utf-8?B?OVhsTC9KL1M4ekFlaGJFd2N6V1dUdVBuUjNST1FWYTZXbkJLNVh4WkNsWC92?=
 =?utf-8?B?Wk1FdE5VLzFJdjhjenV5d2xVd0dubUxOR3NoV2VjbWYwaGgvV1BNaXcvQyta?=
 =?utf-8?B?amIwY3RHS1ZDT2tRQUxMem1CdWR1TlFSTEVtYStmMURMWlhjYjRNR21lQ3lq?=
 =?utf-8?B?OExpRXpaNjZZeXpMVW5lOENtdjhWSUhxbHBrUXNKVmJlLyt4M0REQ015VTVh?=
 =?utf-8?B?VDM2VjJpVnFZL3EzY3NoNytjQmFqczliTEhvOXd6a1BBcEhzdzVhTkgrUDl4?=
 =?utf-8?B?UlZYTXRIaTlwK1FRUlpZT1pMVCt6MXQ2c1g5Y05CNkRCOHQ1ejl3M1h5d1Rt?=
 =?utf-8?B?eG5xVk1FNzFFRWtUL3NhV3VsWXZyTlh1VGVUYWMydE5aaWg1YTFrWGR3QlFV?=
 =?utf-8?B?RC9MZUx5WjlwRUNyMnlxZHFHdlFwQ1ROdWJXeEM0aDVEN3dNd1MyMHV4V2Fa?=
 =?utf-8?B?NDJzY3lXUFlUNm9pZTZ4Q0NMbEdXcGJTWHMrWGhMd3RJY2pHRHEwY3JiOXVW?=
 =?utf-8?B?bzhBOXJQOFZST0s2S2s5cUtwSDhCUlY0THdOUTlJaUV1Umo2YzhoLzVscy9X?=
 =?utf-8?B?czdUYmYwbHR5M0dVMFF3ZXFydlRIdEZ1Q2wyWGp4OWxEUk0wMU5ONzhHUit5?=
 =?utf-8?B?ZENhVHVZRzhnZnFLek01MSs2dUFONjl0KzNDdllFaEh4Z2E5RXZGWXdLRjhr?=
 =?utf-8?B?QTNBTi9QZkRSZk9kajk3ZlFWd0o0MExRbEh3dkZESU1xb3pyeENLTE52VWlU?=
 =?utf-8?B?STBBQ1NGRlRZcTlaVnI0Y1VZVVRCcjRCYi8vZUp6YWVHNzlwOFJ5OWR0WWdI?=
 =?utf-8?B?czhreVRYUzdORU1teFpiTno1eWJ2THBBMzFNa21XdW9NMkJBVDFmcHFRMGlB?=
 =?utf-8?B?WlRacFpQTHFrSDduTVk3OFVIS3lJUCtJYWZPdTlvMTJoU1h3dnF4ck1UNjE1?=
 =?utf-8?B?aHoxUGFoSVlGYkV6SUQrNE50RHRXMVhNNFVHQythSjFFSEZNY0szZFM2MDZ1?=
 =?utf-8?B?cWp6RUo1WFVoWnZzZHRiUFpjMS8wUTVKSytaMkVHbWpBcVQ3TDZ3Mi85MXNp?=
 =?utf-8?B?RFRkL3lsWGs4TXpMVUdRSzJ6M2FZblVvejJiU25rQmg5VVBhVjd0OGppQ3g0?=
 =?utf-8?B?anhaVVF4VTRlc2pnYksyaFJoemo3K3FnNndGQVBwdjZRN1QxMjRUcDljYVhH?=
 =?utf-8?B?RXFXOGhDSWN1WVNiWlVHclNIZ1c0Z3pjQzh4SDRxN2JDYUlWbTNXWG15d0d6?=
 =?utf-8?B?TjlTQld2YStVRVVBaEJlZFVwZDRDc3FyeTVHU2pIZjYvakVJYXQ5NmhFcFor?=
 =?utf-8?Q?+aPy7reN/7Tgr5GFdXmChy6jUD4kBbChUTqPNmm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 741a0fc6-79c1-4f8d-f6a3-08d95e192607
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 05:13:55.7135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjJoduCnxczJUP3LvGvIj2cGo8XX7muGTgPivhrfnNhtSbkyfBvlBYMy20cIsn1cmxzO8bYeobplgld3Lwakgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=tao3.xu@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

Do you have any comments on this patch?

Thank you!

On 8/6/2021 2:08 PM, Xu, Tao3 wrote:
> When COLO use only one vnet_hdr_support parameter between
> COLO network filter(filter-mirror, filter-redirector or
> filter-rewriter and colo-compare, packet will not be parsed
> correctly. Acquire network driver related to COLO, if it is
> nirtio-net, check vnet_hdr_support flag of COLO network filter
> and colo-compare.
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   net/colo-compare.c    | 25 +++++++++++++++++++++++++
>   net/colo.c            | 20 ++++++++++++++++++++
>   net/colo.h            |  4 ++++
>   net/filter-mirror.c   | 17 +++++++++++++++++
>   net/filter-rewriter.c |  9 +++++++++
>   5 files changed, 75 insertions(+)
> 
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b100e7b51f..bc1cc951c0 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -838,6 +838,23 @@ static int compare_chr_can_read(void *opaque)
>       return COMPARE_READ_LEN_MAX;
>   }
>   
> +/* check vnet_hdr_support flag through COLO filter modules */
> +static int colo_vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *colo_obj_type;
> +
> +    colo_obj_type = qemu_opt_get(opts, "qom-type");
> +
> +    if (strcmp(colo_obj_type, "filter-mirror") == 0 ||
> +        strcmp(colo_obj_type, "filter-redirector") == 0 ||
> +        strcmp(colo_obj_type, "filter-rewriter") == 0) {
> +        if (qemu_opt_get(opts, "vnet_hdr_support")) {
> +            return 1;
> +        }
> +    }
> +    return 0;
> +}
> +
>   /*
>    * Called from the main thread on the primary for packets
>    * arriving over the socket from the primary.
> @@ -1289,6 +1306,14 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
>           return;
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("object"),
> +                          colo_vnet_driver_check, NULL, NULL)) {
> +        error_setg(errp, "colo compare needs 'vnet_hdr_support' "
> +                   "when colo filter modules work on virtio-net");
> +        return;
> +    }
> +
>       net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
>       net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
>   
> diff --git a/net/colo.c b/net/colo.c
> index 3a3e6e89a0..4a03780f45 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable *connection_track_table,
>   
>       return conn ? true : false;
>   }
> +
> +/* check the network driver related to COLO, return 1 if it is virtio-net */
> +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *driver_type, *netdev_from_driver;
> +    char *netdev_from_filter = (char *)opaque;
> +
> +    driver_type = qemu_opt_get(opts, "driver");
> +    netdev_from_driver = qemu_opt_get(opts, "netdev");
> +
> +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
> +        return 0;
> +    }
> +
> +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> +        strcmp(netdev_from_driver, netdev_from_filter) == 0) {
> +        return 1;
> +    }
> +    return 0;
> +}
> diff --git a/net/colo.h b/net/colo.h
> index d91cd245c4..d401fc76b6 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -18,6 +18,9 @@
>   #include "qemu/jhash.h"
>   #include "qemu/timer.h"
>   #include "net/eth.h"
> +#include "qemu/option.h"
> +#include "qemu/option_int.h"
> +#include "qemu/config-file.h"
>   
>   #define HASHTABLE_MAX_SIZE 16384
>   
> @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len);
>   Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
>   void packet_destroy(void *opaque, void *user_data);
>   void packet_destroy_partial(void *opaque, void *user_data);
> +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
>   
>   #endif /* NET_COLO_H */
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f20240cc9f..b8b3f2fe1d 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -12,6 +12,7 @@
>   #include "qemu/osdep.h"
>   #include "net/filter.h"
>   #include "net/net.h"
> +#include "net/colo.h"
>   #include "qapi/error.h"
>   #include "qom/object.h"
>   #include "qemu/main-loop.h"
> @@ -224,6 +225,14 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
>           return;
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                         vnet_driver_check, nf->netdev_id, NULL)) {
> +        error_setg(errp, "filter mirror needs 'vnet_hdr_support' "
> +                   "when network driver is virtio-net");
> +        return;
> +    }
> +
>       qemu_chr_fe_init(&s->chr_out, chr, errp);
>   }
>   
> @@ -252,6 +261,14 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
>           }
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                         vnet_driver_check, nf->netdev_id, NULL)) {
> +        error_setg(errp, "filter redirector needs 'vnet_hdr_support' "
> +                   "when network driver is virtio-net");
> +        return;
> +    }
> +
>       net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
>   
>       if (s->indev) {
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index cb3a96cde1..0e84eac1f8 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -14,6 +14,7 @@
>   #include "colo.h"
>   #include "net/filter.h"
>   #include "net/net.h"
> +#include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "qom/object.h"
>   #include "qemu/main-loop.h"
> @@ -388,6 +389,14 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
>   {
>       RewriterState *s = FILTER_REWRITER(nf);
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                         vnet_driver_check, nf->netdev_id, NULL)) {
> +        error_setg(errp, "filter rewriter needs 'vnet_hdr_support' "
> +                   "when network driver is virtio-net");
> +        return;
> +    }
> +
>       s->connection_track_table = g_hash_table_new_full(connection_key_hash,
>                                                         connection_key_equal,
>                                                         g_free,
> 

