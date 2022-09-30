Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342565F0C5E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:24:06 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFzn-0006Ip-JS
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oeFt7-0002RG-2h
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:17:09 -0400
Received: from mail-ve1eur01on0724.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::724]:55487
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oeFt3-0003F8-D3
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:17:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obaZcmImebSud/1Jtnqb1eG7/yc3ZZQgoDt0yI0xzaj2gSMHycLtCk9Cizw5/uH8xYgXLW2lGo7gAhpLCpYPK24zF3nr2/Jvw0H0u/Q7HtgmA6WM+FHJTVBIobzVlNVn0C81u9mLIvoRKr86SX5JCAYNTR2XC/BLyFMvF98jdDw9pnCVDD+p3puJR2ubcpw1vWapSAz9VuR4panXiWwhQS2aXmslgxwtivcRU28ZsNoH7eFAtDLTJWG4+rxnEtXyGm91gv3CzWOQbspcI1iHlEI9kGMY912JbIXxoKBuCCoLfrhb6/p7UtdAgd6y2vxoUHatezLYSmJ30tWdXj6ePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9HSzHqVCSw8iZMf1fqdQJviIzghQfYB6zYSSQSzopg=;
 b=cFKKJ77x9oYZP5kvT5Wg7RfsnlP12PpzKJwa7qbMzKusR7pEKy4uIdo8rqltsNk00n8bRqT1YfZLkkHTSTJw64NpWKeULiFlCA3ZtjPyunr51HDfygO0Umio+ZZmqFXTj+xoF6AUs9CZfwRgFJ02zfi99J36ukJD4rHesfIDv+cPLtoJSTMqjHfLc4Th/B6TBqCkoxnpFhcLxNwTC2XOCo6AvgKT2edFCUwlva/D2miqmfblUKwQYDrVmhN2DtHlKgvhpAuD0H2hYzyxum0CK+1pt3hH3QmSjvgbqYtjxbd72SblcvmOnnjONI9FWt41MdR4l3hzxRIbk52gxuhq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9HSzHqVCSw8iZMf1fqdQJviIzghQfYB6zYSSQSzopg=;
 b=AB2x0HeTojz1Q7xNtphYTwl6c2AIvtWfANo8KxwfUi1W4RrxNc+/uHCbn0Q7Vi+CDhkn2ow5sNslqmd/j4EzrZXOGtqc/YtccOqkG39LHBis4EaNmHnppoGXHLAQdcKSpalSIdrc8rTkj/hPnMzWnLOBOZyBVJoQrItKldUsh8fKVVyZXv3JO/9CZFPqYEaxVtAE9S8L8WK4xBgxfETUx4G3WgDOMF4r0bX17l6s9FPEr6WDq4KSchR6GMl18F6k/wpzx2LF9NXikAtEd9njyyCQwolW2mXQ1L9kpZns+PFmsErGpQIKiplyxnQmepDyNqcdOA69PM7BHJlVm2quIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB7768.eurprd08.prod.outlook.com (2603:10a6:20b:52d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 13:11:57 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 13:11:56 +0000
Message-ID: <47718aa2-8e18-13c1-21f4-8cdf448c7c22@virtuozzo.com>
Date: Fri, 30 Sep 2022 15:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] qga: Add support for user password setting in FreeBSD
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-6-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CLY+ppqzddPJVPGqpST1Jk4zQMpQeC_Davmq2qiOnPoKA@mail.gmail.com>
 <6a7882a1-88ef-064a-ea71-aba0c7ee1981@virtuozzo.com>
 <CAJ+F1C+No1Sq8a-qtm1YdJVHrcx5puiFpz9TUO2Cg7nS8zq42A@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAJ+F1C+No1Sq8a-qtm1YdJVHrcx5puiFpz9TUO2Cg7nS8zq42A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::20) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad6207c-5fb9-4742-5c03-08daa2e559fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJlqSK1n6mM0Ift/sv6yR/x69R8pgYS8RPFImHFNCmybE++RS2abhQrhxkqyEKQOmUEkrKrBsLohrgmUJszloRPP7PfG0/1TsZz5lltz5JJxTVMI9pKThy6ptMj1rCwiuU24iepolM6+Z3Z8SA4m8QdDenlXDcD8OuYsQWrDeobeWhNq6gO6fi+STLPS/tVgqoQCFBb5jMVLC1QpsDqil4oaA+PcpcBwcL6s5Ifblz5Q75DA6FX8rBeLhKJ0A6yUnNktp/ieZ05lwVhPaxE2qrCP5Ut4XiSGz8i8tzluf0I/CLCJXEvSg9aQtUtS8/ISu2opQi5qxYIvPV3TTyTOK9XIN4NcLkfYQfE5Q9lbYIO8utGEOqCrG7gxJ5q6AUE4yIteHeT66SvGqcED2dT8yHaSJp+eux9RyQx1kTabe6vNW/oo9dVzvEw9KwZOS0LJsIOFz9iM7Jjp24fgdnwHZBe5TgJoR02ieSRIA9gU2fxWIn3fkWLYZ1P4mippf5YQqkFXQPVwWOGFWf0GuESNz1POOWqqGK5NIHAOcn/m/nV5irPju1ecS4E+2FxlC/gDCJ2Ij3x8x5mOruJnwoOaSSZIbhADO2lJ76ZPHqTvoYKpuOjcadlTUa/Pa8f6McTNRiTFU1fOA4S0AxxG23dVK/nA6Y6MBj+ipAWwTNSyimv4fO7eNojYpt7w/LKJDWPPtwquCTh/6vACuA49xgIyj9yNgnMa/rgyfPPE1HJHV0Es3yZoVRMHqzbsO70/K+GKJRbFEpImtcu6IXPJsBytYD16ZeBgqfQJQ4kUekiyOZPcezSvlfFHm2Qx2MfFSOGA1/BrXuhJcTO4tU1EZ7eZYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39850400004)(136003)(376002)(396003)(451199015)(44832011)(186003)(2616005)(52116002)(36756003)(2906002)(41300700001)(31696002)(6666004)(5660300002)(6512007)(86362001)(26005)(6506007)(53546011)(38350700002)(38100700002)(8936002)(83380400001)(478600001)(316002)(6916009)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmlnekZMVGFTS1VIL1ZwMmVIajFqVnlqVDZzZ25hSFJjOWMvNmpKNFZaTkZH?=
 =?utf-8?B?V1BkdzFRSzQyeDY1RE95b3FCRmU2a3oxLys1akxVbjBhdkt6OTlIYzB6OTlo?=
 =?utf-8?B?bnZubDNnbmxuQ0VkNUFLS1ArdkcwZmlCblVEdHRhWHlsM2poNXZ4bXBsQ1Rz?=
 =?utf-8?B?Uk1tNXBocFdXdnQwdkpQekNPSHJsUklEMWJnOWgrRmMraUJnZ0kyTGlmMGdW?=
 =?utf-8?B?SjRVUllxeXppSUJCYWh3ekdZc1hqQ1ExZi9iR3BYTjdmcUNaczR1cDFwM016?=
 =?utf-8?B?UDh5bzNhQ3d6Ykxvbk5HeHZMU055QmdwOE9zZlk4eGxEOFhseXpvc0dGODFM?=
 =?utf-8?B?RC8rUHFZMFFkRVRQLytlZmQwK2crVm5aa1UwMkhFSVVzc204ZkxIL2grZHJ3?=
 =?utf-8?B?U0lrb0ZyL1JOVjRNTFNkQ2lSeU5aWUJlaDRsMTFwcHJHdmo1U3VDalZ1SjJP?=
 =?utf-8?B?WG56bU9CeUJmM2RRcWc3TjMycGtQMUNac1pFNEJtRUJ6eVg0SEdBN3V5V0hs?=
 =?utf-8?B?V3YzaFlOdkIrd3pLbURCYmNHcjdKK1Izb3BJdzF4bHBkK1U1VFl0WUc4TStv?=
 =?utf-8?B?UmRqblJCZWsxb0xvWS9PclZxaVNTRXZZS3NTWVk4cnpOQ0RCWWhZOVUrNzhR?=
 =?utf-8?B?S0hSUzI3UnA3bExmd3Myanl1dkgvNTRDek9aZFpCTW16SUNCVUZsbzk1STJJ?=
 =?utf-8?B?M25BUmFINlM1Ni9qYkNOMnljZUVMVklPMjM1d29ZOGQ1TVJSNEUxMXdCT2E3?=
 =?utf-8?B?QURENmpJWVZwckFSMmx5djNxenRKYkJLU2FPU3RvK2FqVFlJMml0NDhQMTdj?=
 =?utf-8?B?dVZKc1pBeUlEeEJoaUo1SWlIUUw1Uk92NkttVGxCTnN1eUJJNk9CYzhJdml3?=
 =?utf-8?B?MWRhajNxcWJ0QTRENENHUEttcDlSL3JHUFJZalFHL2Z3bmpLVGZyL2lpb2VN?=
 =?utf-8?B?R1lDOW0rZWhMQ1NLNjRNT2l5NU9ESG03NzkvTG9DckdRNjNDTlBzSGdYS3Fs?=
 =?utf-8?B?TERZblRhY3lXaFNDckhzUWNMRThZWUpnbFdTaUwrWHZoQVNyRCtWNDlQSUJi?=
 =?utf-8?B?cjR5Nmw5WlhpeSs1VVphaDFBbk9IQ1hYVE42cHBaRzVYRjFRNllkNDJ0a2NK?=
 =?utf-8?B?VE4vTGlQb01JdHd1NW9Pa003cjdTOHVRb1dKaWtaYmUyNUlkMll4aWlSU0Fs?=
 =?utf-8?B?QlRPa2pnK0J3dDB1VndsdUFDd3orL2RuempxQlNzTkpoR3FXZVZIWlEwL016?=
 =?utf-8?B?dzRxemN1Yk9rNXU5Y1lwTE55L3FCY25CT3ZQM1ZyNXlQeWFsYW1qZFRDUEgw?=
 =?utf-8?B?eHJ3MmlQVW9sQTA4dk56ZnFXOTFWb1NIRVAvMlpMYVNVYWQxYmJWbFdxOEhi?=
 =?utf-8?B?NXFVOW9KSy9HTVZBbGZPL3pubEJUSG01SW1peUloWXkrTjRSTlhCZmN2VnNX?=
 =?utf-8?B?RVZTU1AwN3NmUHpXRit4cllNZEhZWGJWcmlkc24rNCtEdWlEOGd3ZDRGYSt1?=
 =?utf-8?B?d3pNWjZWbUxLRUtXNUxhdnpGSGJkMCszTHZqTFduTVBja1NhMGg1OHhta2pI?=
 =?utf-8?B?R1JSMllVN3Uwd2k4dzF0Qkh0b3RHL2JycjdkeW10ZDBqdmNzZ21GVUkvSTlr?=
 =?utf-8?B?N1Fod0hoREdyQVA4NmtQTlhrV2xiTWptYlViOHBPbVJ0V3ExTFpWUnlEbElD?=
 =?utf-8?B?OXJlVGR6UjgyM1JMRlgwWW9oT1FaQjNYY2UxcTFibk5mdTB0NHNnK2UvSE9u?=
 =?utf-8?B?bS9JY2t1U0xlL1FkaGlMcWxSVGJydGtrbENYNnh0THJMZ2FDK0Nsc0lFUmxZ?=
 =?utf-8?B?ZjZLejVETEY1bWlNWGVxekxqSElEYTFac3MxbUd2clhBS01vM1BhejhLZVIx?=
 =?utf-8?B?eGVqRnJFdjBmQU1SZXovSkJsWnNTcmY0OU9uZm1TclVoajBOSVdFOXg2UUl1?=
 =?utf-8?B?eGtocStvRGIzRUpnc25XODZZeWZxamtrMmpYb0NIbWZnWTU4eHpSRnRXV3N6?=
 =?utf-8?B?NTFIWnd0Yk0vdzdJY0VpN2FpTWtiOURwUTJMNVFMM0ZrdlBhbm1vLzFCTmFw?=
 =?utf-8?B?N1FqUUp4cHEvQVB3K1EwY0NLSFovYVBWV2NuemU0Y0x4R241SXV1REVXSU1H?=
 =?utf-8?B?MTRLMjhRTzRoZVYzQ0NaY2wxQnpmTmNFcVY3aldrc1RmNkJxcitYUFdXeVNl?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad6207c-5fb9-4742-5c03-08daa2e559fb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:11:56.8452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0qoq+lXqoozRaRiIQ5RdeN2PanaoSelUOiT/mwLurTN6dF5wSjxC65bYKJZspSZTJRdHK31UL90rI2QeUp6KzEO8MnBnqR5M9Uc2tMSqfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7768
