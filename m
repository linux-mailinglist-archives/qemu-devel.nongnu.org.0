Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF33220F0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:50:46 +0100 (CET)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEIAH-00087t-KH
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lEI95-0006zl-8g
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:49:31 -0500
Received: from mail-dm6nam12on2131.outbound.protection.outlook.com
 ([40.107.243.131]:33024 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lEI93-0007nT-7n
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:49:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9Xkdjr4V724wlKtNUPL2oPAUSKFr67Yck+XYfVjV1d6aOZDdjvVF3o79zOZCrIJsBFv0aJJWadTBIAJtDwMCOTKPKZLOGI1D2VUIJMeSXkMekAvv0Sw6/RNrpAV/b+1/KTGjjLvCbQVq2tax5PnAf8lSqoZ4SdjZU7lchrpObdR4aEW4pZL+ufqcQKvObue9Zesq1IP3aEf+exdKHwlV9EXOTFfQxf7Aqhf+5OqXmAKmqELvsAcSGDljP6U+dGn3ecJMqZkyXksngY9JyJeHL8zv50LDOk1Vxaz7ajPUkYqD6aGq6pNAw9JPrsc6ptKlSPqSGKIn85oqcvgki9XNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+lZjUhW/RZoCs0O6kMfzobbPsxE6jYIOxbI72wapBg=;
 b=cwqL/Zr1bGw7SzQZfO6bYcbySs2mH4droGu9uxx3G18VwoQfoCiwHMitOG6etL9tZuSFTwGj+DiMbPYeuV/tJi+zaOUYx2wciDhakBvrtAKgRcXUm98Cf+CXHR1Jq+T/uUj338wdd7zXnwReHnN1gF1DC9IYFklxg0TGlwoUUXI/xY5Vir3d2rxWgDAyS59TLt/trMctDsCBCER9MXk+BTcoCtPvxhzbGs+S9GWygpsl7jJrbAah6alUbmLFGRtufPnB/e+G8OKfm/EMqBhF8vXybIbR8FF8a2cj7pWOaZF4ZH99BZavcfHG9yeZLv0bnsttR00JjCUC+AvE/cFXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+lZjUhW/RZoCs0O6kMfzobbPsxE6jYIOxbI72wapBg=;
 b=k9BqonObo+bux6m/esysIZmbImcxeoAYuO/4wDqoy+l60YzZmANcE4+npZRt4hPMGMDrxlzQqPyl6Iiny2SbJouGEf9NvmcUWAXbXcTx2xUaZM/VXnqGHqMEOHIc4wmLAFwIKngXHQxY+g7rfbLL2g8CoqXfJnlCB/c5sYY3mA4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB5151.prod.exchangelabs.com (2603:10b6:805:bc::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.30; Mon, 22 Feb 2021 20:49:26 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 20:49:25 +0000
Date: Mon, 22 Feb 2021 15:48:46 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Message-ID: <YDQYrptOxAjs0Pf0@strawberry.localdomain>
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735xn6fy7.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BLAPR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:208:32a::35) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BLAPR03CA0120.namprd03.prod.outlook.com (2603:10b6:208:32a::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 20:49:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ade32bd1-741c-4d64-e628-08d8d77356f8
X-MS-TrafficTypeDiagnostic: SN6PR01MB5151:
X-Microsoft-Antispam-PRVS: <SN6PR01MB5151B83E6BCD31D67D95392D8A819@SN6PR01MB5151.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDaOhLFfjmHZy6ewvgmJeqn82lcOBhOIQ5ITPxraUZ9L0i8b5HXL9m22RT1VuUTp7Nmjc9Q2Hey54kzWuIjvRygKgV2/BzXykyegvq2aufo1eexFUoU3vIp5QbLQrw3jwRb5G4f0eA2gu/yIEYAOyms7PHoHB89SKIJ/Aca/1GptYjLfHc4wcy5PFfJzxV0crTnY+QX6N+DihaxKhdbKLhnE3oV04Ga/1UNC+fBNYWP5kxobkenvlAfv8glYHIOEYUdO3B4i50MGP7V80zgNyQkz5IROTnFf66iztE5vECQh6oiqZrQCfW1cWXGQJktN9bKKYipenYyqkXXiH4jFTJE5qtWW89cOKqROjM9htIIw3AP+SwDwdRiQfOQ2y0ui4O3efpdGhk5prsiF6+A0SV8tQ02Ixv/lTirveHsGAqeP5qQE9pSuaQwV6sJCbyyZDj6ZNGxAiJv3FAY3UYix7YXdtSdfmHIzeewUgtx52cDKo9KYwOBv3FG7N/pdjD5p5QT6Do2zVJFrKxLd0lVWCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(2906002)(66556008)(956004)(186003)(316002)(66946007)(8936002)(8676002)(26005)(86362001)(66574015)(55016002)(4326008)(66476007)(83380400001)(6506007)(6666004)(9686003)(7696005)(6916009)(478600001)(16526019)(5660300002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?VIC1vJeEo+ni7wT8LZD/b29EnpvliL8X9rDmGlrvNXSZWFaKJ020NsJoch?=
 =?iso-8859-1?Q?yGzxi06NA0LHnML0mgIEa5K2ysED3MCH5uwbNnecXWCbpJjaqDg8VNFwHZ?=
 =?iso-8859-1?Q?iJg7FVt5z731wDtc9DuJVsKpOix0qIMJKqqm8fa7leOuwtc7je5v9Vs0CB?=
 =?iso-8859-1?Q?sMy0fgy3LfgT40v9LZgJysupHhOC+58BE9xQFVIieoGAAvokko/Ph3fo9N?=
 =?iso-8859-1?Q?6plOnPGPoYdthskImPVZYI8T8G4Qowidx9W0OWDvthysoGBRVhP0+EDhG3?=
 =?iso-8859-1?Q?BglzezcqIpXPkIwqi+pb4BzyKbnDfplcwk5z2i2SgnZCGuuoHDMN0bnvSq?=
 =?iso-8859-1?Q?5MTC8ocC3t3nhrp9ug04WzOubEZLLbLHACzfPH5D7jOacaHa1I9xzIZVgq?=
 =?iso-8859-1?Q?A0SDVU47SI5mX8euov97GIcXQq7AAczvsuH6m1MwrKkZ0uBXgdR6wnbT6v?=
 =?iso-8859-1?Q?O76gqeUm9MVLrGRCIHMZ+xynvxg8XH7xRv+WBNS3TqGE0Li0nyGlb4dT4l?=
 =?iso-8859-1?Q?qU4FzKUlMnk0cO2tHsABv2WNVech+CYDo+7HoADBcTx1fXsxLOr4Jrld8v?=
 =?iso-8859-1?Q?ohZtT0BLVhoHEOyUxZWm4k56qZmDa7/7b32J+3c28VU1Ctt9g0Wrrn9I/B?=
 =?iso-8859-1?Q?95ZV0OeHzkJLPBAwDLj8WmEaxNY6/TeLZpRaJ2M2ESfyN/43OyAVSRgRbc?=
 =?iso-8859-1?Q?VHSQnxfm7+YstuQH7JzQM01XYV+vwk3cHuWf74m/NEnNHmVFhpCUU1JM1w?=
 =?iso-8859-1?Q?AopC+qeMzn8MSeQTaUWzwoO9EIeMh/N+BCyRgrjWREyzItH+ZDnUgfZPEW?=
 =?iso-8859-1?Q?025LeqNbMiLsapkoCoC8J6z4j3ytgzBOCkoKAcCIq6MdBgcwCRFabboHTU?=
 =?iso-8859-1?Q?E262RrGTGtzv4dUZlDgpQTiA+6KZkmstN4gKVy5eEbOjc/Z4Rj9+h/e/oa?=
 =?iso-8859-1?Q?1hX59wjbzUszdsokhSExp8javwga/BEqlZF55aKfs2b84XJEYLswyW1uFf?=
 =?iso-8859-1?Q?/XF1nEinafGcEIzYyvk6/Qa7++yt9+8sDofBPgR3r/kYnENRPI+aDRlq4p?=
 =?iso-8859-1?Q?ca27N27ddCZAYJlevCc5X0zFmhvU7vj26veY21FibjVWtgLAKjwXPY2M0N?=
 =?iso-8859-1?Q?UxwVnlJGJTAwXzvRMpCi9lu/sgs64yJ919vTKiy7DKogcEshgjOHbxJEa3?=
 =?iso-8859-1?Q?nyUFkl4PTgcgYgplBtPRZ7PdTaHxBXy0Iqfngp9+FrHkeKJTPQ4rEYGDgC?=
 =?iso-8859-1?Q?+m1oX4nDqQwnNKd2+noF1odvJ/XOcaYk57DY69hrwL69OAazVTwVMfjL6p?=
 =?iso-8859-1?Q?gytZz+vzMUPoICXr+rIYZHcgLl9YIB/bIsDVPd2v+ldQLbeqzjT8P759BP?=
 =?iso-8859-1?Q?RmS0DtKv2c?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade32bd1-741c-4d64-e628-08d8d77356f8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 20:49:25.8715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKhebnNEeRrX0sxODjv7Mmqi75fQLJUEEnjyswRio1uKvLcOeDBPlhbBRpqw2wZ/yZaVULPKGkWV5BcGJBX0yknlCdE0hXXX52g/h2OC0U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5151
Received-SPF: pass client-ip=40.107.243.131;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Feb 22 19:30, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > If I call (inside a memory callback):
> >
> > `uint64_t pa = qemu_plugin_hwaddr_device_offset(hwaddr);`
> >
> > I see that `pa` takes the value 0xe0e58760. If, however, I plumb
> > `cpu_get_phys_page_debug` through to the plugin interface and call it
> > like:
> >
> > `pa = cpu_get_phys_page_debug(current_cpu, va);`
> >
> > I see it takes the value 0x120e58760.
> >
> > I notice that 0x120e58760-0xe0e58760 is exactly one gigabyte, which is
> > also the offset of the beginning of RAM for the 'virt' AArch64 machine
> > I'm using. Furthermore, I see the name of the plugin function includes
> > "device_offset", so perhaps this discrepancy is by design. However, it
> > seems awkward to not be able to get a true physical address.
> 
> It certainly is by design. The comment for the helper states:
> 
>   /*
>    * The following additional queries can be run on the hwaddr structure
>    * to return information about it. For non-IO accesses the device
>    * offset will be into the appropriate block of RAM.
>    */
> 
> > I've done some digging and found that inside `qemu_ram_addr_from_host`
> > (called by `qemu_plugin_hwaddr_device_offset`), `block->mr->addr`
> > appears to hold the offset of the beginning of RAM. 
> >
> > Do you think it would be reasonable to modify
> > `qemu_plugin_hwaddr_device_offset` to add the beginning of the RAM block
> > or otherwise return the true physical address (or at least expose a way
> > to find the beginning of it through the plugin interface)?
> 
> Well the problem here is what is the address map? For example if you
> have a secure block of RAM you might have two physical addresses which
> are the same. That said with the current qemu_plugin_hwaddr_device_name
> helper both will get reported as "RAM" so maybe it's not that helpful
> yet.

I don't think I yet understand why this is a problem. It seems to me
that the current implementation of `qemu_plugin_hwaddr_device_offset`
returns offsets which may already be ambiguous without additional
information about the underlying device/memory, and I'm not sure why
translating to full physical addresses would make that worse. It's
possible I'm not correctly interpreting your concern.

> I also worry about what happens if devices get moved around. Do you end
> up with aliasing of address space have a remap of the HW.

Would the `block->mr->addr` field I mentioned above be updated in such a
case?

> That said I think we could add an additional helper to translate a
> hwaddr to a global address space address. I'm open to suggestions of the
> best way to structure this.

Haven't put a ton of thought into it, but what about something like this
(untested):

uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
{
#ifdef CONFIG_SOFTMMU
    if (haddr) {
        if (!haddr->is_io) {
            RAMBlock *block;
            ram_addr_t offset;

            block = qemu_ram_block_from_host((void *) haddr->v.ram.hostaddr, false, &offset);
            if (!block) {
                error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
                abort();
            }

            return block->offset + offset + block->mr->addr;
        } else {
            MemoryRegionSection *mrs = haddr->v.io.section;
            return haddr->v.io.offset + mrs->mr->addr;
        }
    }
#endif
    return 0;
}

The key differences from `qemu_plugin_hwaddr_device_offset` are using
`qemu_ram_block_from_host` directly instead of `qemu_ram_addr_from_host` (to
get a pointer to the RAMBlock), and adding `block->mr->addr` and
`mrs->mr->addr` to the returns for RAM and IO, respectively.

-Aaron

