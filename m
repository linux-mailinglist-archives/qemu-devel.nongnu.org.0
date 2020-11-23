Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8E2C0A63
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:24:09 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khBp9-00029H-RS
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khBhk-0006Pv-5S
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:16:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khBhf-0003U2-LC
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606137382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/XdCPIhFxwNa6BX8TITMMTPvGVqadC/MdGT9Y9YXb0=;
 b=APXi82HM80ZtGsOkhJzVy3OeVegZZG3cYZ7Dh4l7OAhADxM4lSgA0hqOKp12eJAFmxJc/g
 Aso1OQtcBQdikJPDHDXSlWiPRZCn/lyBOjzX6n4gz30xtPkKtSc+mt0nNDhIoo3iJErqa9
 oA5uk7+kzreR5Lhr4IwknD4shIujIOo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-t0PIhmzaOOWWyo_WMHYl7g-1; Mon, 23 Nov 2020 08:16:20 -0500
X-MC-Unique: t0PIhmzaOOWWyo_WMHYl7g-1
Received: by mail-ej1-f72.google.com with SMTP id k15so2682209ejg.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 05:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C/XdCPIhFxwNa6BX8TITMMTPvGVqadC/MdGT9Y9YXb0=;
 b=PdKC/VK2hLbv7XEMM04Ax5QSiK2aK4qDw739TJxilEWcw4pn+FHkaQ3uAiA4x+/94t
 /WBL3rsPe0cASC4LWPIKIUM5LULqx5YceDHIb6BfQkqEvUWIzoCox0sFQiGJjgeYVNX0
 lFTbEdVB1ASUmyBQ7o0E7Aci2OXFCivBu+d7GaUD+43CA4opD3uFgKQdtZ2wRe1BKSoj
 /IeQGGbbcSHy83O7LaiF1wCn82P2TYkrVimJnhzIf+8DTjK2yn3sS+JPlfkti0mH99eQ
 r3NqfEUJi48JUGSYf1eD0yqZjZizxYlYDKSjKyv1p0vLpQphaxVEH4SnYEgWNS89HWFh
 H8Rg==
X-Gm-Message-State: AOAM5315/DDFphC6nRpqxeu1zdGUVKVKTDt6fOKOPksEfR/JaZHynLf8
 SQLVPBg2Isp2W4kUVUVAkbtb8kA2Ouso5y4wpSqjJwg9QZkjNN7YjwMcyQ2f7DPjzWHL3aI3WE8
 FKhZxTxO23f8GQSV+94TKPm3RpodtdhmESsbmB2lhPNOkjHkhFZIM5DcDKHadOXOXx/g=
X-Received: by 2002:a50:b404:: with SMTP id b4mr17078706edh.369.1606137378488; 
 Mon, 23 Nov 2020 05:16:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHv5dkTDeWahVLdo18pvR8G5pfK8qVsiUoFmij/eZryG7+A22DWBCgKS3iO0bpyFmUktZbUA==
X-Received: by 2002:a50:b404:: with SMTP id b4mr17078692edh.369.1606137378242; 
 Mon, 23 Nov 2020 05:16:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f25sm4960074ejr.120.2020.11.23.05.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 05:16:17 -0800 (PST)
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
 <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
 <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
 <389b0932-794c-536f-4e8d-3f91ef7fb3ba@redhat.com>
 <20201123113837.mru62xhprlgoyi6u@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1c51217f-0b16-6840-c81a-4af103d32096@redhat.com>
Date: Mon, 23 Nov 2020 14:16:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123113837.mru62xhprlgoyi6u@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/20 12:38, Gerd Hoffmann wrote:
> So basically keep track of the objects separately.  Got that working
> for the modular builds.  Progress!!!
> 
> Non-modular builds fail due to missing qxl tracepoints.  Tried to fix
> that with a simple 'softmmu_ss.add(module_trace_src)'.

Mentioned in https://wiki.qemu.org/Features/Meson#Pending_Meson_changes 
as "extract_objects does not support generated file (not needed yet but 
could be surprising)".

Just use util_ss instead, confirming both points in the parentheses.

Paolo


