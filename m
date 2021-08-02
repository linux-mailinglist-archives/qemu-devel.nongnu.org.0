Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18693DDFD9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:07:57 +0200 (CEST)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdI4-0000wt-KV
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAdAu-0006Cj-KL
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAdAs-0006D8-Oc
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627930830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0O+pyzwE/jXiRuIqDiWRf5Qu9L5vhXYbMQ/GNS4WaQ=;
 b=TptADnOGPAeDfpmjFVj2/NVlUYcQRrH7ILSJyJH1/2BCnrPqRCZ974ascygAH4oSy2gIyu
 ZY79b9TGH5bXBJPdxEXwYb7UBDgpfj7NrpsnS3hT7Y1zTZjiIUPVLejNzyZUyC8HLQpKq0
 Mr5/r5meqfXRaxyh/HntDUYiBJS6RQ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-iv7yi4LLNCqQXk-kkS8jwQ-1; Mon, 02 Aug 2021 15:00:29 -0400
X-MC-Unique: iv7yi4LLNCqQXk-kkS8jwQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l12-20020a5d6d8c0000b029015488313d96so1066121wrs.15
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E0O+pyzwE/jXiRuIqDiWRf5Qu9L5vhXYbMQ/GNS4WaQ=;
 b=QZ0L2VoraQgOAmObI1ij1fv7DJ9smQlgWmj3sfgg75LQK6M0g8UZVQTgAmbZoTMb7j
 cC6ld4AbV4XgVFgKOlbyvM49qMyoErwRKzNmDHJ82ecmtSKO/fq00eEUgE2I+MLusvoU
 i7n800hUIMe0PtzW4SqVR1UoGGDEYsOCwWwjr0I8YrdaG1CM9yElWlGvsiVGc94kM1Ms
 rLGwQw50lBUl5yIGd877D/mcBBQJcB63RTaQhTkCs9sRJYnFK8pZJoue3EHCHMzGStQT
 29VOTV25n5S7CXjdoOUYEV1waahB1O89DO5TYEQTw/Ti2vCMsS09ayeNqBGPY6XbfZVa
 nstA==
X-Gm-Message-State: AOAM53295YXWWdEuGJ0seB+EuUZvY1scQniR3xmV5FRiGaUTAyIn6xu7
 Cdj/tMIJ/z/5UVBGM43jFxjW0CHDab7B5umLExUev+yEIlvlViZyiwtagWpDrxIFpB7SijrzjPl
 yCu9a8tH5okZ4nU4=
X-Received: by 2002:a5d:6209:: with SMTP id y9mr18954510wru.402.1627930827310; 
 Mon, 02 Aug 2021 12:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQdz743ilwCXXhFz3XJXOUQAJn7XiKf9wEJ+K7w8cUJXrVjAA3HKYQfbx5zkaGso9JgVQ+jw==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr18954497wru.402.1627930827160; 
 Mon, 02 Aug 2021 12:00:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o34sm201977wms.10.2021.08.02.12.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:00:26 -0700 (PDT)
