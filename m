Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B267C0CF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKpB2-0001c7-AW; Wed, 25 Jan 2023 18:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pKpAz-0001bw-8Y
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:27:33 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pKpAw-0001pJ-8S
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:27:32 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30PNRBjl008092; Wed, 25 Jan 2023 23:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=hO1U5vo/fQUI7S1wGx/kNqFYSmrHz+RwZRZdKAk+e7Y=;
 b=DJU//kYKl/QzvEFGH7+fu0SQuGkQzlok5G+0AWvly0w+cv0lMdcS0vl0sC7XE+ehEzGd
 I2nFdqvslO3CPys4ZbMaIfx5Pv0p7k4WVupXKXdtZK2GshHgxdwX8MTlMaXOkfEQrsec
 t1Jexod4v8ftqpiDpsZerZiVtiXYN3POjx+TM6ZX9emOXTbuBc/RagIHh9IsnAy8PsK2
 tgVPWHdAtmoEOdmArXM/btksyGhPVsthHGA8S+FJ2wJ8lDw33iC8y90ewHT+QQ+3QJTb
 goXzCtZofpYcVxy+LMIdz+jb7z6sXgFJf+9XvSfprw/87qT/dOrmsrMAXJuL82YVgQwd bA== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nbd7ar2ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 23:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+HCAX0XXzBVrIUWMXJSqLGbttm+JTH9wz13nDB5G8vYb2dSg5YPsubKKLLRLqDXWDKmGyiVUQWi9/3begZh925sCWxTOr7jYh7lS3Y/tNOv0Qc9kxop5Jk4Szf6HfvL1uSMlc0pzUXmK8GMdRZyMs7HEMdwnJHEWwNz/vNfogvfCBsEZnD4xWwJpcjuq0h+IIQRf70LlPo/uueb/fc+26CV45KqB8nT+WYj/nfe49gPL4foyYxUALlBh/0ooDJbd4DFkzYuQkRFpz2N1TfRlkGWYdv4QUDPoKgIw5vArU2E6kIDOjcgzT4PAoAcEM++CEy7SnLXdpccZ5TLPxTzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO1U5vo/fQUI7S1wGx/kNqFYSmrHz+RwZRZdKAk+e7Y=;
 b=CR3nd4oib6XGYo8GuycfbAS+8mAvdgsk6zYGxTh25BtZYFyrpx4h0n3BRvKtNOtLxiwmhO/5Zf8AjiP4NUdIEp2krw2+Dse4vhM5bbZqFcBLjUnB6GhB7EEttQqfn4kuQ3JSPbeZGL+dY1zlXwUnjQBmg7oroe0XTXAhlneOPhY3Fb/ZuRCm2l5Skpa0YbGrydPKCzffmcs4QGRNvuI/cNXh4uzIrv9+fS1tpiRmgFUWkWHQ3UDP8D05mh9gABUIC4u9frmduanStsDZp3pj7PIQQlwCzRLh28kMzlQJCnppgioT7H5Up7UyLnsKXbs5LjI+ZOCE1FSXY5JqTwb9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by CO1PR02MB8361.namprd02.prod.outlook.com (2603:10b6:303:150::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 23:27:23 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::2761:5a1d:f4f6:c64c]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::2761:5a1d:f4f6:c64c%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 23:27:22 +0000
From: Sid Manning <sidneym@quicinc.com>
To: Sid Manning <sidneym@quicinc.com>, 'Richard Henderson'
 <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, Mark Burton
 <mburton@qti.qualcomm.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>
Subject: RE: ARM: ptw.c:S1_ptw_translate
Thread-Topic: ARM: ptw.c:S1_ptw_translate
Thread-Index: AdkgXLziuM3BStbISnGE/4d6gqc13AAa6raAACPXc6AD7G5WkA==
Date: Wed, 25 Jan 2023 23:27:22 +0000
Message-ID: <BYAPR02MB550960AECCDF2B28D2C4F8EABECE9@BYAPR02MB5509.namprd02.prod.outlook.com>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
 <a07b1be0-7ee2-9b7b-a2d7-7d2435f25007@linaro.org>
 <BYAPR02MB55099839E05FC89E5EBB9D9EBEFB9@BYAPR02MB5509.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB55099839E05FC89E5EBB9D9EBEFB9@BYAPR02MB5509.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5509:EE_|CO1PR02MB8361:EE_
