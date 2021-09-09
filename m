Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94E404538
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 07:53:16 +0200 (CEST)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOCzq-0005WP-N3
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 01:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOCxY-0003yz-Lo
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:50:55 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOCxV-00027R-AS
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 01:50:52 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18942bJd031120; 
 Thu, 9 Sep 2021 05:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=By0GThBqG3jNGu5JEzNZwH3Wqe8VWO6XrfctnJrVDKU=;
 b=xStztBT5k2b0fySEbqv9F7+/mVoLuxHeewCR86l5+iX4Iabaexq3YVvF/vLAt013EIJB
 kwNR8atiGm8WaHfbyOyKTgnwy0aTxAKh0kKtAR3249x0GNyY5r4IFt4ib6ll57wTqNCd
 fKBZ+JcHT7aDd9uoA8Ax7hycuSYRRA30vZzxTaZn7vlXTkmwiN0NIT5xBbdIm6kdOXUs
 s0QpzXpR3q44VQiDkh11enczJ3akqH9Lh62+aTK/7bfkMpjH2+gvaXif1YGAZPIXrGG8
 PQIswy6ptEpkdpNkmlRm0KljW5AZR3S9sBYb6VyIkxVsXYlSCHJHeVAKvcHNrgSGXiBY 5g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=By0GThBqG3jNGu5JEzNZwH3Wqe8VWO6XrfctnJrVDKU=;
 b=W+I/LaRu+ZQu95j4WAkE+T9W33XUnx+SNRcRRorQUcF0wylmMD/Lhj3I6a4Q/kfrsIS9
 Tin+5rEwiLnkp8NjpZLUCHAfcG3caH42mwqGnXtNlOF6fwVyLIejYhn5473VaayYsBNc
 F9Kl6xeMSbGwjBIWsaxzrGyFaYV/3x2JQLf9gzt3WKJ8EzeXPwR0HsT8V2CHnKELuPNM
 d/mBWo+7cvD20uH69xq1nVb06cEzsA+YNSbggCOPE+yU3MI3bDpkWdyaLAiqO3w/KoaD
 1iuNdb7Af7dyBXByz84rDvy0+rO3gEpzWG6u1F6Jt0t3mvN/h2szrP5/f9Zu9gi0cab2 qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axcw6d5ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 05:50:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1895UFjT008333;
 Thu, 9 Sep 2021 05:50:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3030.oracle.com with ESMTP id 3axcppqera-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 05:50:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNMThmCGFGZ56ZybIR6/uXjql8VuITYsJkY+6SNj15XVDBinJgQs2QlbdtU+HDqlz/ZaasLFQLrlzYrGMWVa4Sro3NAerqcNwK4qInBKJEX7R7Nl1YVBCo3waYryiUq26BnQIHj3uiuL6h1ZbCH9DzqOtHYpbCWil2uIKD77zH/mldoYXboNyrPa2//e6A2ONUCLZXbbUSrfs0pqddJiT+9mVWcHfh/TQ3XO58PaKBEiHdtUPzoNhwQQEl9DFVDNjWBo237H8C5hiARgUWRrayoaX43PuRhLbsgSYaiNTJSf/NNwuhrpNmmspEYxv44bXhCL4EmqHpBjjh8220kibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=By0GThBqG3jNGu5JEzNZwH3Wqe8VWO6XrfctnJrVDKU=;
 b=m8iiNe+98JWWmAh9lkIe/ejWBjAxWEy2grCZcJZfxeNEmz0YUTJjWxmiQoZk26nugHqzZdU3liGkfhWHZGSRRwdCSLIE4zXMA5ugqqQ/e5x+xxtFlEcwFdlCgjkol97CKdYlE9dtj+M9NVwR+4JBqNYBDFo3CBjc+cybLWhqhLDx5mKBM/EzDtbc8JFohPnXQ4gGeppUM0LaF9snKfVZLGuNk+Pb70axyrfVXVL1UMFyQZPyiQdTlXHzjQrh//x5T6Y2oGQYISVmF/ru4/m5Osejo/TR5p0mhPj2y9/MgWzB0qIIwkZjolS7BklXK3OYqU9/NyP1WgfHdJohSEOXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By0GThBqG3jNGu5JEzNZwH3Wqe8VWO6XrfctnJrVDKU=;
 b=MiZfgGe1ruVPEmNeAUFkqAkKzAfoGXDEdYaT9sLx1p8TaRyN4TcsyBgXYNqS1N8uufL3muBEjbj8dg7ov2BYe+1jaaBwpZEj5zxKHeFw6mpmHc9Srwe1YP5sTOTaupL/mW4xuh2TegPTW/4AKG2gqRyr80XRI6zI3gDR8t1fj6E=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR1001MB2240.namprd10.prod.outlook.com
 (2603:10b6:301:34::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 05:50:39 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 05:50:39 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 11/16] vfio-user: get and set IRQs
