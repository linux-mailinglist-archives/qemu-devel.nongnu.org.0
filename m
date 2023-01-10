Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459B663C4B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFALT-0004Zc-05; Tue, 10 Jan 2023 03:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFALQ-0004Xt-Dl
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFALM-000333-3y
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673340651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioCqEu8CqD0oia8Vgb7CSuS8bqNJbYMTGSrVUNNv0IM=;
 b=FOaajokMGAtfAt/gm2GHYdDCBmo4ZwA7dB+ppoIk8PzFxWvw4NOfnFD54sQoDJTfg1jGB9
 dP0x1V516+KkArCd0/VO5+1Bf46MPV4Ak2YWLuvZoTDGFehT1X2t/c/bQMpWdQImSAIC11
 pUxMmMAK6KVJJJfhvhZd3ShKX4dMpIo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-hEFewPLHOsex_1rcix6f2Q-1; Tue, 10 Jan 2023 03:50:50 -0500
X-MC-Unique: hEFewPLHOsex_1rcix6f2Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so8311223qkn.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ioCqEu8CqD0oia8Vgb7CSuS8bqNJbYMTGSrVUNNv0IM=;
 b=FXNUwISRg2jBk6VxBCN482XAPGezw+tdR+1NqOa7C2G7BWuoTqQYgNbHgO4tziB80J
 3J4AsXxQUOBnSJF4feG5M6kmgsfY4fzw5IaxGSv5ACJUWHwUIub7Fo3aJdSML0RiMZPN
 EOjpKD4m0ntaph9iag0H4RRRMCc2dd9JH8LI4rnATkszwHdDDh9RC/StqlE9y1amn9c1
 NYf5sdbuLfeHJngte3MkQ0lcf7bzeXEg3BNwXks9eHPWzBNRyiKRO+3yoMS4LnIpILWH
 LHGcoOHitun4vqmvhjGLQlAkCMibEd0NMvQGIgx+hgNrtVCbmqk1sdWU4o8EUcaIY/e9
 o+Sw==
X-Gm-Message-State: AFqh2kr9chtpxye8sY4B/ac4z+f2nRL2y2YHdhOnBMfa0lTzT5qHYv+S
 DVXGM4XQbla9gMXuJRxCu8nyd34G7RrH0TgsrjmDOnKZE3c1inUrjiQtIAxRkx3TGrpOlQ5EhXT
 iNd1wP/y1TDtJTC0=
X-Received: by 2002:ac8:5142:0:b0:3a7:eb36:5cb2 with SMTP id
 h2-20020ac85142000000b003a7eb365cb2mr85232671qtn.29.1673340650034; 
 Tue, 10 Jan 2023 00:50:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtUtDUuA+yBWkBrOav46rBAuocJd18jJsxefX2jzyhB/2rNNBgqYrQaJFGoDR1JRrFSVk4F3Q==
X-Received: by 2002:ac8:5142:0:b0:3a7:eb36:5cb2 with SMTP id
 h2-20020ac85142000000b003a7eb365cb2mr85232650qtn.29.1673340649820; 
 Tue, 10 Jan 2023 00:50:49 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 s1-20020a05620a0bc100b006fa4ac86bfbsm6754395qki.55.2023.01.10.00.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:50:49 -0800 (PST)
Message-ID: <f9554731-cdc3-7185-2b77-9b26b85d8e9a@redhat.com>
Date: Tue, 10 Jan 2023 09:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/8] configure: replace Perl usage with sed
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 pbonzini@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ed Maste <emaste@freebsd.org>, kraxel@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230110080246.536056-1-marcandre.lureau@redhat.com>
 <20230110080246.536056-4-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230110080246.536056-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10/01/2023 09.02, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Let's try to reduce our Perl usage during config/build-time.
> 
> Note: this patch might be dropped if "configure: remove
> backwards-compatibility code" is merged earlier.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   configure | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/configure b/configure
> index 2281892657..9a944698b4 100755
> --- a/configure
> +++ b/configure
> @@ -2571,11 +2571,9 @@ else
>     if test -f meson-private/cmd_line.txt; then
>       # Adjust old command line options whose type was changed
>       # Avoids having to use "setup --wipe" when Meson is upgraded
> -    perl -i -ne '
> -      s/^gettext = true$/gettext = auto/;
> -      s/^gettext = false$/gettext = disabled/;
> -      /^b_staticpic/ && next;
> -      print;' meson-private/cmd_line.txt
> +    sed -i.bak -e 's/^gettext = true$/gettext = auto/g' \
> +      -e 's/^gettext = false$/gettext = disabled/g' \
> +      -e '/^b_staticpic/d' meson-private/cmd_line.txt
>     fi
>   fi

I've ran "make vm-build-freebsd" and "make vm-build-openbsd" with this patch 
and it worked fine, I didn't spot anything in the console output, thus:

Tested-by: Thomas Huth <thuth@redhat.com>


