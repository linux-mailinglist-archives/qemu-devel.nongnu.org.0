Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560066E187
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnOl-0004Ou-Mc; Tue, 17 Jan 2023 09:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1pHnOi-0004Nq-As
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:57:13 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1pHnOd-0007uM-2z
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:57:10 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HBQK9d030127; Tue, 17 Jan 2023 06:56:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=0kHAEvBkMdmVfx6/9QSOYh/W0SV2xvXhdgEQp9cvZsM=;
 b=CsUCdzpqafvRcEHJdylbqToRR4bY+Npx3pdVTo268rO66jQ1kscRDk91RwzzfGkVp+rR
 3NMCukBgHlZRXfvGSI2IAehmt5fWQVHM59MjQvgUnHNYozac0EKPCdVwh19iqql82Lvf
 AbGQeI41gGzUjZFWQSaTmoDeqP4PLdMLXydRnbTEVOJh9zdAKiEOqLWJcjb0yBsjeMDQ
 dNBhkMdfEzVejT1LG+7BBRERqxyR2JomzJWfIMPp0CEEEdAAl2YNpjJqMaiHXtX4J8IY
 8Zwfw/12skL3KICDP5f12YhovMbB1xEjEPgrWqWT/4dgT8hJ8i34kJJhvMnLFT3mm6ay pw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3n3vbsycg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 06:56:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7KwGiMRmRny1TeB6Bq3Ta57HIFCpA9ObwLCTb+8imX5JJmL+tbeu/8xDDQX6wTo2zvSnw86PWAmurK2BXx0O6ImQw8H+7UMmz6V0DmOKIMfUt1ONB7/4b2Q9rbNaclS7vYtKSLOq3wULFhlrL/CnsCsSR/RL+Q7uuD7iYXOgL6YwcdhaI4roNN0NvcdlESigcC9tmxUBJebtR8fuWU3aHCVeE6739R2FLTWUgfk3kNzOCg+PeoyRNtr3JWLBbaY81aWJs3jm2zghi5R1XJxTlU4dU+f0N10nKz/ijy5A5U8OcUzmkzNzs3E0XkFPvIRYpfA2YYq5Rxgac+CTS64tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kHAEvBkMdmVfx6/9QSOYh/W0SV2xvXhdgEQp9cvZsM=;
 b=MKHT2gREFBk3Oyecy6zQCB71ls/RJYdWnZQIYmq+DIjJHHQb82loAkP1V/a9cw7+VwCw718IObRX97hMSI7wMG8Gmkp8HUlJ+r0Qs1ih3mDxIZizuJiO2BGzPEMEitsA0tXoMfKiMLHD1BsPLdoKFAsZQsZOz53+NpUpxIVtW7wgoxh6WebO4n6SWt/+sY4kFzaRGPue1YzBwm5BrD9WAwbSkd7aOc/XFD4vq/TW7+PpVUn37s9IUD4tZLKvUMX+xi47WolGaySu9yXGW5P2yFOdHO+o26jeEnBEw84jwYD1TmGVB5tJuTcE+A5nsvPH7zi1M17JbQsSMxhbzCsYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kHAEvBkMdmVfx6/9QSOYh/W0SV2xvXhdgEQp9cvZsM=;
 b=RLaOZpq8OvcsydmGlMA7QexHdaz00Ejm/p5U+7AGg7uGrUQeX2MpO6aNDmbHyStcN/vPsGwyuBWvpIh1cv5Qp6X6rx8rzyfa2Y/WnyUt2hm28d22UKU/mkBT8r+kFlhKeYkNian56l52EFV4MLaXcyrKJbCJ/TBWN4nNlFvx3xW4/+2SMiHO6jRA8Ez2h0VVxA8iljJH3LpuHTENB25+QKwqPMnTxtlyo5ZfkMkL0cbxIaIbwER//JegIJcK4cclpAzEQ1wFwj41F5aJQyi2irIFhqVG+9X0fSGj6eaDIRB78fFRvacyIbS9wdv8+0Ib+RVGgoC9RmwCmcVabJaQ+g==
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by CH2PR02MB6597.namprd02.prod.outlook.com (2603:10b6:610:7c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 14:56:50 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4573:97e2:a951:7f6e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4573:97e2:a951:7f6e%4]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 14:56:50 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Minghao Yuan <yuanmh12@chinatelecom.cn>
CC: Swapnil Ingle <swapnil.ingle@nutanix.com>, Peter Turschmid
 <peter.turschm@nutanix.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/1] vhost-user: Skip unnecessary duplicated
 VHOST_USER_ADD/REM_MEM_REG requests
