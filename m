Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC96513BA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 21:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7MYs-0007os-Bx; Mon, 19 Dec 2022 15:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1p7MYq-0007oi-EE
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 15:16:32 -0500
Received: from mail-mw2nam10on20701.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::701]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1p7MYo-0006dp-Bs
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 15:16:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAhF9ah4XkEmzqqsKQUUc98NxHC+Feaf1tvyA5nsC15kwVVn8JzH4Nr60aSTdNMqUtF8XZpODuxos/PaBwwwuWcUzueQFd+6DNgTbemcCXRy1WRqQZ9S8eQy4k5n6fe1+gLeyKYzjeQ+4iKoou/b04tzLD7X8d2pVpsMQ3ZL6cMKtdSWFdomKsjH2PjPUjrKgFYfY5MDiKhHB1w4rn/zn1ZJImmi0VV/c21Ip+KExRV6BFDpZJrKTouHBQ7+z43c9NbyuEOb8vAc1wsMh8yX4oFLm+PTIlohQnqWvm+AHTDa/rb9rccnW/ask/zdf6H6FJtofMN8dY3FEy5ZQpuhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viHAOZGSGX9xf5wAz25LkQ5VBM9OZZNt+f3XzwcYxlM=;
 b=G34JbgU7yBwUQuXK0m2nbw0EinLYXeRRhayTd8ml1iLBgA0T7PEpvms2cQbWq2bwJoa3KpEokCHErosQGu9XW+oRljyRgo3bCaMQ8e1pSxwLt+62LkiA3jBkQYKBXHXzudtShzve5ZTR4Nc8C7/B+PVNFwO6Uzr1/tAa9TPq87hoIv/oXIeZ5qgA7UIeDdNrb4pbuMYZqkbOz4VBBuGSQrkAbDqhyGeOEweUHYdPFH9K4SoCVp/tjHTJMPZMlCHlk4/ivvpF5vE5HQnsHCquUn4obFMc42a1pLsOUu23EQiM1Bq1hQ29HAdK3Ds/t2kCByTJ87tKRV1RBrJWNe3hrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viHAOZGSGX9xf5wAz25LkQ5VBM9OZZNt+f3XzwcYxlM=;
 b=WRJK8m8dalzzQrN5JBYlLiC2wYpFRoJqf4B5V/Us431eH4ygxvPgj8dWRSqm5IyswX16p7CKL5qBR3rf5qTFQWvWoMYYYR9pTYGTdk9HQRoQqkmw94EOx1ivw2CxPCMgAq6Zqggft4Fks6TYsYqNf0s7WUpthNdm8m4ThUO7AE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 DS7PR01MB7567.prod.exchangelabs.com (2603:10b6:8:72::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 20:11:22 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281%5]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 20:11:22 +0000
Date: Mon, 19 Dec 2022 15:11:08 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Emilio Cota <cota@braap.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y6DFXNbHGu7boW6/@strawberry.localdomain>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
 <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
 <871qpwc6i6.fsf@linaro.org>
 <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
 <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
 <Y4Ztn91bFssBdbmR@strawberry.localdomain>
 <Y56kG439aHBbKVLK@cota-l14>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y56kG439aHBbKVLK@cota-l14>
