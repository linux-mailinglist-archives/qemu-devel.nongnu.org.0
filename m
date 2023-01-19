Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020F2673B51
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVZG-00071s-8V; Thu, 19 Jan 2023 09:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIVZB-00070N-Rd
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:06:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIVZ9-00080C-Rj
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674137214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q7VptEAsu6EyqTaMheBg2vEhPZp9hALIjSxskec0D9E=;
 b=bq82WcuoeI3QhreMGVOrOtN+FoNKOeX4mMfS/nTWyIErkWXeDUeERjqK42Gr9rvLDbsn80
 AORuZWJdxQcTCMaJZ8y/NWCwOnrfQ0TK52+NO2wMyQWO0/N/mSbLsZFZEKuTPTe80HPyyv
 eEmLXh6zj3M4A1jWgTUGuacrNcm+raQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-JdRRRRmmPo2tBJwFD1YFvQ-1; Thu, 19 Jan 2023 09:06:53 -0500
X-MC-Unique: JdRRRRmmPo2tBJwFD1YFvQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l18-20020adfa392000000b002bbd5c680a3so389328wrb.14
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7VptEAsu6EyqTaMheBg2vEhPZp9hALIjSxskec0D9E=;
 b=DbZ0VxUOH+9n1cQcema/eT413VTJjgTvyxYe9SuMMWP50wnP8n7m9groP4/Tp2JrE2
 VLb+8ecD0nfkyRaBpLtqAkDo0WvGJ9UZ+fafGBu0nuqZ4mKtpx456A8ckAeAfF5vBhiY
 qpeOIOaWXMhT9kvNsXkd7v+tmK0vi9nTsvb/FnnATRuNBVawX/7FQKpr2wpZ7Kri5mNU
 eNiXBKS7qZuoOzE/2xwD2bze67XqZt9cg6sVaYVNYmWd32vLkibGoVGeF0lbZSE1ARcJ
 EWruZo/A+04kXEqSJcz3Wi+SCA2zvCbwvWOihaVnwlaWqtBUd0QGkL1ixSrNIV4cm33J
 8XhQ==
X-Gm-Message-State: AFqh2kqC/0Nw6PMLh3IGZ+5HvpvIfqo8E4wnGchvqFo0+evggzlneMEq
 RnIDX1AOaDWNCmun7t/r8Br7qJfdg/+VMWnzZlv/jRThjcFa8su6G7pr7EyQeg3zigG8KvxTucr
 JzHK4tuudlc3GfGM=
X-Received: by 2002:a5d:6b07:0:b0:236:695b:82d4 with SMTP id
 v7-20020a5d6b07000000b00236695b82d4mr9344781wrw.30.1674137211866; 
 Thu, 19 Jan 2023 06:06:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLene4I6A+TR+FTLX2+mJ6VJK4eoTrKJ/44XyiPrxhcSh7ARylw5fkyGD9PWpa5NF1upVbnw==
X-Received: by 2002:a5d:6b07:0:b0:236:695b:82d4 with SMTP id
 v7-20020a5d6b07000000b00236695b82d4mr9344752wrw.30.1674137211598; 
 Thu, 19 Jan 2023 06:06:51 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfe9c5000000b002238ea5750csm19310627wrn.72.2023.01.19.06.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:06:51 -0800 (PST)
Date: Thu, 19 Jan 2023 14:06:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 08/15] tests/qtest: Adjust test-hmp to always pass
 -cpu option
Message-ID: <Y8lOeRqfcAUljaJN@work-vm>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-9-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119135424.5417-9-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Fabiano Rosas (farosas@suse.de) wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/qtest/test-hmp.c | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
> index f8b22abe4c..c367612d4a 100644
> --- a/tests/qtest/test-hmp.c
> +++ b/tests/qtest/test-hmp.c
> @@ -121,21 +121,49 @@ static void test_info_commands(QTestState *qts)
>      g_free(info_buf);
>  }
>  
> +static const char *arch_get_cpu(const char *machine)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    if (g_str_equal(arch, "aarch64")) {
> +        if (!strncmp(machine, "virt", 4)) {
> +            return "cortex-a57";

Won't that break on a kvm host on a different CPU?
Would -cpu max   work on everything?

Dave

> +        }
> +    }
> +
> +    return NULL;
> +}
> +
>  static void test_machine(gconstpointer data)
>  {
>      const char *machine = data;
>      char *args;
>      QTestState *qts;
>  
> -    args = g_strdup_printf("-S -M %s", machine);
> +    args = qtest_get_machine_args(machine, arch_get_cpu(machine), "-S");
>      qts = qtest_init(args);
>  
>      test_info_commands(qts);
>      test_commands(qts);
>  
>      qtest_quit(qts);
> -    g_free(args);
>      g_free((void *)data);
> +    g_free((void *)args);
> +}
> +
> +static void test_none_with_memory(void)
> +{
> +    QTestState *qts;
> +    char *args;
> +
> +    args = qtest_get_machine_args("none", NULL, "-S -m 2");
> +    qts = qtest_init(args);
> +
> +    test_info_commands(qts);
> +    test_commands(qts);
> +
> +    qtest_quit(qts);
> +    g_free((void *)args);
>  }
>  
>  static void add_machine_test_case(const char *mname)
> @@ -160,7 +188,7 @@ int main(int argc, char **argv)
>      qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
>  
>      /* as none machine has no memory by default, add a test case with memory */
> -    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
> +    qtest_add_func("hmp/none+2MB", test_none_with_memory);
>  
>      return g_test_run();
>  }
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


