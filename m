Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD3327D7B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:46:52 +0100 (CET)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh0l-0000Bu-A2
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGgtj-0006IB-3k
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:39:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGgte-0006kw-Ie
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614598768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XC8Nvm8/K3HDuo+8nxAllfCAy5bWbYsY/EI9hzAFoPA=;
 b=gDnw8LYsFxNv3zq7PMHSA3daxMrTPGRjEWw+WSs6m6Co0xAHKwpabBfJL9zBQzGT1cc+yb
 S1YcCN4gFEodwNZ9SwXdSPpsu+PHKx2pKcXhtUF2UqgvKBEsr/A6WrM4LnQldpimlDWtxy
 pWOHchfAN+iFyZo+1S9vPeS7Fgi9w3g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-biTto8GzNseAGasnBwZSJg-1; Mon, 01 Mar 2021 06:39:25 -0500
X-MC-Unique: biTto8GzNseAGasnBwZSJg-1
Received: by mail-wr1-f69.google.com with SMTP id b15so7554012wrm.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XC8Nvm8/K3HDuo+8nxAllfCAy5bWbYsY/EI9hzAFoPA=;
 b=VtYC451LOvVmHGeAT7AltCypMEO8CutFSRTvSlFrvX04ZxSGaAx5JnzsxA80Ep8x8X
 aT7xSOstVbB6imT6NsrYtO/iNxm49bfnVXCG7nRkD+uOBLZbpiVljp/SYPNbfQlEAz7s
 med5t/m46OOwYDNmIZnwy/Tf4XeFaMFs7fHU2X8xWWjGfCNCAzW7zVnXR9A0zNv/0J1d
 fMxs64IJHjAieA1HW7btusvDELSPYOIihgHNA8BA7Qzl/c43HQnh0KVFB7EVofYYTAVC
 vcDZXiF70OVx4Et31R8d0IvybjodkXD17dIHeUvIESPUzanZK33t0L+gvEdScg1lm9HM
 +4SQ==
X-Gm-Message-State: AOAM530amD/e1ar8PhjtEDK0gAV45szH/iWfRb2IPf/rIwJ3fVv/wpIJ
 w6ibLTFMKeqcJWtOfOtEr8JHXFcpj0eb/vov3yYVuzhZNQVi3nqNYZxlRZXtvkhazK8LcCgA2W8
 02WMNxtTBON2Ylbk=
X-Received: by 2002:a1c:7214:: with SMTP id n20mr15580682wmc.78.1614598764382; 
 Mon, 01 Mar 2021 03:39:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTv6urN9qfzLB2JXRBOJBPUC+efG2urPB6a5fKONohp1pR50JR2oEcCw78WW2+iu2hEac8lA==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr15580667wmc.78.1614598764243; 
 Mon, 01 Mar 2021 03:39:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c128sm7150309wme.3.2021.03.01.03.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 03:39:23 -0800 (PST)
Subject: Re: [PATCH 1/1] qga-vss: Use dynamic linking for GLib
To: Kostiantyn Kostiuk <konstantin@daynix.com>,
 Developers <qemu-devel@nongnu.org>
References: <20210209145423.178611-1-konstantin@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4ecbde1e-fd10-28a5-10b7-33dda8c7f9a1@redhat.com>
Date: Mon, 1 Mar 2021 12:39:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209145423.178611-1-konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Paolo/Marc-André/Daniel

On 2/9/21 3:54 PM, Kostiantyn Kostiuk wrote:
> The current GLib version implements the DllMain function. DllMain is also
> present in the provider.cpp code. So in the case of static linking, the
> DllMain redefinition error occurs. For now, just switch to dynamic linking
> and revert this patch when the issue will be solved.
> 
> See Glib issue for more details https://gitlab.gnome.org/GNOME/glib/-/issues/692
> 
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> ---
>  qga/vss-win32/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 780c461432..90825edef3 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -1,5 +1,5 @@
>  if add_languages('cpp', required: false)
> -  glib_static = dependency('glib-2.0', static: true)
> +  glib_dynamic = dependency('glib-2.0', static: false)
>    link_args = cc.get_supported_link_arguments(['-fstack-protector-all', '-fstack-protector-strong',
>                                                 '-Wl,--add-stdcall-alias', '-Wl,--enable-stdcall-fixup'])
>  
> @@ -8,7 +8,7 @@ if add_languages('cpp', required: false)
>                  cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
>                  link_args: link_args,
>                  vs_module_defs: 'qga-vss.def',
> -                dependencies: [glib_static, socket,
> +                dependencies: [glib_dynamic, socket,
>                                 cc.find_library('ole32'),
>                                 cc.find_library('oleaut32'),
>                                 cc.find_library('shlwapi'),
> 


