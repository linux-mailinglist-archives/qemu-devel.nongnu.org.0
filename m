Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E380C48EA3C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 13:59:25 +0100 (CET)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8MAu-0003sa-23
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 07:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Lxu-0007dy-SR
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Lxs-0005AD-Kt
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642164348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X0P3RW4oMW32SEDdS/6DCzDtYqmS7+UwOi43jzQZKSI=;
 b=NCEfz7CdOT9PatqZNe+Kt0Q4HbQOUyWAWnlwrZ6mpj3kJQcDtr6pTD9xawU1os6z2rlV22
 ypqIoXiY85CMmw6Otr+po9eokr5ckHGoS8cZGC8Lml+tfMw0Y0PJmS9ogA3QD5LijWF2m1
 qQXtcr0Gegz4sp8WD1ABrdji5VUT3Gw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-ZucZUxSlO0mVpHQ-cgRB_A-1; Fri, 14 Jan 2022 07:45:47 -0500
X-MC-Unique: ZucZUxSlO0mVpHQ-cgRB_A-1
Received: by mail-wr1-f71.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso1725491wra.18
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 04:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X0P3RW4oMW32SEDdS/6DCzDtYqmS7+UwOi43jzQZKSI=;
 b=QA/zCuLW/vvUYdTcIcyBuVwcz+yHjH+oYxkt07eWRjEynLfEnIq2ILAGRXTfiAqF9s
 N02hgClUGowUDUITlIXPKOMP3XCCw4UYbND+w9EGK6yJ4Q9fGskbPCNXi5qyXzl5V8rT
 NYd5UDMozFXJB4Wlk1x1lrWm+eumW7KEw0FTCRtYYsVq0rMB2nijvocZ1xZAhP+Cga1B
 6EZ8XkzyNr4rm1pdFY/93B8+ig3xUkPPd9+fMWM+aKaZ3mKxZe7Pzgn5YeCVSOUPXFoU
 L1nkpYeHnvqeH7bg/GEK2ROTEWn0xi9jFHTuG89/7G1D1QOesNkAotPr6G34suLE8nuk
 iSxA==
X-Gm-Message-State: AOAM532z5XK6zh960ADFqp0P7UrsswEmmb1FPa8k7Gcw6jVbgFVvW3a4
 MDW753zZnzzsUtINUsZTVembHbt2gxZ52CT6VClgT+A/fumezC3vfXVgTPpfLb9sYSex5DV8UED
 zYQ6SJ08sXmM9AFo=
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr8065901wrt.327.1642164346299; 
 Fri, 14 Jan 2022 04:45:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjssIZ2yeS9VuZhRuw9nEedrjnspxjMsiZUN0EUGGWFBTtMFCJwP/U1gmdQC+9im+vvitSsw==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr8065893wrt.327.1642164346140; 
 Fri, 14 Jan 2022 04:45:46 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b14sm6138569wri.112.2022.01.14.04.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 04:45:45 -0800 (PST)
Message-ID: <1e3a01ce-3eaf-4ac9-7957-7eef7c5c5e2a@redhat.com>
Date: Fri, 14 Jan 2022 13:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/2] block-backend: Retain permissions after migration
To: Peng Liang <liangpeng10@huawei.com>, qemu-block@nongnu.org
References: <20211125135317.186576-1-hreitz@redhat.com>
 <0ac47838-f936-e9a9-5c8c-0a6911e07955@huawei.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <0ac47838-f936-e9a9-5c8c-0a6911e07955@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.01.22 12:51, Peng Liang wrote:
> On 11/25/2021 9:53 PM, Hanna Reitz wrote:
>> Hi,
>>
>> Peng Liang has reported an issue regarding migration of raw images here:
>> https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00673.html
>>
>> It turns out that after migrating, all permissions are shared when they
>> weren’t before.  The cause of the problem is that we deliberately delay
>> restricting the shared permissions until migration is really done (until
>> the runstate is no longer INMIGRATE) and first share all permissions;
>> but this causes us to lose the original shared permission mask and
>> overwrites it with BLK_PERM_ALL, so once we do try to restrict the
>> shared permissions, we only again share them all.
>>
>> Fix this by saving the set of shared permissions through the first
>> blk_perm_set() call that shares all; and add a regression test.
>>
>>
>> I don’t believe we have to fix this in 6.2, because I think this bug has
>> existed for four years now.  (I.e. it isn’t critical, and it’s no
>> regression.)
>>
>>
>> Hanna Reitz (2):
>>    block-backend: Retain permissions after migration
>>    iotests/migration-permissions: New test
>>
>>   block/block-backend.c                         |  11 ++
>>   .../qemu-iotests/tests/migration-permissions  | 101 ++++++++++++++++++
>>   .../tests/migration-permissions.out           |   5 +
>>   3 files changed, 117 insertions(+)
>>   create mode 100755 tests/qemu-iotests/tests/migration-permissions
>>   create mode 100644 tests/qemu-iotests/tests/migration-permissions.out
>>
> Hi Hanna,
> QEMU 6.3 development tree has been opened.  Will this fix be merged in 6.3?

Oh, yes, right.  Thanks for the reminder! :)

Hanna


