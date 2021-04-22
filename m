Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84A367D30
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:06:43 +0200 (CEST)
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVII-00044P-P3
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lZVEJ-0000zo-7F
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:02:35 -0400
Received: from mail-db5eur03hn2232.outbound.protection.outlook.com
 ([52.100.12.232]:1969 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lZVEF-0002Cx-Oq
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:02:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROw2FK0LP3+fSXbei3GjsU/j9NFmlRniKA8a4uszNDHZQJRbzDO6Jp7xhuUpMbje6NSL/yhuL0TYGns0mXQnhLJFLWkjVQdUSCqabizjBsruigEc4KxAo3c4psD0Csh3H0zYVdMH8/+K/xV9gvKg+i0dFJcjgkziemIqyZdkOgMeF5xZsxRWGAq55U+NZHRrZAQdR295TNEhAm4/Igw1G49ykWzH2FhKd7kEwo8WPVu17Dvchh8WhBze3YhHtRoZntRAsm2+phnvSEJNPrys5CjEO1oUUq7ujeTynu95sKD64Hbkx+YdqhB6XcrLhgHMPCsjlYVVT1+NSoZswKjfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov/NrYjRs5RSzOgzvLWg677/aUAGpC+L3v1HgMUvjvw=;
 b=idHl/Ov5yHRVun1qMp0gCvCMKHd5a3izDPbuDsnCFDtj92TBMtqkBwZ5ucmjNxV/WSV8prZJS/3iFCBNyLUpJNHZapst9v20CaNz8L0siHvsSHCaFrt+/LpnIvCiviUQbyfKVU+4NyXLL7EDVf2lrGzovKCDMpbGKJG7VkFEXMm3r30AnJyh0/o4Sw4F/ysjIhXJNikC7SsYMOF8fdBYXJyRqP26B+Txu1bGjjHwnwu0nxuACQqHuf5osQG+yDm/QMc7pqkSaF93ycwAsLuAqRHok8yODflD7EiSq6Bb0VhJV0FfSI/1cGZcem4mlRp9MDOT5vEgktkVr9yqgme9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov/NrYjRs5RSzOgzvLWg677/aUAGpC+L3v1HgMUvjvw=;
 b=NrYaGUjgcbyL0lLD1b6jPm6Nl0QzTdtg849c+hmJ2ZFcYygXw41p11IBZD6DUEjUOuACQ48kIlJxzgtsHyJMLwset4BxW0ys9T+mZb/VRZ1IGnbo36eCKf6j7NNeFGv8GNUl3YZBzocRa8fSRGz537aZw/ibInh1+X3/apv+y90=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 by AM4PR08MB2625.eurprd08.prod.outlook.com (2603:10a6:205:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 22 Apr
 2021 09:02:23 +0000
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::7d3f:e291:9411:c50f]) by AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::7d3f:e291:9411:c50f%7]) with mapi id 15.20.4065.023; Thu, 22 Apr 2021
 09:02:23 +0000
Date: Thu, 22 Apr 2021 12:02:15 +0300
From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210422090215.GA977614@dhcp-172-16-24-191.sw.ru>
References: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
 <20210420170900.utg4qzqkefdc642c@habkost.net>
 <20210421173941.GA927665@dhcp-172-16-24-191.sw.ru>
 <20210421201759.utsmhuopdmlhghbx@habkost.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421201759.utsmhuopdmlhghbx@habkost.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [185.231.240.5]
X-ClientProxiedBy: PR3P193CA0053.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::28) To AM9PR08MB5988.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-172-16-24-191.sw.ru (185.231.240.5) by
 PR3P193CA0053.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 09:02:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 029410c2-94d2-48c0-c84e-08d9056d57ac
