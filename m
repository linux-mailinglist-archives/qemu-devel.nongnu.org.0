Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B42B9F4E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 01:29:45 +0100 (CET)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfuJ6-0000He-1j
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 19:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kfuHX-0008Er-7e
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:28:07 -0500
Received: from de-smtp-delivery-52.mimecast.com ([62.140.7.52]:59781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kfuHV-0002Hg-0E
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605832081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=344VGx/o5+DDFIcr1LhqmBL1Xi1AEC6ElRM4JFBaduc=;
 b=MaalpDdDomMXfPcGPieRXFeYOhzr454pdzcOCBCEqw65y/0VRBOnssGMlr1eXZZb/VtKyQ
 TfFj4THBhnXnj4lnSlBEIaCnxedv0SzoSwO5cA76/umpkmrenyI4W20VKUIMEFbvCCrZn1
 u328gRAW/O2BiiELuohZmbNL80HyRAQ=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-d5mzlN3VPjCibf44Vbz6sw-1; Fri, 20 Nov 2020 01:27:58 +0100
X-MC-Unique: d5mzlN3VPjCibf44Vbz6sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+g4ccWoZsO+RzpbTUSZHpt49uO4KH/wugUo0e/h3iWl7AxrkmD2X5WoTThlCA31FdUk4t/8l30H3/SuSZ59UuFQoxZc9R5uTArHUmvHbefgCvxIf9I0veilAJN7khJHtKPvMR2x9A9aHMsleXpdkDwZrGsgFzcWak51btNzNwdbWRz3t3x200mc3b7lpFoDbi4XJzqA5PAs4cmYxV2MU6NmvDUOyZquCdroHROQvUvPuhuvV+eDf8nCo+yQ7D7MYBYQFOpfrks1ZKiRKUmojkCxEfZbcvvEE/LD15EdROmqUBeXThPsWu3OJGrgN6rxi3p+9ooJ0WGia50SsWMnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=344VGx/o5+DDFIcr1LhqmBL1Xi1AEC6ElRM4JFBaduc=;
 b=GVfJ++pvZ3IcOTMiW7wOYeMOu7XcL1VRKP8b6+BE+9aVyc178OnsAQFBSOPmjqXZ9ukf6rzXnKNpEvD86lKP+udNk0xPbcbhjW1wuMITXdLc+PYkvcJfNdR7zc3MVndWP3pMb+XvKJVkCNQJzODRbZNXScYR51QLRZYbsY3R2apvrov9awLUW6RJvnhaihOXQ+QkXtP2RccNk/NwZJ0OoZKpb1Qz6zjrzGr9HPzrv/Aa+DyhAR7uVqa1vIv/cG4vIQnwsWPaxmEpnPbovJHH67UZgDE+fwDCsxMmfzpZ3uHT+Margixk+0t2jtxXjELLDDCE2GBsAh12v9+qAg3+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21) by AM0PR04MB5475.eurprd04.prod.outlook.com
 (2603:10a6:208:115::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 00:27:56 +0000
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::9891:ed4f:b5a2:6441]) by AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::9891:ed4f:b5a2:6441%6]) with mapi id 15.20.3564.028; Fri, 20 Nov 2020
 00:27:56 +0000
Message-ID: <2b74eb5bd939bdd7ad1b05590a427afa4d742eec.camel@suse.com>
Subject: Re: [PATCH v3 04/10] usb/xhci: fixup xhci kconfig deps
From: Bruce Rogers <brogers@suse.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sai Pavan Boddu
 <sai.pavan.boddu@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Date: Thu, 19 Nov 2020 17:27:49 -0700
In-Reply-To: <20201020074844.5304-5-kraxel@redhat.com>
References: <20201020074844.5304-1-kraxel@redhat.com>
 <20201020074844.5304-5-kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
Content-Transfer-Encoding: 7bit
X-Originating-IP: [63.248.145.198]
X-ClientProxiedBy: AM0PR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::33) To AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.5] (63.248.145.198) by
 AM0PR01CA0164.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 00:27:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd7c3ff-84be-4395-c635-08d88ceb2063
