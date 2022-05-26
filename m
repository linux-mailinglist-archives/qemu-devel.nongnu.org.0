Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3D534CCD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:56:33 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuAEK-0002qK-NP
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuAAg-0000RM-IF
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuAAa-0006vm-Ti
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653558720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPAAW1IN4CrWpT3K8qIYSvemT2RaYkAeuDU4t0pAb44=;
 b=CT08Hpmt6XMJ2AURDCPhRrq6rtQZzFI5lL7EXitcfrpAf2+USHwFwGKvhB2cKBmo0QoUcJ
 qkIxuWAXFUnO1QonWAp7QvbpDUtdc7TETr7Vstl5lk6FrlQaoKl3e/aRaqv8RvQt+N4xUn
 xNag5LoThluSdZzeW/QmBDUsYP1vOwI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-UeleBYTNMcSH5ZfD0X6FiQ-1; Thu, 26 May 2022 05:48:39 -0400
X-MC-Unique: UeleBYTNMcSH5ZfD0X6FiQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 bk16-20020a170906b0d000b006fe34a2e598so626972ejb.0
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 02:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=fPAAW1IN4CrWpT3K8qIYSvemT2RaYkAeuDU4t0pAb44=;
 b=CuZgrGTdYIPMM9cNwM6dHMVablqiLcUIw2lGTOtzZ9jLaqIMWDUq8LU3rqkQb+RRjy
 ufhh3vVq1QA5h/TegUw/0G/mfv4l0yElH/KPa7G4nT4ldyKwHsqvuQKNq0rqsSGvbCL8
 gxHcsSHXoxgIXy0gigBYQDt8P5CLy8pjgTHzTR9RInLwWqWjDXu+9kbe1R6aA5lU63FS
 fKDKk41ufPGwQQcgZf68EBT4zLB2RvSfxTnQxIOtUxpVknnMfP5qytwViq6stW547njp
 KiUucNxYNJhLa15KdO72Qp9flp87zVFZ4IzzQX6DbnhDxLdh0fQLhaY0GtFB0m8RF6V/
 pQiQ==
X-Gm-Message-State: AOAM532bTaecULqxb7S4V6+wlK6BJBUAP9t3hi/S+ZFof2mpVLYxWcVt
 habI36xQZ8InL39hHkKF3/MkyUrdEaMKuYhjmnbSVWUpc9VT+Q7A/pZUh61zXkG9PHViO9W+ULz
 Z5KMPJIWo1pi5rDI=
X-Received: by 2002:a05:6402:5415:b0:42b:228:5cf with SMTP id
 ev21-20020a056402541500b0042b022805cfmr35762195edb.245.1653558518055; 
 Thu, 26 May 2022 02:48:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm4dbXgjzeLUi0ORzU3M6P/Ww/6W1gkHVIvXkDj5XLkqFYKEM4VuAcoi43FRYclcXzYYIhGw==
X-Received: by 2002:a05:6402:5415:b0:42b:228:5cf with SMTP id
 ev21-20020a056402541500b0042b022805cfmr35762179edb.245.1653558517860; 
 Thu, 26 May 2022 02:48:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 mc22-20020a170906eb5600b006feb002a620sm370196ejb.1.2022.05.26.02.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 02:48:37 -0700 (PDT)
Message-ID: <dbdcc2c0-3a8c-24b9-6a4e-f056f212511f@redhat.com>
Date: Thu, 26 May 2022 11:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/16] Cross compilation of embedded firmware
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <87zgj753kc.fsf@linaro.org> <94613517-ac1a-2107-d001-5ee489760cfc@redhat.com>
In-Reply-To: <94613517-ac1a-2107-d001-5ee489760cfc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/25/22 15:16, Paolo Bonzini wrote:
> On 5/24/22 17:53, Alex Bennée wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>> I actually expect the compiler tests to move back to tests/tcg, running
>>> at Make time after the docker images are built.  For now, the file is
>>> moved as a whole, including both compiler detection and the tests.
>>
>> Isn't that just creating a bunch of unnecessary churn? The
>> tests/tcg/configure.sh sciprt already has a bunch of special casing in
>> it to detect various compiler features for the purposes of tests. It
>> would be nice if we could keep it's history of warts intact.

For clarity the code that we're talking about is just this:

+      case $target in
+          aarch64-*)
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.1-a+sve -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.1-a+sve2 -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.3-a -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -mbranch-protection=standard -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.5-a+memtag -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+              fi
+              ;;
+          ppc*)
+              if do_compiler "$target_cc" $target_cflags \
+                             -mpower8-vector -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -mpower10 -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+              fi
+              ;;
+          i386-linux-user)
+              if do_compiler "$target_cc" $target_cflags \
+                             -Werror -fno-pie -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+              fi
+              ;;
+      esac

The other ~300 lines of configure.sh belong in the main configure script and
remain there.  So the churn is limited to the above.

Paolo


