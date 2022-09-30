Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF935F1541
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:54:58 +0200 (CEST)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNyD-0006tv-Ib
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oeNwS-0005Qs-4P
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:53:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:51426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oeNwP-0000nz-PK
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:53:07 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28ULd1qw010015
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 21:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=Fi+QqIWIF3LaX9P5muUWGppYffpM/wlTAJ2llpGzTbA=;
 b=Ihz31oZIEkkLyBw46bvoBGNqtDYeuntyG/dFITDkDp0HuX30rLEcFNjk2gzJmze+Z5lF
 ZNsQ8PuhC6RzS/MoTTFTOlDFP+8eMWYjx+St2Xe0EVHpXICVuJBfo5y8ix2L0x066nKv
 tYPrUwI4y7yfe7qIYas6t9kcmPpEF+V8sq3NFxRIhKoWEHjvFhwkeA8/+OrUyLQa3DYp
 EZD8dp1lQ5g7MoVKR7M/hcfO5qwqtaTYSAAD2jMwy4fVa54sjtbNa9l8JRNUxTFi0sdd
 bcVVb9EgEUs5nooPObXoU+Y2lklcpValhZx3hJ+k8LaD6O/eYjgEq+wdPnplcJdBVYsK KQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jwj1bv1qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 21:53:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKp2y5WcD0A1ju3AfNK5LcB7/EfymzxBar71Vj7uV0tbLd3N1Kx7QnG8Q4uaaxywGuZVtCWIx1j+DmB8NVEQgjHEtqUvLI2j1Tr9/Avbg0JP7/I0A3tgcgt7A7DIw23IBh3yO24spXyuodfvb07wXY0OBGYdmYk162Xe+FDPUpBUVKsmHRTbbbw3IhyU9TjLo6iMeyc/E0V/NW694VfTVuaegtHpfk94V9pr8QGrQr6Yx2QYb8zL2VJbhttQKHeYuYFpju+xPNV+5hdtSF/X5gnyxrF6eMP4ptPUmEXFkbaYySXre5uJC5GIHIW1q7Ji9BK8oqX6tckxcijD0dLbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fi+QqIWIF3LaX9P5muUWGppYffpM/wlTAJ2llpGzTbA=;
 b=gglbjDUT6nXg1s22QpkzBACRze7Nrm71Q6blpcwyFZQqrWhMz9gY8APhK6I0LB2FHeTap9iWwFBL8ZK0Ew7H3tQkMrXSBvdBB+RD86Cg+LP6BWeMov4t+/uaUETHHLcn6/b/zdFx9Gl70fn2+5OLScMKwTsD/W7OwW6vPLxH3ppcZd0oqoA+FgZbh5UhU6Dl0o0VPV2x5DTwJOD5AwYxhyfG7yB4eBldAnXQmdSPzk3R1kIdCNAViCDF4ysd7yXZ2mnJUDb5hzuj2IY9U/n40Pm7M+fMWA1xZwdOSBnL+OHKVg2zZbWETtk7D3BAlU/uiLUs9TK/3yibdXWkvEzcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6886.namprd02.prod.outlook.com
 (2603:10b6:610:85::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 21:52:59 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87%5]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 21:52:58 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Hexagon (gen_tcg_funcs.py): avoid duplicated tcg code on
 A_CVI_NEW
Thread-Topic: [PATCH] Hexagon (gen_tcg_funcs.py): avoid duplicated tcg code on
 A_CVI_NEW
