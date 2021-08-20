Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7C3F2B2B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 13:25:47 +0200 (CEST)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH2eg-0007Gw-61
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 07:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH2dL-0006Yo-IB
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH2dI-0002Cp-4p
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629458659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ha1TH3VdW4tqBVsKGPjf1fVZMcJGf3xEAUU3pdGDC68=;
 b=O5l9uE2mOJ7vzi/UIbBOZG2lYRw1MhoV+ZaNSR/J7NCzrd2BisMhzdZmg2gJYXws4dZ+mC
 cj65w91tg7kbQobUc0r9PGICpl5kPJxh3yQ46dS8Ck7RuP22mHQ25JL40mYRyuk4R/vnEh
 Xi85rN/JVtqKjPIBKyEiRkRFIT++TjE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-TSTRDdlIMhau0RHUd5YisA-1; Fri, 20 Aug 2021 07:24:17 -0400
X-MC-Unique: TSTRDdlIMhau0RHUd5YisA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z186-20020a1c7ec30000b02902e6a27a9962so4692933wmc.3
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 04:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ha1TH3VdW4tqBVsKGPjf1fVZMcJGf3xEAUU3pdGDC68=;
 b=dp0Vcd1NeW6pxdGjh6KsMXXdAkteYmha/gmh1oFvP1iO79dWgQFScjnb8HlFyraQGA
 c7OS0igOCaf8OQ8NT/AoqAckaKu37LQhe1ToocVtWSA896NNqiQMvbYP8SPYgvmUyEZf
 Q15P6zHPEy7NFib2mfUVgt6RKNG87sE3pmyS8ac3q9cEqv9xHan2iPclbkzdXJ5AjK5l
 fzYpjSBBGNbr79T9Knn+WNGyyXogD93DtIZiclQHgZXnV9r9TGFlK92WtOfoPQBf9K74
 aJD1LW/5tEmsAriPe1k7SvGGRpxg8TTJ2vQ4W+GcclrP+/11TYw0PN6UveTtVHTCsjGk
 13ZQ==
X-Gm-Message-State: AOAM530grRaIVhgQvGpihua6jBoQr6HCtfakvXmgQtmFT17pck5yj9D6
 zDgO9SKNtIXSERtZ4wUG9hdjHMP1ZiFmQGwqdtWdFITQy32YRPlWwNM7nJKa4QhKCXUw5qGN4US
 DH6Y/777G4D4trXM=
X-Received: by 2002:a05:600c:1c1f:: with SMTP id
 j31mr3292556wms.66.1629458656713; 
 Fri, 20 Aug 2021 04:24:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwqYxpr+ir3dc/EW8QKdVyrtOAHYvyjO6O1Ud6YmZrhd+b8gEG0ZcqY/i8rofOz1EO/f2+eg==
X-Received: by 2002:a05:600c:1c1f:: with SMTP id
 j31mr3292540wms.66.1629458656544; 
 Fri, 20 Aug 2021 04:24:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e3sm5831406wrv.65.2021.08.20.04.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 04:24:16 -0700 (PDT)
Subject: Re: [PATCH 0/1] uas: add stream number sanity checks (maybe 6.1)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210818120505.1258262-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7146f749-2b0f-562f-479b-b5c06f2b4f4b@redhat.com>
Date: Fri, 20 Aug 2021 13:24:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818120505.1258262-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 2:05 PM, Gerd Hoffmann wrote:
> Security fix.  Sorry for the last-minute patch, I had completely
> forgotten this one until the CVE number for it arrived today.
> 
> Given that the classic usb storage device is way more popular than
> the uas (usb attached scsi) device the impact should be pretty low
> and we might consider to not screw up our release schedule for this.

So 6.1-rc5 or stable?


