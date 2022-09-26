Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3955EA627
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:31:49 +0200 (CEST)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnH2-0004rR-Ma
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocn3j-0001XS-2o
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocn3h-000148-8M
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664194679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU/e/nfS65j/GIIe63Jhr9/yaN+WC38Xdvn360RfRbs=;
 b=cfZ2fjqtZsd0pv+cCiYC9CUjV5mHZyavTDWYw3Q6IqIq4C44c58UqAG+JHgVB2NsJaKC/3
 vd+6RJOKY+cIBWSwlzJx3zMp6wMSsG+5BmBZSfHl0zkDg+OGkvWJ78fVHLwz4Z/vU4sSUG
 u9nC14zSnMfwoulFLttTlaF3pP+NgXE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-Xk9SrPpJOhW1kxPfcBK4jw-1; Mon, 26 Sep 2022 08:17:57 -0400
X-MC-Unique: Xk9SrPpJOhW1kxPfcBK4jw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so4083454wmn.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 05:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kU/e/nfS65j/GIIe63Jhr9/yaN+WC38Xdvn360RfRbs=;
 b=yciwRazPVLIXH1HjW9ryXT8BiSeNOb8MehtoGi2MhoEsaY/eq+nRY+zDHa/BP7kPaH
 lXUUbnlZbgAzITw5XQJs1NE3KYvzs6Y+k+kApS/wexBlGWRtKlGgs2+au4Sq3KT07osx
 fEQeJWgCzs04RhhXC9JQmGgQJz99i5hZg+mQ1SEL0CdrG6OZzzSqRzu38U0UhGyT1HAk
 U1/jWWWESVUDzwUnOrNieu2FEeBnKKXOIPz2VNlTWzD8HlCUUPPfsJUOYtHb15kUSfRQ
 yNZNDdY9wOtYOAWLEflhE3k+3HQhivkuvAAIpYBW5jYL/wNiFdnMfbJysuLlEFDUgqbZ
 ZWgQ==
X-Gm-Message-State: ACrzQf3QTzPEhiXB+KGT/PEzWtN5NUXeewwWWHtxR6cskf+WtEkZbcHd
 eYseD1n8PpG9ob41h0XtKewOj97h+2qR6L4vhJjbBzsXgz57IN47Iahg9rLDxD8IgMYjIZR0E31
 Pdkr4B0viaI9nJMg=
X-Received: by 2002:a5d:58da:0:b0:22a:c3cb:e3cb with SMTP id
 o26-20020a5d58da000000b0022ac3cbe3cbmr13355698wrf.34.1664194676364; 
 Mon, 26 Sep 2022 05:17:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4V1fml12QmsTeM5sw1xl62xAmub7aHti+1BRIUpMemh3SEkfQCLaHXYEekN9v9M/HzQKmhXg==
X-Received: by 2002:a5d:58da:0:b0:22a:c3cb:e3cb with SMTP id
 o26-20020a5d58da000000b0022ac3cbe3cbmr13355684wrf.34.1664194676147; 
 Mon, 26 Sep 2022 05:17:56 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-251.web.vodafone.de.
 [109.43.177.251]) by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4b84000000b00228a6ce17b4sm14352553wrt.37.2022.09.26.05.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 05:17:55 -0700 (PDT)
Message-ID: <e665e63b-748f-5218-2158-88ee245d4df0@redhat.com>
Date: Mon, 26 Sep 2022 14:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 05/54] tests/qtest: ahci-test: Avoid using hardcoded
 /tmp
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-6-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220925113032.1949844-6-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 25/09/2022 13.29, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> 
>   tests/qtest/ahci-test.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