Received-SPF: pass client-ip=2a01:111:f400:fe1f::724;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi

On 30.09.2022 10:19, Marc-André Lureau wrote:
>
> 	
> Caution: This is an external email and has a suspicious subject or 
> content. Please take care when clicking links or opening attachments. 
> When in doubt, contact your IT Department
>
>
> Hi
>
> On Thu, Sep 29, 2022 at 6:29 PM Alexander Ivanov 
> <alexander.ivanov@virtuozzo.com> wrote:
>
>
>     On 29.09.2022 13:22, Marc-André Lureau wrote:
>     >
>     >
>     > Caution: This is an external email and has a suspicious subject or
>     > content. Please take care when clicking links or opening
>     attachments.
>     > When in doubt, contact your IT Department
>     >
>     >
>     > Hi Alexander
>     >
>     > On Thu, Sep 29, 2022 at 12:52 PM Alexander Ivanov
>     > <alexander.ivanov@virtuozzo.com> wrote:
>     >
>     >     Move qmp_guest_set_user_password() from __linux__ condition to
>     >     (__linux__ || __FreeBSD__) condition. Add command and arguments
>     >     for password setting in FreeBSD.
>     >
>     >     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>     >
>     >
>     > Could you explain why you need to move the code?
>     >
>     > You could instead have a top declaration?
>     Now qmp_guest_set_user_password()is under #ifdef __linux__. I want to
>     use this function for FreeBSD too, so I moved it under (__linux__ ||
>     __FreeBSD__) condition. I could create another function for
>     FreeBSD but
>
>
> Why not make the following change?
I thought it is a bad idea to multiply pieces of code under the same 
arch conditions. OK, I will change the code in this way. Thank you.
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 88e0d0fe24..78a345c9f3 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2122,7 +2122,9 @@ int64_t 
> qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>
>      return processed;
>  }
> +#endif /* linux */
>
> +#if defined(__linux__) || defined(__FreeBSD__)
>  void qmp_guest_set_user_password(const char *username,
>                                   const char *password,
>                                   bool crypted,
> @@ -2227,7 +2229,9 @@ out:
>          close(datafd[1]);
>      }
>  }
> +#endif /* linux || freebsd */
>
> +#if defined(__linux__)
>  static void ga_read_sysfs_file(int dirfd, const char *pathname, char 
> *buf,
>                                 int size, Error **errp)
>  {
>
>     it would lead to code duplication. Unfortunately I don't see
>     another way
>     to do it except to add (__linux__ || __FreeBSD__) condition, cut the
>     function and paste in this condition. If you could suggest another
>     way I
>     would happy.
>     > If it's really required, please split the patch in move + additions.
>     Just moving the function without other changes leads to
>     unbuildable code
>     in FreeBSD. I thought it's worse than moving and changing at the same
>     time. I split the patch if you prefer.
>
>     >
>     >     ---
>     >      qga/commands-posix.c | 223
>     >     +++++++++++++++++++++++--------------------
>     >      1 file changed, 118 insertions(+), 105 deletions(-)
>     >
>     >     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     >     index 88e0d0fe24..6ce894ca6e 100644
>     >     --- a/qga/commands-posix.c
>     >     +++ b/qga/commands-posix.c
>     >     @@ -2123,111 +2123,6 @@ int64_t
>     >     qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error
>     **errp)
>     >          return processed;
>     >      }
>     >
>     >     -void qmp_guest_set_user_password(const char *username,
>     >     -                                 const char *password,
>     >     -                                 bool crypted,
>     >     -                                 Error **errp)
>     >     -{
>     >     -    Error *local_err = NULL;
>     >     -    char *passwd_path = NULL;
>     >     -    pid_t pid;
>     >     -    int status;
>     >     -    int datafd[2] = { -1, -1 };
>     >     -    char *rawpasswddata = NULL;
>     >     -    size_t rawpasswdlen;
>     >     -    char *chpasswddata = NULL;
>     >     -    size_t chpasswdlen;
>     >     -
>     >     -    rawpasswddata = (char *)qbase64_decode(password, -1,
>     >     &rawpasswdlen, errp);
>     >     -    if (!rawpasswddata) {
>     >     -        return;
>     >     -    }
>     >     -    rawpasswddata = g_renew(char, rawpasswddata,
>     rawpasswdlen + 1);
>     >     -    rawpasswddata[rawpasswdlen] = '\0';
>     >     -
>     >     -    if (strchr(rawpasswddata, '\n')) {
>     >     -        error_setg(errp, "forbidden characters in raw
>     password");
>     >     -        goto out;
>     >     -    }
>     >     -
>     >     -    if (strchr(username, '\n') ||
>     >     -        strchr(username, ':')) {
>     >     -        error_setg(errp, "forbidden characters in username");
>     >     -        goto out;
>     >     -    }
>     >     -
>     >     -    chpasswddata = g_strdup_printf("%s:%s\n", username,
>     >     rawpasswddata);
>     >     -    chpasswdlen = strlen(chpasswddata);
>     >     -
>     >     -    passwd_path = g_find_program_in_path("chpasswd");
>     >     -
>     >     -    if (!passwd_path) {
>     >     -        error_setg(errp, "cannot find 'passwd' program in
>     PATH");
>     >     -        goto out;
>     >     -    }
>     >     -
>     >     -    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>     >     -        error_setg(errp, "cannot create pipe FDs");
>     >     -        goto out;
>     >     -    }
>     >     -
>     >     -    pid = fork();
>     >     -    if (pid == 0) {
>     >     -        close(datafd[1]);
>     >     -        /* child */
>     >     -        setsid();
>     >     -        dup2(datafd[0], 0);
>     >     -        reopen_fd_to_null(1);
>     >     -        reopen_fd_to_null(2);
>     >     -
>     >     -        if (crypted) {
>     >     -            execl(passwd_path, "chpasswd", "-e", NULL);
>     >     -        } else {
>     >     -            execl(passwd_path, "chpasswd", NULL);
>     >     -        }
>     >     -        _exit(EXIT_FAILURE);
>     >     -    } else if (pid < 0) {
>     >     -        error_setg_errno(errp, errno, "failed to create child
>     >     process");
>     >     -        goto out;
>     >     -    }
>     >     -    close(datafd[0]);
>     >     -    datafd[0] = -1;
>     >     -
>     >     -    if (qemu_write_full(datafd[1], chpasswddata,
>     chpasswdlen) !=
>     >     chpasswdlen) {
>     >     -        error_setg_errno(errp, errno, "cannot write new account
>     >     password");
>     >     -        goto out;
>     >     -    }
>     >     -    close(datafd[1]);
>     >     -    datafd[1] = -1;
>     >     -
>     >     -    ga_wait_child(pid, &status, &local_err);
>     >     -    if (local_err) {
>     >     -        error_propagate(errp, local_err);
>     >     -        goto out;
>     >     -    }
>     >     -
>     >     -    if (!WIFEXITED(status)) {
>     >     -        error_setg(errp, "child process has terminated
>     abnormally");
>     >     -        goto out;
>     >     -    }
>     >     -
>     >     -    if (WEXITSTATUS(status)) {
>     >     -        error_setg(errp, "child process has failed to set user
>     >     password");
>     >     -        goto out;
>     >     -    }
>     >     -
>     >     -out:
>     >     -    g_free(chpasswddata);
>     >     -    g_free(rawpasswddata);
>     >     -    g_free(passwd_path);
>     >     -    if (datafd[0] != -1) {
>     >     -        close(datafd[0]);
>     >     -    }
>     >     -    if (datafd[1] != -1) {
>     >     -        close(datafd[1]);
>     >     -    }
>     >     -}
>     >     -
>     >      static void ga_read_sysfs_file(int dirfd, const char *pathname,
>     >     char *buf,
>     >                                     int size, Error **errp)
>     >      {
>     >     @@ -2793,6 +2688,124 @@ GuestMemoryBlockInfo
>     >     *qmp_guest_get_memory_block_info(Error **errp)
>     >
>     >      #endif
>     >
>     >     +#if defined(__linux__) || defined(__FreeBSD__)
>     >     +void qmp_guest_set_user_password(const char *username,
>     >     +                                 const char *password,
>     >     +                                 bool crypted,
>     >     +                                 Error **errp)
>     >     +{
>     >     +    Error *local_err = NULL;
>     >     +    char *passwd_path = NULL;
>     >     +    pid_t pid;
>     >     +    int status;
>     >     +    int datafd[2] = { -1, -1 };
>     >     +    char *rawpasswddata = NULL;
>     >     +    size_t rawpasswdlen;
>     >     +    char *chpasswddata = NULL;
>     >     +    size_t chpasswdlen;
>     >     +
>     >     +    rawpasswddata = (char *)qbase64_decode(password, -1,
>     >     &rawpasswdlen, errp);
>     >     +    if (!rawpasswddata) {
>     >     +        return;
>     >     +    }
>     >     +    rawpasswddata = g_renew(char, rawpasswddata,
>     rawpasswdlen + 1);
>     >     +    rawpasswddata[rawpasswdlen] = '\0';
>     >     +
>     >     +    if (strchr(rawpasswddata, '\n')) {
>     >     +        error_setg(errp, "forbidden characters in raw
>     password");
>     >     +        goto out;
>     >     +    }
>     >     +
>     >     +    if (strchr(username, '\n') ||
>     >     +        strchr(username, ':')) {
>     >     +        error_setg(errp, "forbidden characters in username");
>     >     +        goto out;
>     >     +    }
>     >     +
>     >     +#ifdef __FreeBSD__
>     >     +    chpasswddata = g_strdup(rawpasswddata);
>     >     +    passwd_path = g_find_program_in_path("pw");
>     >     +#else
>     >     +    chpasswddata = g_strdup_printf("%s:%s\n", username,
>     >     rawpasswddata);
>     >     +    passwd_path = g_find_program_in_path("chpasswd");
>     >     +#endif
>     >     +
>     >     +    chpasswdlen = strlen(chpasswddata);
>     >     +
>     >     +    if (!passwd_path) {
>     >     +        error_setg(errp, "cannot find 'passwd' program in
>     PATH");
>     >     +        goto out;
>     >     +    }
>     >     +
>     >     +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>     >     +        error_setg(errp, "cannot create pipe FDs");
>     >     +        goto out;
>     >     +    }
>     >     +
>     >     +    pid = fork();
>     >     +    if (pid == 0) {
>     >     +        close(datafd[1]);
>     >     +        /* child */
>     >     +        setsid();
>     >     +        dup2(datafd[0], 0);
>     >     +        reopen_fd_to_null(1);
>     >     +        reopen_fd_to_null(2);
>     >     +
>     >     +#ifdef __FreeBSD__
>     >     +        const char *h_arg;
>     >     +        h_arg = (crypted) ? "-H" : "-h";
>     >     +        execl(passwd_path, "pw", "usermod", "-n", username,
>     >     h_arg, "0", NULL);
>     >     +#else
>     >     +        if (crypted) {
>     >     +            execl(passwd_path, "chpasswd", "-e", NULL);
>     >     +        } else {
>     >     +            execl(passwd_path, "chpasswd", NULL);
>     >     +        }
>     >     +#endif
>     >     +        _exit(EXIT_FAILURE);
>     >     +    } else if (pid < 0) {
>     >     +        error_setg_errno(errp, errno, "failed to create child
>     >     process");
>     >     +        goto out;
>     >     +    }
>     >     +    close(datafd[0]);
>     >     +    datafd[0] = -1;
>     >     +
>     >     +    if (qemu_write_full(datafd[1], chpasswddata,
>     chpasswdlen) !=
>     >     chpasswdlen) {
>     >     +        error_setg_errno(errp, errno, "cannot write new account
>     >     password");
>     >     +        goto out;
>     >     +    }
>     >     +    close(datafd[1]);
>     >     +    datafd[1] = -1;
>     >     +
>     >     +    ga_wait_child(pid, &status, &local_err);
>     >     +    if (local_err) {
>     >     +        error_propagate(errp, local_err);
>     >     +        goto out;
>     >     +    }
>     >     +
>     >     +    if (!WIFEXITED(status)) {
>     >     +        error_setg(errp, "child process has terminated
>     abnormally");
>     >     +        goto out;
>     >     +    }
>     >     +
>     >     +    if (WEXITSTATUS(status)) {
>     >     +        error_setg(errp, "child process has failed to set user
>     >     password");
>     >     +        goto out;
>     >     +    }
>     >     +
>     >     +out:
>     >     +    g_free(chpasswddata);
>     >     +    g_free(rawpasswddata);
>     >     +    g_free(passwd_path);
>     >     +    if (datafd[0] != -1) {
>     >     +        close(datafd[0]);
>     >     +    }
>     >     +    if (datafd[1] != -1) {
>     >     +        close(datafd[1]);
>     >     +    }
>     >     +}
>     >     +#endif
>     >     +
>     >      #ifdef HAVE_GETIFADDRS
>     >      static GuestNetworkInterface *
>     >      guest_find_interface(GuestNetworkInterfaceList *head,
>     >     --
>     >     2.34.1
>     >
>     >
>     >
>     >
>     > --
>     > Marc-André Lureau
>
>
>
> -- 
> Marc-André Lureau

