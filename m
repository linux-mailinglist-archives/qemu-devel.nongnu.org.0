Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383954430F2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:57:21 +0100 (CET)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvE0-0007s9-Ce
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvAR-0003iL-Fw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:53:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvAO-0002cU-Sp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635864816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41bnu8BPc24PyEyKRPrIkmHcejNzclsXQHazyTXy5GE=;
 b=JhTOOzpUbfGiFZ3Mz0D+kH31hIuacOL0bAhlEjpliNwZOzl7JGV/sSk7cJoiE+F1tU45Tx
 lmVH1hSAVUhkJW7Na8pM70kbziY8I/5IUTVSSl4bvM16WEAlGuk2imn52qh11Rwk0uWhaN
 dRBoQdA0XI1wylFLQSkWNiBnE69pifw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-nkAdVTzLNNWyu9hEvjcxLw-1; Tue, 02 Nov 2021 10:53:32 -0400
X-MC-Unique: nkAdVTzLNNWyu9hEvjcxLw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so1265502wmd.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=41bnu8BPc24PyEyKRPrIkmHcejNzclsXQHazyTXy5GE=;
 b=cRyXt0xOhPyu5s/egZ/4oWNyhnq/hyMCuYz4LNgYK6BeC1+utZcEs8NJdKM94W8WTc
 69Bis649gO3emk/sNMsU3TPYOPDZLZ2FQUvYV7dtRgCr9hll8khs3zVjHc4oWgz/d142
 Q6UrFKkhObhJSSLR42+OaAlN/UNBhdibfziH/xgIJhPEDYN/QHZWl9M/gArOs7ZX3tdD
 Dm54uq2JSFcDmDbAsbateif9Ofrt0aCwY5FLCgR3CRHMKwX/HYMflDTOaVer/JjwOm8o
 FIoaCAObL9eGznYRgz7zRf5WWMGFKeVpPoR6vyL5oDLSzCClxgNUTcvEOUzZLr/tM9t4
 jrZw==
X-Gm-Message-State: AOAM530crU8OUgNodFQInp+nKU1YHo3NadTtEUIfEHI25B8GKiL+EXbW
 WCwtTF1n7v3j4Lp8mIJ5jwrhQ/c30SJ80LbMpyZf26tAM3a5WpiisYuxbQwduF4o/c/F0WHr/vm
 gdBSgfrn5qKv3hrk=
X-Received: by 2002:a1c:f405:: with SMTP id z5mr7611182wma.33.1635864811685;
 Tue, 02 Nov 2021 07:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+GIQJ/S0Bjn6kDycT7l3sQcEnXh2ZyjuFMGW2t4wuRyHrxSyn+rLqAMt41TXEjZvceEmamQ==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr7611136wma.33.1635864811380;
 Tue, 02 Nov 2021 07:53:31 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r8sm3513208wrz.43.2021.11.02.07.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 07:53:31 -0700 (PDT)
Message-ID: <b92cc519-6c48-895e-eacd-c7a012aee180@redhat.com>
Date: Tue, 2 Nov 2021 15:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 17/22] qapi: introduce x-query-cmma QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-18-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-18-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info cmma" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> This command is unable to use the pre-existing HumanReadableText,
> because if 'common.json' is included into 'machine-target.json'
> the static marshalling method for HumanReadableText will be reported
> as unused by the compiler on all architectures except s390x.
> 
> Possible options were
> 
>  1 Support 'if' conditionals on 'include' statements in QAPI
>  2 Add further commands to 'machine-target.json' that use
>    HumanReadableText, such that it has at least one usage
>    on all architecture targets.
>  3 Duplicate HumanReadableText as TargetHumanReadableText
>    adding conditions
> 
> This patch takes option (3) in the belief that we will eventually
> get to a point where option (2) happens, and TargetHumanReadableText
> can be removed again.

