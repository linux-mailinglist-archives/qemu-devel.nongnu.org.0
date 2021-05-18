Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A522538747E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:59:59 +0200 (CEST)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liva2-00053z-P9
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1livYx-0003xq-6R
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1livYv-0008PB-GS
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621328328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8bXlpMdXMzxzHVs6jB78r2xTJ+tUx+V3hqy60avmxo=;
 b=YfOMWAo8WWkA46dzXw9UYQEogEoXiW23GZVq/iA17bi7hxFrQDjNs1upnAd0c10Gl85WwU
 7InkJNATVgfSwuzbPPK/wLBAsvqzqryPT9awe3z960AqEAKG5fTkw8E65vreLDpvASWLkk
 hc7cPExu7q9OHFHRtU4r1V9MmXC0Rac=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-AUEn-XPMM6eC6W-QMBCUkw-1; Tue, 18 May 2021 04:58:46 -0400
X-MC-Unique: AUEn-XPMM6eC6W-QMBCUkw-1
Received: by mail-ej1-f69.google.com with SMTP id
 m18-20020a1709062352b02903d2d831f9baso2094186eja.20
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 01:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s8bXlpMdXMzxzHVs6jB78r2xTJ+tUx+V3hqy60avmxo=;
 b=VcDSAhvUpSYuvTaHqRALi52ToglF5xDrV7Jp1/jIzfY3WRg0Ns8cXo6B1fRvVaZU2S
 /8P21dkviffNTJGPrBLuVleFB5Ff8Xb4omWkj1GEB4vAxgGbLwhnTLMJuiCUAyyjyLap
 pTasr61LeEaBZ1oU9O82s7zIUXyUQThnYHcEOBnFtKV1MMZ+HosxP2YuzlD3ONHJddfw
 3jsTmLL4vdw9G5ZwU9CLvG5ZpvQubWaPxuk0EbwlvPJnHVUagJevSSWFfgmuUrKeftuq
 BEXSl9kgncR66oeMp23W6gptS6LUJtXbOGPO/9azOH+FXhGW0KD1l6y4bhLcTHqxkZsm
 evTw==
X-Gm-Message-State: AOAM531ortCOGnxC+DZaq+dbzK4u3aDvMPXZtW2BASHNBNEgrg4vvH6b
 DqSgvkWafbbiHrZB0oqMPxE8D3ocfTJUdjQSyL2AbA9Nrfw+3Rs7BlJ3aP++dcqUZjZ2ezyHWH1
 vHZDyUXS21lxEnrU=
X-Received: by 2002:a17:906:e0d5:: with SMTP id
 gl21mr4975870ejb.93.1621328324924; 
 Tue, 18 May 2021 01:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtr0aIMErZUUkfzBa1s6qUi7rC1/9DhHx++QhkPCIh6Lfp4H06rkguebUL11kQ7Jv5mu2uOg==
X-Received: by 2002:a17:906:e0d5:: with SMTP id
 gl21mr4975865ejb.93.1621328324797; 
 Tue, 18 May 2021 01:58:44 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n25sm6225954ejz.28.2021.05.18.01.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 01:58:44 -0700 (PDT)
Subject: Re: [PATCH 3/3] ci: add -j to all "make" jobs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f8317023-eaba-70bc-b1b2-4c1f17d8ee76@redhat.com>
Date: Tue, 18 May 2021 10:58:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518084139.97957-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:41 AM, Paolo Bonzini wrote:
> Run the tests in parallel, as that can greatly speed up the jobs.
> "meson test" is able to report failures to the terminal in a way
> that is readable enough even when tests are run in parallel.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .cirrus.yml    | 18 +++++++++---------
>  .gitlab-ci.yml |  8 ++++----
>  .travis.yml    | 10 +++++-----
>  3 files changed, 18 insertions(+), 18 deletions(-)

Hmmm maybe that can be merged with "Run GNU make via the $MAKE variable"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg805900.html


