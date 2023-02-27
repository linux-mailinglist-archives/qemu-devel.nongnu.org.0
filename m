Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B046A4FC4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWn6y-0000sm-PF; Mon, 27 Feb 2023 18:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWn6w-0000sW-RY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:40:50 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWn6v-0000IX-1D
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:40:50 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RMemo8026470; Mon, 27 Feb 2023 23:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=qfG7ZbLDqQzUspE9/6X50Ih3TAGv6LGKVvhu+2Ft0Po=;
 b=c0AiBjHR6pGS1nrNkYLi8hwU3WBvNOK6t8Foy0km93MjlTC3L+FKyPurGsX0xdABD1r5
 qBh38YS8rBpv4oPTLtLrF3Overw9cS+/GJK8LCfOWxJxKEV4syKxizGmK3heLl0E2WC7
 FJ997d6727Wcy3Eq8VplXJ4bV5P4Fa0QmeeQ2rBHm6rEnaYt3Bp8MHYbZ1wwm3hKVXRv
 LT7EsbBHBkgIBm2YZ05WJXjaFmWbuAkaGvaVQjPi1jGLZ/9cs7UICeC6VS9fa4bQRF8T
 5UjeRJ38LTOYN6YVcF/bObAYTCl3vDBCVh98sphAPb/ZOEhY/N2Z3aju8rp3XxGKIwR3 TA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u3thsap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 23:40:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR5Xqa+nOs5YvV2fAx+ZbW57NppslLmtqTOJpQ0hGzmJmOOIelmIFV6jaSVfbjih3GLJ1eOAaCrdS/kNwgfq0Njyg78sJ5IX2Q5N/wDIqLW7e8wvTBMit97S1oRXQWT71ifhrWQwU569yoRVYPO6RVKHu8JewSSmaCW0iQgQ/88nmcfTf4P7mHoVyqmz+IYhHUs0Zb+prm3+qATGZ1/2gzG3HCi6QdCZcbmVNvdhp50+IXBPilTbEK6d/gDlcg9YUp0seGdPiuGhpscnyp7PCnileKdde8XWW4JHDd+Wsn98O+QKvffUvCx6mikaDRBiSMVPDCUZocaXRDYFq1xTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfG7ZbLDqQzUspE9/6X50Ih3TAGv6LGKVvhu+2Ft0Po=;
 b=eZq3Wr+y0r6G2tXhKKXPSIFkOd5PIfhMYD1A8WpZ4YW5I11WC3s4bzJBBmD7KaXjfUNIQAXwh53rdBVzhn8ah0HoBb9guvJw7nuHOUh4W+wwsBD07rOU7NsFbCuBu0Jl/DKAwSJC5DWsf4KOniGhMTfPQMHbrLnl4OrnvLNLxZXdufYa48WBLy4G0xmggjlx2ZE/Xqfg0IjRwz9kNXHnrtvLrNGpsM4g0zb06qLSWqGDB1aR91fIRw4C/b3ET/FWcpDUVz22ZBxVZ/15M1ToAL145UXmeZc5nNef1YB2HeoOyREstuUlnbVH71S5i/IiC4hVQKaPxDaEnZyDxfdldA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB6986.namprd02.prod.outlook.com
 (2603:10b6:5:22e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 23:40:43 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 23:40:43 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v5 12/14] Hexagon (target/hexagon) Remove
 gen_log_predicated_reg_write[_pair]
Thread-Topic: [PATCH v5 12/14] Hexagon (target/hexagon) Remove
 gen_log_predicated_reg_write[_pair]
Thread-Index: AQHZNcdSeG4e8AtUREqUmZpgYiglAa7eNdWAgAVm2xA=
Date: Mon, 27 Feb 2023 23:40:43 +0000
Message-ID: <SN4PR0201MB88085B64AB895EC4C6BE035DDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-13-tsimpson@quicinc.com>
 <60f644b7-bdd3-0161-2156-75ee9039316b@rev.ng>
