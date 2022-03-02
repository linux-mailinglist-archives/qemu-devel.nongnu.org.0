Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FFE4CA236
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:32:26 +0100 (CET)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMHR-00089y-8R
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:32:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nPMFa-0007N2-1O
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nPMFW-0006DC-9O
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646217024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fh0ZcLsOYcGUkzRk/JqOJYc45KTk893TDg798j+neqQ=;
 b=VkJSOEoT1e16bididQvpaFrXe20YSmjCevz4DoE0Re2CCMteaxYB6g7B0ug9+darn9v15C
 iA26wqDl92PH3imqyWFNTksrOi+mjkmOZKQS6g5r4aeN0KtOdTkfLyEFfs0lijmmN5JmlF
 0OUeHpfujoQc7QKYq8Q2erExPtGDcTM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-nnh8XsITMgyeZFfsiHII8g-1; Wed, 02 Mar 2022 05:30:23 -0500
X-MC-Unique: nnh8XsITMgyeZFfsiHII8g-1
Received: by mail-yb1-f199.google.com with SMTP id
 z15-20020a25bb0f000000b00613388c7d99so1039667ybg.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fh0ZcLsOYcGUkzRk/JqOJYc45KTk893TDg798j+neqQ=;
 b=f+uCtHZf3++IiTsOrBW8wvZN1FntJK80H52BTQBYpkOmPTVY7Tffk982uigETP1eVS
 vZZCeplNeapHh1wEfnhBw4VvdgazksIacxj4r+U67wqfxX+NPmPcd73+OszE3laRodYI
 oYJHmjyB8TRUC/wRZBWq5Ypu08IB17vVlEIb03ZIsHD8GmE0xwNQUlP/Wh2CA1miYjK7
 kcTcMP1w2v2PbmiEhy8gmXk/v8b5q32HfPYCvGotSCsCoiaM4I0pGh2WAEIV2oHk/p/V
 2vRL42EzMAKIA2V7J9H0OjwAfxwt+MqgbndN3xjWvdrcRuXbTyuiYAHxPUfvJsCecYgj
 E+Qg==
X-Gm-Message-State: AOAM530CRcG16dJxmFoIW/nsQXS3sSEVCPO3mNSKrOBbodQ16QJGahvb
 ePdylA0K6yYo4evHd9Paq93P1lp+RSsjXxW5rzRBeqOLlUcFsqo2keItoB9HAtK9AfxWo+uXHqG
 bWGL/4pR/iCdo8xKFP7qBFIRjOCxJ0Gs=
X-Received: by 2002:a25:a28d:0:b0:623:fa1b:3eb7 with SMTP id
 c13-20020a25a28d000000b00623fa1b3eb7mr28581540ybi.387.1646217023235; 
 Wed, 02 Mar 2022 02:30:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmH31drHHlKMWYyWzxP6x43IhjJiAGfHN/U7Coff6/0DlUelT5b6l/MrCsYwk/ZBV//w1NKKSMF0HWfcEn+VM=
X-Received: by 2002:a25:a28d:0:b0:623:fa1b:3eb7 with SMTP id
 c13-20020a25a28d000000b00623fa1b3eb7mr28581527ybi.387.1646217023078; Wed, 02
 Mar 2022 02:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-8-frankja@linux.ibm.com>
In-Reply-To: <20220301142213.28568-8-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 2 Mar 2022 14:30:12 +0400
Message-ID: <CAMxuvazk2MYoXj1Gku3F5sepwUVuo-Q6Ts8sYkrQHtJ0jnytjQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] dump: Consolidate elf note function
To: Janosch Frank <frankja@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Mar 1, 2022 at 6:22 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> Just like with the other write functions let's move the 32/64 bit elf
> handling to a function to improve readability.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 78654b9c27..9ba0392e00 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -507,6 +507,21 @@ static void write_elf_loads(DumpState *s, Error **errp)
>      }
>  }
>
> +static void write_elf_notes(DumpState *s, Error **errp)
> +{
> +    Error *local_err = NULL;
> +
> +    if (dump_is_64bit(s)) {
> +        write_elf64_notes(fd_write_vmcore, s, &local_err);
> +    } else {
> +        write_elf32_notes(fd_write_vmcore, s, &local_err);
> +    }
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }

Please use "modern"-style ERRP_GUARD(), and indicate failure with a
bool (see include/qapi/error.h)

(perhaps this should be preliminary to this series)

> +}
> +
>  /* write elf header, PT_NOTE and elf note to vmcore. */
>  static void dump_begin(DumpState *s, Error **errp)
>  {
> @@ -570,13 +585,8 @@ static void dump_begin(DumpState *s, Error **errp)
>          }
>      }
>
> -    if (dump_is_64bit(s)) {
> -        /* write notes to vmcore */
> -        write_elf64_notes(fd_write_vmcore, s, &local_err);
> -    } else {
> -        /* write notes to vmcore */
> -        write_elf32_notes(fd_write_vmcore, s, &local_err);
> -    }
> +    /* write notes to vmcore */
> +    write_elf_notes(s, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> --
> 2.32.0
>


