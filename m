Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3574E445C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:39:33 +0100 (CET)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhXg-0001bS-7X
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:39:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhVm-0008Gs-FU
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhVl-00008i-2U
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647967052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CD+6JESYZpOzRHoF8I6ODRMhMwCQha/83MGfRPR+1MQ=;
 b=IW8uU4/170YHT1huojc/nAit6NkoRK/Y+0nBj7BFt98BkJbq0UJ2NgyViO43kajoSxWvO8
 4eQN93lztKd+C9xcWbLKH6jR8buxCgemjDvhO92OUw323MD5rAPfb274SXtZf1bifeVjFu
 fff7hEdZsejkqsNqNu2IDT5b29BCkqI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-hEBx7xr-PTixOdmHjMduMQ-1; Tue, 22 Mar 2022 12:37:31 -0400
X-MC-Unique: hEBx7xr-PTixOdmHjMduMQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f2-20020a50d542000000b00418ed3d95d8so10211654edj.11
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CD+6JESYZpOzRHoF8I6ODRMhMwCQha/83MGfRPR+1MQ=;
 b=fCJggZdt2FY9kChCApa2uhqRCBNCdQgPTwGHPgWuRj6Po/+xqj/73isHeImM7wiS2L
 rHMMtF10ZEauEblHU13wC8glLbRqCbjZ39XynmA4ujOr9eecbnaJy+XSzI5h2NbtL8DE
 X+TZDuKKjqkJOhASjDSwBh/DCQLto1DWuUxBUNnpBvd7prlDzUidgOGhzazfetcpjuaA
 xrnzQ8q0EBzDbyqztaPrI7Tddub0rD9eGFGyL45K3Hf/fsK5e5I5OyK5bT4sGvjeVAde
 c+AYTPor4eecPk3gbSa7qf9XH983Sv+Y+wLT3prspkNxJCb8/UUtCCegYw4rvzAFXEG2
 P6cg==
X-Gm-Message-State: AOAM531fTJFsK7Y2Qaxw/AYw/NYtAZvUzyp9mOEJreUJSpsBsOywCKD6
 AG50UYuEerDjXMgxkMOxx91gVaFP4v+04ArJaSGE8JE/4MYagL394+bugDWujmnQhEyi4i/VDdx
 Bun6QF6j6y9CLoTA=
X-Received: by 2002:a17:907:1623:b0:6df:c9da:a6a8 with SMTP id
 hb35-20020a170907162300b006dfc9daa6a8mr18003222ejc.303.1647967050238; 
 Tue, 22 Mar 2022 09:37:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ9JzmrMoUiP1Hn0w9SxPMI27quOMgifdQgJ6gIP1EcFIqQos6UWBtKMO36VvVy5xcFEBGbA==
X-Received: by 2002:a17:907:1623:b0:6df:c9da:a6a8 with SMTP id
 hb35-20020a170907162300b006dfc9daa6a8mr18003200ejc.303.1647967049996; 
 Tue, 22 Mar 2022 09:37:29 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 hq39-20020a1709073f2700b006dfc58efab9sm5478044ejc.73.2022.03.22.09.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:37:29 -0700 (PDT)
Message-ID: <8489d28e-8a4a-b857-560d-4451739d9f2c@redhat.com>
Date: Tue, 22 Mar 2022 17:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/15] iotests/migration-permissions: use assertRaises()
 for qemu_io() negative test
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-13-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-13-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> Modify this test to use assertRaises for its negative testing of
> qemu_io. If the exception raised does not match the one we tell it to
> expect, we get *that* exception unhandled. If we get no exception, we
> get a unittest assertion failure and the provided emsg printed to
> screen.
>
> If we get the CalledProcessError exception but the output is not what we
> expect, we re-raise the original CalledProcessError.
>
> Tidy.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   .../qemu-iotests/tests/migration-permissions  | 28 +++++++++----------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Just like Eric I don’t find it so tidy that `ctx` exists outside of the 
`with` block, but re-raising the exception is indeed better, so:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


