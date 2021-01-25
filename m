Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD73026BB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:13:35 +0100 (CET)
Received: from localhost ([::1]:54492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43Yc-0002hq-EU
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43V9-0001G8-8S
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43V5-0005gH-7D
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611587394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3vMxHaklXBM7+7OjvTGRx7TR5k9NFU5qQPTw5D7+L0=;
 b=eub/9C6aMWdP9dT1G41Nb1SSrYLWh6tRFAkbo6qk95SX/yOPl0LFyaxwtBQ1iDH31/Ki4n
 D1ivMh7Dw/bhlSmtv0B0t71W12cqF2PjxNl12nvCuWyo2g6ZO/+C7GPteUWBllhfh44B3/
 3ImNbLzwC0GqbcfsGwlFegoBmZ0MavM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-OF3bgfdjPxaxxtilbettrA-1; Mon, 25 Jan 2021 10:09:52 -0500
X-MC-Unique: OF3bgfdjPxaxxtilbettrA-1
Received: by mail-ed1-f71.google.com with SMTP id o19so7583121edq.9
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k3vMxHaklXBM7+7OjvTGRx7TR5k9NFU5qQPTw5D7+L0=;
 b=pOt9ZH7Qd/MqqCWPYYCHYONWiB9TISqdSIpoWhsicqQW53S8CqJGeIKG71utNOaOmI
 TPqKAZUwZWNmVWCbrXNqF+D72cQCZKGRANuXR3+ePzHrCd6TAW+9CMPJnsfhPw+5CcT1
 gTkQSZg40706/Pb2xHTcPawJXQX7bmpzTataA1y2AeV4rOCB5p4qxNQtwAd2GsEGbToc
 0vbE66RN8V7mPWiXVReg+cMT0g5R/RJW7gm6APtcuXMIUySQu0E5NXhjnKCjdx+4Z35B
 uvR2Tq/Vni6J0lwJyHAjHVFYT5jqmcD2Af7Pmu3o1StvzdgQXeq7O3TrnKd8CfYvhVXL
 nq4g==
X-Gm-Message-State: AOAM531Q1hIF8Ws3qsY4qVwZhphcPcxTusLs31rwp/So9VKLStcaJ727
 UNRjL6VGQT0hknIEmAvogO7INj+7+zR8ffMQvvManJWUQGdF3+TH9r+YHApxD5hmKtYV6PcnRZA
 IXtS0RXnlPib4Ut4=
X-Received: by 2002:aa7:de10:: with SMTP id h16mr839043edv.295.1611587391481; 
 Mon, 25 Jan 2021 07:09:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwqlPS/XLy3jR3xffDpsQ1yw8h51DIlw2yMaVfE8H8wxR2K1ictyZ9wdonkGVFIZ+vTArC+w==
X-Received: by 2002:aa7:de10:: with SMTP id h16mr839033edv.295.1611587391381; 
 Mon, 25 Jan 2021 07:09:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s12sm10798463edu.28.2021.01.25.07.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 07:09:50 -0800 (PST)
Subject: Re: [PATCH v2 08/12] meson: Restrict emulation code
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-9-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <188f9142-d90f-ffda-3bff-3dafbb8d886c@redhat.com>
Date: Mon, 25 Jan 2021 16:09:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122204441.2145197-9-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 9:44 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 396ea3aa19b..b5afa2923b3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1809,16 +1809,18 @@
>  qemuutil = declare_dependency(link_with: libqemuutil,
>                                sources: genh + version_res)
>  
> -decodetree = generator(find_program('scripts/decodetree.py'),
> -                       output: 'decode-@BASENAME@.c.inc',
> -                       arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
> +if have_system or have_user

Maybe better as:

   if not get_option('tcg').disabled()

And even clearer as:

   if get_option('tcg').enabled()

assuming enabled would be "auto" or "yes".

> +  decodetree = generator(find_program('scripts/decodetree.py'),
> +                         output: 'decode-@BASENAME@.c.inc',
> +                         arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
> +  subdir('libdecnumber')
> +  subdir('target')
> +endif
>  
>  subdir('audio')
>  subdir('io')
>  subdir('chardev')
>  subdir('fsdev')
> -subdir('libdecnumber')
> -subdir('target')
>  subdir('dump')
>  
>  block_ss.add(files(
> 


