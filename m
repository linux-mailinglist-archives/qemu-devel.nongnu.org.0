Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7061294DAC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 15:36:02 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVEHZ-0001m1-S8
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 09:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVEE5-00072a-1U
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVEE2-0004vS-Jc
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603287141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8JybUft5gn8Sj6ByinpAR0ozFeNpX8UBH70GeqYSIY=;
 b=Owo+lbSmIEtWpcsnmvwaiPIA/dmKXwf3SOi0ebyfAyoJNxuaTUPpb9Qszuepi9jOQ/pA++
 JBcNCXfnK2YPovgjmFpA5q82YwGPP+8/WuRpeVXR0+Hs96Pf955GuNu6u45giJKYAj44xk
 WzeXx8LIxzF8iQkYgiIaZH/Hbg+dLgI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-ReAtRYHzO9eaK90mjVDW2Q-1; Wed, 21 Oct 2020 09:32:19 -0400
X-MC-Unique: ReAtRYHzO9eaK90mjVDW2Q-1
Received: by mail-wm1-f72.google.com with SMTP id 13so1602579wmf.0
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 06:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q8JybUft5gn8Sj6ByinpAR0ozFeNpX8UBH70GeqYSIY=;
 b=grLj6NmWtCUPAnZL1eJSmAoIswtsxYqYV0L8fa6KIPNKKqjiNvMOW/ziYW1mufTajb
 R62rnZCe61nTwL6NLsp9TdTy0BmRv/Elz0wb22U6xYfx8HUTcJYv/8n6P+evlkWVclIf
 TUKtimzgFmJF1UXKYX0VQMvH7UwZnUOoApbBzsVuNF8qG/55t4Nca2wV3YM98cSdQN2q
 EmIrXMOR5N8ym/WRuyrcObxCpZpf+Zebc44l9sSmddvaRH6d1Au88hdTDlhjemdmWXH9
 14iTZRk9eqPZcWdbi6ouJPG86KF7UlwNcI6qRpTDc9ZCR3u43E5bdFIAXthSsbBHf54J
 RSRw==
X-Gm-Message-State: AOAM532Dy9W28itKQs0FLZUiicDF8lNSmSg6m5xlLHuGAw+o7grr+Xcw
 3EQBB2GvQpEy+a009s807rD/lXcV4EPkqYZslFrPbQKd/aAzXuq+3hPbtoqE4Dontophc+Pg/vv
 v0mhOAbsdk2azJyY=
X-Received: by 2002:a5d:6944:: with SMTP id r4mr4847129wrw.151.1603287138798; 
 Wed, 21 Oct 2020 06:32:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeVt/CiTCD2Z14aHbtAGvomHJ2nqXbtyrNr3YfLEumlz15IOrhBnsVzoKTZ9DePpggh+pwGg==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr4847106wrw.151.1603287138606; 
 Wed, 21 Oct 2020 06:32:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a2sm3910663wrs.55.2020.10.21.06.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 06:32:17 -0700 (PDT)
Subject: Re: [PATCH v2] pc: Implement -no-hpet as sugar for -machine
 allow-hpet=no
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201021131353.1450143-1-ehabkost@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cb3553a5-5c81-72c1-cc00-aa55eaf3d971@redhat.com>
Date: Wed, 21 Oct 2020 15:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021131353.1450143-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/20 15:13, Eduardo Habkost wrote:
> Get rid of yet another global variable.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Rename property to "allow-hpet" to make its semantic clearer,
>   as it won't make sure HPET is created if CONFIG_HPET=n
> ---

No, please try to do it with "hpet".  It's ugly to make it different
from the others.  I outlined how to do it in the reply to v1.

Paolo


