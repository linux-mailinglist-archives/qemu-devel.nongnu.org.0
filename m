Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E633322B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 01:08:07 +0100 (CET)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmOU-000443-PK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 19:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmNT-0003P8-OE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:07:03 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmNR-00082O-RM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:07:03 -0500
Received: by mail-ed1-x52d.google.com with SMTP id w9so24097532edt.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 16:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PrIJjUieMbzLc7izy+e/izvagzlBXlkVPMOD/AdlrHA=;
 b=tMQSnkRYmY2zMjTZPfSXYGOoyMEt5NIvXfQDxdFgeqjodQGtPNRayt0NHxhm9M950U
 pBLFWo8OifpBvO1cdPn5W0tUCPIDcvuXRYXvOp9fm+zqxaFZ9XW/xtXRr/1hUMrP9NTP
 zj0b240MUpy62zbmCJWOHak/pG+I2lwXHcoplGkX2d82nn2CrVzRlux/6tRA3fuobmcr
 k4Hjn5DnOMB0G9sYUcBjoauCPG+SoCfaZu7zG7a3XbCRZiWP/sTi6oWOCE/a4MBu60Y2
 YMK6B5ehGG17NMqJuX88ie/3Jo4m4Xo+qOYP46x3Fm5jCcvlW+SdyY/HjvCC9HXvl1YL
 rlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PrIJjUieMbzLc7izy+e/izvagzlBXlkVPMOD/AdlrHA=;
 b=uIZdrShwy49IPnBYTa04jracqNB6dAu5ePXPsdR6VqqxEiELsMiqIkxMpOrrpJK+2G
 c1f0bsiSECOg7g7ch6CzzEiJa5Thnooqbx2ZLirqLTm4fO0wrhccKrHMI43fAQIbfbh5
 jyfXtSIRMSk4PqXAM0t1/ZiIcX/KoPjb6xgIowjcsn5ITGJIjtyk1xzyJGNEy1AdEwCW
 q+6gB696P+Bjwg0A9zbF/xgy88XQuUXNO5TMcUn3W1L7io0w33IqzC3VPt5x0Lh9atzJ
 QAk9Zcte/QM9e5OgHgZHa+bqU6gA8BIzQ+fdxhBX/TDkvZvci6J1l4Icbd4c6bD3I3WP
 GWuw==
X-Gm-Message-State: AOAM531G5IFEzgr0cq6JzkBl3+8q3C08hDhgskmQkcHvHblb96BuJoTI
 C6U3V7xsOd1BHt+Xfdsbx78=
X-Google-Smtp-Source: ABdhPJz2sFkXZ+tpYcvSD0hZOPhZnngByjkXDGkiEHr2x7YCyZcqK7iFJK7EfpChGpt64u5sImr/sw==
X-Received: by 2002:a05:6402:b70:: with SMTP id
 cb16mr226818edb.11.1615334820157; 
 Tue, 09 Mar 2021 16:07:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hy25sm8971365ejc.119.2021.03.09.16.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 16:06:59 -0800 (PST)
Subject: Re: [PATCH 3/3] hw/usb: Extract VT82C686 UHCI PCI function into a new
 unit
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210309190802.830969-1-f4bug@amsat.org>
 <20210309190802.830969-4-f4bug@amsat.org>
 <4ffa2641-2b53-467-337d-38926c02b4b@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fd9c7195-1396-f622-4867-6dec8527dfd3@amsat.org>
Date: Wed, 10 Mar 2021 01:06:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4ffa2641-2b53-467-337d-38926c02b4b@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 9:13 PM, BALATON Zoltan wrote:
> On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
>> Extract the VT82C686 PCI UHCI function into a new unit so
>> it is only build when the VT82C686 south bridge is selected.
> 
> I'm not sure it's worth separating just this one device from the other
> similar usb devices when the others that are also part of south bridge
> chips are left there. Maybe you could just set user_creatable = false so
> it can only be created as part of the chips that contain it or just
> don't bother and leave it as it is which is the least likely to break
> anything that may rely on it as removing it from the device list may
> need to go through deprecation.
> 
> But I don't really mind, so if others like this approach I don't want to
> block the patch. I think it's unlikely anybody would use this device
> other than part of fuloong2e or pegasos2 so probably it's unlikely to
> break anything if it suddenly goes away from a new build.

OK. As I sent this series to help you with your Pegasos2 board, do you
mind sending a patch then?

I suppose you mean using "#include CONFIG_DEVICES" and checking for the
CONFIG_VT82C686 symbol to register the QOM type?

Thanks,

Phil.

