Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E016E5BA2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:09:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogO7-0003eP-Ei; Tue, 18 Apr 2023 04:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogO5-0003eF-4g
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:08:29 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogO3-0003JM-JS
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:08:28 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-54fbb713301so205258457b3.11
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681805306; x=1684397306;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IBiozO4+1oaM53M2twtjbCkrneFV8uPkQRVuWlqJo+o=;
 b=Vt09ksF1mLCHJTfQeBeUiHXjDlX6j8PEPbiEY1YWzUZ20k6X5ccJONLELNJbpz79MF
 CsZZcHh59aqkE4iUcLhh/Gf7uOLkcqNBYgLxFaT/CBj5gcpQX5cCgpGf5CoDkrAx8uZc
 233yeRTfvBksG9qzDhgshi0/k3Y2mQCvq6bXFQRB34j/Mf0S8lqvM4s/rpQGB/4oxRCB
 4nH0SBf3oFsrcm/BTFucdIYrCJ+DDrM05naJcrddAQK3dTlkWrctu1QbVtV/LvBGzjmO
 murxPFsE8Q8i/YN4PmbbhMcxnZgLXytydtk4097gaGAjmPor4bquhO0Ywdwce/MllFFS
 43Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805306; x=1684397306;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IBiozO4+1oaM53M2twtjbCkrneFV8uPkQRVuWlqJo+o=;
 b=BiyYBprhhNJkP84w5bX/P5BNkgVqXijLI5vTsbEQyd7qK5NEJYbSrZJsNACTOL1JoM
 Jk5cMX/S5uACVBZ+8vLvk7ymYiyV5sBqnuDxaU2mFtQ8QioEDJH3Fr+YCBHOIUhLyUc2
 7jmVz+eRPv0o/yXeHWHvjOj3PSz5YyQpfaX6P3XV+eGddt9bOHpWU9QWaHPoaeQp79/j
 xEEH6UvwrX3I8GT4T2r/x3flOAjFTgB0tr3+GIEVvHcGg7RjNpb5gD3+y5KXeVfkCu8G
 ykSk4J52ySukIV7c+PkLFrZKtWGM+TjCqrIMin2EKkFSGaOF15ixs78mJJVM03lNhLpF
 /EoQ==
X-Gm-Message-State: AAQBX9eoVnkO3HUkyyMNgRgeYvrpR9w3dOwvkERZkTxH2TSFd/aE6+Cj
 lZmCifImty7qLVcs79kpaUwkBA==
X-Google-Smtp-Source: AKy350Y2koNR00+IKPXKsZ+GYjvbHXhmUzKTW92pgQbo8t+Ho3vnA9C9ylc35jGHwQojreD/OvEYWQ==
X-Received: by 2002:a0d:e205:0:b0:54f:ba16:eee with SMTP id
 l5-20020a0de205000000b0054fba160eeemr15724099ywe.32.1681805306647; 
 Tue, 18 Apr 2023 01:08:26 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 bf21-20020a05690c029500b0054f8a3624dbsm3610409ywb.145.2023.04.18.01.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:08:26 -0700 (PDT)
Message-ID: <f0695d77-537a-05b9-3f78-053ab8efd502@linaro.org>
Date: Tue, 18 Apr 2023 10:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417164041.684562-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/17/23 18:40, Peter Maydell wrote:
> The 'singlestep' member of StatusInfo has never done what the QMP
> documentation claims it does.  What it actually reports is whether
> TCG is working in "one guest instruction per translation block" mode.
> 
> We no longer need this field for the HMP 'info status' command, as
> we've moved that information to 'info jit'.  It seems unlikely that
> anybody is monitoring the state of this obscure TCG setting via QMP,
> especially since QMP provides no means for changing the setting.  So
> simply deprecate the field, without providing any replacement.
> 
> Until we do eventually delete the member, correct the misstatements
> in the QAPI documentation about it.
> 
> If we do find that there are users for this, then the most likely way
> we would provide replacement access to the information would be to
> put the accelerator QOM object at a well-known path such as
> /machine/accel, which could then be used with the existing qom-set
> and qom-get commands.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> For v3: because we're only deprecating the existing member,
> not trying to provide a replacement with a new name, we don't
> need to update the iotests that use the command. (We will when
> we eventually drop the deprecated member.)
> ---
>   docs/about/deprecated.rst | 14 ++++++++++++++
>   qapi/run-state.json       | 14 +++++++++++---
>   2 files changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

