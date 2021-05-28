Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E264393D03
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 08:14:41 +0200 (CEST)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmVlY-0000XN-83
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 02:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmVkE-000801-AS
 for qemu-devel@nongnu.org; Fri, 28 May 2021 02:13:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmVkB-0007wB-8n
 for qemu-devel@nongnu.org; Fri, 28 May 2021 02:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622182393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5p1u3DpCF/x7ELzFPAAmYMyEEoAlEX3mhOXSxTPlIOA=;
 b=GI8VSSTfu0m9gP+ca/r6t7B9InMbwmpWGdYZM+X5VsdxbSiRdl6qjZ7rOopz+dIQr4cdCf
 6Out9Mihf4GzPAZPApKIVMTXJqduFywMjtjQnWBoltGaKocHBhvZKpckqsvx93KGBDXtkJ
 f1XpIHe4qcFMT/YkxwJLg1wncEmiI6M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-MzylmNW4Mdmuapn2tmW8KA-1; Fri, 28 May 2021 02:13:09 -0400
X-MC-Unique: MzylmNW4Mdmuapn2tmW8KA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h18-20020a05640250d2b029038cc3938914so1588402edb.17
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 23:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5p1u3DpCF/x7ELzFPAAmYMyEEoAlEX3mhOXSxTPlIOA=;
 b=Jit8e7E46Xk+itzeBHLpV/j8IntIUbi5tIzn1azIMV2q3ju5RMHen/ld13dCp999Ty
 8v5xZnx1/4PeYXZ0a3NWzyzi6uwryn23OCGBXSii50kSROL+czRv+Og95M+yRl0BIGfI
 +l+8A/uhOfX14X/YMI/EptIQyN4jm1B7H+5Yvs897IFTM/WayhdoOjMPnxsMOUfO8JDl
 gLQCTd/+Fe8eLnk2mNB6PNN6CceQh7IOlPLuBnrpaJkSJzvcf5UI11M9SRYa26oU5kgB
 8hX6g0oa/UdA5R+HbXSQ0SBf1MtnJXOsQ2SUAYQXm/mXJpnV332NvvfBkyC57OGeOpT7
 r0Mw==
X-Gm-Message-State: AOAM533tjiO/CcXTpKTinnjUFjMVoN33BbTNKP1MhB+naE92Kuqk0bkK
 KzhVmXctJaGwsYDG31BmIiZ2VCM2zQKc8ywV6z89G1gV+V+9envaJDFRnNcasE/9i74L1Fz/9fM
 G3w8j3FKE9+Imok0=
X-Received: by 2002:a17:906:bb0e:: with SMTP id
 jz14mr7440295ejb.285.1622182388162; 
 Thu, 27 May 2021 23:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysnolX5lhO0+mVmvYuc4frYQighHuwJDNmXIOvGAz/bDRFOZVHIUukxANb99t37MuYVG51vg==
X-Received: by 2002:a17:906:bb0e:: with SMTP id
 jz14mr7440282ejb.285.1622182387985; 
 Thu, 27 May 2021 23:13:07 -0700 (PDT)
Received: from thuth.remote.csb (pd9e830d9.dip0.t-ipconnect.de.
 [217.232.48.217])
 by smtp.gmail.com with ESMTPSA id y10sm1875144ejm.76.2021.05.27.23.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 23:13:07 -0700 (PDT)
Subject: Re: [PATCH] configure: fix detection of gdbus-codegen
To: qemu-stable@nongnu.org
References: <20210505142412.705817-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b2a8699e-b8f3-871d-90ab-6fa8416dc797@redhat.com>
Date: Fri, 28 May 2021 08:13:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505142412.705817-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/2021 16.24, Paolo Bonzini wrote:
> "pkg-config --variable=gdbus_codegen gio-2.0" returns "gdbus-codegen",
> and it does not pass test -x (which does not walk the path).
> 
> Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1
> assignment in tests/qtest/meson.build uses an empty string as the
> command, and fails very eloquently:
> 
> ../tests/qtest/meson.build:92:2: ERROR: No program name specified.
> 
> Use the "has" function instead of test -x, and fix the generation
> of config-host.mak since meson.build expects that GDBUS_CODEGEN
> is absent, rather than empty, if the tool is unavailable.
> 
> Reported-by: Sebastian Mitterle <smitterl@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 54f8475444..5877a6b2bf 100755
> --- a/configure
> +++ b/configure
> @@ -3341,7 +3341,7 @@ if ! test "$gio" = "no"; then
>           gio_cflags=$($pkg_config --cflags gio-2.0)
>           gio_libs=$($pkg_config --libs gio-2.0)
>           gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
> -        if [ ! -x "$gdbus_codegen" ]; then
> +        if ! has "$gdbus_codegen"; then
>               gdbus_codegen=
>           fi
>           # Check that the libraries actually work -- Ubuntu 18.04 ships
> @@ -5704,6 +5704,8 @@ if test "$gio" = "yes" ; then
>       echo "CONFIG_GIO=y" >> $config_host_mak
>       echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
>       echo "GIO_LIBS=$gio_libs" >> $config_host_mak
> +fi
> +if test "$gdbus_codegen" != "" ; then
>       echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
>   fi
>   echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
> 

I think we should include this in the next stable release, too!

  Thomas


