Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E123513EF9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:18:55 +0200 (CEST)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDPS-0007vl-5F
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDNq-0005DD-P3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDNn-0007is-2Q
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651187829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Wrq4Yt9Q0NbfS4PXQKer+vlA7uNuxoRdX7xA8bdmHQ=;
 b=RbZcB8j9ueN09YIyk509tA1DwWlCIC9CsH/934IAczTf42w4sCBCrPw2H9f+tgsSg537bi
 lZhFDnUFRNX2d6AqMxsnHnW8nfJC2OXh8OA7OsGp8UnFOa2w3WaHdc36PuykR5voG5F3Gr
 mWd2MjTEI8N98p2ad8fkzGhYiZV0cjU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-qR9TgTOmOm6h_BO9xtMDAg-1; Thu, 28 Apr 2022 19:17:08 -0400
X-MC-Unique: qR9TgTOmOm6h_BO9xtMDAg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s24-20020a05640217d800b00425e19e7deaso3496856edy.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 16:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Wrq4Yt9Q0NbfS4PXQKer+vlA7uNuxoRdX7xA8bdmHQ=;
 b=NtHotCosTa1mG3criU3Mp9ALGP0QrSuMMTxsLe55UEe2x8tdiEnUf4hNDFYAviba43
 CsBIg26Q0YB+XeI5y8zoQQi2l0y88xHzLx1DAPu6+1csEP9rUvMDsXpmToSBl1Pv6VGv
 u00kUWDDmE/aAdg1Xa+dJaiENg3vGV0DCATPtY+KYl0GtpuESSZND4PctJKHrkMgp18V
 x4KUf4hoS9aqhQevlaOyaOdeh5V1iOLiJoRowskcgqKx2h9u4M3K5CNJfsM7nNffMXLu
 rwb38JFtpT7ZISfJw1QSqpRfbSiaxzL/APVym0kLCsvEhtGW4WsjthuUf+yLAvx/RduT
 STvg==
X-Gm-Message-State: AOAM5318y/78zG6o+lB8uWnxZTtdUSzM6hrd2YqGd5NQ0lSvGlEvvLRX
 Pl8FxytI6LE80lDLlEHC7vd4hQnRXq2ojfqui+xgzqyr/MiFmE8XuasqitiXxahf600sabmnzB/
 7f+sRpmfValA3l2A=
X-Received: by 2002:a05:6402:485:b0:425:a529:c29e with SMTP id
 k5-20020a056402048500b00425a529c29emr38390290edv.354.1651187827154; 
 Thu, 28 Apr 2022 16:17:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXuTYN4grRjaHrYfaw1Aq4mMemLZHb4jibPr2iGZFtJZCAgxFLKAIZ2nmAa6fslhPIkaT9pQ==
X-Received: by 2002:a05:6402:485:b0:425:a529:c29e with SMTP id
 k5-20020a056402048500b00425a529c29emr38390269edv.354.1651187826941; 
 Thu, 28 Apr 2022 16:17:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 d2-20020a170907272200b006f3ef214e1dsm104601ejl.131.2022.04.28.16.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 16:17:06 -0700 (PDT)
Message-ID: <ca28d5bf-5bd6-e002-c420-ed9b98989555@redhat.com>
Date: Fri, 29 Apr 2022 01:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/6] virtio-scsi: don't waste CPU polling the event
 virtqueue
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-3-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220427143541.119567-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 16:35, Stefan Hajnoczi wrote:
> This is typical for rx virtqueues where the device uses buffers when
> some event occurs (e.g. a packet is received, an error condition
> happens, etc).
> 
> Polling non-empty virtqueues wastes CPU cycles. We are not waiting for
> new buffers to become available, we are waiting for an event to occur,
> so it's a misuse of CPU resources to poll for buffers.

Shouldn't polling wait for _used_ buffers, rather than available ones?

I agree that it's generally useless to poll the event queue, but not 
because it doesn't empty the virtqueue.

Paolo


