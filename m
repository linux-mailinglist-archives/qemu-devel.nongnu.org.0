Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FF135145E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:13:55 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvGs-0007Ix-JL
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lRvFA-00060l-CE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:12:08 -0400
Received: from mail-eopbgr130073.outbound.protection.outlook.com
 ([40.107.13.73]:20966 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lRvF8-0000JD-By
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:12:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTzE/19zq5UOsBJQQDEaefHMsg4FfepmBKyPTwjTI7behoXIJp6kCbTF7E+bv5x6wxizfKavj+aW3ho3YA3O0uZ4wb9MFrO5oYuJ+xBnNPu4x24IJgZHCnaIKx7fvtaFil01xBCVJz6Ojp9Yv/bLONxgfk6tNRT2XSf6l8vTnSWLZqUAcbUP5hzHLk6dNel2uEKpil3WAzB0mZ2L0jyU9XYR4hlzCl/ll93VAUuvPgqdabRPuza0KgGkxDM4/oeXPUyu6YK36j2SAOfFXrmjNtsTb35TZi+lV9mEnxq+4GrvsiL9ZOneqFBmj31X00bfIGEKrS9Y2owJ3VezMWR8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj4Zaxf3Xxh9fJ6iKu7UH6fIHWD5JXfUwLf5Wp/DlL0=;
 b=BC1dSETg5vn7NRhqVQ0ykZHF6vELmf3X/bBkU3sYC9z9CxI6k5veji7CVvwjgYgnUZ1prbPJDpGQ6c36LkezjbK2Ibwyi7GJtkUvGtZtFhlYlBI4L74QWRThtFwelhCdttK9qEOP+brksdgRSZJwq/oZOs9WLAeWEaNXlkjab2KQeKyAyAWz2Y0CgI68uwzPV08WR2LCnfDp6Plc7JBkphNAa90Hpysy2dPOUgrYP4FPtRpugmlBdT2cJ1aTOk2e82Fn0FWK+Fwmndqv7sSt1UkPr/cpIZJ5sIoOod3NR2ImpeLt3ZLXD/30PAvhPiFBfxRm3joqZvUA61cJ5nX2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kent.ac.uk; dmarc=pass action=none header.from=kent.ac.uk;
 dkim=pass header.d=kent.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livekentac.onmicrosoft.com; s=selector2-livekentac-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj4Zaxf3Xxh9fJ6iKu7UH6fIHWD5JXfUwLf5Wp/DlL0=;
 b=G4s0yVhe1uiY9ZyDy5JhOi7zF+Jd4GZpBN4eLB4SZEDig78NZQ4XTFZaTsQ3n7ncgJzneMsE/xWDay8rEeZ/OfgqB950or/GCvmSkMT8LznpGp1yhdWzZkLt8tcbn3Dxp/6Pp/tWOHbJkCcQZe4OqmswEYddDU0XwPhCIsTmPs8=
Authentication-Results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=kent.ac.uk;
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13) by DB6PR0101MB2389.eurprd01.prod.exchangelabs.com
 (2603:10a6:4:2e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Thu, 1 Apr
 2021 11:12:01 +0000
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516]) by DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516%7]) with mapi id 15.20.3977.036; Thu, 1 Apr 2021
 11:12:01 +0000
Date: Thu, 1 Apr 2021 12:19:47 +0100
From: Sarah Harris <seh53@kent.ac.uk>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Status update for maintainers file
Message-Id: <20210401121947.745abfec26e5e5644e7d9d75@kent.ac.uk>
In-Reply-To: <2a6c50f1-4067-21ff-f92f-66cbb1023d9d@amsat.org>
References: <20210331184221.d81b4ffed7c7c733c33f8c66@kent.ac.uk>
 <2a6c50f1-4067-21ff-f92f-66cbb1023d9d@amsat.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.213.130.164]
X-ClientProxiedBy: LO2P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::31) To DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cadance (195.213.130.164) by
 LO2P123CA0019.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 11:12:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccfdce2e-0289-4a94-ac7a-08d8f4fef904
