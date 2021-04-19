Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A2364AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:51:31 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZve-0006In-RY
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lYZST-00011K-4a
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lYZSO-0002Ec-RE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618860075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jct5d2kaKqR9hnZdtBEBVpNWQcfLfRCMfuNIfq86dmk=;
 b=ZE1tQAWt28Pwnb9Kh6ai6tArsoTjSrWpzT9zlXgE7gdZJRfMRAr/EoWJAuO1QOLv6sMnDG
 thNBQadHxgQSwRsIPJgbr+hGKYJTFxoElSdnVRUOww5UQfuDZ4TMaqkQTFBoPs6FruCREH
 incjXHtE4d30UEe2rr2Apcc+Pc4UR1c=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-E4-k_FAFOumjsm58urSn6A-1; Mon, 19 Apr 2021 15:21:13 -0400
X-MC-Unique: E4-k_FAFOumjsm58urSn6A-1
Received: by mail-oo1-f72.google.com with SMTP id
 f20-20020a4ada540000b02901ed9e4e045eso1458208oou.20
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jct5d2kaKqR9hnZdtBEBVpNWQcfLfRCMfuNIfq86dmk=;
 b=lz4BeUohhU6llgH36PKlcoKk5PvEXl6RY/d1XReFvKDg9ltRNHl40LLqwWqaheB8j7
 +rtyK8APqwB1Vo49ggOvnMXXjMLVosOGOwIoGeMUSSnVIJdJtr4cyUd4mjlOwH2xruKw
 kl8oyyb/UWufp+9LJSfLi/1N6k91LdwjfQzHscydbrNJgEtsWdUDSzUqjtl759d5EBWt
 4KHZCq4azIafbO2+pXjpikOEF0oLesM9LRR+A+QjU104/942KpP/CJQNcsTVg+TnNV8G
 ZDsQxvrc1f8bla8uVkGY3PTKTRNoxK5vSUB+T01b0l5c1MotamUxDKaNuJdwf7G8Xk9o
 Z6sQ==
X-Gm-Message-State: AOAM531/bSVSXa/neNUxESjj9YW6zgPxIAEvhtrYf56vAsIHSJRV2k+N
 /pDOR7PrxbyJZyKQrcX1egeJp0vIEnUNStT7m/SdbLry3IWX2a4Aj0avTOUIS0WClurjzBW3j3m
 REdtvlA0WzJXRaNQpUXYErmeYw+46x2ErZ2lsr4+kb2lnQXq7r2KhS93+u5+Rc7oV
X-Received: by 2002:aca:4b44:: with SMTP id y65mr450326oia.53.1618860072665;
 Mon, 19 Apr 2021 12:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsE/6hSN/GlDYgks72HEZdX2Jx5imeTL+p4Ngd4KPCku7GioJWaZ4LlyP/caL1l5sT1fadCA==
X-Received: by 2002:aca:4b44:: with SMTP id y65mr450312oia.53.1618860072484;
 Mon, 19 Apr 2021 12:21:12 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 w193sm3400038oiw.56.2021.04.19.12.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 12:21:12 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH 2/2] virtiofsd: Add help for -o xattr-mapping
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210414201207.3612432-3-jose.carlos.venegas.munoz@intel.com>
 <CANRX0ORJA43.22ADKWIJW7DI0@redhat> <20210419190753.GE1472665@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <81c49957-0287-37f9-e310-5f9f21d03062@redhat.com>
Date: Mon, 19 Apr 2021 14:21:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419190753.GE1472665@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
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
Cc: virtio-fs@redhat.com, Carlos Venegas <jose.carlos.venegas.munoz@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 2:07 PM, Vivek Goyal wrote:
>> This is a helpful note, but it doesn't tell the whole story. I think
>> it'd be helpful to add one last note to this option which is to
>> recommend reading the virtiofsd(1) man-page for more information on
>> xattrmap rules.
> 
> Is there a virtiofsd man page as well? All I see is
> docs/tools/virtiofsd.rst.

Yes, it's generated from that file. Should be located in
qemu/build/docs/virtiofsd.1 after building QEMU.

Connor


