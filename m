Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3D65F2AA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:29:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTkr-0003qw-18; Thu, 05 Jan 2023 12:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pDTki-0003nw-2U
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:10:04 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pDTkf-0007NV-8v
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:10:02 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305GVcQE031285; Thu, 5 Jan 2023 17:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=TfxrUzmFag0CUFHYWspqfwr5lvM6Qq+cOudS2bGvQvA=;
 b=L6sgJJLHqN0sJU01mBzFc8fx2/Boh06hCFQPjzzDWOtNNG260+ODPhoXvIgcn4XMW9SX
 sy3e2DtFj0HbJx53xDeMjNcZClnwu7xHRIRBb78vvx9TbcB01AbbpsLF5odlwKqBoPZr
 OF+myRJ/F6XBiTslXrBKyuOu9SaTDUfWiF/R/mTJVlQS9d4sLaj/nY8NN8O9OHxEKmAZ
 KyLSfuVgHY6tBtVmbhX1yT2KSIddKddOoO/i/F2dxNAaz/u0WQ1zwEz061uIfrvDFYxo
 kyJFqNcrO5LpvRfRij1COXjvgeupkocJiARwrdeD+gd8zfBxU9ITJo8SvY5VFCxp8z6W KA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwu4vrvdg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 17:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGng80g+HwH6EoYpd5+6LtOKNn4e7fhgEDqhqIOY6vQUjiPrb7iJUnuTDJjxnD4D5BRDNcD0zrO7gUM0nutXrVdFXZWPnZaVQnqB4sIH+Lce62xtBJXYRnfhV5KcII8+sMWKdNUTJna5J1D51e7T8yvT7GuHxelnqBr1aDsDIWFwew5QyouVzOnXWr94iTPelPZ+9Ujdcqfj0//noYoKha+Cr2PCdwaeO0YaRa0X/VlpP1UEIpnERZzJmlRkCc709SYrkbVkuZksZI0JEp8hqMCHGrXP4acYq2izGmMTBWsvcY9h/31SXfyK+CmoxwvQ7YLc5b0sbAAwGdh+65EjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfxrUzmFag0CUFHYWspqfwr5lvM6Qq+cOudS2bGvQvA=;
 b=fxNwaabLm26WjpxuQCi/yhXnsWabQUqRaCsUK7tCG5JnmwgRJib4FfLRVzmglk/6DlL1u9cyAx/dUoRawxe66yeGS1MkzWpuPQmfsd2UAZNkisQlruS0wXop89i1BVH/yXqpUxUFyBo2IbQ2D8bhmHpJWgk7i+bVD0BEBR9u1logJDTjvHGWKqwsjpWpnqEHP26dUqnB69KU3VsJNRbBL0LRuzA/h0FHtP9q4NLuXSXKrqsGoQpbytJMKpnkDzY6ysu5SmgLv8kov2pN17LWrAIvHIbNvj2C/9cHw7pLIdV+xxag5wlb286EAavuTN0/RjhAJAp9BZSiF6Tw2zTICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by CH2PR02MB6598.namprd02.prod.outlook.com (2603:10b6:610:a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:09:55 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ee73:33f1:8e40:ce2e]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ee73:33f1:8e40:ce2e%7]) with mapi id 15.20.5944.018; Thu, 5 Jan 2023
 17:09:55 +0000
From: Brian Cain <bcain@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, "Matheus Bernardino
 (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] linux-test.c: Remove unused but set variable
