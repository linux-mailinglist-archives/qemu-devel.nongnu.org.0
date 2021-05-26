Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52334391386
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:18:40 +0200 (CEST)
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpgU-0001IA-DA
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llpce-0004EL-Bu; Wed, 26 May 2021 05:14:40 -0400
Received: from mail-vi1eur05on2124.outbound.protection.outlook.com
 ([40.107.21.124]:40778 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llpcX-000299-MU; Wed, 26 May 2021 05:14:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IASJj/KPJ3e3FgBR5aYqhITANS/j7I8IImkfv03BDpvhj1oo7oD5OiTVH3CqoAmEeH9NmWJ7i2N8Y3ubkPlKMgfndGpi+A7/G3kRMC4h+2EKAv3f1iyi2HSyXN3Yko+/LIvKg/jIgB8HtSgUIbSaEik4NE/aVyENslmMklsn3naPoV3jEOLRIB7VVLIChKmleEoCChf7q4F+yfFEnsk/q97wtzpKhvxqANxMVmGLvkGeYoDGMIhera0cW7Z+kxvEf6lBR8ZJB0k446lBjt9WEIpAsAAOGExUwI0RYlL2GMyUeZwXqaPLZznu7MycRS2xsIauMcrR1Cfz4rFwNHDSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ1aQNXPCudCy3qQ+MD3e8VUjG5aYLpie5hpaVmvCJM=;
 b=iwsovCQJjv+f5ATeGJyMJavGKqa8YzSO7XW7x+cQD5F76k4yPDRNR4cfwnHKqKL/lO+ccfeBuhqF4aGBG31I3oh5t9Y1+xFxgETYVsnOvC2JHZLmJKWF9YMXkrCSzYy3M7YiaCgVG+JXiFquXNUE1c/ChtQkAPKXmb8JUmDP24+ItDrB94sMZusKnDEkA3Y+8cIItQFB1ydzw7l47om4IYY8Zyvo/qh8p5+d1VWQLl4rb7ilQcyxQzwtkjFyUwQm92jNTBHbYQeF8KHstWXxKE2dOR5s5lbcpDbNz96aJ58zCE/y9QiQwBfUdHZXnc+KQXCgUriMcBD3L9Eq4dRCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ1aQNXPCudCy3qQ+MD3e8VUjG5aYLpie5hpaVmvCJM=;
 b=Si8jh3wzebckqZdKcCz24/ooX9fd+u3H4oo+/TAj5D8nKVMOZendMdMJCwN3/0KyUR+uRg/YDGzO0ztbwvzq+7A7o03X/Vdg9FsOQ2TcrHO4Cu0ZQZ3LlsRXGIT7zSlh7G6in5h8gF7RRC/1NpVex8krPnv2sk1uQ8P8RwSdDes=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 09:14:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 09:14:28 +0000
Subject: Re: [PATCH v7 17/31] python: add pylint to pipenv
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
 <20210526002454.124728-18-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <75ef5c16-eac7-1d67-b140-5c02d209327b@virtuozzo.com>
Date: Wed, 26 May 2021 12:14:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526002454.124728-18-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 09:14:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8d5cb1a-ff82-4963-ea35-08d92026aa33
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32216860AA0BB415F2EBD97CC1249@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+vZlTadY4LFenW8vbZ9vsCbtPykQQTMUa27grrxsRPsqucVS7Kf94IKxZyto53Dgf3nC/tQ2Csr20NWKs1G4QDyxV+9eHEiKr511BHH3xXghWGdSqTYrxS66d9rJagamBRZFkk7D1j851MIBOTU5dyqP4DtWPfPZptlrJfMnioKE+cjxqEVvIwlUNvFnpJB+o6P+6pzWmdIFrh3T00fWdwODEab9eyp1mpUFd0jmsFQvRxZWHuuJhbOmPowspOgbbEQ1TuGKAH8YXPBD5t4duiiaJD/LoGdf0dUzJBJ0zUw3RafCJoX92I+XXpS2yueyQA70nLwnGvmNQ4Y3HPPJFkknE3HJKqjek9gOktlD354DFdOMO/WkEibRGQbocpgiUD2lM0E5g48Y2wBK3loPfwtccCicoQMaMFLbgI4D77W4bUfkpXlJjMGRiY01HDwGA5SqVxvh/HwLv6pOA3GliAIuPP0BNCW03GMuBNaemok0l5ccqd2od3EXB65rpemqp/ymZSdyApW0jjsCJjsP/TgNs+/nAI8jqc2TDoReW8QEUpdNdLNw9VO6utGw0M0dPEQNnU07pYnsnqkuje1oHiaEa5i4cw5WLDcJZJZ8Ev3WZSiygMnUqmh40efpAWHXjqxt7vjfZlm+G8bQFG7JUjlFzWCJC8ZZ9W3Inj0x0IgeqF2/3uqQFtOxLWMy0Ws107qjdyCNvYwY6HGIbW2BpqeqHefHgYIe5sdWgkFaP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(376002)(366004)(136003)(38100700002)(5660300002)(38350700002)(86362001)(16526019)(186003)(2616005)(36756003)(4326008)(8676002)(31696002)(8936002)(956004)(6486002)(316002)(478600001)(52116002)(7416002)(66476007)(66556008)(83380400001)(66946007)(26005)(2906002)(54906003)(31686004)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YnJ6SU9DTU9HZ3hvSHNqaWNtb2hmUGVocVh4ZElTdmRJd3RTOGhYVVJMeG1P?=
 =?utf-8?B?RFVwYnFydndKVkZ4RGl1OEphRk1QZ0s3RTBoTS9rUzJrVC9kWG5nL2ZVeFZV?=
 =?utf-8?B?cE5oV2o5KzhTdm9jT2dnRmVqTW5HcGpPdHVJOGZJalF2N3ZyUTFkajduNENS?=
 =?utf-8?B?b3duU2V5SWxkd3F2d2p5MTFwSG5Md2hyMXQyb2ZIZVZUQ0htWFk0M3U4UUh1?=
 =?utf-8?B?Z0NHY3RCOGYyV093Tlp1cUg4ZkZ1V2dWdkxuZnp3RCtQcStTbzZjYXp6RmlH?=
 =?utf-8?B?Y2dNZi90blFqQW1aY0Q1Q1J1QXlpSDVlaVFDLzlBVzJPT0FKTGxsZlVkTnpV?=
 =?utf-8?B?b2JDS0xtZ3pKZnU3S1MwbnpuS2cwMVRsTnpXRzJHRjBQUVd5UVFrT2h0YjFF?=
 =?utf-8?B?ZmFCQWFCVytpb2k4QVdMZmZiU0M5TXAvTEFHSFdVSlN0YWU0RXlRbW5GQ3Zy?=
 =?utf-8?B?UmlsUEhOV2FzM2VLbmNyeXI0QjVjTm5iQWlIQ1F1Z3BsUTZHRlZtMmkwenpI?=
 =?utf-8?B?eER6QVlaMnNacjd6dEEvM1JaL0RhS0tkSVczY3o4VU5UQ2ZEc0xyeWhoald3?=
 =?utf-8?B?LzdkTVRhbmNPc1hzcWZtQ21uQlZiSUg5cnpKWVlWN3hHbW13ZW5hOW96Nkp5?=
 =?utf-8?B?bFVMelFMN25lakMyRis1TUlZbzkySjhvY1lnTEY1K21LeitXUWdGcnRPV0Ew?=
 =?utf-8?B?dktUUit2NDRpdFlQREpuaXdnVWN0L0pjYXF2a3JEM2tCOWdNZkptK05JUXVR?=
 =?utf-8?B?QVh0a05CTnBsMHdxelRNQ3U4Umc2Q0R4RitweUVERlJaUTU5ZFE3R2JRR3VL?=
 =?utf-8?B?MUcxZjVnelNKYjZYUjIwZXlmYXh0SFl4TlNYSTE0Wjg3UWZSSmorM0FycFg2?=
 =?utf-8?B?N2dTSm40VTNYbW56VW9WK3Y3bU5scmIyNmNYa3lKdXZvVVJDV2RzRmVYYUZl?=
 =?utf-8?B?ZURreURXK3NSK2pZLzhhbTdsTjVrb052QkhOR1RUS1RHaDB4MkVVVEg1Rmsr?=
 =?utf-8?B?L3BCcW52RmUvZXQ2UkdXSG43Z05DOURLdkZISUZ5MnFJek9oaWVJU3pzNUhG?=
 =?utf-8?B?dkNLRDUyQlpKM3EyKytrMjA3M0JGRXV5Z215aXhFQ045cHg5bGM0T0pMSG12?=
 =?utf-8?B?VnQyUkhmZnVDYlROdng4MDJ5dEd6aDV6VlcyemdWZHdxZm9hdDk5Rm9zR0ZL?=
 =?utf-8?B?UW9lT2JQczhrYlBqWGFZVkFVbmROMmNZOFlVSWxwOER4WG5EekhsRURQbEhv?=
 =?utf-8?B?N3ZENXRudjd3RnBiZmw4NFlrQVFNYSs1YmV4ejN5Ris2dUNBUXIrZnpodHBO?=
 =?utf-8?B?ZEpxOElFakR1cjhJdVAxNUxlL2RuYXdBZmZ2QTB0NzVrdEpxaWFCT3RBWmRD?=
 =?utf-8?B?NVpwb1hNUUJsZXp4ZVhadDEyUFBSV3JpdzdmOGhyMXBIdjhyYlNqaytrSXNC?=
 =?utf-8?B?VG1hdHNmdUQ4clJKMU9XNGJ6dW5yb2ZkL3VwSUl5MUt1ekp5L0k4S25xU3c1?=
 =?utf-8?B?enFsR3hFbDdodDNUSFBZeVdhTXJ6SEoxc2RsR3JmekFUSWlrYlJ2cS9Fc2di?=
 =?utf-8?B?b24wYUpwOTBhQTg3VVZSeWFoV0VOck04dDZFdmZ4ZDNiTTAzSzVpRnh4SURH?=
 =?utf-8?B?NlF0c1ZrMzdSRTVhaitpTkpNTmJpZ3hzQjdXVDVldENnNlJmL1JVZTVuTFdJ?=
 =?utf-8?B?OUw2aHRCN3JyR25iZXJXcWVxUDhHeHBndk1kMGZrL3ZrZjRnbkJmaVU0ZEFK?=
 =?utf-8?Q?3wS7zJderJKcM4/7fl4MXld3d8J3j26SN4WEjAh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d5cb1a-ff82-4963-ea35-08d92026aa33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 09:14:28.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvCUZakl5RZqreGSL9QLTYsWED1/nr7Ga3BDgb2uRQytdb/vGb8akOUme/l8LsVQd3BKXb0cJwgW6Zbb/5saaynmfmEwpt8rXPhTHOpwsQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.21.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

26.05.2021 03:24, John Snow wrote:
> We are specifying >= pylint 2.8.x for several reasons:
> 
> 1. For setup.cfg support, added in pylint 2.5.x
> 2. To specify a version that has incompatibly dropped
>     bad-whitespace checks (2.6.x)
> 3. 2.7.x fixes "unsubscriptable" warnings in Python 3.9
> 4. 2.8.x adds a new, incompatible 'consider-using-with'
>     warning that must be disabled in some cases.
>     These pragmas cause warnings themselves in 2.7.x.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Not sure how to review this one, numbers looks like numbers, hashes looks like hashes, so it's OK :)

I've tried to regenerate Pipfile.lock from venv, and I see that new generated Pipfile.lock has same hashes..

Still, new generated Pipfile.lock has some additional entries: appdirs, distlib, filelock, importlib-resources, packaging, pluggy, py, pyparsing, six, tox, virtualenv.. Not sure is it OK.

Another differencies are:

for importlib-metadata:

  "markers": "python_version < '3.8'"   ->   "markers": "python_version < '3.8' and python_version < '3.8'"

(looks like a bug in pipenv, isn't it)

for zipp:
   
  "markers": "python_version >= '3.6'"  ->   "markers": "python_version < '3.10'"


The thing I hope is: we will not have commits like this one often..


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

