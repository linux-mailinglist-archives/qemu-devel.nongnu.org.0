Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B46246A6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 17:12:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otA9f-0004vn-DU; Thu, 10 Nov 2022 11:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1otA9d-0004vW-ET
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 11:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1otA9b-0008ED-V2
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 11:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668096707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8r93YjqtG/Rulh11Ii9XrViKCR/uv3D3YNw0yGpDuM=;
 b=VbfuKG2ByvmbahUStgQ5VqRC+ifimYrJ1iwZCDeDUFCHBjkpLK8iWKgive+8oafg8F/bi3
 tih+ZgOf92i0tT67igMKLGKkM0UJqzqVNg2Gk8AWoqoknEddusdWuEAOxYgVMvJhL4YCHW
 YpThapDh5jgM9SN6oLJEOZ4p3nFM+PU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-LL6uGOSIPlK9zKygZZIr4w-1; Thu, 10 Nov 2022 11:11:46 -0500
X-MC-Unique: LL6uGOSIPlK9zKygZZIr4w-1
Received: by mail-ej1-f70.google.com with SMTP id
 hp16-20020a1709073e1000b007adf5a83df7so1512030ejc.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 08:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u8r93YjqtG/Rulh11Ii9XrViKCR/uv3D3YNw0yGpDuM=;
 b=4cYIXtSnn/+yKtx5N9XZ6zlC7QLaqjoeZGaiRwapMMohFkTs8I2AGdPJAxVqudmxQZ
 MA/kfHn5+ZeiPT+hlwHl3QlG8shJLtw5TMYQGiKXKWyagDk0i2BFxg7/5oJCqBVMrIfx
 rjDWSXfJ2UvfwcU2FzhxuXxelJs3R+XvrtRLxwFH3prWJhSAt8yeVeGfusncDIui6wf+
 KF0dMRKstNvocrEKwS+PymPOpL/J++AYLXqipyjBX5+xdQUcF+foWukTvXTykl9HkT4J
 4sb4bRF/767BmdQK8gY5tl/TJaZn9eX0zvXiKHYWzUnwykGgxESuYqvCDncyP6mHSkcl
 f86A==
X-Gm-Message-State: ACrzQf0tQHH4EVtdQHAFHKakTIcRudftnRXrGtPym9SpOTtewEcJOhYT
 D9rT5lcsawAV8ntDrYvAWNOU4DHj9Ox08K0757av6jG3ypl4hp5O4ygBf9Nly8CDGthTJzVRsbU
 fYpmKox1YwwohKBg=
X-Received: by 2002:a17:906:6d19:b0:78d:3c82:a875 with SMTP id
 m25-20020a1709066d1900b0078d3c82a875mr3209986ejr.465.1668096704951; 
 Thu, 10 Nov 2022 08:11:44 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6uRbqT9pXklXs55fhyjNm4wUAPzQMMDhZSUlfU09C2ZI5FrA7dfKYdZsjzaDuhoFc7RUtk2w==
X-Received: by 2002:a17:906:6d19:b0:78d:3c82:a875 with SMTP id
 m25-20020a1709066d1900b0078d3c82a875mr3209976ejr.465.1668096704696; 
 Thu, 10 Nov 2022 08:11:44 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 lx8-20020a170906af0800b00782fbb7f5f7sm7352648ejb.113.2022.11.10.08.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 08:11:44 -0800 (PST)
Message-ID: <4b94c12a-13d3-67a0-f46b-631c40e2b2cb@redhat.com>
Date: Thu, 10 Nov 2022 17:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/3] block: Start/end drain on correct AioContext
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221107151321.211175-1-hreitz@redhat.com>
 <Y20EJFt1w7xstZtC@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <Y20EJFt1w7xstZtC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10.11.22 15:01, Kevin Wolf wrote:
> Am 07.11.2022 um 16:13 hat Hanna Reitz geschrieben:
>> Hi,
>>
>> v1 cover letter:
>> https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00389.html
>>
>> bdrv_replace_child_noperm() drains the child via
>> bdrv_parent_drained_{begin,end}_single().  When it removes a child, the
>> bdrv_parent_drained_end_single() at its end will be called on an empty
>> child, making the BDRV_POLL_WHILE() in it poll the main AioContext
>> (because c->bs is NULL).
>>
>> That’s wrong, though, because it’s supposed to operate on the parent.
>> bdrv_parent_drained_end_single_no_poll() will have scheduled any BHs in
>> the parents’ AioContext, which may be anything, not necessarily the main
>> context.  Therefore, we must poll the parent’s context.
>>
>> Patch 3 does this for both bdrv_parent_drained_{begin,end}_single().
>> Patch 1 ensures that we can legally call
>> bdrv_child_get_parent_aio_context() from those I/O context functions,
>> and patch 2 fixes blk_do_set_aio_context() to not cause an assertion
>> failure if it beginning a drain can end up in blk_get_aio_context()
>> before blk->ctx has been updated.
> Thanks, applied to the block branch.

Thanks!

I tested your drain series, and it does indeed fix the bug, too. (Sorry 
for the delay, I thought it’d take less time to write an iotest...)

> I would still be interested in a test case as a follow-up.

Got it working now and sent as “tests/stream-under-throttle: New test”.

Hanna


