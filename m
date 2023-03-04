Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD16AA638
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 01:28:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYFku-0003YL-Jd; Fri, 03 Mar 2023 19:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pYFks-0003WY-4r
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 19:28:06 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pYFkp-0004V0-TK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 19:28:05 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323Nd3n6021600; Sat, 4 Mar 2023 00:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=5tP2fc5PNaIEI/sKEn7Y/wW54j3KQpDrucf9UUJwF1U=;
 b=SQCsgkCGDoZrKC6Zp/sq1GWoHRCxRCpyzhXv5SCD+IIoUNNHtHekq9DLYtpW6pBqkIBi
 VZcmOANDTCuPF9z797KG4gYndaEwB6R6t/lJjnouB6XbvT31DOer1A3sg/zKnt7TXLVz
 1WIJijSdC/i7pkeeztu1WyjKYEHVWzJB4xVrZXFfLR+AC5ObOrzdarjj5/oqQ16JFBQJ
 tU54oiAFcx+p1D3eFOBdRZqsSCFL6gXYee/6prgwxw7aLgbI9BbgWTR25XAK0GLM+LAk
 XjZsYyRn85oTPoGc9RctWxtrgdtnGgya51+Kms8i4bwqf7PWkZK5rgx3OjQfUNcBlQwS zQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p36mybepp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 04 Mar 2023 00:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FShz+xsPTEdk3bRnh15l4SXP0mZ5bZenWY+nmN6X+Q6QQbW/G6M23T/7uSFTnoPA/3mi2v8uFGL4q+MhSkpPLJEftPUjDS5O6/XgW8HuaN7gbBrbhmAdPet0Tj2hT7Vn55+D/ZS2FIBOAALdTLSC1z3CouV2SS64gd9PTasC7/vWDUTKS0oqV+8H5DfVn4S1y+OkLzc/fD/rmeSARjrj3XXGmfLFJ4r4Pt9SKlytg5NVEwC3ZYgSyLMZJGAhJMPTJtzHhsnB2z58QobhLrq+eZAPLsvOBOoJx/1sjSziN3nxfIhQAAEVh81p6Pa1JEU/vRyf/LX27Fpw/ffwp9vEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tP2fc5PNaIEI/sKEn7Y/wW54j3KQpDrucf9UUJwF1U=;
 b=S+nQ0sL47tI5PcNCOhPJuLf0jkBTZ4rEg2DiX8RrwxcAAn7353cURFPFkGXbWdd/MrxBnn8KnK/hKIAE4xTkEM3g0XRkoJGPuemAw0gEnFa2XTVT+bFwpbQbbVtKDhhF9X/hqzxQJEZgkgZrDUw0IiZEMTLuwOQ1V5KNsm7QfpBtIPwKb7cMpgkIuGdN8ibePwx+Y6tzOH6PtHgvcRP1cIX5FTtmOTCfpZZDRe4fE7xA4ggPIk19qeGiosCMM4zhrKB09Z1HZyuHECTmjD/x/l+XA21Z/8scdu1J/u9H+9P8PxvS/z9TGOHYGuydeOyGROUIyRYH8zxEflIsc30/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6758.namprd02.prod.outlook.com
 (2603:10b6:610:a8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Sat, 4 Mar
 2023 00:27:57 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6156.019; Sat, 4 Mar 2023
 00:27:57 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "anjo@rev.ng" <anjo@rev.ng>
Subject: RE: [PATCH 0/2] tcg: Merge two sequential labels
Thread-Topic: [PATCH 0/2] tcg: Merge two sequential labels
Thread-Index: AQHZTh/WyCWZhk2PE0qbPtH2dxPXda7ps5DQ
Date: Sat, 4 Mar 2023 00:27:57 +0000
Message-ID: <SN4PR0201MB8808029B619D052BBCDD8BC8DEB09@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230303223056.966286-1-richard.henderson@linaro.org>
In-Reply-To: <20230303223056.966286-1-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB6758:EE_
x-ms-office365-filtering-correlation-id: 9b6ecafa-8f30-4b1a-13e3-08db1c474d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W+JHVYjrX+RMXqaLPVhGShbxXgxasUdbD1m9wRU4a8kITm3pI77u1/6nCZn1Pst9cGwktq1HU5HY51D7t6BITC0UJ6h+g5rTyUXd5XMBgdwTmwhNjOQL6Cg5Mp5Yq7sFmQXKzty4JX9pKH3p31zF5EdtGWv0X0zVYVw7cMoBLfP2yrSUlbt3eEdGvysA5bcv/YzHf+RetzHioHcmxfa/vhmtNEirEosxhZ8NkY4Eg07h8ZNtxNg7CEn3PMEb5tkhyYKuBYEvpa48A2XCA5/HJg3G8XA0CnUdC17VsTa+S3oSJEESW+CaFdsnr6nxv7qdfm4MYB6QGXa62LODoAid+D4IJ+Q93OQCGQJOOJWQgQK+63YbtEzFo7XkVhXg83RMRsg9i93f0VInlYtllNCjrT/xwFFhlyqWdRLCKJGQwFaanHspsJGx4c052C9AGkqrfsFzkyipKZdjtLo5UnJW/8+K4fen+HVDC5yEoeATZaw0iKMfmIHtVyBBf39DVxczgHzlbZ42VLhNE3WQiHLYUvBqrrnxp0PHcCi8dDdr6tujioiAaQQVg6XeRe4ia4UmbSDnJ6fj3W8YxV27t0ETD9MfQhTwTg7eysqG3S6UJypEQ5DwA8kR+3K79vXwvo42bmd45a7QGecI5XH6ulb2iN5p3ROfKIknlz/DQv+Ot+WooBmWmLRN1QDkpyaphRIu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199018)(64756008)(66556008)(4326008)(8676002)(66446008)(76116006)(66476007)(110136005)(83380400001)(316002)(41300700001)(8936002)(5660300002)(52536014)(66946007)(26005)(53546011)(9686003)(186003)(478600001)(966005)(71200400001)(7696005)(6506007)(55016003)(33656002)(2906002)(122000001)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tdjQkiDdaZs+nxMNRw5QvHNprlGTIHkmRNOEZhQb09IEgJzDTsXMNplzGPez?=
 =?us-ascii?Q?beOvQ3wU5L1uvUZLx9dDrNkwVzR+MZCrQmfV3GUijklcWJWwLhPTC/AYIMPK?=
 =?us-ascii?Q?7qzmk2y2qnYB5zx5O8pBsi/fOrSrt5g7oGC0QeNVf6ND/2LxG9GjzcLs/tkk?=
 =?us-ascii?Q?acTD5xD9yMNHS9wGyXS+ICcih3yGjpmLJHr3tVkJAMcBtQH4hT+aMzPum3CU?=
 =?us-ascii?Q?nR8c7Kc6S9/ka5DrYJcHl2LuDFxp3AjqZEVIQOt4vcvzhpM/fZTDlRLESVFw?=
 =?us-ascii?Q?8vmvplOjH/nCy4sK2BI9TMfmqFP1srLBXkitLmDzQQt7W8s3CDnAOl4/+rXj?=
 =?us-ascii?Q?3v1PISSuN7GZ7HsyzEWlX+7dnsDuQAaXCbqmIQVBRPlsyVyp1gRSsYOGNDa2?=
 =?us-ascii?Q?KGIBjn3cV6uDKyl+8ePWRFt6o05i2SiQDomPFT8hzSHMiLUKxpS/FFh0MmpI?=
 =?us-ascii?Q?nE4ElLumBa2VBKB2PfpIQAsaf5xL24c+4sRiwZ+y7IP5+hO/bfn/DjSpoSGg?=
 =?us-ascii?Q?/deWZuz0ZhIeQ/fZ2E7+hxZAC/5P8ZryMV7U1XYDG2V9kv+p+g+uQlqoeRcL?=
 =?us-ascii?Q?r2LFQeaG/Jzcf/EoFdHuMRP1F4ntUWPg63rDofqHIn61l0NY7aa0htK2VGs8?=
 =?us-ascii?Q?49UE5pp3eH+M0a2Ew3WNaV+jOpI0MMJPvtmHsh5xeWsjXoQnQSjo1MGOUlb6?=
 =?us-ascii?Q?xq/K4xZNcz0FqGQ82ryJrI9dThsYkPv2Iefg2VwDu3rXUaMlczbBxZs5ES62?=
 =?us-ascii?Q?xRxzSKta80vS4aCVY+PxwiuOMCy79qJtyM9XyNVrw4r3uz81i86zpKcrje+y?=
 =?us-ascii?Q?tjg8o6r80cJ2QxPMQgBp1CcQjLVEI6awdVmjhQc1ySuLHjgGy/vV/CeSmNyu?=
 =?us-ascii?Q?bOXFeWCzvNpRk0N9jy3A1loGoSmAcM0GyxCdoY3YdcKYl5I9I+JvDKL54Ial?=
 =?us-ascii?Q?zQk3NjQG714d5NqifU/aE7j3jCnvIcnFv/pPmupRzllhbqwGE2LsJMTYQz5C?=
 =?us-ascii?Q?Sa07ByeyAYs17iVNYfAu65Ll0XtpfXdJEwYAOB7dSfEcbDd4vFEjBsF3taI6?=
 =?us-ascii?Q?eERJy6m463CTHWnD8xGE2StalcCJc11VBNhDSB1ivEf58JcFh7MqEcnrvMbl?=
 =?us-ascii?Q?ap5xu7E7Xf3JBJOPHdCIlQq+KUII2mD1XRNMizVHq8z1Wfexsx73spOSfTk+?=
 =?us-ascii?Q?u9w0dz3MjTVTvNoLGrJLFpWkAi4ooTOuAdXjyRGSFzH+1Jqqmu13FUU8VGeH?=
 =?us-ascii?Q?MX9TKZDsRzwfF5lnmVRX6DEhBmhHsbm9YdUI0owRs9MA6cdgpDhjG1NN8U+1?=
 =?us-ascii?Q?ob5Npl0R3n3R9hTs4M37RVl0Qe3t+mLVDonTMzEfJanGlAWefnURE0rkYNyv?=
 =?us-ascii?Q?4MLcUtc8ijl2ANNny4gk/CL36XETlSj3OgWbwjv6/2v3P2hcGcWff8F5OQTm?=
 =?us-ascii?Q?nqwANpJ0buOLUvcjMkR4oGJ1cQG/4+C2UZSES6YTu2looDNfQJwPH86d0jia?=
 =?us-ascii?Q?dlDumSQdFz8KvNs+44R10RBiFCBTXsCIM+xSDEJqiIxp9cGvLBKZLL0a+68s?=
 =?us-ascii?Q?u/tdMlD2D1UL72t8nKfVQQ6qejHxCqaD9U95We72?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QfpvHf6Bo2RWeGITgqRHaiNQXzbojw6IrydS8+6+H+4FZ6Uapq5442WOqxilxWgIEUibOC1gu24xqIt48WGp8YATqojAumazKRHvrYhYzaVhu9k+whEAPKrGN14EDSZj2d90jb/Xcpa2+fNKVWI6tqfq3QJYzG77A0mUO8lukDxm/LmeGgsUUKWX1Ir19/X/P2rGiay9zME6GMmsZG8YSCRe7hZFr7jJVCLnz4+B4lCrGRE2zwHWQvpD5m2KrnhHtUkksp59cJKPV7Q7HP6WxUPOs/v8yHL0kATD1iELj5d3lNXhaAzIDNV4ecuWTB+r5h0mC7wBlqDfcqCsDUJxxI3q7+iOfpzUjvJ77cQGJObp+WlkhbCmpYta9vzFOOtcSDuDqszPE3fxBGUcyKkjzDCsNWmA8Wv3lGHrG8NsmFrBbhrMbYL1tX00dAI/fIsUJ2PK7dRnMBojz48q1uXqLBT3uQKZoB1MiWsfpFDEp1fUaSIJBi+2dITmfNZkcMSITyz4puooy3O597Vu0NbL0LEnW9EqqfXyXtJBDFTJoF96mUFOtQ07wcFVuU5g+xRwZJIgl5FoZivdxgB0LHW2UlFba1YBifW2P5YUibVan1xeKQggzsqFWaWWrN9gYNAkK7gPgap35mX9ZBcu7SSWB3TqgjVLEFwpkCyIcbAKLUHl5NeiE6Gkh197R/N5HkV9fbIkgE9S+UJAe8Zx2ReZOJVH1F+9m3UY/eioH0zUFTtqnmPBrxKI/Houhji2toVi6ap2Hu0+rIGEKQDgNFbF06T0kunFaJ3nJqWIePkZqilSCGDGrNHFmzv63mfqFUzR
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6ecafa-8f30-4b1a-13e3-08db1c474d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2023 00:27:57.2878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zPqBuA1xAwRaTOl0tQBUy5LY5uxBnlufIAdfDGAYG+gPeHf7OsDJwScJqm7N1bOEaW3uHSyb8NLG6/RWz5l2eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6758
X-Proofpoint-GUID: X87mD0oO3LpjfO3UNFReXywQxH18fXC_
X-Proofpoint-ORIG-GUID: X87mD0oO3LpjfO3UNFReXywQxH18fXC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_07,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303040000
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
> Sent: Friday, March 3, 2023 3:31 PM
> To: qemu-devel@nongnu.org
> Cc: anjo@rev.ng; Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH 0/2] tcg: Merge two sequential labels
>=20
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
>=20
> Supercedes: 20230301142221.24495-1-anjo@rev.ng
> ("[PATCH] tcg: `reachable_code_pass()` remove empty else-branch")
>=20
> Anton has probably seen this already but his patch now has conflicts with
> master.  Rather than a while loop looking back across labels, let's fold =
all
> adjacent labels into a single label, at which point the current branch-to=
-next
> optimization works as is.
>=20
> Perhaps I missed it, but I didn't see how to reproduce the issue being
> resolved by the hexagon front end?  So I haven't this trigger, but it pas=
ses
> the testsuite.  :-)
>=20
>=20
> r~

