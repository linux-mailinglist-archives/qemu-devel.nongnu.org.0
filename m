Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21BF6C14D5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGbk-0001MH-12; Mon, 20 Mar 2023 10:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGbe-0001EZ-Or
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:35:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGbd-0005Cr-5I
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:35:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso7649419wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679322923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LaQMXeUc8wT22E+dKorORjY6zURS3yxHQR6+u+nSGdQ=;
 b=xVWUrYEdd6/vwBe05JfCh6BiF92DZpkQTH+VEXym0Ext/AbIhKfDReKOo6DqMIIUSj
 +pKBn9sRVx97oyCmiEwsGzM8N7G4Nrj88kreS0crZAw5EoEjVMNh6SvBM5ybvvjqENyA
 SWYBR5vKDuiAEocnUGp4s0m8VDOthLzrh2PFArsumB0poxbVFvjnnM2kn62wrA7fblkc
 DojeUeUHLSUOUtw8Nt1ulLFc9+oTqhkJdiRybNHx/bnEx1ezRhVJ3RphKjDmGbpj7QEI
 KEXZtjg+4MwMzgDi5lAywfG/Df0X4cR8Vb2MOu6h3ziRqaV7F4gFjUQ9ZjzW7rt1a5PU
 MVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679322923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LaQMXeUc8wT22E+dKorORjY6zURS3yxHQR6+u+nSGdQ=;
 b=DwOaHbThQOIRGCL8p7XNpB3T+wdC23sE3KcHvOTb5Xdn1YupHpvjhZRSN91FSYF+i3
 88MllbFu/8Z3bec6KZNw0m0geX4YFVOfA2sgm3/KQrV7I1yXWNvrq1OUohkrTUKzipTB
 BeeqvYBSCj9U8xOi2hL2GZr5MKx8BEafuDOWps21LPf4AdlGWAFiN6nFujizZUwRfG2n
 BCQDiJfhbB33X2hfd3oASzxE79hYXhzKpQ6VO08NHrytPsxSsD6ze3I/Rm4rV/XgXLPR
 z8KLb4REpys7U/LVHdAUMqCJiZ+AJY2c82131aMDCLBYdi/l8MzyIQ89RQ2KoXAKD+Mv
 35LA==
X-Gm-Message-State: AO0yUKVXBjhe24ANj2YFI9c1i8LWJBangCql05BEfJfXTSKkWac9+ip5
 JPLXWwaNAKz2Th52LrHaMQzfUvCgRc5Gc8eJpI454w==
X-Google-Smtp-Source: AK7set/DfSRAAiJ3d8DPpSWSlTsjUFfkUMpmxkprU2eDUdfWRHpyXWtTn7fPUNOnqroi0Wz7jjuFeg==
X-Received: by 2002:a05:600c:204d:b0:3ee:95c:b73e with SMTP id
 p13-20020a05600c204d00b003ee095cb73emr1688979wmg.24.1679322923496; 
 Mon, 20 Mar 2023 07:35:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003e9ded91c27sm17106697wms.4.2023.03.20.07.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:35:23 -0700 (PDT)
Message-ID: <f8d88acd-e485-6c12-8d4f-43650c3ebd0c@linaro.org>
Date: Mon, 20 Mar 2023 15:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] ui: return the default console cursor when con ==
 NULL
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: berrange@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Konetzka <hk@zapateado.de>
References: <20230319111017.1319880-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230319111017.1319880-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 19/3/23 12:10, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> VNC code relies on con==NULL to mean the default console.
> 

Reported-by: Helge Konetzka <hk@zapateado.de>

> Fixes:
> https://gitlab.com/qemu-project/qemu/-/issues/1548

TIL this multi-lines pattern works!

"You can use the closing patterns in multi-line commit
  messages or one-liners"
https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern

> Fixes: commit 385ac97f8 ("ui: keep current cursor with QemuConsole")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/ui/console.c b/ui/console.c
> index f3783021e5..6e8a3cdc62 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -2303,6 +2303,9 @@ QemuConsole *qemu_console_lookup_unused(void)
>   
>   QEMUCursor *qemu_console_get_cursor(QemuConsole *con)
>   {
> +    if (con == NULL) {
> +        con = active_console;
> +    }
>       return con->cursor;
>   }
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


