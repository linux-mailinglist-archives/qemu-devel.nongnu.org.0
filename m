Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17423913D9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:35:15 +0200 (CEST)
Received: from localhost ([::1]:37608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpwY-0004eB-9b
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llpv8-0003nr-VT; Wed, 26 May 2021 05:33:46 -0400
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:41761 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llpv3-0008Mb-EW; Wed, 26 May 2021 05:33:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZXvy0p/0DvrYC2wQGOwRMuYZBrGxnyI0eqQ8JUo1aDKHwKKUMHd+aYjopuSjWY2MKrV5H138GNCTRdr3g2O1bY65WkUY9KLi2+vORCC+MtxXabeHDl6OKwU5V+ipVjNVnfQ3JZOG403fOc2bjavSrVCiMvOU/nBUwJg9U8+p7ePDjbVUjAPvK3z98ORavJS+pRvYjo/57r9lOPcOzerxhsH41hGvDecnHrFeBCDj4mknukpDUHS6l+HqVJf7pbkEOY0WIXryqIWtqGU0SsEKJgj1WHbIeiP+jJeSi6wRW3DH0Jk2UB/wKX5ArUGddxQ6eSyCuLVVeI76/gMu9/INQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pxrf9gDF3cBkk+17DSMgpFYGfybjG1M8u8ijrXtvV8=;
 b=J3ZrwLVbLqwlXHi2W6fkwzZGRxXOH8BeLKizW9zB4Wo21QwOxRgE9RXb2h6yswL9zrG6zS7ZnFgW/tNbOSRVCW3CIStGri5VWlrKNdqwNmRJZYJETjncnCbvyXgwm7+04ee7cgIMrp1vq0JKJISRQXU9MCEO8yEWpHcfvtpQn5TfVyJqen14STqRzcZ6apH3dR2D+reeF1Zw+VvUm5d1ynb2o9KMpWvz50dROUP1AUSTowCvPOa3HdGqISwixUZ2X0TqwiDkVZC3kReCn816e4lh3S0mYCIJgzjjkY3b+gb3+TGIZ+szXrFqcddLBrkRfiZpo4uGCBJXP5Ni2Qo4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pxrf9gDF3cBkk+17DSMgpFYGfybjG1M8u8ijrXtvV8=;
 b=vmMiL0OeXwe8ZWY8uRpfAIb0OdR0IU/pj0o8TzRvVUwR1nG+Pn2Qz+GW6uCy2SfKQs3pQapN2sUf2ybPFHS6a//9gVGcV9afVIZOPx0MtJ2B/bsDOIsOaOx57vS95lkb9dLOcR+bZNuovNVV7WaMNoUqsa9/JEQYzP4YXccmw/w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 09:33:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 09:33:34 +0000
Subject: Re: [PATCH v7 31/31] gitlab: add python linters to CI
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-32-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3acc5107-33a4-1ae7-eafb-076d39fbd6e9@virtuozzo.com>
Date: Wed, 26 May 2021 12:33:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526002454.124728-32-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Wed, 26 May 2021 09:33:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3407800b-a7a7-433a-4c5d-08d9202954e5
X-MS-TrafficTypeDiagnostic: AM7PR08MB5382:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5382B7D667E56044A2B7200BC1249@AM7PR08MB5382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GDP34n29M/5YeTSxNeQDbWP47G9n87DqVj/YAD927Ix6BUShqfSmgxTiae2AohuRzYCW9PayprVYiBfYPwacAGJdzIs85EaTOEMqa9q1C4VChcT7z7+cIHfPFfcd9VSSJtgZVgSHN1ppy84fck2jY2OHHBdZUfvez1o+WLTQi2aIIRhjSpq5F1R1HDvkQW086NdN4q2XyrucV47eVgJ06K7o7dwZ3GdDUgutC18mzN2RH2E4IMUv8JdiHYoSEoXW0il4eAqyLfXKt0abNbs8cVfpZcnoHNFgiijVdSqghPiXoSUKziLcA1QzbS7OcldGJSFdgPTb2N+9HW5ugVtngNGM/38OJLibxQb1xNkMp2//pYHiVrIgkIGloPI1YABTRgcuivIP9Heffei7EAmgQxG0eICOeuuUY4UaP2RToC7cEArQEqByDtzRfpNhJNXlXYc3bzPnirwE31wtLqBtcz07/1krGTYUlf7PuJ17hHZ+9XOsEjO9AZvF9xVdmUnGvkGUPNIa07EKUk+gU+IE09GnpVqeNysqGGs78uqLMjTmKkXanikt1opADZIciN3NW8CpFJaw/+obeq8zgF1IpRjWrpEWCsairFu3SumxS6xBZ9ufni7x3alKO0IZ5RJR5Y757NRpmIKFOhbESnEghijHp7uy4r+RU2RZVWnZST7u0DFCjR6DMh8BnaueAqVtNg3YjD0c7pro4tyokalxdggyOiyVe0nrP1oeeGKsKPA755oPuP9u4vnrBreiYKF+2SGr7dF1OGMyDyYH8fXCNnZiNCgicktszldduXSHmqUeLH0jbz4ZzP68kdO6XGdMk5JziLDVlPlOhV+C3LdFqGUgdvf5XyKXwiEyo04+cVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(8936002)(8676002)(66946007)(83380400001)(66556008)(66476007)(54906003)(2616005)(26005)(6486002)(16526019)(52116002)(186003)(38100700002)(31696002)(38350700002)(966005)(956004)(86362001)(31686004)(478600001)(2906002)(7416002)(36756003)(316002)(5660300002)(4326008)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzZaalNLaU9hSVZpYnZiem9QTWx3aU50WXpaajR4RXB5R2Mvc0xWTENEMkRi?=
 =?utf-8?B?d0g0eTVCN3d5VEQvblI3aFlRSERMUFlwVnBYa1prMVZpU1liUzhWQjJySjdp?=
 =?utf-8?B?NjVCNEU0bXJwMHVFVzg5VU9ONHpvZ2NYY3BJY0puZ2dXY3JBSW5kZG1Eeitl?=
 =?utf-8?B?Z2ZTU1hSYXkxcFZkSkdqVUhUZldPNnp0WFRCU1ljVVQ0aWdrR096SUJ2OEFC?=
 =?utf-8?B?aDhZZ3Nmd0JKbDVscFhlQTl3WE9lTnkyTnV5MG95UjVsV2w0YWYrQ3BXeG1G?=
 =?utf-8?B?Tm5BNHBxVm5sM242TjB4RGRlRXNERU1yQThwS3R2SG5sTk5TSzRsczhiZS81?=
 =?utf-8?B?enRadUs0RlNVekFXdTBVN1ZUSmtWYXhIaWp6SnJheWQrY0YxV2l0OFlXVmxF?=
 =?utf-8?B?TTJvdmJaQlU1Q2JlRHBMREJXVE9PUHN3M0NNT3ozOE5tNTRVbzdVYjNzT1Rp?=
 =?utf-8?B?elNvd2YzTzNCRXNHLzBhbGVVM3o0NEJlcTQ4R0Q0TlF2RkRrb2NNZnJCNjZ4?=
 =?utf-8?B?RWRTUXF6eGR5Y1lWSzQ0OWpNU2dSRVkyVUtxOHlZbDc5WnFuNEgwT2dvQ3dD?=
 =?utf-8?B?TXVUN3NEam92eFRvZUdIRkEydTErbTkvcG1FUWVHTWJ0UFhwR2wvVUEreVJJ?=
 =?utf-8?B?R0R1dURDWGdoTDc5MDdJb0dSZ05qb21DbFkza0hObXJ1dlBQQ2h2eXdCcUor?=
 =?utf-8?B?a254L0JkRXczTzJWd3ZvQVpUZ1dRR21NaTUzUUNWNlU1UDVBZmlPY29mRHJE?=
 =?utf-8?B?SnU3NXlyYjJCWWdoQ0IvVDk5cEx4eWdOdkdhcWF2NkFib3k5cUd6RlNzQnFn?=
 =?utf-8?B?Rlp6Lzhjc2dVaUxVekw3RlZGM3NoaUthVnNWOHJrZWQ5aHlRV25vUGZxU2x2?=
 =?utf-8?B?TFJqdUFYTTZsSld3RUtOczQ0RVEvZXEzNVoyNWRLNkhWanlTY0ExQW5Jd3Bx?=
 =?utf-8?B?RE1IWko5ZmpxYTh3b296Z3l5UGhCMmE4MGpEY0NqZ0c5bWZ1eUQyNXZrcGlG?=
 =?utf-8?B?OThPN3ZnL0daS0ZQdHlBVkFhSkZWcVM4VzA2ajFIMEVBWDhrV3A2aEdFOWRX?=
 =?utf-8?B?TGVIU1hCMVhENWVsK1FSNzVoS3c0YjRpMDM1OThyMWtScUxVa3NmYTJ5Yjl6?=
 =?utf-8?B?RXppRktEb2RScCtidnVrbWtYWSsyallVa2ZacS8ya0w2bzZqNFJLeWwwYVYx?=
 =?utf-8?B?WGtPd1dURzZUN3R6eDhucHIxWFdTU1ZQNDZadEhTbkVHQi9vRjhiUmtyWjZR?=
 =?utf-8?B?bVA1Q2grRUp6NEw1VnRtazhBNVVPVnFhM3BqcW13aDZWZ1QyRGNrNFowUEtn?=
 =?utf-8?B?Sk9NMjNTZkNjMld1WEtRWmdYYjJUNDhxa2E0WG5NcGRwM0tROFFEMG1UclZV?=
 =?utf-8?B?cXFRRlZ4c3VZK2JqMnRQb3dVbFRYT2pxYmpscW1aVkVtNExSa3NnMHl3ZXZT?=
 =?utf-8?B?M1AvcnZrYjhwRUp4QlBac0hSNWpXNmpDL2xNOVBWMnpxbSs3RFFZUkVoZjFD?=
 =?utf-8?B?MGFvNjJaamxPSTcvUURpNnk1NlY0N0d4dFUvWG1NR08xZWlRUzNZM1ZubXdL?=
 =?utf-8?B?VDdXa0JmZ1BydTl4KzJKVkgwS3RYUExSbk11WUloby9JNmFlWmx5WUc2Tnpw?=
 =?utf-8?B?T3dxWllWOE00TW5JaTBPZm5ncm1vZ2puRWtFZ3J4MmJNMVY4cGV4YUd6cVM3?=
 =?utf-8?B?VndJNDBYcklNSDg0VXZXTitTM0l3Q2Rka2xPc1pJTVZuemhYOUhRR0ZqYnVv?=
 =?utf-8?Q?2n2GI60mueEuvRp0lhmUG5mVNpKpCDImSKk2QRD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3407800b-a7a7-433a-4c5d-08d9202954e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 09:33:34.2863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbh9yO+vQu6t+KkowbfS8Dsenh7KE+VG10PSAOvxSwBKjDFX5nI/BNhlLA7Znehdbz+ZIewWf3qrU54ZV6ieEl+DtskHrL8zASyU2LEGntY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382
Received-SPF: pass client-ip=40.107.20.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

26.05.2021 03:24, John Snow wrote:
> Add a python container that contains just enough juice for us to run the python
> code quality analysis tools.
> 
> Base this container on fedora, because fedora has very convenient
> packaging for testing multiple python versions.
> 
> Add two tests:
> 
> check-python-pipenv uses pipenv to test a frozen, very explicit set of
> packages against our minimum supported python version, Python 3.6. This
> test is not allowed to fail.
> 
> check-python-tox uses tox to install the latest versions of required
> python dependencies against a wide array of Python versions from 3.6 to
> 3.9, even including the yet-to-be-released Python 3.10. This test is
> allowed to fail with a warning.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .gitlab-ci.d/containers.yml            |  5 +++++
>   .gitlab-ci.yml                         | 26 ++++++++++++++++++++++++++
>   tests/docker/dockerfiles/python.docker | 18 ++++++++++++++++++
>   3 files changed, 49 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/python.docker
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 765408ae274..05ebd4dc11d 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -242,3 +242,8 @@ amd64-opensuse-leap-container:
>     extends: .container_job_template
>     variables:
>       NAME: opensuse-leap
> +
> +python-container:
> +  extends: .container_job_template
> +  variables:
> +    NAME: python
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa78..cc2a3935c62 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -789,6 +789,32 @@ check-patch:
>       GIT_DEPTH: 1000
>     allow_failure: true
>   
> +
> +check-python-pipenv:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> +  script:
> +    - cd python
> +    - make venv-check
> +  variables:
> +    GIT_DEPTH: 1000

Hmm, interesting, why we need depth = 1000? gitlab recommends to keep that number "small like 10" https://docs.gitlab.com/ee/ci/large_repositories/

> +  needs:
> +    job: python-container
> +
> +
> +check-python-tox:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> +  script:
> +    - cd python
> +    - make check-tox
> +  variables:
> +    GIT_DEPTH: 1000
> +  needs:
> +    job: python-container
> +  allow_failure: true
> +
> +
>   check-dco:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
> new file mode 100644
> index 00000000000..56d88417df4
> --- /dev/null
> +++ b/tests/docker/dockerfiles/python.docker
> @@ -0,0 +1,18 @@
> +# Python library testing environment
> +
> +FROM fedora:latest
> +MAINTAINER John Snow <jsnow@redhat.com>
> +
> +# Please keep this list sorted alphabetically
> +ENV PACKAGES \
> +    gcc \

hmm, interesting, why you need gcc to run python linters?

> +    make \
> +    pipenv \
> +    python3 \
> +    python3-pip \
> +    python3-tox \
> +    python3-virtualenv \
> +    python3.10
> +
> +RUN dnf install -y $PACKAGES
> +RUN rpm -q $PACKAGES | sort > /packages.txt
> 


weak, as I'm far from understanding the details, I can only check that it looks similar with nearby files and entities:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

