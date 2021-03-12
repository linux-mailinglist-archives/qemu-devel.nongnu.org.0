Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8CB33885C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:13:58 +0100 (CET)
Received: from localhost ([::1]:36224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdrp-0006fz-Bz
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdjk-00043s-09
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:05:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdjc-0002ID-3U
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fe92s7IKjpl47+82irgS4fyv88IJ50ODiafDLNyUkqk=;
 b=eQwGjcZakp+6Izxj3Mzp0a58Rf97wYh8mnAwjzWN2rgWJgwJNKRBscAGsI15S4MYChq187
 LyHLlkr9trcC/PwpCz26FRkKdVKHkJULE4cF0IxsYJTJGVO1MPy9TsznPLaP3jeZ4V5U6t
 g3TsF45zvk4/99h0dMNmmPNTeUtcJqk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-GEh0XuucPOaUX51z1UUq8Q-1; Fri, 12 Mar 2021 04:05:22 -0500
X-MC-Unique: GEh0XuucPOaUX51z1UUq8Q-1
Received: by mail-wm1-f70.google.com with SMTP id m17so1855980wml.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fe92s7IKjpl47+82irgS4fyv88IJ50ODiafDLNyUkqk=;
 b=MUzhAVBXdeuzqePXD1vsJQbXbwMybEeyuE1Mq8RjEvok2uFFMSNzg4ZJ5LHmhL/Vl+
 gTTqDno3++e6cf7s9rarS9OX5PBBltgxgeVdQc+JbtY1tiF++jWbgcllXyIZQgqE8/DT
 /Q/HtpTKoDh7uBdohCIFPIFBD2CqZOVkXJ1SsEIL+vTgOnzS65ACvZUebfGCYn2ye0Bp
 ciCXtyIhOQf+/XOnX4325Ty0IY3TLZDKccZmjXAGUcLPB+plVY4JMZ6ibTErSFnFuWTk
 RPBpZRgNn9YRNg46lGNSPMJ5d9APHrkPRB40ibjSOFB6466cImEVb6Jt02IlksTGU5+2
 5onQ==
X-Gm-Message-State: AOAM533DY8SsHkrkD78gTv1/UVK5K6iSR6AYApd0UKyiZsobH0jSVqV2
 ZbOpB3/D6aHU7tJ1j0kuwJHRUt+7Zp/1jC0z13hd+EjSzscaOjh0HBDIlVt9K7FOps7cgUzudCB
 j7WJ5M/jjX/Nbs7M=
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr13042058wrk.406.1615539921111; 
 Fri, 12 Mar 2021 01:05:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7swixmC+aIMj0OKbMW7S3ImhC4CI6+LSJeKQAyuX3u923EIuReURQRcrqYjWAjn4jZtg1nw==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr13042039wrk.406.1615539920981; 
 Fri, 12 Mar 2021 01:05:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j203sm1481696wmj.40.2021.03.12.01.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:05:20 -0800 (PST)
Subject: Re: [PATCH 4/6] qtest/arm-cpu-features: Check KVM availability at
 runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c8f9841-1fda-db4f-57fd-bf764f3a0962@redhat.com>
Date: Fri, 12 Mar 2021 10:05:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311231202.1536040-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "

Wouldn't qtest_init simply fail here if KVM is not available?

Paolo


