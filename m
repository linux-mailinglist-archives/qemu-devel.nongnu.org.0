Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50665573B90
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:48:19 +0200 (CEST)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBfX7-0000R8-J8
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oBfVL-0007Mv-2J
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oBfVH-0001e0-BC
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657730781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqoFxzMM03eVaz9oG/0zN0CzoqxBQrBtVnbSaxXcdbk=;
 b=jImdO2UGglX7+OMibUp1Vo1ZblAJlcst1Ml4KAT9iBMbjcCjgsHnuHK4Gtt+mveAOIga8K
 bDugaEjRfbv61NkfxN7PGtNOI78X2SCtXmxr5AbjT/FPDQISkM2YIIs6GRE65GR0pKwMOu
 GH/2yIy5cHD+ZS3QKx6b6/q23RAUBC8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-la-aO7tmMx6MPXiZLB0uxQ-1; Wed, 13 Jul 2022 12:46:20 -0400
X-MC-Unique: la-aO7tmMx6MPXiZLB0uxQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c7-20020adfc6c7000000b0021db3d6961bso1348423wrh.23
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IqoFxzMM03eVaz9oG/0zN0CzoqxBQrBtVnbSaxXcdbk=;
 b=2OlhmIjlOu92nqeOe7LLW9WPuJlNdJoldT4ZEpmfgBAv+/KQbQU7J/DqD6xAx56MfS
 oj2M8165dg2D2+9KrgdtNcJXc8gxX7uQ7GB2ySNeEt66SrB5l9MQgPrSKh7KNKDPEbI6
 5QBuir6Arc/eMLiBx9XwfU5VqRc7L8Brt/SU5mxKyPMlOZjtn/sUH+ytTMu+KhZdSYMe
 8vBxvU6ZUsoJENzUAoCja7iggFvB1fbVakPtGzEXuVdEqXFS++tWNNby+60GP9ZolSDT
 3sWlWXsVzhJkgGxNIKzM/hfjUfu+gKUkVxc4MSnXIIz9hVekDWcw1yS8FhT7zdA7ngkb
 6+5A==
X-Gm-Message-State: AJIora+AG/CUeiSJNjP0VVF0Wbg4OCvB549SDLE5yskNUZFUqyCxI5iS
 XPrnghtPOpNHGqV25j7hCDjCJwE9akPI2QIjwEosrYppO9KQLpExMXefDcKfW0A3EsPm9Fh0ovy
 cW/8RWTvz0AId4NU=
X-Received: by 2002:a5d:5985:0:b0:21d:b6aa:23f5 with SMTP id
 n5-20020a5d5985000000b0021db6aa23f5mr4293936wri.18.1657730779319; 
 Wed, 13 Jul 2022 09:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sG8X16rUKMJOGKMKMLBICt5Bi2LpjbOsmuCyqtxqstfawflybfLxoqC30/XiZzr8Cfe+14PQ==
X-Received: by 2002:a5d:5985:0:b0:21d:b6aa:23f5 with SMTP id
 n5-20020a5d5985000000b0021db6aa23f5mr4293916wri.18.1657730779037; 
 Wed, 13 Jul 2022 09:46:19 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 t63-20020a1c4642000000b003a2e05a81b3sm2717984wma.8.2022.07.13.09.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 09:46:18 -0700 (PDT)
Message-ID: <cf99a3cf-90a5-6890-a9ec-68506de0ad38@redhat.com>
Date: Wed, 13 Jul 2022 18:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 12/13] qemu-sockets: update socket_uri() to be
 consistent with socket_parse()
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>
References: <20220706062847.1396719-1-lvivier@redhat.com>
 <20220706064607.1397659-1-lvivier@redhat.com> <Ys1jck60PfCJPtXQ@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <Ys1jck60PfCJPtXQ@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 12/07/2022 14:05, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
>> Remove 'tcp:' prefix for inet type (because inet can be 'tcp' or 'udp'
>> and socket_parse() doesn't recognize it), the format is 'host:port'.
> 
> I don't think I understand why tests/qtest/migration-test.c
> test_precopy_common is happy with this; it does:
> 
>      if (!args->connect_uri) {
>          g_autofree char *local_connect_uri =
>              migrate_get_socket_address(to, "socket-address");
>          migrate_qmp(from, local_connect_uri, "{}");
> 
> which hmm, is the code you're changing what was in SocketAddress_to_str
> which is what migrate_get_socket_address uses; but then the migrate_qmp
> I don't think will take a migrate uri without the tcp: on the front.

It's a good point.

I think socket_parse() should accept the 'tcp:' prefix, and thus socket_uri() should 
generate it, so it will be usable with the qmp migrate command.

I'm going to add 'tcp:' case in socket_parse() and make socket_uri() to generate it.

Thanks,
Laurent


