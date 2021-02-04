Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45630EFD4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:39:43 +0100 (CET)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7b70-00075m-LW
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7b53-0006El-Ac
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:37:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7b51-00072a-IH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612431459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uISf0UDJjkR+Y2S5HImF/qSMyJr2kX9zJxuAGBC/MGc=;
 b=cYXC4jMLy25o5/h/HNhUEWTR7YlR32R6kmAdliqPWlFU6dYWsPaE6YH5bclB4mMRyF9oWE
 7q/a5XWQiELtJMHzHwXQqkJD9xK9/UzGe9hBrO6oarsQn/w14j6LLQoErdWHRtAKfyAsT+
 XXF6DK8EDePAgYlEsIsjvaJ6n99T8go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-Pyd3jIk3PQKYHSDxNuiaJg-1; Thu, 04 Feb 2021 04:37:37 -0500
X-MC-Unique: Pyd3jIk3PQKYHSDxNuiaJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45413835E24;
 Thu,  4 Feb 2021 09:37:36 +0000 (UTC)
Received: from [10.36.113.146] (ovpn-113-146.ams2.redhat.com [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7531810013C1;
 Thu,  4 Feb 2021 09:37:35 +0000 (UTC)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
 <20210204090351.GN30079@redhat.com> <20210204092916.GS27779@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
Date: Thu, 4 Feb 2021 10:37:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210204092916.GS27779@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.02.21 10:29, Richard W.M. Jones wrote:
>>> commit 8f17a975e60b773d7c366a81c0d9bbe304f30859
>>> Author: Richard Henderson <richard.henderson@linaro.org>
>>> Date:   Mon Mar 30 19:52:02 2020 -0700
>>>
>>>      tcg/optimize: Adjust TempOptInfo allocation
>>>
>>> The image boots just fine on s390x/TCG as well.
>>
>> Let me try this in a minute on my original test machine.
> 
> I got the wrong end of the stick as David pointed out in the other email.
> 
> However I did test things again this morning (all on s390 host), and
> current head (1ed9228f63ea4b) fails same as before ("mount" command
> fails).
> 
> Also I downloaded:
> 
>    https://dl.fedoraproject.org/pub/fedora-secondary/releases/33/Cloud/s390x/images/Fedora-Cloud-Base-33-1.2.s390x.qcow2
> 
> and booted it on 1ed9228f63ea4b using this command:
> 
>    $ ~/d/qemu/build/s390x-softmmu/qemu-system-s390x -machine accel=tcg -m 2048 -drive file=Fedora-Cloud-Base-33-1.2.s390x.qcow2,format=qcow2,if=virtio -serial stdio
> 
> Lots of core dumps inside the guest, same as David saw.
> 
> I then reset qemu back to 8f17a975e60b773d ("tcg/optimize: Adjust
> TempOptInfo allocation"), rebuilt qemu, tested the same command and
> cloud image, and that booted up much happier with no failures or core
> dumps.
> 
> Isn't it kind of weird that this would only affect an s390 host?  I
> don't understand why the host would make a difference if we're doing
> TCG.

I assume an existing BUG in the s390x TCG backend ... which makes it 
harder to debug :)

-- 
Thanks,

David / dhildenb


