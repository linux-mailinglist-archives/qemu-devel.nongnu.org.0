Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775803833C0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:04:16 +0200 (CEST)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lien1-0000z0-AI
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1liekS-0006Wb-I2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:01:37 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:55812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1liek4-0002ue-Kg
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:01:26 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14HEoE8J150735;
 Mon, 17 May 2021 15:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Wq0sUpkMddKxPj/4SuYH/MsZyFIrMrvMmUQOaf9xY00=;
 b=M8HI7oxcyCCnrpq9sH4OJFfPvpr9aDTatcFuGQx/lREJASMpqwdlt5nN5bkULaonv99E
 IA2fsQyMSxbg4Q95O15QJael2RptfGduCVqy6U+8Xf/OZT6i0vqOr9eKuSBVBwUaR53e
 K/GejMt74Vvaa56b266sdW9819+1hIpENB71sGtOsEbuDapO28Ol8PUpkneEQwpIXH2n
 H1Kcj09BftjVEf3efGPh1Uy5Ofc17x8JAMDLGWcgfVeULfOL7UAZFk7iGHk76uSIsVgu
 ZN7nanUj3vmJ1/UMQYlaRh0mgB8r61vWDeaxTCMfPN82PM4hRxPX5btBlz+LDkyfI8Oz iw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 38j3tbbk7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 15:01:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14HEqUDi134224;
 Mon, 17 May 2021 15:01:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3020.oracle.com with ESMTP id 38kb36yyff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 15:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HY46dihs7IPgVBNnlVxvJi5bAVBT/515Ok3TxwU1GVGNxJ4lz2gA21mVhovOLpTT7HoUZPR8SlMqQGA5zUtGc5v6RNDkVGW0fa5ikbkJI91JNFaLX+1OvjrfKNE6Jq1DpUcTDUivKGrEQj4W5mqDhUmZdKuaXeABLJEaHT0JRnouqCdCz3ctfW94RsbLeiAoD/FUFXvVNB1q5L5VsiLUWFJENCl8SVjpx8mibL/mXtcfFo2Eik2iwOEdKkf2dqaLlJqKrL+MVBcf8x7fkD/EIYVfV1JNB2CDDWxIq6PXNvjBT38iev14lcnRTLM+dSZu9MFxUC02YRX8w5sXRpEshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq0sUpkMddKxPj/4SuYH/MsZyFIrMrvMmUQOaf9xY00=;
 b=hMsxMxiun4P+nfWveyj8GNjSVecwT2DVyQpUqcVbjGeJAfMKzM3ttQmnr2ZG0HriT4UhLLz4L4MBCz+WjYW3luo/DuzKjcAofjFOinX8NsN146Zhqa5YlhyPiu2DLEmKIvoO/hD6TZWLYLVV1d0XTJwfDwwa4Qjc0bl52GAe1IbAXmpDa0oNlTW5RJTu6UNOXmsXHhAihW3MC9VgbE9CkUGsT3vDGxRJeoLZHOsWmm8FgMVe66QoTCJmS7xd1apYoiOis5c3znFof8cayKW/lA0y0q3BEgKzEhcORpm9kmgIPJVoqSPpNaFGdICNjbKkcEn+Bc23MUMXOV4oolTQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq0sUpkMddKxPj/4SuYH/MsZyFIrMrvMmUQOaf9xY00=;
 b=TdLTC4lFlqfYtWoQS9wmY7I2yw/90GByh90CP7g+VZIQYvpLGGy/J5rvMIaia81pxhhm9yYT7qmPzA9KSdpsKQie26WECH2H0KlFaG64MPJPK3eGHVViQDrpaNLSaHqBdeSxVZB0ouoTAdX8IWEDxW7v3ZiqJZWxyKZp/3rypgg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1344.namprd10.prod.outlook.com (2603:10b6:300:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 15:01:02 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429%4]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 15:01:02 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Topic: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Index: AQHW/l0fQlwSEv68gU2Ur30xmG3nWKqoOiqAgARyYeeAB3TagIAeR4s6gAAX9ACAFduLww==
