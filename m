Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B4E3396F9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:57:45 +0100 (CET)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmym-00077w-Em
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmQ0-0002ws-UZ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:21:48 -0500
Received: from mail-bn8nam12on2125.outbound.protection.outlook.com
 ([40.107.237.125]:13152 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmPz-0000oz-9A
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:21:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWUZh29OI2Zna7DUt7EPtyweuCHa94JdYhcby3JPGdI3lYsvz+WVE9UH6Jc9thJNrH+iuBFNMHJvKMBsVwpT7ptt/Lm13ATGnt9RsHpCYgDuSElzW2GXv1tgFXvoYPoZuZ0wbyd7Mc0EFTU689ToILz1TIgcaXq4NlJK6HiMj76uZG8y2gCETjzlqCRyhJV43J6qxOeyagRWhKaLBEnpmhHUlCVK85H2TqC26IUcAWkkJ4WtWgVMa/3pKuOW0cPo4vTEaqBzhfd/PVfD6wQ03RJKii3azsxSz2qeGmsJNNLDpWXZtngfFgMK7tLOR9VwVRkA1Pn7L4OBBZzIUYYwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hldGJc0TZj8v/Gy3f59EcVYJIbffzqaYBhCc7m6izwI=;
 b=IgmHoudVv3KPmfVvbOIj0yvC14tjwp9B3njwvGvZSQsGJPgyxAGL1NgtO4d2jXYL4RVxxl/Wah3q2uBFwZ5v7T1Rpp4FG0bGE9GkclXNTMj7b+VTGzVNvj0LFx6Ui7Nv8e/mqB9F24yj3psLfp7WszO4PbCxd934+1meomMVoj4qTs9qSy4rS97D1MCcBe7iuwD+xaSLKkmhesOrnDEOi1ghvFoSAueGbTPJUteMdgRiQKz2ZcGcgYwjOMRo2sd7/VpIzfMjkCfAWkd3e3z1T0q0cN/vjKk7ApM8xwKdRV6j7VMQEeNWYcmWIEbzwD6rExORY0E1iN15pL49Zs/vQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hldGJc0TZj8v/Gy3f59EcVYJIbffzqaYBhCc7m6izwI=;
 b=SaQ/pRL3U+K5/FxM30HnEOhdewTERzY2fVOx0Y83wzICwH4CRA1BnmgOAAf1AR3LapPrG95kcXti79TUNIA70fWXEKpeOEPKNgq/E8pFLAzvUfxnQb/HAmemw1ZCzEZzMKanneaVsYnX3gUCJDDfBZK0J0DTBZ1X59R2lNVl+Ec=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB5280.prod.exchangelabs.com (2603:10b6:805:da::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Fri, 12 Mar 2021 18:21:43 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:21:43 +0000
Date: Fri, 12 Mar 2021 13:21:45 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 05/14] plugins: cleanup kernel-doc for
 qemu_plugin_install
Message-ID: <YEuxOVdBEv8hDkbY@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-6-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0258.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::23) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0258.namprd13.prod.outlook.com (2603:10b6:208:2ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Fri, 12 Mar 2021 18:21:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75641e08-32cd-49f4-a33f-08d8e583b050
X-MS-TrafficTypeDiagnostic: SN6PR01MB5280:
X-Microsoft-Antispam-PRVS: <SN6PR01MB5280A693328C3ABBAED0AD928A6F9@SN6PR01MB5280.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mhBNwA8DmO4xGIMfjCu67wa+ge+rCaHr7wxBPHkHM/J0O+m3GQjwkigRXxQtsXUy5GA0jivK/tJ4RruWM2A4k+vKlIwRiRudMG5fbdKltpNoRFRLmROiuOzRogVXQ55B9jsGMRj+gIVEvJ5G7jk2rLHanutE7fXtMyU5WrOtLwzIY7YBmTHhOE9Q13vOPqqM/9gumLxxmWnSwW6O2c/U2XslXBYE1O+6a/uKsJURGjafjgrZC8eE/iLEP1S24tp37FNIJ+EYYBXJOcNoHKBxp77kv9MgCyf+ZNGYpk44MNNZ0Y3w5WatqC6v7s5ozN2BiGAMoyN8f5Xn1NgmNtrgpodG6a/nxKz8aZeJ+jGA3KQWeuD20UhuiCJvtL+IXZWHAYLD2kpjqNABEIKygW/EH7OMSEGa4aAu/bN7GgUpz+GSScid7tJamlIuYItAVPPP+r2bw21KSfRx95a9Q1hQ/fWG21ni5Sq1A7PQnKyIR5GVrpyVLLmjI/PUqPBvzoiQr4+m4hWDFGQ22+IVotoMdNb0aoaCpAWMZZVNNG+u418TUP6rBv7xJZdiyCvX1K1Vl40OPbDHNxLAzlaV8EbGyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(26005)(2906002)(83380400001)(4326008)(956004)(66476007)(6506007)(66946007)(8936002)(34580700001)(86362001)(8676002)(7696005)(16526019)(478600001)(6916009)(9686003)(55016002)(5660300002)(66556008)(316002)(186003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?pgduyJDbpJLPJeJb2JPLKPVRvc/B4JNfKGRp56gz5kg+Q7l0OJUCUSxpdR?=
 =?iso-8859-1?Q?6ZphXDV5EXzInHZqU9S/0Jl7YIvNeG0aWoJj+BAg9tDkAqqwvoNxLm91d7?=
 =?iso-8859-1?Q?UyEmsjPyEhuJeZSw3PPWWUd28ukKmfc6G0b51Cg4CRmz4mjHpVj5SuFVt8?=
 =?iso-8859-1?Q?Bn68s78Zy4DqWALrRmjEyij0ovDt30DiQvPuCnX0/XhqstK5B0E1PT93U6?=
 =?iso-8859-1?Q?FGWwS0TLlhvTbv1Ts9CY56Ob+aEsE77fL8j2tZ7/1pMnAHbxSQAO86WNgq?=
 =?iso-8859-1?Q?gvIj4PwuaOqDeR+iRl4vNh8+8nFq6MbdfLDWnZGZmp8YPCs8e8mUoZFkGk?=
 =?iso-8859-1?Q?ri5eXntrOhtr4pM5IQwYTuVdWma5h/PAwMHDTJCoQEEqYBUzYxQV5UWtBw?=
 =?iso-8859-1?Q?FDnAKaS96tYQJX+bUnrMuQiCxqbj6/WT0K3AXTRxZd0+ak86R1v8jTSJ4f?=
 =?iso-8859-1?Q?64ocXIf/INmtOmYeIo1ayrgaai4DnGdd0lsi+ALelJtHNt+fh/IfafhRsh?=
 =?iso-8859-1?Q?g6sICcVC+GNGohiB/YfIULjmrRjq7jqqdfoMy+cSe+NqNbUe/jD7b4Amc0?=
 =?iso-8859-1?Q?lAq3UTIrx0E1hEdwH5HHJbAj4I4NDft474jZ/ihhQVW8Gikrlh730Oy1fN?=
 =?iso-8859-1?Q?wrHpvPUmqsnGTYOdRplf3BAgiJBi5bhmk2OLzwUPK+i2MMgMwOFOJ7XdCs?=
 =?iso-8859-1?Q?kano3kjS7vl03nNGWAX1TSea832wcTyomqpCIGg/mLzj2Y1xgjz47zgYju?=
 =?iso-8859-1?Q?jAgytln8jH93Svbh7X0X1LTOAru2MYuub8NnH7dYWPL+XuUjtaCsM3zBXM?=
 =?iso-8859-1?Q?jLZZ1fhtzz4EhBivbLI23kP4XZUdnQK0T/MzcpF1VmVA6BmR6u+kdPKsrZ?=
 =?iso-8859-1?Q?VC/5pFU03ZA86fhMrIrjQLfmmc3HgaPzhm7UZP+o76+XR+8QmNCL1Oj0KG?=
 =?iso-8859-1?Q?xE3tQYTpPjBqn74WbyDS6ll3CwenghjOrDeVii+ysh1XEmCTXgxNBqq+tN?=
 =?iso-8859-1?Q?M3/anB0+K1WlS6sg+MLuf/FW40m7P0DPU+MP8r8gh6aC5jwXoVfT3VJujV?=
 =?iso-8859-1?Q?oFL7dzBJ/sA468mnsS0j0RvkB8+skCPjW09yQMX9z8MFpWCeEOw+PhNrXQ?=
 =?iso-8859-1?Q?GZ1JcU61B8QoMnOkDrdDcJqNmshPoa4/sbM36x5ZEn1EEJCc6udPk+evwU?=
 =?iso-8859-1?Q?cTJSdCq14652SziNfs6atd+BFnZcw0OyLnDtLpTZk1+VP/zyr7eGlt5wgG?=
 =?iso-8859-1?Q?dO5N8CCG6R3+5nXo8W6rZq9d3oK04XtvKnUrPwQ3ELfvF8lj9mqiU5jyHv?=
 =?iso-8859-1?Q?qHTw7+lAwLI6Nd0XNaDnP4he4rqwWiVnRUDV/Dmq22oKiTQgfS3QI9BYGm?=
 =?iso-8859-1?Q?eKTMFhyEtD?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75641e08-32cd-49f4-a33f-08d8e583b050
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:21:43.5545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZP8EhUtlE2FBf6a/NtXcra71EtlQLbzA9FUz0NlSeyDQE3OgQeb8JhKpAe4nXmAWPQY5Iw+ezlrAyoVe1VXXs171M4mGtFq78NzmmEKbOYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5280
Received-SPF: pass client-ip=40.107.237.125;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
> kernel-doc doesn't like multiple Note sections. Also add an explicit
> Return.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  include/qemu/qemu-plugin.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 4b84c6c293..ac1bb318da 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -85,15 +85,15 @@ typedef struct qemu_info_t {
>   * @argc: number of arguments
>   * @argv: array of arguments (@argc elements)
>   *
> - * All plugins must export this symbol.
> - *
> - * Note: Calling qemu_plugin_uninstall() from this function is a bug. To raise
> - * an error during install, return !0.
> + * All plugins must export this symbol which is called when the plugin
> + * is first loaded. Calling qemu_plugin_uninstall() from this function
> + * is a bug.
>   *
>   * Note: @info is only live during the call. Copy any information we
> - * want to keep.
> + * want to keep. @argv remains valid throughout the lifetime of the
> + * loaded plugin.
>   *
> - * Note: @argv remains valid throughout the lifetime of the loaded plugin.
> + * Return: 0 on successful loading, !0 for an error.
>   */
>  QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                             const qemu_info_t *info,
> -- 
> 2.20.1
> 

