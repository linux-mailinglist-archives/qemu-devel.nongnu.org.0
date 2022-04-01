Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6E4EEE5C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:42:07 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHXS-000247-M8
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:42:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHRs-0002mC-LN
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHRr-0000mE-0K
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648820178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqd+JX4PVTYe/HncXdyfq5EKML16QRo+1mpk2ZInk94=;
 b=MmZRWW9Qkmh+1D+p3Nsz3pxVV5b7x1kWwl1vbsWTlR0Zsiz93jx42bg5b5M2Z0IqdE0spx
 3eaG+5pcgm1Cl7qEwXpVUrw2Hik6qFN9ZHv8f4u4+LlcvyR3EHtfRdw5dDoG4ysYgoTc3D
 /mN8e0p+tjsI1c3mvhkK6HCG3cqaOWs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-lkheCs0KONeDOJV85D0bYA-1; Fri, 01 Apr 2022 09:36:17 -0400
X-MC-Unique: lkheCs0KONeDOJV85D0bYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s9-20020a50d489000000b00418d556edbdso1563714edi.4
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fqd+JX4PVTYe/HncXdyfq5EKML16QRo+1mpk2ZInk94=;
 b=yJ07bbGA7/EBrkiY7XblHaI/d/TCRoyGhxqEBF2Y3psSZ54ItKi+FYXqDrssS+K3xM
 ADBv2VpKaiZoiNTCZ3iooondz3/d33iW+uf1XBhG8JwjzHFQzYDkyl5zyuT+YlMoWtPh
 GmUoTEKXezExQ3znx1EwIJE2mx0VY9ufwFytCLVeB7VUklBtH2BK4jm6nAI0znku2eK/
 AzrldAGwJ285Eet0naaNxcAxIFs80ZM7GlFMq/1crbZts1g/D28eezMXCP3ByB/TIqRR
 6jPKHp7+w7Lx0bEl9WGwKQKtS9wuKbdfLSVxaB0i0qkXfkUc41k8TCCsQQFlShI+wslz
 7Ffw==
X-Gm-Message-State: AOAM532ap8vVqsPOzyWkdacsNQXzoRGNKi2qpd4X9d079JTSsaHflNVl
 m1zH+g5Hg61Ejnl1cVOZXSw+RBcOsP6qr6f2M2pt8XPDEmgvczq/TebjtX+37NVsYPKHp9IwIAi
 w6hQfeeeO7wYDNgg=
X-Received: by 2002:a17:906:3e03:b0:6e4:7fee:733c with SMTP id
 k3-20020a1709063e0300b006e47fee733cmr9538469eji.288.1648820176139; 
 Fri, 01 Apr 2022 06:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX+0vRWqAbbB1Z8LMTvH8GzS5Hpu5MjWQaHfIYYSzxuT/9hRafg20B8EHaJcFB6zRqCHu58w==
X-Received: by 2002:a17:906:3e03:b0:6e4:7fee:733c with SMTP id
 k3-20020a1709063e0300b006e47fee733cmr9538445eji.288.1648820175935; 
 Fri, 01 Apr 2022 06:36:15 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a170906671200b006e05929e66csm1047339ejp.20.2022.04.01.06.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:36:15 -0700 (PDT)
Message-ID: <7b733d36-dc0f-a6c7-dfcf-e1b245286086@redhat.com>
Date: Fri, 1 Apr 2022 15:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/7] iotests: add copy-before-write: on-cbw-error tests
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-4-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401091920.287612-4-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
> Add tests for new option of copy-before-write filter: on-cbw-error.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   tests/qemu-iotests/tests/copy-before-write    | 128 ++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |   5 +
>   2 files changed, 133 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/copy-before-write
>   create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