Thread-Index: AQHY1QhqhHMs7TB2rUqMdQaNNfpkt634g8fA
Date: Fri, 30 Sep 2022 21:52:58 +0000
Message-ID: <SN4PR0201MB88088B6795090E00A87AAE85DE569@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <fa706b192b2a3a0ffbd399fa8dbf0d5b2c5b82d9.1664568492.git.quic_mathbern@quicinc.com>
In-Reply-To: <fa706b192b2a3a0ffbd399fa8dbf0d5b2c5b82d9.1664568492.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB6886:EE_
x-ms-office365-filtering-correlation-id: ffd7679f-e380-438e-e121-08daa32e23b4
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9FmoOJ2WN/oI1cwJaqW1+Z4TnfVO0pzYwwVRLwpyqi8vkLqDXEK2/KINF0B35JJlUHrRckbJWMMhQpdKgXjRRSPTzUIJE/G169NQLLrLR0u7wZZBIq0NGjkN6BBJ83kFGTeP/fp2RzLUvyL+/o1sLhHGPGtb8asb1XzZLWMbe//M1TeXc7fvC4DGSAlOvR57TE9IcsapJKXYzZXgF0IGFTF21I7sjQ3ncPOUGeCVoIi855GqlmQgNUJMqwH2O3/bAw6tkuBIS6QDEAgJjT+zUZpkB/sMzOdGy+3CsuxENfP/PURPhz2Nlpu/hYva714RQSyyUNu88yWZPW8CGzT+im6D//b7/BpNtA7uqF8TJBjouObf8Ve1F3CusNiKEjDXY53sBYLN+m8YV4p4uasTXUxKWEF0WnDrGnERcR5DQQuEADymDvQLBfXsYkC+3D0SRqoJQQTDERD9WqAgbICz09n217Pkk5wu1bc+6Y43jxTMbIi9oYooxJBvK0CZGa+jt5q2M4th+L4Ts4Q8fU9FJOANnmgfCnpfv57VAFnwiRXp8iASe8irZ9n3c0ogJAV+bDvqQfDfijo93G3rrhKSyz3osmd2yaUK2TzHG4lo/ITiWt8C+gRfPwJB1c+ROpJYb+QWXGbZUjwm9uF5t5TOs4g+rDHsVBpPcQd55hCu+dBOl7eRqfHnFXNaWN0SEvLEtPJwtmSleETRkm03m7fohTvDApO5Oc5czyVQNjTXHJ4ayAYD+94nj27BdNnpUuSPaT/N7H3dK75BV0xzIDLMRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(9686003)(5660300002)(186003)(2906002)(33656002)(6506007)(7696005)(41300700001)(8936002)(53546011)(52536014)(26005)(66446008)(64756008)(8676002)(66476007)(66556008)(76116006)(66946007)(122000001)(38100700002)(38070700005)(83380400001)(55016003)(86362001)(110136005)(71200400001)(478600001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w0JHYbSDrh2tEQ1XoWHiOIR6EaNIM12oWzDIUTe/NG+AVngfqZLByLme0QM2?=
 =?us-ascii?Q?dW5Dz2xzQBCyKqzJsUc8kRPEfq3J45aJ4LAbHzVUe/H0uvufbycyMch9fN32?=
 =?us-ascii?Q?60OG5BTl4VsTURILORGO9LZEesauRf9+eFBhclODkvN6mCPJOnUCVI2eY+X1?=
 =?us-ascii?Q?Cdz6cAjdjjdmaRYqOD+8F8RokeClsMDvvvP4xnUcWyE4iYkVGjgez8P1k39U?=
 =?us-ascii?Q?wWuJlEmGowoosjJ/WKJQx99zFm0d8s9F4V7kzacj7zeSAMRLfRbKbAhgPIOc?=
 =?us-ascii?Q?QtnddumRLnT1RDeyK3ZaMBvwx9F7iOEKBGoRb7KTAwf1sQWGxEraiRDaSzIh?=
 =?us-ascii?Q?GkQftUSDZExXGFDlo5QDCdDWvD2xBkq46eZvpVwxxZ5a/YXruN5Es3hfYYOg?=
 =?us-ascii?Q?6cFFcC0QpIqgZ1KIcf/6mOY+WqB8Edc2yq6SDNQ6oEipAVosCOLMUwD+YDGy?=
 =?us-ascii?Q?7JV7Ug9JsiB01/Pyp9BGJemZsd9BgdY/VsJqk9tiSfM+jyCG9YUeITfuFHnL?=
 =?us-ascii?Q?oDqDBnXHvq9zDc+2ugpB5n8P8OgAUy3t3C3tkltuwL+MaVt17w+sJ79nZ0LQ?=
 =?us-ascii?Q?ckVPo/mf3vxVuZ8aEGxRRrIOgdeNKc76U0o7EdFz92/uoWdasyfJpxdd8sBs?=
 =?us-ascii?Q?CgmN6bKXps/UfF1vnjVVRznfEpkzqynPdtY3QRWH5JhHqY0RAsUWDI2hmM+m?=
 =?us-ascii?Q?pT6DyPBtW2jc2IyzRl7R2w6icss1MI7L0g4mrjrICx1O4S/vatqvC/JEVz7T?=
 =?us-ascii?Q?W5uRy1qDuWBQis3Le+/m1Bqw5YruUsCRLmFI3biAwrXc33p52kKE4427lh+c?=
 =?us-ascii?Q?FthfuTVY2BRrRZL4+5YskweoWxthuoGrEiDXqvoxSG70uJgoKv/H5i5ySHZ5?=
 =?us-ascii?Q?uQkKDXPKdm+rswQyYATXUxK60x4fkYvysB56ZCzmdl7gTrMIOlbX6F90pKVG?=
 =?us-ascii?Q?gc00bppvZPTQxTQEeCxsoOkppwpYduTQdaO72n84r7iln18Qpb0dpN6neT4n?=
 =?us-ascii?Q?LA7Zc2al68lUo0k6i/6ms9p9R4Zflk+3CEVJlnQhirxMAKqI0D/IaRfWUXkt?=
 =?us-ascii?Q?rtrTEvguwdCab2wUBKfmybMtoY0xxZYCNSjWwkYj4HRvyLjSwyU6Ahjj5JDU?=
 =?us-ascii?Q?A2+Wf1/8bu3xWE+pbu2VUXPgBCYzueuGQWOSNYdBfnpjIkg1ESlL+MymgmO3?=
 =?us-ascii?Q?eiOTma4TmVVlLQVaViBhCntuXP1AD2ZGZOwpwLjBgyzTcPKQVOt0DxSNSxLL?=
 =?us-ascii?Q?g8Au8JHg2xorssxoMDJ1T7/XYcGQBo8JyyEiWcy0wrtyyIdYXR7I4O1El03J?=
 =?us-ascii?Q?CKSX/wNDyoLCBKBPaUhPy91yJYsZeZ6j6gS52my7Bp718B0gsgQGz+7wwGml?=
 =?us-ascii?Q?1Mm7PwIyw8LvhSEm+aGTNrpnyfPrRj/daOvR6drWhvrrjzOmviT5K6R3PTyr?=
 =?us-ascii?Q?oPiOyOli9EED9hl2QXJE5a21aB18JyZP2S/N5txrRl//irWm25HIFGJs84oP?=
 =?us-ascii?Q?VEiCCQYktKLpjUN4lh71tnfyMrlAK5Pnwo0G1CsGxCW+wqXaIM9isGt78BAO?=
 =?us-ascii?Q?AymFS/K+LqE5txUwCHweQ2Vd7hZm9JMBWw5WeoGy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd7679f-e380-438e-e121-08daa32e23b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 21:52:58.8601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KjIsdY+96T9hjdaEGKN6wv2ZUDZKNc8Aln698ToVS1PYfhy7ageZKExEm7pM8gXrhFVLcaWVr/j4ES7sp48gqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6886
