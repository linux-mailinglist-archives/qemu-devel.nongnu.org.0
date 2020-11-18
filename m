Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94432B79FA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:08:22 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJRt-0001gD-Pc
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfJIV-0005TA-GT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:58:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfJIR-00009L-Dp
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7oN7LbwdM/uhYt3rujK0wA9Ao4+i/bhGaHlOm93L83o=;
 b=SGftXeT5xA2y9ms3AG/if+oXCtoRve00zueSHTa9nfbtF6gf7E3XFP9NFLE6haJIb3ExGk
 KuEHALiFDGXqBMwOY01oRB/qI0uAiBWyJp9yFDxfWBN2eqTu1T63htTMpCPhaa9fvdaXC6
 2axrvkFDo20De76NicdKyThFVP72Pcw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-UdXMdRYoOlmA06WUgAawUw-1; Wed, 18 Nov 2020 03:58:32 -0500
X-MC-Unique: UdXMdRYoOlmA06WUgAawUw-1
Received: by mail-ej1-f69.google.com with SMTP id 27so582963ejy.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7oN7LbwdM/uhYt3rujK0wA9Ao4+i/bhGaHlOm93L83o=;
 b=DoKfDPOCilB7bxp5La6ItQXIXsySb9La+2k73fyza2vRUsz6TYY6EWb8WxZyvUnl+g
 9ipqMG5ccYZn+lwkcTuwyaNDNUkh94zwgsd7jO5Bo0fiGBphjYmxwYV0l02wtpo2G4XN
 g9x2ZNoJlgpqypISHVr8UB9pvB3wFcJqbx67uJnGCzpu1vNLRX45KAjjA2RExvMSi8jH
 yqKSx5WlwGwryYg4WqStu7Fo4pjj4EFEOJPgfBCGjFKzuPGZ4GM2uw5+iQ2q+l7SreUu
 dR8w+FDFNrG/CqcT3gcx5uny3A70hogyNvC3UvcdOZbQtA6AtFbHdV77xtMHZ/DiuJk9
 ouIg==
X-Gm-Message-State: AOAM532TfEeJpaf5AaVNX9s8tVqec1Im5OYQEsopRq2CW5HvJR8V8zJN
 W44eVXhwg5S371Ct4lTf3O/YQR7IC3RHQwtsKp9VW17jIFeUDMRXBzfSl1HxlCiqcJ67iRpoOsK
 zf5ucz44CEb/ZNCs=
X-Received: by 2002:a05:6402:1114:: with SMTP id
 u20mr23687727edv.377.1605689910992; 
 Wed, 18 Nov 2020 00:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf6ziP/HtqHyePogCrQp6xds4nQCPnaa03rml8jVlYp7UC7DIam+1zJQ2mZ/aOfFFSa7TkYg==
X-Received: by 2002:a05:6402:1114:: with SMTP id
 u20mr23687716edv.377.1605689910813; 
 Wed, 18 Nov 2020 00:58:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id op24sm12761053ejb.56.2020.11.18.00.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 00:58:30 -0800 (PST)
Subject: Re: [PATCH for-5.2] meson: Fix argument for makensis (build
 regression)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201117190640.390359-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bfeafdf4-afed-41fd-bac3-15faad3ce00e@redhat.com>
Date: Wed, 18 Nov 2020 09:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117190640.390359-1-sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/20 20:06, Stefan Weil wrote:
> `make installer` with a DLL directory was broken.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   scripts/nsis.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index e1c409344e..5135a05831 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -65,7 +65,7 @@ def main():
>               dlldir = "w64"
>               makensis += ["-DW64"]
>           if os.path.exists(os.path.join(args.srcdir, "dll")):
> -            makensis += "-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)
> +            makensis += ["-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)]
>   
>           makensis += ["-DOUTFILE=" + args.outfile] + args.nsisargs
>           subprocess.run(makensis)
> 

Queued, thanks.

Paolo


