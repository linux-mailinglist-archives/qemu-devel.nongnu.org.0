Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115933AD15
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:10:18 +0100 (CET)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiIr-000689-LG
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLiGD-0003Ld-In
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:07:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLiG9-0001LT-D3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 04:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615795648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/2hrmzhDJI2WI3O0oa55uJ8Q+qMLvZYMPXe0+hBwSg=;
 b=Mw7/BF01+H/y9EFMtjJOKDQfXmAbEWFixh65nLavkq0Tonz0RkLNw7/wnVjzIfVFuYodOC
 i6+5ZSDNoaE9SxqeRHsq2VpRhX1oMh5UHUXyc6+vQrsTmOpPXvpq3kn+Qro63i9IVsI0ep
 Cj9FsaWatSgs/6qOlBYy4r4RtAYhyoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-e9UwV-BDP1WhP1hx-h575Q-1; Mon, 15 Mar 2021 04:07:25 -0400
X-MC-Unique: e9UwV-BDP1WhP1hx-h575Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BC53193249E;
 Mon, 15 Mar 2021 08:07:24 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-245.pek2.redhat.com
 [10.72.12.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6B7A5D9C0;
 Mon, 15 Mar 2021 08:07:22 +0000 (UTC)
Subject: Re: [PULL 00/16] Net patches
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
 <CAFEAcA-fMR8yLC6Y=HSYgpSOrffCYSNnf-0sDQ2RrNWrQff6Ng@mail.gmail.com>
 <113ed7aa-8999-b925-3df3-2a8d7cd2ad84@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <070ebd11-95e7-93ca-0106-f5a4735fbbd3@redhat.com>
Date: Mon, 15 Mar 2021 16:07:20 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <113ed7aa-8999-b925-3df3-2a8d7cd2ad84@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/15 下午1:39, Thomas Huth 写道:
> On 14/03/2021 12.37, Peter Maydell wrote:
>> On Fri, 12 Mar 2021 at 06:16, Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> The following changes since commit 
>>> f4abdf32714d1845b7c01ec136dd2b04c2f7db47:
>>>
>>>    Merge remote-tracking branch 
>>> 'remotes/stsquad/tags/pull-testing-docs-xen-updates-100321-2' into 
>>> staging (2021-03-11 16:20:58 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>>
>>> for you to fetch changes up to 
>>> 9bdb56367679e68e5e71a1c29a1087bda6414b25:
>>>
>>>    pvrdma: wean code off pvrdma_ring.h kernel header (2021-03-12 
>>> 14:08:31 +0800)
>>>
>>> ----------------------------------------------------------------
>>>
>>
>> Hi; this has a merge conflict in net/nic.c relating to
>> ID generation: it looks like
>> "net: unbreak well-form id check for "-nic" (in this pullreq)
>
> Uh, I haven't seen that patch on the list, when did you send it?


My bad, I thought I sent it but it looks not.


>
> Also what about:
>
>  https://patchew.org/QEMU/20210303095910.78277-1-lekiravi@yandex-team.ru/
>
> ... that has been on the list since quite a while already and should 
> maybe go into v6.0, too?


Yes.

Thanks


>
>  Thomas


