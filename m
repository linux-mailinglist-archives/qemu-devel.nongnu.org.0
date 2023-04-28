Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726266F1FB2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 22:54:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psV5x-0002Gx-Ce; Fri, 28 Apr 2023 16:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psV5v-0002GM-16
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:53:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psV5s-0004qr-KE
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:53:30 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SJ15uH021184; Fri, 28 Apr 2023 20:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=5v9o7m+xEi16HHI5+2jaI6LN34vDoUc0DQLX0hYtcJQ=;
 b=L+sHCYw7ds0BbNCjYQpCHhTEv29rxR76g8KhEffwK7ZsI4UZ3NcuJ2toQB3de8jb8feL
 wUWqLlDCxHHX57zN7x1PJLMOqgP3ugQAGdw5h8AmQLRZQ6sZhk20GCNqriwQEuBKgwAy
 EOuCYJSohv67c1bPO8MDfTr5ucz3ZSeP6af3W3ua7Q4UacrrPsPeFGftCMcgnFXI8blW
 N3KPSHopEsrQWgr3sJteFmrqk5P1CSf/wZWeW2B/Hj6VipTEqPlSRbPItSoz3gc3Bevg
 JCJkG80AGYaLc6y0tXus/tCLJAzWc1px/shnMq5FHWb08ODYTpzXgvQEzc4S3MxYU9jR Vg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7xdybgmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:53:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW3nwMyqJQaXWoQ4PUqEg438amvUfptzwJXyIBQsymTS60MNl9N3bQCW0V1sDjrDOd3OctReODOiJrTuvl92YdhLlXEi3sYthYzXmQn+RAs9hxg3Bd2MGtKrGDz0+tdtM9Vk0URr5OYWDUQo+96VGI+ysfM9j2wKn4lXl/0x/Dsy22qbh69+kNQAiNH/PS04RpXxgapXPKnEBwVuWmGPtQoiouLonU49CKf2dHORylnmi1RhkyW5BITJu3pbsjzx4PCsvVZHuLs2sF4pSo1i0E63dK6YcAvTu3PU2KOwHYL0UdI8pPyelp6Z/AFAFDWUBAiGt249IfxYcajBux7HCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5v9o7m+xEi16HHI5+2jaI6LN34vDoUc0DQLX0hYtcJQ=;
 b=le/flbSpuYepkc/f+YnYZRKR+PqQIFbB1nRYTQSv9XRi0UEaUqzlEVj72ggo8Hn9EU/z1vV9eYouA8QPU96rIYJIZQCAob35MqwNYipBXnN/y2K3+bixJTBdkP4DlRMDv02R3C6+EutQkzXtcZdBfhHCKAlzq+3hVj2Azh2YXIdgy+HiEAQvl60kWZV66RouhSXVekPDOql6cI6ddifDkGvJjnFSbmIAXRvN76xab1vHNC6+7YFIMVXntAz2gALkeU07LCUDLsXUusoc9lm/7heBCgE3HMDBIeLHEz3+qxN2ybWxPMKX9VcHs+N1OldbBOFlfqz/ZZameypwsj7BTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM8PR02MB7861.namprd02.prod.outlook.com
 (2603:10b6:8:20::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 20:53:21 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Fri, 28 Apr 2023
 20:53:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
Thread-Index: AQHZeGUgUY3CJga+3UirbMZCKDagh69A60AAgABKjbA=
Date: Fri, 28 Apr 2023 20:53:21 +0000
Message-ID: <SN4PR0201MB8808AFCFCAAC1302B70A7966DE6B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230426173232.2227787-1-tsimpson@quicinc.com>
 <1e46223e-072b-9180-51aa-49a203ce6de3@rev.ng>
In-Reply-To: <1e46223e-072b-9180-51aa-49a203ce6de3@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM8PR02MB7861:EE_
x-ms-office365-filtering-correlation-id: 55f30ac8-162d-4fcc-fb5a-08db482a99f0
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c9lXbBYgN6avQJM3t6iRNkDnKaj/fSD6rz5/7Uv4pU59+wn3PTBmbf/C8XMYDIW/z+gQEV4pn5H6jZU4KE6H5jc6PmrWK8m4QR2dV80/hnRZUMEhUHEZm31KoK2/TAsBP4z/Z7oOewCxVGAKeJhvkkKixhYFHMmUALwktXYxKOOgVvkNCmpw93WrCiKsETsbvQi0sdufVXqXNxSSEVbR+VgAls92V2Abe9n3ZJBDdwZhNRD5rEoaG+h9Q9dlYP7mesMzT7RDGU5wW75WJlrK21xeNmOF3QqCCsXVph1hFQItpYHuFLd28y8BMOb5etyCPFz0eWJl293GlkkyHi/pq02xr2z9ZpzH8B+x6dIbcximo9cnxai60gaU1pVEJaZYanJ0VfBIXfjvl2gTy517OBa0byHJc+v1m/lmsrtTgw9YoG0tKlZS1s+eU5p7bA9Alb/gCgTUCI3jcueWhi9+2yjZLHOMrUzHz01kifxhmTPKmg8ew/Bs8mPKcvNRCseZ6snB+dPiMXgvjVN/WdFvVIjlJ9LEZteERZg6ExvSiOK8WwWLNTjco6LEAYTvL2ofTdJZiGB98Qi6iMnDgjy4F64ud4FCbhWSR5q02Sm1q3IppPNv36relrex6KUSNA+m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(55016003)(86362001)(478600001)(107886003)(7696005)(33656002)(71200400001)(54906003)(8936002)(8676002)(52536014)(110136005)(41300700001)(316002)(38100700002)(64756008)(66476007)(76116006)(38070700005)(5660300002)(122000001)(66446008)(19627235002)(66946007)(66556008)(2906002)(4326008)(186003)(53546011)(9686003)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGduZ0psYzhVRmdmMkN4YmFQeHBpd2w5NFcvZng1L2Y1dUZjVjJkbUQ2RStH?=
 =?utf-8?B?OHYyYzJjeFBBbEVVbGI4cUZDZnZETWxGY3A1cVhsaHpuajJqODllZXBNZ0pY?=
 =?utf-8?B?OGJXZnpmUWs1eDlhenJSQUFRZTU3RUJiK0Y2YXVWakdyQ240NmVQWU5FdU5W?=
 =?utf-8?B?bXdJeERQdk05U21ua3JKeUdwOGtmSVU4Q3U1NVAzOGtmUzlUY1NmNnplaUhZ?=
 =?utf-8?B?WXpEcTlydmNHSzJMNVFkSW1sWUo0c1dJK2k2SStRSE5Makc5SVpoNFFROENa?=
 =?utf-8?B?TGM0aWRmY2JOSFZqMnB1dkhqWCtReHpBR3VyMVVDMDJsMXBnaHlRaElsa0Fv?=
 =?utf-8?B?aENCbnFBRHdZaFNCVzNmcDJkNmpMelVTazA4TGhzTmdDelRmSzNjcmM0S2wr?=
 =?utf-8?B?UkU3L2pId2ZUMU42TytXQ0l4U0ZValloNXNva0U1UVcrekZBT0g1UWk3TytS?=
 =?utf-8?B?dFcyUW9jMW1xSDM1QWROeGd4NUloWHVvV0hOM285eTZtMkk0czI3MlJRTmR6?=
 =?utf-8?B?Sk5DcGxWWkJxajVOc3N3ODh6S3VvYm1SUW16RnVkY1pVbWRBTFVTUWJwbEVm?=
 =?utf-8?B?eExDbDhha3NFclh1T0Q2a2hUcUNpZ3RWcTNkQUd1cHpnNVJUK0l0MzhyTGhr?=
 =?utf-8?B?L2xoQWFSRUN4anZtV0d1bXo0Tmd1VFU1VlVYeHlVY2IxOUJNMGlMVHkzLzhx?=
 =?utf-8?B?bFBrOWtEVHpsNURqOFVXSTMyT0F0OFpjM0xuVDd1UnZvbmIydjRoNHU4NzM2?=
 =?utf-8?B?SU4rVFdxNU1CcHRRNWFwRG45ZS85QXcyZ0ZFRmlYVlZWZnlQbDFSbGs2Slo4?=
 =?utf-8?B?ZUEwN3hvZEVsSWRjRTBOUkpZNzRtemdpblVpOWlFRTBrK2wzaTVMYmoxZ2Zw?=
 =?utf-8?B?ZWVzUjFWbUxOVmRoeTVHeWVLQTNQQTFrVk9tN2lNMVh5VnpWM1NqdFgyTFBM?=
 =?utf-8?B?QTRwNjZ5MktMRDZvL2dYMWRoelVDUHliQ2lhOHA3K2VHanJNaG0vZnJGNUpo?=
 =?utf-8?B?cDROdDl5UktSYzYyTFU2N2IvY3pJTnF6QzhWejJubEp6K3ZMRnFsU2VCMXdv?=
 =?utf-8?B?S0g0QjVJeFdtK2hVNmloUkplbFJiYWFkTG9wQUQ3L2lwNGRZU0xOZWVMSEpx?=
 =?utf-8?B?STJDRXQyZkV4K1FrbVN4UDZmdXFBcTVkUHU4Ui81ZHN5UnRUV0RYVWdvMXdj?=
 =?utf-8?B?d3U0WWg0NEF0RzBibTdNc28yMEdObXYvSUdmcmw4VmhvaWt5WlV5NWxESmZN?=
 =?utf-8?B?SEsvL1Nvd2lFdHRESFZOb01udnZaOE01NFljV2QyR2tJMWtxNm9zWUFYMGd6?=
 =?utf-8?B?NXAvQSsva0Y0T2h1WHJYaWNHcFpybkN5ZnAwTkZWdE5paWtrMmYvODE4ZHVv?=
 =?utf-8?B?djdkTHZkVGliTHlJazI1V2VQMGJDSHN4bjNiQnQrMnJ2bFlYL1RiZG9IejNX?=
 =?utf-8?B?ak1zWDJNTlhSTVJ6OGJremdlV0hGa2dCY1NIbEp6Sy9WQ2dseHFYeUp0OGlD?=
 =?utf-8?B?ZTF4UkJsN241RmJXMWtkdmdwQTU5VTMya29BL3cvYy9VdlRmR1EwV3AydnQ4?=
 =?utf-8?B?ZlNDazNlUlpsT1lMYlNXUk1tRGZrUmJjcE5DUzlsNU1SelNiTVJuUmkyaVNI?=
 =?utf-8?B?NTRLd0NyS2VRZUx5bm41MG4rOVczRjJUZ294ZnNTRzlTcGl4cFBVakoyR0JO?=
 =?utf-8?B?aUhncGFoZ1hBRzlHeGI4ZWNtU2EyR0NnL0NNSzZJMGp6TGdubDBXbHdkMFpn?=
 =?utf-8?B?OUo3VEd6OUgvNFJEemZiL1VBNzlXYW0wYjg5MWZxT01oSzh3VjA1K2p5SnNa?=
 =?utf-8?B?OWFXT1lMVzJyNUZHQVZGNnpETHVNQ0JQTjZKTE00ZWZ1M0hoUUhXbklJRWxq?=
 =?utf-8?B?ZnZxYmZ4cSsrcWFIUExXQ3FmQW1BUzZJdFlWTXEwUWluanZLdERRN2l3WjR2?=
 =?utf-8?B?ckU5QVhBQXdxVkN2Z3ltbnRaYmZUbks3QzgrQVZuUXFzTklBS3BhWU5MMGpU?=
 =?utf-8?B?NVpRc2kwYlFiY0I4UHlRTmNqaWlhcFVMTVR4UHYxRnlJQWxnNHpDTlYwaXpG?=
 =?utf-8?B?RCtRUWNPQjV2dmlxOWJpVUNnZUgzTXU1K1lQa1hKcXJPbHZubUdVelZFK01D?=
 =?utf-8?Q?bHsNGrzJO0k8mVmwbJzsKYge3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FD7rN9/TJ1IULdWKMlHxraLso67E2lEKcW7aJ/6nTvj+Qn3VIibb1nQbXD1hSUXcAyWhFrjTcPfeijsTE148gJG6EZnJs6pG14W6dPnYS43C3NyRk88rDCJDyWz/Maz1ri3gbKy0YK1Dx/paYiZFlkD1+fQtfWDSU09uHnfwcDZcdMmH7BZw96P/m0/xzKs2OeKKAC/ae89fM7bPNkEp6AlcbB10XH220v2KHhYN4tLvMLg/udVrnG35qScVyaHR7zfJjkVCj266piAa5KjDGdevECBWXPNnOBhi0E9EfXdy2bMxBwaCUs931TdhUmymHrUFBoQBFkNTMekLDaTbWwB3ODK9UBJKdqBzEt4xIm+XDr0FHleMV7cCPulm/VNbtcvl09FpFYGHVHtCQIp48SRfBGRffHc2mp66Wj43oCR79n8cWyhczcZQ00YAIkrV3aVA4rMtP52awRhO8q1txigqUlVDpY6Hii9+cv2lNBr3QlDjYsGj23xG9YXCB0tqgrFbHAGj5Tn3gylPBowv1mbjpL5yIOEzAgN3xhpS4JWxL5KJnJEmiTLEWy97Y5krtLArVkNZXIYBEUQXV9TYdxkgCE69m/MITzUXqLYnxPoLb17ikvMDZMzuurQKNopYhE+YvbP1YIjwPvVC3uj0V6Lqc6cE8dXeRfcqDHfcxiAEGPfNKOnEGN/ohdAUakK6pQLJaF46HR4vx+YkDO56SffNw1WUrXG8hdSuusbh6xJmnT3703GtPvCFrQk3qWIVHZRoX1ONUm6oRCn1SSy7iOYn6yheChlhzzrmnCMDc4HzvaLEAxCwKlKJQRNdsibI
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f30ac8-162d-4fcc-fb5a-08db482a99f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 20:53:21.1207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZ3/SXbCZ6fVEh3iketNAhGGNFiYirW2S+CmSdU790WYoQnBG3wiG9ox5tYiw7qdz+8hKk7ViJi8ZjO6KxTXXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7861
X-Proofpoint-GUID: gHPijut7NAZBvoqW7efC-QYLpFE_Opc8
X-Proofpoint-ORIG-GUID: gHPijut7NAZBvoqW7efC-QYLpFE_Opc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_06,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=895 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280172
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogRnJpZGF5LCBBcHJpbCAyOCwgMjAyMyAxMToyNSBBTQ0K
PiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBu
b25nbnUub3JnDQo+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBwaGlsbWRAbGlu
YXJvLm9yZzsgYWxlQHJldi5uZzsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5jb20+OyBN
YXRoZXVzIEJlcm5hcmRpbm8gKFFVSUMpDQo+IDxxdWljX21hdGhiZXJuQHF1aWNpbmMuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkaXRp
b25hbCBpbnN0cnVjdGlvbnMNCj4gaGFuZGxlZCBieSBpZGVmLXBhcnNlcg0KPiANCj4gT24gNC8y
Ni8yMyAxOTozMiwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gKioqKiBDaGFuZ2VzIGluIHYy
ICoqKioNCj4gPiBGaXggYnVnIGluIGltbV9wcmludCBpZGVudGlmaWVkIGluIGNsYW5nIGJ1aWxk
DQo+ID4NCj4gPiBDdXJyZW50bHksIGlkZWYtcGFyc2VyIHNraXBzIGFsbCBmbG9hdGluZyBwb2lu
dCBpbnN0cnVjdGlvbnMuDQo+ID4gSG93ZXZlciwgdGhlcmUgYXJlIHNvbWUgZmxvYXRpbmcgcG9p
bnQgaW5zdHJ1Y3Rpb25zIHRoYXQgY2FuIGJlIGhhbmRsZWQuDQo+ID4NCj4gPiBUaGUgZm9sbG93
aW5nIGluc3RydWN0aW9ucyBhcmUgbm93IHBhcnNlZA0KPiA+ICAgICAgRjJfc2ZpbW1fcA0KPiA+
ICAgICAgRjJfc2ZpbW1fbg0KPiA+ICAgICAgRjJfZGZpbW1fcA0KPiA+ICAgICAgRjJfZGZpbW1f
bg0KPiA+ICAgICAgRjJfZGZtcHlsbA0KPiA+ICAgICAgRjJfZGZtcHlsaA0KPiA+DQo+ID4gVG8g
bWFrZSB0aGVzZSBpbnN0cnVjdGlvbnMgd29yaywgd2UgZml4IHNvbWUgYnVncyBpbiBwYXJzZXIt
aGVscGVycy5jDQo+ID4gICAgICBnZW5fcnZhbHVlX2V4dGVuZA0KPiA+ICAgICAgZ2VuX2Nhc3Rf
b3ANCj4gPiAgICAgIGltbV9wcmludA0KPiA+DQo+ID4gVGVzdCBjYXNlcyBhZGRlZCB0byB0ZXN0
cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRhcmdldC9oZXhh
Z29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJzLmggfCAgMiArLQ0KPiA+ICAgdGFyZ2V0L2hl
eGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYyB8IDM3ICsrKysrKysrKystLS0tDQo+
ID4gICB0ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMgICAgICAgICAgICAgICAgIHwgNTQgKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gICB0YXJnZXQvaGV4YWdvbi9nZW5faWRlZl9wYXJzZXJf
ZnVuY3MucHkgICAgIHwgMTAgKysrLQ0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IEknbSBnZXR0aW5nIGEgaGFybmVzcyBmYWls
dXJlIG9uDQo+IA0KPiAgICAgIHY2NV9RNl9SX21weV9SUl9ybmQuYw0KPiANCj4gSSdsbCB0YWtl
IGEgZGVlcGVyIGxvb2sgYXQgdGhpcyBuZXh0IHdlZWsuDQoNCkknbSBzZWVpbmcgdGhhdCBmYWls
dXJlIHRvby4gIFRoYW5rcyBmb3IgbG9va2luZyBpbnRvIGl0Lg0KDQpUYXlsb3INCg0K

