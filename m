Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152FC406DEC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:04:08 +0200 (CEST)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOi4V-0000qS-4r
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOi3A-00008m-7Y
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:02:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOi38-0005WN-E9
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:02:43 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18AE5dCr005261; 
 Fri, 10 Sep 2021 15:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=fHaOsAK2nW1ykPeClvLa9dnkAcWfI8VzCKiUTaGuZs8=;
 b=LRc5mFKttSgyvWzQblrNoz7TabHVyAFyMe90Bkba6uCj9rTvDUq3BSNiUfLNX3grrw3O
 VjoJ5e7YzOWHWmN1BFP+yxzcQeZE5K01pcJ6jLd7uUu6k0UDp+IEbXwBYDRWEz1l4mNj
 93L6/jRZuEhidAMJii7WvC2ptMc3rDvY58uXcKuMGqgJL5J9UsgDlLtNghR6BzNLY8T8
 5v4Ar/4ymMm4tkpLYG0mDiJBUTySXSZ7R6af3TkTnO4akPddh75MXfCIpsneWUdLjjKQ
 L397t/j4LuzCPx223gxuzyXSnrHXv0q7QGCEWVPFTkzv1Tp5xCGN0zQ1g+awSQ7E4PgF Ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=fHaOsAK2nW1ykPeClvLa9dnkAcWfI8VzCKiUTaGuZs8=;
 b=QYoZFi4q93SWmuAvSeOrFniyJG5OxqadP0d+U7WhbsqH1ofqmoCWbfJEvoNWK+k+g/0w
 7HD0Sv/BNu7SC1m19OccImT/mAyDGrI1FgRz8vui9HWIhDG/iUTGIbJRaVVto/mfBj5o
 BNKfhayoLvONiiEhgIuhdi9KqF7pys4RQJVuV85THV6tx6dQ6IhFtnWg/GIq8dPz8Xi4
 I62euMLRat8EdeiBGXKUJXrIssuS5p4aAZFJpdkuMZ6DdSogQuOCLhc59bWiGImGtt30
 j6UksAtLs2Lcg+SmkkluQ3oRZTf9DieOOcwBDN7okS5FPP/zHA5Gl0kXBRpITfYJ1fH2 vQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytj5j480-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 15:02:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18AF1MlF110224;
 Fri, 10 Sep 2021 15:02:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 3aytfdh0wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 15:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2Jq008qC/uxhBN0XygAfo7+bZuoeqnpdJIpS5NufLPfAxWHs2q04D8KM1HXrIWgxjW1vBkzxNqdAlwT7uUFou7hSYyrfhUFNroMNbouFfkbrHrtv894Kz2dxXR7M6iHn5T+pjsjC+eJoXWys42P3s2DH52OdboAjc4zmQH0aqFjNFkHXsN/0HT/9hk2/oP2FJysYOrjFIESOiQ6uPPSIO4S8/MQjF7qQDyDh4/RI6GMTS1vOxFth5PPMH8bBRqkGP4Dd3gtJS3/WlVa+wUXh/9ijoAdVuN5+3Jk9fxu8YL0QRaepWOBiONUfObnUHw2xyUPr8oIG+r11/vzAJcB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fHaOsAK2nW1ykPeClvLa9dnkAcWfI8VzCKiUTaGuZs8=;
 b=CGVR8le8BUAKqUtas1xLfeq93foxqz7ZN06bCMxP7DVZrfrDaAam+3Rvz2dnuSvFA36whFBQPUAS5oOGPmQGyQl0+/czURMFtqXy46GzpKCcnRT8jMRX/W34N/1EP+ve8hQhOs0YmphyO3jmBoTZP/BspoAuGSrLUTPuWdoqam10YOrLjxBbNxviyxcTQvlLTnV6GkYsy+XL31H3cMp+yNzC5GOHo4g/WQ+Sp40pKMrJxjGmoVlX78MKFzSOPD6GQixt2FVNbCMjqDevuoaOqg+X6OcPOoAk2wTK3mb/Sk5VYrNXmLMjfGDt0wPZEywj/GJdco5OsZbO5VlVrXvCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHaOsAK2nW1ykPeClvLa9dnkAcWfI8VzCKiUTaGuZs8=;
 b=fkX6aVIcNet6+MdUz+wmFapyqr7YDzEVWraD/UGB8ncz+PdX8j0CR93xrnovZqHiMUYAwkDqrcV3Lc3CswzsSZo6mCQdkyAno78sWAdjNh5zD6g4L/67TKEV4/3d2zzUxTTkDiuqoglqU/vOwoLg3UOPMPkh9ydtToOrJj0RL6w=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5140.namprd10.prod.outlook.com (2603:10b6:208:320::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Fri, 10 Sep
 2021 15:02:36 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 15:02:36 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 04/11] vfio-user: find and init PCI device
