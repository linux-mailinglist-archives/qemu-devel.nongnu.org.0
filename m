Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983BC658143
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 17:27:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAZG2-00051G-55; Wed, 28 Dec 2022 11:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1pAZG0-00050w-OG; Wed, 28 Dec 2022 11:26:20 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1pAZFx-0005Ox-TB; Wed, 28 Dec 2022 11:26:20 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSEihRT004119; Wed, 28 Dec 2022 16:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=qcppdkim1;
 bh=gr5jIGgusSeLjmxBIfB+tgDB+/gjXDVcAxASIR5MoOE=;
 b=bTq8EJigGThazVD0DlM58TgIzfXvpwFp9WlcFho1lBTx/qvuzMnXQzYki3GqgkZZ/+N9
 lM8gnILs0IgRbQsJ+cH9vsZWHHMiQmQzHD0iJBTB/xbZkTtuXkWaZr+rSf1vlEBc9qA8
 G6yXdyO5hJOiCHk1iM7Ra4sNAZvb0Oa6mNr4eSfzU6BL87lManSIE1slSKaT0QpOJfK6
 cMkpzUmymBAH6wJWlDvjM4XDAm6+9CNVrz3/XJ2CtgAuR1It6HCdSYC2WD2n0M7Yi85e
 2LjfSoFdYwdkrirI9Vqw5qYrVwhRXzLz9VdIOMOojNokyKQR877jSH02Cq0rL0+rZQVd Rw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mratp1ge2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 16:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgOyUwhKIBXaYykX2ZvnOTelUvn4ceCiXys5GLY+xACnb14QObS6hVR7iUpJPb8ZLfcZDku57V9KURluSkzonw8JpL+2bWRGmrxPLXvWvMXVXu4CBv00io9+lVMqh3CaI5UT2GWzSA4d5Fd5x797MeUyR7S14Qx1ztd5ZJdh2y5WWGJgAP4uUh1M5Dv7nMyiqHB0mP+F3B28bM7JbJG6w9F0YjmtFjfbZ8Q6ABzdyYVepOtOYS9Z3TeT5i/bYxg+C16lNY+J3N+8hphfHJNlZ86Pdyu3Fg1d3DaXD5EYJsZd/VRzOXfkSGsTK0H7vQYC2s8eNKgdORfgoIUmKiD2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gr5jIGgusSeLjmxBIfB+tgDB+/gjXDVcAxASIR5MoOE=;
 b=BBAKA/UfJtQ5sD5RvSjS5ioxDm2Seinpe6ndrcIliN6DxvAuAUe7oS1EkNbTlo8YJboJsFBWTW33eFNwkmxbS8bvZ+E/hzYclHGHyKfttA3EzkiT+gV55vTFzaJapWNWXC90zYNmyn1e6jVtmnJAKspaRqavXpptLYZIsazwwtPPUg5UFbRHQoJSds1OqcgyqlZWz91IRqoLSjVBRd57+3CEQ80671N6n2iMiFkXzzvZHj/zSkBFtuZOsHRgcwEiWiiALqxBOVRLHMZHtFAcBem+fc1zvKYNixJyAf0OKPTJaieSAK+1EuNjxk+IX5UsN2JfXqQfCbDPmLdJRsT1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SN4PR0201MB3613.namprd02.prod.outlook.com
 (2603:10b6:803:4b::28) by PH0PR02MB7381.namprd02.prod.outlook.com
 (2603:10b6:510:1e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:26:11 +0000
Received: from SN4PR0201MB3613.namprd02.prod.outlook.com
 ([fe80::fba9:f62e:86ab:9204]) by SN4PR0201MB3613.namprd02.prod.outlook.com
 ([fe80::fba9:f62e:86ab:9204%4]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 16:26:11 +0000
From: Mark Burton <mburton@qti.qualcomm.com>
To: =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?=
 <philmd@linaro.org>
Subject: Re: [PATCH] memory: Do not print MR priority in flatview HMP output
Thread-Topic: [PATCH] memory: Do not print MR priority in flatview HMP output
Thread-Index: AQHZGrz2B0snMhK+tUOW0OCJKUAOHK6DdMx+
Date: Wed, 28 Dec 2022 16:26:11 +0000
Message-ID: <SN4PR0201MB3613EBE63C845BB5BA4DF6018FF29@SN4PR0201MB3613.namprd02.prod.outlook.com>
References: <20221228130439.80341-1-philmd@linaro.org>
In-Reply-To: <20221228130439.80341-1-philmd@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB3613:EE_|PH0PR02MB7381:EE_
x-ms-office365-filtering-correlation-id: fbbd5340-58cb-494e-0086-08dae8f03b7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SYqC/lkML5gWAQocixirtnft+y4Z7cGUiFim0E9fB2C84erirSSRMBt08yOL9xALuqZEYCnzQPuloOb23Q2ChXZpMInTEt4RLjlFlatQvK7LzvkzG2zCvsH3YMq24aMf+YIM6UR0C4VD7sbXljr4zGT0KLYrSfV0YrVnkd0OETgLYjQayJrtJHvhzWPy1hOa6amlnbqCKN6TfDEbZOmE5C0IhuUYP24w2JVIjvRUQto40jumz86tDqiDs5ACgJ1l1CfB3cWpvlZCtlFdoZ1L4+0qVV9fxKcZc0D5a1jUJpxulffgmRjPryWhHKR6X/KSqkKPC2BjhSFe+4XxwLba3w1YkZjsvr813fpCMUGg220V0KK5cEPGFFuyJcAkkbJA/Stwt4HItWlnad+ZXjGMtCLJWcJ+u9nwtdJCibFMsM7PfCxghYOQ4GKi9AtClFIUyf2h/c7KzArem157DJ7NSYWquif4KnaXI+bGnaC05QEZUP6gBEUW1tr5Qz/BseC53+zoyOyBL63nBqspGg/JS7pg45kntu8lNbmUqMrlg9/UA01A9YDz5hs1YFGMo33vwqql4Bw2qmFJghNEeNFMnaTjtOgrQK7NWMn9wIAY9LZh/fHsoDUP3w+/nVuAPtcj7QtChbgD9Q0b3wZHDSD3+VKG5VIOBaKe2rx/y4Qh5ZHWzdZIy625nZ0Ii7TTyAyxdd0aaIIOYzDT0M8Q3vhnCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB3613.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199015)(53546011)(7696005)(6506007)(186003)(9686003)(26005)(478600001)(71200400001)(33656002)(316002)(86362001)(55016003)(2906002)(110136005)(54906003)(122000001)(38100700002)(41300700001)(91956017)(66946007)(5660300002)(76116006)(66556008)(52536014)(38070700005)(4326008)(64756008)(8676002)(83380400001)(66446008)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?7yMKdenrnSwmSFLK+M3MSGXY9U9W3pYnfEJUoBiMtV86jy8/IXhI3Egu?=
 =?Windows-1252?Q?EjO7a6KwHfFW+xGUyNX4cN4AtSVT7Xv9cN6Lq0xQKAIezSjAOGgjKl7d?=
 =?Windows-1252?Q?2cwBJb0kuMBBenshoAbOyt2WkedUu2GFdf9eP/CMITKKNgew2Udp671W?=
 =?Windows-1252?Q?69yuifTk/hzJC7eKsFnXRIDEnBHJ9dJMRHADwf97eo3CZvl64s5Y65mh?=
 =?Windows-1252?Q?zwHHADeT/LPf6IAvns/en3CAMChy6rcNtxi24voVwxOs/Zzs3NAswJoI?=
 =?Windows-1252?Q?TGN9MKIlmYLGMDSuotgF6aEvudSK5TOk1XxCHvgDeji/XEL8QnE2FI68?=
 =?Windows-1252?Q?1odbBCSVgDE5lJSJhMNhCy2QxkneQZQS6IPOaVDAuDgpYlGtXnqex3wO?=
 =?Windows-1252?Q?Yfg/6HObnMaNdLSM3iTihwCk7FwQ9KFnGWdlPBXdt14d+N8QvZxJlOxq?=
 =?Windows-1252?Q?jSduhFbeEwukkRiDhK5zvIipgrG0o5nYrB9EJ3F2oa38UmPERfNB4USN?=
 =?Windows-1252?Q?JpZYlS6ZYTr3u7tVF+NO20gUf87hqgsi8vIs+XgGvc5bZjjdgYGp2M3+?=
 =?Windows-1252?Q?qB38Ziyk+ZJUVQY4T5kdxzEK+mBgpgS4PiaeU8STevUW5LTrMzFADToK?=
 =?Windows-1252?Q?5NxGqJMmlCh/rdGtDUCBoUEXqZZky+nnQBWmochuONe56RZ3uuON/2Kv?=
 =?Windows-1252?Q?ODPmF/bReCmm6+inijT8+XAXJauC7XkLqO0dEvU7uxuyOZt+/rJh53XL?=
 =?Windows-1252?Q?IDJebM1GQ7MReg8+2HHRbnBJYAWRT/bRv1mNDq15LVu+yF9mkRK+Ln0r?=
 =?Windows-1252?Q?DzktEh8QcL26FvwALzN7E1p7p3cn7HIwcrWc2az40H4tmj730Egf1r0x?=
 =?Windows-1252?Q?X6RyRJX8hwN1r8gqg75LYhL/AInLR6oyIhc9DI1SjCiv8AcsNyJQ3bm1?=
 =?Windows-1252?Q?j6sNxtNA+bATRQZYhxiOdGGemHRisBDOBncQniwbd0spBO2+rihqh5Ai?=
 =?Windows-1252?Q?oNKZ/YyI972eRLVlr9mnIdCoEXJrgDz65jUFXydZclgl+OBMKCdnwqp+?=
 =?Windows-1252?Q?eo7YyB+dfqvj8XfNi2x9DWS0Vbqc+yidgd7dZVGzC/gtjH4Lq/TIfjZY?=
 =?Windows-1252?Q?h2u4Jp9XRMoHhwzNOvBWQcjxo+LeCHcu/40VeTLksD28C4zMSQpCkVZD?=
 =?Windows-1252?Q?5cryF2z14mlYjWg4tyQ3AtdgAlKSRyKKsd09v/PdauoXgYMGagDRXIiU?=
 =?Windows-1252?Q?w7BYDVh9WmkDW8R2rUYWi8+EDSYhAJLk24WJXhCYUPdbSCpmS2K804wX?=
 =?Windows-1252?Q?nUWkeKlZDLZNZEjZsx01AqU6VW3dA+ybr9xZcck3eBlqzG5WM/dXWc5F?=
 =?Windows-1252?Q?jM3ltFc1JXI42s6phNouzZr2xZy8c67iRApeVDiSpP5QpUFdVTCaE/QC?=
 =?Windows-1252?Q?ZPbhNucsjT/Mv1eKihmEAJEFyA3VrzUt1NKd3h+s1LzLEBjcGTxgK7S4?=
 =?Windows-1252?Q?WqwhGM2mrbLDIB3Jz3P71SlPkvI8Xit6JAKRwgyeFOA+YbI4i4s/4xzN?=
 =?Windows-1252?Q?+ayjZgIxyMuDxJ8VQI0g1qyAJHKkk0iu08LkQyD/Td3G9a+P/7G8LdKS?=
 =?Windows-1252?Q?VcjF1A5TNnuCDpyFP8MkfjwUJyL2Fj4OEsFqdDOtlFpN6c/7yf8OeK2l?=
 =?Windows-1252?Q?cOaKU+0I2v4vFYKcCWL4kmCUXCOcU08sEsDYC2rCpJNuIgJPtDLUBkVt?=
 =?Windows-1252?Q?tXriJhzeaRsKw01POKk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN4PR0201MB3613EBE63C845BB5BA4DF6018FF29SN4PR0201MB3613_"
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3613.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbd5340-58cb-494e-0086-08dae8f03b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 16:26:11.3680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APGKH82C5OdzMUEa7/Gv4KCLTfv2lRlIjdrulvm4famy1gh7mcE9M2juL6A25MwF9GS23x/03IGPE4cNimj6ol3YsBHKIQhjKt0z6TzyDgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7381
X-Proofpoint-ORIG-GUID: D7TzXYqovEX3Vdzpdff3oEcZrjvBsAJ1
X-Proofpoint-GUID: D7TzXYqovEX3Vdzpdff3oEcZrjvBsAJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_13,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=659
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280141
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mburton@qti.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--_000_SN4PR0201MB3613EBE63C845BB5BA4DF6018FF29SN4PR0201MB3613_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Is there any chance between 7.1 and 7.2 =91something=92 happened to make it=
 so that Qemu =91cares more=92 about e.g. when memory regions are added/rem=
oved?

I seem to get an abort because a memory region has not been completely setu=
p in 7.2 (while it is being flattened actually) - In 7.1 that never seemed =
to happen=85.?
(Putting it all async work seems =91excessive=92 but maybe it=92s needed no=
w?)

Cheers
Mark

On 28/12/2022, 14:04, "Philippe Mathieu-Daud=E9" <philmd@linaro.org> wrote:

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

When requesting the flatview output with 'info mtree -f',
the MemoryRegion priority is irrelevant and noise. Remove it.

Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
---
 softmmu/memory.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index e05332d07f..89713dd5ce 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3330,22 +3330,20 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
         mr =3D range->mr;
         if (range->offset_in_region) {
             qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): %s @" TARGET_FMT_plx,
+                        " (%s%s): %s @" TARGET_FMT_plx,
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
-                        mr->priority,
                         range->nonvolatile ? "nv-" : "",
                         range->readonly ? "rom" : memory_region_type(mr),
                         memory_region_name(mr),
                         range->offset_in_region);
         } else {
             qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): %s",
