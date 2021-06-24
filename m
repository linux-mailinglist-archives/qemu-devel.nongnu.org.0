Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08B3B30E4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:04:04 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwPxb-00039x-Cf
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwPvo-0001h7-Ma
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwPvi-0000nt-Go
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624543325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmKzNLttz8PiqWSl5kTaVZM2yi8S6ksRMS/5gajx2NQ=;
 b=AecAqYqt7tb9C/Sqfsz3l+4cRDLbXb3pnVDseXE7mboZ1yk5jvHpZnWLkC5S2g+e5vIqZE
 BKU8KRF5FY0Imf71SId0Tmmho5QZxlA+SDvS2rmRbpSeV/jSAiRRU2Q+/yviJ1+hIuxusm
 PB8oZ0twkH/pDyeniTxSTx/BtHKcc+A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-q_Yl-nzbP2KTjhKE7ravjQ-1; Thu, 24 Jun 2021 10:02:04 -0400
X-MC-Unique: q_Yl-nzbP2KTjhKE7ravjQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v9-20020a5d4a490000b029011a86baa40cso2244672wrs.7
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 07:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XmKzNLttz8PiqWSl5kTaVZM2yi8S6ksRMS/5gajx2NQ=;
 b=E8dVMP4ZyjKrOzR0gHLJWrwNqeBow8CewpDgwFI8gtSRrv1ohhYK23ONMZB711tTIu
 2JsLpAw/vfyV5JfXf2i7y4EEsj16hPZCeazEi9W6YvbnjQH4noV+TNNSbtX+eAKQbF3T
 hKdvx0IlhJ/sNm2lfH55CoinrYKJjdl0ebBK6R+Q/mQvmFXBW+/77qcZ0s9J4Q6hL9HS
 pmFDlU6GCsCaOr9c7BY5faKVrM8P4e3OTotlThuwrlB0ddHD91jwsFD1+ZIwv2JVRIYF
 kmeFHOJePeYK1ar8rLdTScA9jvf/ywFcQbnOOcOVYs7/ZBI8V/yyfI6fRipRsrUjO8/g
 ZAUA==
X-Gm-Message-State: AOAM531CEJhGYFhL+3HRETtGN2vyOM6aM5WaD1SddXSqviUe7RDVYxgJ
 alnHxj4nalhbfvyw7zW/KMVUxADIFO9EmBqShBvSodSg0mV3Qj1On6QQ4u5w3M/Em/rK8lbdBF/
 BqOCTkUqzPtq1EVQ=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr4809246wrw.352.1624543323098; 
 Thu, 24 Jun 2021 07:02:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhNzNgx8MZP4CPp8UlWsRH1vNKvnQp1qM5uSpuWYAEXjt/rY4xRglWhEpqnv8ZdqMi7Xf68A==
X-Received: by 2002:a5d:6848:: with SMTP id o8mr4809225wrw.352.1624543322973; 
 Thu, 24 Jun 2021 07:02:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm8549883wmq.48.2021.06.24.07.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 07:02:02 -0700 (PDT)
Subject: Re: [PATCH] acpi/ged: fix reset cause
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210624110057.2398779-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25210969-e5b8-6817-6d39-221aa13d7a39@redhat.com>
Date: Thu, 24 Jun 2021 16:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624110057.2398779-1-kraxel@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 1:00 PM, Gerd Hoffmann wrote:
> Reset requests should use SHUTDOWN_CAUSE_GUEST_RESET not
> SHUTDOWN_CAUSE_GUEST_SHUTDOWN.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/acpi/generic_event_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


