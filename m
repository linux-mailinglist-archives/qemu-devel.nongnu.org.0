Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33A2D6428
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:56:44 +0100 (CET)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQBH-0008Lq-3Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1knQ8x-0007rd-GL
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:54:19 -0500
Received: from mail-dm6nam11on2069.outbound.protection.outlook.com
 ([40.107.223.69]:57472 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1knQ8r-0007wp-NO
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:54:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1PZKZGD4BopSngNGtdph1MOWuJNmNDhl9gXtMEhFyOxSXQ/MyNLuf27A1vHv/Y5MdeMqB+AXfrxeoBW6nYJiSO7jiJprNDFV8w0C7oEDBYknCN0efA3CJRJcCdRm0JO4LkajHc8+CCm2ynDutrgGk2GWbUqYp6DKjJsfPtji9AhuM1Ab+MySkk+BApBLHAeFL5diArQGerjbjEpJKFleTGoCAgpU/ZV6aMul02u7c7WW6z8Dd7aIZ4tM0tbY+wg/vH84ClISMHxzhn6/OVHI6XzYRFKBHOR62XELowl4QbB0JlEZck3xDRiig1mGeQOtiLIBMpbwXo8CynQ3r5IlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cj62F/7/JLmj1Mi9cAThNnAhgDYHbPisMf1onOD0YB8=;
 b=gCaK25FFauEH00dEmcd3Xnvv8KIMuplKsjcnQn7whJuqX5/wNFo35zYSMciP9xJhT5gx2S0BwPnjkTFGTEud0MS6RJmnV40p+nvXwx6WHS7eseg7wTPvrX21P3L9H8OSN5iHwt9TH5PqSECROMmVWzI0oySfeHDgTHrEF12glUV1fgRYF++19XB8HJmpgnaGCFwyUGAad1WW4tYXPzy8dMAvZn+P8eKSo1udZT9heKCxnqECwk/iJ824uT5gosSbKulzgqQtVbCg+tLLIFOmx4FJlnxCHGYVg4N9gnLENj33RLMamOmT5PIISXTO0qYj7oj1Hz+0drRpgOGjwhPZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cj62F/7/JLmj1Mi9cAThNnAhgDYHbPisMf1onOD0YB8=;
 b=4G0YIGCt/SQW+3fUQt4PFJh/U7eXXl1modGcLDzK3mBvE4hCj0UtBE5KQvQC/EjALEKuyxy8I+fN+nOTjH0BEOw5HlWoCRpIeq8JDV3ryMCgTiQsPpkkbHc3weETn1so8to8SklzIpLuLgTiDfndLkPjbAlc/2oTd3/mZnJEEUU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Thu, 10 Dec
 2020 17:39:08 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::b965:3158:a370:d81e%7]) with mapi id 15.20.3632.021; Thu, 10 Dec 2020
 17:39:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201203142902.474883-2-ppandit@redhat.com>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