X-MS-TrafficTypeDiagnostic: DB6PR0101MB2389:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0101MB23895AB2CC26586BF8D4E5D1F77B9@DB6PR0101MB2389.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3dMhBlEiCe4wTcHWSEGLoVdhwsDh3NoYZRtCaW2a+fg8rA7uWhsMwHUb92r0y50Gn0OXOXGgRVmbn9LF4+V6BePosg5+8E0WCjNePrWgLuBuEzuFf/CitZyUks9kw8lOoyINORqKZ7XjI/yiY2y09rvED7vtaye43W8Br3kNDHk8mSaKybzDhEd/NFUgCwzUuCULYpDz6z6fPfydhViYxkQCbBHhjS7OTtAv3iRDKxnJQ/odozk/Z3fA+DXoT+RtLTI9ICVPpR/dqqdHtw3T5X5Iwps8SQsXzHC0xuPpQxDmYB3cDoOKhi4TlRy6Q3hWxiAwH8Ve362Mr1QLSrJ/c+6KP8USNPlpm8Ipukf8u3K76IyVQDb8uPAiu2oBFlvqA929wHIDqyqIxEcX8aCrcIiBKM86FhJuGAzZ8zgxEBya7socscbcl3XO6ki+EqzKSPmA+flZKXOjuu2hHyshjcPwKStLfxPy7Knxj3oDWLKKMoOqmBkgD85wTQ8ifIS69iOI1zi95md/1YvBGI5DDxoBULtRgWAy2jeFcpFjkxkPgWkdBbSVsTO/TPPNyiH94bbWpwLFzdfibjcua8ap0m0/yg8SC8RSq7ubpogZbH2LaKPaTzVKB7EnObIN4AK6P6O0QqJuMQtkxhmuEtQew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR01MB4092.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(6916009)(2906002)(8676002)(186003)(6486002)(4326008)(36756003)(1076003)(8936002)(5660300002)(956004)(558084003)(66556008)(786003)(54906003)(316002)(6496006)(52116002)(2616005)(66946007)(66476007)(6666004)(16526019)(478600001)(26005)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?ryVVFJJa627d9NqDi/5aKgjdiEA4XmCbSRcCClhHyKUDqjGvWnn1y15P8D?=
 =?iso-8859-1?Q?/aBmmkD3nCYXftaPAWrDidUl+Ep6LLR/a79SsVDfe04y2pEK9aSVdmXPFD?=
 =?iso-8859-1?Q?JyExsisGMtFuR0YNqfoub2lzGi4rv4jL7Eza36F1VAGdcoIjiVqyqe9u01?=
 =?iso-8859-1?Q?5yh05BtzUFnTBJJleqqOuwxuD8qOdvv70svUJDBEYX5cQcp0Qp01m/Hnby?=
 =?iso-8859-1?Q?oI/4Ti6WkDmXqsJsS8iFGA+Cu/0hpQJPd2zVRm3FsHEYneYITthRbgd3jZ?=
 =?iso-8859-1?Q?gmUGpnbS+NacZQsQXZOhU5BeUjp37ueVin15OdeLeZ/OdfDWqs2qiqshgd?=
 =?iso-8859-1?Q?SOf2VW4EI8JCeKgbOPnftMrteHXfoHjlsdCn16/W+tIoapfar/HylqbgTC?=
 =?iso-8859-1?Q?RXLBmZfPduJjiuGbmNE0peYGtgvi+c1P7jn+bGwPEi+oVzu7FblZuFhsXt?=
 =?iso-8859-1?Q?jJ9m6g/c+4vq8xIPSufFfQE5kv1nLkDhB+COd8nseRsmC+Q3jJsfQY+Hob?=
 =?iso-8859-1?Q?NpWISQmGg2YY3BbHP/zGos6vy2HjT6/yTIoZ50WD4q/725aHAfOk86IIKe?=
 =?iso-8859-1?Q?xiBSx1J8Dr+HsX+R+ldYN6EECJn6x7ssw23RyYGEi7ogOqppj7KOktoxBn?=
 =?iso-8859-1?Q?JnKfBtBxDxqmzmOY1/wprhAhgufuMk3PvXAG8wEFKDcLNrdjRxVWX37JXP?=
 =?iso-8859-1?Q?S7qTrf508admzoLJ5N3CTWd6vUzQCOtiqdAAFjdWjWz9+AyOcwkAsxEc2M?=
 =?iso-8859-1?Q?/9CHVZp5YM+3Z1Wo9juZkLcR83d7JTNGJOUEleHzlbZaK+KiqA0CjcvI0+?=
 =?iso-8859-1?Q?fcIKyQeE6rX41TcMHZoQ4ZsxPG05E+P/Eyk49sxHxPvlvlTMo2swenw4Jy?=
 =?iso-8859-1?Q?rgrj7+UCwxzNcERme4S/i8CJMHs5CQ+Tvhiyn7q6M0Vh8gvHuoYtt7/ZSa?=
 =?iso-8859-1?Q?IXy8C8ZArfWP6tSXImibAkuNE/HzspQdWwUFRJWkh8+dMcZUfo4DnIasIa?=
 =?iso-8859-1?Q?jIbmnMntN89TDotI9T++TkNRMqvcm608okot77yIqBd1sd/zfu83A3S87T?=
 =?iso-8859-1?Q?ffrCjxWZJpwet7HlocT0SbuYM6bXmsGpM8h6aNXMc9DFUQCpD97fHr1aUw?=
 =?iso-8859-1?Q?JApZ3YtrLzjpbl8BOsihVAB9Xc9EEObDyFihSxZUntjPVd2bVm5K/4EcmZ?=
 =?iso-8859-1?Q?WfQOy8/P95xJSgnR8AxnhYbLga9Eecohiyydig5JHj2e4Db/cvxpA1LvIf?=
 =?iso-8859-1?Q?jZ4Z7WcUATRVIooUx/C/BeBNCzi5F+IEjFTf0u5ZJXv/5gqkbU9VjDDI0I?=
 =?iso-8859-1?Q?dl0J17jmV7B/kfMKz6Zf991jiiUfuWIh30Rpzc3qbbTa9dmRO+i6Yz5VqX?=
 =?iso-8859-1?Q?4xyZJk6OL/?=
X-OriginatorOrg: kent.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfdce2e-0289-4a94-ac7a-08d8f4fef904
X-MS-Exchange-CrossTenant-AuthSource: DB7PR01MB4092.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 11:12:01.2187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51a9fa56-3f32-449a-a721-3e3f49aa5e9a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNYdm4ZaC+uIckz3hQP9N57FxSd4Ii9/mQzWZgpW4jsrx9vPrE+5D+QCuWcHodzIDclYZaHsNIDc0XfqYVtd7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0101MB2389
Received-SPF: pass client-ip=40.107.13.73; envelope-from=S.E.Harris@kent.ac.uk;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 09:53:38 +0200
Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:

> Thank you Sarah for your AVR reviews the last years, they
> have been of great value for the project and community.

I'm glad my work has been of use, much appreciated!

Kind regards,
Sarah Harris

