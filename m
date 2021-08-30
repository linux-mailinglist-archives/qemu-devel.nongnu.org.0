Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F53FAFF0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 05:07:51 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKXeH-00076e-68
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 23:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXas-00039I-3s
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:04:18 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXao-0000BD-Kn
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:04:17 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17TF5xKB006570; 
 Mon, 30 Aug 2021 03:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=FNN0Jn1GwJIJs6lyy+IxXv2wJtoRez8cdql4PbNI4Cs=;
 b=DoWm3j2GPJlzgLAa91KHJzjcZIWlatYN511L26oPBOLW92K2NY5m2ujpy6G9QS242NbO
 lfZSgKp3brvGADyg2Iv8k52YT3klj06/YyBowwCFfLWpfuyqAdQucCft2HLbrUpGY6gc
 MRLJSRD1dIZyFifra7MhEfIN02E1ez6VZ+ILBM0JBJO4JuYT8VKWsNv7RqfHH/9WkN9y
 DdPIlYoYhlwxNZ8mm2FaMI5uGiKQUvjN3zWmDkFtDHzTXWHJSq+aD6BvFIo2Z3HxwaMw
 kOie8R2sokHurX3Z4bhsSt3vxiYDQ45eIAapxs4JXKDr+2InRuU7hqpWfaZWfNea6jCv JA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=FNN0Jn1GwJIJs6lyy+IxXv2wJtoRez8cdql4PbNI4Cs=;
 b=GbhxNZk0NNoT6dCiuLrjKVO+eNbgNBYWHBtrPlcLkZYXqLyaUtHaH/59rF+WG6vWR4YJ
 NCyg8TAawesE3sv4mbONYXKTNupw6NIJQQnbkuXg1LgQq7JvP4H+X+ag/c7/BMZzlklA
 QnXpRa0wQWEGNNPBECJ0n9Ml8GyOW0VG+SM1V6N9nfJugzH6bg2B3aNmVvHII7xQcDG2
 8h2NWp6GV8v1h0SLFzOwEove/mvh0dEJQrZwLMu4vC61qHxWfypPqWsdiHXUPxWgb4jJ
 /ajlB9hzg+JnAZrtP8Lddtj4QaxPGIMau9fNoFf8Kp2vej3pM9cWV+7Uy0g2Svq6To0O SQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3arcjw8dfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:04:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17U31jsN141756;
 Mon, 30 Aug 2021 03:04:11 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by userp3020.oracle.com with ESMTP id 3aqxwqjmwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:04:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI8Bc202qQW8bl1w/dFLwOgZy5qR5OJbOGC0EATSlbpx8nTT6uG7xr4jV7mZNj3eC3AJIjjfeVSDH57Kj3gGiaFOJduc/v5D+NDnPl+qXpGQOSd7UxN4KIjH2/LsF/WcT1taz1FQFaWDLnw34FdZdkaAbBFMKBkD2uDNA0FA3a0tlnfaagkoDhcSmBkHnWl2NFxKJ9bDEk2thifTMNi6mmqk6+q3GMezxfq0neD2NtGdvZtZUgL8klc29DgfSQO14gfx3J+yuDWsg04ICYDHfTj1ZSVmk6ZAx7NS4K+cfsuSUtuKA580wrFbt0ns+PEoLB3oskuM3fVRq24xB+YvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNN0Jn1GwJIJs6lyy+IxXv2wJtoRez8cdql4PbNI4Cs=;
 b=AsBiOzkVf8kOnjXKLBirrfLf2UOgb/Wc9Q1PcU6T0aRnHAU8f4wBCIq5/SvHXQ6yvzfQHAk5B2R1BzOtcBicCqNI2sMR2eb7G8Jhe/B6bqHCnZD/dxsBB1vxvkTnhiPyClpCEBf2pF54kgW7pguv24VFWXFvuo3nbpwqZ38J50kRAuXE+czCQdoxFi4Kw/EOWFS2TlN6Kmy8mvcz4Mn3JDKVOBofeK6T555xUjIWRTuUWLDe80zHrPsDQCb5uFMffTXRIV+RUUDxiY7aK+s/MT+wBrPQKDiYVuT+fVHYi2F0IGifTX/0T3xZNd47fxG/mHXhf5owymTevv8TzDG6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNN0Jn1GwJIJs6lyy+IxXv2wJtoRez8cdql4PbNI4Cs=;
 b=rx03az1Fc0znXQOxCmAy4OdXiPFMA4TBzO4O3FYGKM1mOKusl2mFNRrCjeHONHNXPuyMZUaflrK6HwaK+DqrYO9d7ME2h+iv5jj7RCxx59A1oo4zXMX94PNCyjnNkay6Ln/D77wKJoEY1yTHnxDoUdFn6dEY8RMXNYrvIlTn9gs=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1454.namprd10.prod.outlook.com
 (2603:10b6:300:23::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 03:04:09 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4457.017; Mon, 30 Aug 2021
 03:04:09 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 05/16] vfio-user: define VFIO Proxy and
 communication functions