Hi Richard,

Thanks!!

You need this series of patches to see this pattern from Hexagon
https://patchew.org/QEMU/20230131225647.25274-1-tsimpson@quicinc.com/

I have an update to that series for your tcg_temp_local_* series, but I'm w=
ondering if I should wait for your tcg_temp_free patches to land first.  Pl=
ease advise.

Anyway, I tested your patch, and can see the optimization happening.  Here =
is the input code and unoptimized TCG:

----------------
IN:=20
0x00400094:  0xf900c102	{	if (P0) R2 =3D and(R0,R1) }

OP:
 ld_i32 loc0,env,$0xfffffffffffffff0
 brcond_i32 loc0,$0x0,lt,$L0

 ---- 00400094
 and_i32 loc2,p0,$0x1
 brcond_i32 loc2,$0x0,eq,$L1
 and_i32 loc4,r0,r1
 mov_i32 r2,loc4
 br $L2
 set_label $L1
 set_label $L2
 add_i32 pkt_cnt,pkt_cnt,$0x1
 add_i32 insn_cnt,insn_cnt,$0x1
 mov_i32 pc,$0x400098
 exit_tb $0x0
 set_label $L0
 exit_tb $0x7fea80000043


Here is the optimized TCG after your patches.  The two labels have been mer=
ged, and the unnecessary branch has been removed.

OP after optimization and liveness analysis:
 ld_i32 tmp0,env,$0xfffffffffffffff0      dead: 1  pref=3D0xffff
 brcond_i32 tmp0,$0x0,lt,$L0              dead: 0

 ---- 00400094                        =20
 and_i32 tmp2,p0,$0x1                     dead: 1 2  pref=3D0xffff
 brcond_i32 tmp2,$0x0,eq,$L2              dead: 0 1
 and_i32 tmp4,r0,r1                       dead: 1 2  pref=3D0xffff
 mov_i32 r2,tmp4                          sync: 0  dead: 0 1  pref=3D0xffff
 set_label $L2                         =20
 add_i32 pkt_cnt,pkt_cnt,$0x1             sync: 0  dead: 0 1  pref=3D0xffff
 add_i32 insn_cnt,insn_cnt,$0x1           sync: 0  dead: 0 1 2  pref=3D0xff=
ff
 mov_i32 pc,$0x400098                     sync: 0  dead: 0 1  pref=3D0xffff
 exit_tb $0x0                          =20
 set_label $L0                         =20
 exit_tb $0x7fea80000043


Tested-by: Taylor Simpson <tsimpson@quicinc.com>

