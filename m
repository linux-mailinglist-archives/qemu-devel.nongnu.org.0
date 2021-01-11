Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9AF2F10D6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:10:07 +0100 (CET)
Received: from localhost ([::1]:55160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyv5K-0002J3-LE
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyv4I-0001sC-Ba
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:09:02 -0500
Received: from mail-oln040092254014.outbound.protection.outlook.com
 ([40.92.254.14]:13616 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyv4G-0004es-2R
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:09:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5qNXFID3wCApxmbenTRUi5WMqTjzXQN6dj3u4JhMopHm4VFILDaTg4w0akEgazi3xu8e1OtoQXMpbYNup1fgdhX0SZElOx5kpTynlest5XOZVTOQqaPj8j5Ch+bUPctb58IC8G2/UhKrsBrbEum9KdR9uvWrBt0Vu9SDAs5SqLu952yAf09PdybOFRYxxrSO4jYUmyuQxwBiXRkEoVpYcfywX05XXvHtyX6Wa2kW1ToQFbaAY4z6G4FHqqFgnsnGEEYBsGuZP6mJIfJ59B3OX1NzdeZYiY4u8VDVu8q/WmsRwLHaA+gMVFVp5Bn2I/1NGmHALVHvv2saQlkzYJRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zLAtkpPPi8uv7rjos0zrp9MMfUD7o9MMU32pwceQig=;
 b=TE94Ylr2LY1YchOBemtBiOllJxV5d9CVhp16Cde1hyLWMYchnt86Lan7d9x+WVh55N/xrbQejP4//hT6IqdP7UiFLNKU/OxVzQlnlrxJcNaRqim1+ZKIulQbBdJLHxtTU+A/nf4dDt6EPbdxOIBbBgubu15KMyBZS/rz89WaM0LmQCoU6IRvhiz1vzmeqo3qdyDGoonlFZ9i+IYJ/WLtmmdzN0G8e1kAlLSpzoedBV5HzmXJ2eq7vC+Urh8885ILB7t2YL9dlUojLfiOxIPifWlGkYhVKwI+6KX+yW33dJto6kZFjnZtV98T13YoD9P2l3dK50ALQubkXycuowic+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zLAtkpPPi8uv7rjos0zrp9MMfUD7o9MMU32pwceQig=;
 b=V3+sktIVY4CdL69mxt7TyqTN4yjREb0tJ1DSFuX7rdW9tTMluABWU2IQK9LR5Jp8SL048MXSpgirnXoJh0/7thEVOVT7iSzDdkdaAgfOYYv+mmwVPY2cXSNDZGlBx27i2DZeuv+BJnxo/UiLvtkZ9yZbOoVpQmbl3gzs2WOKrpRKnz02lccqTCS4O4AlSHvcvFpxBvtlCZvcJwd9Uo8p9RRAyWlu1VD/V1re30eXonLDs5fF8vQj75gaF+/mmly7hW9WOC4IvNXk9OE+BdvdquGXpz4t8o8YkIdo1QXyrLiiUgU6VDbYGBnARcVuOAY9PKxwRmvRN6VxRTJlpfG+PA==
Received: from SG2APC01FT008.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::51) by
 SG2APC01HT041.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::499)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 11:08:48 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.250.55) by
 SG2APC01FT008.mail.protection.outlook.com (10.152.250.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 11:08:48 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E022EA7123032A6BC3FFEF0BCBACED5BBA04892D2DB0752AF175777E28869761;
 UpperCasedChecksum:95CD22925C4DB9048090DF6893F078F77D1F416EC840A7E1E14F825F38C18AA0;
 SizeAsReceived:9029; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 11:08:46 +0000
Message-ID: <SYCPR01MB3502AD82A0DA3386FB1C5C9DFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Subject: Re: [PATCH v8 5/7] fuzz: set bits in operand of write/out to zero
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Thomas Huth <thuth@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 11 Jan 2021 19:08:34 +0800
In-Reply-To: <fc36e336-7295-53f0-85c4-bd3a4e63857f@redhat.com>
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <SYCPR01MB3502C84B6346A3E3DE708C7BFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <d3294c04-28c5-470a-d011-80dc975c7a62@redhat.com>
 <SYCPR01MB35029A99852F6063CC7C644CFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <fc36e336-7295-53f0-85c4-bd3a4e63857f@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-TMN: [9bgNnHZchEeYJcMhwbysVL8XNG0N6Hwj]
X-ClientProxiedBy: BYAPR06CA0063.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::40) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <56315de4ca4e7535cde320d85599231d45dc3592.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.225.148.19) by
 BYAPR06CA0063.namprd06.prod.outlook.com (2603:10b6:a03:14b::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 11:08:41 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9d7ec95a-d3b4-43be-9b23-08d8b6214446
X-MS-TrafficTypeDiagnostic: SG2APC01HT041:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cUIch3XPMNLtN+NrGeTMxeNUgEkB0eVakNToEwdyFaoKl2WpgZxv+/vU2d20wtq4INw1jBQI2GyCLVQrI/89hUekM4Lf6ZDTksb05WD//CPNHCjxHwlrIcEQ+GWF7epWRJD0DRi6/qg8rtzbVSpkGIZwgUualgmyxTdp0abYBAzv0XlUjVEYlaM/WYeb/vXM1jGQmGaUCBI8LIt+46y/BNy7c+CRY3v9V+fx4I8iSBm4IZGixNG+2d8r0sHjYTwctmdVDyRUBdv97vGj2oXY0s6jt/rpRQwiZzb42nMttL8=
X-MS-Exchange-AntiSpam-MessageData: QM1Kg3em/Iqv/xpNkLcjQ7/7JUy+jwVVwnGNt6BhaDbA79/0bfhL5MIO86SeBlqA3uQV97KbcW/j3I5dZCsv91R2S9NjgQEA2WDjUfhJgKwEXrfepaW64YuGLxdk28IxVgn+IpfdtTtE8nzZ6spKaA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 11:08:46.8099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7ec95a-d3b4-43be-9b23-08d8b6214446
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT008.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT041
Received-SPF: pass client-ip=40.92.254.14; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: alxndr@bu.edu, bsd@redhat.com, darren.kenny@oracle.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-01-11 at 11:26 +0100, Thomas Huth wrote:
> On 11/01/2021 10.39, Qiuhao Li wrote:
> > On Mon, 2021-01-11 at 10:01 +0100, Philippe Mathieu-Daudé wrote:
> > > On 1/11/21 7:11 AM, Qiuhao Li wrote:
> > > > Simplifying the crash cases by opportunistically setting bits
> > > > in
> > > > operands of
> > > > out/write to zero may help to debug, since usually bit one
> > > > means
> > > > turn on or
> > > > trigger a function while zero is the default turn-off setting.
> > > > 
> > > > Tested Bug 1908062.
> > > 
> > > Please use the full link as reference:
> > > https://bugs.launchpad.net/qemu/+bug/1908062
> > 
> > Ok, should I submit a new version patch? Or just change the commit
> > messages and submit this series again?
> 
> I can fix this when picking up the patches, no need to respin just
> because 
> of this.
> 
>   Thomas
> 

Thank you.

> 


