Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084084361EB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:39:47 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXMI-0002Uo-4q
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1mdXKQ-0001ne-Vn
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:37:51 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:37020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1mdXKO-0005AH-Dp
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1634819868; x=1635424668; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=4CJXMJeoH6Tt3HtTubfmpNbphuFE407ZMksDOlAfW9k=;
 b=I18tdNanqAvrIMzrRlF5sEfybzj5CZjSwMOcl+kmpo9bLWJyAMNx9kqf
 BCyUPxXt/qqZmR996bHMPVldZJcWDqTV6+P5AyZ3QglKNDv3KwdPYU9f3
 eKtsWxDk5v25Os0pFaBmAHxPej75jcB/VNjmNykqj8gTq/3OSjIHK/cd8 4=;
Received: from mail-dm6nam08lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 12:37:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wddh5rNe8xOTuzjPFgyPvCdPoY50LLXf5MRJdcb0zcv3S75MXQMd7i8sSiBuoMJB1RGjq27LUJZMROoPVR6ZpsuJdxPwb5jXCrJH+evjm4x26yNsK36Fy0sheRWSkoyyIwLB2miUFkcqpy9V1aYMf9ltI7e6CbBDmjHruz0/hBUrh9otnF1GA54iAiKApTwR6Gfs6qWouevlxCyLF4teV7QQooILRDOv/AZ4jQEJF28d7IGHHWJSytbrniv+k8H4GSSJuTNW34L/u9p4se+UW9YBLrGJOqD6RErQp9coYwccg1W5YNXp5IWu+Cav//k4MZ5ExqVpreV90q/mBwzK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CJXMJeoH6Tt3HtTubfmpNbphuFE407ZMksDOlAfW9k=;
 b=fgp1zGUm38atKn5dOBbqn+3e+Y40e2ub9KU7wAe7BKhC9+JVXxKP9SL4jo1i0sltee6+PHl3BjCZZ66pLfbx5M9t65Je3v/hmqQ/lKFXKfVSQh7zlGux0u/vS5f7abbyzQ06evfac23IuxZlAQE5dUAdptTn03wNIDC/rUQxKyXN0sVifO5a2g48336JyFJaaxTYUkd1OaNSTV7gG1shbQ46XYRAODYQ+eUKIxSEhZaI6FfMk/Y2I5GLpIBBx60ZnxNZGVz2f7FTC8a3TLYHnCV1dkMZZVTHC220s2Vfm8UI3Vrgth1AFML+HU/uCRsSmFZWOsMNEdTzxQmt4WI/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by BYAPR02MB3960.namprd02.prod.outlook.com (2603:10b6:a02:f5::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Thu, 21 Oct
 2021 12:37:43 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::79ff:3c56:b126:c38d]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::79ff:3c56:b126:c38d%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 12:37:43 +0000