Thread-Topic: [PATCH 1/1] vhost-user: Skip unnecessary duplicated
 VHOST_USER_ADD/REM_MEM_REG requests
Thread-Index: AQHZKaPn6TsJ+J/8NEyUrnTPfhEu366itJKA
Date: Tue, 17 Jan 2023 14:56:50 +0000
Message-ID: <1F225433-436A-41D3-AB33-6D5E21858B71@nutanix.com>
References: <20230101214557.193768-1-yuanmh12@chinatelecom.cn>
In-Reply-To: <20230101214557.193768-1-yuanmh12@chinatelecom.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|CH2PR02MB6597:EE_
x-ms-office365-filtering-correlation-id: 59a3016e-a0cb-45ff-71c2-08daf89b106c
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B3dFxl2pUNMUO2I7kOmrLZoZyQn+JnUuSCGlbMek67Q8h/QronojZJ43xkhtCcjCqLda+uLYAyuRQfav9u+JcCwVHKAqd6VHEuifNTAX2kA6gU36jgZ8vShXj27JRT5ThYEDc3QiF65yKOoUzRrrSfrm71cuOtUaVF++Gnrbttw2xI6PnkpB/9iGzoWVcVzYJUnfM9cPslcr1ToXsPLRwmM76A+pmP5CwCsmLiwTpoKcT1xR6F4gs+McXAzFOKSY9AjqB930akT9DenWmzY5pZPoQdPLsYUcUG8QIE75amYZzQjELgs5jX8oT7r8F3cD5i9z8Lbprq9RMqgBH8WM9G6Mmt3NZ3LMuPv7J9uoQmpAAfxiZI7lrRe9jXoKluo0zjXQprq40aaq0//VQBKuXzGTUbdEE2FfnKg3muCXDygVABHu6vaE15B/aYNp2an4D6w0V3l6G2BdVeVKmSU/2CQlNSozPdqwSw6me1BW5cnZGq3E0yuYL1PaDNC6o5+49SoYUcY5DLVkIOIXp/38KEZgwqhk/LkAqRJYc2h3d7YhZg9H1cigzxD8PZAb6RLOx5MbVOTOHEHsxj+E8VXXaZabxvF2pipjkTEQQMi3KlPoWRhCR39ZFh62V32mOFbTQgMZySY1HlK/XPVHiFCjdZ1++zVxwu1d/H7MS6vhobtJ0Ck/Fme47+8p1m/+PGFcu5dCC7s6Sgo2wXBWX/Ukmh7Y7RwvgOcVpApcE9ZdJirAy/Vxgju/+9DfXS1GYaVL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(36756003)(86362001)(38070700005)(8936002)(6916009)(66946007)(8676002)(44832011)(66476007)(66556008)(66446008)(76116006)(64756008)(5660300002)(2906002)(4326008)(83380400001)(122000001)(38100700002)(33656002)(478600001)(71200400001)(6486002)(316002)(54906003)(966005)(91956017)(41300700001)(6512007)(53546011)(2616005)(26005)(186003)(6506007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnVyWllObzMzRWQwT29DTFFXMXNQTmVXYjF0UmJBU3NPcnNMUU5CdW9Oanhl?=
 =?utf-8?B?ZEp1OEMyS0kveWRucU5hNFhoRE04RklVY3VTMHlKY3o4R0FwQThSODBGZHEz?=
 =?utf-8?B?SjkzWHB0aDZHb3lvNlFYWnFEN00yNStUMmh5MHY5MjIwVnExN0lpMWc4aUQy?=
 =?utf-8?B?YS9NMExEeHRVQlI5aU9CSUxsZ096dStUejM2Q2NpOURGVUVRM1d5V1lwUXBS?=
 =?utf-8?B?ZWhEL0FnNFBwRHdSNzhrcVYxb1gvV0ZhUno5eWNzRlFBMll2bHVPcjNoYXVy?=
 =?utf-8?B?T3A5c3VSakhpYXVOT3NNTUxVYjBMSm9HZG1vYUhxazI1MmJwRXFHMDZKbmM3?=
 =?utf-8?B?Q0h1RjNXTmUvTjlvTTlLeW5QSTBsQ0R5d25RM0ZVNTlpeGsxcVVvWDdzN1p0?=
 =?utf-8?B?YmRKQkZzQVVhb2NtZ2hCc2NROFUyWllrUGpCbXdsUlZmUnlabzRGNFV1S3BS?=
 =?utf-8?B?UWJEdFdQcTJIcVhxS2J4bHBDZU1scmdvUFpCNVRKV2NQaU8yek42aGVNSHNa?=
 =?utf-8?B?cXRYOVRMNHZFa29aaG9peFFaTE8vSlVHSG44aEY2TTdNemlTZlNQb2VIdmVv?=
 =?utf-8?B?YkpSR0JOZGp2SEM2MXdhN2ZVR0VMYXNhT1ltU05yaFZ0cnhlNks0VGM1SUs3?=
 =?utf-8?B?QS9rNW0yeUdBaG5DcUhTcjY2M1JCVEFTdjU3WTB2OWVTNzk3M1RpdytjWnBt?=
 =?utf-8?B?YWtrK3R3RFk0OVBUMjNmTWdNVHRoSEtDc1ROSDdjYm11aFVsckxzT0hDYzdE?=
 =?utf-8?B?MjVQUGZPY2p5THpPd3QwejQzQ2plcWJNODZpcGhIRTFLaFR6NVNzcUg3UGN3?=
 =?utf-8?B?ODJEcytsMjZYZ2haYnRJdTY1azYxaW9jVUFlQmZXV2N1QzdHd1pneVhKZGVK?=
 =?utf-8?B?RWM5YkY0eHNpZlhOTmpzUzN2MzU4cUpjUWY3Z3hQTUdmQVN0Yzdmalg5eFZS?=
 =?utf-8?B?QmtHQmE5YzZTczJDcHZpdE5zTkhBLzZoZmdkWXFsRHVCQVlha1A4b3NjRWIr?=
 =?utf-8?B?elpkQ2RvK3JLeTQwY2tUbnpzaDhUZ20zVWZxQlpGdVNrRkowRVdPdHlPRWJv?=
 =?utf-8?B?SFhJUVFpRUxiQXFIQ1VqNFk1ZndNT0lNZ1BoYVJqM0U1d1RVTmtHNGtDYy9G?=
 =?utf-8?B?NzJ0TGIrWUFIZUdnYTh4QXF3TnhUSUxSUktYUkxFNEorTXVVeGVKdzJRSWdi?=
 =?utf-8?B?dnE0R0VvdHpvYmFIbk8vM0RtVDZHSDhHcFBrWUpqRlpCSHlmcHJRQUJZRDh2?=
 =?utf-8?B?Z2NjSkN1TDlEbWFaZDVJRWhoeWVLVlBtRkdQU0IrWDMwem1MY2E2eUVqdE92?=
 =?utf-8?B?OWVvbnVUaDJ0MGZKQ3BLa1h5dU9aaDNBZkhka1gyTm5VdEVZbFlYK2p2ZVQw?=
 =?utf-8?B?UGUySUp4ajArMGthcHJUOVZEWkUzbnVCY3lmTVFxbUZIdTRwc280WXNKZlRh?=
 =?utf-8?B?K0oyRjRXMTIzUFJodHZhMGZiQjFHWXYzbndnNEFXd0NuaDg3MUgrdklCU0tU?=
 =?utf-8?B?U3hDU25LZU1KNkEzeW5mRXhXRDM2VUJCWkNwRzlIekRvWkREbjRmTTh1alNR?=
 =?utf-8?B?Qmljb1lGSlVBQVFDS3NxT21VV0tTcGhMaXJZanAwTXlYMlpsdnB0a2lwbkxV?=
 =?utf-8?B?Z09Ba3RWd0gwOUpDK1hqTGNVZkFTdXJtTGRQeS9hNks3cmlHS2JKQmdQNWdw?=
 =?utf-8?B?ei9hamo1RmhtSFpnZ0ZaOHQ3M3VzVUtCRWNxZlo3b3ZjWmp6RFB4UzJSb21w?=
 =?utf-8?B?WU5xTUkwdXZqV2daQlQ2aG9UY1B3VU8vL3Axd0JFTUxBS1FMVlA0MGtub0JM?=
 =?utf-8?B?Y3RleTVnb29qc09vNFF6M2dlblZKWDBad3pUeTh4U2NTMTZkYTR0d0dpZkpi?=
 =?utf-8?B?b1h2QTA5WjNCUnlhRU9QbzM1RFhGK2tQYnZVSzdxK0NPQ3JPMExvS2VVV2kx?=
 =?utf-8?B?a0hJcXR2TVhNTEx0RWpZTDVZRjVsR2dLL3ZRTml2RmNUVmZzRnVEcFRCOS9K?=
 =?utf-8?B?RFFORlNDOERnMlNGaXkwUm9jOHNIYTBjTEo2QmdxRDdaL2Nyc0crazBnQVVo?=
 =?utf-8?B?clhWalFoampOeUdjSnRFQms3WlBNcDJPSGwyMmt0NUZVaVh1bmQzZkJSSnNh?=
 =?utf-8?B?THMzb0ZadmcrVVRFdENEV1VOTnhDYzJEb0xzQXdBNWFTenpQSm9nWGg0bFFS?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04C4E8BB6FE2BE488DBFE91280A75680@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a3016e-a0cb-45ff-71c2-08daf89b106c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 14:56:50.4883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fW5fMqCtqQKT2wBarPjUVCqgioJEnz34XJkC6ZGv86NMYlRf8Bhh/paDEDWiSuaC4elbEMJoPb3au6+vTPc3RN8XaTqB27DdX4MI83JM0Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6597
