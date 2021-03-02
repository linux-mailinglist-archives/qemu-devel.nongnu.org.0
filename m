Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D4232A4C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:49:37 +0100 (CET)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH7HE-0001Mb-8y
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lH7Fr-0000YX-BR
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:48:11 -0500
Received: from mail-dm6nam10on2135.outbound.protection.outlook.com
 ([40.107.93.135]:25696 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lH7Fp-00035t-Bp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:48:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7ldTLiLffZ9eTlZb/dV+nlfcatS+q60KucGBUpAYtmvwtGTiBzwe+COmcgwEZzOpB7x5Iv4J6THkIxfY4cplwWBBDXM5Zr9f1i0GCNU9osnqHKLwInZvbHr/ci+ILvRaNY/WUFkp0FEvLUiqqvs47Z2ah3xA9XbMrXuLNP2ux9wzOjp3ZaShJgImt8Y8oNXSYYLRvcY5zAn3MEajPLpIT74cje49AB6lvcwxTOe/hBOGx3SA/eFgCvWCO+j5mEBmcLt+EzKDqPbo520uqLvXP0y2fCtYO6C6KbvPUfSPtwCOgrzNvY+1KCrB9lt4EcSGGRyKD/SVbI7Z5hT2Zg6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AREZeqAW5FztlY4gdPULhAU25hsCLIpjxMIlm2UCN8M=;
 b=DoT1GEoe6jrfR2hB4PzNJiS2nOdFk/g8Hf9XYd+/JoV9xoklzH31pZEY0JfxW4BTdiJ/Mauh9hoiTfBFhpba4dM0WXmR10TZqS3TQkNOM9kwk3AxiIPnA9brviVmDV1GUFELDVy/LwWDhIET0hEQ9IQgyDG8wWDE1cfdoikidZ83l5cN3ZqU2cyHQoB/1gvdAq0oVmEcG6V4EJFM6xYrfbTgk16eCE2UA/OXpVABsaDtWrm4JRkJTO8pJZDvkAK1vBwVkve8FrFv/5Q+RHpx9cX5WMWqoR0+/3h3wBT1hL2OlcPpBGEZsq5gLrna5eyTAkQKkK/yfQanMCnKE84VTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AREZeqAW5FztlY4gdPULhAU25hsCLIpjxMIlm2UCN8M=;
 b=hgLeiiSf3n1KTDtd4WL+gnLAEcJHIZ12ri+cIIVPyTFiWG0E4kcN+3gDLyDIJOk3LFSoj+KpwHz4lT4KgLyYSnkfHSsdWyZt8nmZ1yuFeZoT7B8DV9FwNpUX7cuxZjX/MrXYW4f6Kxo9P3iz5KwuckniS2PBctvS+O/PHcwEc14=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BL0PR01MB4291.prod.exchangelabs.com (2603:10b6:208:4b::28) by
 MN2PR01MB5901.prod.exchangelabs.com (2603:10b6:208:192::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Tue, 2 Mar 2021 15:32:59 +0000
Received: from BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::2867:4b4e:c7c:623f]) by BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::2867:4b4e:c7c:623f%7]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 15:32:58 +0000
Date: Tue, 2 Mar 2021 10:33:11 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Message-ID: <YD5atyGBcnxG8+ZK@strawberry.localdomain>
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org>
 <YDQYrptOxAjs0Pf0@strawberry.localdomain>
 <YDVrYk9O2gBPwxe4@strawberry.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YDVrYk9O2gBPwxe4@strawberry.localdomain>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR02CA0102.namprd02.prod.outlook.com
 (2603:10b6:208:51::43) To BL0PR01MB4291.prod.exchangelabs.com
 (2603:10b6:208:4b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR02CA0102.namprd02.prod.outlook.com (2603:10b6:208:51::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23 via Frontend Transport; Tue, 2 Mar 2021 15:32:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e941e770-6851-4686-85fb-08d8dd907536
X-MS-TrafficTypeDiagnostic: MN2PR01MB5901:
X-Microsoft-Antispam-PRVS: <MN2PR01MB590182E8E6B5117EF1DA06068A999@MN2PR01MB5901.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lSqXsM2EneAAlWKODpqJ0O2no3S2xYKkPoAibzXwdeQBSdjxFXuP2RzdINzoJwgxKRjXgC/P1n7e/qIIgyOITYSPSubwnnBe+PyRT5i5o/JOKG8KZVyvQs8xbK1ChtlJSZSX74FFHlOKq9ZyiF94AYGTdO1cL1pisUSAnWsMUhInapYre2WWSIwuy5AfRovxgXWfaxP8Sro6iNzDqFo3XlFE6bS/xICzJAqt2SdL4UivtYpxW4F+CdKoTnFVk66OKlxCl1RUeiJ4HHFwH+KGCgAB/Pn+dG49VQ7kfwOUGWyhPUkm5tVKorwmJRilUJyy47BaVoDDOyteI16qTMhIROzlaRofhA8KKc/u+uEVZAURdbsnDwGCuhxLdrYouQ13kfUdLWo6PC2CnQpb55vWuNpF/KZ6weiohOt7h1Vtmi5MPlvGvDPWlo1Bq7ClvS3Hmmaj1ypnAJ4PRZ8ehB4jdM+toVIKo7e5WfnIKH3JHIBQFzvdYmmd/Jv60TtVuQgB9lz4w+EXa+O9JTzi/Z0ZyG/8yUiFR69gIoH5rAjUUztpfGBrTmycBe5TGJE6pe5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB4291.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39850400004)(376002)(16526019)(956004)(26005)(6506007)(7696005)(186003)(316002)(478600001)(52116002)(4326008)(86362001)(83380400001)(8676002)(66476007)(6666004)(2906002)(66946007)(5660300002)(8936002)(66556008)(55016002)(6916009)(9686003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?U7xYdc3lJK79q6dWf/qoyGhQtqTS/RFg9BjAGFAhefMyZUOclDHfZOTljp?=
 =?iso-8859-1?Q?rD+odq1r9erxnDwwm8V7NRRCkMac++4O9qpmBgttLQqb2qZa1zsqfg316u?=
 =?iso-8859-1?Q?R8wNhDbdcltjith7t/Sqk1rUHM6z9LCmBybBT0b1fbfjRqbjethkm8bdMA?=
 =?iso-8859-1?Q?ha1btj2f0dIPbKLwvyKqbCi1VgpDUr3HeyQeJjQk2mZirZlgN1u6cX5Brj?=
 =?iso-8859-1?Q?mrv1xb+FmT5jsewPpoRmwSNg8Ft1VPWm/Fif8VTlD0xbL50Be8auKQkG/f?=
 =?iso-8859-1?Q?suxb542H3JZx+/6XWnpQ4KJoNvB/cOcyuBL/43qxZPe5nAI5YQh7FKjXRj?=
 =?iso-8859-1?Q?Lyz/F6Bk0E0jfQ+P7EWBIT/4+PtNNqArLOQu4NDl70viFEh5kwhhXzS5Z4?=
 =?iso-8859-1?Q?ofQ7K8ifStNsC5FJgTWwe+nwy/XUhVjGhhlEY7hN3eGwpRG4E4zUlxNJY6?=
 =?iso-8859-1?Q?mKfdGzfdLujDHRvqBtQ2g3M/d7jdvrjpncmwvVPQXwUjo0KI3BWOnhDDQr?=
 =?iso-8859-1?Q?dIyxq53qhm2cwFv4uHBOUlgJWPtIypkhRnBiX6SIL8o/oiEuRQ8PUP0jSH?=
 =?iso-8859-1?Q?ax+j0I3bAxPcf6IBqlY1ovWmk95HLa28Rtv4Ka/N6zXGo7zb0k5Vku18vS?=
 =?iso-8859-1?Q?RZIN2Trro/ZXVR2kQ+lndfRtK2VAxf6Dsg4PDyProJ0QCuOdyj6CjDLM5m?=
 =?iso-8859-1?Q?BRkXCxchEijAzrOBQ+KmE00UX1BKXnlBJupRMhXZ/bqWqV14FqLRqXDxcM?=
 =?iso-8859-1?Q?Pm6s2Eq9O91DSyiba2oOYMVAg9b3aFXEhgx8aUz4VqQdB1nLSD9tcWHOlB?=
 =?iso-8859-1?Q?GqchIsT8YLdrloVNILqCn48ImVYmdgjIYLBJ1roEhM1j+DGvcY5Yctmqnr?=
 =?iso-8859-1?Q?HWS0qFZBp5OpgU4M2IdmK6+1xtysZZ/J0Az/6gpDJtfjMjZUsCmtnUc7Qv?=
 =?iso-8859-1?Q?Q/Oh88aSIj7p9rn9EdUGhp4YugZf2fRrzrsTUAlpe8MlTY4XbEmfIlKetj?=
 =?iso-8859-1?Q?K5mKBqaJrYkIU2fbLsSWg5gNTrqJcRJJk1bj5dJf1nG3yE+65DtWH6IUnn?=
 =?iso-8859-1?Q?eoa7dOXOIJrceZQsI5rhPRXeEUuDQtjF2aMZt28yZ/UGuQfCOa1JUVJHOe?=
 =?iso-8859-1?Q?c7HMqwdCyq0jxohioSe/Pf5XctG60yGAzgMgEIzYa/UiQYgM/RNrLXcLvh?=
 =?iso-8859-1?Q?6arrd4nQJzNqfoppiRdHBJzunnUPqh1smbdpYQWbj30SRdIxUyoFaGr3EK?=
 =?iso-8859-1?Q?JBXQazrKxYrqnWAcmR5+6jhxG6pv3pNmK9XGjMHLOv41ZZnEV3rgtnl7Jg?=
 =?iso-8859-1?Q?U7GMxx3Lk8l7IXMEMsM7u7tlpHVTF5kf7B4o2dmOiZ3lLAePfu7GbO16By?=
 =?iso-8859-1?Q?QSZieFCXlP?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e941e770-6851-4686-85fb-08d8dd907536
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB4291.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 15:32:58.8629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVMX01PiU6ytv3Temf7r/ZAlH9oIgwXKuwA/oivox1P9nVZkpWDSISTKHykdh+z06QOyq6weDPM3UCXnz/Rbr36dmLA0tkFpjF2/ceWptAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5901
Received-SPF: pass client-ip=40.107.93.135;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

On Feb 23 15:53, Aaron Lindsay wrote:
> On Feb 22 15:48, Aaron Lindsay wrote:
> > On Feb 22 19:30, Alex Bennée wrote:
> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > That said I think we could add an additional helper to translate a
> > > hwaddr to a global address space address. I'm open to suggestions of the
> > > best way to structure this.
> > 
> > Haven't put a ton of thought into it, but what about something like this
> > (untested):
> > 
> > uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
> > {
> > #ifdef CONFIG_SOFTMMU
> >     if (haddr) {
> >         if (!haddr->is_io) {
> >             RAMBlock *block;
> >             ram_addr_t offset;
> > 
> >             block = qemu_ram_block_from_host((void *) haddr->v.ram.hostaddr, false, &offset);
> >             if (!block) {
> >                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
> >                 abort();
> >             }
> > 
> >             return block->offset + offset + block->mr->addr;
> >         } else {
> >             MemoryRegionSection *mrs = haddr->v.io.section;
> >             return haddr->v.io.offset + mrs->mr->addr;
> >         }
> >     }
> > #endif
> >     return 0;
> > }
> 
> This appears to successfully return correct physical addresses for RAM
> at least, though I've not tested it thoroughly for MMIO yet.
> 
> If it ends up being desirable based on the discussion elsewhere on this
> thread I am willing to perform more complete testing, turn this into a
> patch, and submit it.

Ping - Is this something worth me pursuing?

-Aaron

