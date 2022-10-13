Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1685FE379
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:46:27 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj562-0002wW-AS
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj546-0001RF-6N
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj543-0003vF-Jc
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665693863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lhJv8px2PfIOO/lNX4WS8M26+aCpiQXAT09Al9YpHg=;
 b=XIPogIjum8ZDNqtAu1h4xvfylVgywIU8va3AESrTUqx03Ic/xBp+zGnnUwgpoKYCc7ZgTM
 GoFbUrm8xkf73jBQHc5mtGyd6v4UENhyJmaXeVVEjQGtJMaRZJD52Pa+hWDzpcalY+aI4C
 jNo48gC/DAgVNGvitWI1PzgninO4H14=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-zOrj1dc0NCSPSW7QGm5tuw-1; Thu, 13 Oct 2022 16:44:21 -0400
X-MC-Unique: zOrj1dc0NCSPSW7QGm5tuw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z16-20020a05640235d000b0045c0360bfcfso2236608edc.14
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lhJv8px2PfIOO/lNX4WS8M26+aCpiQXAT09Al9YpHg=;
 b=WQ8VVovyVltMjfM/riA63782P1NI/MjQUDKFozc8Jwf0EKaYRXlcPafwkTzkJEiuY/
 V2/sR471xdENosBRZVU0KwI+6PoWht5WuDFkr62O7P8OYDXZx0XxV0UUBzZapnYZZuX7
 ifpR+cTD1K2K4hAWeIkQNN8SktQrLDXWWILKoSu6HlLnw7M8/aEaBEqMwXXXQ/dLNIr8
 whhYUpFesN3MUHNnhwNYoXVKiAboviXdhBh4yUQeqs48z521auWOuEYF+M/jjLj0/Huh
 FX9yzavsewYN5i7UcBzOJr8ENrgZ/LM3lnilssmBgDxWQ0agBr2HHjCeLn9fbDwHm/Uk
 80Tg==
X-Gm-Message-State: ACrzQf0sn9qUwJhhSOoaD8Wu3DyZ+qv1CbLM8x/sufPfjq3VJNqB+GdM
 KmtEMaq3L65NsZEQjAmypgIVXtZRxg9z40LtZmkA8dv0QOYIkBjJwgxIGZW5SHmGOdEpYCuIcDX
 IwWVVY3knyGsqPDY=
X-Received: by 2002:a17:906:730f:b0:783:27c5:f65f with SMTP id
 di15-20020a170906730f00b0078327c5f65fmr1220701ejc.142.1665693860546; 
 Thu, 13 Oct 2022 13:44:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78hJ7+rzpFiaps9iSb34UiWxdUp2XcW0qW4XjJFGUnHu3DmS2FjGGkPKPqbwNtOcRXRiMlIQ==
X-Received: by 2002:a17:906:730f:b0:783:27c5:f65f with SMTP id
 di15-20020a170906730f00b0078327c5f65fmr1220688ejc.142.1665693860355; 
 Thu, 13 Oct 2022 13:44:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a170906d20b00b0078258a26667sm408400ejz.52.2022.10.13.13.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 13:44:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/i386: Use device_cold_reset() to reset the APIC
Date: Thu, 13 Oct 2022 22:43:27 +0200
Message-Id: <20221013204326.654543-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013171926.1447899-1-peter.maydell@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This conflicts with "hyperv: fix SynIC SINT assertion failure on
guest reset", but the resolution is simply to do the change in a new
function x86_cpu_after_reset(); adjusted and queued, thanks.

Paolo


