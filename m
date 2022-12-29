Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059ED65912B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:22:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyLf-0008JL-8g; Thu, 29 Dec 2022 14:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAyLd-0008Ix-4N
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:13:49 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAyLb-0007uW-8C
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:13:48 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BTJDC58004228; Thu, 29 Dec 2022 19:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=iNEftFVZ6TmLLT265j8C3WikkUygfMKLJ4z5/q8jvaI=;
 b=grUw0BFyVqFKvIND2BwfDRs5LTwGsxhI8PRm0ZwkceYlDwHE5JDkYI+ku1ncBU8UL70e
 Zc9LRwmQ3VeIUYeQAwxAlprc2LVj57Ms749BZ5CKeIirG57aiAltTQilk8k+Wzy2o6kb
 yR9KHumWG0UbIV5DmxUgE1VL9Edevh0jcOlHGLeOG/5D4qWK/aIveZq68/dURIRCGT4G
 sacQnRJhkmZ85cMMP6jSILAokk2JZjJcfGGSBr346OMQB5jJBcfVjIeNAXa6yhcmCK7O
 paCjDCdRDpv/irAcvtiKQgd83ZuXhdaTLfJXIY0FmMhAFUQ0IOTt2ZuZcowSkl3lE6ZM hw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrjugtwrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 19:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+dPWUxMjUXZZ/TG3u0YVXG602BGB1yW/a/0ixaUjsKTtzMieKvKUcS/5rU+cb2I4771fyhjGOZnH+3oK+9TQC76MqZon6Y4gjTj4ZZf1IcitcqF1Hg31Z+k0vaQxK+XyWaQtNyKDb/pTcfoV7Urjnc5TnkQwaA2yOfA7y/DCmI4koeTFY0FAzv1i8wqnlzA23cmJjfVXZV3txkMBmb7BIrDK2OTY9VNjA/2Ng7buZeHoi5xlOE97yZzxu14EI9L2Csk7ZW/yvmZehqiRtqrKB+nj+VsKZekFVpiJdGxot9+zMZb2tC1CVS9s1HJzT7iDcgZ1KURLpJrB4PRVKuBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNEftFVZ6TmLLT265j8C3WikkUygfMKLJ4z5/q8jvaI=;
 b=SBjvTIOG1oLyV49IdtxmylMtU81i2oQ6+HJ8RlKH/voHMrmcE2aHn+svzTr9jx7DIX/ovj4jTIMPP67IRuGk+ILGdGf3FiFnbqc3UsfA31NtUXL81/5Sx5fEWtMTEJOGti4nM1ec7QU+FKnIyV/r+8LT8FqcXx1lu14qiq8PX1NlWQq9bSNojitDzbl+xgBY0cyBQUyM6dyLnGMdQ7qozDEwDbcgHySOkM0nUam05KybYcWBJ8CwTr3jzSADU4mz7QNYXhjQa4VE6jlB/gv25HNYpavct2bV7tVhMY8Cud2cQGpYzI+VwQEfEYkRrlUO5u/E8MrZD3W5iRGr/wtJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CO6PR02MB7730.namprd02.prod.outlook.com
 (2603:10b6:303:ad::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Thu, 29 Dec
 2022 19:13:39 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 19:13:39 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, =?iso-8859-1?Q?Alex_Benn=E9e?=
 <alex.bennee@linaro.org>, Brian Cain <bcain@quicinc.com>, Mark Burton
 <mburton@qti.qualcomm.com>
Subject: RE: [RFC] Reducing NEED_CPU_H usage
Thread-Topic: [RFC] Reducing NEED_CPU_H usage
Thread-Index: AQHZGtfAI5NLJkh3sU+jjadG5EKEa66FOQgg
Date: Thu, 29 Dec 2022 19:13:39 +0000
Message-ID: <SN4PR0201MB88083F1463A7AE69C5BB664EDEF39@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221228171617.059750c3@orange>
In-Reply-To: <20221228171617.059750c3@orange>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CO6PR02MB7730:EE_
x-ms-office365-filtering-correlation-id: 3a7d1625-a066-43c0-791b-08dae9d0cafa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: npMpBST246wmsPv6sPXpzmBTDbHNC2ida8Su3tWAbgLlOEVitjiTXQbAVq+sH7AXbKrF0E9KNxncL8z/vV+5kQ13pczwtEhUxO8lj2/sFfr28qU6iCSw7JOj092izogz6ZEmM28jWKaR/z6lS8Qw882Mik6QXTw0ZpdXGGJCNXujGhO4euoqXbVJD1s1Curs1+OJh2S6P4pW3JeLWLDV+5ORcWSCnLrymNhOcX0/HckAN8syROym6nY20CHhoh/0rADssIEaZvEMfu4ijeqFMeIqCeFZMGfR/QLFAaQ6oIm6mraiepyRfKD5/dq2LVk9qr45Hj2tvgQGd3kCrzY9FWaoaFFt6ujQeq6o7Pkr5yKHtViHOTwAhGox9fCe3Gx2Gm4lPnpfPb7LCych5sPv0+JAZV1uoTG9tLMtn8G84/iSPE4J43Zwqw7zj6IS9Gt/by0YPtrWPu+y9vlLbkw3C4iXE8TaoY9r4od74m2sLXU9Oj3JwPSmmL/m/rl03pFY4Ea4h5z3xxKyWPbGyJuX3zesR7cNEiZuCln8KJuUqvNUtHRGbUaLp149JwBKAhU16pwAEoJkCwaQGUC6VCGZCcput0uLGpKsPVVrYTtIldP/PeZK0A76YrflsCzBMUsNtedwNibdamEoqiZyJUYvMnAfPYNTBEv9sCwxuynWfiJSV+H/HKlFowhdaulhNnBD030hEGOcLksm9XbFshd5oQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(7696005)(6506007)(53546011)(26005)(107886003)(478600001)(83380400001)(2906002)(66574015)(71200400001)(186003)(110136005)(316002)(5660300002)(86362001)(33656002)(38100700002)(122000001)(9686003)(41300700001)(38070700005)(54906003)(55016003)(52536014)(8936002)(66476007)(76116006)(66946007)(4326008)(64756008)(66556008)(66446008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7ofHj4Nvn9LqBHh5eEFkVqbsXRkbIYNvBXRDxhQAApFfsDT2DGdxX4roQt?=
 =?iso-8859-1?Q?xZlgq48/pqTx/BL0NvRHSMHYaVaK+C/U3hdJve43uTVKV3jBg+xC8g512L?=
 =?iso-8859-1?Q?tWZqJzMrzCsJ93OaX71fceSgluXRB9Zay9XcbEGiq1V4BJYug9KFxbRA1l?=
 =?iso-8859-1?Q?eDxxrHEeJbLo9aNq844B7Qe0pJp9P0D+UIJnnh2EG1A7OjegNJXLIZRW3L?=
 =?iso-8859-1?Q?x4UGRpLO77QLBNWo0CgIdycf3SJe9J2Pit/knnRcTSI1HNOHEWGpBIeI3P?=
 =?iso-8859-1?Q?hgO/lAtuC553eiOZKE1Vqq+kD3IhaLnstn/zDboCa8Czv9qR6Zh99PY6av?=
 =?iso-8859-1?Q?r2bx6s0UMqYjN4m/p8uy0lMxyi+M9Hf9Y1Fby3sBHP0YJhoFLSr1oBKFfd?=
 =?iso-8859-1?Q?lu2FSSSZh+EPkHqMyyT+Uwm9tE+rpf/C+t5cigYA/nx/ADJ/5dWxNb7LvC?=
 =?iso-8859-1?Q?chPVFhW959FEoFbyi7IKbK7LdVAKRU49mI2hUt+K/La28vHRIhTP/0X10t?=
 =?iso-8859-1?Q?zXQaaYA3XJSrYcvaKlcJ5ZuIdpeqm11GI2jIXDC1XYBlLI1P3JB0ij+zjn?=
 =?iso-8859-1?Q?TJRV/J++NPhGwZHkaZ4zIeML9tjElhqj/aeGEZtZLb6OpBUcCGC0aD5b/y?=
 =?iso-8859-1?Q?kWCvB78rdkhPYjIxRp86q0bIfY0JatTsoohaukwu577f+p4BMntfytWjXg?=
 =?iso-8859-1?Q?4kLhaoXO9w8K97k9r8ukZUJ+xRdVK/XXDaIYhhGEAfQrdHr6ccXCUxL0A4?=
 =?iso-8859-1?Q?+aqz5JVIL9D8eOGPLTaRSo3Qt0odip5hpTD95EM2IxeeCImKGgJM5h4N/2?=
 =?iso-8859-1?Q?1SPM1NmdOhfMrP58yyweZ0cfPErwM4L7Kx4d6Tp7LSLa4wEhpWV6tlV2Wl?=
 =?iso-8859-1?Q?9tqJMVu8MCVpztrDYfDebf9ebWJSW5uFyl8oqQz/lUDTRYb3GDh6jjaQ3Y?=
 =?iso-8859-1?Q?6l6Mcq5kCb6bqx3rapNB53+A98X1HJV7+9bv7ls89U5indGM+Wz3jlhHDl?=
 =?iso-8859-1?Q?aOT6t3TFKOSCkzzuvKhxZ7GqJmb4xkBxyQC2ucR4X5PqcngsY68+kbhh+q?=
 =?iso-8859-1?Q?4OSZ1eiOuuJBOJ7y1jgHcnxwtsO+0zLS5DDAmNIrVwduWYDvsDfDrqZLn5?=
 =?iso-8859-1?Q?JWuoRseevzEcR+dH2IPwp5DX27fwOKfH4d2Etfq9kCkYQmA+1kmFBvw5uT?=
 =?iso-8859-1?Q?l3oPK9kyio3MjxHMOpCI8eqb0FqT8F0yecyee+wMLzOmTO9EBrSofTg8em?=
 =?iso-8859-1?Q?asaBkVjRjod6n4wHZR8bWwkAR199F8zvGgbB9mMG1qHLAoWLl/0kJMbRGj?=
 =?iso-8859-1?Q?jUPRBDTQQQfGs+v7l/osyYXk7XEKiUEfrUxNg4++1TMs/p4AHJB+wBSUo1?=
 =?iso-8859-1?Q?F5B+Nce4hqEWJBl6ZoLuCx7FJ882IoNH6iV9G9QET8sRJTU22/dPPQyrKP?=
 =?iso-8859-1?Q?oY3Epp6qBeuXRwkxSwqL5Ab0OZYW5kvUeGux1boFy5/nPb11mND57FOwF/?=
 =?iso-8859-1?Q?j3OxGo22PgSP22ZsXTXDtnwUNapPeNh0WfDlAp+el2tQHwFeD9yYFfAE0T?=
 =?iso-8859-1?Q?LvBr8MVzmwjVKB25lcDKq9fgIJI6iTS2AlPo+CXpzedeKGydzbKX7nriWN?=
 =?iso-8859-1?Q?+UMyo1G0wyD12uW7DOQvjYHXSQXJ4au0w6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7d1625-a066-43c0-791b-08dae9d0cafa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 19:13:39.3916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgZyX/agepPDeyqEoDra5TWitDueUC8I+jpbzgynP0VoQggSHmT4kCRiK5ZZ1hIU1MVe6MCt9Urb1cDzM4UcfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7730
X-Proofpoint-ORIG-GUID: kfvLHnEoI9aUu4VU_w1MGtYwlmu9p_NP
X-Proofpoint-GUID: kfvLHnEoI9aUu4VU_w1MGtYwlmu9p_NP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_10,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=284 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290159
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
> From: Alessandro Di Federico <ale@rev.ng>
> Sent: Wednesday, December 28, 2022 10:16 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Philippe Mathieu-Daud=E9
> <philmd@linaro.org>; Richard Henderson <richard.henderson@linaro.org>;
> Alex Benn=E9e <alex.bennee@linaro.org>
> Subject: [RFC] Reducing NEED_CPU_H usage
>=20
> Hello everyone, this is a proposal in the libtcg direction, i.e., enablin=
g building
> a single QEMU executable featuring multiple *targets* (i.e., TCG frontend=
s).
> This follows what we discussed in recent KVM calls and originally at the =
KVM
> Forum Emulation BoF.
>=20
> Note that our commitment to this project is possible thanks to our
> collaboration with the Qualcomm Innovation Center!
>=20

Thanks for sharing.  My $.02 is to change the subject line to reflect the t=
otal initiative, not just NEED_CPU_H.  That would make more folks notice it=
 in their inbox.

> # What's left out?
>=20
> Quite a few minor things but.. you tell me!
> There's probably *a lot* more stuff when we dig into system mode
> emulation, but I'd postpone investigating those issues until we have user
> mode in a decent shape.

One thing I can think of is the TARGET_<arch> macros .  Some examples are i=
n fpu/softfloat-specialize.c.inc and linux-user/user-internals.h.

Thanks,
Taylor


