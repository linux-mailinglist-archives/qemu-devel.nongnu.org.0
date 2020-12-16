Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D152DC70B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:26:34 +0100 (CET)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcRV-0000Xp-Bx
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcJc-00039l-06
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:18:25 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:43998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcJV-0000AT-T0
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:18:23 -0500
Received: by mail-ot1-x32f.google.com with SMTP id q25so24175233otn.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F3P7P/F2p49IJHZA6SFjg6HBfqLxpU6ZeKZd87ZgVSQ=;
 b=SMVcAhJ+NKKOk8yKNHDkm/5b3qm7OHJCEUahAvVv+dlscm7Ul3Xa303VJ+9fBnvKXc
 wYRe27gMkRmtYqUlfAhuFZJNyodwRH73zODZ9DfKDlSHVZglxpPut4leR0x09JwA85cO
 q5JjgaWeDN5sOOFrHc1Wzf6yvfKODaRUUCP/Y5+XFqTCY/sXlW8p4dKPji0UIvzBw0qc
 al1uV8KXp6B058h2ujXrs1HWsY23wz8MkzZCg0chsKQNCaSjBFqr1a/ezkyz4C28yFYi
 ZeKXrx0BxmQ713hbiSa05oIFZus2ZrRlPx/uiMzMKUCSELYfsDTgidBZ0tvj5fG/nAB5
 UY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F3P7P/F2p49IJHZA6SFjg6HBfqLxpU6ZeKZd87ZgVSQ=;
 b=ELmGzFnxjuy6aeVpospkpq1EYOaUlUHRVxe+dpt8hv33HWrjF0zPJm1rcl2Wv7+d7O
 8YBNXck19u9HAVx/uQI4NPe1C2+EgXbVmBty4i58Hivioi9278e/V7fR86Az3GxuZ1uT
 g7ZAjrWsjx0BZqK8mRPqSVxkTNvITFCqHf+x3kP4/+K3stFeXp/UJpYu6ZZbbj6PrQY/
 RFM/R5lkXEe9RbYrrYqV+swsiRISpWDQjmBPuFsYsVR85Im5NBT0NOXiIHq6x4YoPAtZ
 RDEgs67PU7YFUCuXWx7pJtb9Dj5MrZZmnYvlAnPH5jk7KvSbAlLFo2QK52t/8TOUD3F7
 piGg==
X-Gm-Message-State: AOAM533gogxzEmSE7rK+QSkUrkb5jY3mcPMsGRNnpZKgqagPo2YgGjiV
 oAnL3vz9WKOvUqzhKZ4BsBrPNg==
X-Google-Smtp-Source: ABdhPJzhmMLT4JXjND0IiVAhQKwIs2sYFCT8M+/VogbDdiM07AjtLKqF8ZJU5luYwEiK1BKf41ubSg==
X-Received: by 2002:a9d:614f:: with SMTP id c15mr27065244otk.362.1608146296577; 
 Wed, 16 Dec 2020 11:18:16 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x72sm605111oia.16.2020.12.16.11.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:18:15 -0800 (PST)
Subject: Re: [PATCH v12 16/23] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201212155530.23098-1-cfontana@suse.de>
 <20201212155530.23098-17-cfontana@suse.de>
 <20201214191029.GO1289986@habkost.net>
 <e72e2d6b-ef99-5590-fe18-9cb6d4092e23@redhat.com>
 <53e65297-3226-4432-9dfe-e0750333463b@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f101984-9654-355a-afc1-39aa924484b4@linaro.org>
Date: Wed, 16 Dec 2020 13:18:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <53e65297-3226-4432-9dfe-e0750333463b@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Emilio G . Cota" <cota@braap.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 2:44 AM, Claudio Fontana wrote:
> Richard, From the answer of Philippe and Eduardo I think they are not ok with .h.inc,
> I think the option of just putting everything in cpu.h was ok with you,
> should I go with that?

Yes, that would be fine with me.

r~

