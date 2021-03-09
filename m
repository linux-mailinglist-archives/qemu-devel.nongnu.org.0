Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D5332174
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:59:10 +0100 (CET)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYCr-0004yW-3H
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJYBQ-0004Qv-PD
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJYBO-0002cT-G9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615280256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUXFQoVHGjUBEY/vYiqbiS1wvuFs3JngItJR48wyIHE=;
 b=WGJ22+quu4lytDsPerXuxuoDXWMA2p4gwIYBQMY2g6SFvskLlh/Et48ejBE7XStiqIOqtM
 vTRXCSpDGbGEMmUBCCFR7/oet+6RLSiEjjau7bzRs0hl5hyD6y+HmJ0cJ5s80Ki8UxiH0t
 9lIR17g7D1CGzXJtacSLV93+/pjmzEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Q41eExQiO42n_Rm6HXCrPw-1; Tue, 09 Mar 2021 03:57:33 -0500
X-MC-Unique: Q41eExQiO42n_Rm6HXCrPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5CD3108BD06;
 Tue,  9 Mar 2021 08:57:31 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-195.pek2.redhat.com
 [10.72.12.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EB3B6F98E;
 Tue,  9 Mar 2021 08:57:26 +0000 (UTC)
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
Date: Tue, 9 Mar 2021 16:57:25 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/9 4:35 下午, Bin Meng wrote:
> Hi Jason,
>
> On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2021/3/8 6:22 下午, Peter Maydell wrote:
>>> On Mon, 8 Mar 2021 at 03:48, Jason Wang <jasowang@redhat.com> wrote:
>>>> Do we need to care about other type of networking backends? E.g socket.
>>>>
>>>> Or at least we should keep the padding logic if we can't audit all of
>>>> the backends.
>>> I think the key thing we need to do here is make a decision
>>> and be clear about what we're doing. There are three options
>>> I can see:
>>>
>>> (1) we say that the net API demands that backends pad
>>> packets they emit to the minimum ethernet frame length
>>> unless they specifically are intending to emit a short frame,
>>> and we fix any backends that don't comply (or equivalently,
>>> add support in the core code for a backend to mark itself
>>> as "I don't pad; please do it for me").
>>>
>>> (2) we say that the networking subsystem doesn't support
>>> short packets, and just have the common code always enforce
>>> padding short frames to the minimum length somewhere between
>>> when it receives a packet from a backend and passes it to
>>> a NIC model.
>>>
>>> (3) we say that it's the job of the NIC models to pad
>>> short frames as they see them coming in.
>>>
>>> I think (3) is pretty clearly the worst of these, since it
>>> requires every NIC model to handle it; it has no advantages
>>> over (2) that I can see. I don't have a strong take on whether
>>> we'd rather have (1) or (2): it's a tradeoff between whether
>>> we support modelling of short frames vs simplicity of code.
>>> I'd just like us to be clear about what point or points in
>>> the code have the responsibility for padding short frames.
>>
>> I'm not sure how much value we can gain from (1). So (2) looks better to me.
>>
>> Bin or Philippe, want to send a new version?
>>
> I think this series does what (2) asks for. Or am I missing anything?


It only did the padding for user/TAP.

Thanks


>
> Regards,
> Bin
>


