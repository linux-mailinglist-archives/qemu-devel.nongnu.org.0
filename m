Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AE302442
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:29:10 +0100 (CET)
Received: from localhost ([::1]:36300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l403R-00015l-20
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4028-0008So-Hj
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:27:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4025-000874-GY
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611574063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6s9RrdbybPSugOIjr5Gk1nlvD/e6tpDmHUjXTiDnic=;
 b=XtyrGTHmxLLmYJT2l5lpkvZBbEYX50uEt7/mG1eWhPA3HYkAN/JyTBCS5MbQbLGe9UGOSW
 Yv8oayCBybNbJ7NUhWYar/cYROPUKWeGpdyaXY5KRufUty4NVEr2t+YIPdQKEiJ7oqPxGN
 gzKOHOtnQWSA1nS53wkqniaO1J4bSBc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-94cvV7eROgCHMKRlzXmh2A-1; Mon, 25 Jan 2021 06:27:41 -0500
X-MC-Unique: 94cvV7eROgCHMKRlzXmh2A-1
Received: by mail-ed1-f72.google.com with SMTP id x13so7216170edi.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 03:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/6s9RrdbybPSugOIjr5Gk1nlvD/e6tpDmHUjXTiDnic=;
 b=aeghfSHaHRUuAFZq3ORXfMeSQNnA91ZqMJE9BllX0MbFXXPmxikHUDTR8JkpvpesUb
 0SYZt55uvXZFx+p3H+PEDT0THojrGw3D8jofs6cEnuViakxMz6OCtsUmaXc2K5iA8N+/
 xEtyqjUAv4wAqyey3Z+FjTijZF1i8lsXXaNhpHy4ANzQ3pBVkqZfxebNpmbzbm7IZvHE
 3Ewy3dboFViNZuePe487U8LNSEJPeXBdby8Vt4vGSXeaVR+1w6tNN2l+ZJr1KukeacY0
 zXAMdGaB70dVr59TcVlUwlVM37/YRc1Qx0RPtTcc7AZJZt4BbkgrNX5wTCoWA53QDTZZ
 qDCQ==
X-Gm-Message-State: AOAM53077xp+CY4E7KqVZM82fc/uR7kTwXjq4jaqbKCtaItFWCyM6q2l
 sg7ht3VeKDkQVnjRyh8SNAhWYPBHOZouL1U1vC8wjXECj/S58F0iSEmGxrsDLTuXqh/sgQDi7PN
 5oyuAQD9swIiJRhs=
X-Received: by 2002:aa7:d1d4:: with SMTP id g20mr56432edp.244.1611574060587;
 Mon, 25 Jan 2021 03:27:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRjqqI0pKo27dVCon5wEseDYy0v7NFE9AwpeY63ZRLjavwXxdBj0L+t3NYq+gdULQMrsIL5Q==
X-Received: by 2002:aa7:d1d4:: with SMTP id g20mr56419edp.244.1611574060417;
 Mon, 25 Jan 2021 03:27:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i4sm8326714eje.90.2021.01.25.03.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 03:27:39 -0800 (PST)
Subject: Re: [PATCH] trace: add meson custom_target() depend_files for
 tracetool
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210125110958.214017-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7c1bb73f-bbca-aad4-2d06-6768be5c3cb5@redhat.com>
Date: Mon, 25 Jan 2021 12:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125110958.214017-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 12:09, Stefan Hajnoczi wrote:
> Re-generate tracetool output when the tracetool source code changes. Use
> the same approach as qapi_gen_depends and introduce a tracetool_depends
> files list so meson is aware of the dependencies.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   meson.build       | 28 +++++++++++++++++++++++++++-
>   trace/meson.build | 21 ++++++++++++++-------
>   2 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 35a9eddf5c..3909d6b4c1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1626,6 +1626,31 @@ tracetool = [
>     python, files('scripts/tracetool.py'),
>      '--backend=' + config_host['TRACE_BACKENDS']
>   ]
> +tracetool_depends = files(
> +  'scripts/tracetool/backend/log.py',
> +  'scripts/tracetool/backend/__init__.py',
> +  'scripts/tracetool/backend/dtrace.py',
> +  'scripts/tracetool/backend/ftrace.py',
> +  'scripts/tracetool/backend/simple.py',
> +  'scripts/tracetool/backend/syslog.py',
> +  'scripts/tracetool/backend/ust.py',
> +  'scripts/tracetool/format/tcg_h.py',
> +  'scripts/tracetool/format/ust_events_c.py',
> +  'scripts/tracetool/format/ust_events_h.py',
> +  'scripts/tracetool/format/__init__.py',
> +  'scripts/tracetool/format/d.py',
> +  'scripts/tracetool/format/tcg_helper_c.py',
> +  'scripts/tracetool/format/simpletrace_stap.py',
> +  'scripts/tracetool/format/c.py',
> +  'scripts/tracetool/format/h.py',
> +  'scripts/tracetool/format/tcg_helper_h.py',
> +  'scripts/tracetool/format/log_stap.py',
> +  'scripts/tracetool/format/stap.py',
> +  'scripts/tracetool/format/tcg_helper_wrapper_h.py',
> +  'scripts/tracetool/__init__.py',
> +  'scripts/tracetool/transform.py',
> +  'scripts/tracetool/vcpu.py'
> +)
>   
>   qemu_version_cmd = [find_program('scripts/qemu-version.sh'),
>                       meson.current_source_dir(),
> @@ -2192,7 +2217,8 @@ foreach target : target_dirs
>                           '--target-type=' + target_type,
>                           '--probe-prefix=qemu.' + target_type + '.' + target_name,
>                           '@INPUT@', '@OUTPUT@'
> -                      ])
> +                      ],
> +                      depend_files: tracetool_depends)
>         endforeach
>       endif
>     endforeach
> diff --git a/trace/meson.build b/trace/meson.build
> index a0be8f9b0d..08f83a15c3 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -12,17 +12,20 @@ foreach dir : [ '.' ] + trace_events_subdirs
>     trace_h = custom_target(fmt.format('trace', 'h'),
>                             output: fmt.format('trace', 'h'),
>                             input: trace_events_file,
> -                          command: [ tracetool, group, '--format=h', '@INPUT@', '@OUTPUT@' ])
> +                          command: [ tracetool, group, '--format=h', '@INPUT@', '@OUTPUT@' ],
> +                          depend_files: tracetool_depends)
>     genh += trace_h
>     trace_c = custom_target(fmt.format('trace', 'c'),
>                             output: fmt.format('trace', 'c'),
>                             input: trace_events_file,
> -                          command: [ tracetool, group, '--format=c', '@INPUT@', '@OUTPUT@' ])
> +                          command: [ tracetool, group, '--format=c', '@INPUT@', '@OUTPUT@' ],
> +                          depend_files: tracetool_depends)
>     if 'CONFIG_TRACE_UST' in config_host
>       trace_ust_h = custom_target(fmt.format('trace-ust', 'h'),
>                                   output: fmt.format('trace-ust', 'h'),
>                                   input: trace_events_file,
> -                                command: [ tracetool, group, '--format=ust-events-h', '@INPUT@', '@OUTPUT@' ])
> +                                command: [ tracetool, group, '--format=ust-events-h', '@INPUT@', '@OUTPUT@' ],
> +                                depend_files: tracetool_depends)
>       trace_ss.add(trace_ust_h, lttng, urcubp)
>       genh += trace_ust_h
>     endif
> @@ -31,7 +34,8 @@ foreach dir : [ '.' ] + trace_events_subdirs
>       trace_dtrace = custom_target(fmt.format('trace-dtrace', 'dtrace'),
>                                    output: fmt.format('trace-dtrace', 'dtrace'),
>                                    input: trace_events_file,
> -                                 command: [ tracetool, group, '--format=d', '@INPUT@', '@OUTPUT@' ])
> +                                 command: [ tracetool, group, '--format=d', '@INPUT@', '@OUTPUT@' ],
> +                                 depend_files: tracetool_depends)
>       trace_dtrace_h = custom_target(fmt.format('trace-dtrace', 'h'),
>                                      output: fmt.format('trace-dtrace', 'h'),
>                                      input: trace_dtrace,
> @@ -66,7 +70,8 @@ foreach d : [
>     gen = custom_target(d[0],
>                   output: d[0],
>                   input: meson.source_root() / 'trace-events',
> -                command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@', '@OUTPUT@' ])
> +                command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@', '@OUTPUT@' ],
> +                depend_files: tracetool_depends)
>     specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
>   endforeach
>   
> @@ -74,11 +79,13 @@ if 'CONFIG_TRACE_UST' in config_host
>     trace_ust_all_h = custom_target('trace-ust-all.h',
>                                     output: 'trace-ust-all.h',
>                                     input: trace_events_files,
> -                                  command: [ tracetool, '--group=all', '--format=ust-events-h', '@INPUT@', '@OUTPUT@' ])
> +                                  command: [ tracetool, '--group=all', '--format=ust-events-h', '@INPUT@', '@OUTPUT@' ],
> +                                  depend_files: tracetool_depends)
>     trace_ust_all_c = custom_target('trace-ust-all.c',
>                                     output: 'trace-ust-all.c',
>                                     input: trace_events_files,
> -                                  command: [ tracetool, '--group=all', '--format=ust-events-c', '@INPUT@', '@OUTPUT@' ])
> +                                  command: [ tracetool, '--group=all', '--format=ust-events-c', '@INPUT@', '@OUTPUT@' ],
> +                                  depend_files: tracetool_depends)
>     trace_ss.add(trace_ust_all_h, trace_ust_all_c)
>     genh += trace_ust_all_h
>   endif
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


