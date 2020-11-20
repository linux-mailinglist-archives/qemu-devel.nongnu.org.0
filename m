Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2B2BB08A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:29:31 +0100 (CET)
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Hu-0002Lh-Ma
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kg9Fp-0000Zr-5f
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:27:21 -0500
Received: from de-smtp-delivery-52.mimecast.com ([51.163.158.52]:42050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kg9Fm-0006Yq-R3
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605889636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXitTtr13wHTAjasbrTbBmqNFKosWobU8fqCA+owREI=;
 b=OXhxgS243OUjY4d51fENDA1HnTfn1bjHRQ/4zzosDStC5e2Lu9SzBNgbVGSLMCI6jQul9o
 fNni6oaclp+GZ37zD1CZn+UuAVA9V9i/4PzfoSXsXkxfz21gyjF7fnnXHDXyyHVwzgxFCY
 yRDNXzI1NWhg9SMdJCe7579TiRBpjgY=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-yg130XVTPWmUViZkn5irig-1; Fri, 20 Nov 2020 17:27:14 +0100
X-MC-Unique: yg130XVTPWmUViZkn5irig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiI8fjbiGvmZz76dxrmIYw2KS8V0PkcEVDTKfoTMiWzU83XU94OHjKJYGcBLhAxAPPEIq8pXdau0Ef6SqBhpB+nlS5c/eEguaNkpLIiRLWZ5tRcZ4hX03hUnYSFUtg+4MhGIKIFxn7JwMVDaGm8jre5Y0ZxOVBqdDr/TEipfKzF/Nws4C40T6lckJnz8/tiJomg0GLKwNl6ggv/8ORHIx3HfUv9MD8YjObtsqK9xCB4IaUYz7jT3wzoloHR8TgP/2J79UzbIgtuqwC8mgjf4GcYGqNdE02Ip4fzhJO2CWLWGMZ3k/rjdGxg/DEg8PesHQYeG2KWjD4wAGkwwq+h51Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXitTtr13wHTAjasbrTbBmqNFKosWobU8fqCA+owREI=;
 b=PdQMXf4ypebN4M0CBbNDmtKKhZVvtaUGLAMAyYcnyefTskiPNgwfssEt6jYwTOU185V1aOLdzFfOkX2hRJASx0IxbwqEj0HH4vrpRPvZRrpk4WYtE7PqrEc4QdQExKP/v+G97+vlM+hCfrdz0hJXY7LCx2WLENR19wjKgGVDFEm/LLMRkJ77K/IX2N9+8+Twt23JJtDM0NI1kDUfrjjyOwaemBBd4zz7knwW/31Qjm7+BpYBB0iM55DRcgaO0uG41z6xTHpaM8QvLb6wi9eJYsk4ZhKkyxr8CIrZtMKt+n+l37oepzZa8VR31V/6I34t60xSMmNFnDZmHb659F3FPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21) by AM0PR04MB5203.eurprd04.prod.outlook.com
 (2603:10a6:208:c1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 16:27:13 +0000
Received: from AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::9891:ed4f:b5a2:6441]) by AM4PR0401MB2354.eurprd04.prod.outlook.com
 ([fe80::9891:ed4f:b5a2:6441%6]) with mapi id 15.20.3564.028; Fri, 20 Nov 2020
 16:27:13 +0000
Message-ID: <f2b209e40e4020b31f6eb57671fca96e706351c3.camel@suse.com>
Subject: Re: [PATCH v2] usb: fix kconfig for usb-xhci-sysbus
From: Bruce Rogers <brogers@suse.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 20 Nov 2020 09:27:06 -0700
In-Reply-To: <20201120154506.2496906-1-pbonzini@redhat.com>
References: <20201120154506.2496906-1-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
Content-Transfer-Encoding: 7bit
X-Originating-IP: [63.248.145.198]
X-ClientProxiedBy: AM0PR10CA0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::17) To AM4PR0401MB2354.eurprd04.prod.outlook.com
 (2603:10a6:200:54::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.12] (63.248.145.198) by
 AM0PR10CA0037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 16:27:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24122cf7-94b4-4721-b465-08d88d7122f6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5203:
