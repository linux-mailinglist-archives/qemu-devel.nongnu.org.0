Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF42E9828
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:14:25 +0100 (CET)
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwRYt-0005kT-PZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwRWp-0004Bv-NO
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwRWm-0005k8-7F
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609773130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jakqKe5FgH5rgsYPbyWPFEb1YK9GEqQ6HEYYf9tjfeY=;
 b=NeeMVQXfyi+Yx4JnodRrqHolUicsxw7oomuh+jGwxCom6sDjD7H0bagVa/IJBeA36yZpL3
 prLbccTvq22CrlPur1QeeDSKykGjwJQ2XoK3TCFFu9lxG+onN+0L1/9gNloeotjVq/N58O
 b57mArTrAK2Y2cEteriR7zqs7Vgzf4s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-ihz6AmDqO1K7m4LlO95Erw-1; Mon, 04 Jan 2021 10:12:05 -0500
X-MC-Unique: ihz6AmDqO1K7m4LlO95Erw-1
Received: by mail-wr1-f70.google.com with SMTP id n11so13326200wro.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 07:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jakqKe5FgH5rgsYPbyWPFEb1YK9GEqQ6HEYYf9tjfeY=;
 b=YJm1kjUAkpieVTeM41OyJMAzou3fjSP7rRful9aL1rLSnN//qIQ6utPXCyud32jpnM
 mtQCTOTJTXP07pbDxY9sn5CX7A6wDI4BSV89ONs3KRKUgspSbeXkUOmM+2R2IOoOCz26
 G7bJKxGA3/hlbgapAgdyxNC8jDqexp+t7lKE7xFDgO02c2lT3wLnBN9sgamXYJULNKI9
 gJb8BPnLC9+93TMKfXmToBX2uvuwcz/L8TlLdSQBNORmePcI+KRvMLqaBDSaH0QiiQFJ
 lJG3vCMJ/K+lPZ9vqz9zsS3Kx+ScH/01rAq3WceeMoPqU3x81iKXmP8VgUF8j/KSxDYb
 Lb7A==
X-Gm-Message-State: AOAM533Lx9BpLP+DYx67wYvkEHwFDl72iIieKZ3teB6aD9BQzoeY5h+8
 nysZYlwbZUf3GFlnMYVVGEBXzik0dSfHOCan9PzJM5fbmGr40pxolGaKYY7ANRHXjeBsxGfWnDd
 ymWSo+VvG70/y1cY=
X-Received: by 2002:a1c:9684:: with SMTP id y126mr27816706wmd.2.1609773124433; 
 Mon, 04 Jan 2021 07:12:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD2laqLGiAs7o7tVT7JWcFlV7IickjiubasaRFHRGnAK6NFMdfGPO6ayvNYhLladJfFLm5ZA==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr27816678wmd.2.1609773124119; 
 Mon, 04 Jan 2021 07:12:04 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id o8sm89828798wrm.17.2021.01.04.07.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 07:12:03 -0800 (PST)
Subject: Re: [PULL 1/5] trace: Send "-d trace:help" output to stdout
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210104143154.462212-1-stefanha@redhat.com>
 <20210104143154.462212-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ad97bd8-d83d-27dd-0ac5-25766a31df8b@redhat.com>
Date: Mon, 4 Jan 2021 16:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104143154.462212-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 3:31 PM, Stefan Hajnoczi wrote:
> From: Doug Evans <dje@google.com>
> 
> ... for consistency with "-d help".

Doh the request to make sense with this comment
got lost :/
https://www.mail-archive.com/qemu-devel@nongnu.org/msg765789.html

Not a big deal as the patch is trivial.

> 
> Signed-off-by: Doug Evans <dje@google.com>
> Message-id: 20201125215245.3514695-1-dje@google.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  trace/control.h |  3 ++-
>  trace/control.c | 12 ++++++------
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/trace/control.h b/trace/control.h
> index 05b95ea453..9522a7b318 100644
> --- a/trace/control.h
> +++ b/trace/control.h
> @@ -201,10 +201,11 @@ void trace_fini_vcpu(CPUState *vcpu);
>  
>  /**
>   * trace_list_events:
> + * @f: Where to send output.
>   *
>   * List all available events.
>   */
> -void trace_list_events(void);
> +void trace_list_events(FILE *f);
>  
>  /**
>   * trace_enable_events:
> diff --git a/trace/control.c b/trace/control.c
> index b82fb87316..cd04dd4e0c 100644
> --- a/trace/control.c
> +++ b/trace/control.c
> @@ -125,18 +125,18 @@ TraceEvent *trace_event_iter_next(TraceEventIter *iter)
>      return NULL;
>  }
>  
> -void trace_list_events(void)
> +void trace_list_events(FILE *f)
>  {
>      TraceEventIter iter;
>      TraceEvent *ev;
>      trace_event_iter_init(&iter, NULL);
>      while ((ev = trace_event_iter_next(&iter)) != NULL) {
> -        fprintf(stderr, "%s\n", trace_event_get_name(ev));
> +        fprintf(f, "%s\n", trace_event_get_name(ev));
>      }
>  #ifdef CONFIG_TRACE_DTRACE
> -    fprintf(stderr, "This list of names of trace points may be incomplete "
> -                    "when using the DTrace/SystemTap backends.\n"
> -                    "Run 'qemu-trace-stap list %s' to print the full list.\n",
> +    fprintf(f, "This list of names of trace points may be incomplete "
> +               "when using the DTrace/SystemTap backends.\n"
> +               "Run 'qemu-trace-stap list %s' to print the full list.\n",
>              error_get_progname());
>  #endif
>  }
> @@ -176,7 +176,7 @@ static void do_trace_enable_events(const char *line_buf)
>  void trace_enable_events(const char *line_buf)
>  {
>      if (is_help_option(line_buf)) {
> -        trace_list_events();
> +        trace_list_events(stdout);
>          if (monitor_cur() == NULL) {
>              exit(0);
>          }
> 