Subject: Re: [PATCH v2 1/1] security-process: update process information
From: Michael Roth <michael.roth@amd.com>
To: P J P <ppandit@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 10 Dec 2020 11:36:44 -0600
Message-ID: <160762180433.1121977.15435963733609444944@vm0>
User-Agent: alot/0.9
X-Originating-IP: [165.204.53.104]
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.53.104) by
 SJ0PR05CA0205.namprd05.prod.outlook.com (2603:10b6:a03:330::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Thu, 10 Dec 2020 17:39:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9dfc9180-5ba9-4ba2-5de4-08d89d327f65
X-MS-TrafficTypeDiagnostic: CH2PR12MB4279:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42791867CD7124564B5C7EF595CB0@CH2PR12MB4279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zXxvX/Z6O9Dhros1+bmss7sB0n+yKkr9kXFWA42t0uX4vX32+3N4HohLER1yq9kii3x1Jr0rRoi/PP0jUW1DPmvS8+1vHiaGeU5zRReoUQYHx+o0lCr5TGaD/FRdembrKvY3MuE8WDACmBG9Zn3bzfavCpWIchzOxUNt+zZK8JeWa8kJIv6c9H6sGU3DBEqFwixOnoXZk7U5yBrg1101rqFplq3Zug/Yxt1FqunlutswCAKhE39GRQ7JwXV8RqKL+FPNuTBLKRRsyi/8JEJZmhdA7tTMUcCdsIJjsvKV2lXRg9Z8T+l7aekPVa2fp3QRwIbQpSML+mAuVTh+b0SUvllKIaMoiHPfVcDHQrRorPfKyGfEiptjg9CEeX6zJ3kpd7dSy2Y3ti1gjwiiesWKER+FCbGgc823HGXPEwhX0+NVS/N1co1Po/AJyTixe/yDJU/MpKMGYpmPJLN/6MWlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(136003)(346002)(376002)(508600001)(8676002)(30864003)(7416002)(33716001)(110136005)(83380400001)(66946007)(8936002)(26005)(5660300002)(6496006)(6486002)(52116002)(186003)(34490700003)(44832011)(9686003)(66476007)(45080400002)(966005)(16526019)(956004)(54906003)(2906002)(4326008)(86362001)(66556008)(15650500001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUdZWkpySFNwalQyTEhmRXRPZ1A2andITUJuU0hMUGRralNkbDFBQXdKc1py?=
 =?utf-8?B?YnhhdDIwZXh2dTRaaDB6cWtadFJIejlnU1JZcVJZZXpiYTdzWngwK0o2K2lW?=
 =?utf-8?B?MlBydnBpRUNxNGpyVGZHYUIyUFkyUWcwZUZoblpwZFV0Vys2S0Y3WU56d0tu?=
 =?utf-8?B?ajk5cXcvcnJ5aGxvRXRoRFRXUDc0eXhzYW43S0ZtbVd3Q0FSY1h4cnFJTjNM?=
 =?utf-8?B?Qm16OGczVjByWGdDckQxWjdYbVpFNGdKT0J3ZW8vTGZyRmVLOTlLVnBoVlZR?=
 =?utf-8?B?NEs3K2s3RTBzS3owUjM1RkU2TVZzZmpJNkpJb1VUNWZscG9ESnhJSGR1M3dS?=
 =?utf-8?B?ZFN1c1Fub2pBcTZaR0xMMGNNZ1FDR2VMdTluSlI0Q0dLdXlQdWZuZG55bHlZ?=
 =?utf-8?B?ZDFRREFJVjdvYmViQWllLzJnNUV6anJTbGJrZ0daY0JYY3ppNFVleWRvdzdo?=
 =?utf-8?B?K0V6YUQyNkttekU4RS9vcjhmT20xZ2Nvc012ZDJYYjdSOVRNYjI1RG1WblVV?=
 =?utf-8?B?bXNVam14L3BMV0ZRdllnMHBJa1dQMzNWVXhrQ1FOdytFNUdiUUpJaTZyRkJx?=
 =?utf-8?B?b0hFL0p4aUtOU2gzaStwaXNBMFRhTGIzMU05QkVXaDBzT2EzZktuS2syWkFT?=
 =?utf-8?B?Vm1rQi9zV2RZYlF6L1RTUTZ4enVwL3l4OUU2K1lWdHg2WDVoR1dOdGxBYU9I?=
 =?utf-8?B?a0k4WEtIWFlTV0sxSnUrcUFKaktpWXh1SzFzSGlvUmpVaTN3TGFxcmdsZU85?=
 =?utf-8?B?d2N0alAzNUxNSVRad3ZoOEtWMmpOcmlVUnRNOGVkc3pCRDJTUGNkUXREUlND?=
 =?utf-8?B?KzNqSzBobU9uZXVBd0VwakR1bFBsaGZoSTVNRUpUZXJMaEs3c05BUjJnSGg3?=
 =?utf-8?B?NEFCYlZEbUsyTjdvQW5LWDdldzIvcU9Vd0w2ZWkvU1ltV2QycTY3S05oTWhR?=
 =?utf-8?B?MmU3NTN2cy9VTGRyUjZQdExpalMrM2RZQ2hZZDY2K1NJU3NpKzdiNmJUSnVC?=
 =?utf-8?B?L2J5WGVLcUx2ZlJoaVhsNERhUittbjFoUmNqejM2WVR0VVJSZm1BbzFZMkdl?=
 =?utf-8?B?eXZFSWhtZ0I1TmF6eitpZmt2OTdrRW11TEdqUTlOWldjcTJtbkNlSGdsQk52?=
 =?utf-8?B?RWJSNVozUFFDKzVYdmt3NVNVMVFXbW11bXp0SzcraVdQVVJabGc4eTNIM0V5?=
 =?utf-8?B?VjVMOFJYTWJSY1hBamZMSXhhVVd2bFlsZWhCam14c1pxNXptcmdya3JFT0ps?=
 =?utf-8?B?WUVVMlJqVmE5K01FMXRaNVYyZmZ4VW1aZ1RtYVJRODFDR3VKRjRuRlhWY1A5?=
 =?utf-8?Q?xBLo3ida4ylBz/VxcWheTTRIUjUOldEKiE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 17:39:08.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfc9180-5ba9-4ba2-5de4-08d89d327f65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypKUB5oc3qTrTmYpAV1kiXFTUNH/WUwfVHugs8jeB0FTPlLQ5Ze8mizs0MApP6OkHv0Mx356jyqKzmE5CittUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
Received-SPF: softfail client-ip=40.107.223.69;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>, Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Michael S . Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Darren Kenny <darren.kenny@oracle.com>, "Daniel P . Berrangé" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting P J P (2020-12-03 08:29:02)
> From: Prasad J Pandit <pjp@fedoraproject.org>
>=20
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
>=20
> Update the security process web page with new mailing list address
> and triage details.
>=20
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  contribute/security-process.md | 154 ++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 59 deletions(-)
>=20
> Update v2: incorporate inputs from upstream reviews
>   -> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.nongnu.org%2Farchive%2Fhtml%2Fqemu-devel%2F2020-12%2Fmsg00568.html&am=
p;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d897981c8=
1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879460819%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C1000&amp;sdata=3DmmvwGiZ9dbuPML6gxiHW0HPbACQ5KkFoTnX%2F0zoZ0Dg%3D&=
amp;reserved=3D0
>   -> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.nongnu.org%2Farchive%2Fhtml%2Fqemu-devel%2F2020-12%2Fmsg00584.html&am=
p;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d897981c8=
1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879460819%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C1000&amp;sdata=3DYCDVNuoF1TsPgvHmBMnCKFVMq6jSdDLSpYRa%2BDNr9z8%3D&=
amp;reserved=3D0
>=20
> diff --git a/contribute/security-process.md b/contribute/security-process=
.md
> index 1239967..13b6b97 100644
> --- a/contribute/security-process.md
> +++ b/contribute/security-process.md
> @@ -3,72 +3,110 @@ title: Security Process
>  permalink: /contribute/security-process/
>  ---
> =20
> -QEMU takes security very seriously, and we aim to take immediate action =
to
> -address serious security-related problems that involve our product.
> -
> -Please report any suspected security vulnerability in QEMU to the follow=
ing
> -addresses. You can use GPG keys for respective receipients to communicat=
e with
> -us securely. If you do, please upload your GPG public key or supply it t=
o us
> -in some other way, so that we can communicate to you in a secure way, to=
o!
> -Please include the tag **\[QEMU-SECURITY\]** on the subject line to help=
 us
> -identify your message as security-related.=20
> -
> -## QEMU Security Contact List
> -
> -Please copy everyone on this list:
> -
> - Contact Person(s)     | Contact Address               | Company       |=
  GPG Key  | GPG key fingerprint
> -:-----------------------|:------------------------------|:--------------=
|:---------:|:--------------------
> - Michael S. Tsirkin    | mst@redhat.com                | Red Hat Inc.  |=
 [&#x1f511;](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fpgp.mit.edu%2Fpks%2Flookup%3Fop%3Dvindex%26search%3D0xC3503912AFBE8E6=
7&amp;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d8979=
81c81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879460819%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;sdata=3Dach%2FMe1VOaT98jtMyPJC4I0uAo4uROCecrjiS8MmpkU=
%3D&amp;reserved=3D0) | 0270 606B 6F3C DF3D 0B17 0970 C350 3912 AFBE 8E67
> - Petr Matousek         | pmatouse@redhat.com           | Red Hat Inc.  |=
 [&#x1f511;](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fpgp.mit.edu%2Fpks%2Flookup%3Fop%3Dvindex%26search%3D0x3E786F42C44977C=
A&amp;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d8979=
81c81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879460819%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;sdata=3D9ZvtaQbfvaZl7JPIXIRPXuV4SNc%2FYrsa6nYmP7gqAFM=
%3D&amp;reserved=3D0) | 8107 AF16 A416 F9AF 18F3 D874 3E78 6F42 C449 77CA
> - Stefano Stabellini    | sstabellini@kernel.org        | Independent   |=
 [&#x1f511;](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fpgp.mit.edu%2Fpks%2Flookup%3Fop%3Dvindex%26search%3D0x894F8F4870E1AE9=
0&amp;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d8979=
81c81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879460819%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;sdata=3DCrn3Vjvg4yhGV08muovU2xoxDhU62UQHGoXRyEAlowY%3=
D&amp;reserved=3D0) | D04E 33AB A51F 67BA 07D3 0AEA 894F 8F48 70E1 AE90
> - Security Response Team | secalert@redhat.com          | Red Hat Inc.  |=
 [&#x1f511;](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Faccess.redhat.com%2Fsite%2Fsecurity%2Fteam%2Fcontact%2F%23contact&amp=
;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d897981c81=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879470809%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3D%2F9S%2B48R1svm2onjH%2B0s94eIOsDjn12oOEmhX2a4TLMQ%=
3D&amp;reserved=3D0) |
> - Michael Roth          | michael.roth@amd.com  | AMD           | [&#x1f5=
11;](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpg=
p.mit.edu%2Fpks%2Flookup%3Fop%3Dvindex%26search%3D0x3353C9CEF108B584&amp;da=
ta=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d897981c81%7C=
3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879470809%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;sdata=3DheJAgFDdBUdhmSDAZUV6WaR6MaQXzcXfCCWNC2LN5Wg%3D&amp;re=
served=3D0) | CEAC C9E1 5534 EBAB B82D 3FA0 3353 C9CE F108 B584
> - Prasad J Pandit       | pjp@redhat.com                | Red Hat Inc.  |=
 [&#x1f511;](https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%=
2F%2Fpool.sks-keyservers.net%2Fpks%2Flookup%3Fop%3Dvindex%26search%3D0xE285=
8B5AF050DE8D&amp;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf04492=
71f908d897981c81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374260268794=
70809%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DY0loOnpwtCDOJYeL%2B7VkLHFTuRh9dVeH=
RTp5xPN5EwU%3D&amp;reserved=3D0) | 8685 545E B54C 486B C6EB 271E E285 8B5A =
F050 DE8D=20
> -
> -## How to Contact Us Securely
> -
> -We use GNU Privacy Guard (GnuPG or GPG) keys to secure communications. M=
ail
> -sent to members of the list can be encrypted with public keys of all mem=
bers
> -of the list. We expect to change some of the keys we use from time to ti=
me.
> -Should a key change, the previous one will be revoked.
> -
> -## How we respond
> -
> -Maintainers listed on the security reporting list operate a policy of
> -responsible disclosure. As such they agree that any information you shar=
e with
> -them about security issues that are not public knowledge is kept confide=
ntial
> -within respective affiliated companies. It is not passed on to any third=
-party,
> -including Xen Security Project, without your permission.
> -
> -Email sent to us is read and acknowledged with a non-automated response.=
 For
> -issues that are complicated and require significant attention, we will o=
pen an
> -investigation and keep you informed of our progress. We might take one o=
r more
> -of the following steps:
> +Please report any suspected security issue in QEMU to the security maili=
ng
> +list at:
> +
> +* [\<qemu-security@nongnu.org\>](https://nam11.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Flists.nongnu.org%2Fmailman%2Flistinfo%2Fqemu-s=
ecurity&amp;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f90=
8d897981c81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879470809=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DDgnc%2FyzLIGzHUA6qfMewzRxMTypxM4mUWFKQp=
tKogx4%3D&amp;reserved=3D0)
> +
> +To report an issue via [GPG](https://nam11.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgnupg.org%2F&amp;data=3D04%7C01%7Cmichael.roth%40a=
md.com%7C513aba522bf0449271f908d897981c81%7C3dd8961fe4884e608e11a82d994e183=
d%7C0%7C0%7C637426026879470809%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dy%2BNR12H=
9ETsYX0dky9JfrAGdyKx1Sp%2FCPvAO8g%2BRYH0%3D&amp;reserved=3D0) encrypted ema=
il, please send
> +it to the Red Hat Product Security team at:
> +
> +* [\<secalert@redhat.com\>](https://nam11.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Faccess.redhat.com%2Fsecurity%2Fteam%2Fcontact%2F%23=
contact&amp;data=3D04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f90=
8d897981c81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879470809=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DHWZxebDeAX1vEx0Qyg066Seml3ODlr%2FxxKoAW=
YvFQhc%3D&amp;reserved=3D0)
> +
> +**Note:** after the triage, encrypted issue details shall be sent to the=
 upstream
> +'qemu-security' mailing list for archival purposes.
> +
> +## How to report an issue:
> +
> +* Please include as many details as possible in the issue report.
> +  Ex:
> +    - QEMU version, upstream commit/tag
> +    - Host & Guest architecture x86/Arm/PPC, 32/64 bit etc.
> +    - Affected code area/snippets
> +    - Stack traces, crash details
> +    - Malicious inputs/reproducer steps etc.
> +    - Any configurations/settings required to trigger the issue.
> +
> +* Please share the QEMU command line used to invoke a guest VM.
> +
> +* Please specify whom to acknowledge for reporting this issue.
> +
> +## How we respond:
> +
> +* Process of handling security issues comprises following steps:
> +
> +  0) **Acknowledge:**
> +    - A non-automated response email is sent to the reporter(s) to ackno=
wledge
> +      the reception of the report. (*60 day's counter starts here*)
> +
> +  1) **Triage:**
> +    - Examine the issue details and confirm whether the issue is genuine
> +    - Validate if it can be misused for malicious purposes
> +    - Determine its worst case impact and severity
> +      [Low/Moderate/Important/Critical]
> +
> +  2) **Response:**
> +    - Negotiate embargo timeline (if required, depending on severity)
> +    - Request a [CVE](https://nam11.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fcveform.mitre.org%2F&amp;data=3D04%7C01%7Cmichael.roth%40=
amd.com%7C513aba522bf0449271f908d897981c81%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C637426026879470809%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DtX%2FfJO=
D5YLlBiub1eq0Wzo1eXaMI30U2x76JnSRTM0k%3D&amp;reserved=3D0) and open an upst=
ream
> +      [bug](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fwww.qemu.org%2Fcontribute%2Freport-a-bug%2F&amp;data=3D04%7C01%7Cmi=
chael.roth%40amd.com%7C513aba522bf0449271f908d897981c81%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637426026879470809%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DsNNjhfl3KhOEnmEnIX4st9%2FJtxVWQVHAnN4xCpRTrgs%3D&amp;reserved=3D0)
> +    - Create an upstream fix patch annotated with
> +        - CVE-ID
> +        - Link to an upstream bugzilla
> +        - Reported-by, Tested-by etc. tags
> +    - Once the patch is merged, close the upstream bug with a link to th=
e
> +      commit
> +        - Fixed in: <commit hash/link>
> +
> +* Above security lists are operated by select analysts, maintainers and/=
or
> +  representatives from downstream communities.
> +
> +* List members follow a **responsible disclosure** policy. Any non-publi=
c
> +  information you share about security issues, is kept confidential with=
in
> +  members of the QEMU security team and a minimal supporting staff in th=
eir
> +  affiliated companies. Such information will not be disclosed to third =
party
> +  organisations/individuals without prior permission from the reporter(s=
).
> +
> +* We aim to process security issues within maximum of **60 days**. That =
is not
> +  to say that issues will remain private for 60 days, nope. After the tr=
iaging
> +  step above
> +    - If severity of the issue is sufficiently low, an upstream public b=
ug
> +      will be created immediately.
> +    - If severity of the issue requires co-ordinated disclosure at a fut=
ure
> +      date, then the embargo process below is followed, and upstream bug=
 will
