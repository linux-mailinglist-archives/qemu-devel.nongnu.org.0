Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5A6F0EBC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:07:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAfL-0008Ae-UX; Thu, 27 Apr 2023 19:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psAfJ-00088U-Kg
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:04:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psAfH-0002GG-Fp
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:04:41 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RN4ZIN006907; Thu, 27 Apr 2023 23:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=oTt/whwUvMdiRmj7qIMijCKqNgGD/NqdhqNlcJzfEg0=;
 b=gl9s3HoaHeK7P5QoL5Z7aTC7EuHmfQYQDWkori5GNoyI4BLshbQQmDCB+r2Nj446zXO3
 bTgjVMUP5ruDK5EjLdgzct0B/IrvBy+IJ2GqEkoRXvNjP3gEtadx/Eb+kdViMp8ey0e+
 RCtQ2DkXc3ZiTi5nUMXf0USOMwLPcoNeHSqNhZ5/qeGj0qSex8SMhlW9GflHM2XeW6mw
 6CdcEHTxqoQaeWQcMJ4zCf7TUQ6eVLLHcukYPh4iLwAHKqTSVij2ku0FU3l54NRb2WR0
 M+No+08uDAHJH0SdOWwq0PdR3efxaaD2l6csZJaamqweepKezqwzwUkqzplIh0kuFgiF Tg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7m4ya5fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUD9HK5ya7ChO3uItJ5id89WFP84gh46uDcVVuUa31b5/bMdh0RmrbkIPo1rHKolAwLbVXqV8K1fJhKPeb2uSJ3Pl4BhfuKNVeB/ufiyJQEIg99v0Y0Wxq4Gnb1y50ZpKVC4Zbv8iBIQ3s31GM/nkUUd0eUGTOykTfKYuGsRcqjvVhEJisQnF8iGIfQkUhcEb86cwjoX2mnjcbh9OeF1IIJOsrLXdoA/7DM/IOPJQz1b4ouBYCaBRECXRKGh6kV6SExHf6tKoezpfvqCjOoO0BpfNzE2Gw8suATtWjMtzRptmsz9NVf3TpEOusq4ajyZxqTHyHTyVNx6rd8fMQ4y5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTt/whwUvMdiRmj7qIMijCKqNgGD/NqdhqNlcJzfEg0=;
 b=iAOc1OTgS3BMiEHTdVsJEQggk2J5WSGR68cCoFivYtpddF4Ei1ZCx9v/bo3svGQXv02jKq29pd8Vzy43ny6qRuSDDOOq42mhvAVCH/+DDdtovqNNxFDV/JYQFKCZn0baZ9XKT2yYwWuluA69Ey+A5KbixiZlLcRo68NetbOx2Zf5OC+ecWVToKSSpdLZFRnoHi4TuF3TPEyLlkMg/Z0KgByrRA1RnL6j8kJuJMKDfR39jY+vFuhe2DVxoyLTFtdoRauSwj/PkOZfFHigIYXa/89qLOWa4L1M5HK8JWvx4N/ya5GQm3DYSq77DRZtYiHroZT+EidKFFT5Psbz81ZvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA3PR02MB10013.namprd02.prod.outlook.com
 (2603:10b6:806:39a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 27 Apr
 2023 23:04:32 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Thu, 27 Apr 2023
 23:04:32 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/hexagon: fix = vs. == mishap
Thread-Topic: [PATCH] target/hexagon: fix = vs. == mishap
Thread-Index: AQHZeQe3gCJKQ91WiUGQR2cGFaWcPq8/J2KAgACeelA=
Date: Thu, 27 Apr 2023 23:04:31 +0000
Message-ID: <SN4PR0201MB88083C644B813C721200D94CDE6A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230427125632.104034-1-pbonzini@redhat.com>
 <4db9ea15-7478-06ef-f774-0f7162780f29@linaro.org>
In-Reply-To: <4db9ea15-7478-06ef-f774-0f7162780f29@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA3PR02MB10013:EE_
x-ms-office365-filtering-correlation-id: fb104d54-411c-4ac9-08f1-08db4773c2ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8T3WTBOoOgoUCbAiV6O3RBqjeBdlvmyozROET6pw3wPMOSGozRx1NzYp7zqcHWeJdACY+AwZAX2UCnBRC9CA+6Vzdy4ble457vreHrlukxLfb5vKNFKKREsPYuu+aokt8azTUDGr/WWHXbK4bCjIkro9bdvBHoUwFsydfTW62aEt2hqk/g2TyT8u5fUBqPnXYNGd0YxuWxfRUwDigfg3LhmxjARxweTO8/f6EOD4gA2mekzQKnQjxfCb+GabvNpCoDcro+NY3nQjTgylGm/Ug8P+aaWL0t/lErI0T1wIorgb1LwsOr0n5Zjyv6QiwpNsL/mfjF+7TnoxzVwiRnQf5tHtOMW7EC4ZMAl3DnSBe/zFNnXHj86JfA8Sp8XgUeiTQOYGJvqCyGZpiyfqRh2am25MDw/eWSw7s0jQXkIRaYIc1dA6336Pf7VjLcqiGwpyKIxJWaq875QiSJT4nsJRa1BeX2a/fAkDJgtqHQaKaNFjEwazROSavTdZ3SRKq0jmNhOObniorPks9fLzi9SQUiG7KWblexD+vqYuMTDeqVljFO7hO/s1W73wkYTvqiunUIcRU4dgNpLn74zHVqcJ4mfytAA++7WNw0dECmUjGqW4Gh5/fXmHtn++T5ZPKiYL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(86362001)(38070700005)(33656002)(4744005)(2906002)(55016003)(71200400001)(53546011)(7696005)(186003)(83380400001)(9686003)(6506007)(26005)(64756008)(66946007)(66446008)(66476007)(66556008)(478600001)(110136005)(76116006)(316002)(122000001)(5660300002)(38100700002)(41300700001)(8676002)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjVFMkExVVpyMWNCMzM0dnliVENydVFFcnZxZHpzVmFHTm9Bdk01VnJ4V05R?=
 =?utf-8?B?ckFuZWx0TjgrdmhJdUpGNExrZHlQNWFxMFJBNWljVHdiUkhVWExPdWRtOE50?=
 =?utf-8?B?aGNybVYramtlV0w5eTdxbVlWZXU2Y3dDUkdGdUFSamNlalAvUkRMN2E1OVZZ?=
 =?utf-8?B?N1RXWkEyRlRqMXR2Q2pORzNjK1ZpN2ZTR2RDVGVLOEZpSmRBc2FESkMxUGl5?=
 =?utf-8?B?dHBrbkxFbllLbHRrQnBNL2dpc293Y01GdlFGYU5WT2V1VkpmWVpidzhadk1v?=
 =?utf-8?B?SVFzWUU5OStrc1RURHcrcFJYU0ZyeDRXUjc1ZTdLNnBuZTJJWWJvKzlBdXFH?=
 =?utf-8?B?NmNVcEkvUkNtdFZHaUp6c0E2Y3hnVUJjY0gwRkE0STg0M2FCajNOa1BsWTdm?=
 =?utf-8?B?MjdvUUYrRld0bzM1Ty91bkpNWUhTQmlDNW4waTVNTnBqcFRUOXJJb2Nkbzh5?=
 =?utf-8?B?bnNmWWJDSlIxejNuMlQ0Z01tNVUvTUhnazZhQmZrSXJqYlRKTmRJYVo5Znp0?=
 =?utf-8?B?UHlmQ0NLVE8zYm5ua0JTR1U5aXBvSnRmeFJJYmNnQUN0b3k2SzhnZmsxS2JQ?=
 =?utf-8?B?MFEvM0pOZ3pocmlsTHNsaFlZNTVsTXZrTTN6WUlHQlIxVkxwejlzODNpUFdX?=
 =?utf-8?B?dklIU3BMdjdEejFnams4Y0RIbW94bGEvcEhybGVST0Fwd2czN0xCYXF6Vy9o?=
 =?utf-8?B?azhuVU05cGtuYk1nZjhPWjZWUzlJNTZxRTh0T3pxTEhIdFRIbDZTclBqS2RG?=
 =?utf-8?B?djgxaUhqdTBCSW44cVBINENkeHB0R1d3N243em9ycDh4S1RxREFkazJwZWRi?=
 =?utf-8?B?cWhKRmU2VVVPMlQxTUU4U2MzK01qWTdQR2phQTFZZXRaN1lFM2Nmams3a0VZ?=
 =?utf-8?B?cDBEck5DUUJOM3Y3ejByQ1o0R1kwdUhKUUFXTXluZ1B1Q2pLRHVFTUtKeDEy?=
 =?utf-8?B?ZVBpOUMyMUs5Ry9TYWlrRGUwT0xxNXd2dWpiWEVDMGpmbldiQ3pJeTZycDNn?=
 =?utf-8?B?ZkNzRTlmU1p0cFJtQ2NUWERzM0R6SFMyZ1Y2andNS3BDWEJxdGRocStZcEVY?=
 =?utf-8?B?YXBORFY5cEpXWVhscVhlWDhLNmRrbTdQaEpLck53SnY2aU8vMTZhdWJKemRT?=
 =?utf-8?B?OWRCOXhXbEF2a2tXemdxMjF0dnU5UTVmYXhpdTlwVGVvT0xoeWM1UWNBWkk4?=
 =?utf-8?B?OS9HSXQ2NHNkaSthODZxUjA5M0lyTExuTG9YeU90VWMwQ2ZGMTV4bFBMUVRE?=
 =?utf-8?B?V0ZlK00rbHQxRVRPVDladmhReU9wQ09NRlJ3QlNUV3FnYzZlZktQemxvQUdK?=
 =?utf-8?B?cUI0TDRNVjU1aFR1c0huSTUxbkIrYXkveEdqRkltdGUxUVFYakYvdXBtOWZ1?=
 =?utf-8?B?YXV1eG1icWtQM0ZKVS9laUtmU2ZGcEVYV0NLbFJpOU1KQkZNUlBBUjNYNFZj?=
 =?utf-8?B?ZlFpQWlaM0p4RUJzd3lrSnB6Z21xSFBTSGZ5R3BCS0drRWJVZ1loNlVBbU1C?=
 =?utf-8?B?NHoxcDVOZGZaUFZxREp0TEZnYmJ5TVJmZzFPNUdSV0hSSUpJT04vbWtiM3pp?=
 =?utf-8?B?VmhWN1k1Sk9DaWVkczJSTzJ1TlRra1Nwdi8wZ3FmeEpyTzNzZVMrQ3NKaFBl?=
 =?utf-8?B?eDJZUWI1aFJLWGpoMU5Uc1pjaVVPWWplZTdGdGRyS1lwL2RQYXZEbnVacFdY?=
 =?utf-8?B?MUc3RmVkQ2lLVEp3Z0ZrT1pzVWpXcGVoNkNneWlpaERCK2NTSG5nV0FaSXdH?=
 =?utf-8?B?QkFsck9ka1JxSEJSYXBJRVNiU1lPc2dFeTdtbVc5ZnVoMFk5MUtoRDZSL0pH?=
 =?utf-8?B?SlhyNGcxTGtER2Q0czN5cEh4Z3pvZk1Zbm5yL1l4WlhMSjNGUExOM25YTCtU?=
 =?utf-8?B?R29YVXlDYThhcmtDR3YxZERYQXdvbDNIRnVkM0lnOE4waEhhNklZdmYrR2pW?=
 =?utf-8?B?azdiR0IvQ240NzZCM3JGTmo2bFUyOVIvMHNkaXJVd2RRa2JnWWhobE5lc1dE?=
 =?utf-8?B?ME11eG9idGZHUlNXU1BwcWV6Y2FMbDRmT3R6L1dOWENyWjRzZm1yYUJSWkVS?=
 =?utf-8?B?Mzl5b1FTdFNrYVdrLzdvdytVUzlMc1VBamVHNUZzb21aLzlVVE5qcUtZUnRy?=
 =?utf-8?Q?kjF6GToT9iRk+5aBX8Ohq5QBY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8LxJuopp4sohue6ZN70MKL02w+5nufyYm9dPeuXV17Y+f+trFpsiEXFZ77g8OV2OYlIoC98UPuZGUVB4hvrYRNfrMdQPEQ5+dRlhVS36px1n7myAF43GRx16cFRG4MKBym8hBB5nWAomscERqk1anJu35tgKaUPjzwLkKG2B1zBT4XJtTaAWTqo4gxTSmrEuGJuTIESEkFgVZnM0jvm/CraH/sPfym2XR7/6ptm2loOGjMCXijn16pqpkwcykoeV0Ri/kVay7wuUVNx9N9wV/M6KAVmLnNpr3OOnOuzQSNtfHtA95itmXCv9oIQt7Y6NMQkLHB4wn2eRy0acMb11Q69gBSNanfzEPvpyQVkN+royh+gKdvEExtJBdqsnV0E+gkFgxKEAeVlCNSen8ovM8WJGH98c8N46/0TbyIF6MsV3LL75BpqbbR5uJ4pbvPyHpyaeNkZjQQh9+BEMMUFA5tiebGN63uNP3cOJLoYp18w+hzB64FSFYNyz4a7yCty0ItHg7ME3WbCRZb045wm2tssj1K9sZS8wONotHnr9SJyDBnZMBov+Hd3uHAEI0Gl4Zrazzpt/VcxI1bXrwHlSzdf2me+JLJPzzn+dzizFUA7k3LzIoy1L+i7BQKdDBTOU5X6TsBK4DUACBDvSHshCMge36c/iHsQoZ5t6pgoZpmDgdfzACRB2P37Llso6/tZgl+/fRM4jIjlw4QouSSgqvWdxanvviE0uGvZiELUGZh10QwY15We5033az0MaMQk/GP+EzXHG1lpXJTiXUwV+KfbTyl74Bk3EwU56l3iZx/ui6APgmsu0anD9t9f4nnQU3Q1G+xoAp7s6+Z2oL3C4Vg==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb104d54-411c-4ac9-08f1-08db4773c2ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 23:04:31.9934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBOd0/TGgZeZ7GJkmY5Mgt/+i59TvT3e1CwPC+7X3oZvU66m1AzZpQMp+sW5XzVH0lvEcjr3pPyww6qGEQ37dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB10013
X-Proofpoint-GUID: dSHyc5W2WWOvyilvNq8ooemDzMo9aD37
X-Proofpoint-ORIG-GUID: dSHyc5W2WWOvyilvNq8ooemDzMo9aD37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=855
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270204
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJp
bCAyNywgMjAyMyA4OjMzIEFNDQo+IFRvOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRhcmdldC9oZXhhZ29uOiBm
aXggPSB2cy4gPT0gbWlzaGFwDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQg
ZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlua3Mg
b3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IE9uIDQvMjcv
MjMgMTM6NTYsIFBhb2xvIEJvbnppbmkgd3JvdGU6DQo+ID4gQ292ZXJpdHkgcmVwb3J0cyBhIHBh
cmFtZXRlciB0aGF0IGlzICJzZXQgYnV0IG5ldmVyIHVzZWQiLiAgVGhpcyBpcw0KPiA+IGNhdXNl
ZCBieSBhbiBhc3NpZ25tZW50IG9wZXJhdG9yIGJlaW5nIHVzZWQgaW5zdGVhZCBvZiBlcXVhbGl0
eS4NCj4gPg0KPiA+IENjOiBUYXlsb3IgU2ltcHNvbjx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pPHBib256aW5pQHJlZGhhdC5jb20+DQo+ID4g
LS0tDQo+ID4gICB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIHwg
MiArLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29u
QGxpbmFyby5vcmc+DQoNClF1ZXVlZCB3aXRoIG5leHQgSGV4YWdvbiB1cGRhdGUNCg0KVGhhbmtz
LA0KVGF5bG9yDQoNCg==

