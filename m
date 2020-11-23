Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E832BFE43
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 03:53:35 +0100 (CET)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh1yv-0003rR-Rk
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 21:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kh1xI-0003Nb-LP
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 21:51:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kh1xF-0002EC-53
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 21:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606099907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpiaZEn8i2YPh/EqssdzSSim+mReaxtD6cSmRWXww5Y=;
 b=JGrGzp4YlCfVsCLbAnD4xxTEXbJ3L/HX6D7tyh9Vxx4zEJK4mVltytLmRJmarnHTsu/60S
 BMamuKmf8bsxu0o1ODW18KWEvs9CmcRSzz6THpzvY7ox5PG6r5cVOtmBiUPMJtbebcZ3By
 gyfjUprKeEE7+4O7umJeAj4zZ5f1ey0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-BcUGJnfFMu6NS6IrtsJQew-1; Sun, 22 Nov 2020 21:51:41 -0500
X-MC-Unique: BcUGJnfFMu6NS6IrtsJQew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EB338735D5;
 Mon, 23 Nov 2020 02:51:40 +0000 (UTC)
Received: from [10.72.13.192] (ovpn-13-192.pek2.redhat.com [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2675D6D3;
 Mon, 23 Nov 2020 02:51:38 +0000 (UTC)
Subject: Re: [PATCH 1/1] /net/tap.c: Fix a memory leak
To: Peter Maydell <peter.maydell@linaro.org>, ruc_gongyuanjun@163.com
References: <20201122044426.13454-1-ruc_gongyuanjun@163.com>
 <CAFEAcA-Oc1JO-3H+mmjmhTuVLa89fMN8HgWHhnO8q5TpBg61MA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a66e14c4-1765-901d-c3aa-e6eaefad7c0a@redhat.com>
Date: Mon, 23 Nov 2020 10:51:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Oc1JO-3H+mmjmhTuVLa89fMN8HgWHhnO8q5TpBg61MA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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


On 2020/11/22 下午7:39, Peter Maydell wrote:
> On Sun, 22 Nov 2020 at 11:07, <ruc_gongyuanjun@163.com> wrote:
>> From: yuanjungong <ruc_gongyuanjun@163.com>
>>
>> Close fd before returning.
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1904486
>> Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
>> ---
>>   net/tap.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/net/tap.c b/net/tap.c
>> index c46ff66..fe95fa7 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -817,6 +817,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>           if (ret < 0) {
>>               error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>>                                name, fd);
>> +            close(fd);
>>               return -1;
>>           }
>>
>> @@ -831,6 +832,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>                            vhostfdname, vnet_hdr, fd, &err);
>>           if (err) {
>>               error_propagate(errp, err);
>> +            close(fd);
>>               return -1;
>>           }
>>       } else if (tap->has_fds) {
>> --
>> 2.17.1
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM


Applied.

Thanks


>


