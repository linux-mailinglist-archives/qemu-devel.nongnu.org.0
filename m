Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C83396FE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:59:32 +0100 (CET)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKn0V-0001h6-3g
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmVB-0002KF-Am
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:27:10 -0500
Received: from mail-mw2nam10on2111.outbound.protection.outlook.com
 ([40.107.94.111]:55137 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmV8-0003o8-Qt
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:27:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmwDTKIZUWIBzTazjpi7+9NhqeladUudJEZS+IiVb+yrJPd7b4MYzBTZMdEuyyPOHNupEGYUsWyVT4+Yihzz8lIJGvucJyOqUsC6wJhkJ0B3mYtE80+HSJ+d1drHt/qpmZVIASzDSwIl2W2HL7MEerCi+yXLR62GFPGKtY8h9RSLPt9L/VodJ7cp/j9U2jYepCusJ6Ys/FO9WGc19QQXg826htB2RnUgkwF091r3gkZyv9lV2BRkvFjPEBr3XM+DKgnUJvCmrrPXl8yN4pLA7eXYfV1GQ0E17RBJ4rbWDV14P/XlKqyqBiEL3oN7Pvs1Cr0sB0SKDwofswDlQoLG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH89aA+G5L9DdUe6n2avOxVDdwJQ3oxkzWn5Mqq8jAI=;
 b=AJXz/UAewnNWvkwGIPcWT3m844mKsbWdk2uSyHFmIzvKD1MmzwnigDJvGrmwQd9O+WWTiLhyzZWPPvhoPKgt+sOUzT0N/z7c6CpOq2CrDFNkrNjiABeWUrW/Uby69AewA0A9wv0GJfMA20D04P8fn6wO+N0uswakAvT7mQoWE6agUCYQJVFy0xlA3zBvDwjairbJV4l9WwZv2QyYF7VFQmHIsoL6ym/Hj+2Y7xEqWChz7+7y//UCtIs3dL5HSNjTxHwbeHYPXzG8F7j5FyLSExNkvAGr7SNMHKeIxUIe3OOm9XOJANLP80lLO4eXiCWQ1bDkWO/XcdkyOszPwU+Yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH89aA+G5L9DdUe6n2avOxVDdwJQ3oxkzWn5Mqq8jAI=;
 b=mUHo1XhqAgUsWRhV/MsCAbIjxrlT7Xojp59dK+nogx+c0y/obNS4CI3bZzDJGMfEe97H8Km8l4imYlNHOc52RM1EyyVftkbfx4ItgTC4UAGdqG6aalzUacutUhgMYihjSa5W90gtapQWhzNDeVHJ2zmJnRekt3Onia2VRTKYf8k=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (52.135.119.151) by
 SA0PR01MB6458.prod.exchangelabs.com (20.182.6.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Fri, 12 Mar 2021 18:27:04 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:27:04 +0000
Date: Fri, 12 Mar 2021 13:27:04 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 07/14] plugins: expand the typedef kernel-docs for
 translation
Message-ID: <YEuyeI2gyQra9Fej@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-8-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:c0::23) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR05CA0010.namprd05.prod.outlook.com (2603:10b6:208:c0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Fri, 12 Mar 2021 18:27:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96cfba8f-3c9b-455b-cb9d-08d8e5846f4d
X-MS-TrafficTypeDiagnostic: SA0PR01MB6458:
X-Microsoft-Antispam-PRVS: <SA0PR01MB6458B4D9B51D5FD2861428078A6F9@SA0PR01MB6458.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GRGvgTApJ4aYX0gH04BZBi4HkWyvU0i6NGjbI5HXwkv2t0sCbXum+Bhck/NNfbXxkb334fI/tKR3jzzUiS+ntnZBErhOFB77LXcyVysG2Hlfl9XEKmEoI4gG1M1XMBu6FoNMmOAqoY1tzp4S4dhJM+Ba2WWJykADICNm0DHuPusriGD1s9APS8HFSVNRW5MnZW1JUAUXTTg1qsKRuNhMg18TmZqsUW4tP5T/U5idQe1zqN3M7sSii+Rx5dnIFOvt9AwVIrF1XEo/8zq9rsNEV/XFPl2HgaTMfcXEVVyZLdt+ojHDUn/c3ZCy1QIBEYk3Rp/hlgeuM9+l4Zc2OejSlw9fC20EQSQHc1AzbT2Petqhakx8XHav+CEl9IgdKlxPI0VsyaTyTT4Oe7OlyvOyJ+lxqmstxepXoGQN0wqrJDel9XjFMUzRCWVZpnMOqfzuV3jLAZb2sVAlSYfUesrK0yPcX1CkohTAUztLG7+AiPVJbcN1biYBUfP396NDsH7ianOX3Tjxf+DoDGPcgomPckkm+nDV+CfIvhgNx+EeMRCpaJb71KYSeyihqoQUoSfI1QnE4QhM+ZmbfgiiL07usiXh6gpmyWV7zSWW3PRpBd3lRFKGPEuzpeOs3yHyRoY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39850400004)(6506007)(83380400001)(52116002)(7696005)(86362001)(16526019)(186003)(956004)(5660300002)(2906002)(6916009)(55016002)(34580700001)(8936002)(8676002)(4326008)(316002)(9686003)(66476007)(66946007)(26005)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?Mq03PGoHy6BhJWYBRauG6vNYlpfctFtdxLq/4D50hKLO1OBpA9C1yHw41A?=
 =?iso-8859-1?Q?mioJSU7FD6JhH5NdX9dDaF1V9aTR3QJk2+rC0hDUnTnDMjhxgHIMuOZQyO?=
 =?iso-8859-1?Q?il4zYsZ0AQVbkUD+er0N7bEYhpUl62jqxn1n57J4oFvO0Y/iE4Cs6x6IYL?=
 =?iso-8859-1?Q?FYz7Bf/d4//g67lUyYE8kE+YcLPh4Nrvbb4UVWqRfw9e56GKB7sPlKY2pr?=
 =?iso-8859-1?Q?NUSRcBlsSf+w6oiyGngqc7rNSEGPaJyfjLrj4RLQwPRQiJQU9iHmKFItL4?=
 =?iso-8859-1?Q?404ueiZ+h5b6TyJcrmLrZx/KpA7bOMfJqGIMuJb/vSBRJ0AhBGo5gBJAzC?=
 =?iso-8859-1?Q?9zkBlEmfulle6Ep5jNylGxbXahOURQKo+zYMt/3bR4jwScrvWAEOMY5nXW?=
 =?iso-8859-1?Q?pmduMwWyLQRG+xzlKusErx6zhRmMydd7XSuPYZKlyUuX+bmjSoLcC3uRgt?=
 =?iso-8859-1?Q?j2uzpvdsIiO0xwrd+x0xqU/uGHZP3YzEviTrO+Bz/N2GlBm6yRuap1JjMs?=
 =?iso-8859-1?Q?M4MlINIAtbxIiWlwEUiM71WlQ1WLVkuW0dsgf6DuHzaWU3ZjvS9LpM64rc?=
 =?iso-8859-1?Q?0OwZaIULIcFOmEP9T/u2YtAeDfRPZ/qAOeCK4M47VPcYil0YjdDYAHcih1?=
 =?iso-8859-1?Q?a4ymRlG+DgBxJJSTy2e7iVRRtKYtD5NRuS2rQQQn54EnEk69OP2x9uxGo5?=
 =?iso-8859-1?Q?zjzvPe6Fs4ds298iT2IPgglhDnGw6V4GvLN4+F0ai9QC4GlmP4FxN8KAAB?=
 =?iso-8859-1?Q?1+tRR5Qkux/GzgNyIqBwREe+oA9LzBZxECXx1ryD5as7NuFZAmq7NT9Jqv?=
 =?iso-8859-1?Q?qs2ObNUrH2cnAZ6pNdf0cJXVvsc2aj89kCiJ05EYssjwiuBpd3htMmZypa?=
 =?iso-8859-1?Q?emFHBRHBxxoEcpgKvb/ysM9lTwbo2wl7cBg0xAKo/20h1tiZryeYpwnKYP?=
 =?iso-8859-1?Q?zLQdQo/EnPId/wCXSsaCCtya4WAC1tQAOA1RUDLa+OV36SMMo5OCZCR82A?=
 =?iso-8859-1?Q?KrWAYmsi7K/cxowWRMEI7lLwJLUD/8sU8f7z30eo9qKuNn0v1yta2Jct+r?=
 =?iso-8859-1?Q?29ZHv+8h0KuQ0NZJ1Uo382CRwFoQXNQMG+e8UAlCLkMDMaFmQVfgu6hZIv?=
 =?iso-8859-1?Q?FybbGkdxDci23FG6yG0S8D8Qq93xVD0rZ73XoY++xsUmy8IUSptGctkpU/?=
 =?iso-8859-1?Q?moGwQaZFC2HhdgYv74C3Rs+5MHS0E/7y81KG+wNBpg0iZpwne1SvLIsuin?=
 =?iso-8859-1?Q?jU7tcXsBpCIvX1k9z9X/yiTUFxKMc9Lm5+W3MAOE09GKHhrbuirS3WmxiJ?=
 =?iso-8859-1?Q?PnTnHFistSum19/bRuCgLaV78V27+2eGQJsye6WtXAq+MVzvqlvjPVjab7?=
 =?iso-8859-1?Q?lNLlE1tZdg?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cfba8f-3c9b-455b-cb9d-08d8e5846f4d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:27:03.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZi4cZS8hFVZh9v925zHTYll0E9gpC4mIeUyFGBcda2EvoMSissY77uUoGxygiCPBtV/LKShLfngAgm7s6S/cKinM79KH6gRIdX189OQHKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6458