X-ClientProxiedBy: CH2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:610:20::36) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|DS7PR01MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: d0787e59-c4c3-4dc4-c722-08dae1fd3245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9A4EJO9crPWMKQ1cayzBJDOgk5WfXX+bkjdjzI/gp3UjOdlPiEPz2zOm8i0f5I4C0DGy49kJgtrX1AaXqWKN0N95yMRgB7+R1VXbj6hOjsOVrwM6qBRNrj6U4Kn59EKaNws5T0jSubo312yc4uk4WaOuQ/tpsvOCmMY9Yi+C5iE53Rrc9YjIcQDphSZKLl/7Q05EKh5q6IJYCL5XoOUOEkyFN3RNws+At4//Oq0XEQNl/ROSnFN/yOVyV9zDe0Fl/DNVK8OlfgnzBWId6mVG2GwaifMfAe5pW/9g8IWzAWqBbhugljdo5aZo/16UtheQqZoze7q8AkDJminSi7xL6sCggsmVidyvVOjLf7dVuncYDs0Eh1/JeBvxRjtIcwNJmw8R3UcK7vzpr6ol2dO0Lja0XVlButy+VMetjnhfBZo2Sum4WMO2MsBQo7zwObNP4KDqlMpMChMV4cwtQaHNrRyTR1lKBH1rtLBw9rEbnjeKzacxl5HI4P5sho7Cz++mNcgQHrWs2VHyoG2m+6CXWfWP4VxdrZpC0cds66hYvVwHjyr0x7DO8ilf2iwFN1VmPGZMA312YHaIcaU+EitXMYnytAPDAa/O2Dg2eNyF3ubH307/d3tLztpzcq2d7ZM2fLzjRRugaS41rvUmMzuuwHtZqFWENKaMhuBIdnzn1S4sHLSKSa9V8zTyD37lBXRGjPluo3WXmIJXl1MFKCmXGfK5sfODMNURFEmiKNoN1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(451199015)(38100700002)(41300700001)(66946007)(3480700007)(8936002)(66476007)(66556008)(4326008)(8676002)(5660300002)(53546011)(478600001)(9686003)(26005)(6512007)(186003)(966005)(6486002)(86362001)(6506007)(2906002)(316002)(54906003)(6916009)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?caO4zSXhiDV7MbUaFW/MYNAfymsc4UX4h6Fg+OusX2ctLS+N2xJ5XYoOdqto?=
 =?us-ascii?Q?rbH+Ekah09itzCpopJ86uAlo+ghSXUN/IwCj7mDgl5PNLAxKUAx7ndqeNO2a?=
 =?us-ascii?Q?zi6f3iSVWW6eClRrJkZnZbxs+5dd4BWbbM4zt6L+eludPkPjIwuQMxReVZ7i?=
 =?us-ascii?Q?3074wBsh8W8ndVee+4IPpgVApCDS81Q4TVBZogRsKga2S2zMsZUm763/dK9a?=
 =?us-ascii?Q?JHDAA4KSXaqbaMBdXhxzw6rE8o03BAkhNjviFFGcTHyEJIh6qAk9vHePyKV6?=
 =?us-ascii?Q?OLbpuwils+TYSuakIv04P3hFQFPsjRhZUi2SM6eAHDhxb+8jiNEjXOsHkvcR?=
 =?us-ascii?Q?cyk5HOMRkYmnJo4v5IU9XY+2yczAJdWMBhCgjnKMbIjMFlGLRxIAoXyp6y8i?=
 =?us-ascii?Q?ItIk2mx7VYJ5IpvKVqZ4u5ZguzJPxKbKefoANvhYen8hY+eQ1bnOVqov2KHN?=
 =?us-ascii?Q?uyXS8Qv5lKAhV95jSnFSxMmaOtJSyqF/+Y8KKRSrMN0zmJ4bhvHkHL/lEeAC?=
 =?us-ascii?Q?Qbc992jukXVwh5EPVbp9xTdFvAoHvrhhPvi0cEB+YFp/3qJNczdmJzfAeAMW?=
 =?us-ascii?Q?gCMvA23e2tbSrxMoO5s0zxNvedfqvQORQI5ANQ82QH1zmn9ou2XMvhNNfnAK?=
 =?us-ascii?Q?VE56eA7m2FKPSIFJbdQ8P3dbDzhGPOb1PcraNMIUh+YmaoBgShRpGJcnUbn/?=
 =?us-ascii?Q?0FBuHLks+/3DpPPpnzocfLvHSBFXk5TIP5Lx2lazR2wdOaeKAcfMsYW1/677?=
 =?us-ascii?Q?3u0K/f0NnDb+nxcXgwJFhVrhZodsNCi1lo7xY0/PspenH2ukbXrhGKu/yGYM?=
 =?us-ascii?Q?K9GJbNA/MGL6TPrSIG6TocLeCmik5f6uj2Z/3OcrZVDMKN8lYQv8SSS/Dx3Y?=
 =?us-ascii?Q?QhhCV93YomZUDYxmBFEVVbsCzWqN6SPKZ5QNyW3yjAVRWDKY1GFWdBj50ZdK?=
 =?us-ascii?Q?T3xfplSOOYUOypI3x/WmcOkk8jOBkzIxl+tO2E3ZBBV6Z7kZv11kwe3GxMfB?=
 =?us-ascii?Q?E1XRnlAaysNAlm+GBsxQcOhOeryqjF2GUb4EddKuBlcywYUCCpjngLy24H7J?=
 =?us-ascii?Q?HN3wbFl20VT3HsPE1q6U1+zMOKg2i4kWV0hkxr0w4ogr7LJjYoBLYlw/ye7S?=
 =?us-ascii?Q?SyFDwz/U7Yyjv3VOnR3PH8q+4qH6J9/J8JxrabgLCMp2pXAd5ooWlHJkUShd?=
 =?us-ascii?Q?yOYFfAuuQwzWNlvpEf6wK+g+R91Y315RrW+94FIRKDieMpmBvg+SOvxyg69+?=
 =?us-ascii?Q?IVe/moxjSFjwAHD9Gse3cRrAXx/1hfqyu0z3rEMvcaOYAoZxBcGUEIOAF4Ly?=
 =?us-ascii?Q?CqwS9DAqTMtKd7o1O0QO5efKiY1v/H3ejxzL5BtEFzuZAzGM1X/SVJiLsOWR?=
 =?us-ascii?Q?KPGNIoDpMlZK3V61HWZJdVz1IMFEtcrW9rVmdQJQfphBZlZoc/aRSsPhiOFP?=
 =?us-ascii?Q?z+0B1YbPz3TIRMobkn/uPADd9zBXLVB8w5RcXpEawvWTcl0QOheaRObUI4Ua?=
 =?us-ascii?Q?4XX2ab9BUfgeGelGSLwgFx08icnhciJC46S9JL3H2ZdDlibwTVZv/ggkmybB?=
 =?us-ascii?Q?cmLHRdFlRYaaXCO5MF0HuFvjkXH9ljcPrkenzTS/OZcQuJu/aQnhMWxgIC3u?=
 =?us-ascii?Q?DU/cZ/66Q+UlqfOB0AYV024=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0787e59-c4c3-4dc4-c722-08dae1fd3245
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 20:11:22.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwXaSFe//y2gxRzxRf7HYwUB7jrALtACcmtTKoZbLQiQuPNBi1AjTFfgkYQTy7VSJrAFgZfFLshfDgHhoFQIUzF4pMksPyZuuomrtyLg1SJXS/lY0R8mImKn3e4p17RS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7567
Received-SPF: pass client-ip=2a01:111:f400:7e89::701;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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

Emilio,

On Dec 18 00:24, Emilio Cota wrote:
> On Tue, Nov 29, 2022 at 15:37:51 -0500, Aaron Lindsay wrote:
> (snip)
> > > Does this hint that there are cases where reset cpu->plugin_mem_cbs to NULL is
> > > getting optimized away, but not the code to set it in the first place?
> > 
> > Is there anyone who could help take a look at this from the code gen
> > perspective?
> 
> Thanks for the report. Just adding assertions was enough to uncover
> several bugs. I did not reproduce the use-after-free, but by calling
> reset from a callback it's easy to see how it can occur.
> 
> I have fixes in https://github.com/cota/qemu/tree/plugins
> 
> Can you please give those a try?
> 
> BTW I created an issue on gitlab to track this
>   https://gitlab.com/qemu-project/qemu/-/issues/1381

Thanks so much for digging into this!

I rebased your plugins branch on top of v7.2.0 and tested with several
scenarios which reliably triggered the bug for me. None of them
reproduced the original problem (or hit other bugs!) with your fixes.

-Aaron

