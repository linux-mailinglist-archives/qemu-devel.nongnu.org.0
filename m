Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35EF3344D0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:08:01 +0100 (CET)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2JU-0005qE-29
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK1z8-0005nz-10
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK1z0-0002A3-3n
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615394805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Orh/zQFhBhlRE5QwXv91qAzvLVepOVtsm3LevMuOxdQ=;
 b=Is1g6LHXScZ1P0av+dRScnoQZqQEnb5o6uxmj22iIGlWZTY0s/5o2eul1snSPOaCvNvR2t
 1ZTQ+XzcuXIzD2LywCISIogH0wJoWRWzWc34+87/tpIZVehwz6fuGASmlfbkZeV8sCAdfA
 ty263x2VfWcPCT2vp1VXgI+ZvpNMNNU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-9t7mrRtQMoKlM1fOa6i-cA-1; Wed, 10 Mar 2021 11:46:43 -0500
X-MC-Unique: 9t7mrRtQMoKlM1fOa6i-cA-1
Received: by mail-wr1-f69.google.com with SMTP id 75so8173191wrl.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Orh/zQFhBhlRE5QwXv91qAzvLVepOVtsm3LevMuOxdQ=;
 b=pTNOtvvJV2TACjN0ZGEkWIhAIcsLdzZLwqUZuF3D6zVrKhpYoYeZx+oTwHbJGIFobU
 RLE0c9ZvjRLF/bafgHVCRxMZheCp9vkLHGtevKBrrYKeXeO5V/AnTjq9YglcYroBjigk
 iQsxBC2Bx7bTxG4QftWOxpgLnVvaXR4z78XiXeuuJJD+Hc3R2uqpLUiSgxI9QHChzsYD
 LeKN1ql/uqKSD1gjRVXJUqb8s5eVLu7ZfrnylJSvYaGmceefTNHH1v1hPcYsDSppCY5Z
 koMuO0dLRCr6TTtsruhGpVcItdGvQfmr0+nxrl86JdD3ii5EVQX0zfJTy/zfg56M1vWo
 1kEA==
X-Gm-Message-State: AOAM530J8HrC36HDjzpEaBS1TO8ozefMg7vr/y8uQAckfEXo8DMVABRj
 4DjwnQrSor+r+2K3Po134vjpYBeHkUeDo2q7Lun0RZEvzM/FVCoqSs2jjwqFCciiTHiNF/X+zIQ
 3fT4v8MS5nxqagXI=
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr4136484wmh.83.1615394802633; 
 Wed, 10 Mar 2021 08:46:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBUtOQAzJr6ZCmg2a8K/4+5UV5sSPMuXdikq1lwn/CtcQNHXTNHXgh09qPEdnKVrToO46k3A==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr4136469wmh.83.1615394802411; 
 Wed, 10 Mar 2021 08:46:42 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id p16sm34961664wrt.54.2021.03.10.08.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:46:42 -0800 (PST)
Date: Wed, 10 Mar 2021 17:46:39 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 3/7] net/eth: Make ip6_ext_hdr *ext_hdr pointer to const
Message-ID: <20210310164639.qka4kalklqy7a7qg@steredhat>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310160135.1148272-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 05:01:31PM +0100, Philippe Mathieu-Daudé wrote:
>As the callee doesn't need to modify the ext_hdr buffer,
>mark it const.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/net/eth.c b/net/eth.c
>index 6a5a1d04e0b..7c47a267a7a 100644
>--- a/net/eth.c
>+++ b/net/eth.c
>@@ -402,7 +402,7 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
> static bool
> _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>                         size_t ext_hdr_offset,
>-                        struct ip6_ext_hdr *ext_hdr,
>+                        const struct ip6_ext_hdr *ext_hdr,
>                         struct in6_address *dst_addr)
> {
>     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
>-- 
>2.26.2
>

This patch is fine, but after the last patch of this series, 'ext_hdr' 
is not used anymore, so what about removing this parameter?

Thanks,
Stefano


