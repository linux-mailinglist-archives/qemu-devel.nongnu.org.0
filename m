Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AD429E5E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:13:28 +0200 (CEST)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maByZ-0003gW-IA
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maBxe-0002xQ-JE
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maBxc-0002ZX-G1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634022747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ozMvJsarxbY9U2A6r5wTbGCpiZICleciDE1wXQdATk=;
 b=LmPk5GoJhS60UFigBlTQ72XUwm6zjmkuvKqOqFju+JgOxneK5jCdsBeaEu2xcwbFgHgbwf
 ZeRtV0uzFDb5uENlp8LAo3Zp+QUe4GiCxDZw8YAoAK/T9dkF6ZwxmBCbrud1E5+U0CoInA
 oWP8ij5obpAzpLCl/sWD3nsPw4i6U/0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-PO4LpIbRM3aDXwOMXerJvA-1; Tue, 12 Oct 2021 03:12:26 -0400
X-MC-Unique: PO4LpIbRM3aDXwOMXerJvA-1
Received: by mail-wr1-f70.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so14292604wrc.22
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 00:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ozMvJsarxbY9U2A6r5wTbGCpiZICleciDE1wXQdATk=;
 b=os2CdWDQukPN3zhU15Hp9HPf36+M2xZZn7RhBHYa2JbB/C+zw7fgaD2Jucr/NRY4Vq
 YibTpwpf3kggrOZuJgbgVKoOJzsBx73Jmd6A9t/Pqe7QzZmpoiJiCmpL0zjfoFxbdx52
 72oafcLFzorNKZlKs7zZgllXIbA7CoBFgqVPCvZAXGLZHJ1rtmCoAaJ2kCJYC3CkZHRN
 VzfDHrrNOf7bMa6Je0aFJcGWQN3rc/VEBWIQwytBSQbpPF2zMcjyBu3hPGTh7N75QAZ1
 /beRUiCB0Bq8UfkS+M6mZBJ/AHN51JELtfBYLeyxXLUcHAExdbrUgEFriVMM4uVNPdre
 oGkw==
X-Gm-Message-State: AOAM5336C75W2QBiFFL6dzSBF3rbPLsjE/oFn8ZV6Hr5YG/WUYuWszte
 YCTQobWExhBY7/7TqsQJtKa2VNFlReZ+3t+EtTgETy3NNMrx9sahWHJALE4EWsripAqQtTvYdq9
 9r9INt7BJW+wvhh8=
X-Received: by 2002:adf:a4d5:: with SMTP id h21mr29679623wrb.203.1634022745365; 
 Tue, 12 Oct 2021 00:12:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT/Qz/B35gJ79MoiF7+XU3zXjENuIa35wukGLhh1H3Cjqp8TKecrH5pM38k4R2YtcdoTv1bg==
X-Received: by 2002:adf:a4d5:: with SMTP id h21mr29679582wrb.203.1634022745123; 
 Tue, 12 Oct 2021 00:12:25 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o19sm10058864wrg.60.2021.10.12.00.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 00:12:24 -0700 (PDT)
Subject: Re: [PATCH v3 13/19] qapi: introduce x-query-skeys QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-14-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e09570bc-cbf6-2f60-481a-94c1ca71c2eb@redhat.com>
Date: Tue, 12 Oct 2021 09:12:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930132349.3601823-14-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2021 15.23, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info skeys" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Including 'common.json' into 'machine-target.json' created a little
> problem because the static marshalling method for HumanReadableText
> is generated unconditionally. It is only used, however, conditionally
> on certain target architectures.
> 
> To deal with this we change the QAPI code generator to simply mark
> all static marshalling functions with G_GNUC_UNSED to hide the
> compiler warning.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
...
> +void hmp_info_skeys(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    g_autoptr(HumanReadableText) info = NULL;
> +    uint64_t addr = qdict_get_int(qdict, "addr");
> +
> +    info = qmp_x_query_skeys(addr, &err);
> +    if (err) {
> +        error_report_err(err);

Shouldn't that rather be:

            monitor_printf(mon, "%s\n", error_get_pretty(err));

or something similar?

>           return;
>       }
>   
> -    monitor_printf(mon, "  key: 0x%X\n", key);
> +    monitor_printf(mon, "%s", info->human_readable_text);
>   }

Apart the question above, patch looks fine to me.

  Thomas


