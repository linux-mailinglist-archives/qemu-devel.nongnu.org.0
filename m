Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0DD5FC8DE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:09:32 +0200 (CEST)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieIV-00005T-Hg
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oie6Y-0005TF-36
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oie6S-0004Db-MQ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665590219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SsmyVzRWVCKOx5Otfzn72Qof1ICwjOAbtG4DgR6MLD4=;
 b=YGlb1eZSZqAfQIBZxpz7ghlOJLZgcYeO5NZ+nx82sNoijapCucKH0RlUVmiEkbzqjJLz4i
 +tltS7+LiC+t1FbRVj4EZxP1nFQS4z3elmjmoXg/h44KYV4DO+WJWR6BZHVZDD1kBJwcXo
 FTPdKm/oN7R2z3RDrN5Hl512QbdNukM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-EKRb5K0uM-SEJkHN_W-k3A-1; Wed, 12 Oct 2022 11:56:58 -0400
X-MC-Unique: EKRb5K0uM-SEJkHN_W-k3A-1
Received: by mail-ed1-f70.google.com with SMTP id
 c17-20020a05640227d100b0045c91f982a1so3261735ede.2
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 08:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SsmyVzRWVCKOx5Otfzn72Qof1ICwjOAbtG4DgR6MLD4=;
 b=CQoRoENoONXFIjXKTjAVS9+8O3hyncHd5P0jlukQ6ydYRrUOGJXRzo3fb1xZb+icg6
 IsJ8Wc1ksFEqBkCYshElYnvCe1LU93GeZ1zyalSQpieAXb5Vi6EIZZyqmE+AgI/uEhiI
 kNtbkFxyNvGcSd9thzYi2HmsqIjWELMFDsIfOEBBzQTi76qmHpNIXrvZoS8xe8tS4XFw
 QLHHkzoll8hd738mwspe0rkwictTLWcLju3xul2Eo+i08w4u831ZJ/LHS6/ya+8hra4N
 h2JqUoL+AETsk1Pk0D0PYOhXFyYNCXro5rXFNql8MzAxyk49A7voC+lIkz37ibbv9wBh
 oMCQ==
X-Gm-Message-State: ACrzQf2OvHN9n8En0VWK1LzK+Niffqv4HD9tUOiAZ+2gOhQRJhYxx2m2
 yhnKL7S3N8ZXIw0F6ZymkFT0gp8i1zn8qi8YojnSgQy0DAy4YK2/+nFws4xu+u66y8haBnIKrHG
 MawHtGBy6hIH7ldk=
X-Received: by 2002:a17:907:1c96:b0:78d:fe6b:9891 with SMTP id
 nb22-20020a1709071c9600b0078dfe6b9891mr1220604ejc.746.1665590217327; 
 Wed, 12 Oct 2022 08:56:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5mIBaH+dFmJF0f0CgRQ1P5GGLhlwcaRZTdf2T/IkmsNJw72nUFx0vQgTL0uienioNGYHIObA==
X-Received: by 2002:a17:907:1c96:b0:78d:fe6b:9891 with SMTP id
 nb22-20020a1709071c9600b0078dfe6b9891mr1220588ejc.746.1665590217139; 
 Wed, 12 Oct 2022 08:56:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 d22-20020aa7d5d6000000b0044dbecdcd29sm11396751eds.12.2022.10.12.08.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 08:56:56 -0700 (PDT)
Message-ID: <9aeb876d-cdee-8c3f-1b97-20ac1931e4f8@redhat.com>
Date: Wed, 12 Oct 2022 17:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC PATCH 0/4] docs/devel suggestions for discussion
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: stefanha@redhat.com, peter.maydell@linaro.org, agraf@csgraf.de
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221012121152.1179051-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/22 14:11, Alex Bennée wrote:
> Hi,
> 
> This is an attempt to improve our processes documentation by:
> 
>   - adding an explicit section on maintainers
>   - reducing the up-front verbiage in patch submission
>   - emphasising the importance to respectful reviews
> 
> I'm sure the language could be improved further so I humbly submit
> this RFC for discussion.
> 
> Alex Bennée (4):
>    docs/devel: add a maintainers section to development process
>    docs/devel: make language a little less code centric
>    docs/devel: simplify the minimal checklist
>    docs/devel: try and improve the language around patch review
> 
>   docs/devel/code-of-conduct.rst           |   2 +
>   docs/devel/index-process.rst             |   1 +
>   docs/devel/maintainers.rst               |  84 +++++++++++++++++++
>   docs/devel/submitting-a-patch.rst        | 101 +++++++++++++++--------
>   docs/devel/submitting-a-pull-request.rst |  12 +--
>   roms/qboot                               |   2 +-
>   6 files changed, 157 insertions(+), 45 deletions(-)
>   create mode 100644 docs/devel/maintainers.rst

Thanks, these are useful improvements.  On top we could probably merge 
some content from Linux and make the documentation standalone.  But still:

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

after addressing comments from Stefan and myself.

Paolo


