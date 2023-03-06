Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5476AD2CD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:26:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKCp-0007PW-8n; Mon, 06 Mar 2023 18:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pZKCn-0007PN-4R
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:25:21 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pZKCl-0005As-6n
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:25:20 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326N6CBM013083; Mon, 6 Mar 2023 23:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=C3Td006AXr3lxn1XAhMD6Rr2Xzhre+U6WWBwNVjA9I0=;
 b=cjfptzq/zPylI+C2CAQtYCEskILFppBHqEy+/9cE6zH2YKtpi5addK3oyRWQR+zBPt9T
 wHUsD2c90xkb8nqoYUlGuUhq1WDIXcWrcvJed7AlH5QvYDdIicpK0STpEl96Ekek0QeQ
 pDsKdCjQ7I65uZ0CYsqSBcN410PNWN2FzvatTUYqzRGU2YsHi9TDjFB7E0IJ3M7AOWuy
 hb7Ei5d55UqspOkmXp+ZHEhyJQK+KH+CE2TJUaCU7RTnagVbbAyAwAau2b+HqKuRniAk
 6z+p65cBF62j0aoE79yP+qwTmKRObDrbHeqejWU1i0W2rbXCm+W/QTZrfMHyEg6IfurF SQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p415hx9cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 23:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqtxNyMiDq11d7HCnDuVR4fKYiLDjdYlPlN6SdYbgSLSXAW9DXOREr3bZSGeP+VwZl5PJyLkAKgjYYiZfRc4MiyQEf+YQI3Q2e+6mel+0Nw0tAFHO9zbUVnePcZwVGdtNn0IPyakKu5OJSQ2KVdkPxIKJra7ZDYu8f7MvVEPrVTV3uzbcuQULHPNKVzOQccIy505EJuWysA+SZN1VaaM2AEiD24mA+G2vWn3J9lWtBGY+ePy+KuaAJMSCI/XHr7DBC/cb+NRdUrMoXQg1c/PQ+jM143CkdqtMuIMEKX0zuHxMSYkuxQ2+YU+POZ/ReUTqu/LbNfL1XoIpEgZcNrCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3Td006AXr3lxn1XAhMD6Rr2Xzhre+U6WWBwNVjA9I0=;
 b=mH3mnf1uGO+L6wO5BuOV+DuibFCiHEAwcuOU2IM4zFumckyx/ym2XAIaFjWcNy/P8nhlmOnD8/yiFvhzlXXHMjmMijh9jz0QuSHTZgPGRzRw+iOjiKtGqFD80CCehXyAx+RUA/ADCqGxdpLoPq2Hvkw4zYYMMqxEN2WuoJWkT96sJ66BKZIUT123DWrxna68w2k1o8zD/A2lKujMgMTb2Vw5B9sXrob45ruFn7OTp6v8Qd3D64evMFiVr4l01VD/RzxcM847rzVrzPZZVt8b/Wgf65GdaRIVjNR73dqmbjHoB0jT+OanQEZNzBBWbi8ZaNUHy3eW6djzzkGlTndxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA1PR02MB8655.namprd02.prod.outlook.com
 (2603:10b6:806:1fe::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 23:25:11 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:25:11 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/hexagon/idef-parser: Elide mov in gen_pred_assign
Thread-Topic: [PATCH] target/hexagon/idef-parser: Elide mov in gen_pred_assign
Thread-Index: AQHZUH8HltRajcjH8Em0tOzssYrbpK7uZGew
Date: Mon, 6 Mar 2023 23:25:11 +0000
Message-ID: <SN4PR0201MB88087CE89364B4DF9C14C855DEB69@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230306225724.2105263-1-richard.henderson@linaro.org>
In-Reply-To: <20230306225724.2105263-1-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA1PR02MB8655:EE_
x-ms-office365-filtering-correlation-id: 2185aff1-1e22-4de1-c5e4-08db1e9a084b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQZ59iqlZBg3i/kg4CmdN4cySeTQExG9TMIzob2PaEtAio4Wk027CflLy4Px1Xaj+KJinHFYZAFwlA82lqnXrn8mnEGWeWOlWdqRmj8GIoUss7d8ZU5iwFgRVUqs2Y153V5gyIOquuoELNpaadz4y74JPhE9D+nwDugZj8LiOplZadqNMn9rP3cBoatfAOejHWwNHPJKS1ER0wq7lRHKfJMIQ22NHxd1uM8W82lwwopfVZ2DlgxEkfqbMMiJxcvITCBnMsIO0qjs/TLhG07g4JYKNpet6/XwwjgZQt0ryeHKKohWrEespxviFysIx+G1st6RCjUCR+LkhePWLUTQk+MT15fg1JEEQh53bg0ruJ3QoXbJ34yWIViwhaoMZtM2uU1KXAzYEVQGmU5a9+mYVwH0kJcCrsc43JWd3l2KMGj6O/FfEf29MJtxGW722UKQCj0fznEtHvxaF4Oa5q/C7th1IWd+k9JICbiU2kONsCTDiGYx8a1Fi7SoZUrsB8cMHk++fNMTFaeiFcUAUNJumsJa5yrLlng9h5fhdXhO9sKCci39BhFeaxqUg/mAVUyASMbFTTgJBtz/KLaad0tOnM7G4/rdmZUHDVgA1UVCbqQAwLgXlE6CS65oMvuUrcDw+idhaLxSnx4HhGZyy1wkljB7+9h3UL0mf6a0ccJNgxJkSYngiGxEnnnCM0q3aGTsd3M+7zTMLI5BdE15N0tU8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199018)(38100700002)(86362001)(38070700005)(122000001)(33656002)(5660300002)(2906002)(64756008)(66946007)(66556008)(76116006)(41300700001)(66446008)(66476007)(8676002)(8936002)(52536014)(186003)(26005)(9686003)(53546011)(83380400001)(6506007)(110136005)(316002)(55016003)(478600001)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O5fgqnCYp8msACWZn8/cEQiU7xrX3cDbjhPx+epx37v+HpIVqyLMj8cFO5zc?=
 =?us-ascii?Q?DQbH4FFolT8Lrd84/IytsrZDHMGmnsx5TaOLECBzlKU0+H7ELDfy9oGqAFu6?=
 =?us-ascii?Q?De++NkfllasKJYV8QFOKNkBSlTzCsvPt38Bzo1CwOaraiOUOlL4YZqju0LHt?=
 =?us-ascii?Q?ObiY9xGwhpLpNSvBUGZ7/p5XoWfOSZofAe8XQOqDc9U3DwKYo3xWmq+i0s7Y?=
 =?us-ascii?Q?DTpS/Mhh1YLKnZ/hcWgJ4z+81JReLbnlGKKbvvpP6VuPfnBjUFgCkfDCuh4R?=
 =?us-ascii?Q?aYr6brYcCqXwqcGnWoddZj6fEo+f95dwxSjffwqA+aVYK20QmPCbNY+i0O3p?=
 =?us-ascii?Q?57Jp+As+omn2OacXF5RkbaQIMYnnaRj6XPAt/mKCJWbk9yyb+E2P9lPk0vJ5?=
 =?us-ascii?Q?vRHP9yzUAIIvajW8YZ80Kvj3RVA2I8Gm2WgknOy9ZTZJaM5ORpseO1SBfNkC?=
 =?us-ascii?Q?d5UQOKxQhM6xHFhXnHh4rx2S1eoHT53zf+zQac6B6x1wHSPV2U7LwfefjRjF?=
 =?us-ascii?Q?Mw2CXRyB+uaIyeAwrAWKOp1aL5x7cdXNFlg33eIFeKvoS8ioKoHYdgRmhsCH?=
 =?us-ascii?Q?t6tizhI/HtMTfw1Xs4LfXLaOV1rPKt16WydofAgN0YnwW9Lev06AOI0+j+lC?=
 =?us-ascii?Q?mq5ragkRwmX9OLnH2NHifLnn8AnGZF/lWW0E28CktLBEcGo6iGrH8IwlHOje?=
 =?us-ascii?Q?RYB6NCHFnwq3gqUv0kDL2knEp6RT6Bc6ARI2NHHm7oRR6eC6QMLLaOxdrto0?=
 =?us-ascii?Q?kNfx8whQkUBkrfwcD4o6niKQohwebNdn9N8MzOO2NHHkLH1DLhJ0ypwFk4M8?=
 =?us-ascii?Q?IDSwUPtBr406vXnfR5SOHp8Ee9QBmloMkQNjxYXoYMqBZXzLvfy4Wkmq618L?=
 =?us-ascii?Q?2QxcgSfb+E1yhObFeTKxa9XR9DEDCd4sa0XfT0Z2MQuJzKOTSsFThFTyZAek?=
 =?us-ascii?Q?4glDJccw8z8HpiDk4A3cw3ywirMB9gNFqZr7OZ8r0YxiMtxcVRS4VHpC15Ti?=
 =?us-ascii?Q?cNbhMMIe/37lfrlLg99JTxuYlWiN8mU4va0fAJjGgNBe/7Qr2O2RM769rEgp?=
 =?us-ascii?Q?QEomsmSiMbZUfqeW6AITlhUReHw6vb2Ci8UfI+8B6Ij2yeiHGNrrnPvkOriv?=
 =?us-ascii?Q?3VCmHBEx3xptkHQSvXCuI5srOWay9ovtuVbrNSvwe7M7+ok7X506bw7jgGSS?=
 =?us-ascii?Q?KEoRwoDythu2nBR7xUi7SoxjGCTUjkHfOftpG0Ed4/HvPqM6/B4NR5vC6NXf?=
 =?us-ascii?Q?3vFkvbAQkJOFS2NTFyahx6xETqgsHT/H+t3T/bCZ+wxIT503pOC3a2vRfkIB?=
 =?us-ascii?Q?eOo42y3+pVWUue0G/Osidac9rAmUy+gPwnBUvvSC8qTNXDQgxHlnLMoyBxIC?=
 =?us-ascii?Q?U+21T4w0MV0fYnhbtcv39wy+1sfh0vnVRWHye6jRD4mSntbBhXydkA3o/aD0?=
 =?us-ascii?Q?sHChq3lXAovjdehgFCC71UXoQPn0J4XhoyQPOMt87QLt2WHqxkBHOjBBgTf+?=
 =?us-ascii?Q?pxwOo0JUKNzE/pbMsRWfG9Ihkd23Qm5fQ6aaye9w2xOWWmNEOILRRCst9Kab?=
 =?us-ascii?Q?jPV1j0lOjaHVW3L1vJ/vdVNzDcGCtfhIgpRoRTz0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TvhNDfSk6H6A/dC5mtp6xJH9H3kt7uQ3LH/oVf+c4ZCn855RIU+nFtBRPhDOzs2iwU3VPoBsLNrmQnXUv1n7q2859tCK+ycO2NhIwTSxtuEmzVCfE5S41iu11j+oyPLNGFNYoCHz35hm2wzbphsu0M+91fURmaarvpHetxBeH8iPAtsI/FtxY24gLNlkPRl+ojCBAeTeqo9Pypo066Wn1NQ9mYHfnlsrWwU06O8J8ePboLcOuvevbSDFtXxKnZ7ViAoC8LpeMnXqB/xHcog16GcmreykAxc35kjZknnsIq1jEEp2OLq1f4RiJ4uxSj6Mpvfg+RrLebYOzU22x/w2gyAVRnLVRhk3zvZDyoPfjzHXaQqG083LQrz37Sd1C0Sp5OozXFdK0qmp+BCtDlxApR6l1DYIjN5wywuhgN3iWvYxXbje1h2Sd33GBLt0RWnq11VRQJ06/GfWyYlk+vcMmI0bdJBjlpRtkzhKieaEbkHheISS49AloJbqTQ8sT6mFOGjG9f8FRDsZU/7xcRvrj8SZEXi/I8eTofTiwlQAOwj1Ya04TS8Ju1ro1I8PJ7oX7GfA4e9PVY/wAGsu2E9rYUeRS5/DouBzWDcpfvoiUrv6GDiXDn2E+DEAolf98y369Ox6MlP2JO3d7ggc/9DGPm0mJa6voOSZjxhJvNGkpQtdRYavtJFHj+GaWCBBnYifXksAqJK0ltWlvbiPnuWtiQSK3hJZsPILyPyStyZwcOUra/N0bpgxZEaGlEEH8gT5TBOCGODOuDRlsW/1zfK9er/HIrORiPFkcRBFdzIRQBo=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2185aff1-1e22-4de1-c5e4-08db1e9a084b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 23:25:11.5881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjG8R9M8UYvSllICUJLa0fgtyuiMmoRxVzyNL1LuDWc+NjtZNMpyk9ze4Nku6Lj0pXeZOXKDdBtoyq8BMe0k5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8655
