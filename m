Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D354024FC13
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 12:57:01 +0200 (CEST)
Received: from localhost ([::1]:51852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAA9s-000240-NW
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 06:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kAA9D-0001da-TK
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 06:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kAA9B-0005XL-5e
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 06:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598266575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+THSd0x6Ze/oGp/k4Xvhx+cUvgTJPUPudvWsDf4OBmY=;
 b=eyw9Sc1jlPc7gfsaQLulBgZHH0piQ07eFec5gxS0jLTTMbvyciVC/in9Oi8efYRp8ykC4N
 sbEFqxo/7wi1KgHxmOXAS0oXakgJkXsZcjSEphaM7z6aVnUX9rHBVXPBgMxrIpadxsh1s/
 Dw9K5MW47wVOpkuCe+C8VJKAPmtspwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-rv0-CNjKMxCCvU20xZwFCg-1; Mon, 24 Aug 2020 06:56:11 -0400
X-MC-Unique: rv0-CNjKMxCCvU20xZwFCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E65664087;
 Mon, 24 Aug 2020 10:56:10 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-186.ams2.redhat.com
 [10.36.112.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BEF05D9DD;
 Mon, 24 Aug 2020 10:56:09 +0000 (UTC)
Subject: Re: ANNOUNCE: build system conversion to Meson has landed
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA-87BcmoPjY9BCodx9+m6QmhfikHv5sLVJ8w20cszDvDA@mail.gmail.com>
 <be069d22-510c-7c5f-7b57-00e8abd0ba41@redhat.com>
 <74116413-bd9d-b1a3-2364-26b7dcc7f105@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <706cd245-f5a5-9d3d-5ed9-fa7642534305@redhat.com>
Date: Mon, 24 Aug 2020 12:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <74116413-bd9d-b1a3-2364-26b7dcc7f105@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 06:48:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.25, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/21/20 16:59, Paolo Bonzini wrote:
> On 21/08/20 16:50, Laszlo Ersek wrote:
>> On 08/21/20 15:49, Peter Maydell wrote:
>>
>>> https://wiki.qemu.org/Features/Meson/Next has a summary of changes
>>> and is worth a quick scan through.
>>
>> I'd like to propose a wording clarification:
>>
>> """
>> For bisection: incremental builds work fine in the forward direction.
>> They probably don't work at all backwards. This is mitigated by the fact
>> that bisection usually starts at a release, and the patches should be
>> applied on top of the 5.1.0 tag.
>> """
>>
>> namely:
>>
>> - s/forward direction/forward direction, across the conversion/
>> - s/backwards/backwards, across the conversion/
>>
>> Because the way the paragraph is worded now, it suggests that *any*
>> individual bisection step that moves backwards in the git history will
>> not build. That would be of course catastrophic. We should clarify that
>> the symptom is limited to steps that straddle the conversion commit range.
>>
>> If the suggested replacements are OK, I can make the edit myself (if
>> that's preferred).
>>
>> (Not trying to be a busybody -- exactly because I contribute little to
>> QEMU, bisection is a comparatively large part of what I *do* do with QEMU.)
> 
> That's fine! I made a small adjustment and you're free to improve
> further on the wording.

Thanks a lot, the new text reads great!
Laszlo


