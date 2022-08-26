Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AED5A2564
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:06:45 +0200 (CEST)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWEe-0006Kb-JY
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRW60-0004uO-ET
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRW5z-0006bA-1E
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661507866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9fA3BwVDOBweNOyXIjOYc9miMXaMFEtnyAF9zeaWNk=;
 b=BV7Ako5lciyBP2asZNgeXvFDHcjDReEWkWrFr+z5flgSGiiBGjPabUaZHiVu/YY8uTAlwL
 Z1T0ZJY6YMHx2Ap7WwYWrusWzlCp82LKJA9uEwG8V/7N57Ej0jDyXrgzPwv3licCN6WbIA
 Cr8m1BWsDSEFeo6uKVdJpAc4xEC3meA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-Sl0XCb78P2KhsCxlrwwWXQ-1; Fri, 26 Aug 2022 05:57:45 -0400
X-MC-Unique: Sl0XCb78P2KhsCxlrwwWXQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso3829971wmq.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 02:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=Y9fA3BwVDOBweNOyXIjOYc9miMXaMFEtnyAF9zeaWNk=;
 b=BmlMSXbaucyqL955TFIcO8oqsn3Fn2UrYy8I5YIVRovFoBAZGjQjzjli5PoHeJNhfF
 iCXvafVgV5wB+TYa4U8ND55J1/RGYXpSfG1nXITtoDkGqo7N03dZMy3Oh7y9qQUpqYQ+
 QlQ3YUkhRjMASI1CBVbLrO7ln4YMZub1PcG/6YwoCaD3PoRE8nopTY3uBEDUjWDBG17c
 TNKdDnxbXfVhTgTRZMFKwvqW0fmjwBflOEb2tniVKi9LqGarxF2EMjYiTjRtodGd3ijC
 54/TIqDwSIRgyx4v/2YumiMnnEqhxgGJmBkfyivLxNWPPlSIr3X2rhcJSgfP8WzcvnOZ
 8x5Q==
X-Gm-Message-State: ACgBeo3nDWvTYozuPMQAhRLBsCMn9I0gVG1g5boVuSoHFqpjsxAhRHhY
 2iTYiIw/yXt0aEvtDzQdCJhqGyLtofM1Q2+cWSIhx4qkmrJ1GM9z3KMEPLkuGNgR8p6mLIUttsa
 BZj8a3ihz3qRw2UU=
X-Received: by 2002:a05:600c:3844:b0:3a6:19a:d980 with SMTP id
 s4-20020a05600c384400b003a6019ad980mr4764806wmr.65.1661507864050; 
 Fri, 26 Aug 2022 02:57:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5u0wvYKGgqhtxZZfz1LiFxOW1wemMJqeyy1qOPC2RDlbKlug8XLFvWIKm3VA0zTWe5Pfr/1w==
X-Received: by 2002:a05:600c:3844:b0:3a6:19a:d980 with SMTP id
 s4-20020a05600c384400b003a6019ad980mr4764788wmr.65.1661507863719; 
 Fri, 26 Aug 2022 02:57:43 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa?
 (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de.
 [2003:cb:c708:f600:abad:360:c840:33fa])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003a63a3b55c3sm6008531wmo.14.2022.08.26.02.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:57:43 -0700 (PDT)
Message-ID: <35072646-3bee-ba0d-4b9d-6aeb117b8431@redhat.com>
Date: Fri, 26 Aug 2022 11:57:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] dump: fix kdump to work over non-aligned blocks
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-3-marcandre.lureau@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220825132110.1500330-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.08.22 15:21, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Rewrite get_next_page() to work over non-aligned blocks. When it
> encounters non aligned addresses, it will allocate a zero-page and try
> to fill it.

Could we simplify by using one global helper page (or caller provided
page) and avoiding the allocation/freeing?


-- 
Thanks,

David / dhildenb


