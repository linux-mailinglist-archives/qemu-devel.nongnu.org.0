Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6D02ECDB8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:25:35 +0100 (CET)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSU2-000638-Hz
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxSSD-0004c2-W4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxSSB-0006l8-Ss
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610015019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AcBAQn29rozCiak0cLA4ZMrxwZzBNDVE8RX2ZO4vwNo=;
 b=ULSQPI7/Xz883A/MQCDoBf1wPjt1ZwwpqRm0hTdx2F22Y4bZ9CyepI7kPIIBLO6cwMwJlC
 pzIImTJfgjirzD04iSx81L+Il/abrthG7Qo+3efOxtH7F93Rm2RpJo8KpPTEKSKbnI9hg5
 znMQ58/PSm6tdsbVkMUx93nQ0y/AGmo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-VWNAmIRCP-Svg2LeBRt6Yg-1; Thu, 07 Jan 2021 05:23:35 -0500
X-MC-Unique: VWNAmIRCP-Svg2LeBRt6Yg-1
Received: by mail-ed1-f69.google.com with SMTP id a9so3213172edy.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AcBAQn29rozCiak0cLA4ZMrxwZzBNDVE8RX2ZO4vwNo=;
 b=qKPX51Zi2zsKZKArIVweL45sIrhVXKiCM98umnpiNG5KwjEGTjVTGva+LkQuKc4z8K
 UzfDmh9rJkeGpmhrzq8E3DAb6U13y5b0dqd7JYEB0eWYtwKHX6g+SfyZgZt2ihVifTAd
 nVHbBNZyFNrq53t/zVR/z1NHTDQJyCWylDP8+LB0ubomojvMkOPt+yhtGcCYXK1mA2qN
 0D6CutJOThg3iCNTiJDxszDbunT3tMF0l+Ch/EZa2todXD5adH4Eot4LsC21PT8GG4xq
 GgHKjygbR+HO8zEgdoZAnTkTLZ+8JlczVG4jpFGGJqA97RHcUVPwh1m259UpGdeR7Xqz
 mkCQ==
X-Gm-Message-State: AOAM530FtKrf0ACmw/5df+lnLm6N5diQyqo/HE8UuyU0tBS8bBAql8iy
 cQuqEt81HPyow/dFtWcz5Yf6mnz8eqmQiX+59PR7zxsY0MYtuL7pyGwfE+lo2Je2SHC2vby2VbY
 luZJP+0UhqMnHAc0=
X-Received: by 2002:a05:6402:202e:: with SMTP id
 ay14mr1225324edb.102.1610015014133; 
 Thu, 07 Jan 2021 02:23:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzckNMpNXeDb+Bb00VV5y/be4ZDIqlqFbrnEvrp54IE030Uo2ayPOwu5ieAI65zoeL8dfZC2A==
X-Received: by 2002:a05:6402:202e:: with SMTP id
 ay14mr1225302edb.102.1610015013861; 
 Thu, 07 Jan 2021 02:23:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id he38sm1393713ejc.96.2021.01.07.02.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 02:23:32 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <161000881348.18330.2540162310564338256.malonedeb@gac.canonical.com>
 <88bee064-f323-366a-7931-dc4bc40057e3@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Bug 1910505] [NEW] atomic failure linking with
 --enable-sanitizers on 32-bit Linux hosts
Message-ID: <605b709c-19b7-d692-5ed0-2c12a48a8bb4@redhat.com>
Date: Thu, 7 Jan 2021 11:23:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <88bee064-f323-366a-7931-dc4bc40057e3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/21 10:10, Philippe Mathieu-Daudé wrote:
> libblock.fa(block_io.c.o): In function `stat64_max':
> include/qemu/stats64.h:58: undefined reference to `__atomic_load_8'
> include/qemu/stats64.h:60: undefined reference to
> `__atomic_compare_exchange_8'
> libblock.fa(block_qapi.c.o): In function `stat64_get':
> include/qemu/stats64.h:40: undefined reference to `__atomic_load_8'
> libqemuutil.a(util_qsp.c.o): In function `qatomic_set_u64':
> include/qemu/atomic.h:478: undefined reference to `__atomic_store_8'
> libqemuutil.a(util_qsp.c.o): In function `qatomic_read_u64':
> include/qemu/atomic.h:468: undefined reference to `__atomic_load_8'
> clang: error: linker command failed with exit code 1 (use -v to see
> invocation)
> 
> Issue previously reported on the list here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg770128.html

Looks like 64-bit atomics are available without sanitizers, but fall 
back to libatomic with sanitizers (tsan probably?).

So CONFIG_ATOMIC64 is not detected properly in configure, because 
-fsanitize=* flags are added (at "end of CC checks" around line 5000) 
after the atomic64 test (around 400 lines before that).

I'm not sure what breaks if -fsanitize flags are added earlier.

Paolo


