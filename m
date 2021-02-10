Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6B317228
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:16:25 +0100 (CET)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wqW-0008Fb-OX
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1l9wgZ-0002RX-DP
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1l9wgT-0001no-3e
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612991156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJ0Bt3QxZ19hrYWd5klH6F42bHIGKCRHdQF0+fzO3Y4=;
 b=bGFd8l7qo7Pd2AWnwVt9TpmFdOHqPJzwBrWF8cHcIUDKxUKLu4DMvZ5q1nw25yOJV5JLn0
 a/8pVZopsW/Iu6lzYrYQMJwhPCSP65c9YJMFwLIUCZ2By1BtF3W2GxKBOY6yGTuHP8Ttkz
 LOpoNCjkKjvcobDIo3V0mzuz7S6eqrA=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-BrgMyevdNuKiiLkKA7ACig-1; Wed, 10 Feb 2021 16:05:53 -0500
X-MC-Unique: BrgMyevdNuKiiLkKA7ACig-1
Received: by mail-oo1-f69.google.com with SMTP id w12so1484401ooo.7
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJ0Bt3QxZ19hrYWd5klH6F42bHIGKCRHdQF0+fzO3Y4=;
 b=Yyze3i5NYjrZgrVqAUobHeMryd38D1u6fF4GFc660MYgebwRdMNKwycx6fn342ltf+
 llEcO1dQJIxXv4HRy2zNsw7jkL/DrC9Cm8NumrhQ+2XfX6DplQqHfeJHHBn/kGkcbF8Y
 rP4ReqnEnjBiG8IknZP6dyGB1dpNX4eVadeBkkA7JJrZXgEnwRxaYwyU7brd3IrxkJN8
 0LWYQTT2diFbmaRTYbWrp+gexVuYzqb8YcnnVnb8Q+puwoS4dBBDYmlqcu3699OptisH
 z8kKotdt6UnX8bUnetwddn9b65+4aJNz1msC/dhRy+2o+AQh+zks88reHafjMX3L65mU
 oMhQ==
X-Gm-Message-State: AOAM5314qgizW+I8sReU1ut96DsusWVJi9W3iMXsmU+1qBVXLnckLuh3
 aRWOip9a2BXvBeBoG/Gj3q5zY+M2esbSKJhPJhQZWMYWLSCMPS9Fst8+l9ba6v4R6R6kd2yq5+G
 aTAezejkLHhbzfbRFAIjdUVU+MCCeUcQ=
X-Received: by 2002:aca:4508:: with SMTP id s8mr663794oia.118.1612991152865;
 Wed, 10 Feb 2021 13:05:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw53I32LuX8lNn5F9Np+ULxyWBiis62Fr6XiQILB46uP12xT2UOU40vq/7wiTobvSY3pCbDZyOLKXAwEQN7z0A=
X-Received: by 2002:aca:4508:: with SMTP id s8mr663774oia.118.1612991152703;
 Wed, 10 Feb 2021 13:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20210209152759.209074-1-eblake@redhat.com>
 <20210209152759.209074-3-eblake@redhat.com>
In-Reply-To: <20210209152759.209074-3-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 10 Feb 2021 23:05:36 +0200
Message-ID: <CAMRbyyvPBREuk+OSLve86nbhDNssjovkaL5z8=tbio7AkOpWKg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] qemu-nbd: Permit --shared=0 for unlimited clients
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Richard Jones <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 9, 2021 at 5:28 PM Eric Blake <eblake@redhat.com> wrote:
>
> This gives us better feature parity with QMP nbd-server-start, where
> max-connections defaults to 0 for unlimited.

Sound useful

> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/tools/qemu-nbd.rst | 4 ++--
>  qemu-nbd.c              | 7 +++----
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index fe41336dc550..ee862fa0bc02 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -136,8 +136,8 @@ driver options if ``--image-opts`` is specified.
>  .. option:: -e, --shared=NUM
>
>    Allow up to *NUM* clients to share the device (default
> -  ``1``). Safe for readers, but for now, consistency is not
> -  guaranteed between multiple writers.
> +  ``1``), 0 for unlimited. Safe for readers, but for now,
> +  consistency is not guaranteed between multiple writers.
>
>  .. option:: -t, --persistent
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 1a340ea4858d..5416509ece18 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -328,7 +328,7 @@ static void *nbd_client_thread(void *arg)
>
>  static int nbd_can_accept(void)
>  {
> -    return state == RUNNING && nb_fds < shared;
> +    return state == RUNNING && (shared == 0 || nb_fds < shared);
>  }
>
>  static void nbd_update_server_watch(void);
> @@ -706,8 +706,8 @@ int main(int argc, char **argv)
>              device = optarg;
>              break;
>          case 'e':
>              if (qemu_strtoi(optarg, NULL, 0, &shared) < 0 ||
> -                shared < 1) {
> +                shared < 0) {
>                  error_report("Invalid shared device number '%s'", optarg);
>                  exit(EXIT_FAILURE);
>              }
> @@ -966,7 +965,7 @@ int main(int argc, char **argv)
>      if (socket_activation == 0) {
>          int backlog;
>
> -        if (persistent) {
> +        if (persistent || shared == 0) {
>              backlog = SOMAXCONN;
>          } else {
>              backlog = MIN(shared, SOMAXCONN);
> --
> 2.30.0
>

Reviewed-by: Nir Soffer <nsoffer@redhat.com>


