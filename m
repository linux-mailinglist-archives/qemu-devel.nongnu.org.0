Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00ED284C6A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 15:20:04 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPmst-00016W-Pk
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 09:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPmjG-0001X7-OS
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 09:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPmjE-0003T0-5k
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 09:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601989801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msWtPbSnBSR4zVD5QAwBx5qQkt8wTCc0cvCHidKUdsA=;
 b=OAEEZ/liZWamyoDeVMjWUrMShmKiV2jGoZtA015nt7BIgCRRcUXLOgBuQN0xo94TuO3vWq
 CauAfc0lyXEUrEoC3WnH8nquuid2SwumIW03cQvkTXu4TMn22yh1XoIippAeXhLY5qFjse
 0+/o4YtT9eRGMTPpFe4Xq0XA1xsRTzY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-KRy1H2DiO-6VbssS56DbnA-1; Tue, 06 Oct 2020 09:09:58 -0400
X-MC-Unique: KRy1H2DiO-6VbssS56DbnA-1
Received: by mail-wm1-f70.google.com with SMTP id c204so1098269wmd.5
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 06:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=msWtPbSnBSR4zVD5QAwBx5qQkt8wTCc0cvCHidKUdsA=;
 b=IzBQ/WDTAKZbyNd27L+riWFnmx8jWVDIFmGrBBCcq/4G3pSJh4Ptt14e464/9y5kqg
 tUXRmV9+A+vev8q2FbyIK9sn74dVAx7VvjjyUZf5SJmt2E3wFFuIxX2ZnejaIZX7eIrR
 GQlEo2Y16Zu+dj/HPAaTD/dAgSB5lKAsQwvgwLKf3vrZJTFoXs/+p+/yffo41xN8Chj4
 8utdIhmGGdtSnC/hVlcWmhe8dmy6wIDck7LlmuCCVmIjI7up3XFZOQ7Ye2FUWuE2HG1u
 zqpabyttliovfXJkaQRR08TtcxkELH72xQvAoblcgWOQuErxjsCd9lmUo/EYBd+4eYCx
 gfvQ==
X-Gm-Message-State: AOAM530D5ao/FBUDK80sOOtl70IzqSkVbJHJ6vzlGOK1mvMSioSyo56I
 F/r4wEnSH6r+VjvD/dbKc0BF3tOF+LALdof0gs6X0abeTUAPOAPt0PX6l3mP6pX1nYUyGBzdD+z
 /2ErGBNLQYPbiqm4=
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr4835380wrt.211.1601989795217; 
 Tue, 06 Oct 2020 06:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCwNXPVtHncWOK0Gmg2184fz7hu+rwXpKjTd4upUozKlVssHuidXfdGuTJ3BDZQkm0bHuwZg==
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr4835355wrt.211.1601989794997; 
 Tue, 06 Oct 2020 06:09:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e?
 ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id i9sm3863614wma.47.2020.10.06.06.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 06:09:53 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] meson: Move the creation of the library to the
 main meson.build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201006125602.2311423-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8181d403-ab64-5af0-4916-9789d87a6b2c@redhat.com>
Date: Tue, 6 Oct 2020 15:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201006125602.2311423-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/20 14:55, Philippe Mathieu-Daudé wrote:
> Make Meson machinery more consistent, as requested by Paolo.
> 
> Since v1: addressed Paolo's review comments
> - Drop migration RFC patch
> - Move comment block
> 
> Series coded while listening to Brass Against songs:
> 
>   https://www.youtube.com/channel/UClJMqrWQJ8OYWJ4ZdfqZdeQ
> 
> and available in the Git repository at:
> 
>   https://gitlab.com/philmd/qemu.git branches/meson_libraries_consistency
> 
> Philippe Mathieu-Daudé (9):
>   meson.build: Add comments to clarify code organization
>   meson.build: Sort sourcesets alphabetically
>   hw/core: Move the creation of the library to the main meson.build
>   chardev: Move the creation of the library to the main meson.build
>   migration: Move the creation of the library to the main meson.build
>   io: Move the creation of the library to the main meson.build
>   crypto: Move the creation of the library to the main meson.build
>   authz: Move the creation of the library to the main meson.build
>   qom: Move the creation of the library to the main meson.build
> 
>  meson.build           | 86 ++++++++++++++++++++++++++++++++++++++-----
>  authz/meson.build     | 10 -----
>  chardev/meson.build   |  6 ---
>  crypto/meson.build    | 10 -----
>  hw/core/meson.build   |  6 ---
>  io/meson.build        | 10 -----
>  migration/meson.build |  8 +---
>  qom/meson.build       |  8 ----
>  8 files changed, 77 insertions(+), 67 deletions(-)
> 

Queued, thanks.

Paolo