Subject: Re: [PATCH 14/16] Remove superfluous ERRP_GUARD()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-15-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ba1d0139-e4b6-32b7-6bf5-5d4a8e4ceed5@redhat.com>
Date: Mon, 2 Aug 2021 21:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-15-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Marc-André as he recently disagreed with this.

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> Macro ERRP_GUARD() is only needed when we want to dereference @errp or
> pass it to error_prepend() or error_append_hint().  Delete superfluous
> ones.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/remote/mpqemu-link.c  |  3 ---
>  qga/commands-posix-ssh.c | 17 -----------------
>  qga/commands-win32.c     |  1 -
>  softmmu/vl.c             |  1 -
>  ui/console.c             |  1 -
>  5 files changed, 23 deletions(-)
> 
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index e67a5de72c..7e841820e5 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -34,7 +34,6 @@
>   */
>  bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
>  {
> -    ERRP_GUARD();
>      bool iolock = qemu_mutex_iothread_locked();
>      bool iothread = qemu_in_iothread();
>      struct iovec send[2] = {};
> @@ -97,7 +96,6 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
>  static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **fds,
>                             size_t *nfds, Error **errp)
>  {
> -    ERRP_GUARD();
>      struct iovec iov = { .iov_base = buf, .iov_len = len };
>      bool iolock = qemu_mutex_iothread_locked();
>      bool iothread = qemu_in_iothread();
> @@ -192,7 +190,6 @@ fail:
>  uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
>                                           Error **errp)
>  {
> -    ERRP_GUARD();
>      MPQemuMsg msg_reply = {0};
>      uint64_t ret = UINT64_MAX;
>  
> diff --git a/qga/commands-posix-ssh.c b/qga/commands-posix-ssh.c
> index 2dda136d64..f3a580b8cc 100644
> --- a/qga/commands-posix-ssh.c
> +++ b/qga/commands-posix-ssh.c
> @@ -45,8 +45,6 @@ get_passwd_entry(const char *username, Error **errp)
>      g_autoptr(GError) err = NULL;
>      struct passwd *p;
>  
> -    ERRP_GUARD();
> -
>      p = g_unix_get_passwd_entry_qemu(username, &err);
>      if (p == NULL) {
>          error_setg(errp, "failed to lookup user '%s': %s",
> @@ -61,8 +59,6 @@ static bool
>  mkdir_for_user(const char *path, const struct passwd *p,
>                 mode_t mode, Error **errp)
>  {
> -    ERRP_GUARD();
> -
>      if (g_mkdir(path, mode) == -1) {
>          error_setg(errp, "failed to create directory '%s': %s",
>                     path, g_strerror(errno));
> @@ -87,8 +83,6 @@ mkdir_for_user(const char *path, const struct passwd *p,
>  static bool
>  check_openssh_pub_key(const char *key, Error **errp)
>  {
> -    ERRP_GUARD();
> -
>      /* simple sanity-check, we may want more? */
>      if (!key || key[0] == '#' || strchr(key, '\n')) {
>          error_setg(errp, "invalid OpenSSH public key: '%s'", key);
> @@ -104,8 +98,6 @@ check_openssh_pub_keys(strList *keys, size_t *nkeys, Error **errp)
>      size_t n = 0;
>      strList *k;
>  
> -    ERRP_GUARD();
> -
>      for (k = keys; k != NULL; k = k->next) {
>          if (!check_openssh_pub_key(k->value, errp)) {
>              return false;
> @@ -126,8 +118,6 @@ write_authkeys(const char *path, const GStrv keys,
>      g_autofree char *contents = NULL;
>      g_autoptr(GError) err = NULL;
>  
> -    ERRP_GUARD();
> -
>      contents = g_strjoinv("\n", keys);
>      if (!g_file_set_contents(path, contents, -1, &err)) {
>          error_setg(errp, "failed to write to '%s': %s", path, err->message);
> @@ -155,8 +145,6 @@ read_authkeys(const char *path, Error **errp)
>      g_autoptr(GError) err = NULL;
>      g_autofree char *contents = NULL;
>  
> -    ERRP_GUARD();
> -
>      if (!g_file_get_contents(path, &contents, NULL, &err)) {
>          error_setg(errp, "failed to read '%s': %s", path, err->message);
>          return NULL;
> @@ -178,7 +166,6 @@ qmp_guest_ssh_add_authorized_keys(const char *username, strList *keys,
>      strList *k;
>      size_t nkeys, nauthkeys;
>  
> -    ERRP_GUARD();
>      reset = has_reset && reset;
>  
>      if (!check_openssh_pub_keys(keys, &nkeys, errp)) {
> @@ -228,8 +215,6 @@ qmp_guest_ssh_remove_authorized_keys(const char *username, strList *keys,
>      GStrv a;
>      size_t nkeys = 0;
>  
> -    ERRP_GUARD();
> -
>      if (!check_openssh_pub_keys(keys, NULL, errp)) {
>          return;
>      }
> @@ -277,8 +262,6 @@ qmp_guest_ssh_get_authorized_keys(const char *username, Error **errp)
>      g_autoptr(GuestAuthorizedKeys) ret = NULL;
>      int i;
>  
> -    ERRP_GUARD();
> -
>      p = get_passwd_entry(username, errp);
>      if (p == NULL) {
>          return NULL;
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index a099acb34d..a6d2c0d88e 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -976,7 +976,6 @@ out:
>  
>  GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>  {
> -    ERRP_GUARD();
>      GuestDiskInfoList *ret = NULL;
>      HDEVINFO dev_info;
>      SP_DEVICE_INTERFACE_DATA dev_iface_data;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 0d2db1abc3..f9ffeb8d4d 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1539,7 +1539,6 @@ machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
>  {
>      QDict *opts, *prop;
>      bool help = false;
> -    ERRP_GUARD();
>  
>      prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
>      if (help) {
> diff --git a/ui/console.c b/ui/console.c
> index 5d2e6178ff..eabbbc951c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1481,7 +1481,6 @@ static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl)
>  static bool dpy_compatible_with(QemuConsole *con,
>                                  DisplayChangeListener *dcl, Error **errp)
>  {
> -    ERRP_GUARD();
>      int flags;
>  
>      flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
> 


