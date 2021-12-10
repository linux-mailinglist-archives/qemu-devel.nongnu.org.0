Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3784700AA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 13:27:49 +0100 (CET)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvf08-0004hK-Cf
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 07:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mvez4-0003bK-DH
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:26:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mvez1-0002vo-L2
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639139197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPOpMw3BNQsz6G83gz9SPQHRE6LiY5a2COjTCXSogWA=;
 b=H29T6l9UCrNSD9Wn4OPUAkZEDGSWjNMhcezvM1BZH05ND5I/BSLbWOSHJRXLZMwENMMv2a
 Xq1SMWQSpgBiN3SpDCqJOCiMpRBVy5qCtFBpDtrjNa6j3gz/URko3NTMdZPl1RncUaFcKE
 zuoVx+1ZpJIac7Y+MX6rFx0cEcNIM1g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-jaM9a1zSM3-sBlN0MsTrMQ-1; Fri, 10 Dec 2021 07:26:36 -0500
X-MC-Unique: jaM9a1zSM3-sBlN0MsTrMQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so2208462wro.18
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 04:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lPOpMw3BNQsz6G83gz9SPQHRE6LiY5a2COjTCXSogWA=;
 b=skHnBqJnZb0/88pykIdHBQy4IgIzhBMQS1hTGCWCJnFTZ6+O1Y5nICXqkKgm7LNaW5
 C4mzqF5QyERhJ4hNZbDQ4LHA0V5LjBRk//Q32pE2t9H3K91wANPo90mcO/c3Qu4aovjt
 cgCqKtiNqa1pmdFMBj6mvETZPBFpRnqib4DKhmk+3MReErUsaIulxp3qfsh+gOE5znSS
 I1WBZbguBcdyyoWJdmP+1YiTYzvFsqUDw+FFz4m/8a40ntiEH4w86q/2lDBqJa6zvzlD
 HEhTvmo5uASAuq+jC3B15yID4F/HmuGelQrgBQ5YRUK7JM/1JsyjghU9/q05NhPWg5KE
 ZSEw==
X-Gm-Message-State: AOAM532TKMJEuFxDp9DbKJqNKwMLrvGCPSp0HlbCIRx9jFhn8tyTrQ92
 iNEi5I8kq9ijUfhuef5raU/YXWeXt+ohTYpZEQ/uPePZcUeDuRlcqHHSZWK3UzjTCB6rRtk6/4Q
 gxzpwIW7tXGtG+kQ=
X-Received: by 2002:adf:df0b:: with SMTP id y11mr13294721wrl.181.1639139195577; 
 Fri, 10 Dec 2021 04:26:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/AJfgPH993E+L2rdENOX2U8Xjcc+tfNctxLIsrBpXL6zV+JQCJVqh8TTi87GfcercNNifSg==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr13294701wrl.181.1639139195352; 
 Fri, 10 Dec 2021 04:26:35 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id s8sm2567657wra.9.2021.12.10.04.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 04:26:34 -0800 (PST)
Message-ID: <27d78744-82b6-67a6-889f-cd4cdf8a6448@redhat.com>
Date: Fri, 10 Dec 2021 13:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] uas: add missing return
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211210080659.2537084-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211210080659.2537084-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 09:06, Gerd Hoffmann wrote:
> Otherwise we run the error handling code even for successful requests.
> 
> Fixes: 13b250b12ad3 ("uas: add stream number sanity checks.")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/dev-uas.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


