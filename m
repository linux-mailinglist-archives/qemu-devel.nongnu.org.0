Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3265434A53B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 11:03:56 +0100 (CET)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPjJq-0002yW-Lb
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 06:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPjI0-0002Vb-Dp
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:02:00 -0400
Received: from mail-eopbgr140103.outbound.protection.outlook.com
 ([40.107.14.103]:31286 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPjHw-0006hg-CB
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:01:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFRi2ZW4+bKgdrnETLZU1gHpiw4fL2G6Vh2aws3ZZesg0TxiVJaNd0eJO2DS2rp5u5pak558y/k8jtD5IG7pYJIbuOpsGQgSKyo5Zc1k8P65bwgm6kE5ns8cUtwjDkPlFEOczjpLDrnoPnYp8kOJSUrbZKrvfv9sUhqKN5JGleY+RXWIul+m6LXbnzVbKFrqaHYmChjllqJ18XFjn/6kGaQf++Hb0rOctuTSwOmp/n9K1gO2n16pduRfsbzu6Wz2YVuSndRMl3jypS9hZqWEI0yMuSefCuliQlopnzhuv5Ra3QuqSb7i2rnoPF+PMK+uMAuulBgug8Ju0nX9KR4pgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOoxWyIbGb2af7deNCMhGQQ2ygz3kJY0MosKQRX1fsQ=;
 b=Uc7Ge5KuJD6ujCqUiEbSVggpr8iWXzLVE6xnFqoHobw5d+HLS2ZPrAn+vQDBovakNAH+PFh1ZoHRXfi64YgkpI4iCqcrekqQCc3a1dMuSAElpyTmB5rPKglJcwYLYmz5sZ60kiXqTuDe8miJj196PbatxZFn4TxzNYggKFUBNlyZTjXtyqeMXvUXdofS5uGJ5cdY0n/DxXfpRS5i2VaCjaZjjrDmNBNxVq6JwBHGp5pvvpyrLctaVczCRmCEoRBVwfgmtqQ+w6z/esnUC8uXCtlRhjsyO57yZ0ILyclkS38XfU7Fz66REgVUmsvz/bfe9b+LaqNQ6t62TRvyx22sHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOoxWyIbGb2af7deNCMhGQQ2ygz3kJY0MosKQRX1fsQ=;
 b=kZzwP/Uu0ARWM04GA+kZ/4N3QhQ6+D4F+imoHOzTHZ94EQVICxKnnPBrB9InxahWHUiW5BV6PjjT39PbGLFoTZabwVoPSTwxL84bZL5MlfS3AZo/OzxViv0ezI3r1TYzMdl1KP6teO2cqTrZXjNAcsSssC3YV7qbrCwAz89baz4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 10:01:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 10:01:51 +0000
Subject: Re: [PATCH v2] qapi: introduce 'query-cpu-model-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210325165705.2342-1-valeriy.vdovin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c990804e-3180-5575-3a30-06fa6d3e7630@virtuozzo.com>
Date: Fri, 26 Mar 2021 13:01:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210325165705.2342-1-valeriy.vdovin@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR10CA0092.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::45) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR10CA0092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 10:01:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fe0dc61-a959-404d-d470-08d8f03e2d27
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053675CAC43FCF869A2403AC1619@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll+zdmFR/UEZmUlnsxmy7WyyEdoO8NYRemdJva4+Uzx0X4PviuFvSxZwqRp9nSg0QpnucF/AKNA09arBh0Jo2Qql6cVLdzKVhcadYVXk3bzmjs8S8nodIk1QUuTrS2ltYkHLs0bG+pdcveqzgDvBtHPEaNnYQv5AEIaGJbwp8Yit0GcJw6z4diIJzGfzaHrtm1i6+0VL8f1JYFD2JQHdIQK7vp04ExQW2GkFtOgpm//6usNx605aIJRAGkh2F4mb3ZTuIRGjeM4H+9wY3ifDCWLM3+RapM1OpL64tB4uBCfdUKXPGNzBQu6LTm86oSaLf3b4ohbVI2XLV8gYI2wuh7aXpr8Tb0jqRa3zLjbrW9EkLRhGmPcefz5lkZQByZ5C4A2X9ax4DED3FgekwGaoo7zsOc2wP0Jtbftebv9p+5tZnW5/3keh0e3wKooAqKj4RjfvPVD0i14WKMgWajQYFfEThtO2v3stC0eGY0QtmXnXf34VDAIQ2lej4QEyK46CYCm71Chr+9AUApYM0pO2guscvVaTxCQSD/j6/aU9Ck11Igr7fm6YzNlFOXv4GPOAAJH1EGJcNtWJKt8X9MEABxVVlITTblcIHkkAvX4nS1j/P6QtFJCsnPjNbl9Ld5JXZzI7La0LxASvScG2b/6kTE6IrBo9JQ1wRjawdGVRb56M3GxFj/zIiKpnUKVifJn6DKFnsVxiMDkiLQgEbN5+q7Oe6r/OLZrliOlR3zFscwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39840400004)(8676002)(54906003)(186003)(83380400001)(38100700001)(478600001)(316002)(52116002)(16576012)(26005)(86362001)(31696002)(36756003)(16526019)(8936002)(66556008)(2906002)(107886003)(30864003)(5660300002)(66946007)(956004)(4326008)(2616005)(31686004)(6486002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1QvVFppdWl1SE55VVJTUmtZeWhtclBncUJWMWlhWlJoY2xXbU5FbjZGeExm?=
 =?utf-8?B?alE3dWdFKzZxR1lsVEZyS1FHc0RBbVBYN2lkUElPL1Zuc1Q1L1cxM2dZblhE?=
 =?utf-8?B?c1pSWGdFeWFuVEc4OWxLY0dQMUpIaGxSaWFpU2lUa3hCTysvbTFnaS9qWG8v?=
 =?utf-8?B?b3lZeXlHd1hFcjR6L1d6aHpjUDlsbzdpUEwyNk9zM0ZYVGlSNXRxUmNxTTBw?=
 =?utf-8?B?djdxUVAwWkZObWJJMnJaRzFqbGNXRWFISkNRd0NvVXlUY1VQUmNieDdxTnll?=
 =?utf-8?B?R004ZzlkUEdwVFlsUW9LbEFMNmp6b2tLaEJFaGhOT3ZNaU1uYXg4U0lVRENi?=
 =?utf-8?B?Mi8yRXEreTQ1WFVhY0d5bmFVWUsvZ0Fibk9rZ2Z4NUVrZ0lRNC9Da21sdzBm?=
 =?utf-8?B?VVdGZnlEYTUvd3pHemtFVWRjRnFrbVZ1di9TMHdjUHZZTW9iMGZYanlRando?=
 =?utf-8?B?bWZWVHpRQlU0WW1sNzl6d1BKSGJ5ZSt3cTEvbVRxbHVLTGVtZFdkT3cyRHBo?=
 =?utf-8?B?TDE2SmF6ZHhLbTEyRHJUdnV1di9QL0ZjZXFrcDNyOUtnVVJTdkRjN3QyQVpW?=
 =?utf-8?B?WEx4ZGFEVndpa2xBOHI5eTFhLzljUUhwY1FCWGJCTWx1MDJ2Wm9zSlhwWStV?=
 =?utf-8?B?SkdUM0h6b3gzQ2pRVUdlWXNZSEVETjZWTklSSWllbS9JUVJZaFVGd2NIdXF1?=
 =?utf-8?B?YzYxOXNCUW1jWHNmRGc2YVlyVlNlUDcreHVscXlZUkZmaG5Cckh6aCtMUk9t?=
 =?utf-8?B?RktjcWEwN29lcldrdnd3K3FYbWhGbE81WC83TTJENmNTdlBCVk54NkYvQmta?=
 =?utf-8?B?K3FmamUvcGkvYWlOL3VIMXRyc2Q2ZjN5bmFHTVRvM3lwK2d3dHdoZ0JEYzdI?=
 =?utf-8?B?bm5wQXgrd1dHdjZ1QnFsaCttOHN1Q2VYYmpzSGwveXk1RjJNalZWeWRFaDdl?=
 =?utf-8?B?Sldzd2YzQll0N3RYRUZGakRhVndTakNjRmJlRVJoRFA3Z29tc2poNkpHUUg3?=
 =?utf-8?B?VG94MUw0VkhnMGNSQ0hZVjdZZDFubG9MRktOdGxGQnZyNUFHSllXbGwzVzEr?=
 =?utf-8?B?STY4bjBXdTU3aHh3ckI5WHpWVEVJeEFMTVZqUVdzazRlSHBiNktjcU0yczRk?=
 =?utf-8?B?L3JpdzJ1ZlRaZzJ5Q0hjSHN4azRFSWl5ZzlIU2hYenJqWFZWNDhna1ZGS3kz?=
 =?utf-8?B?dnlNS1VPdHlDRGkxbzRnM05TWm1mdlFoaVFSZlhuUHlxNGQrSkFqdXZoQnc2?=
 =?utf-8?B?MTZ6bklGYVYzODhrWXY0ekVNbzdQbENrMkRvU0NWdk5mTTQ3aytXS1kwVTIz?=
 =?utf-8?B?dHlvV3BrSlZoNi9oaTJJbVRIUGh4SnNqSFpPWVJOSlo1dGI1c1A4OVhJTUgr?=
 =?utf-8?B?RGRMUENMRUUyVXRCbGRjWEd0YkEySWhERUtibUQ0eVdiRzBEVUZZT1VFcXJ4?=
 =?utf-8?B?K2c4Ukw1VWR1YVRWaXNtb3lnbXExdUpyZ0Q1M0syOVM0N3RrWkx4QXhiK2lM?=
 =?utf-8?B?WVczcGhtZGhTNHhwVWtwOGZiVXB0VmlmaWYyNERUTmF1K2VvdnFZcTVrNW9k?=
 =?utf-8?B?RFBTU2UzNmNJdXk2TjV5VUl1eFhLa3B6NTQ4TmdaODNGT2JPempWL0RteHE0?=
 =?utf-8?B?NFRtZ204b05aYmo0LzFrcnA4SExHMEJvTTd6em8ydC9oTTdSaU55aEtVa01G?=
 =?utf-8?B?a25MQVU1aWN0c1dibWtyZ1FtOXdhN25XbjMrdk9lNi9kbE4xWFpXeDUwUCtu?=
 =?utf-8?Q?bGZkXdGqtovbCWKjQNWXMcnViCMdG+ai5U/KTdj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe0dc61-a959-404d-d470-08d8f03e2d27
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 10:01:51.2165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGIRTfz5uxbMjZQ6DQebUhIRGXEpo60c9Xkaw6nLXpvJ5fGh6KXXnjB+FjZUYyW+ya4qSlzXwwrJCxVNZutK1ze2eckVopTE+5NgeWJlb2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.14.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.03.2021 19:57, Valeriy Vdovin wrote:
> Introducing new qapi method 'query-cpu-model-cpuid'. This method can be used to
> get virtualized cpu model info generated by QEMU during VM initialization in
> the form of cpuid representation.
> 
> Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
> command line option. From there it takes the name of the model as the basis for
> feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
> that state if additional cpu features should be present on the virtual cpu or
> excluded from it (tokens '+'/'-' or '=on'/'=off').
> After that QEMU checks if the host's cpu can actually support the derived
> feature set and applies host limitations to it.
> After this initialization procedure, virtual cpu has it's model and
> vendor names, and a working feature set and is ready for identification
> instructions such as CPUID.
> 
> Currently full output for this method is only supported for x86 cpus.
> 
> To learn exactly how virtual cpu is presented to the guest machine via CPUID
> instruction, new qapi method can be used. By calling 'query-cpu-model-cpuid'
> method, one can get a full listing of all CPUID leafs with subleafs which are
> supported by the initialized virtual cpu.
> 
> Other than debug, the method is useful in cases when we would like to
> utilize QEMU's virtual cpu initialization routines and put the retrieved
> values into kernel CPUID overriding mechanics for more precise control
> over how various processes perceive its underlying hardware with
> container processes as a good example.
> 
> Output format:
> The core part of the returned JSON object can be described as a list of lists
> with top level list contains leaf-level elements and the bottom level
> containing subleafs, where 'leaf' is CPUID argument passed in EAX register and
> 'subleaf' is a value passed to CPUID in ECX register for some specific
> leafs, that support that. Each most basic CPUID result is passed in a
> maximum of 4 registers EAX, EBX, ECX and EDX, with most leafs not utilizing
> all 4 registers at once.
> Also note that 'subleaf' is a kind of extension, used by only a couple of
> leafs, while most of the leafs don't have this. Nevertheless, the output
> data structure presents ALL leafs as having at least a single 'subleaf'.
> This is done for data structure uniformity, so that it could be
> processed in a more straightforward manner, in this case no one suffers
> from such simplification.
> 
> Use example:
> virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
> {
>    "return": {
>      "cpuid": {
>        "leafs": [
>          {
>            "leaf": 0,
>            "subleafs": [
>              {
>                "eax": 13,
>                "edx": 1231384169,
>                "ecx": 1818588270,
>                "ebx": 1970169159,
>                "subleaf": 0
>              }
>            ]
>          },
>          {
>            "leaf": 1,
>            "subleafs": [
>              {
>                "eax": 329443,
>                "edx": 529267711,
>                "ecx": 4160369187,
>                "ebx": 133120,
>                "subleaf": 0
>              }
>            ]
>          },
>          {
>            "leaf": 2,
>            "subleafs": [
>              {
>                "eax": 1,
>                "edx": 2895997,
>                "ecx": 0,
>                "ebx": 0,
>                "subleaf": 0
>              }
>            ]
>          },
>        ]
>      },
>      "vendor": "GenuineIntel",
>      "class-name": "Skylake-Client-IBRS-x86_64-cpu",
>      "model-id": "Intel Core Processor (Skylake, IBRS)"
>    },
>    "id": "libvirt-40"
> }
> 
> Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
> ---
> v2: - Removed leaf/subleaf iterators.
>      - Modified cpu_x86_cpuid to return false in cases when count is
>        greater than supported subleaves.
> 
>   qapi/machine-target.json | 122 +++++++++++++++++++++++
>   target/i386/cpu.h        |   2 +-
>   target/i386/cpu.c        | 209 +++++++++++++++++++++++++++++++++++----
>   3 files changed, 315 insertions(+), 18 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b7..c5b137aa5c 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,125 @@
>   ##
>   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>     'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +##
> +
> +
> +# @CpuidSubleaf:
> +#
> +# CPUID leaf extension information, based on ECX value.
> +#
> +# CPUID x86 instruction has 'leaf' argument passed in EAX register. Leaf
> +# argument identifies the type of information, the caller wants to retrieve in
> +# single call to CPUID.
> +# Some but not all leaves depend on the value passed in ECX register as an
> +# additional argument to CPUID. This argument is present in cpuid documentation
> +# as 'subleaf'.
> +# If CPUID ignores the value in ECX, normally this means that leaf does not
> +# have subleaves. Another way to see it is that each leaf has at least one
> +# subleaf (one type of output).
> +#
> +# @subleaf: value passed to CPUID in ECX register. If CPUID leaf has only a
> +#           single leaf, the value of ECX is ignored by CPU and should as well
> +#           be ignored in this field.
> +# @eax: value in eax after CPUID instruction
> +# @ebx: value in ebx after CPUID instruction
> +# @ecx: value in ecx after CPUID instruction
> +# @edx: value in edx after CPUID instruction
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuidSubleaf',
> +  'data': { 'subleaf' : 'int',
> +            'eax': 'int',
> +            'ebx': 'int',
> +            'ecx': 'int',
> +            'edx': 'int'
> +          }
> +}
> +
> +##
> +# @CpuidLeaf:
> +#
> +# A single CPUID leaf.
> +#
> +# CPUID instruction accepts 'leaf' argument passed in EAX register.
> +# A 'leaf' is a single group of information about the CPU, that is returned
> +# to the caller in EAX, EBX, ECX and EDX registers. A few of the leaves will
> +# also have 'subleaves', the group of information would partially depend on the
> +# value passed in the ECX register. If the leaf has subleaves, it will
> +# only have more than one item in 'subleaves' array. If the leaf has no
> +# subleaves, only one item will be present in the 'subleaves' list.
> +#
> +# @leaf: CPUID leaf or the value of EAX prior to CPUID execution.
> +# @subleaves: array of subleaves.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuidLeaf',
> +  'data': { 'leaf' : 'int',
> +            'subleaves' : [ 'CpuidSubleaf' ] } }
> +
> +##
> +# @CpuModelCpuid:
> +#
> +# Virtual CPU model.
> +#
> +# A CPU model consists of the name of a CPU definition, to which
> +# delta changes are applied (e.g. features added/removed). Most magic values
> +# that an architecture might require should be hidden behind the name.
> +# However, if required, architectures can expose relevant properties.
> +#
> +# @leaves: array of all available cpuid leaves
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuModelCpuid',
> +  'data': {  'leaves' : [ 'CpuidLeaf' ] }
> +}
> +
> +##
> +# @CpuModelCpuidDescription:
> +#
> +# Virtual CPU model.
> +#
> +# This describes information generated by QEMU and used by it to respond CPUID
> +# requests from guest along with some general information about the cpu model,
> +# that might be useful for the caller of qapi requests.
> +#
> +# @class-name: class name of the CPU model in qemu object model
> +# @model-id: CPU model name string that will be passed in CPUID, EAX=0
> +# @vendor: CPU vendor name string that will be passed in CPUID, EAX=0
> +# @cpuid: Full tree of CPUID leaves, that is generated by QEMU at virtual cpu
> +#         initialization step by parsing "-cpu " option and creating the virtual cpu
> +#         model. CpuModelCpuidDescription can be examined to predict QEMU's response to
> +#         CPUID instructions from the guest.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuModelCpuidDescription',
> +  'data': {  'class-name': 'str',
> +             'model-id': 'str',
> +             'vendor' : 'str',
> +             'cpuid' : 'CpuModelCpuid'
> +          }
> +}
> +
> +##
> +# @query-cpu-model-cpuid:
> +#
> +# Returns description of a virtual CPU model, created by QEMU after cpu
> +# initialization routines. The resulting information is a reflection of a parsed
> +# '-cpu' command line option, filtered by available host cpu features.
> +#
> +# Returns:  @CpuModelCpuidDescription
> +#
> +# Example:
> +#
> +# -> { "execute": "query-cpu-model-cpuid" }
> +# <- { "return": 'CpuModelCpuidDescription' }
> +#
> +# Since: 6.1
> +##
> +{ 'command': 'query-cpu-model-cpuid',
> +  'returns': 'CpuModelCpuidDescription',
> +  'if': 'defined(TARGET_I386)' }
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 570f916878..19c1dfea60 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1926,7 +1926,7 @@ int cpu_x86_signal_handler(int host_signum, void *pinfo,
>                              void *puc);
>   
>   /* cpu.c */
> -void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> +bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                      uint32_t *eax, uint32_t *ebx,
>                      uint32_t *ecx, uint32_t *edx);
>   void cpu_clear_apic_feature(CPUX86State *env);
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6b3e9467f1..9f3bc7d448 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5148,6 +5148,161 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>       return cpu_list;
>   }
>   
> +/*
> + * struct cpuid_leaf_range - helper struct that describes valid range of
> + * cpuid leaves as returned by CPUID in response to EAX=0 or EAX=0x80000000,
> + * etc.
> + *
> + * The purpose of this struct is to deal with a sparse nature of leaf value
> + * space. Ther CPUID logic of returning the maximum leaf is not straightforward

s/Ther/The/

> + * and requires inner knowledge of what cpuid extensions are available on a
> + * specific cpu. Also this logic is designed to be expandable across many years
> + * ahead. QEMU code would have to be updated as well. That's why there should
> + * be only one point where all cpuid leaf ranges logic will be modified.
> + *
> + * In practice this will be used to detect if any arbitrary cpuid leaf value
> + * is valid for a specific cpu model. For that one will call
> + * 'cpuid_get_cpuid_leaf_ranges' to get all valid ranges for a provided cpu
> + * model and then call 'cpu_leaf_in_range' to find out which of the ranges
> + * contains the leaf in question.
> + */
> +#define CPUID_MAX_LEAF_RANGES 4
> +
> +struct cpuid_leaf_range {

As I said, you should use CamelCase and add a typedef to satisfy QEMU coding style (docs/devel/style.rst)

> +    uint32_t min;
> +    uint32_t max;
> +};
> +
> +struct cpuid_leaf_ranges {
> +    struct cpuid_leaf_range ranges[CPUID_MAX_LEAF_RANGES];
> +    int count;
> +};
> +
> +static void cpuid_get_cpuid_leaf_ranges(CPUX86State *env,
> +                                        struct cpuid_leaf_ranges *r)
> +{
> +    struct cpuid_leaf_range *rng;
> +
> +    r->count = 0;
> +    rng = &r->ranges[r->count++];
> +    rng->min = 0x00000000;
> +    rng->max = env->cpuid_level;
> +
> +    rng = &r->ranges[r->count++];
> +    rng->min = 0x40000000;
> +    rng->max = 0x40000001;
> +
> +    if (env->cpuid_xlevel) {
> +        rng = &r->ranges[r->count++];
> +        rng->min = 0x80000000;
> +        rng->max = env->cpuid_xlevel;
> +    }
> +
> +    if (env->cpuid_xlevel2) {
> +        rng = &r->ranges[r->count++];
> +        rng->min = 0xC0000000;
> +        rng->max = env->cpuid_xlevel2;
> +    }
> +}
> +
> +static inline bool cpuid_leaf_in_range(uint32_t leaf,
> +                                       struct cpuid_leaf_range *r)
> +{
> +    return leaf >= r->min && leaf <= r->max;
> +}
> +
> +static uint32_t cpuid_limit_from_leaf(CPUX86State *env, uint32_t leaf)
> +{
> +    struct cpuid_leaf_ranges ranges;
> +    struct cpuid_leaf_range *current_range, *end_range;
> +
> +    cpuid_get_cpuid_leaf_ranges(env, &ranges);
> +    current_range = &ranges.ranges[0];
> +    end_range = current_range + ranges.count;
> +    while (current_range != end_range) {
> +        if (cpuid_leaf_in_range(leaf, current_range)) {
> +            break;
> +        }
> +        current_range++;
> +    }
> +    if (current_range != end_range) {
> +        return current_range->max;
> +    }

use for loop, it would be shorter and needs less variables.

> +    return 0;
> +}
> +
> +static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
> +                                 Error **errp)
> +{
> +    struct cpuid_leaf_ranges ranges;
> +    struct cpuid_leaf_range *range;
> +    uint32_t eax, ebx, ecx, edx;
> +    CpuidLeaf *leaf;
> +    CpuidLeafList **leaf_tail;
> +    CpuidSubleaf *subleaf;
> +    CpuidSubleafList **subleaf_tail;
> +    X86CPU *x86_cpu = X86_CPU(cpu);
> +
> +    int range_idx;
> +    int leaf_idx, subleaf_idx;
> +
> +    info->cpuid = g_malloc0(sizeof(*info->cpuid));
> +    leaf_tail = &info->cpuid->leaves;
> +    info->model_id = object_property_get_str(cpu, "model-id", errp);
> +    info->vendor = object_property_get_str(cpu, "vendor", errp);

you need g_strdup() for putting strings into qapi.

> +
> +    cpuid_get_cpuid_leaf_ranges(&x86_cpu->env, &ranges);
> +    for (range_idx = 0; range_idx < ranges.count; ++range_idx) {
> +        range = &ranges.ranges[range_idx];
> +        for (leaf_idx = range->min; leaf_idx <= range->max; ++leaf_idx) {
> +            subleaf_idx = 0;
> +            if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax, &ebx,
> +                           &ecx, &edx)) {

indentation broken

> +                continue;
> +            }
> +
> +            leaf = g_malloc0(sizeof(*leaf));
> +            leaf->leaf = leaf_idx;
> +            subleaf_tail = &leaf->subleaves;
> +            while (true) {
> +                subleaf = g_malloc0(sizeof(*subleaf));
> +                subleaf->subleaf = subleaf_idx;
> +                subleaf->eax = eax;
> +                subleaf->ebx = ebx;
> +                subleaf->ecx = ecx;
> +                subleaf->edx = edx;
> +                QAPI_LIST_APPEND(subleaf_tail, subleaf);
> +                subleaf_idx++;
> +                if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax,
> +                                   &ebx, &ecx, &edx)) {
> +                    break;
> +                }
> +            }