Thread-Topic: [PATCH RFC v2 05/16] vfio-user: define VFIO Proxy and
 communication functions
Thread-Index: AQHXkr3FDQUseG9FtESQ40VOdnRbeKuC0BGAgAih2QA=
Date: Mon, 30 Aug 2021 03:04:08 +0000
Message-ID: <533AA34D-79D8-42D1-9F0C-F66B89C21722@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <3d3befd308bacb7ec9f3ccd8f99e5184261279b2.1629131628.git.elena.ufimtseva@oracle.com>
 <YSUM5wB+XAd/WmM0@stefanha-x1.localdomain>
In-Reply-To: <YSUM5wB+XAd/WmM0@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4d4fc76-df3f-459f-91e6-08d96b62d5f8
x-ms-traffictypediagnostic: MWHPR10MB1454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB145424E6972D415DEEB12372B6CB9@MWHPR10MB1454.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDVBQsqMbPCZGNkCYx818AgCGkY/M//ZGDgHhGCgVp5M9xwUtFLFjvXq+PadTsysDHu7xQn4ogpfQhSqi0IfIFO6XrPbW1scajkI3S3Uu6qCtGOdaJyFKBBQMHfZndLstDn05MMj7oT2efBa6WUiOD1A13ReJMn2FBtfVYImk7yRNmpG2YOmxXCon6daVfcBKixx7Lb+4AEobtWwkOPWXTEOR/m4XozbQJqYah8XprMnFjS/bw4i0KwubPIUKENjEZe89YYbyaQnnQvcEjZwJG995agjM9R7DjDmQnh+T51d2Mk4msdrdZdK4XcDOUKw8upFcesFsLwjDk5i1JkwWdp1skprcd6/38nvb+uliTJslXQRCqlgg6uI9GP7wpyqMvCbEd5zX8R922wz5JMt4tEXtThobnJGocK7geUAgHTA13pYNgITCNIAEvFXwd1b4m7kNS82RJe2WQuULoEx8b5Pon3uMtiipWJLA8oivtBpisoq1pf4N1SWSebRXLFq3TA0JKzsiUM7WU40JRUbAAmn1C2/rM8EvdhiTjO6Ek9Rqy/exoc4osYaXy95WWgVlcs2BgkZp1Qpn7hQphKVYp2hXkGes1nNeWowMklJrrPvfaANQmrrOCcr8ilczVtV3OrjM+fvKGBlBS4Lo+VvAhaYobciloeb0mIpVAT1HqtczbsUN6xfj63xT8cGroO811sVnGkoy5gttUQOIbxFDMuJ4chWy4YkzQlqMZ40U+NTOiaxj+yidwbtSujTpnYV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(38100700002)(6486002)(316002)(6512007)(4326008)(2906002)(38070700005)(36756003)(122000001)(54906003)(26005)(64756008)(66476007)(66946007)(66556008)(53546011)(91956017)(76116006)(66446008)(6506007)(83380400001)(186003)(33656002)(86362001)(6916009)(8936002)(2616005)(8676002)(508600001)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHFGVWNBQkc3T2NzRDNaeW5nWXVNNXhRaENKUGpFNUYxZ0dhWmxIdVhWTUVo?=
 =?utf-8?B?MzdkZXBUOUpsM0xpWGtPc2xWM1BWOE45cDFwUmNxTjV4OWlickU0OW1FdEJJ?=
 =?utf-8?B?cUFEbStsaWN0bVhlYXozWXBmakNBSXl1WkJZcFNDQUgyanlST1pQWGprYytx?=
 =?utf-8?B?dU9DalpNRTlTYjAvNHdLQTVLMWZFejhRQmYwVFZSRGg1OHN4V2xmY1BnVUdi?=
 =?utf-8?B?Zjd0QTFJdUtIdEZ3UDRtT3NYeVJtUm12ZklldTc5Y0FZVTBmdm1tQ1RCaGpV?=
 =?utf-8?B?cUFFelIwOUlMSWo4aUVsVEtZWlBDYkdoc2F4N0VyRTlXNXUvOVVNWkxWcjNn?=
 =?utf-8?B?SjQ3TkpXQys1WEU2ZHpwZU9hc084bW00T0FxM1g1UVJFUnJ6Yml6bXc0ZEY2?=
 =?utf-8?B?T0hVdVQxeWpTcHRETmFnY2ZQTTVoU1BBZDM2UEtSajJRZC8zcm4rUzZOKysz?=
 =?utf-8?B?N05kTEVFdGltVnpQK3BFazdVc1VDZVNvQVFQdGdZNVlZVU45dk5IOENVYy82?=
 =?utf-8?B?NkxOYm55eEhaOXQ2LzRKQmVIWllCRDFlOGRCeEZZaVdYSldiRUtERm5VMG1V?=
 =?utf-8?B?bEZVU1VobUJndGxReUtXNTlFYkhKQzJoMGJFamJqQjRwWTZNMW1TYUM3Tm9o?=
 =?utf-8?B?cmFIN05VdzdmYlB3QkVtc2V0Uy9Sb3ZjRjRjOGovZVRzQVQ5eDdldXhDNDg1?=
 =?utf-8?B?ODhxUEw0Y3pReXlrOHg1WmVYRTdrS1R1RnUxT2RvMFAyWWdTTDhSdXlIRml0?=
 =?utf-8?B?THQvSEhKbVUwWG5mLzdDZ0J5ZXFCYUxCSUdpdTVNYzdEeC9Vak5jbnJtM3E4?=
 =?utf-8?B?dVFwU0l0TWM4WTlIUFZjM01TS0R1OGlRdlJWOWJSVHkrcjVMYi82MVo4UjVn?=
 =?utf-8?B?VmJseEtyYktsQk0rZnZxYmo5MzRGRUt6aWZYcVdFQzZ2Zk5yMVhZMFFsek9L?=
 =?utf-8?B?bjNkMmEwQmNZQUF4L0hvR1QzU1AzaTVCeFJiT2VlV0g1a3EvSEFRc1dRYzJZ?=
 =?utf-8?B?Q3Y1SjM5Uk4ybDExZXhrNm85QTF6OEU1cUJBb0tjMGZpREY1VWhLSjhTeXB6?=
 =?utf-8?B?eE10QVhhMEtsNjFaNDBtelQ2VmVEZlNnbnpoelRzeGtNOGRIbVN0b213Unlh?=
 =?utf-8?B?cXdPOXdNWnBwcHVNbFdsZklEOG43SUgwL2I0L3FwYlJwa3prZHhBSmsxS09a?=
 =?utf-8?B?amRRL0dBYzRBSEsyendoSmR4TzBuaFp4eXhVb0VYVGwyUVBiSDZMY0d0STNG?=
 =?utf-8?B?R3V2Q2E3bDZxendtbFp3djRYSnFoaldwZkpFZEl6eGNyNklPM09uMkpndjVB?=
 =?utf-8?B?RzdwRTVDU2ttQlZKejJUOExiMHN1MmNmUXNaN0VmSEhpSGxiWDJMUTZQa3h6?=
 =?utf-8?B?UHc4eU5wV2RNa0N5akVLV0dCbTB5WGtUYUREbGNHb2xyZnVOTjRReGtWbTNN?=
 =?utf-8?B?SVpYOExhTWc4cUFaS2NpWktxakZpSlpRMFdTTGQxSFZhT3k5eHJoRG12TUtC?=
 =?utf-8?B?SXAvMDk3UGsyUUI1Qm44dzBab0xTaW02K3hIRjZxUzNZYzYzRDhNbElsR2dw?=
 =?utf-8?B?Z2krN1ZvSTdOb28zbXJmYkVlWCtVYzhvMmR1eW5iZG9DWHVFeGZJOEtDeGhX?=
 =?utf-8?B?MlJ4ZUhINW1EMHkyakMwdkY1aEdSOVI5Uy9vRjFhT3drRHZKOWpmL3l6ZVFn?=
 =?utf-8?B?MTA2VUFhUWpDQ0c4dUs0UnBYaWlBR3RtUTdGNFBnSkZ0aEFoWkhXMXR4cWZN?=
 =?utf-8?Q?ThxUFtMxrGj//ub0jKZ7I4+BobrnMrHMs0B+AbZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D052B870EF488F41A57AC9AF000181C2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d4fc76-df3f-459f-91e6-08d96b62d5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 03:04:08.9280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHrL/lDxmz4Xh+LPC2MdtZ8QijvAIvwW/miECxhdmqbzJBYs4H2vx7DupYcgM3DO5vemuBwKJP4ShPxKeScRcwWMCWLYMlx6wwdgDcL16b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1454
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300017
X-Proofpoint-ORIG-GUID: NJaop2SGe9fZCjGuGlMzpePuq4z5RKlW
X-Proofpoint-GUID: NJaop2SGe9fZCjGuGlMzpePuq4z5RKlW
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDI0LCAyMDIxLCBhdCA4OjE0IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBdWcgMTYsIDIwMjEgYXQgMDk6
NDI6MzhBTSAtMDcwMCwgRWxlbmEgVWZpbXRzZXZhIHdyb3RlOg0KPj4gQEAgLTYyLDUgKzY1LDEw
IEBAIHR5cGVkZWYgc3RydWN0IFZGSU9Qcm94eSB7DQo+PiANCj4+IFZGSU9Qcm94eSAqdmZpb191
c2VyX2Nvbm5lY3RfZGV2KFNvY2tldEFkZHJlc3MgKmFkZHIsIEVycm9yICoqZXJycCk7DQo+PiB2
b2lkIHZmaW9fdXNlcl9kaXNjb25uZWN0KFZGSU9Qcm94eSAqcHJveHkpOw0KPj4gK3ZvaWQgdmZp
b191c2VyX3NldF9yZXFoYW5kbGVyKFZGSU9EZXZpY2UgKnZiYXNkZXYsDQo+IA0KPiAidmJhc2Vk
ZXYiIGZvciBjb25zaXN0ZW5jeT8NCj4gDQoNCglPSw0KDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ICgqaGFuZGxlcikodm9pZCAqb3BhcXVlLCBjaGFyICpidWYsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVkZJT1VzZXJGRHMg
KmZkcyksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqcmVxYXJnKTsNCj4gDQo+IFRoZSBoYW5kbGVyIGNhbGxiYWNrIGlzIHVuZG9jdW1lbnRl
ZC4gV2hhdCBjb250ZXh0IGRvZXMgaXQgcnVuIGluLCB3aGF0DQo+IGRvIHRoZSBhcmd1bWVudHMg
bWVhbiwgYW5kIHdoYXQgc2hvdWxkIHRoZSBmdW5jdGlvbiByZXR1cm4/IFBsZWFzZQ0KPiBkb2N1
bWVudCBpdCBzbyBpdCdzIGVhc3kgZm9yIG90aGVycyB0byBtb2RpZnkgdGhpcyBjb2RlIGluIHRo
ZSBmdXR1cmUNCj4gd2l0aG91dCByZXZlcnNlLWVuZ2luZWVyaW5nIHRoZSBhc3N1bXB0aW9ucyBi
ZWhpbmQgaXQuDQo+IA0KDQoJT0sNCg0KDQo+PiArdm9pZCB2ZmlvX3VzZXJfcmVjdih2b2lkICpv
cGFxdWUpDQo+PiArew0KPj4gKyAgICBWRklPRGV2aWNlICp2YmFzZWRldiA9IG9wYXF1ZTsNCj4+
ICsgICAgVkZJT1Byb3h5ICpwcm94eSA9IHZiYXNlZGV2LT5wcm94eTsNCj4+ICsgICAgVkZJT1Vz
ZXJSZXBseSAqcmVwbHkgPSBOVUxMOw0KPj4gKyAgICBnX2F1dG9mcmVlIGludCAqZmRwID0gTlVM
TDsNCj4+ICsgICAgVkZJT1VzZXJGRHMgcmVxZmRzID0geyAwLCAwLCBmZHAgfTsNCj4+ICsgICAg
VkZJT1VzZXJIZHIgbXNnOw0KPj4gKyAgICBzdHJ1Y3QgaW92ZWMgaW92ID0gew0KPj4gKyAgICAg
ICAgLmlvdl9iYXNlID0gJm1zZywNCj4+ICsgICAgICAgIC5pb3ZfbGVuID0gc2l6ZW9mKG1zZyks
DQo+PiArICAgIH07DQo+PiArICAgIGJvb2wgaXNyZXBseTsNCj4+ICsgICAgaW50IGksIHJldDsN
Cj4+ICsgICAgc2l6ZV90IG1zZ2xlZnQsIG51bWZkcyA9IDA7DQo+PiArICAgIGNoYXIgKmRhdGEg
PSBOVUxMOw0KPj4gKyAgICBnX2F1dG9mcmVlIGNoYXIgKmJ1ZiA9IE5VTEw7DQo+PiArICAgIEVy
cm9yICpsb2NhbF9lcnIgPSBOVUxMOw0KPj4gKw0KPj4gKyAgICBxZW11X211dGV4X2xvY2soJnBy
b3h5LT5sb2NrKTsNCj4+ICsgICAgaWYgKHByb3h5LT5zdGF0ZSA9PSBWRklPX1BST1hZX0NMT1NJ
TkcpIHsNCj4+ICsgICAgICAgIHFlbXVfbXV0ZXhfdW5sb2NrKCZwcm94eS0+bG9jayk7DQo+PiAr
ICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0ID0gcWlvX2NoYW5u
ZWxfcmVhZHZfZnVsbChwcm94eS0+aW9jLCAmaW92LCAxLCAmZmRwLCAmbnVtZmRzLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZsb2NhbF9lcnIpOw0KPiANCj4gVGhpcyBp
cyBhIGJsb2NraW5nIGNhbGwuIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgSU9UaHJlYWQg
aXMgc2hhcmVkDQo+IGJ5IGFsbCB2ZmlvLXVzZXIgZGV2aWNlcywgc28gb3RoZXIgZGV2aWNlcyB3
aWxsIGhhdmUgdG8gd2FpdCBpZiBvbmUgb2YNCj4gdGhlbSBpcyBhY3RpbmcgdXAgKGUuZy4gdGhl
IGRldmljZSBlbXVsYXRpb24gcHJvY2VzcyBzZW50IGxlc3MgdGhhbg0KPiBzaXplb2YobXNnKSBi
eXRlcykuDQo+IA0KPiBXaGlsZSB3ZSdyZSBibG9ja2VkIGluIHRoaXMgZnVuY3Rpb24gdGhlIHBy
b3h5IGRldmljZSBjYW5ub3QgYmUNCj4gaG90LXJlbW92ZWQgc2luY2UgcHJveHktPmxvY2sgaXMg
aGVsZC4NCj4gDQo+IEl0IHdvdWxkIG1vcmUgcm9idXN0IHRvIHVzZSBvZiB0aGUgZXZlbnQgbG9v
cCB0byBhdm9pZCBibG9ja2luZy4gVGhlcmUNCj4gY291bGQgYmUgYSBwZXItY29ubmVjdGlvbiBy
ZWNlaXZlciBjb3JvdXRpbmUgdGhhdCBjYWxscw0KPiBxaW9fY2hhbm5lbF9yZWFkdl9mdWxsX2Fs
bF9lb2YoKSAoaXQgeWllbGRzIHRoZSBjb3JvdXRpbmUgaWYgcmVhZGluZw0KPiB3b3VsZCBibG9j
aykuDQo+IA0KDQoJSSB0aG91Z2h0IHRoZSBtYWluIGxvb3AgdXNlcyBCUUwsIHdoaWNoIEkgZG9u
4oCZdCBuZWVkIGZvciBtb3N0DQptZXNzYWdlIHByb2Nlc3NpbmcuICBUaGUgYmxvY2tpbmcgYmVo
YXZpb3IgY2FuIGJlIGZpeGVkIHdpdGggRklPTlJFQUQNCmJlZm9yZWhhbmQgdG8gZGV0ZWN0IGEg
bWVzc2FnZSB3aXRoIGZld2VyIGJ5dGVzIHRoYW4gaW4gYSBoZWFkZXIuDQoNCg0KDQo+PiArICAg
IC8qDQo+PiArICAgICAqIFJlcGxpZXMgc2lnbmFsIGEgd2FpdGVyLCByZXF1ZXN0cyBnZXQgcHJv
Y2Vzc2VkIGJ5IHZmaW8gY29kZQ0KPj4gKyAgICAgKiB0aGF0IG1heSBhc3N1bWUgdGhlIGlvdGhy
ZWFkIGxvY2sgaXMgaGVsZC4NCj4+ICsgICAgICovDQo+PiArICAgIGlmIChpc3JlcGx5KSB7DQo+
PiArICAgICAgICByZXBseS0+Y29tcGxldGUgPSAxOw0KPj4gKyAgICAgICAgaWYgKCFyZXBseS0+
bm93YWl0KSB7DQo+PiArICAgICAgICAgICAgcWVtdV9jb25kX3NpZ25hbCgmcmVwbHktPmN2KTsN
Cj4+ICsgICAgICAgIH0gZWxzZSB7DQo+PiArICAgICAgICAgICAgaWYgKG1zZy5mbGFncyAmIFZG
SU9fVVNFUl9FUlJPUikgew0KPj4gKyAgICAgICAgICAgICAgICBlcnJvcl9wcmludGYoInZmaW9f
dXNlcl9yY3YgZXJyb3IgcmVwbHkgb24gYXN5bmMgcmVxdWVzdCAiKTsNCj4+ICsgICAgICAgICAg
ICAgICAgZXJyb3JfcHJpbnRmKCJjb21tYW5kICV4IGVycm9yICVzXG4iLCBtc2cuY29tbWFuZCwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmVycm9yKG1zZy5lcnJvcl9yZXBs
eSkpOw0KPj4gKyAgICAgICAgICAgIH0NCj4+ICsgICAgICAgICAgICAvKiBqdXN0IGZyZWUgaXQg
aWYgbm8gb25lIGlzIHdhaXRpbmcgKi8NCj4+ICsgICAgICAgICAgICByZXBseS0+bm93YWl0ID0g
MDsNCj4+ICsgICAgICAgICAgICBpZiAocHJveHktPmxhc3Rfbm93YWl0ID09IHJlcGx5KSB7DQo+
PiArICAgICAgICAgICAgICAgIHByb3h5LT5sYXN0X25vd2FpdCA9IE5VTEw7DQo+PiArICAgICAg
ICAgICAgfQ0KPj4gKyAgICAgICAgICAgIGdfZnJlZShyZXBseS0+bXNnKTsNCj4+ICsgICAgICAg
ICAgICBRVEFJTFFfSU5TRVJUX0hFQUQoJnByb3h5LT5mcmVlLCByZXBseSwgbmV4dCk7DQo+PiAr
ICAgICAgICB9DQo+PiArICAgICAgICBxZW11X211dGV4X3VubG9jaygmcHJveHktPmxvY2spOw0K
Pj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgcWVtdV9tdXRleF91bmxvY2soJnByb3h5LT5s
b2NrKTsNCj4+ICsgICAgICAgIHFlbXVfbXV0ZXhfbG9ja19pb3RocmVhZCgpOw0KPiANCj4gVGhl
IGZhY3QgdGhhdCBwcm94eS0+cmVxdWVzdCgpIHJ1bnMgd2l0aCB0aGUgQlFMIHN1Z2dlc3RzIHRo
YXQgVkZJTw0KPiBjb21tdW5pY2F0aW9uIHNob3VsZCB0YWtlIHBsYWNlIGluIHRoZSBtYWluIGV2
ZW50IGxvb3AgdGhyZWFkIGluc3RlYWQgb2YNCj4gYSBzZXBhcmF0ZSBJT1RocmVhZC4NCj4gDQoN
CglTZWUgdGhlIGxhc3QgcmVwbHkuICBVc2luZyB0aGUgbWFpbiBldmVudCBsb29wIG9wdGltaXpl
cyB0aGUNCmxlYXN0IGNvbW1vbiBjYXNlLg0KDQoNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAg
ICAgKiBtYWtlIHN1cmUgcHJveHkgd2Fzbid0IGNsb3NlZCB3aGlsZSB3ZSB3YWl0ZWQNCj4+ICsg
ICAgICAgICAqIGNoZWNraW5nIHN0YXRlIHdpdGhvdXQgaG9sZGluZyB0aGUgcHJveHkgbG9jayBp
cyBzYWZlDQo+PiArICAgICAgICAgKiBzaW5jZSBpdCdzIG9ubHkgc2V0IHRvIENMT1NJTkcgd2hl
biBCUUwgaXMgaGVsZA0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBpZiAocHJveHktPnN0
YXRlICE9IFZGSU9fUFJPWFlfQ0xPU0lORykgew0KPj4gKyAgICAgICAgICAgIHJldCA9IHByb3h5
LT5yZXF1ZXN0KHByb3h5LT5yZXFhcmcsIGJ1ZiwgJnJlcWZkcyk7DQo+IA0KPiBUaGUgcmVxdWVz
dCgpIGNhbGxiYWNrIGluIGFuIGVhcmxpZXIgcGF0Y2ggaXMgYSBub29wIGZvciB0aGUgY2xpZW50
DQo+IGltcGxlbWVudGF0aW9uLiBXaG8gZnJlZXMgcGFzc2VkIGZkcz8NCj4gDQoNCglSaWdodCBu
b3cgbm8gc2VydmVyLT5jbGllbnQgcmVxdWVzdHMgc2VuZCBmZOKAmXMsIGJ1dCBJIGRvIG5lZWQN
CmEgc2luZ2xlIHBvaW50IHdoZXJlIHRoZXkgYXJlIGNvbnN1bWVkIGlmIGFuIGVycm9yIGlzIHJl
dHVybmVkLiANCg0KDQo+PiArICAgICAgICAgICAgaWYgKHJldCA8IDAgJiYgIShtc2cuZmxhZ3Mg
JiBWRklPX1VTRVJfTk9fUkVQTFkpKSB7DQo+PiArICAgICAgICAgICAgICAgIHZmaW9fdXNlcl9z
ZW5kX3JlcGx5KHByb3h5LCBidWYsIHJldCk7DQo+PiArICAgICAgICAgICAgfQ0KPj4gKyAgICAg
ICAgfQ0KPj4gKyAgICAgICAgcWVtdV9tdXRleF91bmxvY2tfaW90aHJlYWQoKTsNCj4+ICsgICAg
fQ0KPj4gKyAgICByZXR1cm47DQo+PiArDQo+PiArZmF0YWw6DQo+PiArICAgIHZmaW9fdXNlcl9z
aHV0ZG93bihwcm94eSk7DQo+PiArICAgIHByb3h5LT5zdGF0ZSA9IFZGSU9fUFJPWFlfUkVDVl9F
UlJPUjsNCj4+ICsNCj4+ICtlcnI6DQo+PiArICAgIGZvciAoaSA9IDA7IGkgPCBudW1mZHM7IGkr
Kykgew0KPj4gKyAgICAgICAgY2xvc2UoZmRwW2ldKTsNCj4+ICsgICAgfQ0KPj4gKyAgICBpZiAo
cmVwbHkgIT0gTlVMTCkgew0KPj4gKyAgICAgICAgLyogZm9yY2UgYW4gZXJyb3IgdG8ga2VlcCBz
ZW5kaW5nIHRocmVhZCBmcm9tIGhhbmdpbmcgKi8NCj4+ICsgICAgICAgIHJlcGx5LT5tc2ctPmZs
YWdzIHw9IFZGSU9fVVNFUl9FUlJPUjsNCj4+ICsgICAgICAgIHJlcGx5LT5tc2ctPmVycm9yX3Jl
cGx5ID0gRUlOVkFMOw0KPj4gKyAgICAgICAgcmVwbHktPmNvbXBsZXRlID0gMTsNCj4+ICsgICAg
ICAgIHFlbXVfY29uZF9zaWduYWwoJnJlcGx5LT5jdik7DQo+IA0KPiBXaGF0IGFib3V0IGZkIHBh
c3Npbmc/IFRoZSBhY3R1YWwgZmRzIGhhdmUgYmVlbiBjbG9zZWQgYWxyZWFkeSBpbiBmZHBbXQ0K
PiBidXQgcmVwbHkgaGFzIGEgY29weSB0b28uDQo+IA0KDQoJSWYgdGhlIHNlbmRlciBnZXRzIGFu
IGVycm9yLCBpdCB3b27igJl0IGJlIHVzaW5nIHRoZSBmZOKAmXMuICBJDQpjYW4gemVybyByZXBs
eS0+ZmRzIHRvIG1ha2UgdGhpcyBjbGVhcmVyLg0KDQoNCj4gV2hhdCBhYm91dCB0aGUgbm93YWl0
IGNhc2U/IElmIG5vIG9uZSBpcyB3YWl0aW5nIG9uIHJlcGx5LT5jdiBzbyB0aGlzDQo+IHJlcGx5
IHdpbGwgYmUgbGVha2VkPw0KPiANCg0KCVRoaXMgbG9va3MgbGlrZSBhIGxlYWsuDQoNCgkJCUpK
DQoNCg==

