Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D112B47587C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:12:40 +0100 (CET)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxT9D-0000Fg-QL
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSaC-0002GS-Lm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSa9-0000vX-TS
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639568185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBidrX4UE+1AoEStb6IrVtKlEPmIih8ERXPw2DKfQ6k=;
 b=BiZZsOkV1h9Wbak/BdaR3bwB0fbLbsla/WjCBVROrwMteyf5NhAr9qpeoPKU1NlBiEOzpI
 6atz1UWW73LKAyVszJxjs68SRYswBHPDxbMaTdW23hfrHEk9fIoo9+dzlUilhrJ86W2cU1
 vQFknHjcwID9CZ4GV8482cIRKt2pzF0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-fBUkn-3eNwKgeKzKBZjutw-1; Wed, 15 Dec 2021 06:36:24 -0500
X-MC-Unique: fBUkn-3eNwKgeKzKBZjutw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso5810947wrj.12
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mBidrX4UE+1AoEStb6IrVtKlEPmIih8ERXPw2DKfQ6k=;
 b=WwMz0PrfZnio6R3HnhZugjKqsppXqpU87b3I+F6vkqcRUMRtS43rUkDjxbX5Rud9DE
 AwrQiMs24YVQ3yKFekEtXSFLsCKFje7GNWl+eM1AjaIRn6wDHtAWcssRokgZy4uvy8lP
 qGgbEld+DNgtkZeWNskwGoZbhNzVMlSKXQ8YbZcyLav++9qTwBT0PPF3HGRZYn0FD9+p
 xD8f5bGC36sAtGj2LE6WwKEE2JzMHu6lbQ/QDGOtvEchI3UOsA8JFBRy9EriRmPfNgJt
 np0WFD1Z8d2G/YGdPzoTzE4ARTRfRuI2ulQZS8OpDfQPEqMfOaBptObX8jlkxMYgdkLz
 pBBQ==
X-Gm-Message-State: AOAM5317fOxB+x+GiitUot12gJJtc8stvPWcTk6USn/VzWZ1ZqfcAc/z
 OKYdiSHFzr06TBWwXIPVR5iXBmtAsiEaeqhQK1BrIFFVdngS1ElNphdZFc2dzZGDpBGgOAOxg6X
 FtPCD1W6aBns+Jcw=
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr1805516wmk.11.1639568182895; 
 Wed, 15 Dec 2021 03:36:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr0q/HfPO5z5S998Gl5qV/Tm/PTMsQlhtVIoBES1i6lDmqe0eJvsKdyo48I6bdolcSHWp9eg==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr1805500wmk.11.1639568182751; 
 Wed, 15 Dec 2021 03:36:22 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a22sm1508034wme.19.2021.12.15.03.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:36:22 -0800 (PST)
Message-ID: <65e13254-65a0-3457-19e4-d7385c50c3e3@redhat.com>
Date: Wed, 15 Dec 2021 12:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 14/18] .gitlab-ci.d/cirrus: auto-generate variables
 with lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-15-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-15-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> The current Cirrus CI variables files were previously generated by using
> lcitool. This change wires them up to the refresh script to make that
> link explicit.

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> This changes the package list because libvirt-ci now knows about the
> mapping for dtc on FreeBSD and macOS platforms.
> 
> The variables are also now emit in sorted order for stability across
> runs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars | 11 +++++++----
>  .gitlab-ci.d/cirrus/freebsd-13.vars | 11 +++++++----
>  .gitlab-ci.d/cirrus/macos-11.vars   | 11 ++++++-----
>  tests/lcitool/refresh               | 10 ++++++++++
>  4 files changed, 30 insertions(+), 13 deletions(-)


