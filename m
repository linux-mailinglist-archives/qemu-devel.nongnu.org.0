Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9D309D36
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:57:18 +0100 (CET)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6EA9-0005Ru-2K
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6E9A-00050v-H9
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6E96-0007Dr-H6
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612104970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7L9NkIMZDL3h/uAVJHGlR8tESd7UeFncJM+1tYe2aEY=;
 b=MJCcyLD0OUto1rRkon841HTg89YMy7JAq2kL0TZ0rpfn7XouhQSVRByQ/Ht0M+H1xi0aWQ
 oONXbHisPhzJjfFwG5lxst083QQN43WPSvriiPxxG051FEvAZ+5pCr18o1ekjfZmW4WvEk
 FeKlHcINEXYGEbvMG7MX7xs95QrOIOM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-gH2_M_xFMZqwsh-xq5CRXA-1; Sun, 31 Jan 2021 09:56:03 -0500
X-MC-Unique: gH2_M_xFMZqwsh-xq5CRXA-1
Received: by mail-wr1-f69.google.com with SMTP id s15so8791930wrt.14
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 06:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7L9NkIMZDL3h/uAVJHGlR8tESd7UeFncJM+1tYe2aEY=;
 b=spqMOrtHr2i0rTAsY0DBl82Yd19p2alryuQnXGEhYMcgDGZBIkJ5pbffntAXL3KW9H
 4DhLVUWlC5R9ETz1ubaLA2ow+sc+pSydtPq3I/bunT1seFDV5ctHv4HxRTIm/YwOT1lJ
 oKUmXwPRKBMWtUgA50JRRnZRrbYloCLcCyj+RbzQSCtgbyxifi9OFJzih7anxWCxfnKI
 zdFnzVoB4L1eIQlBJEVEPBLTemLsEC9Gifv8hm8MkK8JYLH1TNaf6SP8+fL+ahCRqhDa
 OMcC1Rl6M52ekO8roeSCQkLLii2UMKDczw5eJ/UVew2PAA/pPMeHrLIVF6YlLWPL7NXu
 0iLg==
X-Gm-Message-State: AOAM530PT1wI71ZAC0dIH4jOnwONVDfrV+jEyeu0Za3kkAVQqnYAKNgw
 TNUUXITSBlb1vxjR9ar+CIWCIOiZtsryjC5aNVbxqPvYvza+yF849FHIkr0ucu2fho6urwWHcdl
 y9Pnw3NJF9PrHOBk=
X-Received: by 2002:a1c:541d:: with SMTP id i29mr4962743wmb.19.1612104962451; 
 Sun, 31 Jan 2021 06:56:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLwtBNEhQCd0ZKztqFamADACNRDnI6bzu4vtyYp45pQwI7f09T1m2p4LLZlO7uho7l6R8sAA==
X-Received: by 2002:a1c:541d:: with SMTP id i29mr4962736wmb.19.1612104962286; 
 Sun, 31 Jan 2021 06:56:02 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id e12sm22354837wrs.67.2021.01.31.06.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 06:56:01 -0800 (PST)
Subject: Re: [PATCH] pc-bios/descriptors: fix paths in json files
To: =?UTF-8?Q?Jannik_Gl=c3=bcckert?= <jannik.glueckert@gmail.com>
References: <20210131143434.2513363-1-slyfox@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dbd1e6a4-ccaa-9d30-f537-7572b87e8412@redhat.com>
Date: Sun, 31 Jan 2021 15:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131143434.2513363-1-slyfox@gentoo.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Sergei Trofimovich <slyfox@gentoo.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 3:34 PM, Sergei Trofimovich wrote:
> Before the change /usr/share/qemu/firmware/50-edk2-x86_64-secure.json
> contained the relative path:
>             "filename": "share/qemu/edk2-x86_64-secure-code.fd",
>             "filename": "share/qemu/edk2-i386-vars.fd",
> 
> After then change the paths are absolute:
>             "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",
>             "filename": "/usr/share/qemu/edk2-i386-vars.fd",
> 
> The regression appeared in qemu-5.2.0 (seems to be related
> to meson port).
> 
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
> Bug: https://bugs.gentoo.org/766743
> Bug: https://bugs.launchpad.net/qemu/+bug/1913012
> Patch-by: Jannik Glückert

Thanks Jannik and Sergei to fix this issue, I noticed
the LP#1913012 and planned to look at it tomorrow :)

Jannik, can you send a Signed-off-by line so we can accept
your patch? See:
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> ---
>  pc-bios/descriptors/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
> index ac6ec66b00..29efa16d99 100644
> --- a/pc-bios/descriptors/meson.build
> +++ b/pc-bios/descriptors/meson.build
> @@ -9,7 +9,7 @@ if install_edk2_blobs
>    ]
>      configure_file(input: files(f),
>                     output: f,
> -                   configuration: {'DATADIR': qemu_datadir},
> +                   configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
>                     install: get_option('install_blobs'),
>                     install_dir: qemu_datadir / 'firmware')
>    endforeach
> 


