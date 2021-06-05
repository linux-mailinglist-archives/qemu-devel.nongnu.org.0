Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0539C8CD
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 15:29:41 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpWMu-0008Sn-Ey
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 09:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWM4-0007fA-2T; Sat, 05 Jun 2021 09:28:48 -0400
Received: from mail-eopbgr40126.outbound.protection.outlook.com
 ([40.107.4.126]:37536 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWM0-0007iS-RU; Sat, 05 Jun 2021 09:28:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9BTagN3KSOffrwViTcKeq7fKFbmx//Nuyv3YE0ocxJ6DqEqgjRc3QjF8Fuj2v5R37NOiKXDROw8eXoTibeC3sto9ILEWgxmyP6Q5PXsilHm57NeF+oqbk0fACgYB+tt4N4QQA4hP76sQ6237h8wKKffZ7EMc9d673fxjtiKyytAPU7p2ekhlsMyyV82DUyhy8vRMd9LDWb4It8jcJXDGBveztg6yijgJz2ZvgnKxWjeVn2RCN1C7LDcq0pXB+pLWRU48ysEBh34B9jHApCsYpBxn3KVfqxzO/ec0NfW7JEvcLzAJDCLeFy7GbMrj7pnbVFyJQsAo5CKBkLuuIoV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n/PcLiYlKV4wllxXdtEQq78rLvytcQX35gY7Oxjm3E=;
 b=DrdHXwicJuN9TKTf0T+3HZyFkghkuPyTDGHiPOkefMUsIEzTnOOpBh5ja5lAFinS6QEOCKgXbBGwISZxw7fMb0xI+XMu9WtGBdy961PJviLw4Sk/nKWgmwp5vLIQ/nuX9ihy5GreDiigP2BcIo1K/7BDU4j0BpA1N7LwfF8TUzAfPOPYSRZ8l68R9YyhNiJO/ggKY1Z2F0QPr0yYxe9Olj+1HdRpsg32jB6O14hPVwtKkPcm+yUMYmVBqDHTR1X0iwO7ktNk6pN2zPRKlf+4nzbaegBvvryf/vN/e6xRepQeqp0HaewcsqLsRiliUf+eL/C08ZhFxhwp+ljcATP+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n/PcLiYlKV4wllxXdtEQq78rLvytcQX35gY7Oxjm3E=;
 b=vI05gmhbHhk2vse/D/G3aqeQzmV2Uhq4yoq86cg3soPbByT6RAwFERjmdrgT+W+svMk1SaPTtKrmLa6rjTRt7W6rzAXX/IkPs+m0BzYMaBuHLLY2YnFOu7lchktYu4QwjRmxeCvpIhxCEbALj94mw5GhPczvN37rcl/4f8OCeP0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3157.eurprd08.prod.outlook.com (2603:10a6:209:48::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Sat, 5 Jun
 2021 13:28:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:28:41 +0000
Subject: Re: [PATCH v5 10/16] qemu-iotests: extend the check script to prepare
 supporting valgrind for python tests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-11-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <de6439dc-c20f-f138-496f-5bc4ca5d8f97@virtuozzo.com>
Date: Sat, 5 Jun 2021 16:28:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604091723.13419-11-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: PR0P264CA0221.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 PR0P264CA0221.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Sat, 5 Jun 2021 13:28:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d4cc175-dfe4-4e13-f391-08d92825d5c4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3157:
X-Microsoft-Antispam-PRVS: <AM6PR08MB31579EFCEDEA07AB8350E914C13A9@AM6PR08MB3157.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /0DcJQNJiF8Izg9wqFkDFzywiRIYzB6fz1S4pVnwrdGlPOOvYf/6HrOAuzrE/j+i44zOo/77hkzzBeAY6xs16Y37d3MgAOhj++yhD8qz7QHGfDYiIW751eT5hlXoggRJee0DRTS36PEG+cAY/59VhbmkCotqG37jss9T75kMg+revvjUNhBikr0iKjirDCCx6q5sCk/AOAZ9YfBKNIC42M7WgOGB6mCrQ2DdIcWKpyYApdjlaJ4jgYbIOIsu7JzJ9Rd33fHAS8V19rZlp9qRElBYT+rWRpJvaNK58k10iK6GU44OYraSwwy9Ig+J3n1ylCtLUt+kKygDTwny9qg8XwsKKmd2lpq5NGCK22XwOpDFwYXE4RIaQT74mW7rWfq5yahx7FtkEXgZI2XqU42hGc3hXluCK+l68lipeloXpjID5Rtc1hyuZpQ5fWxri1aYoiJYtSQbHPBhsseqQd2UOZ8F0gtSo8BG/YI2RbE/glVsesjhM0efgaLMhpPL7+odHzxMXo+JZEjFiHKhI8HPBTt28UEmFvEGuwRZY+hhKuxzf5A+woBxHCXamQBmtqLRS9ZlYaBdRCv808cHuIXGmggJ5aBxDxbQe4xZBrfniMPXOKusW4nxcxUSGTxdnB9e6T5OCwCIvhom3wmplWrnC2WU+R7re/BbodpicFt+qCeKc3GJhZ6Kb+AZa04PLGm4WvE6SzrZnagz4pmH5PZHlQWgMKXbmb1kOL22jqiTYHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39830400003)(366004)(136003)(376002)(478600001)(31696002)(52116002)(186003)(66556008)(6486002)(66476007)(16526019)(38350700002)(86362001)(4326008)(8936002)(8676002)(38100700002)(26005)(66946007)(5660300002)(316002)(2906002)(2616005)(31686004)(36756003)(16576012)(54906003)(956004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUVTSEs5YWxobkcvaGdXaWtCUi9OdCtqblZvOEVLdFVUUE1GM1ZBRnc0SVRW?=
 =?utf-8?B?a3RqUUdmQk5SMzlES005VjBISHVGZTM4V3Y0dWZOWFFqVVFiVCtqREJtWVh4?=
 =?utf-8?B?YnI2QWVVQnk0Nlk4NzR5Uk5FOThYVVpXVlJFVXR1SmIwSXd1c3U1UW1aK09u?=
 =?utf-8?B?TDJPZlVRYXEwOHlFVHlYOExqMjdwd3pBMXJNcmU5U3E2TVZJY2JxNnVNOFFP?=
 =?utf-8?B?Nnp2ZG1NNkFBY3dOS0JkcXYrUlQ0cXRUV2JwTHVBODB5OC9qL25RVTZtL09F?=
 =?utf-8?B?aURBZE5PWlozRDhlNFV5RDhsNzlrVjltQWJlVmp0QStQVEh6VERuNklqdDhT?=
 =?utf-8?B?NGphYmlMY2xtQkxxZWtac09kMTcycUdQTXlBSzg2ak4wdXdkN1NYNVBmbXZH?=
 =?utf-8?B?MXplTFFaWnpId0tjbDdDNW9mbmtEU0RnaHk1SGlMb052dFJCVk50Rm5SaUVq?=
 =?utf-8?B?OGhiZ1RsRzlDZ1FtTWZWNXJMWmZGU1E1cmVTS2hyU1UrWXhpMHVNeW40aHFK?=
 =?utf-8?B?R2tkNEZrZlhTb3gyei8zeGkwNEwySTV6cFJ1Q1hSU2lvKzhIMFBZTnMybTJU?=
 =?utf-8?B?dnRXd1pjdmNJYWJFSzBMWXRoM0YyNyt3QUFKWWE2ZUtRRG5qLzlCcVlDYmhN?=
 =?utf-8?B?eXZBSTJNQTViNlB2bitsS2RCR215UlY1U0FXQk9RSlRqVUROSmcxbU9va3Nt?=
 =?utf-8?B?N0VWNExVbzdjakZnT0Vra2pDV1M0R2MrUXVZaTlXR0JUSisvS0RvdW1DZHEz?=
 =?utf-8?B?MHlOeGFTTG1weGl1N1pOM2hJdloxeGRleURRMW1FbjhZZ2xBZ1JnWHRJU3A5?=
 =?utf-8?B?QlhGbEZabWJ6VWh2NklnQ1B0dFJaRGdSeEJCa0hjVXh1Vzl0RHF2ZjBJbGhY?=
 =?utf-8?B?dHo1Y3BacUh5UVZVME10WmVHNnhxNVVXWUQ2cU9taHJQZWlYSmMrVHIzaTNP?=
 =?utf-8?B?bVFHYlBuVnZPalFiVjhtSmxndDNRRllCRjJITVQ2SDM5UFlQRXFETEgxRzFZ?=
 =?utf-8?B?aVZ1T3I4NjhNL0luby8wVTNYUEdFNDFiemw5aGRvb29vNFR3Y0QvZ29KdUNi?=
 =?utf-8?B?Ym8rdWxJc1BvOWxoMjZvQVJ2SG9DRWJTbUJPN2Z5blo4d2NseHp3VHl6RmxM?=
 =?utf-8?B?Q21FbkdlOUsvaERQNXBwOU9XcU9RdXJsdGRZZFl5R2EvR3E4UHo3UmVLVXBI?=
 =?utf-8?B?Q1lCbXJ2VzN1NUNjK1hzWk1rQklST1U1cDBidFFlaEdCVGtIM0VkUXVoNVdB?=
 =?utf-8?B?dVZsd1JLdlJuUFR6enNOM1ovak8xajNtWFhQWnZGTWNmVDhNdnJYNkxJTlBJ?=
 =?utf-8?B?aU5nd3gxVWJBUjZya2RDSHB2TGw0bjVJWXFqRVkrQjI5aUlqSkllOWlFRkdK?=
 =?utf-8?B?VjhOZ2NIZ05GbFVlbGliMUdWdkthQlF3cVUvd0I3V0ZDV2RxbEhwS1RJcUdW?=
 =?utf-8?B?THREaWlta2xZdU54RFFoT0J2YjAzcjRGMkFBemJjU1lEVTkwT2NyTnVyL2Z3?=
 =?utf-8?B?c2oyV0Jzay9pMVJ5YkdibVNMaHFDZFFGWWptRHZPYVFNWVplZzZQcXFuUERo?=
 =?utf-8?B?djJSU3lLYnNTeVd4U3ZkWWFDRHN4WWQxa0FnV2w2TFlza3pHT1BhQ25DejhE?=
 =?utf-8?B?eDY3OEJxQXgwV0JaQkRXZmtiVlpUV1dXRk1pMTcraGZSTXpnaUQxN3YzV2lH?=
 =?utf-8?B?K1U0YVdBSW9zcWgrbEI4a3kyZUV1aXJZLzJKSnZ3Wk42VXRiaXdGZWN5RVVm?=
 =?utf-8?Q?r83OzDWOVOgpBlDmuNpvHUuk/pW1hxmY54Z10QH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4cc175-dfe4-4e13-f391-08d92825d5c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:28:41.6335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yW20elws/SEt8ihgNi5eM90zegLm0ySoNoMRX3aJweijyigZAELZpBbdrcidMP7E30wtHdJ5Kd5eF032I+dAbfvg8HS1R9gJq5CikBYQJLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3157
Received-SPF: pass client-ip=40.107.4.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.06.2021 12:17, Emanuele Giuseppe Esposito wrote:
> Currently, the check script only parses the option and sets the
> VALGRIND_QEMU environmental variable to "y".
> Add another local python variable that prepares the command line,
> identical to the one provided in the test scripts.
> 
> Because the python script does not know in advance the valgrind
> PID to assign to the log file name, use the "%p" flag in valgrind
> log file name that automatically puts the process PID at runtime.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/check      |  7 ++++---
>   tests/qemu-iotests/iotests.py | 11 +++++++++++
>   tests/qemu-iotests/testenv.py |  1 +
>   3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 1dba4218c0..e6aa110715 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -39,6 +39,10 @@ def make_argparser() -> argparse.ArgumentParser:
>       p.add_argument('--gdb', action='store_true',
>                      help="start gdbserver with $GDB_OPTIONS options \
>                           ('localhost:12345' if $GDB_OPTIONS is empty)")
> +    p.add_argument('--valgrind', action='store_true',
> +                    help='use valgrind, sets VALGRIND_QEMU environment '
> +                    'variable')
> +
>       p.add_argument('--misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> @@ -88,9 +92,6 @@ def make_argparser() -> argparse.ArgumentParser:
>       g_bash.add_argument('-o', dest='imgopts',
>                           help='options to pass to qemu-img create/convert, '
>                           'sets IMGOPTS environment variable')
> -    g_bash.add_argument('--valgrind', action='store_true',
> -                        help='use valgrind, sets VALGRIND_QEMU environment '
> -                        'variable')
>   
>       g_sel = p.add_argument_group('test selecting options',
>                                    'The following options specify test set '
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index c547e8c07b..3fa1bd0ab5 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -96,6 +96,17 @@
>       sys.stderr.write('Please run this test via the "check" script\n')
>       sys.exit(os.EX_USAGE)
>   
> +qemu_valgrind = []
> +if os.environ.get('VALGRIND_QEMU') == "y" and \
> +    os.environ.get('NO_VALGRIND') != "y":

Hmm, interesting, why do you need additional NO_VALGRIND variable

> +    valgrind_logfile = "--log-file=" + test_dir
> +    # %p allows to put the valgrind process PID, since
> +    # we don't know it a priori (subprocess.Popen is
> +    # not yet invoked)
> +    valgrind_logfile += "/%p.valgrind"
> +
> +    qemu_valgrind = ['valgrind', valgrind_logfile, '--error-exitcode=99']
> +
>   socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
>   
>   luks_default_secret_object = 'secret,id=keysec0,data=' + \
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 8501c6caf5..8bf154376f 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -298,6 +298,7 @@ def print_env(self) -> None:
>   SOCK_DIR      -- {SOCK_DIR}
>   SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>   GDB_OPTIONS   -- {GDB_OPTIONS}
> +VALGRIND_QEMU -- {VALGRIND_QEMU}
>   """
>   
>           args = collections.defaultdict(str, self.get_env())
> 



Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