Thread-Topic: [PATCH RFC v2 11/16] vfio-user: get and set IRQs
Thread-Index: AQHXkr3H0sYJPS1yJkKn8ybBFRhnIKuY0K8AgAKHEAA=
Date: Thu, 9 Sep 2021 05:50:39 +0000
Message-ID: <A90BF938-BEF6-42DF-BF14-DE3BED7F1986@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <4d292fab645b18b8a20f0f5a83356ae7fc0efa28.1629131628.git.elena.ufimtseva@oracle.com>
 <YTeB4n1CkgutJJmA@stefanha-x1.localdomain>
In-Reply-To: <YTeB4n1CkgutJJmA@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef325a84-87ad-4d56-3a99-08d97355c0a9
x-ms-traffictypediagnostic: MWHPR1001MB2240:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB2240EF5FC3498F07D90A9820B6D59@MWHPR1001MB2240.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a3zrW0LLxfjshQae5cwuYj9Q/IwY/ETzAL/+pWj0JOQbl2ey46n8Mu9nHB4Yuk1+DVygscOTDAmHr5BZSje1+QpxfIJI61AefcpaiXkAp3V94Ms9icDaQC3ad/Lz5tJmju3NlQwVJobqDOkWM4UGtZ2txWRa3zRZM/AtrCaPLAQVrVbEEeKF1iX2pB3vwYkqkmeBJWJxnuENCNYeJ/OKkbr6pPzdvVFnkRZQw0G5oX137sIPPlbbnitzSRmaz7mFwVkshZJ+1JcGnlLLrUulbS6cjL9nIhVS851UvJHxxZ5WOb00EJ2AXw1FJXFnGbyowQRpK4L/y0TRZpezxOygtvjqa0sgsq7FrIUUKjFd2AZESDld9oAGj2piKV/ilTqx6SHTU75HxbiV2kKw8htMTCGFrnQczyNuvLZogBqn05J4IpW/o/6rk41xCsluOEIQ97s+lqx6+uJvvPyIStno7Ef84ezgGxNM+Gzyyf6KGmmuW/iZkn02N4/PVKMKyt9NUyqwhpwgXwZP1HgdSRXgTOljaUS0OaSv0UFDZRIpK1FE3VXmaAa00Hz2E7i98yoq1Y8dAc43+6hJocKVlv24qOUT7VHFeiUjgJINev9MGZ//UZ7W4J01XN+mC9MoSlXCyu3MCAs6VASBMot7xu//6pUn4ADBYCf3XfTSUmPCAW7MuWJ9nZ6WP7w+WAmnMMJGoACOx31JBEgxHG8b3/jcxPrLkiJjW+Sb+1Xj2N7IJxp8FDKAC2B642MlhLO1aV8/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(4326008)(36756003)(316002)(66556008)(66476007)(64756008)(8676002)(6486002)(71200400001)(83380400001)(86362001)(38070700005)(66946007)(76116006)(91956017)(2906002)(54906003)(122000001)(38100700002)(5660300002)(26005)(6512007)(8936002)(186003)(6916009)(2616005)(508600001)(53546011)(33656002)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0hrWEdSRThnMEV5ajRVRFY5Q3pDQ2N5bnNpdURhWGhYWTN1QlpQaHVpbUtE?=
 =?utf-8?B?eHFnWVhRV1YxQmp4YldBZmZnZmNGUUxkOFBOKzFiNDk4NEtEeHdrclJBNU9s?=
 =?utf-8?B?SnhtQ01NTUdnbGVBU29jbXIwRHl2Q3dMSjdTNUZUUWpTNGM4ZGNrTzZDUXFS?=
 =?utf-8?B?T2ZhR0FjM2ZUOFRrSFkzcGJKT1M2bW5HQXBHUzNjaWZnT1JHQ0ZRb3E0R3pa?=
 =?utf-8?B?M2l4UXViQjVDSTJZdUZQSUw4M0Q4WUc5aHFLRWNaenRBaWNOSWlwZE1VbndC?=
 =?utf-8?B?cEs1Y05tMU5DQnJsdFQyK3lON1NveVlXeldlcWp6YldMNFdTdHh3M2VuZ3NB?=
 =?utf-8?B?NTRJUTZJaWxSMG9tZ0Z4MEd5eU8zQTdaeVloVU8zQjhKNnArWHUwYTNoZ0xt?=
 =?utf-8?B?THVEcUVFL2E3Qmc0UkRYRkU0a09CS3IwejJvNmhwSnV0blVHU3dKY1Fndy9S?=
 =?utf-8?B?a0h3MTNUSU1EdjBZano0K1pjeUNUbmJ6R1FhT3VyZ0s5K3ppcFhCTCtVb2hu?=
 =?utf-8?B?SGJaVnRocWhLbm5RZ3VvYmpUU2N6NWtMSmN4VFJURGg3L3EremFLTDZnc1pw?=
 =?utf-8?B?bk44Vk1LWERJcGI3NHdBYlVmU3h6eW1pLzhHRmtXOUh6dmVzb3RPMTNjb2hu?=
 =?utf-8?B?d2ZDYUIyN0hhY1ZlOUxXZjdON1Vqb2R0MUFxNkR6ZWRGNWRzYlNHRnE5b29i?=
 =?utf-8?B?cDgrUFV6RzFtT29XQ3lBMDZnT0lsMVo2QVg4a1RIdi8rSmRoRE9Bcmo5d1hE?=
 =?utf-8?B?dWExKzhRamd6eEdhTWxQVWJMNVFlSGN6Sy9Fdml6QkdscllTNVVFT1NlS0Ux?=
 =?utf-8?B?dVZ4MjlZK3JpTGFNSDhoR1BTNVVpQ0dTQTA3WUMzb21vOURNZitjS1JMRGZy?=
 =?utf-8?B?ZEJOdzN6VWVhOUYzWkZodWhHMFQ5Rkx6U28vUFI4bFBmK1hxeTRxdUJBTFIw?=
 =?utf-8?B?NTFGNFMxQTlzYm5IOXk1OVZieWtsUGNYWHhmUTJ3V2tiQWg5VzNaNC8vb2ls?=
 =?utf-8?B?enRKU2FkaFU3UVI5aHdjbnNLalVsUHFzWmhRWWdFVEFlZHhYRzNPTlJnaElM?=
 =?utf-8?B?UE5EdjVqdHUrdzZFanFMSjdySHVkRm9HZ1RYNFRlQ0lQTVg0d1c3R2U3d2FQ?=
 =?utf-8?B?QnVtNW92V3djT1gzOFp2MmZsNUZobEc3Y1FJVXg1M3ExSXVpTU9Oenh3Qlc4?=
 =?utf-8?B?UmJUKzlDczR1YjdNM2N4a2Fzc0RqZ0JMQjNSQm9KT0pVQ0tnd3ZKTElWdmN6?=
 =?utf-8?B?bXd4MU5NaGZGUHp4SUpMLzJML1RyU3ZmOVVzcTJiOGlDblJvcUt0eDdTTU1h?=
 =?utf-8?B?c21WZkhSM3hxOVpNOGUxR2tXSG5FeUdGK0wwZjBsTUh4NDAyNlpybjh0RVRa?=
 =?utf-8?B?UFl5WVpqV2dGZlhydnRQMmxhUmcrTXZCQVYzWjZYWXNlSVBORCtYaFhwK2xZ?=
 =?utf-8?B?ZGZWdDJlVTVyQnlFc014ZGh1NmN0enNmVEwxZXpFZDlHUG1qRUR0eWc0eU0v?=
 =?utf-8?B?NU9tUGcyZ1FFd2ZXaFlpUzlMYkpzd2U1NVZjZVdoR3JNTE9oL3dJK0hBeE9o?=
 =?utf-8?B?cEh1UHhBWXhVbWp5V284a2plV3AvNU8xNnBKTzVPQWNid1lsNGFzenZDQmdV?=
 =?utf-8?B?cytDd3h3b2l1aks0M1hHeEpjY093VVpNWHhuUXF4Nm5BU1RWbklVQ1U4SUN3?=
 =?utf-8?B?V0ZLaFBjRXJXWUtYRnJnYnJ3YlZyd0djdTFOcWQ3Zk1ENFZOTmNLTEJZWDVz?=
 =?utf-8?Q?lCjvjk/8LmLBu9mzYJmnArwU/+PUPPZajrOAlYD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10C67D78816CFB4089CC4D7DC5EF6E27@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef325a84-87ad-4d56-3a99-08d97355c0a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 05:50:39.0276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEYbFhe6o9cqvkvwxFbXpewFpOD4cQbiDeKGXdbYuTWUrPMy85h7tRh1eHP16pY8jSkLlgNHM3wKtz6hFFVtSyvzYF8INngT0sDIiiFxVs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2240
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10101
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109090033
X-Proofpoint-GUID: wml3EG0_ZY2to_AydnkEivW4ful3Ku6R
X-Proofpoint-ORIG-GUID: wml3EG0_ZY2to_AydnkEivW4ful3Ku6R
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDcsIDIwMjEsIGF0IDg6MTQgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIEF1ZyAxNiwgMjAyMSBhdCAwOTo0
Mjo0NEFNIC0wNzAwLCBFbGVuYSBVZmltdHNldmEgd3JvdGU6DQo+PiBGcm9tOiBKb2huIEpvaG5z
b24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEVs
ZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+IC0t
LQ0KPj4gaHcvdmZpby91c2VyLXByb3RvY29sLmggfCAgMjUgKysrKysrKysrKw0KPj4gaHcvdmZp
by91c2VyLmggICAgICAgICAgfCAgIDIgKw0KPj4gaHcvdmZpby9jb21tb24uYyAgICAgICAgfCAg
MjYgKysrKysrKystLQ0KPj4gaHcvdmZpby9wY2kuYyAgICAgICAgICAgfCAgMzEgKysrKysrKysr
Ky0tDQo+PiBody92ZmlvL3VzZXIuYyAgICAgICAgICB8IDEwNiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+PiA1IGZpbGVzIGNoYW5nZWQsIDE4MSBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaHcvdmZpby91c2VyLXBy
b3RvY29sLmggYi9ody92ZmlvL3VzZXItcHJvdG9jb2wuaA0KPj4gaW5kZXggNTY5MDRjZjg3Mi4u
NTYxNGVmYTBhNCAxMDA2NDQNCj4+IC0tLSBhL2h3L3ZmaW8vdXNlci1wcm90b2NvbC5oDQo+PiAr
KysgYi9ody92ZmlvL3VzZXItcHJvdG9jb2wuaA0KPj4gQEAgLTEwOSw2ICsxMDksMzEgQEAgdHlw
ZWRlZiBzdHJ1Y3Qgew0KPj4gICAgIHVpbnQ2NF90IG9mZnNldDsNCj4+IH0gVkZJT1VzZXJSZWdp
b25JbmZvOw0KPj4gDQo+PiArLyoNCj4+ICsgKiBWRklPX1VTRVJfREVWSUNFX0dFVF9JUlFfSU5G
Tw0KPj4gKyAqIGltcG9ydGVkIGZyb20gc3RydWN0IHZmaW9faXJxX2luZm8NCj4+ICsgKi8NCj4+
ICt0eXBlZGVmIHN0cnVjdCB7DQo+PiArICAgIFZGSU9Vc2VySGRyIGhkcjsNCj4+ICsgICAgdWlu
dDMyX3QgYXJnc3o7DQo+PiArICAgIHVpbnQzMl90IGZsYWdzOw0KPj4gKyAgICB1aW50MzJfdCBp
bmRleDsNCj4+ICsgICAgdWludDMyX3QgY291bnQ7DQo+PiArfSBWRklPVXNlcklSUUluZm87DQo+
PiArDQo+PiArLyoNCj4+ICsgKiBWRklPX1VTRVJfREVWSUNFX1NFVF9JUlFTDQo+PiArICogaW1w
b3J0ZWQgZnJvbSBzdHJ1Y3QgdmZpb19pcnFfc2V0DQo+PiArICovDQo+PiArdHlwZWRlZiBzdHJ1
Y3Qgew0KPj4gKyAgICBWRklPVXNlckhkciBoZHI7DQo+PiArICAgIHVpbnQzMl90IGFyZ3N6Ow0K
Pj4gKyAgICB1aW50MzJfdCBmbGFnczsNCj4+ICsgICAgdWludDMyX3QgaW5kZXg7DQo+PiArICAg
IHVpbnQzMl90IHN0YXJ0Ow0KPj4gKyAgICB1aW50MzJfdCBjb3VudDsNCj4+ICt9IFZGSU9Vc2Vy
SVJRU2V0Ow0KPj4gKw0KPj4gLyoNCj4+ICAqIFZGSU9fVVNFUl9SRUdJT05fUkVBRA0KPj4gICog
VkZJT19VU0VSX1JFR0lPTl9XUklURQ0KPj4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8vdXNlci5oIGIv
aHcvdmZpby91c2VyLmgNCj4+IGluZGV4IDAyZjgzMmExNzMuLjI0OGFkODA5NDMgMTAwNjQ0DQo+
PiAtLS0gYS9ody92ZmlvL3VzZXIuaA0KPj4gKysrIGIvaHcvdmZpby91c2VyLmgNCj4+IEBAIC03
NCw2ICs3NCw4IEBAIGludCB2ZmlvX3VzZXJfdmFsaWRhdGVfdmVyc2lvbihWRklPRGV2aWNlICp2
YmFzZWRldiwgRXJyb3IgKiplcnJwKTsNCj4+IGludCB2ZmlvX3VzZXJfZ2V0X2luZm8oVkZJT0Rl
dmljZSAqdmJhc2VkZXYpOw0KPj4gaW50IHZmaW9fdXNlcl9nZXRfcmVnaW9uX2luZm8oVkZJT0Rl
dmljZSAqdmJhc2VkZXYsIGludCBpbmRleCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICppbmZvLCBWRklPVXNlckZEcyAqZmRzKTsNCj4+
ICtpbnQgdmZpb191c2VyX2dldF9pcnFfaW5mbyhWRklPRGV2aWNlICp2YmFzZWRldiwgc3RydWN0
IHZmaW9faXJxX2luZm8gKmluZm8pOw0KPj4gK2ludCB2ZmlvX3VzZXJfc2V0X2lycXMoVkZJT0Rl
dmljZSAqdmJhc2VkZXYsIHN0cnVjdCB2ZmlvX2lycV9zZXQgKmlycSk7DQo+PiBpbnQgdmZpb191
c2VyX3JlZ2lvbl9yZWFkKFZGSU9EZXZpY2UgKnZiYXNlZGV2LCB1aW50MzJfdCBpbmRleCwgdWlu
dDY0X3Qgb2Zmc2V0LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjb3Vu
dCwgdm9pZCAqZGF0YSk7DQo+PiBpbnQgdmZpb191c2VyX3JlZ2lvbl93cml0ZShWRklPRGV2aWNl
ICp2YmFzZWRldiwgdWludDMyX3QgaW5kZXgsDQo+PiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9jb21t
b24uYyBiL2h3L3ZmaW8vY29tbW9uLmMNCj4+IGluZGV4IGE4YjFlYTkzNTguLjlmZTNlMDVkYzYg
MTAwNjQ0DQo+PiAtLS0gYS9ody92ZmlvL2NvbW1vbi5jDQo+PiArKysgYi9ody92ZmlvL2NvbW1v
bi5jDQo+PiBAQCAtNzEsNyArNzEsMTEgQEAgdm9pZCB2ZmlvX2Rpc2FibGVfaXJxaW5kZXgoVkZJ
T0RldmljZSAqdmJhc2VkZXYsIGludCBpbmRleCkNCj4+ICAgICAgICAgLmNvdW50ID0gMCwNCj4+
ICAgICB9Ow0KPj4gDQo+PiAtICAgIGlvY3RsKHZiYXNlZGV2LT5mZCwgVkZJT19ERVZJQ0VfU0VU
X0lSUVMsICZpcnFfc2V0KTsNCj4+ICsgICAgaWYgKHZiYXNlZGV2LT5wcm94eSAhPSBOVUxMKSB7
DQo+PiArICAgICAgICB2ZmlvX3VzZXJfc2V0X2lycXModmJhc2VkZXYsICZpcnFfc2V0KTsNCj4+
ICsgICAgfSBlbHNlIHsNCj4+ICsgICAgICAgIGlvY3RsKHZiYXNlZGV2LT5mZCwgVkZJT19ERVZJ
Q0VfU0VUX0lSUVMsICZpcnFfc2V0KTsNCj4+ICsgICAgfQ0KPj4gfQ0KPj4gDQo+PiB2b2lkIHZm
aW9fdW5tYXNrX3NpbmdsZV9pcnFpbmRleChWRklPRGV2aWNlICp2YmFzZWRldiwgaW50IGluZGV4
KQ0KPj4gQEAgLTg0LDcgKzg4LDExIEBAIHZvaWQgdmZpb191bm1hc2tfc2luZ2xlX2lycWluZGV4
KFZGSU9EZXZpY2UgKnZiYXNlZGV2LCBpbnQgaW5kZXgpDQo+PiAgICAgICAgIC5jb3VudCA9IDEs
DQo+PiAgICAgfTsNCj4+IA0KPj4gLSAgICBpb2N0bCh2YmFzZWRldi0+ZmQsIFZGSU9fREVWSUNF
X1NFVF9JUlFTLCAmaXJxX3NldCk7DQo+PiArICAgIGlmICh2YmFzZWRldi0+cHJveHkgIT0gTlVM
TCkgew0KPj4gKyAgICAgICAgdmZpb191c2VyX3NldF9pcnFzKHZiYXNlZGV2LCAmaXJxX3NldCk7
DQo+PiArICAgIH0gZWxzZSB7DQo+PiArICAgICAgICBpb2N0bCh2YmFzZWRldi0+ZmQsIFZGSU9f
REVWSUNFX1NFVF9JUlFTLCAmaXJxX3NldCk7DQo+PiArICAgIH0NCj4+IH0NCj4+IA0KPj4gdm9p
ZCB2ZmlvX21hc2tfc2luZ2xlX2lycWluZGV4KFZGSU9EZXZpY2UgKnZiYXNlZGV2LCBpbnQgaW5k
ZXgpDQo+PiBAQCAtOTcsNyArMTA1LDExIEBAIHZvaWQgdmZpb19tYXNrX3NpbmdsZV9pcnFpbmRl
eChWRklPRGV2aWNlICp2YmFzZWRldiwgaW50IGluZGV4KQ0KPj4gICAgICAgICAuY291bnQgPSAx
LA0KPj4gICAgIH07DQo+PiANCj4+IC0gICAgaW9jdGwodmJhc2VkZXYtPmZkLCBWRklPX0RFVklD
RV9TRVRfSVJRUywgJmlycV9zZXQpOw0KPj4gKyAgICBpZiAodmJhc2VkZXYtPnByb3h5ICE9IE5V
TEwpIHsNCj4+ICsgICAgICAgIHZmaW9fdXNlcl9zZXRfaXJxcyh2YmFzZWRldiwgJmlycV9zZXQp
Ow0KPj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgaW9jdGwodmJhc2VkZXYtPmZkLCBWRklP
X0RFVklDRV9TRVRfSVJRUywgJmlycV9zZXQpOw0KPj4gKyAgICB9DQo+PiB9DQo+PiANCj4+IHN0
YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqYWN0aW9uX3RvX3N0cihpbnQgYWN0aW9uKQ0KPj4gQEAg
LTE3OCw4ICsxOTAsMTIgQEAgaW50IHZmaW9fc2V0X2lycV9zaWduYWxpbmcoVkZJT0RldmljZSAq
dmJhc2VkZXYsIGludCBpbmRleCwgaW50IHN1YmluZGV4LA0KPj4gICAgIHBmZCA9IChpbnQzMl90
ICopJmlycV9zZXQtPmRhdGE7DQo+PiAgICAgKnBmZCA9IGZkOw0KPj4gDQo+PiAtICAgIGlmIChp
b2N0bCh2YmFzZWRldi0+ZmQsIFZGSU9fREVWSUNFX1NFVF9JUlFTLCBpcnFfc2V0KSkgew0KPj4g
LSAgICAgICAgcmV0ID0gLWVycm5vOw0KPj4gKyAgICBpZiAodmJhc2VkZXYtPnByb3h5ICE9IE5V
TEwpIHsNCj4+ICsgICAgICAgIHJldCA9IHZmaW9fdXNlcl9zZXRfaXJxcyh2YmFzZWRldiwgaXJx
X3NldCk7DQo+PiArICAgIH0gZWxzZSB7DQo+PiArICAgICAgICBpZiAoaW9jdGwodmJhc2VkZXYt
PmZkLCBWRklPX0RFVklDRV9TRVRfSVJRUywgaXJxX3NldCkpIHsNCj4+ICsgICAgICAgICAgICBy
ZXQgPSAtZXJybm87DQo+PiArICAgICAgICB9DQo+PiAgICAgfQ0KPj4gICAgIGdfZnJlZShpcnFf
c2V0KTsNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8vcGNpLmMgYi9ody92ZmlvL3BjaS5j
DQo+PiBpbmRleCBlYTBkZjhiZTY1Li4yODJkZTZhMzBiIDEwMDY0NA0KPj4gLS0tIGEvaHcvdmZp
by9wY2kuYw0KPj4gKysrIGIvaHcvdmZpby9wY2kuYw0KPj4gQEAgLTQwMyw3ICs0MDMsMTEgQEAg
c3RhdGljIGludCB2ZmlvX2VuYWJsZV92ZWN0b3JzKFZGSU9QQ0lEZXZpY2UgKnZkZXYsIGJvb2wg
bXNpeCkNCj4+ICAgICAgICAgZmRzW2ldID0gZmQ7DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIHJl
dCA9IGlvY3RsKHZkZXYtPnZiYXNlZGV2LmZkLCBWRklPX0RFVklDRV9TRVRfSVJRUywgaXJxX3Nl
dCk7DQo+PiArICAgIGlmICh2ZGV2LT52YmFzZWRldi5wcm94eSAhPSBOVUxMKSB7DQo+PiArICAg
ICAgICByZXQgPSB2ZmlvX3VzZXJfc2V0X2lycXMoJnZkZXYtPnZiYXNlZGV2LCBpcnFfc2V0KTsN
Cj4+ICsgICAgfSBlbHNlIHsNCj4+ICsgICAgICAgIHJldCA9IGlvY3RsKHZkZXYtPnZiYXNlZGV2
LmZkLCBWRklPX0RFVklDRV9TRVRfSVJRUywgaXJxX3NldCk7DQo+PiArICAgIH0NCj4+IA0KPj4g
ICAgIGdfZnJlZShpcnFfc2V0KTsNCj4+IA0KPj4gQEAgLTI2NzUsNyArMjY3OSwxMyBAQCBzdGF0
aWMgdm9pZCB2ZmlvX3BvcHVsYXRlX2RldmljZShWRklPUENJRGV2aWNlICp2ZGV2LCBFcnJvciAq
KmVycnApDQo+PiANCj4+ICAgICBpcnFfaW5mby5pbmRleCA9IFZGSU9fUENJX0VSUl9JUlFfSU5E
RVg7DQo+PiANCj4+IC0gICAgcmV0ID0gaW9jdGwodmRldi0+dmJhc2VkZXYuZmQsIFZGSU9fREVW
SUNFX0dFVF9JUlFfSU5GTywgJmlycV9pbmZvKTsNCj4+ICsgICAgaWYgKHZiYXNlZGV2LT5wcm94
eSAhPSBOVUxMKSB7DQo+PiArICAgICAgICByZXQgPSB2ZmlvX3VzZXJfZ2V0X2lycV9pbmZvKHZi
YXNlZGV2LCAmaXJxX2luZm8pOw0KPj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgcmV0ID0g
aW9jdGwodmRldi0+dmJhc2VkZXYuZmQsIFZGSU9fREVWSUNFX0dFVF9JUlFfSU5GTywgJmlycV9p
bmZvKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKw0KPj4gICAgIGlmIChyZXQpIHsNCj4+ICAgICAg
ICAgLyogVGhpcyBjYW4gZmFpbCBmb3IgYW4gb2xkIGtlcm5lbCBvciBsZWdhY3kgUENJIGRldiAq
Lw0KPj4gICAgICAgICB0cmFjZV92ZmlvX3BvcHVsYXRlX2RldmljZV9nZXRfaXJxX2luZm9fZmFp
bHVyZShzdHJlcnJvcihlcnJubykpOw0KPj4gQEAgLTI3OTQsOCArMjgwNCwxNiBAQCBzdGF0aWMg
dm9pZCB2ZmlvX3JlZ2lzdGVyX3JlcV9ub3RpZmllcihWRklPUENJRGV2aWNlICp2ZGV2KQ0KPj4g
ICAgICAgICByZXR1cm47DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIGlmIChpb2N0bCh2ZGV2LT52
YmFzZWRldi5mZCwNCj4+IC0gICAgICAgICAgICAgIFZGSU9fREVWSUNFX0dFVF9JUlFfSU5GTywg
JmlycV9pbmZvKSA8IDAgfHwgaXJxX2luZm8uY291bnQgPCAxKSB7DQo+PiArICAgIGlmICh2ZGV2
LT52YmFzZWRldi5wcm94eSAhPSBOVUxMKSB7DQo+PiArICAgICAgICBpZiAodmZpb191c2VyX2dl
dF9pcnFfaW5mbygmdmRldi0+dmJhc2VkZXYsICZpcnFfaW5mbykgPCAwKSB7DQo+PiArICAgICAg
ICAgICAgcmV0dXJuOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAg
ICAgaWYgKGlvY3RsKHZkZXYtPnZiYXNlZGV2LmZkLCBWRklPX0RFVklDRV9HRVRfSVJRX0lORk8s
ICZpcnFfaW5mbykgPCAwKSB7DQo+PiArICAgICAgICAgICAgcmV0dXJuOw0KPj4gKyAgICAgICAg
fQ0KPj4gKyAgICB9DQo+PiArICAgIGlmIChpcnFfaW5mby5jb3VudCA8IDEpIHsNCj4+ICAgICAg
ICAgcmV0dXJuOw0KPj4gICAgIH0NCj4+IA0KPj4gQEAgLTM1NTcsNiArMzU3NSwxMSBAQCBzdGF0
aWMgdm9pZCB2ZmlvX3VzZXJfcGNpX3JlYWxpemUoUENJRGV2aWNlICpwZGV2LCBFcnJvciAqKmVy
cnApDQo+PiAgICAgICAgIH0NCj4+ICAgICB9DQo+PiANCj4+ICsgICAgdmZpb19yZWdpc3Rlcl9l
cnJfbm90aWZpZXIodmRldik7DQo+PiArICAgIHZmaW9fcmVnaXN0ZXJfcmVxX25vdGlmaWVyKHZk
ZXYpOw0KPj4gKw0KPj4gKyAgICByZXR1cm47DQo+PiArDQo+PiBvdXRfZGVyZWdpc3RlcjoNCj4+
ICAgICBwY2lfZGV2aWNlX3NldF9pbnR4X3JvdXRpbmdfbm90aWZpZXIoJnZkZXYtPnBkZXYsIE5V
TEwpOw0KPj4gICAgIGt2bV9pcnFjaGlwX3JlbW92ZV9jaGFuZ2Vfbm90aWZpZXIoJnZkZXYtPmly
cWNoaXBfY2hhbmdlX25vdGlmaWVyKTsNCj4+IGRpZmYgLS1naXQgYS9ody92ZmlvL3VzZXIuYyBi
L2h3L3ZmaW8vdXNlci5jDQo+PiBpbmRleCA4MzIzNWIyNDExLi5iNjhjYTEyNzlkIDEwMDY0NA0K
Pj4gLS0tIGEvaHcvdmZpby91c2VyLmMNCj4+ICsrKyBiL2h3L3ZmaW8vdXNlci5jDQo+PiBAQCAt
NzY4LDYgKzc2OCwxMTIgQEAgaW50IHZmaW9fdXNlcl9nZXRfcmVnaW9uX2luZm8oVkZJT0Rldmlj
ZSAqdmJhc2VkZXYsIGludCBpbmRleCwNCj4+ICAgICByZXR1cm4gMDsNCj4+IH0NCj4+IA0KPj4g
K2ludCB2ZmlvX3VzZXJfZ2V0X2lycV9pbmZvKFZGSU9EZXZpY2UgKnZiYXNlZGV2LCBzdHJ1Y3Qg
dmZpb19pcnFfaW5mbyAqaW5mbykNCj4+ICt7DQo+PiArICAgIFZGSU9Vc2VySVJRSW5mbyBtc2c7
DQo+PiArDQo+PiArICAgIG1lbXNldCgmbXNnLCAwLCBzaXplb2YobXNnKSk7DQo+PiArICAgIHZm
aW9fdXNlcl9yZXF1ZXN0X21zZygmbXNnLmhkciwgVkZJT19VU0VSX0RFVklDRV9HRVRfSVJRX0lO
Rk8sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YobXNnKSwgMCk7DQo+PiAr
ICAgIG1zZy5hcmdzeiA9IGluZm8tPmFyZ3N6Ow0KPj4gKyAgICBtc2cuaW5kZXggPSBpbmZvLT5p
bmRleDsNCj4+ICsNCj4+ICsgICAgdmZpb191c2VyX3NlbmRfcmVjdih2YmFzZWRldi0+cHJveHks
ICZtc2cuaGRyLCBOVUxMLCAwLCAwKTsNCj4+ICsgICAgaWYgKG1zZy5oZHIuZmxhZ3MgJiBWRklP
X1VTRVJfRVJST1IpIHsNCj4+ICsgICAgICAgIHJldHVybiAtbXNnLmhkci5lcnJvcl9yZXBseTsN
Cj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBtZW1jcHkoaW5mbywgJm1zZy5hcmdzeiwgc2l6ZW9m
KCppbmZvKSk7DQo+IA0KPiBTaG91bGQgdGhpcyBiZSBpbmZvLmNvdW50ID0gbXNnLmNvdW50IGlu
c3RlYWQ/IE5vdCBzdXJlIHdoeSBhcmdzeiBpcw0KPiB1c2VkIGhlcmUuDQoNCglJdOKAmXMgY29w
eWluZyB0aGUgZW50aXJlIHJldHVybmVkIHZmaW9faXJxX2luZm8gc3RydWN0LCB3aGljaCBzdGFy
dHMNCmF0ICZtc2cuYXJnc3ouDQoNCg0KPiANCj4gQWxzbywgSSBqdXN0IG5vdGljZWQgdGhlIGxh
Y2sgb2YgZW5kaWFubmVzcyBjb252ZXJzaW9uIGluIHRoaXMgcGF0Y2gNCj4gc2VyaWVzLiBUaGUg
c3BlYyBzYXlzIHZhbHVlcyBhcmUgbGl0dGxlLWVuZGlhbiBidXQgdGhlc2UgcGF0Y2hlcyBtb3N0
bHkNCj4gdXNlIGhvc3QtZW5kaWFuLiBEaWQgSSBtaXNzIHNvbWV0aGluZz8NCg0KDQoJSSBoYWQg
dGhvdWdodCB3ZSB3ZXJlIHVzaW5nIGhvc3QgZW5kaWFubmVzcyBmb3IgVU5JWCBzb2NrZXRzIGFu
ZA0Kd2VyZSBkZWZlcnJpbmcgdGhlIGNyb3NzIGVuZGlhbm5lc3MgaXNzdWUgdG8gd2hlbiB3ZSBz
dXBwb3J0IFRDUCwgYnV0IHRoZQ0Kc3BlYyBkb2VzIHNheSBhbGwgTEUuDQoNCgkJCQkJCQkJSkoN
Cg0KDQo=

