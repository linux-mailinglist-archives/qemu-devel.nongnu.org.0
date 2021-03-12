Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5B33973A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:13:11 +0100 (CET)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnDi-000836-U2
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmYm-0000G8-GP
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:30:52 -0500
Received: from mail-dm6nam12on2129.outbound.protection.outlook.com
 ([40.107.243.129]:29921 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmYj-0006HX-Kh
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:30:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dETvVijXTyZg8M7Zld59/K7w+AWUBWDoppwsW61rNlVEBN06qSVRHkjkZYAXiv+M2Sh6l6lI1qHETfUFPnXU8EopCNmw1I+yk161H3X1hF/iJZ+jJc/P7WeoGol11vnsF8HB0nIsY87NepZrbl6CGXqvLlARWACXBHVvqXxzP/7ftIE5RrN4OSXkWTT+TwF/LGEtxw0Azv7MlSQ6zsIQJZgFZP4YAmf/2tC5LVNI7UF4q2B5ZZ0x+s1AjPItAMoudzm1Qm8ATSg9eGQ2i9cUqzg8yyFfEMgUA+xckUB1+02K1yqFX4l2HwVRP8BqI38JJP94/a1S0F7TbuG92qu0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfUz29TI7n5u1Qmw4IWhjcltnNa5mIyTIQ1uKWrdk3E=;
 b=RFUOJ+vU7iEyGkfNgJWcTbg3a3HMgEkWzoay5BRwX1Uc9jGTh9GHdy5RtgHKBh5qNwlp63wdkNLvxMO9tIcWqi7h47r0dMwDI0WjxO1FSR96tpaIiNKjJxR0NnleXmXc65GO8vDubANuf9belKdV+IYI0/euFEtOYtfehHDpr6EgXQBQML2M0aqRTGhR7/mibteV3CLQPFPoIkmnTYhD8+5f5KoINCsNYve23Nm48JxVnQci7rVk4pIJQSz2cnEC/mrQEkwP8OSw9N6ms7EBzl7rDU0jwmb3+JuQGMRE3ruJYEgIgrckpkJo9HwkRkediAJHnQG66hrq3oipV684/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfUz29TI7n5u1Qmw4IWhjcltnNa5mIyTIQ1uKWrdk3E=;
 b=anWEl7ldc+5yMt4zqExbr4eFW+PCLK1uLh2zebzTErAQTf3GE6i13C4d/JJw/1eaAZ57dX4e26BcAsHoygbGTys6q9n9DGP6q9qoujYBye2CfMukb35qQjr3bHfQZf3+zw0JqqMbBsOLkxi8TvNZxMelkPmcpVGWmJ5nrGPAQLc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4048.prod.exchangelabs.com (2603:10b6:805:b3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Fri, 12 Mar 2021 18:30:47 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:30:46 +0000
Date: Fri, 12 Mar 2021 13:30:48 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 10/14] plugins: expand inline exec kernel-doc
 documentation.
Message-ID: <YEuzWKylI8KNOlzd@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-11-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:208:e8::40) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR20CA0027.namprd20.prod.outlook.com (2603:10b6:208:e8::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 18:30:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1321810f-69c0-43e3-a8f4-08d8e584f425
X-MS-TrafficTypeDiagnostic: SN6PR01MB4048:
X-Microsoft-Antispam-PRVS: <SN6PR01MB40480971027D5338C3C5C6AB8A6F9@SN6PR01MB4048.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fb/vgC7JFuCIZwvYBGUgs6SZ184OX0bZIpFGqfPU7fFbvDu2xoxGvSPWxUJSN/Sc/038CzgUA467YDAgCWDOnQpa57XiylAvF7IOdvynVQHX3GHDtwt1LC3BCLyoTtOXA+grFZHf0wFvqvrz160cAS9yVmx7zGRA2C5mJnclvIIFwV+J0tKUOp2K3cJwuJ/ck4NDxAJdVQ6I0/XfGDd9EifirBuXX1f+yzx1aB5AGkRZWlDk4IfduDz0lZYSxD1XTSs0mSIVDry8M3j4indbw+xcXS6Cwn1Hsz1DT7H52bbjAKIXsftyM3lBshJdSpozbKIoHSTVBl1cCvVxIA32XmZX111K8CmqqjuDplUZu4xFq0+BZ3t60gdNsGWJdNmyXFhkSju2LmuRltCvfSalQry9FbTnNV1VmXebDlHONJpbGiH8qQU1h8eQojtoBWZDZxIeuDmGvvd6DZGneCo9bJfGgRfRyH//+89/cPoAwxwgnwhWwgKztZ4T6kXjny2c1H0bn7AiGWTFF/6HOM6Vx9Y6AthQ1LeUpE+u+2JGKRmAlxuw8rcA22SZGXuw/SoVU6f9nB79kH0tQ7Ux6Y0YIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(16526019)(66946007)(6916009)(34580700001)(8936002)(2906002)(66574015)(956004)(316002)(55016002)(4326008)(83380400001)(186003)(66476007)(6506007)(5660300002)(66556008)(478600001)(52116002)(7696005)(26005)(9686003)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?qaWnXw1fBoQa1IVyYOUpzc7OhXdHF9CAYLCShPrI3XnJGV1eeK19t8/uc6?=
 =?iso-8859-1?Q?JSFLQEsVbH+R0/DrEEg1XfOcEf0PvvlF7F1VPXDaCfpW/juaEHTNvHi4d5?=
 =?iso-8859-1?Q?m5dhZOv9RivScq749IjLcaXuq3AFbB3neIOwy/jdPDg9BsPek8bHpkQ14g?=
 =?iso-8859-1?Q?GKPLUUsDwoXrVQKABdDUZPpBGgSgEJo0k8xxPup7YgyX5SFUSRZEN2SBet?=
 =?iso-8859-1?Q?eDL0KiEwsEkBLgYqaIqbRfFck4CfDGMY+jvIHGCoWb3f3LNV69S9JUdSn+?=
 =?iso-8859-1?Q?ZGnQl2WokFbxtn1FcKzRTjyOZgzPk0X2U+mC6iBgpaylPVWOutPc1f+vWW?=
 =?iso-8859-1?Q?fOKLEw24vlYc2qPdW7m8V0u3Sw+T7+dMTJmgjFwDzXYMF0ZPpDBJuPClHu?=
 =?iso-8859-1?Q?DhPGimfjmqaAj6cJbbBgdbH0JJf3rY7A/cP2YdNBay6J08qBfKYzjLDdnM?=
 =?iso-8859-1?Q?Aioaleilx9/Z/8kIwmvmz0Pq/Ahe6N6btl9emojvOsva2CIEjLABphxiey?=
 =?iso-8859-1?Q?5Kd0/VouLrsrub3zdedZK8aRbxGRNSGwCUJPl9BybaglWEPMX+EzUHTPt0?=
 =?iso-8859-1?Q?Yc6zAk7NPf4uftVeJ4YBzbmOsw/18rXAMgQIG0Ebiq+pa8GArLeKOQcb5V?=
 =?iso-8859-1?Q?bGWIYP034BX4qpa60FP7cpLYcrvdmOdST3trzZJ+2hO5u71/e5l6+3xgsB?=
 =?iso-8859-1?Q?LHIfeGgBzsDTfYEKe1/h/1OIOmQSU6xTcwuf7U3SFyoveQjCntZ71yqdzS?=
 =?iso-8859-1?Q?u7//DcmQT4/fhad70fYQoAjeWuhjuYc4ECtYcZaI5RkjmiMQWFadekFSIJ?=
 =?iso-8859-1?Q?cJgpBB29X+yDoDlBy2qavIOmkmBG+TwD/QBB+T8+Vo1KzQd1WFOrcb4ZAm?=
 =?iso-8859-1?Q?8S71AB7awAlcOR5TZqkgadX9N966TQbxX3tkNzG6v3vn1uV/HANDKRcnWh?=
 =?iso-8859-1?Q?iwPMzEs4SD0xbs6kavGWZbK7ii8/vdHM8oqWoyaYmbE2evcxOtA7ACTi4p?=
 =?iso-8859-1?Q?pTCZ2h3YC5AwGF/GtBDD/iwMbH/0GxE4qfuYqgGzSlpKrokN2lXJb7U93B?=
 =?iso-8859-1?Q?9IZAhVtaDtv5sIaU7v3ZQ2/JbbOR1WclVhg/IEhSLINDbgJfTxijTkUrFz?=
 =?iso-8859-1?Q?bmB4p0zlKFJcsKzCBCEN0yyWfhfJ5NyNcU47BnZhvGHHx96+bkgpyS89ju?=
 =?iso-8859-1?Q?onUbHYHcq9mje8QdT5TvHOFfBNbvA4eph2t/YDgCzdHQGlJ2kdFuCiAD7j?=
 =?iso-8859-1?Q?bV2g06Kn4hvAh+yDBJuGCb0ho/yRIebBI/DuaaCLZvC0zR92B4rcHMQTVM?=
 =?iso-8859-1?Q?zTRPBXEaOzwssU9Zed3BEk7lrO5mk6YwpwCSnIj8eeOd3rlo0bEUEG5ecS?=
 =?iso-8859-1?Q?OVJdKvc4Ef?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1321810f-69c0-43e3-a8f4-08d8e584f425
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:30:46.8816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzXYb/vE0/sGb+yCGhDuOnVne4RxnDoSf+UG6/uLIpbbCWqAEIm96zcW+f5EmzGqbqtd5BALPWtTBHWUdhtuvC4IYiPc5PCjLJI+0s7W1h8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4048
Received-SPF: pass client-ip=40.107.243.129;
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

On Mar 12 17:28, Alex Bennée wrote:
> Remove the extraneous @cb parameter and document the non-atomic nature
> of the INLINE_ADD_U64 operation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  include/qemu/qemu-plugin.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 5ac6fe5f02..dc05fc1932 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -269,6 +269,14 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
>                                            enum qemu_plugin_cb_flags flags,
>                                            void *userdata);
>  
> +/**
> + * enum qemu_plugin_op - describes an inline op
> + *
> + * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
> + *
> + * Note: currently only a single inline op is supported.
> + */
> +
>  enum qemu_plugin_op {
>      QEMU_PLUGIN_INLINE_ADD_U64,
>  };
> @@ -283,6 +291,9 @@ enum qemu_plugin_op {
>   * Insert an inline op to every time a translated unit executes.
>   * Useful if you just want to increment a single counter somewhere in
>   * memory.
> + *
> + * Note: ops are not atomic so in multi-threaded/multi-smp situations
> + * you will get inexact results.
>   */
>  void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
>                                                enum qemu_plugin_op op,
> @@ -305,7 +316,6 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
>  /**
>   * qemu_plugin_register_vcpu_insn_exec_inline() - insn execution inline op
>   * @insn: the opaque qemu_plugin_insn handle for an instruction
> - * @cb: callback function
>   * @op: the type of qemu_plugin_op (e.g. ADD_U64)
>   * @ptr: the target memory location for the op
>   * @imm: the op data (e.g. 1)
> -- 
> 2.20.1
> 

