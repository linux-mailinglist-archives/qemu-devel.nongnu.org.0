Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD9F31E611
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 06:56:44 +0100 (CET)
Received: from localhost ([::1]:39072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcIt-00046a-8P
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 00:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcFg-0001PA-A8
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcFc-0003tJ-9m
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613627598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJMppNCVpphb6zDgvzUTRl43NJbpP4LPQH/w42gPtu4=;
 b=i5ZAZ/74uH4EnyLzzOBIgkrn0yhr6XXFEdFwAaoVjUo9s6jykxg9HJaMhl2mIH99TBWuYA
 ntJe0cb+Jomd4xHjxnM/dKIGSfeNa2l8YSvy3kogRHjbdP79tT+hSxEf0m14hT2ASZIrEO
 ITmylUq6ue116Riu8+1NRlGSC68yBrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-6TUZkDViPrWdEsdvJVA0Kw-1; Thu, 18 Feb 2021 00:53:14 -0500
X-MC-Unique: 6TUZkDViPrWdEsdvJVA0Kw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A98107ACE3;
 Thu, 18 Feb 2021 05:53:12 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453675D72F;
 Thu, 18 Feb 2021 05:53:10 +0000 (UTC)
Subject: Re: [PATCH] net: e1000: check transmit descriptor field values
To: P J P <ppandit@redhat.com>
References: <20210210145258.143131-1-ppandit@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <86ea17a0-fd8b-53d5-f975-c55b19e9005d@redhat.com>
Date: Thu, 18 Feb 2021 13:53:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210145258.143131-1-ppandit@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/10 下午10:52, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> While processing transmit (tx) descriptors in process_tx_desc()
> various descriptor fields are not checked properly. This may lead
> to infinite loop like issue. Add checks to avoid them.
>
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>   hw/net/e1000.c | 6 ++++++
>   1 file changed, 6 insertions(+)


I guess you post the wrong patch :) ?

Thanks


>
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index d8da2f6528..15949a3d64 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -667,9 +667,11 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
>   
>       addr = le64_to_cpu(dp->buffer_addr);
>       if (tp->cptse) {
> +        assert(tp->tso_props.hdr_len);
>           msh = tp->tso_props.hdr_len + tp->tso_props.mss;
>           do {
>               bytes = split_size;
> +            assert(msh > tp->size);
>               if (tp->size + bytes > msh)
>                   bytes = msh - tp->size;
>   
> @@ -681,22 +683,26 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
>                   memmove(tp->header, tp->data, tp->tso_props.hdr_len);
>               }
>               tp->size = sz;
> +            assert(tp->size);   /* sz may get truncated */
>               addr += bytes;
>               if (sz == msh) {
>                   xmit_seg(s);
>                   memmove(tp->data, tp->header, tp->tso_props.hdr_len);
>                   tp->size = tp->tso_props.hdr_len;
>               }
> +            assert(split_size >= bytes);
>               split_size -= bytes;
>           } while (bytes && split_size);
>       } else {
>           split_size = MIN(sizeof(tp->data) - tp->size, split_size);
> +        assert(tp->size && split_size);
>           pci_dma_read(d, addr, tp->data + tp->size, split_size);
>           tp->size += split_size;
>       }
>   
>       if (!(txd_lower & E1000_TXD_CMD_EOP))
>           return;
> +    assert(tp->size && tp->tso_props.hdr_len);
>       if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
>           xmit_seg(s);
>       }


