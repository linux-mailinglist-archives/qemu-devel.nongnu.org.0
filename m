Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C44B866D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:05:14 +0100 (CET)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKI7V-0002Ay-Vn
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:05:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKI25-0006d6-2d
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:59:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKI23-00039h-8R
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645009174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4gm+qV114GwUsCdXyJHjtE99+Z+ASNqSKXp/2fWlbo=;
 b=CaNw0jhM9Fiu8HrR+yMw05uOP3Uoi0FMZnn5jErmFitfVWq2lvWJAv3SpqdEoI+WVP3ZMz
 ME9ijNK2isz1ZfQl+nDiuF4sd+Ww0YSJtVSDR63X0RPvpQ9oOEo6vTQ/AyM8TUPh2v38Z5
 RrPJdfYtjGLIk4Z8exIsIK7pynixUis=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-3Bnv-pKfMJmI2KZfGs-obQ-1; Wed, 16 Feb 2022 05:59:28 -0500
X-MC-Unique: 3Bnv-pKfMJmI2KZfGs-obQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so952116wrc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=b4gm+qV114GwUsCdXyJHjtE99+Z+ASNqSKXp/2fWlbo=;
 b=hO0t657blbH0dbd1WrlYcOeClF8zhfOle3ICW0daOzbyu7WM9dUOWdyJw8u2AhMx2P
 kfFyXKWZlSM3867BK8+TxVIGsPs8JIJz2H5R+gHT4yfj5UzQ6A0SDZThtxNRoblt0E2C
 xRXlEGLxM+FIZVYsQPDqWXRii8sOkIBcOLsq6hqlflShZIFpmjd5Ma8RQojw2jTYiFs5
 THFhURFTuAm7H0x2hcUw6EpSJYq+mILhmSOMLwMLtjULoxgCZwY7UKlhtbcyK1lVlgSR
 aBLjgp8YwLWsU9kmGM3+fTYZCi/3KmGoSb6HcHM7HEHX3xZUtL/OqcbDa9P2NjbSuUbp
 fh9Q==
X-Gm-Message-State: AOAM533KamoJJwYIUg1NW1btQwFFkpxQ+rllhNIIUwpcK30W1KX46UCu
 nFiW8KvUqDeH04JKgcvPvLvPJhLjdE6Ro/7wYztY0jtFLU9+5KqsJWiOHSJweh7mPoCLanTlGDR
 TtsvXx3lEVdx77NA=
X-Received: by 2002:a7b:c341:0:b0:37b:ed90:7dad with SMTP id
 l1-20020a7bc341000000b0037bed907dadmr1042509wmj.138.1645009167273; 
 Wed, 16 Feb 2022 02:59:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9OdDeY/V4W4/wwQm2uBWqCNL1+j42sPrW9hIKAIXA/p0XZAaDIz+PAAUfdddVF6bo6kfjqQ==
X-Received: by 2002:a7b:c341:0:b0:37b:ed90:7dad with SMTP id
 l1-20020a7bc341000000b0037bed907dadmr1042483wmj.138.1645009166882; 
 Wed, 16 Feb 2022 02:59:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id c8sm22247902wmq.39.2022.02.16.02.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:59:26 -0800 (PST)
Message-ID: <35ce4187-56f5-6eaa-1171-6cf15f7fa1e7@redhat.com>
Date: Wed, 16 Feb 2022 11:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 1/3] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
From: David Hildenbrand <david@redhat.com>
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
References: <25fcb9f9-4314-faca-a7e3-99fbbe0541d2@gmail.com>
 <753e5e7f-e9b9-d35f-2a7b-edbbe512edad@redhat.com>
Organization: Red Hat
In-Reply-To: <753e5e7f-e9b9-d35f-2a7b-edbbe512edad@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, thuth@redhat.com,
 cohuck@redhat.com, farman@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 11:31, David Hildenbrand wrote:
>> +static DisasJumpType op_sel(DisasContext *s, DisasOps *o)
>> +{
>> +    DisasCompare c;
>> +    disas_jcc(s, &c, get_field(s, m4));
>> +    tcg_gen_movcond_i64(c.cond, o->out, c.u.s64.a, c.u.s64.b,
>> +                        o->in1, o->in2);
>> +    free_compare(&c);
>> +    return DISAS_NEXT;
>> +}
> 
> 
> I realize that SELECT really is mostly identical to LOAD ON CONDITION,
> except that we have a second input.
> 
> The following on top would unify both
> 
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
> index fb482b08b7..493f1d669c 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.def
> @@ -781,8 +781,8 @@
>  /* SEARCH STRING UNICODE */
>      C(0xb9be, SRSTU,   RRE,   ETF3, 0, 0, 0, 0, srstu, 0)
>  /* SELECT */
> -    C(0xb9f0, SELR,    RRF_a, MIE3, r2, r3, new, r1_32, sel, 0)
> -    C(0xb9e3, SELGR,   RRF_a, MIE3, r2, r3, r1, 0, sel, 0)
> +    C(0xb9f0, SELR,    RRF_a, MIE3, r3, r2, new, r1_32, loc, 0)
> +    C(0xb9e3, SELGR,   RRF_a, MIE3, r3, r2, r1, 0, loc, 0)

I forgot SELECT HIGH, requires similar adjustment.

-- 
Thanks,

David / dhildenb