X-Proofpoint-GUID: 7Dt9QLn7VdXkqtB-mD5AuEa7o4kwpknY
X-Proofpoint-ORIG-GUID: 7Dt9QLn7VdXkqtB-mD5AuEa7o4kwpknY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=758 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300135
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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
> Sent: Friday, September 30, 2022 3:08 PM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH] Hexagon (gen_tcg_funcs.py): avoid duplicated tcg code on
> A_CVI_NEW
>=20
> Hexagon instructions with the A_CVI_NEW attribute produce a vector value
> that can be used in the same packet. The python function responsible for
> generating code for such instructions has a typo ("if" instead of "elif")=
, which
> makes genptr_dst_write_ext() be executed twice, thus also generating the
> same tcg code twice. Fortunately, this doesn't cause any problems for
> correctness, but it is less efficient than it could be. Fix it by using a=
n "elif" and
> avoiding the unnecessary extra code gen.
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/gen_tcg_funcs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/hexagon/gen_tcg_funcs.py
> b/target/hexagon/gen_tcg_funcs.py index d72c689ad7..6dea02b0b9 100755
> --- a/target/hexagon/gen_tcg_funcs.py
> +++ b/target/hexagon/gen_tcg_funcs.py
> @@ -548,7 +548,7 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
>          if (hex_common.is_hvx_reg(regtype)):
>              if (hex_common.is_new_result(tag)):
>                  genptr_dst_write_ext(f, tag, regtype, regid, "EXT_NEW")
> -            if (hex_common.is_tmp_result(tag)):
> +            elif (hex_common.is_tmp_result(tag)):
>                  genptr_dst_write_ext(f, tag, regtype, regid, "EXT_TMP")
>              else:
>                  genptr_dst_write_ext(f, tag, regtype, regid, "EXT_DFL")

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

