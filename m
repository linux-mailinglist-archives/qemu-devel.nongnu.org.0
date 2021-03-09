Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64399333094
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:01:39 +0100 (CET)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjU2-00081C-Dh
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJizY-0005Mu-BJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:30:08 -0500
Received: from mail-bn8nam11on2134.outbound.protection.outlook.com
 ([40.107.236.134]:30849 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJizW-0001hA-Gg
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:30:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3w0Xa59Ml0X7uOcWRpDACYsgjGPxCIv1lr2RCzHH/f15b0ruMqDQS5EiFDZGwIttc5bCbtcMywaCCcIKYF65m0pmjZSZwkceK133/X5F5YuyW31WR4tK8EOmw2AINtCMAb6OzFStHxK9tPsDJwF6fr2A9BX8wRTBeOijuOal8YbjYMDkAYmNr4ACHQneYdfop52OJiP/xvwmQL1I3tCndEkv6XTwIlwyko33sJbsqqWc4l+/eUuh9Ct6qV9sG37Y7iDQZhVLqZJAFX7hWzGVmSSJudFg2jmvIUO3/U5pqly+GJmgVyBf7STkz18aXg6kU1uaY/YDIr09YZA/2CUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5XyA4PvkL88i7N6Yz7BCeypRHcFKsqiVv8Bj+NXex8=;
 b=cKu4tIC2Bhaf9frT808+A4/x1WU59jLhmDMqNMOu09ypHYVHrXBJjZ80BT5oy52mDBHwqRreSfstpzS9PkjY+KEd14IMzKmwcoi9T7ry1Zijh4vKJpXqb1MonOdW+Cpj3iur7cOBUj51U2wTT19kYN56eImaclvj1Qe6QGgexj4AGLB0c6psICwg1sIJ7t+69T6TPgPgbJmA0eW7v9NBZrUaDD9wlHZnUXL1h2VFMmBHIrKWkSB8Rj3ZD4zd3A/+X9jHfgIF36l9UCuMRJeYrITH0KOa9fByuPrCNfT7vcWK5y6QCIKJWVFLPMTHKcZ7lpGahmDURTp4gERyrfVr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5XyA4PvkL88i7N6Yz7BCeypRHcFKsqiVv8Bj+NXex8=;
 b=CZjVqRrVz14LnsTLFOjjMKGqLqqIt0+3dD3ANHV0PFdxeoWTBsI0VlQ2lhJL5vwaCBOHfuILTEsugOHAbM+pHSyX8qlrf6etrdp97hSBwzqGHZTgg/OQRaVY0MHbe92H99QUd2rpnPzGCbjuB4f0gSwLIFTFG5BCrTkNEElrlcY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6427.prod.exchangelabs.com (2603:10b6:806:ed::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Tue, 9 Mar 2021 20:30:03 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 20:30:03 +0000
Date: Tue, 9 Mar 2021 15:30:07 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] plugins: Expose physical addresses instead of device
 offsets
Message-ID: <YEfaz7QnmcjCmliz@strawberry.localdomain>
References: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
 <CAFEAcA-x=FPqFMi7=RkPj4sU7nPgqZCnRf4x7k5_e2AcryGJ+A@mail.gmail.com>
 <YEeI0GLdvRFAB+FV@strawberry.localdomain>
 <87lfaw8bcc.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lfaw8bcc.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:208:236::32) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR05CA0063.namprd05.prod.outlook.com (2603:10b6:208:236::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.23 via Frontend
 Transport; Tue, 9 Mar 2021 20:30:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c56d4a7a-dd2c-4921-3623-08d8e33a1e4f
X-MS-TrafficTypeDiagnostic: SA0PR01MB6427:
X-Microsoft-Antispam-PRVS: <SA0PR01MB6427AF148980F1DC0078DFB68A929@SA0PR01MB6427.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3UKtI8oMKmi2aJDxQxrqjEuW0AG5FuCOouhiuhCMdcKxUEBCsWXiBF+ar7HJxXen4kVwS/sfZFfDs7KTugU6jEEpcagYa0Yclh/EAtXQoThnEsv6x5Ol6UF4Jr++J/BRYeZnvVHig2jklpdeFQufyRvzd9fVtB3/xmZ9ooaRcLCERNImb/h5EGdL2rZoQC4EJnvEHKdkbWppeJxkf3Pepg9R/gS6LME8T/XIk+7li9ssZAYuUObbAbpQtfM1TV8cSajq8SJ2QmqHiWQ4tROfdA/S3jrpsmX/Dl8gWW/p3QsLr5ICgFq29J4NDilQv7Qq9RvjhybjEga0200bBWfYuv63tx5MLmBF6FMZiG/TObZu+swcCBAYKqX8OdQvdPR39wo+O1qukorjRoae22pRV1kj+mw4QMp1aPREJ68IWPQ0yvwtKMaUhEhzUoSrrB1VisxQFZ1IGoUTlUPT1UZfm0knpdzRpy9GMrNvKU1E23sJOnf9m/1A5tXA4aTUZFBsja6HHm+1o0DDD7suazgHiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39850400004)(16526019)(956004)(55016002)(4326008)(66574015)(8676002)(86362001)(6916009)(8936002)(54906003)(26005)(9686003)(7696005)(6506007)(5660300002)(478600001)(316002)(2906002)(66556008)(83380400001)(186003)(66476007)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?zo8c09e2SjAIMYrbXnKY+FthAqp4dA2H+VnQtYP9FZrUaK2Eap4F0hWns1?=
 =?iso-8859-1?Q?2C0xpxTKaZRqqNMcBsHYO3xVb/8FAuXnFXL4sKb1VU/5yXEIOSyChtNxFS?=
 =?iso-8859-1?Q?4mgWcyBQ9Si6piPMACN/HBddCZOX7d1qiFwKMXwbvXlJLid/4hmXECTbA6?=
 =?iso-8859-1?Q?8QUc4PnBDizJ/6WHKntqerTcrBU1PYqej1PeupMxTFtJCsTzR8p4Y4bXiX?=
 =?iso-8859-1?Q?MhqThEkqYkjAWntnV03tPXUHLiGpwOI5P+w7tQqA8su/0oE/u0lM5dpwMf?=
 =?iso-8859-1?Q?ytFGwVPabLfBiJJBknr+0K1mGG4HWlPiNgoD4KiY0HE893RlU86EqpWicJ?=
 =?iso-8859-1?Q?JvBetzgooW9JgGwwycYgDr9GWd/A9C1bmXhFyYLgEt9quA5COQ9DoUL9BH?=
 =?iso-8859-1?Q?XHU1fGdAPmkpWa+klHeyJKHR4l6zudbecwHTAVLFfQqFSDdwEWPK3AaOB/?=
 =?iso-8859-1?Q?702tojKlErdJY1gZrKfv59KHp9+/UFHLjkGVrRH1JpCdt3Z/rjfqo1BOIJ?=
 =?iso-8859-1?Q?o12hfMz2bN4Id2U01DL6JleYGe/kS8MQWKDgncvauTTBl1ebMY+xt+lT68?=
 =?iso-8859-1?Q?yOMGqdW8XIP/Mw5m3PMPd7XF8nEBESmWe8+88FgQJs5SxojTGYBRPyyY0a?=
 =?iso-8859-1?Q?l8l/djL7y6v/jKbYrWGekbhGf8NCZ9Vt8bfXTSuK5TnbMCQHSOtO828Kk2?=
 =?iso-8859-1?Q?P4DkkF4oVx9E9ANEErvSMZexnXzU5UA965gxoasHTKAMEaSJy09JBbi7GS?=
 =?iso-8859-1?Q?4CyUlkfO7GcxDNP+bx01LMG1A1bx5ppPbUsf+w45prfFIHfIftdzvw95t4?=
 =?iso-8859-1?Q?Tjd0FHwnRkcBihmZOHOHC0JaH0oL9YVDkFKaGQn/qtb8PBLZou+SSGFBEu?=
 =?iso-8859-1?Q?EDGYDpHXwQR/u7uDGbnJE+m/5o7G6Mb49A78C9T6WFqsYRASkvoDq6JZVO?=
 =?iso-8859-1?Q?gQ2wMCZxSdOFGJCCTB5c2OAMWwzHj78wWhTBV5lcFRJhZYlt0HbOUvtQ8e?=
 =?iso-8859-1?Q?E4ZajH2CS+GZ7JixK4VdJF91TOeribeRN7AafQE/Dr/ISxqUtj6QwsLgLs?=
 =?iso-8859-1?Q?YlsQENKXcaz+ymn21pno+WP72CeEY9AavjdjUqImLJ2kvW/T8XZMAxVBHj?=
 =?iso-8859-1?Q?hWxy+iTfL+nMDMVt4uQg3dqImffG6zgylO8q5RiDT+KQxg+PPOGPWw14GF?=
 =?iso-8859-1?Q?/tRu3P+7Vj0TZCWbAUb5jbhf4om78g/KUPB4hZ2qm3A6trnTIbxxnHXsDo?=
 =?iso-8859-1?Q?9TJutuKw+nbt7cXWXne8Zeky5QvkX95qSpy0oK95wk0ohXKZVBog89ERis?=
 =?iso-8859-1?Q?robnwBqo2K69ts/u5w99ntx4zrK/vsIgwg9Dg2qRLFf2egrrEhL8yXlHFP?=
 =?iso-8859-1?Q?MtFuuQhyUX?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56d4a7a-dd2c-4921-3623-08d8e33a1e4f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 20:30:03.0200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6hAqvdPxHNyLmXSUxaNSL5lLN2kHFx/VzRk8JhM05Yj2T5tjmiVD1kpLkoJEH8eV3IEZ2ndCB3ON4e4S/6u4Aa/xcu1W5SG//0RN09NRPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6427
