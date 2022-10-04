Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D615F3C96
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 07:56:53 +0200 (CEST)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofavD-0004JV-4n
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 01:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1ofagS-0001Bz-QG
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 01:41:42 -0400
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:64670 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1ofagP-0003ya-PF
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 01:41:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNi/8RFSaqzUH/UOwGqKCtQUBhvd7dKfq1YfFJdOe4pRT7JeN3jctDUh1jrhxUuzARqy8FgaSIOTP8Xb5DARFQanj+sq9V9Iw1ZSy09jTK6V4bKk04F1CgKCyIsdVlLow12bVkUGikPTXHQOsb076C+F+xiZoCmSfbKz8QXK7/kcckaYGF0Sf3OlMBGGNVrCeSPPpoYevQ2r2rUMAQ1casOmo1Q/WDvqNEfSWZSOFhg68x07vnmxejtR3kv/AdnR4hMqssM/gqJG8ZmO7SMnsauSC09gsX94SD8b9c/LlOToL9A1rrfAyywzShOLFXF9vGG129DCpeBYG8yZbASW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuTDWpfQTzkjSjp84J6CbxzJVUNYEJ3WqomTa52vSGg=;
 b=K3uLNnaX51GA27DgdXbAjjWceDVdFxeZejK9m61xO/n79J4yZRMm/wuChwdWPBmQPfeyTAYtMr0IffF53G58qVGPcox4koPJaeKxvRVhaR2ICXwjnLfv0V7NHilNKJLZzYmGP0ZaBeAnXvpgFd2cbQyLfU/5M5LL3ogN+a5VaGKTiayuvVjHiPhHQ3I8yAqL1OfxmU6oJRbtHJaiLBiVu3ThvPaOkQsK7K42ktGisT5B5dxF6OWj29fYWESYQK86ESJS9tfv5Gsyi8/dALb9I1tkbzJm+J0jvFh+LG41TD2clNGAm/OlMvPJXeWQlB3lOOtRYCTYJ36gdIQM3PQG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuTDWpfQTzkjSjp84J6CbxzJVUNYEJ3WqomTa52vSGg=;
 b=UlBdhCNl45kRSiwPXJB+5DZiGNVV3ZDE7FewVBGkKC6GU7Fg8+WhG3mtIoxHihiblv90rZIHseGcPpUXNlgMBDtL3guuAchuf+yNw2OLP5dyUs5eJ5ja5+w6KWwetU4icNVnxVuBbvBtEDBEJmbqUTGSiTheh+lercMkv1UAUCPxQX6NDX6Lsb06NrWjVBvUUPBLxcpc4tuvqK8tCrmfMNrIrc0lkllsURQySEQ3L63jdXm3HdRCZ3k9aA349YDf1BY5uk1b/mHtdhVhd94QboTd2lEmos09ZKZSWjqSt/YWlpedkcZAc96ny5FPuiuAIsFRN1qFCs3JapwTEWflOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB4PR08MB9311.eurprd08.prod.outlook.com (2603:10a6:10:3f5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 05:41:26 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 05:41:26 +0000
Message-ID: <78f7c71f-4232-505a-e865-8e921f63815e@virtuozzo.com>
Date: Tue, 4 Oct 2022 07:41:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] qxl: add subsystem_vendor_id property
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Yan Vugenfirer <yvugenfi@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ben Warren <ben@skyportsystems.com>
References: <20220928155244.1837455-1-den@openvz.org>
 <20220929073747.psazwl2cxwuynt5n@sirius.home.kraxel.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220929073747.psazwl2cxwuynt5n@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::43) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|DB4PR08MB9311:EE_
