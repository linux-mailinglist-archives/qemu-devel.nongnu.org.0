Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5FA4B99E1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:34:53 +0100 (CET)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbJS-0005NS-HK
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:34:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbGn-0004g3-C3
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:32:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbGi-0001xa-Mm
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645083118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fB9/Luj5DjULKBnRypebVUVbX6jLdsH7uFOM58/mVyw=;
 b=DcvLXLelpLtv8d8mqFShJe/mABnmOOjryen9O3/b7dfNzGElBxnW8bSoKcRRB6LIWcXDyk
 Rz6ME1KhyPcyhHyRoJJdEESpQGIOqzaXjpJAqphJIVSuaHHN60Mm5uL2RaTv9ArKAqTg9L
 hnyU0QHXs+pwAD3BdaNv0jy/M4/Sbcs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-4PXrTDTGP22GwMxWR9TKjQ-1; Thu, 17 Feb 2022 02:31:57 -0500
X-MC-Unique: 4PXrTDTGP22GwMxWR9TKjQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b001e33a1c56f3so1916364wrb.20
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 23:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fB9/Luj5DjULKBnRypebVUVbX6jLdsH7uFOM58/mVyw=;
 b=p2QPj/B1qpBttBxqe0uOWW4mwsX9nN4OqLBI3WyeSrcZS2sxtl2xfSEU9k6z3I1W+T
 UDpuNb39bJzcUDZ7mecM+mPFjFRgv6gr5QbL3qmOz6g6luesnsobuCBr2lDW9UFv+qZA
 pGODlcWr4Hrn3ZM+eI+r35eCDk0NH8kh1Oi4b8m4CPjA2860vZTCvzFFtHjFPjknmnYG
 0sSafFBw0PFBNjFUwO8VuJiUPCJ55F7XWOqBh+WjBgLqgCDStePjNDVHZ+4xLLR4gR1M
 UbqmVFopi8c3BygRYg6CvLo8W2DkRVmhRMO73l4DOqMre/bhCeZMw5AWmRJH4fYLZa5+
 ruPg==
X-Gm-Message-State: AOAM532Z0DKecVMMMvwUWxauwBesfzv34XpVovYlg4CrfHRSIe0gZ+uq
 uPGZ4mw43/bLWY6uTJrEHdMiNFqVGVqGau4NHfCHHbgirhBulkpE5gx7/CQlq6VLsaUKeGX8EyW
 Nj/UMTovQkRM2lq4=
X-Received: by 2002:adf:d082:0:b0:1e3:16e2:d611 with SMTP id
 y2-20020adfd082000000b001e316e2d611mr1283330wrh.716.1645083116470; 
 Wed, 16 Feb 2022 23:31:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxcERVv3D5ZpLE5kRxeAB91jZfDV++7pk6e5ywhME1Wr5F9tZmA9OhBuzwMqz0BJTjv1tcfw==
X-Received: by 2002:adf:d082:0:b0:1e3:16e2:d611 with SMTP id
 y2-20020adfd082000000b001e316e2d611mr1283312wrh.716.1645083116248; 
 Wed, 16 Feb 2022 23:31:56 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id e3sm31369020wrr.94.2022.02.16.23.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 23:31:55 -0800 (PST)
Message-ID: <3321e10a-7778-918d-8583-d545e388ea5d@redhat.com>
Date: Thu, 17 Feb 2022 08:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: QEMU's Haiku CI image
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
 <777cb005f1c2197ff3fd610f89215b4d@unixzen.com>
 <0a36d4b2-965d-84ad-1e04-ab4cd8c437f1@redhat.com>
 <ea30ad98-8e15-7404-c91c-ec475551b866@amsat.org>
 <Yg1OrEqyDQm/ZGlm@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yg1OrEqyDQm/ZGlm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Zak <richard.j.zak@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 20.21, Daniel P. Berrangé wrote:
> [...] The main issue is that for non-Linux,
> we don't have full automation for building the VM templates. We need
> someone to prepare the image by getting it able to run and expose
> SSH, whereupon we can provision the build-deps.

That's easy: In QEMU build folder, type:

  make vm-build-netbsd
  make vm-build-openbsd
  make vm-build-haiku.x86_64

... and then you can find the images in the ~/.cache/qemu-vm/images/ folder.

  Thomas


