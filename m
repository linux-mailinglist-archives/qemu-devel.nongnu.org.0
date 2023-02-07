Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520368DBEA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:44:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPCA-0001SJ-GZ; Tue, 07 Feb 2023 09:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPC9-0001Ru-34
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:43:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPC7-00029t-Mr
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675781018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/5J13TxMFR2+6p1fgAFZLZxCwiBhqUgdDUNGYSuRLo=;
 b=cx32tVA6xclByfBnJUYQqSIO/EWMxtRB0vBFPA6+ZCXqaaJDMbjXhAG0rG/FzWsrotHNwc
 EPNAR2Nfx6EmxvBHmVy5jjyOm9/ZxIBBHkmPAOTAX9gLSaaxq5Bz+WUB6fakbSFGkLv9fL
 U0yd/OrqP6IHbokuM49EdGwEWqterWw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-nt7rqecHNyqUuuDz9g569Q-1; Tue, 07 Feb 2023 09:43:37 -0500
X-MC-Unique: nt7rqecHNyqUuuDz9g569Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 g6-20020ae9e106000000b00720f9e6e3e2so10025040qkm.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a/5J13TxMFR2+6p1fgAFZLZxCwiBhqUgdDUNGYSuRLo=;
 b=SfZlrbg2l4d8qTImi9TVFKNbxRq1+q045VJ2Fgmt815D+Z9Z3jVTtfZ7XA8nlnIlS5
 MiGu9gq5btPh02RzOP8aU9ZT0DVXfWjt2ptQTpq9ZK1M/Lw4V/98aedTG96+fi0IYDko
 EniwdMHN0HLCfpgyhREXs5dO7O8oR7WjVFhHpeqePacKYT2lwC6c0M3sJe9eSDE2xIce
 eIw433xVRYm0Df7Pzf49T001WdiqB5yG/wvK5qWQn4T3SkJmg43y3HmcmsGswCdUaTsl
 swPV/j98kYjoHeUE0Tb87MS06/HKtW8sVFSU1+YsuZYbmPHCwFGSQ6hIEh6QH0J5h7/m
 +2GQ==
X-Gm-Message-State: AO0yUKUNLce9wwytvPY/PMGWors/p0vCRIdf/JR1hdDLVkBIMPr70Ff/
 rf1ginjW1YjIeu7BCMpogNtYmE6PLxj7jWW9QQQzisLJhJ6unFWGW3xo1g43smEXHda1DJ/zQuB
 n/fZvGvaxsTSPfrw=
X-Received: by 2002:ac8:5955:0:b0:3b8:4adb:c604 with SMTP id
 21-20020ac85955000000b003b84adbc604mr6468749qtz.14.1675781015969; 
 Tue, 07 Feb 2023 06:43:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+ve47/FTOERmcNWArU0CHm76CE+6Jip6QvFV6CzuoTsqsaxRmLaFduE1MTQSV9lO2MdjCaag==
X-Received: by 2002:ac8:5955:0:b0:3b8:4adb:c604 with SMTP id
 21-20020ac85955000000b003b84adbc604mr6468722qtz.14.1675781015749; 
 Tue, 07 Feb 2023 06:43:35 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 k64-20020a37ba43000000b007023fc46b64sm9471612qkf.113.2023.02.07.06.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:43:34 -0800 (PST)
Message-ID: <ac129d7a-6047-4d2c-d966-a94cd6344dca@redhat.com>
Date: Tue, 7 Feb 2023 15:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 02/10] char: do not double-close fd when failing to add
 client
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230207142535.1153722-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/02/2023 15.25, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The caller is already closing the fd on failure.
> 
> Fixes: c3054a6e6a ("char: Factor out qmp_add_client() parts and move to chardev/")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   chardev/char.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/chardev/char.c b/chardev/char.c
> index 11eab7764c..e69390601f 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -1175,12 +1175,10 @@ bool qmp_add_client_char(int fd, bool has_skipauth, bool skipauth,
>   
>       if (!s) {
>           error_setg(errp, "protocol '%s' is invalid", protocol);
> -        close(fd);
>           return false;
>       }
>       if (qemu_chr_add_client(s, fd) < 0) {
>           error_setg(errp, "failed to add client");
> -        close(fd);
>           return false;
>       }
>       return true;

Reviewed-by: Thomas Huth <thuth@redhat.com>


