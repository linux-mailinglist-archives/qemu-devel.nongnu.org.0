Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B941F77F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 00:41:15 +0200 (CEST)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWRDO-0001RJ-8b
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 18:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mWRAu-0007Wu-Fd
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 18:38:43 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:52200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mWRAs-0005oS-9V
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 18:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1633127917; x=1633732717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/SHQX2Jy0liNrS8Stn1NUfOSXn3flhsNcSPbND2baS0=;
 b=OILp4XIOZWN/D6co2fLEZg2kZoEPDvzLwdcmwPFJ69eaZTBHBd974xaB
 U1ZyG07UtK06t2P8KvoiAdewulhZeJ3XWHZM/unGsjnBYQJHRw+YoZ0Sg
 NxpBrN/hXkhtZseXRRLsqsHKH2fSIGDR7Dwmyg3/uhZcVgPSrHToGVTw8 4=;
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 22:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNbDqVNfzHIpqfpH7TrSddUgWyIHeC7RO0n7bHx4DtNeCSWr8+HO51gtobBdPSibTo/6j6xuIleY16U4srF7Ow/hi31a9G61MdRRuTEQbMhiMgjtIKV3yOF12Oe9O4+Cis7lWIWuXyGx1R79t6eJO9iAb+pwwJ87D9Kh111crxWZGGRxy5kdqhJhXB1Il+C6IGM4dddMkz1JCXVwrxhipFfcQY/cK+7/NhDewcKToE7FfERIxWyjf51I2qxs5DP1vqwvMegXN3I4OPJpwdA6pFxsoHEgYyDIA35ftJ2ii9uRNGPhfSRrtB90BEyimzPEpoBaSTkxjCpYw5XmItEfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SHQX2Jy0liNrS8Stn1NUfOSXn3flhsNcSPbND2baS0=;
 b=ocLXmg0GzPx0MU9sQ3TLHWRlPNFL4Na29HS8HRU98yWwiTg+lmSjaok+eFSo6BC6tj12omW8ebYmKuPZ/qXHz7Ckw9AlsvqtJPXDP4rsOyUtVPlaByQTYic6Yp6QeZqe+QOxElfxjOQzfwgOmf0ho/eBqZKeNfz9/5+q9rULgNKO2nLQnJC1Uc5ebzPD+o8rF0ee8qR3IDZTuYvfBUDmmVps8wWBn0sqv1o1o0F7Fm0S32NQzNQnKQO5wgIDAXuum+TAIFm1s1Ye0FEo53pq7d5fNGfsLzFInqUTeIFzcsiU6+Fy/7vBAi7cRYrpPJJdtyDnArDh1mYITqp8b7J8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA1PR02MB8541.namprd02.prod.outlook.com
 (2603:10b6:806:1f8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Fri, 1 Oct
 2021 22:38:30 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::280a:7736:7222:e289]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::280a:7736:7222:e289%7]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 22:38:30 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 25/41] target/hexagon: Remove hexagon_cpu_tlb_fill
