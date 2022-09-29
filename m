Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C65EF9A5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:59:09 +0200 (CEST)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvwJ-0002BT-OT
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oduXs-0008RL-HK
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:29:51 -0400
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:9853 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oduXi-0005So-VK
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:29:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XouhQ6dDrra9wEQIPqWByvqm2nSH3TZyKb58i61t10rpJ5AUWWjkilRBb2rspGvekr1aiy3BY9r/3q/7xehMblMM2htc4j/leWilWD+ItcuxOTLJ5+7/8TEUtZXjmFh7WlsW+9PWLm3Y6mSStuNX7juHhu0qt5kinMXBhdD/HJ3pxIultWaF090Wdekvk9NI44gnnfj0sVWQiq9HLflPMHPmhTfZTDdWfHw90z+OsH9EJgrv+uADdrVPD1Fb3kUbmy0Y3nxLgy3xdfYQbFibiiz8m3aEoJR4ANENGYNneiCnnevNBcHDhlBaqf4OA0gd9NLAbme5/OuG1VqGCmFLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tovc6aR+KlOKXjsY3Pc2HJkROOXl+FXYfwy0hDPMFeM=;
 b=mExXZCyOafj8L1sAngOkTuBhyzFhEbjoD3Wu0wpJ/HIN+Y9RCEfSRkayJVFiSZL/T8iuodwScBQAEjAPhFnhBKJxAXoJfeKgfXqnEzoJ6WQjyeDhdp72AP9OVGqRKvS4X7xs5fjQ5xx5fbYkp28QM9VZBW4dnKce7QHt39309k8kOIkkYKTZB74prwxHYadc7OkDGgFL2rOf7GwidJ+CaLoKx544rMv9ZqPg/oM6qFqtrML99BTf4pcMC3RuZYLuEBkUmBJQuDUFE3WPxJuxS+EdkT5uzdSX4pHI52FsagVP/0wsE793EhcjaSIzrRF/if5sjPZIfWIHXSjIceF42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tovc6aR+KlOKXjsY3Pc2HJkROOXl+FXYfwy0hDPMFeM=;
 b=rmSFY/HKK9BruRBSWgT8CPKOFmBzBkAauSFrQ67RqWRi/3wvtirtGD38N7k87RTO2XNSzhqDmlZ0Lq/ZuB6iMhGH+1jtzyoUdsLN3iFaJ1Ab2c5XLFvXBRwo1BVqqR/20qLM4kFg9d+X7e31OqAUuYT1RUW/s2Qnw1oLGvfs4kfyUljgRbqXLTDQ4YuULtltCpt0rIY9/cHyad3TlzIUDRMO+PArQHEydDGFAX3GN9QQEf2HpMzHek384siCiXVXdmb+X1eYYFpOld5woy05pY9ACaUSefo5L1HCNRAsKOZ4UBFAAnH5zQq2V/QLRH5r0piKID5idsFJYqiV4K2mNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6640.eurprd08.prod.outlook.com (2603:10a6:102:dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 14:29:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 14:29:34 +0000
Message-ID: <6a7882a1-88ef-064a-ea71-aba0c7ee1981@virtuozzo.com>
Date: Thu, 29 Sep 2022 16:29:32 +0200
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
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAJ+F1CLY+ppqzddPJVPGqpST1Jk4zQMpQeC_Davmq2qiOnPoKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0505.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::31) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c860d0-8cbc-4ed0-39b0-08daa22707f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w9Op+zZ5QdUZ8brRvqfsnrNMBUknQcaFO1kP01QIgC+bot/w7L0U6QAc+bwCQZxNuDTVVIWSNhO0/WJM1qehOYLfnrym4RCNAHZxPOs9rdEo0XMdKFDaRp+w49QfZl7W1kK+9nxHVG2kgrmxCLWJ98ok9Iqclj8QDAHKdPQcW4uOae6nlI/7Exd062u0VZzBKhSYS4fAOprz+bMTUznABany2Pppk/Um3NZhsPwKHrn37udTg0IrGz25I+TaEvry5sk7s3nvgE5SMz/iO3d9vYIK38R4jVsEFoyoS6BrPQRO/O3w75mzd0NJG7RXw1pPw6DM76tUvYj8Es7DJBeV5u8mP2IK4SgogyKOrsjJGxfHLqvPhM2ayygTJNo8FgQ9lfDNbT8I5Qi/v5nqX3vS4gy3/qDHIYk2Y5+TQ8rEL7kQ+hAPkju259PUJ++LsKfl6Hogyfayh4AqSDLifW2D8NFMCQYe6BYrxVSuIRgpY0yfZHPb3PpXqS+ye88ubFHOGAHe3PeSuEzZKrorfhkUoWIltcX29qKA5eJnV4WA9wnLbXDfdWpLLFPCgJ2oJj8/kDGjQETRLEoYQ2EUPWQHtBfhg21NOCK1Sx15MW5NZxMg3rcVSK+k/8IRtisatk8nFjW4G3QkP7/Qdm1QfQ3KKbEHh0j7jKQVapPkp4Xwk1VdKIwLhpE7kf3Eq6BNchW4fNCR9oFERfIlw5cOqcwMTJwfXx2yzK9/5MsWi5r4mgkxQwyhQb3V9jccM163Pz9e2UBfXAZq3fBFkgkRrmvqFynSnEJNwQ44OTR6fHnFP8jS49sp7vcsKqht2rlQZIirxr5OXB3t06Z39CIH63OeTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(451199015)(38100700002)(38350700002)(31696002)(86362001)(36756003)(6916009)(6506007)(4326008)(41300700001)(8676002)(5660300002)(478600001)(6512007)(53546011)(8936002)(66476007)(66556008)(52116002)(6486002)(26005)(66946007)(316002)(83380400001)(2616005)(2906002)(186003)(44832011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODlNNTd5V1NSekNhS2dhaFduZHlWRXkzS0Z6dG1uck0vWWVBcHRwL3RVZEJW?=
 =?utf-8?B?cGxQYjdackZGUk1KUllMZWE1Mkx6OHZFUThWK2VPb29ZQnRiN08veVhJMjh0?=
 =?utf-8?B?UngwdldjYmIwSXZlUEg0dDJoaEUrdXZTTXQvWUl5OHNJc01IYUlVcy9xVnpj?=
 =?utf-8?B?SHhsZFpXcnhKSUxSeUhOSmtsbG45djJWQm9TYm1aVG5tV2p5RzVsTUZsQ0VS?=
 =?utf-8?B?alZYd0RESk96OWt5enNhV2NoSGVoY0hyK1luVW5wZXpRT2t0Z1Vsem5nTFdt?=
 =?utf-8?B?dlVSZnMvaTZ1ZDMyWmFXcEtyQVlkV0Q0c1I1N1Vib0RwVU85ZVBZdmdwODdB?=
 =?utf-8?B?MTBndytxVk11L3hYamcrMWpranpYeVNhL09FQlU4OEVnVjJZcjZYZ2VGZkYr?=
 =?utf-8?B?Q2s2UHdEMjZwZUZ5T2cwcHBqVXRFQmIrNW5XaUV5RUZxeUQ1Y1NxaEsvdFhp?=
 =?utf-8?B?dXF1ZTlZQWpqWTBPZGFJdnFVaWV5ZEg0SHRabnBVOVR3ZFlTZzVjT3NYVWVJ?=
 =?utf-8?B?ZGxxYXBsNzNFTUdSMEZuSjVCcTJIcHB5d1ZBSkhOd1JKSC9YWG1iNzFhbVRo?=
 =?utf-8?B?eGFOTXpJQVV0Ym5RVXdaYU40ZE14R0FlQ3FDVXVuTkFUT0R0ZjVkTG5zYkhK?=
 =?utf-8?B?WklaTDQrNnlZWWRHVWoxYitvOGdpaTFKdWhPUEJ1VThEbEV6akpyblM3d3g3?=
 =?utf-8?B?clFHNTJCdHgvNlU4TGFXNk03QStYUHlSYTNvT2NieUlGRlNRYkwvLzN2NldZ?=
 =?utf-8?B?RGxGMlpMT2xQbU1RbGk2c3BJSm1IS1dXMndaaWxQbEpxbTl4ZHVWVjh6NXNO?=
 =?utf-8?B?QmZURUhpQ2NJV2pleG0rMmpuSDJSRXZkdkRIMkovQlBMREZidkVyTXlNeVZo?=
 =?utf-8?B?RldUb1p6SFUrSCs0cDBjOVFlUjhQZ29RVUtSSytJOUdBT2RlS0p3bkYxSWRk?=
 =?utf-8?B?TkI5RXdwMzZGN1ZSdU54MEhoWHd2NEF4OVNMTGh5elVuVmdaY2FFYjV5ZGp3?=
 =?utf-8?B?OVdVblRvcUtXRy9wQVJRWWVWTGNxQWVvb3FGSXBrRURUdTJES09Udi9Pck1h?=
 =?utf-8?B?NE1FRE1UMzdpR1JiMXFsdWxFYnRiR281Ri9jc25MK0lkRWU2OGR1a2JZNW52?=
 =?utf-8?B?aWNtMnlFMVErcHhGWXQ3Ri9zRWlCcWI5V0hzNXRrMlh1R0hNN3g3NWw3dlpX?=
 =?utf-8?B?Q1E3cHMvU01pcmVabVdLK3A2RlVtMkxMRzhrNTdmQkFod3N1SVEwdk91c2V6?=
 =?utf-8?B?Nkc4Y0hoTEwwL0xBdDlNb2RPVkVqbnNrWXdwd1BiTU50RkJGQTFxUkFmSmVQ?=
 =?utf-8?B?OU9QdkJ0Q1JVenVXL2U1Z2FDeDlNVWxtTzlPRC9UWmpnTEkzVnFQd3BrSlJP?=
 =?utf-8?B?MVlsVkM3ekZNc2dtazlkSFRQZjR6ZjkvMmFidHpWbzhBZ2Yvei9IUXJ5YVo1?=
 =?utf-8?B?MzJFdW5IbndGMUxDMXJlNkhPVXZsZEZuUzlKUGVUZWFUN1hucTJmRDZuZVE2?=
 =?utf-8?B?ZHkyVHo4bzBLb3dGTU10SVpqZVFJL09URmZoQm1mN3BDWEpIZGw5ZTZjMWNl?=
 =?utf-8?B?cUtDU3dUbTdlSFF1RW9UNC8rL0F4SWNTMUFueDB1OCtSWFFHRS9ncU1PQlpV?=
 =?utf-8?B?ejQ3WHZabGVuZm1hMVNZWjdXSmZkeEpZaG5SUWVvWWpFZS9zYnl2L044WUVv?=
 =?utf-8?B?RTlhT3FWNVZSMnNLdGttS0JCWHJJV3VhV1VtNlNNYzdCU0wwaHpQTDhxV0Vs?=
 =?utf-8?B?RDlQQ3ZSdUlzcmZ3NmU5dDlWd0JpeVNvb2NWUkRrQzY0TEFiRm1BWHpBVG5K?=
 =?utf-8?B?djNzU3RsSVhpS0RmTW02cGJmcE5ZaForU0FEZWhzditJMjYySlM5MHBianlR?=
 =?utf-8?B?RnI5eUpuRndRdEZKSWFQejA2UnNNajEwbUxVTXorQ3RNV3VmWUgrL2F2Rkdl?=
 =?utf-8?B?TFcyMG51SktRQmVCbUVFbEJKVEcyK0FhYVFXN2hTRFUyMTZZTlVqRWtmejh2?=
 =?utf-8?B?bzJzUnZadTBkZm9idnlIUXVQclcvK3BjTTBRYTdIbXBNQWxiRUw0VHFJYlNB?=
 =?utf-8?B?MEdiR3N1TjlpVFV4T1d0MzczMU1FNHQ5Sy9UeXM1VHpreEM4TW42SlBqSHJv?=
 =?utf-8?B?ZXZFaHBxTEdBS24wenpLSXc3UUpEbGVCS21PM0RHR3JZZTdLL3JQaG9jZ20y?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c860d0-8cbc-4ed0-39b0-08daa22707f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 14:29:34.8113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBrgdlzXn+RlyLXiXwRyePIjsIT9V49YQuh8pot6nMTMwzZC5ouOfAsBllf/jQkVRX66l36uOiJfvR+OVFP2qLBW02AtxAjtdFpgIpmYdo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6640
Received-SPF: pass client-ip=40.107.20.122;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


On 29.09.2022 13:22, Marc-André Lureau wrote:
>
> 	
> Caution: This is an external email and has a suspicious subject or 
> content. Please take care when clicking links or opening attachments. 
> When in doubt, contact your IT Department
>
>
> Hi Alexander
>
> On Thu, Sep 29, 2022 at 12:52 PM Alexander Ivanov 
> <alexander.ivanov@virtuozzo.com> wrote:
>
>     Move qmp_guest_set_user_password() from __linux__ condition to
>     (__linux__ || __FreeBSD__) condition. Add command and arguments
>     for password setting in FreeBSD.
>
>     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>
>
> Could you explain why you need to move the code?
>
> You could instead have a top declaration?
Now qmp_guest_set_user_password()is under #ifdef __linux__. I want to 
use this function for FreeBSD too, so I moved it under (__linux__ || 
__FreeBSD__) condition. I could create another function for FreeBSD but 
it would lead to code duplication. Unfortunately I don't see another way 
to do it except to add (__linux__ || __FreeBSD__) condition, cut the 
function and paste in this condition. If you could suggest another way I 
would happy.
> If it's really required, please split the patch in move + additions.
Just moving the function without other changes leads to unbuildable code 
in FreeBSD. I thought it's worse than moving and changing at the same 
time. I split the patch if you prefer.
>
>     ---
>      qga/commands-posix.c | 223
>     +++++++++++++++++++++++--------------------
>      1 file changed, 118 insertions(+), 105 deletions(-)
>
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index 88e0d0fe24..6ce894ca6e 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -2123,111 +2123,6 @@ int64_t
>     qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
>          return processed;
>      }
>
>     -void qmp_guest_set_user_password(const char *username,
>     -                                 const char *password,
>     -                                 bool crypted,
>     -                                 Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    char *passwd_path = NULL;
>     -    pid_t pid;
>     -    int status;
>     -    int datafd[2] = { -1, -1 };
>     -    char *rawpasswddata = NULL;
>     -    size_t rawpasswdlen;
>     -    char *chpasswddata = NULL;
>     -    size_t chpasswdlen;
>     -
>     -    rawpasswddata = (char *)qbase64_decode(password, -1,
>     &rawpasswdlen, errp);
>     -    if (!rawpasswddata) {
>     -        return;
>     -    }
>     -    rawpasswddata = g_renew(char, rawpasswddata, rawpasswdlen + 1);
>     -    rawpasswddata[rawpasswdlen] = '\0';
>     -
>     -    if (strchr(rawpasswddata, '\n')) {
>     -        error_setg(errp, "forbidden characters in raw password");
>     -        goto out;
>     -    }
>     -
>     -    if (strchr(username, '\n') ||
>     -        strchr(username, ':')) {
>     -        error_setg(errp, "forbidden characters in username");
>     -        goto out;
>     -    }
>     -
>     -    chpasswddata = g_strdup_printf("%s:%s\n", username,
>     rawpasswddata);
>     -    chpasswdlen = strlen(chpasswddata);
>     -
>     -    passwd_path = g_find_program_in_path("chpasswd");
>     -
>     -    if (!passwd_path) {
>     -        error_setg(errp, "cannot find 'passwd' program in PATH");
>     -        goto out;
>     -    }
>     -
>     -    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>     -        error_setg(errp, "cannot create pipe FDs");
>     -        goto out;
>     -    }
>     -
>     -    pid = fork();
>     -    if (pid == 0) {
>     -        close(datafd[1]);
>     -        /* child */
>     -        setsid();
>     -        dup2(datafd[0], 0);
>     -        reopen_fd_to_null(1);
>     -        reopen_fd_to_null(2);
>     -
>     -        if (crypted) {
>     -            execl(passwd_path, "chpasswd", "-e", NULL);
>     -        } else {
>     -            execl(passwd_path, "chpasswd", NULL);
>     -        }
>     -        _exit(EXIT_FAILURE);
>     -    } else if (pid < 0) {
>     -        error_setg_errno(errp, errno, "failed to create child
>     process");
>     -        goto out;
>     -    }
>     -    close(datafd[0]);
>     -    datafd[0] = -1;
>     -
>     -    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=
>     chpasswdlen) {
>     -        error_setg_errno(errp, errno, "cannot write new account
>     password");
>     -        goto out;
>     -    }
>     -    close(datafd[1]);
>     -    datafd[1] = -1;
>     -
>     -    ga_wait_child(pid, &status, &local_err);
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -        goto out;
>     -    }
>     -
>     -    if (!WIFEXITED(status)) {
>     -        error_setg(errp, "child process has terminated abnormally");
>     -        goto out;
>     -    }
>     -
>     -    if (WEXITSTATUS(status)) {
>     -        error_setg(errp, "child process has failed to set user
>     password");
>     -        goto out;
>     -    }
>     -
>     -out:
>     -    g_free(chpasswddata);
>     -    g_free(rawpasswddata);
>     -    g_free(passwd_path);
>     -    if (datafd[0] != -1) {
>     -        close(datafd[0]);
>     -    }
>     -    if (datafd[1] != -1) {
>     -        close(datafd[1]);
>     -    }
>     -}
>     -
>      static void ga_read_sysfs_file(int dirfd, const char *pathname,
>     char *buf,
>                                     int size, Error **errp)
>      {
>     @@ -2793,6 +2688,124 @@ GuestMemoryBlockInfo
>     *qmp_guest_get_memory_block_info(Error **errp)
>
>      #endif
>
>     +#if defined(__linux__) || defined(__FreeBSD__)
>     +void qmp_guest_set_user_password(const char *username,
>     +                                 const char *password,
>     +                                 bool crypted,
>     +                                 Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    char *passwd_path = NULL;
>     +    pid_t pid;
>     +    int status;
>     +    int datafd[2] = { -1, -1 };
>     +    char *rawpasswddata = NULL;
>     +    size_t rawpasswdlen;
>     +    char *chpasswddata = NULL;
>     +    size_t chpasswdlen;
>     +
>     +    rawpasswddata = (char *)qbase64_decode(password, -1,
>     &rawpasswdlen, errp);
>     +    if (!rawpasswddata) {
>     +        return;
>     +    }
>     +    rawpasswddata = g_renew(char, rawpasswddata, rawpasswdlen + 1);
>     +    rawpasswddata[rawpasswdlen] = '\0';
>     +
>     +    if (strchr(rawpasswddata, '\n')) {
>     +        error_setg(errp, "forbidden characters in raw password");
>     +        goto out;
>     +    }
>     +
>     +    if (strchr(username, '\n') ||
>     +        strchr(username, ':')) {
>     +        error_setg(errp, "forbidden characters in username");
>     +        goto out;
>     +    }
>     +
>     +#ifdef __FreeBSD__
>     +    chpasswddata = g_strdup(rawpasswddata);
>     +    passwd_path = g_find_program_in_path("pw");
>     +#else
>     +    chpasswddata = g_strdup_printf("%s:%s\n", username,
>     rawpasswddata);
>     +    passwd_path = g_find_program_in_path("chpasswd");
>     +#endif
>     +
>     +    chpasswdlen = strlen(chpasswddata);
>     +
>     +    if (!passwd_path) {
>     +        error_setg(errp, "cannot find 'passwd' program in PATH");
>     +        goto out;
>     +    }
>     +
>     +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>     +        error_setg(errp, "cannot create pipe FDs");
>     +        goto out;
>     +    }
>     +
>     +    pid = fork();
>     +    if (pid == 0) {
>     +        close(datafd[1]);
>     +        /* child */
>     +        setsid();
>     +        dup2(datafd[0], 0);
>     +        reopen_fd_to_null(1);
>     +        reopen_fd_to_null(2);
>     +
>     +#ifdef __FreeBSD__
>     +        const char *h_arg;
>     +        h_arg = (crypted) ? "-H" : "-h";
>     +        execl(passwd_path, "pw", "usermod", "-n", username,
>     h_arg, "0", NULL);
>     +#else
>     +        if (crypted) {
>     +            execl(passwd_path, "chpasswd", "-e", NULL);
>     +        } else {
>     +            execl(passwd_path, "chpasswd", NULL);
>     +        }
>     +#endif
>     +        _exit(EXIT_FAILURE);
>     +    } else if (pid < 0) {
>     +        error_setg_errno(errp, errno, "failed to create child
>     process");
>     +        goto out;
>     +    }
>     +    close(datafd[0]);
>     +    datafd[0] = -1;
>     +
>     +    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=
>     chpasswdlen) {
>     +        error_setg_errno(errp, errno, "cannot write new account
>     password");
>     +        goto out;
>     +    }
>     +    close(datafd[1]);
>     +    datafd[1] = -1;
>     +
>     +    ga_wait_child(pid, &status, &local_err);
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +        goto out;
>     +    }
>     +
>     +    if (!WIFEXITED(status)) {
>     +        error_setg(errp, "child process has terminated abnormally");
>     +        goto out;
>     +    }
>     +
>     +    if (WEXITSTATUS(status)) {
>     +        error_setg(errp, "child process has failed to set user
>     password");
>     +        goto out;
>     +    }
>     +
>     +out:
>     +    g_free(chpasswddata);
>     +    g_free(rawpasswddata);
>     +    g_free(passwd_path);
>     +    if (datafd[0] != -1) {
>     +        close(datafd[0]);
>     +    }
>     +    if (datafd[1] != -1) {
>     +        close(datafd[1]);
>     +    }
>     +}
>     +#endif
>     +
>      #ifdef HAVE_GETIFADDRS
>      static GuestNetworkInterface *
>      guest_find_interface(GuestNetworkInterfaceList *head,
>     -- 
>     2.34.1
>
>
>
>
> -- 
> Marc-André Lureau

