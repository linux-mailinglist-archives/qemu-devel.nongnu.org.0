Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE076FCE8B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:29:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwT0k-0004Fe-2e; Tue, 09 May 2023 15:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwT0i-0004FV-Gv
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:28:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwT0g-0000bY-Im
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:28:32 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349GgCqW027583
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 19:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=KPwLOBKl9Qss8G833TlvvKvcKGdN0NDRwylCVB82ikk=;
 b=UQYQ8s4qEvw6EtKaou6+7+rYo8UJ1XgKyIGP7b1iOu8WHJC86JNKkJ7pR/xIxhgHh/Y8
 BFNTmSL30B8fTRBeUpRSrf2cJ/+cqvjWRCENDMVJCoJF98xHQffiVYpR71FnRaEF7hgX
 tItwtrHd78s0gnJ2fdNZp8ykxt0klMA3PzMZsCswV/rqZB89w8MGnKKYrZEbnv+3Oafg
 EqsC4tX+gCmoDghh7vDUtEmBg3q5UiGmyxTvVr05ODQgpz1wy0Yn5nIa9qK6+//VHSsj
 bhOkvjBq/qv++zYpthF6u9sko5iQQielh+SRXCbLrFq5CG2AigVLB4BaOR51exSfGkur Iw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77f2q66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 19:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFxaLQba0B9RwtcEK9AOGoTaqnIubPXhHg8fZ9WUY1Sh9bXEN3Mq4TGR6QkmcnN9dErGU3TPzhlOSpIHTKCe5cuKD0OLIiFb3SyePwJ+VZNhghPrKLQyMof1JhjTuFpeCkkEtCS9n2eIygyaNRp8fs5xVhmbQQ7eNE3w5UFmon2mM/fAjAG5b1MKKHv7HvZIdNi87MNc7t7rl0EQeLC7Cru45JgUIzN+nhDXQKzSqm1VuB84pis/wGT3s6nR3VfZfKfj53o9dvmvKUs/28IuXY/9O/0FveMAKn/+F0iDAGIr1VdtjCoI2ldNt3x+69IGFj/oHzWPmIYag+E48nvUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPwLOBKl9Qss8G833TlvvKvcKGdN0NDRwylCVB82ikk=;
 b=hi+lD1nn+XcytKTpQ6yFJ+nOQku6A4xZNX/b+Cu281zhhB53vq5QRRVkminjiJKXGt+PhvBTeAmZh1Gme/MsrHadU8GACUVyV3AdoLWUqxJzU8wAyuNVUx6Opog63fCWM1tA0/dCkXZvlKP1Am4GaAPqrnMwsBXlmprbWSUMmrZRkvb3wzKsPbHHlXlZjtsugoOQ5gV+LaoVx++bEa3TCJH756TFtck6IHsagnXGxc4IuJEoGWEhbuSl27uQV49z0GWD70mnVKuGULFBuR9u4AvnufAu1GN80lnxVOYUwpIqk//5wWnSGIMLtfB/qHXhwwk9wU/2J0vpZeZdwVbtZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM8PR02MB7863.namprd02.prod.outlook.com
 (2603:10b6:8:22::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 19:28:24 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 19:28:24 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Topic: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Index: AQHZgqYRveCUq/4llku/sxuerSm3vq9SU1tQ
Date: Tue, 9 May 2023 19:28:24 +0000
Message-ID: <SN4PR0201MB8808DC3221D2D5FC8F6530C2DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230509184231.2467626-1-quic_mliebel@quicinc.com>
In-Reply-To: <20230509184231.2467626-1-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM8PR02MB7863:EE_
x-ms-office365-filtering-correlation-id: 26527c77-9efe-4a18-363f-08db50c38ec8
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h4cjidKRaSQ18F9RxPE5Yy/YWUWSk7vtayddwMXtyMwimA3VKPtpjqaGHcoSR7CStTL7sxp5/SCxa5hDyHq0tpwg9qFp697+EpktI2FLPsLyFboec7X1MS6F7ciMQveEeBtViMesBw4tn3CntXjK8rye+vCGE4zzI5BrJ1FfQBUKKhEsIiPDaprL/4zJgCWHAVStRVi3ySImGavIn1ZRlfuQ8C3PykIMj6tRN3Az4CH8H7PAxKaNKklrKDpdkggyeip/OewfWEMpZE8On/h0DyUByM8KxtvBnAMsM7zFfQXeLSaLmLzI4mukCjLeSR9DE80hpg/tgnfOHU43FuXuh101B7QRi7AgZRebj7svn7c+/zU7AyeJb6ObqOQ69ZzQ1+wnKfsfQynkiAeWMH3a3XR4fzP9tmBJsFxMlfe6Mrr1zz3sAEBYo5X9l6+j3TCw2wzykdMOSW2WvBCRCFcq1B6Fa5ndsNXSuwdOFOS7j4fmnzX7P739BIduQzKdHRZdxZ8mQNEHnQAnAyIspjM1FirzqMnIW/TaSkGpdojuhmp/IV+d+gbUGPFoIZeOr5Z3MipyKjeAa6Dhvj95JGfBsOb5+LoPuT/oX6CqfIGlXk8bYEwUdR55UeJHZXtsQp7q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(26005)(9686003)(53546011)(6506007)(107886003)(7696005)(55016003)(38100700002)(33656002)(122000001)(86362001)(38070700005)(186003)(83380400001)(110136005)(41300700001)(54906003)(4326008)(2906002)(4744005)(64756008)(5660300002)(66556008)(8676002)(66476007)(66446008)(478600001)(8936002)(316002)(52536014)(76116006)(66946007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z4INN62j+clMs8ToEi6KjwSb4op9UVL0QsKvqHUYRZAjYQGMvlwKiU6dQ6hi?=
 =?us-ascii?Q?w8fu91VdhinhI2Tzw92CC8QuDfnm1mH6e5ugpKcaGvgJ6ojLQkxZYfzLmaEC?=
 =?us-ascii?Q?rI4Ripw7uQQE926w5MxbEsw2BxXPjgH5GMhkfWD2a3ot7aciCD3hkudLrvwJ?=
 =?us-ascii?Q?/uXWCgpmxhmpQZh3tu1lRNeBl7n2k30j3lE1GnIBgpKrSjgGuJ4jIX4vmF5r?=
 =?us-ascii?Q?OtxTjE+OfPRNw55iENXmbIxfbZCgA11lgx7otV4mBWIf5mOd2rOdFJo0BxEY?=
 =?us-ascii?Q?qV+cjtksLaLUFDJv6YX9Wi5D2N9aK4LYh8sFP8GdwlyvC2KbHdG0DiTgVfMW?=
 =?us-ascii?Q?XLdd4ecsvQKuCdE2P77UM80R9HYsIRB8Hrt1Xa7c5kmIj4FCCyPBaa96WGhN?=
 =?us-ascii?Q?2fPOkdmdPVWlbZxWqOxJA3L3fIyrH2etjsltz0uxORvxUlGjSYRHnfncjLeE?=
 =?us-ascii?Q?4hZdA846V5SlZIo7pHblFJp+d98pur4dteX7YvH5Vn6GJNh5ncHFAFba/xaq?=
 =?us-ascii?Q?JgEDXh+z0luSTCATGqk8T4cqT2VfjnFYwFhlqW7tQLcErESl06L0tNZalb8q?=
 =?us-ascii?Q?GH9qwB1GlfOZxjKlftqQmPJz6zPmZMRHwuJsG855Dm4XyRHeJhcIZqLhqN79?=
 =?us-ascii?Q?YFGH5bVYlGPds6Is7bUWqpXt2Hqt6PsKhXnW0MTrLZWcoaOK9KIg2jk2mFnk?=
 =?us-ascii?Q?xiglp87Mb95jW+0DYXgt+J1U2bRKmMzIl41tYfej7UlvgxaRgfrfIMZc1Yyo?=
 =?us-ascii?Q?Ap7gAGKOODd9Kp3VpfTgiOnZjRBK3Ulc3v05UPYU75bH94t/HOLheo7VMPZQ?=
 =?us-ascii?Q?eCTriTSMyf3bXmmIsrXyaesrXKTV67+HxeaC2LmkB1v+d8EXxD9JZVBnWyqk?=
 =?us-ascii?Q?i29EKhW/2TNnOKfqZzCHcNpzy9N6oMbyO1tiHtFB3Izpr/pzmC+FeSOorU5B?=
 =?us-ascii?Q?ZiUobidVwBPN2848VS4Q4YzGzruuEC1hEuoQmQ5ox4XRUx0Np+HZt32rt6hV?=
 =?us-ascii?Q?bXgQnTQjupXMGEduOVXYiXNdgp1bEqsdTggZJXlejWnfFcU2h89DliHgeX61?=
 =?us-ascii?Q?YYVd25yQRDh8QU4+/R0EkYzgsgsqOn0ToEqIAsrOimojM1M8MoKJc8/zE3N5?=
 =?us-ascii?Q?MiPHBOTd+cDUcRwZhWRqt0Xd4BIJwAtS0cFALTAOj9cPbBgLsCC53vGnYZRV?=
 =?us-ascii?Q?LZmxiOUmLvY5SSHYcbsgLCFVztwenuxB7GBLn68VZXSg+kBm2GWQ+awMQ1Ue?=
 =?us-ascii?Q?QCPeAGf6ka09uwhkN2YCGhkRC0nULuyj+eQph4LFE5r4SkWLH9gherSD2w1c?=
 =?us-ascii?Q?y+ci0AQoFU7O796vcuVEf2+sXCXQ4adelZeO2WoAfNjMcziOzBf8SGQsHx8j?=
 =?us-ascii?Q?8ZK5d/+h8DXNUy7qKCeRFkf5QbkJTL21DQVFgj67bTAIrNQys1QvshSXyXsI?=
 =?us-ascii?Q?r+yu7XUcmvhecmFA3bDhPRCmRtG2u54RIjI21PQvr46IRI4zc9PK9HbUnyXz?=
 =?us-ascii?Q?KNKNYoIqI3i2bTLd8w1BrHCE/s8eGQAK0SwT6jWFO5V5S5sjd8XkX7w6iNhM?=
 =?us-ascii?Q?szNaCF84+yDBZDQ9hnhwxHw0tBo1wThtxqgjXIW4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3k5cYO19XYqoPXnuR9BbD1V1c2njkOyH6vwPEZNEobqDGeM/FAyjhfb90s9YqWD8/tObxLUYE2Y29jW2VLAW8Vd3TMeL/8IUzdsO3y3ar+h4/1xFmeu370JLpmLxQ4CMI2fl+1WYD9VvjlbLp1ZKxE7Cztnl7wrUokIFJXGWEGUNai+VFeGzYBUnudm0VJQH1d3JVOdLFrY/FsmnTPFX9VUwKgC0j2iK062fOTKEu49DoKDYy1dEx0RcxgrGtYV6i4zoygvqenx5nShNOiD5ZpHMIXR1eOKjXSCGcDzguDEszpceVCP1u9452AcKTMu+XuXLVxz7TYd54t95I+n0Asxv8SF+JKhfNf72J6PV711YXjRJxR//xiWUfW1ozOTc1/J03hkMJv3BAzjmo1XQrpuqZAqCoiDwESJh8/C86EWGHpAek/GWH+XoukgkOL7JgVdOZWORrp51jcrZqHoCrIN9KMpY14JpJV6yQkvE4qwQKCdcMHDggMVHI05Mjb/tk7FrrsKLoAl3XGTMppuahBVrF6ZSN2q5pHwM5AVqiFHkw22rKPDdoTMi/pAKLN6o7t87RTeKU5RyNlT/YrlmWPCTvJD2aq6iT+an3VgAUJNVzTvAGA45vgMfBooHidQt+pmUdIybcaMvlc264oY8Rco4MPy0toTMd8GRP/4POfM5bip7HC/lcmtNryvLyVc0dK+fdSdXNgLrmdR5AzVKg3N/cMDMildBEnipKSwjwmL1Ip83/+jQJh7nGT5IzSgi3h4j445JBMymUgo4jQ7/xg==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26527c77-9efe-4a18-363f-08db50c38ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 19:28:24.7382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nwBl6hKhQhZlslF8iMaeaI+E5dPZxH3Ho/+zWqCygP0Yoei0F9rgNHOn4TpYIhMpeqRUkDQnGg3FXqMTkkb2cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7863
X-Proofpoint-ORIG-GUID: b7qTe1qb-HtKXN1EPzGOJdKs09BbVF0A
X-Proofpoint-GUID: b7qTe1qb-HtKXN1EPzGOJdKs09BbVF0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=596 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090161
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Sent: Tuesday, May 9, 2023 1:43 PM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> <quic_mathbern@quicinc.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>
> Subject: [PATCH] Remove test_vshuff from hvx_misc tests
>=20
> test_vshuff checks that the vshuff instruction works correctly when both
> vector registers are the same. Using vshuff in this way is undefined and =
will
> be rejected by the compiler in a future version of the toolchain.
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  tests/tcg/hexagon/hvx_misc.c | 45 ------------------------------------
>  1 file changed, 45 deletions(-)

Let's not remove the test completely.  Just change it to use different regi=
sters.

Thanks,
Taylor


