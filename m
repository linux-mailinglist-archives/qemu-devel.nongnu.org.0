Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67633974C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:18:26 +0100 (CET)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnIl-0003wi-Ih
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmej-0008Nz-5Q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:37:01 -0500
Received: from mail-dm6nam12on2113.outbound.protection.outlook.com
 ([40.107.243.113]:56573 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmeh-00018S-Jb
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:37:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyfWlNy4Jr10c52UEivtCLe04ajtXXbPRfbvD7mn2ROuz1sZztnz4LxzjFTF5hK5kkbIpSOxIDlpCh9RppPtLnbVCsVj3/ey2GUdPb7qCjQKS/v6WaRTZU1iv+vYIZRtaWoTbRCtIb0T0sakJRkf3O7m3ZdgVUCVqcjhTJM23QB603o7V9WSa1phLlJl3tdeKcIr+CLpvBsfFC9U0pbMA0voryNFXU7N/9/c3YdAEaNEfn8S8pDr3K+1jgiKORAu1KENdS9BT9ch7ZbW+kbm0rrCn/LEqyoVOJeNueFIiAL0/QcvxqU6nqY/N/JlI6ddtzDpKeOIlPz45BkQ/16C6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc0WdNNXWwWPrvpatNAJc7oGPTUTLIhKQp9+80AlHYU=;
 b=W4KGS0tULj6chf3arMMs6vK8NONNJJpehizcES9jWRIYXKLd7VfLhZFllG0sxfyY+G4dhiYSkLkm2guC2MNLnxZZrYI5TLoK1HufTxv+8yOxGTWtg6dvrQ2H/nTQdI7lAZA9aCWPGfdEfd+e3VNNac0iXUsKwXjCmxoMGjKqX3YqY3b02QpxLARcbfeZyMZfq2/+F5NAmXNyT8sMXOVukK9ZFcVAIbQAypKNCQLmlzhdqFYgL/goc2EZvYX/DHuTA7/xkieic2fnFkz8EqzB6HHp5nEsNx1wLVKI1zMWbYsEb6yp6LcU9cB0gLktgxYf1eOF0hwuFdvzyMsu9T0Eew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc0WdNNXWwWPrvpatNAJc7oGPTUTLIhKQp9+80AlHYU=;
 b=W0mtVqSrOcptHm0NTZis1Ceijvapn6BHvZydPE8j4XXOvsQKdJiCf+bRZQ35nJWzHDdBISvlf+kuNUtN+aGffOd5CaP0I+0DrMJbwvPasZY9HO/ixCqRAtfoJA3gaYe9f/ul1ZYlViMTmUhsLYvCdVkTADYNBu+lsZIVVvNJhd0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6281.prod.exchangelabs.com (2603:10b6:806:ef::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Fri, 12 Mar 2021 18:36:56 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:36:56 +0000
Date: Fri, 12 Mar 2021 13:36:57 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 11/14] plugins: expand kernel-doc for instruction
 query and instrumentation
Message-ID: <YEu0yfHSph9x33/T@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-12-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BLAPR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:208:32a::20) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BLAPR03CA0105.namprd03.prod.outlook.com (2603:10b6:208:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 18:36:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa729374-4345-4f37-c3fb-08d8e585d05d
X-MS-TrafficTypeDiagnostic: SA0PR01MB6281:
X-Microsoft-Antispam-PRVS: <SA0PR01MB6281E7A4F7011266B2A84B258A6F9@SA0PR01MB6281.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92KkASM1lpDzlewHNwikUyJy56g0ShbKdxUhzg8trgYYp7xyFa0XRWKP4oJhwFghf7KvWzrk0y6+I/VHSZcBXT4IVvooyv3jjxmTubSCBFgFD97R58BoC2QRTQFvalfOarLQQPue+WJjRK+z5PvOB+dKon7bPP/M9SmeQ4lI5SQH7gccW2T/TPk3nTgAR8PlxYFO+vEtqRvl+777/pcGWIrCdNV/FqGeqW0PoBsac8Pqh4pg5holXRjHfzDfpexGQwt0VbtTiS/ngbRJJIkKMa52gnRalj7SYq2Oy6zha8eidLbvVU1ptdztusAKY0QOnY756FevItFD445OMBb3+WJJp2ZHsh9ASsvUssfyotMvVQMj07mNL193MUfa5rTuc6eS197vlRrx5EN4/TEwrbOSCHZL9uRhZ+uqJdwe0OplUHnZr/HLTTsUopufKAqr7MNxQ9/5e/W1buOIBIBARYUB8OmE0PBNoE3OP+Iyas1MLtDgTrp2ohpV8vDFJGMDGt+lXt2rpxyw8dmszFO1Z+Wejvjb0Hv2fyJ2nxU9uta1lOlkG+N5bKAujB6qr9a5dyPQNH4ztuuj1BwhfNRaHFFqZ8xuJAJm7dkfYvhw/UA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(376002)(366004)(136003)(4326008)(2906002)(8936002)(6916009)(83380400001)(66946007)(66476007)(478600001)(186003)(26005)(66556008)(7696005)(5660300002)(55016002)(316002)(8676002)(6506007)(86362001)(16526019)(34580700001)(9686003)(956004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?7ocZ89RUCEXNqmAl5CCGx8/xoInhWXQaZie0e07znt1p2PCVMk1L+zFIE6?=
 =?iso-8859-1?Q?7SXS6pwQ01Dhf5Y9E9NniI4N2YUu+m3WOm2ztiECnxpAWGbe08grAeO5ov?=
 =?iso-8859-1?Q?ir5JLuFb4r/t5FYfPn/Uu0BZfM67kDmTfVuY/7hu+TP/p3LFJhBOQXbGZI?=
 =?iso-8859-1?Q?7W9VBaXpiVamvAbthc3EsuskUBSUdgncD45DStZEmMAExOrFNcbpoJ/uPC?=
 =?iso-8859-1?Q?LIne3lbrijp0Gi7qShmjokufQCglkMe/st8B+c9eRcVDDjpq8I2LQmRiQk?=
 =?iso-8859-1?Q?xwLsj4TMI/5pQdNDBJ9UnOojT27idrR+Z6pHGpqAWQFcWHrgee7e+oy5ty?=
 =?iso-8859-1?Q?Ka4T56I+bb9/7e74FwZ/uIPXP6AUgb2Shl2rzcObvv767FRQx96+7TSdqv?=
 =?iso-8859-1?Q?4CdG6/dXtlO0/Rdqbi17KkN4fP06Goxn8fmqcz1v1fu2apgkYu2o4mNItF?=
 =?iso-8859-1?Q?Awh779u6eqI/q+Y4CwJX1y8X/0h3y4VwSSvCY1m7Z+W19Mx96Ecry8w6N3?=
 =?iso-8859-1?Q?v9OM9wUU1hRpz7I+EtN7jLkV+PN3ej3Q6A217ZeLYIkDW1SrvNI7NynDFW?=
 =?iso-8859-1?Q?Jkqd3IRv3NsS/x4lOQpL5oJBFrYPbhExYK3rFEBVHh+CUzKjKSsPQcGCAj?=
 =?iso-8859-1?Q?XvRnjs/DnwtwDqpCeehE7KhX2Unj9/Es/MR2cNHoO5qkglkDkQF1tklrvy?=
 =?iso-8859-1?Q?HjLOfnlnxMq5qGvlk7HnsqfNJTgyithjKyyXD97DjjciuF2UDCwDHxB8Gx?=
 =?iso-8859-1?Q?jdUkqt3o7TIOHilhQpPpsALfynZYrjC7rOp1LXqf2+CZnfIdL7SzGYfPq3?=
 =?iso-8859-1?Q?HRP1G566yMQrO45T666xEGSTLA7qQFxUc00UJOUY+fcEcJYMsDR2PzAS9a?=
 =?iso-8859-1?Q?TnYuJwgpNc6GlmbMB1wkqlgxoft3F3wSQT8Tm054PugXDf8m0C/EZ3pTo2?=
 =?iso-8859-1?Q?3HjnwnlwfpmgrddPD+mtV+1vZjlkjU2+47077VsRT+QKMfLsuxnw+o9HRW?=
 =?iso-8859-1?Q?xjAf2ESCVSQS7KVBoJM0wi86sTNF2iHaVzPpM+blj0LCAxkYx+YeXZ9J77?=
 =?iso-8859-1?Q?3Eur16vpoYNay7Y3J98yZSRhoMMkFRf9F8nsrm9PQW9erV1u4bJDiFDwPd?=
 =?iso-8859-1?Q?OIBmUqwEZ//aycLrtzWzUX3WKW8FFIkee6iONWWwPIPMRb0MMru0J+cb4w?=
 =?iso-8859-1?Q?vTm0AaVum6lmGnK7jYpqgmHSACcTA+ic2R3IhQcUPH3cmcstSFChWSdWH5?=
 =?iso-8859-1?Q?Z7uUmAa8ibSi0d/xvw2Qb0CV28F6b7Zzt7FW33bDpW8ZNAnWBbR4+IUTyg?=
 =?iso-8859-1?Q?T4WMHooNkBWL3hkrGVUVbD+XFYmAUpCoA1vBYlE9bbeskNIHHEmCpu7MlM?=
 =?iso-8859-1?Q?E/uTS5uNwV?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa729374-4345-4f37-c3fb-08d8e585d05d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:36:56.3451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFC9UCrr2yNZmG2NCak27K5LIpbEt7H437oaEZfx6cn+1HBgcwY1hnQx28ec842juPvRE97uKxIUSJj4HSlBuLQaCaSZKkeDKR9PmkmAlPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6281
Received-SPF: pass client-ip=40.107.243.113;
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

A few clarifications inline:

On Mar 12 17:28, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/qemu/qemu-plugin.h | 52 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index dc05fc1932..d4adce730a 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -327,21 +327,69 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
>                                                  enum qemu_plugin_op op,
>                                                  void *ptr, uint64_t imm);
>  
> -/*
> - * Helpers to query information about the instructions in a block
> +/**
> + * qemu_plugin_tb_n_insns() - query helper for number of insns in TB
> + * @tb: opaque handle to TB passed to callback
> + *
> + * Returns: number of instructions in this block
>   */
>  size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
>  
> +/**
> + * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
> + * @tb: opaque handle to TB passed to callback
> + *
> + * Returns: virtual address of block start
> + */
>  uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
>  
> +/**
> + * qemu_plugin_tb_get_insn() - retrieve handle for instruction
> + * @tb: opaque handle to TB passed to callback
> + * @idx: instruction number, 0 indexed
> + *
> + * The returned handle can be used in follow up helper queries as well
> + * as when instrumenting an instruction. It is only valid for the
> + * lifetime of the callback.
> + *
> + * Returns: opaque handle to instruction
> + */
>  struct qemu_plugin_insn *
>  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
>  
> +/**
> + * qemu_plugin_insn_data() - return ptr to instruction data
> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
> + *
> + * Note: data is only valid for duration of callback. See
> + * qemu_plugin_insn_size() to calculate size of stream.
> + *
> + * Returns: pointer to a stream of bytes

Maybe this could be a little more explicit, something like "Returns:
pointer to a stream of bytes containing the value of this instruction's
opcode"?

> + */
>  const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
>  
> +/**
> + * qemu_plugin_insn_size() - return size of instruction
> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
> + *
> + * Returns: size of instruction

size in bytes?

> + */
>  size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
>  
> +/**
> + * qemu_plugin_insn_vaddr() - return vaddr of instruction
> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
> + *
> + * Returns: virtual address of instruction
> + */
>  uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
> +
> +/**
> + * qemu_plugin_insn_haddr() - return vaddr of instruction

Copypasta: s/vaddr/haddr/ ?

> + * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
> + *
> + * Returns: hardware (physical) address of instruction
> + */
>  void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);

Is this the physical address of the instruction on the host or target?

-Aaron

