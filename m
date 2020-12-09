Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6775A2D3EB9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:29:51 +0100 (CET)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvnB-0004QA-P6
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmvlW-0003Z0-A4
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmvlU-0008WK-IO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607506083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3deeJvgk4j2Lc+PrCLvpbRFVo+9LD0xt399op6fc5eY=;
 b=eVzKwVp9G6rzF3VojXgbywNeYqdy/LSgF/p9eit+/YZVaHiv+haXR75pSTBtNKwzpIN75d
 NLzDXF8Ndh4ylf3S+dhzL55hMkzvh3TmjedFfDkAbWf1jd3tnhbbmfis/b/WKZwPvK066i
 t7QBFT91BT7mbItO3PFbmmyZkaHkEHE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-ATLX_HO1PhG15LKfEcnNZg-1; Wed, 09 Dec 2020 04:28:02 -0500
X-MC-Unique: ATLX_HO1PhG15LKfEcnNZg-1
Received: by mail-wr1-f70.google.com with SMTP id i4so419345wrm.21
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:28:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3deeJvgk4j2Lc+PrCLvpbRFVo+9LD0xt399op6fc5eY=;
 b=mRynN9tZa/YjcFH+8RP3Kh01z5EcwEmPCAsqQPbbszvffC+t9xpbEcMzNQ6vPx3dzE
 ttBwGdc481np8To0nshfPQ3YWSBQp+TfKiWS0qo6prueJgJpVTb5NS3pEKUKEl/i7gcK
 yJBgwFmdWPRPYqqYQhCo03VHN3G8WoTqsqnMdbbM10/S3/mHc7tO+bFFzed36vc2Vs8X
 bkAwQaLeKCOYt8KJ4FqQLlU9s8dYaeLRC48YKZNDcNdvF9+44pzz82KOGEpeLo0c6r0l
 bIkHY2Lby3jdVU07d/keIZKsNu+NUVvn7uqFPQJ5izpgnAkqukZ74JDpxm/9S4zR5eQr
 vUnA==
X-Gm-Message-State: AOAM533ZhmPXteqHxntKSTXyR9Vt0N+pot1xr0P3DkrAR81AlDLV9VGg
 2qoQoS1hu2hnQV3a4+IjP5kW2HIXbgcnvD6lX2eB21JDco/oL2rHD9hWOWdkIlIKhiUbFEXyVV4
 1apoOWQ5FVdPhonY=
X-Received: by 2002:a5d:6386:: with SMTP id p6mr1600192wru.261.1607506079802; 
 Wed, 09 Dec 2020 01:27:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW4e0d0nMQZLF+SQLe2HVZ6rBfZk/etFJNdq70wx5XuaLlPoHsJFr85OMQ7/pJ3vbd3owqWw==
X-Received: by 2002:a5d:6386:: with SMTP id p6mr1600161wru.261.1607506079624; 
 Wed, 09 Dec 2020 01:27:59 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a13sm2172325wrt.96.2020.12.09.01.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 01:27:59 -0800 (PST)
Subject: Re: [RFC v9 18/32] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-19-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d027f556-9588-ece3-8f45-50f1afc2e096@redhat.com>
Date: Wed, 9 Dec 2020 10:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208194839.31305-19-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 8:48 PM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> [claudio: wrapped in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
...
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 4475ef0996..109291ac52 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -10,9 +10,6 @@
>  #ifndef TCG_CPU_OPS_H
>  #define TCG_CPU_OPS_H

Missing for TranslationBlock:

  #include "hw/core/cpu.h"

>  
> -/**
> - * struct TcgCpuOperations: TCG operations specific to a CPU class
> - */

Why remove the comment?

>  typedef struct TcgCpuOperations {
>      /**
>       * @initialize: Initalize TCG state
> @@ -20,6 +17,17 @@ typedef struct TcgCpuOperations {
>       * Called when the first CPU is realized.
>       */
>      void (*initialize)(void);
> +    /**
> +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
> +     *
> +     * This is called when we abandon execution of a TB before
> +     * starting it, and must set all parts of the CPU state which
> +     * the previous TB in the chain may not have updated. This
> +     * will need to do more. If this hook is not implemented then
> +     * the default is to call
> +     * @set_pc(tb->pc).
> +     */
> +    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>  } TcgCpuOperations;
...