looks like do { } while (cpu_x86_cpuid(..)); I'd use do-while.. But it's OK as is.


> +            QAPI_LIST_APPEND(leaf_tail, leaf);
> +        }
> +    }
> +}
> +
> +CpuModelCpuidDescription *qmp_query_cpu_model_cpuid(Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    const char *class_name;
> +    CpuModelCpuidDescription *info;
> +    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME,
> +                                          -1, &error_abort);
> +    Object *cpu = ms->possible_cpus->cpus[0].cpu;

Hmm, what is ms->possible_cpus->cpus[0]? For me (not knowing the subsytem) looks like you query one of the cpus, and user can't select which cpu he wants to query..

In other word, interface of the new command is strange if we have more than one possible cpu..

For exmaple qmp_query_cpus_fast to CPU_FOREACH.. Shouldn't we do something like this?

Or may be new cpuid information should be just added to qmp_qeury_cpus_fast command ?

Hmm, or look at qmp_query_cpu_definitions.. it does g_slist_foreach()..

Also, we have implementation of qmp_query_cpu_* commands in different architectures.. Probably we'll need add some stubs for the new command as well.

> +
> +    class_name = object_class_get_name(object_get_class(cpu));
> +    info = g_malloc0(sizeof(*info));
> +    info->class_name = g_strdup(class_name);
> +
> +    if (target == SYS_EMU_TARGET_X86_64) {
> +        cpu_model_fill_cpuid(cpu, info, errp);
> +    }
> +
> +    return info;
> +}
> +
>   static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>                                                      bool migratable_only)
>   {
> @@ -5591,14 +5746,14 @@ void cpu_clear_apic_feature(CPUX86State *env)
>   
>   #endif /* !CONFIG_USER_ONLY */
>   
> -void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> +bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,

please, add a comment above the function that would describe the interface, or at least document the new return value.

>                      uint32_t *eax, uint32_t *ebx,
>                      uint32_t *ecx, uint32_t *edx)
>   {
>       X86CPU *cpu = env_archcpu(env);
>       CPUState *cs = env_cpu(env);
>       uint32_t die_offset;
> -    uint32_t limit;
> +    uint32_t limit, nr_subleaves = 1;

It was my idea.. I now think that it would be simpler to just do

bool valid = true; here. and set it to false in some places.

>       uint32_t signature[3];
>       X86CPUTopoInfo topo_info;
>   
> @@ -5607,15 +5762,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>       topo_info.threads_per_core = cs->nr_threads;
>   
>       /* Calculate & apply limits for different index ranges */
> -    if (index >= 0xC0000000) {
> -        limit = env->cpuid_xlevel2;
> -    } else if (index >= 0x80000000) {
> -        limit = env->cpuid_xlevel;
> -    } else if (index >= 0x40000000) {
> -        limit = 0x40000001;
> -    } else {
> -        limit = env->cpuid_level;
> -    }
> +    limit = cpuid_limit_from_leaf(env, index);
>   
>       if (index > limit) {
>           /* Intel documentation states that invalid EAX input will
> @@ -5675,8 +5822,18 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               if ((*eax & 31) && cs->nr_cores > 1) {
>                   *eax |= (cs->nr_cores - 1) << 26;
>               }
> +            if (*eax || *ebx || *ecx || *edx) {
> +                /*
> +                 * host_cpuid has returned some valid info, that means count
> +                 * is a valid agrument. Now we need to return true at function
> +                 * exit by altering nr_subleaves to pass the return condition.
> +                 * This is special for leaf 4.
> +                 */
> +                nr_subleaves = count + 1;
> +            }
>           } else {
>               *eax = 0;
> +            nr_subleaves = 3;
>               switch (count) {
>               case 0: /* L1 dcache info */
>                   encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
> @@ -5724,6 +5881,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           break;
>       case 7:
>           /* Structured Extended Feature Flags Enumeration Leaf */
> +
> +        /*
> +         * env->cpuid_level_func7 returns the maximum subleaf index, whereas
> +         * nr_subleaves - is the count, that's why + 1.
> +         */
> +        nr_subleaves = env->cpuid_level_func7 + 1;
>           if (count == 0) {
>               /* Maximum ECX value for sub-leaves */
>               *eax = env->cpuid_level_func7;
> @@ -5777,12 +5940,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           /* Extended Topology Enumeration Leaf */
>           if (!cpu->enable_cpuid_0xb) {
>                   *eax = *ebx = *ecx = *edx = 0;
> -                break;
> +                return false;
>           }
>   
>           *ecx = count & 0xff;
>           *edx = cpu->apic_id;
> -
> +        nr_subleaves = 2;
>           switch (count) {
>           case 0:
>               *eax = apicid_core_offset(&topo_info);
> @@ -5812,6 +5975,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>   
>           *ecx = count & 0xff;
>           *edx = cpu->apic_id;
> +        nr_subleaves = 3;
>           switch (count) {
>           case 0:
>               *eax = apicid_core_offset(&topo_info);
> @@ -5843,9 +6007,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *ecx = 0;
>           *edx = 0;
>           if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
> -            break;
> +            return false;
>           }
>   
> +        nr_subleaves = ARRAY_SIZE(x86_ext_save_areas);
>           if (count == 0) {
>               *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
>               *eax = env->features[FEAT_XSAVE_COMP_LO];
> @@ -5876,9 +6041,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *edx = 0;
>           if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) ||
>               !kvm_enabled()) {
> -            break;
> +            return false;
>           }
>   
> +        nr_subleaves = 2;
>           if (count == 0) {
>               *eax = INTEL_PT_MAX_SUBLEAF;
>               *ebx = INTEL_PT_MINIMAL_EBX;
> @@ -6031,6 +6197,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *eax = 0;
>           if (cpu->cache_info_passthrough) {
>               host_cpuid(index, count, eax, ebx, ecx, edx);
> +            /*
> +             * Because we pass to the host we can only check how it fills
> +             * output registers to check if count arg is valid.
> +             */
> +            if (!(*eax || *ebx || *ecx || *edx)) {
> +                return false;
> +            }
>               break;
>           }
>           switch (count) {
> @@ -6052,7 +6225,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               break;
>           default: /* end of info */
>               *eax = *ebx = *ecx = *edx = 0;
> -            break;
> +            nr_subleaves = 3;
>           }
>           break;
>       case 0x8000001E:
> @@ -6063,6 +6236,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               *ebx = 0;
>               *ecx = 0;
>               *edx = 0;
> +            return false;
>           }
>           break;
>       case 0xC0000000:
> @@ -6101,8 +6275,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *ebx = 0;
>           *ecx = 0;
>           *edx = 0;
> -        break;
> +        return false;
>       }
> +    return count < nr_subleaves ;
>   }
>   
>   static void x86_cpu_reset(DeviceState *dev)
> 


-- 
Best regards,
Vladimir

