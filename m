Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FE44D2BC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:52:55 +0100 (CET)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4tC-0002fF-Tx
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml4rq-0000le-Fo
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:51:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml4ro-0000mZ-No
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636617088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kGxBq/dF+CtbsQkrRrsj2PTPS/6/6R6Hlkqkw+esJE=;
 b=g5Xw4zrvCOBQfaUq0pZZ6XDW7Ecy6nYTLAP5djAdh8OjWawXcgQbu2AaRarkTzWC04dc8t
 peUWY/e2m0AXLJkudPW7kqmSi4Of5yY83A9A84yksKmG0YjTXjzyXPMLsc+gkkBE/quHDu
 kgdTGtjAWNy42LeiYWJPrWRZgF1c0zo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-9IiAjU3_OYSeAEeJfq4hQA-1; Thu, 11 Nov 2021 02:51:24 -0500
X-MC-Unique: 9IiAjU3_OYSeAEeJfq4hQA-1
Received: by mail-wm1-f69.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so4377789wmd.1
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8kGxBq/dF+CtbsQkrRrsj2PTPS/6/6R6Hlkqkw+esJE=;
 b=0xCn6NHA2LL9qAF4Dk/kIYZpT4Yx/y/uln4j/9t6m1W8KOx2b14PVgero0JIs6mx0W
 GujmRXWZM6zkJOB2gyCmTsDJyKZCwfaZD62heD0LHGjmKX+PKouoJQKS9UW3TWYDKTZB
 +djXaUGMrtBSghapnQ9pVLBLzDbTImmj1/sRNPWYZTjQC7NRZuErKtXG5dXIpKcGziyX
 NwJPbA/rjkI3on85noL/1Y13afdFk0FlDUhCQrnVmxK3EzeON06YBXwlQ8YrM4XBp6/z
 dv//gHhxCCYLZRxraa0KADGX1SwvEh0T60PhmnsmVpIc6fi4VoqCioPchKmuM5AaPIV7
 v2zw==
X-Gm-Message-State: AOAM5331RK/MekgQdZHeAt1T+IJy0BIH8f34duRgRoRRiCvx5RPBeBa7
 0Nwg+IzcJ7TykrYgzsOiW2Bczf30Ntsj7QaxikgG8L2sZijUuDPViqz9FBEHjonrM8jH4g1xXjQ
 vZr5nB0WtV40Xx5s=
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr6734932wrs.266.1636617083727; 
 Wed, 10 Nov 2021 23:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT29kPU5RQpZhB8/qKpRaGZTbGEUtkpTnvR8PkKzREJ7cs7CHIPZbvq6OPeU7Spbax8GZVMA==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr6734906wrs.266.1636617083536; 
 Wed, 10 Nov 2021 23:51:23 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d9sm2022577wre.52.2021.11.10.23.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 23:51:23 -0800 (PST)
Message-ID: <cc07cc4c-38a3-9bf1-b16a-51c9ea4e0c5f@redhat.com>
Date: Thu, 11 Nov 2021 08:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] virtio: use virtio accessor to access packed
 descriptor flags
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20211111063854.29060-1-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111063854.29060-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 07:38, Jason Wang wrote:
> We used to access packed descriptor flags via
> address_space_{write|read}_cached(). When we hit the cache, memcpy()
> is used which is not an atomic operation which may lead a wrong value
> is read or wrote.
> 
> So this patch switches to use virito_{stw|lduw}_phys_cached() to make
> sure the aceess is atomic.
> 
> Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/virtio.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