X-MS-Office365-Filtering-Correlation-Id: 187f7e5e-2cc6-4a32-dd3c-08daa5cb1467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNy0d9fe6qvZTgV6c5Us+/PVoJL+u4AtcP9mldparAduqHDuzKxJqTps7jpdCXiFjAvpTHlSnDcanp2tsGHloSp16pF8F5pyzpYjbXhgyNRZgle+T3iZ/j51n6+dwr/dDw6m1h5ah+2Tw6m9vhMEGRs4QeiIp6E63lrBc+l7Pl+GFa6YXy8/zRKu5U82kXVLNWRrZfvyi9+n5bQgWQi30u3ZGD7iY+E6lfFiPtrXYYhH+L8oFC4t5r577ng5HwuLRiQ29zycGV8OiCe1IGDSnwe9qaW7Wg1qrRwWlPl5qFxr3FgUKcvVDuOLBapyQhKfxvFdHh5pClfe5fDf/0mHHWiFjvgrPwjCS8jSUgVng0jKW5vyTHWcRlw3NQisslHbKS8zhWewZMyHSy4AQAP97Nxw9SaqpLo9CiWWR5oAr6y//7AtG7xTIuwGj38dQ07qGNn1aedbEWByA934a4WbLCcqTwEFxZTBeHmV5IjfL19I9NKH5yQIC3m6xk6mY76FNgoEXBq3kpNwqUkZXnuNlHP/ag9APQCMxTtJAhvMY8fXLTK7iMfe0kbbvPqIMSyOkCyHg7qHgRSo9Kdi4GwZ79avoOVesho34Sxat4Jusksv62UagSqMlEOqu2zwLNsluAf80SSWb0HKzWPeR7Osph1guxSlkhcPPcY2g4farVn3iHah7aTlx/U7EK1ccrOdS26bBf6zgu0ocpswhpCxkkd+XIqKSDcU/25+VOi10RfjtdZiZYHcURk+yqVW+r26PB9M/w5ALX1KiNS8utGMbTDPFBAQaaPT4TRlRL8TCubTlcNqfJ3Q195PtPAFMXSRWBG1vbrLC4kC/0OGVkfg6nOhA8BLNjppIGFxMWQmuVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(136003)(346002)(39840400004)(451199015)(186003)(38350700002)(38100700002)(8936002)(31696002)(86362001)(36756003)(4326008)(6506007)(52116002)(41300700001)(53546011)(66476007)(66556008)(66946007)(5660300002)(6512007)(26005)(478600001)(45080400002)(6486002)(54906003)(8676002)(316002)(6916009)(966005)(2616005)(2906002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE5Kcmp6VDhkQlRZclc1UUdSWnpmcnkvNmFybUtXVmhnSkNITzRnNGNrL2Fl?=
 =?utf-8?B?K1NqNVlPdjVoTnZveUVIZXozMTFqbFhsdmI2MExoTUdzdEQwbS9Vei9KcWtL?=
 =?utf-8?B?TkRPMU9Eam1nOUIxbWNaSzhZblEyNDlTVnhMVndobi80SmFuL1VuZEk5Mmw0?=
 =?utf-8?B?QjhJOUFvVzJHaUlRNE8rMWd3eDhUam9zZnord1l3SEg3WjhRakRnc0tpVis2?=
 =?utf-8?B?dnZJQzUxSHpUbEs2dnVmNFYycm81dVM3eUxuSHdGOEowV0RBNEtrUFF6NE1S?=
 =?utf-8?B?cVE1QTRiaGxvbmxzT1BFVEVPT3lyV0YrRjgzNXpHbE9HNmtrcTNlRDFrQXpX?=
 =?utf-8?B?dVdFSVhhbkNZWllTQi81b1BkLzJhQzZwVlUvc0cxT0YyY05kWmdncEFOYlN1?=
 =?utf-8?B?eDhrV2hJQklGdXJBL3RTUGdzUTJEbmpoNDBxSDhFbHdTNENkVVVWNEE2c3NG?=
 =?utf-8?B?T1ljRFJ0YTNwR1dRUFlvR3Q1RVNFU0hpQlhRSEF5Y0tqODJCMWhUTTBsL2Vr?=
 =?utf-8?B?anBtcE04eDVlejJGbTNvdUtyMy9UemFIK3lhVUVJTWw0Y29sN3ZtS0hqTSt5?=
 =?utf-8?B?U3ZEM1ZjTUNKcDhEZncrN3FxOG5iYzdFMG1DcURYT1ExZTRnZTd6aE5na3gy?=
 =?utf-8?B?em9aZkJ1dUdoT21zR2dGTDNKZk1HbUYxaWtvZkQ1Syt0aVBqUkVnT0Vlc1k1?=
 =?utf-8?B?L21rUkQ3VXl4ZVpkZCtBY0NKT1V6emp6YnljeGpWcGF6NWNNblIwSmZVQ05B?=
 =?utf-8?B?b1FTMlZoUk0wSFF6RnRmMDA0N0NQRDQvOWY2RkhWNzNyaldLZ3ZQRjBPdDV3?=
 =?utf-8?B?dTRrVXZkVUtydmZIRUpDU3FRTlN6L2pkYXVMMW5aWXVmcFNTZTUyYytRWWgz?=
 =?utf-8?B?RmN4MGlaMHNoa2JzVzRlVkNZa25TRXRFa0E1OTcvcVRQRUp2N3RiU2JOYVQ0?=
 =?utf-8?B?bno0OUY5UmZsOU1DUW5qUnJnN2RzZXYrbFBVSTJwd0VTMm5wWHZZZGRtTWV5?=
 =?utf-8?B?MU5kUTc0c0wrNjdnV0xJdFJSc2ZNRGZML3BZVWdnSFVjVFU5cE5pWVk1RTlI?=
 =?utf-8?B?V3VGQzEwQmtNVmxVenhSQmlVdm5HdzA0UGRSWHpDMnlaZyszS1VGRmowWVF0?=
 =?utf-8?B?TDdteFBISzIwOUkvWktCR3lxeGlNUythMG5GNWtqY0R0aUZHSTBpaEZoV2ti?=
 =?utf-8?B?UkVlaXZMOGovV0JmODNhWWV4MG1RNTVTNzNvTldKa1d6QldoeFZvQytBbjdY?=
 =?utf-8?B?cFE2b2o2bU14SzlneEJ4QkMrcHFYQTlPRG0zL3JjZG84MjdERy9VRDVwYjF6?=
 =?utf-8?B?YWNFWVF3M0IvRm5BSHZmdGVmZ3pzYTdFN3owUFdZeEVnWUJYT0IvbFFqdjVm?=
 =?utf-8?B?WjhaWnRINDdRRm5YWWVzMnplNnJnOUlUV0ZxYStOakdlRU9sbS84ZHIrd2ZH?=
 =?utf-8?B?ZW5OUEF3dUpzUUMvci9pVFd4Lzk0dmpOR0dQZmdtVnVPb3l5VlFlY2RJUllm?=
 =?utf-8?B?ajVobHErVFIvOXdGUGw3cURvdm56bXExOTNkbkNaRWFPQkhnK1R0UXlVTXh5?=
 =?utf-8?B?VWkzRHUzZ3BJMUE2NWw1Zlhrb0dicmRrTFBjL1VVcC9pYnhiSEdiZVg0S2Iy?=
 =?utf-8?B?dlBXSnFyRG91L1U5Z3JPSVBmdVVtdjlsMkJOVUpOL3QvSTU5RC9saklSWXkv?=
 =?utf-8?B?eGJNQTM1dmNaUHR4bjF0U1V0UjlrOVltTjdDdmRjOHg5Q2VyUlF1dXZFNDlR?=
 =?utf-8?B?cUJlUU1CNWV6clFXKy9zTXA4cVFCNlJnOWh0VVM2M3VGN1RESDZoV1ZBTHFC?=
 =?utf-8?B?c01MTjM4ZS82K09lUVJld0NNREdibWhHRTBlblA0WEZadzBtaDhHcElRdW4v?=
 =?utf-8?B?UmxSOHpqYnRmM3UwTWZDTXd1SnkwWkJ1VnVrcGZPRW0yazl1NnJhT1YrUmhz?=
 =?utf-8?B?S2tPZU53TmQ1b05LR3VoVkxWN3ZDY0dZWHRIeXNCWk81ZFVaZXJZcmlIc1Iv?=
 =?utf-8?B?UmVUR3Rka283anRxZkdoYTJrY2h4RmZ2TnhpVVpFZG9lTWxaMDZwR1BYblB6?=
 =?utf-8?B?NFJjbnByNFl1OUNOM0p6dkdMNGpmMnJ1RTZLOXFrNzFPa1l5R1RRMnYrUmdW?=
 =?utf-8?Q?C7dw0prQ3loSLRZvLGUdmnYe8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187f7e5e-2cc6-4a32-dd3c-08daa5cb1467
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 05:41:26.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KDaXb8RTEp9ElYLnVBqmDVqCt9AAoIE1mRdh9jXaKQGl8I7paW8k9wm4/WHrFYc6QD0eS81P7DXnQQ8S52EsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9311
Received-SPF: pass client-ip=40.107.5.93; envelope-from=den@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.467,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On 9/29/22 09:37, Gerd Hoffmann wrote:
> On Wed, Sep 28, 2022 at 05:52:44PM +0200, Denis V. Lunev wrote:
>> This property is needed for WHQL/inboxing of Windows drivers. We do need
>> to get drivers to be separated by the hypervisor vendors and that should
>> be done as PCI subvendor ID.
>>
>> This patch adds PCI subsystem vendor ID to QXL device to match that
>> convention.
> We have pci_default_sub_vendor_id + pci_default_sub_device_id in
> hw/pci/pci.c.  If you want another subsystem id for another vendor
> there is a single place to change it for all devices.
>
> Right now there is no runtime switch for them, so updating it requires
> a two-liner patch for your vendor build.  We can discuss changing that,
> but that should best be coordinated with libvirt folks to make sure
> the management stack actually allows setting the subsystem id without
> needing hacks.
Yes. There is no runtime switch for it. I have also checked this.

The story here seems more complex. We are using in our
downstream the following patch from Ben Warren

https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg02128.html

and I have mistakenly thought that it was accepted in
the mainstream. OK, unfortunately that was not happen.
As this has been pointed out in the above thread
the discussion was moved into

https://patchwork.kernel.org/project/qemu-devel/patch/20171102133115.19195-1-lprosek@redhat.com/

Anyway, we need to support different PCI sub-vendor IDs
in order to be compliant with Microsoft WHQL rules. Though,
actually, at my opinion this requirement has nothing in
common with libvirt people. The most convenient way
here would be to specify these properties within vendor
machine types and this place is a perfect match as any
respectable has its own machine type.

I would also think that PCI level is not a good place for that
as we would not be able to apply this change blindly as at
PCI level this change would be too global and the same
was initially noted by Michael Tsirkin here

https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg04384.html

Any thoughts?
What should we do with the original patch from Ben? We
still need an ability to expose vendor identity in QXL/virtio...

Den

