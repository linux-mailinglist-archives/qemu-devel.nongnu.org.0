Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7466B6A8816
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmyZ-0003Ix-DF; Thu, 02 Mar 2023 12:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pXmyX-0003H3-DU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:44:17 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pXmyV-00031H-H2
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:44:17 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322FFslv015335; Thu, 2 Mar 2023 17:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=KM/ImU3SDBRu/Oq7Xs6nMaYHjU3s6yzQAOL1i9mXQd8=;
 b=UzzxE746R3zOvgKKkE4BbdBuz1cdb5S2qAh+Yr6z3cXYiZjxX2DXIFtNzA9Vgo2P/Q3v
 KtHBZ2LGYXB6VnMDpwa+z/zRU1H94ujlyLyJUc1VO64j4e5QzdxNgfmM9wcmGluSq4/+
 tIGGUp8yZbGwTPPiR5IzFHm0fd5YB6JvLc3Ek10cgzFx8sa5pK3Mdz3KiTQW+lUyfoQl
 gBiIAvjHckvxO/EAUtxUYS7S8gOBJZPISqBhRfWWZ5bHMJdxrdWpouW1s/BFg5bKHAyF
 NFgo83S5mAnSy89YP7eAiIp1ZIaBt5jUHICssEu9eNyvoYlsRoOe+MvUFm/3VcYMopsO Lw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p25jwmbsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 17:44:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJUcA5jmanAWByCSplnMdRtFNT1jf8MsqvEdf7DTVxEl2E2fH/EidVViF4bmva2gddQOzFufprofA4BPYjMguytbnagY17ZqjEXekxhYaiOxLw8YIvvlxGZd5SeXgjgw9gyFwyuZCod6ewXnCI7k1SmT5FeKR3JCsOjOjFxOIkldukwJUyvudyb2Aa7d1uY32CsWGxhuRQtlJ/Mcgh8p7NcSQ9kgBpyRA+dhct5O6civ5cDSFoJ1/A7yCdBfLIPrl2NE6y7B4JKh8YNCP5msgQw/ZibtiwLqARUadujObfEOcV1J+pfCkpS6IEtKEuEaPZBP0e9dph6RLcSqXYQ67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM/ImU3SDBRu/Oq7Xs6nMaYHjU3s6yzQAOL1i9mXQd8=;
 b=Bg46VJhPin9nSFBXhnhIOjD780E7Xkwdo+32n4kfBWcezKyvFNZtJTOoXf8MtkJ8rHvEX345np0O2ljBLgHHKx6g+r1Gv1IrOL74Ziwe969zqg8SS+DyNPv0VCcftpODzG1fGYYmr/WZdNSDoVJdli1Ucy4BF3FZt5SHDJg2zT5QroTqnRm7cunacWu+QYQGf2fIzW7EalT7cWHPx5VqcIBlUpRZuPvyStToAazlpbFc4sPoNRmA/qvkl3BKPZJeZQP7gdvzUEXVWoRjr/ik7hOhNGyrHcFFrtMxGJBgri5VaCfFVHJRbFthmGQ6327B3eyhC6jNrUrU484MpiakQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL3PR02MB8066.namprd02.prod.outlook.com
 (2603:10b6:208:359::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Thu, 2 Mar
 2023 17:44:05 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 17:44:05 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alessandro Di Federico
 <ale@rev.ng>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [RFC] Reducing NEED_CPU_H usage
Thread-Topic: [RFC] Reducing NEED_CPU_H usage
Thread-Index: AQHZGtfAI5NLJkh3sU+jjadG5EKEa66YJasAgALZpoCAA9MhgIBJU/Hw
Date: Thu, 2 Mar 2023 17:44:05 +0000
Message-ID: <SN4PR0201MB880875238DB7B8A8FD531D74DEB29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221228171617.059750c3@orange>
 <ad150bbe-6a59-7b46-2e7b-bbc8441e118a@linaro.org>
 <20230112162821.21ae8d7a@orange>
 <e25db9ec-edb2-4dc1-6b7e-3969449f8a8c@linaro.org>
In-Reply-To: <e25db9ec-edb2-4dc1-6b7e-3969449f8a8c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BL3PR02MB8066:EE_
x-ms-office365-filtering-correlation-id: 94b0479a-9799-4250-a20b-08db1b45b7ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LyzM+RARGzvVvL2uJsaNp7aQF3WePh/3rz2ESx1iKssZcWur1+YTE3PZq3Clfd4dedNeOsGcMQE02OS3/UFSDvl4foKzxTRGAKJiOdgjQjAcQVGWSLkIXZpa5rCnF8Vvd+B706bNRE5SsDGMNFT2MmvyVxQLdox83MqNhRJKd5Xwd1/uEIyKzi6DUL4gK7atP9kJDlitqhjC85n7GgewE/0BqhdBZw5n86tPHc/gWll64QuHkLyp+CgK4zDRi6RWWIVX5sevRLIL5ACACEXhgBl3Yuk18oYbNOf5SBx+BQTw7xyYkf/K9E640OFM/p51sYgOQbtXrLx+I+WnPbnpfJLzrXBWq50a2Pibfe8faekBY2YPc3gLlK+fCzrPreamUzORL95Wu3iowIvnSzXXu/eaNFBzd3Obl6E8rMWXCuWI2k+L7v005IFpHi2bCcgCkK7+WMBqfei9RI8m9J2uoH9LWZBBX4tpQyb9FWtJkgLoKAv1Mk7I4Bu5OIr/gckG4fx1yqMiMIdYsWcD8stjsJkyOW+5TJaYU4x6LUdHI+bM695sLgeCiO2piMf/uBefj0lUCsQq8Yf48YqAx/evQ3E5PWBfbapwV9invBWXebaoGFUuP73+qO/S+rQPw9uUEZQHXanSPfe9Z49VxRwDWkf74nkClROnOK/lTj5ieYlPdoVENsdRmhOzTDDO8d1w
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199018)(66899018)(33656002)(86362001)(8936002)(66476007)(66946007)(66556008)(55016003)(2906002)(66446008)(5660300002)(41300700001)(64756008)(4744005)(122000001)(8676002)(38070700005)(4326008)(38100700002)(71200400001)(966005)(7696005)(52536014)(316002)(54906003)(110136005)(83380400001)(76116006)(186003)(26005)(66574015)(6506007)(478600001)(9686003)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K00zdlQ0U1hFNk4vdk0yTkpGRS9jOW9ZYnNNSmZHZ3FBQjlNTHZ4OTYzS3Ry?=
 =?utf-8?B?RDloZ1JBWmUyVzNDd0REUnBmQ0tQa09mZjIrZXZYNVpDVVgyOFBxVlZ2V0ZJ?=
 =?utf-8?B?a3JUVXFWTHUxeERIK0pFd2x1VU9TQjVQcURtS1FpOG1mTUFDYnExVU9ZaElL?=
 =?utf-8?B?TGFKMVhhNEU4TXpjZjBjSUZDcVczZ0RKbFZtVVIzZ2xhaTVLTFUxZzZHYTZ5?=
 =?utf-8?B?b3Bsek56RG93TTl4UlQ2VHdrTDQyVUlnTkJ4NE16Z0tKZ2E5V05iNGQ0WGJi?=
 =?utf-8?B?SElNd3dvQmFKQnpsVHhYRElNc1A4SHRJTHlueldXZXJiTDNJN0xZSTZOMzcw?=
 =?utf-8?B?NldPK21ONWRraGEvK0dTYUNZVkh5QzQ0L2RsQWlyaE9hNmQxVC9lQWhFVTEr?=
 =?utf-8?B?UHVwU05GN05YTFpuZFQ5Zzk3V1JzM3BIMEM1ZkprTzRNUWo3eW1MTnc3V1ZL?=
 =?utf-8?B?NUZlT05ac2hNVm0wUUU5aDlvbENhK2QvZHp3ZldkSVNPd2FaWFZUOFROc0ty?=
 =?utf-8?B?WEtyWk5sTzhNZzZxVmVIeGFheEVnQzFkdTVMQnZwbytYY0tSQ2plRVYxbXVB?=
 =?utf-8?B?d2RUZWFGMkI5NnNmTjRBdFZQc1dmQXBwVE9wM0pST0UybENMcjQ2eTg3d05X?=
 =?utf-8?B?eTlNOGFWM2hMTzVWWnczNDR5RGpaMDZnT1ZVajVLeEhjZ0FVWEFHS3gzVFg2?=
 =?utf-8?B?OHhzNE90ZHFZMU1IbTd5cnNkUkliZWRpSlRLb1RsODh0Zk96enpiOTRiS0pN?=
 =?utf-8?B?ZnU3b0x1S3Z5c0RiNlpUS0E3R2ovWVpTSkROYjdqUXpQa3A0M1BqcHluR1NI?=
 =?utf-8?B?UjBvZnQ4LzdmQXYycE1LaUhQWEM1MDdJcnBvUXplUU9HUmhJVGRpVkZrN04v?=
 =?utf-8?B?RUJZQWJScTFCcVQyL2c0TzlDWUZ3Z2UxMlltdzFwYk1qSll6ZVAralRSbXI5?=
 =?utf-8?B?YXZicGRDazcycG9ockN6eVVIcVhnWlBlQ3N2V2pvKzdSV2NzQ0JBSERtRzk1?=
 =?utf-8?B?MTFMcmFLMUdnMXJsNU05TFVrZDgxTDJTdnNlNm91YjRZbUpGcGVTUjJic2hE?=
 =?utf-8?B?VkVrT2RQNEUvVEhWNGhYL2lxV29nckdueUFCUG4zRVI3RmtLZEpVK3ZrekFH?=
 =?utf-8?B?TUlWZ0xQNjdQcnYyVWFMVDZhU3NhcWtIbkVjcDdOZTVsUmROME40ZlNWVUVz?=
 =?utf-8?B?RlhMTFJSUnc3MWhhVTA3emtYNXhxcGZGWHJvVXh2R05VakloMGhCZ2VWbUV2?=
 =?utf-8?B?OWRuRHNMQWNnc0s0TW1pTHFRRzhyOVFNVWpiVVpxdEJ5c29XWmsyUExHRTk4?=
 =?utf-8?B?bEFNUFhjZUhQQVFVWUZRWGpEWG5XZzB0VTNaSmtnbFN1b0IwdW1lTytHRHpv?=
 =?utf-8?B?YXU2WjVFL1RsQmxQYjVOaWtyamVUSUVtSk9OYURYNjNsS0lKVnNnUmh4OEFC?=
 =?utf-8?B?LytwbEFNQXZ4U01JSnVIQzF1TEpaQnRNeXducDVrKy9RdGNlTjNHbEM4MWtZ?=
 =?utf-8?B?SWVKMEI3Mjg5ek5JNkdPYk1WMFUyTmt5cGZsNGxmaXlMVEtMdzh4dGhGUU5L?=
 =?utf-8?B?Q3ArU2k2eExITHdJdmd5dlczeHZDdE5kUWd5U0lJdWsrM1k2WTBxdVdnSDNr?=
 =?utf-8?B?NDFzVExCWmZHazVUc21HUWxReWFEdVpWRHQ2TldOM0wzV05hTE1wbTdEeXl3?=
 =?utf-8?B?cjVXWHhLZjd4ckdkWlVoRlJaRHFSaUtkdlZ0VCtQVmhaeWtQZy9taVVrdWox?=
 =?utf-8?B?VTRqejh4a2N2aEx4WVh6NUkzQkJ2TzBYSmtlUFVoZEQ4NWNnbXhjTFp0SU0x?=
 =?utf-8?B?MGdBbC93cnVHMUFqejBJd0lKVVlTbFVPQmk0VnI5dmQxTjJVc0tPUXZoRkNl?=
 =?utf-8?B?RSs3NXZEWXdOcHdBMFc0dnpQekMrYndISUF6a3VpN0RGajhhZHNCWUdPSWNV?=
 =?utf-8?B?REdnVkhkTCtsRkNwUEY1Tjc3ejdqcnUvWjFZZ0VNZ3o4SWlpT0tSbjRKdXdM?=
 =?utf-8?B?RHk4VkpmWk5teEZld0M0OVY3TlhHSlBpQm9YOW9OQkRQSHRScWFsMnQwdGNq?=
 =?utf-8?B?cElGWW1pOHYrSUZ2REw4QVlqdjM3K3dDQU9ndnFUSWZ2MDNRYklldjVBVTdj?=
 =?utf-8?Q?yrvUiBsA9PEnNtNUfW80xcDGi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6S/k7mvQhw13H3soDXrZhuJxFQc8EiuWD+illJeskle6fB9+eA8Z2HDf3zwDaRRu+7Rk/HJrWcIKnRZO3ojnCuQd+TNmEEJGaNQTfqf0P3rrzaqtykzx4cmzK7/qIHRKms40fMCvnpZ22J/0WTm8BhGzaT1q+P0X9zPKxT5O1ltSltdJyqidzX0GH93A8xVvZY1ydbm2zb5h03f9IgE5daiHQTyX5yXQVbkcAaxvun0+adRKlfUb1UVKDYaf2Bd+Wl5Nn8Gcn/dQwXlKGhKEhdSLqZjoc+rQ7TwK0Brv64lUfB7YQuRraPKnLngS/p+xeAn2DOTCkDrWGISu/E5oGdSN6oD7NsGGbS4LGKAhTRtX6YmcT1AxYzraz5CAFlYd+pm5WDvSrZ62jwxYzgLPtxSbce/oHqw0nYnFqLYG4Ru3lriT7hS5soXrFa4yfdrJ6IoKKdhaQDmYoQNrX6xInPX/q2Ssrpk60WGaoXRVwN440IVEEPxpf85wx4uEF3xduIUwUWYQccd1Hv8hU6OL7aaQSxpfO7OavbVZQYSx3YGusXVCxjc/DZvCHzS+dpiGXB4At1ojPaW7PaagzCls+pKhSSi2gkQ5DG5D1ibg4s5GguO+eipQ563r17YhnnDtWWIFC7JAiTRJ4G6/sEGzTa0C8Wt5vU0rYrcEDo4pCAOCy11725pzAOXNP+yKb2ccaq8s2pmfB8sXYDmeL/YY6u7Q7ld0YwwHnFjcjnf15BZITjLmcgcqM7AHNqYmuzzPD15Iifl8gGJ3BN79IUIC+HygJSd/qHfKS0btmVII53b09w/tZG5gga3EEcQk16qG
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b0479a-9799-4250-a20b-08db1b45b7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 17:44:05.1204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YWZbKxS/VN79V0O0dGos6Krnk5NjwVawzL4TXfzfB+sWFKNussowIi+6d5k7VNVwUG7y6w2QxKjwue3ExZXcqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8066
X-Proofpoint-GUID: 3v1Y_yX29kgiwRun8W1crkjAY00jhXAY
X-Proofpoint-ORIG-GUID: 3v1Y_yX29kgiwRun8W1crkjAY00jhXAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_11,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=676 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020154
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBKYW51
YXJ5IDE0LCAyMDIzIDY6NTMgUE0NCj4gVG86IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFsZUBy
ZXYubmc+DQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IFRheWxvciBTaW1wc29uIDx0c2lt
cHNvbkBxdWljaW5jLmNvbT47DQo+IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4NCj4gU3ViamVjdDogUmU6IFtSRkNdIFJlZHVjaW5nIE5FRURfQ1BVX0ggdXNhZ2UNCj4gDQo+
IE9uIDEvMTIvMjMgMDU6MjgsIEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gd3JvdGU6DQo+ID4gICAg
ICBmcHUvc29mdGZsb2F0LmMNCj4gDQo+IFNvbWV0aGluZyBJIGhhcHBlbmVkIHRvIG5vdGljZSB3
aGlsZSBkb2luZyBvdGhlciB0cmlhZ2U6DQo+IA0KPiAgICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9x
ZW11LXByb2plY3QvcWVtdS8tL2lzc3Vlcy8xMzc1DQo+IA0KPiBUaGlzIGlzIGFuIHg4NiBwcm9i
bGVtIHRoYXQgY3VycmVudGx5IGhhcyBubyBzb2x1dGlvbiwgYnV0IG91Z2h0IHRvIGJlIHRyaXZp
YWwNCj4gd2l0aCB0aGUgY2hhbmdlcyB0byBzb2Z0ZmxvYXQgcmVxdWlyZWQgZm9yIHRoaXMgcHJv
amVjdC4NCg0KT25lIG90aGVyIHRoaW5nIHdlJ2xsIG5lZWQgdG8gZGVhbCB3aXRoIGlzIGNvbW1h
bmQtbGluZSBvcHRpb25zLiAgSW4gYSBoZXRlcm9nZW5lb3VzIHN5c3RlbSwgb3B0aW9ucyBsaWtl
IC1jcHUgYW5kIC1kIHdpbGwgbmVlZCBhIHdheSB0byBkaXJlY3QgZGlmZmVyZW50IHNldHRpbmdz
IHRvIGVhY2ggdGFyZ2V0Lg0KDQpUaGFua3MsDQpUYXlsb3INCg==

