Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D76F4045
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:39:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmSv-0006HL-Gl; Tue, 02 May 2023 05:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ptmSt-0006H2-4g
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ptmSr-0003eV-Gv
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683020308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UKQLWWWeU7R65cRluSq4H6ycv+KA6Ki3fkTFhIP7ZI=;
 b=L8jAXij1BL9ZLEyD7t6E4LIVI/z/h9g273xnPit4SKDGx+nwyEogKVvVWApGNUWPA7U8Xd
 uwx/KSwssmB0IZ6DI4Nhaty9HVAhoWJAO7EIBtn0tcAloccj+NhknMg31b1FZIYvTEvF9e
 CLnW8ECgrD9HWIze47S/tJccCM6i9aY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-B_HOBhaSMim20l5ohX22ZA-1; Tue, 02 May 2023 05:38:27 -0400
X-MC-Unique: B_HOBhaSMim20l5ohX22ZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f336ecf58cso8438415e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 02:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683020306; x=1685612306;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/UKQLWWWeU7R65cRluSq4H6ycv+KA6Ki3fkTFhIP7ZI=;
 b=JacaT2YWKJbMPF7QfGMeRSD2xgifCA8opf//GW7aF1zxQfstgsZAPA8tb83ViE1B1f
 GhxfQE/glCKrcmUAwd9VLeIySujos+16zAvReH25YyIYTdYchwlAL/lPs3cGiW6WY8Rl
 zcOjxRJqgtMD1SDhAf49hqRyQEh1TlJAvXuc/S8084rIWFEOwnLjZMHz5sDO7Z0+tp7C
 q9FncuBVurS2J15Iqmt/ay7hXBltC4qGHDqVih68APDa3xd/aDQW8TR9SyT5inPU3a0S
 4DlMQ2oNB9To03hFWlKw42K/+iV8zuUEA4n5JDyrhKXCrn8kwwPgHIR0U7fhOakUrQWa
 RYuQ==
X-Gm-Message-State: AC+VfDyvfVE2WzjpFZhQlJlOveRfpfvbiFbsQ7If2wBhZnoHCBIaiGf3
 0rgVYzmcyFnD/4txjFRomTHQDIj/qf0igfZv7Unh1sJVK/VK1x4bxWqrUEf6ZqWofODuCWBE5iG
 j9e+Fjr4vO8DIa/s=
X-Received: by 2002:a7b:c5d9:0:b0:3f1:7278:66e0 with SMTP id
 n25-20020a7bc5d9000000b003f1727866e0mr12058653wmk.30.1683020306553; 
 Tue, 02 May 2023 02:38:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4S05pJei7yGEGYtxwJLeFAbBU/2HjVeMFOkkBlh5eGlMaFC/M0VYKLgZ4+v1wqrIgIuVCvuA==
X-Received: by 2002:a7b:c5d9:0:b0:3f1:7278:66e0 with SMTP id
 n25-20020a7bc5d9000000b003f1727866e0mr12058632wmk.30.1683020306197; 
 Tue, 02 May 2023 02:38:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:2400:6b79:2aa:9602:7016?
 (p200300cbc70024006b7902aa96027016.dip0.t-ipconnect.de.
 [2003:cb:c700:2400:6b79:2aa:9602:7016])
 by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003edc4788fa0sm38983275wms.2.2023.05.02.02.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 02:38:25 -0700 (PDT)
Message-ID: <952f9399-59e6-14f5-b0f4-32037494dfb1@redhat.com>
Date: Tue, 2 May 2023 11:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/3] pci: pci_add_option_rom(): refactor: use
 g_autofree for path variable
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-3-vsementsov@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230425161434.173022-3-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25.04.23 18:14, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/pci.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


