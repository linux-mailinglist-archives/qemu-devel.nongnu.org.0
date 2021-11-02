Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF18442DD7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:27:54 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhstN-0006N1-5o
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs5a-0003V4-MQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs5Z-0006g4-AI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635852984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMYX/NixTTvLU068QKvpywY5ID2Zsu5qmHJtI7h8voY=;
 b=cdtqflH5HZfCCwjAPoxColH+kEyNpanzBXZH+6//U3eWdpOQK+4jvU/O1iM/g/aKqknfjk
 HlUybnRYByX2pp/i8EEqAUArzQXfXJ7FS/qtT0K3J8MEPKztVDrp8tp+IVTbYFbWHGbwOw
 /nMVfY35XJwKLObk0Xojz0BbNwxvrAg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-O-bJFniKMo-yQqBesd28dQ-1; Tue, 02 Nov 2021 07:36:23 -0400
X-MC-Unique: O-bJFniKMo-yQqBesd28dQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 r25-20020a05640216d900b003dca3501ab4so18452955edx.15
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FMYX/NixTTvLU068QKvpywY5ID2Zsu5qmHJtI7h8voY=;
 b=d4K7+nuQdnC92mOOpksIiRka398/UAjMVpQRxV4qJ49Z9xvA6Vgn6vz6Ie7kalKLmy
 PNEwacnRWVIs3ZXH7f83UddK6mYSpkGChLhahbdRWrRdpzz8RDptvsVdKI1uQldecVvx
 AJHJTfju8E9XlFdjxTSjpJJG9+7cMjV4jCQVhRJQK/mv8zyPWh5EW6/5uKWC96cHFtc/
 IzW2QTy5j/r2O3/pvtGL4HJEpl3vFPL/OF75wl7YljDuNSg4rpL8dShGxb0mL+nMNuV3
 D9ITHxTqtZuDxPYYqQVm5zHo9zGnJR/8aw12ljRUZJM83+GQEZnYy1APKNVgOIZYc5xO
 WAGw==
X-Gm-Message-State: AOAM530z/KM6O036AtESrEKAsXTFg4UI2PMJ8glwbzqOACN56hAMu6kQ
 7pkMa4O8KpzCQxRapwkGfFWek8VkM/7uD50b+oKW1aMYpyG9u9mJUo6e6p1lAM9LtDfSbZH1jpu
 sw8qxp2MsnOcQfkE=
X-Received: by 2002:a05:6402:b04:: with SMTP id
 bm4mr37235855edb.173.1635852982083; 
 Tue, 02 Nov 2021 04:36:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN2McaQ21lCEvKotIqQkq6P5LXATIJY2GZC7mIL49k7OiQlQmQy6vt5/4dzQ1U7dfZrmPWzg==
X-Received: by 2002:a05:6402:b04:: with SMTP id
 bm4mr37235830edb.173.1635852981875; 
 Tue, 02 Nov 2021 04:36:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h7sm10315285edt.37.2021.11.02.04.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:36:21 -0700 (PDT)
Message-ID: <2fdd832f-5fc8-6547-70a8-77478bb6cda8@redhat.com>
Date: Tue, 2 Nov 2021 12:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/4] Move the libssh setup from configure to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-5-thuth@redhat.com>
 <7392e626-93b1-76f8-b7b7-b08af277d70f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7392e626-93b1-76f8-b7b7-b08af277d70f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/10/21 08:09, Thomas Huth wrote:
> diff --git a/meson.build b/meson.build
> --- a/meson.build
> +++ b/meson.build
> @@ -1467,6 +1467,7 @@ config_host_data.set('CONFIG_EBPF', libbpf.found())
>   config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
>   config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>   config_host_data.set('CONFIG_LIBNFS', libnfs.found())
> +config_host_data.set('CONFIG_LIBSSH', libssh.found())
>   config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
>   config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
>   config_host_data.set('CONFIG_LIBPMEM', libpmem.found())

Queued, thanks.

Paolo


