Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8869E9A8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 22:42:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUaOe-0006A1-QV; Tue, 21 Feb 2023 16:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUaOL-00069i-OX; Tue, 21 Feb 2023 16:41:42 -0500
Received: from mail-bn8nam11on20700.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::700]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUaOI-00058A-Is; Tue, 21 Feb 2023 16:41:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7CK7VpdEPcixolb2jhRCM7vE4rgpVG4leLe23nkhcaGeM0EefNoPDX0J2sm6bOem8OtbbfoHtKP8i8/damMi6/iOLVKVWUs6+eF+YcMuyO/bAelGVBV0HA48f6yvUdBhn7+3hBGu5V6SR5pHvjYODBQNmUwGJxPNAPc7xUe1Iz1UPn3d2nbP8jZhvvITZdfQhXSSD3+AqfVBVT7/EEQXoRcj+U/f6OuzYiOplIGi87P/TEwDcwUA0o3GfDJkhI2BKUsDxVETuav9ZKRCysaKeWa7INP38Wye+NlNair5yNhXFjSHCC1MYxez9w3BD3JlL5u0dHgooA/hqf2zObzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EviAXVR2RgCeLPAdUCqqAqlDpH55ODeqmoFNcy231LA=;
 b=Tl05g/fXiNMJgy7IU/SrnIIfrpBgOje4ziAq6gdtrFZSqrMFHvuvDMGQ5OzDQBGgNuaXjmIX/a6fNXdnhqb2jkm4CshbSk2FImmDrG7uiws1hAE7KMAFVeqFXUnHc5YwiMtIqy0TUgq/XyZNWe8gYlrI7W7asdG/jmzbHUXIRxxV799Yjv8fgWLJxrzsfuk/wZxMxa++y5dQRSy01IfEOOxOvPXp4GofXOLdIphh9Ds0XURGmMsyQCGIPoY5565jGxeSh9ZPgQOMt9b75TheEkPnnlPBS2J+GTKtzxNXdi0taey8Y7dp++Rz4ATYurg0OSps2NERRFwpF3m3LxFoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EviAXVR2RgCeLPAdUCqqAqlDpH55ODeqmoFNcy231LA=;
 b=clbV2DHfTmebh1BQ5jtPnbO6anVygPWahQQChlxdgPG3GfYiux5ux7Ortuvr/cm39ttnkrakCy2XDVN+e2Fuu1esVmU4K6qKR4wexrkD5edQ8qRxvAjYrMEhGV5t42unUN7kHRG92BHuby5dw21h1/5/SFvmXFylQv7oTah88M4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA0PR01MB6220.prod.exchangelabs.com (2603:10b6:806:e2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.21; Tue, 21 Feb 2023 21:41:31 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 21:41:31 +0000
Date: Tue, 21 Feb 2023 16:41:15 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
Message-ID: <Y/U6eyck3nW3cu3o@strawberry.localdomain>
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-2-aaron@os.amperecomputing.com>
 <CAFEAcA8uVVCfWwEYVs5ATzi7jNh9--cN+TVQ63M_ZW_bWwqtxg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8uVVCfWwEYVs5ATzi7jNh9--cN+TVQ63M_ZW_bWwqtxg@mail.gmail.com>
X-ClientProxiedBy: CH0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:610:11a::21) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA0PR01MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 49457f6b-9c16-4c8f-750a-08db1454650c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qCFe9zIxO1lyssSdm9ySE4LHV8Vr0AGQuvinTFS+zciyNCFRbdHLf+2pDz5aH54Qx1L9D+HrwhLhq7DrUUhnFl/W582q+AYMgm51d21Nc11G36hZlU9pBlpf4jnd9sS2Ico+a3KSwrZXOwywfXm1YpkyqdaxHV9gDlM1058i5Jq9/QvwaIMps8KUNbqHLmoysdGc5EHW5jSG2HwdbVi1GSNdWE8Cyic188WgAWSSergghW6YYKDMS1JsSFaabZKGT0dzN5xN3Zr0nFIAp1Za4Qj0FX6cH+pvQczllLNYpZBwsgJ/JB3lXyfr9F5CPxuuaWSXY6G4IgvAXHDFuH8+046hMmxupMqc3/onpGH+O/PjX3YsQivmD3z6N/TUJIf0BydOUAKijyI3pdfGnE+AmFMFgYzL9v8sg2TmY2y/5nmauofyMwaNGqD3juZiIM67iLb8WZzoWMbNm7ak14h9egBTW19xLCJieCCJo3TfGP1ox8PY7jGb1BPZg6eORPDp1hZa/Z+keceU+tKv041Dz1DebkbqmbUocQXmdrrZk/CdsysvovfzV//F8sSZ9uRtTSx73hor7eZTVZaNGyLn6SoKRK3xIjnxAZnYkgFs8o4N9B7YNmhRuSZGR20jJyeZFZXdf1ruqkiqgVIl5lOYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199018)(316002)(478600001)(38100700002)(54906003)(2906002)(6916009)(66556008)(66476007)(66946007)(8676002)(86362001)(4326008)(41300700001)(8936002)(5660300002)(6506007)(6512007)(6486002)(66899018)(6666004)(26005)(186003)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8LjjNV7ZhIqx58yE1BU3s8Wm5/VRDOzTaPEvKUkxfQINJL9SU7rT5mEKgxn?=
 =?us-ascii?Q?hyTcdo3diZflB5DTHt2RzduQqod9v+cbRx6pKIaBRW7lMIWCAtIq4BTRCHVh?=
 =?us-ascii?Q?JaeJfU0KQw5wwCA8LmOJO93e6YiGnSWYTwrWWr+FFcz1SMaNZI0U0tr83cKx?=
 =?us-ascii?Q?YUyc84m8wMFwTQWoKt1oztbgE63ZMyuPTZZhXV0Ko8QHAM3EfNxIKv7QARNv?=
 =?us-ascii?Q?OWVPiG1EXHPZ069BnQqqUi1YbRk7OUMWvGJbiaM4m903fudM8LvH6iJncZIl?=
 =?us-ascii?Q?EtYX6C0aQkK+wnxKaq6pTV7XoQoCEuQtTZ0vX7FGlzbw85H0KDEqRuv/+5Hm?=
 =?us-ascii?Q?o93p0xN5miOQZM4q/OYFsf8bhO8SpWeRYM6b4CpyCJc0dBz6xDhriUOtx4X9?=
 =?us-ascii?Q?jBpavwNJRIl8EkiOZxiOh/G2phH3LX/Z4FUiCfbVhK7c1Gvola5UNBoGUlU9?=
 =?us-ascii?Q?4/RwfTbYdTQwzZCLPesEJSJMKNGvPEx1l78x7YwBJT/6G9BhphtR6CB4Ful+?=
 =?us-ascii?Q?fy0jaTFhGK3ElhpdiTbn+iuwHVurHepAeCBEbj9ir1nNUX7u/16CPRRR16aD?=
 =?us-ascii?Q?J70UUJzG87PdbIgkbc+R5dAuD/ALAGUTB3YYxOeX2ACwj6X+pfT30Ty63gO6?=
 =?us-ascii?Q?8a9RoEwsmXwZklk7dZLaXj4c9OtfyH9mP3BN6nCITP1gF+HbeC+HwDRWGQ7y?=
 =?us-ascii?Q?IdBXNzZ1pHsUVdBbtXjEPmkRwpxEP4iLGjhsZNDl8SCeLyP/+sGc0OjoSfEw?=
 =?us-ascii?Q?2MlDg/h+kBv1iUxh0fwsaOQw1z0eugizS66O7PhXD2pVRpDoz4ZiuO2Ogod/?=
 =?us-ascii?Q?MKJtA4agbYAlJ7Sldqjz8YdjQWA6PpKH/GieviaeQ7Qbz8Shuxl6TC45lR5R?=
 =?us-ascii?Q?Vdie6wVM5G0r5RIZHHrk/qqqbhca/CcdsiK8QKjDfa47zzPbXc7VpD9YxPqs?=
 =?us-ascii?Q?n349PF0oKMlaYwSABy2ggN0vxEQl4IH3tzzlNoV1QXG36hSCxY1KKAiXjhsJ?=
 =?us-ascii?Q?BdmoaTDyR8S+/cmYOYEbNAtpWIzNQYCiaB2gdTUGA0AI1R3z907LZJx9yTAX?=
 =?us-ascii?Q?7lYPhl0ZDqzm0pIxWhkROg/dQxFvYwLO85BNq5ahhq5dYGGg7UlmYoMqpEZS?=
 =?us-ascii?Q?z809yNiiulgMqm0LDoDX2siY6+I7x1DRZGtfRCMyKyvj4mi6RuHPdMBqvtL0?=
 =?us-ascii?Q?ScIQeQrrr8g6gU+Of7/lrMjsSF76up1UJ/AHc9jnmU/705Tog9fUJoHXAVbr?=
 =?us-ascii?Q?wIOtMGeqj2GXh6qb25RM25+CAs9sxvqMmq0fbsAylEJa3Y5BAhiy75N9xAkn?=
 =?us-ascii?Q?75X0QrrTKZtnqdLhe9J7pt83JceW/osOj8Pu9OXbJk+uYkyYU88XwAPNn67e?=
 =?us-ascii?Q?Mpvfvwy+ufng9myRSONSAk6T6hx+Wc9d19HtDDFmkjTu2QeDy1D1Ny3KXHjX?=
 =?us-ascii?Q?VbD3rUGzNaj8WBa768EK5oOv4pry3j6gq2ClHbdh8stjmAxl+YFCK8KXbiSL?=
 =?us-ascii?Q?Dsh8ZHDGWydme6lzmluBUftNDjeQbp5r0RcpbKFyBFT/dWElxJMKmS5kDQMJ?=
 =?us-ascii?Q?gK3vD0kaMRkR2k8/miHi3mmmlu8ZuLHofC4erW9A3G+NMFN49ToI4ii5zDyE?=
 =?us-ascii?Q?FK7doZP7r5fDm+hPLaWPdcM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49457f6b-9c16-4c8f-750a-08db1454650c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:41:30.9661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvZRex8c9nApGCVacdDpyN6A/XFqnd0M8QvheHLKmLIpCLA/RjlBXa8WC45O7bGQBbkJb4UZqNurv+QehmfQLQDrxhCRWV37IjdUeejpzMTIH6iIdfk2OqYvkLnMYACw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6220