X-MS-TrafficTypeDiagnostic: AM0PR04MB5475:
X-Microsoft-Antispam-PRVS: <AM0PR04MB547573E0CC356B5576A65D2ED9FF0@AM0PR04MB5475.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CPSuW0c45Bnrabm462Yv71CWzrSrJ5bobzsTMxSKV+jMSMWx5u7sT/cjB2dZVDTezrYz6X1qWYObt82zAF/rlCgGJo1c6QAxClQ74O9QyoqPExgnLllYtZpgYK9zpATxMGBCGq7Id5jVary1NqLRKzYuPd1KCtRvPcwZSdTl9ZdoqYs+XfZ3hRRSsiUfBnyDsiM5ux5TlKEUsQFBUBvwRGmzYnO22n8dtpRJXBGdzlmdSbLnC95a6xKoOEJXpVjB9MgXBm9ObG1REGVHcOQ+UhINUEGVyAak1ihqTwapGy2Nm1k6px7igd31KVcAhTKWypRj67S7ytV2aeP7VzGpfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR0401MB2354.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(376002)(39860400002)(366004)(6486002)(2616005)(7416002)(8676002)(52116002)(956004)(54906003)(2906002)(83380400001)(66556008)(8936002)(478600001)(66946007)(26005)(86362001)(36756003)(4001150100001)(66476007)(16576012)(16526019)(186003)(5660300002)(316002)(4326008)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 67l6MfmRDiTJmTffnHegwfwza7BfudCEC0qbjRwUSVLCtfxnB4RgYPqGau9f2SvhPZ6JLIxxJ+BYGqg40h9fWvAAwEAcEpLkcSOoBXAunvMZwhw/qyJPow8M8KtqdEi8lZySv7r+l0bSJThcCtJ5VpYqfsb8z3tQw9G+Uu1HCI+Ybm5KT4Nj36F6wyGEBWigXkks5pMJCml1amFVRdszSForkbHTYWBP4UhiR4l1DXgfav2ED5p+RHQcp9GagJN9bi0XSZP7CEI/ayCZ99UXrGx4BZerys5015CU6a04LyZNyHXtXtBMblnMQlhXpqsZCt+xqiKUs6pmwldwr+HExTtBz+RuFk4X67ilKxOi4KDmsqM1sxw/v5QeZGd/0G5uXhJpMx8rKJ/S1IhGrdoD+jEnEIZfgyvHDiAZy0fRePaeoy/H5iNhB+F/kf+By2RoMGTo3mO/nJOIdpRvp0ZLYaSDbOnrvE8mFXK7z7hEAVPUqPwN5/gpg7wdxtM6Nn8owCPkdcK4ynJf4Xoq2ptriKcZEmn8NQnlV6m7x8MS0hqxGxjKmAkPE++6w3EcyJFBd+VpMgh+vGN/aX/FBOSfx/MBYmd9leB0ptk76uXsysDRcQ0hvyTQ2WMOTKsGyBuUa5bq3YDGUUvWi9TImVl4gw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd7c3ff-84be-4395-c635-08d88ceb2063
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0401MB2354.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 00:27:56.5526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muScptnk7ZRsGxEVA5vxDDPH6CQQNPcbh/Eyhn0CNSSgTOzcDEqt0LP9fBLj7Za86mD4YWlZijSPUIyiFLMmhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5475
Received-SPF: pass client-ip=62.140.7.52; envelope-from=brogers@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-10-20 at 09:48 +0200, Gerd Hoffmann wrote:
> USB_XHCI does not depend on PCI any more.
> USB_XHCI_SYSBUS must select USB_XHCI not USB.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/Kconfig | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index 4dd2ba9630cb..a674ce4c542e 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -32,8 +32,6 @@ config USB_EHCI_SYSBUS
>  
>  config USB_XHCI
>      bool
> -    default y if PCI_DEVICES
> -    depends on PCI
>      select USB
>  
>  config USB_XHCI_PCI
> @@ -50,8 +48,8 @@ config USB_XHCI_NEC
>  
>  config USB_XHCI_SYSBUS
>      bool
> -    default y if USB_XHCI
> -    select USB
> +    default y
> +    select USB_XHCI
>  
>  config USB_MUSB
>      bool

I was reviewing what device changes are happening between v5.1.0 and
v5.2.0 for the QEMU arch's we support and noticed for s390x system
emulation that usb devices have appeared in the info qdm list in the
monitor.

I bisected the change to this patch, now commit 7114f6eac333d99b, which
does a 'default y' without any conditionals. I'm fairly sure that was
not the intent, though I do know what the proper conditionals should
be.

Can you take a look at it?

Thanks,

Bruce