Received-SPF: pass client-ip=40.107.94.111;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
>  include/qemu/qemu-plugin.h | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 09b235f0b4..9ae3940d89 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -202,11 +202,9 @@ void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
>  void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
>                                           qemu_plugin_vcpu_simple_cb_t cb);
>  
> -/*
> - * Opaque types that the plugin is given during the translation and
> - * instrumentation phase.
> - */
> +/** struct qemu_plugin_tb - Opaque handle for a translation block */
>  struct qemu_plugin_tb;
> +/** struct qemu_plugin_insn - Opaque handle for a translated instruction */
>  struct qemu_plugin_insn;
>  
>  enum qemu_plugin_cb_flags {
> @@ -221,6 +219,14 @@ enum qemu_plugin_mem_rw {
>      QEMU_PLUGIN_MEM_RW,
>  };
>  
> +/**
> + * typedef qemu_plugin_vcpu_tb_trans_cb_t - translation callback
> + * @id: unique plugin id
> + * @tb: opaque handle used for querying and instrumenting a block.
> + */
> +typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
> +                                               struct qemu_plugin_tb *tb);
> +
>  /**
>   * qemu_plugin_register_vcpu_tb_trans_cb() - register a translate cb
>   * @id: plugin ID
> @@ -233,9 +239,6 @@ enum qemu_plugin_mem_rw {
>   * callbacks to be triggered when the block or individual instruction
>   * executes.
>   */
> -typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
> -                                               struct qemu_plugin_tb *tb);
> -
>  void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
>                                             qemu_plugin_vcpu_tb_trans_cb_t cb);
>  
> -- 
> 2.20.1
> 