Received-SPF: pass client-ip=2a01:111:f400:7eae::700;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

On Feb 13 16:01, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> > +static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
> > +{
> > +    return isar_feature_pauth_get_features(id) == 0b0010;
> 
> This should ideally be ">= 0b0010", but it depends a bit on
> where we call it.

FYI - I did make this `>= 0b0010` after changing the logic around elsewhere to
be compatible as you suggested. I'm also planning to add a comment like this:

 /*
  * Note that unlike most AArch64 features, EPAC is treated (in the ARM
  * psedocode, at least) as not being implemented by larger values of this
  * field. Our usage of '>=' rather than '==' here causes our implementation
  * of PAC logic to diverge slightly from ARM pseudocode.
  */


> This field, like most ID register fields, follows the "standard
> scheme", where the value increases and larger numbers always
> imply "all of the functionality from the lower values, plus
> some more". In QEMU we implement this by doing a >= type
> comparison on the field value.
> 
> The PAC related ID fields are documented slightly confusingly,
> but they do work this way. The documentation suggests it might not
> be quite that way for FEAT_EPAC because it says that
> HaveEnhancedPAC() returns TRUE for 2 and FALSE for 3 and up.
> However this is more because the definition of the architectural
> features means that FEAT_EPAC is irrelevant, and it's an accident
> of the way the pseudocode was written that means that
> HaveEnhancedPAC() ever gets called when FEAT_PAuth2 is present.
> 
> Other than EPAC, the rest of the values in these fields are
> straightforward and we can implement the isar_feature functions
> with a single >= comparison.

Thanks for your review!

I've made a number of your (simpler) suggested changes already, and will
target getting a new patchset out in the next couple weeks after I spend
more time withi the the remaining GETPC() changes that need a little
more thought/rework, and we sort out what the command-line options
should look like.

-Aaron

