Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F2476F37
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:53:46 +0100 (CET)
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoOP-0000Ix-9t
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:53:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoKQ-0004rg-Fj; Thu, 16 Dec 2021 05:49:38 -0500
Received: from mail-eopbgr140112.outbound.protection.outlook.com
 ([40.107.14.112]:12100 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoKO-0003eM-Nw; Thu, 16 Dec 2021 05:49:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr/webpIBR8ic8TDIk4i9nsnEQdxOmhXwyBlH3LlRm+re2dC9chVQ+fXUWOUzOlYu3389cS7sTfKDIDbGURoAgA4aRJvQ6JVPVEP4GYLcGqabmR0JIBtebSYtJIbdAHBIWpcO9cRkGzgvAT8/v3q2y54MsaywCLukPz7iQRH735700j6ijorG9/QHLYCuxES4P9+Dv4nSCCqpEpp2vJjwkIuB/hQOpXDsIJitvz6eBHHDDaXX+M9+QRyiCFzAsmN/5GoPuKwEp7UFC7R+qMBVqyd6V6RvMAI9cCfwjRCqJghtczQkJbWBAv5GEj2KRj24iVmPrQESLiaQg9di5jcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Abhf0qxDuL51ZUQTmTL9x050UpnoxJkTleM8E00d3Bk=;
 b=HwIbOsr1ZtqxN3THDRpyN8+npC10nU8QFKMUI/khLQnnBISNLZ7ElvXKAGgZ/FeEOLADVzwOpsLYyqAjG3movRe9DXCCZOmUGWPbCFilxg4IelCp0lZ6iQv7iOzoHRF151tmHK7gCApQZ36w17lhTJYO7JOAHs9V5WUVO94SihaRG22v9dNbLK7sNQ10lSRSjRpiJ/rY1jduxTSU/n5u1IvgVDRzki5MZLlab3IEDxBprqaeF6Om5JaVbC4UXAcHjwevxJVacvB2s6PoTGrJPWFv5/jbDk9gsPnjj0N++ciHanruy4G4NDzwItlamaPHHnPJkheHQZXRQOal4SlNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Abhf0qxDuL51ZUQTmTL9x050UpnoxJkTleM8E00d3Bk=;
 b=Fny3Jev1IAQMBR0Zqxlwrj8ttSNkoPoZeUGHSEmc0K5aIjYGRL61Q3ja63XozKqobW/poSx8Fx9ehcemtG51CB+EZ8u9aj+hJ2WBUKLOzm+OHYJMcESGIGof3ZB5g4slffnrDocaLceL/jUqkVm215wh6s9Wq08UcwZ9kzizINQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6404.eurprd08.prod.outlook.com (2603:10a6:20b:362::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 16 Dec
 2021 10:49:32 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:49:32 +0000
Message-ID: <5b00424e-980a-4a04-91a8-cf41048986c5@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:49:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/25] python: move qmp-shell under the AQMP package
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
 <20211215193939.3768033-12-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-12-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR06CA0096.eurprd06.prod.outlook.com (2603:10a6:20b:465::25) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:49:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb0da87-0535-4c97-d876-08d9c081bdce
X-MS-TrafficTypeDiagnostic: AM8PR08MB6404:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB640443F077EA3F5B73704ED0C1779@AM8PR08MB6404.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l2vfXzOzlWqWHTsLm+X6KWgO1fu3E+w0n+deS6sDanoeMGuRQkpZWpM4+D/5ib31XlZNcD+o+Uv6JsmKq86R9A2d9wSzCsH1flKWkkin3BJ/wNNyZq3euhgFyeIVLJux+D17iZfKfkoZKR0RjY9ucAXZuDG8a6w/gT4Vmf+9BPS6jx1AS+9VHvfQsQNyRlPdHHdj1v3G7rNsc+Q42MlawvUj6TTTV35ExNqwP02VTIEqTd6hIPQx/puP9etdBoYKMQn28DmIQx1928MAfog4a5LhshFLUbFYNyFr+Z/jY/iJe3no9t5KgQBNv+VGyRr3ofhiwMB2ucohpOAUPEyWTwPrSywTFOJdU3/PfTTdyC0Lxo1AZiF2vB+dR061oRRBBkd/8g/TuHMhO01JNCXrKrJNmIM+nrGpblYnVN+CMfEtXZYGHkP43BACYCcUg7DNo72mq82ApLqwRbeXtPAFQqqIY2AGbSb9sZGQzxDcBHwWK/lx8xD6Iqi+/rjsnAl4FmDdD0NagdMnbnTbygDvJGPgTb5j/moB4EwUgXf0Hehy8OBZGuHJvJP+8o5ZUy8V9J5MD5jFNXqYY9zM7GePGsobhkBVko8YW0BJE2vKfYphF4CRycLXl8xnGti7Dbv/ssV4gmnTBvUK5UctIPIx/92ocfhcDp/E7anTE2ZARSDBDqWwWCEbx3xPww+n+sor+3wNWmJOEBItbqJmBVEu4ORP/FI9GNmW/dpp8ehDWGiI2NERmGyUFe36f7/FtQWs4svghBNDKfr27qluaRCIPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38350700002)(508600001)(31696002)(8936002)(4326008)(16576012)(558084003)(54906003)(86362001)(36756003)(52116002)(26005)(31686004)(66476007)(956004)(2616005)(316002)(66556008)(66946007)(2906002)(6486002)(186003)(38100700002)(7416002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFJKZ0ZqaTQ2MHdET3VxU01LS1U4UXBlQ2VmS0svUWRoaDk3Vzd4ckdSdmFV?=
 =?utf-8?B?ajlOREh0WjFCT21BdVU3RExpek9VS0V3bkhwSjYyWjhpempUOGtGRVZPYmpl?=
 =?utf-8?B?QnVkbG8wNUxYVE9ZYjZsUGk5eDlFRm1sRzc3WTJNNFpkWEVFeGFCZis4YTJ3?=
 =?utf-8?B?U0RiemlTOVVYalNuU2w5WXM4b2gzdE8vUURKOThWL3MrYzgwSnJ1aWNIeWps?=
 =?utf-8?B?R29HRHNBRWFJT2krMW42Q2pBcGpWUmNOamwrakVNQ2lCSlZNbk9rR0xqVFIx?=
 =?utf-8?B?bGc0bDBhVzExRkkyK3NLNkI3OVBOMzBodTZxNzQwaWpqaFhRd1BHRk9BaVM0?=
 =?utf-8?B?MFRoaFF5bGxINENTU2gyUXZaMW42ZWQzSFBjaXgzRXF5eFdNK1J3MmlVQzlK?=
 =?utf-8?B?M3BWQzErd2pMUnpqaUlVWG15S3IrTWp2a3FLemxUY1JSZjdKTnc3M2ZIemtL?=
 =?utf-8?B?RGt2UkEweFVsaitqdTMxVS80VEEwRzlwb2IyanJEQnNOTFBzRFJPSWdJMTdC?=
 =?utf-8?B?cnJXaHhRSVNzSUdCSWpCVnJPUHFqemJOcng1d2Y1Rm9PbVRFa1AxY29DK0tv?=
 =?utf-8?B?akpkZ3ZES2sxQ1Z3czRBNUNZUFBYa3hPcWoxSG9vZERrdyttTWtiNGhmbmc3?=
 =?utf-8?B?SnN1TDkxa0NBWG9sUlR1cmkySGNwV1FBbnpSK01FMkFQeUxucERJUW1OSUEw?=
 =?utf-8?B?M3A3U3djSkpqSHpPT2FMd1dBN2VIRUNud3N3bTN6ZTE4OGdiQXR5cWdNL2dn?=
 =?utf-8?B?Q2M0ZjBuRS81RjArRnVjZXJoYkFpc3JmNzJZaE5SSHdoZ2lqUGl1Z001M2dz?=
 =?utf-8?B?cUxzeS9lem5WaGpiZlhPZFZ0Ky8rbkJQZGJWSnRYVXZrb1FPOXlIbkhFNlNv?=
 =?utf-8?B?UG85Z3ZKNWFuR2JjRHFnRkI3NUVSVm1jUmpUdGlBVjNjUkdGVGFlYlZ6UFA4?=
 =?utf-8?B?TVpUQmFKT3dpRGVhdVpkcVBwN2lqTjE5QnhvWjJpcXNVemgycTFncG9zRGhm?=
 =?utf-8?B?UG9RTHpUNFZZMktjbkpPdE0ySWdhbmQ2WUswK0ZOcWxiSG1vSCt2L2V5Z0tU?=
 =?utf-8?B?OVpkekltOFFDMEFJdmJNYUdKeXFWTkhRdmdNQ1lmekNZb295TmJWeEw2aHdo?=
 =?utf-8?B?N1d1eVY0OFRYeXoyaHBuWjhHN3IrNGlOTEdsYjRzVTNxYVAwQVlMak05NFRO?=
 =?utf-8?B?Y0ZySGFYVmdDUzhJK1BoQTVDQ3R5aU1nQU9vQWR1MXVybDVFTTl3cG90Tmx2?=
 =?utf-8?B?ZkV6K0VmMEFPaXE3VUNqVFJxb0VkYnUxQjdrWVQweGF6ZlZzVXpybFFnb1Rr?=
 =?utf-8?B?OXFDNmRJNXFiTm1CMGR5Z0tsMzk4M1JhLzhEckN6T2NXMUNGdERIZXNLTVlX?=
 =?utf-8?B?cVhMVXVUVUp2Kzk5Z2Q1bEVLRHVxODVCSTgxWDZlZTBsajdPR1Qva0ZwdU0y?=
 =?utf-8?B?YU1pSjVKdm9wU3lDcG1OUUVqaFQxNDBWYnMzQVBlQWZQVmZGY3NhOHU3THFE?=
 =?utf-8?B?Y3k4RkJqZ25lUmxhdVp3ZWhiUUhwT1pqemtTdEhYZndTNHVkclBINVFiSHhB?=
 =?utf-8?B?b1lFOVdpS2t4WVZEZnJ6bitRdG5rdFlpYU83SjBxYVlPcG05aysrZS96TitM?=
 =?utf-8?B?MXdsTmlYRzlVWkxPWEhLMUxaVUs1bkY3WGdaTmtDeW01ZUpZSG0vR284UEVK?=
 =?utf-8?B?RGZxZ0xYbktwRzJiOU9aU09XYkZHNW5CM1prM1U5Nk5mWnRvRGlLY3QxV2NV?=
 =?utf-8?B?OVBHSDFkdjhjdHU2eHlhNGl6bDNiUEJkWldMenRrS1BDUmRudEVmUURVZk52?=
 =?utf-8?B?U3hWelZIWEJENys1T2xVeStoa1Q1K3V6U0tnN1pDbFJpTytMM29VckVxRDVJ?=
 =?utf-8?B?MVhxenZ5TmJJWjJyMlBaZjI4dStZRnFyWUx1d3BSMEtqN2VQd2c1RzlxaDJa?=
 =?utf-8?B?TWNGc1QxYXB1clJmNnp6U2h5NVFXUHdpSkF0aEFsVUJIZmxIMjhTVGxkeTF2?=
 =?utf-8?B?cFY4VUV0ajFNbS81NFFweEViSVZabVlaYTdTMFI5bzU2NzBtckJPbkR2VlpP?=
 =?utf-8?B?alZXOW92QjZsZ3RIS1dBRnFYSUl0UUNpUThFZ3JVbGY1WFRCTlhYMGxBRXdE?=
 =?utf-8?B?bzlTbHBmWGtsVVVzQlNUd3RRRm9hV0RUZ2haSGNjVER3V1NXRWZSSlVKSHlC?=
 =?utf-8?B?Y0tqZFd5eS9hdU01M091eHR4NDVIMlgrV25scFJpeXIrZ2hGNWNhZ2xaY0Jp?=
 =?utf-8?Q?ZD6AeNXEXi8JzxZnvia0sIO7t2WbqS2n/EHSLWTVO8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb0da87-0535-4c97-d876-08d9c081bdce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:49:31.9371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INPAF2M2KKM0F8zev2PRDFg1tCs8pdjWU2wDL5ValMwaCXVd7GdAJEsGsiU/8i0QXGuWz5caiVcaCwkx7shuwQrVorE24hSKFqpmu59txao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6404
Received-SPF: pass client-ip=40.107.14.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

