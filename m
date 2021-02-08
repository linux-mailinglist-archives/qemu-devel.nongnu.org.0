Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B43144BF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:16:51 +0100 (CET)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Gi2-0003rh-NR
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1l9FE8-0006V7-V5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:41:53 -0500
Received: from mail-bn8nam11on2057.outbound.protection.outlook.com
 ([40.107.236.57]:3104 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1l9FE6-000797-Iu
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:41:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuLjFlQohHH/FOi07ovsoK2XQs5zp5pCFolM/IHT3963kzjo25mx2p6A9Vvqnh2lU7soiWU5B45uokOVA//frEQAc1BqnfYY9LmifFPhCRjlUTPzr9BYnpZuooJBWl8oG0DTwczmriqOgCTiVIA6A+HjPGe/EagTQqYT06pKVeCYVIahe/lw6M/J/Am7PiPRP3Kr1SINH3iEqD9IfObh/ldzt1dJZNqbrg99GQPmaP1F0OiERkLZXzcU5KihYsSP8b0b02D9WOKDdxB+PHc2W+0jdCTaZDY4Fc1MMhpg2FGhCDcRA/IYWCu3v3TBWhjFRBQDIlclQO03N0UCM7RZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ATg4lEs7iPuk8h7/QDXg3hVZhppqdzaGVUSolO5CWM=;
 b=S+VXlTxinbDo5hm7Ee7NEQUdi4/WE/F8YdOiCt3qWUSQdioN39UC+YWlPQxFp6W3Bh3JYXTv2Al3ypmBYZX8Ri7lKcpHRjFJEkjbXe9RtOEeAJGBbQIe9l/cln+YGvEqBmMMbQ4A+rcrne+S/8pzFUCQg140RWRwNlGmKdHXkEVehnJghXM3QLbFBblXVtfn8sfmadKDe759lOdviti2uIIZuMur/1kBhalumzQeEHBrLfyXayTo/trhADRmMOAaYfpUYLVzNOR+zg4GWrEN25/YZTDRg5QxhlsXpana36xhh5g3mZi9SXppLDq/iBylfPUoYBm9jeoyoJqdyzdRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ATg4lEs7iPuk8h7/QDXg3hVZhppqdzaGVUSolO5CWM=;
 b=KRkdJGuz0dMv6Yn42q2MFAu58MxyerlJyTyHv0+joz0j8hSWWo0uv8MLd3jE5Sxv98iWpLqJMiEj6F0028QguGtTamNYPpeeygSBpER0VgDXL1+M92ibR1FmKCB63K7nheBjRY/Fk7nPE1VJkXcfFXw5EDp12r/hY66xu7erXa0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 22:26:41 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3825.024; Mon, 8 Feb 2021
 22:26:41 +0000
Date: Mon, 8 Feb 2021 16:26:28 -0600
From: Michael Roth <michael.roth@amd.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v5] qga: Utilize QAPI_LIST_APPEND in
 qmp_guest_network_get_interfaces
