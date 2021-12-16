Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD904477058
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:34:08 +0100 (CET)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxp1T-0000ci-Sr
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoyy-00052d-P7; Thu, 16 Dec 2021 06:31:32 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:53059 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoyx-0005R8-6z; Thu, 16 Dec 2021 06:31:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu/nVnNyK1ZUMerKxeXHgC9Kmcy7mnkIgg3F7dh9KI1oaIXZLo3Q8gAzJLi0K/vspjWLWIbwQT3kn5fB0EFX6ojerueqNGFPmJwO8FccXjYtZi9T/Hddjso2CE3PwBdW/MUbvzKbvXbDbWYeT6om1SqZPS1mkIr/HxBNclMoOpwaOtOftgmp+eX5bkKbdk47iQ+BevOsEL4iGO5ZRRojCXbMEceWOJeuXjutC1PkYw3ACFdPEfO2FmmoGkUSS98xKm67cLNmg72AuAzD5oUxHcIY0f1jqH3qZ4r3SIuECn7ojjhkveRw0T0JgX8vFAfuo+euhpwLpwMnajKJgvmTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fM97EytIjR3+4ZOv97/OFgIiDVPyrpBYuv8uAmhLqB8=;
 b=dSBonBdfRq2iFKjJ58gFCOH/U06KRngaFn5rDXHYk7ssWizniO/2KuOjUxo+NMyZGLcU/1NRLByRGdXkXqVscW5+Mo7fEWhR/oom8MWdCpaMk/fnkjDRlrrzJ/hx8tRz01ntykIJRDPuqeKjHIhg+uG79p7kglxjBe/RswS49Wh60yK0VpXmKJPko/ASyIH+4ICb6q421fwbO1PMNnnFbq9EzgGWXzGHEPUjrjWfL3FFxEEO6AiE46Rj0cTpnza435zctPBZD2XshDs+aRhlSabCIVg0zXEaKABZ+S19frzw6dSIccDmNtvabUm7/ZLlKLIwopQFehQfWZSf/oyNBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM97EytIjR3+4ZOv97/OFgIiDVPyrpBYuv8uAmhLqB8=;
 b=D0OINWak1sUON20Q3HrSoIfQ+zs4Qw3XCgbXkiw9dUAodi3wOmnuSzHTtckuCSjmgd+vgpjgwZSoNWjDQtX/eSXMuczjwczRqpZ1KS9NlkBC2qhbIAH7IWqioAa9pi9Eo8hIuWeY8YC+4ZuE265QORcc/a1VJ2q/yB5PmWo3Cro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6724.eurprd08.prod.outlook.com (2603:10a6:20b:30b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 11:31:28 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:31:28 +0000
Message-ID: <984df473-fbd6-a10c-74e0-223c905cbbfb@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:31:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 24/25] python: re-enable pylint duplicate-code warnings
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-25-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-25-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:31:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 031e3091-1af2-4673-414f-08d9c087999a
X-MS-TrafficTypeDiagnostic: AM9PR08MB6724:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB67240AAF33B43E9763CD25A5C1779@AM9PR08MB6724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVtkR9Td5mD0EAHomG+OS148UunholPneNZbOzd6p4zdFCBok942UrBHHA+PexR7cUgD2m6ciNBDv+ZXpnzYrRnuGwSnOmokc+5PO/g4s59nFjieSvNr2XexE2QRCd9POZL1Ps3UH9HZm5o2HOWKrXXqHkmmGzX/adeUc9yNWnjXiWSzZaK/i5ZmJQA+Zf7JkiauecescjGnEv7I1vlYyyST7WpfIXH4PB1Iw/bc+htSbrgvtRZqWvT4ZSeDdk0NxVNR0VfSXR6Fpky+SiyhiAhJcbAJvPNF1511he617t+MelUcj/jDKtZBytOQrPQ0/IlvUBWlNJKU6GM7PZHuBsVeJale6p4Ad09WEwwlOxBR5hQr6+tpDmRP+HakyBCmUfQ5//vXkEDvRMQC/lLIO/RIe+GZxy01apZkbJy7KWkFla5Pv6Eqo06Uxyfu4GlfaV+80sNnrCLEEsJeFDbwlFajovBM/frfrVLzIdMseJjm5n+MmMQX0KCCJhvD6bVv7dogoO18vS0Q3tHtsP4JMJnI1Ad/xqCCKb0kkdbXZSXrHVpw94Ao7cTW2Ytw2vfCHNtHfcQIye/6wQq3Q96Llx6a6NDZboi7yqe6FTJRgPMcdDN8a5uL07orIhZstdr/1QT5ikuhpYOvnaRGVfbeNQdVmHqdrbAKJCQa3sZoiVvkzT8Rw812RjX4mvDIXAD4IZAJ9MIBUTDhkvIurWIQ4DWbIWX6Ai4EpZJctMYIYT6TXa+LDILpsGLGEnR03eeFgRoDr3paambSRBNkxLOi/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(5660300002)(31686004)(316002)(7416002)(508600001)(8936002)(8676002)(16576012)(36756003)(2906002)(38350700002)(38100700002)(6486002)(4326008)(956004)(2616005)(186003)(31696002)(54906003)(66556008)(86362001)(558084003)(83380400001)(52116002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGk4Mmk1dkI5NlpXcFNHekNzK3ZhTkV0UEZCa1dSTHZqR3VpSE42R2JxSnB6?=
 =?utf-8?B?dnJYU0JIZ0ttVDVBY05hRlo4VVVkckJnYkFqeG9pZFVtL1Z5Y3IxYjdoUnlh?=
 =?utf-8?B?QWdsWkFFUVE4S05WL2Z2dU5kUWg3Qk5TNjA5eG1aaCtLUEFJcHhqVGRvTlZk?=
 =?utf-8?B?Q2RBdWZaZzc0T2NyZWVuakZpOGVCWUwzYXBoRVhHNGVqK0RQUitLVVNPVER4?=
 =?utf-8?B?RHd5S2dvbnVqWGxqT1FjVWc3WXhHMUErK3dNUGdicElONUlZWGludWlQeUhG?=
 =?utf-8?B?dFR6VmZLdmZlUTc3eXBzOVdLUzBrM0wzMmsvb2F4YkIwKzRNcnc5eStxWHpW?=
 =?utf-8?B?NWpFempTSWlSTmtCM2F2dGFuY1VSU0tZT1NZNTlYSWVianp6TlVJVUpaRVQ2?=
 =?utf-8?B?UzlYZlR1RGFvQ1BWNnNLVUpVSUF5N3Q0YnJIVllYMDBrQ1gyUXFkYmV0V0N0?=
 =?utf-8?B?eVVyUlBTN09UR1NKdXJIM1Q3SnJrRkFiR2doelIybXRvTjF3UzZjN3BRK2xM?=
 =?utf-8?B?VnU0ZStKSTRxdG5WeWdua1djWU9PRkt5RDlUNkIwNjVzT0k0YkVySDNhTlBq?=
 =?utf-8?B?SSt3NCtpNWZQYlV4aVBmUG85UjVpTWgyZURBTjhMTFkwSndDbmdPckd0aTUx?=
 =?utf-8?B?VFpGVTFaM2VvVmNpNWc0NERSTnFTVzB4VFdLaktYZUpYVG1PMjVzbDQ2V0JM?=
 =?utf-8?B?MC94UVV1aHh2MG1yQzdNcjBIaXFiMkd6T1NCaEhDZ3puM1pNQU5xaC9mRU4v?=
 =?utf-8?B?dDVUODB3eEZ3WnhtMmM0Rkt1TTAwWW9wcWhub2dQd2dGWmhMaE9uaFQ2eS84?=
 =?utf-8?B?YUh3MThMNzVHcTZtc2xFUUNtUldyRDltU3ROVkpoamwzcTRSN1hiNUQ2clpr?=
 =?utf-8?B?bmJYUllzeHBUWWVSMnJRWFp0eUhaMnIwNktZREN2OERXU3djVEJhc2JldThE?=
 =?utf-8?B?Mk91WlRmZzNyb0xwQko2WW5IQ21aNEk2SHZ4MkZpVVNxOVEyQkNwWGFuNDhy?=
 =?utf-8?B?cy82cnVPQmtXUVFic2Q0MHBaT2VCaFdnYXoxRFZZVHlXSmR0ZkRlOHdUTWYz?=
 =?utf-8?B?SGEvQVV3TDJwem5SdlFmWlhoWFg0Ti9GQkh2RHlmalJNYTZrMUp0czdPUVhE?=
 =?utf-8?B?dnArQjVTSlBnbXVwM3dabVJwSFFFWHZ4SEZjeEVleFBhNWVneGdYVTAybXVV?=
 =?utf-8?B?dzlRenpBZ2RNenhjRmpQbDdSN003clVYaEY4bUVKZGlhVGczcXhFZVNVVSsz?=
 =?utf-8?B?S0dUR2tKT2pHTlZITnl1dmJrbGJzYVpRWHBIOGdubVpGOEUvUFlUalZJWjVa?=
 =?utf-8?B?N2RaYVllaEpIRmZzYmkvN0FLZVlKSjFuUDl5T1BMcXJRazd0azBFUFl5dEli?=
 =?utf-8?B?cERnUnJCWURVaHZKcFFaenBmMGZuTG1OSTQ5QmovTktFQTN2MkM4ZXNBSUds?=
 =?utf-8?B?aGQrb3h4RDI1T0RjcWFFSlgvZGIzREpwSVhvemhOcnV5aVNtRFhoQm83Wkg2?=
 =?utf-8?B?aEFUSUFqQWhINTltUzc0UFRSMmo1SjVFTkwzOWVIaFZTdjZRRzFtdU1JaVlO?=
 =?utf-8?B?WWQ0MXZmczlOQnB1di8rYyt3Yy9UWFgyakxLSmQ0d2VsMndxejVaQkFPdjZL?=
 =?utf-8?B?MHROc0FVSTJYTXoweFBBUkl5cThlbVJ5SVB2d085T0ZxYm5jalhDQ3FNZXFn?=
 =?utf-8?B?RnlqZXdGRlZpVEY5SEljRTJuekZZeVpBaERRVzR4VS9Gdk8rVEV6Y2ZWWTV3?=
 =?utf-8?B?L2piUkVGazVPUHdHU0hWYnA0cnp5SUVoNXVpc0RKaUJqVGk4Z3djYjFvRG81?=
 =?utf-8?B?Wk4xdnVXMC9nbEx2cGFua1FjY2JWLzluN0hBTFN0bktXL2VISGRNZmYxdjdK?=
 =?utf-8?B?NEp2T3pYVzJpMVZvQnlYUmZzUDVaK2VFY2pmUUg0emhYbUJyV2cyT2hqWjRh?=
 =?utf-8?B?d25tbi9SUXN0M0RsT1hPMEU5dGRBai9NRml0YStGdmwxUWttVjBRYnkxaE1I?=
 =?utf-8?B?a251bU9WeW93aTBhU2p3Ri9UaUQ5TlcxN0p0eTNwWUEwRzlyTHdoanZ6bmY1?=
 =?utf-8?B?b1grQm9NUUNtWHFDNk5pYkM5VUE4TllpQUg2UWJOUkxNZ1dzM0Vmc3kwUHQy?=
 =?utf-8?B?cUNOenJIelByWk10YnBaU2ZnK2lSelJFR1YvS3hwUVNMcWV1VjhDWHRuZXND?=
 =?utf-8?B?VEVHVTJ4cDBPcHRkVlYxY3JheG5rSFc1clNzb3FjbTlxOUk2MS9FN3JOM0Fw?=
 =?utf-8?Q?9kL97zK83ddhBu8gB1N17jrkGPZ9hcguChPbDCTRiE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031e3091-1af2-4673-414f-08d9c087999a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:31:28.1220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtfu1nmxKs7OmZhc9llz9FxyM4XFvNJRhAIESIv3tZqRCD8zJnTtU06QpOpwYVhRS5aTaVw6OnprNn8dXpH6vVAbTjf70DAxJmi3Zt1foHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6724
Received-SPF: pass client-ip=40.107.4.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

15.12.2021 22:39, John Snow wrote:
> With the old library gone, there's nothing duplicated in the tree, so
> the warning suppression can be removed.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