Aren't you using (1) here? TargetHumanReadableText was added in v2
but v3 diverged and doesn't add it anymore.

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/s390x/s390-stattrib.c | 56 +++++++++++++++++++++++++++-------------
>  qapi/machine-target.json | 14 ++++++++++
>  2 files changed, 52 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
> index 9eda1c3b2a..d8f5867a5f 100644
> --- a/hw/s390x/s390-stattrib.c
> +++ b/hw/s390x/s390-stattrib.c
> @@ -17,6 +17,8 @@
>  #include "qemu/error-report.h"
>  #include "exec/ram_addr.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-machine-target.h"
> +#include "qapi/type-helpers.h"
>  #include "qapi/qmp/qdict.h"
>  
>  /* 512KiB cover 2GB of guest memory */
> @@ -67,41 +69,59 @@ void hmp_migrationmode(Monitor *mon, const QDict *qdict)
>      }
>  }
>  
> -void hmp_info_cmma(Monitor *mon, const QDict *qdict)
> +HumanReadableText *qmp_x_query_cmma(int64_t addr,
> +                                    bool has_count,
> +                                    int64_t count,
> +                                    Error **errp)
>  {
> +    g_autoptr(GString) buf = g_string_new("");
>      S390StAttribState *sas = s390_get_stattrib_device();
>      S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
> -    uint64_t addr = qdict_get_int(qdict, "addr");
> -    uint64_t buflen = qdict_get_try_int(qdict, "count", 8);
> -    uint8_t *vals;
> +    g_autofree uint8_t *vals = NULL;
>      int cx, len;
>  
> -    vals = g_try_malloc(buflen);
> +    vals = g_try_malloc(count);
>      if (!vals) {
> -        monitor_printf(mon, "Error: %s\n", strerror(errno));
> -        return;
> +        error_setg_errno(errp, errno, "cannot allocate CMMA attribute values");
> +        return NULL;
>      }
>  
> -    len = sac->peek_stattr(sas, addr / TARGET_PAGE_SIZE, buflen, vals);
> +    len = sac->peek_stattr(sas, addr / TARGET_PAGE_SIZE, count, vals);
>      if (len < 0) {
> -        monitor_printf(mon, "Error: %s", strerror(-len));
> -        goto out;
> +        error_setg_errno(errp, -len, "cannot peek at CMMA attribute values");
> +        return NULL;
>      }
>  
> -    monitor_printf(mon, "  CMMA attributes, "
> -                   "pages %" PRIu64 "+%d (0x%" PRIx64 "):\n",
> -                   addr / TARGET_PAGE_SIZE, len, addr & ~TARGET_PAGE_MASK);
> +    g_string_append_printf(buf, "  CMMA attributes, "
> +                           "pages %" PRIu64 "+%d (0x%" PRIx64 "):\n",
> +                           addr / TARGET_PAGE_SIZE, len,
> +                           addr & ~TARGET_PAGE_MASK);
>      for (cx = 0; cx < len; cx++) {
>          if (cx % 8 == 7) {
> -            monitor_printf(mon, "%02x\n", vals[cx]);
> +            g_string_append_printf(buf, "%02x\n", vals[cx]);
>          } else {
> -            monitor_printf(mon, "%02x", vals[cx]);
> +            g_string_append_printf(buf, "%02x", vals[cx]);
>          }
>      }
> -    monitor_printf(mon, "\n");
> +    g_string_append_printf(buf, "\n");
> +
> +    return human_readable_text_from_str(buf);
> +}
> +
> +void hmp_info_cmma(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    g_autoptr(HumanReadableText) info = NULL;
> +    uint64_t addr = qdict_get_int(qdict, "addr");
> +    uint64_t count = qdict_get_try_int(qdict, "count", 8);
> +
> +    info = qmp_x_query_cmma(addr, true, count, &err);
> +    if (err) {
> +        error_report_err(err);
> +        return;
> +    }
>  
> -out:
> -    g_free(vals);
> +    monitor_printf(mon, "%s", info->human_readable_text);
>  }
>  
>  /* Migration support: */
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 7d4e73462f..19e44987af 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -345,6 +345,20 @@
>                     'TARGET_MIPS' ] } }
>  
>  
> +##
> +# @x-query-cmma:
> +#
> +# Query the values of the CMMA storage attributes for a range of pages
> +#
> +# Returns: CMMA storage attribute values
> +#
> +# Since: 6.2
> +##
> +{ 'command': 'x-query-cmma',
> +  'data': { 'addr': 'int', '*count': 'int' },
> +  'returns': 'HumanReadableText',
> +  'if': 'TARGET_S390X' }
> +
>  ##
>  # @x-query-skeys:
>  #
> 