X-Microsoft-Antispam-PRVS: <AM0PR04MB52037FFB37C8EF8E7E9E46E5D9FF0@AM0PR04MB5203.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmly4YdffuAb0vWcJo7X4zloM4SdBao98s7ldhHM9EwhRUm2ipz1nv8hyTJaZ2W1U+0QIWXBbzv4EixW1jtsnlw/atMZyGvwpRBY+3pVW66+6vT5ncKnWZ36rzjdKd8LxleIvyIATunUS69c5xanznQ9TYfthJheUkanMOcPRtsgUziHY3Zv4rlALr/w2UsCu24qCmNwbq7dNjyy4MpCjyla4/fFtRBuA2oAkH6DPKyVC4Sj4US1+qbahvwWUjjbkZHQOmSSSJE/pgECPLx/VOzJeTA9XG3TksIMkSz6AcSk5g4B0qdNnpJo6qo/RHcpbx93SQnYDtMysJgNPwrTZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR0401MB2354.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39860400002)(376002)(366004)(396003)(956004)(4326008)(186003)(316002)(5660300002)(16526019)(6486002)(8676002)(16576012)(86362001)(2616005)(83380400001)(478600001)(52116002)(26005)(8936002)(6666004)(4001150100001)(66476007)(2906002)(36756003)(66946007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: X9LPIyzBKbBoRZiDkVch6EQn58Fv2UDeecAcUunK7HggFk7LD8+9DzoSfMMWyKKb16N3NmfpdsNXSp5enTVRzafNjx/zzSp9iTyJbEyDwqxtOdh7utWmwI0EmNtuk3lxlJjGiiAmZHg5qKy6ALKoKvFjssfkjCuGNKy7Tm5EzYwEvUPP/utZoFYBQc5TBz4Q178eSVrWgl3mPWIyi+HvxgBDWEa3zs0qKstY2i4wcKT/IfS+5opZv7nV2Qi7sJtRDcy3thGFfZ1Kooi4JuMCb/w40P1FYQO/slHqi69NdOiCC6PJscWL3rnkOHJpu2x/qmEVesy331ygRT+TFWTH6bDV3VF+tVDfXTIdxp2TDohe5IwfG77hSt7Mg7BVwLnX55/KXRz560dR2SCzzkZgHO+KZPtPAZTxTqbr3o2BRht1uSDJqdagbHrMB5Z/xD14lr6uXn8s4072EkvI0Llptvb7iLS1hEojsig9krAjIWu7GLw90l7aM/I0+55W+pniF/l0wgioOdXRxXmIsMS4bbmG6M4VSKIePh39VBtdVWHpx8tbXZf5ZNu3Yu/HroBdQ4eewCPZl02AkbFVjmXp6FTqz/oiVIF1r7hCDwGw71txHeF9Qvv1sBwUwAa9oxsi37/wS+maTKRQsepKJDd24w==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24122cf7-94b4-4721-b465-08d88d7122f6
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0401MB2354.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:27:13.3717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTJeDvvX4MF22xshAuVRim7MCBPWiGjukJ5Jy7td1Oz9ElgdpjJi0CJ7Iti6B+PjXEzNP9tbWKRC6mvJP+xXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5203
Received-SPF: pass client-ip=51.163.158.52; envelope-from=brogers@suse.com;
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

On Fri, 2020-11-20 at 10:45 -0500, Paolo Bonzini wrote:
> Remove the "default y" for USB_XHCI_SYSBUS because
> sysbus devices are not user creatable; boards that use them will
> specify them manually with "imply" or "select" clauses.
> 
> It would be nice to keep the ability to remove PCIe and USB from
> microvm,
> since thos can be disabled on the command line and therefore should
> not
> be included if QEMU is configured --without-default-devices.  However
> it's too late for 5.2 to figure out a place for the DSDT creation
> code.
> 
> Reported-by: Bruce Rogers <brogers@suse.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/usb/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index 3b07d9cf68..7fbae18bc8 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -47,7 +47,6 @@ config USB_XHCI_NEC
>  
>  config USB_XHCI_SYSBUS
>      bool
> -    default y
>      select USB_XHCI
>  
>  config USB_MUSB

Tested-by: Bruce Rogers <brogers@suse.com>