Thread-Topic: [PATCH] linux-test.c: Remove unused but set variable
Thread-Index: AQHZISIaJvyeQLf7FkKoaVe5vNQ13K6QDqTg
Date: Thu, 5 Jan 2023 17:09:55 +0000
Message-ID: <SN6PR02MB4205CB5F2BD8969E399A088AB8FA9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20230105162348.16725-1-tsimpson@quicinc.com>
In-Reply-To: <20230105162348.16725-1-tsimpson@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|CH2PR02MB6598:EE_
x-ms-office365-filtering-correlation-id: 629c3264-ded8-4310-3cd2-08daef3faabb
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tUMlaqTxt6vcaP1BGqseMFwR4hH/cvKrjcTQMTpZF9cAGMDd8ERvd4Rk2nZHqHoH9fqt0grNB2Ahrf1WJUHT2HFY58MM97lzDxsNaY/f6FN6dCL8YVB9iEwLEkcAv6267zL75PDcd8SxCUe9FhSYFpouCD7nePFH3m/TRZzZ8z5qzMeBsfT8ll5TEltHxAdxFfsabAzUcCuU1JBbEW0QxmAXqn0sSqAGtnZNb05QTVccYSk5PCFwc3bUQFDXQxIWrzo+aZCGjjPcNeUho287e3EjfZpJ3ZH4bZOwUMy/1rSu8WoVG+CARXTygQ1ssSvpevfGaJ07VezcaxMFF1ZfUk217RvWt8vgI5P0Xlfgi1z+wjLczeyVn353Rte/mCkJb+ghRNhCSvsp65pzOqKs5vg4hJk0f95ILed5addkO8UNazocIr8rHdJlTJa6GXyQYlZ44VCe+2drnW4Po7FdUNkuxzSOgaVbw4rZAKX0tBx5dijRksC0O5LQiWKgFehWKkK49GYDTcbjOjHPE0qD9u3IPohQdOlbt0y26F65uxlNQ1b1NNDIT68KTismAqZjoo5q+AA+as2pOjIVncSLbTc4BHFXQu8tTWpBUNfo067dWvfEqiaANhpVvrLRgJbnwLsV2t5kigJVqr9wcIbxX+V0ODHshB6tCeFIyn6dY6yvq+jGkkvX43hpiCo1xwN79HnkM/BNU1aIoemc7jawy4s/eYJmc+xlmsI17NnlVRc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(52536014)(71200400001)(107886003)(9686003)(186003)(26005)(8936002)(55016003)(83380400001)(478600001)(53546011)(7696005)(6506007)(966005)(66556008)(54906003)(316002)(33656002)(66946007)(8676002)(66446008)(76116006)(64756008)(66476007)(4326008)(38070700005)(41300700001)(5660300002)(110136005)(38100700002)(4744005)(122000001)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QURxK0hOeGN0dFE2Zy9TVXNjbXlMMXdjclRIY1RQNlV6MGtLMDM2TUtXcmdH?=
 =?utf-8?B?dkVDaFc5QmdpalVRRmZLSVBwL0Q0Q2w0eDA0WGphaWZQUi9yNHQ4eWVTYlpN?=
 =?utf-8?B?N3lzZXBzdUd0dmxSUE9nZ0prN1dRQ3lrdlFKa3AwWGhtLzdyL2R4RGg3OFR1?=
 =?utf-8?B?c0dMZnlOeGtTNVQ1aDY4aUx6cEw0N0NCYlk2TXBPdHhkazJxV0RHYjBYbk9h?=
 =?utf-8?B?aWpjNzUraENSTmpNY1pMSkV1VjFiUHNjK2hyNmlGd0QxRkVIeGpWRVpDajlK?=
 =?utf-8?B?UWRtc1JuYjNOb2NaSVdVelp6dUlHeDFoV25WcDFrNThmckc5bmgrQW9WOWNt?=
 =?utf-8?B?QWt5Yy9rN0ZRWHVlSEZhS243RGVNRTUrVGxtL2dWb2U2RWpRazUya3c4WWxC?=
 =?utf-8?B?bml0cmppNjdrWWRoUGxDS3JGeXYzQkhab2V5R3B0S281a05PU1FTNnFqVjhi?=
 =?utf-8?B?RHlSZ1YwVFY1bG02RVowaWsxU2VSRUkrMFVmU2VWRDdQYXFJTWdqdWpiVktJ?=
 =?utf-8?B?dUpyK0dJdlNoTitLcE8zRVRlOXc1T0NkTmIzZS9WelVnTXVqNytBVFFUMm84?=
 =?utf-8?B?cjYxb2NpUmp6VlhPWE9FOW1jZjF3ZzErcTlBVWhNVHZPemJwdGJoU0xKdDc0?=
 =?utf-8?B?TFpGVCtHQnE1STJLem5xbWs3TEV1bnZmOGxBUlk0Zm95Y0c5T24xeEc5WVJD?=
 =?utf-8?B?cWpLalVJYStyemtzUHkwR040Qm5teXRYN0tVUW9TVzhyek9UbTdRejg3NS9O?=
 =?utf-8?B?ZXVmL21yWjI1a0xPSE5yM3RYc3BEMUFyUU9KdDdHcUNTVHhUNHZzZy9YV296?=
 =?utf-8?B?djNTOTdieUNFc1h6ZUxGd3Z4REF5NFBLWDM1M3lPWG1EbUo2dHJJREJTQzJ2?=
 =?utf-8?B?ZUgwSWoxTVVpMDBWSXprSkVSazFqRW4zZnpFcFp2b3JmeWpEdGx5Q3piV2J4?=
 =?utf-8?B?QUxwTWZRZHlKN1A3NFo2TnIwMHkxOHJOQTFFTTZkd2RoYlhXL3RUNGs5K01X?=
 =?utf-8?B?Z0ZBYUxoTVZYaEgvZlEvc2d4ZFVEWDZqRW9QRDRtMzN4WUpDSmp4Q2xGT3dZ?=
 =?utf-8?B?dm8rbTlLUjVtNHdXWEFreUUvVSt3OXZTZVBMTVBFakVNZ1FWTlJiRTZLSlpl?=
 =?utf-8?B?MFVMUDh1aW4zWWplVjlvcW9tM1RENWpoa3N2Kzgza3Q2V0pOTGU2TTBtbkU1?=
 =?utf-8?B?a0grRnJPZlh5WU1JQVlzOVkydHFlek8rcGMzTFp1SldvNkN1ZFpETU9UNWt3?=
 =?utf-8?B?a1h3ZyttcnRlT0JXcS9MNjRMMVc4R3EyejV4d1BpTEVqeTZlNE9NR2lBWWtn?=
 =?utf-8?B?STV4U2c2SjVEK3pvWWJxdUt4c01hVTlGbXN0ZDl4Sm5nalV2NWo1TkhYeGNI?=
 =?utf-8?B?VWY3NFgreHNWTVZTMjdVdzA0ZmhZOU1UZUhocVZJaDQzMlBQYU9LN3B4N05j?=
 =?utf-8?B?U05kZThVcmJMblcvMUJNVk5KYS85cUVTQ1JMcEVQVm1HZEVIZmkyVm9IRU9a?=
 =?utf-8?B?ais5S1EvU2ZQOU1ZaFpLN3Y1OUIzRysxRzlKaTFVM0dnN25yTlovcGNsM1NE?=
 =?utf-8?B?UzZsanYrV1YvVEN5YWpxaWtueExWWUtDa011L0x5N0o4Q2lYeSszdkpyWFhL?=
 =?utf-8?B?WmFtS2FadGhJR3BsUHc3VGF2dHVuTGxSMElwWHF2S21DRFNkdEl2NGpoZWZY?=
 =?utf-8?B?L3pKUnIxOWluMm9IV2Jjc2ttUGR0RDBHMERpd0hDeWJva25NZmxnYVZiUUQy?=
 =?utf-8?B?aEFNcnNvdDBSa29Zc3R0SEVYbG5MbzVIRHFSYm90VFNUM0ZDTmlFQ3ZMVjU3?=
 =?utf-8?B?RkMyVE1yVGwwVllza0NDUG5VQlZtUHAzMXN6emtlMGFISmMvVFR3ZUgydjJm?=
 =?utf-8?B?RmxoVXNuRHBRd3U0TGorUzBHeWR2alVJNjZEakNIcCtxTHVoR0NvUnJtNGpB?=
 =?utf-8?B?eHVXVktHUTZCdGFGWmp5dzZXcGc3ZkdleFNkenpUQms0RFc0dmNlZlhtUnN0?=
 =?utf-8?B?akNyaWRUcytFSWc2c0syQzNkVGVRMVcrcU90SUgyOXByb3VWa1hERVJFZloz?=
 =?utf-8?B?Slp2T1dJQWw4TTc5OTRFOCs4cmJPSHg0eWYxZTJpZDhxK25SOU1QKzkyWHM0?=
 =?utf-8?Q?HM2GfQfeyCxAt53+6ulM9vLWO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nPigft+HxLKhTf44gGGz0m8SvoMyA8T3bfv/B4/9r0ZS4orF+klALu5m+dNPDv0p7KC+8pPVpJO5llbq3ybY99HQxc1n8mIJK0Sa+9ysI0VQj1xCjbzXgtBtwprCqnYffu3UPuFmeEGs7PRXd2UB4OCBu4dhOwfYg7daSqDMXn/KcOlWJwFf2yCK+RHS0QuvPc11Sa88E3jj5PSNC3Rdgia9gFCRIxtJ5EAEp9Ic/zrwEsYX7ncU/NHOo8xQ43NWY/q8MG4xpZxWLwz6rmv/XpjJCRHJgQ2qoVdUXOJEadH3lBNevZtZ7CiC4eBQnhN/QO5VcDxhJEeXRkMYOSU8u9Ir3jU6cLkLRr404iTVD8ci2doHpEqMLgUf9amXoUIG/XS88Q90f5dfUi9wrZ+av0GazgO8uix8S6fD5jaWd7N5s7OG7MTqt1eiK3QmrPr+FR5Ch3iym9Bng8GRlo9unJBhF3GPE4Uayeb4VuMoCsfORnZEDXSVUSFRsvXknkjsy5sfe8/Jd7MDeOUOAyx6ZU+PfCBdwkIcJQ2aAXWTP9aThCqOU9KAH7o2j+OlJ4ywX1lReolqI/jGEaU6tYWedr/VpvvD1/3d8x2wJgmG2S6N37rGDp2o6Ls0K9T7HmQc5Y/x1v3xRUCzByFXQG1FrJG4X9tKV50ZooIghnEyKu4Tbq7Pop1UkRH0XmJbmoFF1r5nxfk+PusHzFokX1F4+s6O5n37P/TsF6XvyJ2WK3X0XB90KKiIBZ5PFl3U6i12bWb3PCoC+0+LSndEOpxCVRJWVAB4UgixNDJAaaTiEGFFE0muomG6cNTY0u1R7qCjOrmJTVj8rVt+quHp5lJbCLYtFA+Mv9swpR7Je+267vs=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629c3264-ded8-4310-3cd2-08daef3faabb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 17:09:55.2097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwWAVZyNLjCjULxz1nfz48sgrkV2Rx7ae5w8/eqcCywVuVqXFyZahAsWqzafGpFjNeWlsmlpZpXetkb2+Z9HAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6598
