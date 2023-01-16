Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BC866CD8D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTPm-00039D-13; Mon, 16 Jan 2023 12:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTPW-00031l-Tt
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:36:43 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTPV-0005LX-9S
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:36:42 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so6414115wmc.1
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bD7l37oK++lsMkj5yK+mKwb3BBZr/apsB8a4POA4Ufo=;
 b=dFXz2s7TwWRrhTZTzmTGOnVfO0e6+SCxrqfamXT6L9978vkM42W56E235eUjncZgi3
 aXfp6W0YQP76E+5NRa9quwmXhoPub2hHGXgrPsMBdN407kCOLkZV0b81Vt9BA6RZyQ02
 jAdmJR+8LYxGVZkFJD+HDHl9pT5+F/R/TjFPPEpydYLcW2YmNYL4lIgI+2JvrYAlCYoB
 xtDqD6Uq2MqxArfCN+TGoww11VDjiWX7s+JuHu8FY9t9SvwdUa6X3yOcxvnxjteX/D4c
 UM1I4vaFHKifou8hCaxj6cFKJJuz8+B0dJbJB1hOnbmTxD6m/GMK4DnrMmhqA413b9cO
 tmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bD7l37oK++lsMkj5yK+mKwb3BBZr/apsB8a4POA4Ufo=;
 b=y7LKZXH7lC7vQ9kf/zKcOwegwH4X+WJOZgPBKC70jD7ypG0aAaWVYnKxvTrJuqtMM7
 rFx1xUzhlSlQLp8uvJCXGmIASqOv7smsOAn3JEbLfcTIhVjsH//fXzjCijCsiJ02bwZE
 OtXQYI4PaBq1SPyPU64a7pspn80SE1jnhUI3P+hQ4IJpKXqJqbUulYqSN+hmA8ubVp6Y
 KqHMObS75A5MuifSLRGA9Ne8BOyjWxSBcsSdPri5cKZcn8nTVS2B8eyKbUrcfB5HzVWN
 7vOszX0gZ6sNJI35afKURINNn9t/lo1pg+Enx64gp4Ys4NPDDsXEPbe8ZE28SFfrJLBM
 +PyA==
X-Gm-Message-State: AFqh2koRL81apjIsao3MMpr8/kNB61mesyRon+K12/+ssvEoE8zTPkz2
 7Fh9dOe6qKB6j9q9FZpKrj0=
X-Google-Smtp-Source: AMrXdXu1SfJbMeT4b1Ie4TlBUmwspLTLiu/fPu+Pn6uknvremZ1hhL+nBHnuz54EXfSeYCGBXSb6Zg==
X-Received: by 2002:a05:600c:3b0f:b0:3d9:da3a:ef9b with SMTP id
 m15-20020a05600c3b0f00b003d9da3aef9bmr244827wms.31.1673890598096; 
 Mon, 16 Jan 2023 09:36:38 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a1c770f000000b003da286f8332sm8986996wmi.18.2023.01.16.09.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:36:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9aa5f805-e4db-ffa2-d476-276870c933b0@xen.org>
Date: Mon, 16 Jan 2023 17:36:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 17/51] i386/xen: implement XENMEM_add_to_physmap_batch
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-18-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-18-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>

