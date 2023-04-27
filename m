Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733906F0859
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:28:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3XA-00037a-V8; Thu, 27 Apr 2023 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ps3Wz-00036B-Lv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:27:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ps3Wx-00012D-NQ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:27:37 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RE27Do003814; Thu, 27 Apr 2023 15:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=LTqjJCLmUkPC65lpNxi/KgS/k3aeKIAF11ycgp1WLyI=;
 b=dbPmAoBUtBn4iGyJ5QRszqgOuXrTrKeF1e7vJGezucTGedqgSg9+Qd0k3QWcMoGSLKPy
 /iLqd1tXXMERift98qgQFELmnSDdhNVLmlj5rCacpt/031l6m54rr5WVR5bBhZjTH7qP
 43Cfur480ues2Udgw2HA3Djg9QscmzYKBWQ3A4yfTiXM3wCSZ4AnyZdwByE5NjHisE//
 LhSFuf1Grw/Dpa1UHElvH9fx+/DW12nCc1r5PVwkoF2UICBDV3xgyYiK2DCdYqTqgBRn
 IENe55Rg/yHleRYpeINUQD1nZX7rF/RD+52GSZo3NoXHQOAhQaA0D1TsOIOQgUHxIlp2 lg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7dh2j174-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:27:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ec9Oo3Q9psSMSuspLURA6GAGuNckdnOAC2aTWBVZxC9iyLVgwHuhOgJgOSQpTD1u7Crhpb66JGJbfc9jEnMpxiEgElqjoqrbqwPuT/TIAVp6bXI5EJLc/qqA27cZQERQsNyH6vt0p5WAK9VQE45pCvCYmEQt84MCcmtgNScE4Uj2b7T1rhq4euIUc/vOm43WuSLn4r2VlMP3cY3dIjSrToMrBKFYaIhVG6J532NTD5EX5/0ynWc77W6hhv41d3M98bBB0DfdAn7B35PYO9wkAMspkMeCBPYN9KFK6fuX0DUZ+DCYckRVrPRdKGSewFdGdGNMsXWFUsFNhgthkNGrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTqjJCLmUkPC65lpNxi/KgS/k3aeKIAF11ycgp1WLyI=;
 b=XoPAuYeszpSvoq62EP5LzkeNKciNzPs2dtg1n80S9OprMYgcmlHdWTKaPgt6tsVK3KakJiqfnJSW/QmP/IVM9zZyefEyOfbJ2xQV7hZN4scPt2PmABc79gFTntpzCodW2Vsbz6UuIbfkNjXc1x4l8aMZRPJx1PoO6c3gcY7RjHmAaKFPtL6i0JxhRbtvfB4iofKx1TD3EWSD2yMopXkOWW6ZXeeeZ+h1OPKz/jztyXvtHKUSmi94Yh5XWbCjFPizJVSeAMec+FFHivROahnQc4dgP587Dk+sP+iUGUtGs656g5JjOkKaf3y3w4NQTw0wTinYk7Xo/IkBg+aIXLCBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6678.namprd02.prod.outlook.com
 (2603:10b6:610:a4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 15:27:22 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Thu, 27 Apr 2023
 15:27:22 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Alessandro Di Federico <ale@rev.ng>, Anton Johansson <anjo@rev.ng>
Subject: RE: [PATCH] target/hexagon: fix = vs. == mishap
Thread-Topic: [PATCH] target/hexagon: fix = vs. == mishap
Thread-Index: AQHZeQe3gCJKQ91WiUGQR2cGFaWcPq8/Rxgw
Date: Thu, 27 Apr 2023 15:27:22 +0000
Message-ID: <SN4PR0201MB880869DD73EF767A20DD2E0ADE6A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230427125632.104034-1-pbonzini@redhat.com>
In-Reply-To: <20230427125632.104034-1-pbonzini@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB6678:EE_
x-ms-office365-filtering-correlation-id: 1aa5127f-ea6a-49f2-a5a9-08db4733e58f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xMBQrBX1MZOo2T7HOWAe2JlOMX3MbXmaW0LgUXm3Rc5YoX/evdI+XnDDe8dtxRR7lhmPeawFL9umPimdM8c/8rU/MWUZsv5u44C7xHM6ugkuMNoDrT42niyvnthXIutzlsk4WaSi4ho+FO9uQYM/AQH07ZJa1QrKN1mqu3RFQz3I9fhuLzA2Qoc+pcP3k5s/NHamVW+1oate0wvqH9cvVgg+gVckuZ66XLNUPxkle3w2DgiP14Ox1J9Lg/Ax5ILszIEddunjsiivNvtEwmYafqISNJxzzJp1ggKFgUK8q8gX3LHzIgH747X4jNi8k8QS0TTabxlaqCSoQylMrDsvGRRD6bg/m8IEYD41LhJnOLeiPMDmfs3qHahbmoVyW5IflZxveESHvJoVI4Xe4x0oH+vNpeXSY078CpJewHKQcScUayEURATH3aWulhw84oi8aP2cOiSeEVp6MB9QPQwcZXfq8KVLyPCWoWIp0Iw8nD83KKGe8H+UbnFQb7XyjJinDOqVeCxQQOA3q4Hx979Niy1OKjLBmIGCgEZTZZfxwJ+F0dJ8xMpwMXYOSl69jUDDO2oK0t6q0bt0gg9YyxOUatfKgRgXJ/VXAMlIkRde6z1tI5PhHO9h2HnBjLbjfQLv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(316002)(4326008)(76116006)(66446008)(66946007)(66556008)(66476007)(64756008)(54906003)(110136005)(7696005)(71200400001)(86362001)(478600001)(33656002)(186003)(55016003)(53546011)(6506007)(9686003)(26005)(5660300002)(52536014)(41300700001)(122000001)(2906002)(38100700002)(38070700005)(83380400001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmJVQ3RTWml3aExrZjBmU0c0WnVIZkV3M3Y1Sm84NEMxNXJTSFc0MTZSb1VW?=
 =?utf-8?B?Y04rUDczMEpJbU1zYmhkNUM4bW4rTFFqZm9oeGU5bjBNRHNZT2lETkFNQXI2?=
 =?utf-8?B?SFpOL2ltQkdKNFhqRzM1a0ZmRStrZnpoaXFCYWNKUTBWSmJUNFhaZENHNEI1?=
 =?utf-8?B?WWdZL01WNGVTbnFDOEs3Sks3RHV5Y2RXNTZkVFNTd2JyQlFrOEQ5YWxvaEIw?=
 =?utf-8?B?UWFuV1VBS2kyVDM1emYrSHpJYUo1SklDOUUwOWJQUVRKZ1VKWFExL0gveTc5?=
 =?utf-8?B?UmhHYWQ2WWdMNytFRm91bWtrVyt1SUZKY1B1Sk9sZEpsWXNqRTJCRllLdkU4?=
 =?utf-8?B?NGpTTVYvYk90UlFLTS9wOVhVeFRyUC94SnJhV21SalVCMU5hMDdJV28yUGJU?=
 =?utf-8?B?NlBpbFZnazdzZ1phNXg0bXRJNjJXbThlc0VGKzllaEYrbjVWUWYzRVFDL2s1?=
 =?utf-8?B?NkdWZkxrVkNpbm04REtBank5dFNhT2pkTFI3ZG41eTlubytxVzJ0ZWpWSlN0?=
 =?utf-8?B?S3FVT09BUTBWN3BwVkM2cUtxb1JuWk5xVllMTEVTYlQrVC96S0VFT3ViaGNQ?=
 =?utf-8?B?dEoydFduUjJiZ3EvNWI3TkJIRmlZTmpUUjA3bUtUbXdaOG1MRUlnUXppdC9S?=
 =?utf-8?B?OW1ZckN3a1FBckp5c0pFSW9ZMmMvSzFqeFVSSkhlZVNTWWVGK1ZKRTVrbWhi?=
 =?utf-8?B?MXlNVkxKR3RoRVNyUStnSzdxYzZ5T2VPMnF0OWdscG5GU1dTSnlrTGYyQkV6?=
 =?utf-8?B?YXhlVDY2SkNIY3d6TkhnNTBZTTBoTldzUmV1TWc3NjZjb1llaC9XSUVzM0p1?=
 =?utf-8?B?eGVDK040NU1PckgxNTh2TnJOMGprdVNjWVBqR053a1AweCtJVWxaU3hvY1lP?=
 =?utf-8?B?SUNVaGFZT2toc0JmV2M1OTY1VDY3YlEvcmNDUUZWdmJqTUJPa09lSTU0TWNX?=
 =?utf-8?B?b0RJUGJNeTUrU1JpM1lMWVkzc3N6aWlsMGltSlRXSVllZmNienRLKzcyazdN?=
 =?utf-8?B?S05XRnM4RkNRcjdXMi9scXc4cE5oK082c1pCUGdYRjNPMnpMdTRrbUNobnRW?=
 =?utf-8?B?TUNUQi9jVFNlYUVlRm13NEgwTmpIMmRsWC9YYkRzRTRrd1ZPOWlxbVFJaEli?=
 =?utf-8?B?bmhNQkxHc1Q0U2FyOG8xK0lUN1Frck1TK1lxaFFKalRWWVl4NkhmK2FYRXNy?=
 =?utf-8?B?Tzk2ZWs3bmV3cEIzaVRZOU5mc1MrVHJNSFp5VkJEL0pjTkRMQ0ZDblhoZktJ?=
 =?utf-8?B?OUdTTjIwNGdwTTN5aE1pbStBSGxOYmh0ZFhVdGtHTHZEU1JyQUlTaU9sZUVa?=
 =?utf-8?B?Tks1L3g2MG5MMTRlSUFlVGwwem5JZE90NTVGc21KcnZZOUlWMENkdUFrTjds?=
 =?utf-8?B?QjlBbXhtNEJWRUlPSHlFMlhmMkV4dUZoVWtvdTJiNGpBaWlWc0J3TElrRUp4?=
 =?utf-8?B?RTdyVmhKbVh6dGZSL2MrbW5JbHZaS1ZCcXlEaXVLUHpRZkpab29kUWZWMXRK?=
 =?utf-8?B?SzdoWGR2cXcrYXVMTlpZbEV4WVBBVEpqUk1HcFZrZ3VaZ013b2s0QTlSQWpE?=
 =?utf-8?B?czQyUW9ZazFEOVdLaGZpVnVjMFYxOFdscmdsVjl6bXFoTDNVSGRtc3RzNHhm?=
 =?utf-8?B?clhFOXhVQ3h5YjlYTmxrOUlqSWZnRFBpSlFpNDJ1ODRxVHMrWE0vRlNvMXds?=
 =?utf-8?B?TjI4Z2dDa24xODhmU3pUUCtPUGZpYlZ5VWJGY3k3VGZGa2tKdHhqS3hxakRR?=
 =?utf-8?B?NlBWUCthRkE2VzhDUlMvUWpLK09BZnZndzhzZ2lWWlU5NXZZK2lyYUNGR1Uy?=
 =?utf-8?B?a21WY09tcmJ5MFlpQ1NVK2dHajRmcE5yRlUyWFo2ZzN2bzBFakR6YlM3ZUUx?=
 =?utf-8?B?QzNmbVBEcnU4cEd2cndadUdsRXBXenlGUDVFV0FrdlpsZzZOZlJNcTQrdnlM?=
 =?utf-8?B?SGlJcVR3RDh5WDlYT0R2MlJHWWVGSW1peWw1dlhHUlBIbjVxNnU5WkhMdlFy?=
 =?utf-8?B?MFdRSm5XMmhjSHlrU1RmZDFob2xxb0l1UlNXOUpaTFREWndVQzc2bWpFOHdm?=
 =?utf-8?B?aCs0eTJDWDNYbVBKN2FjNDNkeWZoUGhqVVg0SWxHb1ZoTHZKRXNkY3dwcmgx?=
 =?utf-8?Q?LMuZTM9KxQMrCv7MsNhmGr/Ly?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OYSXBaoaXi6/fN6wY+sAMIN4jl39uU+4Cnzahf2fhOqc4jJuPbmMTAs7KurWMAKbWEqjry4ZeyKSY5QrT96+xCqqN/tOviVn0SHUiYdXAP+sSINM2SU+82S4Z4D4aGMY37iyY9siDCxibvo7IHLix8/Vfj40CHr9ZE0TEL3yUHEr2n0evsNoFCbESuYkwZsya1bGNQ5VFi8hm2KyXTaliayNujiX5TnNlgiQoe1uqjytsgoXaGyQgJwGHAKyG+djku4xKNl3HL7YnxBU+7vYJlN8ASjiA/cNlgwThRiK21sTSQOCvf8H5w1rFeL+sWE8rzg+TH81Qx1+Lcz/IQ9Yoz+CoDu7akFXepeLR3bMcgpPV71EXwQYna3FFNJ9URwBIpBk1siTgkCBgRpotWMFg2Op88QrxCE4xU4DlQKifkttoIKyBc9XqgUbxbiFG5LihjoEe2dpd7ev5c3uxx8TlXnJdqdbIYk4M0J0ygfSun4dRSc/YrNr9sDsbTUXWTKNl7Vh3dUUeuh3SAVzE8Nu6saLhQLIBAAM1gW3ZdQmIFjiqb8YvhCng8bwyV2m/JJAsEAREL5G80T65ITpvoTvChpsz9HXr81k5Sr+VUZW+HYelC5EWfd5TaLY3NbooCIngRrmUIj4VX12c3cBSwz8a1cjR6eDbNYzBc3JI268RIeJlyzuUx2lM3TCs6HmIwOuQ5lqmfnPcZpa3sc5XJCSY4t0qxYfDYXUu6ilgpNDS0oTiA76jWVj+jDkmudh2Xvlcd5LWc5VNBq315HbMh7sVOtJQO6vCJuHWWpzKZ5yQCqbMbGyMc5NtSgd8skydlnU
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa5127f-ea6a-49f2-a5a9-08db4733e58f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 15:27:22.3132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRbVEK8LUCXAJSvFlos3bIkCp1INs/sohAZH9xpVT/JM5jIjmKw1wfp3rEiyEZIQjGwzk+fFLb2nhM4UXmSchw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6678
X-Proofpoint-ORIG-GUID: asXliN2KxEfOSBsyT8a9XkUTfrIWu9LP
X-Proofpoint-GUID: asXliN2KxEfOSBsyT8a9XkUTfrIWu9LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_07,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 mlxlogscore=943 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270134
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFvbG8gQm9uemluaSA8
cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDI3LCAyMDIzIDc6
NTcgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogVGF5bG9yIFNpbXBzb24g
PHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIHRhcmdldC9oZXhhZ29u
OiBmaXggPSB2cy4gPT0gbWlzaGFwDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0
ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlu
a3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IENvdmVy
aXR5IHJlcG9ydHMgYSBwYXJhbWV0ZXIgdGhhdCBpcyAic2V0IGJ1dCBuZXZlciB1c2VkIi4gIFRo
aXMgaXMgY2F1c2VkIGJ5DQo+IGFuIGFzc2lnbm1lbnQgb3BlcmF0b3IgYmVpbmcgdXNlZCBpbnN0
ZWFkIG9mIGVxdWFsaXR5Lg0KPiANCj4gQ2M6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWlj
aW5jLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT4NCj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVy
cy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2Vy
LWhlbHBlcnMuYw0KPiBiL3RhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJz
LmMNCj4gaW5kZXggODY1MTFlZmI2MmI5Li4wYTAxZWMzOWI3NWUgMTAwNjQ0DQo+IC0tLSBhL3Rh
cmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJzLmMNCj4gKysrIGIvdGFyZ2V0
L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYw0KPiBAQCAtMTEyMyw3ICsxMTIz
LDcgQEAgSGV4VmFsdWUgZ2VuX2V4dGVuZF9vcChDb250ZXh0ICpjLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBIZXhWYWx1ZSAqdmFsdWUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEhl
eFNpZ25lZG5lc3Mgc2lnbmVkbmVzcykgIHsNCj4gLSAgICB1bnNpZ25lZCBiaXRfd2lkdGggPSAo
ZHN0X3dpZHRoID0gNjQpID8gNjQgOiAzMjsNCj4gKyAgICB1bnNpZ25lZCBiaXRfd2lkdGggPSAo
ZHN0X3dpZHRoID09IDY0KSA/IDY0IDogMzI7DQo+ICAgICAgSGV4VmFsdWUgdmFsdWVfbSA9ICp2
YWx1ZTsNCj4gICAgICBIZXhWYWx1ZSBzcmNfd2lkdGhfbSA9ICpzcmNfd2lkdGg7DQoNCkNjOiBB
bGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5nPg0KQ2M6IEFudG9uIEpvaGFuc3NvbiA8
YW5qb0ByZXYubmc+DQoNCg0KUmV2aWV3ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBx
dWljaW5jLmNvbT4NCg==

