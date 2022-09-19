Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03795BD4B3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:21:19 +0200 (CEST)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLOQ-0007hx-J0
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oaKke-0000PP-CV
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:40:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:41326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oaKkb-0003he-WF
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:40:11 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JFqATq013109
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 17:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=8JME6ELkZP0VhwvsM9oKpIrzjZ0Jv3dIBaPp4D9Mnc4=;
 b=MloO/iKXQgo36RlFiZcnl93nECLlX1hgd/ttqqW4EnnJ3l0zQfFTICReD8rKaNzUgiOl
 EJSI5TUJWOT7U7kYw57Ena2kRbvSQ26h0gPUoGr/H97k/N5sL1W3182ZWm6YyXbYXmCf
 fN4XbRhaxja14W6g/aXkLLk1WUy3alGw1BIeztiMTa+bCoSl3vl2j31WXaJftSLV6HK8
 W5mZmYA2w32pIfr1ogd1ag4ah/qHRw4Gy8ELTZ8/SyZQW0kEScSIwac9Xj/GVQO8W6np
 IfHrI1HzuDBCqPGvwGl0Z4Kcr1rzzBve+nycZ3OZxok83vzG371GBk/qyuyq9jcrc4ph lA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jn6b1wura-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 17:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCfZqeIzNz4EKgJX1UCzS+D3xCVxY5CgGmQ4HuC2fV1havSDINDMw83jJ4lyX/CU55RyA1Z1Cwl1CtQIyjPWFvxYrQvHS/fLWNta5V4DBMGM9lX9/XPfs780enFbeC3IyRWFYz++juu2qjGq2UxELmwnhl7vtje7DL7tNEnzg0pTAeK4k6iHIshxdayYAX7ToDoUrNK6WXoGF9uwzqg6Kf2TjN9taqesJPn0v3z3gYUH5VkjfHbb54KuxHEdAZGOUXtnHBK9LsxE0N/4pbBwhNvsYjK68/7Jr4i6waYCc53DsdxS+2aqn+C25IsJlYuDjTyh7P9WwOd7wiZ986giGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JME6ELkZP0VhwvsM9oKpIrzjZ0Jv3dIBaPp4D9Mnc4=;
 b=ZiiED725d/VsWws/BgEvlKv2YlqeiiC3px2D5OF345IwgZmsU+LJccx6L0VSIkEBipEekwoYXkqw+i9hv626RtxhHgeMcArXWVg+yyQlq4gPFCuguSkxha7kh4K2qT/h9PmXvp/QX5ANKdG54rQMfI8AHl/53+UZDgN8kC6gmEvJEsmH1/pbRFxa51+kxkfpDQoZ5AICKrSOH8U9ZCJHMZV/tdZooZfzfZ6uvtUKOQhoz5bCo4ehfdMLEC2V8zVG81nGlG4xdPy3S+uMsPhYKkyAabtL1MF+6wkBVws6sFVTWFS3I2IyJOXFeQ22SvAaf+mZY3Q+OX1LviceQbwOIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7277.namprd02.prod.outlook.com
 (2603:10b6:a03:296::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 17:39:59 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8d46:acaa:1470:62fe]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8d46:acaa:1470:62fe%7]) with mapi id 15.20.5632.019; Mon, 19 Sep 2022
 17:39:58 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH] Hexagon (tests/tcg/hexagon): add fmin/fmax tests for
 signed zero
Thread-Topic: [PATCH] Hexagon (tests/tcg/hexagon): add fmin/fmax tests for
 signed zero
