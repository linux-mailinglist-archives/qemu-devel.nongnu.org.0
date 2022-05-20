Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3B52ECEB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 15:15:20 +0200 (CEST)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns2TP-0006aE-3l
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 09:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1ns2Q5-0004u8-P2
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:11:55 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:14941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1ns2Q1-0001K2-Ve
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1653052310; x=1653657110; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YtPxsFfLIUHXhFD4fysF4EP1gZxJ6KJCkllUuYY6Tro=;
 b=di5tPyK1qP1AXY+TvxXGo1CnEwz552WAoxW7RQt5/gaf8ge/wserdY1G
 rth6p5eBwrGbygVdjze22iSus8ISfs2ELtHcINGaRAcPKtbm//pczTKEk
 /QJhOwIJiuGZUXDrviB4b5fRxHzYUOJR3J8Z1d5Zfsg+6sd/CNK+WikEI 4=;
Received: from mail-dm6nam08lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 13:10:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kin+WXR420Bq7qNgshr3KUpGWCzARFK0h47nzxDSolhrt2LZxjuTrDVfG+OQtKHYW/5m7oaxDH9c0gOkn2LZWgSCb6p7XBd6iWFxtYCvU4AqKBK66pIIJSwr7FFsmi7AnTYbcNChgFb+V+UpO2xrtysP0RhciEr5tV+zFeMBkP4LZIgAwvfyBa+iOSYqEA4of5SxGTvUIZmoXpL12F64TSa4OxsLKVvy601/FRH7wPC692HZ+jDVUx7CLvOD8DdOsucrIOqxN4vJ6vvEMV6AW4Bt8+770fvQgnhCYT9bvORYtcbj3ULIxuiRRbLxVu0bRoHLibclFT1vpgju+LE+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtPxsFfLIUHXhFD4fysF4EP1gZxJ6KJCkllUuYY6Tro=;
 b=OuGTIaRr9rv3NTtWSIXwD00BSoTclTNqG4b/Vr6feXSz7X+cSEKf7/Q0qmOGYUcypHuTxKf3zEZb4VZAscOfSSDis7Ds4ktyKchcPhvWhv85d7WnMBO8OJJR0d6vZImy/b+qnjswQ2AejzHmjuzkNjoAkq56eWhZzOkyt48nLmWyErCiNiayyIMqnN/2EuF1TyZC+L09EaHD8n/ggOlRuBpmnVZdQAPF8Fm+Ady/7Y97OvE22IQGxwgxFhsYe/ZUqn6FvVcYXyRWD+f8sd1gIb5OYyxGx5+I7R9wD2xwQWfIN+pdpX6sAEfj1nYMTklUVaqGsfS1XmvdiiJNl84rjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB4062.namprd02.prod.outlook.com (2603:10b6:805:30::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 13:10:31 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::40eb:1458:8e6c:68c3]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::40eb:1458:8e6c:68c3%7]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:10:31 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Subject: [PATCH] tests: Remove unused "wcount" from linux-test.c
