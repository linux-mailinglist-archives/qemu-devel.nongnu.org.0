Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCC4A9C35
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:48:31 +0100 (CET)
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0p3-0006BV-Vl
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:48:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0ae-0007Nl-JW
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0ac-000517-Ht
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643988814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KLTuTeWu3xoMHN2Gb7RizNP5je9wk4joNG/1Ck8zOA=;
 b=inD6WgZ6L/QtCu9FmpABlWtv5tdm7MkrqhYD0kJ1NzP3/uhO933rqymnDCCMKvQIqkThQs
 5Amg5/KIFRfHtAh6zzSC9Hyqd3HD/Jh3SXTVoZ9BDT9dd02fXtZ5i6/d2bQxgIN5G/4U65
 ea//5UKAQgC6iKBX5Wx7sjUkaxtdDng=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-E2CsLENgMlq8_oq0uNsrMw-1; Fri, 04 Feb 2022 10:33:32 -0500
X-MC-Unique: E2CsLENgMlq8_oq0uNsrMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i64-20020a1c3b43000000b00352cf8b74dcso532402wma.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7KLTuTeWu3xoMHN2Gb7RizNP5je9wk4joNG/1Ck8zOA=;
 b=eSgrRuDlNNy+Fbj6apv4fx5blySxanfPpZMsIqaD4Ka9FdvVKVrVtoE8cb2nuP1m0H
 4NKvBNkZFitR+3JK1FlVLc9apI6tFd9XCSdd2PYYn9K4p8TIfXOJRk3cNKcsU9csfazp
 UhPZIX745TiUsy63ROf+QIKj4Nnmtf+f6Q1K3PnAPNSb/cX50/TXxuPI/KjLVbmQY8Ig
 GijIm7PhhbIpJGNpQrSmeapDgfnTlZavG18HRGJu8u8z1pfESxUr1wCXVE0V1x0nH6Hn
 2piXwXe8l14oN1bQEAhRLZLpzPk0NgvfrU7h0dZQLQ3rS5mmHDVs3IN9TIE4PGy3It63
 wwcg==
X-Gm-Message-State: AOAM532oJ38dTOMexV/qwPIiCMhgbXwpx79Eyj2EVrP1O2G8F5bdqpqv
 0sjVr7/VUqWA/oSgtpiqKM+wnpNMY30EOui+dLDtVjNbbk5Ug/Q/rq+4vPxFXeX1cxHozvH9nYz
 +dfXVLwp8JzH+CLw=
X-Received: by 2002:adf:f006:: with SMTP id j6mr2883939wro.444.1643988811695; 
 Fri, 04 Feb 2022 07:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ9R20cf6XSbT311DxsIbHxZHq98kGmbcVAbloWWSFrQvKRDoLhS/J0dTgPDP90EDDvFGHdw==
X-Received: by 2002:adf:f006:: with SMTP id j6mr2883927wro.444.1643988811529; 
 Fri, 04 Feb 2022 07:33:31 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id j4sm2840460wrq.81.2022.02.04.07.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:33:30 -0800 (PST)
Message-ID: <3f261f9f-ef48-84f4-d25e-81f81877cbf7@redhat.com>
Date: Fri, 4 Feb 2022 16:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/10] exec/exec-all: Move 'qemu/log.h' include in units
 requiring it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-11-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-11-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.38, Philippe Mathieu-Daudé wrote:
> Many files use "qemu/log.h" declarations but neglect to include
> it (they inherit it via "exec/exec-all.h"). "exec/exec-all.h" is
> a core component and shouldn't be used that way. Move the
> "qemu/log.h" inclusion locally to each unit requiring it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

This seems to be a good idea, thanks for cleaning this up!

Acked-by: Thomas Huth <thuth@redhat.com>


