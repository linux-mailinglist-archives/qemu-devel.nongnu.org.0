Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555232DEEAC
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 13:20:31 +0100 (CET)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqbDq-0001uh-4c
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 07:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqbCo-0001UT-MY
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:19:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqbCm-0001Iv-IF
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608380363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCOdhreHe3WXLNwfZSBPjlCcCkg9MSEZKGFODmHH9/g=;
 b=RsM2Tx8YqtJTzLM7kLAUE1bjwc8Be8mqs1rCVDajieyAmF4SUU/us7rZ7l8yxtg/5ntLhu
 BPe3XVC7UB5FIdhJDxEeWAFYP7vxkWarLJoPLAseE0RstbRE4m19auFXn6Rz8NEc/ApIOH
 fWtsytNTDVJGXJI5eyq+2ivPvl0EGlk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-i2pSGrcWPp6OtkXSt96wEg-1; Sat, 19 Dec 2020 07:19:21 -0500
X-MC-Unique: i2pSGrcWPp6OtkXSt96wEg-1
Received: by mail-ej1-f72.google.com with SMTP id h17so1920238ejk.21
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 04:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JCOdhreHe3WXLNwfZSBPjlCcCkg9MSEZKGFODmHH9/g=;
 b=LEPTARqrWS4XJ38qL+kjQkk+0EbVqGRQC9ipQjZfG93amM7STqVznL6SdaFjd43XZq
 y8qBzjf2qNjsJnWs5K1O6vvQs1JIngKYN4bRZ+sQjPZ6Iwb9aerNZPt3lmbNfQUrizzB
 PqMxltjnvpHJgDo8i6Oc4OfvG2O0gWxJSvu1aJSyYJJTz3BQvTb+6fs2fNMbtJJWIzF5
 WRkujI+cW/E8AebR7yvOKUwOlzU7yPyupegvqss0ByELEzOmucsHZKUECtfB2NpO4ugV
 ZggdUKTJPtkQZ3+7fpUIs2gjt+tORBFHCjxL2AqSGdzlHLE4PeJX2vDWvRdYDRM2zj/j
 ffwg==
X-Gm-Message-State: AOAM533/ZEAI2HZ4KNTzkwmWOQrzJcKBr+NZewPgppU/N4aM2m9Z2zkN
 YxuCkA7Fl2OXBsl2eddVD5Z1jCWzkUXmgIS7QXmCMvLvbP7JD4jdJAJqHqSthqJectBKUUg85ZJ
 WJc+061tzOSVRrewEfd1/hJvlaswrLbHYh+c2DVLRrDLLhnMVlJDmCMKL1ekHfpGElMo=
X-Received: by 2002:a50:c315:: with SMTP id a21mr8656430edb.50.1608380359786; 
 Sat, 19 Dec 2020 04:19:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2LVQ4TixnS3cOeyOISiJlkj+Pw95xSXX8TkBfm4fJf/al4BGS+vpG9fyEZUchTrzjGVHndQ==
X-Received: by 2002:a50:c315:: with SMTP id a21mr8656410edb.50.1608380359491; 
 Sat, 19 Dec 2020 04:19:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v9sm6853511ejk.48.2020.12.19.04.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 04:19:18 -0800 (PST)
Subject: Re: [PATCH 2/2] win32: make qemu_fd_register() specific to windows
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201218135712.674094-1-marcandre.lureau@redhat.com>
 <20201218135712.674094-2-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f748066c-e5b9-0c35-070e-fd3d2b0ff671@redhat.com>
Date: Sat, 19 Dec 2020 13:19:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218135712.674094-2-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

On 18/12/20 14:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Move the declaration of the function to a windows-specific header.
> 
> The only user left now is SLIRP, which needs special treatement since
> it doesn't provide event objects itself for the socket/fds.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

This patch is not needed to fix the build, right?  (I don't disagree 
with it, but I wanted to understand why _you_ thought it was an 
improvement).

Paolo

> ---
>   include/qemu/main-loop.h  | 2 --
>   include/sysemu/os-win32.h | 2 ++
>   net/slirp.c               | 2 ++
>   util/main-loop.c          | 4 ----
>   4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index d6892fd208..bf93fd691d 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -310,8 +310,6 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
>   
>   /* internal interfaces */
>   
> -void qemu_fd_register(int fd);
> -
>   QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque);
>   void qemu_bh_schedule_idle(QEMUBH *bh);
>   
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index 5346d51e89..aa462e3ef6 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -117,6 +117,8 @@ static inline void qemu_funlockfile(FILE *f)
>   {
>   }
>   
> +void qemu_fd_register(int fd);
> +
>   /* We wrap all the sockets functions so that we can
>    * set errno based on WSAGetLastError()
>    */
> diff --git a/net/slirp.c b/net/slirp.c
> index 77042e6df7..b54c2882dc 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -196,7 +196,9 @@ static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
>   
>   static void net_slirp_register_poll_fd(int fd, void *opaque)
>   {
> +#ifdef WIN32
>       qemu_fd_register(fd);
> +#endif
>   }
>   
>   static void net_slirp_unregister_poll_fd(int fd, void *opaque)
> diff --git a/util/main-loop.c b/util/main-loop.c
> index 6470f8eae3..744b42fc54 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -179,10 +179,6 @@ static int max_priority;
>   static int glib_pollfds_idx;
>   static int glib_n_poll_fds;
>   
> -void qemu_fd_register(int fd)
> -{
> -}
> -
>   static void glib_pollfds_fill(int64_t *cur_timeout)
>   {
>       GMainContext *context = g_main_context_default();
> 