+                        " (%s%s): %s",
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
-                        mr->priority,
                         range->nonvolatile ? "nv-" : "",
                         range->readonly ? "rom" : memory_region_type(mr),
                         memory_region_name(mr));
--
2.38.1

--_000_SN4PR0201MB3613EBE63C845BB5BA4DF6018FF29SN4PR0201MB3613_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Is there any chance between 7.1 and 7.2 =91something=92 happened to=
 make it so that Qemu =91cares more=92 about e.g. when memory regions are a=
dded/removed?<br>
<br>
I seem to get an abort because a memory region has not been completely setu=
p in 7.2 (while it is being flattened actually) - In 7.1 that never seemed =
to happen=85.?<br>
(Putting it all async work seems =91excessive=92 but maybe it=92s needed no=
w?)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><br>
Cheers<br>
Mark<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">On 28/12/2022, 14:04, &quot;Philippe Mathieu-Daud=E9&quot; &lt;ph=
ilmd@linaro.org&gt; wrote:<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:0cm;mar=
gin-bottom:12.0pt;margin-left:36.0pt">
<span style=3D"font-size:11.0pt">WARNING: This email originated from outsid=
e of Qualcomm. Please be wary of any links or attachments, and do not enabl=
e macros.<br>
<br>
When requesting the flatview output with 'info mtree -f',<br>
the MemoryRegion priority is irrelevant and noise. Remove it.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=E9 &lt;philmd@linaro.org&gt;<br>
---<br>
&nbsp;softmmu/memory.c | 6 ++----<br>
&nbsp;1 file changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index e05332d07f..89713dd5ce 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -3330,22 +3330,20 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mr =3D range-&gt;mr;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (range-&gt;offset_in_re=
gion) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qe=
mu_printf(MTREE_INDENT TARGET_FMT_plx &quot;-&quot; TARGET_FMT_plx<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; (pr=
io %d, %s%s): %s @&quot; TARGET_FMT_plx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; (%s=
%s): %s @&quot; TARGET_FMT_plx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int12=
8_get64(range-&gt;addr.start),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int12=
8_get64(range-&gt;addr.start)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + MR_=
SIZE(range-&gt;addr.size),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mr-&gt;pri=
ority,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range=
-&gt;nonvolatile ? &quot;nv-&quot; : &quot;&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range=
-&gt;readonly ? &quot;rom&quot; : memory_region_type(mr),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memor=
y_region_name(mr),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range=
-&gt;offset_in_region);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qe=
mu_printf(MTREE_INDENT TARGET_FMT_plx &quot;-&quot; TARGET_FMT_plx<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; (pr=
io %d, %s%s): %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; (%s=
%s): %s&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int12=
8_get64(range-&gt;addr.start),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int12=
8_get64(range-&gt;addr.start)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + MR_=
SIZE(range-&gt;addr.size),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mr-&gt;pri=
ority,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range=
-&gt;nonvolatile ? &quot;nv-&quot; : &quot;&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range=
-&gt;readonly ? &quot;rom&quot; : memory_region_type(mr),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memor=
y_region_name(mr));<br>
--<br>
2.38.1<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SN4PR0201MB3613EBE63C845BB5BA4DF6018FF29SN4PR0201MB3613_--

