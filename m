Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19923BDEC5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:11:09 +0200 (CEST)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0sLV-0007UV-0I
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0sKf-0006pc-UB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0sKd-00043G-5q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625605813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjzGZBVJt9r3Bw3Hy+XN9eFTJLeCmDhM6WVhb8S6cho=;
 b=WZEheI0eo1qqpeqgRKg6mvnIia/SKs6F9jRrLjal5tnxvn8R8IP8vAlveQFGkxKJjIiso0
 tlK/nKSdXrzA8u1t3pb3JysFKUxPhyXz0OCGeY3zIhEtuu1NjpKWrmgK/cMESa14pAP7E9
 iYMmcZqu4skqUln0xjTSEI5LeDrTkdk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-f0aUTI0MNh2r224jiKctkA-1; Tue, 06 Jul 2021 17:10:11 -0400
X-MC-Unique: f0aUTI0MNh2r224jiKctkA-1
Received: by mail-wr1-f69.google.com with SMTP id
 z2-20020a5d4d020000b0290130e19b0ddbso114425wrt.17
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 14:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mjzGZBVJt9r3Bw3Hy+XN9eFTJLeCmDhM6WVhb8S6cho=;
 b=TnGA1f4I+vcrZgVvAWDaOvtpOslDCDUOCujKtmabjbeU6qoZcOr0anB9k7GqCmRd/S
 yM8Hq/kdPMQMvby0O0JbNKMGBA2GPBd9QKoDT5dYZQxlsZXNXm3xoOJBWSoZZMnhTuiG
 4M1/RlIkrZZPEoljb8u7OKbOpt/c35ORoQ7vToqcDyZJNnhkG1OxYwq1FshlNogHVhwP
 23c/s3VuIHL8EMXYvcMP2hMPPLYjRVaeG9ikLiU+stB8vMDJVQ/RPeYhPPKaOBVvpvO4
 G8fejo1ZfG4tEGLyviJF7isd005FNbJHmunYrhMbnMAuhEpqv3ne4Y5oTqYOsfA81nCo
 Q7Ig==
X-Gm-Message-State: AOAM531GTXfcnKHD4Wb9owpSlDvY2jvXo9cGO/UhG3KRAYhHY+Rc3NW8
 dV/5SGeciUXwAaPVZwzJqwEUB1/HkmBv/4qN6jZvt2VVQ2vS16yWD85sTKqdTuQABHZHcihOA7z
 jJTkdUaTriRaiU3Y=
X-Received: by 2002:adf:f346:: with SMTP id e6mr6417300wrp.28.1625605809542;
 Tue, 06 Jul 2021 14:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH4ZQ8JEFVG4Ee8AETg/Qy6xXWO+ths0xiilJmdqP+8F9RPF4CNzgOlBfbvNHpPY2WVxhoZA==
X-Received: by 2002:adf:f346:: with SMTP id e6mr6417286wrp.28.1625605809383;
 Tue, 06 Jul 2021 14:10:09 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm17039136wmc.0.2021.07.06.14.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 14:10:08 -0700 (PDT)
Subject: Re: Plugin virtual-to-physical translation incorrect for some IO
 accesses
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <YOTBZiyOcNYcqjOO@strawberry.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3c2440e-bd91-1671-f9dd-e297f90d01ab@redhat.com>
Date: Tue, 6 Jul 2021 23:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOTBZiyOcNYcqjOO@strawberry.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, cota@braap.org,
 richard.henderson@linaro.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Peter/Paolo

On 7/6/21 10:47 PM, Aaron Lindsay wrote:
> Hello,
> 
> I previously supplied a patch which modified the plugin interface such
> that it will return physical addresses for IO regions [0]. However, I
> have now found a case where the interface does not appear to correctly
> return the full physical addresses.
> 
> In particular, when in qemu_plugin_hwaddr_phys_addr() for a particular
> store to IO memory (haddr->is_io==true), I find that haddr->v.io.offset
> is 0x0 and mrs->mr->addr is 0x3000, meaning 0x3000 is the returned
> "physical address". However, I also find that
> mrs->offset_within_address_space is 0x8000007000 (and also that
> 0x8000007000 matches up with what an actual translation would be from
> inspecting the page tables).
> 
> Would it be 'safe' to *always* begin using
> mrs->offset_within_address_space as the returned physical address here
> instead of `haddr->v.io.offset + mrs->mr->addr`, or is there a reason we
> should not do that?

'safety' is not my area, but using mrs->offset_within_address_space
sounds correct to me.

> Thanks!
> 
> -Aaron
> 
> [0] https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg03137.html
> 


