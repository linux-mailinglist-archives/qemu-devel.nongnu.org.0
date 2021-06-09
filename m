Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45273A155C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:19:56 +0200 (CEST)
Received: from localhost ([::1]:46310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqy7f-0007uN-Pl
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqy6r-0006yJ-FU
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqy6p-00067G-47
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623244742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82RM1eJ/Zhp3ZYsHScmS4HA3R+qHCIm7QdM4fT1cAEs=;
 b=MVgpAeZgqzyg7JGktK0IAxUuNYKYTGhf+D+QNjgMmMjSVmLzZCWxyZbCGcDaCi4O7IQe0o
 emOYlGAaRRDNRGfhoyreiKyQmXwXGX1YvLjvjra0nzHWPLZByLoPy8isCdQnlVOIoWOMKl
 jsKcQdLt6jNoqgVMQ86WfZuQ+aLc604=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-gPiCxrkZODOaVmYI4VwSWQ-1; Wed, 09 Jun 2021 09:19:01 -0400
X-MC-Unique: gPiCxrkZODOaVmYI4VwSWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so10784813wrc.16
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 06:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=82RM1eJ/Zhp3ZYsHScmS4HA3R+qHCIm7QdM4fT1cAEs=;
 b=pZy/BnTYlt3CVtNNPjnONNOORBiex2mCocz9B8gbi377lzjBkvJLxQAZlXBPlLYjZS
 izUHECSZ9nMeoTMy4fLAWHcsjvH++NTwmervbDzectBIyKWwpmZhYYw1xoEnUuA9Mu2a
 uwLcJej7RGY3WZ41vryuwAUxZ86EvVNPtp532gUVaj7sY0H1D+iUsMAACInz11BOmztD
 jKHDr76kvBqbmx2fBWOzvGywHYt2Gx8jhEYrR/XvVtj8nkkdSDHgYj4BOKIC6BYhOS/9
 RN2Hx7nKRPTwwY9+cSVLomWphKgq6/4ybBRW0lcVYAHGmICsqHk/rbaMyf5rVyilyWQQ
 6j6Q==
X-Gm-Message-State: AOAM533eJuv0NmP82j6fEt7rnNj1v7htk7oxdPLamYVVO1zdnpGe07sA
 qr+zU1gNjZaMv7D+8OR0QHUk9jF3nmlSBKwW/IqZunyiL57eG8ngvVp01MdZhRbYcrDcDwuYFVF
 PYgOdfdPh2ql9B7g=
X-Received: by 2002:a5d:4752:: with SMTP id o18mr14207075wrs.323.1623244739197; 
 Wed, 09 Jun 2021 06:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdwrDoJ9QzV2TVA24vY3fIBRgxUCa23xnnueJqJhUOe8jksaaz+umwuV1iaHc6NuSeTob4lg==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr14207053wrs.323.1623244738991; 
 Wed, 09 Jun 2021 06:18:58 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id k42sm7561922wms.0.2021.06.09.06.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:18:58 -0700 (PDT)
Subject: Re: [PATCH] qemu-config: use qemu_opts_from_qdict
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210609123931.553449-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c17cfa23-5ccc-3326-3b4a-e46f9e311ff5@redhat.com>
Date: Wed, 9 Jun 2021 15:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609123931.553449-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 2:39 PM, Paolo Bonzini wrote:
> Using qemu_opts_absorb_qdict, and then checking for any leftover options,
> is redundant because there is already a function that does the same,
> qemu_opts_from_qdict.  qemu_opts_from_qdict consumes the whole dictionary
> and therefore can just return an error message if an option fails to validate.
> 
> This also fixes a bug, because the "id" entry was retrieved in
> qemu_config_do_parse and then left there by qemu_opts_absorb_qdict.
> As a result, it was reported as an unrecognized option.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Fixes: 3770141139 ("qemu-config: parse configuration files to a QDict")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-config.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 374f3bc460..84ee6dc4ea 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -429,29 +429,14 @@ out:
>  void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
>  {
>      QemuOptsList **lists = opaque;
> -    const char *id = qdict_get_try_str(qdict, "id");
>      QemuOptsList *list;
> -    QemuOpts *opts;
> -    const QDictEntry *unrecognized;
>  
>      list = find_list(lists, group, errp);
>      if (!list) {
>          return;
>      }
>  

Matter of taste I'd have inverted the if statement, but
it fixes my problem, so thanks!
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


> +    qemu_opts_from_qdict(list, qdict, errp);
>  }
>  
>  int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
> 


