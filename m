Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8754B42A480
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:33:16 +0200 (CEST)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGy3-0000yS-K1
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maGeH-0006s5-D4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maGeE-00028E-PU
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634040764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mzfyd6DpTAUgSSzf12QIkFnEwbcqw1xkuYShMWF8p7k=;
 b=TXx3nOXxhHCU364HTfRI8QgBFpaMi2bOfO4ScOgxetxEo6oPB/UP13JmGLrA/dYbK5B7dL
 Lg8xfgqvuXOpsxrnXSglh27lw6OCyFooJKgQqsLhhW87DxkTPRoX2jWEklZkhZmPJRkBsw
 f02e2I61ruuQCvFPlEurv9V6aZaMj1A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-oT41xa3vPkSyBAUIJZXCbQ-1; Tue, 12 Oct 2021 08:12:41 -0400
X-MC-Unique: oT41xa3vPkSyBAUIJZXCbQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so18673461edj.21
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 05:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mzfyd6DpTAUgSSzf12QIkFnEwbcqw1xkuYShMWF8p7k=;
 b=r/3ctkmqaiDD8mVXJRZoRjcmwH0QNBW0LDlmYIy24FKT9os+67JcPZqKp96WxepbFQ
 /E4ZjsZ6epcvaqwZmN8x2qD9dQTsDYXFMcl/RwukPLWAJymsKC7AeH/nDJlWrARDoUf+
 r6IztxiJ0p/6LuuT7zlWl+UsU+A5Dsn460h1DoChfsMQB8aIVSXxciTO4AM0sohtDv5A
 Av8a1Sqh3RVM3xZYpsTKafyO8Wb0mAruAXowaFngy6MoIddKF9NeIOK94FB0peoxn52f
 irThk0hhN4SPNqdbLgGZFTea7OvRantSkVykqGvaeOlbcH/iMG0RNgEEh7bgHjnOJzv8
 hhlg==
X-Gm-Message-State: AOAM5320/7z5TKCse4ysE5R+oluiowJGpzqdy0RITwC6MkMPOAasalG6
 aKTNfv1xdk98meqpZsEN7zlSVbRYnXyQDwir6uVXlw1KjIGrouLzAE8feGDKWwpNyI/Wo2BcxKi
 Bzch/Bptj+vvCTG8=
X-Received: by 2002:a05:6402:21d2:: with SMTP id
 bi18mr49276649edb.21.1634040759962; 
 Tue, 12 Oct 2021 05:12:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNs7SM0HBBrnaQowj5pb7R5e+nlGFxAP0fIukRB+c9uKOFDK8LnyLM4nb4wKpfsOctRrwUHQ==
X-Received: by 2002:a05:6402:21d2:: with SMTP id
 bi18mr49276615edb.21.1634040759761; 
 Tue, 12 Oct 2021 05:12:39 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id a9sm5634880edr.96.2021.10.12.05.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 05:12:39 -0700 (PDT)
Subject: Re: [PATCH v2 11/24] configure, meson: get HOST_WORDS_BIGENDIAN via
 the machine object
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-12-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <336725c7-8131-c8fe-6346-500f3071e72f@redhat.com>
Date: Tue, 12 Oct 2021 14:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-12-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> No need to pass it in config-host.mak.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20211007130829.632254-6-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure   | 4 ----
>   meson.build | 3 ++-
>   2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



