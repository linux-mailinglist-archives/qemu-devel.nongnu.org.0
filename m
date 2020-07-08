Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9A92193B1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 00:43:15 +0200 (CEST)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtImY-0003d9-Hf
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 18:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jtIOQ-0003kg-Hi
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:18:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47758
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jtIOO-0000ZD-Uu
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594246696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVt+OUUr9X5mD9N3X4BFUJRyDB1NHohEvt7H7YL398A=;
 b=gIBYRStvUyhnj17toLYLCE9m4weejBF5bfgHqFXALhF9jpBkiNwoO7S7YA/k0+CJUwbafr
 UdGZ8AbjTgeFQd9SfSzuSbD54YiIEj1MtU/B4tCtO1w1KdgHbXBFOG/8PkwkRg1kdGHXuO
 DNkoXReOexADgmHnMjQUDbUXu1Vinug=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-0KBQU13oPeOUnUtJfH1SAg-1; Wed, 08 Jul 2020 12:16:44 -0400
X-MC-Unique: 0KBQU13oPeOUnUtJfH1SAg-1
Received: by mail-wm1-f69.google.com with SMTP id g124so3462508wmg.6
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 09:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QVt+OUUr9X5mD9N3X4BFUJRyDB1NHohEvt7H7YL398A=;
 b=lGJ9SvUUSg8AjKoX1CSRw/imNno/uyO4JG6ewWKd6g07Hfe3k56Nq6zKpQkN5w4fgN
 TlbDoorBgunaVAUfrkbNPBBMzmml1skIpoKNQk21IjwnzaTO4j1eL2oO0awVhjQ693Kd
 A6gntW3q0KayGzMITRAlY4uQ4Anq0Ey913a8HHRsFEuLzxLQHxsH/9YVmDZ5gytytlEG
 dIyRCgqhYMqr1YSXMjc52tMM74ipXBzDDTlqhb7QlxF/cNPgVbWH5of/oVNVfiMXN8At
 LDswfTCyulHqj5wvHoNXHwTG0IgREMq+sK7DyueLzTyrSEE8qIlVNyAi7V4e4XLaSMzF
 B3nA==
X-Gm-Message-State: AOAM532O4IHWaonKbr4qQcj9w1vshI6wCfm3oPukEB/9yWuqauSv08X7
 J5lfumOpVM+8plB/+oOHOVaa9Ja/mWFnG2104Ef7qgeyhOw3OvCiay7UrvyQI2f9N4SJPKEbGAG
 cPww3Ro+3hn88qqA=
X-Received: by 2002:a1c:6408:: with SMTP id y8mr9902356wmb.122.1594225003536; 
 Wed, 08 Jul 2020 09:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgdoHXj8AVG2kwD3KbC4+KRNZBbKFFJmZv4z1ZZYCt9+epfIH8hgc61hA8Fc9pafStOA62/Q==
X-Received: by 2002:a1c:6408:: with SMTP id y8mr9902342wmb.122.1594225003357; 
 Wed, 08 Jul 2020 09:16:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id y77sm403884wmd.36.2020.07.08.09.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 09:16:42 -0700 (PDT)
Subject: Re: [PULL 00/53] Misc patches for QEMU 5.1 soft freeze
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200706164155.24696-1-pbonzini@redhat.com>
 <CAFEAcA-F1FGde+=c3iS3wcRWG+i0RgYj5-jwafn0sX6EEYEsWA@mail.gmail.com>
 <1a9ad36f-f4ae-2ea5-3d69-03aa5580b60e@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <de27589f-6afb-b8cf-05a0-f5d34f9d2a58@redhat.com>
Date: Wed, 8 Jul 2020 18:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1a9ad36f-f4ae-2ea5-3d69-03aa5580b60e@suse.de>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/07/20 18:13, Claudio Fontana wrote:
> so I don't get any tcg_get_icount_limit() compiled in, and no
> errors.
> 
> I think that having comparable configure command line and compiler
> version/flags would help me pin down any related issue.

Are you using link-time optimization by chance?

Paolo


