Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C3592B65
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 12:23:08 +0200 (CEST)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNXFS-0000w2-Rc
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 06:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oNXBq-00072X-Bp
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 06:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oNXBm-00032D-88
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 06:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660558756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sw0Bm1QTW6vSJY+2KXhwVHuNYYkQLCfjwJSil9AdICU=;
 b=AYykRmpWzVvMf6UdQNEgMbRm+aLzmp9iV/lfuIji0v1GeTqrQVQGLHlwK7jrxVr4NsDSqm
 G9DbHRP6gM2FHoHnsTZfp1QD3juZVRj786rhS+vBuwn12dnr3BZPcB+/TlKhv6QMet0Pmo
 hmuVY/Au2mig7Jy+APJ5fPELC9cpiH8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-347-jfNkXbn1MC-qUZhVDrlBGQ-1; Mon, 15 Aug 2022 06:19:14 -0400
X-MC-Unique: jfNkXbn1MC-qUZhVDrlBGQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h6-20020a05640250c600b0043d9964d2ceso4457014edb.4
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 03:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=sw0Bm1QTW6vSJY+2KXhwVHuNYYkQLCfjwJSil9AdICU=;
 b=0sZ5850POylLUk6jRs0s1QSOfT1AwsgieaYaMRkLAbe8cMrxZP0eSW5aBB/ejZx3vB
 VKPnnVb+oA75rrWLzXpnJdspTRKdQ0H2IQNrwtj9feaApKft7iUWRhg61mGKuyPwJ71f
 QYfmVx/SGlKbn2Ie+6afypTWwy6fF8RkTej6dB3gxU/pEoOrAQb4EsF6Um/A81i+Nf/3
 tX9L2k5Cpw2P79y2RZOyHZbwM+Mno+l9NnJj+Lc9crPNan1tfpaahu5ekBxovylzt4of
 5sxtc6ibedvTkxkHTON3rz5zADtf0R26fm8rW/pn+gcg8qVhh3fwjbnZGKFp5ixQlgsJ
 pTGQ==
X-Gm-Message-State: ACgBeo18gK2XAkiKHFhzKHkQXGor4S9smuQTbKQvVbxIIH+upTvTTpp1
 2BzMIKZknfPJRtpG7nBGEXY+q30INtMAL6JJmNMKA0197GIraru6Vy1iLuBtT9c4tmh7M7YL0km
 +7zvJ2Q9tXiPlOIs=
X-Received: by 2002:aa7:cc06:0:b0:440:7258:ad16 with SMTP id
 q6-20020aa7cc06000000b004407258ad16mr13722665edt.74.1660558753923; 
 Mon, 15 Aug 2022 03:19:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4wtHDXfifb+ikwX1/txLXTv1t4+OXRR/QHpoOCspU/ZDYQwIVW1+aBeUShhbGgWIJZD0i3pg==
X-Received: by 2002:aa7:cc06:0:b0:440:7258:ad16 with SMTP id
 q6-20020aa7cc06000000b004407258ad16mr13722657edt.74.1660558753714; 
 Mon, 15 Aug 2022 03:19:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170906130a00b0072ecef772a7sm3910676ejb.160.2022.08.15.03.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 03:19:13 -0700 (PDT)
Date: Mon, 15 Aug 2022 12:19:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: WANG Xuerui <i.qemu@xen0n.name>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH for-7.1 1/4] target/loongarch: Only allow short -cpu
 arguments without type name suffix
Message-ID: <20220815121911.572b5d65@redhat.com>
In-Reply-To: <20220814145522.1474927-2-i.qemu@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-2-i.qemu@xen0n.name>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Aug 2022 22:55:19 +0800
WANG Xuerui <i.qemu@xen0n.name> wrote:

> From: WANG Xuerui <git@xen0n.name>
> 
> Previously both "foo" and "foo-loongarch-cpu" are accepted for the -cpu
> command-line option, the latter of which being excessively long and
> redundant, hence unwanted. Remove support for consistency with other
> targets and simpler code.

to be consistent wit -device and other (qmp/monitor interfaces)
it's better to drop short variants (they are there mainly for compat
reasons) and use only long names (i.e. complete type name).

use avr_cpu_class_by_name() as an example

> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  target/loongarch/cpu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 941e2772bc..dc233ee209 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -573,14 +573,11 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
>  
> -    oc = object_class_by_name(cpu_model);
> +    g_autofree char *typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"),
> +                                                cpu_model);
> +    oc = object_class_by_name(typename);
>      if (!oc) {
> -        g_autofree char *typename 
> -            = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
> -        oc = object_class_by_name(typename);
> -        if (!oc) {
> -            return NULL;
> -        }
> +        return NULL;
>      }
>  
>      if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)