From: Sid Manning <sidneym@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [gdbstub] redirecting qemu console output to a debugger
Thread-Topic: [gdbstub] redirecting qemu console output to a debugger
Thread-Index: AdfGeE+KTuTisnOCS8GEQmT9UiiYUw==
Date: Thu, 21 Oct 2021 12:37:42 +0000
Message-ID: <BYAPR02MB550976DDDA818CEB090B41C5BEBF9@BYAPR02MB5509.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc2d558c-5e5b-4e6c-a1cc-08d9948f93e9
x-ms-traffictypediagnostic: BYAPR02MB3960:
x-microsoft-antispam-prvs: <BYAPR02MB3960C3C83221DDB79B01FFF2BEBF9@BYAPR02MB3960.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X2iOs0UcfmmMSCc3qunynj6JpJA9MAPl5vst9pqNfgrxjRvQZeBNub1HfQNdswbzX3KJD5BjUKSdMLS9uQu40nGoQeaJeq2J2Bjju7qoS7V1G0iIkfkXM275MZsiVrRCSp9fkWxKUf+H4U+wz/C6b+5cgsgXASo57meVcm8PSLJv3Abb77CRjG7KSAs6ujHPh2OnclG4w6Oztbf15AM8o6U8eCl25X1suG8CZi4tyDrhYCQsVDR3Vhsqd9DPwBnv/gUIvn7AvTa8ct6B5LUCHqB6Jb1H1ZROgcd3V1Qzx1RjmsJHIlpLwTJGWKl6oD3PKnymPt4wntm4AUYXHZG+t4bIUI/aZziRJgQW17E1lm2R5YngGXr0NclTH9gwpqVJNOoNLO/+ejs/TR8p8h9tujI6emMkEI9S2cdWZpEPZv/eQfJT6vrB59B7PztlylH3vYCpWAOcYSl9kN1crvGmOHHqnJlWVN82U0qv7Scq9/y5gUSb29Bgndv13MoOZ877Ni6NbD/f37YpvPo+FjFj3cFUcELNOYrLj+rsOhBl2Tke3D5uBmpRjfKGh8QjcoYOFeqJK+zoKIAPfkGvwq940AQi6u0gHWRyOlbnqOkhQTyr2DBBl/PeR0g/KFSYyrkskKRlWZ9FeJ3tvIJFThozX364FSM1oyQSert4j/j4fYeQdby6liqTPHN1SOE8hb9ARzQslpIppUz4ExMt61adNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(2906002)(9686003)(38070700005)(6506007)(6916009)(8676002)(38100700002)(4744005)(316002)(71200400001)(66476007)(5660300002)(66946007)(186003)(26005)(83380400001)(508600001)(7696005)(52536014)(122000001)(33656002)(66446008)(64756008)(76116006)(8936002)(66556008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D8gpCZ/j0oDsRD79VGh9QGJX0IraReJi6z17abAr1yMvBAoRt7VXOOnEd8C8?=
 =?us-ascii?Q?c/EqDBKes0I204QU+Lbfuasqzd/FYHirPgTnZpuWnVOJ4KN+9zV+OxITHbnN?=
 =?us-ascii?Q?pY0E0BLn98raPPcOjraIkQ3O0bi42rF55aA62dTYJ0FB9VFiiYRPQSKwK6Mp?=
 =?us-ascii?Q?NlJ2UNALrCVpeHoliyhf9g9d444H0gPoJ3h1iBIDJSEfIKEHe2lY7XA9n3bV?=
 =?us-ascii?Q?EeXfMu2cTkBiulvsa70rsrfyU6yHUBqnoF/fb0LpGzHe95lPMtubeshMVT35?=
 =?us-ascii?Q?mAUgYBbRMR0zaP1mOemriVWbPn6UGvK77qZXbHh8EhJIWN6qjEIPwVAj5z6O?=
 =?us-ascii?Q?mKKTllIBH2njI4Rfj/fmZw2wrxRdsWuonAiV8bAWvYV8l89CcxUp3ICTZEjK?=
 =?us-ascii?Q?/mlA0lmc7i4r6JGkcQGIgsQX9EnRePF5B9FoLnfs3XMebxlwP0b9wmF2s9Xg?=
 =?us-ascii?Q?EjU49cpI8D+j8iPH55VxW/C34u5SREMjZKRZjPLrRZZ8CbFZGCaFJsk1gzRw?=
 =?us-ascii?Q?8pF35pFNuem3Ow6PYMP2Kaz2UevF5ibmTRglGcduACJxYZzjgn2FwE//BH8m?=
 =?us-ascii?Q?gCdR9tb3qc/f1YygH79szZmnq7Hh98oOHrD1zweWFQ8Z6gJMkXMjaa4o+Cps?=
 =?us-ascii?Q?1tlu8eHDeM8h+0R03ZWnM16pK7KAMwnAONcT5k5PJGieHq119Yso1+hnpmhX?=
 =?us-ascii?Q?pCXkwm4l4mC52i1Afp4K255PvvyxSUTAEn34yJenbP34zHx4OoU+7r6bBESw?=
 =?us-ascii?Q?SM0yWb5QqW1fIqI6wkCg4ugolmWNhYo9EyULI2ruACxnmbHC59IoXo6TrV1B?=
 =?us-ascii?Q?Nvv+CS6avC+XV2RgCrGmpFLWvg8YSOp0ou1xKVfMcZYTXRtP5wrDf4dHVZ9L?=
 =?us-ascii?Q?f3k2IznEkkx9nTYJa0QM40ItdIOqcuAo8sh/yU+RvZ0jgg1eVX1bjzxAITJ1?=
 =?us-ascii?Q?Brk0pJFuGHcSkpzW1Wk03IXAsiwja0s/MhcrWsrwKYFfMe5pHwvpYegvJLBh?=
 =?us-ascii?Q?PoUbYlGI9no2PkGiwXi2PNtRrXeTWwCctJgpFUE0E1+wTQDOcGanrNM7F3be?=
 =?us-ascii?Q?6OnLTaP/DYX8eQS3e8S0ynJOmP+5dztSA0I2e3OV1BgaYIfkZ7WflSFF3KWR?=
 =?us-ascii?Q?bPulKUWJNY/Ki301lsTdCwgC8ZWt8AI1hX+cA3eI1ZV/3plXxRmRX3pLckMv?=
 =?us-ascii?Q?eEYAvCFE5A+j/7qx+G7LuTVn1gw8tS1RQodvSsJXZjte7wbct0qATOlWa7OM?=
 =?us-ascii?Q?pAjdxA3xNP98JtUXQ2HUoK9wN8qiLWdaY9bnrrGXh5Bik2a1wS+2hMjXlpKF?=
 =?us-ascii?Q?QogslWe+5G/a4zJ0sKbb4S0f?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2d558c-5e5b-4e6c-a1cc-08d9948f93e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 12:37:42.9694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sidneym@quicinc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB3960
Received-SPF: pass client-ip=216.71.140.77; envelope-from=sidneym@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

Currently when I attach a debugger (lldb) to my qemu session all of the out=
put goes to the shell running qemu not to the debugger.  Fixing this meant =
that I needed to point the semi-hosting output to the gdb chardev.  I start=
ed qemu like this:

-s -S -semihosting-config target=3Dauto,chardev=3Dch0 -chardev gdb,id=3Dch0

But this failed with the error:
-chardev gdb,id=3Dch0: 'gdb' is not a valid char driver name

In order to fix this I needed to change the stub's chardev from internal to=
 external:

@@ -3446,7 +3446,7 @@ static void char_gdb_class_init(ObjectClass *oc, void=
 *data)
 {
     ChardevClass *cc =3D CHARDEV_CLASS(oc);
=20
-    cc->internal =3D true;
+    cc->internal =3D false;
     cc->open =3D gdb_monitor_open;
     cc->chr_write =3D gdb_monitor_write;
 }

Afterward console output was routed to the debugger.  This is the only char=
dev device I found that is marked as internal so I suspect this is the wron=
g thing to do.  What is the proper way to redirect output from qemu to the =
debugger?

Thanks,

