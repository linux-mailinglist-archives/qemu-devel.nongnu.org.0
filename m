Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17FD5C00AA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:05:06 +0200 (CEST)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1Hb-0002FU-0o
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob16f-0007uS-Vw
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob16a-0004rL-Tp
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663772014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=17XiT9ox8Bym9iTbfphx+8h2a88fkY3C44hYlrXY5BQ=;
 b=JPwVaH2O9iSgXXe7DXfht22U+WiOTeSdbvOFHc9OFHhUSC23ztaLUy0uFuJs6AxncIsLf0
 PCq7KuKMi8FHhC6mC0rMXKeDBIUVSvc6vFYwoiNTUahuWuHJ2mUZQC0MB9yRrR3v8Gqch9
 F0uI09XQSuQmGJdmi4/BqO9mURoedy0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-xjsM4DLNMJqLrwL_LhBY3w-1; Wed, 21 Sep 2022 10:53:30 -0400
X-MC-Unique: xjsM4DLNMJqLrwL_LhBY3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 377C18027F5;
 Wed, 21 Sep 2022 14:53:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12F0B40C6EC2;
 Wed, 21 Sep 2022 14:53:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D1BF321E6900; Wed, 21 Sep 2022 16:53:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,  michael.roth@amd.com,  Konstantin
 Kostiuk <kkostiuk@redhat.com>
Subject: Re: [PATCH] qga: fix possible memory leak
References: <20220921142036.1758-1-luzhipeng@cestc.cn>
Date: Wed, 21 Sep 2022 16:53:25 +0200
In-Reply-To: <20220921142036.1758-1-luzhipeng@cestc.cn> (luzhipeng@cestc.cn's
 message of "Wed, 21 Sep 2022 22:20:36 +0800")
Message-ID: <87sfkkaie2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

luzhipeng <luzhipeng@cestc.cn> writes:

> From: lu zhipeng <luzhipeng@cestc.cn>
>
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
> ---
>  qga/main.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index 5f1efa2333..73ea1aae65 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -1287,7 +1287,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
>      if (g_mkdir_with_parents(config->state_dir, S_IRWXU) == -1) {
>          g_critical("unable to create (an ancestor of) the state directory"
>                     " '%s': %s", config->state_dir, strerror(errno));
> -        return NULL;
> +        goto failed;
>      }
>  #endif
>  
> @@ -1312,7 +1312,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
>              if (!log_file) {
>                  g_critical("unable to open specified log file: %s",
>                             strerror(errno));
> -                return NULL;
> +                goto failed;
>              }
>              s->log_file = log_file;
>          }
> @@ -1323,7 +1323,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
>                                 s->pstate_filepath,
>                                 ga_is_frozen(s))) {
>          g_critical("failed to load persistent state");
> -        return NULL;
> +        goto failed;
>      }
>  
>      config->blacklist = ga_command_blacklist_init(config->blacklist);
> @@ -1344,7 +1344,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
>  #ifndef _WIN32
>      if (!register_signal_handlers()) {
>          g_critical("failed to register signal handlers");
> -        return NULL;
> +        goto failed;
>      }
>  #endif
>  
> @@ -1357,12 +1357,21 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
>      s->wakeup_event = CreateEvent(NULL, TRUE, FALSE, TEXT("WakeUp"));
>      if (s->wakeup_event == NULL) {
>          g_critical("CreateEvent failed");
> -        return NULL;
> +        goto failed;
>      }
>  #endif
>  
>      ga_state = s;
>      return s;
> +
> +failed:
> +    g_free(s->pstate_filepath);
> +    g_free(s->state_filepath_isfrozen);
> +    if (s->log_file && s->log_file != stderr) {
> +        fclose(s->log_file);
> +    }
> +    g_free(s);
> +    return NULL;
>  }
>  
>  static void cleanup_agent(GAState *s)

The function's only caller is main():

   int main(int argc, char **argv)
   {
       int ret = EXIT_SUCCESS;

       ...

       s = initialize_agent(config, socket_activation);
       if (!s) {
           g_critical("error initializing guest agent");
           goto end;
       }

       ...

   end:
       if (config->daemonize) {
           unlink(config->pid_filepath);
       }

       config_free(config);

       return ret;
   }

When initialize_agent() fails, the process terminates immediately.
There is no memory leak.

We might want to free in initialize_agent() anyway.  Up to the
maintainer.

Bug (not related to this patch): when initialize_agent() fails, we still
terminate successfully.  We should ret = EXIT_FAILURE before goto end,
like we do elsewhere in main().


