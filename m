Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F744DC2E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 20:31:43 +0100 (CET)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlFnQ-0001Sz-Vz
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 14:31:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlFlK-0000Ns-N0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 14:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlFlI-0007H0-8L
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 14:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636658967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFsZkAPs6Dx7cgI9FlX4WU0h+B9rY9G1340B8CnyUh0=;
 b=XK2W6ZafdpkaoK7BQdNMaY3tTSyJyn9UmBv+DmhS+PfzdXinMjgCdmBTvlX86IP2HXuoBS
 z2gkCvdS7kszEWD482DWmJVg9Y27+axIkFnXlicWpb0PtfXs0Ai6SKO1BgAGorxjUhHjD2
 5XQqy6dD3KZSr2UP/N5siF5XPGDEd1k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-5IswVb-qMbeEvIoglUB0hw-1; Thu, 11 Nov 2021 14:29:26 -0500
X-MC-Unique: 5IswVb-qMbeEvIoglUB0hw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso5201513wme.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 11:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eFsZkAPs6Dx7cgI9FlX4WU0h+B9rY9G1340B8CnyUh0=;
 b=DZqi62mHsizqLcdD9iVaDR+IgyBGTrdmBP6GMTm18vfrcvJHgWYUkSrl6hIHWU3o7X
 bekU2rSNLD7OwrLndYlV2UyD6unUafoF7IsyNxcesqQgAlsf2FKYGiHW9QwOTs09y9Ct
 gFeU8BX3VhAFpuP7eijArq4iaurn/A8Ajuq8ftrpXfMs5jwPsoxu7N9R2PDHkYhTTe7M
 CsWEYEgokEXD/Uo3I7Qx/SrJz7yWydU1FYPGi0LRxWlYN1woaSmhT1Qn9DlAim5y8one
 dX3LgOBybW9cXLdVcm//3QPa6dCG6ToFucBOYpOaCtZGMjyWYno45zG2xk4LtWyUe+ZT
 t+TQ==
X-Gm-Message-State: AOAM533tn5WaImv3zR6XWd3Mw+/5aOMi40b1t3ES/2Dxu42NH8tFHFtu
 +55LB2bNVrICUN8QcRJ6edPTe01Vt7DUZ2mQyiz/MSDRZmF2pvaOAVZ3OW5c/XMewBNnXMQ6Uba
 NstQuCL5ZXyx8YGk=
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr11529534wrh.51.1636658964797; 
 Thu, 11 Nov 2021 11:29:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydBwQuRAV6XtIB1zcjkdlxrc1ETlOj6WToVgLMzMZIKj0SaQKZHEZlVjcNWZQz7hopMiy1iw==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr11529502wrh.51.1636658964550; 
 Thu, 11 Nov 2021 11:29:24 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id w1sm9583365wmc.19.2021.11.11.11.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 11:29:23 -0800 (PST)
Message-ID: <fd920779-cff2-6eec-5c0b-686b3e29cc9f@redhat.com>
Date: Thu, 11 Nov 2021 20:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/5] gdbstub: reject unsupported flags in
 handle_set_qemu_sstep
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-4-pbonzini@redhat.com> <878rxuiplm.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rxuiplm.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mlevitsk@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 18:08, Alex Bennée wrote:
>> +
>> +    /*
>> +     * In replay mode all events written into the log should be replayed.
>> +     * That is why NOIRQ flag is removed in this mode.
> I guess if we were being complete we could say something like:
> 
>    In replay mode all events will come from the log and can't be
>    suppressed otherwise we would break determinism. However as those
>    events are tied to the number of executed instructions we won't see
>    them occurring every time we single step.
> 

Ok, I can integrate this improved comment.

Paolo


