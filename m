Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2D343A90
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 08:29:42 +0100 (CET)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOF0O-0000E7-Pn
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 03:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOEyv-0008CM-NZ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:28:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOEyj-0002mF-3s
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616398075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7o/vIjblQs3tvqBtlclidlNDCNtHmIolNQUXSBpT8U=;
 b=Ab/dO97ekNaQYP9mAr80EXXv6JA/mutv57Zf/XF+t1Pt9MzKKSNMj9AjSWDBkDg1FRRs/p
 9Pv1g6mUTTQldT7H7FU5D4bC6W6mfhBaX3BXC+0st6gB6N8Jv0D4ipTzSC3q3zaFhxYFmw
 MU6Jk38IhLpN69dMkUDEet9WOcEZKlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-36plDtzROmeA_VgP1cIAmQ-1; Mon, 22 Mar 2021 03:27:51 -0400
X-MC-Unique: 36plDtzROmeA_VgP1cIAmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24C0E91222;
 Mon, 22 Mar 2021 07:27:50 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-188.pek2.redhat.com
 [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 184E32B3BB;
 Mon, 22 Mar 2021 07:27:46 +0000 (UTC)
Subject: Re: [PATCH v6 0/7] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210310183123.1212612-1-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <82b18c58-ff82-52fc-00d2-8abc0b5d933b@redhat.com>
Date: Mon, 22 Mar 2021 15:27:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210310183123.1212612-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/11 上午2:31, Philippe Mathieu-Daudé 写道:
> I had a look at the patch from Miroslav trying to silence a
> compiler warning which in fact is a nasty bug. Here is a fix.
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html
>
> Since v5:
> - addressed Stefano's review comments:
> - add now patch fixing in6_address offset
>
> Since v4:
> - reworked again, tested it with Fedora Raw Hide
>
> Philippe Mathieu-Daudé (7):
>    net/eth: Use correct in6_address offset in _eth_get_rss_ex_dst_addr()
>    net/eth: Simplify _eth_get_rss_ex_dst_addr()
>    net/eth: Better describe _eth_get_rss_ex_dst_addr's offset argument
>    net/eth: Check size earlier in _eth_get_rss_ex_dst_addr()
>    net/eth: Check iovec has enough data earlier
>    net/eth: Read ip6_ext_hdr_routing buffer before accessing it
>    net/eth: Add an assert() and invert if() statement to simplify code
>
>   net/eth.c                      | 46 ++++++++++++++---------------
>   tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>   MAINTAINERS                    |  1 +
>   tests/qtest/meson.build        |  1 +
>   4 files changed, 78 insertions(+), 23 deletions(-)
>   create mode 100644 tests/qtest/fuzz-e1000e-test.c


Applied.

Thanks


>


