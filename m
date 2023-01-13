Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E10566A5A7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSAx-00086H-Ho; Fri, 13 Jan 2023 17:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSAt-00083n-C1
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:05:24 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSAr-0003Xc-Ls
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:05:23 -0500
Received: by mail-pg1-x529.google.com with SMTP id h192so15884352pgc.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CPatGZdqtcKWZEzUuU2RAvA5NjsjbyNrc9rK1pyXCQ0=;
 b=Hnohg1flgaLoOuo3Xc7snE5g8On9ybXYzngyFt4M1shQ9iT3RI0Hi3kzUWN/wvk5H4
 2FgVkU4QCGez/F9UVDKPC7k+1wqG1XDfatVkCXS1l3bLuikUCRo7r2djbMIgLdpm5I86
 JpOjh22PKO+HnZpxKg63qfSEHoCA+5K7lmBEBn7mu7prd8wUVnZ0cR5519JOoWla28SY
 fhaFsVtG8JMp+0KmKck/BRldJlAYMon6fp1Wahn71cZz5rKFzHlmKuV8ynP2NK9Lal6/
 YD7b7QzpEeNe92lT7rJgDMWbzFlAWVvUHQGknZobtIqEURMdJRhUljzToQtBMF8xvzyZ
 OJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CPatGZdqtcKWZEzUuU2RAvA5NjsjbyNrc9rK1pyXCQ0=;
 b=Zodq1At98epDc8Ceb5zlr339GemCg8/kOQdVev0c8t0lm27uryU0mzGK2a2Gkglx/j
 ukHgSrwPgLqXbPbsyXMZQBuex3EdRuhD13QZUWzbNkRf/xerCsQoSN1K2DRfAeSJ1fDl
 69XkpkPWfRvIrNfYNt1OjjsWpeYHAqdBsHUT7Q/AIjD2iQ7M4wzZScFGHAq4ODcduj82
 o4n+rL9crrOQfcYqIk+y1fsXXn/TOY8cNE+hdCUpwNRhBdx2FWS/B7RkQ6JvAF5CMywS
 THnzAjewAWTel7YMyg5muRg/yrEmHiX8JF3kcj9dqWfm5xfkL6WvAHpYiQcJkyq0D53f
 +WIQ==
X-Gm-Message-State: AFqh2kqFr78IMTS4psvGENKK2BDg7W41qZ/hmxKltJ1t4HYb2QnD6Rb7
 qD7Dvt8mL9DFLlxtTN4beSiVtw==
X-Google-Smtp-Source: AMrXdXvbFwDrOuvySoaGSKg9mYSk1KBeOrdHjoILX3ItHTzKkuA6tnlneyFjj0+bzzfpj6UnKGNTXw==
X-Received: by 2002:aa7:9732:0:b0:580:d722:10e7 with SMTP id
 k18-20020aa79732000000b00580d72210e7mr75512301pfg.24.1673647516902; 
 Fri, 13 Jan 2023 14:05:16 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f13-20020aa7968d000000b0056b4c5dde61sm2180303pfk.98.2023.01.13.14.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:05:16 -0800 (PST)
Message-ID: <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
Date: Fri, 13 Jan 2023 12:05:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-21-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/13/23 06:04, Fabiano Rosas wrote:
> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> cortex-a57 as default cpu for KVM.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>

Ideally there would not be a default at all, requiring the command-line option to be used.

Second choice would be "host", since that's the only value that's actually usable (except 
for the off-chance that you're actually running on an a57, which is less and less likely 
as time moves on).


r~


