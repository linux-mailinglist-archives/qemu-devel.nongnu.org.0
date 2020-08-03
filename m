Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7823A1DA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 11:41:43 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2WyT-0001kh-Qk
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 05:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k2Wxi-00015W-S6
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 05:40:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33700
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k2Wxg-0007mQ-70
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 05:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596447651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fX7UPP/ttzz/gMKK2DZ2HoDavC6M1H47GD8c412jDS0=;
 b=ZA5XUr1ezWuO35P3Qa4XBhEp6ZIwfyRUV3xxmVPYz544pTEsWqIzYaBbibclcUe/CXeXYs
 9B5l0SKIPTGxAYpWSqGvSdJnN4jgwbUBK3daqYcB5uU0KC8hY3LIvcLJrK4d9LvuwdaSS7
 W3zVs6vX2k8GKkGNxo6UaYF+tlc1fqQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-5cifWzlqMCaTagguEPzmsA-1; Mon, 03 Aug 2020 05:40:49 -0400
X-MC-Unique: 5cifWzlqMCaTagguEPzmsA-1
Received: by mail-wm1-f69.google.com with SMTP id a5so5302879wmj.5
 for <qemu-devel@nongnu.org>; Mon, 03 Aug 2020 02:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fX7UPP/ttzz/gMKK2DZ2HoDavC6M1H47GD8c412jDS0=;
 b=uZDPZ4Pq6yOpHJJDXfNqrSwoOL2RMUmyCkm81N5Ktzft5v5O2VULoglmoKVjcPPDJK
 VdwquK1EulEX/NdCd0D6V8KwRFzoTCL2fki/KyvuqMM2PxDoSNL2Q4dcd+2e+5qWqTMr
 dbdHSRKWtE54QLSmZxbc7NA5jczyfb8aoDvjUmQi80Dyz17w2AfjTVD2KPgg5olvxz+i
 wh+JNfEYTG8z3FvD79X3XfY5mCkaU12u1Yh2/zFF3wZAmweqWaTzvg6PXNrYcPt76ylt
 qADhZv18Z3hL8fQU3bLd8bKczas519YDE7EIhlXIk0SiF6cUwb0ObfiqQznXVfdjMsxl
 XRqg==
X-Gm-Message-State: AOAM532RhT955Nwxg6DxBDhgnbbwsv1yXw6e9beALxlPeh3qILX1zR5x
 8FofpLuwANPH8VnCHMKfe3ILSmyjhCa5+Ftq4aPRh9y0u4CQDmfNN13nxc/jgBCDPTdp5Nb4cVY
 /iWt3Z/JGCTSCZ+g=
X-Received: by 2002:a05:6000:10cd:: with SMTP id
 b13mr13984419wrx.216.1596447648335; 
 Mon, 03 Aug 2020 02:40:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUX5Zbjl79dSb4pBRGKzZpKSELHBRYjdCYW296JPlJ1N1vRiB5EZAjyJC/xEONw2ytciTPzA==
X-Received: by 2002:a05:6000:10cd:: with SMTP id
 b13mr13984384wrx.216.1596447648039; 
 Mon, 03 Aug 2020 02:40:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:310b:68e5:c01a:3778?
 ([2001:b07:6468:f312:310b:68e5:c01a:3778])
 by smtp.gmail.com with ESMTPSA id c24sm24674911wrb.11.2020.08.03.02.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 02:40:47 -0700 (PDT)
Subject: Re: [RFC v3 0/8] QEMU cpus.c refactoring part2
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200803090533.7410-1-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b7a3d4b5-128a-a1eb-d6fe-45ab3bd536a1@redhat.com>
Date: Mon, 3 Aug 2020 11:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200803090533.7410-1-cfontana@suse.de>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 02:56:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/08/20 11:05, Claudio Fontana wrote:
> 1) make icount TCG-only (building the icount module only under
> CONFIG_TCG), as this series suggests, and provide a separate virtual
> counter for qtest,
> 
> 
> or
> 
> 
> 2) continue to keep icount functions and fields, including vmstate,
> in all softmmu builds because of qtest current use of field
> qemu_icount_bias to implement its virtual counter for qtest_clock_warp?
> 
> 
> If I understand correctly Paolo might be for 2) (?)

I am for (1), but using function pointers and not extra "if"s.  I
quickly skimmed this patchset and it seems to DTRT; we could get into
huge discussions on how to organize the sers, but let's just not do that. :)

Paolo


