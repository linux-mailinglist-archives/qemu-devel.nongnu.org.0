Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847239C8EB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 15:52:21 +0200 (CEST)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpWip-0008Ia-Uq
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 09:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWhe-0007Cn-BR; Sat, 05 Jun 2021 09:51:06 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:1323 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWhZ-0005Ro-7v; Sat, 05 Jun 2021 09:51:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlbSfSmlE1eQ+acZrVYl+pMW8UdEdNT3N2dpZMNFMnM+d10aeTAYd/qNspnQGi5axZ9HD1xIlQ4mCZyoxFsmH9qWqLzjf9Y892dzajjuWd2NkdtCRu4k3fj8NPTQUm6oMDTyN0fwkRfzBfn2DHU/q04qBDV4Z08NrjCf8cVGfhROhEEJxzG/zGSgHcQZiQ10Pjv+DVtjKSr4Aq5C+KjRO8emsVkwuPsJUPDE/tSUGMp/woG7wcQHMWJnyE8KbP7mf/8xRQL+Q4it2lA7AW6ymodj+Tm4n3vgX4R3LeF/XoT5AAWtUoiJ/F0HtGnHOLS+wESR02tymrp+JbqrTyMpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGb0oPLgqjW8z3UiryP6XWeTCD4XIiClr2oasgzrhH0=;
 b=AsfS/iQO953CsYeem68E3irlsBP3Dzxdln7nMCvDifRnetlTQCNAX/lKz7xIpc7xtpUT2bHSLqpzN6sOYJTqnx3le9GbR2TZQUQ5GycpgzCptejK1zFy3MQZpATFsCAEnOuL5tzRBDoxIk1oFK4oGJwYdmuRqZbPDAAjjmSnEMwrHrw5HsNNUW5DsHt/k0j5+cwQ7RE4Kmz+8q7Abb9wfktCsq4NAFj6ofxUbNeAOJ8ZJ8hpP37/OjF16BmuC50FZvKLMMQHIA2etTU5pA8KOE1Ij0TVUrSyKKPCLO4k58t+QGtmsezhG6iDtoppEyBfn0xS9NJQqMCKcv4GiuF0Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGb0oPLgqjW8z3UiryP6XWeTCD4XIiClr2oasgzrhH0=;
 b=HgrauU7rkyeNVT8p/RTCq7OzX7ElBkp0mHxyh9i3Qf5v6vl1Jh3TzNgOXnZNnmLbghyH7XlmG6rL8pZ1qIjZ4a3MHYvQJqGSuJ2nnWNGRP0lu+36teOHhg6GMVfJp4aV3xOwlHFAgnYD5PPJ7EkQMSlqrY78nMhpWdJTX6eCqdc=
Authentication-Results: gluster.org; dkim=none (message not signed)
 header.d=none;gluster.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Sat, 5 Jun
 2021 13:50:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:50:56 +0000
