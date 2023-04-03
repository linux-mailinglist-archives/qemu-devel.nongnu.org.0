Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C36D4F9D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjOMC-0008UK-2U; Mon, 03 Apr 2023 13:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pjOM9-0008U6-7B
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pjOM5-0007OT-PI
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680544346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ps/AcJaolfvOZLxpRTtrZpO51rvvSlUFNiaCyvG3AEM=;
 b=PciZGqzlCrv3NVgNOA75bWEiUCUvrbTkMStJie6E5riodvCwbDieegEcVkHhl1Hkc61PKR
 RZQwe08ONr5PMQBYABiRjqgs05str/HiKX4HXkeXV96J48pYEjdzD2fz1YsoG28CavAqTq
 tmQkF5CcwZeyFnU0QyteYOyE3Ma3n2o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-X6vPnQw9N7KA3BHZDWlnrg-1; Mon, 03 Apr 2023 13:52:23 -0400
X-MC-Unique: X6vPnQw9N7KA3BHZDWlnrg-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay37-20020a05600c1e2500b003ee69edec16so16507990wmb.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 10:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680544343; x=1683136343;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ps/AcJaolfvOZLxpRTtrZpO51rvvSlUFNiaCyvG3AEM=;
 b=EFPC3jWhXujV8BU+1d9k397Xiq4FCT/MhVEy5sRpVIzHvIPtpQHt7obo2GRDQYSEtp
 TunUTQyLijN/36C+3E8S8MHW4+zx3vSpmiCY15vvHywPHI13F2oJnHuwXA+F+HloKrj6
 SOVW9y2sj/jzYZ2TeFGyLINwBuXaYinSIrEoMm1MR/mQBpB3KBLUag9uyrLNxSE19Wl5
 aXNKI989H5M91T1Wbsbc7NcJAxquPHuvGRAhrnGIpxFc+sP3tQvOYfFAeMAsgMzpRctp
 Xs9Y660wEpWq2h58gAeipU+AxOcoL3etbbNQLmm3bpbhGkrDfqsSSgaCm5SKkg2ihfmQ
 FJvw==
X-Gm-Message-State: AAQBX9dABK0CiSj3euWOQB+ZwcJg8+1ZEHwZydS3RuiKvxVfM0TG5lYx
 AwXXnXL1PaE5SJBIOcSj6SxNkeCk64/UWot7E+CjsZTcoUH4SfqOQX23Yd6Bg4rqIDxrIANxiO0
 zkKClLCLxlIlbX6s=
X-Received: by 2002:a7b:c5ca:0:b0:3ee:3df6:e411 with SMTP id
 n10-20020a7bc5ca000000b003ee3df6e411mr201691wmk.28.1680544342797; 
 Mon, 03 Apr 2023 10:52:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYNIto4YvhMvz1QWWpF11n0l46gwyfG43ELc8zXZvzBf8B2rFqVntjV4MRZjdW4gGlzAKFbQ==
X-Received: by 2002:a7b:c5ca:0:b0:3ee:3df6:e411 with SMTP id
 n10-20020a7bc5ca000000b003ee3df6e411mr201677wmk.28.1680544342435; 
 Mon, 03 Apr 2023 10:52:22 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c4e9100b003ede3f5c81fsm20607360wmq.41.2023.04.03.10.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 10:52:22 -0700 (PDT)
Date: Mon, 3 Apr 2023 18:52:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 07/10] hmp: Add 'one-insn-per-tb' command equivalent
 to 'singlestep'
