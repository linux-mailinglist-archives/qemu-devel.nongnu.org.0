Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC97371348
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:58:11 +0200 (CEST)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVL8-0004Ry-Og
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldVKF-0003cH-Rs
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldVKD-0006Xh-Uz
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620035833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+7DqtfYQmFcCeeaROoBNo8vDFDIwo6JE0bPqZkeYN0=;
 b=ABj6rBFGwwHKETDLm1QHeg892SxsgPn5UVQgP3+tlvXbaAJVBvZxykTZ0fDeHe8Uj8tjal
 T0Nv+dENM6gO+QzUWRFxF6aHUF2FQJB827MVcSCp3aLaMnQxbEvHL5acuV6J6nl2VEUpYQ
 3UG1Exq/Gt9PfUjTAsKgtM8/pMUwRFc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-V-Jxcc5lNU6G7iIzEPfZOQ-1; Mon, 03 May 2021 05:57:11 -0400
X-MC-Unique: V-Jxcc5lNU6G7iIzEPfZOQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso2261313wme.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+7DqtfYQmFcCeeaROoBNo8vDFDIwo6JE0bPqZkeYN0=;
 b=eFNh2CYftiRZ1LXc5Zjdlj3FBEFeHsu33FlopTNS96MayF7yRTvE7/KIeMFpqi4qv3
 wy3qXLM6EN0XJS4hUB3Ear0XwvvKAub9JHFij5Ke9LZ7YPar1X3vAn2I+On2C84XvDgT
 nFc1BduVPSZSS6p/1TKoXSW7Pep4VL/MS4ybLWz9L8yiOv3spotcvlYO4QP7H6cwgXwH
 DHGdmWf3XKVLVMk4dQKNzcIHZt7WFfQE4Z0DXA8Eb8dJiAyedmFiBUGsKS+BsPgj6+AX
 DwBNbvO2MARwGr2sGPZvQ+8ORzROoyIRZvZ8GfWvbDhtRT9L9U5KYzgI94zPdoeRJioI
 eLjg==
X-Gm-Message-State: AOAM530l/rz4OYjy8pEkgfGUSHdxYweF474j/rx/KvPYI5WwJuOJTMrs
 chj1mShvJwLiuK/JE2bUeBFdvIEKur/gsEWB5OTZgoinjv0k5/RaJzlDhxyLqgKCh3jSsO3uvDU
 OKHOe4BvZigFHSD0=
X-Received: by 2002:a7b:c303:: with SMTP id k3mr21396415wmj.100.1620035830525; 
 Mon, 03 May 2021 02:57:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIcH9LRb3zEfXqGCzYJW0dTSrJ0WyMU4tkPlAZcXsmUvqDosy+cB+7eeIt1vdMwXCUyIGEcQ==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr21396396wmj.100.1620035830374; 
 Mon, 03 May 2021 02:57:10 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id m13sm11179658wrw.86.2021.05.03.02.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:57:10 -0700 (PDT)
Subject: Re: [PATCH 2/5] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210503091446.2137206-1-kraxel@redhat.com>
 <20210503091446.2137206-3-kraxel@redhat.com>
 <a65a7b1b-5dff-dd0c-2e00-4eafc1639bab@redhat.com>
Message-ID: <02b72bdb-96a2-d0b1-ca7b-1ba9cccdafd3@redhat.com>
Date: Mon, 3 May 2021 11:57:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a65a7b1b-5dff-dd0c-2e00-4eafc1639bab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 11:27 AM, Philippe Mathieu-Daudé wrote:
> On 5/3/21 11:14 AM, Gerd Hoffmann wrote:
>> Use autofree heap allocation instead.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Hmm there is still another use:

 618         if (dev->endpoint[EP2I(ep)].iso_started) {
 619             struct usb_redir_iso_packet_header iso_packet = {
 620                 .endpoint = ep,
 621                 .length = p->iov.size
 622             };
 623             uint8_t buf[p->iov.size];


