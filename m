Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92452B4580
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:06:49 +0100 (CET)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kef9c-0000Bq-N6
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef7v-0006xp-VM
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:05:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef7t-0004vw-9Y
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605535499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kte5nT7MyDmZySILHZjxxcYGyHAA12w2e/xAe+pB92A=;
 b=ItN4W5V0+dNWfCOGYn5mKrOuiW+iDsTbjiHPbKUnp1bQyeO2eNN+bdyBjuQu6mMd8z6RNQ
 3Fdf4Jhui9w+Bz7v2kw9M82y4xCMnhd2OY1RQ7x7W7at+xn8PAnThnJyMw6sn0ijWCM5kw
 Pl8n0w/KOaSZgMUML1ta8c+A4V4kxeE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-hAzf84tOPBGABQdRNOq-0A-1; Mon, 16 Nov 2020 09:04:55 -0500
X-MC-Unique: hAzf84tOPBGABQdRNOq-0A-1
Received: by mail-wm1-f69.google.com with SMTP id y187so10304151wmy.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 06:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kte5nT7MyDmZySILHZjxxcYGyHAA12w2e/xAe+pB92A=;
 b=sVUGa+k7HQGPt7tivpOcla3CYa+WcVZg/Vo0KI8QBf1kjEGAMEitRsaNHvD87hh0Tv
 oVWQzaTMOjDoHDLbgsj1HGIUcxxMsn9Y5vwI2bp9GUnBW0WDEAVxV75hc/WujpVhQDi4
 9q0G7VcUdbzrDEFpBqMPAp1UweCTchlVuFvsX/uGmKU4iP85/uuKdtUKp2x8FlTT9X7x
 /IDYxFeA0zXbTkT3pG+qKJrcRRXLQjYBlbPMlW6i/Igc2U9/y3slNSk5gHKvWgcmmyjv
 9xn2THrBxvcEdP/QuyFdQPRBPmCbgWj++ktZSfH0XKC9OqfM3UbtfZ5FT+TZwf223VP+
 DegA==
X-Gm-Message-State: AOAM533AUE/Ps/kQvLN+cG924606Sk2BmMfxpOKmADSVN5KJ8pukTeOZ
 lVdQXzr+rpAxiVyfmJ7h7PZjpbdOwwKzS6JObgFmGxuP+XsNO7W3T45db5kHUEdDaj2wDTb8swR
 Bqo1FIb8wvJeuy+A=
X-Received: by 2002:a5d:414e:: with SMTP id c14mr14229834wrq.256.1605535494084; 
 Mon, 16 Nov 2020 06:04:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPn+1myQjLrmaMB0TgDpImnkqgdcsZhScIaeKRHavYL+kku1ffKnRk7cJju6CMiUbZ6a5b0A==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr14229809wrq.256.1605535493905; 
 Mon, 16 Nov 2020 06:04:53 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id j8sm19201024wrx.11.2020.11.16.06.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 06:04:53 -0800 (PST)
Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, thuth@redhat.com
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
Date: Mon, 16 Nov 2020 15:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201115184903.1292715-10-ganqixin@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/20 7:48 PM, Gan Qixin wrote:
> The category of the u2f-passthru device is not set, put it into the 'usb'
> category.

I guess we discussed this with Thomas 1 or 2 years ago
but I don't remember. I think it was about using set_bits()
so devices can appear in multiple categories.

Gerd, do you know what is the point of the "usb" category for
management apps? This is a bus accepting multiple better
categorized devices (display, storage, input, network, sound).

Unrelated but multiple devices are related to SECURITY.
Maybe it is time to introduce the DEVICE_CATEGORY_SECURITY?

> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/u2f-passthru.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
> index ae00e93f35..000822f396 100644
> --- a/hw/usb/u2f-passthru.c
> +++ b/hw/usb/u2f-passthru.c
> @@ -534,6 +534,7 @@ static void u2f_passthru_class_init(ObjectClass *klass, void *data)
>      dc->desc = "QEMU U2F passthrough key";
>      dc->vmsd = &u2f_passthru_vmstate;
>      device_class_set_props(dc, u2f_passthru_properties);
> +    set_bit(DEVICE_CATEGORY_USB, dc->categories);
>  }
>  
>  static const TypeInfo u2f_key_passthru_info = {
> 