X-Proofpoint-GUID: FlRMFc7bti_5wZq240WTGFmOSPGn0DUr
X-Proofpoint-ORIG-GUID: FlRMFc7bti_5wZq240WTGFmOSPGn0DUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=601 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050135
Received-SPF: pass client-ip=205.220.180.131; envelope-from=bcain@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDUsIDIwMjMgMTA6
MjQgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgYWxleC5iZW5uZWVAbGluYXJvLm9y
Zw0KPiBDYzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGFsZUByZXYubmc7IGFu
am9AcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVy
bmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6
IFtQQVRDSF0gbGludXgtdGVzdC5jOiBSZW1vdmUgdW51c2VkIGJ1dCBzZXQgdmFyaWFibGUNCj4g
DQo+IFNvbWUgdmVyc2lvbnMgb2YgY2xhbmcgd2lsbCB3YXJuIG9uIHRoaXMgd2l0aCAtV2FsbA0K
PiBUaGVuLCBpdCB3aWxsIGJlIGFuIGVycm9yIHdpdGggLVdlcnJvcg0KDQpUaGlzIGNoYW5nZSBs
YW5kZWQgd2l0aCA5ODA0ZGNkMjcxOWE0NGQ5MDk4MmU2MWQ0NjYyMTNlNTIyYzg1NGVmDQoNCmh0
dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvY29tbWl0Lzk4MDRkY2QyNzE5YTQ0ZDkwOTgyZTYx
ZDQ2NjIxM2U1MjJjODU0ZWYNCg==

