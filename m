Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF8332FDA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:27:06 +0100 (CET)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiwa-0000St-S0
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJhe1-00022v-LF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJhdz-0007a4-7f
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615316626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6j/zMx37Fx8V1GILLftlm8yekhZLLhRNo3dX/LZWhvU=;
 b=QSaouqZ4NluzTLd6mh4L+ovKI3ZD+CD1xXI7/R609kfCkn0EJLUoHkB1jtrzh+GIZmLLjR
 33HkcRSHr4U/5e9SsYy87+Jat/iG3/ujVEsEVdwNgw+TUQKf1ebNLlbiLRRE3MMkndLJhR
 Y2ABzg67//yF4Tft5X1+0f/isMX2rXs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-RcPF_c6-PaqRgB_cS7EZdA-1; Tue, 09 Mar 2021 14:03:44 -0500
X-MC-Unique: RcPF_c6-PaqRgB_cS7EZdA-1
Received: by mail-wm1-f70.google.com with SMTP id w10so1000779wmk.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 11:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6j/zMx37Fx8V1GILLftlm8yekhZLLhRNo3dX/LZWhvU=;
 b=d3FeZGU7vCpJbGsceslMcnY3sYUAfPtbkCpgVErUeoNhEOimcPqHZjKXphlu6k+uYu
 bGqBWWrXhD4IbZ1svV4y8rO+LoeTfjP89YtUSqKAIr78qpCjm1LjytdLpTp+7BR64hBQ
 zPQKwTTD/OYyT/vzACXRec/+9++CenIOsWYPo/rvI9gcpQsfCzCfUoQgr8YGDTuAk6nR
 /+fE+qXXslQ6ET1r8z4TZvPFA8r5W0uH9eutPwyP7IJZMC9Vvd495Vat1SA3EBGk832f
 s+5Dn0ic97PoC5zBrKQPotx46eM8iSGdGCe6lvGb+DHZX52T51pK1JBtn70rBRZUqYtj
 VHbQ==
X-Gm-Message-State: AOAM530adqCtxJBCdbjg+oJtLPcknVUqJTfjfHZ1st7wG36r+/IkX/4h
 wHR7jMnCl0QfRb0zZY5XbhYsr41IR65E49RsHVr/9PKRspCYVPTprYKVDhJ5JNhT+8Qisa2CG7K
 1ypcRVbx8djdyc/Q=
X-Received: by 2002:a5d:4688:: with SMTP id u8mr29752377wrq.39.1615316623422; 
 Tue, 09 Mar 2021 11:03:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0q/iFI0pkhulm1mYOpeHqXHWpVtkIvq0srFDJJqMKILCRD/8BeKy+j6qYtBTZm3zE0CEGrQ==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr29752343wrq.39.1615316623133; 
 Tue, 09 Mar 2021 11:03:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a75sm5584970wme.10.2021.03.09.11.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 11:03:42 -0800 (PST)
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
 <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
 <11854ebf-ed88-496d-8381-5385ef1b403a@redhat.com> <YEeM8eUUzm9AlaFI@work-vm>
 <48fd9bee-4542-533a-b893-7acf3744fe36@redhat.com>
 <CAFEAcA-jnVADA85uTxPUUHfPLacN5+-d=D8MjKzfr3bT2hL7gw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eaab7787-1a91-d3ad-a296-52f3b62e32d8@redhat.com>
Date: Tue, 9 Mar 2021 20:03:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-jnVADA85uTxPUUHfPLacN5+-d=D8MjKzfr3bT2hL7gw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 17:26, Peter Maydell wrote:
> The documentation comment for memory_region_snapshot_and_clear_dirty()
> says:
>   * The dirty bitmap region which gets copyed into the snapshot (and
>   * cleared afterwards) can be larger than requested.  The boundaries
>   * are rounded up/down
> 
> That is, it is the job of memory_region_snapshot_and_clear_dirty()
> to round the boundaries up/down to whatever extent it requires
> internally.

Or alternatively of the log_sync/log_clear callbacks.  I'll queue a 
revert for now, anyway.

Paolo