Date: Mon, 17 May 2021 15:01:02 +0000
Message-ID: <CO1PR10MB453130B44F61C9E82C431789972D9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
 <20210406213131.21045f68@redhat.com>
 <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210414111759.66e78f71@redhat.com>
 <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>,
 <20210503190734.12e4c1ac@redhat.com>
In-Reply-To: <20210503190734.12e4c1ac@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51446c52-dbc5-4c36-c559-08d9194496cf
x-ms-traffictypediagnostic: MWHPR10MB1344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1344FF6541856D5439D9F7B5972D9@MWHPR10MB1344.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UW+XEJLhisy/q3rWEtIc0n+SzDKczS3hr94RKwIsswaExixuPEcH3ewy8ILwNqAGoMRSfKdycBdUkQvcofcukDUwrh6ffeGngOFop5//ilcx+5l8YhTt18oez423AmMJXm80L7RBNtU1X7QUD3C1I/Dmt06x4En1RL9yBVQI6tfm8eqcrHiz/qfMxk2//WMU/xLICFb/VEtne4/Jt/8V+C8ctx1fFL3rZZtrxftbdaS6XMirKubDTW8uuma5DbEhBl7vPitAqgP+EdHHxBSQywXX6g6Owdxtx2BbqpHTeH16O4Haf3X1dAepUPHXVVHL7/zddrRIEhFsYR7oaVE4u2X88XzCI32eOW/jGegM2wLwGiWbkgCso9A/x4oo5V49Vb9xhGaLNyqz/ZjAxKOPvD/OjLJ8Pk9vLNus8ydnnM9w+1dNADBEGUP+PVjq7h20IoMHdf1qRBEzYSCaX0Pve1nnSDV3FDxHJVH+XPHpfqylRR86pq4+nuC0yvQ9VoPRGpdUs2TyzEHiej+Du3G3pbHkkjretvmiwvEi20kTyacQZFyIYvE22jfF76IHvsuFtbsachB6Jpziov51He4QNz2m1y2ifY9eoLTg1oWQ3fg2spGhdh5hJWIcTAX8GBmE5nhslz44wLckOY541gkfddwOelaEAsFw6oAojHZTKdEdmnveBw8QIm5YQJvgQL0H8KVtKmPc93bcImbA7qHWuSYcBBUAFTLn1FfO8YAMBEO34xJE3mV6GE3eq3OW1+SxFZHl5NWiMBqKAN2kyU73dg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(396003)(136003)(39860400002)(54906003)(316002)(9686003)(55016002)(7696005)(8676002)(53546011)(6506007)(71200400001)(66476007)(8936002)(64756008)(19627405001)(5660300002)(478600001)(33656002)(38100700002)(122000001)(76116006)(66556008)(66446008)(66946007)(966005)(86362001)(2906002)(4326008)(6916009)(83380400001)(186003)(26005)(166002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TKNArorspImZP7iDMYVdjpC/FX76bvlF4K4R3RaDXoXFNJHNGZh05ynf2Oyx?=
 =?us-ascii?Q?u3ZXFd/rP3mVoK7erGqhJU1NHChGBDYmd4cwlwLfQWE1nfkKf2v7WAlEyaxE?=
 =?us-ascii?Q?cA3IUqu86EgQnnseOPbn3muN9egnBYwTyzDJL+udEN0KJLQaaklhUtFdXXSI?=
 =?us-ascii?Q?SFqeLyUccBzvcgc/e4fRpoi7v0ayqOvRTc7A1B77VZ+Z8yyeprb7cIAINvb9?=
 =?us-ascii?Q?BL/qeT8xtaF1/PRRfmmKsKNELZ7vIdaRCLoVgNcRMxCb+Oj0Im6m+kgoVlao?=
 =?us-ascii?Q?D8QA9dlq4f2/dbLpj2IBQ6DanCu1XVO83CNyrK0w8ixnSrCtLjjjCMNQmtgZ?=
 =?us-ascii?Q?+B5Vqc9884vmkkdFzk/cySUaTwsQWCvYxEcg7Vw8BmtBDV5NK+84x6trA/g1?=
 =?us-ascii?Q?PairVo/Q8rhBcgDEwtVcZi1ZRdI8qD4kTLPbCr+g3FnjLpxk4EdKTlaE1c4v?=
 =?us-ascii?Q?e6hthZ2Eq7tnQZdMufCV+v/JTV7yTqK54joc1wQFAcQG/zB9RYRJ5oNumDD9?=
 =?us-ascii?Q?x0fzMbZ0V3HuAukgOdFQ44vemIsqG96SEEJ83ddRDHvJtw4VR7iZTq7DSLEC?=
 =?us-ascii?Q?3oNvU6lvdo2aWZT8jr1OwGhwpe7gYmvqFazuM0jSLzgs6mPlTDYdNJ/PpYnv?=
 =?us-ascii?Q?6rLtrRnOaz2uOOFnzj9HwSnpmAGH2B6s36jMNRRHRNI6fGisxbT/Xz5Krpf5?=
 =?us-ascii?Q?CmX1dBoT2UjXaZH+q8n8U4PiZB04p3359T5LsxcsabcCGU1zubqDeHQho7AS?=
 =?us-ascii?Q?uq5sTn4ueVgqwoy2VLYNa2KHbkO95ln4XRHn362Ip3GEHCV6JxKgqHPCch7K?=
 =?us-ascii?Q?Dz7SlLPw4xvSapbCtgD4kbqvrPM5+OHn2yEHlC791GNUnWFGuDV8zkX0waSy?=
 =?us-ascii?Q?CmN3jXYn8cTHlEgNqyBWGbyZZO0mkN4S/xnl+AdoS8CdQKLNJi4LJHK/XVLp?=
 =?us-ascii?Q?Xa516aqncmBiylyVYZUC/U+WlTQV4NQuXA6fdx6+yf4h7YCvHldp6JijaEvJ?=
 =?us-ascii?Q?XfuPe2bNdG9vEZkK1rk0zOp1BL+Ml42A/tHapi3nil+Db75454aayyrSkCI9?=
 =?us-ascii?Q?f7gs+/8bW7zbEEovCpcVj7qGswcxwW6TqBCVP0kWtzxeVLbLjMOWNl8I4ee2?=
 =?us-ascii?Q?/SwYQNs/BVceXReMlwAIyLg4B4ydw9ILuQnJp5KFQhLXNu5z6V2GP4xHv/bH?=
 =?us-ascii?Q?s51sC4eQwQ6mi/ScEBSrSTNgYwJAFlMXocE16FwsD5FCjjrGGCjMdCVt6ZCm?=
 =?us-ascii?Q?6WcivhjazSDYelaqXAaDe2xG/T87wPGI7JnAtHHi3DHtQWvrlD4IluqbePsq?=
 =?us-ascii?Q?ezU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB453130B44F61C9E82C431789972D9CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51446c52-dbc5-4c36-c559-08d9194496cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 15:01:02.6592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5r8g+Ngjlm6ZpuSoErv/lGHgwJ2Xp0+siQWHMrn/MsxP7k27A2S4zxCWZtsPYETHj8UoEvEdPqQy1hiEodRI8pe/ggwHOLiOj5kJrkqmOO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1344
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9987
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105170106
X-Proofpoint-ORIG-GUID: AkspIAqwTgHE82o85zMMyOZgaXvrt1mA
X-Proofpoint-GUID: AkspIAqwTgHE82o85zMMyOZgaXvrt1mA
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9987
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105170106
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=eric.devolder@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>, "mst@redhat.com" <mst@redhat.com>,
 "jusual@redhat.com" <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB453130B44F61C9E82C431789972D9CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Igor,
