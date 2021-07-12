Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09E3C622E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:47:54 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3024-0004Wf-NK
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m2zzH-0002bQ-1i
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m2zzD-0008SZ-J3
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626111893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QeXN8T2lG/aEyMt0VK+R6QqaXHbU+qQaGbe8zFSZLUg=;
 b=YdJX43ClqF+7cLZVHg4IxtRb4o9N5Ppa3zPZ0ujaJu9zgWq/FCcW65FMUcn88Zpvmr9r1Y
 dDc2UwsY+W8A9F5c2mN2CEMRKiP1wvLNgNnYDGB7tU3Jvg1sKUB0Cqom/kaOzMh64h6n3s
 pm6j7FFEe05uITHwDS3IGMMkE7Ou+iE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-PUruNabbNt24JQQAWoNZlw-1; Mon, 12 Jul 2021 13:44:50 -0400
X-MC-Unique: PUruNabbNt24JQQAWoNZlw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so7459662wrs.11
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 10:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QeXN8T2lG/aEyMt0VK+R6QqaXHbU+qQaGbe8zFSZLUg=;
 b=q15rPT8Qh7yZowGycAsngTePEaSGI7xeSrM40g1tdDIGRAuFZ0V0L2XZq+CutUwPnA
 zYbamzi8HnbNqvre90yCGQ/69f0EMvEX8d0v+GT6kIQNQC7S+cJ9u2ie88Vkw8T+84d/
 0m7ZBJsd2N+bHYJtWtqNpybUo9kAMJe0He/hWdrSHzHq22Z8K2MTbfmn27hh1Rd0sK2U
 tl7CtgRtuWKxEGuIG2cxG5MDma5kAv8MLHhCKDfRv4zE+0PVqju8oZWT92F+zIrv/gmn
 JWDYs0/FlzXu1LZi67eZcrosuXSQByas0Ld0a0OkMbYAa1ydGedAwFoOKZ3JeAXjj7So
 /yxw==
X-Gm-Message-State: AOAM530XDMm5aXeIXtm+0HqX2Plv1lRqaEM2GBhAV/uPnobtnJg77j7i
 y8559fdGLTv/Vqj24f9Aa8Jr6C2uS+BZ3lg3TDoenczRVXkDMIzakwdFsLOjribXgQ0caY7XkUb
 ayYndgE0vsME5B1Y=
X-Received: by 2002:a1c:acc2:: with SMTP id v185mr429560wme.60.1626111888820; 
 Mon, 12 Jul 2021 10:44:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoUzVBcHt32WHdNonzsC8GPwkLZ9YA/m3vH6WK5OvJQqEvUGJsL4PdENDLFRpuJp+udldVUA==
X-Received: by 2002:a1c:acc2:: with SMTP id v185mr429534wme.60.1626111888576; 
 Mon, 12 Jul 2021 10:44:48 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id j1sm118340wms.7.2021.07.12.10.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 10:44:44 -0700 (PDT)
Date: Mon, 12 Jul 2021 18:44:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/3] migration: Release return path early for paused
 postcopy
Message-ID: <YOx/im9h/OJLRQ3N@work-vm>
References: <20210708190653.252961-1-peterx@redhat.com>
 <20210708190653.252961-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708190653.252961-2-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>, qemu-devel@nongnu.org,
 Li Xiaohui <xiaohuixiaohli@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> When postcopy pause triggered, we rely on the migration thread to cleanup the
> to_dst_file handle, and the return path thread to cleanup the from_dst_file
> handle (which is stored in the local variable "rp").
> 
> Within the process, from_dst_file cleanup (qemu_fclose) is postponed until it's
> setup again due to a postcopy recovery.
> 
> It used to work before yank was born; after yank is introduced we rely on the
> refcount of IOC to correctly unregister yank function in channel_close().  If
> without the early and on-time release of from_dst_file handle the yank function
> will be leftover during paused postcopy.
> 
> Without this patch, below steps (quoted from Xiaohui) could trigger qemu src
> crash:
> 
>   1.Boot vm on src host
>   2.Boot vm on dst host
>   3.Enable postcopy on src&dst host
>   4.Load stressapptest in vm and set postcopy speed to 50M
>   5.Start migration from src to dst host, change into postcopy mode when migration is active.
>   6.When postcopy is active, down the network card(do migration via this network) on dst host.
>   7.Wait untill postcopy is paused on src&dst host.
>   8.Before up network card, recover migration on dst host, will get error like following.
>   9.Ignore the error of step 8, go on recovering migration on src host:
> 
>   After step 9, qemu on src host will core dump after some seconds:
>   qemu-kvm: ../util/yank.c:107: yank_unregister_instance: Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
>   1.sh: line 38: 44662 Aborted                 (core dumped)
> 
> Reported-by: Li Xiaohui <xiaohuixiaohli@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

(and I can cleanup the email address problem)

> ---
>  migration/migration.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 5ff7ba9d5c..8786104c9a 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2818,12 +2818,12 @@ out:
>               * Maybe there is something we can do: it looks like a
>               * network down issue, and we pause for a recovery.
>               */
> +            qemu_fclose(rp);
> +            ms->rp_state.from_dst_file = NULL;
> +            rp = NULL;
>              if (postcopy_pause_return_path_thread(ms)) {
>                  /* Reload rp, reset the rest */
> -                if (rp != ms->rp_state.from_dst_file) {
> -                    qemu_fclose(rp);
> -                    rp = ms->rp_state.from_dst_file;
> -                }
> +                rp = ms->rp_state.from_dst_file;
>                  ms->rp_state.error = false;
>                  goto retry;
>              }
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


