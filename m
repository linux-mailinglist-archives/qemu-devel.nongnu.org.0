Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907733978F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:40:25 +0100 (CET)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKne4-0002fE-7E
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmXo-0007KV-Dw
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:29:52 -0500
Received: from mail-co1nam11on2139.outbound.protection.outlook.com
 ([40.107.220.139]:16288 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmXn-0005WE-0o
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:29:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9R2/OI9tCpIqrpFpvoYWVFU9IcGXM3KNs7PTVGEPQvbSfvLdQYenP/onFEspK0L6qIl8veCnjAHCdKUCSMRpU7U6lzwiLZXDe/oA98QmCagyMKJGiICIeAr7fxqYnYNWgMWIy8NyE6zOxbct6avPw8FtXPZkztq0hA3/PxN1bq0147ZpBc1RFCh4fKBC4xw+eMQp9WQgYGR6eSb+BiONh+li7wttj2020iH9zW/v9WxwAUKhgAulImxXiygZUSkNzNts43f1T8cr524bUOx7zrODGCA4thbVyQGdGY1UILTo1z50CQ11cqQuktZ6f/7dfgGxbGvZhXOzwbWVftJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dx6jLPxyARmhOQ2/4ubRKax61ryIGZ8ZecuMVXOxh0=;
 b=haOi+dheTbhQTzs4//XGZN/7S9X0ZAhUx4L0qJk6Zym8f7wV1vXfwhDXWkA96bVwqRTGgQtQ+yY/nsYjcozmGXSaDXycdaOgobKQEasL8xrtPKAWDU/cDW/lZXAz3bCBiRTcXGsyijPRMC8pj45Xmgme+p9XU6B6WcL7zllvsbqrLqvffRqQFToKuRe505+h4TCzbgqzbsnkL7dcHBsZ3kNRhRgElwMzeyQ9F1y3LSwJxFZqeU6EMO15ikV3qOlNW+b7gSgq5iR+G4/YxfmPkkGUK9zxD8VD7LvIPTsMANkLEcgB78MPi9JaH0kJfiihErzqjdLE+n5tDz4fzByzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dx6jLPxyARmhOQ2/4ubRKax61ryIGZ8ZecuMVXOxh0=;
 b=hpxoCsl/T6NCjIViDBWI/wE3Ra3pYz46UKESk+kHzsiA3CsAd8TChM+tsg9xWzgoqaf/dycRY6l/Xb/lOOg0f/lLT/Xo85DXoBmxar+F2PANt6tYVhFIeXN1daLE/g1JPFmF7anuHXpzV90csEV2ug95WknmXRELwh218KrJBqo=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4048.prod.exchangelabs.com (2603:10b6:805:b3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Fri, 12 Mar 2021 18:29:48 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:29:48 +0000
Date: Fri, 12 Mar 2021 13:29:49 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 09/14] plugins: add qemu_plugin_id_t to kernel-doc
Message-ID: <YEuzHXETsSIGaZnI@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-10-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0288.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::23) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0288.namprd13.prod.outlook.com (2603:10b6:208:2bc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Fri, 12 Mar 2021 18:29:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8853b2bc-76f9-47bc-7f9e-08d8e584d12a
X-MS-TrafficTypeDiagnostic: SN6PR01MB4048:
X-Microsoft-Antispam-PRVS: <SN6PR01MB4048DA9DA28E8554D7CA15298A6F9@SN6PR01MB4048.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5zoxkby9CO0K3PsQ56SqnaUZG2SpduDMJ8mPspLHu44zh5wXK8Hb8WToFsvrkKSziPK8SKKvZhW8qHzdv0fYuvNrm75ZVgSWNK8UEgCcAPlzLJy+hFLgStedsHtgeFYlkXOk1kVznF0CzQI2DehnUvmZDnIEne18IE1RkaJb126/uRSvdjWEyIUrig9fvicBKZ7+iDoltsK1/unqcf+L7E8MxSeijq4Nwz4i9/ttOtkDlcq1U5kvkiapejiVF4DPapnVMqEI/3a1ZmDw33dKluYKaWwKK2CfQ5cHJZlvPev2VvCfWEwiN8v3XkCBeDg2b62Z8F5KNbLRcC1ChUor79OJQPBi/5sP1C8WC74KJZW/Rbtjz7zr6p78+jbC4EKriGYpqnhjQtmOkoQoqpqtdEoQ8SwXBpIS7qKeAreI8E4szjQFW5dCcJ524GTNjGSXj889icUbbdkEU6MC/aEt25qO4hq6wu0c4KOjMqWThrs2WAXTKU07WtSScS59OK1Odrf7fveBayIPzG2fCKBuKL0NtE7TuhuwIGPAD8wBvLs6wxbqTMpywnIrJ0C3jgUumnwF2Qvmim7cpgRolBUYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39850400004)(136003)(478600001)(6506007)(5660300002)(66556008)(7696005)(52116002)(66476007)(4744005)(186003)(9686003)(86362001)(8676002)(26005)(6916009)(34580700001)(16526019)(66946007)(55016002)(4326008)(956004)(316002)(2906002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?gHK3OXfDp/U5NydpW4BpRAG/isWOqJKKZ49WR4qon7BV3pusSnmvxljmpG?=
 =?iso-8859-1?Q?t1yGEImQtFEK9ksElaexdgXreIAbpIUvKJRwN+2TyZY1mImE0SEWTgi6PU?=
 =?iso-8859-1?Q?Le+xC+ZlQmvO2GivLmMaG1kTshMC8W7s6M0BpFHcSVTEOwkeKeeaHrgFDq?=
 =?iso-8859-1?Q?wj65jzhKlsepMuMHPVos69PCeskxOXXeybPzbyWLfFuB5uzU9DMEJ6siKn?=
 =?iso-8859-1?Q?+bTjqPMjttft0nlt/WdP0YCNls7E1M+79gbHZ8CQrb4bq1SJcrhj3CaNvL?=
 =?iso-8859-1?Q?yQ1XrRDEX0UKol0oMi/Id6I8taED496u1iNLk8tVaPSZ2T+sPa4ZTkOls4?=
 =?iso-8859-1?Q?ZZJXq3hZLl3QHiEd7f/FWmaaOPSaK8de1CTBEhM/kZfas53ReIM99BGrWF?=
 =?iso-8859-1?Q?QcL+0+lA5pw17oAAgpD+xmywZSZ+aoGTDnRyfnS5mLCQSfjRI7epRFw7kX?=
 =?iso-8859-1?Q?1+n13vO67ISjkJKGmK6Ob27mDy3hkf2hMbCtYt497JlqTbSJor8LZyAu3z?=
 =?iso-8859-1?Q?YeTotgILmmzcqr4vePVvq2OzpkE2OOTYcSBFoi4Oo67pUul0gAAW/xrcxx?=
 =?iso-8859-1?Q?NXsjyafaMJmK+gwUNNdYzF4v/aiuVNW6WwTJtetov3phJaVaFtGjasQgj1?=
 =?iso-8859-1?Q?N5pW4QkbaYzMe26pZF7/T3Kk87cAupzf7Oc9VWDOh8cM4Eoct0jfUqsU3J?=
 =?iso-8859-1?Q?dg3tCJbduvO0ib0R/pWVM7s5LEBePoqBWPVc9moziCUwtoUjvSDKlr/D+c?=
 =?iso-8859-1?Q?DfPVJx7XbGN3kPQYYFLmHeDkNT1l96lMnyCalvaxKt5ySyt6v4225ZTZnI?=
 =?iso-8859-1?Q?54nKfstk+KWJ07YmnDp6cFq2oGx7v5oMynBIDy+8m4lsqUqb/lqGCovOs0?=
 =?iso-8859-1?Q?AYYvx8+VskOt8UUHO26HermOowFoezv0i5x6jlvKUxn+VDzwsbp0ytyBmV?=
 =?iso-8859-1?Q?96FJdy4FJZ69VU1nGxxlEM/qVbfxcGR3b73mSeePqQp+oFOz7TCLpKO+LV?=
 =?iso-8859-1?Q?ikAKrD0eKwKMhVTZId+Ecs832AUs5K1JBN1TroB+Sn57vD7yb2nwzzNhVy?=
 =?iso-8859-1?Q?cMGqSknxUTkBxiI4/hka+FI+rTrFTTY0MYDkwvnhyr98yrOfiM4ryuW3YR?=
 =?iso-8859-1?Q?W+39Wl+mOnYlNIeWl8bBmlloL7+hlRfVLEcxEP6VpLJJCQR0Y7Dd114cpb?=
 =?iso-8859-1?Q?BqrBTQiCpfKTG5KdHYdBv0pXeayAcg/IEJow9UI4QH8iJvF4KXDPHhijdy?=
 =?iso-8859-1?Q?kECvLRYJj3tLy08Sco2oTM1csKQem3dK9JWejcD63apTBcU+i4qDTOraCL?=
 =?iso-8859-1?Q?m2fYbdICSuxFeS/DB+x/naU1HB1mrPexg9vMYXRy21vGmo/sFJ23ZWIh97?=
 =?iso-8859-1?Q?SxDGgeoG8p?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8853b2bc-76f9-47bc-7f9e-08d8e584d12a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:29:48.2111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHmNvAgmAphbZqORMsY7lTtf0oms+gq+nSAFZNzkectfxm3gAyJ1WsQcg+kMOp+jkziIgty+kgfuHqiFWrT/ulS9UlMOW7cVwFEmudsZuVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4048
Received-SPF: pass client-ip=40.107.220.139;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

On Mar 12 17:28, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  include/qemu/qemu-plugin.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index c98866a637..5ac6fe5f02 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -32,6 +32,9 @@
>    #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
>  #endif
>  
> +/**
> + * typedef qemu_plugin_id_t - Unique plugin ID
> + */
>  typedef uint64_t qemu_plugin_id_t;
>  
>  /*
> -- 
> 2.20.1
> 

