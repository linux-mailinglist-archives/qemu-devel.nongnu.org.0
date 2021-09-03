Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845013FFF83
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:03:33 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7uu-0001j6-5W
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM7jL-0004af-8B; Fri, 03 Sep 2021 07:51:35 -0400
Received: from mail-eopbgr70093.outbound.protection.outlook.com
 ([40.107.7.93]:64644 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM7jH-0007G0-IM; Fri, 03 Sep 2021 07:51:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXnJssqwu4AMFBOqVy3Ixu9K+k3vNzOye6iyWX5I6U6Jm1sM3KUMiQcgpdf9IS3M9wZCisBQwEKaWl1wDmjV5U/Tom+set5+1h3+Nk1P6QvoM78ADiEq2hLZkONTBo6B0ea/vFP65HtdyfEPqZo2Hk4hiIuj3VzsarISck4Fc9iiYB5SoWsgkF8KYpCcmSROd2w7L0z8mgZIzAzvGePMIwY5yshAdzjY+wSWEz8rTzhDNhCckSm7CMSzonwXy1qWf93A/8YIR0DO0AIA9F9JbNo2ZAp18+Aq/YmsmLREguAyOsL6wt0+sUTmGGKjlrwIQkRJCRdWy8V2QKOcmVLu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=AfmSqVwpNHKFWeVYOvLeUDajqAKI6sjTztAdEjQN+Nk=;
 b=aTcl1W+MiAfT5MYp8yB/IPxNM6fuAaLRHB9GmSnm+jkCQZb/6MC7Cfl6X2U92ZAkJg5W2keXrveXbVZLKuEUsa8DImTtsZYmMld/nZWfGTmlvDO9+0SUOcIi62vcjhdBLcgg2PrKFGRtihrAUv8QHUgMeh8J/3b9p9D6CJ6ALduy6yazM2V9lwgEo7ATOYRH2ah4o8QJQjc/8aDt7fAKfcwuO7SZQ1b34bvMEuBhg1LJIvQhMeJNViC1hIzL4eKMCqd+aqlWcpBbS5UwkKNhFgGh9jbyNhxqlmB1yVFfmnSaPmc1SGwpMPS+hnW1MZgI5fsem8CtzL58yWou1LVwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfmSqVwpNHKFWeVYOvLeUDajqAKI6sjTztAdEjQN+Nk=;
 b=qtPjBzLKfX5xNhART+rtN7qxgkxwUgPva/7rMwq7FV7YA1NwAZJHN48eUl0HayAjJGxBZxLQfcEaeflYTBwdOLcKt3BXerOV+Eef7kn+w7jOLk5sVwKLnqQH2uaX7uZbvkBMejI977XWP7W+slX+e1PaARqGaji9y2BZSlsQsJs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 11:51:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 11:51:24 +0000
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com> <YTIEDKAgWGRt/I6y@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <04ba0442-08ca-bf88-3f04-0be00c11bd1b@virtuozzo.com>
Date: Fri, 3 Sep 2021 14:51:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTIEDKAgWGRt/I6y@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0113.eurprd05.prod.outlook.com
 (2603:10a6:207:2::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM3PR05CA0113.eurprd05.prod.outlook.com (2603:10a6:207:2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 11:51:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2f5e555-6391-4db6-8eb5-08d96ed127c2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-Microsoft-Antispam-PRVS: <AS8PR08MB68058376A303D4813E541943C1CF9@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Lqk370E5EAQHs7bMa8AUeMmNX4I2Tx6D5TvbGBKi+P5Blu/oq8QUvnH0dpUvhlst/OOxyFzuhQpYNFWmuL2J5DBzn9dPiSa9Xv3lXZlT9i+zJRPmMVC0F2Bc279IiJfI9Vkq2gvhSjpYJgW4cdVz4H+6ZgI1MdVGvE8mZ4N3+QArn1NTbgzdwxGFAn3Dn5iWWd3RNyzattXc7F90C7tIe8LAo/2KzIvbVloj4k02pX5E9951OpbKbychpfMjblCfvSF34QZf7lIKYs38A5Yo7zIl8stkOaiTwTd8c2FpsDGyBp84Snb8PGk6RbReVib/3yl23lt4LDSqCKtQDT9JZd68DZ8m971lIPjoed3BDCcOZlgs1hJxwdnf7aYBvoG9L42R9YTT9QCzllOODjfRCt5QNTUz/uPYIXtjqHlk99SH6EBLJkCGcIZtbdrKDYHPbiDbzYsacfuOcF++BQyjofIpj5h2zNOqV0DzMMEn1Xif766MPzXFGNcr7KZSBYutFdgSnudttuzxrJV7Jc1Qxg8Z0vL7o/HQuIEf+W7ES7OoYQk8IxTPdmy5RCEmowwP7NTq+4zTlQHfiSY4qRVwqEbyIfJILZGNCqoNNVvwU027r9o4B6psqWnD98FMffaY11OOq0fmlTYkTWuZVvAEMY0Mbdj+5SuqJHk9iuuxsj3pFo1RagOmADxoHd/r5yiCsSD32yuA8WOBmQW88mr1uUByb+c3DnzBfkHO4cSlho0SKVy/tMrjzGPnFR1Iw2CNFrQgbAN657bPoHezbiRWjjjelTxdKshOXlaQBOPRPetwJLxTjyvFUNFF2OCye9Key2QlZzhBDXJZDsZp5bFBu78iP9Rxgtz6IfT/+10V8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39840400004)(346002)(396003)(366004)(36756003)(26005)(8676002)(966005)(8936002)(38350700002)(38100700002)(110136005)(478600001)(83380400001)(54906003)(186003)(66946007)(16576012)(52116002)(66556008)(2616005)(66476007)(2906002)(956004)(6486002)(5660300002)(316002)(31686004)(86362001)(7406005)(4326008)(31696002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdveU1wbEx1eWkyWG9aQ1pob25tVlUzVURRQmFRNnJQdVJLS21aR0NTdjQ5?=
 =?utf-8?B?RmJXQ1FNVWFkL3IyOUZSdWM2b2FRTmx2VXhndTBHSUtvVEluOFdtejVWSEJ3?=
 =?utf-8?B?VnNJT0x6NVBVck15bmpmL3kvTXhrRXFUbldJQmJMckFQOXUrSEFaaElXZHN6?=
 =?utf-8?B?VkoxN29lOUFRa0hRM2NIdldYc1Ayd3QyTFlSKytaenNhMFNwMEx2WWlRVTE4?=
 =?utf-8?B?VkE1MVd5WmRiVDZkWUtiY2YyRE1QcU13U2pLZHNWclZEcEh6dXNJUXpwdEJr?=
 =?utf-8?B?bEU2akNwc3hhSm51RFVDZHZrMkhoZXRnT2NMcGc2RHhtWTBVTStnY2w4S05L?=
 =?utf-8?B?cTlkVEhoWGxIOFRzQVQ3eS84UCtBRmVGZlZNRThCSGJXcU9iYTNvcHA5bGxx?=
 =?utf-8?B?TlAzNnNldW1EK2ZSYmFQb0FnMUh5eXo4U3htS3d1SldUL0Y3cEwxZ3pwREho?=
 =?utf-8?B?clVSK3RMYzlBVzNvUWxscmJZQ0pnT0FEdzUrVFdrNENQWUtacElpTDFXSVcx?=
 =?utf-8?B?Nm1rQU0xMXhiblRUVXpJRGMwNVkxaTcwRk5nWGtVaG5Hby9qSlBQL3FyVDIz?=
 =?utf-8?B?ZVJ2UC9wUTZtcHJ1eUNHMnJ2U0xEZHpveTVkaDdNeFoydFdyWCtxUGc1a3pC?=
 =?utf-8?B?NDM5d1h6K1ZzSnpyNkxQemdsRE43Z3UvUGFwcE1DUWFtUkNDTUlMc09OZnNs?=
 =?utf-8?B?LzhIdFMwZzRNYmhSdVNQSWRRUlV1UUZXZGw0TU9IR2FtM0tMdldzaDk3K2hy?=
 =?utf-8?B?TDM0OUFHRzJnM05QUkV5QVEwMjF5OWdnYnBvSmphM0lvRGJmcnBzc2dMQ2xS?=
 =?utf-8?B?R1FZWFFxbVRxbFRCaFFYWEZ3T0ttY1J1WW9jbHFjTjNvWkxCQy9KRFJTT2gz?=
 =?utf-8?B?WXNLRUQ4V0tiUGVIUXN2TFVRTWxFYWk3WFlZZ3dJbU5VZ2l4dHk1NFBxVFRO?=
 =?utf-8?B?aUV6M1lFRnI3TUMyZ2hTZkhOTUFNSjRYbWRRSDdENDBqcmNobmI1aHF5MXQ3?=
 =?utf-8?B?Q0ErUWVkSHNKaGJ0Q2JrRkJqa2YzMzJLYmJxdGloRWZSYi93V2JBdkRuakVL?=
 =?utf-8?B?OEJ2MXV2UTY4TU51WU0wT3pHMTM0QWdWUkdLdHQraWtqenF6aGVUUTlJSWhp?=
 =?utf-8?B?Nm9XVUZpd2pWTTJETlFyQWZwRWlBVFRCRHE4Z2Nwd2N4dFdzZjJjemIrU1Qr?=
 =?utf-8?B?djQ0ME5Sb0VkSFJsdzhpaG1EU2prdjEyVkhZREg3VFljcm5hME9HMFc2YzZv?=
 =?utf-8?B?Wk1QQVM3N2s2bWNrWTlnNWNLYXNmaGRQRjQvNHE2WStLbHBEV1k3VlgvcllN?=
 =?utf-8?B?YlZzTmFDUHpyRlptWFY1SGEyV2ZPcW9taWFwclIweFpOTGN0akFESjRmNXcv?=
 =?utf-8?B?UUNrenhDNndUb2hSdFQ4KzhVdktEVGUvV1o0TlV6a3Q4Ynl6RGFuOEg2d0JU?=
 =?utf-8?B?MXY2ejdhZW5OeVZGcnpEbnk0V1VyVGVQbkVUUkhQL2VLbk8wMUdzWUwvVkhw?=
 =?utf-8?B?YlMyR2p3akpuOW1DZzNKelpIcFp0RXVPeElVWGNJZENIdllhcEVzWEE2SE1n?=
 =?utf-8?B?UGgwTVNTQUxPTE1GeGNRRmhka1FVZDU3a1lST3p5VU54dUIwRVdJQkdHQlh2?=
 =?utf-8?B?cUdLMmFJY1E1L0ZHTTZVLzVmdGREaWZUVWZ2VS9DMGJVS2VKSHJKRnRDbFRQ?=
 =?utf-8?B?eGZiZkFxSC9LZlZyN2pTZkVtc0pGUXlGd0ZBTTVFcndtYlZDWENhUzVlU0RF?=
 =?utf-8?Q?WJAunphVmdmJXZ+lZqhoIndyRPXu5Sbn2zDgOFU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f5e555-6391-4db6-8eb5-08d96ed127c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 11:51:24.5471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8dv0TBbmSJbHiEyHbaANIAGOoZfs2GVXl0NGYMKXYsH77zGEfl/8bTfUSbCbIdzuE/Y9dQ4fpEMIhbAMfTbjBDuSDMNfcFpkCtJTUhMu6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.7.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.09.2021 14:16, Daniel P. Berrangé wrote:
> On Fri, Sep 03, 2021 at 01:06:36PM +0200, Philippe Mathieu-Daudé wrote:
>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>> (Fedora 34 provides GLib 2.68.1) we get:
>>
>>    hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>    ...
>>
>> g_memdup() has been updated by g_memdup2() to fix eventual security
>> issues (size argument is 32-bit and could be truncated / wrapping).
>> GLib recommends to copy their static inline version of g_memdup2():
>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>> Our glib-compat.h provides a comment explaining how to deal with
>> these deprecated declarations (see commit e71e8cc0355
>> "glib: enforce the minimum required version and warn about old APIs").
>>
>> Following this comment suggestion, implement the g_memdup2_qemu()
>> wrapper to g_memdup2(), and use the safer equivalent inlined when
>> we are using pre-2.68 GLib.
>>
>> Reported-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   include/glib-compat.h | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/include/glib-compat.h b/include/glib-compat.h
>> index 9e95c888f54..6577d9ab393 100644
>> --- a/include/glib-compat.h
>> +++ b/include/glib-compat.h
>> @@ -68,6 +68,42 @@
>>    * without generating warnings.
>>    */
>>   
>> +/*
>> + * g_memdup2_qemu:
>> + * @mem: (nullable): the memory to copy.
>> + * @byte_size: the number of bytes to copy.
>> + *
>> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
>> + * from @mem. If @mem is %NULL it returns %NULL.
>> + *
>> + * This replaces g_memdup(), which was prone to integer overflows when
>> + * converting the argument from a #gsize to a #guint.
>> + *
>> + * This static inline version is a backport of the new public API from
>> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
>> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
>> + *
>> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
>> + *          or %NULL if @mem is %NULL.
>> + */
>> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
>> +{
>> +#if GLIB_CHECK_VERSION(2, 68, 0)
>> +    return g_memdup2(mem, byte_size);
>> +#else
>> +    gpointer new_mem;
>> +
>> +    if (mem && byte_size != 0) {
>> +        new_mem = g_malloc(byte_size);
>> +        memcpy(new_mem, mem, byte_size);
>> +    } else {
>> +        new_mem = NULL;
>> +    }
>> +
>> +    return new_mem;
>> +#endif
>> +}
> 
> Close, but you missed the final piece of the puzzle
> 
>     #define g_memdup2(a) g_memdup2_qemu(a)
> 
> 
> Such that in all following patches you can use the normal "g_memdup2"
> API. This means when we later update min glib, we just delete the
> compat code here, and the callers don't need updates.
> 

That was most probably already discussed, so sorry my question:

Why we can't just do

#if ! GLIB_CHECK_VERSION(2, 68, 0)
static inline gpointer g_memdup2(gconstpointer mem, gsize byte_size)
{
     gpointer new_mem;

     if (mem && byte_size != 0) {
         new_mem = g_malloc(byte_size);
         memcpy(new_mem, mem, byte_size);
     } else {
         new_mem = NULL;
     }

     return new_mem;
}
#endif

?


-- 
Best regards,
Vladimir

