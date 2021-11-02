Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB6443183
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:24:04 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvdr-0008MS-RH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvJN-0008LG-5o
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvJI-0005QW-CR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635865367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAYFQXBUHH3i5bPUlV2nWOouNyhkJb/+1IeVjGqxnAk=;
 b=ZlE+ehTp7QdDeMLwDDy4oM+b8p/qU6o3MR98SuEgW8BqKJlEwosOjP3r1z02kdbI5gtBSi
 wnDmy4qytog8S0ffDDTI1o/ZZSseB2EwLLIpy9fNOs+4J8/cTl0Om4jBcQhbiSEm5LqNBw
 UgEA/Szi2nLKUOXPfWG+ToR4lNUzhSE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-A0y-LmOvM32XftHuBgkUkA-1; Tue, 02 Nov 2021 11:02:46 -0400
X-MC-Unique: A0y-LmOvM32XftHuBgkUkA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so5566907wrw.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JAYFQXBUHH3i5bPUlV2nWOouNyhkJb/+1IeVjGqxnAk=;
 b=0CZMrslRHGOfhsxm4bmLWR8p6eLJLgS2eq/qMkHJe4OoqOm12rq1zqdKgZCGH1NRJJ
 GaADh4h2lhAdxtdGkFjYQZAJGQfSHSNKPFHpNpX3yMZViJ6I5EtV7IrE4qtHxwqkX4Hv
 z22ozGIBisvCQg4/jNtf1EXWz3uxO0+on4fEVhTKMXPOZKkmY+u49CGyW0SnJ59N5uUR
 qErxUsJr0kv2qf+Xnm/dn9ZST6linX6t7kJSbULeXc8OywE2nrUOrfoaa8KJygd5Bqbq
 Jm/65Xjf9bvlEHqQDlr1mY7rUZAN8iYLimbpDBy8tU73xS6hdVQF2B31O2mS1ifQl0or
 7MOg==
X-Gm-Message-State: AOAM533oocdz60eV8kcQEj0KNnq+2SDWH5shvrpBSz30RhDm8+yMlamz
 EbqTDd+WWGwxE/mecgbDgWU18dgYoNeZ0zUpZ20YiMgGag6t3J7UYOeaLIpeud+Aif6yyMpMoEG
 hjy/10jKwXBHmTSI=
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr13532635wri.195.1635865365003; 
 Tue, 02 Nov 2021 08:02:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvITHYZaA8Tjcl6FdItRCxmbXuwoSVPRuT7ESZ/kE5CWVdbjKqEhYI90A8eGcjmvofizez3Q==
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr13532582wri.195.1635865364773; 
 Tue, 02 Nov 2021 08:02:44 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n68sm2704884wmn.13.2021.11.02.08.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:02:44 -0700 (PDT)
Message-ID: <6dfe8af9-0b26-6057-9b67-ee7c05e4dfdf@redhat.com>
Date: Tue, 2 Nov 2021 16:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 16/22] qapi: introduce x-query-skeys QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-17-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-17-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
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
>  hw/s390x/s390-skeys.c    | 35 +++++++++++++++++++++++++++--------
>  qapi/machine-target.json | 17 +++++++++++++++++
>  scripts/qapi/commands.py |  1 +
>  3 files changed, 45 insertions(+), 8 deletions(-)

> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 3654825968..01d8d1ea2c 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -91,6 +91,7 @@ def gen_call(name: str,
>  def gen_marshal_output(ret_type: QAPISchemaType) -> str:
>      return mcgen('''
>  
> +G_GNUC_UNUSED
>  static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
>                                  QObject **ret_out, Error **errp)
>  {
> 

I think 1/ this change should be in a separate patch,
but 2/ Markus is not going to accept it:
https://lore.kernel.org/qemu-devel/87r1haasht.fsf@dusky.pond.sub.org/

I'll see if we can get ride of it with Kconfig rules.

Meanwhile, could we get the series merged without it?