x-ms-office365-filtering-correlation-id: ee2ff331-ce06-47e3-275b-08daff2bb5cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D/R2W79dmBhbkkySqEzMdd6DBF3dVfFJYuWb6eCef6MW0AmtEOG1A6jCx+cQAlr3ucKO6K1FUF0oSHGfzZ6TNj67mMfOtW1sd+La6hH6nGxII5bUfv3uzGaRfqiw52WJRxUWhPJpH0VVj8d2eYh2Qt7e1LJwOqmPYFC/zXRB4krHM8hLMmRMAAyt6xmI2poVJW0S68Y+nHQLEvdTKzNBM+Z4PC8bTIumUuMrpw1A4iOuOkUC1rCT6tesvIyUif/fVHSRnEg1y4jgAjdmhL2IXdr+4H+6W5pi0qRFxstBJEWZMfBTH5mtlGkBOI1ihQ+lNI+Ig4pl31B7CqzXgHZnEVoljPi+ROPnKJ+xiQM6/3bz5zV0n4VV3sg7C2If4ZVw9HOiZJ+YRXwweV3i1BIvknlguUIU/132UpEiqvuoUgTuz25TvtQuNGCjiVSrc64FADLZsP569p4ZLDNkknHHGgsllp8aKfjoCvng5O10zvkL5SyV58OH4B2k5a1dBj2XjOSiGuaczksWdN9N2a8eDZAmI7GsI9u7SovD1xHzB8jpQOwPI8H0RRh5OUNjsv8vC2EeyJOjL48ia3TZEcVdqQbMxkuaYr9LNoglk1iCyuyz3uIaO8fScLq+J74Cap8/aU0MkANW7w0rGO5TOn7BFtS1LeEr5XvGZLHT+0mu5B76TDyOm61Z/2DofaZsUkQeHIpRwWVutS/Z4G9kV6PeCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199018)(64756008)(5660300002)(52536014)(2906002)(66476007)(66946007)(8676002)(76116006)(66446008)(8936002)(4326008)(41300700001)(66556008)(71200400001)(478600001)(7696005)(26005)(53546011)(6506007)(186003)(9686003)(83380400001)(38100700002)(122000001)(54906003)(316002)(110136005)(55016003)(38070700005)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wmg0NHhUQ2I0elBPSjJtWmViMXF0Ynlib3owTWpUanQrbmxkUUxPanp2QllX?=
 =?utf-8?B?VXhGeHpEQWNSVGZpdlgzZG1kYk5zZHFFL1pRZFo3R0o0WEVtanArRmtta3cy?=
 =?utf-8?B?ZzVtR0FUYjVTTUsvajlBTGZpSE9KclNRZmRMMjUreEtqb1lhbC9PME9lUGZt?=
 =?utf-8?B?ZGpiUjRndmpNOUIrbHozNTRNR1FmVVVhbkFlVkFVMnhRQ3psVStTc0RuWnlX?=
 =?utf-8?B?Vis2bjRtNUtVY1hPejhYY2Yrc1FmWHFLNUVBOHMrRXdVRm5mblArKzdTVy9o?=
 =?utf-8?B?S0Qva0hlNXJ4dHJsUmFZaDF5ekg0QSs1RUZLUE9jNUt6NEswbytxZ21kODVx?=
 =?utf-8?B?K2REMWFwUUlleldPNVpYYUJKYjRLZlBobjdHK1NWL0JGeklnYlBiNnVVd0lu?=
 =?utf-8?B?NWFxbjhtbGJCeEdsSCt4NDVqM2FVaGVRbDdoK1FMT3dFUDE3RGFyMEV0WUZL?=
 =?utf-8?B?UmdhYldIQS9wTC9CR3BRR2p5VFZvQ2RFblhvblFVYTFFUlg2VllXeW50NWJS?=
 =?utf-8?B?YmtYeUdCbWt6YnRMbnJ0eGtqTE9QQlZLRktWMXRMVnAxdkxsUmFOc21NMnc1?=
 =?utf-8?B?b1M4MC9UeUVhaUMwNzlVbVdSRWxyZE5ISDNXQ3BYMjRjQW1idWZPekkyd2I0?=
 =?utf-8?B?L2oyRWU5cHVFbUJoVEx0Qm42TnVLRzUxb3ZudUk3UzhmL1ZpS2JZQW1jQ2pi?=
 =?utf-8?B?QXBLM3E4MzIrQ2J0eGhNR3RjdzJDdWRqUkRIMkdvNCsxTUk2aDVIZ0FUVkNy?=
 =?utf-8?B?eDBqalV4TFhWbmN0ZVM4a0EvWGsyNlF4aHNOL2ZmUnl1cHE4Vk1abnpLcHA3?=
 =?utf-8?B?YU1SOUFGOWZLOThScDFHNTdOTnZZdWZzY045aFl3UFkxLzUzTXFnTU42bVlR?=
 =?utf-8?B?bWZmM0t5VXUyL3dCWXBIR3NZUzRDWXp1YWVscnYxeURkcitldVdUOExEanYz?=
 =?utf-8?B?MGtiTW4yR2J2eWF1N1Btc0E3cDZ3YUMxS1FqR1hmd09oaXJQdzR0WXNZM0Nr?=
 =?utf-8?B?WFdxTUlqYWlUSzl3cGNwaUNHZ2Y4cHdZMUNrQm13bkltelFJai93cjZPT0ZC?=
 =?utf-8?B?bUducTBodGM0UnJSeGVHMjIvc3JkSWZDUUI1N3VpanNDbVNLd2xuSnUvbUda?=
 =?utf-8?B?OEo3ajBaamZMeVZKM3J4dDhvYlNIemdQYlhxcThNSTYyb1VzSHlEb3FTbWt0?=
 =?utf-8?B?V2hQd2ZhQld0eFJ5Q01JU1pOSDZ6N2dYaG1mcVhiM0VrM2ZOTURMUzQ1MmZR?=
 =?utf-8?B?RHBkTU9NOU5weVlmdDBTb3Q4ZVhWNUs2Nkw1c3pUY084UjRjcm45Q00vMXQ3?=
 =?utf-8?B?UExHblcyaFR2RkVOUGp6bGt5MFpNcjA1OHRZYW9DbnFBUzk4ZExmTzEva0xJ?=
 =?utf-8?B?UCt0VHdsZFZkNTM4Z2hVa1AxT3BJZnhQUTgyNzNrT21NanluV09PREhtTCtM?=
 =?utf-8?B?cmM1K3Q3M3NiOHovR0pjWnllUXNmVG50c0FXSXJxcTRYYkNiZkxPNkdQYzcr?=
 =?utf-8?B?MmhRNmJlZHhmaUVOcWdodmh6TXR3cHkyejQydUorTXdadnl3ck81TGR4QU9I?=
 =?utf-8?B?VFl5bEkxU3o0dzU2SVYrQ1E5S0ZhTFZDU3ZRWHh1alJDV0RFTWw4T0JEZXdo?=
 =?utf-8?B?L29TVndqYTc2YWxmcWlDQ3o1STk1Zll0UUdhOXB0eGpYMlFiaEpuUzJwY2ZD?=
 =?utf-8?B?Z3BKanVqeG0xOTg2SU1ZUTBINDRJdmJQK056TXZJNVFBUEJuN1J2Sm5ZeDJL?=
 =?utf-8?B?cVA4YlI5U0Y5VHZWbU43RXI3RWkybXhiVEo5cXdKc3VhWktZWm1PUGFWTjE4?=
 =?utf-8?B?OUdRVFJGUjdadmJBRmc2RUdGVEhBMnYzc3FKNnRveWRXam9pbTNVbHczeUYr?=
 =?utf-8?B?NTFUTCsxcC9Fb2ZrWnN0OE8xRUloekhhQW0rNDRNbi9neVpnZlYvVU5TTFBp?=
 =?utf-8?B?WVBCUWF5Yk9sNS92RDk0YnJUN29EbXlhV1JNcU53WmZhNkN0am90TlhRSFhM?=
 =?utf-8?B?MzNPMnU1Q3A3ekZsQ1lpVVQvWWRzdzJZREszNDRyQTc0TUdoYnpBNUp0T1h6?=
 =?utf-8?B?dFcxd1pQZWpNQnlpTml4WlVXR0htRmlIbTR2ekNiSDd1NVQ1SkpjaWd3bG9l?=
 =?utf-8?Q?4MacaB/rVXTaeCkSSKX/uC3gd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7NOXliZf64P3tuSsD0swIoY/FXNEX+nrlGcCtFPLYwGF0v6su6K5jwMNke7dWsYUNaaWW3MpiRdt/d2hYn7MnNNstLIQqlvCOmVpBKjvBawdE2NragAIW/kgHdh07416BuNRf5o/xZkMdppH31Q/9O1B40iJZGL7wFVDmgojQGr0F1X4/aRqE1My/OVfnhTwwwURgV1FvoBWLn997Rp0FJ/fVUyqN7BlbEfvB77tp/arPPPjc0I6ntw0HauT9ywm4v27XM/Zy1mfnvE1d17ZeGj6HEUDdcV7/Rbl4+OfdG9/nm4p4k4HTXMO2fweAZe0/ZaNfQ9RmbcaVgWSFCPyvW0g1UVixuHPqMF5NZ2Li+WkAEpAeHtogr9SnDdOS744xjnYdUtWNP8XaFS7qO3ewcs4TH41Bw0cGRGDJvPppwy5GKGwqkAdLwUNkpic5KRn5clotBkfn5d0ZOGGPNFk+b3fnGXtF+b1+NcEjXTfNZRj6N7oX+xnOUIDZRtLyIZM/pHypX3E/3h8bb8ogeFsLhkLosWFmph7q8D0tpIbC9yIK3qCyctW/G54QkH5/4H2tSoYMDqZuI8Ddwcjm3bf3LmX3BU6W97Zsyuem8aDOfJkK2ia/0+PUiBRujlF2xf0Rc760nU7r0NndWb4dvTLoQhcAEdfr0f+NQto5/0WSt8bUGHxThq0yPcLUg22ZY5Yicp6GJ02PxJz40gcJ/6Ate9kAXHC6XeYf2rfnypkyEBwVhBnt76I3KtNKa4LfQUWxm0GVTh8Q17zo8XTvh4aEiEZxaLU7Sdu6g3gQKH03c0=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2ff331-ce06-47e3-275b-08daff2bb5cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 23:27:22.4806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RjraVxu/aLLeCtlQY+gx2EeWWVcIhP5EdgbXdrwKBTIJcAU2qgqyWXJXe/rmP+5a+Fj26mvFuSFBu74sV6P/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8361