Thread-Index: AQHYyd3ppeciR+DFL06OGb4kh85dX63nCaBw
Date: Mon, 19 Sep 2022 17:39:53 +0000
Message-ID: <SN4PR0201MB8808D12FD765DD1271DB9EC0DE4D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <1dca69ceb766924b7664b5b78ce930e3a9abe7dc.1663340756.git.quic_mathbern@quicinc.com>
In-Reply-To: <1dca69ceb766924b7664b5b78ce930e3a9abe7dc.1663340756.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB7277:EE_
x-ms-office365-filtering-correlation-id: 08333c43-81c3-44fb-3dab-08da9a65f8eb
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BJTIyi/I7iV1ywQYpd8zW2cY+BgyaQ9+RgENbiQ0VhGLXieVEGc7DYItizKpu7HLSYhLx2yCMhGdgnB+k5LE92t+cs6d2zxRx+UDPX/FWICWMD7pGPLCDLthORH/W1e7JkRozGt2g9IaPmLCVBDot3V2j4uB9lgjUS5lu1Qebc2HJn1PtJtYT2+vmennNv30SjKoy2X4ts5A8nSI7r1VJgB2gbfP0oPjHeyhq/ycYt3ABppRFMLyPqam9LbB9R/d6jI6xLNZLJxbC1x5OiOsXDVAaoV6RR8LMOzLJVzcTp0x8aARkHZTVSYtvcc9bxJkH9mPLooE4sm45pPIvGP9AL3qBr51JjxIaz3X7xQkRQ/kBERjE0CeHp1pWD9Pjbopv2AjAC5hgRy6eocA+0MDJ5NZe2AXfFm91TvFUPvqbAJu0mjkp9MB6NCRirmdS6ccKcgCx6QZb5QsCUNTdeYYQEbmKc3oiC4FzVqr+A9hxWl+YbAMRKWhGm/equSETc+m4VjL1Gi/dTYjBsRWDg/lrj2t3h8sXZ+sI28uq1fWYqyJiKwPHraXD7tCbpXhUUYW2ui2qN8dlkNztfSaOfInFfNXGLSZ9f+qa3HPEVLEShTPSEmjBnYHssUCpQR//uvBbGzx+rs7b6khwSo33dUbD99UWAzg0QxL4Pj1b+TX/lZh2/VEJIfaAAFYFFsdT0bSKEVlUSESRINmI3q5Jpepp3t1bScX6FrbH6yyquMrhmWJQR5lZXXCpAm1z5YnEoLSaQM7xWj4eD1JRh912iwtBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(86362001)(33656002)(55016003)(110136005)(71200400001)(38070700005)(316002)(122000001)(38100700002)(107886003)(8676002)(6506007)(7696005)(53546011)(478600001)(9686003)(6666004)(26005)(66556008)(41300700001)(76116006)(66476007)(66446008)(64756008)(4326008)(66946007)(8936002)(52536014)(2906002)(83380400001)(186003)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IafzVo0KgC0xrO7/68aYqgCI3VEcPX+Olna2X+qYgy8HY3phkSgaDZqXReUL?=
 =?us-ascii?Q?BffErQmlcUPMkVcwlnIPJyXEZyvVKytO12ip5XZl7eMYE7yD/GEOphthEutI?=
 =?us-ascii?Q?LqMC0Y8ncjGUTMxF3GfzOB17RhctScZAVMp2zZvelmm3fA5OjbNfErFmSXLZ?=
 =?us-ascii?Q?81fHK006dsP+4pF7B2CPBKP4IpyqvWq6YandlJnV9088tVRmDFgw06q7mhh5?=
 =?us-ascii?Q?t3CouRShtE1tIiaQdUfjlcA8amoP+yZK0XWhI+J/hnGSTeNieN6zCP290piN?=
 =?us-ascii?Q?t3IXt63ck2C5gMH8MkHJqLkg0akHBGlXZHahMOWlVB/AF9vQd75BYFJs77QY?=
 =?us-ascii?Q?XDbxRNErJ26kOx4iBrL/XMUj4x2OIpG9Lw6ClA7iOG8FV6B3aZRRSviLWuB4?=
 =?us-ascii?Q?2ZrW2C1hyCTB9eEnxJ5DWQbYh6NV2Wfwyzn0vHMx1wvW+AxdFzK/fMSmfs2x?=
 =?us-ascii?Q?Fw8evoLrmH/T63qQ5QxYA89IWWlley8LBTAJEZezfohBhurBQmThmIR0xUCe?=
 =?us-ascii?Q?RiKsQcKSUHSk6Ha8TFC+Pdt7pAI/arK/Z+F/szo4Jxm+wjpOfyeS/QejXk8t?=
 =?us-ascii?Q?oZA8JRQV7TFL/jSXSO0OJ/ehoJMvnft99kFFBZwblMxmbZg+I3MhLN13AYRA?=
 =?us-ascii?Q?SJLKhnkO7QDEf4gvZIHqctgUPj1D2Oo6ztgwldKux+d70B/IuFsbvC1xEXSB?=
 =?us-ascii?Q?COjIo89AGCv3P5T7hj3hiwgYCeI/D9tpPmkMuKvycacVF3yeF//cg5N7aBOx?=
 =?us-ascii?Q?AzTkijU9lS+ml/Va81Y/gnFD7mpqdUtRyk0Eu05HiK/QcZ1K+PIz+DSpwras?=
 =?us-ascii?Q?4pojAffhSNN/K/BXeldLzlH5NodC57RtRBlFjI4+ZpTajCiX05DGyr8dwN/b?=
 =?us-ascii?Q?TIEaFp2OckMvMSyGNSzFt5xzy4ZdZXp1CXdhDWYmIwd+jvNUcZ3UiiUFxkTW?=
 =?us-ascii?Q?u4baWhNLESANQPpZzqfoagvmy3MEiT2sgEUmajO9TBNNXgbKPBGg+k23ubip?=
 =?us-ascii?Q?r6mJ1GFp8XIf02wHpGoZ2GLdQajphpHCPbY1m6t4w2uF6iWdguWnCYsK6G9f?=
 =?us-ascii?Q?LVyG8RnbwjkXd7bIRORF7jzUVj48IypyMNTLd4iQm/noIbEVuD+JTFlUqNqF?=
 =?us-ascii?Q?lwu8R8DEZKH/eq0Jl9CzvREHXgPmDEgc/5vv84uHc+YHe8hiYs6/bGo/Oexj?=
 =?us-ascii?Q?JpBzHB8lofhyATrrbMtpiL6iLFOB7SKpkllQk6lT3swtxs2TK+rzAQRThLha?=
 =?us-ascii?Q?Br1MulmngO++eptChd6sR7XUDgyqGbOrDaH18zrkY7y45Z6ZBt5Egqev3G9R?=
 =?us-ascii?Q?gEnAtctRDLU0rkDwezwMlItI8xGN8xcwY7P8enXVELgFmp81tDYTmER9vJlN?=
 =?us-ascii?Q?EBdgvXw66+Jlm7OrcCOd6VWk+g+GxhGb83q6kDRMh9mF406Y4DLNrDcAciA1?=
 =?us-ascii?Q?qBEO/iHfdKTyAFscXt4T3c+8lZWUhdzNJHQawUL6bHSdHrkyptq2eO9Vhq3O?=
 =?us-ascii?Q?FlPgnM7eM3qmi6DcqiZyIHX6PgI+j80oaVQFCQK2+xT236s4sRmM6nQOm2ix?=
 =?us-ascii?Q?xQTC2hhzqbQnkUo0+e2z4f43WZskpkDEIpne9NpB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08333c43-81c3-44fb-3dab-08da9a65f8eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 17:39:58.4262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cq7Q2REol2FXj1+FWvT4VHIwntVoZgS7kijawe3x6Kc7jaRe9Rg//sFOMl40OzhrzSF9bQ+6tolipKDYgF3NCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7277
X-Proofpoint-GUID: WAmcUwmQz32FIEe6hqJF3Nfd7mX65CjQ
X-Proofpoint-ORIG-GUID: WAmcUwmQz32FIEe6hqJF3Nfd7mX65CjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=582 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209190118
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Friday, September 16, 2022 10:06 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>
> Subject: [PATCH] Hexagon (tests/tcg/hexagon): add fmin/fmax tests for
> signed zero
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  tests/tcg/hexagon/usr.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>


