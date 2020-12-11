Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7572D7C92
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:16:07 +0100 (CET)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm1W-0001NG-5P
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlkk-0004uT-7h
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:58:50 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlkh-0006LY-KJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:58:46 -0500
Received: by mail-ot1-x342.google.com with SMTP id j12so8802844ota.7
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jsNa19loBhdZpz8/rpo0O1gXrJJ8Rpkwg0rgZwMd/FA=;
 b=jzutyDDHJWdn+cQm/o03qKBJl3ojt7exNe5OBt/Z+iLVjADxUrmNlZgFklw0axaQWC
 w60/1ivDT6VxfKaRHEpAWeVg/nQfFiKJHR9ycUxlHoihnWm4IC2yjfGT0rTI01v6QgKP
 F24WwW1R8bFU5IIjRu0bC9r3EG5Bsi0VFtZiZ5+EqIpZ8oUCl2pIiUUfWrTQgrzktrrm
 RcYrdNVIjbSJFjiHspDAGgfvsLZt3ujyLkv+a6D3R/qZ3WyRYkflt/z+Gv73smL6aYKs
 Sf/xavV/zhXjzDKekv7WigU6rhgJf6aU1XANOVNyNptAzAEL5XY6+GJVWVvBJm/4rdF+
 Cvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jsNa19loBhdZpz8/rpo0O1gXrJJ8Rpkwg0rgZwMd/FA=;
 b=oE13zyxoBeNT7YSh0ekBtgpG31KrBSIDNgSdEAUCS85JIRJn1Qn3ABNu2c9y7ZuEX+
 SuQqq9vsVGOwgac0tG/K9k8Nlc7zPBCyrjCJuEBDxHIsDqnc5t4fuCkVZTNrsF6prsHR
 7QLhPYmaRdjTjC9AGDsb/yuR5Y2nc2ODuw7xr/lnuTwURXXhhUGX5H63VufnowtC497v
 VZG0XzUX/5ZIK2PN/c9Z83RpJMxNSaGVx/6NU5jGOkpt7Vjs4E58KThxgXqP+Z9v/KYi
 WeHIiwKpVJbXc+E84ESKz06Jlnfl/TBc1bYLWt1Qfeg1+GFjcpbcLB4lc7eitw/jFcXm
 RYag==
X-Gm-Message-State: AOAM530Xuqtll4KxDurza1skiR1z3VH5OpYXNzlfsaXAhfNTlusP4ATb
 Gjf+xRVmEMsPKs3T+PZgpjmmrA==
X-Google-Smtp-Source: ABdhPJwzg1cHY46g00FEZ4ikUkmf6iESnFVlA6zBBTDdkStIK341FUnyC8jWOCS87JCeLoVOZLsibQ==
X-Received: by 2002:a9d:46f:: with SMTP id 102mr10704656otc.293.1607705922619; 
 Fri, 11 Dec 2020 08:58:42 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t19sm2050306otp.36.2020.12.11.08.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:58:42 -0800 (PST)
Subject: Re: [PATCH v11 17/25] accel/tcg: split TCG-only code from
 cpu_exec_realizefn
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-18-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25fb69c8-7034-3ca4-8dbd-58a73731425e@linaro.org>
Date: Fri, 11 Dec 2020 10:58:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-18-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> move away TCG-only code, make it compile only on TCG.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h |  8 +++++
>  accel/tcg/cpu-exec.c  | 28 +++++++++++++++++
>  cpu.c                 | 70 ++++++++++++++++++++-----------------------
>  hw/core/cpu.c         |  6 +++-
>  4 files changed, 74 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

