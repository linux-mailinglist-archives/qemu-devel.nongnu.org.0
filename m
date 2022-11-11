Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8A625943
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:23:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otS7o-0005DY-Jt; Fri, 11 Nov 2022 06:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otS7l-00057i-Tw
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:23:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otS7k-0003d4-JK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qgjAa4QznFlSnHDbJctlEoOMS4nnL2i3c4Chznf5HU=;
 b=JV7/ure6qSA5cKNkzvG8rUmbzSRjKdfytLkPDHpQhk9shz+NbOE4+urcyX0h612DuyJq41
 MR2XNNkiLZuTiWovDS1bLGjss7SBZJlgwv/GdTjDEPQudeYOsas1ycmdhofC4mISL9yuEd
 SMn9NoxlLOUK2UV1u1Pyvx8XE/I106I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-3FvPOaaVMESPXOkDnlGQJg-1; Fri, 11 Nov 2022 06:23:00 -0500
X-MC-Unique: 3FvPOaaVMESPXOkDnlGQJg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s11-20020adfbc0b000000b0023659af24a8so941651wrg.14
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0qgjAa4QznFlSnHDbJctlEoOMS4nnL2i3c4Chznf5HU=;
 b=2YiUThYjj5Ti7Qied/tpfI0eSb4r0vh4cKeIT1dtbsT6J0O38CJH6KjKiaxZ4DZQgt
 KO0ukiMSvFcRB5sQVqo+mMCpGxFiF5acsKis8gq8DLWnQJKEiV+Z6ZfWy+vvrUNask6w
 otZ2TDzum6s4YE6qYujoeSoA7VbtbFqhMO+JiE5O/EQp3/lhp0j8UcNMJMIuWHOf5eHb
 vxYbJP2OrGH0OGacLbFKaQOChnxbwW/XbtFCBShJvUyWPtnaM5vyjjMqzv7/G2PKF9G1
 IrDMb356iBJX779ei4mjV2mTJHXfQRUUdJKltYxANC1eXVKc9g5peo+lbZfgfFOBMw3z
 dQLg==
X-Gm-Message-State: ANoB5pkx5CWazH4bw7BA9y010iwMA7qNm/mQ4YeaDCZhJ8/6SolxlGCU
 fQepGFkcxiRcgeEbCmShgmSAUZsa9Moxw2Nk/PoGfcrMMEkCyLkEG2sHh3B4B27PccGX9lQkDE6
 pXdHCQeXWpaMdxho=
X-Received: by 2002:a5d:6086:0:b0:22e:71db:47ba with SMTP id
 w6-20020a5d6086000000b0022e71db47bamr988516wrt.359.1668165779229; 
 Fri, 11 Nov 2022 03:22:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4mlnL82KRYylZxmVqhea/BpiljeM1OnHlwneubSczFtPqeazDFuHAizZeLMnrObJlpObcDtQ==
X-Received: by 2002:a5d:6086:0:b0:22e:71db:47ba with SMTP id
 w6-20020a5d6086000000b0022e71db47bamr988502wrt.359.1668165779009; 
 Fri, 11 Nov 2022 03:22:59 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 x11-20020a5d54cb000000b002415dd45320sm1624191wrv.112.2022.11.11.03.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:22:58 -0800 (PST)
Message-ID: <d88e84a8-4bad-d491-6563-b5f30df9a700@redhat.com>
Date: Fri, 11 Nov 2022 12:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Is bdrv_poll_co() IO_CODE()?
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <Y21sUJMNc/I8iCzg@fedora>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y21sUJMNc/I8iCzg@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/10/22 22:25, Stefan Hajnoczi wrote:
> Hi,
> bdrv_coroutine_enter() is IO_CODE but is called from any coroutine
> wrapper function. When there is an IOThread and main loop code calls a
> coroutine wrapper function then I think bdrv_coroutine_enter() is called
> from outside IO_CODE?

No, I think bdrv_poll_co() should be IO_OR_GS_CODE().

"These functions use BDRV_POLL_WHILE(bs), which requires the caller to 
be either in the main thread and hold the BlockdriverState (bs) 
AioContext lock, or directly in the home thread that runs the bs 
AioContext. Calling them from another thread in another AioContext would 
cause deadlocks." describes it very well.

bdrv_coroutine_enter() is IO_CODE because it's able to start the 
coroutine on the right iothread (using aio_co_schedule() if needed).

Paolo


