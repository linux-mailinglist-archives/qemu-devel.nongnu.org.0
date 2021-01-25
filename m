Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233EB302193
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 06:09:33 +0100 (CET)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3u80-00053c-CV
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 00:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3u6X-0004Ts-Dp
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:07:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3u6U-00056C-FU
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611551272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8Q5CN2E6oXT1Me7jfVWZLqyVWcvIxzQ9fxcEk0ozww=;
 b=Est1/xQrQjhvIe3pZOvZVWl37N0IrWXz8Yio9mcFJMczHsRtI2iPbliQ+6BKVb+pRZuNFn
 6LI/9S8I7cIH/Ov6jpSqpAcA6sV4qwvTQQ1ycz3tgWMMRIy8lxDvOPmya20w/jOHke1Oy4
 mHZcf13CPQ/pD5W6vp58TVPqFiw2ljY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-WcVPBqgTNXGnCAn_pcac9Q-1; Mon, 25 Jan 2021 00:07:50 -0500
X-MC-Unique: WcVPBqgTNXGnCAn_pcac9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 117EDE757;
 Mon, 25 Jan 2021 05:07:49 +0000 (UTC)
Received: from [10.72.12.105] (ovpn-12-105.pek2.redhat.com [10.72.12.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF94460C17;
 Mon, 25 Jan 2021 05:07:44 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210115151126.3334333-1-philmd@redhat.com>
 <20210115151126.3334333-3-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <23d35fc5-b7f4-cc7d-247b-5d77f7489ed1@redhat.com>
Date: Mon, 25 Jan 2021 13:07:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115151126.3334333-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/15 下午11:11, Philippe Mathieu-Daudé wrote:
> QEMU fuzzer reported a buffer overflow in _eth_get_rss_ex_dst_addr()
> reproducible as:


Want to apply but it doesn't apply on master:

Applying: net/eth: Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()
error: sha1 information is lacking or useless (MAINTAINERS).
error: could not build fake ancestor
Patch failed at 0002 net/eth: Fix stack-buffer-overflow in 
_eth_get_rss_ex_dst_addr()

Thanks


