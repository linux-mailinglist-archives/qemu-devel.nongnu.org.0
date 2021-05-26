Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C526391202
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 10:09:43 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llobm-0007bL-0L
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 04:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lloau-0006nn-Dv; Wed, 26 May 2021 04:08:48 -0400
Received: from mail-eopbgr50112.outbound.protection.outlook.com
 ([40.107.5.112]:33490 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lloao-0001ur-EA; Wed, 26 May 2021 04:08:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8fISa/Ax608As/de79L0h0y1IUt7ELebb+f6Fwd115QY8h8eYu9iVQ1wxGkwEa5nd67bhckwEeNTyijLzV/pp+WG1eqaOWbmmDtCP1h5eciAShWOKlTfmd13b2Ukajzagg3wfYgy8nSrXC6Q6lxbe2Fw4XjZLUPMq6yMfoMr3xWsHl02qq47x/VlTTLCERZOrEZTKXf4v0tpqgm8hh9rc7hII+vcdfq0NIfFY7WftCL9D8vsBlvVjFCLVYi35Jwy8MI4QFUOJ/i/0OB0tqALsWzYB+xUB3AKd4MTIzWJ8jNdbgEsoR4nV1quIAqEI/rxXxYlp0zhByUWIonRIcOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSuwrPDLu9BoHd7Ezj5/hJULYTbjV/lRs1A6WpZQb6c=;
 b=NaTpU6ttPGlamrXTH7sJLeO4Od9Bqam8N7KD5vxa7qKeTiBKhQDROhF9eSHG3BxlqBUMEn/xd3/lL3mPFUm5qLukAalB2EoenZCO5rNF/a7kZINgZTXcGuFPp6dnZ2OVQIAPdMqvZORonW3znFhDxWbiPhqI1pr25R5jb6NihZKuoGLkgO65HD50TBrzMmkn2qs+MaCO8VSCbtDJXr+R0Mwony7b0DsK0SGDFMbE42nsXTQdZ9nnp1uV6H09S0tnQBRPKQPZujM6JiilkPc9nyhUU4y9j0b55JnrCq1y7/f7v5hs8lqz5xUHH3H3sWnQITEY2TVLTd0MbkomP+mrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSuwrPDLu9BoHd7Ezj5/hJULYTbjV/lRs1A6WpZQb6c=;
 b=hVubyT4c9H7csf4jmmnVLoJl7MvrkTvohwbyYfSzkzVCSCe0d8njgTb2NqBsddK/dRvHZ76gDx59tpL8JjFItSIjURS0rK7d/XzZZlqPIW7m8HmYIOh70am4Kx8ozD83EGFgL6IETtEizRHwkGTIoxC3qboroipvxpYeohqBFgg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 08:08:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 08:08:37 +0000
Subject: Re: [PATCH v7 09/31] python: create qemu packages
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
 <20210526002454.124728-10-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fc532097-c45a-2f27-668b-fbccb79f8e51@virtuozzo.com>
Date: Wed, 26 May 2021 11:08:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526002454.124728-10-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Wed, 26 May 2021 08:08:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f379edf-26de-40cc-045d-08d9201d76f8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951CD68E384BFE885790BC0C1249@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z8BlFmWjGUk66dudnArrSdpr9v5q0hBoga8FZ2YHv2QoIh9K7xXyrW1NMU1ETW/rsgIoYLBlgbyHnZrkni6JWEF1wpBIKzfvtr8vOKRK0X++bqjMCoUJ2Y4KG73Pw+h1JjBM+C73vqSrPlFnammB28hBkqCFZa632Ld2dKOviFDIF/n0a/hrFBa9WG/1Q3CQnJ0PGC1wxnpgPnCGW0/KzOQ6AeCqqwoa1yAVlGGuY0wTMy2U7QblqK0YK6dTBNRCbtXSj+peVr/81vlSbpcAXDEtm2H9bYa/X07raaQmtMl4MC90SLceCWhdmJidT+VS/6Fb1g8pwkWAQ7N1eb1H6108fCTjxyAmPM4zfYRWxKlE/v0ZSseqh17ttpweqc3ACRTYPCJr531MwYRX4JcFm95zwUseuucIi4edWEOepvcqFDv8r279Wgg4kfWq5U2jekFe6uu9t+fp5kVSSDSR6dVh8HaSNiSsatNzxRhY0h2BD5Lst23h3147QiDefWv62hwdtd96e1lYtGtkgpR0rsHjWhFGFR+gLj0FqKWaDamIqYMVmWVsyX0dOKEpn29iJ6CECVCD70I//eGf5lqlhtMNC/M6JvKnvwrJEnYn3Av+6BZd6YN8ez6ZPKz6Mbv/TlmxRt5P+4+SenLTr76uIhgZ9mx3n0PFnh90vFmR+4nRaIKjOiN90WkKfr2Csh0jR108kOxmUL6Zly4WfF0KwHmMhINi4zeCyrG1BaQ29VM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39840400004)(366004)(5660300002)(38350700002)(6486002)(316002)(66476007)(52116002)(31696002)(8936002)(38100700002)(66946007)(2906002)(7416002)(66556008)(26005)(4326008)(83380400001)(54906003)(8676002)(86362001)(36756003)(4744005)(478600001)(31686004)(16576012)(16526019)(2616005)(186003)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUY1T2RiUGxUeW9rOEJ5MVpNYzkvcEltQ3QrUktnL1ZSQWxPS2h2OC9Tblli?=
 =?utf-8?B?ek1DY3oxV1NoR2lMeVZCZWM3ZmhvKzFmb1Q5aEVSQS9PZzVjektEdUFCKy9w?=
 =?utf-8?B?WURTTmNhMll6M0dya0Fsa0szNlh2RVFYQnV3Q1ZId3FGTk94QllKTjBxZm45?=
 =?utf-8?B?WW5mY25EZ0puOFRhR3lzQkNmWTh3cFltV0VrdGc1SThRZU83bXBveFZHdEpP?=
 =?utf-8?B?Z2R5V1BaYlpVZERpSThOV29RdFQ3dmVqTm95WEF2K3cvbVBEMFhVdjFLeWIv?=
 =?utf-8?B?UTV6NDBwS3k5Ykc0djJ5MHVLeGtYcFlEMEtOdEQ4S2Q2UDhrZjRzdDZxSHVJ?=
 =?utf-8?B?ZVdKWDdMVDVjTGhLYnVwU0p1ZkMvODZyNlJKbmw2MzJiR2t1d2dEdWlVMnRR?=
 =?utf-8?B?dU1PVjc3UklxbDFIKzZiQTgzQ3JsNXc0bWs1RDFhVkRkN3VnZDNhVDlueVl2?=
 =?utf-8?B?UnlaOE55NUJCUHd1dEJrckpnL3l2aHp4Nlp5bFB4Ui9GSys3WXpzY3JtcEhk?=
 =?utf-8?B?NXE3cjJZMC84UGFMa2g0bXlLS3FRVHpvM0ZQa3RLT25JK0xLTnJyOUZqalUz?=
 =?utf-8?B?ZzZsYzJmd0NBd0VZT0FuT2hVVTVTYmhDcFczZG9TRW1lWUZBeDE4MThYNVA4?=
 =?utf-8?B?cnE5UXRRMXJPUTVMK2NzWHRUSzJlb3loNVRiYmFNcGNZbW1adEZnOWRJL0Ns?=
 =?utf-8?B?OUxwWi9YRDNFb01teHA2azUzb1k5ZnRSWmkyTDU2eE81aG1ib2Nua3pCQmda?=
 =?utf-8?B?REhIVjFjSzFaZlYrZG1aeEtDdlpIaXZySElWZzJVbWE5bkpkUXJ2Qzd2WE41?=
 =?utf-8?B?aC9USHNuc09obVRpT0lrdTFzdk1SWHJwMkZtTFQzdWRGYTZpbnQyYVR5Mnpm?=
 =?utf-8?B?akJ6QWxkRVBidlF6YWczMVpudWtZd1dwVXdFV29sNWlCc1VFcnFhM2hqc2Iw?=
 =?utf-8?B?OEloejBSQk9tTmppaUY2SThpMlYvNHlxQ1NxdWtFQUE3Tk8wSmwxUzkrTXB5?=
 =?utf-8?B?VkdSeEtPRzdYYm5NZFlqaDM1cC93YnRyQmQwUGRlbWlZdVl1bDViSVMxVUg3?=
 =?utf-8?B?WHNGUWYzN1FMRFlTeVpmdTBYRjdNeXVZdzhqNTBWS0RzR2xpdlBjUjRhMzF5?=
 =?utf-8?B?OWI3RkpjOVpLMjFTNGZCVGQ0dkprY1VMcXBJeUluU1ZnUVV1bDZFcWNHcGxt?=
 =?utf-8?B?MEJ4eTJXdWxvcm9weHNXSDdzME41ZnRxTzFxWG1FL3o3Vkg2YVQzM3dEdTU5?=
 =?utf-8?B?Yk9hSlpMVUZWVmxGelQyVGkwM2VPSGhEaEFUeXhwTzlDZVAzZnd1SGFkbWdn?=
 =?utf-8?B?VWZ6alBkYi9Zb0h4YVlPV0ZqNFMvMFA0cUJsZUkyb1dFWkUrUmJUZXBJRUpO?=
 =?utf-8?B?YlhRdkk5akFmdHhPNFZ3d2d2cCtaVmFxRGZUdnluMXBMK2lpKzd4R0RLVWdu?=
 =?utf-8?B?SEsyUXhYOHcrMSsxdCtYZjR0aGtabWorSTVwRXVtV0NsVlZtRllxMVpsL283?=
 =?utf-8?B?NmFvRGNGamthT3FrRlp4bGNxZ0dyVWRhL3drWEM4emNicnRPanBwVW9DRFlv?=
 =?utf-8?B?cGR5YmJYVWR5TmhYSUFyWXRWa3JIU0FmU3RtSDBDeS8zTnFFK0ZubGFiZjcw?=
 =?utf-8?B?LzJ6aG5mYmd0UmlnZUs1ZE1iWkNjWWNvS0dpZWs1dDNYNWVjTDMzQ2dDRHpT?=
 =?utf-8?B?OUJ2K2dNTExuQStJY2tveEE4TlJyc2VmTElZZGEwYVJNbGFHUkpmenAvWlRs?=
 =?utf-8?Q?Y/1x5/sGyphzPB4DGI9cxuBZ2AP2zqa655zwUkF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f379edf-26de-40cc-045d-08d9201d76f8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 08:08:37.6023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eeG5C23fvkYHOaBSWNcSQi3hVFVUmB6mHTYFVy/slyTiI4dHEwU7H9pZpnK972+cTSw+4MhTEpepbB7043OR+HQz11peBlNq+0hUPQLZQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.5.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
> move python/qemu/*.py to python/qemu/[machine, qmp, utils]/*.py and
> update import directives across the tree.
> 
> This is done to create a PEP420 namespace package, in which we may
> create subpackages. To do this, the namespace directory ("qemu") should
> not have any modules in it. Those files will go into new 'machine',
> 'qmp' and 'utils' subpackages instead.
> 
> Implement machine/__init__.py making the top-level classes and functions
> from its various modules available directly inside the package. Change
> qmp.py to qmp/__init__.py similarly, such that all of the useful QMP
> library classes are available directly from "qemu.qmp" instead of
> "qemu.qmp.qmp".
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