Thread-Topic: [PATCH RFC server v2 04/11] vfio-user: find and init PCI device
Thread-Index: AQHXm2a8rN9x5X+H50eykHMmZg04fquaJ2OAgANLlYA=
Date: Fri, 10 Sep 2021 15:02:36 +0000
Message-ID: <7F063C48-A359-4FAA-BD99-8D1A8E4FE9A1@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <a7c0072a7232da2f3aa76d9cd4cdf415fd1127d1.1630084211.git.jag.raman@oracle.com>
 <YTiv5W6tj6cm6UZA@stefanha-x1.localdomain>
In-Reply-To: <YTiv5W6tj6cm6UZA@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38bb5656-ef5c-4480-8bfa-08d9746c0667
x-ms-traffictypediagnostic: BLAPR10MB5140:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB514057CD5661158564B512ED90D69@BLAPR10MB5140.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8tlHXW2FEse5UQDyYxtkCBh6CUT9zAZFxmg+NRxQ1frX6S4ANVcO8AUZmjOCJuc29fb75kHD9x76DnAQY9uAUQhw+ftmKSAErII+AiX6g7JjleQ2e3OyENxIxjgBMzOT5D6EDNod6Tvpkvvb93XEJTDkccVBzWZy5iDv9QEmpdUvAFghPYRO40WCMDobULqh1zaoyvMEjtp3IMmkRCtKq8za32YYrMNeC6//8czlmDUGd/XeJwjgYbpIv1LfbO/D1XiDor2rPwlmGCz9oIEoDa0ahQ95xNx7MkIeLB4W2eYH8zwfW3VRL+sM6lbdV0l0oCWHmCF7Q9EB+SrjfJaWVyLCr5gwgEcZQpbGtwfXbhrBR06Ot2nmoQigYOgKUhg0J6tcuYUPstwfu6PkhYZTVNX0A5To8mfPMHJDNiO47dFTIWj3fBKG4NwnwQCFTnwrMKUTkJ6TECsKckWqTDgG20dkXpN+DVv/J1diIp96IGWIlfaaJOQ84mLySOvMvEs6MlmFDYmd1JOfU6DKLTzznsd5jb+ijpFctqKqNxMO+FYGu5m0BVrdCJtXzSYxzjw2cPqBUwKCAGdckIB/pdTX5L0DAPuxE0yHMiztZRo2fef4e+3XyqMv1vqyo0t0KQTWJnR//eMGc4T+xrERpGmZ1LmRLb1FKRS1FvXyOh4Z+Z0QLEvOcOvFMxAUxTu2yOtoqeXZdLqHbQI42ttqdA0w++Cb4vE5O/rF73drPJGUVdo7kSue1ozPKnCcW1KPWtP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39860400002)(136003)(396003)(346002)(186003)(6512007)(64756008)(53546011)(66476007)(66446008)(66556008)(33656002)(6486002)(7416002)(4326008)(36756003)(2906002)(8676002)(38100700002)(86362001)(122000001)(38070700005)(6506007)(478600001)(6916009)(44832011)(316002)(5660300002)(8936002)(91956017)(2616005)(54906003)(71200400001)(66946007)(76116006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2Z6ME5PNEZCQ0lUOU9MczM2cFpJWGl3STBnczZBaHBacWY0YWdKL3BSZzNN?=
 =?utf-8?B?U3c2OWZJdzhvN0Rkazc3d1ZBTHc1alU5VmVFRHVOTUMzcUwybmtCcDZvSFkw?=
 =?utf-8?B?TUV3SkdrQWIrODJrSnlZWngvSTJ1bUZIeWplQ3hDK1VpV0ZiRFNjd3ZwMFJL?=
 =?utf-8?B?dU91eTB4eno3cFhYVFVoaWtDRmcvZ1B5S24xVEpLeC9xQjNoRFlSd1hzRnc2?=
 =?utf-8?B?aDJKSnlUbFhSV3JkWERJWVpQOE5iQ1c4V1AvZ0Vlck1OQjByRndDVXNQaDMw?=
 =?utf-8?B?ZEJ6MWdad08xY3JqMU5WRjcyRWhGUTliUVZGdjJYRWhNNkJZR3JaYjdMcXdj?=
 =?utf-8?B?amlxdThtLzJaODdkUDNNdEVhRnRxZWZKZWdMaWhORnhtdnY3RGhNYXczNUtR?=
 =?utf-8?B?TTR4YjBXaGhVSE1KaWdRRXhReXNPRHJuZytZTXN0SUhiWFYyU0JranpmYUkr?=
 =?utf-8?B?K1JqMUFxNmtrM29CQlc2STdlM0lIajVnTzl0R2pPbnFwSktVRjNHbnNaTmxq?=
 =?utf-8?B?d3R5L25hMjl1U2RUdzd3WEU3QjBVcXl4SkJra0lSWWt0OWF1L1kyZ2U0bTU2?=
 =?utf-8?B?WHRDbm90d3VHc2NuSW5nNXFCRE9RVnJCMDlRR2JqWEx3Z3Bqek5rd2pvRE1P?=
 =?utf-8?B?c0l5WmxJYklFUFFIdzVHQ29vMUVKbFBkTitJRnJ2Vis1RGlFaUE3R2tQQnh2?=
 =?utf-8?B?eUJUTFEwcHozS0dRbHZicEl0dFJ1RnUxQWN1K25JMzh6RXBNL0VlTUVKSGdZ?=
 =?utf-8?B?UUVBT0ttVHhGeUI1MTByMit1b2FnRS9FRzNaRmVKTWwvMmZCZGVtZEVIbHlX?=
 =?utf-8?B?OXJCVXZmM3E5K0MxYmU5djRGUHZhb2ZVZGVSemplYWhpanBuLzhtbW1uR1ZC?=
 =?utf-8?B?QXVETTlGcEdJSFZ2NURxZVQxY3p0OXA0WUZPbkJnWnlCeUJaaURGWEwyK1pt?=
 =?utf-8?B?bVJ3MFhha2pqMnNlanF5NkpkWnpnL0hBZ0w0OXhUeDZUNTc4ZkJDVUxydmJa?=
 =?utf-8?B?c1gxQUZrdllncllsUldqYjN0RCsxMjFPRXpnb21WNmNSYXVweDdmVkhZcHp1?=
 =?utf-8?B?YXM4L0lPdDliT3BEOG94Uzk5Sk5Dc21Uckx1eFZBdUVjZXVPZThrZENlcnFx?=
 =?utf-8?B?a3BpdXFrOVZ1U1N0N05YMGI5TXovY2JzTDJycWFNQnBQVldhWm4wT3NlbWx1?=
 =?utf-8?B?ZXFRY2gyT05xTCtKUGNsYW9McUNaN3NZRGdIT2JLc1I4bHBtV0dieTNBeWw0?=
 =?utf-8?B?UkpqRVFNTWdFMWdrb01BV0k0VUtoVkRGdTVqQU5OUzRlaWhpZVFzcEQ3dGtG?=
 =?utf-8?B?TzdNQzRhN3dxL3p0S1pGZi8vb21mYVYrempHVmUzVmwwYzg2c2N1ajNDMDFx?=
 =?utf-8?B?dnhoRC8vL05OYmtCSHNUUXA3bGRzTmlTb3lpZmtEaFVFWUhGdCsxMVoxeXJI?=
 =?utf-8?B?ejdsbGVUeUpnZTA4aCtCdVlpOTBLS1pwSmhOZXdLMW1mNW8vWE9mU2dKZzJS?=
 =?utf-8?B?VFRNMDIxVG1WRERTVE9jOFEyVnB5ajg0UlJxSzVCV3VWWkp6SitwR3dLYmpn?=
 =?utf-8?B?ZnkzVG94S0tZR3F5REdXdUdpRFlhalUvcFJpVGlLcDhIZTBFd3N1cGVId1lW?=
 =?utf-8?B?UnFYTFE2dW13M09lUVQ3emc3ckxRdHVRaC9WelhzcGM3eTRhbGZ4elk3NXo3?=
 =?utf-8?B?V0dzK3c0bTlFUmJwdVkvRTJtcC9aNSs0SnRvUGRQZkdubXNqNXQ1R0U1QmlY?=
 =?utf-8?B?clFsSlE3UnJVOEdGd0hoQUhWam1OajlQeUlFMEpBbVFQWnBhcFJBVlVPa0l5?=
 =?utf-8?Q?lKOxtKiaqKlJPvgS2qm2VLjLO833wUGeORE5w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <970E294F15680D42BB457601A42BBF79@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bb5656-ef5c-4480-8bfa-08d9746c0667
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 15:02:36.1175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XjZdrYxQ/ZdqF9CdgybUryljY7Z0KrQVRs0hCvfz7C/ztElo/Mhp29nfgK+aVLxHZdFhCsMn3yspjcp8j/5WNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5140
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10103
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100086
X-Proofpoint-GUID: AwmyfWlWlb4AGMlL4_lf5MqdsxRMD7NN
X-Proofpoint-ORIG-GUID: AwmyfWlWlb4AGMlL4_lf5MqdsxRMD7NN
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDgsIDIwMjEsIGF0IDg6NDMgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEF1ZyAyNywgMjAyMSBhdCAwMTo1
MzoyM1BNIC0wNDAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90ZToNCj4+IEBAIC05Niw2ICsxMDIs
MjggQEAgc3RhdGljIHZvaWQgdmZ1X29iamVjdF9tYWNoaW5lX2RvbmUoTm90aWZpZXIgKm5vdGlm
aWVyLCB2b2lkICpkYXRhKQ0KPj4gICAgICAgICAgICAgICAgICAgIHN0cmVycm9yKGVycm5vKSk7
DQo+PiAgICAgICAgIHJldHVybjsNCj4+ICAgICB9DQo+PiArDQo+PiArICAgIGRldiA9IHFkZXZf
ZmluZF9yZWN1cnNpdmUoc3lzYnVzX2dldF9kZWZhdWx0KCksIG8tPmRldmlkKTsNCj4+ICsgICAg
aWYgKGRldiA9PSBOVUxMKSB7DQo+PiArICAgICAgICBlcnJvcl9zZXRnKCZlcnJvcl9hYm9ydCwg
InZmdTogRGV2aWNlICVzIG5vdCBmb3VuZCIsIG8tPmRldmlkKTsNCj4+ICsgICAgICAgIHJldHVy
bjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoIW9iamVjdF9keW5hbWljX2Nhc3QoT0JK
RUNUKGRldiksIFRZUEVfUENJX0RFVklDRSkpIHsNCj4+ICsgICAgICAgIGVycm9yX3NldGcoJmVy
cm9yX2Fib3J0LCAidmZ1OiAlcyBub3QgYSBQQ0kgZGV2aWNlcyIsIG8tPmRldmlkKTsNCj4+ICsg
ICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBvLT5wY2lfZGV2ID0gUENJ
X0RFVklDRShkZXYpOw0KPj4gKw0KPj4gKyAgICByZXQgPSB2ZnVfcGNpX2luaXQoby0+dmZ1X2N0
eCwgVkZVX1BDSV9UWVBFX0NPTlZFTlRJT05BTCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IFBDSV9IRUFERVJfVFlQRV9OT1JNQUwsIDApOw0KPiANCj4gV2hhdCBpcyBuZWVkZWQgdG8gc3Vw
cG9ydCBQQ0kgRXhwcmVzcz8NCg0KSSB0aGluayB3ZSBjb3VsZCBjaGVjayBpZiBvLT5wY2lfZGV2
IHN1cHBvcnRzIFFFTVVfUENJX0NBUF9FWFBSRVNTLA0KYW5kIGJhc2VkIG9uIHRoYXQgY2hvb3Nl
IGlmIHdlIHNob3VsZCB1c2UNClZGVV9QQ0lfVFlQRV9DT05WRU5USU9OQUwgb3IgVkZVX1BDSV9U
WVBFX0VYUFJFU1MuDQoNCnBjaV9pc19leHByZXNzKCkgaXMgYWxyZWFkeSBkb2luZyB0aGF0LCBh
bHRob3VnaCBpdOKAmXMgYSBwcml2YXRlIGZ1bmN0aW9uDQpub3cuIEl04oCZcyBhIGdvb2QgdGlt
ZSB0byBleHBvcnQgaXQuDQoNCi0tDQpKYWc=

