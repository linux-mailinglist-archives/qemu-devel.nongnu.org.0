Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAC13D941C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 19:10:12 +0200 (CEST)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8n4N-0004j3-Ah
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 13:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m8n35-00042x-Kp
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 13:08:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m8n33-0000ma-HW
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 13:08:51 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SH6Lbq011457; Wed, 28 Jul 2021 17:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=dYM3md6LzYl0JE/Dbd81Vuexb4FzfAGa6jdrtlAXf8Y=;
 b=m5TR9e+ps1lNUW34uIKsCdbOCIumgv2DJ6YvQjikvqZMaoAG4VmVIQsd/aUzHIRwZ9Vy
 smsOfvIlb8e4OJ8CLIu5EuUiV0VHKxXxPRrhlSqGfkw2hwYXwNV6GRf7fGvwDQ6qbuKH
 E2gHhTIMaV0zBhJiGhB1StfF8zXj9Y1EsWJ2sOISHaJZ6KONr42VeecndQoGfCNkV9E/
 d4JYvlAaQ/MvBXzFlJEALwJwGJF7d6bixlkTntsFtEHE2KNHs9vq43KSDNCjMefmO2tQ
 C/n/tzGuv2R/IJ7lxQVI6XGFs3Yp4BqaTJ2f1lEMO4d0NA1VI83SSw5Nj6Udlek3C7xk Bg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=dYM3md6LzYl0JE/Dbd81Vuexb4FzfAGa6jdrtlAXf8Y=;
 b=ZSZ+x23JUuptyNsE4EFP1VYE4YIP+gfhgmkFozm2GWEZaMk/PCC2K10IcvqRezDG9YCW
 Xz2ynxVCrKeWEViLYAopHmyJf+KXYCT+TeAafF0Tg6nDaaYig4CjDuHc11G8dCS0d5fQ
 ySprAGb5aRukNJiwyJ4FvSFkj5rQo1U+XT5hFKWSh+cgmHWhJUFMl3u6+BnQwPsY/Lsv
 x5OiLeN7AKRcwop90MUX8gJwu8HrRW7CqMsqjLUs4F0VKhuoLJuAxKB0fDGvbe99RUUG
 2tPVesEWYprFL7jN8NG5sF1aOVo7awfTVJrQyE4f0iG1ALMzzt48+pZEZFcEWH4wqFBK 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2358d3j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 17:08:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16SH4wOw049780;
 Wed, 28 Jul 2021 17:08:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3030.oracle.com with ESMTP id 3a2355n4cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 17:08:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6YgfR37FSskBC4F+m7jIT3gudlnuBU1Sp9aeiJq72DmQ5Biu1zsodneqUdKTwY/DBZXqponIEo2hoZSHMTo5SUEzWSUPdFu3AuxSvl/oOid3y2zXMccUFO01/ARKj+r8CkneEN6llTcvmas3F86oR4wj2Rs3oRdM4OkTxwnynqyRdnoA9mB0Z97LTNsHRzTvOq7mLtmcl2JtnMsLDUGPKfJ5734E4JMOyf8/gV+i25JUl+t/0EFxmaynCQhnQhxWGLTUnlER5Gh9aiqm2FnD1vAmdMoqD+uT6buwB2mQIdV2I+tMT1xDJMkRWdur4bkcfX1qmFK5ZgJ5reSfSbP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYM3md6LzYl0JE/Dbd81Vuexb4FzfAGa6jdrtlAXf8Y=;
 b=A6baGmlS4U533TN6T6CHXHeWcnYHEcqbqo6gLULn2KhZ35OMpvPd+pmUqcKSPVNIBCga6rFEsUMzcfDQRQoQmKkwChj+tnVC7vbm3anmmg0JHtscZiMXxIqbKLkxfmviiAtK7al6wZ9/eHSVHmMFk6TEGLNz/fN6thgFXAdzCq2G7mtBM+ZFPc0gtUP4i8zbdxdEZncO/bvN0u54Q8b37IrLTqh2U8XmW42eCsMf+pOJ0Usmj0W73fC6ryA5BKfVogPqbZwJ5aZNLApCqE7AWIaNazlgpMUA23feK3GW9fcCHLvbn8syKdYRJBc2OTHq+F4Ij+TVJCI/L/8ljNtFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYM3md6LzYl0JE/Dbd81Vuexb4FzfAGa6jdrtlAXf8Y=;
 b=ZENUIXZaIRyTfISEQDbFhOIHdfuMbI7c31+RCf33CR8reBXtqviX2eRuCXBnpfFrEvJBOHlnuRCd20IaUacpc2o2UVTVwj5c/LZCsW4aNnc19wVB5sLsp+426lTgEMqy3gwSvvMyXN2R6xGzB4RjLIz5oYDeWvxqp/Dj5VexugU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5220.namprd10.prod.outlook.com (2603:10b6:208:324::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 17:08:39 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 17:08:39 +0000
From: Jag Raman <jag.raman@oracle.com>
To: John Levon <levon@movementarian.org>
Subject: Re: [PATCH RFC server 04/11] vfio-user: find and init PCI device
Thread-Topic: [PATCH RFC server 04/11] vfio-user: find and init PCI device
Thread-Index: AQHXfNdv+R4eTV5J5UixWLGcL60xOatVZacAgANHFYA=
Date: Wed, 28 Jul 2021 17:08:39 +0000
Message-ID: <E30DB381-7028-4CCC-9325-7A09274F3B0B@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <9c728a63a896ecf3de92a269668c3306cc3e6f5f.1626722742.git.jag.raman@oracle.com>
 <20210726150528.GA71233@li1368-133.members.linode.com>
In-Reply-To: <20210726150528.GA71233@li1368-133.members.linode.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
authentication-results: movementarian.org; dkim=none (message not signed)
 header.d=none;movementarian.org; dmarc=none action=none
 header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47723c70-9bb2-4df8-b18e-08d951ea5870
x-ms-traffictypediagnostic: BLAPR10MB5220:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB522060AFB64C2D8EDF64170690EA9@BLAPR10MB5220.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M3xc6K+9NumVPxVa3PhUffXhIfMYsUxk5eJfRA2sjhAtgedshZwCLEsn9fcF+qb+Y2IGfTexCNyf9s3NhsmSOeLMSwf9hymaWjZ64T99Y3Fj+7DtSXOngLDYAqmNeDwIebGPSMH4bYNqJCN1nxvlnsQzzPaCREoX8zDG3bOBHsilrMxoh7m3pZqSdpvAE89No8csJGq5P1+cvU5UXx5iGHFPxRpKq3Adimbx+OPHs3Bu4x9KTy3M6+Dj6W0nRiRDKqcWlN+4PvwxFkOcoRwfDi/ijeEo37i60CABtVvEoe1LGpa0PhT9UCwgAI/g68Tkgy31iXp9lRXI9wEtD61qmNm4+g7zdChV7QH4n6IVyeWJJ42ZpydpKsCFvnnkakpne4ehhgfziMFif4ZvT4yWPLkts9sjARSVAwJ7YiMhTJ/jBUn4DkSF3YVO/8kF6SvwZuN9BFYvclDfTx8L7uMMfHGI7XTelB0rsMGfQBkOivi2luokvQywANTjESstz9qS/D/0IClI137qBn+CW6QbEnuzCjeiebpb+YHLl2n5S7/3bM6xQicEQ8iM0ZIMEcaAI69N8rjYUfF1yA8kXYs3X9QeJxBd5BfU6nI0C+IwXQT/QgQMdFHnQLEZiwwJDzZhWYCm6a0hRsOJh95s+wGsmw5v2HO+bS6+ilm/r5Fhmmz9+tPQGgTUbseNgNfZP9yIZUgmkvBbN1ksBRSiwKMi6j4ur2vL+s1QWA+ITO+LIwCKY9wx3EpoGGJUBR5nZDlg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(396003)(136003)(366004)(86362001)(2616005)(478600001)(71200400001)(8936002)(66946007)(2906002)(66476007)(66556008)(66446008)(64756008)(26005)(33656002)(53546011)(54906003)(4744005)(38070700005)(4326008)(44832011)(6916009)(8676002)(38100700002)(5660300002)(6512007)(122000001)(83380400001)(36756003)(316002)(91956017)(76116006)(6486002)(186003)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0Z2WXNKdWZ1S3NEdkxwMzV2alZ3QWV0VGQwU1l5OEFuZVh1RGtENjBlalkw?=
 =?utf-8?B?cHdOOFFqQXNRcDZPRlRScXdrVEdaMVZ4VWNJQk0vbnNib29Rb3k4V3oyN3pL?=
 =?utf-8?B?WXBjZWtvQkdURkxFVmY4OFF2Z3VyYUZoTmtpcG5BTzVBNTJoVmhTT055ekpw?=
 =?utf-8?B?NnBERTZJaG1WczV0Q1R5bXg0VmEraXFoQ280MUV4Z0ZxdkI5UHRmbE5vd0Vw?=
 =?utf-8?B?QTdFRnVJSzFIM1ZqdHladmZFeTkyMFFDdmR4MGNpZzRUbFU1d1pFL1d5M2hU?=
 =?utf-8?B?UWYydWRXUFVUSGZ5MUJTN1dudEg0elZuNXF0YVZBU3g5djV2OFYzbUc4Rk05?=
 =?utf-8?B?bWw0OE9yM3ltMXN0dEJRY0VKTUlPTDVqV2FXMHhJcWdnNjZCbktvUHArcjhH?=
 =?utf-8?B?SmN0emd4WGQyYTRKL1Z1Y2RhRGpJS3B4UElTTy91b2xLdlJBYkFpUkc1YmR5?=
 =?utf-8?B?MEJlblpVTW5WckV2ZitieE9RaUc3RUUyeHhEYS91amJpc24yWDQxb01DT01m?=
 =?utf-8?B?RFRHWEl4ekg0c3Eyb1hpQ3kxenpZYStWdW9kdExwWnJXcGkzOE5uOFA4ZHRn?=
 =?utf-8?B?Q3VpblZqeTdoVjR5UzNleERrYjdrbjN0Ti9ZRXhaek9YKzVkckl6ZU9teWlY?=
 =?utf-8?B?Q1Y5KzZNNEFKWXRlem1kSlpWU3dYRnFFUnUvUFZ5ZjJqN0dvcHMwTm12NEQw?=
 =?utf-8?B?eFFZRkRiRTdGZzFpK3BleTVvelZCYVJEeVlrWmUvMUVwaWEyRWpRa2w2Mk16?=
 =?utf-8?B?eU10Nm9KdVRyV29IMlFKUXcvckhpd3B6MWJweTlrTVo0dEgrWThrRFp4Nkg5?=
 =?utf-8?B?dGFxbGhnY1g1d29qSnZtVTNLV2JzbngwcGpmTU44U3dIaFQ4UEE0T1I0U0Qy?=
 =?utf-8?B?R2R2MFhNcG56Rm5vRmwyYklWMmZWbFNaZHpYUVJWR0Zsd040bXVUWmJvbjBl?=
 =?utf-8?B?VlFTcjJ6R3NMSGNSYWRQMTJhRlU4OHQ4a05iR1JjUXpvNHM2ZWZBMTZnakp0?=
 =?utf-8?B?UGRmQkF2TTJKUzlEQ3BmNEMvMTQ0Tlp5T3F5RVp0NlpDZzl1MFdiTEpZbzZD?=
 =?utf-8?B?MWtsdXJydXRzN1NWWGNtSCt4L2xqb0FuS2kvU3A0OEY1S1E1RzhsTE5vU1h5?=
 =?utf-8?B?VDFjMU9CZUNybmVqYWRlUkllakNpY2tRajR0U0hyaXJuTXBMWUNqZmxPbEpl?=
 =?utf-8?B?MkZXUG5YODBaTXdRV1ZtYmpoaTVFYlErVzhCeVV0VUlOZmpxb1RYVVFQc0F6?=
 =?utf-8?B?OXF5WEZiOWpzU2YyVWpxMzByb3AzK0pISW5XUjdGSnZsV0FKSDhtU08xVTZE?=
 =?utf-8?B?VEFJMUdqZUpvaEJFd2pQenk1UnRWOTdJSHptZHFGRGlVN1NXdzVoeGM4SUts?=
 =?utf-8?B?Q1FkdE11bGplSEh4VS92c0lnK29XMnFhdDE2RytpQUV5TytJTnpTMDdMeHhG?=
 =?utf-8?B?SmdRUks0RHM3UFIzMXZxamRZY2dzemFwYjAzV3JQREIxMmpOdXQ2SVg3bDEw?=
 =?utf-8?B?MXBUbnVtRVNNRXFWdGpnTVJXSFAwU3ZZYUZZTURDc3h0Z24reFVTR1c3Wkpi?=
 =?utf-8?B?ckFZUFZGZTZvdHh4RGNPaGxLT3JINEJ1MUgxbGhwZXMrcjdCRHJCRE9Kd1d0?=
 =?utf-8?B?OE5DdTBsd3hkaFNmN3haenhyWnhjRGpJcE1yS04vQXR3OENxVFVUa1JxRWMw?=
 =?utf-8?B?VHRqM3FTYzJKbmU3MUxVL29QQlFzVVBncm9xbnNueWZ2R0RFdFE4aDE2MzZV?=
 =?utf-8?B?b2NXUjQ4ZklvMEJTQ1FtalRkcVY0SjN3eHdvajh3YjhRVSttOVprOGJLL0E0?=
 =?utf-8?B?ZXFDbHNKSGVXYVRyckNBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <634610B86D511549A419734FBC16DFD6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47723c70-9bb2-4df8-b18e-08d951ea5870
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 17:08:39.6084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jstqtKenrNo3IeNtG2mSY16aFEB7Yf2lV7lOiiIt66RFNFYTSUbIBBxJFwXC62575SR8bB6qNSrlhQvz1IzJWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5220
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10059
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280097
X-Proofpoint-GUID: ScpA7u8uWs3w47qReoy8anb2zzUnj7bp
X-Proofpoint-ORIG-GUID: ScpA7u8uWs3w47qReoy8anb2zzUnj7bp
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDI2LCAyMDIxLCBhdCAxMTowNSBBTSwgSm9obiBMZXZvbiA8bGV2b25AbW92
ZW1lbnRhcmlhbi5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBKdWwgMTksIDIwMjEgYXQgMDQ6
MDA6MDZQTSAtMDQwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+IA0KPj4gKyAgICB2ZnVf
cGNpX3NldF9pZChvLT52ZnVfY3R4LA0KPj4gKyAgICAgICAgICAgICAgICAgICBwY2lfZ2V0X3dv
cmQoby0+cGNpX2Rldi0+Y29uZmlnICsgUENJX1ZFTkRPUl9JRCksDQo+PiArICAgICAgICAgICAg
ICAgICAgIHBjaV9nZXRfd29yZChvLT5wY2lfZGV2LT5jb25maWcgKyBQQ0lfREVWSUNFX0lEKSwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgcGNpX2dldF93b3JkKG8tPnBjaV9kZXYtPmNvbmZpZyAr
IFBDSV9TVUJTWVNURU1fVkVORE9SX0lEKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgcGNpX2dl
dF93b3JkKG8tPnBjaV9kZXYtPmNvbmZpZyArIFBDSV9TVUJTWVNURU1fSUQpKTsNCj4gDQo+IFNp
bmNlIHlvdSBoYW5kbGUgYWxsIGNvbmZpZyBzcGFjZSBhY2Nlc3NlcyB5b3Vyc2VsdmVzLCBpcyB0
aGVyZSBldmVuIGFueSBuZWVkDQo+IGZvciB0aGlzPw0KDQpJIHRoaW5rIHRoYXQgbWFrZXMgc2Vu
c2UuIFNpbmNlIHRoZSBRRU1VIHNlcnZlciBoYW5kbGVzIGFsbCB0aGUgY29uZmlnIHNwYWNlDQph
Y2Nlc3NlcywgaXTigJlzIG5vdCBuZWNlc3NhcnkgdG8gcmVnaXN0ZXIgdGhlIGRldmljZeKAmXMg
dmVuZG9yL2RldmljZSBJRCB3aXRoIHRoZSBsaWJyYXJ5Lg0KDQpUaGFuayB5b3UhDQotLQ0KSmFn
DQoNCj4gDQo+IHJlZ2FyZHMNCj4gam9obg0KDQo=

