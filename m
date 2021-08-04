Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252213E084B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:50:24 +0200 (CEST)
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLyB-0000gm-79
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mBLxD-0008S6-8X
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:49:23 -0400
Received: from mail-dm6nam10on2042.outbound.protection.outlook.com
 ([40.107.93.42]:37632 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mBLxA-0000W9-Jh
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:49:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uwm2/y0HgWUpm4o1yH3Bz1LHXEAFIaZ5pL6su0tcTK/SJDdW8dmmSfWmtXT/9tiKXohtNWJgrKXHtzj4fBg3PL9f6zhITvSSFp4SEJGc+RR6A3qmYXBS+j64AY2Nm4JBCMSklSnNax86kZm65jnkKcIVvN5jf3ziO2cbHgpO5esWlI4jMQYmLgQSs5cMiAFx5RpkFM2OdmF0b0Oal+6tw0GLlhDstkNixXKeIL+jM/2KAEeNHieV1mgXbVjdis8BZneqdA55ElgGjTjK2YNj8lgwOu8/4uOj+GATGggR9w98tY4puZHTuwWMEaqscA//+GrUJ0fS0I3v8iyS636WIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNS8t4m7ZXzo0T8EqaO13HbaATYrIPjvn5VEVfEY6Iw=;
 b=kY+c5FgDW/dvk/XBA3hXxOou1FCF4HdNHPCwAqlTqDad9Zz+AQl7gcvzudoLn73nLelNFxdlStwb2JwSob62B9VlRobU2F5A1hAw2IrZyH2QJQFiGjf0yTBM3MOzsVQ1C+BV97gVopgHQynS8Xe/917LfMPAkjghzaK6aL++O6DgHDKN4ko4OBtNYVXNu9rtJy0BwjbxKycxQTqL1nkPim1VaXZ99h0dpwMTVu/pLwvG09lMZFI5qurKgqNX0pEZ14V+9tb5MxO/DHdrB6zazG1luwYvTOrVwSIBqsYHfdnhLRmYXxW7BkpzghY2xAi9yQ34ZhYI8jeFJuedT1veKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNS8t4m7ZXzo0T8EqaO13HbaATYrIPjvn5VEVfEY6Iw=;
 b=Z0hNTYk/YoVhTfEgo2LXMyV+J7q3IlX2vevHPYq+nOV904cFrmnK6RPoECu40RA0GIMSRDfzu3HMX0Z9pntlO/5FUsXg07SCiAwsw8KJ/IE7fcDaJI31Zulk/4hlAMtKVfCeuLq2C4ooi5PyB+v32EbH35kp7lmNcEmszoHLvfQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4325.namprd12.prod.outlook.com (2603:10b6:610:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 4 Aug
 2021 18:49:08 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4394.017; Wed, 4 Aug 2021
 18:49:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1a4afd24-cd22-29c7-6eab-79735d9860b9@ilande.co.uk>
References: <162810031138.1167212.50563546711940033@amd.com>
 <1a4afd24-cd22-29c7-6eab-79735d9860b9@ilande.co.uk>
Subject: Re: [ANNOUNCE] QEMU 6.1.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
Cc: peter.maydell@linaro.org
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Date: Wed, 04 Aug 2021 13:48:50 -0500
Message-ID: <162810293093.1169553.17965637107034020917@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SN6PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:805:66::21) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by
 SN6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:805:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Wed, 4 Aug 2021 18:49:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f38e376-71b4-4f23-c62c-08d957788acf
X-MS-TrafficTypeDiagnostic: CH2PR12MB4325:
X-Microsoft-Antispam-PRVS: <CH2PR12MB43250EBED461F1E6B269A7E595F19@CH2PR12MB4325.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mymj8do/z9RJ44mUb70RqtiRvnIaDgpLF6EtVjOtNrJvBXqoX0kc8dUva2zy/NVJ3AqQcbIsAcGOWP1d+HLGYNQqZm03GPGVvUI2s0H5mg0bcMubB9/SnWhZKy5nL2c9iEQn555Zic2U5pAF+dgZ5V1kMNHtv9YMgBeXCgcevMJqlW96kccMr1tuIPUUeeW7J6zdaGJ6o+rF78kdRcbRenfIc6mY0KJSzx8gaL0z7LOnG+R5+jXBSb2jaW25GrCHs9Zxv2Xj5m3or01egNopbLv73+voBiR+7u5LKUvU6sBKRWwC1VhSW84gqYhFCSlnFj7mq0skI6a8xdMwL2HzYPV+VW2qUxmKvKp/XOwwKs7eiJoXUkPftrP/NF2ekI6rbYcMARRQYkc3/dzTYNUBOLSqi2lTxv/Id6SKbd5QNYU9jhIbXbSeuSiMgckquCyNg9++OAI5D3H2T303Baezi0+nEhQoD7lhMb42MCqkQOrudi0VjAZLCy3orB+rwqnZWj6Q07/UnGSrtA8sKKOpkFuERvxGYyOanUw5dUm+1GkyUFE0exbVlz0j33JAtBbJ2srn0FeJAs9ZL3TQd9D5TmvvEIrkAOR8UsAPTZncFGOif/P0/AAaGUcCmNWlTYLnlqTK7zIjma7fN6bmQYf5RlZQJyw6PwLuXVl2+i14/lbi5V/XExKK0jch4so87s+8F1r4bd6nHB+VqMJUH7gQYo77YutBUjBy1Qmpi8pnqDQGTN3TC9W7fNnonzz5KRPCigS84va8IZvDdoTSMfAvXXiJK65pU3NTtbyyOsM6i+JFO+J5l98O1ptNrVGj/xwu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(316002)(966005)(53546011)(6486002)(6666004)(8676002)(478600001)(38100700002)(26005)(66946007)(86362001)(186003)(5660300002)(38350700002)(6496006)(4326008)(44832011)(83380400001)(52116002)(2616005)(36756003)(66476007)(8936002)(2906002)(956004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJmbFZma21scXRLbG55YVN4TUxFdEd4Z1RLaHQ2WnB6eFZ5MXZ6ZXNjL0F1?=
 =?utf-8?B?UHc3MkhsYWI5WWh1RHhiMU5xQm0xckZZV0FRblFaV1VIQms3SURWNGpnQkhY?=
 =?utf-8?B?R0VtTmdESWJTLzY5ZERYQU1vQUJGSzlVTW9Wd0kvMVIyQjlsaG9LYmZuNHZu?=
 =?utf-8?B?dmZFMjMxWkY1WTR4UENEYjI1a0tpbGlmaUYxMG5RdWZINE1BL25vUnBmSlFi?=
 =?utf-8?B?QjZPaitNOStaRGxsazBpK0VMeHg2Smt3KzVDcldVZFo0NzlVTUdGd2FyR29V?=
 =?utf-8?B?SDgxZkJJamtrWVJWRmI0Sk0yM1dkcVBGcjdBZEYyWUwxQ3JQYU1uTXF6SXNQ?=
 =?utf-8?B?NDNHUURxK2EvVXpTSXR3bE91TWJuMit1ckQwNEU1TjdRVXc4bG5XY09uSmgx?=
 =?utf-8?B?clFGaERLbTE3TDd6MG8xbE5qenloeTd1NzJGVTN5Slhxc1JsUVFkbTdBalFM?=
 =?utf-8?B?bGdzVm9hMmhNdnllSlNPRWVxbGZWQitKb0pTT3AzdTJmOThPWVJtazJCWjM0?=
 =?utf-8?B?akduMHVyd05rWmN5eDVKNG1SakFiZ3NrTDduSklubkoxNmpVYzROeWFCdjZT?=
 =?utf-8?B?djU4dWtCZGx4bE9ROGI2dUlzWnVDbllGTjBhNjhEMXBnMlZoNzA1WXErS2p3?=
 =?utf-8?B?czlnRFhkT1UwZzRpYWwvc1E5VUNkV1ZwcWJxemNWVkx6M1ZueUZ2di9XWFA0?=
 =?utf-8?B?MG9yK1h4WnYzWnlPdm1PYnlYU0pvUGEzb1BPYU1EUis1Z0sraTRpRnlJaTNk?=
 =?utf-8?B?QkJqb2JxU2VJOHhZUWdobUdPR1BFS1R2ZWJMd2dMemxHTnVDRWVJaDVkKzN5?=
 =?utf-8?B?SG5vNVB4Wi92Ri8rV0FZQlpQZVh5THhMemNIbHJLR0tjUkVQRnBZdy9oQjdH?=
 =?utf-8?B?dzhaSVpWVmE0SnBqSUNvQk45NEljaUtxUmJiaWhiMzZyS09kaDdaelA5SzFB?=
 =?utf-8?B?d2xmcVdjTTZldlZKbEJvUHRHTG90cGk2RnVtOVNES3Q5ay96Z2poWkliOEVo?=
 =?utf-8?B?MW1BeGlvNkxDQmx5N1B2QXpXL0phUGlzUFc3cnR4b0Z5U0xvd3MrTnlpSHJ2?=
 =?utf-8?B?SmE3T1piaGpRR1JMU0wwQ1VDL2xYY1VHak1PN0tTSEk1SjA0YjRwREFoYlQ5?=
 =?utf-8?B?UmtOOU1LUmxCSUg3NHpRRkFwSkt0enZnQWNoMGhHTUxiR2NSd2hrdng2Q01D?=
 =?utf-8?B?UjJSUkxxWWtveXhIdGhlVWF0cTRvVDRKSWtyTEpuUWh3cC90TmlrN0tjTGEv?=
 =?utf-8?B?MmhCdGFETWY2MnVZZzlaL041MXRjVlJYeFg5R2tkKzVXTTRrTzlOZ3p6UjBX?=
 =?utf-8?B?N1ZIaW5tQ2hqWjlmNVZlK2xtVGRrSzdtd2ZZOFJoZDBBS0VCUEV6MWttR2kw?=
 =?utf-8?B?WUZ4bVEzRlo2cFJheXRxdmc0K0duL3pJT3VabWMrV2hqR3lOb1JkQ1hxZ0Zk?=
 =?utf-8?B?RDlwTTdFdEJlTVNUbFJGTW1YT2RrMzN6Zm56VHVJUlIrYkV0Q3ZDOXNrU0hz?=
 =?utf-8?B?bmxIR3M0c1c0VVk5WGxlR3kya2RTUFZReE5rN1dXeHhId0VpSlNoMzd5R20v?=
 =?utf-8?B?cHhyOGlCQnljSVMyVTRqWHpNL2o2TFhMZEtkeE9JZWhMZkZHamZkNjZyRWhF?=
 =?utf-8?B?Vk9wSFBvMFhFSWtuVVlCMUVuUkp1R1IrVjN5Rjd2bzlXaDJHNUtuSzhhU2V6?=
 =?utf-8?B?KzNXTURGNXBRK240SnYvTW1FZFNMaVlsUFdmVm93bWlPMDRtL2FRc3h0UVFG?=
 =?utf-8?Q?ciUEyCgRsWeNgnFRqL/+YiOw7d3PQM8CH5LRqeZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f38e376-71b4-4f23-c62c-08d957788acf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 18:49:08.7693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JfRe3JIWLDPV6O9kqHDINUvoNgKW/F0f/CAm23b3OYfl9GPkUtX6zCbbQ52BAIys7eOnW9l1fpuv0sdOvmURg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4325
Received-SPF: softfail client-ip=40.107.93.42;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting Mark Cave-Ayland (2021-08-04 13:37:43)
> On 04/08/2021 19:05, Michael Roth wrote:
>=20
> > Hello,
> >=20
> > On behalf of the QEMU Team, I'd like to announce the availability of th=
e
> > third release candidate for the QEMU 6.1 release.  This release is mean=
t
> > for testing purposes and should not be used in a production environment=
.
> >=20
> >    http://download.qemu-project.org/qemu-6.1.0-rc2.tar.xz
> >    http://download.qemu-project.org/qemu-6.1.0-rc2.tar.xz.sig
> >=20
> > You can help improve the quality of the QEMU 6.1 release by testing thi=
s
> > release and reporting bugs on Launchpad:
> >=20
> >    https://bugs.launchpad.net/qemu/
>=20
> Since the project is moving away from reporting bugs on Launchpad, are yo=
u able to=20
> update the text template to point to the issue tracker on gitlab instead?
>=20
>      https://gitlab.com/qemu-project/qemu/-/issues

Certainly! Thanks for the suggestion.

>=20
> > The release plan, as well a documented known issues for release
> > candidates, are available at:
> >=20
> >    http://wiki.qemu.org/Planning/6.1
> >=20
> > Please add entries to the ChangeLog for the 6.1 release below:
> >=20
> >    http://wiki.qemu.org/ChangeLog/6.1
> >=20
> > Thank you to everyone involved!
>=20
>=20
> ATB,
>=20
> Mark.
>