X-Proofpoint-ORIG-GUID: tEo5AlRZZUut3ZsESgahHE6-Y1MXr8LN
X-Proofpoint-GUID: tEo5AlRZZUut3ZsESgahHE6-Y1MXr8LN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=848 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060203
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Monday, March 6, 2023 3:57 PM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH] target/hexagon/idef-parser: Elide mov in gen_pred_assign
>=20
> Merge mov with andi.
>=20
> Suggested-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/parser-helpers.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/target/hexagon/idef-parser/parser-helpers.c
> b/target/hexagon/idef-parser/parser-helpers.c
> index e1a55412c8..7b494c2f9e 100644
> --- a/target/hexagon/idef-parser/parser-helpers.c
> +++ b/target/hexagon/idef-parser/parser-helpers.c
> @@ -1722,9 +1722,7 @@ void gen_pred_assign(Context *c, YYLTYPE *locp,
> HexValue *left_pred,
>          *left_pred =3D gen_tmp(c, locp, 32, UNSIGNED);
>      }
>      /* Extract first 8 bits, and store new predicate value */
> -    OUT(c, locp, "tcg_gen_mov_i32(", left_pred, ", ", &r, ");\n");
> -    OUT(c, locp, "tcg_gen_andi_i32(", left_pred, ", ", left_pred,
> -        ", 0xff);\n");
> +    OUT(c, locp, "tcg_gen_andi_i32(", left_pred, ", ", &r, ", 0xff);\n")=
;
>      if (is_direct) {
>          OUT(c, locp, "gen_log_pred_write(ctx, ", pred_id, ", ", left_pre=
d,
>              ");\n");
> --
> 2.34.1

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Queued for Hexagon pull request

Thanks,
Taylor


