Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B43343F04
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:19 +0100 (CET)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIPz-000685-0S
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOIOB-0005GY-TP
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOIO9-00035O-35
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616411183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0YHZ+HF5nUQt+AxCqXqQOx0O97V1U/QinUJr/DTtBY=;
 b=Uk2BIGhxipT72EA4ZpuVTJx4KFXnh452xElkr8g+iOcIlJRmNecXaxMbBMYq3+1GMsMdSn
 QJFXTE0+UDlQKzj61NVCMTM80GtRqD/WN3PR6H/X2Brn/acAVbzadYcU/j3cFxa1PJQuk0
 eLSpJnM1dctR61N7YKysKFQfLNXSCE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-mMSIBuXWPuWvul8GcRwb3w-1; Mon, 22 Mar 2021 07:06:21 -0400
X-MC-Unique: mMSIBuXWPuWvul8GcRwb3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8102D1007477;
 Mon, 22 Mar 2021 11:06:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-196.ams2.redhat.com
 [10.36.114.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D414A5F9C9;
 Mon, 22 Mar 2021 11:06:17 +0000 (UTC)
Subject: Re: [PATCH 2/2] hw/block/nvme: fix resource leak in nvme_format_ns
To: Klaus Jensen <its@irrelevant.dk>
References: <20210322061951.186748-1-its@irrelevant.dk>
 <20210322061951.186748-3-its@irrelevant.dk>
 <75eb366b-32d9-ba67-971b-e5993f5ae192@redhat.com>
 <YFh1+nY5Tih9j+df@apples.localdomain>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d9d90aac-1bca-05ee-6621-c3890422757d@redhat.com>
Date: Mon, 22 Mar 2021 12:06:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFh1+nY5Tih9j+df@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.21 11:48, Klaus Jensen wrote:
> On Mar 22 11:02, Max Reitz wrote:
>> On 22.03.21 07:19, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> In nvme_format_ns(), if the namespace is of zero size (which might be
>>> useless, but not invalid), the `count` variable will leak. Fix this by
>>> returning early in that case.
>>
>> When looking at the Coverity report, something else caught my eye: As far as
>> I’m aware, blk_aio_pwrite_zeroes() may invoke the CB before returning (if
>> blk_do_pwritev_part() returns without yielding).  I don’t think that will
>> happen with real hardware (who knows, though), but it should be possible to
>> see with the null-co block driver.
>>
>> nvme_format_ns() doesn’t quite look like it takes that into account. For
>> example, because *count starts at 1 and is decremented after the while (len)
>> loop, all nvme_aio_format_cb() invocations (if they are invoked before their
>> blk_aio_pwrite_zeroes() returns) will see
>> *count == 2, and thus not free it, or call nvme_enqueue_req_completion().
>>
>> I don’t know whether the latter is problematic, but not freeing `count`
>> doesn’t seem right.  Perhaps this could be addressed by adding a condition
>> to the `(*count)--` to see whether `(*count)-- == 1` (or rather `--(*count)
>> == 0`), which would indicate that there are no AIO functions still in
>> flight?
> 
> Hi Max,
> 
> Thanks for glossing over this.
> 
> And, yeah, you are right, nice catch. The reference counting is exactly
> to guard against pwrite_zeroes invoking the CB before returning, but if
> it happens it is not correctly handling it anyway :(
> 
> This stuff is exactly why I proposed converting all this into the
> "proper" BlockAIOCB approach (see [1]), but it need a little more work.
> 
> I'll v2 this with a fix for this! Thanks!
> 
> 
>    [1]: https://lore.kernel.org/qemu-devel/20210302111040.289244-1-its@irrelevant.dk/

OK, thanks! :)

That rewrite does look more in-line with how AIO is handled elsewhere, yes.

Max