In-Reply-To: <60f644b7-bdd3-0161-2156-75ee9039316b@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM6PR02MB6986:EE_
x-ms-office365-filtering-correlation-id: 91899f3b-6e59-412a-8bd4-08db191c0aa3
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g3tUaVatGEtQlR5v2iwYpRVbXsBaMQlxVGsvdvbRPcnTneAzQp8oxvCWIsqjv24WvO6ZJGJYE5El5vFHHa1iVKls8cM5Gv5hFtZ6U7V/uMp5w7+zLN3xgne422ij7f/kyfOd5VR7xw+gzRG7tf7xsl1wSPTZAktr7UQ4bfaqLQYAbuTDy3AQTO+RzCqsfSLjN+e9ZNdyQLzBCWiHza6P5wSWw1IbJ0CZBrFXo/hsthq8Kr1CPQgz51Lk3YZhRvpKe0+dDq2cNnM9tzmn5pJwxhP6pH2diOz7CSx49OuX7lL8vQnAD//TrqJYsNWKsSAbARzZlikcGDOBpKGSxFQbEwU8yUls+xaB/683NnHgBWn+GE8//4cQNcfTLuscHMg+9i1xbCiAmCZOeQpciF5xbQoMW7ZgB0eXZTAuFfsv0HcmmUtgll+bE4MKqJrPEYU5Qo1JH32gKvIHQvzoFCW/OnCgZXpykxXGqHD9/+3fsZplStQ1U2jpKctqPWs5FOu7seu+2lxqpn+JBofHT/VlrUx/aEtPS6g6h4ulbdgnxSU7nhM+SDLXee37Li5QJJG74/lz9billJhc5PXHbHdWE6+N7aPbOmWazLtSstDPAJSASx7gdbsCY5lXXNJkGXPnIWIn7Wm5yVDx0ueBw1RyVP1k4/aSv90t1cK06W74PPGXG3SqXPQl3Wz/UPIUvcSXQsW6UTYbTTbIqb/3S5zB+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199018)(110136005)(83380400001)(33656002)(316002)(86362001)(54906003)(64756008)(9686003)(2906002)(8936002)(5660300002)(71200400001)(76116006)(66946007)(8676002)(4326008)(66556008)(41300700001)(26005)(478600001)(6506007)(53546011)(186003)(66446008)(107886003)(66476007)(55016003)(7696005)(38100700002)(52536014)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmhaMlBkTFNTR3o4Rnp0d0ZHZU92UGVCM0lONjdNVlpWbzFVUmh1eGxBRWs4?=
 =?utf-8?B?bE9jaVA2YThDVGw2ekU1VktqMUZId0NrYStFeVRPdnRXRHlDdGM3NFdQUWpE?=
 =?utf-8?B?VFl3RXUzVDRjVFhPQXhZeGNsaUFNS1g1MU9LT3lOSVliM3VkYXFKblNRdVNN?=
 =?utf-8?B?NUxkdDQwMStnQ3gzVFRrS2hiQTBSejFhUUY4T2NmN1AvT1ZvNldXVGdIVFlH?=
 =?utf-8?B?WmJxSk5nYTNCM1lzOHhoMGJqTDBmLzlHNzFkdi9CeERSNFR1cXRuUGovLzVr?=
 =?utf-8?B?MnI3Q0VYWDNXb1VwejZOUmw2U3ZhbVplZXFYcW1QYnpkdDc1ZUk5eUlES1hH?=
 =?utf-8?B?aVVnU29PVXl6cG1HbDA0NUJqd09iUFN3Y3lOclhJRFFwWExYV3pQSlRwTlhN?=
 =?utf-8?B?dENkdUZxb0xuTWRTQjBGdVJDVFNzQjZwM285enFJM0JUd294Zkk3NnZzUG5C?=
 =?utf-8?B?LzZOdUxiaTh1bjhOQnFwcDB0SldjdlM2b2xnOTRYK3BwQXVGcEdKOWZFMmhD?=
 =?utf-8?B?VEgweG1jQ2EzbHJpcVptWUNKRXY3OWcrd0VRbnpVdHdLVWtaZmEyTmQ1cjFo?=
 =?utf-8?B?b2Z4eWR6bDZBaysrT01WSUxKdkNqUXVMUE5DQkkwRXlwTkZ5NHhYb1J1U0Rp?=
 =?utf-8?B?Q1RHWkc0UXViOE5GOXJ4cEh0V0pKVERpNHNmMGREeU43bVhBd0hYcHM0S1ZG?=
 =?utf-8?B?MTZxWHZPT0xTa2tEMGlkeDdvUEVsUEwwTDFQajYyMGxoTld3ZUc3NkpGZW8x?=
 =?utf-8?B?SmZxVHV2V0pwWU5TMUZsYk5uYlZ6V1lwTlBBbExHRWx5dUM4U2FpMk1mYzNH?=
 =?utf-8?B?WWJ2bllqdDdqT3dxL2NTQXh6Z0VheXJHN1pnRDJLVTJqRHI0TW9BUm44MnBO?=
 =?utf-8?B?aXJyY01ZUmV0TFZ5QVRnaGZITnh2Q1dleGwwVk1GYlduKzBZU0VxRnhtL0cw?=
 =?utf-8?B?MmxtakNoQ1lSTVh0bGRZNWR1Vkc5TXhyMkxFRzhTaGNZQk5IRFdRY29uUHFE?=
 =?utf-8?B?SGdLZWZpRkE1eHFzbEM0VURhekRlazZiNVNLSlJQVVNwbm1BRTNvdlBGS1k5?=
 =?utf-8?B?Z2RuSU05bVlZSm5RSjdIR0dBVSs3MzFQbnhhRG5sYVVpQ0N2K1A1VDBjNXFo?=
 =?utf-8?B?MHB0ejVVS1N3OSt3M2g4RFBjMk5EM1BNRktRMlVJbGxQN1hFTGNlK1EzMG5H?=
 =?utf-8?B?NE5ZbW5ueXJVV0VjcVVmdkt5UHJPZ0Z6QVhFWnhWK240OFltL3FNWTZURUto?=
 =?utf-8?B?WVl2M3UrZ2kvbXZiRUc3ZlVoSmhjUkRPL3NEUE16UTRWTGNpWHBCOVUwYTFy?=
 =?utf-8?B?b3VnVjV0alQvVUppQVNaMUNWdEtGaTRqVnNjWENFZXlnZy9sOUM4S1JDaHYz?=
 =?utf-8?B?OE1NQVRmcGtMSlRUdjV6dzRQOGNNSW44ZHc1bnFRNG9VeVNJcW5ZWVdZUjAz?=
 =?utf-8?B?bEtDVC81ZXBQeTUwTWFqS3lUekxmVVNoTElzYlJNcTB6NkN1bUY5cHF3Rksw?=
 =?utf-8?B?ZmR0Vml2ZDJ4Q3ZFemc5WGpTbGFISEUzWGdQVm5WWWF1M1RuZEc1aHZiOGtQ?=
 =?utf-8?B?eVp0QWQzMkJFM1VBTngzdlNCRzVvZGhLRFhZNXRPUVF4QkUvQjNpOWNlSHd0?=
 =?utf-8?B?TnZNeWhNNm9TekdQSUZzODg5YUJiaDlTZjM5dnRYaFF2NUpSTHBOTjBmUU9T?=
 =?utf-8?B?RGNtL2hHUWI1elZSYmhyOStubCsyREhaZ2dpV1Z4YUVTU2t5MHNuTXJMQllS?=
 =?utf-8?B?YmQ0SXJqVzRORVZlWDJya0pkNHh1Sks2MEhUSytiL2lzQm5MMlZZaTYycERH?=
 =?utf-8?B?Q04xREJwKzVKK1hHMkE4UCtlbmdwNXpyS0U0UDV6MFdFd3o5TG0yNk1SdTZ6?=
 =?utf-8?B?WmpWUG8zbWVVTGhNVFQ0cnR5bmtBelNMMUZ2aDVyVmhGM0wzL1BsZmxoaldt?=
 =?utf-8?B?b0VqVmRXc1NndzgwNE8rTHE3aGMxdHhOWDkyd0pQMzluOWU3ZHd5aXdVbmx4?=
 =?utf-8?B?WklIM0ZzeURlR2RRSXp1NU9TVVZtUHdFVXdQN0dWZzZ2U05WaWJMV3JQY2tG?=
 =?utf-8?B?d0JlREp6UGpIVDdCcktWTUg1VUhQcFZDQjROV1BaczV5K3hRSy92dW1KZitp?=
 =?utf-8?Q?pnXTKDl4QtKnFwZza4oAuqtb3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: z8E8qyCZX3iPsEGlJeqvUPGu44WV2J+hAmaix3Ur3Dk0sRCMhE+AAj0vPGsMYSqmf0kzhnaZ2wkkS1kARyjR1QYaiTmop8UJULewh7lpOKpi/76yhbOUNQAYXaF8WWXmz6LC16aSIsERI1UW8ox6X6ORhVv2QdKVtHuRn/JLRJynJFc1i1pTKR5dtrDNtGZFP4TK4mSSlgpEqqyv5eUHc26hamoBzRhUX/6Vw5mp1jPkO4THzzJzeULO0nmbeISqdLVVmyjBApZ7mTeefgo+WFwMxHxFcNUmvU6q1t3hU6hmKTBtVLO9Vei4eZQVeLfNp9ZbyGDfS3UXLjy/JBGNf9iJ3MC85dSq9ALSKlZwMVLKFaQ4wu2KnGoXEodGGZ3xcsFE0kmVT/7S2q6DcaRvXUMYF6piD9YDtgZ9h1sEHACLAVC/BKDzSeTmHqSxcLfObuANqTHlXK6n0w2sDrZzY2DLpMnOeHWsl7vWd5POAYKQJHcdIfqR4fCI3OMp8fKoPNY93k+QYNIqx6R8Wd0VoxfW09NURzF27o8vOyKnclCtB+Iz67qivYOFhOWWADH1oTSOBjjZ0UkzSgxG1zfRKPI2DfQ1c9tZkALyx7Z95zW/JHENv4r7jk1RmHGM/8DHmNmPWXa2VOnYVyUB8NUY6UkTj+5Yjj2gQgjHoZWENLh0LbHZb1ZUaIdzR5cevcYz2JLPrwDOtdAt4opzXhRoHYcTRHliQ86HJkO7rBuHCIgi7iDtd+Bfl/X3Y2f7+mtepIYRtzO6o1QanmkJgvT0m9wLLaGRwIXyBNcwHGYRrnHS5i+mvGn7q7WWNLr7WxFg
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91899f3b-6e59-412a-8bd4-08db191c0aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 23:40:43.0999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pv0lrgzh/KT2PKokth9b5s2Tn1HCaAch6Lq44jkB6I1Ai3znlnBxhfdFBEn6uLKJUeZVKDHwKyk/7VNxV0SuTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6986
X-Proofpoint-GUID: EoDU4CDZW0nauWCWpXfYSCNbn60-QBMK
X-Proofpoint-ORIG-GUID: EoDU4CDZW0nauWCWpXfYSCNbn60-QBMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270190
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAyNCwgMjAyMyA2OjA2IEFN
DQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBxZW11LWRldmVs
QG5vbmdudS5vcmcNCj4gQ2M6IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IHBoaWxtZEBs
aW5hcm8ub3JnOyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT47
IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTIvMTRdIEhleGFnb24gKHRhcmdldC9oZXhhZ29u
KSBSZW1vdmUNCj4gZ2VuX2xvZ19wcmVkaWNhdGVkX3JlZ193cml0ZVtfcGFpcl0NCj4gDQo+IE9u
IDEvMzEvMjMgMjM6NTYsIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+ICAgc3RhdGljIHZvaWQg
Z2VuX2xvZ19yZWdfd3JpdGVfcGFpcihpbnQgcm51bSwgVENHdl9pNjQgdmFsKQ0KPiA+ICAgew0K
PiA+ICAgICAgIGNvbnN0IHRhcmdldF91bG9uZyByZWdfbWFza19sb3cgPSByZWdfaW1tdXRfbWFz
a3Nbcm51bV07IEBADQo+ID4gLTE2Nyw2ICsxMjAsNyBAQCBzdGF0aWMgdm9pZCBnZW5fbG9nX3Jl
Z193cml0ZV9wYWlyKGludCBybnVtLCBUQ0d2X2k2NA0KPiB2YWwpDQo+ID4gICAgICAgfQ0KPiA+
DQo+ID4gICAgICAgdGNnX3RlbXBfZnJlZSh2YWwzMik7DQo+ID4gKyAgICB0Y2dfdGVtcF9mcmVl
X2k2NCh2YWwpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gICB2b2lkIGdlbl9sb2dfcHJlZF93cml0ZShE
aXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0sIFRDR3YgdmFsKSBAQA0KPiA+IC0zMDYsMTIgKzI2
MCwxNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQNCj4gZ2VuX3dyaXRlX2N0cmxfcmVnX3BhaXIoRGlz
YXNDb250ZXh0ICpjdHgsIGludCByZWdfbnVtLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFRDR3ZfaTY0IHZhbCkNCj4gPiAgIHsNCj4gPiAgICAgICBp
ZiAocmVnX251bSA9PSBIRVhfUkVHX1AzXzBfQUxJQVNFRCkgew0KPiA+ICsgICAgICAgIFRDR3Yg
cmVzdWx0ID0gZ2V0X3Jlc3VsdF9ncHIoY3R4LCByZWdfbnVtICsgMSk7DQo+ID4gICAgICAgICAg
IFRDR3YgdmFsMzIgPSB0Y2dfdGVtcF9uZXcoKTsNCj4gPiAgICAgICAgICAgdGNnX2dlbl9leHRy
bF9pNjRfaTMyKHZhbDMyLCB2YWwpOw0KPiA+ICAgICAgICAgICBnZW5fd3JpdGVfcDNfMChjdHgs
IHZhbDMyKTsNCj4gPiAgICAgICAgICAgdGNnX2dlbl9leHRyaF9pNjRfaTMyKHZhbDMyLCB2YWwp
Ow0KPiA+IC0gICAgICAgIGdlbl9sb2dfcmVnX3dyaXRlKHJlZ19udW0gKyAxLCB2YWwzMik7DQo+
ID4gKyAgICAgICAgdGNnX2dlbl9tb3ZfdGwocmVzdWx0LCB2YWwzMik7DQo+ID4gICAgICAgICAg
IHRjZ190ZW1wX2ZyZWUodmFsMzIpOw0KPiA+ICsgICAgICAgIHRjZ190ZW1wX2ZyZWVfaTY0KHZh
bCk7DQo+ID4gICAgICAgfSBlbHNlIHsNCj4gPiAgICAgICAgICAgZ2VuX2xvZ19yZWdfd3JpdGVf
cGFpcihyZWdfbnVtLCB2YWwpOw0KPiA+ICAgICAgICAgICBpZiAocmVnX251bSA9PSBIRVhfUkVH
X1FFTVVfUEtUX0NOVCkgew0KPiANCj4gSGlkaW5nIHRoZSBmcmVlIG9mIGEgVENHdiBhcmd1bWVu
dCBzY2FyZXMgbWUgYSBiaXQsIGl0J3MgYm91bmQgdG8gY2F1c2UNCj4gYW5ub3lpbmcgYnVncyBk
b3duIHRoZSBsaW5lLCBJIGZlZWwuDQo+IA0KPiBBbnkgcmVhc29uIHdlIGNhbid0IGtlZXAgdGhl
IGZyZWVzIGluIHRoZSBzYW1lIHNjb3BlIGFzIGFsbG9jYXRpb24/DQoNClRoZSBvbmx5IG9uZXMg
dGhhdCBuZWVkIHRvIGJlIGZyZWUnZCBhcmUgdGhlIHBhaXJzLiAgVGhvc2UgYXJlIGNyZWF0ZWQg
YnkgZ2V0X3Jlc3VsdF9ncHJfcGFpciwgc28gSSdtIHVzaW5nIHRoZSBnZW5fbG9nX3JlZ193cml0
ZV9wYWlyIGZ1bmN0aW9uIGFzIHRoZSBjZW50cmFsIHBsYWNlIHRvIGZyZWUgdGhlbS4NCg0KQWxz
bywgUmljaGFyZCBIZW5kZXJzb24gaXMgd29ya2luZyBvbiBhIHBhdGNoIHNlcmllcyB0aGF0IHdp
bGwgZWxpbWluYXRlIHRoZSBuZWVkIGZvciBhbGwgZnJlZSdzIPCfmIoNCg0KPiANCj4gT3RoZXJ3
aXNlLCB0aGUgcGF0Y2ggbG9va3MgZ29vZCwNCj4gDQo+IFJldmlld2VkLWJ5OiBBbnRvbiBKb2hh
bnNzb24gPGFuam9AcmV2Lm5nPg0KDQo=

