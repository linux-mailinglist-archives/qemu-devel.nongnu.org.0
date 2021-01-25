Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F53302767
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:03:39 +0100 (CET)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44L4-0003in-7p
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44JX-0002vd-CN
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:02:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44JV-0003Qe-Ox
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611590521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iR3j+IK/zLsPlXJEhi51XPt1xcgBbQMI1jeLKKErySU=;
 b=RgMwKqGv8GUanbaDqIjK+q2MbM7XTcIwsMPI3UxNCugg59IgMmIn8Dcdfz3H5Ud44AbVcL
 EvaAlD9tq9A7tAhhwtV4A4ZtcS3LxdULFA3PXPJFq+CN92n4FFYlqiBazx8BgA90o5kCuI
 +kWxDTonqhP8+l8pGlR9P7T2i7rXKdU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-wZctABSAOwa7BhGKsMbeCw-1; Mon, 25 Jan 2021 11:01:56 -0500
X-MC-Unique: wZctABSAOwa7BhGKsMbeCw-1
Received: by mail-ed1-f72.google.com with SMTP id j12so7662755edq.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iR3j+IK/zLsPlXJEhi51XPt1xcgBbQMI1jeLKKErySU=;
 b=oqZAVntXzg+JKx2aZGyRFvK1l9LwHOllsLmEtU0Oa9Uewc4IqxAxzo91gYm5z6GGKF
 f6pdvb/ik/k/koTAM0uS3BZQXoOogLZDHmeU19JIKITXogyQHAJ4Jf7b5dBdgXm1xusn
 +7e3mEiRKQQIcpt/IUPOHZxserRciH/nKuMWMNosQOLIPMu3Py8xs5zPP9sRMWAGtBWi
 rkejXtY09WrNX3Vk3BlSV2J7TDKNhLP9whcLARml8hTPBWENnKU0xAMvF+e0kOe+fqyR
 wseDaX8wqH7ANgwNdi9b6HSIHdOKXqJMxCYZw02JDCLqQG1SULuuDyMKfZornChdVmhG
 0YIw==
X-Gm-Message-State: AOAM531+GsB0X1naS24qHt2KUbN6GYqs94FDbQcPZW2Ufsx20Aqpo8RB
 wi7CUQET6K5pv/IJSsq3YOVfLb8jwdVjZD9vDBhQTIcO6AaCh8K3w0RQJ1bSFSXs4785pLU+PF0
 UsmeHGf7pU0TRjC4=
X-Received: by 2002:a05:6402:1648:: with SMTP id
 s8mr1072373edx.50.1611590513978; 
 Mon, 25 Jan 2021 08:01:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxH9ZqEoZ+e5mdpfrQXpf9CpMkjQc0S3txWgZDqun4mvkh2ALYXG0eYm7dxte7X04hoz44ToA==
X-Received: by 2002:a05:6402:1648:: with SMTP id
 s8mr1072362edx.50.1611590513848; 
 Mon, 25 Jan 2021 08:01:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id bd5sm10303070edb.86.2021.01.25.08.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:01:53 -0800 (PST)
Subject: Re: How to check when "raw" format driver uses a "regular" file?
To: Kevin Wolf <kwolf@redhat.com>
References: <1ccc5e60-65fa-21aa-713d-d5bb575b2594@redhat.com>
 <20210125154316.GC7107@merkur.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c53e6ff2-b09a-ee1e-110d-b64f23e7b609@redhat.com>
Date: Mon, 25 Jan 2021 17:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125154316.GC7107@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 4:43 PM, Kevin Wolf wrote:
> Am 25.01.2021 um 16:05 hat Philippe Mathieu-Daudé geschrieben:
>> Is it possible to restrict a block driver to a particular set of
>> options? In my case I'd like to restrict the raw driver to regular files.
>>
>> I noticed the NFS driver does it locally in nfs_client_open(),
>> and FUSE has is_regular_file() -- which is POSIX specific however.
>>
>> When a backend is a SCSI drive, the block layer provide the blk_is_sg()
>> method to test it.
>> 1/ Should I provide a similar blk_is_regular_file()?
>>
>> 2/ There is no oslib function to check for regular file,
>> should I add one too?
> 
> I find this question confusing because on one hand you're talking about
> block driver implementations like NFS, but on the other hand about SCSI
> devices, which are users, not implementations of block drivers.

Sorry for the confusion and thanks for the quick answer :)

My question is confused because the problem is not clear to me...

> At which level is the code where you think you need to make this
> distinction?

(see below)

> The other problem is that "is this a regular file?" is probably not what
> you're really interested in. The content of an image can be spread
> across several files (for example, consider backing files) or not use a
> local file descriptor at all (network protocol drivers), and block layer
> functions should ideally make sense for all drivers unless something can
> only possibly make sense for a single driver (blk_is_sg might be a case
> of this).
> 
> I assume that you are interested in some specific property that regular
> files happen to provide. If at all possible, we shouldn't check for a
> specific backend type, but for capabilities or properties of a given
> block node.
> 
> So what are you really trying to do here?

Well, maybe this is more an emulation problem rather than a block
one. But system emulation consumes block layer :)

The problem is when emulating devices such NOR Flash (parallel mapping
or SD cards) we expect the block driver being a plain file (either "raw"
format or another) but a "regular" file. When an user passes something
else like a block device, odd things happen.

Well, I guess I self-restricted my question to device emulation. So
in the cases mentioned I would like to add a check in sd_realize()/
pflash_cfi0?_realize() for regular file when a block drive is provided.

Description of problematic user case:

* -pflash /dev/sda
* -sd /dev/mmcblk0

User runs emulation on top of hardware (maybe like passthru?), and
expect underlying block to be in correct state out of QEMU.

Thanks,

Phil.


