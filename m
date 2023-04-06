Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5B6D9B71
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 16:59:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkR3U-0002dV-CO; Thu, 06 Apr 2023 10:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pkR3S-0002dN-8E
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:57:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pkR3O-0005sO-R5
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:57:36 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336Cqio4002715; Thu, 6 Apr 2023 14:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=CIdzN8XF/VdqPGz8mo8YutZ/Uh+2LX90csv7CataJcM=;
 b=FpyryH+mZBJwgRnssKfQ2qMMkC8EVEC00aJiQ7VmjvJHQgK3wrGWQhICxvkkMe6JLE3n
 n/dLHg7EhTAWxtO6NNtnA/BySYr/vsxuqnKujJo3/NkFvbTEGAUM6z2OByiLbH/LkYRF
 iGjpg4v9p1bjmrGykbzKLPRNT+EsxndxSGn61mEtZaonhNhfM2Ko6iOL1BfPXZiDTxn+
 N3v8oAhS56gnYu8mW80yMs/LVCC8z7rGoK6QvqDDAAZ5mt6LVPORB9yLO1JBuSFXyxjR
 8TFUs84Mb2Ni1Wa0lLUrxKlZudQPp+uttumwKSrca2Sq+QlMyfIXABiBpkU0p1Uly84j ZA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pssmw105t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 14:57:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl0P6132qNEn1/smgbkfzxrdqFYlonV4dBljOEi/mbGxEugUoyh0JUYbf8QTMzqLdE97RW9ljgay2IvoN2nCpwbTFNryCUDQOHat3XMgcWJlcIKDTI91BnHsNqVUk7UzBYEiyYJbeh9xEAvUQJVB7qsHgCrHSQMCg5fl1xQ2DMW5BOLcUD/7D/uthJhJXK3txWPBF/eTCSiCCPJ+TJaPgSO/yu1P4vy6X9qKawEAoO3a+Abs8ovvvL5EZJ0XzV1mfElK5CqiYQFH2Whs9MLhTeLs+qPLK0ZQABuWxIUF8ctVdf/tPlKe1kfmxzAqLWpdXZPokdXAR73cLHMJLQ4SHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIdzN8XF/VdqPGz8mo8YutZ/Uh+2LX90csv7CataJcM=;
 b=k7r3Z5pvUMRZdeSPbJ9PYO8IgiMd9FOG93d57bs4a9fCuaGU3UntC/h1GaNiKb8cPruLBkkqc2UoSjA2H5mbrtWoAWJyqW1sZRsYuPRtRPK9jF88sReVU7LPxJRxcx9IFl0I8fXLAloiwll/v5MOFGl8OTZmYSg7xT1NAjQjz4c7nAWpolBeWhRgkPemoRPFO4sXeyQnUEaJBic3RoqPUJwqDYggzRJEtpHtc745Pj6OGKTbN2OzYHnuBELcyGO52Vyhz6zcCP+GnKRwj4IXNk7HPFBxpemPxFXEKn9RaPJiZAvLScwYKb7A/L6jM2N8AsLvZW90UYap/xVmcezP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ2PR02MB9414.namprd02.prod.outlook.com
 (2603:10b6:a03:4ca::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 14:57:24 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 14:57:24 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng" <anjo@rev.ng>, Brian Cain
 <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] Hexagon (tests/tcg/hexagon) Move HVX test infra to header
 file
Thread-Topic: [PATCH] Hexagon (tests/tcg/hexagon) Move HVX test infra to
 header file
Thread-Index: AQHZZ/ZkLRHe6d6o9k2YEpmyd09DEq8d4aIAgAB+ZtA=
Date: Thu, 6 Apr 2023 14:57:24 +0000
Message-ID: <SN4PR0201MB8808BA827472A802BC03DC0ADE919@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230405193945.169854-1-tsimpson@quicinc.com>
 <c1980337-ff85-b7fe-b607-a2044743d5c0@linaro.org>