Message-ID: <ZCsSUwNHIeCLfbl+@work-vm>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-8-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403144637.2949366-8-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Maydell (peter.maydell@linaro.org) wrote:
> The 'singlestep' HMP command is confusing, because it doesn't
> actually have anything to do with single-stepping the CPU.  What it
> does do is force TCG emulation to put one guest instruction in each
> TB, which can be useful in some situations.
> 
> Create a new HMP command  'one-insn-per-tb', so we can document that
> 'singlestep' is just a deprecated synonym for it, and eventually
> perhaps drop it.
> 
> We aren't obliged to do deprecate-and-drop for HMP commands,
> but it's easy enough to do so, so we do.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/about/deprecated.rst   |  9 +++++++++
>  include/monitor/hmp.h       |  2 +-
>  softmmu/runstate-hmp-cmds.c |  2 +-
>  tests/qtest/test-hmp.c      |  1 +
>  hmp-commands.hx             | 25 +++++++++++++++++++++----
>  5 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 3c62671dac1..6f5e689aa45 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -199,6 +199,15 @@ accepted incorrect commands will return an error. Users should make sure that
>  all arguments passed to ``device_add`` are consistent with the documented
>  property types.
>  
> +Human Monitor Protocol (HMP) commands
> +-------------------------------------
> +
> +``singlestep`` (since 8.1)
> +''''''''''''''''''''''''''
> +
> +The ``singlestep`` command has been replaced by the ``one-insn-per-tb``
> +command, which has the same behaviour but a less misleading name.
> +
>  Host Architectures
>  ------------------
>  
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index fdb69b7f9ca..13f9a2dedb8 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -158,7 +158,7 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Error **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> -void hmp_singlestep(Monitor *mon, const QDict *qdict);
> +void hmp_one_insn_per_tb(Monitor *mon, const QDict *qdict);
>  void hmp_watchdog_action(Monitor *mon, const QDict *qdict);
>  void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
>  void hmp_info_capture(Monitor *mon, const QDict *qdict);
> diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
> index 127521a483a..76d1399ed85 100644
> --- a/softmmu/runstate-hmp-cmds.c
> +++ b/softmmu/runstate-hmp-cmds.c
> @@ -41,7 +41,7 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
>      qapi_free_StatusInfo(info);
>  }
>  
> -void hmp_singlestep(Monitor *mon, const QDict *qdict)
> +void hmp_one_insn_per_tb(Monitor *mon, const QDict *qdict)
>  {
>      const char *option = qdict_get_try_str(qdict, "option");
>      AccelState *accel = current_accel();
> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
> index b4a920df898..cb3530df722 100644
> --- a/tests/qtest/test-hmp.c
> +++ b/tests/qtest/test-hmp.c
> @@ -64,6 +64,7 @@ static const char *hmp_cmds[] = {
>      "screendump /dev/null",
>      "sendkey x",
>      "singlestep on",
> +    "one-insn-per-tb on",

OK, it wouldn't be bad if this list got a bit back into near alphabetic
order.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


>      "wavcapture /dev/null",
>      "stopcapture 0",
>      "sum 0 512",
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index bb85ee1d267..9afbb54a515 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -378,18 +378,35 @@ SRST
>    only *tag* as parameter.
>  ERST
>  
> +    {
> +        .name       = "one-insn-per-tb",
> +        .args_type  = "option:s?",
> +        .params     = "[on|off]",
> +        .help       = "run emulation with one guest instruction per translation block",
> +        .cmd        = hmp_one_insn_per_tb,
> +    },
> +
> +SRST
> +``one-insn-per-tb [off]``
> +  Run the emulation with one guest instruction per translation block.
> +  This slows down emulation a lot, but can be useful in some situations,
> +  such as when trying to analyse the logs produced by the ``-d`` option.
> +  This only has an effect when using TCG, not with KVM or other accelerators.
> +
> +  If called with option off, the emulation returns to normal mode.
> +ERST
> +
>      {
>          .name       = "singlestep",
>          .args_type  = "option:s?",
>          .params     = "[on|off]",
> -        .help       = "run emulation in singlestep mode or switch to normal mode",
> -        .cmd        = hmp_singlestep,
> +        .help       = "deprecated synonym for one-insn-per-tb",
> +        .cmd        = hmp_one_insn_per_tb,
>      },
>  
>  SRST
>  ``singlestep [off]``
> -  Run the emulation in single step mode.
> -  If called with option off, the emulation returns to normal mode.
> +  This is a deprecated synonym for the one-insn-per-tb command.
>  ERST
>  
>      {
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