> +      be opened at the end of the embargo period.
> +
> +  This will allow upstream contributors to create, test and track fix pa=
tch(es).
> =20
>  ### Publication embargo
> =20
> -If a security issue is reported that is not already publicly disclosed, =
an
> -embargo date may be assigned and communicated to the reporter. Embargo
> -periods will be negotiated by mutual agreement between members of the se=
curity
> -team and other relevant parties to the problem. Members of the security =
contact
> -list agree not to publicly disclose any details of the security issue un=
til
> -the embargo date expires.
> +* If a security issue is reported that is not already public and its sev=
erity
> +  requires coordinated disclosure, then an embargo date will be set and
> +  communicated to the reporter(s).
> +
> +* Embargo periods will be negotiated by mutual agreement between reporte=
r(s),
> +  members of the security list and other relevant parties to the problem=
.
> +  The preferred embargo period is upto [2
> +  weeks](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Foss-security.openwall.org%2Fwiki%2Fmailing-lists%2Fdistros&amp;data=3D=
04%7C01%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d897981c81%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637426026879470809%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;sdata=3DcfAc%2B9w%2BDt6KsGgZtaOG%2BLfaVbZ637L2fYLINX1Qhng%3D&amp;r=
eserved=3D0).
> +  However, longer embargoes may be negotiated if the severity of the iss=
ue
> +  requires it.
> +
> +* Members of the security list agree not to publicly disclose any detail=
s of
> +  an embargoed security issue until its embargo date expires.
> =20
>  ### CVE allocation
> =20
> -An security issue is assigned with a CVE number. The CVE numbers will us=
ually
> -be allocated by one of the vendor security engineers on the security con=
tact
> -list.
> +Each security issue is assigned a [CVE](https://nam11.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fcveform.mitre.org%2F&amp;data=3D04%7C01=
%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d897981c81%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637426026879470809%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DtX%2FfJOD5YLlBiub1eq0Wzo1eXaMI30U2x76JnSRTM0k%3D&amp;reserved=3D0=
) number.
> +The CVE number is allocated by one of the vendor security engineers on t=
he
> +security list.
> =20
> -## When to contact the QEMU Security Contact List
> +## When to contact the QEMU Security List
> =20
> -You should contact the Security Contact List if:
> +You should contact the Security List if:
>  * You think there may be a security vulnerability in QEMU.
>  * You are unsure about how a known vulnerability affects QEMU.
>  * You can contact us in English. We are unable to respond in other langu=
ages.
> =20
> -## When *not* to contact the QEMU Security Contact List
> +## When *not* to contact the QEMU Security List
>  * You need assistance in a language other than English.
>  * You require technical assistance (for example, "how do I configure QEM=
U?").
>  * You need help upgrading QEMU due to security alerts.
> @@ -76,6 +114,9 @@ You should contact the Security Contact List if:
> =20
>  ## How impact and severity of a bug is decided
> =20
> +**Security criterion:**
> +    -> [https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.qemu.org%2Fdocs%2Fmaster%2Fsystem%2Fsecurity.html&amp;data=3D04%7C0=
1%7Cmichael.roth%40amd.com%7C513aba522bf0449271f908d897981c81%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637426026879470809%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DYxhVZOXdQSSenKq%2BrLAp%2FRbbXAQUV1fpPw13Xj6TP18%3D&amp;reserved=
=3D0](https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.qemu.org%2Fdocs%2Fmaster%2Fsystem%2Fsecurity.html&amp;data=3D04%7C01%7Cm=
ichael.roth%40amd.com%7C513aba522bf0449271f908d897981c81%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637426026879480803%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DQxrnZB67HVdg9B97FBcCNjP1Y%2F%2BSao4gn0X8ZVhh%2B2c%3D&amp;reserved=3D0=
)
> +
>  All security issues in QEMU are not equal. Based on the parts of the QEM=
U
>  sources wherein the bug is found, its impact and severity could vary.
> =20
> @@ -122,8 +163,3 @@ used to write programs for the SoC device. In such de=
veloper environments, it
>  is generally assumed that the guest is trusted.
> =20
>  And thus, this buffer overflow turned out to be a security non-issue.
> -
> -## What to Send to the QEMU Security Contact List
> -
> -Please provide as much information about your system and the issue as po=
ssible
> -when contacting the list.
> --
> 2.28.0
>=20

Reviewed-by: Michael Roth <michael.roth@amd.com>