In-Reply-To: <c1980337-ff85-b7fe-b607-a2044743d5c0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ2PR02MB9414:EE_
x-ms-office365-filtering-correlation-id: 0d83f38f-5570-4c4d-acba-08db36af3b20
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cf1aKNc5AHZ0EqB+xUN8cgLB/y3r1Z1EzCI9lAK3aHgn4xSkBKWqCBC3rrm0mvTpOIcFohstPCAYz9ul5POIQMf4o1pYnhSBVg0ofpbrNnKyaDy7GKF8BX/XwOwBWl/k8fE1lh/r9jmF1kYmNCtlxxQbX/L0UnzGfI4giLc5/rW9vmxa+Ao0+U1lktbn5+LChKVjsP6f2Ay7Ge4TW8/PLCmBi6wThS+NG40c99My2jNxuZar68Lrw9ieMU1/M4Tgj7gO4TGqDsPcTRL8cL8dMBKrhN+au9vOCSX5NdzvtkHDRCvFhqLrhsXXHETPr3/zyoGJDVOXjipju62he5MfjRzob/LxI0EfDnhrgJsMTGKP8GnRO114vwZa0D/jLbd+DqNtV8XMgvy7mvacMTuzuEXf9KWrZWlPMU4rqiSp/YjJ4KNAsUFu5LwVm+QAHr58aVnM+Ku82geY+1BcvUH2fJrN78VZzJPi+QO5Iw3X6fj2X1ugU52KslwsH82EPF+QGIMT07tfGEKzF8nIDCkqLQqyTJd/GsseouCZBlwYPlK0QYIBfcrWtw2nn9ZOwPuH6IqmltI19U+HywIqFtFoRahI3K4q8x0rVh+K8n3V/ceqZ7iIrpekvzmuXZBzcESq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(71200400001)(7696005)(64756008)(4326008)(66476007)(478600001)(54906003)(66556008)(66446008)(38070700005)(41300700001)(316002)(76116006)(110136005)(66946007)(86362001)(33656002)(83380400001)(6506007)(107886003)(8936002)(2906002)(8676002)(5660300002)(52536014)(55016003)(38100700002)(9686003)(53546011)(122000001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEVpQmJhd3d4M3ZHc2JWZUVqbS9XbUdvaFV1TEJsTmpPQWhmUG5TaUhocjln?=
 =?utf-8?B?WkREWnJFT1F5Tk1IRE01S24rcEl1Q29vcnBuM2ljckNRTkNXT3crbWpqWDNu?=
 =?utf-8?B?bXBZcTZiTGxJV1RtaEovUXhSWWN3S0JsMlhmUWV4RmNZSFNQNDRaQy9KQmxP?=
 =?utf-8?B?Wno5dk9IcE5kT3gwSEJxd2F5bzB6TGdwb0h1M1hmSWhpZ25RZm5DNGlzVDM3?=
 =?utf-8?B?UDRya1FITHJ4OHJHeDJJT1B0bUNMS2xCaFpGM0ZTbWFFNzg3Rmw1MUx4aUJk?=
 =?utf-8?B?VFFLS2RxS3FkSTJRY0lFd0Q5ZEtHNVVHWjNpVUhZc25zMGcrZFdVSzhXNC9h?=
 =?utf-8?B?Z2k2Rmt5Yy9mekhhK0NRemdaZW1vT2F6U1hkWmQydk0zbE9aT1MvM3ZaTjdB?=
 =?utf-8?B?UG4zZzJoa1FaYXJ0YytuV2Roa3VoSkpMSlAzendQeHhSdnYvMjVTa0JJT3NY?=
 =?utf-8?B?YWpuZUFOdU1CQjRNUFJRVS96NGNmbWJ0ZTNxQnNyM3BwaFZtNWNjWWVNV0Zy?=
 =?utf-8?B?SURNcXlpTlgveUdLZkNVNCtZUE1KZlRjQ1g0bWRBdmxOSUZHZVhwQ0cyengz?=
 =?utf-8?B?Ym0wMjlwRnRyR0EzUE03ZW9YbzJwODA3Rm5IQzg2VFozeW1CTlh0S1RWZUlp?=
 =?utf-8?B?cHovMitESm9yZStZbXNDRXhxaXFrSmZTUzJFTGdhWjBodzYwTTdIakptbXhx?=
 =?utf-8?B?QlIwMm92RU1uMVRVS2U3dEZkdzZzRHc2QmtCeWpKcjRJbHlIK2dyZDFwaEJZ?=
 =?utf-8?B?M1lWRDlUaGVhbFFyczBIaUVuNVdjMnZhSjZwMEpyb013d01KRVlubW9KeHh6?=
 =?utf-8?B?dHJwdUNLZkdTNWpHNVVCZTJBVUhkd0VYUW9kNmppZnBDZUdyOHpkWEJEaHUw?=
 =?utf-8?B?SVZEaklubFB1eTVmL0JKK1N1Z2o5dCtkUGg3dWxKZUM0UFQ2Y1ZWaDZuaU1n?=
 =?utf-8?B?N2RsNHFVTXdyY2E2cmdTbnlTb3ZWR2UyU0pydmNrcjNlTk40RkRiOHA5WGlC?=
 =?utf-8?B?NFVLZHJkdHFETDdINW1ZS0Y5MnQzSkYyMzBISWx1VVlrYm0raG80NmwvdGFI?=
 =?utf-8?B?NFJOVWxjaUNheTJEMnArMGFMTkpxUlBlUGUzTlNJTzJqSlNqRzFocnlrTEI3?=
 =?utf-8?B?Wko2bU14R0xPZzI1dG16VGNNdUlETWRCT2g5eCtXYkpyK3BjN1hpS010citv?=
 =?utf-8?B?M0daWWpUVFJLK0JIQmo0dTdnWXlZaHJHT1BIV2t2N0NDaDZEcDE0Y1NtZFk1?=
 =?utf-8?B?NFRONHMwVFFueFVYR2lGWjh0RmtIRS9IOXI5a0JHWEpZNWNxNTB2cWVITld6?=
 =?utf-8?B?d3BEOHEvUm1BazBabGdCV1l6d1poZUFHRnF3OG5lQzZ3WUlqOEpMV3cyZHE2?=
 =?utf-8?B?SjdFOHlWcFNyckYrMVNoaGQzNkhrZExEUFpxa2FJQmI0UHErTUR0d293TURo?=
 =?utf-8?B?VjhuZlBDb2RUL0JxVmpSVkw5bEJOa292NVI4UDdQbi9iMDdlRmp4L3czZlE1?=
 =?utf-8?B?cloyaVNrbWNRdEFDQVdnNmZNTWhGd3NrNFVnZ0lKWCs0V0hYbkEvdmZyMW1z?=
 =?utf-8?B?RWpqZ2JkTkIvUEpWYzdpbjhTWWtkWURnb09IR25xZ0VKQk1vbTBnZkhyK3hl?=
 =?utf-8?B?V0VzR3dJaWkvUkVqeWtRNWxyZjlFK0tDUXNxYmxIS1B1ZFpyVWhRMUl2N1VE?=
 =?utf-8?B?YjkwNjkwTnl2dFFpMno5aXIzYXVheEsvUlNxU3RyaW5DTUJKaG1ld0ZVTXZG?=
 =?utf-8?B?VzQ5Mk13MGw4YXA3OTdvVHZkbzFMek0yYjIwdUt6OEZubUhlNVA1OTd6N2ZM?=
 =?utf-8?B?eDd1dGliYUVKM2VQZ3RkYm56WXZyN1FlK3MyTVRiRkN3T0NoSEdXUStudEYy?=
 =?utf-8?B?MEhSeVl1ODljSXVrbEZPZTNNSFlIVTBOaG5zM3NReXAxYTdoMHd0OHN4MUI4?=
 =?utf-8?B?UmFNVmdYTGtKYlBRRjQxZVhBMmJmV1Z1MmNIQ1pJNFBmdVV2ejFjc3ZucSs0?=
 =?utf-8?B?blZVc1dRczFlNDlHOEd2VUVkTWY0c2tnbGVPdElLdStwNC9VSTdTbTM4TStz?=
 =?utf-8?B?TDlBRVE2VG92QVNFelBaeWkva0FyVHltM21ka2VFaysvREFlWWRrMlIzUlRV?=
 =?utf-8?B?NU1reTJTWFM4Q0ZBUkVmVHNFK05HMmhCZ0F1NDZTVkp3dXBralR2WVpyOElL?=
 =?utf-8?Q?5UgxmpdexjqzmJkxwTQ/lcZZDh0Ausgat809zO7jMBMV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Xko3T6QZth+tG3GXeOzTiC1V6jvu60SrikJj8sWMOJuHU14vDOi7NyROBVuFPX6QHlbtVdy4CNHoALE9+UW5YLyVXhqo5BRJbDTDC/u5ZH+czohZQqUbO33EZPRsakAVAb1bf1Ef210VRNJozQZ4LiuuPLABYCnChN7EKZhpCByWIMHZ8TkKLrXmyedm21/yap37ksoEYcgvQYC62Ve6QpDtXK7u9GOIuOhm7VV/o8Mt3pMYRAEFyzbsHLjNMnve9fRl0FrjY94HaGqYivOVE37wGpXW22SCUN+vZ7+DQKsghDQYwF9FWM9RHepWaM1mTnOu177YchpvxZ11+Zl8EbOgdXfiL+iS9Vz4mn9ZeUWBg3njQSeiaHPSEneN9TUgYEpPL8UnmX01bC+lW81JaxNa0rRa+LqPlsGjelClqeeUxpSdBmXwVvarsImx0oF5Ytleb/IXjZx8k06RtQ3GT83k6vJdzH9g5zNLm2Zc6WrDSJqWVR7OLRLIAcdyNsNgiqymzc3GALIEv1tFR7k9uBe1Rtx586l/g2IprzHKaZ43XVdJJ+QmNr9QABjGD3AqIcXBlfsFvZ11DrbQ1DmYCi++SsPQcgcHTEvhaLFaef75F57KE4NIrhDvYalErl8nIrkKENgif3ZeLzgM/sqvNQv/YTZsUWPa7FoNFSEOa2V+ftAZ47Vpe6AyAOW++KgjD3JoTyFt1fJczFDyAehxG3KIfEIZ0ZkAzZUw2NUmk5ntfOfidNMHzraKjqQG5TO0vnTsHCrEsbn34yfrD9rackuheXC3YNhfxZRKnOMo+rHfWsaS3rhTT+gZ1xCXKxD4
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d83f38f-5570-4c4d-acba-08db36af3b20
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 14:57:24.1912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: La4TyjwSnZPPauDMD6X0mgLLvfKZ+uY8VCGe07shuIECBcgt6kxlbOA+318dBrUWJ3kKF9ctMDKpey/bxEVXsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB9414
X-Proofpoint-GUID: VeSAysUakBP6ldDq08Tdd3RzjyHOXAOW
X-Proofpoint-ORIG-GUID: VeSAysUakBP6ldDq08Tdd3RzjyHOXAOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_08,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=960 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgNiwg
MjAyMyAyOjI0IEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5v
cmc7IGFsZUByZXYubmc7IGFuam9AcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5j
LmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2lu
Yy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29u
KSBNb3ZlIEhWWCB0ZXN0IGluZnJhIHRvDQo+IGhlYWRlciBmaWxlDQo+IA0KPiBPbiA1LzQvMjMg
MjE6MzksIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+IFRoaXMgd2lsbCBmYWNpbGl0YXRlIGFk
ZGluZyBhZGRpdGlvbmFsIHRlc3RzIGluIHNlcGFyYXRlIC5jIGZpbGVzDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+ID4gLS0t
DQo+ID4gICB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5oICAgICAgfCAxNzgNCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlz
Yy5jICAgICAgfCAxNjAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICB0ZXN0cy90
Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgfCAgIDEgKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxODEgaW5zZXJ0aW9ucygrKSwgMTU4IGRlbGV0aW9ucygtKQ0KPiA+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS90ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5oDQo+ID4gYi90ZXN0cy90Y2cvaGV4YWdvbi9o
dnhfbWlzYy5oIG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4DQo+ID4gMDAwMDAwMDAwMC4uZWJj
ZGI5ZjAzMw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9o
dnhfbWlzYy5oDQo+IA0KPiANCj4gPiArc3RhdGljIHZvaWQgaW5pdF9idWZmZXJzKHZvaWQpDQo+
IA0KPiBpbmxpbmU/DQoNCk9LDQoNClRoYW5rcywNClRheWxvcg0K

