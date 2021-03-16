Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58733E0CB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:48:52 +0100 (CET)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHYZ-0007Gn-T1
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMHON-0005df-QB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:38:19 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMHOL-0005I7-RR
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:38:19 -0400
Received: by mail-ej1-x629.google.com with SMTP id r17so74601729ejy.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eVm9bu3OXx1vl3s2qCziympSex70U6GSa6LOCtAKJ+g=;
 b=plRcLS8qMPo2bZWl6ECKNEgUX2QKFWgdchnsvLMt5+2NSqV9rMFjW1c1TubvAAdK4j
 TmEa0pPSveHSa3skCBXkMDuWzru5dQnoo2WvnoWyjdWYghdj7B+4l5ZU7AhaTRo8VdwF
 cIOYuile4sGEF0ubdV4uyMV+DFnjRwj9ulKputwtvz78M01Erj+UtN9LKCxWkw9w6Oxv
 g4qDnonzEZZiLvYzucoDhpAjQQo0xKjcv+UaBLDMbZ91YuCacy7+8lxJV20W4Jw6nlYt
 tSch4lBX9HsNNWmmqgnhJzr+Z92ZC8A2oFm1Ojgm0JjFNUNRY203OZBt1NKfQurAG0Os
 ZO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVm9bu3OXx1vl3s2qCziympSex70U6GSa6LOCtAKJ+g=;
 b=O6YorD5ti3UkNXHQZvPvidIPX0i8g0oz+cQHs1PJ9eME5VhhyRAJTJElP9iiGHKUvP
 K6U0SmkNHJ/E1TX4IaIC1f8tFHBHNEKaZw9blO/Zai28xIY35yI1Dhsiza6H0kbXXwkh
 5Ydbtf4Z1pFLiHuFmB7gPkegzPxtCQdYmqmtPAZGuQ18bxsiK4Reem1VZTyUG4O8N8OW
 LZrCOkNF7qGvvXCMPMMCtm5c6cHI/1fapG00fvB9Xp4xi2neUoyy5bRdDMJ3eiCWT0nA
 N077lTEF59HQHxhysrXmpPDYNfI8aTeeWSlrm60orpxDG8eA/7Y6LTGBeiHp8ERKZh77
 xA5A==
X-Gm-Message-State: AOAM531Ud+mfo0kf1Yyi8lR5mUL6Eq97EHY/jCb85kodjyz/Va3DOI3q
 UrsIb42yKtX/Aysf3jDHwOGyqMVexYpJU9h2k3sx4g==
X-Google-Smtp-Source: ABdhPJzcX8N9sRISiQafAxcw9hVu5GJ1nbFYWg75t6FgWO10/UKTVaMFZ4MWZsU29500jv6ugsyhhCFix3sHtDUNSqg=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr31331778ejz.382.1615930695779; 
 Tue, 16 Mar 2021 14:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
 <1615799673-31549-17-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-17-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 21:37:53 +0000
Message-ID: <CAFEAcA-7MiRBVvGhaA7XbzMoCHBBie6-w7miyg-kAzZ0F=-XPg@mail.gmail.com>
Subject: Re: [PULL V2 16/20] qapi: net: Add query-netdev command
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alexey Kirillov <lekiravi@yandex-team.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 09:15, Jason Wang <jasowang@redhat.com> wrote:
>
> From: Alexey Kirillov <lekiravi@yandex-team.ru>
>
> The query-netdev command is used to get the configuration of the current
> network device backends (netdevs).
> This is the QMP analog of the HMP command "info network" but only for
> netdevs (i.e. excluding NIC and hubports).
>
> The query-netdev command returns an array of objects of the NetdevInfo
> type, which are an extension of Netdev type. It means that response can
> be used for netdev-add after small modification. This can be useful for
> recreate the same netdev configuration.
>
> Information about the network device is filled in when it is created or
> modified and is available through the NetClientState->stored_config.
>
> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---

Hi; Coverity complains about a memory leak in this code
(CID 1450842):

> @@ -581,15 +693,25 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>      s->poll_notifier.notify = net_slirp_poll_notify;
>      main_loop_poll_add_notifier(&s->poll_notifier);
>
> +    stored_hostfwd = &stored->hostfwd;
> +    stored_guestfwd = &stored->guestfwd;
> +
>      for (config = slirp_configs; config; config = config->next) {
> +        String *element = g_new0(String, 1);

Here we allocate memory...

> +
> +        element->str = g_strdup(config->str);
>          if (config->flags & SLIRP_CFG_HOSTFWD) {
>              if (slirp_hostfwd(s, config->str, errp) < 0) {
>                  goto error;

...but if we take this error-exit path we have neither freed nor
kept a pointer to that memory.

>              }
> +            stored->has_hostfwd = true;
> +            QAPI_LIST_APPEND(stored_hostfwd, element);
>          } else {
>              if (slirp_guestfwd(s, config->str, errp) < 0) {
>                  goto error;

Similarly here.

>              }
> +            stored->has_guestfwd = true;
> +            QAPI_LIST_APPEND(stored_guestfwd, element);
>          }
>      }
>  #ifndef _WIN32

More generally, what state is the net backend init function
supposed to leave 'stored' in if it fails? Is it the backend's
responsibility to free everything that it might have allocated
and left a pointer to? eg if we did
   stored->hostname = g_strdup(vhostname);
do we need to go back and free(stored->hostname) ? Or is the caller
guaranteeing to clean up 'stored' somehow ? Or is the backend
supposed to not touch 'stored' until it's sure it's going to
succeed ? (presumably not, as the current code does not do this...)

This commit has no comments describing or documenting the
API requirements the new functionality imposes on a net backend:
could we have a followup patch which adds some documentation,
please, so that authors of future backends know what they have to
implement ?

thanks
-- PMM

