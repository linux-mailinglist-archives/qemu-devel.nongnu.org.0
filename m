Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3543E6D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:09:44 +0200 (CEST)
Received: from localhost ([::1]:35402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8uN-0001UR-Kp
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8t2-0008Rm-U4
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8t1-0002Ez-1E
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ9QNPyvBeRX490KrH2am/5u1C8VFrfmO9P+CYpHLe8=;
 b=TYG9HT8IO/Asn0MRJpsiS8u3iuvkF3MTeHD5Uc8SzP2w2J4qvcGH6pHD+0c+TD6e7IAZOh
 lwzPnquEoWlDsvy/bumENxNhGOp+Myjpc1dRNgQQa+Yxry83uyxsVhg79f6CKKAjiXiWgf
 k37qAOlAf1gZ1L3SW+nW+G4hdtvNwLk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-oGHzVSTnPa-nRQgRmAyEPw-1; Thu, 28 Oct 2021 13:08:17 -0400
X-MC-Unique: oGHzVSTnPa-nRQgRmAyEPw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso2334106wrj.20
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AJ9QNPyvBeRX490KrH2am/5u1C8VFrfmO9P+CYpHLe8=;
 b=Lt5BVywe+gWyaIFDCEs0MgYrKqBkGo4czjDqkjJ4Re+UF6QWJX7o43+oYv8x3Q29Fk
 7q76NrReF3wChqm81ruC2NgANCkpAfWW7RCy4ObGYloS+fexAnlXjMsPWgdsgCIo7tIA
 YgqQmRlFiGU147mUFVhnXiQ3DV3FTO7cq82pQjd6kJZqyf4SScfkhSDiGtxxyJk9Vrhv
 E5An4S8YN6ycTDAsNc9DCzyhwlJ71i8RL+asHf68gpNeW9W8hQYQQ8hUiNXZwQgrII2+
 tyZyOD5o7O1wbVVLY00DR7Tnk8oU7ihgPfc0vf/ilQqlHJ63icU1hHLcFu5A7U9hwKz3
 qHRg==
X-Gm-Message-State: AOAM531YU1XwwGXpg6/ql3Ie0bTNschE8EEfjQMdE/9f+HqHMB2vFRON
 i5cMSPJhBxMNPfacqI8Se6eg4JBJosFd5pCh1P1aR0vIJSkYgZb7KFxBQdrECkb9CrEDsRTtkIS
 rkpL4ziah5XsXRU0=
X-Received: by 2002:adf:fb44:: with SMTP id c4mr7134355wrs.179.1635440895005; 
 Thu, 28 Oct 2021 10:08:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM491Gy+PGtBmuofAiKASZmxKIqtiI0XuPtM6BIL2RsixLNGV0UTdvuMCWCoz1anz55Rq9iw==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr7134330wrs.179.1635440894854; 
 Thu, 28 Oct 2021 10:08:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z5sm8383706wmp.26.2021.10.28.10.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:08:14 -0700 (PDT)
Message-ID: <b67dc308-acb3-c88d-b3d3-3ce612b27137@redhat.com>
Date: Thu, 28 Oct 2021 19:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 22/22] qapi: introduce x-query-opcount QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-23-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-23-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> This is a counterpart to the HMP "info opcount" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> ad hoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  accel/tcg/cpu-exec.c       | 14 ++++++++++++++
>  accel/tcg/hmp.c            |  7 +------
>  accel/tcg/translate-all.c  |  4 ++--
>  include/exec/cpu-all.h     |  2 +-
>  include/tcg/tcg.h          |  2 +-
>  qapi/machine.json          | 13 +++++++++++++
>  tcg/tcg.c                  | 10 +++++-----
>  tests/qtest/qmp-cmd-test.c |  1 +
>  8 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 4212645cb6..7a7e813207 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -1066,4 +1066,18 @@ HumanReadableText *qmp_x_query_jit(Error **errp)
>      return human_readable_text_from_str(buf);
>  }
>  
> +HumanReadableText *qmp_x_query_opcount(Error **errp)
> +{
> +    g_autoptr(GString) buf = g_string_new("");
> +
> +    if (!tcg_enabled()) {
> +        error_setg(errp, "JIT information is only available with accel=tcg");

s/JIT/Opcode count/ ? Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


> +        return NULL;
> +    }
> +
> +    dump_opcount_info(buf);
> +
> +    return human_readable_text_from_str(buf);
> +}


