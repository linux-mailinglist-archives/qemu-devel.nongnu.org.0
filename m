Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0624613AF07
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 17:17:24 +0100 (CET)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irOsc-0008Gt-Iz
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 11:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1irOrQ-0007dS-7o
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 11:16:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1irOrK-0005S1-Ml
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 11:16:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54571
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1irOrK-0005Q9-HK
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 11:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579018561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MAA/WGQRczFOpxFW2ymeA+/XBcKCYcwyBFQuN0t/70=;
 b=TlFxT2KVOgYO92uc0/Nlb+mi1k6R83Tsryd3pWxl+4BvkRuJ5ukXszI1Q12+oCBcrO8k6r
 ePywqtfTZM3902bPyZbBmiEYCTrWUomKvx5n1G0Pei09WzYse+bEAEGYAsY1C05dobXgDr
 A8H5cEnKZHTdVP4Aa0bwm89wh5jQzhU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-ifyXHv_bP1erdv859_c6XA-1; Tue, 14 Jan 2020 11:15:58 -0500
Received: by mail-wm1-f72.google.com with SMTP id l11so867541wmi.0
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 08:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2MAA/WGQRczFOpxFW2ymeA+/XBcKCYcwyBFQuN0t/70=;
 b=Bm1aTakUOynMt9aKqgYjMVAx5heGwV+jnbx5O+NQTn7f81eoK8jtROeT+sHdsYXKnR
 1PUf6Ubp/9eJNd7rn97l3y9c+sT8R32JkRF3JEJfWL7jjEuk2qikn/wsj2Sph1WkWvm/
 Bl9QuB+nFT74VnsU2uPBx03koqDoIdO2BjZjZrZE5peizSysiQfbk+WTCBI6NOTj+FSY
 5jfrK0qLvVr0QXnMoE4qIjNDtEiKt2kO75fsLkrtWrDyCVrjDG6BUvv5Jv/mViL8hE8+
 rxt7HoRkSG/p5WCgZnPqguHhWELAJ00LBFcyBQEV3qfN/gR6GVKsmLSPWVEeyGe5EYz0
 Fl7w==
X-Gm-Message-State: APjAAAWo+sXlF8g6VSuybVuRkKRsh8t/fTpmgcRk+wJLkMdxsFfhg3sO
 UfnP6Ii0d4CQKu8cVhpNnq1H4A4VKfOmOOVl6IniUnMoAdaijrxwKmQTghh5CZFr/kGkc77QJQv
 4tB/OZLvIZelC0JY=
X-Received: by 2002:a5d:438c:: with SMTP id i12mr26404834wrq.196.1579018557358; 
 Tue, 14 Jan 2020 08:15:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyovIEAtgz9sgkP6jbCj1JHd0UzJATVKGakj2zpJMY1gJB7AOcxyOCQtJF9xHXxHSY4JP8EFQ==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr26404797wrq.196.1579018557067; 
 Tue, 14 Jan 2020 08:15:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:1475:5c37:e2e2:68ea?
 ([2001:b07:6468:f312:1475:5c37:e2e2:68ea])
 by smtp.gmail.com with ESMTPSA id s65sm19931647wmf.48.2020.01.14.08.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 08:15:56 -0800 (PST)
Subject: Re: [PATCH 2/4] linux-user: Use `qemu_log' for strace
To: Laurent Vivier <laurent@vivier.eu>, Josh Kunz <jkz@google.com>,
 qemu-devel@nongnu.org
References: <20200114030138.260347-1-jkz@google.com>
 <20200114030138.260347-3-jkz@google.com>
 <af635ec8-b1a7-30c3-958a-6fdb0ab8d202@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <84c390bd-2fbc-fc1d-16f0-5774dad05acf@redhat.com>
Date: Tue, 14 Jan 2020 17:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <af635ec8-b1a7-30c3-958a-6fdb0ab8d202@vivier.eu>
Content-Language: en-US
X-MC-Unique: ifyXHv_bP1erdv859_c6XA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: riku.voipio@iki.fi, alex.bennee@linaro.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/20 10:09, Laurent Vivier wrote:
> Perhaps we can use flag LOG_TRACE? (cc Paolo)

No, LOG_TRACE is for trace-events tracepoints.  A new logging flag is
definitely the way to go.

Paolo


