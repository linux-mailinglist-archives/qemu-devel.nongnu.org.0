Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F96441E18
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:26:03 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mha8I-0004yX-PH
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mha7E-0004D1-Re
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mha7C-0004u0-4U
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635783892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZz6F3Bgk787luW7s72exqeQhSQJ/Y7P0zhIACe6aM4=;
 b=FccoFDjEYIlpmmAWFhGcC7YfHmUvu81MwY23gwzoQeOo/1JVUPvMeKpMQxYXoTRu3bLZlS
 C3CczQakj44uAJa+FJIY57W9cupkbqtCP185dgQlRaFzysyH73wTSpQf6k0fQGbwx0byi+
 zxWK1Q8Q6CvA0LzF3gJGmBLPeLjq+gk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-ASrUzWh_Mm-xUJi6QoQbIQ-1; Mon, 01 Nov 2021 12:24:51 -0400
X-MC-Unique: ASrUzWh_Mm-xUJi6QoQbIQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so6411510wrb.14
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FZz6F3Bgk787luW7s72exqeQhSQJ/Y7P0zhIACe6aM4=;
 b=3L62NmkORPVtZN/8YdJE0Z4JHMUZn7hqjGy6l6M55rGGIQULa4JwugjNfa5KpeaD2d
 ZuCRQDzdhmvRANKkcuPWl6WDDMSMDplEw/dCUwpb2tMKPRwpBw9slFcnisXhod2J4BbP
 xIc6iLXhksz4k2qLiIlGbrPSM9qJGlDUlv7xSV4V3GdLXeKfwHWUk/R7TmklQit84p+D
 qDzEr9hg6ZUFg72bY0M941TnLGNIlCEu9jkoEsIsruLC3GjLk+xaTXE9KHcsvmA251u1
 MvnztXX7jEmHFAEcAz5cYku4rXQiF2wqnaBwlXQnPWEWwv4pD7FjnT88m39oUonGTLgE
 788w==
X-Gm-Message-State: AOAM5306oCDqA80j0TCtrDI5wmeKDj5LTbmPpHoeZj5/JgK3LpGm8661
 02cOXwdNEY2kUhp30KyFnEYvS22Vg9MM+RODmAhciJFGT0aXT8kkdI6+cpDAhyD/RrFqjjb3DrE
 XAiyBZdlQoJivN4M=
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr31051857wmd.143.1635783890403; 
 Mon, 01 Nov 2021 09:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXMVGlYryrDRi+7T5nfhR+o3FiJVmeJzt3VrLsnXTb75uEqTA9sUJuI78r0P/+wfRnEi43Iw==
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr31051836wmd.143.1635783890174; 
 Mon, 01 Nov 2021 09:24:50 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s13sm16844703wmc.47.2021.11.01.09.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 09:24:49 -0700 (PDT)
Message-ID: <9c9561e6-047d-a92a-e7f3-d53cd526ca64@redhat.com>
Date: Mon, 1 Nov 2021 17:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Qemu-devel] [PATCH 1/4] machine: Move gpio code to hw/core/gpio.c
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20190425200051.19906-1-ehabkost@redhat.com>
 <20190425200051.19906-2-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20190425200051.19906-2-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/19 22:00, Eduardo Habkost wrote:
> Only softmmu code uses gpio, so move gpio code from qdev.c to
> gpio.c and compile it only on softmmu mode.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/core/gpio.c        | 206 ++++++++++++++++++++++++++++++++++++++++++
>  hw/core/qdev.c        | 184 -------------------------------------
>  hw/core/Makefile.objs |   1 +
>  3 files changed, 207 insertions(+), 184 deletions(-)
>  create mode 100644 hw/core/gpio.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


