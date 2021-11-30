Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED48463AB4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:55:22 +0100 (CET)
Received: from localhost ([::1]:39792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms5TV-0007Wq-2v
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:55:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms5Ro-0006Lr-8N
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms5Rk-0006Ax-W4
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638287611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zESi2Re1SYT/7eKwc4OfnN1zo/5beYa91KkxTCsGPRo=;
 b=auUtT9R2nprZ2bV9uyyBHbE2rRrzRRssckgdRcOvqr6CdVoyC9Y/MLYGWPHRpttyxIBAI6
 Wu4UDqAutJt1YjftmpYc3UtSkOez1PumpS8TwxMsNVBTxeFe/18EL13InjUmY44Y8QOxEb
 BDbpMTRwH9HAMFoogU2Hqb8xjt7Nkmw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-CV6qjeEOMPySg3Oxzx_feA-1; Tue, 30 Nov 2021 10:53:30 -0500
X-MC-Unique: CV6qjeEOMPySg3Oxzx_feA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so13113496wms.7
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 07:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zESi2Re1SYT/7eKwc4OfnN1zo/5beYa91KkxTCsGPRo=;
 b=cDbon3BdGnerc78go2Brnxw1UlC6WI5HCLx0HQmBneWrA9ar769AGCAYRd84oIIzPe
 tPiC2zKaIVsqOvl9s3VNwZdK4jV1ME6HCO1wc1yg/qlofusaxupGryBqdn1xha3UJ/wf
 gCZ6OIu2Na+b4l8C85IhHXoJQbvjhdzwDue4mWv6Fw3cD4do/+fGEvwY/ot7DOjLgngY
 SqvmzQRIz+zuP5eMpmM2DL7M7EKVgj0srAMEbiTwfdMv/eEmUQ5EQowALzRI7g5U4aVS
 4cFc5XdVjUIlZeTOepPB457EzM+e2yC3mFjGZzbZ5a0beuVv0mAfNoFzsztSK5nfDeWR
 J0Mg==
X-Gm-Message-State: AOAM532EBsHdztgO1j3lbgXrzVEeIxplcx4Qb2zQTD4AjahwjQ66Pzym
 ClyGIvRfJnSinFmh1pYLzLQ27/YXy2g4sPbE4xuT5Rnl/K+WUXAgIj1Twy4V6JQAwWRDBX6utAX
 rcwGDjW8Hb8PdWIw=
X-Received: by 2002:adf:e843:: with SMTP id d3mr40539884wrn.452.1638287609557; 
 Tue, 30 Nov 2021 07:53:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVektt6gJ9sR4hL+wgfAT4JVAWmDV5JaWfYqyhMx+82Spbj31oxUn5VXs4LpghUmOLAu2dTg==
X-Received: by 2002:adf:e843:: with SMTP id d3mr40539846wrn.452.1638287609317; 
 Tue, 30 Nov 2021 07:53:29 -0800 (PST)
Received: from [192.168.3.132] (p5b0c68ec.dip0.t-ipconnect.de. [91.12.104.236])
 by smtp.gmail.com with ESMTPSA id w22sm2596684wmi.27.2021.11.30.07.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 07:53:28 -0800 (PST)
Message-ID: <d29d921b-b865-6e9c-f1ac-0f15d973998a@redhat.com>
Date: Tue, 30 Nov 2021 16:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 3/3] virtio-mem: Set "unplugged-inaccessible=auto" for
 the 6.2 machine on x86
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
References: <20211130092838.24224-1-david@redhat.com>
 <20211130092838.24224-4-david@redhat.com>
 <318c242c-e0c5-09e2-6749-9d366cddafa0@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <318c242c-e0c5-09e2-6749-9d366cddafa0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.11.21 16:34, Michal Prívozník wrote:
> On 11/30/21 10:28, David Hildenbrand wrote:
>> Set the new default to "auto", keeping it set to "on" for compat
> 
> I believe you wanted to say: keeping it set to "off", because that's
> what the patch does.

Right, I switched semantics from a "legacy-guest-support=on/off/auto" to
"unplugged-inaccessible=on/off/auto"

Thanks a lot for the fast review!!!

-- 
Thanks,

David / dhildenb