Message-ID: <20210208222628.pgz5wmnhkkbbz2pi@amd.com>
References: <20210205171634.1491258-1-eblake@redhat.com>
 <878s7y66c0.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878s7y66c0.fsf@dusky.pond.sub.org>
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN8PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:408:d4::11) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN8PR04CA0037.namprd04.prod.outlook.com (2603:10b6:408:d4::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 22:26:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce36e0c5-76a6-43e5-ffb4-08d8cc809b4c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4150:
X-Microsoft-Antispam-PRVS: <CH2PR12MB415098DBE74FDEF2DD97F021958F9@CH2PR12MB4150.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7j4YbdcyTeak4nkSEbALvTW+0Z5LZ6aVq4CdJO8LI6Scuv3foZHvwmyOYyjfR5nkdByZ8tazukonp2+zLTE/QAO0WXUWbf5HI/W2mqvOoNHF6jenCdU0i2tpb3oulN2xwYAtzUv+U6Ysm7qQdSTb2IpLcko7JZUGYcdCuEupVtQek8hK4jIP+WKC8brFn8XQrrgXl018Ht27RYajZg14sYK52pT5wy+1I/JnxUUon8JgIu1jvBs8bEhrcVXeqxnbOKwLXZaKlfPvYkIWRe2Gdmi92PgBMB+4MHWvR4H9cMzIjGsinY1hUolI9v4vULVSs+84YKtJFeE/5ShZtknzExdRAXnMo22S6oJrpD25bfQPxS4jTN0WY64PDQMNGFSNULni2Fmy8mIMggccqsLOrPd9JdngKnPJ02GaUdcBrvNYFamNsFYI3YygJjWultuGIe1esKNYh8uXJpAkFCH9jHtKY1LVZxGW4YKuZLIne7d8MGXA4FZjgXOtkkiTR+Him9TBX6KEFJ3TwdH7H8lpBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(36756003)(6496006)(5660300002)(8936002)(1076003)(2616005)(52116002)(6916009)(8676002)(66946007)(16526019)(316002)(4326008)(956004)(83380400001)(186003)(4744005)(6486002)(44832011)(66476007)(478600001)(66556008)(6666004)(2906002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yJkKpjuMiqLUx3yJ+pPNkrogpRqYjrbi/e+tJFDXt3Y6xQOrMNYElo3Vbv4W?=
 =?us-ascii?Q?7nmW+NmvgsjkQuqlXvPKBEt35aYViziEBBGwKkfgly6wWftwGFGZYHijzvUz?=
 =?us-ascii?Q?iJSoquZsLgo7fKw5b6+TZWAk17lsaNZAcBCCeLU/GDwqaut02bGn3Q550rTJ?=
 =?us-ascii?Q?zJzx87JdbMu+9mK/AD1onvXl0fwx05qy/arA2g0hgu+NXoYLc8Td4AxmHfvy?=
 =?us-ascii?Q?VkFDtkzN0MHxnhEgqkmjc8n1OSt75HYUF2COfRHh3iExFkEqNJryFtdh/ZUp?=
 =?us-ascii?Q?ijJwS4ugO8/qtC30NK76nZUNGY3nAJBeVMqjdAWjwcK12yBcnjcCT/5sxcBe?=
 =?us-ascii?Q?PCrXrBikCKDY10vDW6dxIO/929z2hMg/ueFu0cKWr4qFfLR3N0Er+m3S3xrV?=
 =?us-ascii?Q?CENFXbtwxbw1Ow+vP4+s0yn+/NJmmbCasPDVMIkCg6foICNmOY1aMOOhYqiA?=
 =?us-ascii?Q?8qpiF/mJjXEzjqzWD3zdn0yYm0XxjGyNTOdYTwAuSbIIvrHo/dalAfYkETs1?=
 =?us-ascii?Q?XP9ISKYHOcjZaqmLPmRayWRp+9uWFiHSdaVVNVgDko4lOCbHfEhmHjgSFTcQ?=
 =?us-ascii?Q?kvZpAFtO9h1bdu9nveKNQn27l687gb0fbzPvnJ2mQ+UnKIXQCTTj48bA3mGC?=
 =?us-ascii?Q?mD0Q0EL8oB7fH8bVm8BGo4hz2zQ6zX+BWsvHg2jPyfFB28ESG4KMhlsLolRk?=
 =?us-ascii?Q?Jo19GQoAyyVMn1wwXXIi/eQhiqcEe8AeYAsywxZBe9nXI8K08L07qv/21/HK?=
 =?us-ascii?Q?JC2zL6sHimcL15HS4de2nvXfASyOYkAvkLo7ZCqYDxIW1kl9okkflmUYi70i?=
 =?us-ascii?Q?D70RO7Cdhjvdv0clW60EQkHOm30hEJyqnFDFh+vWjVzQg+EoLn28K8QYiUET?=
 =?us-ascii?Q?/voIGk/mUdWgtvjk7lySOtd3+N3I80XoOxl0x2cHw0+BhbMOSyg2bshP+j/m?=
 =?us-ascii?Q?etakVJPP5p2wvJnDKsHo1/cLnZQosrOQb1Gw+q1HHdmVoc1JMt0NQyhZ5iQQ?=
 =?us-ascii?Q?TJKiyyd6ACLkhYdo3ZZDKqvFLjFuMl7sNz/7crQq5S08JY/kbgi6y4vJfrGT?=
 =?us-ascii?Q?4+VRrY6RLpfVgr0DsY0TjWWZLuLiRpr8daIXsOnhtNZyDNV1nYinuYYLvZOx?=
 =?us-ascii?Q?gzNNjcbw/L7Bt+wmQYDiED7euw6doFf1bPAMld1eic7mSi7Zam4Kb48cY3a1?=
 =?us-ascii?Q?29gvLWWsLE/V+576cDj+mLri8ajO6AcpIRTTn7rAJ+t6brDd1aExACPDiFR1?=
 =?us-ascii?Q?4RnpCiKtSm+qfhiEXVnNpkk4dhr2XTjUmOb4KEy/eghZwI3tpsRrWJIBX+43?=
 =?us-ascii?Q?dOqm8G2rdqY0JVBFcJDOwNUT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce36e0c5-76a6-43e5-ffb4-08d8cc809b4c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 22:26:41.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KH0c73hnVwnCkqeaeFHHc28mqloHEC0dVWiq9U/7/XWGauIAIc0p7fc8RJnstp7V7jbhqscZhcMBxgIG5g+v/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
Received-SPF: softfail client-ip=40.107.236.57;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 08, 2021 at 02:23:59PM +0100, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
> > I found another spot that can benefit from using our macros instead of
> > open-coding qapi list creation.
> >
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> Mike, would you like me to stick this into a QAPI pull request?
> 

Hi Markus,

If you have one planned soon please feel free. Otherwise I'll send a pull
next week along with a couple other patches.

Thanks,

Mike

