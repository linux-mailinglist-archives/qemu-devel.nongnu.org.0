Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9137532498D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 04:38:52 +0100 (CET)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF7UJ-0007QP-L4
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 22:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7Ss-0006wt-PE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:37:23 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7Sn-0007v9-SA
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:37:22 -0500
Received: by mail-pj1-x1032.google.com with SMTP id l18so2715378pji.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 19:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E5eO1/NcK8gCImFAFeQRrWDoFCgxyOSSxZuP1xb/zdE=;
 b=JrFttAWtjpkuQoRc32ui4UrB9JNoFu+fWku85R7oNcAOdMgT1UK3168IO6xZgwWoOl
 D8vWeksig4jnKux5hyfB+2fgqRBYnqQD2qXOBmBo0t1rAImgMeOYiD2tXdBbmCc92D3e
 lJZ0Czj5fc5wFqPiVIdfwHEkntHoeDzcN0ht3ZanM8jTuRKX7Z0L0kzLE4RTzNZU0mB/
 j7gUJxsE+bSYa+2eN62Q/4ZFNZk8aB1ySESDXygxBlAlzwk9Hr1DbzC2AY3bbOH+vvYE
 R2JaBGGX+fI6xxaSVYFb4FMbyFoIiVmjN2JdInZsM2+/1tT5RIhIvtoCf4JuRGzQ2HwU
 ypTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E5eO1/NcK8gCImFAFeQRrWDoFCgxyOSSxZuP1xb/zdE=;
 b=gBfeG0/d5K1YnDBf5QTorbFSpg0CIy+odKxWS72N2fpnNiknsleNLUYbx1mt6ZxLzv
 tcjhs1WYU177CgYZdASOC46IjiwQ2u9843/5skkvF/UaSFpSe24e8tqHDCmPoJEkuEQ5
 PQ1WMdTBy4BBe11le3fr5NlrvqltWTCqesLPOcGrlX0lFA2+0YaCm/cviys8at9WXBoa
 sVbR3OQNpBofc7R7o8ttlwpH5ztYsxzUhbp4bq/FFMEM/RIyS0bqWcytZ0C9ep9zeThZ
 G2B6bQNv10Imn8YYfos7Kw+/EH+5ZjGNDsxW9LeAAGcunRqKQn00bqNWKVS1kmNFbf9p
 SkvA==
X-Gm-Message-State: AOAM530PXvrU8tapL0yQRKnKnEZt97yWmRT6MBtXLr7VXEWPKBuEBYVS
 /gFpPLC6sguDMmA8/7hzUl1wtNajYvAe6Q==
X-Google-Smtp-Source: ABdhPJxhq2hzudSwucvkH06mwUVJZxljT2yLXXnPRrvr0dynX+dw7zllIafcltEYYRmMYpvMtIHVrQ==
X-Received: by 2002:a17:90a:4cc6:: with SMTP id
 k64mr1193886pjh.162.1614224236297; 
 Wed, 24 Feb 2021 19:37:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r68sm4455821pfc.49.2021.02.24.19.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 19:37:15 -0800 (PST)
Subject: Re: [PATCH v22 13/17] i386: split svm_helper into sysemu and
 stub-only user
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-14-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33d4043e-23ea-8489-fb37-e822f8261dcf@linaro.org>
Date: Wed, 24 Feb 2021 19:37:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-14-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> For now we just copy over the previous user stubs, but really,
> 
> everything that requires s->cpl == 0 should be impossible
> to trigger from user-mode emulation.
> 
> Later on we should add a check that asserts this easily f.e.:
> 
> static bool check_cpl0(DisasContext *s)
> {
>      int cpl = s->cpl;
>  #ifdef CONFIG_USER_ONLY
>      assert(cpl == 3);
>  #endif
>      if (cpl != 0) {
>          gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
>          return false;
>      }
>      return true;
> }

Hmm, more or less exactly what I was suggesting vs patch 11, with the
improvement to consolidate the generation of the exception.

Is it worth doing this now rather than later, so that we don't have to have the
stubs, and so don't have to add the new file?

If you were adding the stubs new, rather than moving them, I'd say add
g_assert_not_reached to them.  But the actual patch is fine.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

