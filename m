Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA03B3855
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 23:08:10 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwWa1-00041c-0c
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 17:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwWWw-0003C7-Kv
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 17:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwWWs-0000Bq-VB
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 17:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624568693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bULg7HCOZDITz4f+9ELw3ZKtwbv7Np0c2gj5x+GeByU=;
 b=a78tpPCR0TO65KNGbjuZyioN6vDEtEXFtMd7r19QV2tCr0Vg0R9KOwU/+qaEeBUnG4cm67
 ZlLoutIZ7W5g4bb7cyjOwhFMqsHPXi91VwzUIQdw++UiSM99esLGVIAc/MVgTcO2zlfY/z
 0un+NISE+Vv6sIMSmhm97p4G3t/5KBA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-yi4tFPynO9eI93z-gCEB4Q-1; Thu, 24 Jun 2021 17:04:51 -0400
X-MC-Unique: yi4tFPynO9eI93z-gCEB4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 s80-20020a1ca9530000b02901cff732fde5so2120148wme.6
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 14:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bULg7HCOZDITz4f+9ELw3ZKtwbv7Np0c2gj5x+GeByU=;
 b=KIZu4e3MsaPBohuP7UCxwDlj8P5dcinMP1t6YOp4mPU3F+J4hRqfciXyj9hI+cHZkN
 xCaQlrMeDVbSuKKXsY4PzYP8Zbg6RqVTzEuMXREeZmFm25YqG2p7bZJC65SawVfOUt/U
 si2KaaxZQqD+VkeSp5F49wPe4XIrhO1eNgEc8L2mA0wt9hgcVj3YvAGCmGDbGu+2+zX2
 JwAVCsMYyRR6lsx0Bvz30+daW48LsfjY9LlDRKr7EF7zYAOiuL5V1EyZ5IEauGwzvX19
 H5A7XYG3KHIeHu95hxNe+xBj2hHbSLFc0LtDkCUcQooxGO3FgERBcg/YOakUBBzAuR6c
 TqnA==
X-Gm-Message-State: AOAM533Sa4ubNrRZAwjbN31H4FFNKp1Sj81JWDZPDI8saBtE6M6j9QGS
 sGsoVzjE2j7thC22sNcof/dbUZt7T0AoOsKqH9nI1BvEm/hxgzDOajaSv3QgS26PnOxNx/Pd1+m
 4414qqezqIQhB4rOWHBS/T/NOu6eDJOnbxHpzDKbyZRsreV258aCIheFMfAEBZO0ic8Y=
X-Received: by 2002:a05:600c:2293:: with SMTP id
 19mr6560024wmf.175.1624568690280; 
 Thu, 24 Jun 2021 14:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6VThClCKqsuIYvZFWB/J360RlCMi/mfRPEyCdW9nKd7jXR5LHwN6RjEx6tsfK2PIEty82sg==
X-Received: by 2002:a05:600c:2293:: with SMTP id
 19mr6559998wmf.175.1624568689980; 
 Thu, 24 Jun 2021 14:04:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d4sm4053050wmd.42.2021.06.24.14.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 14:04:49 -0700 (PDT)
Subject: Re: [PULL 00/12] Misc, mostly meson patches for 2021-06-23
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
 <CAFEAcA8kr5sn-jQ_wLa6a-m0DmbWPh1v6YuHQK74dy8pp01-Vw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3d085a3d-d4e0-6750-65c0-ec91c5f63d8d@redhat.com>
Date: Thu, 24 Jun 2021 23:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8kr5sn-jQ_wLa6a-m0DmbWPh1v6YuHQK74dy8pp01-Vw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/21 21:09, Peter Maydell wrote:
> This generates a new warning on one of my boxes:
> 
> [...]
> Has header "sasl/sasl.h" : YES (cached)
> Library sasl2 found: YES
> Has header "security/pam_appl.h" : YES
> Library pam found: YES
> ../meson.build:926: WARNING: could not link libpam, disabling

This is probably too old a libpam, or something like that.  What distro 
is it, and could you please attach the resulting meson-logs/meson-log.txt?

Thanks,

Paolo


