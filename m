Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB32467A4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 15:46:11 +0200 (CEST)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7fSk-00057q-Ty
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 09:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7fRa-00047u-MF
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 09:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7fRY-0007s6-Vx
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 09:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597671896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+Oea2y1yErNNJIcZ+U3Q3QBCKEekuGPRvwjuTR4vV0=;
 b=URf5X279R6q7Tg1grHt0EI19vVqZFUE5zGHaL37tKxpvvWKZmmxC2rJ2n6R/Mk5yrQUUlP
 MsSXdBGU9CerhZdVxTDmrSwYAG7Atx0DvOuLptl8iJLef5KotXdMxHjsAmOAyG+x7NYwb/
 /W6ZOo4IpV/h8SaQ9Ma66eggMHxOMRE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-caoPhLfCP7uu3ZE9ie2_kw-1; Mon, 17 Aug 2020 09:44:52 -0400
X-MC-Unique: caoPhLfCP7uu3ZE9ie2_kw-1
Received: by mail-wm1-f70.google.com with SMTP id z10so6036340wmi.8
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 06:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f+Oea2y1yErNNJIcZ+U3Q3QBCKEekuGPRvwjuTR4vV0=;
 b=kGCNf0YTe/e/wDhE8xn2osReqQP7F6w9p9GmSZHK6b9Dx8d4mXQkzjY9BG1K5jtyEO
 OzDAs2eAlTvjFJqPA3ayZ0PobT1NPMVfyxyerw+mx42h0xtFdMi1LFeS3Zz+KqqA7fFz
 qn2BnAqUzyrdwcv1sRMN8tbqaPYHoxXLmuHbPu6y5MUC+ENesOkIaFenh0NQFYRQ6Qwr
 kuKAoKscqG8ZAXmlcnh6olYzKraeEcw8KGeFaPzmziqy734Pipmwpe27I76qal0KWQr/
 hWXlPnlnUYwgfmmRbuyIrxcCmvC2PNrl8tMTTZI5lwVtJl0vnzSISYFZF2We/qLbv2RZ
 sFgQ==
X-Gm-Message-State: AOAM532YyCVDcDShcy1Cbu/745mSyObEBIoe6qAARZ35d5CmVYHp2qDy
 tApn9TQXqL8MD+iYi7kfH/N/oJQSINUnVw2kMSePFKYDwIY7ZDoVGGGyEtZ3hc0quEHsyoqQSoH
 ff3ENcg7bIvswASg=
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr15186876wmh.4.1597671891607;
 Mon, 17 Aug 2020 06:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCnd6cIbH9kPPU+XmTtlK9AwO0IaqgKPq/SXCNh0EMgr/FKIJYXUX9e0RZA0Z1KQTUzD4WTQ==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr15186859wmh.4.1597671891366;
 Mon, 17 Aug 2020 06:44:51 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id 32sm32001391wrn.86.2020.08.17.06.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 06:44:50 -0700 (PDT)
Subject: Re: [PATCH 025/150] libqemuutil, qapi, trace: convert to meson
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
 <20200814091326.16173-26-pbonzini@redhat.com>
 <20200817111000.GB98227@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1bbb9009-e708-6893-4823-09a393b1f4a0@redhat.com>
Date: Mon, 17 Aug 2020 15:44:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200817111000.GB98227@SPB-NB-133.local>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 01:24:49
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/20 13:10, Roman Bolshakov wrote:
> The patch conflicts with the latest tracing PULL request, object files
> shouldn't be generated on darwin:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg02493.html

I'm afraid conflicting pull requests will have to be respun.  I don't
really have the time to catch up, especially around the beginning of the
development of 5.2 where there will be many conflicts.

Paolo


