Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE4347394
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:25:42 +0100 (CET)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOyph-000672-DY
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOyol-0005hJ-FM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:24:43 -0400
Received: from mail-eopbgr140133.outbound.protection.outlook.com
 ([40.107.14.133]:14806 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOyof-0002rG-CO
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:24:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TL9yaozZaWb4I2J1kvt7xNABNP75qT9OYMnM+vWNgHA9G9reZg1Zl1tanF5cATQSfKFpu6yn8djbZSG9Pz3WxMpM0Lf43R9wzCup3saHChW0WvgoPKyxgzzKay9kX0F1gbMpy0ugoeJsq6Fucwc4sDKhzKTyPoHPcDbKkIP9NNqS4VDA43l8LJpfuRQhZMbtqnKfm/7XvWoUoXU2RJv62xvX/bU7u5JgRrzwYnNlNK8gzhMlSHT9Vrv4d5ix4zRiViiSVNKajxOFGRqgOz77ykdeBN5l41VI6NI+fWUw2mlQDPd8IBXfNjMWvczpcwTsBUI+7p7hF33lJlVO9X2iBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImaeD7K/vq0gpYVNlFlEeHAQ/EB9NjdZTpnaWolTBQ4=;
 b=XEtzz1LXOFF5eweqTkDO8zdJefZsBtMWIaZ+5VLqkeN+NpR/qAfGYDUEsLeq+HxgTzE8MZVPs+eIqFVtqTPnZt/2CObT1aOqZg2y5swFDuCTGOihr3kwqPcRVkb/o32gxezntiKxBQ3Ij7Pz0e4M94dN33UPNQtAXNxUz0WKxTSQbF6ou7neafBaZlPyHXy7NlTBfKWp3UWTW1UOj3NMI9WqAiXIARo3ZszTzFpGpLTCbETzJs2tQrq0xMLoA9jGy/JnAbe/UXA6qANbt3DHoiRFs6R5fKGrXT7RqoMRKLe7uRGw7JN+JG6lDTjGvHYRXFacWZkLwfE/cRzxyjVkcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImaeD7K/vq0gpYVNlFlEeHAQ/EB9NjdZTpnaWolTBQ4=;
 b=jOiTOm/4izfGqsPARpe9/soalYVR4q24RFwd6quNhk6d65jO2XoJkTxgRqFH1+fbhbeLi2kJYucUBgdSLCSzDel/mZteWyJoXn9aULE10mEhxFFGSDw6CqvHPsgsQLE+aidwIgTkBhMWIzMoGOkeElws1IGSxQQAfOExB6krMOU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB3375.eurprd08.prod.outlook.com (2603:10a6:803:87::29)
 by VI1PR08MB2765.eurprd08.prod.outlook.com (2603:10a6:802:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 08:09:29 +0000
Received: from VI1PR08MB3375.eurprd08.prod.outlook.com
 ([fe80::94d1:d06c:76a2:af28]) by VI1PR08MB3375.eurprd08.prod.outlook.com
 ([fe80::94d1:d06c:76a2:af28%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 08:09:29 +0000
Subject: Re: [PATCH v1 0/3] migration: Fixes to the 'background-snapshot' code
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210323222155.GA219069@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <65f1ebcd-fac9-0923-33e7-889946066b40@virtuozzo.com>
Date: Wed, 24 Mar 2021 11:09:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210323222155.GA219069@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------1553B96A13748EC0C750010F"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM9P195CA0007.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::12) To VI1PR08MB3375.eurprd08.prod.outlook.com
 (2603:10a6:803:87::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM9P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 24 Mar 2021 08:09:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7acac79-cbcd-4555-534d-08d8ee9c25ec
X-MS-TrafficTypeDiagnostic: VI1PR08MB2765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB2765B0F8EA090E3D9A1A780C9F639@VI1PR08MB2765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwI02dc33s5FgX2eA9g8CMilXOn+hoMryzFr24NJlsGT5kWYCXINAnqU2ge14Q/C3lF230oSAirpRE4kDP2HB5/6R9b6w3frqxasD+l5M+dA8wttZmpd+tfJrZo4mMPW3ZHMR4NV5FkV9Jk81qxKmAN4Ha+3QPvNhRFq5bUlbqiMBrjslj/VrXiRr1ultqEuCrn+IfJ8ychzoSSQm2q3GILohyqXcyCQAdKl1Jtf4sBot3X1SUjLN7jdzylIePUX0aG8wIGo3RwT2og85CUzvVHIVF0Jqt2kLG20OzuivCLTuPLZv6p5AAuu8HAhGq+C9vsT8pHlZoR7Tty73RWTjKzUS3jky/yu86wo9EDbyxRBjDrof57fd5AH1PjxPFIRLSMfVCZNY5fH5x9hYpjHL6XZ0DtobjkezsxLkdztwmPk1CwdRJdeX6brA9tonxokTbnSUdjDW9ZaziVKcYcZ1ZlLQDYcCS/MZfzi3/Wpov2bMOajYq0wF5axk8URs0CpADSDObwLk/mjsf03T7r75eqzYcHTZdeMNxRJyqnKYzNGn9jcp3JVuYPmq6+4VHIXBRrbUgvjbj5SMYTNqqI3Dv9jReBHNwNS2AFj5Cw7dXWsm9Nxwi83Bwvh5zyCLOo6kno/uDH2cpmsSM/aA3cmkm/dI1qqVbZsSL+Bxb/e0HF0zb2/8WIY5lVc+edyN3RkYs+LVERCmb6MW9S3pVCprA5tHz28nV/e89nJqr2X4yo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB3375.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(83380400001)(54906003)(5660300002)(478600001)(86362001)(36756003)(186003)(16526019)(31696002)(8936002)(52116002)(44832011)(316002)(16576012)(2616005)(956004)(6486002)(31686004)(33964004)(53546011)(2906002)(6916009)(38100700001)(4326008)(66946007)(26005)(66556008)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ris2ZUlTY0RZQldSWjZIdkZ0YnIya0ZxdTh1QjJlN1BWTUtoWFVQVTk1ZXRV?=
 =?utf-8?B?a1ZxN21pWHFvMzdYSmtob0FxQnlsZmdhaTArZmZEM25kUGlzT2lCNUw0TlFi?=
 =?utf-8?B?NThZUTd4OGVEeFNidXNFcktISW8yZkdEZlZvZXhmbExGR0lLU0JnU3l5ZEhW?=
 =?utf-8?B?cEdlazNUdDR2QWVNQWs5VUtwaDcyWEhDcHFyL01pUWpXVGpvd2gxUzdpTzRI?=
 =?utf-8?B?YnNpVmh6Y1o3ZjZFUytxbDlUWGFWSHU1Y0ZtQlFDOTJyV3NzZXN5NU9yNktJ?=
 =?utf-8?B?VDNDMVZ6a01lZHB2UG1SbVFmOVZyUVRxM0svRkVCa0YzMmxFbHBDQkRMTWZZ?=
 =?utf-8?B?VnA4QVFRTnRKaDVmTlJtMDFlYW1ySGZibWFta0k5YnpvcHBBNkZvb29VemNt?=
 =?utf-8?B?d2dnazFsOW9mbW9zVFZMeHppU2oramw5bVMva1dPZ0kxSnZneStobTA3L1Mw?=
 =?utf-8?B?YjhyaDhxZmI0QVVpdjJkWUNDQnlSa0FzWTk4eW4vb1psUnNEQ2hteEJ0VlRw?=
 =?utf-8?B?MzV3ZEJvSDhFamd0TkhiVEloVitLVU9obFBiRnZYbWJnejNVWUN5VzNyQXZp?=
 =?utf-8?B?MnJtUG9PWUtqNXdwM3R2WEdpNnlGRnhmK1I3V01SMDB0WDBmOUFkWklFQks0?=
 =?utf-8?B?QlYxUFJsaldEYzdLdnVTZnpJWVhqaU42MzFCUnRhbEFYcjVKaHBxamx3ck0v?=
 =?utf-8?B?eGlhblBYS00rUi9hdWlTdzJPTitKVUVPOXRNVVdOYXBLSnVObjJCUk4wTktr?=
 =?utf-8?B?TG8wV21rU1VyeGFWSjMveTVLVlJkdkNYZVVDOFBDMlpYSnNFeTFUbi9DQ0I0?=
 =?utf-8?B?b0UxVVgvRjdwZm96R0F4bUJqSks5a1NoU0ZxVityUGNSOVhrR2hqNHFEM28y?=
 =?utf-8?B?MlFSaXBNVmZsUnM1MWN1UkFtWVBLalJMWVNkQXRWU2FVblFjTHpSQTI4OWxz?=
 =?utf-8?B?R1NzeEd5YTl3SlFtSXAwUFMzdkRqVUpvOVdRV2hVWVdVcnljRFFoaVZMSTEy?=
 =?utf-8?B?YytWZkpBTWJhVllNUFYxWnZwNEdtUTA3QjVuUXhyY1JjeUdGalRkVU55Uzdm?=
 =?utf-8?B?SzVFQXdCRk9QZnhtVXVFd1FlZE83d3UyallMbkpaUkxKSkZiMDFxUkt1RCtN?=
 =?utf-8?B?WFhpUDUvY2Z2dVA5OWFOQnllMVYvTC9oKzZHZUJrU0tabkdLTDNLYjVSWDJK?=
 =?utf-8?B?STBlZ2JweFQ0WEdkMFVRckk5eklSMFRhdEJEWTlFNE9xdTJPNVAwaityNndC?=
 =?utf-8?B?alFvNkRldi9vNEx4TTB5QVIvVXhZUmhRN2tPNHh5cFRIZEhLMFp4RjJneVYz?=
 =?utf-8?B?MlVQcWc3bXhmVHMwanBJRzg5OTFvdHlobXpEUzdkVjNzSzdBZk01d2pkdTNM?=
 =?utf-8?B?ak9LaFlIY1hkREZGVnlYMEdkNjVNYXNHMWxzaTFaSG9TVFpWZTkrNVFwbFZr?=
 =?utf-8?B?aGZ2L2ZpV3kvS0NnOE5uVDZ2NjJmL1hrOUdFZ1lZOENLTGg0OStocEhHQkJ4?=
 =?utf-8?B?bXdoZ2JrdmtuQXdmbXBodzRnNnA0ajIrTFowRTRpY1d2eE5CVWlhTElHZlR6?=
 =?utf-8?B?T05UaWM1Uzl6amRKVGU2UzVDbFdndXV0T1pKd2NhU3RFaTNsRVFXYm1qcksw?=
 =?utf-8?B?SFJ2Qlo1RWE5V0toamhmU3pTMXlQbXlXOHBZa2p6eXJyc2ZkOWx5Zk5zbjYr?=
 =?utf-8?B?OGVkaW1TL0JYNzVNaHBoMC9EMDhLL3JlRTFuY1ZJSkhhTXZ2Wll4aHlUbXNz?=
 =?utf-8?Q?qNfzy2jehlZ+zoDfiBBUiJN87E5By12bo08DSY/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7acac79-cbcd-4555-534d-08d8ee9c25ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB3375.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 08:09:29.3487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHTQFj31mY2qlBdzydo9lsa7TOrW4W9XRre6SYWlQEP30XEY/H8iPI2C5XX2cRwmkZXVHa1tRQopcUmZhq4syTNJerArd+tc3FfVlcm+oR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2765
Received-SPF: pass client-ip=40.107.14.133;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------1553B96A13748EC0C750010F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.03.2021 01:21, Peter Xu wrote:
> On Fri, Mar 19, 2021 at 05:52:46PM +0300, Andrey Gruzdev wrote:
>> Changes v0->v1:
>>   * Using qemu_real_host_page_size instead of TARGET_PAGE_SIZE for host
>>     page size in ram_block_populate_pages()
>>   * More elegant implementation of ram_block_populate_pages()
>>
>> This patch series contains:
>>   * Fix to the issue with occasionally truncated non-iterable device state
>>   * Solution to compatibility issues with virtio-balloon device
>>   * Fix to the issue when discarded or never populated pages miss UFFD
>>     write protection and get into migration stream in dirty state
>>
>> Andrey Gruzdev (3):
>>    migration: Fix missing qemu_fflush() on buffer file in
>>      bg_migration_thread
>>    migration: Inhibit virtio-balloon for the duration of background
>>      snapshot
>>    migration: Pre-fault memory before starting background snasphot
> Unless Andrey would like to respin a new version, this version looks good to me
> (I don't think the adding new helper issue in patch 1 is a blocker):
>
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks.

> I'm also looking into introducing UFFD_FEATURE_WP_UNALLOCATED so as to
> wr-protect page holes too for a uffd-wp region when the feature bit is set.
> With that feature we should be able to avoid pre-fault as what we do in the
> last patch of this series.  However even if that can work out, we'll still need
> this for old kernel anyways.

I'm curious this new feature is based on adding wr-protection at the level of VMAs,
so we won't miss write faults for missing pages?

> Thanks,
>


--------------1553B96A13748EC0C750010F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 24.03.2021 01:21, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210323222155.GA219069@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Fri, Mar 19, 2021 at 05:52:46PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Changes v0-&gt;v1:
 * Using qemu_real_host_page_size instead of TARGET_PAGE_SIZE for host
   page size in ram_block_populate_pages()
 * More elegant implementation of ram_block_populate_pages()

This patch series contains:
 * Fix to the issue with occasionally truncated non-iterable device state
 * Solution to compatibility issues with virtio-balloon device
 * Fix to the issue when discarded or never populated pages miss UFFD
   write protection and get into migration stream in dirty state

Andrey Gruzdev (3):
  migration: Fix missing qemu_fflush() on buffer file in
    bg_migration_thread
  migration: Inhibit virtio-balloon for the duration of background
    snapshot
  migration: Pre-fault memory before starting background snasphot
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unless Andrey would like to respin a new version, this version looks good to me
(I don't think the adding new helper issue in patch 1 is a blocker):

Reviewed-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
</pre>
    </blockquote>
    <pre>Thanks.
</pre>
    <blockquote type="cite" cite="mid:20210323222155.GA219069@xz-x1">
      <pre class="moz-quote-pre" wrap="">
I'm also looking into introducing UFFD_FEATURE_WP_UNALLOCATED so as to
wr-protect page holes too for a uffd-wp region when the feature bit is set.
With that feature we should be able to avoid pre-fault as what we do in the
last patch of this series.  However even if that can work out, we'll still need
this for old kernel anyways.
</pre>
    </blockquote>
    <pre>I'm curious this new feature is based on adding wr-protection at the level of VMAs,
so we won't miss write faults for missing pages?
</pre>
    <blockquote type="cite" cite="mid:20210323222155.GA219069@xz-x1">
      <pre class="moz-quote-pre" wrap="">
Thanks,

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1553B96A13748EC0C750010F--