Subject: Re: [PATCH v5 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, John Snow <jsnow@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 "open list:GLUSTER" <integration@gluster.org>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
 <20210505075001.45041-8-vsementsov@virtuozzo.com>
 <20210604200939.2wcnh2spynqlbepb@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3eab12d7-7cf4-1ed4-3572-51ee22ec9a2d@virtuozzo.com>
Date: Sat, 5 Jun 2021 16:50:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604200939.2wcnh2spynqlbepb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: AM0PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 AM0PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:208:ab::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Sat, 5 Jun 2021 13:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ddf96b3-a35b-4ba3-8210-08d92828f137
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4088F198C5A8EAD0A0EFFF20C13A9@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:283;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FhKiPZ5S4SbE+4PAsjj+fZ0qiTzWq+eTLCjXZNeq2SBA89qloDiX4RfTLCWSfd4ZTqBTfDlfco3wzbPy3sQaccpgOzSoLwgM9TsoWBGRvUTHj6DTcbFBWuUucsyiKuJDCYhvOv9zCc/AdqmQnlRs5KxcNctJuvuvESg/CK+/FsMCZ/t1NtZ9Frhyh5kOjFleXUe2g+VEZ1om5jWskQ+utqLsS8c603g5uFP/gRP+BKrgTJsOVFyH40yDDBmsPR2BbaX2h/DlSBHlwKaSKZouEiFrWxoN7nauio4jjld65R0/7JbNITwr76kmuXB+W5y2aeHmc1X4nRJTsYwS2iaTOmWgJAG0UMaE8AxNWryKPFPWJF//C9IklfLSrL+mR1IhcfPfo4kn1eyOwKCGEL+ENL+ZTOcmhSIte7v4bT8q1FyRX9LN+BZBsFxtBJb4mB+kcHU2YWzdzcfyOVrAapY9RVJoh52QpMMfP2+kaI4kVufzaVOF0WwsXfy2/sRmAfU7Hni9qr4h/ux2TiftSg0PX3iaZqFcyHJidIY0d68xqapAd15MkT3K9nQ3DjTYMQdDF5FVmNrqIbmqWBbi9vlgwE7TJpV9VP3NSi9y8mgBzidWLj6AqSVtvErD4VMN3DIenZx0sRvunVoHvetn1ahrhGnE38RrHocFuCC+P2jdatTprnuCwy3lsSynuF26bQTTPEKJv2XQTmmWftwCiiEMifKccqQ8ptCrdzjAigapSkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(136003)(366004)(346002)(376002)(36756003)(2906002)(5660300002)(31686004)(6916009)(478600001)(54906003)(66556008)(66476007)(66946007)(83380400001)(16526019)(38350700002)(38100700002)(4326008)(186003)(956004)(2616005)(52116002)(31696002)(86362001)(8936002)(316002)(8676002)(7416002)(16576012)(6486002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXdNZS9PRlJIUEZ5MEcxZkhVWm1pMkdTQ21UNjNjT0lNNTZnK2tEVUY0YW5K?=
 =?utf-8?B?Y1pUTE8vaWZTMlo4YVJpWE9XUVRrek1WK3RnU2tJdU5hUFk5bGV4S0UxakxG?=
 =?utf-8?B?TjAxMWVMczZXUDFVd3lvMGN4WVp2Vkg0dnhHWVNmMUVlNmlHbWJMYnZkSU5I?=
 =?utf-8?B?Y0Ivb1RnWjZVT2dncU95WThPTStpR2o4VDFCTmJPNE5FQ1N5RnlWVktIYy8y?=
 =?utf-8?B?SUFOVndyS2lRS3UzMC9nbmFmcVozL1M4Z3R3TDZwTDdOTjZGaHhSbTN5a2JV?=
 =?utf-8?B?Qm9HbWJpSXFlOVdBOVRUcDRmMDVQQmJ1RlZDZVZRd2htQUhDelJuV3FXM3hw?=
 =?utf-8?B?ZmV2ak5reWlVeHlZdDJ5OGtTdHh4WVUzZlUyNlBNUm1SREtuUXlscDliOVVl?=
 =?utf-8?B?R3VzT2t5aXY2d2NhZC9mUitJN2VBK0ZEdkJ2OFI2TW02aEEzaWZGWHlnNTlh?=
 =?utf-8?B?STdJeURaRkhBb2VyNE5tNXlDU05peG8xa29OSXhCYit4QmFvZjZ1bUdQVWNv?=
 =?utf-8?B?azc2eS9NUDhrdXRHS3ZJUlhEMGFBR1BQNjgrVVB2a0JxTDlaeHUyVTloWDBF?=
 =?utf-8?B?NkpoNDlNbjVwcFdxRkJhU2VrQWxxTnd4UW94RGY5cEQvWlRSSG1WelhLbGpR?=
 =?utf-8?B?S2lUZnRlNjVIMEM1SHVibXkyK2czUGt6UXNoM0RDdmRsK0RRVzhHVVcyVEZs?=
 =?utf-8?B?Vy9EbkpTRGxxdGh4RURSazFDcHRPUEZBN2VVTTVqWmtjUWpEUnRTNkF0RVVh?=
 =?utf-8?B?UzNnVFlzNUtoVzRvdy8vSUxzS2dlWENFM21JMVE4VmNXWTZ3c2ozb3kybCtv?=
 =?utf-8?B?bjQwZ1dpK0xhbzIya0VOZHNvVGlkQUx3SkhndFBjWWFHRVB1UVhaRlBGQ09w?=
 =?utf-8?B?QjhPT1BzU0V1Z2lSS2VNUllUWUF6WDFnSjdjTTlXR2xyWm05a0g1RHc5bTFO?=
 =?utf-8?B?SDFXUE9haUQ3RGU1TU1xSjdER3p4czJIRmg4UkxVcG4wbFBxS1JXNVJIZVlK?=
 =?utf-8?B?L2ZrSVRTSHVqcTErbHpsZE1TY0dyOXRheUgyMlZPTDNvOWhSV1MvRnhmL0tR?=
 =?utf-8?B?c0hocDhWbVBiUFlmdnRuUWNrRmxsSnBnRENqMEZKWElsR0VBdkhJWFRPS3Rw?=
 =?utf-8?B?RkJtNk9SZ2M1L3ZxU2UrK2QyUlpSS2t4QjVYMTlRQU5HZnplT0VoQnozTVRN?=
 =?utf-8?B?NHlObVpoSjViVDhpZjhIcyttcW5tcXdtMXhVYzh5Sm1GSFF0c0JsYTRvUllu?=
 =?utf-8?B?K2w2bWtsNWhCaFlMWlNRZzlLYzNtdXFWS1dZZ3RhUkdEOS84WlVOcTFrNUJD?=
 =?utf-8?B?WDNkVHVOQUVHOHVwc2NKOWFGQ3lOQTB5a1RnRXBSVTc3NXZvbmVDOENHWU9S?=
 =?utf-8?B?cmFqTGtpbnRWeGNGT1BmRk5iWjBIYkxYSkhOL1VYbmEzZkIxcmZWRzJlLzlr?=
 =?utf-8?B?OGI1Z0NhSnFKSTJ0K0hkeG9ZNHVpbzBBai9GTUtQQzJDWWtyWW5BMDg1ZGs0?=
 =?utf-8?B?OVlEWVEybHdPcHNNVXdCNzZhdnFKbVVLNnhBRmpQV2M0TEppaGFqS3ZBT29S?=
 =?utf-8?B?Z2swWXgyTmRUUWk1bDQyb005NFozdzBDbDNRYTRBT1pzVnVBbi9DOG90RjNL?=
 =?utf-8?B?SEdsMFF6bXZmL3F5ODVyNjRxeWVsenB2VDJSV2NZQzQzNlJ6YVVRNFBJa2NZ?=
 =?utf-8?B?ODRQbjlYQ0NmbTRRTmx1TERwTVhYQ0J1cGlrTDFyeGI5bk56RlQxTURPeTNj?=
 =?utf-8?Q?jxuJz+SdNlq+lBckhL48nyb/TvA+Vdkzj6xo1Sa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddf96b3-a35b-4ba3-8210-08d92828f137
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:50:56.2028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYwNuxBokpDF1r3ZcBDT1ZtY9gCLjGLhRqYVp8GRAK4w8EbLBZ02aMxbVFg++FZF9EqIdGnhSTptrY1SsLT9jGlMxh0spfmVa30MI20iBGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

04.06.2021 23:09, Eric Blake wrote:
> On Wed, May 05, 2021 at 10:49:57AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We are generally moving to int64_t for both offset and bytes parameters
>> on all io paths.
>>
>> Main motivation is realization of 64-bit write_zeroes operation for
>> fast zeroing large disk chunks, up to the whole disk.
>>
>> We chose signed type, to be consistent with off_t (which is signed) and
>> with possibility for signed return type (where negative value means
>> error).
>>
>> So, convert driver write_zeroes handlers bytes parameter to int64_t.
>>
>> The only caller of all updated function is bdrv_co_do_pwrite_zeroes().
>>
>> bdrv_co_do_pwrite_zeroes() itself is of course OK with widening of
>> callee parameter type. Also, bdrv_co_do_pwrite_zeroes()'s
>> max_write_zeroes is limited to INT_MAX. So, updated functions all are
>> safe, the will not get "bytes" larger than before.
> 
> they
> 
>>
>> Still, let's look through all updated functions, and add assertions to
>> the ones which are actually unprepared to values larger than INT_MAX.
>> For these drivers also set explicit max_pwrite_zeroes limit.
>>
>> Let's go:
>>
>> backup-top: Calls backup_top_cbw() and bdrv_co_pwrite_zeroes, both
>>    have 64bit argument.
> 
> backup_top_cbw has uint64_t argument (at least on current qemu.git; I
> didn't spot if it was changed in the meantime earlier in this series
> or if I'm missing review of a prerequisite), but we're safe since the
> block layer does not pass in negative values.
> 
>>
>> blkdebug: calculations can't overflow, thanks to
>>    bdrv_check_qiov_request() in generic layer. rule_check() and
>>    bdrv_co_pwrite_zeroes() both have 64bit argument.
> 
> rule_check() is another function currently using uint64_t.
> 
>>
>> blklogwrites: pass to blk_log_writes_co_log() with 64bit argument.
> 
> That, and struct BlkLogWritesFileReq, still use uint64_t.
> 
>>
>> blkreply, copy-on-read, filter-compress: pass to bdrv_co_pwrite_zeroes() which is OK
> 
> blkreplay
> 
>>
>> file-posix: both handler calls raw_do_pwrite_zeroes, which is updated.
>>    In raw_do_pwrite_zeroes() calculations are OK due to
>>    bdrv_check_qiov_request(), bytes go to RawPosixAIOData::aio_nbytes
>>    which is uint64_t.
> 
> We also have to check where that uint64_t gets handed;
> handle_aiocb_write_zeroes_block() passes a uint64_t[2] to
> ioctl(BLKZEROOUT), handle_aiocb_write_zeroes() calls do_fallocate()
> which takes off_t (and we compile to always have 64-bit off_t), as
> does handle_aiocb_write_zeroes_unmap.  All look safe.
> 
>>
>> gluster: bytes go to GlusterAIOCB::size which is int64_t and to
>>    glfs_zerofill_async works with off_t.
>>
>> iscsi: Aha, here we deal with iscsi_writesame16_task() that has
>>    uint32_t num_blocks argument and iscsi_writesame16_task() has
> 
> s/16/10/
> 
>>    uint16_t argument. Make comments, add assertions and clarify
>>    max_pwrite_zeroes calculation.
>>    iscsi_allocmap_() functions already has int64_t argument
>>    is_byte_request_lun_aligned is simple to update, do it.
>>
>> mirror_top: pass to bdrv_mirror_top_do_write which has uint16_t
> 
> s/16/64/
> 
>>    argument
>>
>> nbd: Aha, here we have protocol limitation, and NBDRequest::len is
>>    uint32_t. max_pwrite_zeroes is cleanly set to 32bit value, so we are
>>    OK for now.
>>
>> nvme: Again, protocol limitation. And no inherent limit for
>>    write-zeroes at all. But from code that calculates cdw12 it's obvious
>>    that we do have limit and alignment. Let's clarify it. Also,
>>    obviously the code is not prepared to bytes=0. Let's handle this
> 
> to handle bytes=0
> 
>>    case too.
>>    trace events already 64bit
>>
>> qcow2: offset + bytes and alignment still works good (thanks to
>>    bdrv_check_qiov_request()), so tail calculation is OK
>>    qcow2_subcluster_zeroize() has 64bit argument, should be OK
>>    trace events updated
>>
>> qed: qed_co_request wants int nb_sectors. Also in code we have size_t
>>    used for request length which may be 32bit.. So, let's just keep
> 
> Double dot looks odd.
> 
>>    INT_MAX as a limit (aligning it down to pwrite_zeroes_alignment) and
>>    don't care.
> 
> Yeah, even when size_t is 64-bit, qed is not our high priority so
> sticking to 32-bit limit encourages people to switch away from qed ;)
> 
>>
>> raw-format: Is OK. raw_adjust_offset and bdrv_co_pwrite_zeroes are both
>>    64bit.
> 
> I probably already mentioned it in earlier reviews, but hopefully by
> the end of the series, we clean up raw_adjust_offset() to take
> int64_t* instead of uint64_t* to get rid of ugly casts.  Doesn't have
> to be done in this patch.
> 
>>
>> throttle: Both throttle_group_co_io_limits_intercept() and
>>    bdrv_co_pwrite_zeroes() are 64bit.
>>
>> vmdk: pass to vmdk_pwritev which is 64bit
>>
>> quorum: pass to quorum_co_pwritev() which is 64bit
>>
>> preallocated: pass to handle_write() and bdrv_co_pwrite_zeroes(), both
> 
> File is named preallocate.c, the 'd' seems odd. Worth sorting this
> before qcow2 in the commit message?

I think yes

> 
>>    64bit.
>>
>> Hooray!
>>
>> At this point all block drivers are prepared to 64bit write-zero
>> requests or has explicitly set max_pwrite_zeroes.
> 
> are prepared to support 64bit write-zero requests, or have explicitly set
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
> 
>> +++ b/block/iscsi.c
>> @@ -1205,15 +1205,16 @@ out_unlock:
>>   
>>   static int
>>   coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
>> -                                    int bytes, BdrvRequestFlags flags)
>> +                                    int64_t bytes, BdrvRequestFlags flags)
>>   {
>>       IscsiLun *iscsilun = bs->opaque;
>>       struct IscsiTask iTask;
>>       uint64_t lba;
>> -    uint32_t nb_blocks;
>> +    uint64_t nb_blocks;
>>       bool use_16_for_ws = iscsilun->use_16_for_rw;
>>       int r = 0;
>>   
>> +
>>       if (!is_byte_request_lun_aligned(offset, bytes, iscsilun)) {
> 
> Why the added blank line here?

mistake

> 
>>           return -ENOTSUP;
>>       }
>> @@ -1250,11 +1251,21 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
>>       iscsi_co_init_iscsitask(iscsilun, &iTask);
>>   retry:
>>       if (use_16_for_ws) {
>> +        /*
>> +         * iscsi_writesame16_task num_blocks argument is uint32_t. We rely here
>> +         * on our max_pwrite_zeroes limit.
>> +         */
>> +        assert(nb_blocks < UINT32_MAX);
>>           iTask.task = iscsi_writesame16_task(iscsilun->iscsi, iscsilun->lun, lba,
>>                                               iscsilun->zeroblock, iscsilun->block_size,
>>                                               nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
>>                                               0, 0, iscsi_co_generic_cb, &iTask);
>>       } else {
>> +        /*
>> +         * iscsi_writesame10_task num_blocks argument is uint16_t. We rely here
>> +         * on our max_pwrite_zeroes limit.
>> +         */
>> +        assert(nb_blocks < UINT16_MAX);
>>           iTask.task = iscsi_writesame10_task(iscsilun->iscsi, iscsilun->lun, lba,
>>                                               iscsilun->zeroblock, iscsilun->block_size,
>>                                               nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
> 
> Thanks - these assertions and comments are indeed a lifesaver for
> future maintenance.
> 
>> @@ -2074,10 +2085,10 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
>>           bs->bl.pdiscard_alignment = iscsilun->block_size;
>>       }
>>   
>> -    if (iscsilun->bl.max_ws_len < 0xffffffff / block_size) {
>> -        bs->bl.max_pwrite_zeroes =
>> -            iscsilun->bl.max_ws_len * iscsilun->block_size;
>> -    }
>> +    bs->bl.max_pwrite_zeroes =
>> +        MIN_NON_ZERO(iscsilun->bl.max_ws_len * iscsilun->block_size,
>> +                     max_xfer_len * iscsilun->block_size);
> 
> Works because max_xfer_len is 0xffff if we are stuck using
> writesame10, or 0xffffffff if we are able to use writesame16.
> 
>> +++ b/block/nvme.c
>> @@ -1266,19 +1266,29 @@ static coroutine_fn int nvme_co_flush(BlockDriverState *bs)
>>   
>>   static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
>>                                                 int64_t offset,
>> -                                              int bytes,
>> +                                              int64_t bytes,
>>                                                 BdrvRequestFlags flags)
>>   {
>>       BDRVNVMeState *s = bs->opaque;
>>       NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
>>       NVMeRequest *req;
>> -
>> -    uint32_t cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
>> +    uint32_t cdw12;
>>   
>>       if (!s->supports_write_zeroes) {
>>           return -ENOTSUP;
>>       }
>>   
>> +    if (bytes == 0) {
>> +        return 0;
>> +    }
>> +
>> +    cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
>> +    /*
>> +     * We should not loose information. pwrite_zeroes_alignment and
> 
> lose (this is a common English typo; "lose" rhymes with "use" and is
> opposite of "gain", while "loose" rhymes with "goose" and is opposite
> of "tighten")
> 
>> +++ b/block/qed.c
> 
>> @@ -1408,6 +1409,12 @@ static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
>>        */
>>       QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, bytes);
>>   
>> +    /*
>> +     * QED is not prepared for 62bit write-zero requests, so rely on
> 
> 64bit
> 
>> +     * max_pwrite_zeroes.
>> +     */
>> +    assert(bytes <= INT_MAX);
>> +
>>       /* Fall back if the request is not aligned */
>>       if (qed_offset_into_cluster(s, offset) ||
>>           qed_offset_into_cluster(s, bytes)) {
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Thanks!

-- 
Best regards,
Vladimir