X-MS-TrafficTypeDiagnostic: AM4PR08MB2625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB26259B2683DCDD404805D6E087469@AM4PR08MB2625.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:AM9PR08MB5988.eurprd08.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39830400003)(136003)(55016002)(38350700002)(8936002)(44832011)(7696005)(52116002)(38100700002)(107886003)(5660300002)(86362001)(54906003)(36756003)(2906002)(9686003)(83380400001)(33656002)(8676002)(26005)(66946007)(186003)(6506007)(478600001)(316002)(4326008)(956004)(66476007)(66556008)(6666004)(6916009)(16526019)(1076003)(30126003);
 DIR:OUT; SFP:1501; 
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W72F8tCqZ/+039rgRyvMDFUB+4FP/nUTuRLLGJQPM8+iiQE7yK8C+WCqd9uC?=
 =?us-ascii?Q?L0Ek7acZb/rTrOtht+ebjAz9BKAgGjxStLrEn/Ruzc2t9B7+8TVSM4JzwI7s?=
 =?us-ascii?Q?kg4SdVKJ6lOpAM0tCSTGp4ngURDCDa2Ngp+oNFSjbP2xlv8odZhEIfKdhMCr?=
 =?us-ascii?Q?tLW8SxHFDenTVqTu7CewuV4N6VACZN7Ry02xx5zMZ/lUaqUNfUtgO7thm7jK?=
 =?us-ascii?Q?NhLSHKqTCRGYA5kvL2c4ehAqHEyb/zt41kEdI+9CAkRYnDYT9KsXgoAtziQZ?=
 =?us-ascii?Q?AWBkQToFDyDcCcJXbrJy0wdOlHtCPZZFp17C/GfExfISrIA5GllUow4eLn3L?=
 =?us-ascii?Q?Kj5lEsjt2ECIqYiBuFGjq+bX/xhKbIZJTm/WCGwL5vMB1LC7sj7WBhv5dmhS?=
 =?us-ascii?Q?xdjKopkYL138wExEu3dlbCBQgfVEmDWaZ3piO/lf+O3EAr5lpEP9FhD9zBYb?=
 =?us-ascii?Q?f84V3E5JyFEg3Zp/5SoQxLvMjgJENcKdUtRgi4kkFwj6DduKJ2X5J+DuRcW9?=
 =?us-ascii?Q?GvKjhrQwKYjzz6ttri1V+GzvR9r+N4PPx45S6Hmvj3H6bq0udl8uCmtR64cE?=
 =?us-ascii?Q?Jj+vJJBKX/K5c8bFlhy1BjdvwUhA1yULhTmks5WPNCJU764QIC59C1wOuQXI?=
 =?us-ascii?Q?cYevCYpJE5305NsnCU/NyLEDeTla90cPeCcI9p4J/y3Nuk+k6cE6JbeTVhBQ?=
 =?us-ascii?Q?1E3uEoDkkz03vldyutotbkcKwziS9sXv8egB4IfBeH7vnryAk7zRY4EybOAw?=
 =?us-ascii?Q?sioUw7/pfExtK7ITdtKZkbdnNE3SJOz6G0XbFI4xi5/2mbknHlEGMyPDVfxA?=
 =?us-ascii?Q?oX5JMSOCUHHLskoqC2PsxYVAXYVQEW1P8TeoZM0njMSuFyOMcerNHLsBpKKy?=
 =?us-ascii?Q?1X9X5RXh526USVlCjF0uQfRWrK7+N3cQRxVpMIRX7kmwLpgJcnCamD3ZV8c6?=
 =?us-ascii?Q?ZyeI4ol4gS0iqeVBw81KT8lmIfAwZEjS4gl/7ugRs7E=3D?=
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EJie0NknLEUHRKiZGgVeKL/+2ybkTeAf4Tm2oBGzGuYRkT3YCxeyFecnSliN?=
 =?us-ascii?Q?lVN3NAefbEmp3VNerXrwOkBPm8Z1UgjDgeNQpe37oQEOEtzTsilWxPBI34Pc?=
 =?us-ascii?Q?M9Jc0FD+QnJW3VbJMgdWWWvx6QoywpUQ2b3wqL3bAABcJKkZB3R4O0qnLCMh?=
 =?us-ascii?Q?eqaAMGdKi12kgvyWlhH1WrX7W6uPhJOM80bGpM2B40dvbvk65LWqBUF2gNd+?=
 =?us-ascii?Q?8C/zsblor+wbIQkh1RaPwh4ckNSj3zrW1bs94p24MJ44BZcg92Mn+ROm1nC2?=
 =?us-ascii?Q?iuDZxjSEbw/YsY0iEJ+iwTkWAr53HKts8qjpwRTiYm2auKTqkJxo9Ogb5IUh?=
 =?us-ascii?Q?XccOFH3RUgXI5mhpqMwo6xnP5wW8uQVSpIM+faXRFTez6EAUc2LkRp9G1HPD?=
 =?us-ascii?Q?NXEJKC8HGn1HGyzTU5vELX7djJ4b0VQumgn52HKYGCFtoKxu1GoIzSeV9U6J?=
 =?us-ascii?Q?hUydbqeiW/3xwghEgu/hCKdkJb5cCBd60e067Le6wsGzigu/vnFTCA+7nE3A?=
 =?us-ascii?Q?SBpqZ5Ydn5bk5f+O3wi9wxoABm2ew2wiGjniehucLyGnIKD5AzYfa4qjke/R?=
 =?us-ascii?Q?UanNnLOsd0QJFA4nsox5UUgU4OJWwC6IhJy9ENRDRNuv0S4pNkvOPEsS9Czz?=
 =?us-ascii?Q?CB17i0fWsxagCCTu/bal15sc/0vKBxKA0DdUHPOc8nQxulExx/nlHYL99/GR?=
 =?us-ascii?Q?jnFVgfS5osj6dqikB8vB3DAcw9lMIVhwiBEmq/pU8bF+U96VmPVDR6PAn1y9?=
 =?us-ascii?Q?Z4ZKSrndWVRUuJ6zP3WhYduhHvoDzkff4WaG5XMvMIwEkrinvx7O3iXAiILg?=
 =?us-ascii?Q?UBq0UlyK0jbpeWjR5BCmEiT2SXHTQ2YaIotsYNVx/bNYTCJlbX9OFA7EtMhR?=
 =?us-ascii?Q?c5wwZiIzQf7lDkDRVTCL1ZMGUEEGMJyHucTo/hibGBDyr0S4HJfwsbNnB5yl?=
 =?us-ascii?Q?bc6ED7hkleX+Zm/Iw4w/tQT60Ic17VJycOHoypZJyHSA4GfTDZfHswuWOTEk?=
 =?us-ascii?Q?+lUJsYYNadwADCTGMgqyS2LZyUqNVvdZHjihNOHmQkUhapDqaxzHXEX1FYHI?=
 =?us-ascii?Q?QLTr7rQW3Ri6eLopVD5qNxaqJELg/KY5hDZPGb7X9VReIo5fnNYIkVO69h5u?=
 =?us-ascii?Q?ADllqK6FwnMEGPkKgZtGQJC+3JlSR8f/sGDWU2g8ZpovBEYI066ccn79TDcs?=
 =?us-ascii?Q?6qPOtgqMcAX9X0P4sf0RELg4rdcqvgTTUEbOkGfe/2gUlFQgv8cJy+zSWOia?=
 =?us-ascii?Q?o0ZfvQRqq+q3qIsmjwWOPLON5aDT72ghNlDow6Nq4OmGxqSwRMFaSXua0F6R?=
 =?us-ascii?Q?rfkdVvkSkfGf9CaRCBSWJ5jt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029410c2-94d2-48c0-c84e-08d9056d57ac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5988.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:02:23.2291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg2xdQRF5Z8A8vc/MmPcqe7zpo5QwkzuH7PM9CNZ40C2pkDSJ5QF0kYJ61FWeqWL4u8h7irnfb0eRMZYKHfVeEr0A5/Yj4/JiAQiw4jtPDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2625
