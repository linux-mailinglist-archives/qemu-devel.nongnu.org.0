Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E1E6BA0F4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 21:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcBV5-0005Ai-0Q; Tue, 14 Mar 2023 16:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1pcBV2-0005AZ-SF
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:44:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1pcBV1-0000PZ-4D
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:44:00 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EHumdQ013091
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 20:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=57gBxi9VNJZ7EwmD71Awej0P3awWzL7DoLq1JtJF94E=;
 b=VtpphsDE71FYJom0v5Ndod+ZI5A3BRlKcYJtcZgWCEKhhvfC5etQN8bmPyAXv3YlMHHH
 uYdrDMLji5qD0zMrp9axRJTaFZ2CSa8aWYSiXKESY9TcH0CPHfhsjw5n72BvuJBPCHQV
 G2eyY43unG9hilZ9deTzg213F/aUB1hBKsgVYSl4cVTngK3cP+CfbLPVA359TBSwz7f+
 lnXCXs5+UftGHe5w0oHI0qJvjfC+55oQ4tHep28njk6xyMSGMB9vDkZZlbEVDRlYoxre
 t3n03CwyK5cc3O4jDUCdUvcGWG00Twa5+05+BoAkmXaN35eqLJ8GUysJKFoAZMII6yEC CQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3panvj1sta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 20:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPLwh4209c+KKmepqqT20TDGkksLn/hfTTP7VFcoNvkQN6evDarXV5nVqYNvDg7WRvxa7gSrQ2CbXLaCfPWOWAtWdEako5m7jXURmENZqbn9B+6ZsuCr3qHX6rjEbAoj02KFZcwbBLLQlMG9wBeVOradAa/FNF3oFF9t9W2K93iixnDjuyDNg6ZZQ4jq8OzEKfQrZRsWWxF94NJJvUYnCjt9AI6o1os/tQdGiLYrcQMNiHMb6aytuD8hVt7AilognwpLXLO33FU+QTiuEDe3V1Ax0qMeD9T7zP6XuNzM/p4SWgtAgYZHaAGBULzFXnyLtX6t1JHYAWSHKSae1+BE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57gBxi9VNJZ7EwmD71Awej0P3awWzL7DoLq1JtJF94E=;
 b=mf1ML+3yTyKNGsJWfMS3Bu7h5TpF9pUvJbGVMnXq1ETJZUMb/LZZ2CD/GL5c+uIH0HvW8HOoHyl5oxWFa0pxTPUhJnEbs6ZvPQuk0f2zyox3kt+QskYkjpisww/ojxJ9ZsT9e/lrSts077OpSTrj7xDWMczwkIECQZd9szVxXgDvJTxFjJRypWO4GbWzEUmFOVjxuQybOZYHXBT0JaYAfg8OnHBv9uQFdh+pBtCHQ+ih0Zy4JG0cyuMaL+cKzKp4EPYuyAn/KEXwIiBFZsGEVvcrn6B/8n4xjuLw+zLUXM8oPxaoI4uMVvbJLbstJM+otuYOotbv+BNJMqldI7pqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com (2603:10b6:a03:320::8)
 by DS0PR02MB9547.namprd02.prod.outlook.com (2603:10b6:8:f5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:43:52 +0000
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::ef96:606b:562f:8913]) by SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::ef96:606b:562f:8913%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:43:52 +0000
From: Marco Liebel <mliebel@qti.qualcomm.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Use f-strings in python scripts
Thread-Topic: [PATCH] Use f-strings in python scripts
Thread-Index: AQHZVdDaHG50wHTFqECnkIxOIh+4zq76kDcAgAArToA=
Date: Tue, 14 Mar 2023 20:43:52 +0000
Message-ID: <SJ0PR02MB764793A1EFCBA546A5F083DF94BE9@SJ0PR02MB7647.namprd02.prod.outlook.com>
References: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
 <SN4PR0201MB88084D06E64FD6C029249202DEBE9@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB88084D06E64FD6C029249202DEBE9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR02MB7647:EE_|DS0PR02MB9547:EE_
