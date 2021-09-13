Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2123409390
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:21:20 +0200 (CEST)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmpj-0004fH-Fi
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mPmL8-0006R4-QV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:49:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mPmL6-0000Tz-8L
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:49:42 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DDO6xx028508; 
 Mon, 13 Sep 2021 13:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=4CjnjAjC5PxxC6Z5tV+4Ds8a1AEqMJNo72kM66JI0vQ=;
 b=U7LKH9DS1OP1gRoGvEBCJ/bAqroMpN6t9O8qxTj7rOfXBVtO1Kmi4/gVL2FHQUQNh7tK
 rBc3nVEPBzh/vbXboZlxU7MILUXEr3uee5YAoGbtIgv8xOL/RnvAsIBdthWS7jPeQZXj
 q09/nai2GZrZUacQsA/ITUh58IM+qM1ziM89VipRrEJ5Pn0YXnylrt0kcIG4rkefJQPo
 KnITt3Evtr0MlOAC3QWNCGvG5rxnmYpUVp9BecEoKSnqUySNXXv5EvFIgho15A/lU2KS
 4F1mTdwf9dk2jVzqP4HCDfPz2ZqOgBQiS69sBgcUhl6RKU90InKCII7NRyeKJr820qII bA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=4CjnjAjC5PxxC6Z5tV+4Ds8a1AEqMJNo72kM66JI0vQ=;
 b=z6xfYSl+ex2cHBESWK1RFrNBpOv14Y88HO680QAzVKKy4nTmMqmHbEEIqeAFpHE6Ff6X
 QV972t59FwwNr185eYizaV29COot7F16HhkCoqbhEsLQoezmWF5GCS0IrF1JRxW7wf0H
 2WF7Pd9k/MWRWGY4ZQVBw4BzEYMqWiTCgGX7KExP+bLYlPdKLzONY3yMhprA79ZDzXaG
 G5vmO84G8ROFr57T3vPZVOyrj1Gvkwo3lhZ532lZlhpntawLEB2hDXioBu5r1dgcg1c7
 xBNLZNLCgnTMFcV63gxh+Rg/YYTxbvX7m0yNkLUUBo3k8YFXSN5AI9mmjCorc2xMQq04 gQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b1ka92k77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 13:49:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18DDfKrZ089737;
 Mon, 13 Sep 2021 13:49:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 3b167qfe2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 13:49:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngQcpqSrCwzYjug1+1KKiaJ3VewFlTOJKs+cyVKCZJiyf+qgyUFGs0KSm9Kxd259T0q1umd9K9fYmmDthHxcmnz4qS4r5Y0+djv2U9HNDq/urnDPDsCZBqRl0gloKA8Bf0al6XmQV056baP5aF69zG+Xs4crRBLjL5byTke5um8o3BNcXyGwbrLuvPwo+qe+JzbC1HyB6oM+IEWYVTsL3Ar0YU1/DQrUZpTWWVA+539Bc6fBtZn63uH5fJwjC2ylng0zGAHvm0Z9Sny0Pa5XkSI46qEOQnA0zPMaQZKTd3w/KD/S1oaVP0rt1TyIl3MICR5iecCwWXC6feb1er/IoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4CjnjAjC5PxxC6Z5tV+4Ds8a1AEqMJNo72kM66JI0vQ=;
 b=PPE55YbWUVXzsCShBh5HGP+sifIgh+szAzaPKgyzLPsXPtaD6J3hJcZJxlF0rdz7zCH2vHDW7WhaEXjDx2W8LJcAgxOROVCbfmVQmpI+EKDMBMRhz4B8z3c6mdO3FOnRxWtTtm8Q31IDr+VPw5aZcGHQ8AB8SU4n/FqyV3aK7NdORFYfFAS8oSR8nvBPbRmrgyGNJejf2r+Da24uOEuHRcW9uwCgiq+xU6ZNLKZbQe3YBiSfG6EIeT1aBD+Zb3qyFRO/3XszUs4tVCnQHoRwJluzntuNAviKydJL8wHgh7dSQ3BGYbz9KGx/jbrJ6oiBOZzoJ3i/dSU08GotMBq6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CjnjAjC5PxxC6Z5tV+4Ds8a1AEqMJNo72kM66JI0vQ=;
 b=wAKkWmh2zDdw92LVnRGW/ibM/isKCs9jsu2popOY3WBkFf3htFVHFyX+sebgyhr1wFJLWRtM0I84kWTc0U0qzhZXD4NKbfWcbvAZwJCxNsf8nEYbwI0L9bbLuBbeR+Ywp00PjBwu7KR6TLM70O8zdp17G75ARfxbxFViofh2a3I=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4852.namprd10.prod.outlook.com (2603:10b6:208:30f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 13:49:26 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 13:49:25 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Help adding package to gitlab runners
Thread-Topic: Help adding package to gitlab runners
Thread-Index: AQHXqDys9I3D4G55/02gSiIAB49hN6uhcq2AgACJLAA=
Date: Mon, 13 Sep 2021 13:49:25 +0000
Message-ID: <4EDF361F-D39F-4DDE-90E2-AD1FB59F5B62@oracle.com>
References: <2CFBCC64-910E-43DF-8A57-8F20671DD7D4@oracle.com>
 <98c9bdc9-dceb-1444-abf4-64b919e642d4@redhat.com>
In-Reply-To: <98c9bdc9-dceb-1444-abf4-64b919e642d4@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c04aa160-ef43-4d95-00f4-08d976bd4cd9
x-ms-traffictypediagnostic: BLAPR10MB4852:
x-microsoft-antispam-prvs: <BLAPR10MB485211384B20FA07263E4B5590D99@BLAPR10MB4852.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a7h7KZnIqwVfmPYExjVNZ+jXlEgKXIVZr6yAO4mLLWqWfytCEPz69N1G1VS3+zKNmtGdEW5Da3GTfgZYgCvwItUGHr1SMda1xkYn2r05ETIS6bUuG7eMZ1KCjGhCZwlASmNQJEkrw2QHTXA681CBHtllTNVRIsHM5+c4Y94pgrb7nVsFE1+I7pqh6onJoH3f1FZViZHqMaeamY19pfNtlDNzPE5VAT7Mo/VY9ar0tpvmhDF/ZUQLj+BZKFjayLJydGIlmKwPxWwI6+G1UHQwekwLNPyE9rHgTPs8HGYcrS+OUyzDou2dgh/kfDz9zK2TIH5ysgMYLYNF/c6RD6e0e1URh5pG4LWMKfvYOqWOA3wWE4Arg6JRTvwjCGuZGB/Ja3puorw/9Cu7y8j5MRvz8Fu4y9rrxsBEUyrA8riiOyOKXTT7R5IcnXFuTz3mc7qCzddTlgjXypVUEVxnoAWquGw6oZ8UCE59I0KDw/nuBX7tZkMmfR0uzBeJXGyId726hgoKSX8x2IWwXMc8l3DwwcQDBSCzrhRGdwvggHk1hVRr4KjfzrfsIGzYH8/EIHT8Ddl8AdJ0LI+TSd4OHM0SV87+b/qwjFeuL7zvYEfZiTxqtml7bRZa7DisRtot5nB35GbkZE93DgPoXQEK/RInR+QK7BIuJY4IgqkIb47l1BXL2IjMlywwfugv4I3dNqIf3KiltbRRrEh8bhT2+dEasAwSrElpdmf7OIPJ5e8Kp2xD8aGoQaUMhmwJhhSgR/NhijU0eG7fRMW3xEZRoaYOIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(136003)(346002)(39860400002)(376002)(6506007)(5660300002)(478600001)(6512007)(53546011)(2906002)(33656002)(186003)(54906003)(6916009)(316002)(2616005)(8936002)(71200400001)(4326008)(76116006)(38070700005)(66556008)(8676002)(83380400001)(66476007)(38100700002)(66446008)(86362001)(122000001)(44832011)(66946007)(64756008)(91956017)(6486002)(36756003)(45980500001)(547064002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5oQ8WByuB6hFU7tKodAjkO0vQLB4voq8Euc98EpHkMZyNuDzunlQxYdroR?=
 =?iso-8859-1?Q?U8CmhVuQbcHY1yloE/77A3QpcywFvB+V/h7Gas1+OM/m/kp+1dPCwHD6QI?=
 =?iso-8859-1?Q?H3xRyl1DFFXoHYYvQTWgy/9cTSI8RNxND6JDDeZxeWWYna+eGKhLYUb8cq?=
 =?iso-8859-1?Q?gqVaDKe/l4vDnuSVQZQfS3UKBY538R2/mUBOmNT3NsSfDPTjDEIYWKSk8P?=
 =?iso-8859-1?Q?6zKpBwLDHl7TRpIDV0snzjvIRmXSLriKG/gQCRUxJ+rKygNlkDAM1Ig5zS?=
 =?iso-8859-1?Q?vfgILAyrzu2+G4ZV3giCYkFdEvnYedLv7Y12RRLd7SsbMh+qc9aXWp2TOY?=
 =?iso-8859-1?Q?y6+AL96HlxX7qEf75l+S5MQFU4Z1jRJp5YxAAmC90Um2isKSJkFEF/TwRU?=
 =?iso-8859-1?Q?Jc8WzNOmt96oePzM1CWWBykyOIA3/0S4PaJlD4QDFne2jSkKSewLM6/ICI?=
 =?iso-8859-1?Q?bP8Ir3afZE+BNvqiYw20mrxvgR8frLheMV+97Bt9xb2HKIYtvViT1NQTH2?=
 =?iso-8859-1?Q?orGdR9kx4P4L5VdEa0x76tcbbh1ITIrrfHUsYGUyJQJucT/To4yG3lOXm+?=
 =?iso-8859-1?Q?kLi3ANln93RiqmSla7+0nooeHWmoMk0GMTDL2TowQ2coQm0F9xk/uLz7yF?=
 =?iso-8859-1?Q?t40Vq0ypTF3MOF0oYB1N9Mq7plNJvIRo1PCDmxSOpC2qVS4mpR70/YDCLr?=
 =?iso-8859-1?Q?nzNqTYM1kjbjCCDB7FOxCcy9vEXZk99HH8QdoCfbNQ5wffl1Lu4RM5YBxC?=
 =?iso-8859-1?Q?tFZVfKXXNZRs0A9oHHnT0kDbakHkP4rJ1TcK5YeRoyo2D0iabBebgYJBug?=
 =?iso-8859-1?Q?T03X2ekKKPQHqoN0FfVWMP+oQVts71VpCYi8c+2oPQEgszxRMMg6tQyk6R?=
 =?iso-8859-1?Q?gJjsTpv8WsQTx5fIX3Jlsf25GGSU0iFj5ytIBvc/Z4r33bnTBm6fkOStnc?=
 =?iso-8859-1?Q?5X6Y5yk/+TjGEBxV2p6oGVdSB3h43MY92aT+y7pMmxp/ttVwLz4WVjijBa?=
 =?iso-8859-1?Q?iCm5prChMHee1ff7P5M7eb43UtYx1MyXyFpw3qDipy5k2bFGzqzApH4qpQ?=
 =?iso-8859-1?Q?riB9wnJKnc3fyTqMtI+/SH3Z/7Felk/ouT/BV+DKUIYAG76EptKC0avaLE?=
 =?iso-8859-1?Q?lxM8gU4YCwk/F+anNfpCcSEf6hZ2w96fdr/ztQfKnEwGxVaVOlnZatUqgv?=
 =?iso-8859-1?Q?w4dCW3h6Kepc6URC/txG/K2DghuGF12yyai09YmFSqKZbFxyxJyQxFm1bw?=
 =?iso-8859-1?Q?reV16kYjdYk8ja+g9f9pYr9k1m9LK19pvMh+P05Gz7bBGf9xusq/2hIw14?=
 =?iso-8859-1?Q?uiJUN9Y9itRfU5HR/uI7lNOBVN4GmktoYdksEaGjqmGTaZfjJDAsfsp4O9?=
 =?iso-8859-1?Q?ohD08Oabk6McnsigQk6hWPMWZYI5r53OWrvD28pkn6iKZ0L2tDTYw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <52C23BEDF7727B42B8FBF9EC25F49FA2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04aa160-ef43-4d95-00f4-08d976bd4cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 13:49:25.8243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gf6fNxKzWL+AKzAmYqlBSuShVJyl55Nd4W881EEzTlhBXIFhTo+isCGNiA3dcMZqKJdxueuFHfdVf5D1GXn05g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4852
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10105
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109130091
X-Proofpoint-GUID: Uz1vR0pIJyC4HMd4nPT_uButnOUHwdfF
X-Proofpoint-ORIG-GUID: Uz1vR0pIJyC4HMd4nPT_uButnOUHwdfF
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, Willian Rampazzo <willianr@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 13, 2021, at 1:38 AM, Thomas Huth <thuth@redhat.com> wrote:
>=20
> On 13/09/2021 03.14, Jag Raman wrote:
>> Hi,
>> I'm wondering about the best way to install a dependency package on
>> GitLab runners.
>>=20
>> I'm adding libvfio-user [1] as a submodule to QEMU. libvfio-user depends
>> on the availability of the "json-c" package. As such, we need to install=
 this
>> package to build the library as part of QEMU.
>> I saw that we could add a "before_script" section to the jobs in
>> ".gitlab-ci.d/buildtest.yml" - this section could have commands to insta=
ll the
>> "json-c" package before running the job. However, this option is specifi=
c to
>> a job.
>> I wonder if there is a way to do this for all jobs. I saw that
>> "scripts/ci/setup/build-environment.yml" has a list of packages needed t=
o
>> build QEMU - this one seems Ubuntu-specific.
>> How long does it take for changes made to this file (build-environment.y=
ml)
>> to propagate? Are all QEMU's GitLab runners Ubuntu-based?
>=20
> No, this file (build-environment.yml) is only used to prepare the non-sha=
red custom runners (see .gitlab-ci.d/custom-runners.yml), which only run on=
 the staging branch of the qemu-project (or if you supply your own non-x86 =
runners).
>=20
> I think in your case, you likely want to modify the shared runners instea=
d. For this, we're using containers that are prepared in the first two stag=
es of the CI pipelines. You can modify the container definitions in tests/d=
ocker/dockerfiles/. Once you add your package there, it should get used dir=
ectly the next time you push a branch with the modification to gitlab.

Thank you for confirming, Thomas! :)

--
Jag

>=20
> HTH,
>  Thomas


