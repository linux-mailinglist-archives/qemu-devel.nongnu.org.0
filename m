Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAD36FBD2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:58:20 +0200 (CEST)
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTet-0005ZI-K6
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcSlq-0001jt-2f; Fri, 30 Apr 2021 09:01:27 -0400
Received: from mail-eopbgr740115.outbound.protection.outlook.com
 ([40.107.74.115]:45472 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcSli-0005rR-FS; Fri, 30 Apr 2021 09:01:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTCdVvVDVRpvDAiRMj0QHQvqUSzcMgPefSbRHlLJh95QRdX99ICiZXUmIFG69uIw9AEuiN3MHSMZAOcTc7MzYttWKmAaKwAR7RfhDEp80MDUirKNyPfzDj3ZrcmQvtTb86lDamoL0lej3v8W57EG07f9TycWFGdyqxMx896aEyfQPqIKpSxFxZUjOiVV2fS286jAQdOmVWFKOaWTfU891RYLCPk5p5H8jzOY5ozPRapuQkih8CnTI4ilHKXbTwiMmU5vb4YeL9t3/gTEZbUCJu8TIqu7gqq3IQ0jH3eglKqP2vhoa01uj9VMINsUpfSb2nfj5XwcxA/xqYJUV71f9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVi89NYOvMGC/SLpQZ8crWj38qk6bTRmPTXrF9QWwuk=;
 b=R3iOgAVTd4pZPKcVUTFuHYvdEMFmbZBu9oTFV4ejzTG0ABDgvD0FIiWut8gfqxeL9NfPH2O8KBqtBZZ5ud8oyaln8gFUaR2rYlXej+RUMMeuEeBrBZOcq64u14NyCUc5IiS77EdYFDVhqFVDQAFderPzXH3yFUBedLk9YtAAchKgG+SS05y0sxHiQcuUYPlg2I6S6j7Jj+EWOW73ZxPq6NY+uPyupbrNWAyoeOqCZLTe6qqjGR7eCgzZXpEEd0k1TvpRwxxPw8Hfi6bbGjnwwQZZz/pVzf2Y8LNI9gUcNoWeWtTxo7OiFTN81lDjsmx/2m+dr2k1ZxGU7zOk51ve4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVi89NYOvMGC/SLpQZ8crWj38qk6bTRmPTXrF9QWwuk=;
 b=Zji3ftchjjbeIrMR4T9XODU21dwB78GuMRHPP8SThLsXprjLcwkjR8sD2l+ADby5dP+7P19HtexEahPXQNEoiqR1vFT2qSNLp+MK6YMfPMNVFDUDvUgD5FTFaC3uNdEtqc+CZR9Sv4eg+D5v9Uht/C82NySWXI/8J0qctz8xf3qxRkeSNelyvjWw8PZ+G//s+Tlnd7UoYz1CbIzR4W33eWUlzRvlZOjt6JDGCazrfbNbSY5JN5oN9YuGS1ibtpojwu6U11FmU8R4f8QAR8tf04gKkTGWZ0c1JJSFAE+dLCQ+aqqQFc01uGPatQ+913pFUF6drdz+4P73B3rvwaDALg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4705.lamprd80.prod.outlook.com (2603:10d6:102:44::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 13:01:13 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 13:01:12 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 01/30] decodetree: Introduce whex and whexC helpers
Thread-Topic: [PATCH v3 01/30] decodetree: Introduce whex and whexC helpers
Thread-Index: AQHXPV5aURgwVkXNeECYaew9ZZEcXarNBmZw
Date: Fri, 30 Apr 2021 13:01:12 +0000
Message-ID: <CP2PR80MB366898DBAB5D4387E82E2157DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-2-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-2-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ef1dcbf-1a71-4038-484d-08d90bd8082f
x-ms-traffictypediagnostic: CP2PR80MB4705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4705C47EA2F1CFE2BF15BAD4DA5E9@CP2PR80MB4705.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ag3mX2vJxqgpNPgXZYynRhpumFZY2ql9KMeBAKJA6M2Vs1nloGOMRaEhocPM0q4b6QSus1sq7XVSOSOJFHwrzP2l6FYpdb71R2GHLqwdtVAQEm7IfzwnOOzKlKLWTsaoAzYRzwUwZOxER9ocYnbIzNxjoM52MoDj7nzprxeyxJef4zkj328NE1fFTdC7pTpROWlTWX/1QfrpLT+kAZBxzsYAAVu/svp85unZ8bY90JWXxh3EHlRErGdsqpWgrHK56vC4ErXse7cDLtw8fOeeUcbomf0n11ReFkYpzcDj8WwW6EJBR4vXqc6J86/fQkx3MA7asqWHMPoN/q4IKt+J1DxJlQuvHe0t5x3zfSBESk2Bz+WXHNQcooY4VDUJvUPt8Qsw+GPiHM6B1+S0pdfD3CZGh+u4sONdRH05Gkk6uxcgT0iSamyEulCzyY9i2Vnl2N2z+L+2w0FxeeG39byAmteBf+okn0c6D4ECzsQ0joVSu071GPSZD+Wwb/B8DD5WBg1mJIqEp03xT/rcW8JVICJnGsWfVXZXsQ3mVFK8cl7Z1PYH0PQ4DC6EGPq/a9H8wkKd1Wrul3//69T0GHWb7AXALAzzFq3EXfIRV5fPTJU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(376002)(136003)(396003)(366004)(66446008)(8676002)(66556008)(478600001)(86362001)(110136005)(186003)(38100700002)(5660300002)(33656002)(9686003)(64756008)(2906002)(4744005)(122000001)(83380400001)(6506007)(71200400001)(7696005)(55016002)(316002)(54906003)(4326008)(52536014)(76116006)(66946007)(8936002)(26005)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?QL9C32OHBv3WyiMRZQw7lGKYRy3pzoqpgroEa0OYZqQqF3j8jTGz1Rn+kW2S?=
 =?us-ascii?Q?SQdcruFHfCVon+bYEyO/WdLL9JVTQeThmdf7Og408kB27k7LSc+u5/ZUWtit?=
 =?us-ascii?Q?wGrJKcgqt/SHNMXfiy7mNhaA/vafXvGKOGBVH2b6Rg1kEGf4x3YVhF/mJsE0?=
 =?us-ascii?Q?rR4sMTodsj2z05T+UmMvqp/EUhtD5PJAzELFEXQsJWBXeuGYLUmb6hDJJMSw?=
 =?us-ascii?Q?QsyyGl+7VWGpJHCNvy4m5vQHBGaSre6PTa9k3tOCz2hhsIYtif1arV0sBJZU?=
 =?us-ascii?Q?/AActKwVxlbS6c6Dudwm8QjpG1f8ERyQje7VNPLS2OOBCx5RgSF4gfFEAycB?=
 =?us-ascii?Q?DlBtaQEjUZs2EA/kJB+f/MhDKTz0fkZG7jjpercNQfU7hHhMryXwBKhtErmI?=
 =?us-ascii?Q?ZqGmCZN4reXMX7/2UNtn2wM/atzbytfwuZegBYWdXISNEPuMgNSdDkeqzZIJ?=
 =?us-ascii?Q?fqYbrvpITyUgzFZsautCOwChsSjEF7apoF+pePLvPewRJHXrBNydDw9xtWiX?=
 =?us-ascii?Q?B/XAeV0Oyn4+1qy5MexjPJrVHT+TeNjahlw1fYlnWfF3SD4zgnuTfATQ/Cnq?=
 =?us-ascii?Q?4C0HbZaC3g1tawxn8dATkjcvsyw41PKVH8nCETNv3SytQXlyEEa1VALgOGeG?=
 =?us-ascii?Q?EEHuCgdixVJlFBfzgw2nsy3pWnjTAjvaQgaafNfMQnpm2hiL2p+Hr2hdr60v?=
 =?us-ascii?Q?h+GWJIuaoDUo8LksGIW11Eu7btziC1ebdSoL6hNw8XfVzUaROB/fm0uLawa/?=
 =?us-ascii?Q?SvlQT4UNS+rGaKMvcF2xMN1fVXYnLYEjlmI/IQtJFGm4XkG/WVIfD1SYSOuQ?=
 =?us-ascii?Q?vBXiO2O95lM9Xvjf0b5hK9LtMiS6FYcCFl2J/W5IjPf5E4HPGpNeUw1ADY3n?=
 =?us-ascii?Q?CcNRp6kQIUKwFd0Ljd8q5a96WrJCH2VmOVw1KJ+rPDrrVLcM7m3nxRg5DePf?=
 =?us-ascii?Q?kGO9V2GvECQhSomeBm1X+2ALdlAAO/w8nmRpUjMp6mVsmmngPIvmILI9jq2U?=
 =?us-ascii?Q?A4O19IU6FQTmjSCFzwcs6hw0AQPmGOMQgoWW347qQKNiIglYlE8vzwG8LvIe?=
 =?us-ascii?Q?T08cC59mpalpmn79vUuweR2RmKJvf9/tABMI5gAkNtKiM+JevfnX3jdD0aEJ?=
 =?us-ascii?Q?fms6+Vn/oCuWgaU3Y5XeEA7lapEFyJneUNrlTS6u5MHhVnZ1p8H2/0uDyvxI?=
 =?us-ascii?Q?kA2iTsrzm3RC3dpOYibDCwoGtCtuMLaXrsWZxVz1XiZw/MjviD47NsxdKfAj?=
 =?us-ascii?Q?60pPDmzRj67C29GI/EE9TrPsGoNk67PEJvvT7c2yP39rjI7zJTpp1p2gUqnT?=
 =?us-ascii?Q?UXz1qw9h6Jf7UyCa5Gts5iDN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef1dcbf-1a71-4038-484d-08d90bd8082f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 13:01:12.6384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyHbKQ35so6psLvu9iKq4FHNGCoMuKdXi0makBRimzqJC/DI8jMohX9lQ/B4feRPddcg1UJcI/BJ/kdqx8n67A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4705
Received-SPF: pass client-ip=40.107.74.115;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Form a hex constant of the appropriate insnwidth.
> Begin using f-strings on changed lines.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/decodetree.py | 66 +++++++++++++++++++++++++------------------
>  1 file changed, 38 insertions(+), 28 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