I've been working to transition ERST to use the hostmem-file object as the =
backing store, as requested.

I have the backend-file object now in ERST, and I have a question for you. =
This hostmem-file initializes
itself from a file, but in looking at the code, I do not see that it ever w=
rites back to the file!? Furthermore,
I don't see a "flush" type method to force writeback of data in the object =
back to file?

The original ERST code would flush/write to the backing file each record as=
 it was created. I don't see
any equivalent way of doing that with hostmem-file?

Please point out where I am misunderstanding.

Thanks,
eric

________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Monday, May 3, 2021 12:07 PM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat.c=
om>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-deve=
l@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky <=
boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@redh=
at.com <jusual@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature

On Mon, 3 May 2021 15:49:28 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Igor,
> I've rebased the original patches on to qemu-v6.0.0-rc4, and finally have=
 everything working as it previously did.
> I've started now to work to incorporate the HostMemoryBackendFile; that i=
s progressing.
> My question for you today is with regard to placing ERST device on PCI. T=
he PCI example provided is a template device, and while I do find that help=
ful, I still do not understand how the ERST Actions, which contain GAS for =
describing the register accesses, would be patched/linked when a PCI bar is=
 assigned. Or is there perhaps another way of obtaining the PCI BAR using A=
CPI semantics?

