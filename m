Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C976F3A6FB1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:59:28 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssk3-0000xl-CQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssix-0000Af-4x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:58:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssis-0004Ts-Rk
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623700693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=turbs8JDYH7DtDPfQFkOZ/uOQtDLry3HJJ06Bw3jYV8=;
 b=QkQ0B/Kr5YXGvL0pZ4y0mp7QpZ7rczDZoinBihfa456W1Jh8TOBydYZpYWG9QPTYK4Yicu
 p8zcm+MH9kdvKNtMt5wc/eFf7ue3G+e56Kew3rpJkRTzqA+1J8bW75WKhsK75KE0aBeP57
 S0X2xbLZbYrT3nXE+0elMimEZLOmmXU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-BUUrYUWLNxWDhyFJGM-Ryg-1; Mon, 14 Jun 2021 15:58:12 -0400
X-MC-Unique: BUUrYUWLNxWDhyFJGM-Ryg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m33-20020a05600c3b21b02901a44b1d2d87so431839wms.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=turbs8JDYH7DtDPfQFkOZ/uOQtDLry3HJJ06Bw3jYV8=;
 b=daFFVqktcpmNZS+8nIw5Zv+8T4HXuv9DPufbc6KeNws3OUS/5qKGnQ3qwwYqw1Y5lM
 wZHUWdG1gKzpG+KErfF6bf0yZMrHrXATrnhc3z0YF8F5nVB5JiTf48Q67ldbhmu3FfEZ
 McQ6Qg4G4C/d5/p8a0Mlrpu7dNlczPe8hGTCphV3kRuTLr4GtVRSsDFor4kIAWWilc6o
 amOyqmlUuSp+WfSl6WHWaqmnw9bdsRj3hSmw/1pwNS5EuHGPFBUCNwxkGDSTnzFpvLXV
 aymF46RubJ4i0EC4LlHdo2Pr2v8kW9S09FNVr5KfBtmtuRoJv4ZsPmgiRTCNJ93XOPnc
 vIhw==
X-Gm-Message-State: AOAM531n9Qobe7L7PgMU6swA1aLiN6/kdreemw5d9RtcBPaoTRCshnRx
 gPlTS4QvCRdpGaufmKffa0yHt7/7omQLHGzv4qJe4opYAPJBKylyh5Xej5u7ITsI5MVaxuqpt0A
 SQTFsLEvBZLQkWsk=
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr15067101wre.217.1623700690969; 
 Mon, 14 Jun 2021 12:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg/fsnyDzI19soi7H1S5vOQYasgclfybsKH3m6E5SOg4LL6j9uVdehSRXLC+tMWyuUBted5Q==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr15067086wre.217.1623700690741; 
 Mon, 14 Jun 2021 12:58:10 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h9sm355473wmm.33.2021.06.14.12.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:58:10 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] tpm: Eliminate TPM related code if CONFIG_TPM is
 not set
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210614191335.1968807-1-stefanb@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ff4f8e20-8f41-5fb1-5647-419decc3bd8f@redhat.com>
Date: Mon, 14 Jun 2021 21:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614191335.1968807-1-stefanb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 9:13 PM, Stefan Berger wrote:
> The following patches entirely eliminate TPM related code if CONFIG_TPM
> is not set.
> 
>   Stefan
> 
> v2:
>   - top-down approach for code elimination from arch down to acpi
> 
> Stefan Berger (4):
>   i386: Eliminate all TPM related code if CONFIG_TPM is not set
>   arm: Eliminate all TPM related code if CONFIG_TPM is not set
>   acpi: Eliminate all TPM related code if CONFIG_TPM is not set
>   sysemu: Make TPM structures inaccessible if CONFIG_TPM is not defined
> 
>  hw/acpi/aml-build.c          |  2 ++
>  hw/arm/sysbus-fdt.c          |  4 ++++
>  hw/arm/virt-acpi-build.c     |  6 ++++++
>  hw/arm/virt.c                |  2 ++
>  hw/i386/acpi-build.c         | 20 ++++++++++++++++++++
>  include/hw/acpi/tpm.h        |  4 ++++
>  include/sysemu/tpm.h         |  6 +++++-
>  include/sysemu/tpm_backend.h |  6 +++++-
>  stubs/tpm.c                  |  4 ----
>  9 files changed, 48 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


