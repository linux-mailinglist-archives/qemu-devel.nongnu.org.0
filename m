Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBFF3D2BCA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:16:13 +0200 (CEST)
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dEy-0004Rx-OW
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6dCQ-0002Nw-BT
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6dCN-0007ZW-76
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626977609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BTHmwlLg8rzOs58wG9G8p+t8P3DTtmJYEx1Y/x30UY=;
 b=D1G1n3zBjcRGi6O+XGQEm3sdosHqUgKkqYYfaBvcIawhrCXMuy6oswTuslu0+I8OJrK1t/
 HiXSDebXR/auAZzk9QxkKlD4mDZeyfSO3sylh5TkakFA8Rpco6N7KFGgb2+kogPJoEqWKO
 78HZJfrbEViV1MwroJkv8w+Pq23s2TI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-4kZGkrgSNcuAtzy4GVZuIg-1; Thu, 22 Jul 2021 14:13:28 -0400
X-MC-Unique: 4kZGkrgSNcuAtzy4GVZuIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r2-20020a05600c35c2b029023a3f081487so89260wmq.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 11:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/BTHmwlLg8rzOs58wG9G8p+t8P3DTtmJYEx1Y/x30UY=;
 b=TAi1agiOA4fjF2Siph5P6PPydKYYM6A6JqXEIanA/c7GMVPQrPO78N6/HHzhJwAy+a
 6g23L8yxM3ONuNEO+gvuAXurQ3i4i2oGaiVun/wHkO7Fg6YZm/g8vLG8w98ulIYkUKs4
 Xb9YK5VYy3MEMwH7/o3EHFK7DMnkB5h6JV9S3HOf93rEL6ihBUtu++RzP3yVI7AZwFnp
 nEMXBz5hMRqeeiB35ZMrerCV+igVV5+o0aRo37URkxicxus62K50w5XHBjYB5+KDEHY0
 jEA0SF6pnlnT9qr9nLFYZv6IbQn9fG02nbj5DR6n6U2HEOngCuqTLWBysN5UWyrprly7
 1G6Q==
X-Gm-Message-State: AOAM531sue8Jsqw1Kyw+Dw1ackq7pA1zgk1Foubi7PM5WojQXZ6OUCeq
 rk3i0NA86ZJkKUBNt6NPreyUtU3e7jBHma8PP5kqyfFcCkSVYAIz7QrqyOlclmMTpBehfP4R7Y9
 Qa/czCxxczAxLmfQ=
X-Received: by 2002:a7b:c193:: with SMTP id y19mr10643737wmi.86.1626977605746; 
 Thu, 22 Jul 2021 11:13:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyulSYJgb3/k4HKQbuw4B0nmGxUUSHBUCukZfczMdg9Azx3aQsnX9qXjVWBKdnlycyk68GL6Q==
X-Received: by 2002:a7b:c193:: with SMTP id y19mr10643715wmi.86.1626977605513; 
 Thu, 22 Jul 2021 11:13:25 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.2.134])
 by smtp.gmail.com with ESMTPSA id a7sm20615540wru.67.2021.07.22.11.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 11:13:25 -0700 (PDT)
Subject: Re: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on
 multifunction bridges
To: Igor Mammedov <imammedo@redhat.com>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-3-imammedo@redhat.com>
 <20210722133738-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <6c69b3b6-f1f0-da38-d47a-dba01e33bd6a@redhat.com>
Date: Thu, 22 Jul 2021 20:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722133738-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, jusual@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2021 19:49, Michael S. Tsirkin wrote:
> On Thu, Jul 22, 2021 at 06:59:45AM -0400, Igor Mammedov wrote:
...
>>
>> Fixes: 17858a169508609ca9063c544833e5a1adeb7b52
> 
> use short hash and include subject within ("subject here") please

Tips:

some people use

.gitconfig

  [pretty]
          fixes = Fixes: %h (\"%s\")%nCc: %aE
  [alias]
          showfix = log -1 --format=fixes

$ git showfix 17858a169508609ca9063c544833e5a1adeb7b52
Fixes: 17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
Cc: jusual@redhat.com

Thanks,
Laurent