current order of initialization is,
 0. QEMU builds initial ACPI tables (unpatched, mainly used to gauge total =
size of ACPI tables) and starts guest
 1. guest firmware initializes PCI devices (including BARs)
 2. guest reads ACPI tables from QEMU(via fwcfg)
 2.1 reading ACPI tables traps into QEMU and QEMU rebuilds all ACPI tables =
(including ERST)
      at this time one can get info from PCI devices (probably pci_get_bar_=
addr() is what you are looking for)
      that were initialized by firmware and build tables using address.
      Maybe it will need dynamic tables patching but lets get to that only =
if rebuilding table won't be enough



> Thanks,
> eric
>
> ________________________________
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Wednesday, April 14, 2021 4:17 AM
> To: Eric DeVolder <eric.devolder@oracle.com>
> Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat=
.com>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-de=
vel@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky=
 <boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@re=
dhat.com <jusual@redhat.com>
> Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
>
> On Fri, 9 Apr 2021 15:54:47 +0000
> Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> > Hi Igor,
> > Thank you for reviewing. I've responded inline below.
> > eric
> >
> > ________________________________
> > From: Igor Mammedov <imammedo@redhat.com>
> > Sent: Tuesday, April 6, 2021 2:31 PM
> > To: Eric DeVolder <eric.devolder@oracle.com>
> > Cc: mst@redhat.com <mst@redhat.com>; marcel.apfelbaum@gmail.com <marcel=
.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twidd=
le.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; qemu-d=
evel@nongnu.org <qemu-devel@nongnu.org>; Boris Ostrovsky <boris.ostrovsky@o=
racle.com>; kwilk@oracle.com <kwilk@oracle.com>
> > Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
> >
> > On Mon,  8 Feb 2021 15:57:55 -0500
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >
> > > This change implements the support for the ACPI ERST feature[1,2].
> > >
> > > The size of the ACPI ERST storage is declared via the QEMU
> > > global parameter acpi-erst.size. The size can range from 64KiB
> > > to to 64MiB. The default is 64KiB.
> > >
> > > The location of the ACPI ERST storage backing file is delared
> > > via the QEMU global parameter acpi-erst.filename. The default
> > > is acpi-erst.backing.
> > >
> > > [1] "Advanced Configuration and Power Interface Specification",
> > >     version 6.2, May 2017.
> > >     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> > >
> > > [2] "Unified Extensible Firmware Interface Specification",
> > >     version 2.8, March 2019.
> > >     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_fina=
l.pdf
> > >
> > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >
> > items 2/4/5 from v1 review still need to be addressed.
> >
> > >
> > > 2. patch is too big to review, please split it up in smaller chunks.
> > >
> > > EJD: Done.
> >
> > (separating a header and a makefile rule doesn't make much sense)
> >
> > it should be split at least on part that implements device model and AC=
PI parts
> >
> > EJD: I'll rebase this patch set on qemu-6 and accommodate your suggesti=
ons with how to split/organize the patch set.
> >
> > [...]
> > >
> > > 4. Maybe instead of SYSBUS device, implement it as a PCI device and
> > >    use its BAR/control registers for pstore storage and control inter=
face.
> > >    It could save you headache of picking address where to map it +
> > >    it would take care of migration part automatically, as firmware
> > >    would do it for you and then QEMU could pickup firmware programmed
> > >    address and put it into ERST table.
> > > EJD: Thanks for the idea. For now I've left it as a SYSBUS device; we=
 can revisit as needed.
> >
> > I would really prefer to see a PCI version (current way is just a hack)
> >
> > EJD: I understand, I don't like the base address problem either. Is the=
re an example PCI device that gets its base address assigned during ACPI se=
tup that I could reference and pattern this work after? I've been using SYS=
BUS as that most closely mimics the real hardware implementations I've stud=
ied in order to produce this code.
> > EJD: I thought my inexperience with authoring QEMU devices was the prim=
ary problem in establishing a solution for the base address. Otherwise, thi=
s thing only needs a single 4KiB page (for the 2 registers + exchange buffe=
r) exposed.
>
> I don't recall if we merged example PCI device in QEMU, but someone worke=
d on it before.
> Google search yields following:
>  https://github.com/grandemk/qemu_devices/commit/ba8d38a858ba63ef4d419a92=
6f58328b9675fc98
>
>
> > > 5. instead of dealing with file for storage directly, reuse hostmem b=
ackend
> > >    to provide it to for your device. ex: pc-dimm. i.e. split device
> > >    on frontend and backend
> > >
> > > EJD: I had looked into that prior to posting v1. The entire ERST stor=
age is not memory mapped, just an exchange buffer. So the hostmem backend i=
s not suitable for this purpose.
> >
> > Is there a compelling reason why it can't be memory mapped?
> >
> > EJD: Well, this ERST device I've coded pretty much follows the ACPI ERS=
T spec verbatim. As it stands today, the spec doesn't provide a way to repo=
rt the total size of the persistent storage behind the interface; you know =
when storage is full only when you receive an Out Of Storage error code upo=
n write. In a sense, that allows the size of the storage to vary greatly an=
d be implemented in any way needed (ie actual hardware, this has tended to =
be in the 64KiB range when it is carved out of system parallel flash memory=
, but some hardware uses serial flash as well). In virtual environments, it=
 can be of any size, and we at Oracle have intentions of heavily utilizing =
ACPI ERST to stuff all kinds of diagnostic information into it, thus wantin=
g the storage to be very large. By not actually exposing/memory-mapping the=
 storage, the issue of where to drop it in the memory map goes away (yes a =
PCI BAR could solve this).
> > EJD: But at the end of the day, could this storage be memory mapped? I =
suppose it could be, but then that rather circumvents the entire need for t=
he ACPI ERST interface to start with. Linux and Windows both already know h=
ow to utilize ACPI ERST.
>
> Maybe I wasn't clear on it, I did not propose to map storage into guest.
> Only use MemoryRegion provided by backend inside of your device.
> This way you can drop all file related code from your patch,
> and just work with read/store info from/to memory directly.
>
> [...]
>


--_000_CO1PR10MB453130B44F61C9E82C431789972D9CO1PR10MB4531namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Igor,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've been working to transition ERST to use the hostmem-file object as the =
backing store, as requested.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have the backend-file object now in ERST, and I have a question for you. =
This hostmem-file initializes</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
itself from a file, but in looking at the code, I do not see that it ever w=
rites back to the file!? Furthermore,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I don't see a &quot;flush&quot; type method to force writeback of data in t=
he object back to file?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The original ERST code would flush/write to the backing file each record as=
 it was created. I don't see</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
any equivalent way of doing that with hostmem-file?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please point out where I am misunderstanding.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
eric</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Igor Mammedov &lt;ima=
mmedo@redhat.com&gt;<br>
<b>Sent:</b> Monday, May 3, 2021 12:07 PM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;; mst@redhat.com =
&lt;mst@redhat.com&gt;; Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; qemu-de=
vel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; pbonzini@redhat.com &lt;pbonz=
ini@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;;
 rth@twiddle.net &lt;rth@twiddle.net&gt;; jusual@redhat.com &lt;jusual@redh=
at.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 3 May 2021 15:49:28 +0000<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; Igor,<br>
&gt; I've rebased the original patches on to qemu-v6.0.0-rc4, and finally h=
ave everything working as it previously did.<br>
&gt; I've started now to work to incorporate the HostMemoryBackendFile; tha=
t is progressing.<br>
&gt; My question for you today is with regard to placing ERST device on PCI=
. The PCI example provided is a template device, and while I do find that h=
elpful, I still do not understand how the ERST Actions, which contain GAS f=
or describing the register accesses,
 would be patched/linked when a PCI bar is assigned. Or is there perhaps an=
other way of obtaining the PCI BAR using ACPI semantics?<br>
<br>
current order of initialization is,<br>
&nbsp;0. QEMU builds initial ACPI tables (unpatched, mainly used to gauge t=
otal size of ACPI tables) and starts guest<br>
&nbsp;1. guest firmware initializes PCI devices (including BARs)<br>
&nbsp;2. guest reads ACPI tables from QEMU(via fwcfg)<br>
&nbsp;2.1 reading ACPI tables traps into QEMU and QEMU rebuilds all ACPI ta=
bles (including ERST)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; at this time one can get info from PCI devic=
es (probably pci_get_bar_addr() is what you are looking for)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; that were initialized by firmware and build =
tables using address.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe it will need dynamic tables patching b=
ut lets get to that only if rebuilding table won't be enough<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
<br>
&gt; Thanks,<br>
&gt; eric<br>
&gt; <br>
&gt; ________________________________<br>
&gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; Sent: Wednesday, April 14, 2021 4:17 AM<br>
&gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; Cc: ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;; mst@redhat.com &l=
t;mst@redhat.com&gt;; Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; qemu-deve=
l@nongnu.org &lt;qemu-devel@nongnu.org&gt;; pbonzini@redhat.com &lt;pbonzin=
i@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; rth@t=
widdle.net
 &lt;rth@twiddle.net&gt;; jusual@redhat.com &lt;jusual@redhat.com&gt;<br>
&gt; Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature<b=
r>
&gt; <br>
&gt; On Fri, 9 Apr 2021 15:54:47 +0000<br>
&gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi Igor,<br>
&gt; &gt; Thank you for reviewing. I've responded inline below.<br>
&gt; &gt; eric<br>
&gt; &gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; &gt; Sent: Tuesday, April 6, 2021 2:31 PM<br>
&gt; &gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; &gt; Cc: mst@redhat.com &lt;mst@redhat.com&gt;; marcel.apfelbaum@gmail=
.com &lt;marcel.apfelbaum@gmail.com&gt;; pbonzini@redhat.com &lt;pbonzini@r=
edhat.com&gt;; rth@twiddle.net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com=
 &lt;ehabkost@redhat.com&gt;; qemu-devel@nongnu.org &lt;qemu-devel@nongnu.o=
rg&gt;;
 Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; kwilk@oracle.com &lt;k=
wilk@oracle.com&gt;<br>
&gt; &gt; Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feat=
ure<br>
&gt; &gt;<br>
&gt; &gt; On Mon,&nbsp; 8 Feb 2021 15:57:55 -0500<br>
&gt; &gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; &gt; This change implements the support for the ACPI ERST feature=
[1,2].<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The size of the ACPI ERST storage is declared via the QEMU<b=
r>
&gt; &gt; &gt; global parameter acpi-erst.size. The size can range from 64K=
iB<br>
&gt; &gt; &gt; to to 64MiB. The default is 64KiB.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The location of the ACPI ERST storage backing file is delare=
d<br>
&gt; &gt; &gt; via the QEMU global parameter acpi-erst.filename. The defaul=
t<br>
&gt; &gt; &gt; is acpi-erst.backing.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [1] &quot;Advanced Configuration and Power Interface Specifi=
cation&quot;,<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; version 6.2, May 2017.<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://www.uefi.org/site=
s/default/files/resources/ACPI_6_2.pdf">
https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [2] &quot;Unified Extensible Firmware Interface Specificatio=
n&quot;,<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; version 2.8, March 2019.<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://uefi.org/sites/de=
fault/files/resources/UEFI_Spec_2_8_final.pdf">
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf</a><=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt=
;&nbsp; <br>
&gt; &gt;<br>
&gt; &gt; items 2/4/5 from v1 review still need to be addressed.<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 2. patch is too big to review, please split it up in smaller=
 chunks.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; EJD: Done.&nbsp; <br>
&gt; &gt;<br>
&gt; &gt; (separating a header and a makefile rule doesn't make much sense)=
<br>
&gt; &gt;<br>
&gt; &gt; it should be split at least on part that implements device model =
and ACPI parts<br>
&gt; &gt;<br>
&gt; &gt; EJD: I'll rebase this patch set on qemu-6 and accommodate your su=
ggestions with how to split/organize the patch set.<br>
&gt; &gt;<br>
&gt; &gt; [...]&nbsp; <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 4. Maybe instead of SYSBUS device, implement it as a PCI dev=
ice and<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; use its BAR/control registers for pstore s=
torage and control interface.<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; It could save you headache of picking addr=
ess where to map it +<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; it would take care of migration part autom=
atically, as firmware<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; would do it for you and then QEMU could pi=
ckup firmware programmed<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; address and put it into ERST table.<br>
&gt; &gt; &gt; EJD: Thanks for the idea. For now I've left it as a SYSBUS d=
evice; we can revisit as needed.&nbsp;
<br>
&gt; &gt;<br>
&gt; &gt; I would really prefer to see a PCI version (current way is just a=
 hack)<br>
&gt; &gt;<br>
&gt; &gt; EJD: I understand, I don't like the base address problem either. =
Is there an example PCI device that gets its base address assigned during A=
CPI setup that I could reference and pattern this work after? I've been usi=
ng SYSBUS as that most closely mimics
 the real hardware implementations I've studied in order to produce this co=
de.<br>
&gt; &gt; EJD: I thought my inexperience with authoring QEMU devices was th=
e primary problem in establishing a solution for the base address. Otherwis=
e, this thing only needs a single 4KiB page (for the 2 registers + exchange=
 buffer) exposed.&nbsp;
<br>
&gt; <br>
&gt; I don't recall if we merged example PCI device in QEMU, but someone wo=
rked on it before.<br>
&gt; Google search yields following:<br>
&gt;&nbsp; <a href=3D"https://github.com/grandemk/qemu_devices/commit/ba8d3=
8a858ba63ef4d419a926f58328b9675fc98">
https://github.com/grandemk/qemu_devices/commit/ba8d38a858ba63ef4d419a926f5=
8328b9675fc98</a><br>
&gt; <br>
&gt; <br>
&gt; &gt; &gt; 5. instead of dealing with file for storage directly, reuse =
hostmem backend<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; to provide it to for your device. ex: pc-d=
imm. i.e. split device<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; on frontend and backend<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; EJD: I had looked into that prior to posting v1. The entire =
ERST storage is not memory mapped, just an exchange buffer. So the hostmem =
backend is not suitable for this purpose.&nbsp;
<br>
&gt; &gt;<br>
&gt; &gt; Is there a compelling reason why it can't be memory mapped?<br>
&gt; &gt;<br>
&gt; &gt; EJD: Well, this ERST device I've coded pretty much follows the AC=
PI ERST spec verbatim. As it stands today, the spec doesn't provide a way t=
o report the total size of the persistent storage behind the interface; you=
 know when storage is full only when you
 receive an Out Of Storage error code upon write. In a sense, that allows t=
he size of the storage to vary greatly and be implemented in any way needed=
 (ie actual hardware, this has tended to be in the 64KiB range when it is c=
arved out of system parallel flash
 memory, but some hardware uses serial flash as well). In virtual environme=
nts, it can be of any size, and we at Oracle have intentions of heavily uti=
lizing ACPI ERST to stuff all kinds of diagnostic information into it, thus=
 wanting the storage to be very
 large. By not actually exposing/memory-mapping the storage, the issue of w=
here to drop it in the memory map goes away (yes a PCI BAR could solve this=
).<br>
&gt; &gt; EJD: But at the end of the day, could this storage be memory mapp=
ed? I suppose it could be, but then that rather circumvents the entire need=
 for the ACPI ERST interface to start with. Linux and Windows both already =
know how to utilize ACPI ERST.&nbsp;
<br>
&gt; <br>
&gt; Maybe I wasn't clear on it, I did not propose to map storage into gues=
t.<br>
&gt; Only use MemoryRegion provided by backend inside of your device.<br>
&gt; This way you can drop all file related code from your patch,<br>
&gt; and just work with read/store info from/to memory directly.<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB453130B44F61C9E82C431789972D9CO1PR10MB4531namp_--

