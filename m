Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3D321E6C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:46:39 +0100 (CET)
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFI6-0005rS-3t
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEFDp-0001Zt-9D
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:42:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEFDn-00017v-Jx
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQRRg7DRwiakQhvYuJzZSjmASM0QrBDWs0+7GeO/YPI=;
 b=O1oZCcBZtJmqB1+ra9e1IhR60bRxJQcDmXAe32SYKg1Fa/IGtq+wPrQOWB9cNkqZqfd4oa
 iNTm10NhLkZuXXSTFX+rj/kphW/pTPKMvTmah7/gwtxitxxPGlKoZfDBZZwZPAAJzJeMQx
 zdy5VV8YwvhfALuwIp+Nq7d9rb/2XN8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-OUPgLvRrPQ2TgwDV4v4QnQ-1; Mon, 22 Feb 2021 12:42:03 -0500
X-MC-Unique: OUPgLvRrPQ2TgwDV4v4QnQ-1
Received: by mail-ed1-f69.google.com with SMTP id w9so7266025edi.15
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hQRRg7DRwiakQhvYuJzZSjmASM0QrBDWs0+7GeO/YPI=;
 b=tUjOoAboOEZwUqzeBucLRFGANxD6WQ+mfj2GgvJ/uElkFg9N7alo9LdDQYqzNlcP1w
 Pst3D/CdCPKYXWp98CNq+0AH2miI/JmGxvUC2uIiQDJrrmD0U8MZ6jcFtS15Wbs4LtRN
 MZUKPqwaoZSSwWzBMe1D84K8ozPg2axkHl7kmqLDXx1JIZ8rzzIXbySuA6Yg82LWfDKh
 X1z8x17h+icMC5TcnzWvgeKICrG2lncx5nvH6e97eDL6jC4xVSUW3mFWlMiTLPUFO9Nx
 8vlEoHWKcxIhBDHzjSxOdGxet6del5PpRNHfXS/xp+V8D5u5bBKktWImYoOMpknUANwa
 +1OA==
X-Gm-Message-State: AOAM5339BsoIeIfTfYpqyOYZGKeS7KS2mxWWUYF02I/ykOfav+xXpTby
 CqlvtAbzCflWXeYYMU0Ws3VDZYe3bY/ZjrRjggpniu1NLczIFK2m7QL5/XyRyhmBrZR753ApLm4
 NW3OkA3E4Bz2i7uk=
X-Received: by 2002:a17:906:7d87:: with SMTP id
 v7mr18565770ejo.214.1614015722144; 
 Mon, 22 Feb 2021 09:42:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZVexiknAe304GEME+6UBtrSG/oQg5eFv0dZOxN6iIHtXbRSz3jWeQtuhuWRyZKFVaql9yAA==
X-Received: by 2002:a17:906:7d87:: with SMTP id
 v7mr18565763ejo.214.1614015722037; 
 Mon, 22 Feb 2021 09:42:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ap14sm4983434ejc.13.2021.02.22.09.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:42:01 -0800 (PST)
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <875z2knoa5.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ceb5d0f8-3022-e91a-006b-5ac6e5862e4a@redhat.com>
Date: Mon, 22 Feb 2021 18:42:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <875z2knoa5.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 15:57, Markus Armbruster wrote:
> * The block layer's pseudo-protocol "json:" (which can get embedded in
>    image headers)

If it gets embedded in image headers, I don't think we'll be able to 
deprecate it ever.  We'd need to keep a converter for old images, at 
which point it's simpler to keep the extensions.

Paolo


