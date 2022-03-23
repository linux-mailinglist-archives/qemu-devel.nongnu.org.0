Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80264E5443
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:30:28 +0100 (CET)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX20J-0001YD-QY
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:30:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nX1yX-0000h3-JY
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nX1yW-0003OL-0P
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648045715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8aehf83CSEGg2BmKb545qLsuJ7DhEOfGdqxrWCfBUY=;
 b=Fu5ONxfM+QUYajBbbZYXIhOzTej54ZihlNmouSq9f7wwbJEiy21FBBlLvSd6ES9EsU8sf+
 aTyZ3OCwYysdK8S+IK0mg8a4S36SFuRh/dvUDrwyQxa9TpS0uWIgRijhJ4mQZbCnsnKK/A
 64FqDY7N47tEjVoW69HiKlGhQJL9OlI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-IgWWVWZlMRiNhd6Vzs6mmQ-1; Wed, 23 Mar 2022 10:28:34 -0400
X-MC-Unique: IgWWVWZlMRiNhd6Vzs6mmQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a5-20020adfc445000000b00203dcb13954so557874wrg.23
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 07:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S8aehf83CSEGg2BmKb545qLsuJ7DhEOfGdqxrWCfBUY=;
 b=LEZWbWg2hjdxyfBoCjQUOulZcaQwwubLwmvv+zsg46leD+o+pYa6Q7Sit62pq4Oy9D
 IkogZrQhqO/d6VvqWeAl2jcuZlWkWPUQoA23Sud/VGo7jp+5s0RcttEhRMuctoFs4HsS
 +xGSMRIJdBbcGzBAHdxGALKghlUupbVGeziTcqh8tLCuoerg3BnrOwfq+abZJs90Ie4Y
 RbV2r055FO9sVktZBqZMh5zPU3fzaowr1/D/UWYjNbPN1OlTVyF1RgFKssUhgn8D4f4Z
 1gOfDuPb6umleoWhUlb436i9/GvCcTyUUCKGtAvBScNEPIbPyG4qCIdeYH+HtMJ3Ag9z
 iQDg==
X-Gm-Message-State: AOAM530Nl3QLLMoIMIvdNwSBjmWQ49CayahgFzD+80Rq9F9kDCE+iC3S
 Vx4JGxcxLveXlbiCABUP45kGMSmHc3BHIEBlCdjwzRDY5o2Vxe8ygs/APES3mfD9kEZLrqx+/Ah
 0emW/xLYJOboF12U=
X-Received: by 2002:a05:6000:1e07:b0:204:d97:8d1f with SMTP id
 bj7-20020a0560001e0700b002040d978d1fmr67890wrb.542.1648045712770; 
 Wed, 23 Mar 2022 07:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVMIwm+ABy2qB+wdGUnjKvQ7KszLl+nMxrZas+TUgev8EPXr66iaAkL2QumQC8v5YfGAqShw==
X-Received: by 2002:a05:6000:1e07:b0:204:d97:8d1f with SMTP id
 bj7-20020a0560001e0700b002040d978d1fmr67861wrb.542.1648045712476; 
 Wed, 23 Mar 2022 07:28:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:a300:f7c1:f4a5:f958:a561?
 (p200300cbc704a300f7c1f4a5f958a561.dip0.t-ipconnect.de.
 [2003:cb:c704:a300:f7c1:f4a5:f958:a561])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm47898wrv.10.2022.03.23.07.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 07:28:32 -0700 (PDT)
Message-ID: <c8e34b3d-7ccc-d664-38db-72f689668d84@redhat.com>
Date: Wed, 23 Mar 2022 15:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 07/11] target/s390x: vxeh2: vector {load, store} byte
 reversed elements
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323135722.1623-1-dmiller423@gmail.com>
 <20220323135722.1623-8-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220323135722.1623-8-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);
> +    TCGv_i64 t0, t1;
> +
> +    if (es < ES_16 || es > ES_128) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +
> +
> +    if (es == ES_128) {
> +        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
> +        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +        tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
> +        goto write;
> +    }
> +
> +    /* Begin with byte reversed doublewords... */
> +    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
> +    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
> +
> +    /*
> +     * For 16 and 32-bit elements, the doubleword bswap also reversed
> +     * the order of the elements.  Perform a larger order swap to put
> +     * them back into place.  For the 128-bit "element", finish the
> +     * bswap by swapping the doublewords.

The last sentence still needs to go.

[...]

> +static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);
> +    TCGv_i64 t0, t1;
> +
> +    if (es < ES_16 || es > ES_128) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    /* Probe write access before actually modifying memory */
> +    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +
> +
> +    if (es == ES_128) {
> +        read_vec_element_i64(t1, get_field(s, v1), 0, ES_64);
> +        read_vec_element_i64(t0, get_field(s, v1), 1, ES_64);
> +        goto write;
> +    }
> +
> +    read_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
> +    read_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
> +
> +    /*
> +     * For 16 and 32-bit elements, the doubleword bswap below will
> +     * reverse the order of the elements.  Perform a larger order
> +     * swap to put them back into place.  For the 128-bit "element",
> +     * finish the bswap by swapping the doublewords.

Dito.

I assume Thomas can fixup when applying.

-- 
Thanks,

David / dhildenb


