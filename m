Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936C5E9A6D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 09:28:40 +0200 (CEST)
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ociXf-0001y4-0Q
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 03:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ociU8-0000JW-2E
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:25:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ociU4-0005SJ-Fl
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664177093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NYx4d0MxanG198H/BLFFamozz7fZQnYYNp+AMpK1oNw=;
 b=B9tSMHPWr+Krl7tgdAIkhV/2f0pB3DlMpYkjGrWZhRc5xI1AjVvP1I5ukb7mEeehvDY4fP
 Hf0fzzzI0BN6l3YfHmVF/OLJvuxfjO2W4s+Ww4KdgqvD2lstRegxHOTqvfuj/gtK3ctAv3
 y1ZWxixDol2q8xqf44uAGs319UYIbss=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-SWO_uNMpP_Kz8KxZmqMS1w-1; Mon, 26 Sep 2022 03:24:51 -0400
X-MC-Unique: SWO_uNMpP_Kz8KxZmqMS1w-1
Received: by mail-ua1-f69.google.com with SMTP id
 y44-20020ab048ef000000b003cd69b6e479so726993uac.9
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 00:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=NYx4d0MxanG198H/BLFFamozz7fZQnYYNp+AMpK1oNw=;
 b=FIeEzqvm4zH2/mUmk48tfQBkyllpWI3daxT2jL4jPNUECH6g6zpa2hi4ICVpGhqK+H
 weGO/1Q+BXhD1jLW49BtrwMSAOilA03gkshWrzFARgK1389a2kss3EBe8gIiPQmXVOC+
 j/t+fQMYUjO0ZahpaqTaowSlum7qYjup94aeodQhWQoGmWmaV0jQzoBol/WZlFjPmXPk
 DBCk99omcbPNK/cMNuiUsPgJnpgGoGEBFSBQZFLshIi79KOnHksISXhez7nF5vLDdr6b
 1NwIW8NJed3sWMBOXtR5pvKmz6fA0K2XW/z7LxEHLA296nYe4oKN/ZGcEWplAkYgB+jS
 4g3A==
X-Gm-Message-State: ACrzQf0qqLB1gbhqX4oV/65qeb3s7Kr62QpZau4vhpXTrhf+rx+SKnYV
 A6DAu2cjuUxEQriYnqbDwfHiz/zKz60tMYi2d0UCPkmNTGwxxwf8Xyc0L1ntan55tb2S/c5Y30s
 0TkJbDT7U2fQo12mG+WU5CBa2vR5BHyo=
X-Received: by 2002:ab0:60c9:0:b0:3c3:b626:6f4 with SMTP id
 g9-20020ab060c9000000b003c3b62606f4mr7730935uam.57.1664177090733; 
 Mon, 26 Sep 2022 00:24:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zxcklMa7rqYGWC5njsjhdMVriXrJYiXL+d5q1e4Wc0c02uly6lxFRdJqyCReHaDNJ/k3ionHKfYs5CKS+mFg=
X-Received: by 2002:ab0:60c9:0:b0:3c3:b626:6f4 with SMTP id
 g9-20020ab060c9000000b003c3b62606f4mr7730925uam.57.1664177090511; Mon, 26 Sep
 2022 00:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-23-pbonzini@redhat.com>
 <dae44515-adf2-78fb-fd91-dd310849b6a7@linaro.org>
In-Reply-To: <dae44515-adf2-78fb-fd91-dd310849b6a7@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 Sep 2022 09:24:39 +0200
Message-ID: <CABgObfYEtHGkJN9q=xg1oMUcBWOqoy0wQCfuV5ye_m2hhf8YOA@mail.gmail.com>
Subject: Re: [PATCH v2 22/37] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, paul@nowt.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Sat, Sep 24, 2022 at 10:43 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> > +static void decode_0F79(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> > +{
> > +    if (s->prefix & PREFIX_REPNZ) {
> > +        entry->gen = gen_INSERTQ_r;
> > +    } else if (s->prefix & PREFIX_DATA) {
> > +        entry->gen = gen_EXTRQ_r;
> > +    } else {
> > +        entry->gen = NULL;
> > +    };
> > +}
> ...
> > +    [0x79] = X86_OP_GROUP2(0F79,       V,x, U,x,       cpuid(SSE4A)),
>
> These are not -- they're AMD New Media.

What's the CPUID bit for these? Neither
https://github.com/intelxed/xed/blob/main/datafiles/amd/xed-amd-sse4a.txt
nor the AMD programmer's manual makes any distinction between
EXTRQ/INSERTQ with register operand and the same instruction with
immediate operands.

Paolo


