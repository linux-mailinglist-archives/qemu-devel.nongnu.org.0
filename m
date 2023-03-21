Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF0C6C3911
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 19:20:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pegb5-0000of-Rj; Tue, 21 Mar 2023 14:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1pegb3-0000oH-L2
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:20:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1pegb1-0001aJ-HM
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:20:33 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LID546025870; Tue, 21 Mar 2023 18:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=FVBSpbHrIuVRV5e+wxzFZQf6brpM/F6gYv5mPSRoZwM=;
 b=JWznyxQ2Vws+i33W2rSezga13U4Nr0WzeSEuVNzyqMDixtSZj56bHm4GMUwbqgqn/IX+
 cLRiymOmMjPKerMl66882cuVLRirLY/gy++chiScJQ5tJRO4qQWncN8v1eHqG3Do3X1L
 npgbADcT4yk8RjeCX625o8VxV6nzOO9ihhv89IxySvMx3mw62LbJVooR7oMeHXnoWBP1
 Fb+t1h4BN9s4Df554WgA00/3QxULaDIcbg9Fy5PC7D6ybZm38jd9FKIbX0onQTxkO54L
 wPgq/saUzBnwSZm7vcguPL5PpRusVWED1egXSscdhePV76rz+0DkN8FmMaehZoLZ3xTx Ew== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfhntg0mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 18:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=il7sON9t47T60VptcDnx0TdYYnrlLsgXGXkzX4m9YoZjyY/QRoFf4wQA+ndPiF8bpyq3CQ5pmT685OzTgGWA7wP8DeNkhIGZwQGHefXj8Hk0s+d0Eryn1WYAQlxq1BQ+8+9zVBVXCTCtdcsx1vhIw6PuESfK5H5ptjuM+5FUoUX4QG4SQjgaM37ZJXyw/Cb751qorXsCURBbul8tFAjOxaOOmzGu8y/i88rtO/8/hqKTzJBuiwGoTvwrav2DgIrZm+0qbUFoiIlJXV2TXAOpIa0MyYS5DWuHWZgFaOcX74jfQczWcFc0h1EUxqIW8YypEzC02a/Hf/H+applzN/bWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVBSpbHrIuVRV5e+wxzFZQf6brpM/F6gYv5mPSRoZwM=;
 b=Y+WURFGZEdMRD0vnvOLj3Qw0+/zVskWIP63KCfh8xGcXCuVi7oa853G3mCl7hY2ztZGm1GQc1lgbCyyTDraIs9afrbPgZm6b+aYLyamQ8bZJaz22I9HQoS5XQ8ns7f6hltGDj6IotfI6cyVLGEpLponNpyff43plpb9Q4OUzwOolbpS/3Ujgqa3N08JTSQtX0Euv0U3Co0hJ8mJoOqdnlaH0W0MSkCYiP7WoWiNUhFHTBOugvSEEk/rB/+fljc+goJHsKo06h4+v7K0p1KPWGkRnRDjIojhqO+/mXDA/Gtd5F9GhQ2DDH9PotQMJ/TFxFZMxu39M7rZ4YNQ2Z3XUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com (2603:10b6:a03:320::8)
 by CO6PR02MB7633.namprd02.prod.outlook.com (2603:10b6:303:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 18:20:23 +0000
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::ef96:606b:562f:8913]) by SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::ef96:606b:562f:8913%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 18:20:23 +0000
From: Marco Liebel <mliebel@qti.qualcomm.com>
To: Peter Maydell <peter.maydell@linaro.org>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Taylor Simpson
 <tsimpson@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH 2/2] Add test for storing .new vector
Thread-Topic: [PATCH 2/2] Add test for storing .new vector
Thread-Index: AQHZW/8z4zF99UNlhUuSCpBiFgOmaq8FeqiAgAAQpHA=
Date: Tue, 21 Mar 2023 18:20:22 +0000
Message-ID: <SJ0PR02MB764754C0676E203D21E3244E94819@SJ0PR02MB7647.namprd02.prod.outlook.com>
References: <20230321141206.751719-1-quic_mliebel@quicinc.com>
 <20230321141206.751719-3-quic_mliebel@quicinc.com>
 <CAFEAcA8mt=iisDOMz716FuG-Nu2WUWeEskyk6QLL8tsntc6i7g@mail.gmail.com>