x-ms-office365-filtering-correlation-id: 51d663c5-139d-4e0e-fc2c-08db24ccd279
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SgVmx8nzo5f5TmNFMwTItU5I7chLuIkskHIg8G9132LGMo5PDS5tb0CYbrqpNXXIi/CYd9yU30xygdBC/xlxZO1jgafGN5WHWPeJ0fz8gml6zklKLHlfwfptXy61joPrort03ovXjsdksdm3QrhfjmPvs84Ma8SdhSrrdq5WPWLG6+eTLGYlKWh075AkSKZY7hktp0Y4zPWxVVrUL7PILwNdiA0AtJZRSLHd2kMjupruP0a2rEcdfdHgwc7z7EU4YYA8xudTZ4bp68zxBMgtuJTKmxK2qRqe2IvVdpEV3S/GidJ3W5sMtQpyU/Tb5nWUqeoChB1hJDLyQWz+ONp4ruCzy36SOAvCihzhmtr39wR6U7/wITjLCRaQsOxImpYikdt0FC4VhbGIz1Ui8/n97u7bS07pAwRWoJl5OVM0kjU39MNBTiSeqwVlLrVfboeRzIb1tq/xV7CrkYePxa4sNszQDu46dO/EhMu8hyrpEZLheaO0B3Y0IyNjhJQQBygGzwbvPHHrCvdnFWTrscSJrCtF+i9aQY5aLt7pMFD1FW80fVKnd3h34BeVkhcdlB+OS/q2xSrKAI3s8jZd8DApclshBuOuPT3plK5UoJnSbZg73HdCsGAzmujy44WuE/5NPnX1NIpiHFwvagaXawsvANgsVIZCzotuxSvtk7l7526HHsU/RX+h0iRBWyIu2Swf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7647.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199018)(478600001)(83380400001)(2906002)(5660300002)(7696005)(8936002)(71200400001)(52536014)(110136005)(38100700002)(316002)(8676002)(64756008)(76116006)(86362001)(66556008)(122000001)(186003)(41300700001)(55016003)(66946007)(66476007)(66446008)(26005)(6506007)(53546011)(9686003)(33656002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lKRKxAnkH0CM0dtfhByllJTV0RscwLCovHVQL2iHyfJfsbCJmuR0Cc/JCg?=
 =?iso-8859-1?Q?QMbk/KpthAXUgA0Mjh3qYFaa7p2f+k5L9SzbVOg/FPixPE+w481aG1tg/M?=
 =?iso-8859-1?Q?UMD5gObgWroSs8EXjfLmAGGONd29WtkfRx4WwUUyd4of+RsJdqa2ZfsAn3?=
 =?iso-8859-1?Q?k7JYgoFdEsbzfazA+/aWkTCPQhMmAxHK38laqofAx2qy7GDqA1ag1umP72?=
 =?iso-8859-1?Q?IQfWWYwymq/tyV9TfKv6OlFksymFlwmWlKivrMiI69irqQALJf5RHwOJ7b?=
 =?iso-8859-1?Q?bt2shP1xeiuJUVavHgAav+b8Fzl4itL3wKa2U6gP7yPfygzeOPsZKiKZlv?=
 =?iso-8859-1?Q?sFGwBu7NZvY2DkrWC6cZEtsdcla8ZUdOEvX6FDlMMtSFbPPcIZAJQucyre?=
 =?iso-8859-1?Q?GxEjK9nfBV3ztKR3r1kDI/ZS6hs6P0Nxgybae9+JL9PUMYrSPAr55bxNFh?=
 =?iso-8859-1?Q?KTpBPPMz+DpIEqZO2zMmDjpHAjEFWflHpw15uN0bZE+Xy7CwDxRWjKKGgj?=
 =?iso-8859-1?Q?YBdrIkTX3BBKzJ5RQ90Rl8VsU44nEA3Sfwv+YXrAdf0vkZqEbu+Ib9Wfzy?=
 =?iso-8859-1?Q?t+sjINXxDn68OMwbc/5A7z3fofS4cH6M04UXqBkSw2wNhckS2l8q1yUQlU?=
 =?iso-8859-1?Q?x/Rv3Ytv3MsY/9n07ZGXxel4xFx+IfyTHDOC4RVgJzAKp4OiqfGdueQyEH?=
 =?iso-8859-1?Q?IPiwcrsbWvZ5+6lOkgPAnssJJS7xaI7x4gDqAPdWvHnOvwNZTRzT+USJL7?=
 =?iso-8859-1?Q?CMZTDyb/7XOxdEWAD4WeZ1Zf2W1ge9cY0GHryO71toSFaeJ4ZkSuYHAqmS?=
 =?iso-8859-1?Q?naa6UGm5RjaRrutMi2pwcxy+CGjhR9+BQfcUuyESIWnA5SWuydl7JI/sGH?=
 =?iso-8859-1?Q?i4qKne4J2xLdpc5/feVzg8f5bWMryZjL2bANBzBAPFgOnrw7oTFrGoerhQ?=
 =?iso-8859-1?Q?zvD3M9oKEV9G9A7zb7ncL09UiAwz5KAO3yR47C+NNVjZHGYtFECFYwRQ4f?=
 =?iso-8859-1?Q?9dPRAQBIjfhq4NIfTu0a3i5YzMBZX3DgpX9H6bPzn/TQx7Dx7AG7b0GArY?=
 =?iso-8859-1?Q?wPdjjNi0GgFiyJcXS/SqAPSTGfJFBVlNAwOtEZoDVJI2ynfcWtzqHqs0fg?=
 =?iso-8859-1?Q?e7mM/c8U1yzCuF34nqDY+3jJTZugZAPs7SeEfzbK6kylzhQcHg5NsgxPIj?=
 =?iso-8859-1?Q?t2DklzSta8U+q10MgmUN+0BwfveKi7hOTWIxVbZq5w3jjZWUIYDzF50/Hs?=
 =?iso-8859-1?Q?xCJLmVTwfzBmTFkNAz2hz9UREm5d0nn5/ecJgDajpLXKlQo1GX+yes64LE?=
 =?iso-8859-1?Q?rIOHqPAVCAaLUPugudw3g6RIxSxKexDXR4XezQX4UsKKAAczjJUno3sqZs?=
 =?iso-8859-1?Q?H9oZl1ZzifeBX//dVHsw1Zk+b1R6NgaX5ETG7b9KYgBk++rLrk6BUQ2FBp?=
 =?iso-8859-1?Q?YYdbdSt6iq8vxjUjqiMJCnmbOSTwACInRj0+tmcdbCPfLcUV8S5rYs2Y0a?=
 =?iso-8859-1?Q?+9RT+UMyWS9p8mFdJ4SM2eV+xlhsyTrtSwBhn1S794xkBL9nGRXBcC2NnV?=
 =?iso-8859-1?Q?TlIs0LJ57bml+lhFB+wz0mdyfOUX38xU/kW7QwTDDjiu5Oei+K0x/wktOK?=
 =?iso-8859-1?Q?gHOwXzC2d5XJQlrpXFrk6taewRcsAH3F41?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7mXhkNdlOfw0uUzeAgm9OLC8RQfytt4S4/9OwldfTmp9m98u/G9dGcbb351E4ZdsIHNiM+E7HQsCru52mcC+jnefx5K66f0mIFFq9J49MI7cVX9fa9KF0ixFbxMdE8x7+swv/xLJ5U1F76ducmKGaxUcj/nH7LZMUvkZiU9HEg1QOx6YsPs7K2qemMGNDxlMoXosloFz4+aqjHOOX4IVXly9Qly27BMwqjUshK0jYz1ZSvzNAKzMFZN/wH/rkbezEGE8FPTecTqUoZKRMUnzNkT1y0Y/tZLSWF6o1l8MvBTEkuq/NDy75Nz2m4E437lktOKHLdiUPSKlam+lOCUTC5Mn3M/0K7EKHzxeLgA7z82UkByn3IPraQ7pZPQcD7ALtMjbMtbUd0P5CV5PYX7RDhmcHSdtJi8oWVFnC3RipYG7GKFfcyZQ6ZFjk8e3eelPTnVtITTxy/MrzuaTeIz1ojgI8J5sHJKOk3gF5LYBofaDJ0cwnSZsasdcwFNNe5Kt2BnpIaA2bWceE2ZqTQHBzMQsimATzHGq4qHEMzDS6VIzKT27mPQHmhD/1Y8MSdjA3HtUjX8/4wq/su9cD3lWk1ajnqVlHH+HrkSjzVQslNeFBH+AtpqlKoJHmZjZdCMPYy9e5jJNwFx233G25SVE0siVdznqO6aq7tjzk5DAtl+d0h+TG5ZaQ1SWMShVIQqfpuYov4F69E0RwecnDFcYOMKwYHHAntFWUv85QTtxT4D5fKQSvyb4P+6VXTR+XuAcz/z7E+pK446417DDG+pcRA==
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7647.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d663c5-139d-4e0e-fc2c-08db24ccd279
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:43:52.6039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19Ac4OVT7+eyAoyXz4ZB4wXsML98n1vsUoH8JKQJl9KLVrfoi/iFzNuAhiyocUN8jrg/q0kxauKVy+9r3ytbjObriRx0uEXmABVAz/k8YI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9547
X-Proofpoint-ORIG-GUID: y0iR-X-rSYlVhRtOcQpjlqAUflVGNHA3
X-Proofpoint-GUID: y0iR-X-rSYlVhRtOcQpjlqAUflVGNHA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_13,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=810 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140167
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mliebel@qti.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
> From: Taylor Simpson <tsimpson@quicinc.com>
> Sent: Dienstag, 14. M=E4rz 2023 18:54
> To: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>; qemu-
> devel@nongnu.org
> Subject: RE: [PATCH] Use f-strings in python scripts
>=20
>=20
>=20
> > -----Original Message-----
> > From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> > Sent: Monday, March 13, 2023 11:26 AM
> > To: qemu-devel@nongnu.org
> > Cc: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> > <quic_mliebel@quicinc.com>
> > Subject: [PATCH] Use f-strings in python scripts
> >
> > Replace python 2 format string with f-strings
> >
> > Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> > ---
> >  target/hexagon/gen_helper_funcs.py      |  54 ++--
> >  target/hexagon/gen_helper_protos.py     |  10 +-
> >  target/hexagon/gen_idef_parser_funcs.py |   8 +-
> >  target/hexagon/gen_op_attribs.py        |   4 +-
> >  target/hexagon/gen_op_regs.py           |  10 +-
> >  target/hexagon/gen_opcodes_def.py       |   2 +-
> >  target/hexagon/gen_printinsn.py         |  14 +-
> >  target/hexagon/gen_shortcode.py         |   2 +-
> >  target/hexagon/gen_tcg_func_table.py    |   2 +-
> >  target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
> >  target/hexagon/hex_common.py            |   4 +-
> >  11 files changed, 198 insertions(+), 229 deletions(-)
>=20
> Tested-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
>=20
> Could you also create a patch to do the same thing to
> target/hexagon/gen_analyze_funcs.py?

Of course. I'll add it to this one and send v2 later.

Marco

>=20
> Thanks,
> Taylor
>=20


