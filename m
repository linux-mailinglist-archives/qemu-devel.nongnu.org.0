Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C968B717
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwZB-0005e0-Ue; Mon, 06 Feb 2023 03:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOwZA-0005dn-9u
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOwZ8-0003Nt-Q5
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675670969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTY6Up6NBM/BcmD/rqL0/gOjTKE2TWegijIRespjDwg=;
 b=WFQWPixaRVXP56NlCNWQExwHQ3Zc8kasny9wySk5bgwudYg1Feelrc1Iq9l9/pmdxpdWSe
 6chIlUZ5fqdh//bgLTLo3XbhOkyhPsuz/hT5TexGZE/USxt/0WDmRrQyMVdP911f+kyf6M
 CrO0d+hLQ8kJsPJ35CWOPLgWVPKHnxY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-i3dD9VbeP0W51dtAx3GGAg-1; Mon, 06 Feb 2023 03:09:26 -0500
X-MC-Unique: i3dD9VbeP0W51dtAx3GGAg-1
Received: by mail-qk1-f197.google.com with SMTP id
 s7-20020ae9f707000000b007294677a6e8so7412311qkg.17
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 00:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GTY6Up6NBM/BcmD/rqL0/gOjTKE2TWegijIRespjDwg=;
 b=tYp7qfwIVuE1/cRoPUghCZqjD9iXaQFGmqHqUfNrurX3pUBX7iDCOOVPh2Ujy4bshi
 W8R5PM2PHHwI+1C9ecBZI6GFA+g3SXnxe4nvQLvJhBggr604nBYWnarfXW0mFL6Y3wVJ
 lPx1kS2MBp/+306Z4sJaEirfpTJx0AGSE3pvwqfCFBb5frj5Q21xHfgyh8Xahz7qAa3f
 CiO+epP+5Q2gQUTDwcCfQy/qQtclRJUuAv5ybpA7upduhsfU1OWeiPbsNLhieObJQspl
 tx55Q5sUDbE6iY2STCLNlsI2Vd125O7k8byuaPU+6Pzcq+Zgls8o5kGlS4VrM5PO3kpA
 FR9Q==
X-Gm-Message-State: AO0yUKXMv2jZxt5OQnESvHRiXRyMZpQyYnJlBkB7EO39rHUMZBw5VBZW
 6vLVVbmBjRj4tlEnwrFRiX2rMD2S9f8TIZS8ADNQUMaJg7aekoubBXTSqw8AW4FF7mKQcjvocqz
 evtK+YI4bVADM6Xg=
X-Received: by 2002:ac8:5dd2:0:b0:3b7:faaf:f6da with SMTP id
 e18-20020ac85dd2000000b003b7faaff6damr34863478qtx.50.1675670965986; 
 Mon, 06 Feb 2023 00:09:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9EHaSeMUjszb7+uNplOI57iADsZZGCMHXUefin0GY0nxSCc2Qjpqg5dw4AX+PN/Crm+6iaAg==
X-Received: by 2002:ac8:5dd2:0:b0:3b7:faaf:f6da with SMTP id
 e18-20020ac85dd2000000b003b7faaff6damr34863466qtx.50.1675670965772; 
 Mon, 06 Feb 2023 00:09:25 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 u186-20020a3760c3000000b0072c86374ddfsm6993549qkb.71.2023.02.06.00.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 00:09:25 -0800 (PST)
Message-ID: <c39d58f3-872d-eedb-1f4e-6d26999390ac@redhat.com>
Date: Mon, 6 Feb 2023 09:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/9] tests: fix test-io-channel-command on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230129182414.583349-1-marcandre.lureau@redhat.com>
 <20230129182414.583349-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230129182414.583349-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29/01/2023 19.24, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> socat "PIPE:"" on Windows are named pipes, not fifo path names.
> 
> Fixes: commit 68406d10859 ("tests/unit: cleanups for test-io-channel-command")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/test-io-channel-command.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 096224962c..e76ef2daaa 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -31,8 +31,12 @@ static char *socat = NULL;
>   
>   static void test_io_channel_command_fifo(bool async)
>   {
> +#ifdef WIN32
> +    const gchar *fifo = TEST_FIFO;

Question from a Windows ignorant: Won't this cause a race condition in case 
someone is trying to run tests in parallel (i.e. shouldn't there be a random 
part in the name)? Or are these named pipes local to the current process?

  Thomas

> +#else
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
>       g_autofree gchar *fifo = g_build_filename(tmpdir, TEST_FIFO, NULL);
> +#endif
>       g_autofree gchar *srcargs = g_strdup_printf("%s - PIPE:%s,wronly", socat, fifo);
>       g_autofree gchar *dstargs = g_strdup_printf("%s PIPE:%s,rdonly -", socat, fifo);
>       g_auto(GStrv) srcargv = g_strsplit(srcargs, " ", -1);
> @@ -57,7 +61,9 @@ static void test_io_channel_command_fifo(bool async)
>       object_unref(OBJECT(src));
>       object_unref(OBJECT(dst));
>   
> +#ifndef WIN32
>       g_rmdir(tmpdir);
> +#endif
>   }
>   
>   


