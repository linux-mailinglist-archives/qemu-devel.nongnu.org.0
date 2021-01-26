Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3D303E87
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:23:35 +0100 (CET)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OJi-0001YT-Em
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4OG9-0000UE-5W; Tue, 26 Jan 2021 08:19:53 -0500
Received: from mail-eopbgr60127.outbound.protection.outlook.com
 ([40.107.6.127]:1766 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4OG3-0001n4-NA; Tue, 26 Jan 2021 08:19:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMLfcIwSg/VG70LyLnQqrAAt4jul2p8NC0Nab7X5QMSwIMEMbgCs+WCXAWTlRzpWH2NJgHBaaPZwrtjuwm5dLdAIBsq7OZRhVh+Szn1kZ8a3K7AYPxLO1bGD9abvmj7J70ESQgnWUfLiuIhiR6MwVvvpS3t+yXpDSlaYYXEAJCKQogVvfE93he4Z4zAYa4ohpEvqpWJtg8qOuQg+3HnXXuZ2ZGkNH9iA1AoFShTQjDjQTdwmo3uPnPWNvdR2aN9wS469S+JS14V3i0SF+ZoBC/6oAi0Xe0ThfrU2tl8G2AydaHErTiY2ftbG4cfgUWTF2SvmH37GYNLWSK+ruSPxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHtwR0Cw+p0OhvSQQQMyIomSiFKa3YaMPb8TP3JYrrM=;
 b=bbpBSpfIxd39ulBdtCgL2pMtp9bJmgVi6HGGcFiSCHhZ98FtaBLoEojEzZubTHUCOBwcKOCjGYWd5scHnHJEs88+i0TgQ6ojzs8pmw9NBWxZUZJFjr0NWieNGNw/L7LDLKvmNRnPLitSc2Kc0Yy5LP8qFtSH7KjDL2EnzouykrdYfmB564lyz6wwaMc932Qpuzq/BTSJJe9ttrSgMfaUFLVnL6pMOxFKZgl3MVeTyCkQF6RcxC7iB1RikUjpMGsxg/XLxUxapJA1T2MxMtS7UWMeZ5rEfXJpCIjWfH+v6FZMhmXnlVOZan+Xp0Jotw5p3V7NtfmYoXUUXJFg9gM+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHtwR0Cw+p0OhvSQQQMyIomSiFKa3YaMPb8TP3JYrrM=;
 b=mqF9+f8Q2PFK/CMIYdI5XHeJ0MTF455Kb0/ImUO4gcp0QUR0tUOEFqHKpHFzZcf88Kk9RZ6nnwQ8Mq3HspgPnJoHtU+T0NBpzyl3v2llmBqEQCOVtLZl9THO3k5uQFJJyOwAYjbKuxJ0df/TaKmf0hIeRALQ7JZWtNCO039cInk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2450.eurprd08.prod.outlook.com (2603:10a6:203:a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 13:19:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 13:19:43 +0000
Subject: Re: [PATCH v9 0/6] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
Date: Tue, 26 Jan 2021 16:19:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126125301.GE4385@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR02CA0134.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 AM0PR02CA0134.eurprd02.prod.outlook.com (2603:10a6:20b:28c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Tue, 26 Jan 2021 13:19:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea32697-966c-4312-a709-08d8c1fd0b3a
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2450070C3E1C12DA500C3C32C1BC0@AM5PR0802MB2450.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zuilvl+GNq1wrgx1y+/AT4z+JFboHOdrzhi8EwLjTmL+hehvbaBiebvDdZqISQ3qJSL6OikdxDnfH8bSkY2w/hnKFeQAjSHdnZL9/vrSLw9BUh+dFxTR8wMcl6iq9ckVYCLh4dHS64lcWuLQKPjECwZvE4RzAA2f9JHP/GkTvyuSIfUJWbR0R6fq2esCo8RX/iNV2JE5I/eIxMfKJOviV+j/4rzqqAtPNekLp9astYEdFeLyb3xA+l/Hdb3/eGbH8xGi80kWdy/yDKGcpYYOvD515UxJYh5rjJ81Ix0u8teOKgnb0R8fRIg4BA7E2MsImKLxjxSSy4HR+m7xN2YC6a4lBE6gFpTq/xWVPaT0NBiVzvB2B1q2gDMf6uOfSdxZJ4qQC58grFUX9Qd83UhnXAe2u6hiCK7ZJ+ixM6jJrtFa6dBDpnDCGfg/qxMGGA3M6c2ujthdJUHBkGyQPuAnhSZCe7Ga1tD3msyHzbUkPF0k/NB5ASWNny/1zQlgnQwA2gUDC37FJ6HM52Y2C8CH9jy3yDh2F5KfHwRbD6eRUGCGcdNVauxtPLb560ouTi3c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(2616005)(6486002)(478600001)(31686004)(2906002)(8936002)(52116002)(86362001)(83380400001)(956004)(6916009)(4326008)(5660300002)(36756003)(316002)(16576012)(186003)(16526019)(66476007)(966005)(31696002)(66556008)(66946007)(26005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: xDakleuAhqAFSGkZlCIqzuHGrd9E8hQNk9Q63i9oIX85o8R6Tmvcs3n8wOvLYo8sodtCAA5O9moTWt1W4n/dCesDS4FphTpooUo5k9e0R3kGLT6lBfJiiCRCcLgXfVVYUZrL2lP0Ho2Wb/BgBiKypHpfT3pFczQpIA4+mPm8cwzHl38gc1ZOcSKAQCMPNuQMdhakSZTTMfRW/5sOyVc/4bgiPtiunmVLm1+WKo78dYejmMYpPpeddIxYW3GU5z/Zq5IsHIgeeWzLHJLXxeJbGzhyQ2uoFqJ6hNXy2art+lrmmzYavZTrpFZFrYpk+xpxVepiX6PMsMSOqbs7gXBvU471uO0meivSFLmkknuXRCkcLvnzYcjxsrxtS5NWOJzQJJ2YdzDeEHzma3DgB7xBr6uCwMdM8yFawmGNmrV2UxWZ3YpPlNWH/L5DaXll16b3sNZz3dGmEOjoBYzVcI/DUVcct0k8dIJH7JvpsF76KjjS20unxrYubqZuN1Xsipnrcvlo8fz5NvKznHyA8nDNTcNbxhbA2c8IfP+MxMIEgsg4U20qxJ1XisNWQwr7mBu2hFPPXzHM3poWy22S/I9dxaxFw5GJleMZAC9PeLp+IU3WYPsJ2WKjNuF8/yybx8e/LmHTPZl58oAAbCNvKgB3X7VAs+mAwclyeR1vKZL4aKFzfOY8Y13M7TOigrvTN4xah/I9oFbdwNzl2RTdvQ66nUS0WuHOUTptveZEDwHR++brYkWsWFdshwDkcHYSIZEX
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea32697-966c-4312-a709-08d8c1fd0b3a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:19:43.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUCP9u5Wo+lu39gr2ZWXHiNRrsMKCnrVuEY84CXl37kTGK/twEAqKsaRWriRis5NF+aDqghJcRFRpmmQDGYvjHKQcGp2M3oRZQ6dkhO/RSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2450
Received-SPF: pass client-ip=40.107.6.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

26.01.2021 15:53, Kevin Wolf wrote:
> Am 25.01.2021 um 19:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> v9:
>> 01: new, one more whitespace-fixing patch
>> testenv: allow case when we don't have system-arch emulator, but have several for another architectures
>>           change direct os.access(..., os.X_OK) calls to new helper function which also check that path is a file
>> testrunner: s/fail/not run/ for 'No qualified output'
>>              drop elapsed time arg for one of 'not run' results (now no elapsed time for any 'not run' result)
> 
> More CI fun:
> 
> Traceback (most recent call last):
>    File "./check", line 117, in <module>
>      testfinder = TestFinder(test_dir=env.source_iotests)
>    File "/builds/.../qemu/tests/qemu-iotests/findtests.py", line 53, in __init__
>      for line in f:
>    File "/usr/lib64/python3.6/encodings/ascii.py", line 26, in decode
>      return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 1591: ordinal not in range(128)

Can be solved by adding encoding='utf8' to the open().. But.. Adding it everywhere is not fun.

So, what about just define PYTHONUTF8=1 for running check in check-block.sh?

https://docs.python.org/3/using/cmdline.html#envvar-PYTHONUTF8


diff --git a/tests/check-block.sh b/tests/check-block.sh
index ac32fd67dd..9dcadc435f 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -74,6 +74,8 @@ cd tests/qemu-iotests
  # QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
  export QEMU_CHECK_BLOCK_AUTO=1
  
+export PYTHONUTF8=1
+
  ret=0
  for fmt in $format_list ; do
      ${PYTHON} ./check -makecheck -$fmt $group || ret=1

> 
> Traceback (most recent call last):
>    File "./check", line 112, in <module>
>      env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>    File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 216, in __init__
>      self.qemu_default_machine = get_default_machine(self.qemu_prog)
>    File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 41, in get_default_machine
>      default_machine = next(m for m in machines if m.endswith(' (default)'))

Looking at original check, default_machine should be empty string in this case.

so we need

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 8b80425670..222395caef 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -38,7 +38,11 @@ def get_default_machine(qemu_prog: str) -> str:
                            stdout=subprocess.PIPE).stdout
  
      machines = outp.split('\n')
-    default_machine = next(m for m in machines if m.endswith(' (default)'))
+    try:
+        default_machine = next(m for m in machines if m.endswith(' (default)'))
+    except StopIteration:
+        return ''
+
      default_machine = default_machine.split(' ', 1)[0]
  
      alias_suf = ' (alias of {})'.format(default_machine)



-- 
Best regards,
Vladimir

