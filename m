Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA855F5F1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 07:59:43 +0200 (CEST)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Qjm-00086Y-7W
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 01:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6Qgt-0006XB-ES
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 01:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6Qgq-00005B-8A
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 01:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656482198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N/v+9oqZL6WilYvlMCahbyFXcdP82Vb1xPe5KfLXVJ8=;
 b=i8V8wVcMQ47jTay7L5eaPsaTHB4VsbOBU/L+XaGyxHA+xWAxG/OfV6C7C6IN/71u+7OM7F
 bATRn9gpJZF3KtCW0Qurp8of5BuOaBEEtR7jgsj+ErUmRZ4PtKqc5w69FR9M4cOy9F/Z5T
 1/tWZmXCLqF10BqqpADPDM+0POzgrw0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-gVf0y3FfMc2pVMuE6QnAqA-1; Wed, 29 Jun 2022 01:56:34 -0400
X-MC-Unique: gVf0y3FfMc2pVMuE6QnAqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF8C03C1104C;
 Wed, 29 Jun 2022 05:56:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 919E81121314;
 Wed, 29 Jun 2022 05:56:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21C5A21E690D; Wed, 29 Jun 2022 07:56:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: jianchunfu <jianchunfu@cmss.chinamobile.com>
Cc: clg@kaod.org,  danielhb413@gmail.com,  david@gibson.dropbear.id.au,
 groug@kaod.org,  pbonzini@redhat.com,  qemu-ppc@nongnu.org,
 kvm@vger.kernel.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Add error reporting when opening file fails
References: <20220629031552.5407-1-jianchunfu@cmss.chinamobile.com>
Date: Wed, 29 Jun 2022 07:56:32 +0200
In-Reply-To: <20220629031552.5407-1-jianchunfu@cmss.chinamobile.com>
 (jianchunfu@cmss.chinamobile.com's message of "Wed, 29 Jun 2022
 11:15:52 +0800")
Message-ID: <87a69wrp0v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

jianchunfu <jianchunfu@cmss.chinamobile.com> writes:

> Add error reporting before return when opening file fails.
>
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
> ---
>  target/ppc/kvm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..ef9a871411 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1798,6 +1798,7 @@ static int read_cpuinfo(const char *field, char *value, int len)
>  
   static int read_cpuinfo(const char *field, char *value, int len)
   {
       FILE *f;
       int ret = -1;
       int field_len = strlen(field);
       char line[512];

>      f = fopen("/proc/cpuinfo", "r");
>      if (!f) {
> +        fprintf(stderr, "Error opening /proc/cpuinfo: %s\n", strerror(errno));
>          return -1;
>      }

       do {
           if (!fgets(line, sizeof(line), f)) {
               break;
           }
           if (!strncmp(line, field, field_len)) {
               pstrcpy(value, len, line);
               ret = 0;
               break;
           }
       } while (*line);

       fclose(f);

       return ret;
   }

This function now reports an error on one out of two failures.  The
caller can't tell whether it reported or not.

Please use error_report() for errors, warn_report() for warnings, and
info_report() for informational messages.

But is it an error?  Here's the only caller:

    static uint32_t kvmppc_get_tbfreq_procfs(void)
    {
        char line[512];
        char *ns;
        uint32_t tbfreq_fallback = NANOSECONDS_PER_SECOND;
        uint32_t tbfreq_procfs;

        if (read_cpuinfo("timebase", line, sizeof(line))) {
--->        return tbfreq_fallback;
        }

        ns = strchr(line, ':');
        if (!ns) {
--->        return tbfreq_fallback;
        }

        tbfreq_procfs = atoi(++ns);

        /* 0 is certainly not acceptable by the guest, return fallback value */
--->    return tbfreq_procfs ? tbfreq_procfs : tbfreq_fallback;
    }

I marked the three spots that handle errors.  All quietly return
NANOSECONDS_PER_SECOND.  The caller can't tell whether that happened.

Reporting an error when we don't actually fail is confusing.  Better
would be something like "Can't open /proc/cpuinfo, assuming timebase X",
where X is the value you assume.

Reporting this only in one out of several cases where we assume feels
wrong.  If it's worth reporting in one case, why isn't it worth
reporting in the other cases?  Is it worth reporting?

Aside: the use of atoi() silently maps a timebase of 0 to
NANOSECONDS_PER_SECOND.  Not fond of this function.  Not your patch's
problem, of course.

>  
> @@ -1906,6 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>  
>      f = fopen(filename, "rb");
>      if (!f) {
> +        fprintf(stderr, "Error opening %s: %s\n", filename, strerror(errno));
>          return -1;
>      }

Preexisting: this function returns -1 when fopen() fails, 0 when fread()
fails or read less data than expected.  Its caller
kvmppc_read_int_cpu_dt() passes on the return value.  However, it is
documented to return "0 if anything goes wrong".  Bug.  Not your patch's
fault, but it needs fixing.

Similar issue as above: you make the function emit an error message on
some, but not all failures.  If it's worth reporting in one case, why
isn't it worth reporting in the other cases?  Is it worth reporting?