Thread-Topic: [PATCH] tests: Remove unused "wcount" from linux-test.c
Thread-Index: AdhsSqReCQiW0XIpTEStdckuNm/cZA==
Date: Fri, 20 May 2022 13:10:31 +0000
Message-ID: <SN6PR02MB4205DA19E31A951F2B5A6C42B8D39@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a13d6eb7-804e-46b3-69de-08da3a621e2e
x-ms-traffictypediagnostic: SN6PR02MB4062:EE_
x-microsoft-antispam-prvs: <SN6PR02MB4062D130416286F65C167044B8D39@SN6PR02MB4062.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YzQw83dzHXuMYLSPY9aH2dcWcVNQ3TIiOrxrmNi0r+tCxXy36wHvkXTeIaJ4AYcTdV75Zv23Xk/tV6wSUMcFtltarcIxmIt+wePMnBDoA0/nWtbqGolr2HQF5lOXk5fkJfO75Jq37ngnv92bbAVL5Rfe/7NfgphPpuXOpr9UbcOcgKA8/OVXBUN7W5fLF4UWAFmgqvNGrRNjJcWlo5j0zdRcVlFKpieCnzl8+VPIiUNbDOr4g56Fo/LksXNBpN9v4kph93ZpVVRRmUXkOm969ImBinZu4ACLxvQEBIkgVpS5UQ5mRc6ljmWmKqcfvH7rApnuWETlIPR8CQNsPc+fwtw+yeXxdiEvcJgB5vU2gbHFT4t5jaSY38PNpwt0yOfA/UtQVTDzKhYLVbVaGKay4P0oUS6hpIwGCBmNC/JyyGKFLivj2LML+e1DnrU4RoE1tNJdU55+JJuSq6LtLe6cXAReMsYRyIUGRDR296KYV3GL16wWwXxCpQv3nBpYnBAV9TphXVZ75exCXHKM+MZIsg0IBDKt5Hs5U1hBfQp4d4oLGN/8fzQP1ubRzj6Zopai4rCtRZWhln9dHj1EJ9HJtFoAC9VXKJNTOxaqoraghe1tj1UbsYPb8/zhqRwixRA9gRSiCQM8YtuBbN8M8VfgbX3uNxjLHGhYbjGwuBt+dozEe7lZuJtp01+0u9y73HYHsYr8M8Pc2eKA2v2EAeSpRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(55016003)(2906002)(83380400001)(38070700005)(186003)(26005)(33656002)(6506007)(38100700002)(9686003)(52536014)(71200400001)(122000001)(76116006)(86362001)(110136005)(64756008)(8676002)(66446008)(66476007)(66556008)(316002)(8936002)(5660300002)(4744005)(508600001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+PIB3A484LB67UusE3Dpt//cj/K1Y9k9u+o3LS73F5cn7rxKhqGvg2UTEq?=
 =?iso-8859-1?Q?Ixwnvuui0j7x8cQBBV04xKajO4jAlJ4/e2UvrZm1BqikY0IdiIAIl3EnX3?=
 =?iso-8859-1?Q?azONJsWh1JWb7/pQSPL7APSiO6lV3EvxObw72pLOfPwFHTiIQ5QY7BJEz/?=
 =?iso-8859-1?Q?4IlaVa9NDPtYWcEr2CxLa1GcOf1W+pUoxyG64foG64nmgR369zpu7NIsHi?=
 =?iso-8859-1?Q?xVoorn/0uueAqHtb3xnExmnm/7m2P4tANwjFkdpUjw6nm3p2c1WD/XHcTS?=
 =?iso-8859-1?Q?KucD1VOqwi+KjqMPzw0HfB8mRqCeJX/G76zP59Gcd0m1XI2Klonj9lorQT?=
 =?iso-8859-1?Q?/aBjrRmt2oEZJL+j7zwnmr1Vvpdt4FBqUop8/ohhCgjBdlWpKHZ23xVUuo?=
 =?iso-8859-1?Q?O7q7k2AETpobG9XclsDrbSS0vOTEoxTXFKDR2qDsCZaBcL8gh/DQCgrz96?=
 =?iso-8859-1?Q?4TT1A3rEwiEx7OA4Z0K1N7xhoMhsZSKlIJMcGYG8eh5LtoRVNJGigGSZLP?=
 =?iso-8859-1?Q?fRXnbYDphBmoN4MokML6yzi5aJSXcjJcqEQUkXN0Y8gU3RHcNVX73p5MvX?=
 =?iso-8859-1?Q?14UJLx9TMqlYe5v4+agTw0jOn2jU/cUUs5ECC826E0sTxVg3a7JaiQmyyM?=
 =?iso-8859-1?Q?4/5QSDl4RvC4iXUT9bptzV6I5ubPdsCVvOITJHtohtMSgOjAD4B57joX3p?=
 =?iso-8859-1?Q?e5nyjxO0COfw4J7SC1VBs8zWed4/xqO+V34tczXVL6AFjmXvl51VSIH63S?=
 =?iso-8859-1?Q?f9zripFjuxepcMhXXE8FN9fJ8FomGxS6ZMvJCGUNvv+7WtQFa/VY4vFhpu?=
 =?iso-8859-1?Q?J9Zf+H0ZpN4Rz4Yu/4rdb4byGVnl/omnGqwFBPeJZKpijoPNMti9kBmPWS?=
 =?iso-8859-1?Q?6ZN9oNFf7nCMBTnyDSycXtOOr4XfRUMLxq1JgrkaKFE/WIC28PUwe6BvQ2?=
 =?iso-8859-1?Q?b2kktEn0zzirVs4mU1lv/DoGp5ubV0NovqVzoDO41NNjraKxfDntVvZnDM?=
 =?iso-8859-1?Q?WttAXGscZ/JGAyuxVfPRXJNn4VQani2T4eBPBLfL0L2EUNVo4JTz/35gpL?=
 =?iso-8859-1?Q?vJp7g4NExoS34YoupET7tqvoXGSmA1SCpI13io4TZq80nahb5K/foy7IdR?=
 =?iso-8859-1?Q?d7fIaR8Vfw3lMwdwlodYlfK116auedkwkoHtgLcjjwbU2600/9Y4R2LVBt?=
 =?iso-8859-1?Q?oP6dzagIzxqvisv4QHd0kbYNa52PxzWsk16E14vUniva7rvUMCTP1sQ8mf?=
 =?iso-8859-1?Q?id7uW3LFoSza78WD2NT2y85DF9Lhacpm/FnmQYZP2a4DuRTN71SB/Lz/5Z?=
 =?iso-8859-1?Q?VcWXqrx38LfOeX+LnE494cbTBTAhgvVOK2D+WQtKaECwUWHLcVp6yvAIv8?=
 =?iso-8859-1?Q?sOh4ZpsLExNAjhHcaxk342+BwzipWwLreKm2Vi6d2owp14uo1x21N4Rhzy?=
 =?iso-8859-1?Q?fiPUcoI21GKO5hBicqXre73f/Ms1bLUah7Bqc2LYq6q5nfPOfXhIMY6tyY?=
 =?iso-8859-1?Q?IMYZE7+9Ia/PEFBxXRBzuWscf50OJoye4fIXw7F/AJIRMAVQuMa147BTjm?=
 =?iso-8859-1?Q?2nR9/QB1hclZeKrVU3q73amTAaRDGHPNin9jwQI0mU8VssNf6XJQGjzfSy?=
 =?iso-8859-1?Q?N3MSvC5E35ClYRN9XG7p6Zn0EeMYnzfwiBVohDo66fY13BJiZ5lGA1XGdC?=
 =?iso-8859-1?Q?xg3GEfsmQnN2qURGyeTPzWgdmLkZgBA82ZeQvAE03YdiyNyHvYfodpb0S4?=
 =?iso-8859-1?Q?2Xod1eivxsf4UXtiURnNMx4XN9Zi/KJtzadDVzeaGLztSd0UoxEu18574r?=
 =?iso-8859-1?Q?eJv47Awy1A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13d6eb7-804e-46b3-69de-08da3a621e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 13:10:31.3285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6S1RDHJVk7PPgwHbcK2gJZUd6mgc1WEd1TwiuOnd9yKjGj6nWuwPjy0rJjHOEDN9mfv4FtL51+kZY38NEFVnoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4062
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clang reports this variable as 'set but not used'.

Signed-off-by: Brian Cain <bcain@quicinc.com>=09
---
 tests/tcg/multiarch/linux/linux-test.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/l=
inux/linux-test.c
index 019d8175ca..d5781bb476 100644
--- a/tests/tcg/multiarch/linux/linux-test.c
+++ b/tests/tcg/multiarch/linux/linux-test.c
@@ -332,12 +332,11 @@ static void test_pipe(void)
     fd_set rfds, wfds;
     int fds[2], fd_max, ret;
     uint8_t ch;
-    int wcount, rcount;
+    int rcount;
=20
     chk_error(pipe(fds));
     chk_error(fcntl(fds[0], F_SETFL, O_NONBLOCK));
     chk_error(fcntl(fds[1], F_SETFL, O_NONBLOCK));
-    wcount =3D 0;
     rcount =3D 0;
     for(;;) {
         FD_ZERO(&rfds);
@@ -360,7 +359,6 @@ static void test_pipe(void)
             if (FD_ISSET(fds[1], &wfds)) {
                 ch =3D 'a';
                 chk_error(write(fds[1], &ch, 1));
-                wcount++;
             }
         }
     }
--=20
2.35.3


