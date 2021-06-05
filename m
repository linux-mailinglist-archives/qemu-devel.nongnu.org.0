Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5349E39C8F8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 16:09:46 +0200 (CEST)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpWzh-0006UB-08
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 10:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWyT-0005eC-VL; Sat, 05 Jun 2021 10:08:29 -0400
Received: from mail-eopbgr60096.outbound.protection.outlook.com
 ([40.107.6.96]:61062 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWyP-0008M4-W6; Sat, 05 Jun 2021 10:08:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLGCnzcIgEC4wgb71tF2zQ21xAT8NG5/K+pSDPXYT7CX+OAg+Rny/p/uU7r6LVQSSiaRuHZLA9w/nXSD232SDuSf2iE9Im3zOcY9DR7xA/RyA3jfoXygYIrEV6zGMz2QCPzH47eY61x1dypyT/n/eDVE6ej515wnwThrN/yaDyNtB+a7xm72+/Cvbvk7WA4ZxhopyDQylo43CP8TEOCml+9FRXTP95OAVp86mnTOC4bERsFtJ+eq2+NfVqUJ9AR5bwjg2a+BVhbmVDudMqas+u0Zq8wyCzWrw7VYnlObyE5A1Dq39TrZJz9YHIw4m00tr2HYWxtejgAdgpGMQiPo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVnzKt6EdnEIktEth++qtKvkOfSAq2ANcyash4mcQ3w=;
 b=V6n3wRQoApA5O6eiHD7fOpLOPGNTzJ8RZOGz5PovGs9M3ZooXwFe3vJGyN+MrTJ+2Qwomyb9qFG8MH7uELtqsRQ7Q3SLBhiA4j+xif4lQ5xHr2N6i8NsWIq00WS10ixLGvPD9IME9KzoRqWoiqXCpDNkuxzf2uHQlDCqp9j6PelRX/Ex9DyKrYsCZ4lzegA8qh0/V8fdsN56fFmvRz+Z8WQnhhU9o8rssxnB+Fksss8TwBZ43rgbycxJ9gc21LIkJhFqVsIBjPtmxVI6OJoHdhEVZwdDGo+vj5r3JSybg6yjInL4kdly167IWZg9/z6SN+5+Bvuqt1KRfJVuzisSpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVnzKt6EdnEIktEth++qtKvkOfSAq2ANcyash4mcQ3w=;
 b=RaAJgD9yR6hk27Wfg0L7IkLdej0+oxcJ4mmrKYn9ph3E32a/koDjVgy6qxgxVbDVZVx0+klvyfFJr3uHs6pRf/6P1vjnJkGcwgVzviurmXuiSrE1kZFyjRyZMj6MFHq7eFbMSHvG8SebGisp9Rw4koXEqsL0vVManR7V+SNbaIg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5253.eurprd08.prod.outlook.com (2603:10a6:20b:ec::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Sat, 5 Jun
 2021 14:08:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 14:08:21 +0000
Subject: Re: [PATCH RFC 0/3] python/iotests: Run iotest linters during Python
 CI
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210604163907.1511224-1-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5a67879f-bcfa-5805-48f2-ce38bf8c3a03@virtuozzo.com>
Date: Sat, 5 Jun 2021 17:08:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604163907.1511224-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: AM8P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 AM8P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Sat, 5 Jun 2021 14:08:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd974ce2-ddd4-4666-60f0-08d9282b6052
X-MS-TrafficTypeDiagnostic: AM6PR08MB5253:
X-Microsoft-Antispam-PRVS: <AM6PR08MB52532A2A1F4FAD00AE96062DC13A9@AM6PR08MB5253.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzqHHG2XNViqT6/4k9/dZRL9xt7nSEYK2FHTau3X+9Ik9soRzauvom7jqYH3+U4CvJRw2hayaYDOdSpY5GHLKppmps98J2xlVA5IcDdH1Qrkx9gLY58njPSqXN0GoeHaYXCNFVVSItBVw8tEx97Udy+PANQoiNQ6Vowim93rNfDx1eAU0QVdZL/qVDaQxM44WDg+1/LqfYxSZ43JOoi42q5pBuf3tmrUtrkgTICCJHkDznAIrKhCF69XtpOsFbK5wYUyj8OPx3Lllz9v30djYyRiBgB0wF9e9P5x8kLDkepfqmcD8Wl/sPyZO8Zh+868CsBAfP0WED9+mG9c0O/DR1pLjz8/CB/kesByY6fvsbug5Mgd8330bWfhHxIlGAjHQxOZ190dbvLTGc5aLAqiKYBjGc3kzHZf7LUoMcxApblcbhBjywTeZtzqjpODgH3bFrLjamxjRAsWDxnbv27hZCIF3WYP4rCayd286OfsPvKePhoEmncZ4GGKfdX0x8+LQnHngm3Te04v1Xijqw+djHzYFV+826P6Pp09UFlMyB6IB9/N6aYXwJ9r0tI33Ylob8DOXu6coBrKgrT68Ajb6xHcG/s1cMjxTlCTYxsSZv8itbInnAg7VvMaZYx3MnzuTseK58h+yi+aIzcYXK2O3oqcg7TyWhVnKyIHbM/p4UL3/ZWkIwes15cX/we5ddRoZMLvthdTpO3Iu4VdQ9bLYWbWIIikL2xj8bElE4eb8mc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39830400003)(31686004)(52116002)(31696002)(2906002)(6486002)(5660300002)(36756003)(83380400001)(16526019)(26005)(186003)(30864003)(66476007)(66556008)(66946007)(16576012)(38350700002)(54906003)(316002)(38100700002)(956004)(478600001)(4326008)(8676002)(8936002)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eW0yMi8zNjFaVkdidkZja09vbE1TTmpEMUVMZURMdmZzdzloWGdkcytYVTk3?=
 =?utf-8?B?UkFENkVnazNJb2NPL2lxdldMUUtDalRyMGVYcWtwUG5zblI3bFhsS2srOEVJ?=
 =?utf-8?B?Q3NEVXF4bHJsQVBGY1g5Zy9aOWExVVZGM3hPOHdQSU1SdDRJcGlXdzlnRXBX?=
 =?utf-8?B?K2VZUENkSnJHQ1BFYWRlZ0RzYXI4VmNtYUJxd1pIYmJxamlGaXpXN3Z4QzBy?=
 =?utf-8?B?MmVLQ0pabXNFL2paRURZN29URXdOT1hLSWhBS2FnYkZxcmJpN0xvdlVtUEJJ?=
 =?utf-8?B?QktpVEdGTkVtSXBsZ3VyMGh3MGpITkxOdFFOQVZLRGVMRG43U3l2T2ErOTNl?=
 =?utf-8?B?Tm0rOExHaXhoZjFXMTJ4YWtnRkQzSnJBcjJZOVpYeUVkdnBGMkpNNHZMbHRs?=
 =?utf-8?B?VVJuREgyMHNzWEsra0hzTE1BL1dmekNLTHRDT3ZSckY5aVloNlRhajZwVHVH?=
 =?utf-8?B?ZllYaHYrVnJnVC8rVU9YZGlIS2FjaWpIdXhnQVA5SWdJZHRKSkRLbTVFNUsr?=
 =?utf-8?B?MG01Qm4xY3R2VjJCSHVQa3ZRdkFyVXlZT0MrbzQ1TiswUUVyeWtEN1RtV2Vp?=
 =?utf-8?B?ZG1lNVY1eGc0RG9SeWlTMnlZZDNqYmRUWmVZeWl6dElJd3ViMVdrMVpjTnNV?=
 =?utf-8?B?dEZpclVnRENONWE4WmJ0cnJNNXEvdFdaN0ZIai9MVktvZkQvZnhIS1NZbGVx?=
 =?utf-8?B?ejdaMEVsbTJWUmRIdE52UThydnA4eGplT3RNOFpJZDFLNmd2UXNBV09BUDR5?=
 =?utf-8?B?KzRJNFNGR244ci9pWGF5eTQyOGVGWVl6V0ppQWtiT25BSHQ5eVVqcStxN1FP?=
 =?utf-8?B?clRBZnZ3T0gvcG9jMm9salpRcUdPY1BUb2tJeWVQMGhBeVVGOUNzNnFMUi96?=
 =?utf-8?B?YThlNjdLTG9pcUdNdElGc0ozMlpnVEZ5bU9PQjk3Q2c4cVNWdGx3eVJtZFRH?=
 =?utf-8?B?VERGK2xqcndJOGt2bUZITTZFQ3JIRnBtRUhNY3krdkZuRmNJbHZRREJmZXg3?=
 =?utf-8?B?WkdqY2NVM0ZsVDJJaGVpaWloL3BYT0FjQmhKYVpEeWNCYTl2dHhzaVF6c1li?=
 =?utf-8?B?VWZydVZtK0szWVo4b0hycUE4aUJyQWo4c1kvY1grbUUxWnpHQVBUYVR6SEVi?=
 =?utf-8?B?U21DOTVIaUhMNXZxSzRvVWtLMlJLQXl3aHY5MnpsT2hYMys1a0pibW9iRi9p?=
 =?utf-8?B?Umo4V0xLTC9OK2V2SDlDNUhvclFicVh6VnlvVU1QVmgrNmFZblpzay9ZWWNz?=
 =?utf-8?B?TlhzbkV6MVdlSVdib2hNU0pVQytXYVgxWGdSY3R1RWhLM0owV3F6c2dGUmU1?=
 =?utf-8?B?OVUvYTU3aE9TaFBxdGEwZTRuZ1pTMmdlRmFYMzBmNUtlWTUrL1ZsQy9SK014?=
 =?utf-8?B?WC9jQW1vVzcxejZVRmZTYjFUVkhQL1Jmbmp2YzlQYU0vUjlHZDROZTNSQ0lu?=
 =?utf-8?B?cGxoL1F4SER2Z0M0U2JPSzM5aXN6eVNoS2dhc0RJNWxtb29iRHluQkFWdzh6?=
 =?utf-8?B?MDhqMk5FckJVV1U3UUN6UkRidXVMRzZaMHdOTU1aN1YyOXRxdnB0ZEZoRDZV?=
 =?utf-8?B?Q09qK0ZaekpPbnBuenRaNDBjckRMdXlROUVEQTFGMUloY05sNWpNSjB5a3d3?=
 =?utf-8?B?YVkwL1hTSlpYdkJPNWNTVkxkSUZsd25CRFcxd2pwdWZ2ekNONEhWT1pNTWRz?=
 =?utf-8?B?bGZlZmdmRmY3d0N6Q1lONU9MUDNyandwb212bHVNNDJEdUFqU3JxSkdmQXVo?=
 =?utf-8?Q?CZqYhpNQOUyjhbsLRGFdvRk+xQCXolrTrOt7SzX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd974ce2-ddd4-4666-60f0-08d9282b6052
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 14:08:21.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9B4R33knMoo1tST4dJElVPMsnPhP+B5dMpyVePMmsMpbgr3TDnKRZgEX80rhb8G+ViFP5mpRhUK2qdNf5fA6RePfFX443dDJG4ueDCfxfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5253
Received-SPF: pass client-ip=40.107.6.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7,
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

04.06.2021 19:39, John Snow wrote:
> Since iotests are such a heavy and prominent user of the Python qemu.qmp
> and qemu.machine packages, it would be convenient if the Python linting
> suite also checked this client for any possible regressions introduced
> by shifting around signatures, types, or interfaces in these packages.

I think that's a right idea.

> 
> (Of course, we'd eventually find those problems when iotest 297 ran, but
> with increasing distance between Python development and Block
> development, the risk of an accidental breakage in this regard
> increases. I, personally, know to run iotests (and especially 297) after
> changing Python code, but not everyone in the future might.)
> 
> Add the ability for the Python CI to run the iotest linters too, which
> means that iotests would be checked against:
> 
> - Python 3.6, using a frozen set of packages using 'pipenv'
> - Python 3.6 through Python 3.10 inclusive, using 'tox' and the latest
>    versions of mypy/pylint that happen to be installed during test
>    time. (This CI test is allowed to fail with a warning, and can serve
>    as a bellwether for when new incompatible changes may disrupt the
>    linters. Testing against old and new Python interpreters alike can
>    help surface incompatibility issues we may need to be aware of.)
> 
> It also means that you can cd to ./python and:
> 
> - "make venv-check", if you have Python 3.6 and pipenv installed. (On
>    Fedora: `dnf install python36` or `dnf install python3.6`) This will
>    set up a venv with exactly the same versions of all packages and their
>    dependencies as the CI test does. After this series, it will run the
>    iotest linters, too.
> 
> - "make check-tox", if you have Python 3.6 through Python 3.10
>    installed. (On Fedora: `dnf install python3-tox python3.10`) This will
>    set up five different venvs, one for each Python version, and run all
>    of the Python linters against each. After this series, it will also
>    include the iotest linters.

So, it doesn't run from "make check"?

> 
> "John, that's annoying. None of those invocations are free from some
> kind of annoying dependency. Not everyone runs Fedora!"
> 
> Yeah, yeah. This series doesn't *remove* iotest 297 either. It continues
> to work just fine! There's also a slightly more involved method that
> will run on "any version you happen to have", but the setup is more
> laborious, and I haven't made a Makefile invocation to canonize it yet:
> 
>> cd /python
>> python3 -m venv ~/.cache/qemu-venv/
>> source ~/.cache/qemu-venv/bin/activate
>> make develop
>> make check
>> deactivate
> 
> - This uses whatever version of Python you happen to have, and doesn't
>    require pipenv or tox.
> - It should work on any distro with any python3 >= 3.6.0
> - use 'activate.[fish|csh] as desired to enter the venv. (I use FiSH!)
> - This will run the linters with correct versions against the qemu
>    packages installed into this venv.
> 
> Example outputs from the three different local execution methods, in
> order as outlined above:
> 
> jsnow@scv ~/s/q/python (python-package-iotest)> make venv-check
> make[1]: Entering directory '/home/jsnow/src/qemu/python'
> JOB ID     : f5f383275da6b9d5eb5fe717e463f47f18980d07
> JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.28-f5f3832/job.log
>   (1/5) tests/flake8.sh: PASS (0.43 s)
>   (2/5) tests/iotests.sh: PASS (9.93 s)
>   (3/5) tests/isort.sh: PASS (0.24 s)
>   (4/5) tests/mypy.sh: PASS (0.25 s)
>   (5/5) tests/pylint.sh: PASS (3.66 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 14.85 s
> make[1]: Leaving directory '/home/jsnow/src/qemu/python'
> 
> jsnow@scv ~/s/q/python (python-package-iotest)> make check-tox
> GLOB sdist-make: /home/jsnow/src/qemu/python/setup.py
> py36 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
> py36 installed: appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,importlib-metadata==4.5.0,importlib-resources==5.1.4,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1,zipp==3.4.1
> py36 run-test-pre: PYTHONHASHSEED='1077404307'
> py36 run-test: commands[0] | make check
> JOB ID     : 8d6a98b947956794e83943950a66dea2e2ee2f0b
> JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.29-8d6a98b/job.log
>   (1/5) tests/flake8.sh:  PASS (0.36 s)
>   (2/5) tests/iotests.sh:  PASS (9.64 s)
>   (3/5) tests/isort.sh:  PASS (0.19 s)
>   (4/5) tests/mypy.sh:  PASS (0.24 s)
>   (5/5) tests/pylint.sh:  PASS (3.64 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 14.38 s
> py37 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
> py37 installed: appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,importlib-metadata==4.5.0,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1,zipp==3.4.1
> py37 run-test-pre: PYTHONHASHSEED='1077404307'
> py37 run-test: commands[0] | make check
> JOB ID     : 97419c5769a56797e1a9b4d91586d6face9be5a2
> JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.29-97419c5/job.log
>   (1/5) tests/flake8.sh:  PASS (0.34 s)
>   (2/5) tests/iotests.sh:  PASS (10.42 s)
>   (3/5) tests/isort.sh:  PASS (0.16 s)
>   (4/5) tests/mypy.sh:  PASS (0.20 s)
>   (5/5) tests/pylint.sh:  PASS (3.52 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 15.01 s
> py38 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
> py38 installed: appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1
> py38 run-test-pre: PYTHONHASHSEED='1077404307'
> py38 run-test: commands[0] | make check
> JOB ID     : 1be3a502bea18cdf537426778719dce1d0c9c3a0
> JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.30-1be3a50/job.log
>   (1/5) tests/flake8.sh:  PASS (0.29 s)
>   (2/5) tests/iotests.sh:  PASS (9.17 s)
>   (3/5) tests/isort.sh:  PASS (0.14 s)
>   (4/5) tests/mypy.sh:  PASS (0.20 s)
>   (5/5) tests/pylint.sh:  PASS (3.21 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 13.32 s
> py39 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
> py39 installed: appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1
> py39 run-test-pre: PYTHONHASHSEED='1077404307'
> py39 run-test: commands[0] | make check
> JOB ID     : 0323fcaf5137caab9fbca3e91bc0338ae6cb81dc
> JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.30-0323fca/job.log
>   (1/5) tests/flake8.sh:  PASS (0.26 s)
>   (2/5) tests/iotests.sh:  PASS (10.03 s)
>   (3/5) tests/isort.sh:  PASS (0.14 s)
>   (4/5) tests/mypy.sh:  PASS (0.19 s)
>   (5/5) tests/pylint.sh:  PASS (3.39 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 14.37 s
> py310 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
> py310 installed: appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1
> py310 run-test-pre: PYTHONHASHSEED='1077404307'
> py310 run-test: commands[0] | make check
> JOB ID     : 88f99ef4b76af4e48e9b1cd845d276d1c29d32dd
> JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.30-88f99ef/job.log
>   (1/5) tests/flake8.sh:  PASS (0.26 s)
>   (2/5) tests/iotests.sh:  PASS (13.34 s)
>   (3/5) tests/isort.sh:  PASS (0.15 s)
>   (4/5) tests/mypy.sh:  PASS (0.33 s)
>   (5/5) tests/pylint.sh:  PASS (3.40 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 17.76 s
> _______________________________________________________________ summary ________________________________________________________________
>    py36: commands succeeded
>    py37: commands succeeded
>    py38: commands succeeded
>    py39: commands succeeded
>    py310: commands succeeded
>    congratulations :)
> 
> (qemu-venv) jsnow@scv ~/s/q/python (python-package-iotest)> make check
> JOB ID     : d4d3abff53bef6f41b5e2d10d889040d3a698208
> JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.22-d4d3abf/job.log
>   (1/5) tests/flake8.sh: PASS (0.27 s)
>   (2/5) tests/iotests.sh: PASS (10.30 s)
>   (3/5) tests/isort.sh: PASS (0.15 s)
>   (4/5) tests/mypy.sh: PASS (0.19 s)
>   (5/5) tests/pylint.sh: PASS (3.40 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 14.65 s
> 
> John Snow (3):
>    python: expose typing information via PEP 561
>    iotests: split 'linters.py' off from 297
>    python: Add iotest linters to test suite
> 
>   python/qemu/machine/py.typed  |   0
>   python/qemu/qmp/py.typed      |   0
>   python/qemu/utils/py.typed    |   0
>   python/setup.cfg              |   3 +
>   python/tests/iotests.sh       |   2 +
>   tests/qemu-iotests/297        |  88 ++++-------------------
>   tests/qemu-iotests/linters.py | 130 ++++++++++++++++++++++++++++++++++
>   7 files changed, 148 insertions(+), 75 deletions(-)
>   create mode 100644 python/qemu/machine/py.typed
>   create mode 100644 python/qemu/qmp/py.typed
>   create mode 100644 python/qemu/utils/py.typed
>   create mode 100755 python/tests/iotests.sh
>   create mode 100644 tests/qemu-iotests/linters.py
> 


-- 
Best regards,
Vladimir

