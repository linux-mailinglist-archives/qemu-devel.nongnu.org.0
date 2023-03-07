Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747366AE55C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:50:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZaD-0002Qx-Te; Tue, 07 Mar 2023 10:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZaB-0002Qm-Ka
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:50:31 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZaA-0007wN-2m
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:50:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id f11so12588071wrv.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678204228;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MWSYRcvhv18kO9UycBowWGj3UGWJGjeRF8hkDLddAnw=;
 b=icBuxwslhLrOMTy5I7vm2T2mpZoTCu95iqLT16VD7FbsgbLnAU7F81ux9RFOlYvk/I
 Bgl/zLKiJLUiA1UtahdZEdvyuie9O2N5icBrwjxpVZM7FC1+VTPEk/I2eafVaplatdXy
 U1yDk6zhh8IPl52f9S1Qe9lrdGH0i8PBfzLhXkWmp13hB57juTr1Pc/HFpysX7Sl/Tjj
 iNRsTj02ZQPbENBh6MjMhXU9p2716zhSY6KAj4CeuyAXCSmprnC+yMKZfxIa4uND1IVn
 DB3F81sgje7wl/uA23wo6wMo8wpDAi0kSlXaCB+/qUH1g7RJoEC+DOsS6aEuwGjSeTFC
 thfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678204228;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWSYRcvhv18kO9UycBowWGj3UGWJGjeRF8hkDLddAnw=;
 b=hEXGlq+UAzPz2dPf+BEBDbmSfS+TcJdkyLLoKRlxoMJV62gWG7B/G657H5rQCyFaEu
 /GwADbHagjVjZbnTqqxXcOlTV4GZDjC+sbJHF0gSP8y4QsMryzcPwAxROJsRPg90J4Xj
 Vcn0SaUehI6vJU9cXl7NGmGz+YPRufKjQz82Tc/0D+LoQWnXe2vjnFkTlmU7/ocWjjyy
 O9iV860xD4Oh1KBA5s0zX6XR9148ZIXkfsPEJgREYQKXkif25AI0wQRrsYI/MtSwitMf
 f2lFXRSGtTCy40iPLVAQQroRrYZpXQcNVECfquqOjSidWMeSDjUZpSz18d7C9sG/YFQO
 ibbg==
X-Gm-Message-State: AO0yUKVYEZn1gJCZed6oniY1sWbpN9+cSUtfUgBZ7NqMaK4TtFEBQJG9
 ZrpcO8upqp/sWMIjMNP6KdeqkJqdRMRtHw==
X-Google-Smtp-Source: AK7set+zBrHtpSx4jAXOTaZMvS0yDMKGWu3x+UAp57CUGBYi9lpfuVY0omqDkZ9fEUGBvzuLj5HpjA==
X-Received: by 2002:adf:dd89:0:b0:2ca:b27:e570 with SMTP id
 x9-20020adfdd89000000b002ca0b27e570mr9804043wrl.15.1678204227863; 
 Tue, 07 Mar 2023 07:50:27 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a5d591c000000b002c6e8af1037sm12843317wrd.104.2023.03.07.07.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:50:27 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fcc36485-5a45-7fbd-e0fc-3904865928b2@xen.org>
Date: Tue, 7 Mar 2023 15:50:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 20/25] hw/xen: Hook up emulated implementation for
 event channel operations
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-21-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-21-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> We provided the backend-facing evtchn functions very early on as part of
> the core Xen platform support, since things like timers and xenstore need
> to use them.
> 
> By what may or may not be an astonishing coincidence, those functions
> just *happen* all to have exactly the right function prototypes to slot
> into the evtchn_backend_ops table and be called by the PV backends.

It is indeed an amazing coincidence :-)

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