X-Proofpoint-ORIG-GUID: iWfdoiC-ad3FBNuPrzRz_rUOpbp4TX6r
X-Proofpoint-GUID: iWfdoiC-ad3FBNuPrzRz_rUOpbp4TX6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_13,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=755 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301250209
Received-SPF: pass client-ip=205.220.168.131; envelope-from=sidneym@quicinc.com;
 helo=mx0a-0031df01.pphosted.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogcWVtdS1kZXZlbC1ib3Vu
Y2VzK3NpZG5leW09cXVpY2luYy5jb21Abm9uZ251Lm9yZyA8cWVtdS0NCj4gZGV2ZWwtYm91bmNl
cytzaWRuZXltPXF1aWNpbmMuY29tQG5vbmdudS5vcmc+IE9uIEJlaGFsZiBPZiBTaWQNCj4gTWFu
bmluZw0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA1LCAyMDIzIDc6MDggUE0NCj4gVG86ICdS
aWNoYXJkIEhlbmRlcnNvbicgPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBxZW11LQ0K
PiBkZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsgTWFyayBCdXJ0b24g
PG1idXJ0b25AcXRpLnF1YWxjb21tLmNvbT4NCj4gU3ViamVjdDogUkU6IEFSTTogcHR3LmM6UzFf
cHR3X3RyYW5zbGF0ZQ0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20g
b3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0
dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDQsIDIwMjMg
MTE6NDIgUE0NCj4gPiBUbzogU2lkIE1hbm5pbmcgPHNpZG5leW1AcXVpY2luYy5jb20+OyBxZW11
LWRldmVsQG5vbmdudS5vcmcNCj4gPiBDYzogcGhpbG1kQGxpbmFyby5vcmc7IE1hcmsgQnVydG9u
IDxtYnVydG9uQHF0aS5xdWFsY29tbS5jb20+DQo+ID4gU3ViamVjdDogUmU6IEFSTTogcHR3LmM6
UzFfcHR3X3RyYW5zbGF0ZQ0KPiA+DQo+ID4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVk
IGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlDQo+ID4gd2FyeSBvZiBhbnkgbGlu
a3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gPg0KPiA+IE9u
IDEvNC8yMyAwODo1NSwgU2lkIE1hbm5pbmcgd3JvdGU6DQo+ID4gPiBwdHcuYzpTMV9wdHdfdHJh
bnNsYXRlDQo+ID4gPg0KPiA+ID4gQWZ0ZXIgbWlncmF0aW5nIHRvIHY3LjIuMCwgYW4gaXNzdWUg
d2FzIGZvdW5kIHdoZXJlIHdlIHdlcmUgbm90DQo+ID4gPiBnZXR0aW5nIHRoZSBjb3JyZWN0IHZp
cnR1YWwgYWRkcmVzcyBmcm9tIGEgbG9hZCBpbnNuLiAgUmVhZGluZyB0aGUNCj4gPiA+IGFkZHJl
c3MgdXNlZCBpbiB0aGUgbG9hZCBpbnNuIGZyb20gdGhlIGRlYnVnZ2VyIHJlc3VsdGVkIGluIHRo
ZQ0KPiA+ID4gZXhlY3V0aW9uIG9mIHRoZSBpbnNuIGdldHRpbmcgdGhlIGNvcnJlY3QgdmFsdWUg
YnV0IHNpbXBseSBzdGVwcGluZw0KPiA+ID4gb3ZlciB0aGUNCj4gPiBpbnNuIGRpZCBub3QuDQo+
ID4gPg0KPiA+ID4gVGhpcyBpcyB0aGUgaW5zdHJ1Y3Rpb246DQo+ID4gPg0KPiA+ID4gbGRyICAg
ICAgICAgICB4MCwgW3gxLCAjMjRdDQo+ID4gPg0KPiA+ID4gVGhlIGRlYnVnIHBhdGggdmFyaWVz
IGJhc2VkIG9uIHRoZSByZWdpbWUgYW5kIGlmIHJlZ2ltZSBpcyBOT1Qgc3RhZ2UNCj4gPiA+dHdv
IG91dF9waHlzIGlzIHNldCB0byBhZGRyIGlmIHRoZSByZWdpbWUgaXMgc3RhZ2UgMiB0aGVuIG91
dF9waHlzIGlzDQo+ID4gPnNldCB0byBzMi5mLnBoeXNfYWRkci4gIEluIHRoZSBub24tZGVidWcg
cGF0aCBvdXRfcGh5cyBpcyBhbHdheXMgc2V0DQo+ID4gPnRvIGZ1bGwtIHBoeXNfYWRkci4NCj4g
PiA+DQo+ID4gPiBJIGdvdCBhcm91bmQgdGhpcyBieSBvbmx5IHVzaW5nIGZ1bGwtPnBoeXNfYWRk
ciBpZiByZWdpbWVfaXNfc3RhZ2UyDQo+ID4gPiB3YXMNCj4gPiB0cnVlOg0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL3B0dy5jIGIvdGFyZ2V0L2FybS9wdHcuYw0KPiA+ID4N
Cj4gPiA+IGluZGV4IDM3NDVhYzk3MjMuLjg3YmM2NzU0YTYgMTAwNjQ0DQo+ID4gPg0KPiA+ID4g
LS0tIGEvdGFyZ2V0L2FybS9wdHcuYw0KPiA+ID4NCj4gPiA+ICsrKyBiL3RhcmdldC9hcm0vcHR3
LmMNCj4gPiA+DQo+ID4gPiBAQCAtMjY2LDcgKzI2NiwxMiBAQCBzdGF0aWMgYm9vbCBTMV9wdHdf
dHJhbnNsYXRlKENQVUFSTVN0YXRlDQo+ICplbnYsDQo+ID4gPiBTMVRyYW5zbGF0ZSAqcHR3LA0K
PiA+ID4NCj4gPiA+ICAgICAgICAgICBpZiAodW5saWtlbHkoZmxhZ3MgJiBUTEJfSU5WQUxJRF9N
QVNLKSkgew0KPiA+ID4NCj4gPiA+ICAgICAgICAgICAgICAgZ290byBmYWlsOw0KPiA+ID4NCj4g
PiA+ICAgICAgICAgICB9DQo+ID4gPg0KPiA+ID4gLSAgICAgICAgcHR3LT5vdXRfcGh5cyA9IGZ1
bGwtPnBoeXNfYWRkcjsNCj4gPiA+DQo+ID4gPiArDQo+ID4gPg0KPiA+ID4gKyAgICAgICAgaWYg
KHJlZ2ltZV9pc19zdGFnZTIoczJfbW11X2lkeCkpIHsNCj4gPiA+DQo+ID4gPiArICAgICAgICAg
ICAgcHR3LT5vdXRfcGh5cyA9IGZ1bGwtPnBoeXNfYWRkcjsNCj4gPiA+DQo+ID4gPiArICAgICAg
ICB9IGVsc2Ugew0KPiA+ID4NCj4gPiA+ICsgICAgICAgICAgICBwdHctPm91dF9waHlzID0gYWRk
cjsNCj4gPiA+DQo+ID4gPiArICAgICAgICB9DQo+ID4gPg0KPiA+ID4gICAgICAgICAgIHB0dy0+
b3V0X3J3ID0gZnVsbC0+cHJvdCAmIFBBR0VfV1JJVEU7DQo+ID4gPg0KPiA+ID4gICAgICAgICAg
IHB0ZV9hdHRycyA9IGZ1bGwtPnB0ZV9hdHRyczsNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgcHRl
X3NlY3VyZSA9IGZ1bGwtPmF0dHJzLnNlY3VyZTsNCj4gPiA+DQo+ID4gPiBUaGlzIGNoYW5nZSBn
b3QgbWUgdGhlIGFuc3dlciBJIHdhbnRlZCBidXQgSeKAmW0gbm90IGZhbWlsaWFyIGVub3VnaA0K
PiA+ID4gd2l0aCB0aGUgY29kZSB0byBrbm93IGlmIHRoaXMgaXMgY29ycmVjdCBvciBub3QuDQo+
ID4NCj4gPiBUaGlzIGlzIGluY29ycmVjdC4gIElmIHlvdSBhcmUgZ2V0dGluZyB0aGUgd3Jvbmcg
dmFsdWUgaGVyZSwgdGhlbg0KPiA+IHNvbWV0aGluZyBoYXMgZ29uZSB3cm9uZyBlbHNld2hlcmUs
IGFzIHRoZSBzMl9tbXVfaWR4IHJlc3VsdCB3YXMNCj4gbG9nZ2VkLg0KPiA+DQo+ID4gRG8geW91
IGhhdmUgYSB0ZXN0IGNhc2UgeW91IGNhbiBzaGFyZT8NCj4gDQo+IFRoaXMgaGFwcGVucyB3aGls
ZSBib290aW5nIFFOWCBzbyBJIGNhbid0IHNoYXJlIGl0LiAgSSBkb24ndCBoYXZlIHRoZSBzb3Vy
Y2UNCj4gY29kZSBlaXRoZXIganVzdCB0aGUgb2JqZWN0IGNvZGUuICBBIG51bWJlciBvZiBjb3Jl
cyBhcmUgYmVpbmcgc3RhcnRlZCBhbmQNCj4gdGhlIGFkZHJlc3MgaGFwcGVucyB0byBiZSB3aGF0
IHdpbGwgZXZlbnR1YWxseSBiZWNvbWUgdGhlIHN0YWNrLg0KPiANCj4gSSdsbCBzZWUgd2hhdCBJ
IGNhbiBjb21lIHVwIHdpdGggdG8gYmV0dGVyIGNoYXJhY3Rlcml6ZSBpcyBwcm9ibGVtLg0KDQpJ
IGhhdmUgbm90IGJlZW4gYWJsZSB0byBpc29sYXRlIHRoZSBjYXVzZSBvZiB0aGlzIGlzc3VlLiAg
SSBoYXZlIHB1bGxlZCBpbiByZWNlbnQgdXBkYXRlcyB0byBwdHcuYy9jcHV0bGIuYy90bGJfaGVs
cGVyLmMgdG8gc2VlIGlmIG9uZSBvZiB0aGUgcmVjZW50IGNoYW5nZXMgd291bGQgaGVscCBidXQg
dGhleSBoYXZlIG5vdC4NCg0KSSdtIHJ1bm5pbmcgdGhlIHNhbWUgUU5YIGltYWdlcyBiZXR3ZWVu
IGEgdmVyc2lvbiBvZiBRRU1VIGJhc2VkIG9uIDcuMSBhbmQgYW5vdGhlciBiYXNlZCBvbiA3LjIu
ICBRRU1VIGhhcyBiZWVuIHBhdGNoZWQgdG8gYWxsb3cgaXQgdG8gaW50ZWdyYXRlIGludG8gYSBT
eXN0ZW0tQyBWaXJ0dWFsIFBsYXRmb3JtIGJ1dCB0aGlzIHByb2JsZW0gc2VlbXMgdG8gYmUgY29u
dGFpbmVkIGluIFFFTVUuDQoNCkkgZGVmaW5lZCBERUJVR19UTEIgY3B1dGxiLmMgYW5kIHNldCBh
IGJyZWFrcG9pbnQgaW4gdGxiX2FkZF9sYXJnZV9wYWdlLiAgDQoNCk9uIDcuMSBJIHNlZSBjb25z
aXN0ZW50IFBBIHRvIFZBIG1hcHBpbmdzOg0KDQpUaHJlYWQgMTAgInZwIiBoaXQgQnJlYWtwb2lu
dCAxLCB0bGJfYWRkX2xhcmdlX3BhZ2UgKGVudj0weGViMzM2MCwgbW11X2lkeD0weGEsIHZhZGRy
PTB4ZmZmZmZmODA5OTc1ZjAwMCwgc2l6ZT0weDEwMDApIGF0IC4uLy4uLy4uLy4uLy4uLy4uL3Ny
Yy9xZW11L2FjY2VsL3RjZy9jcHV0bGIuYzoxMDc5DQp0bGJfc2V0X3BhZ2Vfd2l0aF9hdHRyczog
dmFkZHI9ZmZmZmZmODA5OTc1ZjAwMCBwYWRkcj0weDAwMDAwMDBmMzVmM2EwMDAgcHJvdD0zIGlk
eD0xMA0KVGhyZWFkIDEzICJ2cCIgaGl0IEJyZWFrcG9pbnQgMSwgdGxiX2FkZF9sYXJnZV9wYWdl
IChlbnY9MHhlZTI2ZTAsIG1tdV9pZHg9MHhhLCB2YWRkcj0weGZmZmZmZjgwOTk3NWYwMDAsIHNp
emU9MHgxMDAwKSBhdCAuLi8uLi8uLi8uLi8uLi8uLi9zcmMvcWVtdS9hY2NlbC90Y2cvY3B1dGxi
LmM6MTA3OQ0KdGxiX3NldF9wYWdlX3dpdGhfYXR0cnM6IHZhZGRyPWZmZmZmZjgwOTk3NWYwMDAg
cGFkZHI9MHgwMDAwMDAwZjM1ZjNhMDAwIHByb3Q9MyBpZHg9MTANCg0KDQpPbiA3LjIgVkEgdG8g
UEEgbWFwcGluZ3MgYXJlIG5vdCBjb25zaXN0ZW50Og0KDQogVGhyZWFkIDEwICJ2cCIgaGl0IEJy
ZWFrcG9pbnQgMSwgdGxiX2FkZF9sYXJnZV9wYWdlIChlbnY9MHhlYjdhYzAsIG1tdV9pZHg9MHgy
LCB2YWRkcj0weGZmZmZmZjgwOTk3N2YwMDAsIHNpemU9MHgxMDAwKSBhdCAuLi8uLi8uLi8uLi8u
Li8uLi9zcmMvcWVtdS9hY2NlbC90Y2cvY3B1dGxiLmM6MTA5MA0KdGxiX3NldF9wYWdlX2Z1bGw6
IHZhZGRyPWZmZmZmZjgwOTk3N2YwMDAgcGFkZHI9MHgwMDAwMDAwZjM1ZjMyMDAwIHByb3Q9MyBp
ZHg9Mg0KVGhyZWFkIDE0ICJ2cCIgaGl0IEJyZWFrcG9pbnQgMSwgdGxiX2FkZF9sYXJnZV9wYWdl
IChlbnY9MHhmMTg1ZTAsIG1tdV9pZHg9MHgyLCB2YWRkcj0weGZmZmZmZjgwOTk3N2YwMDAsIHNp
emU9MHgxMDAwKSBhdCAuLi8uLi8uLi8uLi8uLi8uLi9zcmMvcWVtdS9hY2NlbC90Y2cvY3B1dGxi
LmM6MTA5MA0KdGxiX3NldF9wYWdlX2Z1bGw6IHZhZGRyPWZmZmZmZjgwOTk3N2YwMDAgcGFkZHI9
MHgwMDAwMDAwZjQyYTE2MDAwIHByb3Q9MyBpZHg9Mg0KDQpVc2luZyB0aGUgbW9uaXRvciB0byB2
aWV3IHRoZSBtZW1vcnkgSSBzZWUgdGhhdCBvbiA3LjIgdGhlIGZpcnN0IGVudHJ5IGFwcGVhcnMg
dG8gYmUgYWNjdXJhdGUuDQp4cCAvMnggMHgwMDAwMDAwZjM1ZjMyMDE4DQowMDAwMDAwZjM1ZjMy
MDE4OiAweDk5NzdlZmYwIDB4ZmZmZmZmODANCg0KQW5kIHRoZSBzZWNvbmQgaXMgbm90Og0KeHAg
LzJ4IDB4MDAwMDAwMGY0MmExNjAxOA0KMDAwMDAwMGY0MmExNjAxODogMHgwMDAwMDAwMCAweDAw
MDAwMDAwDQoNCjcuMiBpcyBjYWxsaW5nIGFybV9jcHVfdGxiX2ZpbGwgbW9yZSBvZnRlbiBub3cg
YW5kIEkgZG9uJ3Qga25vdyBpZiB0aGF0IGlzIHJlbGF0ZWQgdG8gdGhlIHByb2JsZW0gSSdtIHNl
ZWluZyBvciBhIG5hdHVyYWwgcmVzdWx0IG9mIHRoZSBjaGFuZ2VzIG1hZGUgdG8gUzFfcHR3X3Ry
YW5zbGF0ZSBiZXR3ZWVuIHRoZSByZWxlYXNlcy4NCg0KDQo+IA0KPiBUaGFua3MsDQo+ID4NCj4g
Pg0KPiA+IHJ+DQo=

