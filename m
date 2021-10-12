Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368FE42A3DB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:06:54 +0200 (CEST)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGYX-0003Ao-9T
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maGUy-0000vM-0s
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:03:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maGUo-00031P-SI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634040181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNZZ6B9rgTd81M30j5MzzJGNjgiMEXGkz5Qbg8Q3EW4=;
 b=WAEbd6mNGOXyaIkPD3Po4XqIuG/Dk/XukZdr65NrauAFnlmop1Gm+IPn5/x68VNAIkoE1M
 U+6NTruUMJZ8ixVzL1WELi9unRjNigWpFLq4/5ha5oqD2/uYWO+JfEg8P8wIbXHVJ0do7l
 JC3MYh7quOHqVuiYY0mkP6wawA1CGuA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-BJgyQS8iPRefaggXlrUoHQ-1; Tue, 12 Oct 2021 08:02:59 -0400
X-MC-Unique: BJgyQS8iPRefaggXlrUoHQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso18642671edj.20
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 05:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fNZZ6B9rgTd81M30j5MzzJGNjgiMEXGkz5Qbg8Q3EW4=;
 b=YZ3BOnym43ycNZbh2Ov1epuybeDL8SoSH5VXqSqHGMxtq3CUrrjjmRiv1Fxh8qtQSQ
 2VcxkssBDzBCni9mGvahsVy+nbds8dvb5GDRimz/fZWkwGPEFTsZlFdKKrAKYWwz4gKi
 TV39gU+Sb0wMhjh+6coWYb5/qKZF0a95hLFWbEHN8qc/qJ1HcOuUH42gWh2/bqtTkxvB
 kJDqCjszGq/tC4Bpall9rcBEaSBPUHtkwkdusLYB6McBvgh1jgBJLS4lW5par5rE+/ws
 5HdE4WS84QnDVUWMFkdh/F7IzWosQ3r0zjLVhlmjQ+u/OGAe9M3Wogpjn57j4XyK2lwj
 NGiQ==
X-Gm-Message-State: AOAM533XdLywJhEmqTLzfNxPK/ZL8msMhXVst/VBMHSVuCt/5zKxcvGi
 dPbNzsC4jdUEMMBdWGcUu002qJ6L0b63uDZZdyJZiQ0YKT659PlsndzH+2SaE9eo9bka/VIl7qN
 7eoBzoCVn5SDIDzw=
X-Received: by 2002:a17:906:c256:: with SMTP id
 bl22mr20543630ejb.459.1634040178750; 
 Tue, 12 Oct 2021 05:02:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgXrNs51Y8z5bnyUkIlliPC0U5gLtQEBBzvhUs5rtFvKLH1dyxlQf6zyCfKrKoA/MYdMDuXA==
X-Received: by 2002:a17:906:c256:: with SMTP id
 bl22mr20543604ejb.459.1634040178571; 
 Tue, 12 Oct 2021 05:02:58 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id k19sm4779848ejg.13.2021.10.12.05.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 05:02:58 -0700 (PDT)
Subject: Re: [PATCH v2 02/24] audio: remove CONFIG_AUDIO_WIN_INT
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <df6e54e1-2ce8-ea29-6801-2b23941ac94b@redhat.com>
Date: Tue, 12 Oct 2021 14:02:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> Ever since winwaveaudio was removed in 2015, CONFIG_AUDIO_WIN_INT
> is only set if dsound is in use, so use CONFIG_AUDIO_DSOUND directly.
> 
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Cc: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130630.632028-3-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   audio/meson.build | 4 ++--
>   configure         | 5 -----
>   2 files changed, 2 insertions(+), 7 deletions(-)


Reviewed-by: Thomas Huth <thuth@redhat.com>


