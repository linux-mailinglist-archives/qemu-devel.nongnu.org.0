Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E56C815E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:36:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pffIp-0004x4-V9; Fri, 24 Mar 2023 07:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pffIn-0004wq-Nr
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pffEg-0002yM-PN
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679655921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePXbZ9nyznZtbXjZDtvDDmgfuQGIrxaAOlZXRL7FYN4=;
 b=PJNoSUP3hF9s9jAuU34p3aaZnd93wcomanU0WVVJ0iJQWF9p9c32xQNZgYZzbaRzVRrlBv
 CgM5aG28t+A6I/0EpfTOTdoDg7OxggezBDj9AtdGYjSbMG+rWs15GqJwr8j1scdaeRU+RC
 yWNV+coW2p5m4j9WNMtcPDCJ07fk050=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-hfpM2k7gMYu8Cp73sf7HVA-1; Fri, 24 Mar 2023 06:59:13 -0400
X-MC-Unique: hfpM2k7gMYu8Cp73sf7HVA-1
Received: by mail-qv1-f69.google.com with SMTP id
 l17-20020a0cc211000000b005dc6b9651ccso825989qvh.9
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 03:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679655551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ePXbZ9nyznZtbXjZDtvDDmgfuQGIrxaAOlZXRL7FYN4=;
 b=6J1LRJQKP4FM0y0fiYt5DLtZZUiA/c4yucJRIy8OG5m7QzNNdUz0GU58vCwoGVw0hJ
 eIJAsEy+3YM6rVJtC+AMhJbXHhGT4U97rZvKhZbpom3aC4hRfb7sYd4/lyb8JvnKOabE
 FbEWLZqcDmyG1y70Y+odUHkeC27NC6VgBnvnyjCOe+IvkJjIadLq5XJ2LJjr+dw9bL1o
 FqUy2TmZUcsINt7u0MNRjWeg5KmJmRacbMucuFpCblp/bYRSjKdX3nLD/weKdVMTXg1d
 xLXpfWyczL1W4e8FkfRDoJMND5KDL9FcOsOuJ3xCOUe9yR6aRp+YBO85X3vL4pKnewkM
 7PsA==
X-Gm-Message-State: AO0yUKVtkePfI3WiSjcPu1DxiWxim1FkZwuzjrMvmEdGjJssPpuHte0s
 vHOQsK2hQ+/mvWAZh0u2OH7+Xt8/0LhUwDfquAUzoCOTvwFLDWDQ88C7Cb1lPlQCEe1V7GFwh0r
 jwJqWNqjAcruYUJg=
X-Received: by 2002:a05:622a:493:b0:3e3:9274:7b67 with SMTP id
 p19-20020a05622a049300b003e392747b67mr4361355qtx.54.1679655551327; 
 Fri, 24 Mar 2023 03:59:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set+BM9kiZrleKTRK8fPRnmHbBta4PASpS4u/Dbc8S0oSBoCgISPx6nUxqbokdNMAtqK0tnsUIA==
X-Received: by 2002:a05:622a:493:b0:3e3:9274:7b67 with SMTP id
 p19-20020a05622a049300b003e392747b67mr4361058qtx.54.1679655546190; 
 Fri, 24 Mar 2023 03:59:06 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-101.web.vodafone.de.
 [109.43.179.101]) by smtp.gmail.com with ESMTPSA id
 t23-20020ac865d7000000b003b635a5d56csm12729331qto.30.2023.03.24.03.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 03:59:05 -0700 (PDT)
Message-ID: <4d6b9853-e46e-8ddc-8c89-d2e72f6cff82@redhat.com>
Date: Fri, 24 Mar 2023 11:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ui/spice: fix compilation on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: berrange@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
References: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/03/2023 08.52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> qemu_close_to_socket() renaming left-over.
> 
> Fixes:
> https://gitlab.com/qemu-project/qemu/-/issues/1553
> 
> Fixes: commit e40283d9a ("ui/spice: fix SOCKET handling regression")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/spice-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 67cfd3ca9c..52a59386d7 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -149,7 +149,7 @@ static void watch_remove(SpiceWatch *watch)
>       qemu_set_fd_handler(watch->fd, NULL, NULL, NULL);
>   #ifdef WIN32
>       /* SOCKET is owned by spice */
> -    qemu_close_to_socket(watch->fd);
> +    qemu_close_socket_osfhandle(watch->fd);
>   #endif
>       g_free(watch);
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>

I can queue this for my next pull request together with Philippe's Msys2 CI 
patches (unless you plan a pull request for this already anyway).

  Thomas


