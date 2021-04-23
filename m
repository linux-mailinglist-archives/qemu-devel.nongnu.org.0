Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303136959D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:06:57 +0200 (CEST)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxOS-0006Eo-0f
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZxMY-0005MT-EN
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZxMV-0008Ol-Ns
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619190293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSFzGvCbi+XrnLDqTtfizv83aKBd5mwS1Nfbn/F0tkM=;
 b=Bj2WhL52KarF2X7w1UD/Bh5DxRVYSb1osjYnwPKxK+QETjlFcTiXThKZJFXhrgQnhd5QZP
 Zt1Ka+7lCvtI8jFrSOowyuBc7dNWlloFMm7WqWb2/0yZNH0Q2+JsHuGMTegsYRx3xoeKYu
 gDZOEgP2vFGL7OGd6suDHEkPWS8p2uU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-80x_JttzOFSOukECmTF-aw-1; Fri, 23 Apr 2021 11:04:51 -0400
X-MC-Unique: 80x_JttzOFSOukECmTF-aw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s9-20020a5d51090000b02901028ea30da6so15137284wrt.7
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NSFzGvCbi+XrnLDqTtfizv83aKBd5mwS1Nfbn/F0tkM=;
 b=CkGB/d+4b2zUsLtdu1wrqk15bDxvWuXFh/fPKFpu2KrFKEi/qSBQTlNBSEggCHDAjH
 +ULqjFK/oOpB4M4rfkuqW3ih0icq6FXGf1JM6z7kxEzcDpTkNpN0kFdw6PSI16N0giAw
 V/+ytKztVqBXCCij+KtPcoZ5wfRTbSismAyzlXQRhsmnW6cOVzsDyQ4a4jtFFaVzZB8p
 mhYCzJpW2tPNZyLkUXlpFu2N9hMKt7ntTZyTi57J5Uk2c4lPncNTFCig9fWQeMyxTbWe
 gDLT0rvIUQy7AGEPtDfsSwgwpjjPISCJT+mR0byhkPFC481Vfx0u4ZlgByhwYDIIG7My
 Hlyg==
X-Gm-Message-State: AOAM532/mXyFJb5PoIu6A93ClbXQt5u1AtXxmypbgtyvWSNb+V0blFjR
 2T7eL6opnuXys+HZJFCrgRxoVB1H3bSl69JgxqqwBHRk5qKtaIm1t7sjp6+ffPJyz6B47VuNZth
 agJVyOo0syohQWbY=
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr5182947wrw.78.1619190290168; 
 Fri, 23 Apr 2021 08:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzktfmVlBcbe7UEnbMxYzK3NM7SwYH/mC2noq9GaHyWiO1KvLxZr4pYtm2jp5mUEQFelirW8w==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr5182922wrw.78.1619190289984; 
 Fri, 23 Apr 2021 08:04:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 61sm10788102wrm.52.2021.04.23.08.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 08:04:49 -0700 (PDT)
Subject: Re: [PATCH v6 14/15] qmp: Include "reserve" property of memory
 backends
To: Markus Armbruster <armbru@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-15-david@redhat.com>
 <87im4di7u9.fsf@dusky.pond.sub.org>
 <190f173c-b3f9-6c70-42bb-27f50a5f9380@redhat.com>
 <87h7jxgsa0.fsf@dusky.pond.sub.org>
 <79cdbd39-cf5c-a8ab-b2c9-68d8e4ab2333@redhat.com>
 <87zgxpfbbu.fsf@dusky.pond.sub.org>
 <33b6b3b5-47a6-94b8-1e2a-143e3cdf33b6@redhat.com>
 <4c1fd7c5-3667-aef7-db09-dbfac26532b4@redhat.com>
 <87o8e5dp9l.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d2187bc0-52dc-6062-c5f2-73e42e9851fc@redhat.com>
Date: Fri, 23 Apr 2021 17:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8e5dp9l.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.04.21 16:55, Markus Armbruster wrote:
> Reviewed-by: Markus Armbruster<armbru@redhat.com>

Thanks Markus -- have a nice weekend!

-- 
Thanks,

David / dhildenb


