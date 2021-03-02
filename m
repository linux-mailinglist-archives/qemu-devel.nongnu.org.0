Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A509F329CA2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:35:12 +0100 (CET)
Received: from localhost ([::1]:36032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3J1-0005PB-OM
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH3Hp-0004yo-Na
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:33:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH3Hn-00020B-FY
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614684834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpVstb5HTO5lpnMiS+PqfjcVaBOptoXJUilf9bqnu68=;
 b=UjKMzYu4CKfEnybG+/hqVNDxB9PGQDdlIWblmh4UB/nZs+1fZJg/D0hiJinbASBU681K8I
 Fmg364qyDsSccmYTMOTwAebA8Nb4zJuoeU8R/vnRBQVyQa/wRQ8glXMG/kpNyPowfh0J0V
 kk4FIuItKcrWE3G8OODDuBWN4GY7TfU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-1hsRJJ4gMReHFnzV61aJeg-1; Tue, 02 Mar 2021 06:33:51 -0500
X-MC-Unique: 1hsRJJ4gMReHFnzV61aJeg-1
Received: by mail-ej1-f70.google.com with SMTP id gb19so8356744ejc.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 03:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FpVstb5HTO5lpnMiS+PqfjcVaBOptoXJUilf9bqnu68=;
 b=cRF0izga3U3iLZhkSbFKu0kBq/z0vyeF17Gs1Zj2HX7R9+wDzB3eMhik0lAjPm7O9D
 egrRMEJ7x05DX+itEa0MvliM5By/LGYm1AgQsAJnvB+JfQW3Uy0FAN36MWxgvv2sastP
 ewjkAFna46b9JnGbb+7lsWPi4i1ZoBhcVmcGjzAXOGHXxKf3cE7w8NOAbrJ1l+/Os3Xl
 8UyTe9uA/dmEyrmWL/nPm+QxqCMfHvhVLaWN1alc5UsuLE3ga2mEP/2SIUpC7dBVxOyA
 Uk2KAtEQOkjDjvgS/6VNGy1sYdEYK2uEC87AHDMObVgGvlv3w+yCbcQ+7yAdGc52Y5ay
 DC1Q==
X-Gm-Message-State: AOAM530/mizuq3pfrTeY036OpQI1/Sm5ngBAHqL39oZGNhaqi2W4VNPy
 JpbFcuETg0sr6Db5vR+yFmDZeaAJLA0dzd+CFLq0gCgTn+YpR/NqBirhJ2+BhKKDPKOPplxtLcP
 3XuDwaFlRuMvXym954B/1sce7n3HJh7rja9uls5ae1OzRoLD4dYLhs1uCRi+fRVm2
X-Received: by 2002:a50:d753:: with SMTP id i19mr19485870edj.43.1614684830424; 
 Tue, 02 Mar 2021 03:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8EaaXHCgDw5mLq//6j2gVMNJTvxMSJrj2SqHaHxAsSZSn35sM63BfHBo+vgymuimjTmmqtA==
X-Received: by 2002:a50:d753:: with SMTP id i19mr19485859edj.43.1614684830227; 
 Tue, 02 Mar 2021 03:33:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k26sm2819008ejk.29.2021.03.02.03.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 03:33:49 -0800 (PST)
Subject: Re: [PATCH] chardev: add nodelay option
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210302110444.39084-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b5c10844-83e7-9fb5-0197-4ba5f7f343cb@redhat.com>
Date: Tue, 2 Mar 2021 12:33:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302110444.39084-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 12:04 PM, Paolo Bonzini wrote:
> The "delay" option was introduced as a way to enable Nagle's algorithm
> with ",nodelay".  Since the short form for boolean options has now been
> deprecated, introduce a more properly named "nodelay" option.  The "delay"
> option remains as an undocumented option.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  chardev/char-socket.c |  9 +++++++--
>  gdbstub.c             |  2 +-
>  qemu-options.hx       | 14 +++++++-------
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 06a37c0cc8..73a7afe5a0 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1472,8 +1472,13 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
>      sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
>      qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
>  
> -    sock->has_nodelay = qemu_opt_get(opts, "delay");
> -    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
> +    sock->has_nodelay =
> +        qemu_opt_get(opts, "delay") ||
> +        qemu_opt_get(opts, "nodelay");
> +    sock->nodelay =
> +        !qemu_opt_get_bool(opts, "delay", true) ||
> +        qemu_opt_get_bool(opts, "nodelay", false);

Should we add a deprecation note to remember to remove this later,
or do we want to keep it infinitely? Then a comment here would be
useful.


