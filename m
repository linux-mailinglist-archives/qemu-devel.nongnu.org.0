Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8267734C257
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 05:59:32 +0200 (CEST)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQj3r-0004zh-L0
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 23:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lQj2l-0004C7-W3
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:58:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lQj2j-0003J1-Pk
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616990300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuoOYyGr2K2fWw7Jd9iqWpPTRSa6jBbTMz78mJCzm7c=;
 b=Zgb8VRMQ6vBXiYxFeOETUT4KuhcZX8qdzMFSA2SZzLKarmxtyp2ylaw/KK6EwAQCrQnWsa
 P3ACKprd8AJuwkKDrhqcxf6CKwTNz29HDICf6h0jVN6WYXEWjcBgYKa4RsqTfMdS/k1TJz
 j9AGWaVDkbvL6wyOyYSSOzpx7030Cp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-ZKbK-sg2Om2sheCqRI-59g-1; Sun, 28 Mar 2021 23:58:17 -0400
X-MC-Unique: ZKbK-sg2Om2sheCqRI-59g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5521D1005D5A;
 Mon, 29 Mar 2021 03:58:16 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-175.pek2.redhat.com
 [10.72.13.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6791F1037E91;
 Mon, 29 Mar 2021 03:58:15 +0000 (UTC)
Subject: Re: [PATCH] tap-bsd: Remove special casing for older OpenBSD releases
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
 <8571b8c8-f3ed-ef67-6ea3-2e6652a2e435@redhat.com>
 <1787bf01190.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <35befc6a-6167-1251-75ec-35e723b7547b@redhat.com>
Date: Mon, 29 Mar 2021 11:58:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1787bf01190.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/29 上午11:03, Brad Smith 写道:
> It very much is correct. We don't care about such releases anymore.


So is there a doc/wiki to say Qemu doesn't support those OpenBSD release?

Thanks


>
> On March 28, 2021 10:24:51 p.m. Jason Wang <jasowang@redhat.com> wrote:
>
>> 在 2021/3/27 上午7:49, Brad Smith 写道:
>>> OpenBSD added support for tap(4) 10 releases ago.
>>>
>>> Remove the special casing for older releases.
>>>
>>>
>>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>>
>>> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
>>> index 77aaf674b1..59dfcdfae0 100644
>>> --- a/net/tap-bsd.c
>>> +++ b/net/tap-bsd.c
>>> @@ -35,10 +35,6 @@
>>> #include <net/if_tap.h>
>>> #endif
>>>
>>> -#if defined(__OpenBSD__)
>>> -#include <sys/param.h>
>>> -#endif
>>> -
>>> #ifndef __FreeBSD__
>>> int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>>>        int vnet_hdr_required, int mq_required, Error **errp)
>>> @@ -59,11 +55,7 @@ int tap_open(char *ifname, int ifname_size, int 
>>> *vnet_hdr,
>>>   if (*ifname) {
>>>       snprintf(dname, sizeof dname, "/dev/%s", ifname);
>>>   } else {
>>> -#if defined(__OpenBSD__) && OpenBSD < 201605
>>
>>
>> I am not sure this sis correct. My understanding is that we still need
>> to use tun for old OpenBSD release.
>>
>> Thanks
>>
>>
>>> -            snprintf(dname, sizeof dname, "/dev/tun%d", i);
>>> -#else
>>>       snprintf(dname, sizeof dname, "/dev/tap%d", i);
>>> -#endif
>>>   }
>>>   TFR(fd = open(dname, O_RDWR));
>>>   if (fd >= 0) {
>>>
>
> Sent with Aqua Mail for Android 
> <https://play.google.com/store/apps/details?id=org.kman.AquaMail>
> https://www.mobisystems.com/aqua-mail 
> <https://www.mobisystems.com/aqua-mail>
>


