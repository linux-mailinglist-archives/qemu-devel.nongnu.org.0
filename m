Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7701B6658DC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFYDZ-0005Vq-Ut; Wed, 11 Jan 2023 05:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFYD5-0005RZ-Qx
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:19:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFYD4-0004pc-A3
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673432392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VI2eDT2ryENJVhQitFSpKX22+2rY+w3pRoZM7E4o7bQ=;
 b=S1CNu5xJ0h7XXFa5NzXMDKVLYWB0Zy1evDEzdfAzgPy/9gkwbb6GcmZz1jhN31z0b+B8bk
 LYuQbnkSqiEhN67xEzof3I005yPgHbnYy53AtKFJZfZw+RcGjRvAMkjdomdiiLgBTg2DZa
 +12bNLQhmG5dBrrRu9dhfh9pQQeynWk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-7qN-MNB_MeGZsQEVRAPOEQ-1; Wed, 11 Jan 2023 05:19:50 -0500
X-MC-Unique: 7qN-MNB_MeGZsQEVRAPOEQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so7606246wmb.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VI2eDT2ryENJVhQitFSpKX22+2rY+w3pRoZM7E4o7bQ=;
 b=on2olsykmYgPlqCIkya7o4vmkRIoWdRLe7gnTU7cczeNMTfzgObwo2EzX0IqQCfuYe
 OukEy4DN7mUUHzGqbzC7iZPCVNp/AeQf+JD4h66TdKjI/FsguawHiIsdSSAGGCUmGu80
 oFFu1D6XrQW9YnHbMuNxvwcqxI6hHULCetMVVTBN4DSRwe5xpA1m07gyK96adkTkyzWu
 N4F0ROrYPPi5oWBMrRBr7n3FMF9WrnYfEwvgD4waCnTKS3gyKSyaZE+fQgGfJ7AV3q6f
 6HNMcp0UltQr7tYTm776r73jRDtJqvek27FZfT5qOtnm1puWGIxCkSTBbogSqd+lAO/3
 Mg5g==
X-Gm-Message-State: AFqh2kqHYgwufxaJEi9neqE7u83hYZ8N8ZqzebE13intpgseDqMidxUk
 fbSgEOao4gQrh0GamZXNFguiM80iM70h9yRA+1axVINICWtp2W0JoKmHr607KbrBQLlofBnzcWc
 vgTZUcLKD9QfLb0E=
X-Received: by 2002:a05:600c:4f4f:b0:3d8:e0d3:ee24 with SMTP id
 m15-20020a05600c4f4f00b003d8e0d3ee24mr52618920wmq.37.1673432389823; 
 Wed, 11 Jan 2023 02:19:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvQAlMNgQ4HMtSHrZkYWQ9mgbS0w0S5+sT2TtEOqd/qrNm2MAOvdeYCH/QYvi7JnFd7mv6EwQ==
X-Received: by 2002:a05:600c:4f4f:b0:3d8:e0d3:ee24 with SMTP id
 m15-20020a05600c4f4f00b003d8e0d3ee24mr52618902wmq.37.1673432389525; 
 Wed, 11 Jan 2023 02:19:49 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm22169021wmb.14.2023.01.11.02.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:19:49 -0800 (PST)
Message-ID: <e75f7613-63d1-5fb1-9cbe-ff9bda9b1eed@redhat.com>
Date: Wed, 11 Jan 2023 11:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/7] target/s390x: Remove TLB_NOTDIRTY workarounds
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-6-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230109201856.3916639-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09.01.23 21:18, Richard Henderson wrote:
> When this code was written, it was using tlb_vaddr_to_host,
> which does not handle TLB_DIRTY.  Since then, it has been
> converted to probe_access_flags, which does.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

It's been a long time ... I have to trust you on some details :D

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


