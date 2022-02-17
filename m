Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57714B9BBB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:08:56 +0100 (CET)
Received: from localhost ([::1]:59916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcmV-0000dA-FU
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKc0L-0003US-Ga
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKc0J-0000Zx-FI
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645085946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MUrPm5gIi6Za8Ss7us9nLvHfDnvtsaerqVO72xd+uCo=;
 b=hiv+y0x5yXvflE66qGdIi2MKfSadvXjCUZfiI1IAbYJxlTYwKzxJAL3j5HSj5DpLartsjN
 dQkHP4UmsGD9CWQg4NiW2R4FViWxW2TpZOv3D5sURoIlehVHNowncg1Fzi9LTNA9jGbdW+
 /VXr3AlpIm+Ak6Ln0SczGDl5L6KtFbw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-s407Bdm1NAyRhXCyE6Fn_w-1; Thu, 17 Feb 2022 03:19:05 -0500
X-MC-Unique: s407Bdm1NAyRhXCyE6Fn_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 e11-20020adf9bcb000000b001e316b01456so1951634wrc.21
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MUrPm5gIi6Za8Ss7us9nLvHfDnvtsaerqVO72xd+uCo=;
 b=JyCTQ8My+/By4dAONNWHbfiuecz+ZK0twVmwaZSvwTRUGSAHR1AU1+D/jMy+LgoHyz
 kvBFGcfru4E1+zZkkYeAw4SpCTFtjwxbk/3uEAV+MPrJ/IWJaNUpSYtwh/LBAUBJm50u
 i3HLEvUwKYucuKCniaSBhiAF/mWE+fUpFVK872oq7uHNB2cfKKRlHy0+ihYsEX+0qGoi
 RUBhsKdp837SFlqvjrtGs8ZCNfSs07JHO7gGqJo7euPngup/gd2JIW0YCJoztzRtENTS
 +bUACTp0yz/4BlBx6G1U0qrO/niE6zbn+x3460s6hNR30Zerg1gmNDQx3rdo4QT7DUeC
 wutw==
X-Gm-Message-State: AOAM533xYnydPWQl6btFWI1DpOioj+m1e8343x8yThomLVvn7MT2Meca
 DoAyMau510SPT5PVR7hw4GX5FaUW2w11ilOJG4J59fVYcNHsc4FSFNiZNi50fdSUeW/pbYXzQjp
 Pvtcq4Fn6mJ3ihW8=
X-Received: by 2002:a05:6000:1882:b0:1e4:be96:8816 with SMTP id
 a2-20020a056000188200b001e4be968816mr1433680wri.277.1645085943961; 
 Thu, 17 Feb 2022 00:19:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTEUNzZ5LtI9TGeN7N9ApZYC6hH2JP6B/TFZsPEOf1DkYeLfuMJqJHLKuLaqDaWDaSTxy/2g==
X-Received: by 2002:a05:6000:1882:b0:1e4:be96:8816 with SMTP id
 a2-20020a056000188200b001e4be968816mr1433662wri.277.1645085943750; 
 Thu, 17 Feb 2022 00:19:03 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id n2sm568776wmq.6.2022.02.17.00.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 00:19:03 -0800 (PST)
Date: Thu, 17 Feb 2022 03:18:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/3] tests/x86: Use 'pc' machine type for old hardware
 tests
Message-ID: <20220217031836-mutt-send-email-mst@kernel.org>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-2-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215162537.605030-2-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 04:25:31PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> For tests that rely on old hardware, e.g. floppies or IDE drives,
> explicitly select the 'pc' machine type.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

This makes sense regardless of the rest of the series.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tests/qtest/fdc-test.c    |  2 +-
>  tests/qtest/hd-geo-test.c | 12 +++++++++---
>  tests/qtest/i440fx-test.c |  2 +-
>  tests/qtest/ide-test.c    |  3 ++-
>  4 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 8f6eee84a4..b0d40012e6 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -598,7 +598,7 @@ int main(int argc, char **argv)
>      /* Run the tests */
>      g_test_init(&argc, &argv, NULL);
>  
> -    qtest_start("-device floppy,id=floppy0");
> +    qtest_start("-machine pc -device floppy,id=floppy0");
>      qtest_irq_intercept_in(global_qtest, "ioapic");
>      qtest_add_func("/fdc/cmos", test_cmos);
>      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 771eaa741b..3554b5d500 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -178,9 +178,15 @@ static int append_arg(int argc, char *argv[], int argv_sz, char *arg)
>  
>  static int setup_common(char *argv[], int argv_sz)
>  {
> +    int new_argc;
>      memset(cur_ide, 0, sizeof(cur_ide));
> -    return append_arg(0, argv, argv_sz,
> -                      g_strdup("-nodefaults"));
> +    new_argc = append_arg(0, argv, argv_sz,
> +                          g_strdup("-nodefaults"));
> +    new_argc = append_arg(new_argc, argv, argv_sz,
> +                          g_strdup("-machine"));
> +    new_argc = append_arg(new_argc, argv, argv_sz,
> +                          g_strdup("pc"));
> +    return new_argc;
>  }
>  
>  static void setup_mbr(int img_idx, MBRcontents mbr)
> @@ -697,7 +703,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
>  
>      joined_args = g_strjoinv(" ", args->argv);
>  
> -    qts = qtest_init(joined_args);
> +    qts = qtest_initf("-machine pc %s", joined_args);
>      fw_cfg = pc_fw_cfg_init(qts);
>  
>      read_bootdevices(fw_cfg, expected);
> diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
> index 1f57d9684b..6d7d4d8d8f 100644
> --- a/tests/qtest/i440fx-test.c
> +++ b/tests/qtest/i440fx-test.c
> @@ -35,7 +35,7 @@ static QPCIBus *test_start_get_bus(const TestData *s)
>  {
>      char *cmdline;
>  
> -    cmdline = g_strdup_printf("-smp %d", s->num_cpus);
> +    cmdline = g_strdup_printf("-machine pc -smp %d", s->num_cpus);
>      qtest_start(cmdline);
>      g_free(cmdline);
>      return qpci_new_pc(global_qtest, NULL);
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 3f8081e77d..84935578fb 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -128,10 +128,11 @@ static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
>  static QTestState *ide_test_start(const char *cmdline_fmt, ...)
>  {
>      QTestState *qts;
> +    g_autofree char *full_fmt = g_strdup_printf("-machine pc %s", cmdline_fmt);
>      va_list ap;
>  
>      va_start(ap, cmdline_fmt);
> -    qts = qtest_vinitf(cmdline_fmt, ap);
> +    qts = qtest_vinitf(full_fmt, ap);
>      va_end(ap);
>  
>      pc_alloc_init(&guest_malloc, qts, 0);
> -- 
> 2.35.1


