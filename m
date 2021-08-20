Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCB63F31C6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:54:59 +0200 (CEST)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7nB-0000sb-9n
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7mI-0008Ro-Fx
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:53:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7mF-0003yx-Pm
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629478434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXpkbJd9Y+mkHwJxEQ3WXMfbCZl+IW915quUBeMV/Ks=;
 b=i4jzlRzIhT4POec3szIkNfW/mXke7bKrKSM9MtnxMwVWs6WRhMJ8iSoX2sw4nCcHNI/9kw
 mAjEUU+F46yFpLGJs4dtjcS1jaDrxJymOH6vG0FWiUdi6TMb3LDT0SMeYCpTbRK3GHEt+5
 R/yDNCrp0v1KwzthN+AALIi+VqLfgvs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-aXLRhOCXMrOVkjpCkkcLGQ-1; Fri, 20 Aug 2021 12:53:52 -0400
X-MC-Unique: aXLRhOCXMrOVkjpCkkcLGQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k15-20020a5d628f0000b029015501bab520so3043800wru.16
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXpkbJd9Y+mkHwJxEQ3WXMfbCZl+IW915quUBeMV/Ks=;
 b=H6+Quykbh+KRV4QMOnrxjz5WB1H+ZG0lC1dGvRo0RbtUX82Ai43TBFIMXDPyxx09Ua
 jJeV7ZsIO+X6fqliH7/YXkXl30r8RguMgeuw/uZLucyqbDwvVxURXBr71msbbD2oTrSh
 DlQ7eX1zooOSLPuVGMoKRQJfWLACjV9/iha4kOXwQPwZ1A2GPBY+LVOrZujOTXQdly7u
 iStRXzoxGBjtTf/9XGhGzXHJFXZBEBg62Zn6Gt8BSHe7KTU7js2cwZ0V/qUnrDfbso40
 3JukJ6LpxBF+y0Tdz8nk74OCF3HTodihzs5vEh0RDlggL871tIeBhpeELFxqoYzoPATc
 OjIg==
X-Gm-Message-State: AOAM531R/e+QyrMrWBuGkZUQ2U9CcSsBOMHfpAjYq4NGUME887zTE3bM
 oi68N7m11XMANPd2HjxZ+T0SM6mkTbjtqEG17ATdrzEDe7z6HcphE7WIXNwqDtlllqp8G4GSV7p
 92uNkJdXTZ9ls7bc=
X-Received: by 2002:a1c:f002:: with SMTP id a2mr5004830wmb.79.1629478431748;
 Fri, 20 Aug 2021 09:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXqK02kZ9VAKq2KTAz/VjrmlcqcID034dHExLaVhSh2Glvy81ArtdPCXfz2QRCr9n4afQSZQ==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr5004816wmb.79.1629478431549;
 Fri, 20 Aug 2021 09:53:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a11sm6553341wrw.67.2021.08.20.09.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 09:53:51 -0700 (PDT)
Subject: Re: [PATCH] libqtest: check for g_setenv() failure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210820163750.9106-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d45084c8-513a-903f-b419-0b23c97470c8@redhat.com>
Date: Fri, 20 Aug 2021 18:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820163750.9106-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 6:37 PM, Peter Maydell wrote:
> g_setenv() can fail; check for it when starting a QEMU process
> when we set the QEMU_AUDIO_DRV environment variable.
> 
> Because this happens after fork() reporting an exact message
> via printf() is a bad idea; just exit(1), as we already do
> for the case of execlp() failure.
> 
> Fixes: Coverity CID 1460117
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/libqtest.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