In-Reply-To: <CAFEAcA8mt=iisDOMz716FuG-Nu2WUWeEskyk6QLL8tsntc6i7g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR02MB7647:EE_|CO6PR02MB7633:EE_
x-ms-office365-filtering-correlation-id: 0688633b-8a45-4236-f1f0-08db2a38ef93
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n4cpPP/1psKUNUAZ98ApbhceLFEP5yYK3VAaWPXBkXj/JmITYiFUYF8t+J2uH7EGhV9KA/RUJ5CRbY+jP85VUD598Kr9/eu8SBJLr/S1kFDNDmytOQjGRB+HmI7qBKkv4irD99BKgv1f8t6pIO2qohAvfSXOdnGfc8nBjJksi8g9NWQpvqMASdBRy3P5oykshsdsyHgw5Xj0O9v5VlNNyn+x//TYqUI7skAPPgPxUlN6ks6tBI0PYZJvmeSzKj4ppOiCfxAiOosso8sDxJ/NSTpFKp8NY20azm29nRY06ru07QfmMlT+xv1ZMsRIajyh04Pk8koMfp6QrXOVWZj83t9be5ucC4gz4ONaFt7fKVNzwHtiA2uSyAMO38mBW31aQIwWIFKLiezx56TTVVXQJsMOiOwdsyEpuC5PlcQgyus6jZxSoT1OfZv0q2iwbsoU/kH3l4GOTY0WmQrTyyxhoPQu9OlsBSzeSG06fDzOPtMMsE6LbL0IrCANTy7Vfn/iZGGunkfyevIiHzyoM2AppoTOyuP0Svabgv9i37bU8UK6p8cSvmuOtCV4joGCoyijcBLCBaiEPRkFFDnzw3Ul7nfY0DmhEjVcXIpveCkXVZ/FKGW7IuDeie1pJzpXszZu7yLcCLTANVd2QUFaaXRGu2wqrg3Io8e14ypByYabMoWxdiqCWeDuESbGXsSb78D2z1JOcZVq1OJYD8Z+SdF9reyTK31JyVybhrbJEV6sW1o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7647.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(66574015)(7696005)(83380400001)(54906003)(71200400001)(86362001)(38070700005)(55016003)(38100700002)(122000001)(110136005)(8936002)(64756008)(66476007)(4326008)(66556008)(66446008)(8676002)(2906002)(66946007)(52536014)(76116006)(41300700001)(5660300002)(9686003)(107886003)(6506007)(53546011)(33656002)(26005)(316002)(478600001)(186003)(142923001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2NrM2M0eVc2SUVFWklQUGJBYTZOMm5OZzUzOGFiYkJDMXRJcXM4cDgvMmNy?=
 =?utf-8?B?blFzM0tVR0xDVHNuS0Q1aGd5cEFSNkdiR0pIQmVjSGVzSm56SGUrWUlOaFZR?=
 =?utf-8?B?S2JXWDd3NStYTmlYOU4wK1RLOHh0RWlnYnN2cFN2SEhRQWFzNjdQRkhqTzF0?=
 =?utf-8?B?QldyUEZ0YlFwRkhlVEh3U2NSYVV5SisrQVhFaDkzRkpENzF4R3hVeUdOcjYv?=
 =?utf-8?B?bXE3VFZPWm9kM2xqTURsZ1BqZGZjNVVLR29ZeW4vYTduY09NTmpQOVlVT3o3?=
 =?utf-8?B?RWRDaTI1aFlsTnJockxDcUorWHNTdUpxL25FRnVzNDY3c2xlVyt2azN4TFRi?=
 =?utf-8?B?aENrVmtCb0F6Z09UOVppdWRPeXEvZUVhRUYvYTJTK1l0RFhtQVY4Ujc0cFlB?=
 =?utf-8?B?TUoxQ29abFF2UUc2Q1lRa2ZSYjZQV09YYTV6YVBXbUNoWnphYVJ6enl2T2Vt?=
 =?utf-8?B?VE91N3ByNTRlbDFzcEt3bkdkNG1TWjAyZ0pLUGhTVXJSQm5Ldi9WMmpCenRO?=
 =?utf-8?B?VkNPY292aXkwSDlSQ3lLeHlSZjUxZnZuK2pBNk1BbmVWNStaVkZLOTJxZjZs?=
 =?utf-8?B?dXI0d044VGN5TlcxQ29KVlFzL013NENOZHhYUGx5RDV6UUhhVGxNWGxUOUx0?=
 =?utf-8?B?V1V3a0ExOUNXaHZmVzA1OHJaVm4wOTZjazlyNC9GTWRDdkhGZllIdDdsQk5l?=
 =?utf-8?B?WjE3clRVSWRTRU11Zk5DcUhjSHlSYjNEUkNQY0MxRXFWMytKNzh3N0x4UkVs?=
 =?utf-8?B?MTlucDZXa3RpKy9PMnVVVlRLeVhSZWhGRUQvLzBlZ2laQSszb2NLVUFiYmsv?=
 =?utf-8?B?MjVlU3AyOGZZajRpWHZJZG9KazJQWldIdkNUMVhpL0NTd0NGUzc0Z2RDR1Bo?=
 =?utf-8?B?SUxjN3IxTUpBdEN6MUlkVERIL1ppWXFESUFsL25VN2p3STZqZ2ZHL1V5aVM5?=
 =?utf-8?B?V0NEZXZrUWwxUmFLeXRWc0NvV1pTeVliL1g0VlU2K2lPZExkbmVsbnhBWUlv?=
 =?utf-8?B?bVJSeGNublVZNlJvd0lBdTByRTJwVFdVTVZVaDM5TjhBalAvSTNUYnhRbzNk?=
 =?utf-8?B?NzFCN3NldHlDS1pZQjM1T3BJcVZ0cDJYclJJaFVpRUFiUWh5NkZ5MXdOZGND?=
 =?utf-8?B?S0szY2QrZzVrQmo4SEwxY1p3aDUxZXNndDc2T055WERhYThSOWU5RHV4SEZr?=
 =?utf-8?B?VW1oSXZ3VWUweUR6RHAzQmN5MXd6VVYvUkpXWjA0b3BXTkY0SC9jYUF1ZE56?=
 =?utf-8?B?SnRDaEYwNlhYaEo1aW5aKzB3L2RZcHdhZTY1Mmd2VXd6YkFGMnlUYXRnaVZR?=
 =?utf-8?B?aWx1dEY3R3pHMEpqZUtVSkVZUFgvQnVBcXFPZkxpaWpqQzZZTDdqMGhFampo?=
 =?utf-8?B?NUwxNTlUUVBiL0hYUGdKcll2TGdGOHpYUXhuVzgwbHNuZjNjMVN3dVBuaS9u?=
 =?utf-8?B?TlpYNFFvUFNsMmhmVlRRZzJ0blo1SkhIL2FlSllnQU8rZmQ3K0J4RUNiMHFI?=
 =?utf-8?B?dTJKM3I4SnpCQyt4WlJKeXgySk53aHNDaXFpZ21aeS9aUUV4dnVWNXo0eFlT?=
 =?utf-8?B?ZUVQZlZCRTF2RThDWXFnUFh5cjQ1V1dhOGJyRlE3Um1zWTRvRWZuT25oazc0?=
 =?utf-8?B?VndYUCtFTkJ2V3BCd2JNWXhYNDlwOFhBdHRFaHJNR09BOGR0a081UGlBbG9K?=
 =?utf-8?B?UFh3WGU3U3pNa3VXUkE5eFRZNFg0Si9OS3lIVFRNdTFNaTJoRFluSzBPNEwx?=
 =?utf-8?B?RGZZTU5OOVVtcnJ4TG1LUys3L3dzTGdVaWdmNjZhdTczeFVQOGR5SEdkT1pu?=
 =?utf-8?B?emxyczhGQWhZRyt6L3NMNDMvVUNlS3FIcVdMcGxPVURkUG1FVFI0ZlBTRmRr?=
 =?utf-8?B?dmFoS1J6RGdGNGttRTA4ZGpicGowdWJMdnlLenkvVjJzS3NqeEQ4ZGJIN2ky?=
 =?utf-8?B?RFBFaWxSa1dMT2Z0emJBK21WSXE4T3h6WW9CYlQvb3F0UEN6V0dGMUpLaDI5?=
 =?utf-8?B?aHBSSk1VTWMvUU11ay9VU3NBTDdGQm9qNDEvYjlLRXlFeWgwRGF1NWYrOXNx?=
 =?utf-8?B?SWFMNzFBSW85dWF5R1FhSUNTam1qMmtuMm4vQ1Raa2t3RmV2U1Z6ZTVPbnlv?=
 =?utf-8?Q?0DRiAMyP1SBvlBjZPwIgV0FO6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5Bs6121HSfAdfmE5oEIjTkWD2FnS+y/0CAUG4/DIReY9zkgaIIc7SXPxK3HwCgGJhnjjUZJlC37v5juN7lSaMw8kHu/CWT6wzRCD69K2vcov0nN/z3Qo7HDAnj2vcJeDlR1y8JDGl/tDBL2ABGWgvJPGTTNuXaD2Z2KS7ngFSFzTvSNxU7JlsDu7ao3iA1Xa576Mtx2Q8gVfKHV+3+6Wx2zHN+8forqThr2wsFDcDCiEXMO4sy33CZd0SVcwLPPoMCLOfYGNEcgub09NQRYnzGL1EdDaJEITC29jEtdKS7ZigJf4NuOlH/1x2FUWY3lTLHJf4uRvEewYOfK4kdcFUQcxy7zz2CUEt9nH61s/qFYAB5thUB3tfpctLtB7QRCgmQPD9i64YOL1MtoqsCCPEgXCtzBY66LdiSOHIOJTXyrlW4T13/bT9MqVOgyl1bs61C1fR2Dp6rJMnyfAnMGmsJD0hpQe+8jz2RnR/PEBv8IM9Q7DLX9u39UP6F0Py2Er4cNLmv+qu/RGdU61b58G4Wwa8tOKVz4hwFN2Mlju00Qv7J3G0EtW+w7/OS+6SiLtgFusYMEgcHdMlkGY9iV/FNjHhhJbdqLnuA9Q5XTa6ETgFLE1MnohmbpKFk/IC8L83xod5yIjzFqKCTY1/NV8MFkDwuPahV2w2FQBg6lyLwfkq9wag98gmviihJoCuS+QhXL2xj7D4FE8PvIryiN92tzNXzoTGRdMoL6ZPjFDQycwfIhHuVCAwqWqYCHcS4Qt9hhBTehWZCG0NQkJA14JYDMTi464IvV7RBuXlichWmA=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7647.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0688633b-8a45-4236-f1f0-08db2a38ef93
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 18:20:22.8574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: INUI1jC9FaXxGek9uRWUbfYULNHu0M+MhoeJ+07+Bw5kIxLYu/UKgh9YFliObaNbSB0Y/4aXMN9sA9dc4ZWlqnmQqCHbxoMkJmdciE5wvTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7633
X-Proofpoint-GUID: aXxHyOCZ0CB7qIfHDMgaGi9OamwEPHBp
X-Proofpoint-ORIG-GUID: aXxHyOCZ0CB7qIfHDMgaGi9OamwEPHBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=566 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210146
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mliebel@qti.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6IERpZW5zdGFnLCAyMS4gTcOkcnogMjAyMyAx
ODoyMA0KPiBUbzogTWFyY28gTGllYmVsIChRVUlDKSA8cXVpY19tbGllYmVsQHF1aWNpbmMuY29t
Pg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+Ow0KPiBNYXRoZXVzIEJlcm5hcmRpbm8gKFFVSUMpIDxxdWljX21hdGhiZXJu
QHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gQWRkIHRlc3QgZm9yIHN0
b3JpbmcgLm5ldyB2ZWN0b3INCj4gDQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBm
cm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBv
ciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4gT24gVHVlLCAy
MSBNYXIgMjAyMyBhdCAxNDoxMywgTWFyY28gTGllYmVsIDxxdWljX21saWViZWxAcXVpY2luYy5j
b20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGV4YWdvbiB0b29sY2hhaW4gdmVyc2lvbiAxNi4wLjAg
Zml4ZXMgYSBidWcgd2hlcmUgdGhlIGVjb2Rpbmcgb2YNCj4gPiBzdG9yaW5nIGEgLm5ldyB2ZWN0
b3Igd2FzIGluY29ycmVjdC4gVGhpcyByZXN1bHRlZCBpbiBhbiBpbmNvcnJlY3QNCj4gPiB2YWx1
ZWQgYmVpbmcgc3RvcmVkLiBUaGUgdGVzdCBjaGVja3MgdGhhdCB0aGUgY29ycmVjdCB2YWx1ZSBp
cyB1c2VkLg0KPiANCj4gU28gaXMgdGhpcyBhIGNvbXBpbGVyL2Fzc2VtYmxlciBidWc/IERvIHdl
IG5lZWQgdG8gaGF2ZSB0ZXN0cw0KPiByZWxhdGluZyB0byB0aG9zZSBpbiBRRU1VJ3MgdGVzdCBz
dWl0ZSA/DQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQoNClRoZSBidWcgd2FzIGluIHRoZSBhc3Nl
bWJsZXIuIEZvciB0aGUgaW5zdHJ1Y3Rpb24gdGhhdCBkb2VzIHRoZSBzdG9yZSBvZiB0aGUNCi5u
ZXcgdmVjdG9yICh2bWVtKHIwKyMwKSA9IHYzLm5ldykgaXQgY3JlYXRlZCB0aGUgd3Jvbmcgb3V0
cHV0LiBTbyB0aGVyZQ0Kc2hvdWxkIGJlIG5vIG5lZWQgdG8gaGF2ZSBtb3JlIHRlc3RzLCBvdGhl
ciB0aGFuIHRoZSBvbmUgcHJvdmlkZWQgYnkgdGhpcw0KcGF0Y2guDQoNCk1hcmNvDQo=

