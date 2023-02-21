Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BB69E21D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTQ0-0005kb-AN; Tue, 21 Feb 2023 09:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTPu-0005je-Ry
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTPt-0007OG-0g
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676988888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyItqO9dPERKAice0ZAF14XRg7dJq3RYadE46Gmgc4g=;
 b=ac6B0b5d/unQhujgMxEWQ7ocZMXoV7zkB72daCbxU95H+hXtVQAHVgygXxMsabFeVCKoje
 4xRjyYUOoUL36SVxFBdaKWf5cmiiEHjfOLd/W2oUZoFbkude9fM1TDUWmYq5wEZagkyKYw
 Cdx8qGrjx5PLO0qoMBV60uFWlzZ6nw0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-CSFK5uHuM2mwTelwYPZN_g-1; Tue, 21 Feb 2023 09:14:46 -0500
X-MC-Unique: CSFK5uHuM2mwTelwYPZN_g-1
Received: by mail-ed1-f70.google.com with SMTP id
 er17-20020a056402449100b004ad793116d5so4539911edb.23
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oyItqO9dPERKAice0ZAF14XRg7dJq3RYadE46Gmgc4g=;
 b=hN6zllhWXk7dB+pesi9Wuu8VjZ8q7HyRfeiuTfT0I9CxvS/jcgORe4iroWyNMn6jmb
 rsN8KCquE4g2MxsfUUo/b7r0vzGz92G7pAEPnkwks2pAjiHh8B6t33GKFGExc//oeBn3
 x6keAWG78NlX7YbZR5K7pVUPlXDw97bXBqPdZqXEG55odnykSoCteyl0CJWAE5HFCPMd
 W0+m3kxn5ywJZJB0SDum3B5RSxi9JGyjp9znwnSgYGT/mLQLdRUXARMt+FnymaYDpS45
 0zRcA0YnfqZAAa8dA/CEua4+49O+NfY4fv8sC5rR8wrkf6UAeRqX+MUr+QANTMmjsQBl
 vBRQ==
X-Gm-Message-State: AO0yUKW6ishigTW0YEbgaGzb2hj+m8OgYM/Oci4Fv+Z3L8gXB+t4VC/r
 +uAPfEa//fRshIzXq4bhk5hVmbF0l1r2Sk1QmhAT9SX96umy52SmK90A6zvZD0n1svr4HAhe1Cm
 szXimxkW1BntUlew=
X-Received: by 2002:a17:906:5e42:b0:878:4e5a:18b8 with SMTP id
 b2-20020a1709065e4200b008784e5a18b8mr11868179eju.66.1676988885065; 
 Tue, 21 Feb 2023 06:14:45 -0800 (PST)
X-Google-Smtp-Source: AK7set99EAhRd1FKpAA3UOHXzIkyubC+jn4g5Jrx9ug+gyaMqC06DzdHcGd5xu+A28wcL92/t4eIDg==
X-Received: by 2002:a17:906:5e42:b0:878:4e5a:18b8 with SMTP id
 b2-20020a1709065e4200b008784e5a18b8mr11868151eju.66.1676988884775; 
 Tue, 21 Feb 2023 06:14:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 ce25-20020a170906b25900b008b05b21e8aesm7294175ejb.172.2023.02.21.06.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:14:44 -0800 (PST)
Message-ID: <4975b132-691f-e2ff-ce39-4188b9de5f55@redhat.com>
Date: Tue, 21 Feb 2023 15:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 10/16] RFC: build-sys: add slirp.wrap
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-11-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230221124802.4103554-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/21/23 13:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This allows to build with --enable-slirp / -D slirp=enabled, even when
> libslirp is not installed on the system. Meson will pull it from git in
> that case.
> 
> RFC because this is very convenient, for a developper targetting
> different environments, but might not be considered appropriate, as it
> is "a kind of" git submodule (without git submodule integration issues
> though, afaik, experience should tell).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

I have no objections to using wraps for slirp and especially libfdt 
(though the latter is not yet part of wrapdb).

However, right now meson will do network access without respecting 
--with-git-submodule= or something like that, i.e. with no way to avoid 
the fallback.

As a start, configure could hardcode --wrap-mode=nodownload, so that 
wraps would be used only after a conscious decision of the user to use 
"meson subprojects download".

Paolo

> ---
>   .gitignore             | 2 ++
>   subprojects/slirp.wrap | 6 ++++++
>   2 files changed, 8 insertions(+)
>   create mode 100644 subprojects/slirp.wrap
> 
> diff --git a/.gitignore b/.gitignore
> index 61fa39967b..1ea59f4819 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -20,3 +20,5 @@ GTAGS
>   *.swp
>   *.patch
>   *.gcov
> +
> +/subprojects/slirp
> diff --git a/subprojects/slirp.wrap b/subprojects/slirp.wrap
> new file mode 100644
> index 0000000000..87cdd8dcd8
> --- /dev/null
> +++ b/subprojects/slirp.wrap
> @@ -0,0 +1,6 @@
> +[wrap-git]
> +url = https://gitlab.freedesktop.org/slirp/libslirp
> +revision = 15c52d69
> +
> +[provide]
> +slirp = libslirp_dep


