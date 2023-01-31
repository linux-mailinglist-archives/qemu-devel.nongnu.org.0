Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5B682639
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 09:16:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMlnY-0003dz-0p; Tue, 31 Jan 2023 03:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pMlnV-0003cA-IV
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:15:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pMlnT-0006E5-DO
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 03:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675152917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfmYTvVYlOxd69AlVIfPcx7/3UEa0xiY6Ya3L8fagww=;
 b=PMEsK/jkXR4BhofOoFS0KT16CX5fKEszmRIvW9TU9BpXtrmEO6JYHcGpMP7MPEjaSSf3s1
 FNm9UHeO29pmQwpL+wINUWaPgQSv0ypX4TtbvyzCyZxm4ghQGgtg9rO2O+L+/x2DdVceOF
 XqWMRV8LOlOGU1SlKN8Euk4O7RWLWZ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-MQhMOPCtNXm6JoPeqI9V9A-1; Tue, 31 Jan 2023 03:15:09 -0500
X-MC-Unique: MQhMOPCtNXm6JoPeqI9V9A-1
Received: by mail-wm1-f71.google.com with SMTP id
 j24-20020a05600c1c1800b003dc4480f7bdso5879202wms.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 00:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfmYTvVYlOxd69AlVIfPcx7/3UEa0xiY6Ya3L8fagww=;
 b=gwO4tX2EQdR+hPdnwI12NCCYY94Gplu3oPBTHzq2IuZvQaV4CJGvfA/BWHqjZTuG5d
 xUl3TlD8H1dyDndv9HXc6baoh0bEHY6gGq0cmVDRRXBHzh7BTA9tfawv/9lY0onZOLMy
 6YJmMePSzn5A0+xuCAvriDEwxa9cQNkSrL6sTJg72pB/5W8ViCmQR03nBQefoaJ+sjMJ
 W48LTybKDKuYcmfruGkLJHQbdUt5w56wT2RVVpWh17P5u2VXn30kx2n2aD8xfHfRWD4s
 bDzfzw/tNMNRs13ynoGOU3PBKOZZ+bLP29qouGSCBemv1pSBfJu7WWCrE/uKmbjS3Eec
 CS3g==
X-Gm-Message-State: AO0yUKX+wX5gL009vt7OmGuSNSypuNpny4HNTWxZaS4U0AOTb/iVYFVK
 LpkfNtx/tFV881EINAc3zP2Saky1BcqCCmdrJIJ+igiF/OmNqc699c1BkLzAN0SdZK9BU/cOrCO
 0SeGDCgN0kEVH8Rs=
X-Received: by 2002:a05:600c:1d02:b0:3dc:5ad0:e583 with SMTP id
 l2-20020a05600c1d0200b003dc5ad0e583mr5707283wms.22.1675152907991; 
 Tue, 31 Jan 2023 00:15:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9YGFZlVUNjVL5gIbocQuFdsuRRCrmKt2qwjW/Ox6jOnfRm4gcCjwVLXPZT9r/TsfRe08ZZnw==
X-Received: by 2002:a05:600c:1d02:b0:3dc:5ad0:e583 with SMTP id
 l2-20020a05600c1d0200b003dc5ad0e583mr5707259wms.22.1675152907672; 
 Tue, 31 Jan 2023 00:15:07 -0800 (PST)
Received: from ?IPV6:2003:d8:2f0a:ca00:f74f:2017:1617:3ec3?
 (p200300d82f0aca00f74f201716173ec3.dip0.t-ipconnect.de.
 [2003:d8:2f0a:ca00:f74f:2017:1617:3ec3])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfdccd000000b002bbddb89c71sm14026283wrm.67.2023.01.31.00.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 00:15:07 -0800 (PST)
Message-ID: <92bd7f1b-e7a5-f3a8-2838-8eae8af8110b@redhat.com>
Date: Tue, 31 Jan 2023 09:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] softmmu: Use memmove in flatview_write_continue
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20230131030155.18932-1-akihiko.odaki@daynix.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230131030155.18932-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31.01.23 04:01, Akihiko Odaki wrote:
> We found a case where the source passed to flatview_write_continue() may
> overlap with the destination when fuzzing igb, a new proposed network
> device with sanitizers.
> 
> igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
> buffer. While pci_dma_write() is usually used to write data from
> memory not mapped to the guest, if igb is configured to perform
> loopback, the data will be sourced from the guest memory. The source and
> destination can overlap and the usage of memcpy() will be invalid in
> such a case.
> 
> While we do not really have to deal with such an invalid request for
> igb, detecting the overlap in igb code beforehand requires complex code,
> and only covers this specific case. Instead, just replace memcpy() with
> memmove() to tolerate overlaps. Using memmove() will slightly damage the
> performance as it will need to check overlaps before using SIMD
> instructions for copying, but the cost should be negligible, considering
> the inherent complexity of flatview_write_continue().
> 
> The test cases generated by the fuzzer is available at:
> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> 
> The fixed test case is:
> fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Alexander Bulekov <alxndr@bu.edu>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


