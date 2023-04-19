Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295426E7FAD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:32:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAim-0002jB-Dm; Wed, 19 Apr 2023 12:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ppAik-0002iU-Df
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ppAij-0002eo-0s
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4f6a7Bs8gPBzB4KiLNW4r3UW+sfcsAE6UpOMt2QyegU=;
 b=ceap9SFKNJGC4QP0lpr0MUmmmbrXRsDYsJ+kc+OtD6TYm+yq0kTjU/PURw+YxCO54DY9DB
 7m6J0iemUBlw2C6/guwpuZ/zgEJXV6XY7vN1oC8c40P9Wmg433HLodqwQvp4SvYwr8LbAH
 deoqx1LZqCFE3IE+oUZGpK1X2vI+dcQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-0pfvNLLxNPGR_oP3aPUqpw-1; Wed, 19 Apr 2023 12:31:45 -0400
X-MC-Unique: 0pfvNLLxNPGR_oP3aPUqpw-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay3-20020a05600c1e0300b003f1728ce786so1238817wmb.7
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921904; x=1684513904;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4f6a7Bs8gPBzB4KiLNW4r3UW+sfcsAE6UpOMt2QyegU=;
 b=Epa1R7Jfbbe0zKDPYbVxUzmkBoN2o9J+YsO0TB153/8BCSpy8eNm8UcF5KPMtDyBIH
 WYALHnudouDb7UERulQq+PNKoiQO6Iy+8z+ALomWY/yuD+BpseGkJSb8lQFEeeExBvb0
 2LfNzxQBFtwPrhj52jlCQW6R3OH65F9dp/399JqNniSKvutaEt23gJEaFEmV/NAwp0Sm
 10nE5Ke9QzyFEvDkk7sdkFYuxGVMWuLSq+X6J3o7WxwTGRB6JzlM0Ge2xev1197kImjK
 lpE3TW6omNIw4kcQOcr0l2UvSGR8qbUJTYvZDF6Mg26YSbpNeuZtCx7dLw154ytF3n7O
 BJsA==
X-Gm-Message-State: AAQBX9dMmLx6eRbz5bD7mRDBcuMMKOun9x7k97pPehksI36I1e/Qmk9w
 t3drnMpQkBjuNkd4WNH/mnmLR0NkTcNO0X+ndg0DJSR+vS+L+sqNn2dxrKbMXGB+Sp1TA/0DR1x
 G/e+aS/1j1A+B7H33/Sy35gA=
X-Received: by 2002:a05:600c:2103:b0:3f1:6474:c144 with SMTP id
 u3-20020a05600c210300b003f16474c144mr12507539wml.24.1681921904603; 
 Wed, 19 Apr 2023 09:31:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBiAF/SV9U7hRw3Jx7CYurqdzvFj9SWS/y2cAAa0hiAIsWsafFZiWOkUR8i1dxcOu7pNCOCw==
X-Received: by 2002:a05:600c:2103:b0:3f1:6474:c144 with SMTP id
 u3-20020a05600c210300b003f16474c144mr12507518wml.24.1681921904269; 
 Wed, 19 Apr 2023 09:31:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:7b00:7c52:a5fa:8004:96fd?
 (p200300cbc70b7b007c52a5fa800496fd.dip0.t-ipconnect.de.
 [2003:cb:c70b:7b00:7c52:a5fa:8004:96fd])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003f1738d0d13sm4072542wmq.1.2023.04.19.09.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 09:31:43 -0700 (PDT)
Message-ID: <2fa3ede8-6ab8-29e4-2297-004c4a2c9b7b@redhat.com>
Date: Wed, 19 Apr 2023 18:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/4] vl.c: Create late backends before migration object
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
References: <20230419161739.1129988-1-peterx@redhat.com>
 <20230419161739.1129988-3-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230419161739.1129988-3-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19.04.23 18:17, Peter Xu wrote:
> The migration object may want to check against different types of memory
> when initialized.  Delay the creation to be after late backends.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/vl.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ea20b23e4c..ad394b402f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3583,14 +3583,19 @@ void qemu_init(int argc, char **argv)
>                        machine_class->name, machine_class->deprecation_reason);
>       }
>   
> +    /*
> +     * Create backends before creating migration objects, so that it can
> +     * check against compatibilities on the backend memories (e.g. postcopy
> +     * over memory-backend-file objects).
> +     */
> +    qemu_create_late_backends();
> +
>       /*
>        * Note: creates a QOM object, must run only after global and
>        * compat properties have been set up.
>        */
>       migration_object_init();
>   
> -    qemu_create_late_backends();
> -
>       /* parse features once if machine provides default cpu_type */
>       current_machine->cpu_type = machine_class->default_cpu_type;
>       if (cpu_option) {

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


