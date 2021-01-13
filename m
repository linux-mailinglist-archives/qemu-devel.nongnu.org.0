Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6872F410E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 02:21:49 +0100 (CET)
Received: from localhost ([::1]:41152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzUr5-0004MY-E1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 20:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kzUoW-0003QA-Sy
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 20:19:09 -0500
Received: from mail-oln040092253081.outbound.protection.outlook.com
 ([40.92.253.81]:40352 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kzUoU-0005k1-Gc
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 20:19:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7Fm2vsv0OdzgSslmJaxCRFfowaz5rcGbqxKBG9SNImYYJUy97wjsRSB9Px0q/WO+U/tHSloDfvpiiUdZUGEaLiKVSERt+fEppNzuw6+f9vikAuTAXkH21bDkRwLWPzmjmEFia+itu/UrPOu7KVQ4tEE4VHY6BUX+TX3Eidsh0YobQE9qXpobn9tiogYdyDSRdxMHKdjqfWVA7oCIKqxCpLO2Tdhv790dYVYO+YJ+1W93yuiHL2f+qs4xWhbq1DRs2h7tQgsJeietLCILiWlzx/qH0Rg+z40AUKcqxgaA4HX2+HxZ1XTxP8L+4rSByGy8hePMR94TUklrd7SIT4tSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yKBeti+j4KsESFwjv3eGsJ8hvaJG8UON7e+giDVbo0=;
 b=X0vCrGpKi5SuHkDoh4rr5fQ0jzBF5X0l8D1zHSToFQLCaof59OH7Okc+G5mi8XofDJWKEFapjQqfNF4wwrvxygkbgAY2gQ1RrI8vI91GUNAFjQszacSj6ElEgphKtrMJeYGjjToVPvZsneqth/WWbrC1nI2lcvuCemiHLMewnNsIpy+VIRUreWIaRhv33yGCk/0m4z2Jr3Qbdn5oIH8b363Y8gSSnfgoPdelrBqVzvXEYNRiRAcGJ6I5rksCPzLg1WWQWRpG7FgqedHvjDYxaeMSJFXr0KXN2Y/L28fSLfJ1NBFK8wAbqpX/zOaznzbmuy2FN1TvjX+Uijh9iCnwxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yKBeti+j4KsESFwjv3eGsJ8hvaJG8UON7e+giDVbo0=;
 b=DRlz3RdqcX0xEBTzu5KfUyxTBlDNcxF6nCuPE4whjBBukK+ZInloV1ypUpfyyEZpXwPGF0W3URZu1jzQHUvyKDtqEYzIoKYGMaqgCr26Fqyhc8d+ju9dwwh75RT+yMhuBlKFKcxQLRK/6K3J2QH+cZAJkx0Qqdx8W58CVtyfwHOKxG9sghspLsHbuq9B/YE6BJQ0j6Wdc2kaaEek+QC+PCRUfCvtk7uDOsSKvrSdbeVBEL2nwrOs4hbQAeKE8U7p6+IMS0Tdb3QxSUnh8a83rn1dfNC6QxXcfLsmevJ4D8YtCtRJsusenngb822rkBzBpKBmn9USUmHVaGFWB6lgCg==
Received: from HK2APC01FT004.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::46) by
 HK2APC01HT150.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::448)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 01:18:53 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::44) by HK2APC01FT004.mail.protection.outlook.com
 (2a01:111:e400:7ebc::125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Wed, 13 Jan 2021 01:18:53 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DFA7426CEF45683E3EE2F38EA2CF6F89B6E2B09A175BC7356B3004C127F12D1F;
 UpperCasedChecksum:D277DBC91EE8ACCAE45FBE1313DD7CA17F75A2FA786BDD4C2EA670C5F3BEF9B2;
 SizeAsReceived:8906; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 01:18:53 +0000
Message-ID: <SYCPR01MB350211DD760B451B1B9B7E57FCA90@SYCPR01MB3502.ausprd01.prod.outlook.com>
Subject: Re: [RFC PATCH] rtl8139: fix stack overflow if RxBuf overlaps MMIO
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 09:18:42 +0800
In-Reply-To: <CAFEAcA9Wpc_-pcwGU+=MbRpEb5x5=qPsBP2APvdRe4gK6+WAVA@mail.gmail.com>
References: <SYCPR01MB3502B0D05FEB1ED21532219EFCAA0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <CAFEAcA9Wpc_-pcwGU+=MbRpEb5x5=qPsBP2APvdRe4gK6+WAVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [20ZgyPQ3+ETzdMflghQr1lpRVGMeHFrf]
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <ae3f521bdb98fc0d574c0f4aec8d692eceaefe0a.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.225.148.19) by
 BYAPR11CA0073.namprd11.prod.outlook.com (2603:10b6:a03:f4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 01:18:49 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e4d64243-a1ef-48b9-51f1-08d8b7613103
X-MS-TrafficTypeDiagnostic: HK2APC01HT150:
X-MS-Exchange-MinimumUrlDomainAge: launchpad.net#6197
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+o5I1AIDU6/L0J9ULnDKBSv3zap5AuApXg6B7/gU/eiwvOku+8XEL0zW1KIGpZZVrUphSaSxebZf+5EddjWlnW7chEeNWCPQVvHi3nvvt8VRwMsl+D1JTf7SdjjBrxLwYcIU3fBiemy9uLWDIq2o1A+L5zb6N/LEB1NIg4a5ObBXEw+YI+l3OE3psbn5e7TfQd7yZT+HUDBqZO9a7mfGxDlTOwigwv2dcMVocVEPkYrnNkM4P2ceYm+rw5ZlVCZKNfpk4TTv16I6ZlgLiYGpqtlKDkS6DC3X7Dy0asQpMk=
X-MS-Exchange-AntiSpam-MessageData: QmZn1Jmy/uH8ut5hk9XL/MVjur4AWFb7q8JXlEXM/7GRxtI/9qOIVTDqQ6Ckt6oEUT1wB3LkVDBWmjLbUhYgjKYZDkjZI630BeQ4xJ8dDgAssZG6RZFJSdD0vl2igBb2ReR1ceSiUW7AkUFXjFHNvw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 01:18:53.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d64243-a1ef-48b9-51f1-08d8b7613103
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT150
Received-SPF: pass client-ip=40.92.253.81; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-01-12 at 16:02 +0000, Peter Maydell wrote:
> On Tue, 12 Jan 2021 at 15:23, Qiuhao Li <Qiuhao.Li@outlook.com>
> wrote:
> > Fix Bug 1910826 [1] / OSS-Fuzz Issue 29224 [2].
> > 
> > In rtl8139.c, the function rtl8139_RxBuf_write, which sets the
> > RxBuf
> > (Receive Buffer Start Address), doesn't check if this buffer
> > overlaps our
> > MMIO region. So if the guest machine set the transmit mode to
> > loopback, put
> > the RxBuf at the address of TSD (Transmit Status of Descriptor,
> > MMIO), and
> > trigger a frame transfer by directly writing to the TSD, an
> > infinite
> > recursion will occur:
> > 
> > rtl8139_ioport_write (to TSD) -> rtl8139_io_writel ->
> > rtl8139_transmit ->
> > rtl8139_transmit_one -> rtl8139_transfer_frame ->
> > rtl8139_do_receive ->
> > rtl8139_write_buffer -> pci_dma_write (to TSD) -> ... ->
> > rtl8139_ioport_write (to TSD)
> > 
> > This patch adds a check to ensure the maximum possible RxBuf [3]
> > won't
> > overlap the MMIO region.
> > 
> > P.S. There is a more concise reproducer with comments [4], which
> > may help :)
> > 
> > [1] https://bugs.launchpad.net/bugs/1910826
> > [2] https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29224
> > [3] https://www.cs.usfca.edu/~cruse/cs326f04/RTL8139D_DataSheet.pdf
> >     5.7 Transmit Configuration Register
> > [4] https://bugs.launchpad.net/qemu/+bug/1910826/comments/1
> > 
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> 
> This looks like a single-device workaround for the generic
> class of problems where a device can be configured to
> do DMA to itself. Why is rtl8139 special ?

Understand. I thought it is the device's duty to avoid doing DMA to
itself.

Thank you.
  Qiuhao Li
> 
> (I have on my todo list to think about the general problem.)
> 
> thanks
> -- PMM


