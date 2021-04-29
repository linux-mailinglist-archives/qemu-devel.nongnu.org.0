Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93736E965
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:11:40 +0200 (CEST)
Received: from localhost ([::1]:39768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4a3-0001u4-Ns
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lc4Uz-0006tx-4r
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lc4Ux-00089w-Ba
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619694382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDwZFxBkzjikrNYs5vD9D1+qCm/pu4/9vTzs6FavXlM=;
 b=EMhtVPQ7MjgvtTe2ml7haR/f7NI3zeyq8+5iXHML9dkWURxUq5+L0X0L/aKI2H0KLUGZkc
 fZu86ryebjqdEuylWvsLOpw02TQC37fqCQOj1UELXAfv4Lc+JVD5mKFgiOLyMg1SKO7iL8
 8UINro+cuCZvg3/ubD32zYGBguvdZH0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-yFf4K3iHMTK2XIRrb4AiRA-1; Thu, 29 Apr 2021 07:06:15 -0400
X-MC-Unique: yFf4K3iHMTK2XIRrb4AiRA-1
Received: by mail-ej1-f72.google.com with SMTP id
 bi3-20020a170906a243b02903933c4d9132so1802081ejb.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 04:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zDwZFxBkzjikrNYs5vD9D1+qCm/pu4/9vTzs6FavXlM=;
 b=pvOtcifyrJ+s18wVpeWMOYIdCIU4LXWra8t8lSb8o+X59T3TgRvxhmy/69LYF4tqhB
 /B/sMprqPHOubUvdtwkxW1Py4GmnoNJHelLNUIHQqII4XsCSFeUr6YpU4bTaefSFhQrx
 127+T1Yp7mxbW0a84lduC/xOiVRgxbArrNzG6Az1gbUMA1OKo3xkLtPhNK+gjDXmsFCc
 ydr8u5rz/MrEtHZ/M1I9PbSQ4s1qEf9Q/nNHxSj1qAXbDHNbF42qaKkFR4Ein/qOdt30
 q+WYxHdQEpMuX4cyWB29nE7UOt9CzXLwsPN5ZhWdTmst2SS+tWbNO1qH5DxTMdELkIlU
 chHA==
X-Gm-Message-State: AOAM532PoN1CBei69yXCwHUAQUovWOSRANZadGi2NxVVs7VWwWi5TU0h
 tnqjX3qjtEb7MoPTc3ylsXBWDsOj2QViD/Kx3C+CvschppIHl9W5b1oUA324rZH1w6Dw+Pxr65d
 6+32YUeCaxjOUl8w=
X-Received: by 2002:a05:6402:3513:: with SMTP id
 b19mr17301410edd.368.1619694374692; 
 Thu, 29 Apr 2021 04:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5GbePpJ0aFFZ2/bcqnjqWD73IblOh/pkJo9Utk9OXa5idrmwHk0dmZvYfz4Sjfb1NE0oeJA==
X-Received: by 2002:a05:6402:3513:: with SMTP id
 b19mr17301391edd.368.1619694374495; 
 Thu, 29 Apr 2021 04:06:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j10sm1615738ejk.93.2021.04.29.04.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 04:06:14 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
Date: Thu, 29 Apr 2021 13:06:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/21 11:59, Markus Armbruster wrote:
> Gerd Hoffmann:
> 
>      Creating sound card devices using ``-soundhw`` (since 5.1)
>      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>      Sound card devices should be created using ``-device`` instead.  The
>      names are the same for most devices.  The exceptions are ``hda`` which
>      needs two devices (``-device intel-hda -device hda-duplex``) and
>      ``pcspk`` which can be activated using ``-machine
>      pcspk-audiodev=<name>``.

For this to go away, I'd rather have something like the -nic option that 
provides an easy way to set up the front end and back end.

In other words you would do something like -audiohw 
<audiodev-args>,model=xxx and it gets desugared automatically to either

    -audiodev <audiodev-args>,id=foo -device devname,audiodev=xxx

or

    -audiodev <audiodev-args>,id=foo -M propname=foo

Paolo


