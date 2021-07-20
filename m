Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81D3D0295
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:17:19 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wB4-0002vU-AB
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5vwt-0003Lp-Hj
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:02:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5vwr-0004nJ-AL
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:02:39 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KK0ccC018054; Tue, 20 Jul 2021 20:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=s/RGFaoehV6MBSzTXBYNIbClVqdvia55QcCW8eWteok=;
 b=CboClK6VCFVdltvH/YSDHrWWoYBKeRJq1lE0dIM4mxJqgs2eHkJwT7fFnAi0DT9Bb4ts
 eTgFmPcgeYBeoX0CI3cnegyX5EBBl8N5IbaEdFAXFYibq2iQFHuoNZRG5vxN9OVZKhxD
 HHUciJIsrvOrwaSQ1Hl9UNexoMrme0iUFRjXbf3c4xojaCFUYpUPzeQYPyELSX05f7mz
 uTHEErqWV5QI/aBV2SA8Ej7h7EzsxzRJ1G5JPgWLf0arLp1jA1OtYJ7/sRgYxf1gEmPS
 3w29u4WdOk4LmUZTNRmPJJrD88d9aBkOYBz3Lt3clJhV7ZxGaJ17T2PIfdbf3JW5gV2J CA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=s/RGFaoehV6MBSzTXBYNIbClVqdvia55QcCW8eWteok=;
 b=0KkA2Q6plarNGj+2jmtV42doUdZMUT7vqICBZLyQvRhzbGdHXrdHORGwIS+NZjeX41bJ
 9B+08sBkTT9cnzKWkszg+21YolEyTNPO5n9SJNZu0umLNHU7VbepKliyZgiKlxPsHv2k
 E28rQUkz1pnSZoTSjIUJaTH7vbUjMA3YyeIQ9XiSYBEPofl6skunx/4EgmQ+OH4kHl0v
 CdP177wDRc6Aq1xOr+vUkjRypoYlPSy6uhicWV9oS7k4WsJxem9DWbBeZxaf7M7gKk5c
 8WETFF+zWVK2OvWW+L08W46Rj1lmqs33WFXbFL7kqxunicXDRmpDoeb0sDvycCq6SySg fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr899kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 20:02:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16KK1VqV047715;
 Tue, 20 Jul 2021 20:02:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by aserp3030.oracle.com with ESMTP id 39wunjdnfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 20:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y23BHeb7HLe4V0iD7gDNwDe1l3HUmXtTer8bEDiOS/T2eha1x0UoP5hAdtLCMNB5w1ViZbh3ymmO4I1I1zuFefo6rzdCgCXUAJMNorI2tfrJM63WMKoQo0jl9xq6mOJeGOICk9M4kdGaHwUdDdZr0tCnD6AApipTaT5wMExGChwhumhWS54/ofaKSHto/D61289YNwia+QXwVoxFYZ0vuKuwJO2sBFea2pnT+y6VZw3q7qqZMuC6YUcO5/TfoPoVzbS94tF3IxnyxGQ53DO1yVujdVdDym8OKWf+370dLCd3IUl2WMIT1jG1L7amJSNtBkxjsSlUYdNT0Uk/Ax+W6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/RGFaoehV6MBSzTXBYNIbClVqdvia55QcCW8eWteok=;
 b=JWJSshIiG/I4+8cOoG3wi8zD/U3yvv7eaymhnwORa46UZZBbfEJNz5MLfngoOxRsXTKfC7plJNhfGmcOqeOIIy9WRg35a5V3HWW8TbjE7aR9MM0asNYzj3Zv29JIOy4QHGGLHpUcXww6rk7F456XFpZOFXW/wZXcmkEbrsSJu+K4kkjsayQRUBxXWLBjysApQ34xLgEE2KamB6S3AWi8kp7V5kflma21OqNOJtiSHde/2m+CNag5aAmS5RlMnf49XBOgqkG5FBbbE3qKGF9hb6dd+AV3wDVEYhBnO6kkpB9rI/aYEkOdIkEpFw4ec92KZqmDWb6J5+1jkCocpVv6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/RGFaoehV6MBSzTXBYNIbClVqdvia55QcCW8eWteok=;
 b=EsiCpQr8WNq4RtBxRNz2erv+OhgPxRt2zdAwbhvZ2p2X4SFnBY1kcRONaQFowBVmwtXM9cLUmUkEMroq0oMGNGef/nbW8kb5YLq4bEDMK6XF7/qNUrpxPmCkmNCzWyLJFgym22yvB3iDW8C2cebzk4olEZoSubVl/bliPX0Z67Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3901.namprd10.prod.outlook.com (2603:10b6:208:1b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 20:02:27 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 20:02:27 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 04/16] multi-process: Fix pci_proxy_dev_realize() error
 handling