Received-SPF: pass client-ip=40.107.236.134;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Mar 09 17:45, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > On Mar 09 10:08, Peter Maydell wrote:
> >> On Mon, 8 Mar 2021 at 20:14, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> >> >
> >> > This allows plugins to query for full virtual-to-physical address
> >> > translation for a given `qemu_plugin_hwaddr` and stops exposing the
> >> > offset within the device itself. As this change breaks the API,
> >> > QEMU_PLUGIN_VERSION is incremented.
> >> >
> >> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> >> > ---
> >> 
> >> 
> >> > diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> >> > index c66507fe8f..2252ecf2f0 100644
> >> > --- a/include/qemu/qemu-plugin.h
> >> > +++ b/include/qemu/qemu-plugin.h
> >> > @@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
> >> >
> >> >  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
> >> >
> >> > -#define QEMU_PLUGIN_VERSION 0
> >> > +#define QEMU_PLUGIN_VERSION 1
> >> >
> >> >  typedef struct {
> >> >      /* string describing architecture */
> >> > @@ -328,7 +328,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
> >> >   * offset will be into the appropriate block of RAM.
> >> >   */
> >> >  bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
> >> > -uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
> >> > +uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
> >> 
> >> 
> >> This should have a documentation comment, since this is the public-facing API.
> >
> > I now see I neglected to update the comment right here the function
> > declaration, and will do so for v2.
> >
> > But are you asking for additional documentation beyond that change? If
> > so, where is the right place to add this? docs/devel/tcg-plugins.rst
> > doesn't seem to have much in the way of documentation for the actual
> > calls.
> 
> The calls should be documented in @kerneldoc style comments in the main
> plugin header. Which reminds me I should be able to extract them into
> the tcg-plugins.rst document via sphinx.

I just sent out v2, in which I took a pass at updating this
documentation. Let me know what you think.

-Aaron

