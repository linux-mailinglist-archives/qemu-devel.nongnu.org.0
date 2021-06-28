Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0893B5ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:23:53 +0200 (CEST)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrEu-00075P-1Z
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxrE9-0006RD-CQ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxrE4-0005de-Ai
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624886577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4H/+GgDBRBzbxgEr+HHGvfFrpWk85rCyKqZ/Fyc+bw=;
 b=Gc3WKaKejCYVvwK+7pYVnN8rVZKDgDBRnk2uwC+yQZj9LKHjltpKeVQg8JctGYvG9KjW9g
 hm16sOCn0HsnbeDK+n45bMErq/4mNfI0CGjDZichduz0drdfHyVBHEzml3Q3BnlEDoEZkN
 40W8qeux2QVg7/GL4ykW0eEAmSmmCgE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-51BridI7Ng6JpKXwlMFmBA-1; Mon, 28 Jun 2021 09:22:56 -0400
X-MC-Unique: 51BridI7Ng6JpKXwlMFmBA-1
Received: by mail-wr1-f72.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so710694wrm.14
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o4H/+GgDBRBzbxgEr+HHGvfFrpWk85rCyKqZ/Fyc+bw=;
 b=QhGYOhM6p/2o9+czHcGZQmZobILei38SPpGSekIczckf1pMN+f+zYhZalEjj095c+X
 o81O2lXw7pkVTPjIhFssoih2K3nOyy9/q/onIVGvlhwUEB+mPW7vQUtkaDPlOsNHZrlN
 t1p7eVPnEix+W+ulFLn/genVvsgheKLk6YKgXvyiyVkY5rTltspPDkd3GWIDin2brlBP
 CpLDiBPMOEdp+OwnewqFkpHUcs/SA/B180SHFveq4P00rXNWEasQxUSCRIbjr581+D58
 eSmsmrvQu00NRdXMXzngQhTXUj//AJxVf8u/Ll1fp5T7LFXgzLGNWJsScPpEyaf6kV+o
 52JQ==
X-Gm-Message-State: AOAM533gNFeCuXASqz0MQJjiH6Gfb0tTHjfdP2q7pTOZN7wxNEewkBjf
 4y+17s2eMevI6KbQQ7z1b9TbQF/gx0TMSTYvl06CmDfp+7KMKuhO1Xmjl5NDwZHBybzh2iPUdvP
 vnScpY49FSkjiVwrwgudW/nE/5koFMKRIFDEFXhNsYI/rRhh9nOphzfZ43Thk/VIX
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr27821399wry.145.1624886574567; 
 Mon, 28 Jun 2021 06:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI9xy2vQKYBGVQBEs1dYwI6J3kvaJ5iMm2IA89+VwwzNIELXKmHJdpQeS+/WNU3hNDSWX5ZQ==
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr27821379wry.145.1624886574334; 
 Mon, 28 Jun 2021 06:22:54 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c12sm14522990wrw.46.2021.06.28.06.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 06:22:53 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] crypto: Make QCryptoTLSCreds* structures private
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
References: <20210617121830.2776182-1-philmd@redhat.com>
 <60171e96-dbee-1510-0d09-13ec64b7229f@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5abbc39f-4213-c3e7-8f43-70fea6a2c00e@redhat.com>
Date: Mon, 28 Jun 2021 15:22:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <60171e96-dbee-1510-0d09-13ec64b7229f@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 5:56 AM, Akihiko Odaki wrote:
> Hi,
> 
> qemu-nbd.c still refers to members of QCryptoTLSCreds* and can't be
> compiled.

Thanks for testing, I'll have a look.

> 
> Regards,
> Akihiko Odaki
> 
> On 2021/06/17 21:18, Philippe Mathieu-Daudé wrote:
>> Missing review: 5 & 6
>>
>> Follow Daniel suggestion to simplify qcrypto TLS implementations,
>> aiming to solve the OSX build failure.


