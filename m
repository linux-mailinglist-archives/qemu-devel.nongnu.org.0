Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B745183C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:53:29 +0100 (CET)
Received: from localhost ([::1]:58904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkqu-0003G7-C2
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmknF-0006qL-Mj
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmknD-0004U4-PV
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qnQkheHnuX1v4wfVISiLkMaSyV0+slDe3YArUP6V30=;
 b=S1jnWwTVWwVkj3TFIPQVkCVSUft6E9jZXLSqHpgDSRM7VgVhRUy9GQUTW1hP2qr/CyATR3
 Udq0AiUuTeCeriktTIe1yuvJxfL/qY1ArcsrRxLA/Gw//zhpxPa25pX+jEOXtr47hzcKRQ
 RzdqGVyTv3xzgi6xq11z+tYcUN8IKtc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-kgcV04nzNSeOt8JTz2bxlg-1; Mon, 15 Nov 2021 17:49:36 -0500
X-MC-Unique: kgcV04nzNSeOt8JTz2bxlg-1
Received: by mail-wm1-f70.google.com with SMTP id
 b145-20020a1c8097000000b003335872db8dso5944528wmd.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+qnQkheHnuX1v4wfVISiLkMaSyV0+slDe3YArUP6V30=;
 b=zHYZU4PWIF/RYA8pMADHFJLrjWfpTTdjHEf+KmNFMgkLuIQKxlTRa9jYW++sjDNehj
 Zr6qnxnd9B5B22wSOQUP4Jufa9vgmiLQA5yKQvkBemJPkjKeN+EDsypJ18PPjnoGfpLq
 Knyl25+mPEif2gOG4f+NH5mu/Oe/Ttrn0hD7CmT2596mNQwdWEcT3ID7vfkXVNUbW6AB
 RYcemjeeAaud49fswIZtOl2YAnlCr9bHK7YpYo+wX05bihdxOBFNjKYXrlS+hqRq1whn
 KCndvzfu8P1i0Ib2CijCy3f+7VgAPNufWhJdaIvnisOt/okFhevwRR95mOCqorEnWOxG
 qyNA==
X-Gm-Message-State: AOAM533ncdcZedM7YLdQSdcZ7mc87BwX0PEK2ks9RMlXLtm0N1FBNQtS
 m04e730XehSvee5QshLIoLp3fVoXP9Y/vCMVdjoh2tkuUPQHTiqRCYcxx3ragGfQxAZH8iXX0ds
 f+gfniUPlrbK/5igT3IpvfE0h9zMkkYXuGJs/kJkbgv8FQK8BWpZ1ctjXx1zQyVPk
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr25114567wmq.195.1637016574629; 
 Mon, 15 Nov 2021 14:49:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ10iOeMrBcAu34AWbhcpkmbMyUw0lygaw6BJqcEu8YjLzgYGe0LdjNTvRQzgeOzz3SAz6Vw==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr25114536wmq.195.1637016574364; 
 Mon, 15 Nov 2021 14:49:34 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm17844713wri.74.2021.11.15.14.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 14:49:34 -0800 (PST)
Message-ID: <d628d6c0-c0f3-4310-6de1-6ff6f9863a02@redhat.com>
Date: Mon, 15 Nov 2021 23:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 00/11] tests/unit: Fix test-smp-parse
To: qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211115145900.2531865-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 15:58, Philippe Mathieu-Daudé wrote:
> Missing review: patches #4 to #8 (new)
> 
> Yet another approach to fix test-smp-parse.  v2 from Yanan Wang:
> https://lore.kernel.org/qemu-devel/20211111024429.10568-1-wangyanan55@huawei.com/
> 
> Here we use the QOM class_init() to avoid having to deal with
> object_unref() and deinit().
> 
> Since v3:
> - Restore 'dies_supported' field in test_with_dies (Yanan)
> - Add R-b tags
> - QOM-ify the TYPE_MACHINE classes
> 
> Philippe Mathieu-Daudé (11):
>   tests/unit/test-smp-parse: Restore MachineClass fields after modifying
>   tests/unit/test-smp-parse: QOM'ify smp_machine_class_init()
>   tests/unit/test-smp-parse: Explicit MachineClass name

Patches 1-3 queued.