Thread-Topic: [PATCH v3 25/41] target/hexagon: Remove hexagon_cpu_tlb_fill
Thread-Index: AQHXtuehSWtk/fVh106dcb0usyN7fau+tsoA
Date: Fri, 1 Oct 2021 22:38:30 +0000
Message-ID: <SN4PR0201MB880857D69DEA0CD230DEEC18DEAB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-26-richard.henderson@linaro.org>
In-Reply-To: <20211001171151.1739472-26-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04fe12dc-63a7-470f-fb17-08d9852c3185
x-ms-traffictypediagnostic: SA1PR02MB8541:
x-microsoft-antispam-prvs: <SA1PR02MB85418BF75CACCD1467916381DEAB9@SA1PR02MB8541.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5oD12/FwM7VlyQqJgJDh/lrQ9oLcXHnDIT4oCl5uHuk7iXUBJN6nIIE0dESkHG33xW9mTCzOkZyi8O/YYSOqC8uRmiyYbPGvUa4QxT2w0GUogd4BgFW+MvzBcmOUlTTXrOPQ860CHsVP0m7oSqBdjq3dAjw477MbF/HGrIOXbyUbuq+wz1rRn0Egfa/As0j+F0JcVxXEDiS8Q3YGmnRVhNbVocWzkcgV9nmNlq1jvneBUY02C2nM+nyfNEr2o1qhbLfPEICda3Mc/ibGVs7a/sl/OI2hTS8V2KRgIsGEAEHkd9wGcuEKNvHQ7dgbeVxU/c6/OOcMCSzhLMtzXjgwk9E4fOa4YvmD3+o2TDU3Dc/qD1ZOEJ4ete2r8/YrHCCqPRFOU8NLwsUagOUyv12rqnOWlYxYuTfZQPmpc+CXfewUNwtiE3IgIakZSP2xv3iPcG7ta7gtOdIm2C5VT4Ok7NRjcOD8uhcc7AO34WhmyLBCMSEpdyU3qeiVFIYwXZU+F43DYBMPlFwKpJSDJo3aFN8S9KqhAVjVKDdW1uYz4IRcJsTmSyMD7nnWiaRf31Flum0XUv8Joqizd7l+M4UQPItrTh6S5AS02Nem76f7CmR66eXSGIz2O8jBxsh4klYhOi9KrihRpch2flkvqNr4LvOousSaj8qpQJEmlQnBRZGz5CO/vJlJbKDXcTCDcI/haJiirVccoc83NOThEyCdgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(64756008)(2906002)(66446008)(316002)(4744005)(122000001)(66556008)(38100700002)(86362001)(83380400001)(8936002)(71200400001)(54906003)(7696005)(66476007)(5660300002)(52536014)(4326008)(6506007)(110136005)(508600001)(76116006)(66946007)(33656002)(26005)(8676002)(53546011)(55016002)(38070700005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AZj03iHWBKV8zOkEhPgqPhHW5gdm0W8JEg6p7D3wqbsb+Fc2x0fFQbKaPcX3?=
 =?us-ascii?Q?BOICW3bkbnzzCAS6fl5aJwLEwbxxiAyZxH3vi59XK1myaO8bVOIYM7l7+y09?=
 =?us-ascii?Q?qMVBwAUw2n2iRPkJr26gYrskrcPAi8S8N7E4AjPHcjulJIIecInwCI9UYakw?=
 =?us-ascii?Q?ra0VNj88gnPPpeQdLtJU2YCcy0X55Q3X1Mpr0YtO/s+CXXpSvNidLnje/Fao?=
 =?us-ascii?Q?t+T2wcxCd/4a3RKFJKwOpT0yqeQM1xequ1frj2ey0D5Y6Sv/JiHmcFmoboJA?=
 =?us-ascii?Q?jSJOHhQ3V5D/b9rdXTBq6cs3+hIr5/ltv2NpYdi0cYPvmBPdFrIVYEvrblL6?=
 =?us-ascii?Q?CBLy2omAqVEZtbMNEzrqNih7ZYlRmiGROnySXP4XBsVg3SRhVMxiRYUBOb9x?=
 =?us-ascii?Q?t2wLKvCWgofDFxGdR8k96IRNAz553MHW5tNx+mk86RdJHmoNaf+OCY2qBGnf?=
 =?us-ascii?Q?RepCk2r9H0MbBrZuUEDjM+F1clLy5EdofCpXdQljh0B+ZJ1n7Dr+mzB5yMPP?=
 =?us-ascii?Q?/MNpvl6ZlnbWtjgzfBWVOtkVGA2qx9G6E4COgC+05LjinC3NblzV/wkSbpU5?=
 =?us-ascii?Q?05KlRV+WlqUpfwoIc966YE4aVdsJ8CJytico3AZxGguV3SBnCxr2x8UImG4W?=
 =?us-ascii?Q?4tEDriKP33UHQ1RPDSHLbQJCAtG0wjJekw9L/tb2eHY8cX5iBd4E5VjVbJAE?=
 =?us-ascii?Q?6J7lb3iLD51DCUlE5R/nj7ffNuLBJWD8zHAfOa9KaluK7ea4Fppa32DiksDP?=
 =?us-ascii?Q?BKUuNYqkb0nPe98DClxRD4vrQv2aW3QBD7zjCOqcozVGIdcX/x3yc9I84trL?=
 =?us-ascii?Q?7jjaJ1bfsP66JhvNEMxvy/PMSOLqCOMrjk1m3NMR2M61Np6gj6URs5iPqreD?=
 =?us-ascii?Q?tUBBVHI2edi9qDAiaXAYRKjeSR6aOj+fr1UNuov4JBVt9V4ZefFXiNSdHa57?=
 =?us-ascii?Q?VOzm8Jenv5L5MuuyspR++kqexDDVSnk03Kxovk3eBB/XNlFE8RE9+rjabeC7?=
 =?us-ascii?Q?R25lPgemOX4cCiN3sAP93bduCd/uxHkXM9zexlnFaEhDHkcBagkf+CjlgIc+?=
 =?us-ascii?Q?U5SgR8SovI+s2maD+FyJwn+PoE59YrDrSQxLbYckLjcU7i6rh+s+PD3TQ5tK?=
 =?us-ascii?Q?D3X5C2AmztHWD4PVYnQZZEzYBW+uWbYoqystuRmCqlhBlUawAp7X6GDQBh85?=
 =?us-ascii?Q?4ZNrChkTttSbvkqKgoROr1vSvkvfKkwYmHkg4qyhpPWGPrdDpulV25s7Ow+4?=
 =?us-ascii?Q?r9W3pvVqHfQUAOp8maEphwd+Ao8LUHqbJEtugW2Ug15/A6IEHhR86aommIJV?=
 =?us-ascii?Q?wbXKOjT7JmZWfj+EOpBCB4q3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fe12dc-63a7-470f-fb17-08d9852c3185
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 22:38:30.3663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D3IiaUXttSA2bUhvq7Hmd0OIuREJMT8Pr6lTxCvT6oKe695tyo2ovZdGU5lZaKenPCX0/SMvf3KJoYpqYbxImQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8541
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Friday, October 1, 2021 12:12 PM
> To: qemu-devel@nongnu.org
> Cc: laurent@vivier.eu; alex.bennee@linaro.org; Taylor Simpson
> <tsimpson@quicinc.com>
> Subject: [PATCH v3 25/41] target/hexagon: Remove hexagon_cpu_tlb_fill
>=20
> The fallback code in raise_sigsegv is sufficient for hexagon.
> Remove the code from cpu_loop that raises SIGSEGV.
>=20
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hexagon/cpu_loop.c | 24 +-----------------------
>  target/hexagon/cpu.c          | 23 -----------------------
>  2 files changed, 1 insertion(+), 46 deletions(-)

You should update the commit comment because raise_sigsegv was changed to c=
pu_loop_exit_segv in v3 of the patch series.

Otherwise,
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

