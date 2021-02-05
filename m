Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11781310D47
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:39:56 +0100 (CET)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83D7-0001av-Mm
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l8371-0004LN-Sp
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:33:35 -0500
Received: from mail-dm6nam10on2102.outbound.protection.outlook.com
 ([40.107.93.102]:58208 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l8370-0006ol-Bk
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:33:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC696ZUmuDcMQDqnwN/o7JZ6tuy7ZWu3kwMiDIMB8SVJVBJiafXo+spWo9kneZkGn9ZvevQ+v3s3lDyedcGHJKshMlBmRsZ+0//csfpjrgD/3V6K61aZD+IlmzA4bvzc7ddJx/P34vKvT6v+ZAO6jZrJo8yN9s47BmKNrqvK2VaDK4NLSFaW6IGJA63K1aquM09cSWZn0nHR3wJi6E3eodUNm3yDHPOD0+VgdfXNSbABUO6Z5QihvNnR+h3jhbT6miRp4HeIUFyPSKgAs9Ptbib1HdkF/+Xw1T9PPmUZYBX0yJYjM6GI9jUfD5qjhZVRl0B3uPhMOzT5CCHykjEUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFDUI9Bs3c0ZlNGyWXnwjeGxvETUwQhgKMv4VUKZktU=;
 b=aAWXw2IZSRUilMtoOFN/Qjo6+LE1q2Yu66dddiynSLe1hd8UlE9AR2wj8xuIxxa0/n+edU+3Y6SER+/rY/P4aiK8ji6Ja496/tCoeW0gurkWIbtss9LJOeiWdgMJSROLjgz4EXpj88XgtB/ufmG1sfog+hcBpXC5Ko6NcALiyidATUrqZ1d24A9ZlywzqnlMtSqssDDlgmGq63usrID8LtULQ3RDHA+rqGo++t1B3NSj3VLifc0w9vPzabti1Wcn06yU9sSz7L7kPf5VpnY9RT62MP+wBRDZGmYWfnlMLkeLHWwX0Maoe6LKpEyvKCuk5A7eSsEmK+m7vH0ls9qpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFDUI9Bs3c0ZlNGyWXnwjeGxvETUwQhgKMv4VUKZktU=;
 b=rByY2lEE/Z61f2LrXxN/8FJ8tWc+ZQ4h4JuVx71RJVlYFczbf4RK/ju+Zg+mKkMDWkaAairMiDL3CFeeLEUN2EJH6/xoukltlI/jVlK1ImGyHYjqeNk/jIPuLe/j6pl3LSzUI1ZLEw/Jd9r2tv5a3WRPCreKeNtpkU2koPOwpv8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6411.prod.exchangelabs.com (2603:10b6:806:ed::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.28; Fri, 5 Feb 2021 15:33:30 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.025; Fri, 5 Feb 2021
 15:33:30 +0000
Date: Fri, 5 Feb 2021 10:33:19 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Detecting Faulting Instructions From Plugins
Message-ID: <YB1lPwN+D3qs8WC5@strawberry.localdomain>
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain>
 <871rdupw3h.fsf@linaro.org>
 <YB1VljlPQPRRZUvc@strawberry.localdomain>
 <87v9b6o8bu.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v9b6o8bu.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BLAPR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:208:32c::30) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BLAPR03CA0175.namprd03.prod.outlook.com (2603:10b6:208:32c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Fri, 5 Feb 2021 15:33:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43262619-69e4-4ab7-17d4-08d8c9eb6412
X-MS-TrafficTypeDiagnostic: SA0PR01MB6411:
X-Microsoft-Antispam-PRVS: <SA0PR01MB6411794FF38F957017C8F8F58AB29@SA0PR01MB6411.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GF+2Zw5ukLpU/tyensXmrX4D46g7cqH7M98EE9iFX7bNVqplZkE1ffqsJc6UdQPU0YiNoF93Njg+xBuu1+oeFvXzNPRyqYtCiclMzaL7X9rrMAnv45adzUM7YcpJPPQWf3P2PLzKW41JrcciK3oUS1Er9TZfmhTa0gwZXoEeiczHe1nL0Zd+OhuKYNc15EmZVNUPP/A7r4lb3F0o70mUmMv6BRtxaPbekRu/tWQqaJDrG1v4QfZHV39FsygtG8zQqAMuWB2ZShm2klk7I8lNdhFO/uGYc1hwbBbifY4IrPNFQlGMErb+7bxt0ahCWN18XvojduuQGBpveaJN/XmhyCqXn4gTon/7efAhZ92riJggylybHOgBdFPJpuBMweBgcrlkZ4OpGM4KH1K+i2xSPFYQq6OrMWAzbV1Ma1saRtcY/bGqMfLCOGsfeyNTmRDbyuuq58au7YLoAg1iJO6EkdsY/gG+AO0jXjCbklHFkn2hqX28uAfqOyqNdXOTk74JXlUWwtlZcpwZNsiWdrlWFtsv6Jg55hhLqT/uSzBIPJAAJuQ4k4Sowb2WMjm7zEG5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(26005)(4326008)(2906002)(6916009)(16526019)(5660300002)(6666004)(55016002)(8936002)(4744005)(86362001)(52116002)(7696005)(478600001)(956004)(66556008)(66476007)(186003)(66946007)(8676002)(6506007)(316002)(9686003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?PatYnD8geEgrFB9RIMFq54UHH1oCVqDil4JfrSD6SD5CWeAWaH35aD50Aw?=
 =?iso-8859-1?Q?2v1yvRniKCjL+fx1MXLGhmTDwtvHk7YD/mm1c4xLcdNnA5tKgYkU2APVff?=
 =?iso-8859-1?Q?Pmj4a/8B4eSDwRQvKU4n3HDNn8vKMFDRuMHNljmemWVdduTthvuahKrFGg?=
 =?iso-8859-1?Q?uXWd8t9QXEhqyfhvIpcSAD4d69OY9ubtXhUw3bb+LohxK2tdxHHjWryH7u?=
 =?iso-8859-1?Q?s7gxX1yZqxYFtPqxZUcwhtA9xD+XHlavQe59/mEkB7Jr1itiJ6nb/AS9l0?=
 =?iso-8859-1?Q?pNkcOuhzhN8csLclxdBSfCYwP29Gqm1A3MDEg/N+eAWrH/EkO9pkWZqb1l?=
 =?iso-8859-1?Q?YqrgEs6cM72l42tOP6ZxC2VbBbbSzcRYNgyMCEYTgKAff10wRrh5v/85Kn?=
 =?iso-8859-1?Q?//kQDq5tcSLQu6iZZqBSasrdNKafRxzpw4vCztMw8UQwjSiDITCjhR0kfe?=
 =?iso-8859-1?Q?Ypi/UrYyDxrJ6cncXrPqne4oj9zYkqfjp3G/Uk/v+rB9jqnvtfFpqqcuoY?=
 =?iso-8859-1?Q?3BnIGSVAYeATsj8nX3lWZ46vKvKi6cwEnwZ8Ex8Y/R4JXcE7W6ZP5mNKlL?=
 =?iso-8859-1?Q?b1+dazxVFLq2/lQBOzhOR6lNaL/g3SWcoGcChx+LKS5KqhuoEPr3AuRkBV?=
 =?iso-8859-1?Q?g2kavSLlSZ56WfFOgy502ofndKCwYBsVs8L5MUkJOUuQhZ/XiNzDFvbZH8?=
 =?iso-8859-1?Q?8M5D0Za3iKuLgDGSWAEQuQ5SFnf9/1G5gvfltPmLOIJhm4cIL7RV/uyTXE?=
 =?iso-8859-1?Q?Ys77ngu1YSQvgQc+QuKA9FIMa+3qKUPq2CiRLD2nSseb8v4mw/CfOlsSp0?=
 =?iso-8859-1?Q?BkVz3d8u4S+ZJCQEn+/sqqL4fIujiyIkwxaJO4hnYchZFpfT71l23k3tHP?=
 =?iso-8859-1?Q?9MuOs/2o2rtFeKWhRWge3uQjnS1rHVXYvKOTH6U9Yk/u5K+b/fzXzuVteG?=
 =?iso-8859-1?Q?Q4rBHBUOdIDkIb+VZ3VmAQp8BwHUffgNwUQp5mRxX7UXp0NUabnmCMClx8?=
 =?iso-8859-1?Q?3RCKTkqN3ohyDqz31qAYJemOFwX3qatdBVW+P+Oni8MRTxqeb0cxES80bg?=
 =?iso-8859-1?Q?I7jRrb6gOff1DaL7X+SLdErXB5ebo4nBdYs9wQGX23IU0O0aXl+CFnz0Nj?=
 =?iso-8859-1?Q?Ow4gBvbSMoKehjKabHyExuH6sBxZ8fTOvUgqWJUB64XoTd/HLYMuzrQOBd?=
 =?iso-8859-1?Q?gtmNgUO+jv1eHyFa2fIuP+rw/auDCzhiR/xJNBqmfAJp2gqcLVkTAu4fH+?=
 =?iso-8859-1?Q?EjY51Md3f/f6fp26k9uTiqiQj9aDXBy7lM/dcoEd3IFSvw8bgDphVGZ8Wv?=
 =?iso-8859-1?Q?crFa3hGTxqBem/ISn07Z/s+kLiJtQjqXgI4SYi++q0RWOoqX/MmIO4sa4H?=
 =?iso-8859-1?Q?pS+OxLhd+J?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43262619-69e4-4ab7-17d4-08d8c9eb6412
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 15:33:30.7909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +S0zubrbSXu2pAhTEWhsUnZLwVZ1FSZ+pmToPSXrmtzSlWbALTixMCwDcfZLo6zc0XIBOtHxUn/JE9iJUYBziqdFylLsq+xk6K01lPB+qsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6411
Received-SPF: pass client-ip=40.107.93.102;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

On Feb 05 15:03, Alex Bennée wrote:
> I'll see what Richard thinks. I must admit I thought can_do_io was only
> an issue for -icount modes but I think the real picture is slightly more
> confused than that.

I am using -icount. I apologize for not including that originally - I
didn't realize it mattered.

-Aaron

