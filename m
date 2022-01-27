Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCF49DC76
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:23:11 +0100 (CET)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD03i-0003Z3-Nm
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCzeq-0005h4-Hl
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCzen-00015A-Ii
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643270243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTV0wWhlZYsalyJcWbZll5lkCJAN4TbLUJG05Bf0FVc=;
 b=R8+zjqV77B6IbtBU6fGiuEGmMMGzrZPCE+rEwol1lwmN/WyU+Jt3GwAHQYlL00p4pcacEg
 10yFkY3upoVcDzzvmGiY6r7G1SI1WpVZSf+6R7o9KrKb5tmo5e/+BqDY1ihzbjWi6f8Fq5
 S7cxnkuXgbGiOtB5fEdjE+hz7/gk+m4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-E4v7bbaTNSqjTO2bOVWiqw-1; Thu, 27 Jan 2022 02:57:22 -0500
X-MC-Unique: E4v7bbaTNSqjTO2bOVWiqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so385578wme.6
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yTV0wWhlZYsalyJcWbZll5lkCJAN4TbLUJG05Bf0FVc=;
 b=C8zhwO7TgMR9cFkqdqciWQgLZ8yQmIeaLzlRD7Jr0PA1LpSDx1az8EoxOyZqLGFnkH
 i2CNAgVBn6hd1SpFZcNiAesOHiUjocQqSmGWwohwE8n+Dy7/M6NWP8Ae28r73q0H9NTr
 xBw98z6Isw0kLCUT7maFYZrOQpFtjfcVbJNV2WERENADad0w5eyUh1hFmwmE0vi22Dm9
 +36Q5O39PSKtn9SQ0G/wxizCYXvB9wkshtngn2I3ntMyXQx34k6rp88+u6ubapOdHcli
 Dt449zKX+kQVI0tgZot0ApwjfAzOH95RBAhePKu046KGFJT8Y/tQHEDEm9UIbN/Uc7fR
 PdbQ==
X-Gm-Message-State: AOAM532ib9nJ+0NxlmIhxtsTMdeo16QGovChWyPYKycFNpMu0vUFiJHS
 we9MD0HNxP7LHk8Qi6sCrqzL3pzcWMat+FY8/1yFRaNPiohjwPb50nLlnhxSXNSSdPEiR1H8i35
 sltd4RChQWEC0g5c=
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr1977851wro.110.1643270241396; 
 Wed, 26 Jan 2022 23:57:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv0zDlXyxHCbk1iouUJi+JOx7LqRjixjpVxEdHakJQGQN6XGeu9kBemMp/nvtX1H6S84tP6Q==
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr1977838wro.110.1643270241147; 
 Wed, 26 Jan 2022 23:57:21 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id r13sm5294284wmq.33.2022.01.26.23.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:57:20 -0800 (PST)
Message-ID: <f2905539-b5a1-9d4d-8cf2-5c2cbc6cc7f6@redhat.com>
Date: Thu, 27 Jan 2022 08:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20220126171136.672657-1-groug@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220126171136.672657-1-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2022 18.11, Greg Kurz wrote:
> The template pointer in virtio_9p_create_local_test_dir() is leaked.
> Add the g_autofree annotation to fix that. While here, convert the
> rest of the virtio 9p test code to using g_autofree or g_autoptr
> where possible, since this is the preferred approach to avoid potential
> leaks in the future.
> 
> Based-on: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   tests/qtest/libqos/virtio-9p.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
> index ef96ef006adc..0a0d0d16709b 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -40,14 +40,13 @@ static char *concat_path(const char* a, const char* b)
>   void virtio_9p_create_local_test_dir(void)
>   {
>       struct stat st;
> -    char *pwd = g_get_current_dir();
> -    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> +    g_autofree char *pwd = g_get_current_dir();
> +    g_autofree char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
>   
>       local_test_path = mkdtemp(template);
>       if (!local_test_path) {
>           g_test_message("mkdtemp('%s') failed: %s", template, strerror(errno));
>       }
> -    g_free(pwd);
>   
>       g_assert(local_test_path != NULL);
>   
> @@ -60,12 +59,11 @@ void virtio_9p_create_local_test_dir(void)
>   void virtio_9p_remove_local_test_dir(void)
>   {
>       g_assert(local_test_path != NULL);
> -    char *cmd = g_strdup_printf("rm -fr '%s'\n", local_test_path);
> +    g_autofree char *cmd = g_strdup_printf("rm -fr '%s'\n", local_test_path);
>       int res = system(cmd);
>       if (res < 0) {
>           /* ignore error, dummy check to prevent compiler error */
>       }
> -    g_free(cmd);
>   }
>   
>   char *virtio_9p_test_path(const char *path)
> @@ -209,8 +207,8 @@ static void *virtio_9p_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
>   static void regex_replace(GString *haystack, const char *pattern,
>                             const char *replace_fmt, ...)
>   {
> -    GRegex *regex;
> -    char *replace, *s;
> +    g_autoptr(GRegex) regex = NULL;
> +    g_autofree char *replace = NULL, *s = NULL;
>       va_list argp;
>   
>       va_start(argp, replace_fmt);
> @@ -220,9 +218,6 @@ static void regex_replace(GString *haystack, const char *pattern,
>       regex = g_regex_new(pattern, 0, 0, NULL);
>       s = g_regex_replace(regex, haystack->str, -1, 0, replace, 0, NULL);
>       g_string_assign(haystack, s);
> -    g_free(s);
> -    g_regex_unref(regex);
> -    g_free(replace);
>   }
>   
>   void virtio_9p_assign_local_driver(GString *cmd_line, const char *args)

Reviewed-by: Thomas Huth <thuth@redhat.com>