Thread-Topic: [PATCH 04/16] multi-process: Fix pci_proxy_dev_realize() error
 handling
Thread-Index: AQHXfWZciZKC9y7LIE2519/hJ8HL36tMSYaA
Date: Tue, 20 Jul 2021 20:02:27 +0000
Message-ID: <5DC30ADF-4C3F-40FB-9FE8-AA28EB72B30E@oracle.com>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-5-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-5-armbru@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c3711fc-ded1-46c2-4d1e-08d94bb94ca9
x-ms-traffictypediagnostic: MN2PR10MB3901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB3901C2C282F2677A3AA480D190E29@MN2PR10MB3901.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kcgq8gxjHCxQ07c/ppHQk99/FzNwvxP5HByvRkmU9+IS7vRgDzPr4JmiwKlq3bQCzCXuX81FXWXevd+UMwKxdwgWX1cmBirL5eUZrJFfi8x+oZeG8C7tIEBnjiaeN8OsjNhiGRqTO08zWkCPEbAfBw0CdCU4TNAis6kGLjzffWtmhBbnddweR3lzC65+3Hqqj4fcrx1sayyZb3olqCm8kTwm5px3BbOmQ2AtcpGjEW32M3adE0uq0uufG7eWDQCFMtKLkn9gJA+LtLOUlshXV1EuHLPrYtJrfMEL4ZiZzn9WTLS3axuqWa2Q1Zhx/scAEk5xk4o5lH/xOzIZavz0FTBDoC6ioKPya/GovN4byWpnSpzdXJwFe+3DGDpraE5XTQNmlnZJjBk0NJUAgXRL+oc51lPW7pkbUaGAlU+MQUF97qY/tRY8b8y/6TaCUKj+aQfjvPUZIUvFAhe5zLn31N+kkWSmYZ05hAS0DZUoJUzimX5QBvMLEyTrD/v/AEl6LRUrWNkRlf+5Oq9uMYGPABw12vs9KTgwzY7DQpZb3fh7iCMX1eiEjNDAy7MiGckZzed8EtshRBT1A/7cN4OhDU2RfSZR9m0jRtkuadH58MMpQRrBz902LCUagtbRmzb14aXBhzx/EVTIelbdyMQAGI7cUY3dceHzmZiaMfAAn4jFJPWkDYXvcuZ5JWsluVyXBxIrKiUQpdTGxjQ7Nnks3VG4KlQNLrHJY6msUJyMyjk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(66446008)(66476007)(6916009)(508600001)(26005)(54906003)(6486002)(8676002)(6506007)(66946007)(66556008)(8936002)(76116006)(38100700002)(44832011)(64756008)(4744005)(36756003)(33656002)(86362001)(83380400001)(316002)(122000001)(2616005)(2906002)(53546011)(5660300002)(71200400001)(186003)(6512007)(45980500001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0xQXSmd/JlIUK2S7BuCK2oXL9JvyGZ6dc6fSqDA0VyOu2/FeqRwhG9oAP+rN?=
 =?us-ascii?Q?QqWjBc9zlkERmxU2XUHnrA9Bp3P3wr+86wr2BmmPC+yyYZLEdruaB2KJR0WF?=
 =?us-ascii?Q?TgJ59Z/hlMOC9iVAwEyodEEZ6pF03KSkVsXio9t2U3OpRNsmrItyRseSTOtC?=
 =?us-ascii?Q?8uArt1kFqb1HGqoR1U/7tL8eeKckQUP1U/zdIrKPs9GCQYf7X3TMZYDRuvm+?=
 =?us-ascii?Q?VHVMYd6XtqzpDpxQvP1rf8LsTLaIfONnMbSOz0p0mAqs7c8ndoh/0dNXv+Yy?=
 =?us-ascii?Q?w4dGUtL5eYbW5zseh8X0BqFG5tpN25xfO3fdGJMnjByTfVqog2hT8ful9FMB?=
 =?us-ascii?Q?wpAzVxttaumHw95Fqygo0boh0od7IaNvRxrj1Q2HXiQmZpgDer1SMRN7gCmp?=
 =?us-ascii?Q?Ydo2pH4zmlk+vTCTdwK6fw7Jzwat4waeENisSxIVRKr1smZWupXjcroTv9KE?=
 =?us-ascii?Q?NlAMvj7D3F5ejF4rXF+pOZHGqyWqT2Rm0ZbHZgNLVdlTTVcWMtdUssM+8M0r?=
 =?us-ascii?Q?p5LtqqkczYKXQfLknaLBWKC+q2pYunoDPmoCU9t5s35R0cdESZc4q9fqxnqu?=
 =?us-ascii?Q?iwpC3evhnvNgqv05G+UvXjUL6OEHbT5L7KjYMxm2tU8uQ4+CrHvc6T8X8eq7?=
 =?us-ascii?Q?45M/p6ZmQwToa8jEV65sUWfQtG6d6Hm3uKqRLxum/ndWHYLj30dOdHmPzWwi?=
 =?us-ascii?Q?pEGsi/EZEcptco1Ob1Pb7EXl3hxHts553FjhjOdPoGifW8A08updFOgXOl8Y?=
 =?us-ascii?Q?4hJx9gx6LkMkaHY1qwKgMabexMvyYfShMkvxYG7DONEu16luCb4yFH9Q40oa?=
 =?us-ascii?Q?QDzFAfLX5eRzGYI0WkqhfIzm1g8ZYPs5VcnDzahuu03vMQ0thn05BhcZ+Snw?=
 =?us-ascii?Q?C/ffNaKQYFbEeEdlSGrP9R1qN3JF6BOHjmFVQrKBNk5h5JUz43ACevfcsYNZ?=
 =?us-ascii?Q?ANP4+s1f9dEZDG5V7v0AZ83euQUYnbLhgOQxq4KbnA2Ntxu5owzEEATgwM76?=
 =?us-ascii?Q?2e4vs5e4d/uf75U0JJ2q6hb7od0fzRFaSBgioCCp9rquBxXSHnFYTvOga/48?=
 =?us-ascii?Q?X3WjmzjvLAG3k90WBQ5jbZwMx/hi9FhaWk8d0r7UqlDtt3knHE8F2Sbcgtjb?=
 =?us-ascii?Q?a14v7RcwmbuQgRMGEpHiNwQaZeubrgiWsDuqYhY1WusYfF1FMxHH4Zsl6txG?=
 =?us-ascii?Q?NJcjJNsIu7dwgIkQ5PdWgJb8g8RCPlekgbzGPXRDhg3BABBvV+EdMJX4643G?=
 =?us-ascii?Q?Y0aQzdkjITAFr07b/9IXcVDhD8MhM/WL8RLvL4+cjEdhQu6aWsloMHasMSSA?=
 =?us-ascii?Q?4faj83G+NACbe695xPalMsWA?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27DABCAAB234F1499B19CD7DE9DA7B09@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3711fc-ded1-46c2-4d1e-08d94bb94ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 20:02:27.5173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aEveHg6FTPZoFWOvXKH1duVAoKiLXPKsJJz50HJDmMefC2cjhNwEvbZbKPTZyO0iyknTvVepsozGoXdacdOPQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3901
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10051
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200127
X-Proofpoint-GUID: RKwjAtCnHtNMKN4OQyMDyhgXpM3Q4svX
X-Proofpoint-ORIG-GUID: RKwjAtCnHtNMKN4OQyMDyhgXpM3Q4svX
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 John Johnson <john.g.johnson@oracle.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 20, 2021, at 8:53 AM, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
>=20
> pci_proxy_dev_realize() is wrong that way: it passes @errp to
> qio_channel_new_fd() without checking for failure.  If it runs into
> another failure, it trips error_setv()'s assertion.
>=20
> Fix it to check for failure properly.
>=20
> Fixes: 9f8112073aad8e485ac012ee18809457ab7f23a6
> Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Cc: Jagannathan Raman <jag.raman@oracle.com>
> Cc: John G Johnson <john.g.johnson@oracle.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> hw/remote/proxy.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)

Acked-by: Jagannathan Raman <jag.raman@oracle.com>