Received-SPF: pass client-ip=52.100.12.232;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Wed, Apr 21, 2021 at 04:17:59PM -0400, Eduardo Habkost wrote:
> On Wed, Apr 21, 2021 at 08:39:42PM +0300, Valeriy Vdovin wrote:
> > On Tue, Apr 20, 2021 at 01:09:00PM -0400, Eduardo Habkost wrote:
> > > On Tue, Apr 20, 2021 at 07:19:40PM +0300, Valeriy Vdovin wrote:
> > > [...]
> > > > +##
> > > > +# @query-cpu-model-cpuid:
> > > > +#
> > > > +# Returns description of a virtual CPU model, created by QEMU after cpu
> > > > +# initialization routines. The resulting information is a reflection of a parsed
> > > > +# '-cpu' command line option, filtered by available host cpu features.
> > > > +#
> > > > +# Returns:  @CpuModelCpuidDescription
> > > > +#
> > > > +# Example:
> > > > +#
> > > > +# -> { "execute": "query-cpu-model-cpuid" }
> > > > +# <- { "return": 'CpuModelCpuidDescription' }
> > > > +#
> > > > +# Since: 6.1
> > > > +##
> > > > +{ 'command': 'query-cpu-model-cpuid',
> > > > +  'returns': 'CpuModelCpuidDescription',
> > > > +  'if': 'defined(TARGET_I386)' }
> > > 
> > > I was assuming the command was going to get a CPU model name as
> > > argument.
> > > 
> > > If you are only going to return info on the current CPUs, the
> > > interface could be simplified a lot.
> > > 
> > > What about a simple `query-cpuid` command that only takes:
> > > 
> > >  { 'qom-path': 'str', # qom-path is returned by query-cpus-fast
> > >    'eax': 'uint32',
> > >    '*ecx': 'uint32' }
> > > 
> > > as argument, and returns
> > > 
> > >  { 'present': 'bool',
> > >    'max_eax': 'uint32',    # max value of EAX for this range
> > >    '*max_ecx': 'uint32',   # max value of ECX if there are subleaves
> > >    'eax': 'uint32',
> > >    'ebx': 'uint32',
> > >    'ecx': 'uint32',
> > >    'edx': 'uint32' }
> > > 
> > > ?
> > Hi. The interface that you suggest looks good. But it has one critical
> > point that deems it unusable for our initial needs. The point of this
> > whole new API is to take away the strain of knowing about leaf ranges
> > from the caller of this API. In my current patch this goal works. So
> > the caller does not need to know in advance what ranges there are in
> > original CPUID as well as in it's tweaked QEMU's version.
> >
> 
> Raw CPUID data is a pretty low level interface, already.  Is it
> really too much of a burden for callers to know that CPUID ranges
> start at 0, 0x40000000, 0x80000000, and 0xC0000000?
> 
> (Especially considering that it would save us ~100 extra lines of
> C code and maybe 50-100 extra lines of QAPI schema code.)
> 
> 
> > But you suggested API is not so kind to the caller, so he would need
> > to add some logic around the call that knows about exact leaf ranges.
> > If you have a solution to that also, I'll be happy to discuss it.
> 
> Would be following (Python-like pseudocode) be too much of a
> burden for consumers of the command?
> 
>     for start in (0, 0x40000000, 0x80000000, 0xC0000000):
>         leaf = query_cpuid(qom_path, start)
>         for eax in range(start, leaf.max_eax + 1):
>             for ecx in range(0, leaf.get('max_ecx', 0) + 1):
>                 all_leaves.append(query_cpuid(qom_path, eax, ecx))
> 
This is a question of architecture and design. Number of lines is
secondary (up to some reasonable point of course).

