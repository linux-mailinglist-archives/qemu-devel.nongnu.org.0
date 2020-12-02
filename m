Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F382CBA3E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:14:34 +0100 (CET)
Received: from localhost ([::1]:48968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkP9d-0002JY-9i
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO5I-0005Mr-E1
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:06:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO5E-0005MI-1I
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRO+rUsIoeZi+lw+V1WkjA81X66K1sk+AJqqNM8gfHM=;
 b=UN5jov4PAEiobWGf6jh3VF5KktzeCkKCWSH/rdav0PQOEl3hfiv/TkGWajBdyGcsRBUKMA
 y5lMPJu/PWdTPXBpFIkbmiIXODBLwve22Udx8SI7DPyJGdm3+oXeh91F0n/9bnwr6Qrroz
 7jfLNC/6e/wUcNJRaa8KoDVREvNrAn4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-TtrGbClPNKK9BJN1uNFumg-1; Wed, 02 Dec 2020 04:05:53 -0500
X-MC-Unique: TtrGbClPNKK9BJN1uNFumg-1
Received: by mail-ej1-f69.google.com with SMTP id a8so2071367ejc.19
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sRO+rUsIoeZi+lw+V1WkjA81X66K1sk+AJqqNM8gfHM=;
 b=ittz8a/PP09IImE8Dm6svm/yFQ5ktkC/COGm0MZ8o4gZaAGN8Vnex3Mx7K+CHTDrtf
 GOf1zmKdEln4L2O7ofeocDaYe2w8yPa+e9kiNAfAfmYb61fkFXxahp/uWgl9GaSVonvv
 MghHRXMgTdtcSZNO3KaAWl44dlDfSdKmN3GLvJ08mmwnTzyCBii8NVKS8QqbcicO1EOj
 8xlYG84a4nkSpBEWfTcY7+sIm/YWD9L7Zt/jTlhv4fAsbT7bS5tPIpUBB9fpGTzu5+Ds
 w0XDbNgdCeuvlgyJduz9cmLxIJGdPIwtpdV0KGPtuJooXbczKU41/SFPpLZUrFCWXn7h
 y8ig==
X-Gm-Message-State: AOAM532qfWmh5a2MJhUzErU5lgKL3a7ETCbudsK2uorB0PDeLvo7nIPe
 fJmE4JeV93/+Gw5PychDU/Pa1+DUeZp4uaTufv4PADtk8c+rJGaoHDOu054mvKhTIcMAMEiCjui
 phiPrNLcDtGg+oHw=
X-Received: by 2002:a17:906:d28f:: with SMTP id
 ay15mr1311578ejb.327.1606899951840; 
 Wed, 02 Dec 2020 01:05:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1Ax3zUNmPJr9+3gP+TUiz8iQAsABVBayGcHOZx8LLU+JB7dHDDPbcts9dqa/GNJrB3IKeOg==
X-Received: by 2002:a17:906:d28f:: with SMTP id
 ay15mr1311563ejb.327.1606899951587; 
 Wed, 02 Dec 2020 01:05:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b14sm721309edx.0.2020.12.02.01.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:05:50 -0800 (PST)
Subject: Re: [PATCH] docs: set CONFDIR when running sphinx
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201201183704.299697-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cca70efa-d001-f4d5-f019-5ec55b7a4349@redhat.com>
Date: Wed, 2 Dec 2020 10:05:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201183704.299697-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 19:37, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The default configuration path /etc/qemu can be overriden with configure
> options, and the generated documentation used to reflect it.
> 
> Fixes regression introduced in commit
> f8aa24ea9a82da38370470c6bc0eaa393999edfe ("meson: sphinx-build").
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1902537
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index ebd85d59f9..bb8fe4c9e4 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -9,7 +9,7 @@ endif
>   # Check if tools are available to build documentation.
>   build_docs = false
>   if sphinx_build.found()
> -  SPHINX_ARGS = [sphinx_build]
> +  SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build]
>     # If we're making warnings fatal, apply this to Sphinx runs as well
>     if get_option('werror')
>       SPHINX_ARGS += [ '-W' ]
> 

I can queue the patch, but I also wouldn't mind removing support for 
/etc/qemu completely.  I'm not sure why one would use it.  Eduardo?


