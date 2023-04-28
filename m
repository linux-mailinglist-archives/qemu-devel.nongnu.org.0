Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6D6F1715
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:01:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMlI-0000fN-1K; Fri, 28 Apr 2023 07:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMlF-0000fA-Mn
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMlE-0000qT-6p
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682683175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Z6aBbm6d3kLanFyeVfsav1GASNbD+bkZdCWKrl6BX/Q=;
 b=GHawOCK9XQ6toMMsz55OkkHPJCIUx8Nj8nS+jFmnIjtNNzvUfHHA9A4HLp8/y0PG2nRvj/
 WKMKKZKrmZWo+o9UYhcAk/Gt+P6ZLbRGZwMYtjnCggnz6NYNkkqVkXlgYoAVyWlkwjTqhM
 uaiBxhP9bQLagFmf17e+gQvaTUGmtto=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-5jBaE_tlPAyYo6_KacnWPw-1; Fri, 28 Apr 2023 07:59:34 -0400
X-MC-Unique: 5jBaE_tlPAyYo6_KacnWPw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f175a24fd1so57137795e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 04:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682683173; x=1685275173;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z6aBbm6d3kLanFyeVfsav1GASNbD+bkZdCWKrl6BX/Q=;
 b=TlNe6AUg95QJDM2TNDgxKO28lSfYOuHXLhb1a30yYdPuoSxeVn6ypv+mDfK9RhYdgp
 kSvnbG05snR9gtXpZ/5BcSB3LJBeo19KUsSeGz4rdLikkjhGiEyGqUgooCXVQhS8A3lG
 PSEl68delxu8lH/lYK5+xnDHF46/4gfa2a3gIrvSRhX0yx/8jFkulkTjexWrZXwCyf9k
 dboyIKFHdiTt9bgZSUbcV4wnlZyuN1obBmlX6ZpFt6slbrvzQb6uQdoWpYhkF+cRAtwy
 cZAiUvxoWlWwB/FCMTtMDZhHd1U4Wi+apu0QW151yu/RaEWSGHz4PqGtsMPyZDvt2Xo0
 ke0w==
X-Gm-Message-State: AC+VfDzRAffhfSaLsnTpfl/CZIdzJd8/fLT1GV/urin0Lg5alar7fFsZ
 IfGdM+uUVfKh45MsdnFXpJNqnf2UkKNvgznw2lOmj2sj9QxuCUTZcrLUMROhlFthWAqSuROMNsC
 8KQmVw2gT5ZXxffE=
X-Received: by 2002:a05:600c:b49:b0:3f1:8c59:4713 with SMTP id
 k9-20020a05600c0b4900b003f18c594713mr3814217wmr.12.1682683172913; 
 Fri, 28 Apr 2023 04:59:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hqno/j47LAcdnteMOPfvInmgTTJl8v1mApoSQL32D8uon5v4YhfLKCuk9TfC5WA+yek0A/Q==
X-Received: by 2002:a05:600c:b49:b0:3f1:8c59:4713 with SMTP id
 k9-20020a05600c0b4900b003f18c594713mr3814204wmr.12.1682683172581; 
 Fri, 28 Apr 2023 04:59:32 -0700 (PDT)
Received: from redhat.com ([89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c3ac300b003f19b3d89e9sm17891674wms.33.2023.04.28.04.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 04:59:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 04/13] ram.c: Reset result after sending queued data
In-Reply-To: <01e40e659d664ec12470fb6495f00f1ee78d5cb3.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:03 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <01e40e659d664ec12470fb6495f00f1ee78d5cb3.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 13:59:28 +0200
Message-ID: <87sfckb4kf.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> And take the param->mutex lock for the whole section to ensure
> thread-safety.
> Now, it is explicitly clear if there is no queued data to send.
> Before, this was handled by param->file stream being empty and thus
> qemu_put_qemu_file() not sending anything.
>
> This will be used in the next commits to move save_page_header()
> out of compress code.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

If you do more changes around here, please consider:

> @@ -1540,13 +1547,16 @@ static void flush_compressed_data(RAMState *rs)
>      for (idx = 0; idx < thread_count; idx++) {

Move

CompressParam *param = &comp_param[idx];

to here, and use it also for the locks.
I will even think about calling the variable just p.

And once there, everything under the sun except this uses i as a for
variable, not idx O:-)

>          qemu_mutex_lock(&comp_param[idx].mutex);
>          if (!comp_param[idx].quit) {
> -            len = qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].file);
> +            CompressParam *param = &comp_param[idx];

Move this declaration

> +            len = qemu_put_qemu_file(ms->to_dst_file, param->file);
> +            compress_reset_result(param);
> +
>              /*
>               * it's safe to fetch zero_page without holding comp_done_lock
>               * as there is no further request submitted to the thread,
>               * i.e, the thread should be waiting for a request at this point.
>               */
> -            update_compress_thread_counts(&comp_param[idx], len);
> +            update_compress_thread_counts(param, len);
>          }
>          qemu_mutex_unlock(&comp_param[idx].mutex);
>      }
> @@ -1571,15 +1581,17 @@ static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
>  retry:
>      for (idx = 0; idx < thread_count; idx++) {
>          if (comp_param[idx].done) {
> -            comp_param[idx].done = false;


Same here.