I want to decouple components as much as possible. It's not a burden to pass
4 digits once you know them, but how exactly should a caller come to these 4 
digits? It's like a password. It's easy once you know it. Check out Intel's
Instruction Set Manual on CPUID - obvious place to learn about ranges for the
caller, yet you wont see exactly these numbers in plain text. And where is 
0x40000000 in this manual exactly? One should read QEMU git history to know 
what it is. Correct me here if I'm wrong.

The work of figuring out the required ranges should not be duplicated without
need. QEMU does that already, there is a nice way of passing them to the caller,
and it makes component interaction more generic (no private knowledge pased),
so why not do that.

Please take into account the design of applications that will use this
method. With less restrictive API, components could be more isolated, for
example one component could only know how to call qmp methods, the other would
have to khow how to process CPUID data, resulting in a clean layered architecture.

Also I'm not sure that these ranges would never change. Are you sure that some
other range won't appear soon? If so, shouldn't we try to make less locations,
where this would have to be supported?

So my pros are: loose coupling / generic interface, less places to
maintain in case of chages. These are pretty basic.
Cons: more lines of code as you've said, but otherwize more code will be
in the callers, and more callers == more duplicated code.

Thanks.
> > 
> > The obvious thing that comes to mind is changing the exists/max_ecx pair
> > to something like next_eax, next_ecx. But this idea will probably require
> > the same amount of complexity that I currently have in this patch.
> 
> I agree.  I'm trying to reduce the complexity of the interface
> and of the command implementation.
> 
> -- 
> Eduardo
> 

