Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79443B9147
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 13:43:46 +0200 (CEST)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyv6f-000662-BR
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 07:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyv4b-0004mo-92
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 07:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyv4Y-0007wF-71
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 07:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625139692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUU+c0TCnJnsW34TgTj7fbiGOex80VjK7cP4hhMVwqY=;
 b=Yb2W4zaFATU39evbVIUJ/jr+kmlW2YDjSc0iIjTUdAAv+WaeDHPNaeKJXMHonrzPgWfuAq
 b7DIvRf4ijPR9O1use8VysjfeKD013tRJZXrGFgj75PUV5HUMX45St4khSgkQ36D5EWJsS
 0M+1yCgomRd0GFo2pZGNcqThObc6UEo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-XSSpFA9iP46A6GzTitxpXQ-1; Thu, 01 Jul 2021 07:41:32 -0400
X-MC-Unique: XSSpFA9iP46A6GzTitxpXQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so2429566wrq.21
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 04:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUU+c0TCnJnsW34TgTj7fbiGOex80VjK7cP4hhMVwqY=;
 b=eAgpCIoSRZ5v02Zz1DDwnC+gdK1FExMhwBdd8pnY5Wf50UfqU7DHD9XKTrZ4zXNtOp
 x+LB7qq/CVRnWB/J6dkp0AJk1OpYUGDieuGfNenS1GDugF35kP3IwuUY0OeU57mFWb0e
 CqmaRUxUf4ZI1SFNYPuEs2LVowJrj/B7SApeZ54AV/Hb3dQTUzwOPICZUmZqkZKgsK4E
 t4lvWAJLa+jjUCbk3i1dLxs53Pq9Tafk2hJqgSTJfGYL2lT3b0n4xKS1hB3PWR3qisj9
 ADIjPUbZfUlITWnszSvnP2P8oSzMihmqFrpV0S0l3sx9M7tZVP2tgup8S9io0Y2Q/BmE
 ++Ag==
X-Gm-Message-State: AOAM532bEc4PJdVATtIE9bvYS//OflWacbdiCMEjtcI7pJ0Z8m8TQ8FD
 BHM2/hnR+Q1U3hhOuubWV8hhsA5OeNxo8mOiEJ2bmac9EsK01NLzlZiNEV+kpqE5mUidoXgCKJu
 nLNIpvdSWgtCHlOs=
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr20146235wmg.117.1625139690813; 
 Thu, 01 Jul 2021 04:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznYIo1PUfnbmLQ6tuqjFG7sdwlyR34XfIgxwYZHw/IjvzWZAjwzcohp64LMVsuZk8FndTmqA==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr20146197wmg.117.1625139690335; 
 Thu, 01 Jul 2021 04:41:30 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id v1sm1776359wre.20.2021.07.01.04.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 04:41:29 -0700 (PDT)
Subject: Re: [RFC v6 07/13] target/s390x: move sysemu-only code out to
 cpu-sysemu.c
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-8-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <450295fc-cfd4-45d5-f8d1-0753c20769eb@redhat.com>
Date: Thu, 1 Jul 2021 13:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-8-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> move sysemu-only code out to cpu-sysemu.c
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   target/s390x/cpu-sysemu.c | 309 ++++++++++++++++++++++++++++++++++++++
>   target/s390x/cpu.c        | 285 ++---------------------------------
>   target/s390x/meson.build  |   1 +
>   target/s390x/trace-events |   2 +-
>   4 files changed, 320 insertions(+), 277 deletions(-)
>   create mode 100644 target/s390x/cpu-sysemu.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


