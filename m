Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001873E5C6E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:00:30 +0200 (CEST)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSIv-0002NK-LG
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Samer.El-Haj-Mahmoud@arm.com>)
 id 1mDRXQ-000421-4u; Tue, 10 Aug 2021 09:11:24 -0400
Received: from mail-vi1eur05on2060.outbound.protection.outlook.com
 ([40.107.21.60]:11201 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Samer.El-Haj-Mahmoud@arm.com>)
 id 1mDRXM-0003eW-57; Tue, 10 Aug 2021 09:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MklDgg083oQp5FPvpVAOT3/UzxlSu0xbVXrd7Xo0xuE=;
 b=6UBnfqPLDRSaO8fnXnHxAQGUboY6bJeG2ioz10vx5XzV1aFvskZxbVSBOUnNu5RTUgHY2ZW6GCb5rJiE+epAmu/o+mKqv8PROPl1zkvL3Vbha7naJFNPI/9e11lCtOgmJLJVJcXYrJOdodnRhS8U0sTJIOtHmSMc3plmlp9AIp8=
Received: from AM6P194CA0082.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::23)
 by AM6PR08MB4914.eurprd08.prod.outlook.com (2603:10a6:20b:cf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Tue, 10 Aug
 2021 13:11:10 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::d2) by AM6P194CA0082.outlook.office365.com
 (2603:10a6:209:8f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Tue, 10 Aug 2021 13:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; nongnu.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;nongnu.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 13:11:09 +0000
Received: ("Tessian outbound 077ab11054bf:v101");
 Tue, 10 Aug 2021 13:11:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca368ed802d66a86
X-CR-MTA-TID: 64aa7808
Received: from 7a276c90a89f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4BA32DA6-31C4-4ED9-87F0-1FD5594EF35F.1; 
 Tue, 10 Aug 2021 13:10:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a276c90a89f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Aug 2021 13:10:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDFlA+d7ZX5phB7DnojECf8eemdj7/6Yqn3+Ou6e94PQe1HifLgJMRcrubOjVmtWqRxAUNB+VK87b1tmnzbf+Ku2qdqVnzaqh4hrb+nc0kct/l9/9ardxyJ1az6U5TmNQOwX0iBxvYy80wvgh/mohmKPJMoRwZYTOkRi7ZQ3t9u3Pvvnq33uSjrhExTenItLwD8NHr7/l2nvgOV0HlmUJTHqFk25ZNwdgcl5zEtVwJfO4VYFZGz3JjPlamUzlY5yTae8G3ZgC9SR/OwKaob6PKw3vo7Lsd57GntxVJ5i07OQkCIiugm/ExANedYp3CcDlZTQcYtinSEKavqePxN7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MklDgg083oQp5FPvpVAOT3/UzxlSu0xbVXrd7Xo0xuE=;
 b=DXOJAAYDJ1KUfCpl6xOyFG6tOX7e0vv0k16d4+z0DjKg093q6VHdLbq3yMNblbA+nhw9Kvv2rbe4pPZkBwI7q56KiUOuwcs1U4WMnl9NIdWm3UIP5XwxyNPaC+Pb9RpW9PJxwziXYvTn+HjJvXOs8IWPgKlorUPne/STetsgrwRCiU92+AxnsgYezU29+2cXSFSbVPwJX45VC6/jYV+hbn8Vrd0S8euvR/uPIN74Ks72F5f6Icg08xD5TP7iYql+LHaDi/j6eAHZVtHvO5KBfZVQ4EzaeEsMLzqNdDF5XXASYAP22G8KD0WVGvr3Z83mjjVTNV6Z/aB1Hp36UBDq7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MklDgg083oQp5FPvpVAOT3/UzxlSu0xbVXrd7Xo0xuE=;
 b=6UBnfqPLDRSaO8fnXnHxAQGUboY6bJeG2ioz10vx5XzV1aFvskZxbVSBOUnNu5RTUgHY2ZW6GCb5rJiE+epAmu/o+mKqv8PROPl1zkvL3Vbha7naJFNPI/9e11lCtOgmJLJVJcXYrJOdodnRhS8U0sTJIOtHmSMc3plmlp9AIp8=
Received: from PAXPR08MB6987.eurprd08.prod.outlook.com (2603:10a6:102:1df::15)
 by PR3PR08MB5788.eurprd08.prod.outlook.com (2603:10a6:102:8b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 13:10:55 +0000
Received: from PAXPR08MB6987.eurprd08.prod.outlook.com
 ([fe80::8888:874d:364:7237]) by PAXPR08MB6987.eurprd08.prod.outlook.com
 ([fe80::8888:874d:364:7237%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 13:10:55 +0000
From: Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, Ard Biesheuvel
 <ardb@kernel.org>
Subject: RE: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
Thread-Topic: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
Thread-Index: AQHXjctCcfmJtUVK3ECIae4odlr21atsiGSAgAAsFzA=
Date: Tue, 10 Aug 2021 13:10:54 +0000
Message-ID: <PAXPR08MB6987EDE1A3331050FC312AC490F79@PAXPR08MB6987.eurprd08.prod.outlook.com>
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
 <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
In-Reply-To: <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3424d5ef-536f-4a05-4a50-08d95c0051d8
x-ms-traffictypediagnostic: PR3PR08MB5788:|AM6PR08MB4914:
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4914F5C7B1427D6BA2DD174390F79@AM6PR08MB4914.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qzghc2/45oscOb7mN07RNqFiS2K2dFfrJ5pFm58TdMjRAAlfO77yT0OKQdYERsACHScbbSaQARvfXLeiMVswDvW7HC2YDjR4UczhTfl7dOZw6O1Ca6Y+4YQAQv9h/KyAPwv3/Sp4/kvF5v88UCNgDEOFBHPFeEIJoDoZAQ7P5UIasYZazw13AigfRko6/s6cDoVg841qcLKzCEuTPIqDqDmSi2cGNW72W6Xr4noYu4H6Xt1OQg4CVBRf7jPp4m6z3/FRgLuB8gup/jtXtdwXGgMOD/FdhrM2vJNh+kYI4L4qo3efc7u2HX4j3j9x1h+sXp+AU8WNZOd1WjpGK2Judw/cHhZ6sFNUdkAnMT4dDz/1EvEXOsVfgQex49uoUOEKLZ4+qFGuCUHx88Rr6QYg7ZVixuVt2jHM7U/jCoBUJFDb2ZZ1nIsOyFsgeAA3mVejCauhL+aoqBsnsEyC9xBcDlqSCoQV2fC5ibojzvniDNBReWY7ogr7bhTw/WngVAgA2iTwGZM8cIB9/rC7YJnlETcprHLIIHz7JQyoMcbLGMY4UErDjpeU0+sy4qyUx3g1MYCyPUFR5ezesbrmWVSN7UHUkyJBKF1f6QffbfZEZUmlIbBX6CWcobJkuJYwrzNfSZzzpB2d+SSRCEgVhkW4+97IqLsjLtFKMWG8GFYHU5BCC8p6BN6ObAGMKIx9JPdtNqit73pSg7LpamKuJFMyzLOqeBcmAl/OXKw6+9zv2CZEq7JyulPPGJNtEfU2965tO4KQzCF5CRDqRjkw7UVaQbiTo9DA9CNm/f4T/5ei+jLDrWqUzsKEhcojTRqDMDJThy1b4smzdA9lTzJYsxxUyQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR08MB6987.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39850400004)(38100700002)(122000001)(7696005)(33656002)(110136005)(186003)(53546011)(9686003)(316002)(6506007)(55016002)(54906003)(52536014)(83380400001)(8936002)(4326008)(5660300002)(76116006)(66946007)(478600001)(66476007)(66556008)(64756008)(66446008)(966005)(38070700005)(7416002)(71200400001)(86362001)(2906002)(26005)(45080400002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXBJaUdJZjBLKzJlVjFOQU13NnJOTm5NaFljUi9tTFJScUY1bUl2R0o1VS80?=
 =?utf-8?B?K0cwTkRaTGMvb1NYclpmWjRIUS9XRzVac2k5dER5NnRCZVZNeS9hbmpRZjhv?=
 =?utf-8?B?RDhFNk9sYWdrNU9yRUl5VzErVzAxRDRLd2RWbStyM1dpQWlaNDRoUkc2ZUhN?=
 =?utf-8?B?KzM0TkFFcmhVUTJ2ZFJZMGJ1NHFNekUvSTgvczlLVTdqM3Jodm1Bb3haOG9H?=
 =?utf-8?B?STMzMWxZN2t6SVFScGdPeGI2ZW9KUEpvOHI4cFNzTElYYWVPenM2VGFlZ0Vt?=
 =?utf-8?B?UEQ2eFppeWl5aSttYnRUTjBoV1VhTGh6WCtBUXFUQUlwa1h2QkpxekVxc2pa?=
 =?utf-8?B?VFBEc0ZJWmdzSUhoVkwzNEE0UkFvbzNXczl4SFZmY1pNeGlheVZDVC9tMkJB?=
 =?utf-8?B?VlQrRk9qTlFBMDdSLzhnMzdjNlU5T1NlMnEyOW0wRkROcEFsU20xV3Z2M3lN?=
 =?utf-8?B?Y00vYzhRV2s0NlU0Ymd4T3AyZGU0eU9kejczY095blJnaW5KTlVvWHd6bzhZ?=
 =?utf-8?B?Zndhekc5Y1M3QXJrRGF0NjQ0SnFILy9UTTVGTFJMZEVLbjhVSkpZSlgxSzd5?=
 =?utf-8?B?cTc5U0tUVFRFUCtybjh6TUdrU3JxSnlzSjQ3WXFSL1Jpb3NjRkRuQzZiK3JO?=
 =?utf-8?B?YjR3dDg5TVBkaWZobHRPRWc5NW04VFI5enpMUU95aXlRYzJwZEZNS2JQM3pE?=
 =?utf-8?B?SVpnUThhMlZyUUVSZ3RDQkduNm84TGtVSTRTeHcxNGNOQW9vZExnTGNiRWN0?=
 =?utf-8?B?M2ZWKzlKZ1RXR2daWFVqazVLZndYQ2IxeXBOMGlEQUh3NFNqenNucUtYVzFJ?=
 =?utf-8?B?ZDRONVc5MC9ZemhjRzduQXhGYnVWaERGZ0tBMXdpNmdOeWMyWDFLNDh1YTl6?=
 =?utf-8?B?YWsyN09vSW12ZHZBbnFBT2VHOWFia0pIQXI2NTQxcUR4ak9vKzVkdWRORmdI?=
 =?utf-8?B?U1pYNDFlVnBXMEoxTlJNM096bU4wVUxBUklNTGlaNnFQclJLZ1FRVVZDcVEy?=
 =?utf-8?B?T2xoL2VqNVk4dFM1THNBUHkrcnB1ays4S3d2NDlkWFZtR2IzRXREcUdtb3RB?=
 =?utf-8?B?MVpON0Q2c05tNmNMcUR6cThTM1FQWGtnQ2I5SW9Ydk84aGNZdkRWbzhHa25K?=
 =?utf-8?B?cUZ1ajUyZFFqRmFWalliUTNkcEpaNXFKSnA0aS9ubnFLUDVDRUJHNEo1clF6?=
 =?utf-8?B?akQybXdselJ0YXh0bzlWZFJtNVNUZ01hZ1Z4Y1RoYlVXdTFNcHZkSUR3Szd6?=
 =?utf-8?B?OFRCeVluVkN4eEJhMWtwTldjYk9GWTdSa3pUSXB4QWQ2Y0laQWdGUzltU3Mr?=
 =?utf-8?B?L1U4Z3NVcHFQeGVrWldiaGxDWHVacFNhbEhhQ291TmlaUWM3MkVJYTdaWmhF?=
 =?utf-8?B?K2tTUCttUG5rZ3p4VHVJMVpOTTRkZ0t5OEg0UUdwd1RYZzFhQ3Bob0kxTXRV?=
 =?utf-8?B?WFdodzc4SjFvMDdZU05ZYmFwbGFSZWFZQzdGbzg4VWJjS0x0TThRcnVwTFJa?=
 =?utf-8?B?c1FlbU16RUpWK1Z5bEJUekh5TFRvSUVITC8vWWM5dm9lbzNCbkxVNFBiS21X?=
 =?utf-8?B?S1UvUE5FNnFrUTI5WjRjczdjR2hFakdCN005bzVob0dDMmFTenJxQytEMUtl?=
 =?utf-8?B?emJETnlqSkZKcHF3RDh0Yk85dFNWUDJJdktzTDhqamZ0a3Z5SjYxRE95aElP?=
 =?utf-8?B?Y2o2OUlaWkQ3UWpTd1hWdGFsWnFDWXdybUdrS0d4VkdEM0VUbmhoM2Nzcldy?=
 =?utf-8?Q?/ewluWWfuSYXn9sKROeI2C1/ud1aO8Tn7pM/dVA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5788
Original-Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 10130b7b-5ee2-4cf5-6077-08d95c004962
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hR7mGLSbX+1p3I/JFdNveKWnNchJePofrptS7ZGramPlGcZKpeHF7Y25azMHCUoXupRrgt3u498OezU1zK+Dj1nhbQHQa+xgH2JzJNYpcnWH/zoN0kEgPd6H3H01g15HPoPGArYCNxPDg55IV2PJ3te+Z4CzeQKPPkVxRNLcomm2qsx3Uu0MyFLT9LeTwxVbmW2P7ZGkFODKepmCjmsAORCNh5+ihONzdJ9dkbjI7XYnyATnoA71sDpqGyvt8kpdtf/nV2Q80oH2BCd5UY2QihYDFkHQ8GrCKfON3Q+FE5xJYNP3FXQLaKp2IkGkdRYMAt3pz+GebPVfeokeWWV7tCwCx4bA0h+gQOu/w/+mdfcyygoWZIuyC0x1rop5x6tkZpi7NvYwKBmn++q23rqjj0n9n4OYaOYd39rsD6U49tz3vfBarhZ0dL9oIT45HL7CQB23NsFR+DCtPpecw9vLyIB8nG92FanVAO8ONuC8Niz3f7x4AzTODDqmG1+01UDAUEzFY0Ijnv96HW+D+WzlqufOOak4DpGPInDwoW4sYjuet1ykAJTG5O8SDg6wUK5WpWMGsmmzp9V/7IhvANdDRXtSv4uUOOo00qLSzXHPmPX8zQXsuaqYw1LAMfiqp7Qg9bufDVO2xlRePIkolY3k6WTO9beFSffUW2bje5BnP8REumgL45woRMQZhELTi2wG96rC46bfDIZAdrU5wX4Rq+tuhpYpUYUg4dYYXvULRsygeYssw9h1N6vQGacmdx9n37f3BF4+x+UOn6uoPehzpOFmDqDDQglM/EiWuCUExFRrGb5Jel9qM14sc/dezDkbNnuZvDFSvBI57u6YA753BQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(186003)(2906002)(7696005)(52536014)(70586007)(4326008)(6506007)(53546011)(70206006)(450100002)(26005)(110136005)(54906003)(5660300002)(30864003)(83380400001)(508600001)(356005)(316002)(82310400003)(45080400002)(8936002)(81166007)(86362001)(47076005)(36860700001)(9686003)(55016002)(336012)(966005)(8676002)(33656002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 13:11:09.1500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3424d5ef-536f-4a05-4a50-08d95c0051d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4914
Received-SPF: pass client-ip=40.107.21.60;
 envelope-from=Samer.El-Haj-Mahmoud@arm.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Aug 2021 09:57:32 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, "jcm@redhat.com" <jcm@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Al Stone <ahs3@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBBdWdlciA8ZXJp
Yy5hdWdlckByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMTAsIDIwMjEgNjoy
NSBBTQ0KPiBUbzogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4NCj4gQ2M6IGVyaWMu
YXVnZXIucHJvQGdtYWlsLmNvbTsgTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47
IElnb3INCj4gTWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+OyBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqQ0KPiA8cGhpbG1kQHJlZGhhdC5jb20+OyBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+OyBTaGFubm9uDQo+IFpoYW8gPHNoYW5ub24uemhhb3NsQGdtYWlsLmNv
bT47IHFlbXUtYXJtIDxxZW11LWFybUBub25nbnUub3JnPjsNCj4gcWVtdS1kZXZlbEBub25nbnUu
b3JnOyBBbmRyZXcgSm9uZXMgPGRyam9uZXNAcmVkaGF0LmNvbT47DQo+IGdzaGFuQHJlZGhhdC5j
b207IFNhbWVyIEVsLUhhai1NYWhtb3VkIDxTYW1lci5FbC1IYWotDQo+IE1haG1vdWRAYXJtLmNv
bT47IEFsIFN0b25lIDxhaHMzQHJlZGhhdC5jb20+OyBqY21AcmVkaGF0LmNvbQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIGZvci02LjJdIGh3L2FybS92aXJ0X2FjcGlfYnVpbGQ6IEdlbmVyYXRlIERC
RzIgdGFibGUNCj4NCj4gSGVsbG8gQXJkLA0KPiBPbiA4LzEwLzIxIDExOjM2IEFNLCBBcmQgQmll
c2hldXZlbCB3cm90ZToNCj4gPiBPbiBUdWUsIDEwIEF1ZyAyMDIxIGF0IDEwOjMxLCBFcmljIEF1
Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+PiBBUk0gU0JCUiBzcGVjaWZp
Y2F0aW9uIG1hbmRhdGVzIERCRzIgdGFibGUgKERlYnVnIFBvcnQgVGFibGUgMikuDQo+ID4+IHRo
aXMgbGF0dGVyIGFsbG93cyB0byBkZXNjcmliZSBvbmUgb3IgbW9yZSBkZWJ1ZyBwb3J0cy4NCj4g
Pj4NCj4gPj4gR2VuZXJhdGUgYW4gREJHMiB0YWJsZSBmZWF0dXJpbmcgYSBzaW5nbGUgZGVidWcg
cG9ydCwgdGhlIFBMMDExLg0KPiA+Pg0KPiA+PiBUaGUgREJHMiBzcGVjaWZpY2F0aW9uIGNhbiBi
ZSBmb3VuZCBhdDoNCj4gPj4gaHR0cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMvd2luZG93
cy1oYXJkd2FyZS9kcml2ZXJzL2JyaW5ndXAvYWNwaS0NCj4gZGVidWctcG9ydC10YWJsZT9yZWRp
cmVjdGVkZnJvbT1NU0RODQo+ID4+DQo+ID4gSGF2ZSB0aGUgbGVnYWwgaXNzdWVzIGFyb3VuZCB0
aGlzIHRhYmxlIGJlZW4gcmVzb2x2ZWQgaW4gdGhlIG1lYW4NCj4gPiB0aW1lPw0KPiBJIGRvbid0
IGtub3cgZXhhY3RseSB3aGF0IHRoZXkgYXJlLiBBZGRpbmcgQWwgYW5kIEpvbiBpbiB0aGUgbG9v
cCB0aGV5DQo+IGhhdmUgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGlzLg0KPiBIb3cgZGlkIHlv
dSByZXNvbHZlIHRoZSBpc3N1ZSBmb3IgRURLMg0KPiAoRHluYW1pY1RhYmxlc1BrZy9MaWJyYXJ5
L0FjcGkvQXJtL0FjcGlEYmcyTGliQXJtL0RiZzJHZW5lcmF0b3IuYyk/DQo+ID4gIEFsc28sIGFu
eSBjbHVlIHdoeSB0aGlzIHRhYmxlIGlzIG1hbmRhdG9yeSB0byBiZWdpbiB3aXRoPyBUaGUNCj4g
PiBTQkJSIGhhcyBiZWVuIHZlcnkgdHJpZ2dlciBoYXBweSBsYXRlbHkgd2l0aCBtYWtpbmcgdGhp
bmdzIG1hbmRhdG9yeQ0KPiA+IHRoYXQgYXJlbid0IHRydWx5IHJlcXVpcmVkIGZyb20gYSBmdW5j
dGlvbmFsIHBlcnNwZWN0aXZlLg0KPiBJdCBzZWVtcyB0aGVyZSBhcmUga2VybmVsIEZXIHRlc3Qg
c3VpdGVzIHRoYXQgY2hlY2sgYWxsIG1hbmRhdGVkIHRhYmxlcw0KPiBhcmUgYXZhaWxhYmxlIGFu
ZCB0aGV5IGN1cnJlbnRseSBmYWlsIGZvciBBUk0gdmlydC4NCj4gSW5kZWVkIGZyb20gYSBmdW5j
dGlvbiBwb3YsIEkgZG9uJ3Qga25vdyBtdWNoIGFib3V0IGl0cyB1c2FnZSBvbiBBUk0uDQo+DQo+
IE1heWJlIHRoZSBTQkJSIHNwZWMgc2hvdWxkIG5vdCBmbGFnIHRoZSBEQkcyIGFzIG1hbmRhdG9y
eSBhbmQgdGVzdA0KPiBzdWl0ZXMgc2hhbGwgYmUgdXBkYXRlZC4gSSB0aGluayB0aGlzIHNob3Vs
ZCBiZSBjbGFyaWZpZWQgYXQgQVJNIHRoZW4sDQo+IGFsbCB0aGUgbW9yZSBzbyBpZiB0aGVyZSBh
cmUgbGVnYWwgaXNzdWVzIGFzIGl0cyBzcGVjIGlzIG93bmVkIGJ5IE1pY3Jvc29mdD8NCj4NCg0K
REJHMiBoYXMgYmVlbiByZXF1aXJlZCBpbiBTQkJSIHNpbmNlIFNCQlIgdmVyIDEuMCAocHVibGlz
aGVkIDIwMTYsIHdpdGggdGhlIDAuOSBkcmFmdCBzaW5jZSAyMDE0KQ0KaHR0cHM6Ly9kZXZlbG9w
ZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2RlbjAwNDQvYi8/bGFuZz1lbg0KDQpTQkJSIHJlcXVp
cmVzIERCRzIgYmVjYXVzZSBXaW5kb3dzIHJlcXVpcmVzIGl0IG9uIGFsbCBzeXN0ZW1zOiBodHRw
czovL2RvY3MubWljcm9zb2Z0LmNvbS9lbi11cy93aW5kb3dzLWhhcmR3YXJlL2RyaXZlcnMvYnJp
bmd1cC9hY3BpLXN5c3RlbS1kZXNjcmlwdGlvbi10YWJsZXMjZGVidWctcG9ydC10YWJsZS0yLWRi
ZzIgLCBhbmQgV2luZG93cyBpcyBvbmUgb2YgdGhlIGtleSBPU2VzIHRhcmdldGVkIGJ5IFNCQlIu
DQoNClRoZSBEQkcyIChhbmQgU1BDUikgc3BlYyBsaWNlbnNlIGlzc3VlIGhhcyBiZWVuIHJlc29s
dmVkIHNpbmNlIEF1Z3VzdCAyMDE1LiBNaWNyb3NvZnQgdXBkYXRlZCBib3RoIHNwZWNzIHdpdGgg
aWRlbnRpY2FsIGxpY2Vuc2UgbGFuZ3VhZ2UsIGdpdmluZyBwYXRlbnQgcmlnaHRzIGZvciBpbXBs
ZW1lbnRhdGlvbnMgdW5kZXIgdGhlIE1pY3Jvc29mdCBDb21tdW5pdHkgUHJvbWlzZSwgYW5kIHRo
ZSBPcGVuIE9XRiAxLjAuIFRoaXMgRm91bmRhdGlvbi4NCg0KREJHMjogaHR0cHM6Ly9kb2NzLm1p
Y3Jvc29mdC5jb20vZW4tdXMvd2luZG93cy1oYXJkd2FyZS9kcml2ZXJzL2JyaW5ndXAvYWNwaS1k
ZWJ1Zy1wb3J0LXRhYmxlDQpTUENSOiBodHRwczovL2RvY3MubWljcm9zb2Z0LmNvbS9lbi11cy93
aW5kb3dzLWhhcmR3YXJlL2RyaXZlcnMvc2VycG9ydHMvc2VyaWFsLXBvcnQtY29uc29sZS1yZWRp
cmVjdGlvbi10YWJsZQ0KDQoNCg0KPiBUaGFua3MNCj4NCj4gRXJpYw0KPiA+DQo+ID4NCj4gPj4g
U2lnbmVkLW9mZi1ieTogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPiA+Pg0K
PiA+PiAtLS0NCj4gPj4NCj4gPj4gVGVzdGVkIGJ5IGNvbXBhcmluZyB0aGUgY29udGVudCB3aXRo
IHRoZSB0YWJsZSBnZW5lcmF0ZWQNCj4gPj4gYnkgRURLMiBhbG9uZyB3aXRoIHRoZSBTQlNBLVJF
RiBtYWNoaW5lIChjb2RlIGdlbmVyYXRlZCBieQ0KPiA+PiBEeW5hbWljVGFibGVzUGtnL0xpYnJh
cnkvQWNwaS9Bcm0vQWNwaURiZzJMaWJBcm0vRGJnMkdlbmVyYXRvci5jKS4NCj4gPj4NCj4gPj4g
SSByZXVzZWQgdGhlIEdlbmVyaWMgQWRkcmVzcyBTdHJ1Y3R1cmUgZmlsbGVkIGJ5IFFFTVUgaW4g
dGhlIFNQQ1IsIGllLg0KPiA+PiBiaXRfd2lkdGggPSA4IGFuZCBieXRlIGFjY2Vzcy4gV2hpbGUg
RURLMiBzZXRzIGJpdF93aWR0aCA9IDMyIGFuZA0KPiA+PiBkd29yZCBhY2Nlc3MuIEFsc28gdGhl
IG5hbWUgZXhwb3NlZCBieSBhY3BpY2EgdG9vbHMgaXMgZGlmZmVyZW50Og0KPiA+PiAnQ09NMCcg
aW4gbXkgY2FzZSB3aGVyZSAnXF9TQi5DT00wJyBpbiBTQlNBLVJFRiBjYXNlPw0KPiA+PiAtLS0N
Cj4gPj4gIGh3L2FybS92aXJ0LWFjcGktYnVpbGQuYyAgICB8IDc3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4gPj4gIGluY2x1ZGUvaHcvYWNwaS9hY3BpLWRlZnMuaCB8
IDUwICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvaHcv
YXJtL3ZpcnQtYWNwaS1idWlsZC5jIGIvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jDQo+ID4+IGlu
ZGV4IDAzN2NjMWZkODIuLjM1ZjI3YjQxZGYgMTAwNjQ0DQo+ID4+IC0tLSBhL2h3L2FybS92aXJ0
LWFjcGktYnVpbGQuYw0KPiA+PiArKysgYi9ody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMNCj4gPj4g
QEAgLTU2Myw2ICs1NjMsNzggQEAgYnVpbGRfZ3RkdChHQXJyYXkgKnRhYmxlX2RhdGEsIEJJT1NM
aW5rZXIgKmxpbmtlciwNCj4gVmlydE1hY2hpbmVTdGF0ZSAqdm1zKQ0KPiA+PiAgICAgICAgICAg
ICAgICAgICB2bXMtPm9lbV90YWJsZV9pZCk7DQo+ID4+ICB9DQo+ID4+DQo+ID4+ICsjZGVmaW5l
IEFDUElfREJHMl9QTDAxMV9VQVJUX0xFTkdUSCAweDEwMDANCj4gPj4gKw0KPiA+PiArLyogREJH
MiAqLw0KPiA+PiArc3RhdGljIHZvaWQNCj4gPj4gK2J1aWxkX2RiZzIoR0FycmF5ICp0YWJsZV9k
YXRhLCBCSU9TTGlua2VyICpsaW5rZXIsIFZpcnRNYWNoaW5lU3RhdGUgKnZtcykNCj4gPj4gK3sN
Cj4gPj4gKyAgICBpbnQgYWRkcl9vZmZzZXQsIGFkZHJzaXplX29mZnNldCwgbmFtZXNwYWNlX29m
ZnNldCwgbmFtZXNwYWNlX2xlbmd0aDsNCj4gPj4gKyAgICBjb25zdCBNZW1NYXBFbnRyeSAqdWFy
dF9tZW1tYXAgPSAmdm1zLT5tZW1tYXBbVklSVF9VQVJUXTsNCj4gPj4gKyAgICBzdHJ1Y3QgQWNw
aUdlbmVyaWNBZGRyZXNzICpiYXNlX2FkZHJlc3M7DQo+ID4+ICsgICAgaW50IGRiZzJfc3RhcnQg
PSB0YWJsZV9kYXRhLT5sZW47DQo+ID4+ICsgICAgQWNwaURiZzJEZXZpY2UgKmRiZzJkZXY7DQo+
ID4+ICsgICAgY2hhciBuYW1lW10gPSAiQ09NMCI7DQo+ID4+ICsgICAgQWNwaURiZzJUYWJsZSAq
ZGJnMjsNCj4gPj4gKyAgICB1aW50MzJfdCAqYWRkcl9zaXplOw0KPiA+PiArICAgIHVpbnQ4X3Qg
Km5hbWVzcGFjZTsNCj4gPj4gKw0KPiA+PiArICAgIGRiZzIgPSBhY3BpX2RhdGFfcHVzaCh0YWJs
ZV9kYXRhLCBzaXplb2YgKmRiZzIpOw0KPiA+PiArICAgIGRiZzItPmluZm9fb2Zmc2V0ID0gc2l6
ZW9mICpkYmcyOw0KPiA+PiArICAgIGRiZzItPmluZm9fY291bnQgPSAxOw0KPiA+PiArDQo+ID4+
ICsgICAgLyogZGVidWcgZGV2aWNlIGluZm8gc3RydWN0dXJlICovDQo+ID4+ICsNCj4gPj4gKyAg
ICBkYmcyZGV2ID0gYWNwaV9kYXRhX3B1c2godGFibGVfZGF0YSwgc2l6ZW9mKEFjcGlEYmcyRGV2
aWNlKSk7DQo+ID4+ICsNCj4gPj4gKyAgICBkYmcyZGV2LT5yZXZpc2lvbiA9IDA7DQo+ID4+ICsg
ICAgbmFtZXNwYWNlX2xlbmd0aCA9IHNpemVvZiBuYW1lOw0KPiA+PiArICAgIGRiZzJkZXYtPmxl
bmd0aCA9IHNpemVvZiAqZGJnMmRldiArIHNpemVvZihzdHJ1Y3QgQWNwaUdlbmVyaWNBZGRyZXNz
KSArDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgNCArIG5hbWVzcGFjZV9sZW5ndGg7DQo+
ID4+ICsgICAgZGJnMmRldi0+cmVnaXN0ZXJfY291bnQgPSAxOw0KPiA+PiArDQo+ID4+ICsgICAg
YWRkcl9vZmZzZXQgPSBzaXplb2YgKmRiZzJkZXY7DQo+ID4+ICsgICAgYWRkcnNpemVfb2Zmc2V0
ID0gYWRkcl9vZmZzZXQgKyBzaXplb2Yoc3RydWN0IEFjcGlHZW5lcmljQWRkcmVzcyk7DQo+ID4+
ICsgICAgbmFtZXNwYWNlX29mZnNldCA9IGFkZHJzaXplX29mZnNldCArIDQ7DQo+ID4+ICsNCj4g
Pj4gKyAgICBkYmcyZGV2LT5uYW1lcGF0aF9sZW5ndGggPSBjcHVfdG9fbGUxNihuYW1lc3BhY2Vf
bGVuZ3RoKTsNCj4gPj4gKyAgICBkYmcyZGV2LT5uYW1lcGF0aF9vZmZzZXQgPSBjcHVfdG9fbGUx
NihuYW1lc3BhY2Vfb2Zmc2V0KTsNCj4gPj4gKyAgICBkYmcyZGV2LT5vZW1fZGF0YV9sZW5ndGgg
PSBjcHVfdG9fbGUxNigwKTsNCj4gPj4gKyAgICBkYmcyZGV2LT5vZW1fZGF0YV9vZmZzZXQgPSBj
cHVfdG9fbGUxNigwKTsgLyogTm8gT0VNIGRhdGEgaXMgcHJlc2VudA0KPiAqLw0KPiA+PiArICAg
IGRiZzJkZXYtPnBvcnRfdHlwZSA9IGNwdV90b19sZTE2KEFDUElfREJHMl9TRVJJQUxfUE9SVCk7
DQo+ID4+ICsgICAgZGJnMmRldi0+cG9ydF9zdWJ0eXBlID0gY3B1X3RvX2xlMTYoQUNQSV9EQkcy
X0FSTV9QTDAxMSk7DQo+ID4+ICsNCj4gPj4gKyAgICBkYmcyZGV2LT5iYXNlX2FkZHJlc3Nfb2Zm
c2V0ID0gY3B1X3RvX2xlMTYoYWRkcl9vZmZzZXQpOw0KPiA+PiArICAgIGRiZzJkZXYtPmFkZHJl
c3Nfc2l6ZV9vZmZzZXQgPSBjcHVfdG9fbGUxNihhZGRyc2l6ZV9vZmZzZXQpOw0KPiA+PiArDQo+
ID4+ICsgICAgLyoNCj4gPj4gKyAgICAgKiB2YXJpYWJsZSBsZW5ndGggY29udGVudDoNCj4gPj4g
KyAgICAgKiBCYXNlQWRkcmVzc1JlZ2lzdGVyWzFdDQo+ID4+ICsgICAgICogQWRkcmVzc1NpemVb
MV0NCj4gPj4gKyAgICAgKiBOYW1lc3BhY2VTdHJpbmdbMV0NCj4gPj4gKyAgICAgKi8NCj4gPj4g
Kw0KPiA+PiArICAgIGJhc2VfYWRkcmVzcyA9IGFjcGlfZGF0YV9wdXNoKHRhYmxlX2RhdGEsDQo+
ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBBY3Bp
R2VuZXJpY0FkZHJlc3MpKTsNCj4gPj4gKw0KPiA+PiArICAgIGJhc2VfYWRkcmVzcy0+c3BhY2Vf
aWQgPSBBTUxfU1lTVEVNX01FTU9SWTsNCj4gPj4gKyAgICBiYXNlX2FkZHJlc3MtPmJpdF93aWR0
aCA9IDg7DQo+ID4+ICsgICAgYmFzZV9hZGRyZXNzLT5iaXRfb2Zmc2V0ID0gMDsNCj4gPj4gKyAg
ICBiYXNlX2FkZHJlc3MtPmFjY2Vzc193aWR0aCA9IDE7DQo+ID4+ICsgICAgYmFzZV9hZGRyZXNz
LT5hZGRyZXNzID0gY3B1X3RvX2xlNjQodWFydF9tZW1tYXAtPmJhc2UpOw0KPiA+PiArDQo+ID4+
ICsgICAgYWRkcl9zaXplID0gYWNwaV9kYXRhX3B1c2godGFibGVfZGF0YSwgc2l6ZW9mICphZGRy
X3NpemUpOw0KPiA+PiArICAgICphZGRyX3NpemUgPSBjcHVfdG9fbGUzMihBQ1BJX0RCRzJfUEww
MTFfVUFSVF9MRU5HVEgpOw0KPiA+PiArDQo+ID4+ICsgICAgbmFtZXNwYWNlID0gYWNwaV9kYXRh
X3B1c2godGFibGVfZGF0YSwgbmFtZXNwYWNlX2xlbmd0aCk7DQo+ID4+ICsgICAgbWVtY3B5KG5h
bWVzcGFjZSwgbmFtZSwgbmFtZXNwYWNlX2xlbmd0aCk7DQo+ID4+ICsNCj4gPj4gKyAgICBidWls
ZF9oZWFkZXIobGlua2VyLCB0YWJsZV9kYXRhLA0KPiA+PiArICAgICAgICAgICAgICAgICAodm9p
ZCAqKSh0YWJsZV9kYXRhLT5kYXRhICsgZGJnMl9zdGFydCksICJEQkcyIiwNCj4gPj4gKyAgICAg
ICAgICAgICAgICAgdGFibGVfZGF0YS0+bGVuIC0gZGJnMl9zdGFydCwgMywgdm1zLT5vZW1faWQs
DQo+ID4+ICsgICAgICAgICAgICAgICAgIHZtcy0+b2VtX3RhYmxlX2lkKTsNCj4gPj4gK30NCj4g
Pj4gKw0KPiA+PiAgLyogTUFEVCAqLw0KPiA+PiAgc3RhdGljIHZvaWQNCj4gPj4gIGJ1aWxkX21h
ZHQoR0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsIFZpcnRNYWNoaW5lU3Rh
dGUgKnZtcykNCj4gPj4gQEAgLTc5MCw3ICs4NjIsNyBAQCB2b2lkIHZpcnRfYWNwaV9idWlsZChW
aXJ0TWFjaGluZVN0YXRlICp2bXMsDQo+IEFjcGlCdWlsZFRhYmxlcyAqdGFibGVzKQ0KPiA+PiAg
ICAgIGRzZHQgPSB0YWJsZXNfYmxvYi0+bGVuOw0KPiA+PiAgICAgIGJ1aWxkX2RzZHQodGFibGVz
X2Jsb2IsIHRhYmxlcy0+bGlua2VyLCB2bXMpOw0KPiA+Pg0KPiA+PiAtICAgIC8qIEZBRFQgTUFE
VCBHVERUIE1DRkcgU1BDUiBwb2ludGVkIHRvIGJ5IFJTRFQgKi8NCj4gPj4gKyAgICAvKiBGQURU
IE1BRFQgR1REVCBNQ0ZHIFNQQ1IgREJHMiBwb2ludGVkIHRvIGJ5IFJTRFQgKi8NCj4gPj4gICAg
ICBhY3BpX2FkZF90YWJsZSh0YWJsZV9vZmZzZXRzLCB0YWJsZXNfYmxvYik7DQo+ID4+ICAgICAg
YnVpbGRfZmFkdF9yZXY1KHRhYmxlc19ibG9iLCB0YWJsZXMtPmxpbmtlciwgdm1zLCBkc2R0KTsN
Cj4gPj4NCj4gPj4gQEAgLTgxMyw2ICs4ODUsOSBAQCB2b2lkIHZpcnRfYWNwaV9idWlsZChWaXJ0
TWFjaGluZVN0YXRlICp2bXMsDQo+IEFjcGlCdWlsZFRhYmxlcyAqdGFibGVzKQ0KPiA+PiAgICAg
IGFjcGlfYWRkX3RhYmxlKHRhYmxlX29mZnNldHMsIHRhYmxlc19ibG9iKTsNCj4gPj4gICAgICBi
dWlsZF9zcGNyKHRhYmxlc19ibG9iLCB0YWJsZXMtPmxpbmtlciwgdm1zKTsNCj4gPj4NCj4gPj4g
KyAgICBhY3BpX2FkZF90YWJsZSh0YWJsZV9vZmZzZXRzLCB0YWJsZXNfYmxvYik7DQo+ID4+ICsg
ICAgYnVpbGRfZGJnMih0YWJsZXNfYmxvYiwgdGFibGVzLT5saW5rZXIsIHZtcyk7DQo+ID4+ICsN
Cj4gPj4gICAgICBpZiAodm1zLT5yYXMpIHsNCj4gPj4gICAgICAgICAgYnVpbGRfZ2hlc19lcnJv
cl90YWJsZSh0YWJsZXMtPmhhcmR3YXJlX2Vycm9ycywgdGFibGVzLT5saW5rZXIpOw0KPiA+PiAg
ICAgICAgICBhY3BpX2FkZF90YWJsZSh0YWJsZV9vZmZzZXRzLCB0YWJsZXNfYmxvYik7DQo+ID4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2FjcGkvYWNwaS1kZWZzLmggYi9pbmNsdWRlL2h3L2Fj
cGkvYWNwaS1kZWZzLmgNCj4gPj4gaW5kZXggY2Y5ZjQ0Mjk5Yy4uYmRiMmViZWQyYyAxMDA2NDQN
Cj4gPj4gLS0tIGEvaW5jbHVkZS9ody9hY3BpL2FjcGktZGVmcy5oDQo+ID4+ICsrKyBiL2luY2x1
ZGUvaHcvYWNwaS9hY3BpLWRlZnMuaA0KPiA+PiBAQCAtNjE4LDQgKzYxOCw1NCBAQCBzdHJ1Y3Qg
QWNwaUlvcnRSQyB7DQo+ID4+ICB9IFFFTVVfUEFDS0VEOw0KPiA+PiAgdHlwZWRlZiBzdHJ1Y3Qg
QWNwaUlvcnRSQyBBY3BpSW9ydFJDOw0KPiA+Pg0KPiA+PiArLyogREJHMiAqLw0KPiA+PiArDQo+
ID4+ICsvKiBUeXBlcyBmb3IgcG9ydF90eXBlIGZpZWxkIGFib3ZlICovDQo+ID4+ICsNCj4gPj4g
KyNkZWZpbmUgQUNQSV9EQkcyX1NFUklBTF9QT1JUICAgICAgIDB4ODAwMA0KPiA+PiArI2RlZmlu
ZSBBQ1BJX0RCRzJfMTM5NF9QT1JUICAgICAgICAgMHg4MDAxDQo+ID4+ICsjZGVmaW5lIEFDUElf
REJHMl9VU0JfUE9SVCAgICAgICAgICAweDgwMDINCj4gPj4gKyNkZWZpbmUgQUNQSV9EQkcyX05F
VF9QT1JUICAgICAgICAgIDB4ODAwMw0KPiA+PiArDQo+ID4+ICsvKiBTdWJ0eXBlcyBmb3IgcG9y
dF9zdWJ0eXBlIGZpZWxkIGFib3ZlICovDQo+ID4+ICsNCj4gPj4gKyNkZWZpbmUgQUNQSV9EQkcy
XzE2NTUwX0NPTVBBVElCTEUgIDB4MDAwMA0KPiA+PiArI2RlZmluZSBBQ1BJX0RCRzJfMTY1NTBf
U1VCU0VUICAgICAgMHgwMDAxDQo+ID4+ICsjZGVmaW5lIEFDUElfREJHMl9BUk1fUEwwMTEgICAg
ICAgICAweDAwMDMNCj4gPj4gKyNkZWZpbmUgQUNQSV9EQkcyX0FSTV9TQlNBXzMyQklUICAgIDB4
MDAwRA0KPiA+PiArI2RlZmluZSBBQ1BJX0RCRzJfQVJNX1NCU0FfR0VORVJJQyAgMHgwMDBFDQo+
ID4+ICsjZGVmaW5lIEFDUElfREJHMl9BUk1fRENDICAgICAgICAgICAweDAwMEYNCj4gPj4gKyNk
ZWZpbmUgQUNQSV9EQkcyX0JDTTI4MzUgICAgICAgICAgIDB4MDAxMA0KPiA+PiArDQo+ID4+ICsj
ZGVmaW5lIEFDUElfREJHMl8xMzk0X1NUQU5EQVJEICAgICAweDAwMDANCj4gPj4gKw0KPiA+PiAr
I2RlZmluZSBBQ1BJX0RCRzJfVVNCX1hIQ0kgICAgICAgICAgMHgwMDAwDQo+ID4+ICsjZGVmaW5l
IEFDUElfREJHMl9VU0JfRUhDSSAgICAgICAgICAweDAwMDENCj4gPj4gKw0KPiA+PiArLyogRGVi
dWcgRGV2aWNlIEluZm9ybWF0aW9uIFN1YnRhYmxlICovDQo+ID4+ICsNCj4gPj4gK3N0cnVjdCBB
Y3BpRGJnMkRldmljZSB7DQo+ID4+ICsgICAgdWludDhfdCAgcmV2aXNpb247DQo+ID4+ICsgICAg
dWludDE2X3QgbGVuZ3RoOw0KPiA+PiArICAgIHVpbnQ4X3QgIHJlZ2lzdGVyX2NvdW50OyAvKiBO
dW1iZXIgb2YgYmFzZV9hZGRyZXNzIHJlZ2lzdGVycyAqLw0KPiA+PiArICAgIHVpbnQxNl90IG5h
bWVwYXRoX2xlbmd0aDsNCj4gPj4gKyAgICB1aW50MTZfdCBuYW1lcGF0aF9vZmZzZXQ7DQo+ID4+
ICsgICAgdWludDE2X3Qgb2VtX2RhdGFfbGVuZ3RoOw0KPiA+PiArICAgIHVpbnQxNl90IG9lbV9k
YXRhX29mZnNldDsNCj4gPj4gKyAgICB1aW50MTZfdCBwb3J0X3R5cGU7DQo+ID4+ICsgICAgdWlu
dDE2X3QgcG9ydF9zdWJ0eXBlOw0KPiA+PiArICAgIHVpbnQ4X3QgIHJlc2VydmVkWzJdOw0KPiA+
PiArICAgIHVpbnQxNl90IGJhc2VfYWRkcmVzc19vZmZzZXQ7DQo+ID4+ICsgICAgdWludDE2X3Qg
YWRkcmVzc19zaXplX29mZnNldDsNCj4gPj4gK30gIFFFTVVfUEFDS0VEOw0KPiA+PiArdHlwZWRl
ZiBzdHJ1Y3QgQWNwaURiZzJEZXZpY2UgQWNwaURiZzJEZXZpY2U7DQo+ID4+ICsNCj4gPj4gK3N0
cnVjdCBBY3BpRGJnMlRhYmxlIHsNCj4gPj4gKyAgICBBQ1BJX1RBQkxFX0hFQURFUl9ERUYgLyog
QUNQSSBjb21tb24gdGFibGUgaGVhZGVyICovDQo+ID4+ICsgICAgdWludDMyX3QgaW5mb19vZmZz
ZXQ7IC8qIG9mZnNldCB0byB0aGUgZmlyc3QgZGVidWcgc3RydWN0ICovDQo+ID4+ICsgICAgdWlu
dDMyX3QgaW5mb19jb3VudDsgIC8qIG51bWJlciBvZiBkZWJ1ZyBkZXZpY2UgaW5mbyBzdHJ1Y3Qg
ZW50cmllcyAqLw0KPiA+PiArICAgIHVpbnQ4X3QgIGRiZzJfZGV2aWNlX2luZm9bXTsNCj4gPj4g
K30gUUVNVV9QQUNLRUQ7DQo+ID4+ICt0eXBlZGVmIHN0cnVjdCBBY3BpRGJnMlRhYmxlIEFjcGlE
YmcyVGFibGU7DQo+ID4+ICsNCj4gPj4gICNlbmRpZg0KPiA+PiAtLQ0KPiA+PiAyLjI2LjMNCj4g
Pj4NCg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFu
eSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2Vk
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8g
YW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29w
eSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K

