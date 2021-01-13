Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D82F5367
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:34:15 +0100 (CET)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzluI-0003xy-Am
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzlne-0000oc-Oj; Wed, 13 Jan 2021 14:27:22 -0500
Received: from mail-db8eur05on2101.outbound.protection.outlook.com
 ([40.107.20.101]:53665 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzlnb-0005R6-9w; Wed, 13 Jan 2021 14:27:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwJMiBEQmN8uHnKAOie19sToJyRTJn0VTdzu7YkVZibXuB3j+ocKpdMAC+7z3qUirWWi5d4T2wltdZoKImrjvH0KDvCFQ4WzMOd6hc6RC1kWEeBG2lVkERO6CQv8Wh77C36TKIVh3dV3trBVgXqr6O5iHZ5S4eit0TIF4kT5BlEcV5vYm4HcDiiF1Y3PIU4o+CXQbvKf518R5aXDC6WcgrX5tr6ztZpv6UygEJ8z8Ew1M1Nl1OaboOR3vsC5NwPrrMnoW525fxyvmoF0gEpk98wU5h3rN5L3sOOcLjjAZtgNYcRPr6CBBSVvcyOPIjU9NfHcautFBWiwY6fuE6Aciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qo5ZP1qckQ14dKTfZLFqtQpiq9KlNRfKrJ4pN/4aljI=;
 b=U7lvsT7WCncHKo1vSpaomuGg8o6OF7m0SroON8CYqHRpxiVPQQxvuvTJNobUAyastehWgNDRWLRKppWtw77p11G4WC+VwwNcC6qJ7WPKOMEX7mXpJChGisuAVO+22mM58bGMucLnsvlCqA/pyWOBBqANmT08uoutyymITv324MrdHRNTrptO8R3Ht20oNhEqnTtFEc1OA7fW/T6OlkmPAD9Foc9FaYCEyxr+qTrvjeb08FPTzjHajBiKjY5ZNh9GS8iksA/2vJ7/ImP9rnGHVWwIm4qdyd+pHxktptS+CaK0gukYb0HjWrQQ39hL7Voxx/UhUlWj43hOY63KMTmybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qo5ZP1qckQ14dKTfZLFqtQpiq9KlNRfKrJ4pN/4aljI=;
 b=Fo9caXWkj/wAQiSS7LM1ch3O+3AFMzzogYJV5ku/5tFAN7Q8oUrDxrwkx4J5kDlQJBKgeaOKhLtLvXHYqR4qZ3UN9ZTMk6FfKxnkfTbmzFkNMFkWt1rPTG6SB+21pDHibdAD7u/IaKoqL814e30jlZ9dsLl4MwtxE3LgoMt9oGU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2610.eurprd08.prod.outlook.com (2603:10a6:203:97::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 19:27:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 19:27:15 +0000
Subject: Re: [PATCH v2 1/8] iotests/297: Allow checking all Python test files
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <285b6f74-da97-4b4b-70a8-ec09a8c467bb@virtuozzo.com>
Date: Wed, 13 Jan 2021 22:27:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113175752.403022-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR01CA0122.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR01CA0122.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Wed, 13 Jan 2021 19:27:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b66e4539-934b-4417-c974-08d8b7f93c4b
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2610:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB26107F9EC0C31266B54F411CC1A90@AM5PR0802MB2610.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UmIKCfQv7XMffBYeXXxVlDVfx4Xh22HoHjdFA2/OeFdcR9r06KPr8zy+jv7Fj7SUBhf5HIwZNl4oD79HBJBUy8fiuxU/n7BOyRO2qNXuUTeuyGBjtirnGlEmvZ8w326q9btczW7p1AznBLG9yFUhqYZ6NlkxixG0I/81jjn2V8gjd+QsB8WtU4rB0pJVlXeusGZuLmoqhqHr/4QqKqi8iJ4noBkXd+JpfEMGJARCLHBr4XpGLjFL+dMaBm4vIxaWqPZN3ekDdtCjRZ+ZaQY2MsoKbHUwZ7XiMCRmeQIG5167spKyfQ7YmSuSwDLL6QSIXQIOqqHvei7iXiy5/s4w5f4xyOEil0XHK2GZSqGbGUPlkIYsykepur7dQcFD7/s1NNDXWRNFR5QGrNx6QqrpGwoWqj/uEN6apLmikCjExzkFNdY6CAQfHN0JSbM73KBQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39830400003)(366004)(396003)(136003)(5660300002)(8936002)(31686004)(16526019)(186003)(2906002)(86362001)(4326008)(478600001)(66946007)(66556008)(66476007)(16576012)(52116002)(31696002)(8676002)(26005)(83380400001)(54906003)(6486002)(36756003)(2616005)(316002)(956004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RytObGRHYmxKdGptRVdvays5eEZUcEprQzRkbFR2dldWMUxtSk5MeHZVSW9S?=
 =?utf-8?B?cmRreThTd2xkZm9YSjhsNVhjSnBWdnVWOStvYjcxdkcrNjR0cnpPM2dFS0NP?=
 =?utf-8?B?RElUOGdFSGlqT1hIbjNJY2Y2c3dpcnNVSVhweXA2ek55YWQvL0xIMEIzSVpD?=
 =?utf-8?B?Q1IvTjZScExtbHo2WVRwZk84QzZ0TVovR3pDampKOVp2b0VRYmlHend1OHd0?=
 =?utf-8?B?aU8ybithTEZoQndQL1VqRmJ5SFRYS3pUc3l4R3JBQU14VW0zSzZrWU1RTE5Y?=
 =?utf-8?B?Y0cySmZlQ1FuZ1NGMGdyQmI2a0srWmJSTmNGbnYyNDM0R3hEQ2wxZEpQRHlF?=
 =?utf-8?B?WmJSa0x2Z01LdHBrSi9nR1B1bnJIRjF2U1UxMVdrLytrNUFJQ3Qza0VRZkIv?=
 =?utf-8?B?aXZSaEd5MkNxOFRwQWtCL2llNVlZd2pUcSs4YnR5VGp5eEJicU1LaS83VytF?=
 =?utf-8?B?cFF6cTZoZE1DRVpjZkl0Uzdqd1Z3dU5MQWNBUlRsZktiN2VWejVUaHh5UGZB?=
 =?utf-8?B?eGd0aXZHZGlqME8wOXhiN1hFRFdkUk4rWlNoWEhZY0lNWUczaWNXeVV2U1BU?=
 =?utf-8?B?UzJiZlJYaGNkRlhBc2Q1TFdVWUlBVmgxMldkOG1CREJZSUJKVWJUNzZURXBX?=
 =?utf-8?B?Q1NlaHlOSUZjZnFYWmRyOU1EdXVOMkhLSy9iTzU2cW9iYUdHQnMwNVZRczgv?=
 =?utf-8?B?aktFb3NlM09CaGRrK3ZmbTNNNzVGeG9vdGJDbVVPN0h0Zmt5alFKbXBheCtR?=
 =?utf-8?B?aEJXWXVJS1lOcTFwUytUeFY5aFVIRzN1SGR1UmdMSmlUNHdzNlN0TlZLS2lX?=
 =?utf-8?B?dEcwM1IvZzA4VnQvY2ppZGE0VUVieEtrZTlUZ2FoakhoaTA0Q3ltUE5MclpU?=
 =?utf-8?B?WnJ5RjAra1I2V0Q1MHJ3TXZ5VDRsYklDRGRHWFJiK0FXWk14ZUZIZllYNDla?=
 =?utf-8?B?MWFheXhEWFF6U0J2YXQ2Tm9NbTVBUVRZRDZKamdxRTI0WmpFYWFqc1NhWW9I?=
 =?utf-8?B?VUtsVHBpT0dxVlNnVkh0WVUreGI2czFQNUk5NGhjcUhyRmhad3dSQmdpSGN2?=
 =?utf-8?B?a0huekhDMkVZY0o4eVdTbW11eFpDU1YydDVHNG9ydW9uWFQxTTdOZFI4U0xC?=
 =?utf-8?B?d3dYOTYrSFBueDB0TzBsUUt5OTBuSDRLTS80WWEzUitNQzBqK0Irdk91MXpJ?=
 =?utf-8?B?b0RDT3cvb1NZY3FiZFlpT2J2THJ4WEVaZ2ZDVEwvS3VzVjN2TE55SCt0dzds?=
 =?utf-8?B?Y0tWQkI3M0xxdU5Pa2oxSFN5ckJSK3FWaDBmNVBXN0wvdmRjdGkzemxhKzAw?=
 =?utf-8?Q?f1osciGpaPnFQJ1l5I8PcRBvhEoDdLUoQL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 19:27:15.8746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: b66e4539-934b-4417-c974-08d8b7f93c4b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ9LQ/ccbikPBqnOpjrglUWZVP6GTwrpu2ARVpdvNAkcmt4lD58lhcl6sqZuf/x6ZFF+3iZmwdKO+ajYWXlgN95S2OJcXzeobpP/ZB1A0Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2610
Received-SPF: pass client-ip=40.107.20.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 20:57, Max Reitz wrote:
> I.e., all Python files in the qemu-iotests/ directory.
> 
> Most files of course do not pass, so there is an extensive skip list for
> now.  (The only files that do pass are 209, 254, 283, and iotests.py.)
> 
> (Alternatively, we could have the opposite, i.e. an explicit list of
> files that we do want to check, but I think it is better to check files
> by default.)
> 
> I decided to include the list of files checked in the reference output,
> so we do not accidentally lose coverage of anything.  That means adding
> new Python tests will require a change to 297.out, but that should not
> be a problem.

I have a parallel series, "Rework iotests/check", one of its aims is drop
group file, to avoid these endless conflicts in group file when you want
to send series or when you are porting patches to/from downstream.

And you are trying to add one another "group" file :) I don't like the idea.

Why should we loose accidentally the coverage? Logic is extremely simple:
all files except for the list.

> 
> On the other hand, I decided to hide mypy's "Success" lines from the
> reference output, because they do not add anything useful.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/297     | 66 ++++++++++++++++++++++++++++++++++----
>   tests/qemu-iotests/297.out |  6 +++-
>   2 files changed, 65 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 5c5420712b..b1a7d6d5e8 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -30,13 +30,67 @@ if ! type -p "mypy" > /dev/null; then
>       _notrun "mypy not found"
>   fi
>   
> -pylint-3 --score=n iotests.py
> +# TODO: Empty this list!
> +skip_files=(
> +    030 040 041 044 045 055 056 057 065 093 096 118 124 129 132 136 139 147 148
> +    149 151 152 155 163 165 169 194 196 199 202 203 205 206 207 208 210 211 212
> +    213 216 218 219 222 224 228 234 235 236 237 238 240 242 245 246 248 255 256
> +    257 258 260 262 264 266 274 277 280 281 295 296 298 299 300 302 303 304 307
> +    nbd-fault-injector.py qcow2.py qcow2_format.py qed.py
> +)
>   
> -MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
> -    --disallow-any-generics --disallow-incomplete-defs \
> -    --disallow-untyped-decorators --no-implicit-optional \
> -    --warn-redundant-casts --warn-unused-ignores \
> -    --no-implicit-reexport iotests.py
> +file_list=()
> +for file in *; do
> +    # Check files with a .py extension or a Python shebang
> +    # (Unless they are in the skip_files list)
> +    if [ -f "$file" ] && ((echo "$file" | grep -q '\.py$') ||
> +                          (head -n 1 "$file" | grep -q '^#!.*python'))
> +    then
> +        skip_file=false
> +        for skip in "${skip_files[@]}"; do
> +            if [ "$skip" = "$file" ]; then
> +                skip_file=true
> +                break
> +            fi
> +        done
> +
> +        if ! $skip_file; then
> +            file_list+=("$file")
> +        fi
> +    fi
> +done
> +
> +# Emit list of all files that are checked so we will not accidentally
> +# lose coverage
> +echo 'Files to be checked:'
> +
> +file_list_str=''
> +for file in "${file_list[@]}"; do
> +    echo "  $file"
> +done | sort
> +
> +# We can pass all files to pylint at once...
> +pylint-3 --score=n "${file_list[@]}"
> +
> +# ...but mypy needs to be called once per file.  Otherwise, it will
> +# interpret all given files as belonging together (i.e., they may not
> +# both define the same classes, etc.; most notably, they must not both
> +# define the __main__ module).
> +for file in "${file_list[@]}"; do
> +    mypy_output=$(
> +        MYPYPATH=../../python/ mypy --warn-unused-configs \
> +            --disallow-subclassing-any \
> +            --disallow-any-generics --disallow-incomplete-defs \
> +            --disallow-untyped-decorators --no-implicit-optional \
> +            --warn-redundant-casts --warn-unused-ignores \
> +            --no-implicit-reexport "$file" \
> +            2>&1
> +    )
> +
> +    if [ $? != 0 ]; then
> +        echo "$mypy_output"
> +    fi
> +done
>   
>   # success, all done
>   echo "*** done"
> diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
> index 6acc843649..c5ebbf6a17 100644
> --- a/tests/qemu-iotests/297.out
> +++ b/tests/qemu-iotests/297.out
> @@ -1,3 +1,7 @@
>   QA output created by 297
> -Success: no issues found in 1 source file
> +Files to be checked:
> +  209
> +  254
> +  283
> +  iotests.py
>   *** done
> 


-- 
Best regards,
Vladimir

