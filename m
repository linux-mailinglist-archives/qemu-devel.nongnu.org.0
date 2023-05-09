Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A756FCE57
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:13:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSlA-0002td-9I; Tue, 09 May 2023 15:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwSl8-0002tB-81
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:12:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwSl6-0005UE-DN
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:12:25 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349HLXP1022160; Tue, 9 May 2023 19:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=sS1jMJmBjhNY4BoP6dZc2aY+kGNJqcIbXHFM6eKysvE=;
 b=JZq9wNOMp++lKRDR0M7SE9Q+BQSwVB6xcIW1ur6KIUo6TuSVsnB/H8XAt2YYuy1h3Abg
 4PwWuhkqgc82BYXUQ0alqIJLxGjmMbc5WKOHoWw+kWJcj+Ylz5MeIsE5fttwA4M0p0t5
 ZUK1mONLC+RMZIpZRNbYba2PMfQIMqMH3bRl5pRTdJSUjh4D2AA5qh9SqEL+XsmRJt35
 2YiEUGSL/RWlv+3DgJH2NHn9IMkAzAANKFzSLEhSEtGFv+1k6vuo1gNOg7gUbRJVfs0P
 ueEn0VS7U9sxs0becIDtdt2xHvxspx891GeWugTQmbbvzqSJy7NylOtiYBDUKyB4fZ+d 4w== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf7862p23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 19:12:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Doc+hJawh0iWTcc8N55hq5/Im6RrepF2jktj7R6UEoBW/b3GmkaYVtdvkAB+Z0aWowDvX/VvSdIC5KDt1+xL6d34b7LKSrqgDnv3p2KpR+3EKnLbxqrvm8/iK14++tb+rVBysAPoO62FyjQEVECs6XqrG1komLBJ4wYn20CBfhciGaxVO7/whNTW4xVMegLuESwlb2ZqgxwKf8UhgwnltPvf8MBUo6sjZBg2S7LClzojljYB/bcfzLMsP9II5Her3k1LxG6Xw3QG/QIzKjah3B1e+67fEQqSjoH87Jy6Q2MzMI0bIpfzIShqGUyRS50elNRjDtW/tMh+lA6Nex5fjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS1jMJmBjhNY4BoP6dZc2aY+kGNJqcIbXHFM6eKysvE=;
 b=nhIwkc9xjr6K/F1u8fZ9yBbiaTnkstFALQqg98ebn4fksZNl+Fr5KffYJwloToKzgzO4YGf57ZG36eylozHKPdyaN+6PD8y7CbUdrlbKaZQ553S82Azw3DjT03Ext7xfGg9ncPtvzf0pAy0eYvXx6qWDC4jh+G2QC38BZ0YPrpd35vy5N5mkoBuEYw0ptLqKEuYWtnE3CF6urh43hMMiPU8R6k9OBRIHwi/ywH3lgV8fEpZp/XOWXz71jYOpgE62+HSJ/Qat6+4QrUF8Dbe0pyRlkQ7knK0yFm8k+MPyq85Itqnd3XNsoUGzZMCQfixdIfzY5oduM0A5IzuAAmHADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by IA1PR02MB8897.namprd02.prod.outlook.com
 (2603:10b6:208:38b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 19:12:14 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 19:12:14 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, Brian Cain
 <bcain@quicinc.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "philmd@linaro.org"
 <philmd@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Subject: RE: [PATCH v3 3/6] Hexagon: add core gdbstub xml data for LLDB
Thread-Topic: [PATCH v3 3/6] Hexagon: add core gdbstub xml data for LLDB
Thread-Index: AQHZfp5eAfyJ48/Pe0K9jMSmx97LMa9SVt2Q
Date: Tue, 9 May 2023 19:12:13 +0000
Message-ID: <SN4PR0201MB8808255DE0E0DA4228B22B48DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1683214375.git.quic_mathbern@quicinc.com>
 <d25a3a79334d81f0e1ecfb438b6ee82585d02dc4.1683214375.git.quic_mathbern@quicinc.com>
In-Reply-To: <d25a3a79334d81f0e1ecfb438b6ee82585d02dc4.1683214375.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|IA1PR02MB8897:EE_
x-ms-office365-filtering-correlation-id: 99690b6d-57eb-46aa-f4c4-08db50c14c03
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ageRPOgRAY9BJOPFWjwjBuNkZVp951BB0iRAuSGCtAotn+WFKtDk4iYM/vkU7T7aB+g7JcOALqlt3CnGCuqNfJbGJROi7qkMl4ttwwUXnGJLJg/jNzeljDVpG3MM9W7qQRF0WHySQCrfJv7S6sXY06i2ea/tUxZU+Yovs+H0TZfa/WeYe0HR0iZGHfjHaQajpTGUoQ5OHA7O7fe9UfzuaDvvVN5+fja6Tvubv2DhNtsgEjosoLUQOiMVKpmVFui6QFOuh99RjknzYezZLVVRlcVJzXubvfEuZMhGUTcTDqg2jdlcw1TvXJ+QqMQbIa8IfESNJ6C/Lf9vYpKGVhFcPU3yMQdFb3alwKGQLlCIUQ2HfykmH+vNdDmemUtkdluVl2dchRcuaD9rhYVs3wc/di4lIc5lNPxKq5dvC4AqfNRHW+3SZvCp0qgcu7vNVqZYqhwau48yyZKZMvM/CMnb22HSnUE6tIYvYZZg+EJUPeHJLVtqB09T09FyD5LTHUVg6EXPls25w81AcPZa8rd/kbuwupxxwWaOhFJ8TW/QNyQwIA/APXHOWIIGH3mE0fWh/t1+SPp3KhMaFsXnwMa3M9Za5UmKPRiJSqE5ZUrQMp/GpUulN5+AxiiE8RiNGx6p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(86362001)(66446008)(33656002)(64756008)(316002)(54906003)(4326008)(76116006)(478600001)(66556008)(66946007)(66476007)(7696005)(110136005)(55016003)(5660300002)(8936002)(52536014)(4744005)(8676002)(41300700001)(2906002)(71200400001)(38070700005)(122000001)(186003)(38100700002)(53546011)(26005)(6506007)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7R9V8V62kbOyIhTMd0NJenBBwwhMNfifp09R/EbQ/IkCNrpOjiVZk1CReJ+B?=
 =?us-ascii?Q?+aTg2Z+t+czTWjeuGzBcKvq37T+btESCEgXTgyJ9kdsEh1r8lwy+u/sae+UE?=
 =?us-ascii?Q?LRVXut3YLRYgSIu8+tstZm4nRqe7dJUxMGgNIPvM4K01N5nkwssHPbSuE18U?=
 =?us-ascii?Q?R0ZgTehhc6ztQP6rlfO7YlkTnsdUcVYrdpfAu9OAOqdKkFdANfqANfCp3ZzA?=
 =?us-ascii?Q?grwdFsZah5BIHJoB/hpn6lASqVqlvu7WDTp+r9y+nW8zDF0GElwkhJ0T18Ty?=
 =?us-ascii?Q?F4nb1dHOtttapFTZvrof47EeRfKDx6w1nyqTfK/YVJtg02QqiEudoU4kdQUj?=
 =?us-ascii?Q?MRp9ZjL8UrWuCf1FfAYYcivswyBRUxIse388lLMNNihtL6N2EmJ/7WXo5YM+?=
 =?us-ascii?Q?3whwdblLiLMNCehXMAFKE81Sim7oA9uhM7tRnyUqmbwgYIysqH2RmJUAYdmw?=
 =?us-ascii?Q?hCm62UtnUY/oNiTUnsSYB1el7rC3zFGhktt2RkHVih5X02ACgcEdlrfMk63+?=
 =?us-ascii?Q?eII2FYp/z8Ni+XUJ05gcXunChZTL7NkFAmVxOjVInWmsWtvkJDXUp/J13sk2?=
 =?us-ascii?Q?9NlWiYY1zm1LvuDPg271IbtzGyqhmssJ4o6b2uTJOgm48JBO+7vlICea3RZY?=
 =?us-ascii?Q?tR3/ztoxousmJ2NIet4apHq4HHnLtHwvAB9wKM9PnC4I/Aa//fmuI0kFbMxL?=
 =?us-ascii?Q?Pxxa7uz8Q7OPfs6ISSH/zomHQG7//CfkJIm0eunN5bYsBJ86Yo9j/hQARyYb?=
 =?us-ascii?Q?rb8caf6j6RSbp3+JLHslKeL5Y8Ukcpsv3yK+8utz/I8jdSTwOv1PWzzUmUrX?=
 =?us-ascii?Q?kYUonQ+JzNqM4LXoS7+xBMacXJLpEoLa0hy7CZPUkYXkg5Z0p6HqZCrOtzQX?=
 =?us-ascii?Q?3S7XvR1WrV/h8hqwUDRznfDN87XrViSPI5Nr9/+hjFHhZnR6NF0tqDuPIMsv?=
 =?us-ascii?Q?73IaRTq8lcRUtWEIAguNkZuF/rxA2WnPC2L5SOrhC1kNQ/ERWuWO63K8a6uJ?=
 =?us-ascii?Q?F2LxG5JdZVMXPEevPeLa4FtdgUrc12c+ZX2lNEMRuIx+IN2zyExYA7Cu0zVp?=
 =?us-ascii?Q?zL9pjRfmkb+/hGOdXmgU/nIGXjtZF3O0NLEx2GRxanyfvZJxw0BxkoIrH4OB?=
 =?us-ascii?Q?+/Jm0slwsuub9fsTRc9lCufBbLug2K/nZF4fYhkLZntdtQdlqljKyyfa4aX5?=
 =?us-ascii?Q?z64ejAlQ9g6wY+ps3soDnAdoW8YRCjY8jnOYo7syslfz/zNYNAEa48SiMZTY?=
 =?us-ascii?Q?V1M3uUKfcqgV0hJ8ds7dOE6sFeXNfqzrAzYgQxZWXkaZ4wwS4Zxcsa85W67I?=
 =?us-ascii?Q?8w+MtvIf9lxW2FHNn04nQXAr6LXuIB7nEDdmBjQYoeYfgVQEFmxsbzkIyaww?=
 =?us-ascii?Q?Ecd5DW6QBGKp/5obL1u2P4cS1Re4wGIU9k/VyyART+lXrhtd5pcK3dG/R9Ev?=
 =?us-ascii?Q?q0jNKKGPoB1RBl3uMjJGBPTt2TYnKYi7U87aV/7RUs+sufrlCmcq4wga6px5?=
 =?us-ascii?Q?bT3aGmXXFhJ2oRX07wWvmXYXYQ+8v+9KcER2jbiSMf9KfVPUjvSyz4BUVgdv?=
 =?us-ascii?Q?pyWUUXAMDhSXL0dDXhgkJETX3veBJqanDYTqScUP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ly03fWTZyBzG0MdTrf2g6sYt5hMQCu4X/vGaYowM6Z+OQRzUp1xImswbRhbYQ+mi3ztHiTJeAqinUFBo2sjLsmuxJzmISvzD33LXhq0fGk1zEv87hZtWMnXANuqLqQVNTDBTN5I8H9U6WvcGtWWcMvm4i7AXsTqmUDDvsKtU0CRgQF+195NDiSFhfdpUibSToJ5mzowaKgMDgpqQtymvU716PxudR6jgO/LeVVus2CHU/H0HL6j2dFG5QQaEyFTFtdWERFK/zNxyq1H3WPK6msofA6wqjvtq58ntr8HpsW0wc4TECHhRpuLy2jEtWspZdnlRU3+6k/Hq7PLbjUpLGi8pk8m9ttldGUUEgBr9tcwCxgqws4xTPlY9rqmIsptb1YuH9mGj2CAgV7CtS64TJ4rEbv6qTj3IUIllTc6p8713zikunHlsxsCKlwCiP1QuWOY3BMQE2p/vTGX2jtawIjAFukO9l66JjGtOqp0aqJ+eEoEqWY5Q7UEwFYqH/kZmThZUiSSDFu22Sz0zHKuaUn8pxjQuqRxkyhe6LCLAky1TS2qcsRjlP3vdgruAraXXw7Gut7E71+P32qm1ECLS7k2cqIww7sx+f8MPXGMQf0hKe1yXzsEDO//PLNWteQR6kzPTFYS6b8D0iUaHAhEkuTXaJwlt5EQ3Jya4N6f/3g2yPWuorgixo6KOrkaFW31rDUoSZLixdmQ0xrIG33Qd4RJ+dEK5/t53NWFn+cMwtko5FMOyZfQmjTqXa0pEFONnfmHiwcwnxxYBWt9O4Z8j4xHr+cY9HqGl8ojmSwesBpiU0DaDHG/J4qbjYqaT63yDyIGP55iwg6rqtkxKc7tpBsQFR4ev9K0Z/AiVyn04Wck=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99690b6d-57eb-46aa-f4c4-08db50c14c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 19:12:13.7013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I27355cjpGdPFJgu80mBG15f++YWBAW42t4CoUrQLFrcfejuP89mlv1iqRWfn53azp4Sr2uF1MO/U0cSdK16Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB8897
X-Proofpoint-GUID: 61_dyT0gb-MExpCQuM7WIcaVkGSfHRUk
X-Proofpoint-ORIG-GUID: 61_dyT0gb-MExpCQuM7WIcaVkGSfHRUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=486 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090159
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Thursday, May 4, 2023 10:38 AM
> To: qemu-devel@nongnu.org
> Cc: alex.bennee@linaro.org; Brian Cain <bcain@quicinc.com>;
> f4bug@amsat.org; peter.maydell@linaro.org; Taylor Simpson
> <tsimpson@quicinc.com>; philmd@linaro.org;
> richard.henderson@linaro.org; Laurent Vivier <laurent@vivier.eu>
> Subject: [PATCH v3 3/6] Hexagon: add core gdbstub xml data for LLDB
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  MAINTAINERS                            |  1 +
>  configs/targets/hexagon-linux-user.mak |  1 +
>  target/hexagon/cpu.c                   |  3 +-
>  gdb-xml/hexagon-core.xml               | 84 ++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 1 deletion(-)  create mode 100644 gdb=
-
> xml/hexagon-core.xml

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

