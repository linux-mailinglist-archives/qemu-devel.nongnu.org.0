Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A63CC6B6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:09:29 +0200 (CEST)
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tR2-0007oK-LK
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m4tQF-0007AE-Nw
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:08:39 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:62029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m4tQD-0000rQ-Fh
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1626563317; x=1627168117;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=r0PGscWkmcCOfqDAQsfOPP39WT/gXwtNTH7y/dWZsR8=;
 b=172JKUyBnSeWqzTO/iNw7VxAEbPRjfp3oUpchssLGadV5JF1gD4nPPTP
 JseW2+zAFdY5phamdcHD3uFmCEYqZvFNnZ/bxMOBpTiA0Kk5/IjM2D8tw
 Iv/zQUUBBf0vuDawBGM64f/Wb7AbdnwKfPSNrEQYwEc20eQUcj8fQ1lr0 s=;
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2021 23:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiZK3KffCQuAzu715mSz79u0SNm1LxN+TZ9rbcZG/IgHHGGpeIUuNdBJ0r+slI58cuv12dUyaZDMYT8ysRXKxDA830a+azYc4YgUm9+M755gpJ+17TJf2GdLSUz0cmqYqW9CP9KufmajStnb42TxkLhvcUqr1ooGb3ZnZ/hZUv1hWo7j1Jl9AqhQlgUfEb8pMj4MNKPoTNfAfr5DlkidQhsE5uVdvXxPMF4mrUHcjp84ellif1bVzS6vhmt7DXDkBTelD8aTmeMRSsm702NfCgFMP2dnN+RJj2dXs1PPcN2XOX4efPJA8ifP89gKwT+W1m2T93V+upGcuNEVv45zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRrJqLrpu5NaIYNWlCeciBzryRoFaUaLVn/a2qvREv8=;
 b=RcE9xtAnmRPUW89R+3IVcVL78yxAUMmOpliatYcj3oL8JcdzU1I1zQh5bm9dfeUu0ABX4rTiNLNU1uG5g7DawWzC37dW0m0u0kWLOrzAyRmGukL06GfsiYHD4iKVGDyKd+k3GG0A347cDFewwjWfEP3a8Pu67ws5tHVs3LGCl/fKqZL0WxxuaavuL/CcQ3PR/IaZcFxB22TRiwosLjloUVmzts1VTX4axYUWjMDo1veZCH8D3oavfhsJcLnoXTA6901uQWCazUK2sSDnGpg2+PYmFNNbjz0ouM3RmlZ6OhlbydZpHBZkYfzfvLC6RMPrzojMCjAXO7llY+2lJHR10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4118.namprd02.prod.outlook.com (2603:10b6:a02:fb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Sat, 17 Jul
 2021 23:08:31 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4331.030; Sat, 17 Jul 2021
 23:08:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/hexagon: Drop include of qemu.h
Thread-Topic: [PATCH] target/hexagon: Drop include of qemu.h
Thread-Index: AQHXevbDDUXkvvhLJUSAGF/TC8SDmKtHwCCg
Date: Sat, 17 Jul 2021 23:08:31 +0000
Message-ID: <BYAPR02MB4886221507FE6BAE8D8E991BDE109@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210717103017.20491-1-peter.maydell@linaro.org>
In-Reply-To: <20210717103017.20491-1-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51dd961c-8479-42ce-9f14-08d94977cb99
x-ms-traffictypediagnostic: BYAPR02MB4118:
x-microsoft-antispam-prvs: <BYAPR02MB41186D629ABC29A0F6868EDDDE109@BYAPR02MB4118.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PPMZpvdvb1IJHi0gYtcLJBed67Rt7AO4fDQfmOpJDftULUpYQXg6XBMkxSs4zPeUxOF7AYefTQezdtMdILSAzLIAILbOkr6MLAI+ukeiv98YgIVV8K67qMR4tSoe3k9Ku72CARdvNWgzejSS4Aog5VnPdZ/jh+1TOh1MvKLedbnYLYWPmxrpS4k4cSOUzzojsFqRxxFpEXdtU8b7EWZBAHekr+ix+XyJ9ITeo+JkaniwfXERDblvUqKfSKScQCQobu5ImMbnOyrXLySs6HbCqVGC+ElkMJlrFH7gPmTcWHRXzChRVRkWfb2YqFvqzCmFpLkf9UhmnFDYhkj83AZH2lCv+l4YRytc6HYMcd0j9Fni0C9anMl/uSQ/GUkRCU74zRGVPInVpMVILjrVg1N1zrpfSOHJyQvkrx35n7yDAvDE2Zb4G5Ytm/KzpCOjhFX8ny2jcVnHhj6utw6qNdkmp9BSvvAXZGDWfUjnNAYYLQuKsYbY/YXUQ2Ayh2HEkipV3SnKQvPupZCl0oxW+UPyNAqrhoUXxKZRMqdjrysf+d86OCjdg63N6IfmABzI04UkcfhLnI07vAE42zwckIeFoTHXUuKYo/Fq3YtiSBQ9Je0kbXSn9/m0s9pN3q6Eynv8gWktnADbJdgBioGowj860A1OSjkG4NVGm3BcxEvnwY7pLLOqftRPiBXTwPWybjJLBEttLkJT7PVxYcgREbYNGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(38100700002)(76116006)(66476007)(64756008)(71200400001)(122000001)(2906002)(66946007)(478600001)(66446008)(66556008)(83380400001)(55016002)(6506007)(33656002)(52536014)(8936002)(86362001)(9686003)(4744005)(7696005)(316002)(5660300002)(110136005)(186003)(53546011)(26005)(8676002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xQM4wjBaYoLhPenu8wRJH9jvWVJo8eugS9f4WX0jt10TAHLgnwUxY29H2HxR?=
 =?us-ascii?Q?ocDmqUA6guhFRCjcKLHd8sIWCJD/Fd+pz4gykFQG0pO9ofJ1AgKV4jZg9cw9?=
 =?us-ascii?Q?9j6rRpyE7UoylwR8v5pc3Ims6Dg81d4cDAxK4C+4g2eMIibrUNONX5MmKsTO?=
 =?us-ascii?Q?LDySIHD9zyvZPKwnRAuhE0QvPuCwft3sodODnhnpi+1Mlurc2RRgzlcdkwGn?=
 =?us-ascii?Q?y+7T2HXOcSwRpWGky6b7WjZQYI3enrwLcfhYXvR7HW8YteF/IykLU46c9gT3?=
 =?us-ascii?Q?fZKikKixEzS8p7Jboe8rlDQLAldIKxEHy/zmlwYdygnWhKSu9jlSKg6FIRWo?=
 =?us-ascii?Q?QGiJ+3yUoWRoyn51+MFihCQFIqKuEN5DOBdv42XR6qNg9RlHtcFCfObAxIJ8?=
 =?us-ascii?Q?+Wehaue9XM3bpZN6QkhpxGxKpU0A/AFuwf5Ggd6z/UvWZSXKh2NCh5gQ7qfe?=
 =?us-ascii?Q?eDSb8XvHTxyKSL0DkA4DPLdA7w9SyDtyCTIvqlq9YsBLv0DoSevkiDREhLBm?=
 =?us-ascii?Q?kkPxubPXqaNELxmfxdnlNR8QmQvobtQuHV3vyboxvPdrNrNNUT0Vt5nxId1w?=
 =?us-ascii?Q?dM0ZzlF0EFwVEPWoJkcUUUL2eSwTO+dCGZBy3N0Cy3nwH+n0Lxu/ZXPY4P1U?=
 =?us-ascii?Q?sJhzyKbyIaQu2nZy1EbDge9DzNqs7+JTpHGvaqSbw91vgtn4O8JBE3QsKZKa?=
 =?us-ascii?Q?kNkkdYqPWyBy0pjjuoye5XMjm5QlVJBBa6WUvWFLnHUth+NMXvzLBzlWuQos?=
 =?us-ascii?Q?wOHCHfiAsYFADNIDpvFv6rLo3YYv82n81yqDgMlBiQyt9Ljs9JLyMUmsO/q+?=
 =?us-ascii?Q?zcA/TcoVOLIqifazpjef1tg34LN+CQcj33UPTZgKpmyK11MBjBiW33KY1ndl?=
 =?us-ascii?Q?pva1+0rT4vMkzasKTZQD1UX5bwIDShtmAeuQtJFNC5rkOIinMIRVEaunau6C?=
 =?us-ascii?Q?ZWr2Bjcs6JIi3YAoqHxD4n3n4sp+tjf0JdrYz6uPy6k9HFlEvmxloABjTIuD?=
 =?us-ascii?Q?glMXBjPkW0XZC3drybBpfyNWwBZDxrDN6WqPGsJmt3IM5f7uHJ+V7fd51x4U?=
 =?us-ascii?Q?pzj3JRu3vxacB7ewG6EXKjP7HT6XHfJR5o6UTe/WCwFHCsbH5ci0it1ydSuw?=
 =?us-ascii?Q?YmAwgJf/vwP5LXnSgVsw/tBh91lmdRfDM2Ho4gWOUYuMPbQ1GVv1OGo+2kvB?=
 =?us-ascii?Q?t4foTrycWvJZuozRe22OMN2zpNU0+kwcqGe0tiQnSNbeI8VXtCBlyH3FP/U2?=
 =?us-ascii?Q?WLonhVu1lFghJ1DsE8HYP++J99CumD9tUDuD1RDvL5Urz6OBc6HvsoSHVjfU?=
 =?us-ascii?Q?SZZ5R/ypRzX+CVmZX+mSXKHo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dd961c-8479-42ce-9f14-08d94977cb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2021 23:08:31.3975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGx6VR9/rVGLJsI6atYUsnYnM7vOtJljT4Ah66baXrZkyFiQP5X2Z3I0wSBXI1NvfbaJ3NWuyhK+mp3HN41paw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4118
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Saturday, July 17, 2021 4:30 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH] target/hexagon: Drop include of qemu.h
>=20
> The qemu.h file is a CONFIG_USER_ONLY header; it doesn't appear on the
> include path for softmmu builds.  Currently we include it unconditionally=
 in
> target/hexagon/op_helper.c.  We used to need it for the put_user_*() and
> get_user_*() functions, but now that we have removed the uses of those
> from op_helper.c, the only reason it's still there is that we're implicit=
ly relying
> on it pulling in some other headers.
>=20
> Explicitly include the headers we need for other functions, and drop the
> include of qemu.h.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Based-on: 1626384156-6248-1-git-send-email-tsimpson@quicinc.com
> ("[PATCH v3 0/2] SIGSEGV fixes")


Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Thanks Peter,
I'll add this to the series and send you a pull request.


Taylor

