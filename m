Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C03609D0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:52:08 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1Tb-0006nw-Lu
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Ri-00065R-Oy
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Rf-0001mq-Am
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618491006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qB2XOU8KMbuTGMu04OWSLncll7I/PkIw5fsKwWPgarQ=;
 b=BxWhL+IXotKRLK2DfNgUoI36FUlL3FQffD7onmWtVw2S4rT45cxKdM5F0AyMblwSzgyBzf
 ltv+zqNiwJV2JR18ikVBZcAxFPkOkj3HVYI68AEGsMXAqR/IpVxdwcRyV1+TMhkK6Bm3Nr
 oGxdmh/bjLo6XK120JfDF9cBLvS8CpU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-Ci5p2KEBMQeDGTCQ6OAGcA-1; Thu, 15 Apr 2021 08:50:04 -0400
X-MC-Unique: Ci5p2KEBMQeDGTCQ6OAGcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020adfd2100000b02901022328749eso2701030wrh.4
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qB2XOU8KMbuTGMu04OWSLncll7I/PkIw5fsKwWPgarQ=;
 b=rkhCSgoiLR6ZJZsy+dUpjbtVyUSbuAELym34+fXlZTkmopQwjQ+1rB7pT9qnvcWDtb
 PmmGthTK5lQ8FbwQ1b8MLlJiW7iU9+pkRaiyRAqXY85evxUkoSrFPS9xabLKOLDIhAHZ
 m28azwj1ZrfvTGV/ha9v/C7qN0jW2OdEvYC9m7S6rmgARFKCCrZ/eGgjrnJw92fsgL8n
 VQ4VM/JSZePG/tlLP3CHRIutBaOK2bHdy03em86kF+WZ0k1KlxB4VHqLjgFOKv5DNoLQ
 vrhEmINsoslmLrML8TOmGjFLUld49gAetp0Vk6bxGytlxjw/56m5NAU9DcPamrBeATzS
 ZvWg==
X-Gm-Message-State: AOAM531tTV4/ynMTCLx0LzcFquCiQHJElfqpsT5dPeBHpukTnsfhV3aJ
 GoeAsXW+typtrV1FYhJ7MUram2A23pVrRNaFLANIanAaZleXxOM2wyv8lJF0kkvWM4xtbr2ztjs
 WeMT3+jY4wCcaCPM=
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr3040009wmf.17.1618491003212; 
 Thu, 15 Apr 2021 05:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTV6j4W4+I29dP4NHq9g6RTMVIqviLMJs29OZnWCv4zFZawxhNJCvJetfdUBImZcxGbK6qGg==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr3039982wmf.17.1618491003041; 
 Thu, 15 Apr 2021 05:50:03 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k7sm2959507wrw.64.2021.04.15.05.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 05:50:02 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210415122633.4054644-1-philmd@redhat.com>
 <7be73164-ab1f-f4c7-f80c-3305a71761a9@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ed318c8b-b051-755d-35dc-5d64816f2be6@redhat.com>
Date: Thu, 15 Apr 2021 14:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7be73164-ab1f-f4c7-f80c-3305a71761a9@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 2:30 PM, Claudio Fontana wrote:
> Hi Philippe,
> 
> does the tests/qtest/arm-cpu-features.c kvm_enabled() function need to be replaced by the use of this new command?
> 
> Maybe something to add to the series?
> 
> The use of "kvm_enabled()" in this function is particularly confused, because it matches the sysemu/kvm.h function name with completely different meaning.

Great idea, thanks!

> 
> Ciao,
> 
> CLaudio


