Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46948C82B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:21:35 +0100 (CET)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gNS-0006iW-Qe
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7fyq-0007X5-Um
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7fyo-0008II-B2
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642002965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRxQ6FQH0aXeMGq2pF679uT3EgH67AJVAzMbtJ0cIEg=;
 b=FOpRnE9J7TWK+AnG+cwGr5VBfGJDP6GkD09O1Mv/80QuBEC7bXamftmL4KlqEZ9ZZz/WXw
 Z8DqjuRHBtdOJFrdo4KOfEwjSwW8ICd1v+JF4Mzsrx+gB/9c89qcTvu1lW7CadgeI/1vWN
 Qy2u95HNIbCITXXQpDwyzAXX7hOycYQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-uw5YC8hBOuWTN7RpA6mDkw-1; Wed, 12 Jan 2022 10:56:04 -0500
X-MC-Unique: uw5YC8hBOuWTN7RpA6mDkw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so2664550edb.4
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TRxQ6FQH0aXeMGq2pF679uT3EgH67AJVAzMbtJ0cIEg=;
 b=W0HUWo1ydH8WtdWQRNy/7NRbikMF7+2yiwJ4mHZS8ZHrzZgF4mADPWl8bPCF7d6mIG
 jLwimwEFY7AkcEg0bzT4szybNtPnfidtsD7HShh63FhtfmrNZdY2tsycUxMKVr7yxB3/
 PlRmcHbBlbN9rVQKklVssCyXMnnlOoOoXL6gF8/mqCypWRBgWKGi5xaFesNBFs4NCfMR
 gZuyv3oQvqz8D6Vu19nHIOmyU/pdp5APUcSI00+LJRZpI1RUTaZhlxi4uJ0UzU7B28bj
 rexlDorcF5qhcvZDDu6vzh6FiYTi5GT2cnFDkjNyZNHiBXZ1Y2xP6R3eMPQVODSjMPmn
 VYdw==
X-Gm-Message-State: AOAM533itUWs7tyIUOmvUQfY4QvpQVHBnyJgnQKcIKasEAq+T3CXV1Nz
 3cEO5qm3o53KQbQJu2Xvuvi12v7LhyIKLyfMPAz/5qcc7oPnCK6ggqsQuwcuzZ99mS2b7mnH1sv
 fqwQZfLYwDO9VQWg=
X-Received: by 2002:a50:9e6c:: with SMTP id z99mr260213ede.71.1642002963226;
 Wed, 12 Jan 2022 07:56:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCN89Njzo1Rw5BTy70R3yZfT7YmTeP5NEZQ3FNrRU+2eK8S6KBj79jLeVIy5/tZBmA0Wg4vg==
X-Received: by 2002:a50:9e6c:: with SMTP id z99mr260184ede.71.1642002962914;
 Wed, 12 Jan 2022 07:56:02 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id kx21sm30211ejc.155.2022.01.12.07.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 07:56:02 -0800 (PST)
Message-ID: <b303e5d5-3494-9312-7e07-effca3126eda@redhat.com>
Date: Wed, 12 Jan 2022 16:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 4/5] target/s390x: Fix shifting 32-bit values for more
 than 31 bits
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112131751.226011-1-iii@linux.ibm.com>
 <20220112131751.226011-5-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112131751.226011-5-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>  static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
>  {
>      if (dest == s->pc_tmp) {
> @@ -4113,9 +4099,15 @@ static DisasJumpType op_soc(DisasContext *s, DisasOps *o)
>  
>  static DisasJumpType op_sla(DisasContext *s, DisasOps *o)
>  {
> +    TCGv_i64 t;
>      uint64_t sign = 1ull << s->insn->data;
> -    enum cc_op cco = s->insn->data == 31 ? CC_OP_SLA_32 : CC_OP_SLA_64;
> -    gen_op_update2_cc_i64(s, cco, o->in1, o->in2);
> +    if (s->insn->data == 31) {
> +        t = tcg_temp_new_i64();
> +        tcg_gen_shli_i64(t, o->in1, 32);
> +    } else {
> +        t = o->in1;
> +    }

Are you missing to free the temp in case you allocated one?

-- 
Thanks,

David / dhildenb


