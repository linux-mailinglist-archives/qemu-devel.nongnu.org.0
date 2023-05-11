Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345846FF607
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:32:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8HM-0006sE-9i; Thu, 11 May 2023 11:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1px8HK-0006s4-83
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:32:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1px8HI-0007ui-Am
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:32:26 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BENkOB010306; Thu, 11 May 2023 15:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=K0oNtRiUv1PzicI6Tidx8LhMc6U74JL+4KfVC+gN58g=;
 b=RZjmoIHU3UuD5+L3BLcZghBFj2bcwolc7xvROTdLGGOtwYXupS9xuGLkMQDTKJZMcwIy
 vSGh8R90vdVoCoa7UJIgtywnsySEmfY+FxDlbaUxtHrIlEMBcVo0vqeecuhzjCQevWzp
 C06NeLEBEH02OQBjQ/rFKe0nUtPHfCrIUPXIyS8UjbCuCNCb71nWXCXH2BTM3kr0YBr7
 CtCrp3QTb3lF1sQnsu0RzjBT1ZlZs1s9XLS936ZqL00Wg4o3Wr877o1AuE0PXTsVVDM9
 yAzRuYTGILSgQ0sf32UrgOvG/WHtK04ZaMNu9vLKNynnCf1E5654+JzjcNzj9ABY+ZV1 dA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgm5m22g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 15:32:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOiiFZM+76Ouq0hzk1dgSNWPtmtNGX6iOD85SbWWoCnAnGt5E+ElvwM2WM8uNRUKagzcEhNU6iF6HLySbxOsmGXk+HuOAbRiB8B6EAudZs1JNPrXFcgkx1KLG7Rwbi5WwG6d5qtvFmbZefSTH0zTeHGAH2F76h/99q9khpqkIaUejkf/tpQEUdlo4jDfo72h9fYkFH9+shkFx58oFhCLnKJ9fFPgHTJAk6ubPLydptQWuVNlOO6BLSjzSVGXAs9NUs4vE5kRv20GyA2+Q4H4zOdtCPsZanACTOueWaQpf4CNxQrU2aO8cKh4v4iX0L8puhhd7R8UHKco0qPwfpWQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0oNtRiUv1PzicI6Tidx8LhMc6U74JL+4KfVC+gN58g=;
 b=jdI1DyM4nKh+JN+vIEh2R+h5DnySnOjoc4VuuEbaDLtnNzZ5sQKLWN15C+3MfuKyjCbPko4ZeNaw0EIDwVd/aNyd83V6O/5bjB1TPlKPElYPb6BtfgdwWDPBzNcFGgRDb6IBp/Mj+8QlZVFe4uHeAW69zjdIZbHT1iSNfkvHFlmffG3QvyZm4yhc9/+SYTqgo2a41x2QAzq/KZO2++9YNbl1fZXrLiWmDWwKo34f421y5ckBLhXC9vWJtXBBTKQY+vqVcobDWZ5nZen0BOapyMBBjE3/9ms3sIrJOLo6lTA0XJ5UpYHRAznmmjJJtPbfSVcTQIWeNgWFByWy8Li0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MW4PR02MB7362.namprd02.prod.outlook.com
 (2603:10b6:303:7b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Thu, 11 May
 2023 15:32:15 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.032; Thu, 11 May 2023
 15:32:14 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>
Subject: RE: [PATCH 1/2] Hexagon (iclass): update J4_hintjumpr slot constraints
Thread-Topic: [PATCH 1/2] Hexagon (iclass): update J4_hintjumpr slot
 constraints
Thread-Index: AQHZJ1R4PdLeHoPogkeq+2J5H96Fxq9V7LTw
Date: Thu, 11 May 2023 15:32:14 +0000
Message-ID: <SN4PR0201MB880862D051493E2967B9D590DE749@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1673616964.git.quic_mathbern@quicinc.com>
 <0fcd8293642c6324119fbbab44741164bcbd04fb.1673616964.git.quic_mathbern@quicinc.com>
In-Reply-To: <0fcd8293642c6324119fbbab44741164bcbd04fb.1673616964.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MW4PR02MB7362:EE_
x-ms-office365-filtering-correlation-id: 11ed01e3-0378-4785-34e7-08db5234e584
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ftjVgsOK5TKKPxT9d1TL1LGNeH7DO0kiwG1H7P1Ob7T4j0H/zZ7FtfDu9IdjLCuFQY1vD550AWimU1vncyjOiAJZtTuBxQQeM1Yr/5dfJAAzDpqckc+H+4FKYajuA8ZVW4JGW+0sOotDznzBZkfodwi7oRWDvE5Teui+ix6ejzCm02gQUSZ/QGgmQfGpOwJAYU6QTB/jGvN7JBkVHsU3ABxQqp+rRFGFJAORcq6PsE55xJN+0Ribqj4t8+kDLuClLmYy2h5g99k/pBbasbkwoB/4ZzW3m8EB4TopzVhhsxuzrBI8MB7JuuWVBevjgh3WS58U0h05DrnPawQQSrqR+crcYfsVrqh5aZNt7tXIKVYNKvVcCxyEL4kbE518MKZF52dzMjM/pQWGqe54R52bGkiATSR+ctElF4A5Nqily61cxUtYcDA9/CWoKZnyZbFilBaSUJ3YvySMD3jtgbNGRj1pAqz13hFYp6budwmQZbxehqtQPcqoRubJ97o9flLoNlzRLMF+ExcpanHnpSgYWL2Co89v2xFMiCvQrdypNNw+EFsBZTOGtcfqw2I4T2+5EinWpJc4268xEnj6t+8C8DzgVqyMonIKWpME6evkFrwA0e6g0cmidfd1gh8CYlS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199021)(9686003)(53546011)(6506007)(38100700002)(41300700001)(71200400001)(186003)(83380400001)(7696005)(478600001)(54906003)(110136005)(4326008)(66446008)(66556008)(66476007)(64756008)(66946007)(55016003)(76116006)(122000001)(316002)(5660300002)(86362001)(38070700005)(15650500001)(2906002)(52536014)(33656002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XYE5LLkBr1c4578dC8S8ZISwERrQG6VNN7kQTqYN/jxY+S9tPd9G+J+6TXl0?=
 =?us-ascii?Q?3Flu+edY5Bl/ZP36ipCOlSyFgoRNir32Ftl0WnSNUivFDFvrkbUlyHrvWtYx?=
 =?us-ascii?Q?PiUbMPh2y1eVpQGbrmY7mn+0SRrcKEAU4T4oW0LwD2NxyZNtB6mZc2/iJkKN?=
 =?us-ascii?Q?12klWG9rp4Jn0a9HaCbZDOBSYEhot2Zq/IfFQt9PPzQgNp9sHVcaPxEs41h3?=
 =?us-ascii?Q?g5zCdsfHIqNk33Kq621LEHaJlYft2vMB1B6+iET3ZRcSV8Uq4hB4ATO5AAo+?=
 =?us-ascii?Q?m07wgzfNDvoObUWgKK9z3uzjuTRqw1s9OAnenPrJqNxThTp9bB3SzIRTa8Ws?=
 =?us-ascii?Q?I1DoDCMRV/w/xZJbFD2GaaJK4niDknN0Mp5nqMw3hVhXSywgdh8ncwULeSCc?=
 =?us-ascii?Q?HtVJWWOraGM3vGDbBnO8i05Nvy16EjgGd5I+KIs7fCO2H8WSz2NH2EDFFgxi?=
 =?us-ascii?Q?wEbpVb0aTg9ZfpV3HQ3xdBiqh21c8fj165Zmd76CdKTBTE/uMpj977spIYsO?=
 =?us-ascii?Q?JQ7K9OiUxGFrC4dfJ2v0HG+qqnLTYViBjWt0GjMnJlppXF3NHbU02lgXNd22?=
 =?us-ascii?Q?HDM2p3WNxlJeu3DXRP7JprASV9o46DiRG9NjXe1TQyRAohERtAWUZlnGQVfW?=
 =?us-ascii?Q?LjLSgS0hEFpW5qc0i/abQJzp78IayWCVPD3A5Pi1hLfQQWZDu9LWxM1w3voL?=
 =?us-ascii?Q?GGNYrIklbLOXhTMqPn26t8//XMef58qdxe9SmratSR1hmq1gz9zsvhpfy//m?=
 =?us-ascii?Q?Y1Lsb4ZLBAtY5NmyL6VjpaYceiqIFH2+IJQ3CsWwQch9Q5oBXm+t00eNZm2O?=
 =?us-ascii?Q?MkzhQZ0PKHxREWtXTim4NCUM7DjX9xPsXl5e0HabPBuBFQ5jq/mS0hV6MtVx?=
 =?us-ascii?Q?B8prBrVHYkFQwplsSY4J82lyfkiQP+aYvW3KhQgsW5e2R8jy0CDI75KeaSEN?=
 =?us-ascii?Q?JY1nt04zrTnLsCRWJ/2IU9BOtw4yrevreV9xsDGtRRL1D5drwdAov/ojvj9F?=
 =?us-ascii?Q?A3qwbaXqJhJplkC9VvAGOhqGsKnu8DOLETJuCQ1YbYo1Mvo07Zzsc8kb20Y+?=
 =?us-ascii?Q?CQWpzr5e7+tIzJ9guxv3DegVHJoX1tQr3jjLjSz12YE2gW6DRBPJl2kg47KH?=
 =?us-ascii?Q?TRnD/+Q6vijUa3RpvbflP5DesZwP1qxxt/8HK0g/4SLoRY+M9ruyvv0uLBXV?=
 =?us-ascii?Q?ixsvmpLdzMUrv/BxDH4Ht9h2C7Um1gamUQlklvfQyCLwO6DHgfiqiRHok39g?=
 =?us-ascii?Q?rUz3eFzn4nCwO1mIrEyFAA+zotw2Z6fTysT9wGD1qx0kwN1lxnM1tRoqwbaL?=
 =?us-ascii?Q?AOjndFvRQzX8FJInW13hBKMC1PbNiOW5Ct31He9EFn/m4LiQzpo9ikPcTgv7?=
 =?us-ascii?Q?FamlDtsflOGIFEZVEQin/NqH7pai7a7M/p6nTISi/WF8Wdw4dWkkthpll8bF?=
 =?us-ascii?Q?ESgDtenF7m1y1JEUDTKFXLbeg2pXFo0XOm8K0JSB98A+hCdu6fPoDk9sMUnd?=
 =?us-ascii?Q?oNHYE8mPwCQ1V6HDPYhV9SdoTY92mhuCOC1XI3rP69hFMXwUBtTujHjjkksw?=
 =?us-ascii?Q?3UWLA3Z6slU3TR6she/+SDnlT+a/quS6jEM1CvMrRxkCxS64RnMOeVdDKpol?=
 =?us-ascii?Q?iVkeBXxyv9IQY36jQtRNE5VuP/W/AG0+uvqlRQc/659E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Pz3d6uY00gWlsncALgfkTKeNsaESpGcrTI1NuYxI1jec6BWpSRbM8syEK7Dy3875LIWUOEl88hadbUtGK/Btc0hqtDnt2+zoGFQTWMyPM3cZli52nJFJqhPNkcdctT3XNt9pRMjMiYDQmiAEvMzG+BLpUlRnkzNoErT3gFtNH6oukQ5S8gy20iH3lof/N4zqM6FYe/WlZRNtZTmDoCkPigDU9zoJFW5HkmjuPK1RAX6ZBO0g130k2NFG5iko1m8nVrIS+D0+JDTvknwtAsCh7DW/ps07ofM5mPE1DBF5HwtRz9vgJtxzTrvVOTxq8kPOo+lv+3xs8hUequpFG6ydNhidsrhK1dZiXt3YfUNGHa5g/5HjcRRma/miMB3owA68zeil+750rqKxHCWSo8kfMURUFRrAZ5SFa21BeEFZsrcTtXTjc8oDEiIKaLAjZx1nVgmb5SCfQwZ/Pq2jsVbTvpPJIldAjGMqpuheHcMmcOd4ZRb9DU8YC62+yOsY5uDXbeS/n56/JutUqG/53lpzd/xJVJd/dv4mlK3wP4E/Z7WSmqXf2f6lkHddkhJ0tpHkQ975Ti3V4mC7G+DRTuqqPJSHeXIjLmCjkdI/jVw7D+XAiwWBKtbW3BscPSq5+29vN4L07pacEd0dLwcbHnDvMhnAFSDTriQJfo7KtSOGxV20QDix1iG5RWH7WkZqejT2PT6b3SqJd9/4ifljlFRvw7TFpafNpkzJc1m8AUnPr2hjb8+9jtwnbHannrtHI/wVMUtsMIzWPqIgRmDT+i+DQ8362yeRK9IPw78xAI2WVCw=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ed01e3-0378-4785-34e7-08db5234e584
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 15:32:14.5163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Oc59/x3CHxkXV+/FtcKiN4of+82aDm7ByLSkxdmSgLyoQCH5V37SRvdsyAFxr4gb+QfveMEGusAcQYqApx0kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7362
X-Proofpoint-GUID: 91cLwpIOupmZ6qwk8CWC5gmmXU9Q-lLU
X-Proofpoint-ORIG-GUID: 91cLwpIOupmZ6qwk8CWC5gmmXU9Q-lLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=478 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305110134
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
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Friday, January 13, 2023 7:39 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; richard.henderson@linaro.org
> Subject: [PATCH 1/2] Hexagon (iclass): update J4_hintjumpr slot constrain=
ts
>=20
> The Hexagon PRM says that "The assembler automatically encodes
> instructions in the packet in the proper order. In the binary encoding of=
 a
> packet, the instructions must be ordered from Slot 3 down to Slot 0."
>=20
> Prior to the architecture version v73, the slot constraints from instruct=
ion
> "hintjr" only allowed it to be executed at slot 2.
> With that in mind, consider the packet:
>=20
>     {
>         hintjr(r0)
>         nop
>         nop
>         if (!p0) memd(r1+#0) =3D r1:0
>     }
>=20
> To satisfy the ordering rule quoted from the PRM, the assembler would,
> thus, move one of the nops to the first position, so that it can be assig=
ned to
> slot 3 and the subsequent hintjr to slot 2.
>=20
> However, since v73, hintjr can be executed at either slot 2 or 3. So ther=
e is no
> need to reorder that packet and the assembler will encode it as is. When
> QEMU tries to execute it, however, we end up hitting a "misaliged store"
> exception because both the store and the hintjr will be assigned to store=
 0,
> and some functions like `slot_is_predicated()` expect the decode machiner=
y
> to assign only one instruction per slot. In particular, the mentioned fun=
ction
> will traverse the packet until it finds the first instruction at the desi=
red slot
> which, for slot 0, will be hintjr. Since hintjr is not predicated, the re=
sult is that
> we try to execute the store regardless of the predicate. And because the
> predicate is false, we had not previously loaded hex_store_addr[0] or
> hex_store_width[0]. As a result, the store will decide de width based on
> trash memory, causing it to be misaligned.
>=20
> Update the slot constraints for hintjr so that QEMU can properly handle s=
uch
> encodings.
>=20
> Note: to avoid similar-but-not-identical issues in the future, we should =
look
> for multiple instructions at the same slot during decoding time and throw=
 an
> invalid packet exception. That will be done in the subsequent commit.
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/iclass.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/hexagon/iclass.c b/target/hexagon/iclass.c index
> 6091286993..081116fc4d 100644
> --- a/target/hexagon/iclass.c
> +++ b/target/hexagon/iclass.c
> @@ -51,8 +51,10 @@ SlotMask find_iclass_slots(Opcode opcode, int itype)
>          return SLOTS_0;
>      } else if ((opcode =3D=3D J2_trap0) ||
>                 (opcode =3D=3D Y2_isync) ||
> -               (opcode =3D=3D J2_pause) || (opcode =3D=3D J4_hintjumpr))=
 {
> +               (opcode =3D=3D J2_pause)) {
>          return SLOTS_2;
> +    } else if (opcode =3D=3D J4_hintjumpr) {
> +        return SLOTS_23;
>      } else if (GET_ATTRIB(opcode, A_CRSLOT23)) {
>          return SLOTS_23;
>      } else if (GET_ATTRIB(opcode, A_RESTRICT_PREFERSLOT0)) {

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