X-Proofpoint-GUID: x6THHeehyR9hqti0NVeg1EetaMI0VmCw
X-Proofpoint-ORIG-GUID: x6THHeehyR9hqti0NVeg1EetaMI0VmCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_06,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SeKAmW0gY29uZnVzZWQgYnkgdGhpcyDigJxvbmUgdGltZSByZXF1ZXN04oCdIHBhdGguDQoNCk1T
VCAtIHdoeSBkbyB3ZSBjbGFzc2lmeSBTRVRfTUVNX1RBQkxFIGFzIGEgb25lIHRpbWUgcmVxdWVz
dCBpZiB3ZSBzZW5kIGl0IG9uIGV2ZXJ5IGhvdC1hZGQvaG90LXJlbW92ZS4NCg0KSW4gcGFydGlj
dWxhciBJ4oCZbSB0cmlwcGluZyBvdmVyIHRoZSBmb2xsb3dpbmcgaW4gdmhvc3RfdXNlcl93cml0
ZToNCg0KIC8qDQogKiBGb3Igbm9uLXZyaW5nIHNwZWNpZmljIHJlcXVlc3RzLCBsaWtlIFZIT1NU
X1VTRVJfU0VUX01FTV9UQUJMRSwNCiAqIHdlIGp1c3QgbmVlZCBzZW5kIGl0IG9uY2UgaW4gdGhl
IGZpcnN0IHRpbWUuIEZvciBsYXRlciBzdWNoDQogKiByZXF1ZXN0LCB3ZSBqdXN0IGlnbm9yZSBp
dC4NCiAqLw0KaWYgKHZob3N0X3VzZXJfb25lX3RpbWVfcmVxdWVzdChtc2ctPmhkci5yZXF1ZXN0
KSAmJiBkZXYtPnZxX2luZGV4ICE9IDApIHsNCiAgICBtc2ctPmhkci5mbGFncyAmPSB+VkhPU1Rf
VVNFUl9ORUVEX1JFUExZX01BU0s7DQogICAgcmV0dXJuIDA7DQp9DQoNCldpdGggdGhlIGhvdC1h
ZGQgY2FzZSBpbiBtaW5kLCB0aGlzIGNvbW1lbnQgc291bmRzIG9mZi4gSUlVQyBob3QtYWRkIHdv
cmtzIGZvciB2aG9zdC11c2VyLWJsayBhbmQgdmhvc3QtdXNlci1zY3NpIGJlY2F1c2UgZGV2LT52
cV9pbmRleCBpcyBzZXQgdG8gMCBhbmQgbmV2ZXIgY2hhbmdlZC4NCg0KUmVmOiBodHRwczovL2dp
dC5xZW11Lm9yZy8/cD1xZW11LmdpdDthPWJsb2I7Zj1ody9zY3NpL3Zob3N0LXVzZXItc2NzaS5j
O2g9YjdhNzFhODAyY2RiZjc0MzA3MDRmODNmYzhjNmMwNGMxMzU2NDRiNztoYj1IRUFEI2wxMjEN
Cg0KQnJlYWtwb2ludCAxLCB2aG9zdF91c2VyX3NldF9tZW1fdGFibGUgKGRldj0weC4uLCBtZW09
MHguLikgYXQgLi4vaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KKGdkYikgd2hlcmUNCiMwICB2aG9z
dF91c2VyX3NldF9tZW1fdGFibGUgKGRldj0weC4uLiwgbWVtPTB4Li4uKSBhdCAuLi5ody92aXJ0
aW8vdmhvc3QtdXNlci5jDQojMSAgMHjigKYgaW4gdmhvc3RfY29tbWl0IChsaXN0ZW5lcj0weC4u
KSBhdCAuLi4vaHcvdmlydGlvL3Zob3N0LmMNCiMyICAweOKApiBpbiBtZW1vcnlfcmVnaW9uX3Ry
YW5zYWN0aW9uX2NvbW1pdCAoKSBhdCAuLi5tZW1vcnkuYw0KLi4uDQooZ2RiKSBwIGRldi0+bnZx
cyANCiQ0ID0gMTANCihnZGIpIHAgZGV2LT52cV9pbmRleA0KJDMgPSAwDQooZ2RiKQ0KDQpMb29r
cyBsaWtlIHRoaXMgZnVuY3Rpb25hbGl0eSBjYW1lIGluIGhlcmU6DQoNCmNvbW1pdCBiOTMxYmZi
ZjA0Mjk4M2YzMTFiM2IwOTg5NGQ4MDMwYjI3NTVhNjM4DQpBdXRob3I6IENoYW5nY2h1biBPdXlh
bmcgPGNoYW5nY2h1bi5vdXlhbmdAaW50ZWwuY29tPg0KRGF0ZTogICBXZWQgU2VwIDIzIDEyOjIw
OjAwIDIwMTUgKzA4MDANCg0KICAgIHZob3N0LXVzZXI6IGFkZCBtdWx0aXBsZSBxdWV1ZSBzdXBw
b3J0DQogICAgDQogICAgVGhpcyBwYXRjaCBpcyBpbml0aWFsbHkgYmFzZWQgYSBwYXRjaCBmcm9t
IE5pa29sYXkgTmlrb2xhZXYuDQogICAgDQogICAgVGhpcyBwYXRjaCBhZGRzIHZob3N0LXVzZXIg
bXVsdGlwbGUgcXVldWUgc3VwcG9ydCwgYnkgY3JlYXRpbmcgYSBuYw0KICAgIGFuZCB2aG9zdF9u
ZXQgcGFpciBmb3IgZWFjaCBxdWV1ZS4NCiAgICANCi4uLg0KICAgIA0KICAgIEluIG9sZGVyIHZl
cnNpb24sIGl0IHdhcyByZXBvcnRlZCB0aGF0IHNvbWUgbWVzc2FnZXMgYXJlIHNlbnQgbW9yZSB0
aW1lcw0KICAgIHRoYW4gbmVjZXNzYXJ5LiBIZXJlIHdlIGNhbWUgYW4gYWdyZWVtZW50IHdpdGgg
TWljaGFlbCB0aGF0IHdlIGNvdWxkDQogICAgY2F0ZWdvcml6ZSB2aG9zdCB1c2VyIG1lc3NhZ2Vz
IHRvIDIgdHlwZXM6IG5vbi12cmluZyBzcGVjaWZpYyBtZXNzYWdlcywNCiAgICB3aGljaCBzaG91
bGQgYmUgc2VudCBvbmx5IG9uY2UsIGFuZCB2cmluZyBzcGVjaWZpYyBtZXNzYWdlcywgd2hpY2gg
c2hvdWxkDQogICAgYmUgc2VudCBwZXIgcXVldWUuDQogICAgDQogICAgSGVyZSBJIGludHJvZHVj
ZWQgYSBoZWxwZXIgZnVuY3Rpb24gdmhvc3RfdXNlcl9vbmVfdGltZV9yZXF1ZXN0KCksIHdoaWNo
DQogICAgbGlzdHMgZm9sbG93aW5nIG1lc3NhZ2VzIGFzIG5vbi12cmluZyBzcGVjaWZpYyBtZXNz
YWdlczoNCiAgICANCiAgICAgICAgICAgIFZIT1NUX1VTRVJfU0VUX09XTkVSDQogICAgICAgICAg
ICBWSE9TVF9VU0VSX1JFU0VUX0RFVklDRQ0KICAgICAgICAgICAgVkhPU1RfVVNFUl9TRVRfTUVN
X1RBQkxFDQogICAgICAgICAgICBWSE9TVF9VU0VSX0dFVF9RVUVVRV9OVU0NCiAgICANCiAgICBG
b3IgYWJvdmUgbWVzc2FnZXMsIHdlIHNpbXBseSBpZ25vcmUgdGhlbSB3aGVuIHRoZXkgYXJlIG5v
dCBzZW50IHRoZSBmaXJzdA0KICAgIHRpbWUuDQoNCldpdGggaG90LWFkZCBpbiBtaW5kLCBzaG91
bGQgd2UgcmV2aXNpdCB0aGUgbm9uLXZyaW5nIHNwZWNpZmljIG1lc3NhZ2VzIGFuZCBwb3NzaWJs
eSBjbGVhbiB0aGUgY29kZSB1cD8NCg0KDQo+IE9uIEphbiAxLCAyMDIzLCBhdCAxMTo0NSBQTSwg
TWluZ2hhbyBZdWFuIDx5dWFubWgxMkBjaGluYXRlbGVjb20uY24+IHdyb3RlOg0KPiANCj4gVGhl
IFZIT1NUX1VTRVJfQUREL1JFTV9NRU1fUkVHIHJlcXVlc3RzIHNob3VsZCBiZSBjYXRlZ29yaXpl
ZCBpbnRvDQo+IG5vbi12cmluZyBzcGVjaWZpYyBtZXNzYWdlcywgYW5kIHNob3VsZCBiZSBzZW50
IG9ubHkgb25jZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pbmdoYW8gWXVhbiA8eXVhbm1oMTJA
Y2hpbmF0ZWxlY29tLmNuPg0KPiAtLS0NCj4gY29uZmlndXJlICAgICAgICAgICAgICB8IDIgKy0N
Cj4gaHcvdmlydGlvL3Zob3N0LXVzZXIuYyB8IDIgKysNCj4gMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9jb25maWd1cmUg
Yi9jb25maWd1cmUNCj4gaW5kZXggOWU0MDdjZTJlMy4uOGI0ZGVjYTM0MiAxMDA3NTUNCg0KVGhp
cyBjb25maWd1cmUgY2hhbmdlIGxvb2tzIGlycmVsZXZhbnQuIERpZCB5b3UgbWVhbiB0byBzZW5k
IGl0Pw0KDQo+IC0tLSBhL2NvbmZpZ3VyZQ0KPiArKysgYi9jb25maWd1cmUNCj4gQEAgLTExNDcs
NyArMTE0Nyw3IEBAIGNhdCA+ICRUTVBDIDw8IEVPRg0KPiAjICBlbmRpZg0KPiAjIGVuZGlmDQo+
ICNlbGlmIGRlZmluZWQoX19HTlVDX18pICYmIGRlZmluZWQoX19HTlVDX01JTk9SX18pDQo+IC0j
IGlmIF9fR05VQ19fIDwgNyB8fCAoX19HTlVDX18gPT0gNyAmJiBfX0dOVUNfTUlOT1JfXyA8IDQp
DQo+ICsjIGlmIF9fR05VQ19fIDwgNyB8fCAoX19HTlVDX18gPT0gNyAmJiBfX0dOVUNfTUlOT1Jf
XyA8IDMpDQo+ICMgIGVycm9yIFlvdSBuZWVkIGF0IGxlYXN0IEdDQyB2Ny40LjAgdG8gY29tcGls
ZSBRRU1VDQo+ICMgZW5kaWYNCj4gI2Vsc2UNCj4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aG9z
dC11c2VyLmMgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jDQo+IGluZGV4IGQ5Y2UwNTAxYjIuLjNm
MmE4YzNiZGQgMTAwNjQ0DQo+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gKysrIGIv
aHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPiBAQCAtNDU5LDYgKzQ1OSw4IEBAIHN0YXRpYyBib29s
IHZob3N0X3VzZXJfb25lX3RpbWVfcmVxdWVzdChWaG9zdFVzZXJSZXF1ZXN0IHJlcXVlc3QpDQo+
ICAgICBjYXNlIFZIT1NUX1VTRVJfU0VUX01FTV9UQUJMRToNCj4gICAgIGNhc2UgVkhPU1RfVVNF
Ul9HRVRfUVVFVUVfTlVNOg0KPiAgICAgY2FzZSBWSE9TVF9VU0VSX05FVF9TRVRfTVRVOg0KPiAr
ICAgIGNhc2UgVkhPU1RfVVNFUl9BRERfTUVNX1JFRzoNCj4gKyAgICBjYXNlIFZIT1NUX1VTRVJf
UkVNX01FTV9SRUc6DQo+ICAgICAgICAgcmV0dXJuIHRydWU7DQo+ICAgICBkZWZhdWx0Og0KPiAg
ICAgICAgIHJldHVybiBmYWxzZTsNCj4gLS0gDQo+IDIuMjcuMA0KPiANCj4gDQoNCg==

