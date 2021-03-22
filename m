Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3393444FC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:10:56 +0100 (CET)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKKb-0007yy-9j
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKJV-0007ZR-AR
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:09:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOKJT-0006vB-Sb
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:09:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j7so16668980wrd.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b3e0s0qx5K1Nbb+8cOhZWBLL2fGPlLMhCFpvS0I9nwY=;
 b=gJPNM4wYURHgKrmINBUb2ddC/mKyVd+VNCmLQQnFtEqpFQZ9IFfghGV699V7HMVSah
 r+L/fxDVQAeN75rIIFtH1PePjG2Wq5Nt8HmSl0GbS6AkKSm46IkScfxQPz2gloo+KHWj
 QcLFQMxm3dkKwSGiyGQ20ognlEzUDQjZdPmip9YNk76XhHrf03EovoOPODQFXw669DM/
 w0x0Ku9WJ+sn+TQzF0F+b/OGs/nk9mLptck8d5C25uot79x1jeikTDRKkBCJhnA2Jkz5
 0LQHB5WINaBkFHyjy0bN41GXkKvlKpe9vEXhzitO1GFM2XHivDW9fEhsnZ0SExh8HoiD
 Z+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b3e0s0qx5K1Nbb+8cOhZWBLL2fGPlLMhCFpvS0I9nwY=;
 b=WevsI2fcUFaHiUEO6WpM2CIrsC6buXlPXE8Bgr5l/QHhM7K0sHDLmqOk+xZ6qm+Qdb
 /+Z2WRnMmG7ACzm/N+HW7laasUc7zt7FNxSe0eZbOniK1LQBuhhvboaElcWuT3qirKC4
 hMd4XxQChDf/P1l2ugfge+TnejGlfXDwXKeNqAykNIg6nxz4IP3RLAxFDVLrLGI6h/jj
 6VWf2/e+NCFmujPzByGkRiJEZAWYtuhrkrSB0QkJ/OL+sfaDIMOQ7viFFwbw+eMqAjYH
 ZiNCbVTK7whnptq/OpW+p5WmGklpaFMj7B6ZrpMaXpb/l8c4Gq3HUcmORtnZ4CRNH/Lw
 GFKQ==
X-Gm-Message-State: AOAM531LR7RN1oUN/K0cnJUwFS322+0TYc1GPZep93idNZLu7BDs8oXZ
 DV/AJiY8vOi+HDdP4DIurb8=
X-Google-Smtp-Source: ABdhPJwuchnPlqxDbHqWEYL4K5KXqBG7a5sPpt2sZGEJEeyb1lOzxMDrIt6COI5lns47ccTgjsnwdA==
X-Received: by 2002:adf:f148:: with SMTP id y8mr17817125wro.107.1616418582001; 
 Mon, 22 Mar 2021 06:09:42 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o2sm16014840wmc.23.2021.03.22.06.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:09:41 -0700 (PDT)
Subject: Re: [PATCH] tests/meson: Only build softfloat objects if TCG is
 selected
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210322114739.4078408-1-f4bug@amsat.org>
 <4962691b-b5fb-535e-2aec-55eaa0cfa9a9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <faf72503-ce74-d04a-bafb-79db97937b51@amsat.org>
Date: Mon, 22 Mar 2021 14:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4962691b-b5fb-535e-2aec-55eaa0cfa9a9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 1:57 PM, Paolo Bonzini wrote:
> On 22/03/21 12:47, Philippe Mathieu-Daudé wrote:
>> The previous attempt (commit f77147cd4de) doesn't work as
>> expected, as we still have CONFIG_TCG=1 when using:
>>
>>    configure --disable-system --disable-user
> 
> But there's no change in behavior with this patch, right?

I'm trying to save CI minutes from the build-tools-and-docs-debian
job which uses:

configure --disable-system --disable-user --disable-tools --enable-docs

See https://gitlab.com/qemu-project/qemu/-/jobs/1117005759:

[77/1268] Compiling C object
libqemuutil.a.p/meson-generated_.._trace_trace-qapi.c.o
[645/1268] Compiling C object
tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_writeCase_a_f32.c.o
[1079/1268] Compiling C object
tests/unit/test-clone-visitor.p/test-clone-visitor.c.o
[1132/1268] Compiling C object tests/unit/test-qdist.p/test-qdist.c.o

> 
> I would rather first start removing CONFIG_TCG from target-dependent
> files (such as tests/qtest/bios-tables-test.c and
> tests/qtest/qmp-cmd-test.c), and then just remove the
> 
>   config_host += { 'CONFIG_TCG': 'y' }
> 
> line that is not needed anymore.

You seems right, I missed something, I'll revisit...

Thanks.

